Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 31B1328F4E
	for <lists+dri-devel@lfdr.de>; Fri, 24 May 2019 04:55:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 207E888FB2;
	Fri, 24 May 2019 02:55:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR03-AM5-obe.outbound.protection.outlook.com
 (mail-eopbgr30066.outbound.protection.outlook.com [40.107.3.66])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0C41188FB2
 for <dri-devel@lists.freedesktop.org>; Fri, 24 May 2019 02:55:50 +0000 (UTC)
Received: from VE1PR08MB5006.eurprd08.prod.outlook.com (10.255.159.31) by
 VE1PR08MB4736.eurprd08.prod.outlook.com (10.255.112.76) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1878.24; Fri, 24 May 2019 02:55:46 +0000
Received: from VE1PR08MB5006.eurprd08.prod.outlook.com
 ([fe80::206b:5cf6:97e:1358]) by VE1PR08MB5006.eurprd08.prod.outlook.com
 ([fe80::206b:5cf6:97e:1358%7]) with mapi id 15.20.1922.017; Fri, 24 May 2019
 02:55:45 +0000
From: "james qian wang (Arm Technology China)" <james.qian.wang@arm.com>
To: Liviu Dudau <Liviu.Dudau@arm.com>, "airlied@linux.ie" <airlied@linux.ie>, 
 Brian Starkey <Brian.Starkey@arm.com>, "maarten.lankhorst@linux.intel.com"
 <maarten.lankhorst@linux.intel.com>, "sean@poorly.run" <sean@poorly.run>
Subject: [PATCH] drm/komeda: Refine function to_d71_input_id
Thread-Topic: [PATCH] drm/komeda: Refine function to_d71_input_id
Thread-Index: AQHVEdwuBJcfhXXS+U+jyK/WXjH9OA==
Date: Fri, 24 May 2019 02:55:45 +0000
Message-ID: <20190524025525.19134-1-james.qian.wang@arm.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [113.29.88.7]
x-clientproxiedby: HK0PR01CA0028.apcprd01.prod.exchangelabs.com
 (2603:1096:203:3e::16) To VE1PR08MB5006.eurprd08.prod.outlook.com
 (2603:10a6:803:113::31)
x-ms-exchange-messagesentrepresentingtype: 1
x-mailer: git-send-email 2.17.1
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 4f9cc606-7c04-4580-f719-08d6dff3508f
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(7168020)(4627221)(201703031133081)(201702281549075)(8990200)(5600141)(711020)(4605104)(4618075)(2017052603328)(7193020);
 SRVR:VE1PR08MB4736; 
x-ms-traffictypediagnostic: VE1PR08MB4736:
x-ms-exchange-purlcount: 1
nodisclaimer: True
x-microsoft-antispam-prvs: <VE1PR08MB47361766F05E7EC7CE66E629B3020@VE1PR08MB4736.eurprd08.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:5236;
x-forefront-prvs: 0047BC5ADE
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(376002)(136003)(346002)(39860400002)(396003)(366004)(199004)(189003)(36756003)(486006)(316002)(476003)(2616005)(6306002)(6512007)(6436002)(305945005)(478600001)(50226002)(14444005)(256004)(7736002)(86362001)(81166006)(6486002)(8676002)(71200400001)(966005)(2201001)(8936002)(81156014)(71190400001)(53936002)(2501003)(25786009)(5660300002)(2906002)(4326008)(386003)(14454004)(66446008)(1076003)(6506007)(52116002)(66556008)(66066001)(54906003)(99286004)(110136005)(3846002)(186003)(6116002)(64756008)(103116003)(66946007)(102836004)(26005)(55236004)(68736007)(73956011)(66476007);
 DIR:OUT; SFP:1101; SCL:1; SRVR:VE1PR08MB4736;
 H:VE1PR08MB5006.eurprd08.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: arm.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: BDS40woZHowihxgx+RHI6Up9maH3rYbYsTtHMHsetYayN9VSSBd0qugAKoLOXkcKeS1h6vFwdrEAbKjAOXIivEY2fBzoa36T4c2gfHvK1p+w76tqlykJ6ckaRwIg+xxW3W8Uha0hH+izd9pwsvulMRgyDMNMR7QHb0SmmSZMvW7QXryZd5NMWe2o6Gtky4e6ZPCIZsKB/jWIcCfJFqfh7NcKobucSZhYb9XWLlA70GUTjCIU2VIwdQJu41nLsg0IBPSFCRZUqZ/PdrLbFMxmn6kjHSL+GajqiAvfJVcPTg/hWHqlpHPLt0oKvkIgYGkDSISM9NEDehr0c7Fzf6tbrUnqBl9z/4/ZKy7Z2Hrkb7Z+VG7L3h3Xfp7atC0msPp21fKe0kkmNj1l0WohFImm4j9103HHm76hmavQPGivXKE=
