Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C0894719EF
	for <lists+dri-devel@lfdr.de>; Tue, 23 Jul 2019 16:07:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7AF3E6E2B2;
	Tue, 23 Jul 2019 14:07:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-CY1-obe.outbound.protection.outlook.com
 (mail-eopbgr760052.outbound.protection.outlook.com [40.107.76.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6C6396E2B2
 for <dri-devel@lists.freedesktop.org>; Tue, 23 Jul 2019 14:07:27 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MBPDsDPJlL0HB76Jpt1afn7ZzxrBnfrXIvbLNZc02XUDLU9hSuZXY2Qx19rmkSuckMB0Icz2c3NviKmDnUhOBHD8qF5U8+fg5qA3kB6iq1CCboOTte7OfLZXHXEihY0Qo8qJH1z8FaU37usTI/QtAEsZTZb2BZ0pnl5LQg+RijDHGBD+x/cg+q0bm+MIgVegTxytleP+r+DNQaYjiQO2K1p9oV+dHvheSAGUf+Uh47H2HEWLLNaGq5rIJAbrBUy8AWvq/wwK0IvH1NIaItkZktkKrC8NKQfCiclKm49PUnflelo4v7Gd+NkVz4AOZDmFZQI5T1Lyd7KpHU3BrxTldg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kgRYC885R3TVSNlZL7K62jU5evlXa5qJFhfQekwCU0o=;
 b=P0QbIdawjIZw5KsxwW9LCijkqEm0whJcYASduJjv5sxgy1oEto1v1tu6n9ZyTxuGbOuq2U/TDBJ6Hcz/nl5f5YEGPpz1rvUjmAwSdVYy66WyWBTxdcKa6jwN5kLCFtU28IJrbhcBEYDDwXPhpF1Xt9BW6hyRExdQkRCNTCw6xdijlLWeWco7I+C0VM5lBWkwpmxdDPyY7NX7qbIKtJJlS5fcjR/gr1i/DGA98oNt+e1NobXONvckY1Nx2+LdlX98lfztV7eRRXBOcssb4rAmxXWtQBqvJ0wxJOdcRdB5Pr2vpqpzdX2kcopf5PZzRHd+XEu5BBmLwQiP3T/6QpBNEw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=pass
 smtp.mailfrom=amd.com;dmarc=pass action=none header.from=amd.com;dkim=pass
 header.d=amd.com;arc=none
Received: from MN2PR12MB2910.namprd12.prod.outlook.com (20.179.81.219) by
 MN2PR12MB3773.namprd12.prod.outlook.com (10.255.236.206) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2094.14; Tue, 23 Jul 2019 14:07:25 +0000
Received: from MN2PR12MB2910.namprd12.prod.outlook.com
 ([fe80::9158:a228:2506:85e4]) by MN2PR12MB2910.namprd12.prod.outlook.com
 ([fe80::9158:a228:2506:85e4%6]) with mapi id 15.20.2094.013; Tue, 23 Jul 2019
 14:07:25 +0000
From: Chunming Zhou <zhoucm1@amd.com>
To: "Koenig, Christian" <Christian.Koenig@amd.com>, "Zhou, David(ChunMing)"
 <David1.Zhou@amd.com>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>
Subject: Re: [PATCH] drm/syncobj: extend syncobj query ability
Thread-Topic: [PATCH] drm/syncobj: extend syncobj query ability
Thread-Index: AQHVQRbEsJpOBpGcaEuh5CrRat34w6bYO0EAgAACSYA=
Date: Tue, 23 Jul 2019 14:07:25 +0000
Message-ID: <d9ecceda-0ce2-341b-3f42-9202be302772@amd.com>
References: <20190723052257.14436-1-david1.zhou@amd.com>
 <1946e636-7c21-7456-3824-72a98c7305a4@amd.com>
In-Reply-To: <1946e636-7c21-7456-3824-72a98c7305a4@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: HK0P153CA0006.APCP153.PROD.OUTLOOK.COM
 (2603:1096:203:18::18) To MN2PR12MB2910.namprd12.prod.outlook.com
 (2603:10b6:208:af::27)
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [101.86.234.22]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: c2f91683-4b7e-4de0-6b80-08d70f771696
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:MN2PR12MB3773; 
x-ms-traffictypediagnostic: MN2PR12MB3773:
x-microsoft-antispam-prvs: <MN2PR12MB3773CF6F470F60A0B9A8E4C1B4C70@MN2PR12MB3773.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:2043;
x-forefront-prvs: 0107098B6C
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(376002)(366004)(39860400002)(346002)(136003)(396003)(199004)(189003)(14454004)(229853002)(66476007)(256004)(66556008)(66446008)(110136005)(99286004)(64756008)(71190400001)(486006)(71200400001)(31696002)(7736002)(316002)(66946007)(5660300002)(66066001)(102836004)(25786009)(2501003)(26005)(11346002)(186003)(6246003)(68736007)(52116002)(6436002)(76176011)(4326008)(478600001)(36756003)(8936002)(3846002)(6486002)(6506007)(386003)(53936002)(6512007)(305945005)(8676002)(446003)(2616005)(2906002)(81156014)(6116002)(476003)(31686004)(81166006);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MN2PR12MB3773;
 H:MN2PR12MB2910.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: QkryXxTVWJQ/KDGAXScD/8C2mml9gnEc9+R6myotY50eOKILybKEu5G9Acr8TkhP4dVi+6QSENbkP964RG8YWsSFLCo2YUqoUqTrnuHB6HHDhQkaSSDJGi2s7HHCsQ2C6CNa9xcVCTiytRxCk5H8yTEzGm7+e/71hYOO19ywj5TIO8KeIr491E9mtSkjaGRs14T8kuq9+vYwj9Fu0JFIvoThdfQ8MtJN/B/j+s2PE6Vz4Ij2OStUz5S1beiFEu2LajlPtLGXLv1fOIy+QpAsc76NtQ8rOo0JSqIpZu6skifbEYkj45hVPE1mU4skmAiteDuxc48il1Rpxrh0l5037tFXmYep2u6204EPGU+hCmr+HCSRdGzhNPsTH+Qf1bg9/jr50vaDaw6PPT8C5jdQNNyEuOs3XeVDkMvPRZ5wIvI=
Content-ID: <3CECB55F012F2F4A8740948A9D564D2C@namprd12.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c2f91683-4b7e-4de0-6b80-08d70f771696
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Jul 2019 14:07:25.2525 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: zhoucm1@amd.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB3773
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kgRYC885R3TVSNlZL7K62jU5evlXa5qJFhfQekwCU0o=;
 b=oH3x7AvW0Uuhau/0Y7ZNJuwMwl75+xIX0vyrIWtvVfwreI457TJGmiiZSLsH2kHUg7yCf+r0szxMAAfrcbb/kad8pqnbZrWc8Je73c0duBySQbmACFjkmNVHIBN7i2h+5LSzCjkaNXA2MCKUeNzHHJvSSd4bcQl2MHIvK+SmhAU=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=David1.Zhou@amd.com; 
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

DQrlnKggMjAxOS83LzIzIDIxOjU4LCBLb2VuaWcsIENocmlzdGlhbiDlhpnpgZM6DQo+IEFtIDIz
LjA3LjE5IHVtIDA3OjIyIHNjaHJpZWIgQ2h1bm1pbmcgWmhvdToNCj4+IHVzZXIgc3BhY2UgbmVl
ZHMgYSBmbGV4aWFibGUgcXVlcnkgYWJpbGl0eS4NCj4+IFNvIHRoYXQgdW1kIGNhbiBnZXQgbGFz
dCBzaWduYWxlZCBvciBzdWJtaXR0ZWQgcG9pbnQuDQo+Pg0KPj4gQ2hhbmdlLUlkOiBJNjUxMmI0
MzA1MjRlYmFiZTcxNWU2MDJhMmJmNWFiYjBhN2U3ODBlYQ0KPj4gU2lnbmVkLW9mZi1ieTogQ2h1
bm1pbmcgWmhvdSA8ZGF2aWQxLnpob3VAYW1kLmNvbT4NCj4+IENjOiBMaW9uZWwgTGFuZHdlcmxp
biA8bGlvbmVsLmcubGFuZHdlcmxpbkBpbnRlbC5jb20+DQo+PiBDYzogQ2hyaXN0aWFuIEvDtm5p
ZyA8Q2hyaXN0aWFuLktvZW5pZ0BhbWQuY29tPg0KPiBJJ3ZlIHJlY2VudGx5IGZvdW5kIGEgYnVn
IGluIGRybV9zeW5jb2JqX3F1ZXJ5X2lvY3RsKCkgd2hpY2ggSSdtIGdvaW5nDQo+IHRvIGNvbW1p
dCB0b21vcnJvdy4NCg0KWWVzLCBJJ3ZlIHJlYWxpemVkLiBMb2luZWwgaGFzIHB1dCBSQiBvbiBp
dC4NCg0KDQo+DQo+IEFwYXJ0IGZyb20gdGhhdCBpdCBsb29rcyBnb29kIHRvIG1lLA0KDQpUaGFu
a3MsDQoNCg0KPiAgIGJ1dCBJIHRoaW5rIHdlIHNob3VsZCBjbGVhbnVwIGEgYml0DQo+IGFuZCBt
b3ZlIHRoZSBkbWFfZmVuY2VfY2hhaW5fZm9yX2VhY2goKS4uLiBpbnRvIGEgaGVscGVyIGZ1bmN0
aW9uIGluDQo+IGRtYS1mZW5jZS1jaGFpbi5jDQoNCkRvIHlvdSBtaW5kIGEgc2FwZXJhdGUgY2xl
YW51cCBwYXRjaCBmb3IgdGhhdD8gSSBkb24ndCB3YW50IHRvIHRvdWNoIA0Ka2VybmVsIGRpcmVj
dG9yeSBpbiB0aGlzIHBhdGNoLCBzbyB0aGF0IHdlIGNhbiBjaGVycnktcGljayBpdCBlYXNpbHku
DQoNCg0KLURhdmlkDQoNCj4NCj4gQ2hyaXN0aWFuLg0KPg0KPj4gLS0tDQo+PiAgICBkcml2ZXJz
L2dwdS9kcm0vZHJtX3N5bmNvYmouYyB8IDM2ICsrKysrKysrKysrKysrKysrLS0tLS0tLS0tLS0t
LS0tLS0tDQo+PiAgICBpbmNsdWRlL3VhcGkvZHJtL2RybS5oICAgICAgICB8ICAzICsrLQ0KPj4g
ICAgMiBmaWxlcyBjaGFuZ2VkLCAyMCBpbnNlcnRpb25zKCspLCAxOSBkZWxldGlvbnMoLSkNCj4+
DQo+PiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2RybV9zeW5jb2JqLmMgYi9kcml2ZXJz
L2dwdS9kcm0vZHJtX3N5bmNvYmouYw0KPj4gaW5kZXggM2Q0MDA5MDUxMDBiLi5mNzBkZWRmM2Vm
NGYgMTAwNjQ0DQo+PiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vZHJtX3N5bmNvYmouYw0KPj4gKysr
IGIvZHJpdmVycy9ncHUvZHJtL2RybV9zeW5jb2JqLmMNCj4+IEBAIC0xMTk3LDkgKzExOTcsNiBA
QCBkcm1fc3luY29ial90aW1lbGluZV9zaWduYWxfaW9jdGwoc3RydWN0IGRybV9kZXZpY2UgKmRl
diwgdm9pZCAqZGF0YSwNCj4+ICAgIAlpZiAoIWRybV9jb3JlX2NoZWNrX2ZlYXR1cmUoZGV2LCBE
UklWRVJfU1lOQ09CSl9USU1FTElORSkpDQo+PiAgICAJCXJldHVybiAtRU9QTk9UU1VQUDsNCj4+
ICAgIA0KPj4gLQlpZiAoYXJncy0+cGFkICE9IDApDQo+PiAtCQlyZXR1cm4gLUVJTlZBTDsNCj4+
IC0NCj4+ICAgIAlpZiAoYXJncy0+Y291bnRfaGFuZGxlcyA9PSAwKQ0KPj4gICAgCQlyZXR1cm4g
LUVJTlZBTDsNCj4+ICAgIA0KPj4gQEAgLTEyNjgsOSArMTI2NSw2IEBAIGludCBkcm1fc3luY29i
al9xdWVyeV9pb2N0bChzdHJ1Y3QgZHJtX2RldmljZSAqZGV2LCB2b2lkICpkYXRhLA0KPj4gICAg
CWlmICghZHJtX2NvcmVfY2hlY2tfZmVhdHVyZShkZXYsIERSSVZFUl9TWU5DT0JKX1RJTUVMSU5F
KSkNCj4+ICAgIAkJcmV0dXJuIC1FT1BOT1RTVVBQOw0KPj4gICAgDQo+PiAtCWlmIChhcmdzLT5w
YWQgIT0gMCkNCj4+IC0JCXJldHVybiAtRUlOVkFMOw0KPj4gLQ0KPj4gICAgCWlmIChhcmdzLT5j
b3VudF9oYW5kbGVzID09IDApDQo+PiAgICAJCXJldHVybiAtRUlOVkFMOw0KPj4gICAgDQo+PiBA
QCAtMTI5MSwyMyArMTI4NSwyOSBAQCBpbnQgZHJtX3N5bmNvYmpfcXVlcnlfaW9jdGwoc3RydWN0
IGRybV9kZXZpY2UgKmRldiwgdm9pZCAqZGF0YSwNCj4+ICAgIAkJaWYgKGNoYWluKSB7DQo+PiAg
ICAJCQlzdHJ1Y3QgZG1hX2ZlbmNlICppdGVyLCAqbGFzdF9zaWduYWxlZCA9IE5VTEw7DQo+PiAg
ICANCj4+IC0JCQlkbWFfZmVuY2VfY2hhaW5fZm9yX2VhY2goaXRlciwgZmVuY2UpIHsNCj4+IC0J
CQkJaWYgKCFpdGVyKQ0KPj4gLQkJCQkJYnJlYWs7DQo+PiAtCQkJCWRtYV9mZW5jZV9wdXQobGFz
dF9zaWduYWxlZCk7DQo+PiAtCQkJCWxhc3Rfc2lnbmFsZWQgPSBkbWFfZmVuY2VfZ2V0KGl0ZXIp
Ow0KPj4gLQkJCQlpZiAoIXRvX2RtYV9mZW5jZV9jaGFpbihsYXN0X3NpZ25hbGVkKS0+cHJldl9z
ZXFubykNCj4+IC0JCQkJCS8qIEl0IGlzIG1vc3QgbGlrZWx5IHRoYXQgdGltZWxpbmUgaGFzDQo+
PiAtCQkJCQkgKiB1bm9yZGVyIHBvaW50cy4gKi8NCj4+IC0JCQkJCWJyZWFrOw0KPj4gKwkJCWlm
IChhcmdzLT5mbGFncyAmDQo+PiArCQkJICAgIERSTV9TWU5DT0JKX1FVRVJZX0ZMQUdTX0xBU1Rf
U1VCTUlUVEVEKSB7DQo+PiArCQkJCXBvaW50ID0gZmVuY2UtPnNlcW5vOw0KPj4gKwkJCX0gZWxz
ZSB7DQo+PiArCQkJCWRtYV9mZW5jZV9jaGFpbl9mb3JfZWFjaChpdGVyLCBmZW5jZSkgew0KPj4g
KwkJCQkJaWYgKCFpdGVyKQ0KPj4gKwkJCQkJCWJyZWFrOw0KPj4gKwkJCQkJZG1hX2ZlbmNlX3B1
dChsYXN0X3NpZ25hbGVkKTsNCj4+ICsJCQkJCWxhc3Rfc2lnbmFsZWQgPSBkbWFfZmVuY2VfZ2V0
KGl0ZXIpOw0KPj4gKwkJCQkJaWYgKCF0b19kbWFfZmVuY2VfY2hhaW4obGFzdF9zaWduYWxlZCkt
PnByZXZfc2Vxbm8pDQo+PiArCQkJCQkJLyogSXQgaXMgbW9zdCBsaWtlbHkgdGhhdCB0aW1lbGlu
ZSBoYXMNCj4+ICsJCQkJCQkqIHVub3JkZXIgcG9pbnRzLiAqLw0KPj4gKwkJCQkJCWJyZWFrOw0K
Pj4gKwkJCQl9DQo+PiArCQkJCXBvaW50ID0gZG1hX2ZlbmNlX2lzX3NpZ25hbGVkKGxhc3Rfc2ln
bmFsZWQpID8NCj4+ICsJCQkJCWxhc3Rfc2lnbmFsZWQtPnNlcW5vIDoNCj4+ICsJCQkJCXRvX2Rt
YV9mZW5jZV9jaGFpbihsYXN0X3NpZ25hbGVkKS0+cHJldl9zZXFubzsNCj4+ICAgIAkJCX0NCj4+
IC0JCQlwb2ludCA9IGRtYV9mZW5jZV9pc19zaWduYWxlZChsYXN0X3NpZ25hbGVkKSA/DQo+PiAt
CQkJCWxhc3Rfc2lnbmFsZWQtPnNlcW5vIDoNCj4+IC0JCQkJdG9fZG1hX2ZlbmNlX2NoYWluKGxh
c3Rfc2lnbmFsZWQpLT5wcmV2X3NlcW5vOw0KPj4gICAgCQkJZG1hX2ZlbmNlX3B1dChsYXN0X3Np
Z25hbGVkKTsNCj4+ICAgIAkJfSBlbHNlIHsNCj4+ICAgIAkJCXBvaW50ID0gMDsNCj4+ICAgIAkJ
fQ0KPj4gKwkJZG1hX2ZlbmNlX3B1dChmZW5jZSk7DQo+PiAgICAJCXJldCA9IGNvcHlfdG9fdXNl
cigmcG9pbnRzW2ldLCAmcG9pbnQsIHNpemVvZih1aW50NjRfdCkpOw0KPj4gICAgCQlyZXQgPSBy
ZXQgPyAtRUZBVUxUIDogMDsNCj4+ICAgIAkJaWYgKHJldCkNCj4+IGRpZmYgLS1naXQgYS9pbmNs
dWRlL3VhcGkvZHJtL2RybS5oIGIvaW5jbHVkZS91YXBpL2RybS9kcm0uaA0KPj4gaW5kZXggNjYx
ZDczZjlhOTE5Li5mZDk4N2NlMjRkOWYgMTAwNjQ0DQo+PiAtLS0gYS9pbmNsdWRlL3VhcGkvZHJt
L2RybS5oDQo+PiArKysgYi9pbmNsdWRlL3VhcGkvZHJtL2RybS5oDQo+PiBAQCAtNzc3LDExICs3
NzcsMTIgQEAgc3RydWN0IGRybV9zeW5jb2JqX2FycmF5IHsNCj4+ICAgIAlfX3UzMiBwYWQ7DQo+
PiAgICB9Ow0KPj4gICAgDQo+PiArI2RlZmluZSBEUk1fU1lOQ09CSl9RVUVSWV9GTEFHU19MQVNU
X1NVQk1JVFRFRCAoMSA8PCAwKSAvKiBsYXN0IGF2YWlsYWJsZSBwb2ludCBvbiB0aW1lbGluZSBz
eW5jb2JqICovDQo+PiAgICBzdHJ1Y3QgZHJtX3N5bmNvYmpfdGltZWxpbmVfYXJyYXkgew0KPj4g
ICAgCV9fdTY0IGhhbmRsZXM7DQo+PiAgICAJX191NjQgcG9pbnRzOw0KPj4gICAgCV9fdTMyIGNv
dW50X2hhbmRsZXM7DQo+PiAtCV9fdTMyIHBhZDsNCj4+ICsJX191MzIgZmxhZ3M7DQo+PiAgICB9
Ow0KPj4gICAgDQo+PiAgICANCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNr
dG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2Ry
aS1kZXZlbA==
