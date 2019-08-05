Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A678F81604
	for <lists+dri-devel@lfdr.de>; Mon,  5 Aug 2019 11:56:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2ABC689FD7;
	Mon,  5 Aug 2019 09:56:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR03-DB5-obe.outbound.protection.outlook.com
 (mail-eopbgr40080.outbound.protection.outlook.com [40.107.4.80])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 251B589FE3
 for <dri-devel@lists.freedesktop.org>; Mon,  5 Aug 2019 09:56:29 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kH8k9twMi6+Oz14N9HstgRNhtqyTnMRp5FY5jSuKtkTJYxZ+qcHEAAamXsndgLGPgsystwR7BAoz9ZAr3UOyJ+BX8eaR1GEYLSzv7/NICZGVdx8o+e3fCaoO3xVgCPf/G9s5fEN24HhGi3RA4x5f0THUI+MEFdzgaPWN85lZUFMGuzKMOnu2EpnJp3iRmBHH3/ol1zoXrNu5URKrpVJder/QBiQCLQflQEjDAnQ8itofg87tzHvHPZyM6oZHUYg++rCdslz8rpnO/0nnLz96nj1BmrCauqNwo38KwUsXJ2Za5ijwi18wpP2TA+djMgJb60gr+wy+xYlCLKSbbUgnqA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KYmHpOdBnxlo8kd7/TxtexcAA5eNVC3SBvfBgi9kQ5k=;
 b=jlnendJmqSdTObL75mUYfkkdfzaMdrbAKSZHU9fh0dast9eXth47PUSjYmiDjMJ8PWB7pOim8DTk43H8Sc9KrR2KZDGsbGx7dYFi/nja3SMO8zNe8RKZCRPggooidTjErgXfAz0NteQGRkc0/HEdRw4cjD9X4Qxs097HIBuucEhGlU+FYLD/WmDdwN56kWVHnskn2JRSoVu/eb2Q0Fev/QKR/5l/PVqTBDgPah9TE8pk0z4NX8HdSwA7FvS8HLWDJ2nkf7loe+y2EaLv1ayvFXWA36chMkjjA1rSTA32gOXclHLMGQi8BJcdRRPmj2Yt3MndHwzg8oAFXHTg2E2UgA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=pass
 smtp.mailfrom=arm.com;dmarc=pass action=none header.from=arm.com;dkim=pass
 header.d=arm.com;arc=none
Received: from VI1PR08MB4078.eurprd08.prod.outlook.com (20.178.127.92) by
 VI1PR08MB3520.eurprd08.prod.outlook.com (20.177.61.15) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2136.16; Mon, 5 Aug 2019 09:56:26 +0000
Received: from VI1PR08MB4078.eurprd08.prod.outlook.com
 ([fe80::c8dd:d1c6:5044:a888]) by VI1PR08MB4078.eurprd08.prod.outlook.com
 ([fe80::c8dd:d1c6:5044:a888%3]) with mapi id 15.20.2115.005; Mon, 5 Aug 2019
 09:56:26 +0000
From: Mihail Atanassov <Mihail.Atanassov@arm.com>
To: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Subject: [PATCH v2.1] drm/komeda: Add support for 'memory-region' DT node
 property
Thread-Topic: [PATCH v2.1] drm/komeda: Add support for 'memory-region' DT node
 property
Thread-Index: AQHVS3QL8/BEL0aPM0GZk8WnOetY0A==
Date: Mon, 5 Aug 2019 09:56:25 +0000
Message-ID: <20190805095408.21285-1-mihail.atanassov@arm.com>
References: <20190802143951.4436-1-mihail.atanassov@arm.com>
In-Reply-To: <20190802143951.4436-1-mihail.atanassov@arm.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [217.140.106.52]
x-clientproxiedby: LO2P265CA0355.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:d::31) To VI1PR08MB4078.eurprd08.prod.outlook.com
 (2603:10a6:803:e5::28)
