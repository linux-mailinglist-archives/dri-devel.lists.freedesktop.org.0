Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6776DA8345
	for <lists+dri-devel@lfdr.de>; Wed,  4 Sep 2019 14:57:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7CF8189A92;
	Wed,  4 Sep 2019 12:57:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM05-CO1-obe.outbound.protection.outlook.com
 (mail-eopbgr720066.outbound.protection.outlook.com [40.107.72.66])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8435389A92;
 Wed,  4 Sep 2019 12:57:31 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=g+WWoSTPQi3e4YqC+Si+Y72RzYssch4kOd+cZDZ4CYaDKiugasbStngR5SQ5LuPEVN6pLoSJwYbOye1c49rfaVVve66mkQgm6yhUUSD9eoTPlvVhenwZ8MAWgj2yANUW5IIEPWC8fhRIGnKrxvrdcIbz9xympWxQcBLEhwtE5F557NUejzxb7VNZhRskP2IPG988XIDn9fULH6PN5DgDnv8sSRqP+8oVXelTgI4kDVoHhH6a5rQsJm/o2U87bcfpjKNkTxVEP+UBpvR0b5Zl5aAUH6R165ptPlISngoCgP7nsEqA4GhrfkToiH7EcE3X2YKVFlITdQ3nOcUaloKjMQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aqHVgR6k4Zsg75V4roqkYDDitlWWGdEOgofUZlp0Ypc=;
 b=mRNaJKsVkD/mZZRE7eaT5QwCRHRR2RJgIZQ3oAwUCi6GlHKgNGQsk77zSlgk5yLN1ZpwlwXZiGHlgwnnC1KBp34CifbPdRB7LD7z8V43kFPoQaAdTXcTBAXoWud/LKSu7zHEtaXUmjLk+fMCFl8dWQRJV3SqoltwqFw7qigjdEKcDChSrPVDFx5nvlZyZSLaMJTCs+J27LV+RXrpV5wFZhEivlp8JUx2UhvUUYmidm8IMNbUPCL8w7KG5YJtAQvAgDQ6ZOcAjEbwA0BTwonBgaONBFHP1UQihlVAxPg3W9TpjP+8zG79PQE9bsYclmAUKkMkhbORvUvKtnetTRalxQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from BYAPR12MB3560.namprd12.prod.outlook.com (20.178.197.10) by
 BYAPR12MB3574.namprd12.prod.outlook.com (20.178.197.16) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2220.20; Wed, 4 Sep 2019 12:57:29 +0000
Received: from BYAPR12MB3560.namprd12.prod.outlook.com
 ([fe80::3930:ebfd:da9:5636]) by BYAPR12MB3560.namprd12.prod.outlook.com
 ([fe80::3930:ebfd:da9:5636%3]) with mapi id 15.20.2220.022; Wed, 4 Sep 2019
 12:57:29 +0000
From: "Kazlauskas, Nicholas" <Nicholas.Kazlauskas@amd.com>
To: Daniel Vetter <daniel.vetter@ffwll.ch>, DRI Development
 <dri-devel@lists.freedesktop.org>
Subject: Re: [PATCH 3/3] drm/atomic: Rename crtc_state->pageflip_flags to
 async_flip
Thread-Topic: [PATCH 3/3] drm/atomic: Rename crtc_state->pageflip_flags to
 async_flip
Thread-Index: AQHVYorEA3k2B1HNlkO18voN3mqgm6cbe4IA
Date: Wed, 4 Sep 2019 12:57:28 +0000
Message-ID: <c6283ffa-151a-c0be-63f7-b3a4a9c5a0f5@amd.com>
References: <20190903190642.32588-1-daniel.vetter@ffwll.ch>
 <20190903190642.32588-3-daniel.vetter@ffwll.ch>
