Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 646827FC68
	for <lists+dri-devel@lfdr.de>; Fri,  2 Aug 2019 16:40:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 53AAE6EE86;
	Fri,  2 Aug 2019 14:40:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR03-DB5-obe.outbound.protection.outlook.com
 (mail-eopbgr40050.outbound.protection.outlook.com [40.107.4.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 256CD6EE86
 for <dri-devel@lists.freedesktop.org>; Fri,  2 Aug 2019 14:40:22 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bLFB/iS2fVIEt72V6gkZDDDhIv32XMCnv8dyiHw6rjXLksbVdB5UPCirv7AbX1zC9s88yan8TZNfGzsx3Rm1pLMUqBTd4tt4DVfxEBzcYdy4Pg6LPDcmOwtBx/u86/RJoDTnjqAXIjq0P7Lfs0Bm0v6nSLH9qQR2wIaAXsVCYAkvCffkQvjBKdzH+UnxYuZ3tvsj6Em1dkFKWKb4ms6mnvyAYkNQ6aJJC2Qf52x3Db/z8V+06GgYAQC1HBgbmIqhO0S6/MWoPgaBUzhyYy34oqWyGvpAioQsrZClkGQMY0zgOtWZGMjl3GoGwis1rqfUc4tm9X/rF6xNbEsVE/+Xdg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pKflRdF3ZHOj+Fw+e8VmHrkQct3AZoD+12aEAYJ/TZU=;
 b=eUNMvorqYhmG3GVpdmBy4xQKm6Lb8XRSFlqC0Y9NVFhwu8eRD6K0XyERJixJpE12/3EWLSjz8MMdl29QcA1mH2xMvXbYCYuZ5/Gu2GpIqdKrn/qDuY/AIf6YjGzEweCvcbdYC1ZKWuYK6dWxKlbLe3mzi/M6X8kFYrTz/sRZCpFAxxObt+eJpIqgsSo/4tI/0WFbynTu49n36PVk7s5zer1SnKIsaLDx22rxOYEKEzRljIyVzj8GZYHM/Aow3R+3qzRNzS+o/N0EqdVa+RqHdoiEW75JCYzwQptGjgmOxgMKOPqhLoeqXuwStz/IWyX9/pth2RuatxPNw3ip2r7nAw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=pass
 smtp.mailfrom=arm.com;dmarc=pass action=none header.from=arm.com;dkim=pass
 header.d=arm.com;arc=none
Received: from VI1PR08MB4078.eurprd08.prod.outlook.com (20.178.127.92) by
 VI1PR08MB2878.eurprd08.prod.outlook.com (10.170.239.146) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2136.17; Fri, 2 Aug 2019 14:40:19 +0000
Received: from VI1PR08MB4078.eurprd08.prod.outlook.com
 ([fe80::c8dd:d1c6:5044:a888]) by VI1PR08MB4078.eurprd08.prod.outlook.com
 ([fe80::c8dd:d1c6:5044:a888%3]) with mapi id 15.20.2115.005; Fri, 2 Aug 2019
 14:40:19 +0000
From: Mihail Atanassov <Mihail.Atanassov@arm.com>
To: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Subject: [PATCH] drm/komeda: Add support for 'memory-region' DT node property
Thread-Topic: [PATCH] drm/komeda: Add support for 'memory-region' DT node
 property
Thread-Index: AQHVSUA0/7/jB3Z3jkicHuuMk5vdZA==
Date: Fri, 2 Aug 2019 14:40:19 +0000
Message-ID: <20190802143951.4436-1-mihail.atanassov@arm.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [217.140.106.52]
x-clientproxiedby: LNXP265CA0068.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:5d::32) To VI1PR08MB4078.eurprd08.prod.outlook.com
 (2603:10a6:803:e5::28)
x-mailer: git-send-email 2.22.0
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: c5b891fc-7b5a-413a-aca3-08d71757575c
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:VI1PR08MB2878; 
x-ms-traffictypediagnostic: VI1PR08MB2878:
x-microsoft-antispam-prvs: <VI1PR08MB2878110CB4C45BAA212E6EAF8FD90@VI1PR08MB2878.eurprd08.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:357;
x-forefront-prvs: 011787B9DD
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(136003)(376002)(39860400002)(346002)(396003)(366004)(40434004)(189003)(199004)(3846002)(6116002)(68736007)(2906002)(2501003)(256004)(5024004)(86362001)(14444005)(6436002)(6486002)(6916009)(5640700003)(25786009)(1076003)(4326008)(478600001)(5660300002)(44832011)(71190400001)(102836004)(6512007)(305945005)(71200400001)(2616005)(54906003)(2351001)(53936002)(7736002)(386003)(6506007)(476003)(66946007)(66066001)(52116002)(186003)(316002)(50226002)(81156014)(81166006)(8676002)(26005)(66476007)(66556008)(64756008)(66446008)(486006)(36756003)(99286004)(14454004)(8936002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:VI1PR08MB2878;
 H:VI1PR08MB4078.eurprd08.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: arm.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: ChCoQwDvNMJhJ2ED1KsDY5J3/XR5CB1OPT4Amn7fOxAOs4CLkzW7zHbreS/VdWOzxTV9U6b0A21eBtP3kGWA4FVNbQSkb2UaIPCaOwk9QedJVdiAGdvxB1rD2JtqtJp2In3xLAc5vXTX1wl5q3lDuPWDFVSuVWkY24D7bx3SmdbL4ByAuf42EfOJ7yZFiWzn1rffr/tClQc1BP4oZaSJT1kP1sxNNDAm+9l/g7/hnIY5Y6EUDTU543QRbRGtNMlgBqpnY4ozkQnMq2vnlud0PwaUs5/APtygdh+ERzOMbzLza9cppRyc9sptwidYh44I/fglMa43ccFKJJCSl/nGdcVwI/ucGCxlMG8ISJSHE9KWpchkFkX7rGAZ0CpoGd1JDevCnwvb7MJrT5MrIni6ZCauoyx43DqLgyxvoCjjEuk=
MIME-Version: 1.0
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c5b891fc-7b5a-413a-aca3-08d71757575c
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Aug 2019 14:40:19.3438 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Mihail.Atanassov@arm.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB2878
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pKflRdF3ZHOj+Fw+e8VmHrkQct3AZoD+12aEAYJ/TZU=;
 b=zrtVrD9cNmRY3nO/rJ+Z6IpAPLgak3Hlxg3aN7W1Pc4dMDKWmbw6TQZ6kBqY4EHhHe5I4kHf5bs0VG0WcsoZIPTBo/D6sUCIYf02Q5bYFRqjFXwhR2TlBz6+s+ljaBQyYblH81q6XhST2T4BTKsh6R4O+S4u6CxSRLOuXuO8z6U=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Mihail.Atanassov@arm.com; 
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
Cc: David Airlie <airlied@linux.ie>, Liviu Dudau <Liviu.Dudau@arm.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "james qian wang \(Arm Technology China\)" <james.qian.wang@arm.com>,
 Mihail Atanassov <Mihail.Atanassov@arm.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

VGhlICdtZW1vcnktcmVnaW9uJyBwcm9wZXJ0eSBvZiB0aGUga29tZWRhIGRpc3BsYXkgZHJpdmVy
IERUIGJpbmRpbmcKYWxsb3dzIHRoZSB1c2Ugb2YgYSAncmVzZXJ2ZWQtbWVtb3J5JyBub2RlIGZv
ciBidWZmZXIgYWxsb2NhdGlvbnMuIEFkZAp0aGUgcmVxdWlzaXRlIG9mX3Jlc2VydmVkX21lbV9k
ZXZpY2Vfe2luaXQscmVsZWFzZX0gY2FsbHMgdG8gYWN0dWFsbHkKbWFrZSB1c2Ugb2YgdGhlIG1l
bW9yeSBpZiBwcmVzZW50LgoKU2lnbmVkLW9mZi1ieTogTWloYWlsIEF0YW5hc3NvdiA8bWloYWls
LmF0YW5hc3NvdkBhcm0uY29tPgotLS0KIGRyaXZlcnMvZ3B1L2RybS9hcm0vZGlzcGxheS9rb21l
ZGEva29tZWRhX2Rydi5jIHwgNyArKysrKysrCiAxIGZpbGUgY2hhbmdlZCwgNyBpbnNlcnRpb25z
KCspCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FybS9kaXNwbGF5L2tvbWVkYS9rb21l
ZGFfZHJ2LmMgYi9kcml2ZXJzL2dwdS9kcm0vYXJtL2Rpc3BsYXkva29tZWRhL2tvbWVkYV9kcnYu
YwppbmRleCBjZmE1MDY4ZDlkMWUuLjJlYzg3N2FkMjYwYSAxMDA2NDQKLS0tIGEvZHJpdmVycy9n
cHUvZHJtL2FybS9kaXNwbGF5L2tvbWVkYS9rb21lZGFfZHJ2LmMKKysrIGIvZHJpdmVycy9ncHUv
ZHJtL2FybS9kaXNwbGF5L2tvbWVkYS9rb21lZGFfZHJ2LmMKQEAgLTYsNiArNiw3IEBACiAgKi8K
ICNpbmNsdWRlIDxsaW51eC9tb2R1bGUuaD4KICNpbmNsdWRlIDxsaW51eC9rZXJuZWwuaD4KKyNp
bmNsdWRlIDxsaW51eC9vZl9yZXNlcnZlZF9tZW0uaD4KICNpbmNsdWRlIDxsaW51eC9wbGF0Zm9y
bV9kZXZpY2UuaD4KICNpbmNsdWRlIDxsaW51eC9jb21wb25lbnQuaD4KICNpbmNsdWRlIDxkcm0v
ZHJtX29mLmg+CkBAIC0zMiw2ICszMyw3IEBAIHN0YXRpYyB2b2lkIGtvbWVkYV91bmJpbmQoc3Ry
dWN0IGRldmljZSAqZGV2KQogcmV0dXJuOwoKIGtvbWVkYV9rbXNfZGV0YWNoKG1kcnYtPmttcyk7
CitvZl9yZXNlcnZlZF9tZW1fZGV2aWNlX3JlbGVhc2UoZGV2KTsKIGtvbWVkYV9kZXZfZGVzdHJv
eShtZHJ2LT5tZGV2KTsKCiBkZXZfc2V0X2RydmRhdGEoZGV2LCBOVUxMKTsKQEAgLTUzLDYgKzU1
LDExIEBAIHN0YXRpYyBpbnQga29tZWRhX2JpbmQoc3RydWN0IGRldmljZSAqZGV2KQogZ290byBm
cmVlX21kcnY7CiB9CgorLyogR2V0IHRoZSBvcHRpb25hbCBmcmFtZWJ1ZmZlciBtZW1vcnkgcmVz
b3VyY2UgKi8KK2VyciA9IG9mX3Jlc2VydmVkX21lbV9kZXZpY2VfaW5pdChkZXYpOworaWYgKGVy
ciAmJiBlcnIgIT0gLUVOT0RFVikKK2dvdG8gZGVzdHJveV9tZGV2OworCiBtZHJ2LT5rbXMgPSBr
b21lZGFfa21zX2F0dGFjaChtZHJ2LT5tZGV2KTsKIGlmIChJU19FUlIobWRydi0+a21zKSkgewog
ZXJyID0gUFRSX0VSUihtZHJ2LT5rbXMpOwotLQoyLjIyLjAKCklNUE9SVEFOVCBOT1RJQ0U6IFRo
ZSBjb250ZW50cyBvZiB0aGlzIGVtYWlsIGFuZCBhbnkgYXR0YWNobWVudHMgYXJlIGNvbmZpZGVu
dGlhbCBhbmQgbWF5IGFsc28gYmUgcHJpdmlsZWdlZC4gSWYgeW91IGFyZSBub3QgdGhlIGludGVu
ZGVkIHJlY2lwaWVudCwgcGxlYXNlIG5vdGlmeSB0aGUgc2VuZGVyIGltbWVkaWF0ZWx5IGFuZCBk
byBub3QgZGlzY2xvc2UgdGhlIGNvbnRlbnRzIHRvIGFueSBvdGhlciBwZXJzb24sIHVzZSBpdCBm
b3IgYW55IHB1cnBvc2UsIG9yIHN0b3JlIG9yIGNvcHkgdGhlIGluZm9ybWF0aW9uIGluIGFueSBt
ZWRpdW0uIFRoYW5rIHlvdS4KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0
b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJp
LWRldmVs