x-mailer: git-send-email 2.22.0
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 0bb7521e-47f2-4a8e-6565-08d7198b2dda
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:VI1PR08MB3520; 
x-ms-traffictypediagnostic: VI1PR08MB3520:
x-microsoft-antispam-prvs: <VI1PR08MB35207BB248A0BC66CDB86E9D8FDA0@VI1PR08MB3520.eurprd08.prod.outlook.com>
nodisclaimer: True
x-ms-oob-tlc-oobclassifiers: OLM:243;
x-forefront-prvs: 01208B1E18
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(366004)(396003)(39860400002)(136003)(376002)(346002)(199004)(189003)(50226002)(71200400001)(8936002)(53936002)(478600001)(316002)(3846002)(6116002)(54906003)(6436002)(6486002)(25786009)(186003)(14454004)(66066001)(6512007)(26005)(4326008)(36756003)(2501003)(66476007)(66946007)(66446008)(64756008)(66556008)(446003)(11346002)(2616005)(81166006)(99286004)(81156014)(6916009)(5660300002)(5640700003)(2906002)(256004)(44832011)(68736007)(486006)(1076003)(7736002)(52116002)(102836004)(86362001)(71190400001)(305945005)(2351001)(76176011)(6506007)(386003)(8676002)(476003);
 DIR:OUT; SFP:1101; SCL:1; SRVR:VI1PR08MB3520;
 H:VI1PR08MB4078.eurprd08.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: arm.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: RhN4YHyJmkcq/NQ9RoQvwuAhdsoJhKLPDlsrcka//lqCXtzoqfJr3v/cxxkt1L2Z310MgOkvzXRXT4x0B0SqP2ll0/Y+VdP3EqtAZ5Fki1/inrbBbgrSMPrKww32XnmT96KdzfiBO4u7SMUXWTxT8+f762+0evNRcnmcZmLnhOs5dBCx9WqkVi8g+SrvyawHLrsei0x9hSa5kCBLC5k3zgTx/VVG2qj/56KajnodfEg9rbQqQPCrJsrNH1BMPXUYwew9IPDu63qFTmNPGbxEC0NZDWUpcBMV2gJS5J2w2g1Q5JRyjLThzYMXJ+VjYRUIoBPVbcodEIEWh8Sc9AJnjUeUikwxqCdo7UTz8WFHOXIcuBuLbIb1L1MEzFHFS+tM7TuVkjUr25svBCr26eJqTaaNrw5oAnbI7LbwnSUmiGc=
MIME-Version: 1.0
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0bb7521e-47f2-4a8e-6565-08d7198b2dda
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Aug 2019 09:56:25.9448 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Mihail.Atanassov@arm.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB3520
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KYmHpOdBnxlo8kd7/TxtexcAA5eNVC3SBvfBgi9kQ5k=;
 b=m1aXVE0BYUIRGBrzj2N8VQLQ9Vsaj7QK1e3Iaz8iuc97Go+I1pJZnaylNIXEzQs/OatxFDxhK1rwe7jm6vnJl5aF7Kelr8wPfc6QI9GAtoooTpqV9lj3vOUCO4YYkwDT2LbThx76pdMH7wK+V4Z56xFWmQarY1zomzLE00UjD5M=
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
Cc: Mihail Atanassov <Mihail.Atanassov@arm.com>,
 David Airlie <airlied@linux.ie>, Liviu Dudau <Liviu.Dudau@arm.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "james qian
 wang \(Arm Technology China\)" <james.qian.wang@arm.com>, nd <nd@arm.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

