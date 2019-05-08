Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 43EDE18613
	for <lists+dri-devel@lfdr.de>; Thu,  9 May 2019 09:19:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EDE1D89BCD;
	Thu,  9 May 2019 07:18:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM03-DM3-obe.outbound.protection.outlook.com
 (mail-eopbgr800073.outbound.protection.outlook.com [40.107.80.73])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 733158979D;
 Wed,  8 May 2019 11:29:29 +0000 (UTC)
Received: from CY1PR03CA0035.namprd03.prod.outlook.com (2603:10b6:600::45) by
 BY2PR03MB555.namprd03.prod.outlook.com (2a01:111:e400:2c37::27) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.1856.10; Wed, 8 May
 2019 11:29:22 +0000
Received: from BL2NAM02FT016.eop-nam02.prod.protection.outlook.com
 (2a01:111:f400:7e46::205) by CY1PR03CA0035.outlook.office365.com
 (2603:10b6:600::45) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.1856.10 via Frontend
 Transport; Wed, 8 May 2019 11:29:21 +0000
Received-SPF: Pass (protection.outlook.com: domain of analog.com designates
 137.71.25.57 as permitted sender) receiver=protection.outlook.com;
 client-ip=137.71.25.57; helo=nwd2mta2.analog.com;
Received: from nwd2mta2.analog.com (137.71.25.57) by
 BL2NAM02FT016.mail.protection.outlook.com (10.152.77.171) with Microsoft SMTP
 Server (version=TLS1_0, cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.20.1856.11
 via Frontend Transport; Wed, 8 May 2019 11:29:21 +0000
Received: from NWD2HUBCAS7.ad.analog.com (nwd2hubcas7.ad.analog.com
 [10.64.69.107])
 by nwd2mta2.analog.com (8.13.8/8.13.8) with ESMTP id x48BTLLf016976
 (version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=OK);
 Wed, 8 May 2019 04:29:21 -0700
Received: from saturn.analog.com (10.50.1.244) by NWD2HUBCAS7.ad.analog.com
 (10.64.69.107) with Microsoft SMTP Server id 14.3.408.0; Wed, 8 May 2019
 07:29:20 -0400
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
Subject: [PATCH 01/16] lib: fix match_string() helper on -1 array size
Date: Wed, 8 May 2019 14:28:26 +0300
Message-ID: <20190508112842.11654-2-alexandru.ardelean@analog.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190508112842.11654-1-alexandru.ardelean@analog.com>
References: <20190508112842.11654-1-alexandru.ardelean@analog.com>
MIME-Version: 1.0
X-ADIRoutedOnPrem: True
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:137.71.25.57; IPV:NLI; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(1496009)(376002)(136003)(346002)(396003)(39860400002)(2980300002)(189003)(199004)(316002)(50466002)(110136005)(106002)(76176011)(36756003)(70206006)(70586007)(86362001)(7696005)(2201001)(14444005)(51416003)(478600001)(7416002)(47776003)(5660300002)(54906003)(2906002)(48376002)(2441003)(16586007)(186003)(446003)(1076003)(77096007)(26005)(356004)(44832011)(486006)(11346002)(126002)(476003)(2616005)(8676002)(107886003)(50226002)(246002)(4326008)(8936002)(53416004)(336012)(426003)(305945005)(7636002)(921003)(83996005)(1121003)(2101003);
 DIR:OUT; SFP:1101; SCL:1; SRVR:BY2PR03MB555; H:nwd2mta2.analog.com; FPR:;
 SPF:Pass; LANG:en; PTR:nwd2mail11.analog.com; MX:1; A:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 70d6917f-f215-4387-ffab-08d6d3a86a83
X-Microsoft-Antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600141)(711020)(4605104)(4709054)(2017052603328);
 SRVR:BY2PR03MB555; 
