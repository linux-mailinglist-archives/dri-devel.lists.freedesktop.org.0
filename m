Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AB1C6185F4
	for <lists+dri-devel@lfdr.de>; Thu,  9 May 2019 09:18:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EFCAE899C4;
	Thu,  9 May 2019 07:18:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM05-BY2-obe.outbound.protection.outlook.com
 (mail-eopbgr710081.outbound.protection.outlook.com [40.107.71.81])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B1CDE891CD;
 Wed,  8 May 2019 11:30:50 +0000 (UTC)
Received: from CY1PR03CA0020.namprd03.prod.outlook.com (2603:10b6:600::30) by
 DM5PR03MB3131.namprd03.prod.outlook.com (2603:10b6:4:3c::28) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1878.20; Wed, 8 May 2019 11:30:48 +0000
Received: from BL2NAM02FT016.eop-nam02.prod.protection.outlook.com
 (2a01:111:f400:7e46::201) by CY1PR03CA0020.outlook.office365.com
 (2603:10b6:600::30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.1878.20 via Frontend
 Transport; Wed, 8 May 2019 11:30:48 +0000
Received-SPF: Pass (protection.outlook.com: domain of analog.com designates
 137.71.25.55 as permitted sender) receiver=protection.outlook.com;
 client-ip=137.71.25.55; helo=nwd2mta1.analog.com;
Received: from nwd2mta1.analog.com (137.71.25.55) by
 BL2NAM02FT016.mail.protection.outlook.com (10.152.77.171) with Microsoft SMTP
 Server (version=TLS1_0, cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.20.1856.11
 via Frontend Transport; Wed, 8 May 2019 11:30:48 +0000
Received: from NWD2HUBCAS7.ad.analog.com (nwd2hubcas7.ad.analog.com
 [10.64.69.107])
 by nwd2mta1.analog.com (8.13.8/8.13.8) with ESMTP id x48BUlYi023920
 (version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=OK);
 Wed, 8 May 2019 04:30:47 -0700
Received: from saturn.analog.com (10.50.1.244) by NWD2HUBCAS7.ad.analog.com
 (10.64.69.107) with Microsoft SMTP Server id 14.3.408.0; Wed, 8 May 2019
 07:30:47 -0400
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
Subject: [PATCH 16/16] sched: debug: use new match_string() helper/macro
Date: Wed, 8 May 2019 14:28:42 +0300
Message-ID: <20190508112842.11654-18-alexandru.ardelean@analog.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190508112842.11654-1-alexandru.ardelean@analog.com>
References: <20190508112842.11654-1-alexandru.ardelean@analog.com>
MIME-Version: 1.0
X-ADIRoutedOnPrem: True
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:137.71.25.55; IPV:NLI; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(1496009)(346002)(376002)(396003)(39860400002)(136003)(2980300002)(199004)(189003)(50226002)(246002)(8936002)(8676002)(5660300002)(70586007)(70206006)(14444005)(76176011)(426003)(336012)(51416003)(7696005)(4744005)(356004)(6666004)(1076003)(44832011)(476003)(2616005)(11346002)(446003)(126002)(486006)(16586007)(316002)(106002)(54906003)(110136005)(77096007)(26005)(186003)(86362001)(50466002)(478600001)(2201001)(47776003)(7416002)(305945005)(7636002)(48376002)(2441003)(53416004)(4326008)(36756003)(107886003)(2906002)(921003)(2101003)(83996005)(1121003);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DM5PR03MB3131; H:nwd2mta1.analog.com; FPR:;
 SPF:Pass; LANG:en; PTR:nwd2mail10.analog.com; A:1; MX:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 4f9efdca-1ab7-457f-8e86-08d6d3a89e43
X-Microsoft-Antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600141)(711020)(4605104)(4709054)(2017052603328);
 SRVR:DM5PR03MB3131; 
X-MS-TrafficTypeDiagnostic: DM5PR03MB3131:
X-Microsoft-Antispam-PRVS: <DM5PR03MB3131EB1D4A0233D6F2CF2FE9F9320@DM5PR03MB3131.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:883;
X-Forefront-PRVS: 0031A0FFAF
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Message-Info: y8JtZs2HotEuJXogFzCnWR8K541Bt2KfbZWELew5MD4nlAPku+wmdwLi/TmhK+Wakt+fvbaRFSoxotZgnMV2hufk93HL+wHu08VeIYZzAB8IoqoQv2Dvs3lnVRZh37jPq6JDJZ09fXCNHxrzaMP2dKCDMykwclc7f8Vhdsv9Hmgt6QzYljQnwVIuzcGFye7kiyk0f3KKDWznos08NxFijPl+LUMHPWnvzQlXV/iO2H1CI51TvTwttNaST8OKKWnz5OXJBqxgbJS4Kly1RQeBnhEZ3a2yJ66lTxZm6OcLmRETP89L/aXGIMwvdEBcgXHdYhM7+eUMfrZ8P6irgud1tsflo5a0tQjULWcYbJoGX3011swPClTsa1cpteMxSluefGhuVRdEo64cyvpiEdovYVJn9rugc71z/Ws3tZEK/Xg=
X-OriginatorOrg: analog.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 May 2019 11:30:48.0826 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4f9efdca-1ab7-457f-8e86-08d6d3a89e43
X-MS-Exchange-CrossTenant-Id: eaa689b4-8f87-40e0-9c6f-7228de4d754a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=eaa689b4-8f87-40e0-9c6f-7228de4d754a; Ip=[137.71.25.55];
 Helo=[nwd2mta1.analog.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR03MB3131
X-Mailman-Approved-At: Thu, 09 May 2019 07:18:00 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=analog.onmicrosoft.com; s=selector1-analog-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BLP6T3LmL+xu1pWFiHVPh/xRUsA/EQBeKdqIkqvb8tM=;
 b=Mou+jErBJvl2+qbFwKpdjFrX8nTbxuMm9kAbp3zHsAZA2Yu/30Qn/WM6TRbbZNSO3b9THY/Eb/sEps9xXwDLMCKhkT2e6gE563qV3pa7GK6VRH3DCP3ZsKscgA/XT3bvkTHMyfFdjW8irkfZ8FepYUe+nSBapiK9qv/M4/AWiaI=
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

VGhlIGBzY2hlZF9mZWF0X25hbWVzYCBhcnJheSBpcyBhIHN0YXRpYyBhcnJheSBvZiBzdHJpbmdz
LgpVc2luZyBtYXRjaF9zdHJpbmcoKSAod2hpY2ggY29tcHV0ZXMgdGhlIGFycmF5IHNpemUgdmlh
IEFSUkFZX1NJWkUoKSkKaXMgcG9zc2libGUuCgpUaGUgY2hhbmdlIGlzIG1vc3RseSBjb3NtZXRp
Yy4KTm8gZnVuY3Rpb25hbGl0eSBjaGFuZ2UuCgpTaWduZWQtb2ZmLWJ5OiBBbGV4YW5kcnUgQXJk
ZWxlYW4gPGFsZXhhbmRydS5hcmRlbGVhbkBhbmFsb2cuY29tPgotLS0KIGtlcm5lbC9zY2hlZC9k
ZWJ1Zy5jIHwgMiArLQogMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9u
KC0pCgpkaWZmIC0tZ2l0IGEva2VybmVsL3NjaGVkL2RlYnVnLmMgYi9rZXJuZWwvc2NoZWQvZGVi
dWcuYwppbmRleCBiMGVmYzVmZTY0MWUuLjZkNWYzNzBiZGZkZSAxMDA2NDQKLS0tIGEva2VybmVs
L3NjaGVkL2RlYnVnLmMKKysrIGIva2VybmVsL3NjaGVkL2RlYnVnLmMKQEAgLTExMSw3ICsxMTEs
NyBAQCBzdGF0aWMgaW50IHNjaGVkX2ZlYXRfc2V0KGNoYXIgKmNtcCkKIAkJY21wICs9IDM7CiAJ
fQogCi0JaSA9IF9fbWF0Y2hfc3RyaW5nKHNjaGVkX2ZlYXRfbmFtZXMsIF9fU0NIRURfRkVBVF9O
UiwgY21wKTsKKwlpID0gbWF0Y2hfc3RyaW5nKHNjaGVkX2ZlYXRfbmFtZXMsIGNtcCk7CiAJaWYg
KGkgPCAwKQogCQlyZXR1cm4gaTsKIAotLSAKMi4xNy4xCgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZl
bEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFp
bG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
