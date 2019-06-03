Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E43B932894
	for <lists+dri-devel@lfdr.de>; Mon,  3 Jun 2019 08:32:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7392E8969E;
	Mon,  3 Jun 2019 06:31:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR02-AM5-obe.outbound.protection.outlook.com
 (mail-am5eur02on060b.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:fe07::60b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EECBF8969E
 for <dri-devel@lists.freedesktop.org>; Mon,  3 Jun 2019 06:31:56 +0000 (UTC)
Received: from VI1PR08MB5488.eurprd08.prod.outlook.com (52.133.246.150) by
 VI1PR08MB4605.eurprd08.prod.outlook.com (20.178.13.139) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1943.17; Mon, 3 Jun 2019 06:31:54 +0000
Received: from VI1PR08MB5488.eurprd08.prod.outlook.com
 ([fe80::ada6:12ed:65d0:4629]) by VI1PR08MB5488.eurprd08.prod.outlook.com
 ([fe80::ada6:12ed:65d0:4629%4]) with mapi id 15.20.1922.025; Mon, 3 Jun 2019
 06:31:54 +0000
From: "Lowry Li (Arm Technology China)" <Lowry.Li@arm.com>
To: Liviu Dudau <Liviu.Dudau@arm.com>, "james qian wang (Arm Technology
 China)" <james.qian.wang@arm.com>, "maarten.lankhorst@linux.intel.com"
 <maarten.lankhorst@linux.intel.com>, "seanpaul@chromium.org"
 <seanpaul@chromium.org>, "airlied@linux.ie" <airlied@linux.ie>, Brian Starkey
 <Brian.Starkey@arm.com>
Subject: [PATCH v1 2/2] drm/komeda: Adds komeda_kms_drop_master
Thread-Topic: [PATCH v1 2/2] drm/komeda: Adds komeda_kms_drop_master
Thread-Index: AQHVGdYIJROjMKA2IkGllIHYR3H/0A==
Date: Mon, 3 Jun 2019 06:31:54 +0000
Message-ID: <1559543462-32264-3-git-send-email-lowry.li@arm.com>
References: <1559543462-32264-1-git-send-email-lowry.li@arm.com>
In-Reply-To: <1559543462-32264-1-git-send-email-lowry.li@arm.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [113.29.88.7]
x-clientproxiedby: HK0PR01CA0060.apcprd01.prod.exchangelabs.com
 (2603:1096:203:a6::24) To VI1PR08MB5488.eurprd08.prod.outlook.com
 (2603:10a6:803:137::22)
x-ms-exchange-messagesentrepresentingtype: 1
x-mailer: git-send-email 1.9.1
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: ce025073-05f2-4da8-7caa-08d6e7ed2b28
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(5600148)(711020)(4605104)(1401327)(4618075)(4534185)(7168020)(4627221)(201703031133081)(201702281549075)(8990200)(2017052603328)(7193020);
 SRVR:VI1PR08MB4605; 
x-ms-traffictypediagnostic: VI1PR08MB4605:
nodisclaimer: True
x-microsoft-antispam-prvs: <VI1PR08MB4605B0EDFDD1DA465F3431399F140@VI1PR08MB4605.eurprd08.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:67;
x-forefront-prvs: 0057EE387C
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(136003)(396003)(376002)(346002)(366004)(39860400002)(189003)(199004)(102836004)(6512007)(36756003)(110136005)(26005)(54906003)(486006)(256004)(386003)(186003)(14444005)(6506007)(99286004)(446003)(11346002)(55236004)(52116002)(66446008)(66476007)(53936002)(66946007)(64756008)(68736007)(4326008)(6636002)(2616005)(476003)(76176011)(73956011)(66556008)(86362001)(72206003)(14454004)(478600001)(25786009)(6486002)(5660300002)(50226002)(2906002)(8936002)(316002)(2501003)(81156014)(81166006)(66066001)(8676002)(7736002)(6436002)(6116002)(71200400001)(71190400001)(3846002)(305945005)(2201001);
 DIR:OUT; SFP:1101; SCL:1; SRVR:VI1PR08MB4605;
 H:VI1PR08MB5488.eurprd08.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: arm.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: O714nvBvVGfxVKj9xGJOtSM24yBtik+2Dv0SxCPWFlLEV8XwAmk1fFNz13evzm7z6D+B95OvEKDsC2BQC4TbFfjOzbbyUMGvjxw5bWg7n0JjmMXMAZERYzd2tgnKGniNt+SU6K3bN2aFDUoMcGAn2iiUg9hrQdFwuOxPEvbs2PDw9+PwjPnnSQtVk2KEQoiC0HIF+JLVM1Yt2aRxmfTB9Dm3qkX9HvOWFnPUIq1202zQMexba7hhQVSd6tIREVifSr/Idb9n5m3ljUY4dGkOK7QXHBemZ537rVcEW3Ff6ldcxph9yQPbWNRWnucFzq9hut0qRArwzddfIdMZH7so/q2XcYTeT6Ch2kTIRb0OPIytgRHbQMmmQaeuzGn6+TR3kNKmYuRZsNdGwJ7KGWJurhTn9TkbXhhkVEvCghYTA80=