X-MS-TrafficTypeDiagnostic: BY2PR03MB555:
X-Microsoft-Antispam-PRVS: <BY2PR03MB55532426C65B1246DCD69A2F9320@BY2PR03MB555.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;
X-Forefront-PRVS: 0031A0FFAF
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Message-Info: EkinRue+oHsKHGU9xDPLwqOdJf0rruOZsQl/MCUDoHLxNCdgn+nCd693zRNYU/ul1uHwi/NkPHY62bVRycjk68l9ukT0lp/PIvbvAeGJuTyMBkoJ3LpwJP8AA+6sLGnOa8vypJGw5A8ov1fhv+lnNuk1SC4UW2SeilXkocHeKVTMVkRDO7wzTR6RAbvOq3Phku6T4Mqk2uNO2cTYTiWtoVqA5zyZilUa02oDdwvX2fN0a6JKWMc78cXM7mRR6ztmm/mvcHmERSY8EOpP5AiLIlza+si/G6jqjYxnnCbUx4RESiHtbIqq5bHx5HK13JjNtN5Ds4dH99JuuG6yIO7bb3t3mX15z/334BxveeoKGCgniaZZ1TMVBIT/ECNdU5U8sORBD+6hB+zyeFXFq3pz2/N8I/LejN9R3O2T8knNZfU=
X-OriginatorOrg: analog.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 May 2019 11:29:21.3354 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 70d6917f-f215-4387-ffab-08d6d3a86a83
X-MS-Exchange-CrossTenant-Id: eaa689b4-8f87-40e0-9c6f-7228de4d754a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=eaa689b4-8f87-40e0-9c6f-7228de4d754a; Ip=[137.71.25.57];
 Helo=[nwd2mta2.analog.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY2PR03MB555
X-Mailman-Approved-At: Thu, 09 May 2019 07:18:00 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=analog.onmicrosoft.com; s=selector1-analog-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Kj953YF77LM2a2dlESbeNeZmoXGMTjr2NXsCZOuqlCs=;
 b=WJZTSX1adtoqETj2TRceeLRWIxGQHvR1dID/kkYqIH0ExRMXx3PLDqNgFViju8AN0Sz4+kTjFvxDA6O1mxZkwUmRmezZRNZAXeQ+vpJItNYiEeDHKz8yRyy/Sh9wqu8SJNX7ewmBgovN1EDi11UgAewByNzm7zb+uYfUd6bPxPY=
X-Mailman-Original-Authentication-Results: spf=pass (sender IP is 137.71.25.57)
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

VGhlIGRvY3VtZW50YXRpb24gdGhlIGBfbWF0Y2hfc3RyaW5nKClgIGhlbHBlciBtZW50aW9ucyB0
aGF0IGBuYApzaG91bGQgYmU6CiAqIEBuOiBudW1iZXIgb2Ygc3RyaW5ncyBpbiB0aGUgYXJyYXkg
b3IgLTEgZm9yIE5VTEwgdGVybWluYXRlZCBhcnJheXMKClRoZSBiZWhhdmlvciBvZiB0aGUgZnVu
Y3Rpb24gaXMgZGlmZmVyZW50LCBpbiB0aGUgc2Vuc2UgdGhhdCBpdCBleGl0cyBvbgp0aGUgZmly
c3QgTlVMTCBlbGVtZW50IGluIHRoZSBhcnJheSwgcmVnYXJkbGVzcyBvZiB3aGV0aGVyIGBuYCBp
cyAtMSBvciBhCnBvc2l0aXZlIG51bWJlci4KClRoaXMgcGF0Y2ggY2hhbmdlcyB0aGUgYmVoYXZp
b3IsIHRvIGV4aXQgdGhlIGxvb3Agd2hlbiBhIE5VTEwgZWxlbWVudCBpcwpmb3VuZCBhbmQgbiA9
PSAtMS4gRXNzZW50aWFsbHksIHRoaXMgYWxpZ25zIHRoZSBiZWhhdmlvciB3aXRoIHRoZQpkb2Mt
c3RyaW5nLgoKVGhlcmUgYXJlIGN1cnJlbnRseSBtYW55IHVzZXJzIG9mIGBtYXRjaF9zdHJpbmco
KWAsIGFuZCBzbywgaW4gb3JkZXIgdG8gZ28KdGhyb3VnaCB0aGVtLCB0aGUgbmV4dCBwYXRjaGVz
IGluIHRoZSBzZXJpZXMgd2lsbCBmb2N1cyBvbiBkb2luZyBzb21lCmNvc21ldGljIGNoYW5nZXMs
IHdoaWNoIGFyZSBhaW1lZCBhdCBncm91cGluZyB0aGUgdXNlcnMgb2YKYG1hdGNoX3N0cmluZygp
YC4KClNpZ25lZC1vZmYtYnk6IEFsZXhhbmRydSBBcmRlbGVhbiA8YWxleGFuZHJ1LmFyZGVsZWFu
QGFuYWxvZy5jb20+Ci0tLQogbGliL3N0cmluZy5jIHwgNSArKysrLQogMSBmaWxlIGNoYW5nZWQs
IDQgaW5zZXJ0aW9ucygrKSwgMSBkZWxldGlvbigtKQoKZGlmZiAtLWdpdCBhL2xpYi9zdHJpbmcu
YyBiL2xpYi9zdHJpbmcuYwppbmRleCAzYWI4NjFjMWE4NTcuLjc2ZWRiN2JmNzZjYiAxMDA2NDQK
LS0tIGEvbGliL3N0cmluZy5jCisrKyBiL2xpYi9zdHJpbmcuYwpAQCAtNjQ4LDggKzY0OCwxMSBA
QCBpbnQgbWF0Y2hfc3RyaW5nKGNvbnN0IGNoYXIgKiBjb25zdCAqYXJyYXksIHNpemVfdCBuLCBj
b25zdCBjaGFyICpzdHJpbmcpCiAKIAlmb3IgKGluZGV4ID0gMDsgaW5kZXggPCBuOyBpbmRleCsr
KSB7CiAJCWl0ZW0gPSBhcnJheVtpbmRleF07Ci0JCWlmICghaXRlbSkKKwkJaWYgKCFpdGVtKSB7
CisJCQlpZiAobiAhPSAoc2l6ZV90KS0xKQorCQkJCWNvbnRpbnVlOwogCQkJYnJlYWs7CisJCX0K
IAkJaWYgKCFzdHJjbXAoaXRlbSwgc3RyaW5nKSkKIAkJCXJldHVybiBpbmRleDsKIAl9Ci0tIAoy
LjE3LjEKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRy
aS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRw
czovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
