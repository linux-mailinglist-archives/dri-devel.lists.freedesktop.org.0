Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3069C185EE
	for <lists+dri-devel@lfdr.de>; Thu,  9 May 2019 09:18:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BD9CE8991E;
	Thu,  9 May 2019 07:18:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM01-SN1-obe.outbound.protection.outlook.com
 (mail-eopbgr820084.outbound.protection.outlook.com [40.107.82.84])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A802F897D7;
 Wed,  8 May 2019 11:30:22 +0000 (UTC)
Received: from CY4PR03CA0076.namprd03.prod.outlook.com (2603:10b6:910:4d::17)
 by CO2PR03MB2262.namprd03.prod.outlook.com (2603:10b6:102:e::25) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.1856.11; Wed, 8 May
 2019 11:30:19 +0000
Received: from SN1NAM02FT047.eop-nam02.prod.protection.outlook.com
 (2a01:111:f400:7e44::204) by CY4PR03CA0076.outlook.office365.com
 (2603:10b6:910:4d::17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.1856.11 via Frontend
 Transport; Wed, 8 May 2019 11:30:19 +0000
Received-SPF: Pass (protection.outlook.com: domain of analog.com designates
 137.71.25.55 as permitted sender) receiver=protection.outlook.com;
 client-ip=137.71.25.55; helo=nwd2mta1.analog.com;
Received: from nwd2mta1.analog.com (137.71.25.55) by
 SN1NAM02FT047.mail.protection.outlook.com (10.152.72.201) with Microsoft SMTP
 Server (version=TLS1_0, cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.20.1856.11
 via Frontend Transport; Wed, 8 May 2019 11:30:17 +0000
Received: from NWD2HUBCAS7.ad.analog.com (nwd2hubcas7.ad.analog.com
 [10.64.69.107])
 by nwd2mta1.analog.com (8.13.8/8.13.8) with ESMTP id x48BUHp9023779
 (version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=OK);
 Wed, 8 May 2019 04:30:17 -0700
Received: from saturn.analog.com (10.50.1.244) by NWD2HUBCAS7.ad.analog.com
 (10.64.69.107) with Microsoft SMTP Server id 14.3.408.0; Wed, 8 May 2019
 07:30:16 -0400
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
Subject: [PATCH 11/16] mm/vmpressure.c: use new match_string() helper/macro
Date: Wed, 8 May 2019 14:28:37 +0300
Message-ID: <20190508112842.11654-13-alexandru.ardelean@analog.com>
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
X-MS-Office365-Filtering-Correlation-Id: 87f72335-9c22-4180-441e-08d6d3a88cc2
X-Microsoft-Antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600141)(711020)(4605104)(4709054)(2017052603328);
 SRVR:CO2PR03MB2262; 
X-MS-TrafficTypeDiagnostic: CO2PR03MB2262:
X-Microsoft-Antispam-PRVS: <CO2PR03MB2262607B10DB5D9F45A5FAD9F9320@CO2PR03MB2262.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-Forefront-PRVS: 0031A0FFAF
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Message-Info: cnstcSk43+prC/nm0NIlQdVDAfOh8/lZSDEOLvPEWx6u5KaV9jPZl9EcFSH7WaASPwU7+fdDNsMvmlMxhDycs0yr3rd1AFhXDzBVzxhZSOvQ0xiWbSJP7dlM8vH2TA9hrPVkJAY/nJnB9TCO/kJZeFl+F9dkyaNWFKv6+gGPtbDKP5qaktyy9MdiyFHMAJyFPoHyy/awX/7gkUHD4/3KRzk12qCmpUyAH54x75Oxy55ICCRLv533XeQ9CiOTbWpa0gaiE1ymmb3TG31mccB9fGyxe87ONr3LPKarJ/n+0poagb0PJccPHE4Tq8ZMRC89HSguBdFMiCV4kVY2RQiJIJyZ1CpB25EFDyiTdXH7OMkWGVU/rGH+WzIi/AJdCh70xavIYa8Ih81ru3cAAfjVLrgfn3Gcz3OTbKTZVQoCtp4=
X-OriginatorOrg: analog.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 May 2019 11:30:17.8821 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 87f72335-9c22-4180-441e-08d6d3a88cc2
X-MS-Exchange-CrossTenant-Id: eaa689b4-8f87-40e0-9c6f-7228de4d754a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=eaa689b4-8f87-40e0-9c6f-7228de4d754a; Ip=[137.71.25.55];
 Helo=[nwd2mta1.analog.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO2PR03MB2262
X-Mailman-Approved-At: Thu, 09 May 2019 07:18:00 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=analog.onmicrosoft.com; s=selector1-analog-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2ANUS/cN4JJVZq6SdOb8BTq0Q8zTyuGFxo7xS+ekZas=;
 b=YAlgegs92dk0EBLrPaSAvAEoW+a6ILmnKzEUjwH9tQEsaafIGj/Jbgvg9FfspO4AAB0mHpi+xLxqThyb3jNrDhjwFUrYCAkX4mmKxh0huvawVaQ4qJsf1twnbtqNI/QY/ocFBuZ92YZHpWBwOZalU5NYJYyYwmli40Iiko9jix8=
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

X19tYXRjaF9zdHJpbmcoKSBpcyBjYWxsZWQgb24gMiBzdGF0aWMgYXJyYXkgb2Ygc3RyaW5ncyBp
biB0aGlzIGZpbGUuIEZvcgp0aGlzIHJlYXNvbiwgdGhlIGNvbnZlcnNpb24gdG8gdGhlIG5ldyBt
YXRjaF9zdHJpbmcoKSBtYWNyby9oZWxwZXIsIHdhcwpkb25lIGluIHRoaXMgc2VwYXJhdGUgY29t
bWl0LgoKVXNpbmcgdGhlIG5ldyBtYXRjaF9zdHJpbmcoKSBoZWxwZXIgaXMgbW9zdGx5IGEgY29z
bWV0aWMgY2hhbmdlIChhdCB0aGlzCnBvaW50IGluIHRpbWUpLiBUaGUgc2l6ZXMgb2YgdGhlIGFy
cmF5cyB3aWxsIGJlIGNvbXB1dGVkIGF1dG9tYXRpY2FsbHksCndoaWNoIHdvdWxkIG9ubHkgaGVs
cCBpZiB0aGV5IGV2ZXIgZ2V0IGV4cGFuZGVkLgoKU2lnbmVkLW9mZi1ieTogQWxleGFuZHJ1IEFy
ZGVsZWFuIDxhbGV4YW5kcnUuYXJkZWxlYW5AYW5hbG9nLmNvbT4KLS0tCiBtbS92bXByZXNzdXJl
LmMgfCA0ICsrLS0KIDEgZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25z
KC0pCgpkaWZmIC0tZ2l0IGEvbW0vdm1wcmVzc3VyZS5jIGIvbW0vdm1wcmVzc3VyZS5jCmluZGV4
IGQ0M2YzMzEzOTU2OC4uYjgxNDk5MjRmMDc4IDEwMDY0NAotLS0gYS9tbS92bXByZXNzdXJlLmMK
KysrIGIvbW0vdm1wcmVzc3VyZS5jCkBAIC0zNzgsNyArMzc4LDcgQEAgaW50IHZtcHJlc3N1cmVf
cmVnaXN0ZXJfZXZlbnQoc3RydWN0IG1lbV9jZ3JvdXAgKm1lbWNnLAogCiAJLyogRmluZCByZXF1
aXJlZCBsZXZlbCAqLwogCXRva2VuID0gc3Ryc2VwKCZzcGVjLCAiLCIpOwotCWxldmVsID0gX19t
YXRjaF9zdHJpbmcodm1wcmVzc3VyZV9zdHJfbGV2ZWxzLCBWTVBSRVNTVVJFX05VTV9MRVZFTFMs
IHRva2VuKTsKKwlsZXZlbCA9IG1hdGNoX3N0cmluZyh2bXByZXNzdXJlX3N0cl9sZXZlbHMsIHRv
a2VuKTsKIAlpZiAobGV2ZWwgPCAwKSB7CiAJCXJldCA9IGxldmVsOwogCQlnb3RvIG91dDsKQEAg
LTM4Nyw3ICszODcsNyBAQCBpbnQgdm1wcmVzc3VyZV9yZWdpc3Rlcl9ldmVudChzdHJ1Y3QgbWVt
X2Nncm91cCAqbWVtY2csCiAJLyogRmluZCBvcHRpb25hbCBtb2RlICovCiAJdG9rZW4gPSBzdHJz
ZXAoJnNwZWMsICIsIik7CiAJaWYgKHRva2VuKSB7Ci0JCW1vZGUgPSBfX21hdGNoX3N0cmluZyh2
bXByZXNzdXJlX3N0cl9tb2RlcywgVk1QUkVTU1VSRV9OVU1fTU9ERVMsIHRva2VuKTsKKwkJbW9k
ZSA9IG1hdGNoX3N0cmluZyh2bXByZXNzdXJlX3N0cl9tb2RlcywgdG9rZW4pOwogCQlpZiAobW9k
ZSA8IDApIHsKIAkJCXJldCA9IG1vZGU7CiAJCQlnb3RvIG91dDsKLS0gCjIuMTcuMQoKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxp
bmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJl
ZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
