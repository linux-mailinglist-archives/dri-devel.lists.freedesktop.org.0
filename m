Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EA0D3B6443
	for <lists+dri-devel@lfdr.de>; Wed, 18 Sep 2019 15:20:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0FBAC6EF3D;
	Wed, 18 Sep 2019 13:20:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM05-DM3-obe.outbound.protection.outlook.com
 (mail-eopbgr730077.outbound.protection.outlook.com [40.107.73.77])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B67146EF3D
 for <dri-devel@lists.freedesktop.org>; Wed, 18 Sep 2019 13:20:10 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=P5oQUF2ZeI2jbsiTo42hWoDq8pLDx42XZMLzPOCULAPxykKlk0qDBpFWOvbYb32gy6ypIF5COZoo8DsBCwz2FT5MMevcGd6ZBOD9tVF/e5SR2nHAF4sXd2C62zM6vsXDxtL/aRhINLWP8pPuXlO7CuEjGahgvVfQtD5y83zXRl7MN8P+rxSN8mt3k8aJye4+OS0lCfkZUIVC5IZ1TSaBew/sy3Vcs19mD3NdRFVutrAunNiezUS6DRoW3kI/kHISyKdS+wouIA9edP+TG0w9lbjt05I6ycB3eDAGD1DuymgSnkleVKhfzn4KPjIZ70NNFjlEZyAQDKBzp88iwArfBA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=c6oRHYH3+/OuYSLSAIJ3pIeysalzgmJGbmlrYmEFr6o=;
 b=BsUx56Jig9NBgaNYFOPkm/O/8dyVIlUKT5TstEBJwMIuYYkvcSWGpZ9OzkjM4LWLgxfmHo0FlaOL36KJf3vPMBL35lGKBG0imQgdOdZ/3wYW1SE+sqLHZHhvfqFSN7tJp54LSa6xg4Q8Hben2fbxXeBBOICHHnFhoCIQe6HAomf7J4IIQ/zHncT9iZ8L5GAieee0F5P+6tpCta+kyhIXdxrrHqszeDWKmhwfheK5LrPRcknNMmdAv1JLJ0P/hvvQS5sgH2vg8IP7wo8CDKz6EPlfuoKtQWDGUHctGGRMIVRETwicgMaMpEL7CaTh8zCG7Wff7VxFJ8JM9jHiKtn/YA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vmware.com; dmarc=pass action=none header.from=vmware.com;
 dkim=pass header.d=vmware.com; arc=none
Received: from MN2PR05MB6141.namprd05.prod.outlook.com (20.178.241.217) by
 MN2PR05MB6912.namprd05.prod.outlook.com (10.255.90.88) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2284.13; Wed, 18 Sep 2019 13:20:08 +0000
Received: from MN2PR05MB6141.namprd05.prod.outlook.com
 ([fe80::9861:5501:d72f:d977]) by MN2PR05MB6141.namprd05.prod.outlook.com
 ([fe80::9861:5501:d72f:d977%2]) with mapi id 15.20.2284.009; Wed, 18 Sep 2019
 13:20:08 +0000
From: Thomas Hellstrom <thellstrom@vmware.com>
To: "ckoenig.leichtzumerken@gmail.com" <ckoenig.leichtzumerken@gmail.com>
Subject: Re-review? WAS  [PATCH 2/7] drm/ttm: Remove explicit typecasts of
 vm_private_data
Thread-Topic: Re-review? WAS  [PATCH 2/7] drm/ttm: Remove explicit typecasts
 of vm_private_data
Thread-Index: AQHVbiDtwQMdPk1zvUKrZrSOfVM7racxa1EA
Date: Wed, 18 Sep 2019 13:20:07 +0000
Message-ID: <5e4546771edfd92291538612676c64e47d139cc2.camel@vmware.com>
References: <20190918125914.38497-1-thomas_os@shipmail.org>
 <20190918125914.38497-3-thomas_os@shipmail.org>
In-Reply-To: <20190918125914.38497-3-thomas_os@shipmail.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [155.4.205.35]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 7b2b53da-79fb-4a71-8825-08d73c3aed8d
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(5600167)(711020)(4605104)(1401327)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(2017052603328)(7193020);
 SRVR:MN2PR05MB6912; 
