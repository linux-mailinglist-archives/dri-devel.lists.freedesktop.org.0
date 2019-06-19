Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E22584B336
	for <lists+dri-devel@lfdr.de>; Wed, 19 Jun 2019 09:42:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0A3266E30F;
	Wed, 19 Jun 2019 07:42:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-eopbgr80075.outbound.protection.outlook.com [40.107.8.75])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 532CC6E30F
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Jun 2019 07:42:49 +0000 (UTC)
Received: from VE1PR08MB5006.eurprd08.prod.outlook.com (10.255.159.31) by
 VE1PR08MB4862.eurprd08.prod.outlook.com (10.255.113.140) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1987.12; Wed, 19 Jun 2019 07:42:45 +0000
Received: from VE1PR08MB5006.eurprd08.prod.outlook.com
 ([fe80::206b:5cf6:97e:1358]) by VE1PR08MB5006.eurprd08.prod.outlook.com
 ([fe80::206b:5cf6:97e:1358%7]) with mapi id 15.20.1987.014; Wed, 19 Jun 2019
 07:42:45 +0000
From: "james qian wang (Arm Technology China)" <james.qian.wang@arm.com>
To: Liviu Dudau <Liviu.Dudau@arm.com>, "airlied@linux.ie" <airlied@linux.ie>, 
 Brian Starkey <Brian.Starkey@arm.com>, "maarten.lankhorst@linux.intel.com"
 <maarten.lankhorst@linux.intel.com>, "sean@poorly.run" <sean@poorly.run>, 
 "arnd@arndb.de" <arnd@arndb.de>
Subject: [PATCH] drm/komeda: Correct printk format specifier for "size_t"
Thread-Topic: [PATCH] drm/komeda: Correct printk format specifier for "size_t"
Thread-Index: AQHVJnKVyoEvbn4ar0KHP3NUwbidVQ==
Date: Wed, 19 Jun 2019 07:42:45 +0000
Message-ID: <20190619074225.13521-1-james.qian.wang@arm.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [113.29.88.7]
x-clientproxiedby: HK2PR02CA0188.apcprd02.prod.outlook.com
 (2603:1096:201:21::24) To VE1PR08MB5006.eurprd08.prod.outlook.com
 (2603:10a6:803:113::31)
