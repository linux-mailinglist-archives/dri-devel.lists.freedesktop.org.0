Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 31A5D185F0
	for <lists+dri-devel@lfdr.de>; Thu,  9 May 2019 09:18:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 28CD389A5D;
	Thu,  9 May 2019 07:18:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-SN1-obe.outbound.protection.outlook.com
 (mail-eopbgr700047.outbound.protection.outlook.com [40.107.70.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CD43F8919A;
 Wed,  8 May 2019 11:30:44 +0000 (UTC)
Received: from BN6PR03CA0021.namprd03.prod.outlook.com (2603:10b6:404:23::31)
 by DM2PR03MB558.namprd03.prod.outlook.com (2a01:111:e400:241d::27)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.1856.12; Wed, 8 May
 2019 11:30:40 +0000
Received: from SN1NAM02FT023.eop-nam02.prod.protection.outlook.com
 (2a01:111:f400:7e44::201) by BN6PR03CA0021.outlook.office365.com
 (2603:10b6:404:23::31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.1878.20 via Frontend
 Transport; Wed, 8 May 2019 11:30:39 +0000
Received-SPF: Pass (protection.outlook.com: domain of analog.com designates
 137.71.25.55 as permitted sender) receiver=protection.outlook.com;
 client-ip=137.71.25.55; helo=nwd2mta1.analog.com;
Received: from nwd2mta1.analog.com (137.71.25.55) by
 SN1NAM02FT023.mail.protection.outlook.com (10.152.72.156) with Microsoft SMTP
 Server (version=TLS1_0, cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.20.1856.11
 via Frontend Transport; Wed, 8 May 2019 11:30:38 +0000
Received: from NWD2HUBCAS7.ad.analog.com (nwd2hubcas7.ad.analog.com
 [10.64.69.107])
 by nwd2mta1.analog.com (8.13.8/8.13.8) with ESMTP id x48BUbuE023873
 (version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=OK);
 Wed, 8 May 2019 04:30:37 -0700
Received: from saturn.analog.com (10.50.1.244) by NWD2HUBCAS7.ad.analog.com
 (10.64.69.107) with Microsoft SMTP Server id 14.3.408.0; Wed, 8 May 2019
 07:30:37 -0400
From: Alexandru Ardelean <alexandru.ardelean@analog.com>
To: <linuxppc-dev@lists.ozlabs.org>, <linux-kernel@vger.kernel.org>,
 <linux-ide@vger.kernel.org>, <linux-clk@vger.kernel.org>,
 <linux-rpi-kernel@lists.infradead.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-rockchip@lists.infradead.org>, 
 <linux-pm@vger.kernel.org>, <linux-gpio@vger.kernel.org>,
 <dri-devel@lists.freedesktop.org>, <intel-gfx@lists.freedesktop.org>,
 <linux-omap@vger.kernel.org>, <linux-mmc@vger.kernel.org>,
 <linux-wireless@vger.kernel.org>, <netdev@vger.kernel.org>,
 <linux-pci@vger.kernel.org>, <linux-tegra@vger.kernel.org>,
 <devel@driverdev.osuosl.org>, <linux-usb@vger.kernel.org>,
 <kvm@vger.kernel.org>, <linux-fbdev@vger.kernel.org>,
 <linux-mtd@lists.infradead.org>, <cgroups@vger.kernel.org>,
 <linux-mm@kvack.org>, <linux-security-module@vger.kernel.org>,
 <linux-integrity@vger.kernel.org>, <alsa-devel@alsa-project.org>
Subject: [PATCH 14/16] staging: gdm724x: use new match_string() helper/macro
Date: Wed, 8 May 2019 14:28:40 +0300
Message-ID: <20190508112842.11654-16-alexandru.ardelean@analog.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190508112842.11654-1-alexandru.ardelean@analog.com>
References: <20190508112842.11654-1-alexandru.ardelean@analog.com>
MIME-Version: 1.0
X-ADIRoutedOnPrem: True
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:137.71.25.55; IPV:NLI; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(1496009)(136003)(396003)(376002)(346002)(39860400002)(2980300002)(189003)(199004)(51416003)(7696005)(86362001)(16586007)(486006)(8936002)(476003)(126002)(2616005)(44832011)(53416004)(426003)(11346002)(446003)(2906002)(336012)(107886003)(110136005)(4326008)(316002)(106002)(7416002)(47776003)(36756003)(2201001)(76176011)(7636002)(305945005)(50226002)(54906003)(8676002)(246002)(2441003)(4744005)(478600001)(186003)(77096007)(26005)(6666004)(356004)(50466002)(48376002)(5660300002)(70206006)(70586007)(1076003)(921003)(2101003)(83996005)(1121003);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DM2PR03MB558; H:nwd2mta1.analog.com; FPR:;
 SPF:Pass; LANG:en; PTR:nwd2mail10.analog.com; MX:1; A:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 2ce9d3e2-55ad-41f5-b402-08d6d3a8990a
X-Microsoft-Antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600141)(711020)(4605104)(4709054)(2017052603328);
 SRVR:DM2PR03MB558; 
X-MS-TrafficTypeDiagnostic: DM2PR03MB558:
X-Microsoft-Antispam-PRVS: <DM2PR03MB558F9126D7D7828247866DFF9320@DM2PR03MB558.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1148;
X-Forefront-PRVS: 0031A0FFAF
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Message-Info: EVMADUNDHRaZyM70b9uaph59oQp+EuDL9gb4q2zI9AEdIWoTcnaNWUBe+9FxlQX2b0O7+4xknIyCoImhifcxNPmppoSR9Ju8BlK50RVal3XQVeh9l+A7s/7PGVZecREu2vX9qqBWISF2RTmLi8m3PEwYjEAyyjEX8vfRtxItEKrtpqEt8nOlt7fYyW49KHTABKF5js7qPbGcInT5wIoJWo41C0yk64vCRQXbGltzcSHsKdDUuQ9YfnMd+RoeSwokkISCJ2+H3HCcqX7T0oz1KORlekqmtcJeKwxjA3imNWlqT71dJwi19a46r8S7V/Nae2BSdjex5jOfLsOo066cOWXqmOwMyJTvIsJGUQfFBnqubKtsYZz5Vk6p09jm/MJubme4zc5q/ucRDNwmd5+XDCdCLSscieyA/YOMT+N4Apo=
X-OriginatorOrg: analog.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 May 2019 11:30:38.4867 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2ce9d3e2-55ad-41f5-b402-08d6d3a8990a
X-MS-Exchange-CrossTenant-Id: eaa689b4-8f87-40e0-9c6f-7228de4d754a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=eaa689b4-8f87-40e0-9c6f-7228de4d754a; Ip=[137.71.25.55];
 Helo=[nwd2mta1.analog.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM2PR03MB558
X-Mailman-Approved-At: Thu, 09 May 2019 07:18:00 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=analog.onmicrosoft.com; s=selector1-analog-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=onHX/dH28+rcBydCYnxXPPy3B5aZvm8nUVopYvgTR/U=;
 b=TRWzaKL5QJNYiXbG+2Oe8fjWtJL+uaSZN7I1Y1mLvIYHbJGfd+k3GEWsuHa6f8MH3o5FyiU8BEW81HV8R20GJd4CjUz2a3wrhgxNZAp7on9a1AKqAYFUNkner8pEKTAQX+E2T5W2P3Av5RpjeoV1wIG/TVCkFL8QTjk7xwoghyE=
X-Mailman-Original-Authentication-Results: spf=pass (sender IP is 137.71.25.55)
 smtp.mailfrom=analog.com; lists.freedesktop.org; dkim=none (message not
 signed) header.d=none;lists.freedesktop.org; dmarc=bestguesspass action=none
 header.from=analog.com;
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: Direct Rendering Infrastructure - Development
 <dri-devel.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Cc: gregkh@linuxfoundation.org,
 Alexandru Ardelean <alexandru.ardelean@analog.com>,
 andriy.shevchenko@linux.intel.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

VGhlIGBEUklWRVJfU1RSSU5HYCBhcnJheSBpcyBhIHN0YXRpYyBhcnJheSBvZiBzdHJpbmdzLgpV
c2luZyBtYXRjaF9zdHJpbmcoKSAod2hpY2ggY29tcHV0ZXMgdGhlIGFycmF5IHNpemUgdmlhIEFS
UkFZX1NJWkUoKSkKaXMgcG9zc2libGUuCgpUaGUgY2hhbmdlIGlzIG1vc3RseSBjb3NtZXRpYy4K
Tm8gZnVuY3Rpb25hbGl0eSBjaGFuZ2UuCgpTaWduZWQtb2ZmLWJ5OiBBbGV4YW5kcnUgQXJkZWxl
YW4gPGFsZXhhbmRydS5hcmRlbGVhbkBhbmFsb2cuY29tPgotLS0KIGRyaXZlcnMvc3RhZ2luZy9n
ZG03MjR4L2dkbV90dHkuYyB8IDMgKy0tCiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyks
IDIgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9zdGFnaW5nL2dkbTcyNHgvZ2Rt
X3R0eS5jIGIvZHJpdmVycy9zdGFnaW5nL2dkbTcyNHgvZ2RtX3R0eS5jCmluZGV4IDZlMTQ3YTMy
NDY1Mi4uODFkZDY3OTU1OTlmIDEwMDY0NAotLS0gYS9kcml2ZXJzL3N0YWdpbmcvZ2RtNzI0eC9n
ZG1fdHR5LmMKKysrIGIvZHJpdmVycy9zdGFnaW5nL2dkbTcyNHgvZ2RtX3R0eS5jCkBAIC01Niw4
ICs1Niw3IEBAIHN0YXRpYyBpbnQgZ2RtX3R0eV9pbnN0YWxsKHN0cnVjdCB0dHlfZHJpdmVyICpk
cml2ZXIsIHN0cnVjdCB0dHlfc3RydWN0ICp0dHkpCiAJc3RydWN0IGdkbSAqZ2RtID0gTlVMTDsK
IAlpbnQgcmV0OwogCi0JcmV0ID0gX19tYXRjaF9zdHJpbmcoRFJJVkVSX1NUUklORywgVFRZX01B
WF9DT1VOVCwKLQkJCSAgICAgdHR5LT5kcml2ZXItPmRyaXZlcl9uYW1lKTsKKwlyZXQgPSBtYXRj
aF9zdHJpbmcoRFJJVkVSX1NUUklORywgdHR5LT5kcml2ZXItPmRyaXZlcl9uYW1lKTsKIAlpZiAo
cmV0IDwgMCkKIAkJcmV0dXJuIC1FTk9ERVY7CiAKLS0gCjIuMTcuMQoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApk
cmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Au
b3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
