Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CF7772CD5E
	for <lists+dri-devel@lfdr.de>; Tue, 28 May 2019 19:14:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E647C6E279;
	Tue, 28 May 2019 17:14:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM01-SN1-obe.outbound.protection.outlook.com
 (mail-eopbgr820050.outbound.protection.outlook.com [40.107.82.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 074C389BFC;
 Tue, 28 May 2019 07:39:53 +0000 (UTC)
Received: from BN6PR03CA0012.namprd03.prod.outlook.com (2603:10b6:404:23::22)
 by BL2PR03MB545.namprd03.prod.outlook.com (2a01:111:e400:c23::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.1922.15; Tue, 28 May
 2019 07:39:47 +0000
Received: from BL2NAM02FT030.eop-nam02.prod.protection.outlook.com
 (2a01:111:f400:7e46::202) by BN6PR03CA0012.outlook.office365.com
 (2603:10b6:404:23::22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.1922.16 via Frontend
 Transport; Tue, 28 May 2019 07:39:47 +0000
Received-SPF: Pass (protection.outlook.com: domain of analog.com designates
 137.71.25.55 as permitted sender) receiver=protection.outlook.com;
 client-ip=137.71.25.55; helo=nwd2mta1.analog.com;
Received: from nwd2mta1.analog.com (137.71.25.55) by
 BL2NAM02FT030.mail.protection.outlook.com (10.152.77.172) with Microsoft SMTP
 Server (version=TLS1_0, cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.20.1922.16
 via Frontend Transport; Tue, 28 May 2019 07:39:46 +0000
Received: from NWD2HUBCAS7.ad.analog.com (nwd2hubcas7.ad.analog.com
 [10.64.69.107])
 by nwd2mta1.analog.com (8.13.8/8.13.8) with ESMTP id x4S7dkpQ023241
 (version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=OK);
 Tue, 28 May 2019 00:39:46 -0700
Received: from saturn.analog.com (10.50.1.244) by NWD2HUBCAS7.ad.analog.com
 (10.64.69.107) with Microsoft SMTP Server id 14.3.408.0; Tue, 28 May 2019
 03:39:45 -0400
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
Subject: [PATCH 1/3][V2] lib: fix match_string() helper on -1 array size
Date: Tue, 28 May 2019 10:39:30 +0300
Message-ID: <20190528073932.25365-1-alexandru.ardelean@analog.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190508112842.11654-1-alexandru.ardelean@analog.com>
References: <20190508112842.11654-1-alexandru.ardelean@analog.com>
MIME-Version: 1.0
X-ADIRoutedOnPrem: True
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:137.71.25.55; IPV:NLI; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(1496009)(376002)(396003)(39860400002)(136003)(346002)(2980300002)(54534003)(189003)(199004)(70586007)(70206006)(2441003)(8936002)(47776003)(7416002)(107886003)(316002)(2201001)(8676002)(14444005)(2906002)(2870700001)(86362001)(356004)(51416003)(6666004)(7696005)(26005)(305945005)(7636002)(1076003)(478600001)(36756003)(4326008)(110136005)(2616005)(126002)(44832011)(54906003)(76176011)(48376002)(486006)(476003)(106002)(50466002)(446003)(11346002)(186003)(50226002)(7406005)(426003)(336012)(53416004)(5660300002)(77096007)(246002)(921003)(1121003)(83996005)(2101003);
 DIR:OUT; SFP:1101; SCL:1; SRVR:BL2PR03MB545; H:nwd2mta1.analog.com; FPR:;
 SPF:Pass; LANG:en; PTR:nwd2mail10.analog.com; MX:1; A:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 6c76f02a-34d6-47de-ba0c-08d6e33fa89e
X-Microsoft-Antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(5600148)(711020)(4605104)(4709054)(1401327)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(2017052603328);
 SRVR:BL2PR03MB545; 
X-MS-TrafficTypeDiagnostic: BL2PR03MB545:
X-Microsoft-Antispam-PRVS: <BL2PR03MB545CA0A06BB0E64A1EFBE91F91E0@BL2PR03MB545.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;
X-Forefront-PRVS: 00514A2FE6
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Message-Info: WYQoPPTo42AknDYSpY9w/xftF7FT7SRtXtbzi4SohjgnHD5P3hVPp3WTmUFaLfcDpBMThORg4NphooGNDC9igOh5UCY+z/qJehstorHN6dXF0JXfvmEyhD606e1CCgn1vUccxto/xRVdXdjRcRHavbu1mYcyAlmvTmEDKuQrxdfC1Vrm8H9/tkgoumu/npzY4P0Eyoj1Hwx3z5/P2OctimPreVyglKaTNX/j7lM7XosmVhLrWYt/TLXycti79mDqjngT5xwxZMvszzx4GLzrMAGI+oe486mPjGQdr4mkGPORfalJMEV5ae4/UIaivCRaqH3nuCzPeZes99dzedzF7DJd9vUvbhN8XxbI4NVjhC5LKkww2k/x2hqF8pFkOcddaQzB5rfbyVzu+jJvUQ8J9ZT6v/eq/Une//VX7JZ43bw=
X-OriginatorOrg: analog.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 May 2019 07:39:46.9658 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6c76f02a-34d6-47de-ba0c-08d6e33fa89e
X-MS-Exchange-CrossTenant-Id: eaa689b4-8f87-40e0-9c6f-7228de4d754a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=eaa689b4-8f87-40e0-9c6f-7228de4d754a; Ip=[137.71.25.55];
 Helo=[nwd2mta1.analog.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL2PR03MB545
X-Mailman-Approved-At: Tue, 28 May 2019 17:13:51 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=analog.onmicrosoft.com; s=selector1-analog-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gWdImhCfyTIUCYzNfD1iIQYARnPSsxhTsT74g8CuXY0=;
 b=Hq4eM0+YUiVIoYHYAGGuEpOyjhWPdcPFHxn0lkng78s7kuN0jDXksfvZQE0kEOvNPTuar+4Cwfyt9c47tyog14C+ba401xryJ9s5hnJiPDekCnghCGKZj4HeQKs4EbPbnH2B4kKA0p9wn6It0lmbB4CJ95H2YYd7PUpoLM2vyVQ=
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
QGFuYWxvZy5jb20+Ci0tLQoKQ2hhbmdlbG9nIHYxIC0+IHYyOgoqIHNwbGl0IHRoZSBpbml0aWFs
IHNlcmllcyBpbnRvIGp1c3QgMyBwYXRjaGVzIHRoYXQgZml4IHRoZQogIGBtYXRjaF9zdHJpbmco
KWAgaGVscGVyIGFuZCBzdGFydCBpbnRyb2R1Y2luZyBhIG5ldyB2ZXJzaW9uIG9mIHRoaXMKICBo
ZWxwZXIsIHdoaWNoIGNvbXB1dGVzIGFycmF5LXNpemUgb2Ygc3RhdGljIGFycmF5cwoKIGxpYi9z
dHJpbmcuYyB8IDUgKysrKy0KIDEgZmlsZSBjaGFuZ2VkLCA0IGluc2VydGlvbnMoKyksIDEgZGVs
ZXRpb24oLSkKCmRpZmYgLS1naXQgYS9saWIvc3RyaW5nLmMgYi9saWIvc3RyaW5nLmMKaW5kZXgg
NjAxNmViM2FjNzNkLi5lMmNmNWFjYzgzYmQgMTAwNjQ0Ci0tLSBhL2xpYi9zdHJpbmcuYworKysg
Yi9saWIvc3RyaW5nLmMKQEAgLTY4MSw4ICs2ODEsMTEgQEAgaW50IG1hdGNoX3N0cmluZyhjb25z
dCBjaGFyICogY29uc3QgKmFycmF5LCBzaXplX3QgbiwgY29uc3QgY2hhciAqc3RyaW5nKQogCiAJ
Zm9yIChpbmRleCA9IDA7IGluZGV4IDwgbjsgaW5kZXgrKykgewogCQlpdGVtID0gYXJyYXlbaW5k
ZXhdOwotCQlpZiAoIWl0ZW0pCisJCWlmICghaXRlbSkgeworCQkJaWYgKG4gIT0gKHNpemVfdCkt
MSkKKwkJCQljb250aW51ZTsKIAkJCWJyZWFrOworCQl9CiAJCWlmICghc3RyY21wKGl0ZW0sIHN0
cmluZykpCiAJCQlyZXR1cm4gaW5kZXg7CiAJfQotLSAKMi4yMC4xCgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRy
aS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5v
cmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
