Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2151C35A7E
	for <lists+dri-devel@lfdr.de>; Wed,  5 Jun 2019 12:35:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 212A389175;
	Wed,  5 Jun 2019 10:35:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-eopbgr60073.outbound.protection.outlook.com [40.107.6.73])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5F3AD895A8
 for <dri-devel@lists.freedesktop.org>; Wed,  5 Jun 2019 10:35:48 +0000 (UTC)
Received: from VE1PR08MB5006.eurprd08.prod.outlook.com (10.255.159.31) by
 VE1PR08MB4670.eurprd08.prod.outlook.com (10.255.114.208) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1943.22; Wed, 5 Jun 2019 10:35:46 +0000
Received: from VE1PR08MB5006.eurprd08.prod.outlook.com
 ([fe80::206b:5cf6:97e:1358]) by VE1PR08MB5006.eurprd08.prod.outlook.com
 ([fe80::206b:5cf6:97e:1358%7]) with mapi id 15.20.1943.018; Wed, 5 Jun 2019
 10:35:46 +0000
From: "james qian wang (Arm Technology China)" <james.qian.wang@arm.com>
To: Liviu Dudau <Liviu.Dudau@arm.com>, "airlied@linux.ie" <airlied@linux.ie>, 
 Brian Starkey <Brian.Starkey@arm.com>, "maarten.lankhorst@linux.intel.com"
 <maarten.lankhorst@linux.intel.com>, "sean@poorly.run" <sean@poorly.run>
Subject: [PATCH 3/3] dt/bindings: drm/komeda: Unify mclk/pclk/pipeline->aclk
 to one ACLK
Thread-Topic: [PATCH 3/3] dt/bindings: drm/komeda: Unify
 mclk/pclk/pipeline->aclk to one ACLK
Thread-Index: AQHVG4pv5VVb7rWo9U6Y2qy4f4Mh2A==
Date: Wed, 5 Jun 2019 10:35:45 +0000
Message-ID: <20190605103506.22863-4-james.qian.wang@arm.com>
References: <20190605103506.22863-1-james.qian.wang@arm.com>
In-Reply-To: <20190605103506.22863-1-james.qian.wang@arm.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [113.29.88.7]
x-clientproxiedby: HK0PR03CA0041.apcprd03.prod.outlook.com
 (2603:1096:203:2f::29) To VE1PR08MB5006.eurprd08.prod.outlook.com
 (2603:10a6:803:113::31)