MIME-Version: 1.0
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4f9cc606-7c04-4580-f719-08d6dff3508f
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 May 2019 02:55:45.8153 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR08MB4736
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=armh.onmicrosoft.com; 
 s=selector1-arm-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eVSu/nEfhJKftFbch/0iUkLJh2GfIX7qVgVQ1SbPFlY=;
 b=ePWRj/pn7HJN4XcbX3jleVptaM0xoETMNKaJBFlG96ahPyk6NulbDepKdzbqCnNyqcmrjedNPA1XMqCowGohjEX/b0nbmkB/qphd3quf0C+M1tpHtRXa+XhJPUBhe+R/65GHquLJyQMZzYT6qBZom1P1tZ0P5odv8BaJtRWWqhU=
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

U2luY2UgdGhlIGNvbXBvbmVudF9zdGF0ZS0+aW5wdXRbaV0gaXMgb25seSB2YWxpZCB3aGVuIGl0
IGlzIGFjdGl2ZSwgdGhlDQpjb250ZW50IG9mIGlucHV0W2ldIGlzIHVuZGVmaW5lZCBpZiBpdCBp
cyBpbmFjdGl2ZS4gVGhlIHVzZXIgbXVzdCBjaGVjayB0aGUNCnN0YXRlLT5hY3RpdmVfaW5wdXRz
IHdpdGggaW5wdXQgaW5kZXggZmlyc3RseSBiZWZvcmUgdXNpbmcgc3RhdGUtPmlucHV0W2ldLg0K
UmVmaW5lIHRoZSBmdW5jdGlvbiB0b19kNzFfaW5wdXRfaWQgYW5kIGRpcmVjdGx5IG1vdmUgc3Vj
aCBjaGVjayBpbnRvIGl0Lg0KU2ltcGxpZnkgdGhlIHVzaW5nIGFuZCBhdm9pZCBwcm9ibGVtIHRo
YXQgY2FsbGVyIGZvcmdldCB0aGUgdmFsaWQgY2hlY2suDQoNCkRlcGVuZHMgb246DQotIGh0dHBz
Oi8vcGF0Y2h3b3JrLmZyZWVkZXNrdG9wLm9yZy9zZXJpZXMvNjA4NTYvDQoNClNpZ25lZC1vZmYt
Ynk6IEphbWVzIFFpYW4gV2FuZyAoQXJtIFRlY2hub2xvZ3kgQ2hpbmEpIDxqYW1lcy5xaWFuLndh
bmdAYXJtLmNvbT4NCi0tLQ0KIC4uLi9hcm0vZGlzcGxheS9rb21lZGEvZDcxL2Q3MV9jb21wb25l
bnQuYyAgICB8IDMyICsrKysrKysrKystLS0tLS0tLS0NCiAxIGZpbGUgY2hhbmdlZCwgMTcgaW5z
ZXJ0aW9ucygrKSwgMTUgZGVsZXRpb25zKC0pDQoNCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9k
cm0vYXJtL2Rpc3BsYXkva29tZWRhL2Q3MS9kNzFfY29tcG9uZW50LmMgYi9kcml2ZXJzL2dwdS9k
cm0vYXJtL2Rpc3BsYXkva29tZWRhL2Q3MS9kNzFfY29tcG9uZW50LmMNCmluZGV4IGQxMDFhNWNj
Mjc2Ni4uZmZmOWZjOGZhYjE1IDEwMDY0NA0KLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FybS9kaXNw
bGF5L2tvbWVkYS9kNzEvZDcxX2NvbXBvbmVudC5jDQorKysgYi9kcml2ZXJzL2dwdS9kcm0vYXJt
L2Rpc3BsYXkva29tZWRhL2Q3MS9kNzFfY29tcG9uZW50LmMNCkBAIC0xNTYsMTEgKzE1NiwxNSBA
QCBzdGF0aWMgdTMyIHRvX2FkX2N0cmwodTY0IG1vZGlmaWVyKQ0KIAlyZXR1cm4gYWZiY19jdHJs
Ow0KIH0NCiANCi1zdGF0aWMgaW5saW5lIHUzMiB0b19kNzFfaW5wdXRfaWQoc3RydWN0IGtvbWVk
YV9jb21wb25lbnRfb3V0cHV0ICpvdXRwdXQpDQorc3RhdGljIGlubGluZSB1MzIgdG9fZDcxX2lu
cHV0X2lkKHN0cnVjdCBrb21lZGFfY29tcG9uZW50X3N0YXRlICpzdCwgaW50IGlkeCkNCiB7DQot
CXN0cnVjdCBrb21lZGFfY29tcG9uZW50ICpjb21wID0gb3V0cHV0LT5jb21wb25lbnQ7DQorCXN0
cnVjdCBrb21lZGFfY29tcG9uZW50X291dHB1dCAqaW5wdXQgPSAmc3QtPmlucHV0c1tpZHhdOw0K
IA0KLQlyZXR1cm4gY29tcCA/IChjb21wLT5od19pZCArIG91dHB1dC0+b3V0cHV0X3BvcnQpIDog
MDsNCisJLyogaWYgaW5wdXQgaXMgbm90IGFjdGl2ZSwgc2V0IGh3IGlucHV0X2lkKDApIHRvIGRp
c2FibGUgaXQgKi8NCisJaWYgKGhhc19iaXQoaWR4LCBzdC0+YWN0aXZlX2lucHV0cykpDQorCQly
ZXR1cm4gaW5wdXQtPmNvbXBvbmVudC0+aHdfaWQgKyBpbnB1dC0+b3V0cHV0X3BvcnQ7DQorCWVs
c2UNCisJCXJldHVybiAwOw0KIH0NCiANCiBzdGF0aWMgdm9pZCBkNzFfbGF5ZXJfdXBkYXRlX2Zi
KHN0cnVjdCBrb21lZGFfY29tcG9uZW50ICpjLA0KQEAgLTM4OCw3ICszOTIsNyBAQCBzdGF0aWMg
dm9pZCBkNzFfd2JfbGF5ZXJfdXBkYXRlKHN0cnVjdCBrb21lZGFfY29tcG9uZW50ICpjLA0KIAkJ
Y3RybCB8PSBMV19UQlVfRU47DQogDQogCW1hbGlkcF93cml0ZTMyKHJlZywgQkxLX0lOX1NJWkUs
IEhWX1NJWkUoc3QtPmhzaXplLCBzdC0+dnNpemUpKTsNCi0JbWFsaWRwX3dyaXRlMzIocmVnLCBC
TEtfSU5QVVRfSUQwLCB0b19kNzFfaW5wdXRfaWQoJnN0YXRlLT5pbnB1dHNbMF0pKTsNCisJbWFs
aWRwX3dyaXRlMzIocmVnLCBCTEtfSU5QVVRfSUQwLCB0b19kNzFfaW5wdXRfaWQoc3RhdGUsIDAp
KTsNCiAJbWFsaWRwX3dyaXRlMzJfbWFzayhyZWcsIEJMS19DT05UUk9MLCBtYXNrLCBjdHJsKTsN
CiB9DQogDQpAQCAtNTEyLDE1ICs1MTYsMTUgQEAgc3RhdGljIHZvaWQgZDcxX2NvbXBpel91cGRh
dGUoc3RydWN0IGtvbWVkYV9jb21wb25lbnQgKmMsDQogCXN0cnVjdCBrb21lZGFfY29tcGl6X3N0
YXRlICpzdCA9IHRvX2NvbXBpel9zdChzdGF0ZSk7DQogCXUzMiBfX2lvbWVtICpyZWcgPSBjLT5y
ZWc7DQogCXUzMiBfX2lvbWVtICppZF9yZWcsICpjZmdfcmVnOw0KLQl1MzIgaW5kZXgsIGlucHV0
X2h3X2lkOw0KKwl1MzIgaW5kZXg7DQogDQogCWZvcl9lYWNoX2NoYW5nZWRfaW5wdXQoc3RhdGUs
IGluZGV4KSB7DQogCQlpZF9yZWcgPSByZWcgKyBpbmRleDsNCiAJCWNmZ19yZWcgPSByZWcgKyBp
bmRleCAqIENVX1BFUl9JTlBVVF9SRUdTOw0KLQkJaW5wdXRfaHdfaWQgPSB0b19kNzFfaW5wdXRf
aWQoJnN0YXRlLT5pbnB1dHNbaW5kZXhdKTsNCiAJCWlmIChzdGF0ZS0+YWN0aXZlX2lucHV0cyAm
IEJJVChpbmRleCkpIHsNCiAJCQljb21waXpfZW5hYmxlX2lucHV0KGlkX3JlZywgY2ZnX3JlZywN
Ci0JCQkJCSAgICBpbnB1dF9od19pZCwgJnN0LT5jaW5zW2luZGV4XSk7DQorCQkJCQkgICAgdG9f
ZDcxX2lucHV0X2lkKHN0YXRlLCBpbmRleCksDQorCQkJCQkgICAgJnN0LT5jaW5zW2luZGV4XSk7
DQogCQl9IGVsc2Ugew0KIAkJCW1hbGlkcF93cml0ZTMyKGlkX3JlZywgQkxLX0lOUFVUX0lEMCwg
MCk7DQogCQkJbWFsaWRwX3dyaXRlMzIoY2ZnX3JlZywgQ1VfSU5QVVQwX0NPTlRST0wsIDApOw0K
QEAgLTY5Niw3ICs3MDAsNyBAQCBzdGF0aWMgdm9pZCBkNzFfc2NhbGVyX3VwZGF0ZShzdHJ1Y3Qg
a29tZWRhX2NvbXBvbmVudCAqYywNCiAJCWN0cmwgfD0gU0NfQ1RSTF9MUzsNCiANCiAJbWFsaWRw
X3dyaXRlMzIocmVnLCBCTEtfQ09OVFJPTCwgY3RybCk7DQotCW1hbGlkcF93cml0ZTMyKHJlZywg
QkxLX0lOUFVUX0lEMCwgdG9fZDcxX2lucHV0X2lkKCZzdGF0ZS0+aW5wdXRzWzBdKSk7DQorCW1h
bGlkcF93cml0ZTMyKHJlZywgQkxLX0lOUFVUX0lEMCwgdG9fZDcxX2lucHV0X2lkKHN0YXRlLCAw
KSk7DQogfQ0KIA0KIHN0YXRpYyB2b2lkIGQ3MV9zY2FsZXJfZHVtcChzdHJ1Y3Qga29tZWRhX2Nv
bXBvbmVudCAqYywgc3RydWN0IHNlcV9maWxlICpzZikNCkBAIC03NzIsNyArNzc2LDcgQEAgc3Rh
dGljIHZvaWQgZDcxX21lcmdlcl91cGRhdGUoc3RydWN0IGtvbWVkYV9jb21wb25lbnQgKmMsDQog
DQogCWZvcl9lYWNoX2NoYW5nZWRfaW5wdXQoc3RhdGUsIGluZGV4KQ0KIAkJbWFsaWRwX3dyaXRl
MzIocmVnLCBNR19JTlBVVF9JRDAgKyBpbmRleCAqIDQsDQotCQkJICAgICAgIHRvX2Q3MV9pbnB1
dF9pZCgmc3RhdGUtPmlucHV0c1tpbmRleF0pKTsNCisJCQkgICAgICAgdG9fZDcxX2lucHV0X2lk
KHN0YXRlLCBpbmRleCkpOw0KIA0KIAltYWxpZHBfd3JpdGUzMihyZWcsIE1HX1NJWkUsIEhWX1NJ
WkUoc3QtPmhzaXplX21lcmdlZCwNCiAJCQkJCSAgICAgc3QtPnZzaXplX21lcmdlZCkpOw0KQEAg
LTgzOSwxMyArODQzLDExIEBAIHN0YXRpYyB2b2lkIGQ3MV9pbXByb2NfdXBkYXRlKHN0cnVjdCBr
b21lZGFfY29tcG9uZW50ICpjLA0KIHsNCiAJc3RydWN0IGtvbWVkYV9pbXByb2Nfc3RhdGUgKnN0
ID0gdG9faW1wcm9jX3N0KHN0YXRlKTsNCiAJdTMyIF9faW9tZW0gKnJlZyA9IGMtPnJlZzsNCi0J
dTMyIGluZGV4LCBpbnB1dF9od19pZDsNCisJdTMyIGluZGV4Ow0KIA0KLQlmb3JfZWFjaF9jaGFu
Z2VkX2lucHV0KHN0YXRlLCBpbmRleCkgew0KLQkJaW5wdXRfaHdfaWQgPSBzdGF0ZS0+YWN0aXZl
X2lucHV0cyAmIEJJVChpbmRleCkgPw0KLQkJCSAgICAgIHRvX2Q3MV9pbnB1dF9pZCgmc3RhdGUt
PmlucHV0c1tpbmRleF0pIDogMDsNCi0JCW1hbGlkcF93cml0ZTMyKHJlZywgQkxLX0lOUFVUX0lE
MCArIGluZGV4ICogNCwgaW5wdXRfaHdfaWQpOw0KLQl9DQorCWZvcl9lYWNoX2NoYW5nZWRfaW5w
dXQoc3RhdGUsIGluZGV4KQ0KKwkJbWFsaWRwX3dyaXRlMzIocmVnLCBCTEtfSU5QVVRfSUQwICsg
aW5kZXggKiA0LA0KKwkJCSAgICAgICB0b19kNzFfaW5wdXRfaWQoc3RhdGUsIGluZGV4KSk7DQog
DQogCW1hbGlkcF93cml0ZTMyKHJlZywgQkxLX1NJWkUsIEhWX1NJWkUoc3QtPmhzaXplLCBzdC0+
dnNpemUpKTsNCiB9DQotLSANCjIuMTcuMQ0KDQpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0
cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9s
aXN0aW5mby9kcmktZGV2ZWw=