MIME-Version: 1.0
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ce025073-05f2-4da8-7caa-08d6e7ed2b28
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Jun 2019 06:31:54.2096 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Lowry.Li@arm.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB4605
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=m9tozB7RgQ21imy9KivQaH+Savx9XekgE6jkQuEEJGk=;
 b=ZV8pK5q8Yairm7Oi9Nuek8pU4cUrji/dWCsyCF08u2pdlip326NwqJ0fUHlo/X96XA1auFXVAHw8v/Jb5tdvX0TJgiidPQJQeL5LAjStsidQWtAKpNoDgKiSRPivotzmu5ZkDEBHwyWaxCzaFB3fsoV94hWVe8NJ3DfprRspmP0=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Lowry.Li@arm.com; 
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
Cc: Ayan Halder <Ayan.Halder@arm.com>, "Jonathan Chai
 \(Arm Technology China\)" <Jonathan.Chai@arm.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "Julien Yin \(Arm Technology China\)" <Julien.Yin@arm.com>, nd <nd@arm.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

VGhlIGtvbWVkYSBpbnRlcm5hbCByZXNvdXJjZXMgKHBpcGVsaW5lcykgYXJlIHNoYXJlZCBiZXR3
ZWVuIGNydGNzLA0KYW5kIHJlc291cmNlcyByZWxlYXNlIGJ5IGRpc2FibGVfY3J0Yy4gVGhpcyBj
b21taXQgaXMgd29ya2luZyBmb3Igb25jZQ0KdXNlciBmb3Jnb3QgZGlzYWJsaW5nIGNydGMgbGlr
ZSBhcHAgcXVpdCBhYm5vbWFsbHksIGFuZCB0aGVuIHRoZQ0KcmVzb3VyY2VzIGNhbiBub3QgYmUg
dXNlZCBieSBhbm90aGVyIGNydGMuIEFkZHMgZHJvcF9tYXN0ZXIgdG8NCnNodXRkb3duIHRoZSBk
ZXZpY2UgYW5kIG1ha2Ugc3VyZSBhbGwgdGhlIGtvbWVkYSByZXNvdXJjZXMgaGF2ZSBiZWVuDQpy
ZWxlYXNlZCBhbmQgY2FuIGJlIHVzZWQgZm9yIHRoZSBuZXh0IHVzYWdlLg0KDQpTaWduZWQtb2Zm
LWJ5OiBMb3dyeSBMaSAoQXJtIFRlY2hub2xvZ3kgQ2hpbmEpIDxsb3dyeS5saUBhcm0uY29tPg0K
LS0tDQogZHJpdmVycy9ncHUvZHJtL2FybS9kaXNwbGF5L2tvbWVkYS9rb21lZGFfa21zLmMgfCAx
MyArKysrKysrKysrKysrDQogMSBmaWxlIGNoYW5nZWQsIDEzIGluc2VydGlvbnMoKykNCg0KZGlm
ZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hcm0vZGlzcGxheS9rb21lZGEva29tZWRhX2ttcy5j
IGIvZHJpdmVycy9ncHUvZHJtL2FybS9kaXNwbGF5L2tvbWVkYS9rb21lZGFfa21zLmMNCmluZGV4
IDg1NDM4NjAuLjY0N2JjZTUgMTAwNjQ0DQotLS0gYS9kcml2ZXJzL2dwdS9kcm0vYXJtL2Rpc3Bs
YXkva29tZWRhL2tvbWVkYV9rbXMuYw0KKysrIGIvZHJpdmVycy9ncHUvZHJtL2FybS9kaXNwbGF5
L2tvbWVkYS9rb21lZGFfa21zLmMNCkBAIC01NCwxMSArNTQsMjQgQEAgc3RhdGljIGlycXJldHVy
bl90IGtvbWVkYV9rbXNfaXJxX2hhbmRsZXIoaW50IGlycSwgdm9pZCAqZGF0YSkNCiAJcmV0dXJu
IHN0YXR1czsNCiB9DQogDQorLyogS29tZWRhIGludGVybmFsIHJlc291cmNlcyAocGlwZWxpbmVz
KSBhcmUgc2hhcmVkIGJldHdlZW4gY3J0Y3MsIGFuZCByZXNvdXJjZXMNCisgKiBhcmUgcmVsZWFz
ZWQgYnkgZGlzYWJsZV9jcnRjLiBCdXQgaWYgdXNlciBmb3JnZXQgZGlzYWJsaW5nIGNydGMgbGlr
ZSBhcHAgcXVpdA0KKyAqIGFibm9ybWFsbHksIHRoZSByZXNvdXJjZXMgY2FuIG5vdCBiZSB1c2Vk
IGJ5IGFub3RoZXIgY3J0Yy4NCisgKiBVc2UgZHJvcF9tYXN0ZXIgdG8gc2h1dGRvd24gdGhlIGRl
dmljZSBhbmQgbWFrZSBzdXJlIGFsbCB0aGUga29tZWRhIHJlc291cmNlcw0KKyAqIGhhdmUgYmVl
biByZWxlYXNlZCwgYW5kIGNhbiBiZSB1c2VkIGZvciB0aGUgbmV4dCB1c2FnZS4NCisgKi8NCitz
dGF0aWMgdm9pZCBrb21lZGFfa21zX2Ryb3BfbWFzdGVyKHN0cnVjdCBkcm1fZGV2aWNlICpkZXYs
DQorCQkJCSAgIHN0cnVjdCBkcm1fZmlsZSAqZmlsZV9wcml2KQ0KK3sNCisJZHJtX2F0b21pY19o
ZWxwZXJfc2h1dGRvd24oZGV2KTsNCit9DQorDQogc3RhdGljIHN0cnVjdCBkcm1fZHJpdmVyIGtv
bWVkYV9rbXNfZHJpdmVyID0gew0KIAkuZHJpdmVyX2ZlYXR1cmVzID0gRFJJVkVSX0dFTSB8IERS
SVZFUl9NT0RFU0VUIHwgRFJJVkVSX0FUT01JQyB8DQogCQkJICAgRFJJVkVSX1BSSU1FIHwgRFJJ
VkVSX0hBVkVfSVJRLA0KIAkubGFzdGNsb3NlCQkJPSBkcm1fZmJfaGVscGVyX2xhc3RjbG9zZSwN
CiAJLmlycV9oYW5kbGVyCQkJPSBrb21lZGFfa21zX2lycV9oYW5kbGVyLA0KKwkubWFzdGVyX2Ry
b3AJCQk9IGtvbWVkYV9rbXNfZHJvcF9tYXN0ZXIsDQogCS5nZW1fZnJlZV9vYmplY3RfdW5sb2Nr
ZWQJPSBkcm1fZ2VtX2NtYV9mcmVlX29iamVjdCwNCiAJLmdlbV92bV9vcHMJCQk9ICZkcm1fZ2Vt
X2NtYV92bV9vcHMsDQogCS5kdW1iX2NyZWF0ZQkJCT0ga29tZWRhX2dlbV9jbWFfZHVtYl9jcmVh
dGUsDQotLSANCjEuOS4xDQoNCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNr
dG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2Ry
aS1kZXZlbA==