x-ms-exchange-messagesentrepresentingtype: 1
x-mailer: git-send-email 2.17.1
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 31649ace-e81a-48c3-e91e-08d6f489b7e0
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(7168020)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:VE1PR08MB4862; 
x-ms-traffictypediagnostic: VE1PR08MB4862:
nodisclaimer: True
x-microsoft-antispam-prvs: <VE1PR08MB48625D8D735B81B72849AA16B3E50@VE1PR08MB4862.eurprd08.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:6430;
x-forefront-prvs: 0073BFEF03
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(346002)(376002)(366004)(39860400002)(136003)(396003)(199004)(189003)(66556008)(26005)(6436002)(8676002)(81166006)(103116003)(14454004)(81156014)(50226002)(6486002)(55236004)(6506007)(2201001)(53936002)(186003)(86362001)(5660300002)(6116002)(1076003)(386003)(2906002)(3846002)(256004)(64756008)(110136005)(6512007)(8936002)(66476007)(478600001)(2501003)(73956011)(36756003)(66446008)(68736007)(54906003)(99286004)(102836004)(7736002)(71190400001)(52116002)(66066001)(71200400001)(2616005)(476003)(486006)(305945005)(25786009)(4326008)(66946007)(316002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:VE1PR08MB4862;
 H:VE1PR08MB5006.eurprd08.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: arm.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: +9icAsqMqSz5oj2fToXIeXKjzBC1G73uc8AUhaKlrjuErS0cBvF9/8sKDkOKHcoQiZTHmXOM+lNdAFzI/WP52EoEe9Q0yg9S2jumj1ylHlyP+VbibvzI4ywvucshcIhbHVj5N8D/d5TzoEGuwXYOh7l/euQN9zIFH1Q0op+SAgZM0PUCNAVVmuBi3OqFbum08+NU44kxrhtdI3i5i/l8OGlpiGmYruNVwV3NgIetyVCA1YvRHPcPEouIAS8b7tNFqlMASq+nHIix0+jBBPOko6V97Zk80eu1/rtpNb0ukQNr/mru/++N+uO+jH7uTXewcehSzBcFHuF246gUm5k0RyBbj3xmhp+vaVtO4LnXQBDlcKZAMAbu9OSVMR5CzPH8/Czfzs2OpXX3OvUqktwUU5CE59nHd9dxvmd0hhAm+ao=
MIME-Version: 1.0
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 31649ace-e81a-48c3-e91e-08d6f489b7e0
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Jun 2019 07:42:45.5829 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: james.qian.wang@arm.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR08MB4862
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=peQSzoDWwW9i55UHswzIecsFCoN+YXX8Y3FXqQN8ryk=;
 b=xnKt3ae7N2xCjzHO6pIlysXCiuSZIhEmBA8vgyFZb9OQa7JhzxftQJFxM5O+qd5/wuh6n+rRnaUIf1BcXxLfnVsx2iHtSRl4hjEYw0eiWxxnhXsFw+QPXRTU+w7TwVkj2qiSNxnUfPQEgjeTlroKCzyw2EcnY2QHl1Cd/dGEJas=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=james.qian.wang@arm.com; 
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
Cc: nd <nd@arm.com>, Ayan Halder <Ayan.Halder@arm.com>, "Oscar
 Zhang \(Arm Technology China\)" <Oscar.Zhang@arm.com>, "Tiannan Zhu \(Arm
 Technology China\)" <Tiannan.Zhu@arm.com>,
 "Jonathan Chai \(Arm Technology China\)" <Jonathan.Chai@arm.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, "Julien
 Yin \(Arm Technology China\)" <Julien.Yin@arm.com>, "Channing Chen \(Arm
 Technology China\)" <Channing.Chen@arm.com>, "james qian wang \(Arm Technology
 China\)" <james.qian.wang@arm.com>,
 "Yiqi Kang \(Arm Technology China\)" <Yiqi.Kang@arm.com>,
 "thomas Sun \(Arm Technology China\)" <thomas.Sun@arm.com>,
 "Lowry Li \(Arm Technology China\)" <Lowry.Li@arm.com>,
 Ben Davis <Ben.Davis@arm.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

V2FybmluZ3MgcG9wdXAgd2hlbiAibWFrZSBBUkNIPWkzODYiDQoNCkluIGZpbGUgaW5jbHVkZWQg
ZnJvbSBpbmNsdWRlL2RybS9kcm1fbW0uaDo0OSwNCiAgICAgICAgICAgICAgICAgZnJvbSBpbmNs
dWRlL2RybS9kcm1fdm1hX21hbmFnZXIuaDoyNiwNCiAgICAgICAgICAgICAgICAgZnJvbSBpbmNs
dWRlL2RybS9kcm1fZ2VtLmg6NDAsDQogICAgICAgICAgICAgICAgIGZyb20gZHJpdmVycy9ncHUv
ZHJtL2FybS9kaXNwbGF5L2tvbWVkYS9rb21lZGFfZnJhbWVidWZmZXIuYzo5Og0KZHJpdmVycy9n
cHUvZHJtL2FybS9kaXNwbGF5L2tvbWVkYS9rb21lZGFfZnJhbWVidWZmZXIuYzogSW4gZnVuY3Rp
b24gJ2tvbWVkYV9mYl9hZmJjX3NpemVfY2hlY2snOg0KZHJpdmVycy9ncHUvZHJtL2FybS9kaXNw
bGF5L2tvbWVkYS9rb21lZGFfZnJhbWVidWZmZXIuYzo5NjoxNzogZXJyb3I6IGZvcm1hdCAnJWx4
JyBleHBlY3RzIGFyZ3VtZW50IG9mIHR5cGUgJ2xvbmcgdW5zaWduZWQgaW50JywgYnV0IGFyZ3Vt
ZW50IDMgaGFzIHR5cGUgJ3NpemVfdCcge2FrYSAndW5zaWduZWQgaW50J30gWy1XZXJyb3I9Zm9y
bWF0PV0NCiAgIERSTV9ERUJVR19LTVMoImFmYmMgc2l6ZSBjaGVjayBmYWlsZWQsIG9ial9zaXpl
OiAweCVseC4gbWluX3NpemUgMHgleC5cbiIsDQoNClRoYXQgbGVhZHMgYnkgbWlzdXNlICIlbHgi
IGFzIGZvcm1hdCBzcGVpY2lmaWVyIGZvciBzaXplX3QsIGNvcnJlY3QgaXQNCnRvICIlengiDQoN
ClJlcG9ydGVkLWJ5OiBrYnVpbGQgdGVzdCByb2JvdCA8bGtwQGludGVsLmNvbT4NClNpZ25lZC1v
ZmYtYnk6IGphbWVzIHFpYW4gd2FuZyAoQXJtIFRlY2hub2xvZ3kgQ2hpbmEpIDxqYW1lcy5xaWFu
LndhbmdAYXJtLmNvbT4NCi0tLQ0KIC4uLi9ncHUvZHJtL2FybS9kaXNwbGF5L2tvbWVkYS9rb21l
ZGFfZnJhbWVidWZmZXIuYyAgIHwgMTEgKysrKysrLS0tLS0NCiAxIGZpbGUgY2hhbmdlZCwgNiBp
bnNlcnRpb25zKCspLCA1IGRlbGV0aW9ucygtKQ0KDQpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUv
ZHJtL2FybS9kaXNwbGF5L2tvbWVkYS9rb21lZGFfZnJhbWVidWZmZXIuYyBiL2RyaXZlcnMvZ3B1
L2RybS9hcm0vZGlzcGxheS9rb21lZGEva29tZWRhX2ZyYW1lYnVmZmVyLmMNCmluZGV4IGFiYzhj
MGNjYzA1My4uM2IwYTcwZWQ2YWEwIDEwMDY0NA0KLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FybS9k
aXNwbGF5L2tvbWVkYS9rb21lZGFfZnJhbWVidWZmZXIuYw0KKysrIGIvZHJpdmVycy9ncHUvZHJt
L2FybS9kaXNwbGF5L2tvbWVkYS9rb21lZGFfZnJhbWVidWZmZXIuYw0KQEAgLTQzLDggKzQzLDgg
QEAga29tZWRhX2ZiX2FmYmNfc2l6ZV9jaGVjayhzdHJ1Y3Qga29tZWRhX2ZiICprZmIsIHN0cnVj
dCBkcm1fZmlsZSAqZmlsZSwNCiAJc3RydWN0IGRybV9mcmFtZWJ1ZmZlciAqZmIgPSAma2ZiLT5i
YXNlOw0KIAljb25zdCBzdHJ1Y3QgZHJtX2Zvcm1hdF9pbmZvICppbmZvID0gZmItPmZvcm1hdDsN
CiAJc3RydWN0IGRybV9nZW1fb2JqZWN0ICpvYmo7DQotCXUzMiBhbGlnbm1lbnRfdyA9IDAsIGFs
aWdubWVudF9oID0gMCwgYWxpZ25tZW50X2hlYWRlcjsNCi0JdTMyIG5fYmxvY2tzID0gMCwgbWlu
X3NpemUgPSAwOw0KKwl1MzIgYWxpZ25tZW50X3cgPSAwLCBhbGlnbm1lbnRfaCA9IDAsIGFsaWdu
bWVudF9oZWFkZXIsIG5fYmxvY2tzOw0KKwl1NjQgbWluX3NpemU7DQogDQogCW9iaiA9IGRybV9n
ZW1fb2JqZWN0X2xvb2t1cChmaWxlLCBtb2RlX2NtZC0+aGFuZGxlc1swXSk7DQogCWlmICghb2Jq
KSB7DQpAQCAtOTMsNyArOTMsNyBAQCBrb21lZGFfZmJfYWZiY19zaXplX2NoZWNrKHN0cnVjdCBr
b21lZGFfZmIgKmtmYiwgc3RydWN0IGRybV9maWxlICpmaWxlLA0KIAkJCSAgICAgICBBRkJDX1NV
UEVSQkxLX0FMSUdOTUVOVCk7DQogCW1pbl9zaXplID0ga2ZiLT5hZmJjX3NpemUgKyBmYi0+b2Zm
c2V0c1swXTsNCiAJaWYgKG1pbl9zaXplID4gb2JqLT5zaXplKSB7DQotCQlEUk1fREVCVUdfS01T
KCJhZmJjIHNpemUgY2hlY2sgZmFpbGVkLCBvYmpfc2l6ZTogMHglbHguIG1pbl9zaXplIDB4JXgu
XG4iLA0KKwkJRFJNX0RFQlVHX0tNUygiYWZiYyBzaXplIGNoZWNrIGZhaWxlZCwgb2JqX3NpemU6
IDB4JXp4LiBtaW5fc2l6ZSAweCVsbHguXG4iLA0KIAkJCSAgICAgIG9iai0+c2l6ZSwgbWluX3Np
emUpOw0KIAkJZ290byBjaGVja19mYWlsZWQ7DQogCX0NCkBAIC0xMTQsNyArMTE0LDggQEAga29t
ZWRhX2ZiX25vbmVfYWZiY19zaXplX2NoZWNrKHN0cnVjdCBrb21lZGFfZGV2ICptZGV2LCBzdHJ1
Y3Qga29tZWRhX2ZiICprZmIsDQogCXN0cnVjdCBkcm1fZnJhbWVidWZmZXIgKmZiID0gJmtmYi0+
YmFzZTsNCiAJY29uc3Qgc3RydWN0IGRybV9mb3JtYXRfaW5mbyAqaW5mbyA9IGZiLT5mb3JtYXQ7
DQogCXN0cnVjdCBkcm1fZ2VtX29iamVjdCAqb2JqOw0KLQl1MzIgaSwgbWluX3NpemUsIGJsb2Nr
X2g7DQorCXUzMiBpLCBibG9ja19oOw0KKwl1NjQgbWluX3NpemU7DQogDQogCWlmIChrb21lZGFf
ZmJfY2hlY2tfc3JjX2Nvb3JkcyhrZmIsIDAsIDAsIGZiLT53aWR0aCwgZmItPmhlaWdodCkpDQog
CQlyZXR1cm4gLUVJTlZBTDsNCkBAIC0xMzcsNyArMTM4LDcgQEAga29tZWRhX2ZiX25vbmVfYWZi
Y19zaXplX2NoZWNrKHN0cnVjdCBrb21lZGFfZGV2ICptZGV2LCBzdHJ1Y3Qga29tZWRhX2ZiICpr
ZmIsDQogCQltaW5fc2l6ZSA9IGtvbWVkYV9mYl9nZXRfcGl4ZWxfYWRkcihrZmIsIDAsIGZiLT5o
ZWlnaHQsIGkpDQogCQkJIC0gdG9fZHJtX2dlbV9jbWFfb2JqKG9iaiktPnBhZGRyOw0KIAkJaWYg
KG9iai0+c2l6ZSA8IG1pbl9zaXplKSB7DQotCQkJRFJNX0RFQlVHX0tNUygiVGhlIGZiLT5vYmpb
JWRdIHNpemU6ICVsZCBsb3dlciB0aGFuIHRoZSBtaW5pbXVtIHJlcXVpcmVtZW50OiAlZC5cbiIs
DQorCQkJRFJNX0RFQlVHX0tNUygiVGhlIGZiLT5vYmpbJWRdIHNpemU6IDB4JXp4IGxvd2VyIHRo
YW4gdGhlIG1pbmltdW0gcmVxdWlyZW1lbnQ6IDB4JWxseC5cbiIsDQogCQkJCSAgICAgIGksIG9i
ai0+c2l6ZSwgbWluX3NpemUpOw0KIAkJCXJldHVybiAtRUlOVkFMOw0KIAkJfQ0KLS0gDQoyLjE3
LjENCg0KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJp
LWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBz
Oi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