VGhlICdtZW1vcnktcmVnaW9uJyBwcm9wZXJ0eSBvZiB0aGUga29tZWRhIGRpc3BsYXkgZHJpdmVy
IERUIGJpbmRpbmcKYWxsb3dzIHRoZSB1c2Ugb2YgYSAncmVzZXJ2ZWQtbWVtb3J5JyBub2RlIGZv
ciBidWZmZXIgYWxsb2NhdGlvbnMuIEFkZAp0aGUgcmVxdWlzaXRlIG9mX3Jlc2VydmVkX21lbV9k
ZXZpY2Vfe2luaXQscmVsZWFzZX0gY2FsbHMgdG8gYWN0dWFsbHkKbWFrZSB1c2Ugb2YgdGhlIG1l
bW9yeSBpZiBwcmVzZW50LgoKQ2hhbmdlcyBzaW5jZSB2MToKIC0gTW92ZSBoYW5kbGluZyBpbnNp
ZGUga29tZWRhX3BhcnNlX2R0CgpTaWduZWQtb2ZmLWJ5OiBNaWhhaWwgQXRhbmFzc292IDxtaWhh
aWwuYXRhbmFzc292QGFybS5jb20+Ci0tLQogZHJpdmVycy9ncHUvZHJtL2FybS9kaXNwbGF5L2tv
bWVkYS9rb21lZGFfZGV2LmMgfCA5ICsrKysrKysrKwogMSBmaWxlIGNoYW5nZWQsIDkgaW5zZXJ0
aW9ucygrKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hcm0vZGlzcGxheS9rb21lZGEv
a29tZWRhX2Rldi5jIGIvZHJpdmVycy9ncHUvZHJtL2FybS9kaXNwbGF5L2tvbWVkYS9rb21lZGFf
ZGV2LmMKaW5kZXggMWZmN2Y0YjJjNjIwLi4wMTQyZWU5OTE5NTcgMTAwNjQ0Ci0tLSBhL2RyaXZl
cnMvZ3B1L2RybS9hcm0vZGlzcGxheS9rb21lZGEva29tZWRhX2Rldi5jCisrKyBiL2RyaXZlcnMv
Z3B1L2RybS9hcm0vZGlzcGxheS9rb21lZGEva29tZWRhX2Rldi5jCkBAIC04LDYgKzgsNyBAQAog
I2luY2x1ZGUgPGxpbnV4L2lvbW11Lmg+CiAjaW5jbHVkZSA8bGludXgvb2ZfZGV2aWNlLmg+CiAj
aW5jbHVkZSA8bGludXgvb2ZfZ3JhcGguaD4KKyNpbmNsdWRlIDxsaW51eC9vZl9yZXNlcnZlZF9t
ZW0uaD4KICNpbmNsdWRlIDxsaW51eC9wbGF0Zm9ybV9kZXZpY2UuaD4KICNpbmNsdWRlIDxsaW51
eC9kbWEtbWFwcGluZy5oPgogI2lmZGVmIENPTkZJR19ERUJVR19GUwpAQCAtMTQ2LDYgKzE0Nywx
MiBAQCBzdGF0aWMgaW50IGtvbWVkYV9wYXJzZV9kdChzdHJ1Y3QgZGV2aWNlICpkZXYsIHN0cnVj
dCBrb21lZGFfZGV2ICptZGV2KQogCQlyZXR1cm4gbWRldi0+aXJxOwogCX0KIAorCS8qIEdldCB0
aGUgb3B0aW9uYWwgZnJhbWVidWZmZXIgbWVtb3J5IHJlc291cmNlICovCisJcmV0ID0gb2ZfcmVz
ZXJ2ZWRfbWVtX2RldmljZV9pbml0KGRldik7CisJaWYgKHJldCAmJiByZXQgIT0gLUVOT0RFVikK
KwkJcmV0dXJuIHJldDsKKwlyZXQgPSAwOworCiAJZm9yX2VhY2hfYXZhaWxhYmxlX2NoaWxkX29m
X25vZGUobnAsIGNoaWxkKSB7CiAJCWlmIChvZl9ub2RlX2NtcChjaGlsZC0+bmFtZSwgInBpcGVs
aW5lIikgPT0gMCkgewogCQkJcmV0ID0ga29tZWRhX3BhcnNlX3BpcGVfZHQobWRldiwgY2hpbGQp
OwpAQCAtMjkyLDYgKzI5OSw4IEBAIHZvaWQga29tZWRhX2Rldl9kZXN0cm95KHN0cnVjdCBrb21l
ZGFfZGV2ICptZGV2KQogCiAJbWRldi0+bl9waXBlbGluZXMgPSAwOwogCisJb2ZfcmVzZXJ2ZWRf
bWVtX2RldmljZV9yZWxlYXNlKGRldik7CisKIAlpZiAoZnVuY3MgJiYgZnVuY3MtPmNsZWFudXAp
CiAJCWZ1bmNzLT5jbGVhbnVwKG1kZXYpOwogCi0tIAoyLjIyLjAKCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJp
LWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