In-Reply-To: <20190903190642.32588-3-daniel.vetter@ffwll.ch>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: YTXPR0101CA0056.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b00:1::33) To BYAPR12MB3560.namprd12.prod.outlook.com
 (2603:10b6:a03:ae::10)
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [165.204.55.250]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 5431e2bc-e83f-478f-3847-08d731377105
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600166)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:BYAPR12MB3574; 
x-ms-traffictypediagnostic: BYAPR12MB3574:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <BYAPR12MB357405455C54B095C2ADDEC6ECB80@BYAPR12MB3574.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-forefront-prvs: 0150F3F97D
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(366004)(396003)(346002)(376002)(39860400002)(136003)(189003)(199004)(102836004)(3846002)(256004)(6506007)(6436002)(110136005)(26005)(54906003)(186003)(6116002)(6246003)(36756003)(31696002)(53546011)(386003)(6486002)(2906002)(486006)(66066001)(316002)(14444005)(476003)(11346002)(2616005)(86362001)(446003)(31686004)(99286004)(66556008)(76176011)(64756008)(8936002)(7416002)(66946007)(25786009)(81166006)(81156014)(6512007)(5660300002)(8676002)(52116002)(66476007)(66574012)(53936002)(229853002)(14454004)(478600001)(305945005)(71190400001)(71200400001)(4326008)(66446008)(7736002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:BYAPR12MB3574;
 H:BYAPR12MB3560.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: 8MiPpVz6TNEAfH40q055GHAuxaT4PjOaFZVEW/CfjqZZHI1lT43/x1P8ICV/64aTIRYt8UDUD18UerbEy+XwHDFf5EQBdh+J0oDqbOchYSVzOuFq/3j72r1xIRxAqLOzz9rly9Y3STPfC/SNvxytd0CnFb3vqd3KY6lJyntU4fn6u6YAFh/sRXamUsUhIJGVE3m/IWxuS2DUFQ/EQ8mKhtapy+MqEneDsYl6Wrs2kXq0r1F3ZFzAlefpR4yqW6f4UOqlWHPy4Wkgw2+lKW4Jja8OsmNG1wsKq4OpbD/nmM6FCdyZzqsqPyDdbWCa2lsYBeU4Egf9wFeipWLyEYaGXAEHRmm1xiQTJiJVb7asbBNTIJcNxfwqUhL40F4TsbbQKjKYt+kJS5DIseMjTKoua6pRLxBa1Gz4zEoTcmo3VcY=
Content-ID: <FB8A7DB80645F94A8F43C000C9826E84@namprd12.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5431e2bc-e83f-478f-3847-08d731377105
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Sep 2019 12:57:28.8922 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: +Gvhfo6itzvyMSvXtmp4ACxLDMqfOQNjbhuzanIuWkZfRaDxekKUBCcdrHVDWeJZVgGbwr0U9lH0jwIhnYf1fg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR12MB3574
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aqHVgR6k4Zsg75V4roqkYDDitlWWGdEOgofUZlp0Ypc=;
 b=biORfFbNBYbZ/LEUC38a9XoGExcPY+dc0aFxQEptAEDd5dTxAexMD3mJGGZIn6+5DJyNGbxyPymwuPq9nbnBk+B4eIZaeG9pttPuFu9zKtcIuLoGLW3lJD/Js7K4mW2KU+IX/F7MiRtbLi+0CMxbv1/UovFjJim6FIQG6yuVUoM=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Nicholas.Kazlauskas@amd.com; 
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
Cc: Sam Ravnborg <sam@ravnborg.org>, David Airlie <airlied@linux.ie>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>, "Li,
 Sun peng \(Leo\)" <Sunpeng.Li@amd.com>, "Koenig,
 Christian" <Christian.Koenig@amd.com>, "Lakha, 
 Bhawanpreet" <Bhawanpreet.Lakha@amd.com>,
 Maxime Ripard <maxime.ripard@bootlin.com>, Ben Skeggs <bskeggs@redhat.com>,
 "Francis, David" <David.Francis@amd.com>,
 Daniel Vetter <daniel.vetter@intel.com>, Sean Paul <sean@poorly.run>,
 =?utf-8?B?TWljaGVsIETDpG56ZXI=?= <michel@daenzer.net>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gMjAxOS0wOS0wMyAzOjA2IHAubS4sIERhbmllbCBWZXR0ZXIgd3JvdGU6DQo+IEl0J3MgdGhl
IG9ubHkgZmxhZyBhbnlvbmUgYWN0dWFsbHkgY2FyZXMgYWJvdXQuIFBsdXMgaWYgd2UncmUgdW5s
dWNreSwNCj4gdGhlIGF0b21pYyBpb2N0bCBtaWdodCBuZWVkIGEgZGlmZmVyZW50IGZsYWcgZm9y
IGFzeW5jIGZsaXBzLiBTbw0KPiBiZXR0ZXIgdG8gYWJzdHJhY3QgdGhpcyBhd2F5IGZyb20gdGhl
IHVhcGkgYSBiaXQuDQo+IA0KPiBDYzogTWFhcnRlbiBMYW5raG9yc3QgPG1hYXJ0ZW4ubGFua2hv
cnN0QGxpbnV4LmludGVsLmNvbT4NCj4gQ2M6IE1pY2hlbCBEw6RuemVyIDxtaWNoZWxAZGFlbnpl
ci5uZXQ+DQo+IENjOiBBbGV4IERldWNoZXIgPGFsZXhkZXVjaGVyQGdtYWlsLmNvbT4NCj4gQ2M6
IEFkYW0gSmFja3NvbiA8YWpheEByZWRoYXQuY29tPg0KPiBDYzogU2VhbiBQYXVsIDxzZWFuQHBv
b3JseS5ydW4+DQo+IENjOiBEYXZpZCBBaXJsaWUgPGFpcmxpZWRAbGludXguaWU+DQo+IFNpZ25l
ZC1vZmYtYnk6IERhbmllbCBWZXR0ZXIgPGRhbmllbC52ZXR0ZXJAaW50ZWwuY29tPg0KPiBDYzog
TWF4aW1lIFJpcGFyZCA8bWF4aW1lLnJpcGFyZEBib290bGluLmNvbT4NCj4gQ2M6IERhbmllbCBW
ZXR0ZXIgPGRhbmllbEBmZndsbC5jaD4NCj4gQ2M6IE5pY2hvbGFzIEthemxhdXNrYXMgPG5pY2hv
bGFzLmthemxhdXNrYXNAYW1kLmNvbT4NCj4gQ2M6IExlbyBMaSA8c3VucGVuZy5saUBhbWQuY29t
Pg0KPiBDYzogSGFycnkgV2VudGxhbmQgPGhhcnJ5LndlbnRsYW5kQGFtZC5jb20+DQo+IENjOiBE
YXZpZCBGcmFuY2lzIDxEYXZpZC5GcmFuY2lzQGFtZC5jb20+DQo+IENjOiBNYXJpbyBLbGVpbmVy
IDxtYXJpby5rbGVpbmVyLmRlQGdtYWlsLmNvbT4NCj4gQ2M6IEJoYXdhbnByZWV0IExha2hhIDxC
aGF3YW5wcmVldC5MYWtoYUBhbWQuY29tPg0KPiBDYzogQmVuIFNrZWdncyA8YnNrZWdnc0ByZWRo
YXQuY29tPg0KPiBDYzogIkNocmlzdGlhbiBLw7ZuaWciIDxjaHJpc3RpYW4ua29lbmlnQGFtZC5j
b20+DQo+IENjOiBJbGlhIE1pcmtpbiA8aW1pcmtpbkBhbHVtLm1pdC5lZHU+DQo+IENjOiBTYW0g
UmF2bmJvcmcgPHNhbUByYXZuYm9yZy5vcmc+DQo+IENjOiBDaHJpcyBXaWxzb24gPGNocmlzQGNo
cmlzLXdpbHNvbi5jby51az4NCj4gLS0tDQoNClNlcmllcyBpczoNCg0KUmV2aWV3ZWQtYnk6IE5p
Y2hvbGFzIEthemxhdXNrYXMgPG5pY2hvbGFzLmthemxhdXNrYXNAYW1kLmNvbT4NCg0KSSB3b3Vs
ZCBsaWtlIHRvIHNlZSBhIG5ldyBmbGFnIGV2ZW50dWFsbHkgc2hvdyB1cCBmb3IgYXRvbWljIGFz
IHdlbGwsIA0KYnV0IHRoZSBleGlzdGluZyBvbmUgaXMgZWZmZWN0aXZlbHkgYnJva2VuIGF0IHRo
aXMgcG9pbnQgYW5kIEkgd291bGQgDQpob3BlIHRoYXQgbm8gdXNlcnNwYWNlIGlzIHNldHRpbmcg
aXQgZXhwZWN0aW5nIHRoYXQgaXQgYWN0dWFsbHkgZG9lcyANCnNvbWV0aGluZy4NCg0KQXQgdGhp
cyBwb2ludCB3ZSBkb24ndCByZWFsbHkgZ2FpbiBhbnl0aGluZyBmcm9tIGVuYWJsaW5nIGF0b21p
YyBpbiBERFggDQpJIHRoaW5rLCBtb3N0IGRyaXZlcnMgYWxyZWFkeSBtYWtlIHVzZSBvZiBEUk0g
aGVscGVycyB0byBtYXAgdGhlc2UgDQpsZWdhY3kgSU9DVExzIHRvIGF0b21pYyBhbnl3YXkuDQoN
Ck5pY2hvbGFzIEthemxhdXNrYXMNCg0KPiAgIGRyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9h
bWRncHVfZG0vYW1kZ3B1X2RtLmMgfCA1ICsrLS0tDQo+ICAgZHJpdmVycy9ncHUvZHJtL2RybV9h
dG9taWNfaGVscGVyLmMgICAgICAgICAgICAgICB8IDIgKy0NCj4gICBkcml2ZXJzL2dwdS9kcm0v
ZHJtX2F0b21pY19zdGF0ZV9oZWxwZXIuYyAgICAgICAgIHwgMiArLQ0KPiAgIGRyaXZlcnMvZ3B1
L2RybS9ub3V2ZWF1L2Rpc3BudjUwL3duZHcuYyAgICAgICAgICAgfCA0ICsrLS0NCj4gICBpbmNs
dWRlL2RybS9kcm1fY3J0Yy5oICAgICAgICAgICAgICAgICAgICAgICAgICAgIHwgOCArKysrLS0t
LQ0KPiAgIDUgZmlsZXMgY2hhbmdlZCwgMTAgaW5zZXJ0aW9ucygrKSwgMTEgZGVsZXRpb25zKC0p
DQo+IA0KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2FtZGdwdV9k
bS9hbWRncHVfZG0uYyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9hbWRncHVfZG0vYW1k
Z3B1X2RtLmMNCj4gaW5kZXggMGE3MWVkMWU3NzYyLi4yZjBlZjA4MjBmMDAgMTAwNjQ0DQo+IC0t
LSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9hbWRncHVfZG0vYW1kZ3B1X2RtLmMNCj4g
KysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2FtZGdwdV9kbS9hbWRncHVfZG0uYw0K
PiBAQCAtNTc1Niw4ICs1NzU2LDcgQEAgc3RhdGljIHZvaWQgYW1kZ3B1X2RtX2NvbW1pdF9wbGFu
ZXMoc3RydWN0IGRybV9hdG9taWNfc3RhdGUgKnN0YXRlLA0KPiAgIAkJICogY2hhbmdlIEZCIHBp
dGNoLCBEQ0Mgc3RhdGUsIHJvdGF0aW9uIG9yIG1pcnJvaW5nLg0KPiAgIAkJICovDQo+ICAgCQli
dW5kbGUtPmZsaXBfYWRkcnNbcGxhbmVzX2NvdW50XS5mbGlwX2ltbWVkaWF0ZSA9DQo+IC0JCQko
Y3J0Yy0+c3RhdGUtPnBhZ2VmbGlwX2ZsYWdzICYNCj4gLQkJCSBEUk1fTU9ERV9QQUdFX0ZMSVBf
QVNZTkMpICE9IDAgJiYNCj4gKwkJCWNydGMtPnN0YXRlLT5hc3luY19mbGlwICYmDQo+ICAgCQkJ
YWNydGNfc3RhdGUtPnVwZGF0ZV90eXBlID09IFVQREFURV9UWVBFX0ZBU1Q7DQo+ICAgDQo+ICAg
CQl0aW1lc3RhbXBfbnMgPSBrdGltZV9nZXRfbnMoKTsNCj4gQEAgLTYzMzQsNyArNjMzMyw3IEBA
IHN0YXRpYyB2b2lkIGFtZGdwdV9kbV9hdG9taWNfY29tbWl0X3RhaWwoc3RydWN0IGRybV9hdG9t
aWNfc3RhdGUgKnN0YXRlKQ0KPiAgIAlhbWRncHVfZG1fZW5hYmxlX2NydGNfaW50ZXJydXB0cyhk
ZXYsIHN0YXRlLCB0cnVlKTsNCj4gICANCj4gICAJZm9yX2VhY2hfbmV3X2NydGNfaW5fc3RhdGUo
c3RhdGUsIGNydGMsIG5ld19jcnRjX3N0YXRlLCBqKQ0KPiAtCQlpZiAobmV3X2NydGNfc3RhdGUt
PnBhZ2VmbGlwX2ZsYWdzICYgRFJNX01PREVfUEFHRV9GTElQX0FTWU5DKQ0KPiArCQlpZiAobmV3
X2NydGNfc3RhdGUtPmFzeW5jX2ZsaXApDQo+ICAgCQkJd2FpdF9mb3JfdmJsYW5rID0gZmFsc2U7
DQo+ICAgDQo+ICAgCS8qIHVwZGF0ZSBwbGFuZXMgd2hlbiBuZWVkZWQgcGVyIGNydGMqLw0KPiBk
aWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2RybV9hdG9taWNfaGVscGVyLmMgYi9kcml2ZXJz
L2dwdS9kcm0vZHJtX2F0b21pY19oZWxwZXIuYw0KPiBpbmRleCBlOWM2MTEyZTdmNzMuLjFlNTI5
M2ViNjZlMyAxMDA2NDQNCj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL2RybV9hdG9taWNfaGVscGVy
LmMNCj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL2RybV9hdG9taWNfaGVscGVyLmMNCj4gQEAgLTMy
NjMsNyArMzI2Myw3IEBAIHN0YXRpYyBpbnQgcGFnZV9mbGlwX2NvbW1vbihzdHJ1Y3QgZHJtX2F0
b21pY19zdGF0ZSAqc3RhdGUsDQo+ICAgCQlyZXR1cm4gUFRSX0VSUihjcnRjX3N0YXRlKTsNCj4g
ICANCj4gICAJY3J0Y19zdGF0ZS0+ZXZlbnQgPSBldmVudDsNCj4gLQljcnRjX3N0YXRlLT5wYWdl
ZmxpcF9mbGFncyA9IGZsYWdzOw0KPiArCWNydGNfc3RhdGUtPmFzeW5jX2ZsaXAgPSBmbGFncyAm
IERSTV9NT0RFX1BBR0VfRkxJUF9BU1lOQzsNCj4gICANCj4gICAJcGxhbmVfc3RhdGUgPSBkcm1f
YXRvbWljX2dldF9wbGFuZV9zdGF0ZShzdGF0ZSwgcGxhbmUpOw0KPiAgIAlpZiAoSVNfRVJSKHBs
YW5lX3N0YXRlKSkNCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9kcm1fYXRvbWljX3N0
YXRlX2hlbHBlci5jIGIvZHJpdmVycy9ncHUvZHJtL2RybV9hdG9taWNfc3RhdGVfaGVscGVyLmMN
Cj4gaW5kZXggNDZkYzI2NGEyNDhiLi5kMGE5MzdmYjBjNTYgMTAwNjQ0DQo+IC0tLSBhL2RyaXZl
cnMvZ3B1L2RybS9kcm1fYXRvbWljX3N0YXRlX2hlbHBlci5jDQo+ICsrKyBiL2RyaXZlcnMvZ3B1
L2RybS9kcm1fYXRvbWljX3N0YXRlX2hlbHBlci5jDQo+IEBAIC0xMjgsNyArMTI4LDcgQEAgdm9p
ZCBfX2RybV9hdG9taWNfaGVscGVyX2NydGNfZHVwbGljYXRlX3N0YXRlKHN0cnVjdCBkcm1fY3J0
YyAqY3J0YywNCj4gICAJc3RhdGUtPnpwb3NfY2hhbmdlZCA9IGZhbHNlOw0KPiAgIAlzdGF0ZS0+
Y29tbWl0ID0gTlVMTDsNCj4gICAJc3RhdGUtPmV2ZW50ID0gTlVMTDsNCj4gLQlzdGF0ZS0+cGFn
ZWZsaXBfZmxhZ3MgPSAwOw0KPiArCXN0YXRlLT5hc3luY19mbGlwID0gZmFsc2U7DQo+ICAgDQo+
ICAgCS8qIFNlbGYgcmVmcmVzaCBzaG91bGQgYmUgY2FuY2VsZWQgd2hlbiBhIG5ldyB1cGRhdGUg
aXMgYXZhaWxhYmxlICovDQo+ICAgCXN0YXRlLT5hY3RpdmUgPSBkcm1fYXRvbWljX2NydGNfZWZm
ZWN0aXZlbHlfYWN0aXZlKHN0YXRlKTsNCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9u
b3V2ZWF1L2Rpc3BudjUwL3duZHcuYyBiL2RyaXZlcnMvZ3B1L2RybS9ub3V2ZWF1L2Rpc3BudjUw
L3duZHcuYw0KPiBpbmRleCAyZGIwMjkzNzFjOTEuLjUxOTNiNjI1NzA2MSAxMDA2NDQNCj4gLS0t
IGEvZHJpdmVycy9ncHUvZHJtL25vdXZlYXUvZGlzcG52NTAvd25kdy5jDQo+ICsrKyBiL2RyaXZl
cnMvZ3B1L2RybS9ub3V2ZWF1L2Rpc3BudjUwL3duZHcuYw0KPiBAQCAtMjY3LDcgKzI2Nyw3IEBA
IG52NTBfd25kd19hdG9taWNfY2hlY2tfYWNxdWlyZShzdHJ1Y3QgbnY1MF93bmR3ICp3bmR3LCBi
b29sIG1vZGVzZXQsDQo+ICAgCQkJYXN5dy0+aW1hZ2UucGl0Y2hbMF0gPSBmYi0+YmFzZS5waXRj
aGVzWzBdOw0KPiAgIAkJfQ0KPiAgIA0KPiAtCQlpZiAoIShhc3loLT5zdGF0ZS5wYWdlZmxpcF9m
bGFncyAmIERSTV9NT0RFX1BBR0VfRkxJUF9BU1lOQykpDQo+ICsJCWlmICghYXN5aC0+c3RhdGUu
YXN5bmNfZmxpcCkNCj4gICAJCQlhc3l3LT5pbWFnZS5pbnRlcnZhbCA9IDE7DQo+ICAgCQllbHNl
DQo+ICAgCQkJYXN5dy0+aW1hZ2UuaW50ZXJ2YWwgPSAwOw0KPiBAQCAtMzgzLDcgKzM4Myw3IEBA
IG52NTBfd25kd19hdG9taWNfY2hlY2tfbHV0KHN0cnVjdCBudjUwX3duZHcgKnduZHcsDQo+ICAg
CX0NCj4gICANCj4gICAJLyogQ2FuJ3QgZG8gYW4gaW1tZWRpYXRlIGZsaXAgd2hpbGUgY2hhbmdp
bmcgdGhlIExVVC4gKi8NCj4gLQlhc3loLT5zdGF0ZS5wYWdlZmxpcF9mbGFncyAmPSB+RFJNX01P
REVfUEFHRV9GTElQX0FTWU5DOw0KPiArCWFzeWgtPnN0YXRlLmFzeW5jX2ZsaXAgPSBmYWxzZTsN
Cj4gICB9DQo+ICAgDQo+ICAgc3RhdGljIGludA0KPiBkaWZmIC0tZ2l0IGEvaW5jbHVkZS9kcm0v
ZHJtX2NydGMuaCBiL2luY2x1ZGUvZHJtL2RybV9jcnRjLmgNCj4gaW5kZXggN2UyOTYzY2FkNTQz
Li45MDBhZThkNDUyYjggMTAwNjQ0DQo+IC0tLSBhL2luY2x1ZGUvZHJtL2RybV9jcnRjLmgNCj4g
KysrIGIvaW5jbHVkZS9kcm0vZHJtX2NydGMuaA0KPiBAQCAtMjg0LDEyICsyODQsMTIgQEAgc3Ry
dWN0IGRybV9jcnRjX3N0YXRlIHsNCj4gICAJdTMyIHRhcmdldF92Ymxhbms7DQo+ICAgDQo+ICAg
CS8qKg0KPiAtCSAqIEBwYWdlZmxpcF9mbGFnczoNCj4gKwkgKiBAYXN5bmNfZmxpcDoNCj4gICAJ
ICoNCj4gLQkgKiBEUk1fTU9ERV9QQUdFX0ZMSVBfKiBmbGFncywgYXMgcGFzc2VkIHRvIHRoZSBw
YWdlIGZsaXAgaW9jdGwuDQo+IC0JICogWmVybyBpbiBhbnkgb3RoZXIgY2FzZS4NCj4gKwkgKiBU
aGlzIGlzIHNldCB3aGVuIERSTV9NT0RFX1BBR0VfRkxJUF9BU1lOQyBpcyBzZXQgaW4gdGhlIGxl
Z2FjeQ0KPiArCSAqIFBBR0VfRkxJUCBJT0NUTC4gSXQncyBub3Qgd2lyZWQgdXAgZm9yIHRoZSBh
dG9taWMgSU9DVEwgaXRzZWxmIHlldC4NCj4gICAJICovDQo+IC0JdTMyIHBhZ2VmbGlwX2ZsYWdz
Ow0KPiArCWJvb2wgYXN5bmNfZmxpcDsNCj4gICANCj4gICAJLyoqDQo+ICAgCSAqIEB2cnJfZW5h
YmxlZDoNCj4gDQoNCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9y
ZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZl
bA==
