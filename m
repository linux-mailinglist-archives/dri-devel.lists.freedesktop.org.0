Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A61BF562EB
	for <lists+dri-devel@lfdr.de>; Wed, 26 Jun 2019 09:10:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4582D6E2A0;
	Wed, 26 Jun 2019 07:10:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-CY1-obe.outbound.protection.outlook.com
 (mail-eopbgr760089.outbound.protection.outlook.com [40.107.76.89])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1394B6E29D;
 Wed, 26 Jun 2019 07:10:22 +0000 (UTC)
Received: from DM5PR12MB1546.namprd12.prod.outlook.com (10.172.36.23) by
 DM5PR12MB1243.namprd12.prod.outlook.com (10.168.237.22) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2008.16; Wed, 26 Jun 2019 07:10:21 +0000
Received: from DM5PR12MB1546.namprd12.prod.outlook.com
 ([fe80::7d27:3c4d:aed6:2935]) by DM5PR12MB1546.namprd12.prod.outlook.com
 ([fe80::7d27:3c4d:aed6:2935%6]) with mapi id 15.20.2008.017; Wed, 26 Jun 2019
 07:10:21 +0000
From: "Koenig, Christian" <Christian.Koenig@amd.com>
To: Daniel Vetter <daniel.vetter@ffwll.ch>, DRI Development
 <dri-devel@lists.freedesktop.org>
Subject: Re: [PATCH 4/7] drm/radeon: Fill out gem_object->resv
Thread-Topic: [PATCH 4/7] drm/radeon: Fill out gem_object->resv
Thread-Index: AQHVK5Z+MuP4Gx5h7EqaBfOPgk4gJqathTOA
Date: Wed, 26 Jun 2019 07:10:21 +0000
Message-ID: <4cfa949e-1a20-149c-0758-e1bd97fd3cf5@amd.com>
References: <20190625204208.5614-1-daniel.vetter@ffwll.ch>
 <20190625204208.5614-5-daniel.vetter@ffwll.ch>
In-Reply-To: <20190625204208.5614-5-daniel.vetter@ffwll.ch>
Accept-Language: de-DE, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
x-originating-ip: [2a02:908:1252:fb60:be8a:bd56:1f94:86e7]
x-clientproxiedby: AM6P195CA0014.EURP195.PROD.OUTLOOK.COM
 (2603:10a6:209:81::27) To DM5PR12MB1546.namprd12.prod.outlook.com
 (2603:10b6:4:8::23)
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 9bfbfa5d-4c67-4617-ccf1-08d6fa0559ed
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:DM5PR12MB1243; 
x-ms-traffictypediagnostic: DM5PR12MB1243:
x-microsoft-antispam-prvs: <DM5PR12MB124384858B9138B6E648E7FB83E20@DM5PR12MB1243.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-forefront-prvs: 00808B16F3
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(376002)(366004)(396003)(346002)(136003)(39860400002)(199004)(189003)(486006)(6436002)(65806001)(14454004)(8676002)(11346002)(446003)(6486002)(71190400001)(71200400001)(7736002)(6246003)(81166006)(305945005)(2616005)(476003)(256004)(36756003)(14444005)(81156014)(4326008)(99286004)(66946007)(64756008)(102836004)(66446008)(66556008)(5660300002)(73956011)(25786009)(53936002)(66574012)(76176011)(186003)(8936002)(6116002)(386003)(46003)(2906002)(316002)(86362001)(31696002)(229853002)(68736007)(478600001)(58126008)(64126003)(6506007)(52116002)(6512007)(72206003)(65956001)(66476007)(65826007)(54906003)(110136005)(31686004);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DM5PR12MB1243;
 H:DM5PR12MB1546.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: WazBrqQP9BCLfna4jGXG1b4JHO88x6P/9cBuUznuCHHZaM2XbUH4iKZeN1BBBhHLfxjRBl7OlwPSl3wqKfGkqbydcgnc10RsmZa3w0mCWWvfyonE5ifBulgaB7Ux/nFcrPCMtFaZwXUFozJoWS0z+SfJuyiN+vjJ2jE2MYsbyaXY4XfuiJD5hCPuu6D2me7b+3bnM1jiTqAnlJNaFLM2UKyGnHBswoD4QGJrAiq7DoRqPHJrbEkZw8nCNJRLzVKg2nOmDVP0JuWG01/9yjXz2rwI9RInPZk+ytxAw+XCno0BKwYQqDIYHxreqA36exoWEh9HrD7PGQTWzlTbMrcAV6ZvyICkTnt/K9GdOpkQQCHn8vXR0HzYSriU6yc7rwwAqu7rdkyFFQYv8SCtRFoj2SDIv3amO9doajA+6qjnqL0=
