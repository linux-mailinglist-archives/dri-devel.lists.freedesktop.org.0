Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 54D65185E8
	for <lists+dri-devel@lfdr.de>; Thu,  9 May 2019 09:18:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 73F0989A0F;
	Thu,  9 May 2019 07:18:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM01-BY2-obe.outbound.protection.outlook.com
 (mail-eopbgr810047.outbound.protection.outlook.com [40.107.81.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 11004897C5;
 Wed,  8 May 2019 11:29:47 +0000 (UTC)
Received: from BN6PR03CA0015.namprd03.prod.outlook.com (2603:10b6:404:23::25)
 by SN2PR03MB2270.namprd03.prod.outlook.com (2603:10b6:804:d::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.1856.10; Wed, 8 May
 2019 11:29:43 +0000
Received: from CY1NAM02FT047.eop-nam02.prod.protection.outlook.com
 (2a01:111:f400:7e45::203) by BN6PR03CA0015.outlook.office365.com
 (2603:10b6:404:23::25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.1878.21 via Frontend
 Transport; Wed, 8 May 2019 11:29:43 +0000
Received-SPF: Pass (protection.outlook.com: domain of analog.com designates
 137.71.25.57 as permitted sender) receiver=protection.outlook.com;
 client-ip=137.71.25.57; helo=nwd2mta2.analog.com;
Received: from nwd2mta2.analog.com (137.71.25.57) by
 CY1NAM02FT047.mail.protection.outlook.com (10.152.74.177) with Microsoft SMTP
 Server (version=TLS1_0, cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.20.1856.11
 via Frontend Transport; Wed, 8 May 2019 11:29:41 +0000
Received: from NWD2HUBCAS7.ad.analog.com (nwd2hubcas7.ad.analog.com
 [10.64.69.107])
 by nwd2mta2.analog.com (8.13.8/8.13.8) with ESMTP id x48BTenk017131
 (version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=OK);
 Wed, 8 May 2019 04:29:40 -0700
Received: from saturn.analog.com (10.50.1.244) by NWD2HUBCAS7.ad.analog.com
 (10.64.69.107) with Microsoft SMTP Server id 14.3.408.0; Wed, 8 May 2019
 07:29:39 -0400
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
Subject: [PATCH 04/16] powerpc/xmon: use new match_string() helper/macro
Date: Wed, 8 May 2019 14:28:30 +0300
Message-ID: <20190508112842.11654-6-alexandru.ardelean@analog.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190508112842.11654-1-alexandru.ardelean@analog.com>
References: <20190508112842.11654-1-alexandru.ardelean@analog.com>
MIME-Version: 1.0
X-ADIRoutedOnPrem: True
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:137.71.25.57; IPV:NLI; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(1496009)(136003)(346002)(39860400002)(396003)(376002)(2980300002)(199004)(189003)(76176011)(7696005)(356004)(6666004)(70206006)(51416003)(316002)(7416002)(2201001)(305945005)(7636002)(107886003)(48376002)(47776003)(110136005)(16586007)(4326008)(2906002)(54906003)(53416004)(106002)(11346002)(446003)(14444005)(36756003)(478600001)(2441003)(186003)(486006)(50226002)(126002)(2616005)(476003)(86362001)(70586007)(50466002)(336012)(8936002)(5660300002)(1076003)(4744005)(426003)(77096007)(26005)(44832011)(246002)(8676002)(921003)(83996005)(1121003)(2101003);
 DIR:OUT; SFP:1101; SCL:1; SRVR:SN2PR03MB2270; H:nwd2mta2.analog.com; FPR:;
 SPF:Pass; LANG:en; PTR:nwd2mail11.analog.com; A:1; MX:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: dfbd6645-f3e1-49b6-1450-08d6d3a8774c
X-Microsoft-Antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600141)(711020)(4605104)(4709054)(2017052603328);
 SRVR:SN2PR03MB2270; 
X-MS-TrafficTypeDiagnostic: SN2PR03MB2270:
X-Microsoft-Antispam-PRVS: <SN2PR03MB22702A36CFFB4F24671124AEF9320@SN2PR03MB2270.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;
X-Forefront-PRVS: 0031A0FFAF
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Message-Info: KBaFP+VndcR4Pf2Avf8+W37sHaN8ZZJBBrWfHnFJ8l4xSH7jQGBdDEcnqagJMKs/oHbr9oYooJZUU4xkacMNv18LLG29wwpx6s6jnKluGmQRA4ewJoO4MJMNLnrj+iEP9+WvVm59vBhxTahQbM7N1ZvL80PXwnLkgR8siCzsyJn5Q9X+sxi8zBFAfc3hej5rkB8PZzkxpkMenJqsj2UIckP4SpNwF+OwyJqZITPx+vJWrk9s+k2seUKSvdSE3UyHHJZZuFbdM83NjlN0sSgLj3ONDOP7mfDlxwMMTiSqV4jdRLFHtNH5oVVbb9KCyE8DTMthgbJCPwDGxxN7b7yMODPWnGCw87W2rP6OrHNOLedXGqVbjL3JmBd48mSrS51VpGb77n/hBi2fRQlG4kD6/k+SqAT2KWOmnMUL3fQ2Hos=
X-OriginatorOrg: analog.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 May 2019 11:29:41.2805 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: dfbd6645-f3e1-49b6-1450-08d6d3a8774c
X-MS-Exchange-CrossTenant-Id: eaa689b4-8f87-40e0-9c6f-7228de4d754a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=eaa689b4-8f87-40e0-9c6f-7228de4d754a; Ip=[137.71.25.57];
 Helo=[nwd2mta2.analog.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN2PR03MB2270
X-Mailman-Approved-At: Thu, 09 May 2019 07:18:00 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=analog.onmicrosoft.com; s=selector1-analog-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=x+Io6nQDgXXj6vWzapFXKhuWEwCuQ7uYG1o8foVltUs=;
 b=OsAPAAdKA72ag6WEgtGuMxKaWxQ0gZIzCPsuAtgnnj/oFA0fbDHMGodRBcRefG9XbOE2g+Aq3eXHAUOgRsxbe9OUern7w4ZEKU1MFVRM944jQ4MmmTvJjEX5JVN0ZStKQwnZjTEaE6iWfqxBEGLRi5kjF9g1i+IhSA13dB4Oi0w=
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

VGhlIGNoYW5nZSBpcyBwdXJlbHkgY29zbWV0aWMgYXQgdGhpcyBwb2ludCBpbiB0aW1lLCBidXQg
aXQgZG9lcyBoaWdobGlnaHQKdGhlIGNoYW5nZSBkb25lIGluIGxpYi9zdHJpbmcuYyBmb3IgbWF0
Y2hfc3RyaW5nKCkuCgpQYXJ0aWN1bGFybHkgZm9yIHRoaXMgY2hhbmdlLCBpZiBhIHJlZ25hbWUg
aXMgcmVtb3ZlZCAocmVwbGFjZWQgd2l0aCBOVUxMKQppbiB0aGUgbGlzdCwgdGhlIG1hdGNoX3N0
cmluZygpIGhlbHBlciB3aWxsIGNvbnRpbnVlIHVudGlsIHRoZSBlbmQgb2YgdGhlCmFycmF5IGFu
ZCBpZ25vcmUgdGhlIE5VTEwuClRoaXMgd291bGQgdGVjaG5pY2FsbHkgYWxsb3cgZm9yICJyZXNl
cnZlZCIgcmVncywgdGhvdWdoIGhlcmUgaXQncyBub3QgdGhlCmNhc2UuCgpTaWduZWQtb2ZmLWJ5
OiBBbGV4YW5kcnUgQXJkZWxlYW4gPGFsZXhhbmRydS5hcmRlbGVhbkBhbmFsb2cuY29tPgotLS0K
IGFyY2gvcG93ZXJwYy94bW9uL3htb24uYyB8IDIgKy0KIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2Vy
dGlvbigrKSwgMSBkZWxldGlvbigtKQoKZGlmZiAtLWdpdCBhL2FyY2gvcG93ZXJwYy94bW9uL3ht
b24uYyBiL2FyY2gvcG93ZXJwYy94bW9uL3htb24uYwppbmRleCBlZmNhMTA0YWMwY2IuLmI4NGE3
ZmMxMTEyYiAxMDA2NDQKLS0tIGEvYXJjaC9wb3dlcnBjL3htb24veG1vbi5jCisrKyBiL2FyY2gv
cG93ZXJwYy94bW9uL3htb24uYwpAQCAtMzIzMSw3ICszMjMxLDcgQEAgc2NhbmhleCh1bnNpZ25l
ZCBsb25nICp2cCkKIAkJCXJlZ25hbWVbaV0gPSBjOwogCQl9CiAJCXJlZ25hbWVbaV0gPSAwOwot
CQlpID0gX19tYXRjaF9zdHJpbmcocmVnbmFtZXMsIE5fUFRSRUdTLCByZWduYW1lKTsKKwkJaSA9
IG1hdGNoX3N0cmluZyhyZWduYW1lcywgcmVnbmFtZSk7CiAJCWlmIChpIDwgMCkgewogCQkJcHJp
bnRmKCJpbnZhbGlkIHJlZ2lzdGVyIG5hbWUgJyUlJXMnXG4iLCByZWduYW1lKTsKIAkJCXJldHVy
biAwOwotLSAKMi4xNy4xCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3Rv
cC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmkt
ZGV2ZWw=
