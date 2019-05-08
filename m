Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 861F4185E3
	for <lists+dri-devel@lfdr.de>; Thu,  9 May 2019 09:18:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A712A89895;
	Thu,  9 May 2019 07:18:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM03-BY2-obe.outbound.protection.outlook.com
 (mail-eopbgr780087.outbound.protection.outlook.com [40.107.78.87])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1D6F2897BB;
 Wed,  8 May 2019 11:30:13 +0000 (UTC)
Received: from BN3PR03CA0078.namprd03.prod.outlook.com
 (2a01:111:e400:7a4d::38) by CO2PR03MB2262.namprd03.prod.outlook.com
 (2603:10b6:102:e::25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.1856.11; Wed, 8 May
 2019 11:30:10 +0000
Received: from CY1NAM02FT020.eop-nam02.prod.protection.outlook.com
 (2a01:111:f400:7e45::209) by BN3PR03CA0078.outlook.office365.com
 (2a01:111:e400:7a4d::38) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.1856.11 via Frontend
 Transport; Wed, 8 May 2019 11:30:09 +0000
Received-SPF: Pass (protection.outlook.com: domain of analog.com designates
 137.71.25.55 as permitted sender) receiver=protection.outlook.com;
 client-ip=137.71.25.55; helo=nwd2mta1.analog.com;
Received: from nwd2mta1.analog.com (137.71.25.55) by
 CY1NAM02FT020.mail.protection.outlook.com (10.152.75.191) with Microsoft SMTP
 Server (version=TLS1_0, cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.20.1856.11
 via Frontend Transport; Wed, 8 May 2019 11:30:07 +0000
Received: from NWD2HUBCAS7.ad.analog.com (nwd2hubcas7.ad.analog.com
 [10.64.69.107])
 by nwd2mta1.analog.com (8.13.8/8.13.8) with ESMTP id x48BU7gu023733
 (version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=OK);
 Wed, 8 May 2019 04:30:07 -0700
Received: from saturn.analog.com (10.50.1.244) by NWD2HUBCAS7.ad.analog.com
 (10.64.69.107) with Microsoft SMTP Server id 14.3.408.0; Wed, 8 May 2019
 07:30:06 -0400
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
Subject: [PATCH 09/16] mmc: sdhci-xenon: use new match_string() helper/macro
Date: Wed, 8 May 2019 14:28:35 +0300
Message-ID: <20190508112842.11654-11-alexandru.ardelean@analog.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190508112842.11654-1-alexandru.ardelean@analog.com>
References: <20190508112842.11654-1-alexandru.ardelean@analog.com>
MIME-Version: 1.0
X-ADIRoutedOnPrem: True
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:137.71.25.55; IPV:NLI; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(1496009)(396003)(39860400002)(376002)(346002)(136003)(2980300002)(189003)(199004)(356004)(6666004)(36756003)(5660300002)(50466002)(48376002)(2616005)(126002)(426003)(336012)(107886003)(51416003)(44832011)(2906002)(47776003)(486006)(2201001)(4326008)(476003)(11346002)(446003)(86362001)(76176011)(26005)(16586007)(246002)(478600001)(2441003)(50226002)(53416004)(1076003)(7696005)(70586007)(70206006)(7636002)(305945005)(7416002)(106002)(77096007)(8676002)(316002)(186003)(110136005)(8936002)(54906003)(921003)(83996005)(1121003)(2101003);
 DIR:OUT; SFP:1101; SCL:1; SRVR:CO2PR03MB2262; H:nwd2mta1.analog.com; FPR:;
 SPF:Pass; LANG:en; PTR:nwd2mail10.analog.com; MX:1; A:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 8666f1cf-9df3-40da-2f35-08d6d3a88708
X-Microsoft-Antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600141)(711020)(4605104)(4709054)(2017052603328);
 SRVR:CO2PR03MB2262; 
X-MS-TrafficTypeDiagnostic: CO2PR03MB2262:
X-Microsoft-Antispam-PRVS: <CO2PR03MB226289536B8045C7EF017BB5F9320@CO2PR03MB2262.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6430;
X-Forefront-PRVS: 0031A0FFAF
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Message-Info: 7rCCvmL00MJBmcDTDIesTQyTH/FNWfXEsju68ENrTwxg/JIcze2MSJ12BbCQi4KSrgLnc1A1T6oXYLKYxlqmijCkcIwNL4E9xzrBeXjIFArc3gJbJYEsik3rWIiMQrmNac8NKVSXbLpB/o4OjBebxyfuuKkkNtQJJAndo0715UIZuDMc1ZdvuMrceL8LElXSfQiRCtrBNnkB/KWkSmtT8hsShWBcIskk5FP30zXoYxV/z2dgb6eFA53PQRv7N/xDDavBCp9yNUm4NynSE3PGnYKIawmDQ1m2K8VQatJsc8AN1TyPmq9PF1A8pLI6egBZrXN35GHe2/ZpHJhBxPEZoVlVwSfSUS96GPx1sw2lCVmgt88RgJFlddOoDGa3f1+TOqJw2fXL5R0yGXI+tAlczYBs61mJT3hH1NvT9TI8S+8=
X-OriginatorOrg: analog.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 May 2019 11:30:07.6794 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8666f1cf-9df3-40da-2f35-08d6d3a88708
X-MS-Exchange-CrossTenant-Id: eaa689b4-8f87-40e0-9c6f-7228de4d754a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=eaa689b4-8f87-40e0-9c6f-7228de4d754a; Ip=[137.71.25.55];
 Helo=[nwd2mta1.analog.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO2PR03MB2262
X-Mailman-Approved-At: Thu, 09 May 2019 07:18:00 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=analog.onmicrosoft.com; s=selector1-analog-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=J2kUTxOBDW7W13uwOdmuJPQDQWhKkMs+dI0VfMHNhcs=;
 b=HmsHAFljmcbaN1BpAlIGHCpGcJ5jk39AUEqf/6w5Fch3rgS9LrOHdDkTRid4twIc316F2MrfuNLVkUGQ1NWLbgumQMbITyYa+XILsOarTTI+P/wjFyGQgnt0YjzNFAD0f6jVnTLQ0U3CRal0YHtfYbnJ7fVybRtPPhSGo+MDAbc=
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

VGhlIGNoYW5nZSBpcyBhbHNvIGNvc21ldGljLCBidXQgaXQgYWxzbyBkb2VzIGEgdGlnaHRlciBj
b3VwbGluZyBiZXR3ZWVuCnRoZSBlbnVtcyAmIHRoZSBzdHJpbmcgdmFsdWVzLiBUaGlzIHdheSwg
dGhlIEFSUkFZX1NJWkUocGh5X3R5cGVzKSB0aGF0IGlzCmltcGxpY2l0bHkgZG9uZSBpbiB0aGUg
bWF0Y2hfc3RyaW5nKCkgbWFjcm8gaXMgYWxzbyBhIGJpdCBzYWZlci4KClNpZ25lZC1vZmYtYnk6
IEFsZXhhbmRydSBBcmRlbGVhbiA8YWxleGFuZHJ1LmFyZGVsZWFuQGFuYWxvZy5jb20+Ci0tLQog
ZHJpdmVycy9tbWMvaG9zdC9zZGhjaS14ZW5vbi1waHkuYyB8IDEyICsrKysrKy0tLS0tLQogMSBm
aWxlIGNoYW5nZWQsIDYgaW5zZXJ0aW9ucygrKSwgNiBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQg
YS9kcml2ZXJzL21tYy9ob3N0L3NkaGNpLXhlbm9uLXBoeS5jIGIvZHJpdmVycy9tbWMvaG9zdC9z
ZGhjaS14ZW5vbi1waHkuYwppbmRleCA1OWI3YTZjYWM5OTUuLjJhOTIwNjg2N2ZlMSAxMDA2NDQK
LS0tIGEvZHJpdmVycy9tbWMvaG9zdC9zZGhjaS14ZW5vbi1waHkuYworKysgYi9kcml2ZXJzL21t
Yy9ob3N0L3NkaGNpLXhlbm9uLXBoeS5jCkBAIC0xMzUsMTcgKzEzNSwxNyBAQCBzdHJ1Y3QgeGVu
b25fZW1tY19waHlfcmVncyB7CiAJdTMyIGxvZ2ljX3RpbWluZ192YWw7CiB9OwogCi1zdGF0aWMg
Y29uc3QgY2hhciAqIGNvbnN0IHBoeV90eXBlc1tdID0gewotCSJlbW1jIDUuMCBwaHkiLAotCSJl
bW1jIDUuMSBwaHkiCi19OwotCiBlbnVtIHhlbm9uX3BoeV90eXBlX2VudW0gewogCUVNTUNfNV8w
X1BIWSwKIAlFTU1DXzVfMV9QSFksCiAJTlJfUEhZX1RZUEVTCiB9OwogCitzdGF0aWMgY29uc3Qg
Y2hhciAqIGNvbnN0IHBoeV90eXBlc1tOUl9QSFlfVFlQRVNdID0geworCVtFTU1DXzVfMF9QSFld
ID0gImVtbWMgNS4wIHBoeSIsCisJW0VNTUNfNV8xX1BIWV0gPSAiZW1tYyA1LjEgcGh5IgorfTsK
KwogZW51bSBzb2NfcGFkX2N0cmxfdHlwZSB7CiAJU09DX1BBRF9TRCwKIAlTT0NfUEFEX0ZJWEVE
XzFfOFYsCkBAIC04MjEsNyArODIxLDcgQEAgc3RhdGljIGludCB4ZW5vbl9hZGRfcGh5KHN0cnVj
dCBkZXZpY2Vfbm9kZSAqbnAsIHN0cnVjdCBzZGhjaV9ob3N0ICpob3N0LAogCXN0cnVjdCB4ZW5v
bl9wcml2ICpwcml2ID0gc2RoY2lfcGx0Zm1fcHJpdihwbHRmbV9ob3N0KTsKIAlpbnQgcmV0Owog
Ci0JcHJpdi0+cGh5X3R5cGUgPSBfX21hdGNoX3N0cmluZyhwaHlfdHlwZXMsIE5SX1BIWV9UWVBF
UywgcGh5X25hbWUpOworCXByaXYtPnBoeV90eXBlID0gbWF0Y2hfc3RyaW5nKHBoeV90eXBlcywg
cGh5X25hbWUpOwogCWlmIChwcml2LT5waHlfdHlwZSA8IDApIHsKIAkJZGV2X2VycihtbWNfZGV2
KGhvc3QtPm1tYyksCiAJCQkiVW5hYmxlIHRvIGRldGVybWluZSBQSFkgbmFtZSAlcy4gVXNlIGRl
ZmF1bHQgZU1NQyA1LjEgUEhZXG4iLAotLSAKMi4xNy4xCgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZl
bEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFp
bG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