x-ms-exchange-messagesentrepresentingtype: 1
x-mailer: git-send-email 2.17.1
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 7e91d6ec-de19-4d13-deb1-08d6e9a1914f
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(7168020)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:VE1PR08MB4670; 
x-ms-traffictypediagnostic: VE1PR08MB4670:
nodisclaimer: True
x-microsoft-antispam-prvs: <VE1PR08MB46705F727E6AD8884244FD1CB3160@VE1PR08MB4670.eurprd08.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:4714;
x-forefront-prvs: 00594E8DBA
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(39860400002)(376002)(136003)(366004)(396003)(346002)(199004)(189003)(103116003)(3846002)(110136005)(86362001)(81156014)(81166006)(2501003)(36756003)(66066001)(71200400001)(71190400001)(1076003)(52116002)(316002)(4326008)(99286004)(2906002)(76176011)(256004)(54906003)(26005)(8676002)(6116002)(2201001)(386003)(68736007)(55236004)(102836004)(25786009)(7736002)(14454004)(6506007)(2616005)(11346002)(50226002)(486006)(446003)(53936002)(6512007)(476003)(6486002)(6436002)(305945005)(8936002)(73956011)(66446008)(64756008)(66556008)(66476007)(66946007)(186003)(478600001)(5660300002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:VE1PR08MB4670;
 H:VE1PR08MB5006.eurprd08.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: arm.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: Ofg904fWZUe040QjF/6XkoIAn0P9izx4Y/5bY3gGaO8t1HMt2jwiEYo3MtYUc/s/I/UQ6WhncwZ9+PkEzmLk0/OqnzrKIxq01/bFWMPRffAeUs5YEfy2NzIolQvvSzOUpFtfncGbGfobbjPuE+kS/dVe9qY4SiClHconx2X18R2tPbXnANLGKjOs1cGuI9zjafQ2qAsnbm+pHqhozRPo49HVvLbdAvBcQ7PhisZfcx35EsOeyBTBhdQDH3pRaGLAixps0XXGwel1bTo3kubsEJRjUdJCWbKZPez7FnNTiqQWes9j8NkKAkDmvvpx5PFEe0VXg9YSiN8mfdaibM5RBAZ2psNWckTmkJV8oRvsf57yPT8MfUdYCsitv5sm9SDS3xJZ1s/fKccpHWY3RDAd5qq2greY2zPj26Wgd+CZ0nI=
MIME-Version: 1.0
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7e91d6ec-de19-4d13-deb1-08d6e9a1914f
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Jun 2019 10:35:45.9689 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: james.qian.wang@arm.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR08MB4670
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WuTkBQ9i2jJPy6D723RPLbA8haavHF+06bPA6nsMbD0=;
 b=fkoPzWTa1NW77ur1mVlbhh4zPAW8CbrqBVEMDD1AnRBZoWCDWXBTQi1SooVKZ85uKDf8pD7F2A8nVk3v5l69PNvphFOiMOpr1QsrcG6Vxx+0JaLPxtyZILR9rfJrg+PabOeA4Z3THAPKO80V00hLryD0hkgQXsdjh+nWTOzL5oQ=
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

Q3VycmVudCBrb21lZGEgZHJpdmVyIHVzZXMgdGhyZWUgZGVkaWNhdGVkIGNsa3MgZm9yIGEgc3Bl
Y2lmaWMgcHVycG9zZToNCi0gbWNsazogbWFpbiBlbmdpbmUgY2xvY2sNCi0gcGNsazogQVBCIGNs
b2NrDQotIHBpcGVsaW5lLT5hY2xrOiBBWEkgY2xvY2suDQoNCkJ1dCBwZXIgc3BlYyB0aGUga29t
ZWRhIEhXIG9ubHkgaGFzIHRocmVlIGlucHV0IGNsa3M6DQotIEFDTEs6IHVzZWQgZm9yIEFYSSBt
YXN0ZXJzLCBBUEIgc2xhdmUgYW5kIG1vc3QgcGlwZWxpbmUgcHJvY2Vzc2luZw0KLSBQWENMSyBm
b3IgcGlwZWxpbmUgMDogb3V0cHV0IHBpeGVsIGNsb2NrIGZvciBwaXBlbGluZSAwDQotIFBYQ0xL
IGZvciBwaXBlbGluZSAxOiBvdXRwdXQgcGl4ZWwgY2xvY2sgZm9yIHBpcGVsaW5lIDENCg0KU28g
b25lIEFDTEsgaXMgZW5vdWdoLCBubyBuZWVkIHRvIHNwbGl0IGl0IHRvIHRocmVlIG1jbGsvcGNs
ay9heGljbGsuDQoNClNpZ25lZC1vZmYtYnk6IEphbWVzIFFpYW4gV2FuZyAoQXJtIFRlY2hub2xv
Z3kgQ2hpbmEpIDxqYW1lcy5xaWFuLndhbmdAYXJtLmNvbT4NCi0tLQ0KIC4uLi9kZXZpY2V0cmVl
L2JpbmRpbmdzL2Rpc3BsYXkvYXJtLGtvbWVkYS50eHQgICB8IDE2ICsrKysrKystLS0tLS0tLS0N
CiAxIGZpbGUgY2hhbmdlZCwgNyBpbnNlcnRpb25zKCspLCA5IGRlbGV0aW9ucygtKQ0KDQpkaWZm
IC0tZ2l0IGEvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2Rpc3BsYXkvYXJtLGtv
bWVkYS50eHQgYi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvZGlzcGxheS9hcm0s
a29tZWRhLnR4dA0KaW5kZXggYjEyYzA0NTNhNDIxLi44NTEzNjk1ZWU0N2YgMTAwNjQ0DQotLS0g
YS9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvZGlzcGxheS9hcm0sa29tZWRhLnR4
dA0KKysrIGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2Rpc3BsYXkvYXJtLGtv
bWVkYS50eHQNCkBAIC03LDggKzcsNyBAQCBSZXF1aXJlZCBwcm9wZXJ0aWVzOg0KIC0gY2xvY2tz
OiBBIGxpc3Qgb2YgcGhhbmRsZSArIGNsb2NrLXNwZWNpZmllciBwYWlycywgb25lIGZvciBlYWNo
IGVudHJ5DQogICAgIGluICdjbG9jay1uYW1lcycNCiAtIGNsb2NrLW5hbWVzOiBBIGxpc3Qgb2Yg
Y2xvY2sgbmFtZXMuIEl0IHNob3VsZCBjb250YWluOg0KLSAgICAgIC0gIm1jbGsiOiBmb3IgdGhl
IG1haW4gcHJvY2Vzc29yIGNsb2NrDQotICAgICAgLSAicGNsayI6IGZvciB0aGUgQVBCIGludGVy
ZmFjZSBjbG9jaw0KKyAgICAgIC0gImFjbGsiOiBmb3IgdGhlIG1haW4gcHJvY2Vzc29yIGNsb2Nr
DQogLSAjYWRkcmVzcy1jZWxsczogTXVzdCBiZSAxDQogLSAjc2l6ZS1jZWxsczogTXVzdCBiZSAw
DQogLSBpb21tdXM6IGNvbmZpZ3VyZSB0aGUgc3RyZWFtIGlkIHRvIElPTU1VLCBNdXN0IGJlIGNv
bmZpZ3VyZWQgaWYgd2FudCB0bw0KQEAgLTI0LDcgKzIzLDYgQEAgcGlwZWxpbmUgbm9kZSBzaG91
bGQgcHJvdmlkZSBwcm9wZXJ0aWVzOg0KICAgICBpbiAnY2xvY2stbmFtZXMnDQogLSBjbG9jay1u
YW1lczogc2hvdWxkIGNvbnRhaW46DQogICAgICAgLSAicHhjbGsiOiBwaXhlbCBjbG9jaw0KLSAg
ICAgIC0gImFjbGsiOiBBWEkgaW50ZXJmYWNlIGNsb2NrDQoNCiAtIHBvcnQ6IGVhY2ggcGlwZWxp
bmUgY29ubmVjdCB0byBhbiBlbmNvZGVyIGlucHV0IHBvcnQuIFRoZSBjb25uZWN0aW9uIGlzDQog
ICAgIG1vZGVsZWQgdXNpbmcgdGhlIE9GIGdyYXBoIGJpbmRpbmdzIHNwZWNpZmllZCBpbg0KQEAg
LTQ2LDE1ICs0NCwxNSBAQCBFeGFtcGxlOg0KIAkJY29tcGF0aWJsZSA9ICJhcm0sbWFsaS1kNzEi
Ow0KIAkJcmVnID0gPDB4YzAwMDAwIDB4MjAwMDA+Ow0KIAkJaW50ZXJydXB0cyA9IDwwIDE2OCA0
PjsNCi0JCWNsb2NrcyA9IDwmZHB1X21jbGs+LCA8JmRwdV9hY2xrPjsNCi0JCWNsb2NrLW5hbWVz
ID0gIm1jbGsiLCAicGNsayI7DQorCQljbG9ja3MgPSA8JmRwdV9hY2xrPjsNCisJCWNsb2NrLW5h
bWVzID0gImFjbGsiOw0KIAkJaW9tbXVzID0gPCZzbW11IDA+LCA8JnNtbXUgMT4sIDwmc21tdSAy
PiwgPCZzbW11IDM+LA0KIAkJCTwmc21tdSA0PiwgPCZzbW11IDU+LCA8JnNtbXUgNj4sIDwmc21t
dSA3PiwNCiAJCQk8JnNtbXUgOD4sIDwmc21tdSA5PjsNCg0KIAkJZHAwX3BpcGUwOiBwaXBlbGlu
ZUAwIHsNCi0JCQljbG9ja3MgPSA8JmZwZ2Fvc2MyPiwgPCZkcHVfYWNsaz47DQotCQkJY2xvY2st
bmFtZXMgPSAicHhjbGsiLCAiYWNsayI7DQorCQkJY2xvY2tzID0gPCZmcGdhb3NjMj47DQorCQkJ
Y2xvY2stbmFtZXMgPSAicHhjbGsiOw0KIAkJCXJlZyA9IDwwPjsNCg0KIAkJCXBvcnQgew0KQEAg
LTY1LDggKzYzLDggQEAgRXhhbXBsZToNCiAJCX07DQoNCiAJCWRwMF9waXBlMTogcGlwZWxpbmVA
MSB7DQotCQkJY2xvY2tzID0gPCZmcGdhb3NjMj4sIDwmZHB1X2FjbGs+Ow0KLQkJCWNsb2NrLW5h
bWVzID0gInB4Y2xrIiwgImFjbGsiOw0KKwkJCWNsb2NrcyA9IDwmZnBnYW9zYzI+Ow0KKwkJCWNs
b2NrLW5hbWVzID0gInB4Y2xrIjsNCiAJCQlyZWcgPSA8MT47DQoNCiAJCQlwb3J0IHsNCi0tDQoy
LjE3LjENCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRy
aS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRw
czovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
