Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CE742CD66
	for <lists+dri-devel@lfdr.de>; Tue, 28 May 2019 19:14:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7AD8C6E27B;
	Tue, 28 May 2019 17:14:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM05-BY2-obe.outbound.protection.outlook.com
 (mail-eopbgr710042.outbound.protection.outlook.com [40.107.71.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1CA8989BFC;
 Tue, 28 May 2019 07:40:03 +0000 (UTC)
Received: from BN3PR03CA0110.namprd03.prod.outlook.com (2603:10b6:400:4::28)
 by BLUPR03MB552.namprd03.prod.outlook.com (2a01:111:e400:883::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.1922.22; Tue, 28 May
 2019 07:39:58 +0000
Received: from SN1NAM02FT022.eop-nam02.prod.protection.outlook.com
 (2a01:111:f400:7e44::202) by BN3PR03CA0110.outlook.office365.com
 (2603:10b6:400:4::28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.1943.16 via Frontend
 Transport; Tue, 28 May 2019 07:39:58 +0000
Received-SPF: Pass (protection.outlook.com: domain of analog.com designates
 137.71.25.55 as permitted sender) receiver=protection.outlook.com;
 client-ip=137.71.25.55; helo=nwd2mta1.analog.com;
Received: from nwd2mta1.analog.com (137.71.25.55) by
 SN1NAM02FT022.mail.protection.outlook.com (10.152.72.148) with Microsoft SMTP
 Server (version=TLS1_0, cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.20.1922.16
 via Frontend Transport; Tue, 28 May 2019 07:39:57 +0000
Received: from NWD2HUBCAS7.ad.analog.com (nwd2hubcas7.ad.analog.com
 [10.64.69.107])
 by nwd2mta1.analog.com (8.13.8/8.13.8) with ESMTP id x4S7duOZ023275
 (version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=OK);
 Tue, 28 May 2019 00:39:56 -0700
Received: from saturn.analog.com (10.50.1.244) by NWD2HUBCAS7.ad.analog.com
 (10.64.69.107) with Microsoft SMTP Server id 14.3.408.0; Tue, 28 May 2019
 03:39:56 -0400
From: Alexandru Ardelean <alexandru.ardelean@analog.com>
To: <linuxppc-dev@lists.ozlabs.org>, <linux-kernel@vger.kernel.org>,
 <linux-ide@vger.kernel.org>, <linux-clk@vger.kernel.org>,
 <linux-rpi-kernel@lists.infradead.org>,
 <linux-arm-kernel@lists.infradead.org>,
 <linux-rockchip@lists.infradead.org>, <linux-pm@vger.kernel.org>,
 <linux-gpio@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
 <intel-gfx@lists.freedesktop.org>, <linux-omap@vger.kernel.org>,
 <linux-mmc@vger.kernel.org>, <linux-wireless@vger.kernel.org>,
 <netdev@vger.kernel.org>, <linux-pci@vger.kernel.org>,
 <linux-tegra@vger.kernel.org>, <devel@driverdev.osuosl.org>,
 <linux-usb@vger.kernel.org>, <kvm@vger.kernel.org>,
 <linux-fbdev@vger.kernel.org>, <linux-mtd@lists.infradead.org>,
 <cgroups@vger.kernel.org>, <linux-mm@kvack.org>,
 <linux-security-module@vger.kernel.org>,
 <linux-integrity@vger.kernel.org>, <alsa-devel@alsa-project.org>
Subject: [PATCH 3/3][V2] lib: re-introduce new match_string() helper/macro
Date: Tue, 28 May 2019 10:39:32 +0300
Message-ID: <20190528073932.25365-3-alexandru.ardelean@analog.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190528073932.25365-1-alexandru.ardelean@analog.com>
References: <20190508112842.11654-1-alexandru.ardelean@analog.com>
 <20190528073932.25365-1-alexandru.ardelean@analog.com>
MIME-Version: 1.0
X-ADIRoutedOnPrem: True
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:137.71.25.55; IPV:NLI; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(1496009)(136003)(39860400002)(346002)(396003)(376002)(2980300002)(199004)(189003)(126002)(2441003)(86362001)(44832011)(5660300002)(2201001)(478600001)(446003)(476003)(2616005)(53416004)(47776003)(316002)(11346002)(2870700001)(2906002)(6666004)(356004)(50226002)(51416003)(7696005)(7416002)(76176011)(48376002)(4326008)(305945005)(70586007)(70206006)(336012)(26005)(77096007)(186003)(1076003)(7636002)(246002)(486006)(426003)(7406005)(110136005)(54906003)(106002)(107886003)(50466002)(36756003)(8936002)(8676002)(921003)(83996005)(1121003)(2101003);
 DIR:OUT; SFP:1101; SCL:1; SRVR:BLUPR03MB552; H:nwd2mta1.analog.com; FPR:;
 SPF:Pass; LANG:en; PTR:nwd2mail10.analog.com; A:1; MX:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 9f7495c6-88de-4750-c0e9-08d6e33faf63
X-Microsoft-Antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(4709054)(1401327)(2017052603328);
 SRVR:BLUPR03MB552; 
X-MS-TrafficTypeDiagnostic: BLUPR03MB552:
X-Microsoft-Antispam-PRVS: <BLUPR03MB5526A3F85F374B6EF9329F1F91E0@BLUPR03MB552.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1443;
X-Forefront-PRVS: 00514A2FE6
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Message-Info: MswgKhZP9m+ZsGUEhWl3phwXCL8yuqzj7xcxpK+dGlJBf9m5zMl51gqC3LUtKdWQ8Os49FCltfeNbu6Phw/B8l5WNlH00oAhRzdjikewQHYUEmLqJ6/urfczkkAV7S6v3P1UMtUMTOYDySCPLD3RO66kjwZftNeRvVV3dsDqCax4qYOjNj2PWP5gkM5PjRZmJWiCQ5YjWYviSRnNrXmzdalwSZTQ416f6pMfl95WCkKeJFuhdayQMWJGsRNhTOHuxm5bGOp4NnJa6ZTV5K+ilvVE4Xb082rHyJdnAOFnjmjlMMgU1yiCJ2yKYrrmhTGSsWl7mABejle5Gq03Z59rpn0+AbER3kkbBxVnYXW8nX3mrHd8Gqzr89K0YpmuIcGMyscsEWrsfpd9tI6dbYg4W4+zRy2MwWGNPPr9JWXwDBM=
X-OriginatorOrg: analog.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 May 2019 07:39:57.3627 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9f7495c6-88de-4750-c0e9-08d6e33faf63
X-MS-Exchange-CrossTenant-Id: eaa689b4-8f87-40e0-9c6f-7228de4d754a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=eaa689b4-8f87-40e0-9c6f-7228de4d754a; Ip=[137.71.25.55];
 Helo=[nwd2mta1.analog.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BLUPR03MB552
X-Mailman-Approved-At: Tue, 28 May 2019 17:13:51 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=analog.onmicrosoft.com; s=selector1-analog-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EVygfSY8hqy/DBUvsHRCgGvieeoiCENlb8QcgTW8Qa0=;
 b=ug3p+80+pta3QSOyYVopWCIPknnTa/9XApeIFW+44+SXRahs8pvbg98CvxDZWD2q7UoHIhgUD6Sn7ZbGyOWHdj4WAzkhg9cumlMLts6dyltoEMjlw9eglOAVG8lj96mIW2ArwyzQcb/gVfwCJxWUUom9Q8RHLT+KaOaucx79tQQ=
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
 heikki.krogerus@linux.intel.com, andriy.shevchenko@linux.intel.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

VGhpcyBjaGFuZ2UgcmUtaW50cm9kdWNlcyBgbWF0Y2hfc3RyaW5nKClgIGFzIGEgbWFjcm8gdGhh
dCB1c2VzCkFSUkFZX1NJWkUoKSB0byBjb21wdXRlIHRoZSBzaXplIG9mIHRoZSBhcnJheS4KCkFm
dGVyIHRoaXMgY2hhbmdlLCB3b3JrIGNhbiBzdGFydCBvbiBtaWdyYXRpbmcgc3Vic3lzdGVtcyB0
byB1c2UgdGhpcyBuZXcKaGVscGVyLiBTaW5jZSB0aGUgb3JpZ2luYWwgaGVscGVyIGlzIHByZXR0
eSB1c2VkLCBtaWdyYXRpbmcgdG8gdGhpcyBuZXcgb25lCndpbGwgdGFrZSBhIHdoaWxlLCBhbmQg
d2lsbCBiZSByZXZpZXdlZCBieSBlYWNoIHN1YnN5c3RlbS4KClNpZ25lZC1vZmYtYnk6IEFsZXhh
bmRydSBBcmRlbGVhbiA8YWxleGFuZHJ1LmFyZGVsZWFuQGFuYWxvZy5jb20+Ci0tLQogaW5jbHVk
ZS9saW51eC9zdHJpbmcuaCB8IDkgKysrKysrKysrCiAxIGZpbGUgY2hhbmdlZCwgOSBpbnNlcnRp
b25zKCspCgpkaWZmIC0tZ2l0IGEvaW5jbHVkZS9saW51eC9zdHJpbmcuaCBiL2luY2x1ZGUvbGlu
dXgvc3RyaW5nLmgKaW5kZXggNzE0OWZjZGY2MmRmLi4zNDQ5MWIwNzU0NDkgMTAwNjQ0Ci0tLSBh
L2luY2x1ZGUvbGludXgvc3RyaW5nLmgKKysrIGIvaW5jbHVkZS9saW51eC9zdHJpbmcuaApAQCAt
MTk4LDYgKzE5OCwxNSBAQCBzdGF0aWMgaW5saW5lIGludCBzdHJ0b2Jvb2woY29uc3QgY2hhciAq
cywgYm9vbCAqcmVzKQogaW50IF9fbWF0Y2hfc3RyaW5nKGNvbnN0IGNoYXIgKiBjb25zdCAqYXJy
YXksIHNpemVfdCBuLCBjb25zdCBjaGFyICpzdHJpbmcpOwogaW50IF9fc3lzZnNfbWF0Y2hfc3Ry
aW5nKGNvbnN0IGNoYXIgKiBjb25zdCAqYXJyYXksIHNpemVfdCBuLCBjb25zdCBjaGFyICpzKTsK
IAorLyoqCisgKiBtYXRjaF9zdHJpbmcgLSBtYXRjaGVzIGdpdmVuIHN0cmluZyBpbiBhbiBhcnJh
eQorICogQF9hOiBhcnJheSBvZiBzdHJpbmdzCisgKiBAX3M6IHN0cmluZyB0byBtYXRjaCB3aXRo
CisgKgorICogSGVscGVyIGZvciBfX21hdGNoX3N0cmluZygpLiBDYWxjdWxhdGVzIHRoZSBzaXpl
IG9mIEBhIGF1dG9tYXRpY2FsbHkuCisgKi8KKyNkZWZpbmUgbWF0Y2hfc3RyaW5nKF9hLCBfcykg
X19tYXRjaF9zdHJpbmcoX2EsIEFSUkFZX1NJWkUoX2EpLCBfcykKKwogLyoqCiAgKiBzeXNmc19t
YXRjaF9zdHJpbmcgLSBtYXRjaGVzIGdpdmVuIHN0cmluZyBpbiBhbiBhcnJheQogICogQF9hOiBh
cnJheSBvZiBzdHJpbmdzCi0tIAoyLjIwLjEKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3Rz
LmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xp
c3RpbmZvL2RyaS1kZXZlbA==