Content-ID: <1755CED818FE6A43A4E6E20648F9E1D5@namprd12.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9bfbfa5d-4c67-4617-ccf1-08d6fa0559ed
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Jun 2019 07:10:21.2363 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ckoenig@amd.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR12MB1243
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gsw7eDSGVjn9SFvVtNR1ZO7xPLUJszHzAkwdGCdqDk8=;
 b=1WlSxI6lLo2YLSUZIvIyi+m+7WJ/U13Ouga7Pv/v5mTgTfEUMafqYX0TFIL+hKEYA/hUeGRF5X8fh8/a+I4UmpmN4frIiLRs0Kv2AKwKiT2AS4+zbMWd6Bfqx6l4dX4Jn4x9hnv75NADNJefXgH0HoOY8oj79BtDtTGOBHiEbvQ=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Christian.Koenig@amd.com; 
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
Cc: "Deucher, Alexander" <Alexander.Deucher@amd.com>,
 Daniel Vetter <daniel.vetter@intel.com>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>,
 Emil Velikov <emil.velikov@collabora.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

VGhvc2UgcGF0Y2hlcyB3b3VsZCBiZWNvbWUgc3VwZXJmbHVvdXMgd2hlbiBtZXJnaW5nIEdlcmQn
cyB3b3JrLg0KDQpCdXQgSSdtIG5vdCBzdXJlIGlmIHRoYXQgaXMgZ29pbmcgdG8gZmx5IHNvb24g
b3Igbm90Lg0KDQpDaHJpc3RpYW4uDQoNCkFtIDI1LjA2LjE5IHVtIDIyOjQyIHNjaHJpZWIgRGFu
aWVsIFZldHRlcjoNCj4gVGhhdCB3YXkgd2UgY2FuIGRpdGNoIG91ciBnZW1fcHJpbWVfcmVzX29i
aiBpbXBsZW1lbnRhdGlvbi4gU2luY2UgdHRtDQo+IGFic29sdXRlbHkgbmVlZHMgdGhlIHJpZ2h0
IHJlc2VydmF0aW9uIG9iamVjdCBhbGwgdGhlIGJvaWxlcnBsYXRlIGlzDQo+IGFscmVhZHkgdGhl
cmUgYW5kIHdlIGp1c3QgaGF2ZSB0byB3aXJlIGl0IHVwIGNvcnJlY3RseS4NCj4NCj4gTm90ZSB0
aGF0IGdlbS9wcmltZSBkb2Vzbid0IGNhcmUgd2hlbiB3ZSBkbyB0aGlzLCBhcyBsb25nIGFzIHdl
IGRvIGl0DQo+IGJlZm9yZSB0aGUgYm8gaXMgcmVnaXN0ZXJlZCBhbmQgc29tZW9uZSBjYW4gY2Fs
bCB0aGUgaGFuZGxlMmZkIGlvY3RsDQo+IG9uIGl0Lg0KPg0KPiBBc2lkZTogdHRtX2J1ZmZlcl9v
YmplY3QudHRtX3Jlc3YgY291bGQgcHJvYmFibHkgYmUgZGl0Y2hlZCBpbiBmYXZvdXINCj4gb2Yg
YWx3YXlzIHBhc3NpbmcgYSBub24tTlVMTCByZXN2IHRvIHR0bV9ib19pbml0KCkuIEF0IGxlYXN0
IGZvciBnZW0NCj4gZHJpdmVycyB0aGF0IHdvdWxkIGF2b2lkIGhhdmluZyB0d28gb2YgdGhlc2Us
IG9uIGluIHR0bV9idWZmZXJfb2JqZWN0DQo+IGFuZCB0aGUgb3RoZXIgaW4gZHJtX2dlbV9vYmpl
Y3QsIG9uZSBqdXN0IHRoZXJlIGZvciBjb25mdXNpb24uDQo+DQo+IFJldmlld2VkLWJ5OiBFbWls
IFZlbGlrb3YgPGVtaWwudmVsaWtvdkBjb2xsYWJvcmEuY29tPg0KPiBTaWduZWQtb2ZmLWJ5OiBE
YW5pZWwgVmV0dGVyIDxkYW5pZWwudmV0dGVyQGludGVsLmNvbT4NCj4gQ2M6IEFsZXggRGV1Y2hl
ciA8YWxleGFuZGVyLmRldWNoZXJAYW1kLmNvbT4NCj4gQ2M6ICJDaHJpc3RpYW4gS8O2bmlnIiA8
Y2hyaXN0aWFuLmtvZW5pZ0BhbWQuY29tPg0KPiBDYzogIkRhdmlkIChDaHVuTWluZykgWmhvdSIg
PERhdmlkMS5aaG91QGFtZC5jb20+DQo+IENjOiBhbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9y
Zw0KPiAtLS0NCj4gICBkcml2ZXJzL2dwdS9kcm0vcmFkZW9uL3JhZGVvbl9kcnYuYyAgICB8IDIg
LS0NCj4gICBkcml2ZXJzL2dwdS9kcm0vcmFkZW9uL3JhZGVvbl9vYmplY3QuYyB8IDEgKw0KPiAg
IGRyaXZlcnMvZ3B1L2RybS9yYWRlb24vcmFkZW9uX3ByaW1lLmMgIHwgNyAtLS0tLS0tDQo+ICAg
MyBmaWxlcyBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgOSBkZWxldGlvbnMoLSkNCj4NCj4gZGlm
ZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9yYWRlb24vcmFkZW9uX2Rydi5jIGIvZHJpdmVycy9n
cHUvZHJtL3JhZGVvbi9yYWRlb25fZHJ2LmMNCj4gaW5kZXggNDQwM2U3NmUxYWUwLi5hNGE3OGRm
ZGVmMzcgMTAwNjQ0DQo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9yYWRlb24vcmFkZW9uX2Rydi5j
DQo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9yYWRlb24vcmFkZW9uX2Rydi5jDQo+IEBAIC0xNTIs
NyArMTUyLDYgQEAgc3RydWN0IGRybV9nZW1fb2JqZWN0ICpyYWRlb25fZ2VtX3ByaW1lX2ltcG9y
dF9zZ190YWJsZShzdHJ1Y3QgZHJtX2RldmljZSAqZGV2LA0KPiAgIAkJCQkJCQlzdHJ1Y3Qgc2df
dGFibGUgKnNnKTsNCj4gICBpbnQgcmFkZW9uX2dlbV9wcmltZV9waW4oc3RydWN0IGRybV9nZW1f
b2JqZWN0ICpvYmopOw0KPiAgIHZvaWQgcmFkZW9uX2dlbV9wcmltZV91bnBpbihzdHJ1Y3QgZHJt
X2dlbV9vYmplY3QgKm9iaik7DQo+IC1zdHJ1Y3QgcmVzZXJ2YXRpb25fb2JqZWN0ICpyYWRlb25f
Z2VtX3ByaW1lX3Jlc19vYmooc3RydWN0IGRybV9nZW1fb2JqZWN0ICopOw0KPiAgIHZvaWQgKnJh
ZGVvbl9nZW1fcHJpbWVfdm1hcChzdHJ1Y3QgZHJtX2dlbV9vYmplY3QgKm9iaik7DQo+ICAgdm9p
ZCByYWRlb25fZ2VtX3ByaW1lX3Z1bm1hcChzdHJ1Y3QgZHJtX2dlbV9vYmplY3QgKm9iaiwgdm9p
ZCAqdmFkZHIpOw0KPiAgIA0KPiBAQCAtNTY2LDcgKzU2NSw2IEBAIHN0YXRpYyBzdHJ1Y3QgZHJt
X2RyaXZlciBrbXNfZHJpdmVyID0gew0KPiAgIAkuZ2VtX3ByaW1lX2V4cG9ydCA9IHJhZGVvbl9n
ZW1fcHJpbWVfZXhwb3J0LA0KPiAgIAkuZ2VtX3ByaW1lX3BpbiA9IHJhZGVvbl9nZW1fcHJpbWVf
cGluLA0KPiAgIAkuZ2VtX3ByaW1lX3VucGluID0gcmFkZW9uX2dlbV9wcmltZV91bnBpbiwNCj4g
LQkuZ2VtX3ByaW1lX3Jlc19vYmogPSByYWRlb25fZ2VtX3ByaW1lX3Jlc19vYmosDQo+ICAgCS5n
ZW1fcHJpbWVfZ2V0X3NnX3RhYmxlID0gcmFkZW9uX2dlbV9wcmltZV9nZXRfc2dfdGFibGUsDQo+
ICAgCS5nZW1fcHJpbWVfaW1wb3J0X3NnX3RhYmxlID0gcmFkZW9uX2dlbV9wcmltZV9pbXBvcnRf
c2dfdGFibGUsDQo+ICAgCS5nZW1fcHJpbWVfdm1hcCA9IHJhZGVvbl9nZW1fcHJpbWVfdm1hcCwN
Cj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9yYWRlb24vcmFkZW9uX29iamVjdC5jIGIv
ZHJpdmVycy9ncHUvZHJtL3JhZGVvbi9yYWRlb25fb2JqZWN0LmMNCj4gaW5kZXggMjFmNzNmYzg2
ZjM4Li43YTJiYWQ4NDNmOGEgMTAwNjQ0DQo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9yYWRlb24v
cmFkZW9uX29iamVjdC5jDQo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9yYWRlb24vcmFkZW9uX29i
amVjdC5jDQo+IEBAIC0yNjIsNiArMjYyLDcgQEAgaW50IHJhZGVvbl9ib19jcmVhdGUoc3RydWN0
IHJhZGVvbl9kZXZpY2UgKnJkZXYsDQo+ICAgCXIgPSB0dG1fYm9faW5pdCgmcmRldi0+bW1hbi5i
ZGV2LCAmYm8tPnRibywgc2l6ZSwgdHlwZSwNCj4gICAJCQkmYm8tPnBsYWNlbWVudCwgcGFnZV9h
bGlnbiwgIWtlcm5lbCwgYWNjX3NpemUsDQo+ICAgCQkJc2csIHJlc3YsICZyYWRlb25fdHRtX2Jv
X2Rlc3Ryb3kpOw0KPiArCWJvLT5nZW1fYmFzZS5yZXN2ID0gYm8tPnRiby5yZXN2Ow0KPiAgIAl1
cF9yZWFkKCZyZGV2LT5wbS5tY2xrX2xvY2spOw0KPiAgIAlpZiAodW5saWtlbHkociAhPSAwKSkg
ew0KPiAgIAkJcmV0dXJuIHI7DQo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vcmFkZW9u
L3JhZGVvbl9wcmltZS5jIGIvZHJpdmVycy9ncHUvZHJtL3JhZGVvbi9yYWRlb25fcHJpbWUuYw0K
PiBpbmRleCBkZWFmZmNlNTBhMmUuLjhjZTNlODA0NWQ0MiAxMDA2NDQNCj4gLS0tIGEvZHJpdmVy
cy9ncHUvZHJtL3JhZGVvbi9yYWRlb25fcHJpbWUuYw0KPiArKysgYi9kcml2ZXJzL2dwdS9kcm0v
cmFkZW9uL3JhZGVvbl9wcmltZS5jDQo+IEBAIC0xMTcsMTMgKzExNyw2IEBAIHZvaWQgcmFkZW9u
X2dlbV9wcmltZV91bnBpbihzdHJ1Y3QgZHJtX2dlbV9vYmplY3QgKm9iaikNCj4gICB9DQo+ICAg
DQo+ICAgDQo+IC1zdHJ1Y3QgcmVzZXJ2YXRpb25fb2JqZWN0ICpyYWRlb25fZ2VtX3ByaW1lX3Jl
c19vYmooc3RydWN0IGRybV9nZW1fb2JqZWN0ICpvYmopDQo+IC17DQo+IC0Jc3RydWN0IHJhZGVv
bl9ibyAqYm8gPSBnZW1fdG9fcmFkZW9uX2JvKG9iaik7DQo+IC0NCj4gLQlyZXR1cm4gYm8tPnRi
by5yZXN2Ow0KPiAtfQ0KPiAtDQo+ICAgc3RydWN0IGRtYV9idWYgKnJhZGVvbl9nZW1fcHJpbWVf
ZXhwb3J0KHN0cnVjdCBkcm1fZ2VtX29iamVjdCAqZ29iaiwNCj4gICAJCQkJCWludCBmbGFncykN
Cj4gICB7DQoNCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpo
dHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
