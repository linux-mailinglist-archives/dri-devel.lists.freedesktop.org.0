Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D006D49BC0
	for <lists+dri-devel@lfdr.de>; Tue, 18 Jun 2019 10:10:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 946466E110;
	Tue, 18 Jun 2019 08:10:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR01-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur01on060d.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:fe1e::60d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 768B76E10F
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Jun 2019 08:10:44 +0000 (UTC)
Received: from VE1PR08MB5006.eurprd08.prod.outlook.com (10.255.159.31) by
 VE1PR08MB5007.eurprd08.prod.outlook.com (10.255.159.32) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1987.13; Tue, 18 Jun 2019 08:10:42 +0000
Received: from VE1PR08MB5006.eurprd08.prod.outlook.com
 ([fe80::206b:5cf6:97e:1358]) by VE1PR08MB5006.eurprd08.prod.outlook.com
 ([fe80::206b:5cf6:97e:1358%7]) with mapi id 15.20.1987.014; Tue, 18 Jun 2019
 08:10:42 +0000
From: "james qian wang (Arm Technology China)" <james.qian.wang@arm.com>
To: Liviu Dudau <Liviu.Dudau@arm.com>, "airlied@linux.ie" <airlied@linux.ie>, 
 Brian Starkey <Brian.Starkey@arm.com>, "maarten.lankhorst@linux.intel.com"
 <maarten.lankhorst@linux.intel.com>, "sean@poorly.run" <sean@poorly.run>
Subject: [PATCH 1/2] drm/komeda: Use drm_display_mode "crtc_" prefixed
 hardware timings
Thread-Topic: [PATCH 1/2] drm/komeda: Use drm_display_mode "crtc_" prefixed
 hardware timings
Thread-Index: AQHVJa1RmLR3mMl6yk6X+075W5n4wA==
Date: Tue, 18 Jun 2019 08:10:40 +0000
Message-ID: <20190618081013.13638-2-james.qian.wang@arm.com>
References: <20190618081013.13638-1-james.qian.wang@arm.com>
In-Reply-To: <20190618081013.13638-1-james.qian.wang@arm.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [113.29.88.7]
x-clientproxiedby: HK2PR0401CA0002.apcprd04.prod.outlook.com
 (2603:1096:202:2::12) To VE1PR08MB5006.eurprd08.prod.outlook.com
 (2603:10a6:803:113::31)
x-ms-exchange-messagesentrepresentingtype: 1
x-mailer: git-send-email 2.17.1
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: b743f5b1-461d-4ccf-1b25-08d6f3c473ce
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(7168020)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:VE1PR08MB5007; 
x-ms-traffictypediagnostic: VE1PR08MB5007:
nodisclaimer: True
x-microsoft-antispam-prvs: <VE1PR08MB50076033428D6D2757397460B3EA0@VE1PR08MB5007.eurprd08.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:6430;
x-forefront-prvs: 007271867D
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(396003)(136003)(346002)(39860400002)(376002)(366004)(199004)(189003)(446003)(66446008)(66556008)(54906003)(7736002)(2201001)(66066001)(305945005)(68736007)(386003)(76176011)(103116003)(55236004)(6506007)(110136005)(14454004)(102836004)(52116002)(8936002)(25786009)(53936002)(14444005)(316002)(2906002)(478600001)(86362001)(4326008)(81166006)(476003)(6436002)(81156014)(186003)(8676002)(6116002)(256004)(50226002)(6512007)(486006)(99286004)(11346002)(2616005)(26005)(6486002)(73956011)(36756003)(2501003)(3846002)(66946007)(71200400001)(71190400001)(5660300002)(66476007)(1076003)(64756008);
 DIR:OUT; SFP:1101; SCL:1; SRVR:VE1PR08MB5007;
 H:VE1PR08MB5006.eurprd08.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: arm.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: 9c1p5X6EkkBNqgYmvamQ5LtSSoViDqLWQLclpVSE2AdkWY5GZS1Bxd1gHvaAoJYP9usr/oeQg9O5bCEtT5YdSY+qgc4cUZgmuVNecuYml9td6OVAB/ugI4hZIbVxrJWLajOkQswyLIaKD8xe0RKm0w+ftX9MnaUQSM/0G3fKSqzXaZ2H0fvH879MQTrrAugs88wcsOflRdrSDmQUYZN/a2xPeW77lW/vDFH5g6dO24uhnQcfwluuF9NVZOLxlyBKtj+ySPmFRLc2bcpsaXTPlYdjsVrK5aGw4IWI9q1R36VBuS4llzcNc+5mtqszpq90QzEJSmsOeCdd8HJvmWKgiSVwWYHZjEC1HNOh9wr2dzhC3C6iw4Kf0WpkzpXN816TLa0Pu0nrWVAqfA3kX1sJFmKFFk76LHF7WK548bCLpdI=