x-ms-traffictypediagnostic: MN2PR05MB6912:
x-microsoft-antispam-prvs: <MN2PR05MB6912106BB1C6FD40729EE914A18E0@MN2PR05MB6912.namprd05.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:1265;
x-forefront-prvs: 01644DCF4A
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(396003)(346002)(376002)(39860400002)(136003)(366004)(199004)(189003)(305945005)(6486002)(6506007)(476003)(2351001)(6512007)(1361003)(316002)(446003)(2501003)(26005)(7736002)(81156014)(66574012)(99286004)(81166006)(8676002)(6436002)(86362001)(5640700003)(66946007)(66556008)(66476007)(118296001)(64756008)(102836004)(76116006)(91956017)(3846002)(66446008)(486006)(2616005)(4326008)(71200400001)(36756003)(71190400001)(76176011)(186003)(8936002)(478600001)(14454004)(11346002)(14444005)(6916009)(25786009)(2906002)(66066001)(6116002)(5660300002)(256004);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MN2PR05MB6912;
 H:MN2PR05MB6141.namprd05.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: vmware.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: NjBn+qM9eXO+zL5LpoG0uk8EwfWaOaeiXoPshTIv8Ysg/olhVKdDt5X4n50nhbiFfLf2RGFfZ+ubAboSoW1/+5JGeKVKsvZhBVe4U8Vc9z6a/bjAITBQfoxRxIONbP/ngPZyKFQQ8eEeD+7H4qKNZAuu4/MJraZSuMlVdD19X2MLOktRMCuL87YhHHV1/UxspMXOuKTq97/ktLxt0bjA8btMKMNcoURgzQrtPmjoKRKMN2WRAMsjdR5BLnCY0yDD7XkgCHYFHcauLNNCSlUIBoV8HSw30KHw26aatjqrcjBiQGL6nBkqGHvLq5C+e6QTbxPitwsVSgma19nqfZarfs6p8TTfHWbWsuwQb2fV3z0kBOUfgy21YKZz3f2rNzOVMhD6VsenVGdwFtVSp5nqskfCMf7/rGdG653u8YrhlQM=
