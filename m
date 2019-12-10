Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5422911927F
	for <lists+dri-devel@lfdr.de>; Tue, 10 Dec 2019 21:54:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1E8A76E17F;
	Tue, 10 Dec 2019 20:54:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-CY1-obe.outbound.protection.outlook.com
 (mail-eopbgr760088.outbound.protection.outlook.com [40.107.76.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CB9856E17F;
 Tue, 10 Dec 2019 20:54:18 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XdOKVRHi7nd15Ll5xo0lrV6JNVFwSQEm17rP3zmccg4LKoMjITfQz9wvGi89OtPT5Y/B8Hg9wv9gnlpKIKFo7Zjb6426BcjH1koQzQk1NG1T807nkYvCg8hYGYBGxWhyegTrpi8fUqFZSO2tArXekUCC7nM4JHLpmI4cztG3QsuUGGF3AxT2BCuKWrdczm0CMydX2VapbA4nLtFVscGJM/rJGGhC5+toLDG3VoaVaaQ50LjUObb4tHBjQ1vSKgzB5GtOiLyKQNlb261ugflsBDdXn7TeqLm2Md8Wq1YNBOouhCBxhGu0Dz/uOdhfoz1rn1kjw2VrOSK9rONZmIOC1A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eIlg1MoEHLhc7RXIs6j4X2tHTkbESPFaewnTu6oHeEM=;
 b=MMy6uz0fXAXd+a28jrDjP73vM5kuyn0wU0gyc09fAVocDzg/eXmH5NGj+2oo6zllaLeNRGMFg6UOIeT+XXN9+oHOK7uyK3PbiEWd9uzdhSSCgCv5sMB1lfcoRS5pn59W9/0FyPKJNM9FiDLDSAiNacqITBLPNH6xrF9O8UIZo3VM3WaSn3YFL40wO1Ti3lRnWIZ3Ix3Z/a3YedQreJO/2fXQEmVaV0eUkjtBZmsu3mF1sFOY1hbvhwYCUuUVh3cDpVQFsFyGfRdME9fo5dGP7yTjg1riYeMpGzsgmWCdgYlEcdZrP5k85UGGQaH3uhQ+hzFGXDO5ThNoxn4jXrvYJg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eIlg1MoEHLhc7RXIs6j4X2tHTkbESPFaewnTu6oHeEM=;
 b=SD9l7My4E/H92RFwW+RWJJ3kya4S3jI/ugpFHhZoeIytVO3tw5kG5VuXYQZGo0dFaREytT4mNyZHXRXpfyTcSg+s9NRFI25n60aTMtfhk5tlX9Gvb5jGgRIUgSCWdZoKtMxNkDInyornSpgU4MdqjRIJFd65ALfhFnLRvSU2RYU=
Received: from DM6PR12MB3466.namprd12.prod.outlook.com (20.178.198.225) by
 DM6PR12MB2956.namprd12.prod.outlook.com (20.179.104.138) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2516.17; Tue, 10 Dec 2019 20:54:17 +0000
Received: from DM6PR12MB3466.namprd12.prod.outlook.com
 ([fe80::8954:6ba3:6dca:4616]) by DM6PR12MB3466.namprd12.prod.outlook.com
 ([fe80::8954:6ba3:6dca:4616%7]) with mapi id 15.20.2516.018; Tue, 10 Dec 2019
 20:54:16 +0000
From: "Liu, Zhan" <Zhan.Liu@amd.com>
To: Arnd Bergmann <arnd@arndb.de>, "Wentland, Harry" <Harry.Wentland@amd.com>, 
 "Li, Sun peng (Leo)" <Sunpeng.Li@amd.com>, "Deucher, Alexander"
 <Alexander.Deucher@amd.com>, "Koenig, Christian" <Christian.Koenig@amd.com>,
 "Zhou, David(ChunMing)" <David1.Zhou@amd.com>, David Airlie
 <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>
Subject: RE: [PATCH] drm/amd/display: fix undefined struct member reference
Thread-Topic: [PATCH] drm/amd/display: fix undefined struct member reference
Thread-Index: AQHVr5jCDSQ8Kh1RPUu+2BYD1t4WDqez2DAA
Date: Tue, 10 Dec 2019 20:54:16 +0000
Message-ID: <DM6PR12MB34665D3A13E23D8AA7E2E7919E5B0@DM6PR12MB3466.namprd12.prod.outlook.com>
References: <20191210203101.2663341-1-arnd@arndb.de>
In-Reply-To: <20191210203101.2663341-1-arnd@arndb.de>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=Zhan.Liu@amd.com; 
x-originating-ip: [165.204.55.250]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 8c3afa53-8c7b-486b-4440-08d77db31eef
x-ms-traffictypediagnostic: DM6PR12MB2956:|DM6PR12MB2956:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <DM6PR12MB2956CD6001DC0C5EA032D5C59E5B0@DM6PR12MB2956.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-forefront-prvs: 02475B2A01
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(366004)(199004)(13464003)(189003)(7696005)(81166006)(66476007)(64756008)(76116006)(8676002)(55016002)(71200400001)(6506007)(9686003)(66556008)(52536014)(81156014)(66946007)(66446008)(53546011)(5660300002)(8936002)(4326008)(26005)(186003)(33656002)(86362001)(498600001)(2906002)(110136005)(54906003)(921003)(1121003);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DM6PR12MB2956;
 H:DM6PR12MB3466.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: dIeMoLj2DJejTiiI+Yul393uoIUEkbw8kQT8PPuVupifzvxelj5EHTicJ+TSx2/N678SaB39gqAo9AGRiwrdgX/ToaIXKPL/4BHMoASKGCBbU7032oK6j8xe7+JquiOnB+xuQxNm/C5qoTXgsMGZHjeUYdytj0okSvvIj+2ziJPVTVelo3IbV26akKVDWO09McC2fOce9n3p6roMQ4O3tmyV5f15PArOqYFcnkpZXWbfnxsJse3ag+8od/QXpgxufxL9/Pf8WVDPowkaJ3ltbWzL84C92f9J+1J07ZThwfWgPIquNkofiiB11e3jtI6MtVNLanjx/ZjfPC5bRuLscH58bhvBaVu5AjBec+zKhM9LYweS+6HKmLYqJfHLwW6HC5oTIbNs81c/j5JFp6XGnT1EFVwP3kLw00mCtFnYwuIDlMPQOa1GM2ElipYgPAV30rpq0zbtKR7P7eDD/vhAaFWvzpV0baxd2RIXL3fMBHVpQ1qKBTm8aRPfh/c05zXYm1/4du69FX1zmr5loKJtJA==
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8c3afa53-8c7b-486b-4440-08d77db31eef
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Dec 2019 20:54:16.5780 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: qifZ2HLxcc9qgsp6xZQwytMcTyv3G3Sbt9PRrCZ1BNdFVUXAbP5X73Vw/QgIiW1g
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB2956
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.29
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
Cc: "Liu, Charlene" <Charlene.Liu@amd.com>, "Yang, Eric" <Eric.Yang2@amd.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>, "Cornij,
 Nikola" <Nikola.Cornij@amd.com>, "Laktyushkin,
 Dmytro" <Dmytro.Laktyushkin@amd.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, "Lei,
 Jun" <Jun.Lei@amd.com>, "Lakha, Bhawanpreet" <Bhawanpreet.Lakha@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogQXJuZCBCZXJnbWFubiA8
YXJuZEBhcm5kYi5kZT4NCj4gU2VudDogMjAxOS9EZWNlbWJlci8xMCwgVHVlc2RheSAzOjMxIFBN
DQo+IFRvOiBXZW50bGFuZCwgSGFycnkgPEhhcnJ5LldlbnRsYW5kQGFtZC5jb20+OyBMaSwgU3Vu
IHBlbmcgKExlbykNCj4gPFN1bnBlbmcuTGlAYW1kLmNvbT47IERldWNoZXIsIEFsZXhhbmRlcg0K
PiA8QWxleGFuZGVyLkRldWNoZXJAYW1kLmNvbT47IEtvZW5pZywgQ2hyaXN0aWFuDQo+IDxDaHJp
c3RpYW4uS29lbmlnQGFtZC5jb20+OyBaaG91LCBEYXZpZChDaHVuTWluZykNCj4gPERhdmlkMS5a
aG91QGFtZC5jb20+OyBEYXZpZCBBaXJsaWUgPGFpcmxpZWRAbGludXguaWU+OyBEYW5pZWwgVmV0
dGVyDQo+IDxkYW5pZWxAZmZ3bGwuY2g+OyBMaXUsIFpoYW4gPFpoYW4uTGl1QGFtZC5jb20+DQo+
IENjOiBBcm5kIEJlcmdtYW5uIDxhcm5kQGFybmRiLmRlPjsgTGFrdHl1c2hraW4sIERteXRybw0K
PiA8RG15dHJvLkxha3R5dXNoa2luQGFtZC5jb20+OyBMYWtoYSwgQmhhd2FucHJlZXQNCj4gPEJo
YXdhbnByZWV0Lkxha2hhQGFtZC5jb20+OyBMZWksIEp1biA8SnVuLkxlaUBhbWQuY29tPjsgTGl1
LA0KPiBDaGFybGVuZSA8Q2hhcmxlbmUuTGl1QGFtZC5jb20+OyBZYW5nLCBFcmljIDxFcmljLllh
bmcyQGFtZC5jb20+Ow0KPiBDb3JuaWosIE5pa29sYSA8Tmlrb2xhLkNvcm5pakBhbWQuY29tPjsg
YW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmc7DQo+IGRyaS1kZXZlbEBsaXN0cy5mcmVlZGVz
a3RvcC5vcmc7IGxpbnV4LWtlcm5lbEB2Z2VyLmtlcm5lbC5vcmcNCj4gU3ViamVjdDogW1BBVENI
XSBkcm0vYW1kL2Rpc3BsYXk6IGZpeCB1bmRlZmluZWQgc3RydWN0IG1lbWJlciByZWZlcmVuY2UN
Cj4gDQo+IEFuIGluaXRpYWxpemF0aW9uIHdhcyBhZGRlZCBmb3IgdHdvIG9wdGlvbmFsIHN0cnVj
dCBtZW1iZXJzLiAgT25lIG9mIHRoZXNlIGlzDQo+IGFsd2F5cyBwcmVzZW50IGluIHRoZSBkY24y
MF9yZXNvdXJjZSBmaWxlLCBidXQgdGhlIG90aGVyIG9uZSBkZXBlbmRzIG9uDQo+IENPTkZJR19E
Uk1fQU1EX0RDX0RTQ19TVVBQT1JUIGFuZCBjYXVzZXMgYSBidWlsZCBmYWlsdXJlIGlmIHRoYXQg
aXMNCj4gbWlzc2luZzoNCj4gDQo+IGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1Ly4uL2Rpc3Bs
YXkvZGMvZGNuMjAvZGNuMjBfcmVzb3VyY2UuYzo5MjY6MQ0KPiA0OiBlcnJvcjogZXhjZXNzIGVs
ZW1lbnRzIGluIHN0cnVjdCBpbml0aWFsaXplciBbLVdlcnJvcl0NCj4gICAgLm51bV9kc2MgPSA1
LA0KPiANCj4gQWRkIGFub3RoZXIgI2lmZGVmIGFyb3VuZCB0aGUgYXNzaWdubWVudC4NCj4gDQo+
IEZpeGVzOiBjM2QwM2M1YTE5NmYgKCJkcm0vYW1kL2Rpc3BsYXk6IEluY2x1ZGUgbnVtX3ZtaWQg
YW5kIG51bV9kc2MNCj4gd2l0aGluIE5WMTQncyByZXNvdXJjZSBjYXBzIikNCj4gU2lnbmVkLW9m
Zi1ieTogQXJuZCBCZXJnbWFubiA8YXJuZEBhcm5kYi5kZT4NCg0KVGhhbmsgeW91IGZvciBjYXRj
aGluZyB0aGF0IPCfmIogT24gbXkgc2lkZSBJIGtlcHQgdGhhdCBmbGFnIGVuYWJsZWQgYWxsIHRo
ZSB0aW1lLCBzbyBJIGRpZG4ndCByZWFsaXplIHRoZXJlIHdhcyBhIHdhcm5pbmcgaGlkZGVuIGhl
cmUuIA0KDQpSZXZpZXdlZC1ieTogWmhhbiBMaXUgPHpoYW4ubGl1QGFtZC5jb20+DQoNCj4gLS0t
DQo+ICBkcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvZGMvZGNuMjAvZGNuMjBfcmVzb3VyY2Uu
YyB8IDIgKysNCj4gIDEgZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKykNCj4gDQo+IGRpZmYg
LS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvZGMvZGNuMjAvZGNuMjBfcmVzb3Vy
Y2UuYw0KPiBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9kYy9kY24yMC9kY24yMF9yZXNv
dXJjZS5jDQo+IGluZGV4IGZhYWI4OWQxZTY5NC4uZmRmOTNlNmVkZjQzIDEwMDY0NA0KPiAtLS0g
YS9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvZGMvZGNuMjAvZGNuMjBfcmVzb3VyY2UuYw0K
PiArKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvZGMvZGNuMjAvZGNuMjBfcmVzb3Vy
Y2UuYw0KPiBAQCAtOTIzLDcgKzkyMyw5IEBAIHN0YXRpYyBjb25zdCBzdHJ1Y3QgcmVzb3VyY2Vf
Y2FwcyByZXNfY2FwX252MTQgPSB7DQo+ICAJCS5udW1fZHdiID0gMSwNCj4gIAkJLm51bV9kZGMg
PSA1LA0KPiAgCQkubnVtX3ZtaWQgPSAxNiwNCj4gKyNpZmRlZiBDT05GSUdfRFJNX0FNRF9EQ19E
U0NfU1VQUE9SVA0KPiAgCQkubnVtX2RzYyA9IDUsDQo+ICsjZW5kaWYNCj4gIH07DQo+IA0KPiAg
c3RhdGljIGNvbnN0IHN0cnVjdCBkY19kZWJ1Z19vcHRpb25zIGRlYnVnX2RlZmF1bHRzX2RydiA9
IHsNCj4gLS0NCj4gMi4yMC4wDQoNCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVk
ZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZv
L2RyaS1kZXZlbAo=