MIME-Version: 1.0
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b743f5b1-461d-4ccf-1b25-08d6f3c473ce
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Jun 2019 08:10:41.8990 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: james.qian.wang@arm.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR08MB5007
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/rL9OkPIAiw4NrUp9ydEHiq5IrXfMqSmonunGPD4Xuk=;
 b=rJPiV+A28L81kXCrdiM5msuDmu2ujbcu9SgooFi95r2TYmS+DjMrZrHYg0S1906mFYJv/qbE/+sVySG5dtyuWH2v0/iVUqQC7h/9aXyi9XTl7To2OExZzowZj5Iu+vWzyudBqjaZDSNvTvdA7680LFYbkhLB79pzQud14v+3OFo=
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

c3RydWN0IGRybV9kaXNwbGF5X21vZGUgY29udGFpbnMgdHdvIGNvcGllcyBvZiB0aW1pbmdzLg0K
LSBwbGFpbiB0aW1pbmdzLg0KLSBoYXJkd2FyZSB0aW1pbmdzLCB0aGUgb25lcyB3aXRoICJjcnRj
XyIgcHJlZml4Lg0KQWNjb3JkaW5nIHRvIHRoZSBkZWZpbml0aW9uLCB1cGRhdGUga29tZWRhIHRv
IHVzZSB0aGUgaGFyZHdhcmUgdGltaW5nLg0KDQpTaWduZWQtb2ZmLWJ5OiBKYW1lcyBRaWFuIFdh
bmcgKEFybSBUZWNobm9sb2d5IENoaW5hKSA8amFtZXMucWlhbi53YW5nQGFybS5jb20+DQotLS0N
CiAuLi4vYXJtL2Rpc3BsYXkva29tZWRhL2Q3MS9kNzFfY29tcG9uZW50LmMgICAgfCAzNiArKysr
KysrKysrKystLS0tLS0tDQogLi4uL2dwdS9kcm0vYXJtL2Rpc3BsYXkva29tZWRhL2tvbWVkYV9j
cnRjLmMgIHwgMjAgKysrKysrLS0tLS0NCiAuLi4vZ3B1L2RybS9hcm0vZGlzcGxheS9rb21lZGEv
a29tZWRhX2ttcy5oICAgfCAgMiAtLQ0KIDMgZmlsZXMgY2hhbmdlZCwgMzUgaW5zZXJ0aW9ucygr
KSwgMjMgZGVsZXRpb25zKC0pDQoNCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYXJtL2Rp
c3BsYXkva29tZWRhL2Q3MS9kNzFfY29tcG9uZW50LmMgYi9kcml2ZXJzL2dwdS9kcm0vYXJtL2Rp
c3BsYXkva29tZWRhL2Q3MS9kNzFfY29tcG9uZW50LmMNCmluZGV4IDg3MjQ4YmFiY2ExZi4uMDQ5
ZThiZmFjMjdiIDEwMDY0NA0KLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FybS9kaXNwbGF5L2tvbWVk
YS9kNzEvZDcxX2NvbXBvbmVudC5jDQorKysgYi9kcml2ZXJzL2dwdS9kcm0vYXJtL2Rpc3BsYXkv
a29tZWRhL2Q3MS9kNzFfY29tcG9uZW50LmMNCkBAIC05MzcsNyArOTM3LDcgQEAgc3RhdGljIGlu
dCBkNzFfZG93bnNjYWxpbmdfY2xrX2NoZWNrKHN0cnVjdCBrb21lZGFfcGlwZWxpbmUgKnBpcGUs
DQogCQlkZW5vbWluYXRvciA9IChtb2RlLT5odG90YWwgLSAxKSAqIHZfb3V0IC0gIDIgKiB2X2lu
Ow0KIAl9DQoNCi0JcmV0dXJuIGFjbGtfcmF0ZSAqIGRlbm9taW5hdG9yID49IG1vZGUtPmNsb2Nr
ICogMTAwMCAqIGZyYWN0aW9uID8NCisJcmV0dXJuIGFjbGtfcmF0ZSAqIGRlbm9taW5hdG9yID49
IG1vZGUtPmNydGNfY2xvY2sgKiAxMDAwICogZnJhY3Rpb24gPw0KIAkgICAgICAgMCA6IC1FSU5W
QUw7DQogfQ0KDQpAQCAtMTA1NiwyMSArMTA1NiwzMSBAQCBzdGF0aWMgdm9pZCBkNzFfdGltaW5n
X2N0cmxyX3VwZGF0ZShzdHJ1Y3Qga29tZWRhX2NvbXBvbmVudCAqYywNCiAJCQkJICAgIHN0cnVj
dCBrb21lZGFfY29tcG9uZW50X3N0YXRlICpzdGF0ZSkNCiB7DQogCXN0cnVjdCBkcm1fY3J0Y19z
dGF0ZSAqY3J0Y19zdCA9IHN0YXRlLT5jcnRjLT5zdGF0ZTsNCisJc3RydWN0IGRybV9kaXNwbGF5
X21vZGUgKm1vZGUgPSAmY3J0Y19zdC0+YWRqdXN0ZWRfbW9kZTsNCiAJdTMyIF9faW9tZW0gKnJl
ZyA9IGMtPnJlZzsNCi0Jc3RydWN0IHZpZGVvbW9kZSB2bTsNCisJdTMyIGhhY3RpdmUsIGhmcm9u
dF9wb3JjaCwgaGJhY2tfcG9yY2gsIGhzeW5jX2xlbjsNCisJdTMyIHZhY3RpdmUsIHZmcm9udF9w
b3JjaCwgdmJhY2tfcG9yY2gsIHZzeW5jX2xlbjsNCiAJdTMyIHZhbHVlOw0KDQotCWRybV9kaXNw
bGF5X21vZGVfdG9fdmlkZW9tb2RlKCZjcnRjX3N0LT5hZGp1c3RlZF9tb2RlLCAmdm0pOw0KLQ0K
LQltYWxpZHBfd3JpdGUzMihyZWcsIEJTX0FDVElWRVNJWkUsIEhWX1NJWkUodm0uaGFjdGl2ZSwg
dm0udmFjdGl2ZSkpOw0KLQltYWxpZHBfd3JpdGUzMihyZWcsIEJTX0hJTlRFUlZBTFMsIEJTX0hf
SU5UVkFMUyh2bS5oZnJvbnRfcG9yY2gsDQotCQkJCQkJCXZtLmhiYWNrX3BvcmNoKSk7DQotCW1h
bGlkcF93cml0ZTMyKHJlZywgQlNfVklOVEVSVkFMUywgQlNfVl9JTlRWQUxTKHZtLnZmcm9udF9w
b3JjaCwNCi0JCQkJCQkJdm0udmJhY2tfcG9yY2gpKTsNCi0NCi0JdmFsdWUgPSBCU19TWU5DX1ZT
Vyh2bS52c3luY19sZW4pIHwgQlNfU1lOQ19IU1codm0uaHN5bmNfbGVuKTsNCi0JdmFsdWUgfD0g
dm0uZmxhZ3MgJiBESVNQTEFZX0ZMQUdTX1ZTWU5DX0hJR0ggPyBCU19TWU5DX1ZTUCA6IDA7DQot
CXZhbHVlIHw9IHZtLmZsYWdzICYgRElTUExBWV9GTEFHU19IU1lOQ19ISUdIID8gQlNfU1lOQ19I
U1AgOiAwOw0KKwloYWN0aXZlID0gbW9kZS0+Y3J0Y19oZGlzcGxheTsNCisJaGZyb250X3BvcmNo
ID0gbW9kZS0+Y3J0Y19oc3luY19zdGFydCAtIG1vZGUtPmNydGNfaGRpc3BsYXk7DQorCWhzeW5j
X2xlbiA9IG1vZGUtPmNydGNfaHN5bmNfZW5kIC0gbW9kZS0+Y3J0Y19oc3luY19zdGFydDsNCisJ
aGJhY2tfcG9yY2ggPSBtb2RlLT5jcnRjX2h0b3RhbCAtIG1vZGUtPmNydGNfaHN5bmNfZW5kOw0K
Kw0KKwl2YWN0aXZlID0gbW9kZS0+Y3J0Y192ZGlzcGxheTsNCisJdmZyb250X3BvcmNoID0gbW9k
ZS0+Y3J0Y192c3luY19zdGFydCAtIG1vZGUtPmNydGNfdmRpc3BsYXk7DQorCXZzeW5jX2xlbiA9
IG1vZGUtPmNydGNfdnN5bmNfZW5kIC0gbW9kZS0+Y3J0Y192c3luY19zdGFydDsNCisJdmJhY2tf
cG9yY2ggPSBtb2RlLT5jcnRjX3Z0b3RhbCAtIG1vZGUtPmNydGNfdnN5bmNfZW5kOw0KKw0KKwlt
YWxpZHBfd3JpdGUzMihyZWcsIEJTX0FDVElWRVNJWkUsIEhWX1NJWkUoaGFjdGl2ZSwgdmFjdGl2
ZSkpOw0KKwltYWxpZHBfd3JpdGUzMihyZWcsIEJTX0hJTlRFUlZBTFMsIEJTX0hfSU5UVkFMUyho
ZnJvbnRfcG9yY2gsDQorCQkJCQkJCWhiYWNrX3BvcmNoKSk7DQorCW1hbGlkcF93cml0ZTMyKHJl
ZywgQlNfVklOVEVSVkFMUywgQlNfVl9JTlRWQUxTKHZmcm9udF9wb3JjaCwNCisJCQkJCQkJdmJh
Y2tfcG9yY2gpKTsNCisNCisJdmFsdWUgPSBCU19TWU5DX1ZTVyh2c3luY19sZW4pIHwgQlNfU1lO
Q19IU1coaHN5bmNfbGVuKTsNCisJdmFsdWUgfD0gbW9kZS0+ZmxhZ3MgJiBEUk1fTU9ERV9GTEFH
X1BWU1lOQyA/IEJTX1NZTkNfVlNQIDogMDsNCisJdmFsdWUgfD0gbW9kZS0+ZmxhZ3MgJiBEUk1f
TU9ERV9GTEFHX1BIU1lOQyA/IEJTX1NZTkNfSFNQIDogMDsNCiAJbWFsaWRwX3dyaXRlMzIocmVn
LCBCU19TWU5DLCB2YWx1ZSk7DQoNCiAJbWFsaWRwX3dyaXRlMzIocmVnLCBCU19QUk9HX0xJTkUs
IEQ3MV9ERUZBVUxUX1BSRVBSRVRDSF9MSU5FIC0gMSk7DQpkaWZmIC0tZ2l0IGEvZHJpdmVycy9n
cHUvZHJtL2FybS9kaXNwbGF5L2tvbWVkYS9rb21lZGFfY3J0Yy5jIGIvZHJpdmVycy9ncHUvZHJt
L2FybS9kaXNwbGF5L2tvbWVkYS9rb21lZGFfY3J0Yy5jDQppbmRleCAxYjRlYThhYjQxZmEuLjk4
ZTM2ZTFmYjJhZCAxMDA2NDQNCi0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hcm0vZGlzcGxheS9rb21l
ZGEva29tZWRhX2NydGMuYw0KKysrIGIvZHJpdmVycy9ncHUvZHJtL2FybS9kaXNwbGF5L2tvbWVk
YS9rb21lZGFfY3J0Yy5jDQpAQCAtMjcsNyArMjcsNyBAQCBzdGF0aWMgdm9pZCBrb21lZGFfY3J0
Y191cGRhdGVfY2xvY2tfcmF0aW8oc3RydWN0IGtvbWVkYV9jcnRjX3N0YXRlICprY3J0Y19zdCkN
CiAJCXJldHVybjsNCiAJfQ0KDQotCXB4bGNsayA9IGtjcnRjX3N0LT5iYXNlLmFkanVzdGVkX21v
ZGUuY2xvY2sgKiAxMDAwOw0KKwlweGxjbGsgPSBrY3J0Y19zdC0+YmFzZS5hZGp1c3RlZF9tb2Rl
LmNydGNfY2xvY2sgKiAxMDAwOw0KIAlhY2xrID0ga29tZWRhX2NhbGNfYWNsayhrY3J0Y19zdCkg
PDwgMzI7DQoNCiAJZG9fZGl2KGFjbGssIHB4bGNsayk7DQpAQCAtNzgsOSArNzgsOSBAQCBrb21l
ZGFfY3J0Y19hdG9taWNfY2hlY2soc3RydWN0IGRybV9jcnRjICpjcnRjLA0KIHVuc2lnbmVkIGxv
bmcga29tZWRhX2NhbGNfYWNsayhzdHJ1Y3Qga29tZWRhX2NydGNfc3RhdGUgKmtjcnRjX3N0KQ0K
IHsNCiAJc3RydWN0IGtvbWVkYV9kZXYgKm1kZXYgPSBrY3J0Y19zdC0+YmFzZS5jcnRjLT5kZXYt
PmRldl9wcml2YXRlOw0KLQl1bnNpZ25lZCBsb25nIHB4bGNsayA9IGtjcnRjX3N0LT5iYXNlLmFk
anVzdGVkX21vZGUuY2xvY2s7DQorCXVuc2lnbmVkIGxvbmcgYWNsayA9IGtjcnRjX3N0LT5iYXNl
LmFkanVzdGVkX21vZGUuY3J0Y19jbG9jazsNCg0KLQlyZXR1cm4gY2xrX3JvdW5kX3JhdGUobWRl
di0+YWNsaywgcHhsY2xrICogMTAwMCk7DQorCXJldHVybiBjbGtfcm91bmRfcmF0ZShtZGV2LT5h
Y2xrLCBhY2xrICogMTAwMCk7DQogfQ0KDQogLyogRm9yIGFjdGl2ZSBhIGNydGMsIG1haW5seSBu
ZWVkIHR3byBwYXJ0cyBvZiBwcmVwYXJhdGlvbg0KQEAgLTkzLDcgKzkzLDcgQEAga29tZWRhX2Ny
dGNfcHJlcGFyZShzdHJ1Y3Qga29tZWRhX2NydGMgKmtjcnRjKQ0KIAlzdHJ1Y3Qga29tZWRhX2Rl
diAqbWRldiA9IGtjcnRjLT5iYXNlLmRldi0+ZGV2X3ByaXZhdGU7DQogCXN0cnVjdCBrb21lZGFf
cGlwZWxpbmUgKm1hc3RlciA9IGtjcnRjLT5tYXN0ZXI7DQogCXN0cnVjdCBrb21lZGFfY3J0Y19z
dGF0ZSAqa2NydGNfc3QgPSB0b19rY3J0Y19zdChrY3J0Yy0+YmFzZS5zdGF0ZSk7DQotCXVuc2ln
bmVkIGxvbmcgcHhsY2xrX3JhdGUgPSBrY3J0Y19zdC0+YmFzZS5hZGp1c3RlZF9tb2RlLmNsb2Nr
ICogMTAwMDsNCisJc3RydWN0IGRybV9kaXNwbGF5X21vZGUgKm1vZGUgPSAma2NydGNfc3QtPmJh
c2UuYWRqdXN0ZWRfbW9kZTsNCiAJdTMyIG5ld19tb2RlOw0KIAlpbnQgZXJyOw0KDQpAQCAtMTI3
LDcgKzEyNyw3IEBAIGtvbWVkYV9jcnRjX3ByZXBhcmUoc3RydWN0IGtvbWVkYV9jcnRjICprY3J0
YykNCiAJCQlEUk1fRVJST1IoImZhaWxlZCB0byBlbmFibGUgYWNsay5cbiIpOw0KIAl9DQoNCi0J
ZXJyID0gY2xrX3NldF9yYXRlKG1hc3Rlci0+cHhsY2xrLCBweGxjbGtfcmF0ZSk7DQorCWVyciA9
IGNsa19zZXRfcmF0ZShtYXN0ZXItPnB4bGNsaywgbW9kZS0+Y3J0Y19jbG9jayAqIDEwMDApOw0K
IAlpZiAoZXJyKQ0KIAkJRFJNX0VSUk9SKCJmYWlsZWQgdG8gc2V0IHB4bGNsayBmb3IgcGlwZSVk
XG4iLCBtYXN0ZXItPmlkKTsNCiAJZXJyID0gY2xrX3ByZXBhcmVfZW5hYmxlKG1hc3Rlci0+cHhs
Y2xrKTsNCkBAIC0zODAsMTAgKzM4MCwxNCBAQCBzdGF0aWMgYm9vbCBrb21lZGFfY3J0Y19tb2Rl
X2ZpeHVwKHN0cnVjdCBkcm1fY3J0YyAqY3J0YywNCiAJCQkJICAgc3RydWN0IGRybV9kaXNwbGF5
X21vZGUgKmFkanVzdGVkX21vZGUpDQogew0KIAlzdHJ1Y3Qga29tZWRhX2NydGMgKmtjcnRjID0g
dG9fa2NydGMoY3J0Yyk7DQotCXN0cnVjdCBrb21lZGFfcGlwZWxpbmUgKm1hc3RlciA9IGtjcnRj
LT5tYXN0ZXI7DQotCWxvbmcgbW9kZV9jbGsgPSBtLT5jbG9jayAqIDEwMDA7DQorCXVuc2lnbmVk
IGxvbmcgY2xrX3JhdGU7DQorDQorCWRybV9tb2RlX3NldF9jcnRjaW5mbyhhZGp1c3RlZF9tb2Rl
LCAwKTsNCg0KLQlhZGp1c3RlZF9tb2RlLT5jbG9jayA9IGNsa19yb3VuZF9yYXRlKG1hc3Rlci0+
cHhsY2xrLCBtb2RlX2NsaykgLyAxMDAwOw0KKwljbGtfcmF0ZSA9IGFkanVzdGVkX21vZGUtPmNy
dGNfY2xvY2sgKiAxMDAwOw0KKwkvKiBjcnRjX2Nsb2NrIHdpbGwgYmUgdXNlZCBhcyB0aGUga29t
ZWRhIG91dHB1dCBwaXhlbCBjbG9jayAqLw0KKwlhZGp1c3RlZF9tb2RlLT5jcnRjX2Nsb2NrID0g
Y2xrX3JvdW5kX3JhdGUoa2NydGMtPm1hc3Rlci0+cHhsY2xrLA0KKwkJCQkJCSAgIGNsa19yYXRl
KSAvIDEwMDA7DQoNCiAJcmV0dXJuIHRydWU7DQogfQ0KZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1
L2RybS9hcm0vZGlzcGxheS9rb21lZGEva29tZWRhX2ttcy5oIGIvZHJpdmVycy9ncHUvZHJtL2Fy
bS9kaXNwbGF5L2tvbWVkYS9rb21lZGFfa21zLmgNCmluZGV4IDIxOWZhM2YwYzMzNi4uYWY2YWYx
ZDU1NjQzIDEwMDY0NA0KLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FybS9kaXNwbGF5L2tvbWVkYS9r
b21lZGFfa21zLmgNCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9hcm0vZGlzcGxheS9rb21lZGEva29t
ZWRhX2ttcy5oDQpAQCAtMTQsOCArMTQsNiBAQA0KICNpbmNsdWRlIDxkcm0vZHJtX2RldmljZS5o
Pg0KICNpbmNsdWRlIDxkcm0vZHJtX3dyaXRlYmFjay5oPg0KICNpbmNsdWRlIDxkcm0vZHJtX3By
aW50Lmg+DQotI2luY2x1ZGUgPHZpZGVvL3ZpZGVvbW9kZS5oPg0KLSNpbmNsdWRlIDx2aWRlby9k
aXNwbGF5X3RpbWluZy5oPg0KDQogLyoqDQogICogc3RydWN0IGtvbWVkYV9wbGFuZSAtIGtvbWVk
YSBpbnN0YW5jZSBvZiBkcm1fcGxhbmUNCi0tDQoyLjE3LjENCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRl
dmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9t
YWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
