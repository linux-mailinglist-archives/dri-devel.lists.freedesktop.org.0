Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BA4E18600
	for <lists+dri-devel@lfdr.de>; Thu,  9 May 2019 09:19:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 666CA89AB7;
	Thu,  9 May 2019 07:18:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM03-BY2-obe.outbound.protection.outlook.com
 (mail-eopbgr780044.outbound.protection.outlook.com [40.107.78.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 32D29891CD;
 Wed,  8 May 2019 11:30:49 +0000 (UTC)
Received: from CY4PR03CA0098.namprd03.prod.outlook.com (2603:10b6:910:4d::39)
 by BN3PR03MB2259.namprd03.prod.outlook.com (2a01:111:e400:7bba::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.1856.12; Wed, 8 May
 2019 11:30:44 +0000
Received: from SN1NAM02FT012.eop-nam02.prod.protection.outlook.com
 (2a01:111:f400:7e44::207) by CY4PR03CA0098.outlook.office365.com
 (2603:10b6:910:4d::39) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.1878.20 via Frontend
 Transport; Wed, 8 May 2019 11:30:44 +0000
Received-SPF: Pass (protection.outlook.com: domain of analog.com designates
 137.71.25.55 as permitted sender) receiver=protection.outlook.com;
 client-ip=137.71.25.55; helo=nwd2mta1.analog.com;
Received: from nwd2mta1.analog.com (137.71.25.55) by
 SN1NAM02FT012.mail.protection.outlook.com (10.152.72.95) with Microsoft SMTP
 Server (version=TLS1_0, cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.20.1856.11
 via Frontend Transport; Wed, 8 May 2019 11:30:43 +0000
Received: from NWD2HUBCAS7.ad.analog.com (nwd2hubcas7.ad.analog.com
 [10.64.69.107])
 by nwd2mta1.analog.com (8.13.8/8.13.8) with ESMTP id x48BUgbC023898
 (version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=OK);
 Wed, 8 May 2019 04:30:42 -0700
Received: from saturn.analog.com (10.50.1.244) by NWD2HUBCAS7.ad.analog.com
 (10.64.69.107) with Microsoft SMTP Server id 14.3.408.0; Wed, 8 May 2019
 07:30:42 -0400
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
Subject: [PATCH 15/16] video: fbdev: pxafb: use new match_string() helper/macro
Date: Wed, 8 May 2019 14:28:41 +0300
Message-ID: <20190508112842.11654-17-alexandru.ardelean@analog.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190508112842.11654-1-alexandru.ardelean@analog.com>
References: <20190508112842.11654-1-alexandru.ardelean@analog.com>
MIME-Version: 1.0
X-ADIRoutedOnPrem: True
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:137.71.25.55; IPV:NLI; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(1496009)(136003)(396003)(346002)(376002)(39860400002)(2980300002)(199004)(189003)(50466002)(2906002)(426003)(478600001)(126002)(2441003)(2616005)(476003)(51416003)(26005)(8936002)(7696005)(48376002)(77096007)(186003)(50226002)(7416002)(246002)(47776003)(356004)(11346002)(36756003)(70586007)(70206006)(8676002)(446003)(336012)(16586007)(2201001)(76176011)(1076003)(86362001)(4326008)(107886003)(486006)(5660300002)(44832011)(106002)(305945005)(110136005)(316002)(54906003)(7636002)(53416004)(921003)(83996005)(2101003)(1121003);
 DIR:OUT; SFP:1101; SCL:1; SRVR:BN3PR03MB2259; H:nwd2mta1.analog.com; FPR:;
 SPF:Pass; LANG:en; PTR:nwd2mail10.analog.com; A:1; MX:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 19467b0d-82a0-4414-fd3d-08d6d3a89be6
X-Microsoft-Antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600141)(711020)(4605104)(4709054)(2017052603328);
 SRVR:BN3PR03MB2259; 
X-MS-TrafficTypeDiagnostic: BN3PR03MB2259:
X-Microsoft-Antispam-PRVS: <BN3PR03MB2259B45DC5D8696943CC04CAF9320@BN3PR03MB2259.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:120;
X-Forefront-PRVS: 0031A0FFAF
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Message-Info: ica2HYRZM4fdZtkxNTO9Gb+CKac0B/LUwaOW4nL6nYW79SYpz0JOGfZuZgqcdALu4tIifExiLGAs6sD77WVSTjIN3M+20mtkK8wI+pBL9/p1PoBSKfZAmfP2KGJVvCgSEHf32wy3PDodr1lg8Yuu8eqBBpgNfg053BOMOeCaI7HFr/B1OJTsQBX/ceRy48at5Iy5hIl80/NoESGq+ZAk5cvin1INqYY3Mb1qILEP4XIZVdGoHNJeTgIM/V0FqkN7/zCsxIYOu/80TBgJdrmS/t2+/MSfdRVyy3pcjddO6858KbsH4xUnc6kYGOjPaFpLAaL+RTif6KsJe22eNbSvhw8CkJVq6PtH4EXETBQCnvcVhQzisGb4TvfZgmQsWRjNXcqE9FtzT+5/kc2FZNz3c0T+2Bori5rG0j1zDojL+ig=
X-OriginatorOrg: analog.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 May 2019 11:30:43.2658 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 19467b0d-82a0-4414-fd3d-08d6d3a89be6
X-MS-Exchange-CrossTenant-Id: eaa689b4-8f87-40e0-9c6f-7228de4d754a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=eaa689b4-8f87-40e0-9c6f-7228de4d754a; Ip=[137.71.25.55];
 Helo=[nwd2mta1.analog.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN3PR03MB2259
X-Mailman-Approved-At: Thu, 09 May 2019 07:18:00 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=analog.onmicrosoft.com; s=selector1-analog-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1pGxpqtswe0uDTJtCA9b8Plg8X12C8ZZ/KC5tO0ZuVQ=;
 b=uLO3LXwdd1BWamWiK4r+Hw5jvJyCV00LM1cyhqNBKocozKsQvw+ovIXID7g91gMIvPgSp0VMC7EhKj6CA5gnlmoJcz4HY1qoPHGRgatiggRcisFhgTqP51Zl+L8WhLodnCQ/qLq5WxXaZ64lgglcD6lX1+C8qGWvddWXlxnm3bA=
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

VGhlIGBsY2RfdHlwZXNgIGFycmF5IGlzIGEgc3RhdGljIGFycmF5IG9mIHN0cmluZ3MuClVzaW5n
IG1hdGNoX3N0cmluZygpICh3aGljaCBjb21wdXRlcyB0aGUgYXJyYXkgc2l6ZSB2aWEgQVJSQVlf
U0laRSgpKQppcyBwb3NzaWJsZS4KClRoaXMgcmVkdWNlcyB0aGUgYXJyYXkgYnkgMSBlbGVtZW50
LCBzaW5jZSB0aGUgTlVMTCAoYXQgdGhlIGVuZCBvZiB0aGUKYXJyYXkpIGlzIG5vIGxvbmdlciBu
ZWVkZWQuCgpTaWduZWQtb2ZmLWJ5OiBBbGV4YW5kcnUgQXJkZWxlYW4gPGFsZXhhbmRydS5hcmRl
bGVhbkBhbmFsb2cuY29tPgotLS0KIGRyaXZlcnMvdmlkZW8vZmJkZXYvcHhhZmIuYyB8IDQgKyst
LQogMSBmaWxlIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkKCmRpZmYg
LS1naXQgYS9kcml2ZXJzL3ZpZGVvL2ZiZGV2L3B4YWZiLmMgYi9kcml2ZXJzL3ZpZGVvL2ZiZGV2
L3B4YWZiLmMKaW5kZXggMDAyNTc4MWU2ZTFlLi5lNjU3YTA0ZjViMWQgMTAwNjQ0Ci0tLSBhL2Ry
aXZlcnMvdmlkZW8vZmJkZXYvcHhhZmIuYworKysgYi9kcml2ZXJzL3ZpZGVvL2ZiZGV2L3B4YWZi
LmMKQEAgLTIxMTQsNyArMjExNCw3IEBAIHN0YXRpYyB2b2lkIHB4YWZiX2NoZWNrX29wdGlvbnMo
c3RydWN0IGRldmljZSAqZGV2LCBzdHJ1Y3QgcHhhZmJfbWFjaF9pbmZvICppbmYpCiAjaWYgZGVm
aW5lZChDT05GSUdfT0YpCiBzdGF0aWMgY29uc3QgY2hhciAqIGNvbnN0IGxjZF90eXBlc1tdID0g
ewogCSJ1bmtub3duIiwgIm1vbm8tc3RuIiwgIm1vbm8tZHN0biIsICJjb2xvci1zdG4iLCAiY29s
b3ItZHN0biIsCi0JImNvbG9yLXRmdCIsICJzbWFydC1wYW5lbCIsIE5VTEwKKwkiY29sb3ItdGZ0
IiwgInNtYXJ0LXBhbmVsIgogfTsKIAogc3RhdGljIGludCBvZl9nZXRfcHhhZmJfZGlzcGxheShz
dHJ1Y3QgZGV2aWNlICpkZXYsIHN0cnVjdCBkZXZpY2Vfbm9kZSAqZGlzcCwKQEAgLTIxMjksNyAr
MjEyOSw3IEBAIHN0YXRpYyBpbnQgb2ZfZ2V0X3B4YWZiX2Rpc3BsYXkoc3RydWN0IGRldmljZSAq
ZGV2LCBzdHJ1Y3QgZGV2aWNlX25vZGUgKmRpc3AsCiAJaWYgKHJldCkKIAkJcyA9ICJjb2xvci10
ZnQiOwogCi0JaSA9IF9fbWF0Y2hfc3RyaW5nKGxjZF90eXBlcywgLTEsIHMpOworCWkgPSBtYXRj
aF9zdHJpbmcobGNkX3R5cGVzLCBzKTsKIAlpZiAoaSA8IDApIHsKIAkJZGV2X2VycihkZXYsICJs
Y2QtdHlwZSAlcyBpcyB1bmtub3duXG4iLCBzKTsKIAkJcmV0dXJuIGk7Ci0tIAoyLjE3LjEKCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBt
YWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3Rz
LmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