x-ms-exchange-transport-forked: True
Content-ID: <20B0210557167441B138A0EEC774B013@namprd05.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: vmware.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7b2b53da-79fb-4a71-8825-08d73c3aed8d
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Sep 2019 13:20:08.5241 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b39138ca-3cee-4b4a-a4d6-cd83d9dd62f0
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: mPH6jBsh4EXONc7lV9hO8LtEzwa74rWh2hEh60gtuvd3fp5YRPPf12a1gYmSl9f9GskfdNAIxdjPz5FtA5jLnw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR05MB6912
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=vmware.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=c6oRHYH3+/OuYSLSAIJ3pIeysalzgmJGbmlrYmEFr6o=;
 b=kEfYurnTDGehRqzpOLPOlyTVAmIb7U+za0xtL07Rtn0XOTXntdOhXSBDI2bGuzLD5CARvzg2schiQbfonR4TZ5xn01o0j4jMIqPw6k3NfZYpEAbcDeYMKDvpO0xX52pT3Sxzr+VveY2ukxI44JEEV6wA+RgThkisk5Uz4TN4i30=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=thellstrom@vmware.com; 
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
Cc: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGksIENocmlzdGlhbiENCg0KU2luY2UgSSBpbnRyb2R1Y2VkIHRoaXMgcGF0Y2ggYW5kIGNoYW5n
ZWQgdGhlIFRUTSBWTSBoZWxwZXIgcGF0Y2gNCmVub3VnaCB0byBtb3RpdmF0ZSByZW1vdmluZyB5
b3VyIFItQiwgSSB3b25kZXIgd2hldGhlciB5b3UgY291bGQgZG8gYQ0KcXVpY2sgcmV2aWV3IG9u
IHRoZXNlIHR3byBhbmQgaWYgT0sgYWxzbyBhY2sgbWVyZ2luZyB0aHJvdWdoIHZtd2dmeD8NCg0K
VGhhbmtzLA0KVGhvbWFzDQoNCg0KT24gV2VkLCAyMDE5LTA5LTE4IGF0IDE0OjU5ICswMjAwLCBU
aG9tYXMgSGVsbHN0csO2bSAoVk13YXJlKSB3cm90ZToNCj4gRnJvbTogVGhvbWFzIEhlbGxzdHJv
bSA8dGhlbGxzdHJvbUB2bXdhcmUuY29tPg0KPiANCj4gVGhlIGV4cGxpY2l0IHR5cGNhc3RzIGFy
ZSBtZWFuaW5nbGVzcywgc28gcmVtb3ZlIHRoZW0uDQo+IA0KPiBTdWdnZXN0ZWQtYnk6IE1hdHRo
ZXcgV2lsY294IDx3aWxseUBpbmZyYWRlYWQub3JnPg0KPiBTaWduZWQtb2ZmLWJ5OiBUaG9tYXMg
SGVsbHN0cm9tIDx0aGVsbHN0cm9tQHZtd2FyZS5jb20+DQo+IC0tLQ0KPiAgZHJpdmVycy9ncHUv
ZHJtL3R0bS90dG1fYm9fdm0uYyB8IDggKysrLS0tLS0NCj4gIDEgZmlsZSBjaGFuZ2VkLCAzIGlu
c2VydGlvbnMoKyksIDUgZGVsZXRpb25zKC0pDQo+IA0KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9n
cHUvZHJtL3R0bS90dG1fYm9fdm0uYw0KPiBiL2RyaXZlcnMvZ3B1L2RybS90dG0vdHRtX2JvX3Zt
LmMNCj4gaW5kZXggNzZlZWRiOTYzNjkzLi44OTYzNTQ2YmYyNDUgMTAwNjQ0DQo+IC0tLSBhL2Ry
aXZlcnMvZ3B1L2RybS90dG0vdHRtX2JvX3ZtLmMNCj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL3R0
bS90dG1fYm9fdm0uYw0KPiBAQCAtMTA5LDggKzEwOSw3IEBAIHN0YXRpYyB1bnNpZ25lZCBsb25n
IHR0bV9ib19pb19tZW1fcGZuKHN0cnVjdA0KPiB0dG1fYnVmZmVyX29iamVjdCAqYm8sDQo+ICBz
dGF0aWMgdm1fZmF1bHRfdCB0dG1fYm9fdm1fZmF1bHQoc3RydWN0IHZtX2ZhdWx0ICp2bWYpDQo+
ICB7DQo+ICAJc3RydWN0IHZtX2FyZWFfc3RydWN0ICp2bWEgPSB2bWYtPnZtYTsNCj4gLQlzdHJ1
Y3QgdHRtX2J1ZmZlcl9vYmplY3QgKmJvID0gKHN0cnVjdCB0dG1fYnVmZmVyX29iamVjdCAqKQ0K
PiAtCSAgICB2bWEtPnZtX3ByaXZhdGVfZGF0YTsNCj4gKwlzdHJ1Y3QgdHRtX2J1ZmZlcl9vYmpl
Y3QgKmJvID0gdm1hLT52bV9wcml2YXRlX2RhdGE7DQo+ICAJc3RydWN0IHR0bV9ib19kZXZpY2Ug
KmJkZXYgPSBiby0+YmRldjsNCj4gIAl1bnNpZ25lZCBsb25nIHBhZ2Vfb2Zmc2V0Ow0KPiAgCXVu
c2lnbmVkIGxvbmcgcGFnZV9sYXN0Ow0KPiBAQCAtMzAyLDggKzMwMSw3IEBAIHN0YXRpYyB2bV9m
YXVsdF90IHR0bV9ib192bV9mYXVsdChzdHJ1Y3Qgdm1fZmF1bHQNCj4gKnZtZikNCj4gIA0KPiAg
c3RhdGljIHZvaWQgdHRtX2JvX3ZtX29wZW4oc3RydWN0IHZtX2FyZWFfc3RydWN0ICp2bWEpDQo+
ICB7DQo+IC0Jc3RydWN0IHR0bV9idWZmZXJfb2JqZWN0ICpibyA9DQo+IC0JICAgIChzdHJ1Y3Qg
dHRtX2J1ZmZlcl9vYmplY3QgKil2bWEtPnZtX3ByaXZhdGVfZGF0YTsNCj4gKwlzdHJ1Y3QgdHRt
X2J1ZmZlcl9vYmplY3QgKmJvID0gdm1hLT52bV9wcml2YXRlX2RhdGE7DQo+ICANCj4gIAlXQVJO
X09OKGJvLT5iZGV2LT5kZXZfbWFwcGluZyAhPSB2bWEtPnZtX2ZpbGUtPmZfbWFwcGluZyk7DQo+
ICANCj4gQEAgLTMxMiw3ICszMTAsNyBAQCBzdGF0aWMgdm9pZCB0dG1fYm9fdm1fb3BlbihzdHJ1
Y3Qgdm1fYXJlYV9zdHJ1Y3QNCj4gKnZtYSkNCj4gIA0KPiAgc3RhdGljIHZvaWQgdHRtX2JvX3Zt
X2Nsb3NlKHN0cnVjdCB2bV9hcmVhX3N0cnVjdCAqdm1hKQ0KPiAgew0KPiAtCXN0cnVjdCB0dG1f
YnVmZmVyX29iamVjdCAqYm8gPSAoc3RydWN0IHR0bV9idWZmZXJfb2JqZWN0ICopdm1hLQ0KPiA+
dm1fcHJpdmF0ZV9kYXRhOw0KPiArCXN0cnVjdCB0dG1fYnVmZmVyX29iamVjdCAqYm8gPSB2bWEt
PnZtX3ByaXZhdGVfZGF0YTsNCj4gIA0KPiAgCXR0bV9ib19wdXQoYm8pOw0KPiAgCXZtYS0+dm1f
cHJpdmF0ZV9kYXRhID0gTlVMTDsNCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVk
ZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZv
L2RyaS1kZXZlbA==
