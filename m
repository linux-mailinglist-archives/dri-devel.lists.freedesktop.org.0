Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ADAD441E23
	for <lists+dri-devel@lfdr.de>; Wed, 12 Jun 2019 09:45:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 66E1889310;
	Wed, 12 Jun 2019 07:45:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-SN1-obe.outbound.protection.outlook.com
 (mail-eopbgr700050.outbound.protection.outlook.com [40.107.70.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9804489310
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Jun 2019 07:45:42 +0000 (UTC)
Received: from DM5PR12MB1546.namprd12.prod.outlook.com (10.172.36.23) by
 DM5PR12MB2469.namprd12.prod.outlook.com (52.132.141.38) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1987.11; Wed, 12 Jun 2019 07:45:38 +0000
Received: from DM5PR12MB1546.namprd12.prod.outlook.com
 ([fe80::e1b1:5b6f:b2df:afa5]) by DM5PR12MB1546.namprd12.prod.outlook.com
 ([fe80::e1b1:5b6f:b2df:afa5%7]) with mapi id 15.20.1965.017; Wed, 12 Jun 2019
 07:45:38 +0000
From: "Koenig, Christian" <Christian.Koenig@amd.com>
To: Nicolin Chen <nicoleotsuka@gmail.com>, "sumit.semwal@linaro.org"
 <sumit.semwal@linaro.org>
Subject: Re: [PATCH] dma-buf: refcount the attachment for cache_sgt_mapping
Thread-Topic: [PATCH] dma-buf: refcount the attachment for cache_sgt_mapping
Thread-Index: AQHVIL1FUykFich2jk+2KmuqNh9/V6aXpCSA
Date: Wed, 12 Jun 2019 07:45:38 +0000
Message-ID: <261b46c7-0c5e-4268-619d-f8381fbc3aeb@amd.com>
References: <20190612012219.21652-1-nicoleotsuka@gmail.com>
In-Reply-To: <20190612012219.21652-1-nicoleotsuka@gmail.com>
Accept-Language: de-DE, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
x-originating-ip: [2a02:908:1252:fb60:be8a:bd56:1f94:86e7]
x-clientproxiedby: AM0PR01CA0122.eurprd01.prod.exchangelabs.com
 (2603:10a6:208:168::27) To DM5PR12MB1546.namprd12.prod.outlook.com
 (2603:10b6:4:8::23)
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: e101c217-2e4e-42bb-cfa5-08d6ef09f5cc
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:DM5PR12MB2469; 
x-ms-traffictypediagnostic: DM5PR12MB2469:
x-microsoft-antispam-prvs: <DM5PR12MB246943050190CE662A280BFB83EC0@DM5PR12MB2469.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:6790;
x-forefront-prvs: 0066D63CE6
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(396003)(376002)(346002)(39860400002)(136003)(366004)(199004)(189003)(5024004)(256004)(14454004)(14444005)(58126008)(36756003)(229853002)(316002)(54906003)(110136005)(65956001)(68736007)(76176011)(8936002)(446003)(31686004)(8676002)(476003)(11346002)(102836004)(2906002)(386003)(2616005)(6506007)(81166006)(81156014)(52116002)(99286004)(7736002)(305945005)(65806001)(186003)(486006)(31696002)(53936002)(4326008)(86362001)(46003)(64756008)(66476007)(66446008)(66556008)(6116002)(66946007)(73956011)(6246003)(25786009)(5660300002)(71190400001)(71200400001)(6486002)(2501003)(65826007)(6436002)(478600001)(6512007)(64126003)(72206003)(56590200001);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DM5PR12MB2469;
 H:DM5PR12MB1546.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: HBSrxw5LTcbuVe9IS3mx4lHoPdm9QoydoCqTr50cqFGGwuZQvkyuT4KIEamLopJpPfpHroSr3HG8e5SdCr8HjqKRLvciCrD2/b/q/7DgaVLuAbi8WaLZ39ada6yVrmuP8wY01YO+zPqmDShp9AeUnuJBpSglK9zMbRC4T6uUEziqYqFm6zwNd0XpnRNkXH0SVDlwKLVpWj4z3DRbBW1aFBQH+yAwWuSSRFk6GbneMZc3lj9W8ZXcG+BoV+w6+8xqwVmdWrdFSZg7MRXeTb8y9kt+O4s8+WtUiWWIPwYL91VvQ6H8crY90ckL+I8Jh71Vc8tEWGoOKID6G0TGNEiQA3j0Co5B8nelCXVJA1lGBY7e4Q99rTFbpOerCu1dfTgB1Km16p1eus46ZNiYQLcmZiOaOglkfinrdk0oHjpjNuU=
Content-ID: <7FDC1FD1C89182448A28C7D49224B873@namprd12.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e101c217-2e4e-42bb-cfa5-08d6ef09f5cc
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Jun 2019 07:45:38.0260 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ckoenig@amd.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR12MB2469
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nHAvCOg3ZFJ9TUn17jUp+1fwo8f46Thuf4qQgCdFcxg=;
 b=FJlWBvRqfDTqj3mveTPVSxfW6FhdNY/2wzDbgwJtHxlOY3pyB7D6Qes1BAlfCa0zZPoaeiBMM513HWi1EJWhVSyX+So1N0Dku1V9v78PhRpK5w3T0zoOAnBzQ8e+ZWjU7EyUwt/pj0AqBEYBqMK76i0rOeNjiz6fvYELHJbGyrY=
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
Cc: "linaro-mm-sig@lists.linaro.org" <linaro-mm-sig@lists.linaro.org>,
 "daniel.vetter@ffwll.ch" <daniel.vetter@ffwll.ch>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

QW0gMTIuMDYuMTkgdW0gMDM6MjIgc2NocmllYiBOaWNvbGluIENoZW46DQo+IENvbW1pdCBmMTNl
MTQzZTc0NDQgKCJkbWEtYnVmOiBzdGFydCBjYWNoaW5nIG9mIHNnX3RhYmxlIG9iamVjdHMgdjIi
KQ0KPiBhZGRlZCBhIHN1cHBvcnQgb2YgY2FjaGluZyB0aGUgc2d0IHBvaW50ZXIgaW50byBhbiBh
dHRhY2ggcG9pbnRlciB0bw0KPiBsZXQgdXNlcnMgcmV1c2UgdGhlIHNndCBwb2ludGVyIHdpdGhv
dXQgYW5vdGhlciBtYXBwaW5nLiBIb3dldmVyLCBpdA0KPiBtaWdodCBub3QgdG90YWxseSB3b3Jr
IGFzIG1vc3Qgb2YgZG1hLWJ1ZiBjYWxsZXJzIGFyZSBkb2luZyBhdHRhY2goKQ0KPiBhbmQgbWFw
X2F0dGFjaG1lbnQoKSBiYWNrLXRvLWJhY2ssIHVzaW5nIGRybV9wcmltZS5jIGZvciBleGFtcGxl
Og0KPiAgICAgIGRybV9nZW1fcHJpbWVfaW1wb3J0X2RldigpIHsNCj4gICAgICAgICAgYXR0YWNo
ID0gZG1hX2J1Zl9hdHRhY2goKSB7DQo+ICAgICAgICAgICAgICAvKiBBbGxvY2F0aW5nIGEgbmV3
IGF0dGFjaCAqLw0KPiAgICAgICAgICAgICAgYXR0YWNoID0ga3phbGxvYygpOw0KPiAgICAgICAg
ICAgICAgLyogLi4uLiAqLw0KPiAgICAgICAgICAgICAgcmV0dXJuIGF0dGFjaDsNCj4gICAgICAg
ICAgfQ0KPiAgICAgICAgICBkbWFfYnVmX21hcF9hdHRhY2htZW50KGF0dGFjaCwgZGlyZWN0aW9u
KSB7DQo+ICAgICAgICAgICAgICAvKiBhdHRhY2gtPnNndCB3b3VsZCBiZSBhbHdheXMgZW1wdHkg
YXMgYXR0YWNoIGlzIG5ldyAqLw0KPiAgICAgICAgICAgICAgaWYgKGF0dGFjaC0+c2d0KSB7DQo+
ICAgICAgICAgICAgICAgICAgLyogUmV1c2UgYXR0YWNoLT5zZ3QgKi8NCj4gICAgICAgICAgICAg
IH0NCj4gICAgICAgICAgICAgIC8qIE90aGVyd2lzZSwgbWFwIGl0ICovDQo+ICAgICAgICAgICAg
ICBhdHRhY2gtPnNndCA9IG1hcCgpOw0KPiAgICAgICAgICB9DQo+ICAgICAgfQ0KPg0KPiBTbywg
Zm9yIGEgY2FjaGVfc2d0X21hcHBpbmcgdXNlIGNhc2UsIGl0IHdvdWxkIG5lZWQgdG8gZ2V0IHRo
ZSBzYW1lDQo+IGF0dGFjaG1lbnQgcG9pbnRlciBpbiBvcmRlciB0byByZXVzZSBpdHMgc2d0IHBv
aW50ZXIuIFNvIHRoaXMgcGF0Y2gNCj4gYWRkcyBhIHJlZmNvdW50IHRvIHRoZSBhdHRhY2goKSBm
dW5jdGlvbiBhbmQgbGV0cyBpdCBzZWFyY2ggZm9yIHRoZQ0KPiBleGlzdGluZyBhdHRhY2ggcG9p
bnRlciBieSBtYXRjaGluZyB0aGUgZGV2IHBvaW50ZXIuDQoNCkkgZG9uJ3QgdGhpbmsgdGhhdCB0
aGlzIGlzIGEgZ29vZCBpZGVhLg0KDQpXZSB1c2Ugc2d0IGNhY2hpbmcgYXMgd29ya2Fyb3VuZCBm
b3IgbG9ja2luZyBvcmRlciBwcm9ibGVtcyBhbmQgd2FudCB0byANCnJlbW92ZSBpdCBhZ2FpbiBp
biB0aGUgbG9uZyB0ZXJtLg0KDQpTbyB3aGF0IGlzIHRoZSBhY3R1YWwgdXNlIGNhc2Ugb2YgdGhp
cz8NCg0KUmVnYXJkcywNCkNocmlzdGlhbi4NCg0KPg0KPiBTaWduZWQtb2ZmLWJ5OiBOaWNvbGlu
IENoZW4gPG5pY29sZW90c3VrYUBnbWFpbC5jb20+DQo+IC0tLQ0KPiAgIGRyaXZlcnMvZG1hLWJ1
Zi9kbWEtYnVmLmMgfCAyMyArKysrKysrKysrKysrKysrKysrKysrKw0KPiAgIGluY2x1ZGUvbGlu
dXgvZG1hLWJ1Zi5oICAgfCAgMiArKw0KPiAgIDIgZmlsZXMgY2hhbmdlZCwgMjUgaW5zZXJ0aW9u
cygrKQ0KPg0KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9kbWEtYnVmL2RtYS1idWYuYyBiL2RyaXZl
cnMvZG1hLWJ1Zi9kbWEtYnVmLmMNCj4gaW5kZXggZjQxMDRhMjFiMDY5Li5kMDI2MDU1M2EzMWMg
MTAwNjQ0DQo+IC0tLSBhL2RyaXZlcnMvZG1hLWJ1Zi9kbWEtYnVmLmMNCj4gKysrIGIvZHJpdmVy
cy9kbWEtYnVmL2RtYS1idWYuYw0KPiBAQCAtNTU5LDYgKzU1OSwyMSBAQCBzdHJ1Y3QgZG1hX2J1
Zl9hdHRhY2htZW50ICpkbWFfYnVmX2F0dGFjaChzdHJ1Y3QgZG1hX2J1ZiAqZG1hYnVmLA0KPiAg
IAlpZiAoV0FSTl9PTighZG1hYnVmIHx8ICFkZXYpKQ0KPiAgIAkJcmV0dXJuIEVSUl9QVFIoLUVJ
TlZBTCk7DQo+ICAgDQo+ICsJLyogY2FjaGVfc2d0X21hcHBpbmcgcmVxdWlyZXMgdG8gcmV1c2Ug
dGhlIHNhbWUgYXR0YWNobWVudCBwb2ludGVyICovDQo+ICsJaWYgKGRtYWJ1Zi0+b3BzLT5jYWNo
ZV9zZ3RfbWFwcGluZykgew0KPiArCQltdXRleF9sb2NrKCZkbWFidWYtPmxvY2spOw0KPiArDQo+
ICsJCS8qIFNlYXJjaCBmb3IgZXhpc3RpbmcgYXR0YWNobWVudCBhbmQgaW5jcmVhc2UgaXRzIHJl
ZmNvdW50ICovDQo+ICsJCWxpc3RfZm9yX2VhY2hfZW50cnkoYXR0YWNoLCAmZG1hYnVmLT5hdHRh
Y2htZW50cywgbm9kZSkgew0KPiArCQkJaWYgKGRldiAhPSBhdHRhY2gtPmRldikNCj4gKwkJCQlj
b250aW51ZTsNCj4gKwkJCWF0b21pY19pbmNfbm90X3plcm8oJmF0dGFjaC0+cmVmY291bnQpOw0K
PiArCQkJZ290byB1bmxvY2tfYXR0YWNoOw0KPiArCQl9DQo+ICsNCj4gKwkJbXV0ZXhfdW5sb2Nr
KCZkbWFidWYtPmxvY2spOw0KPiArCX0NCj4gKw0KPiAgIAlhdHRhY2ggPSBremFsbG9jKHNpemVv
ZigqYXR0YWNoKSwgR0ZQX0tFUk5FTCk7DQo+ICAgCWlmICghYXR0YWNoKQ0KPiAgIAkJcmV0dXJu
IEVSUl9QVFIoLUVOT01FTSk7DQo+IEBAIC01NzUsNiArNTkwLDkgQEAgc3RydWN0IGRtYV9idWZf
YXR0YWNobWVudCAqZG1hX2J1Zl9hdHRhY2goc3RydWN0IGRtYV9idWYgKmRtYWJ1ZiwNCj4gICAJ
fQ0KPiAgIAlsaXN0X2FkZCgmYXR0YWNoLT5ub2RlLCAmZG1hYnVmLT5hdHRhY2htZW50cyk7DQo+
ICAgDQo+ICsJYXRvbWljX3NldCgmYXR0YWNoLT5yZWZjb3VudCwgMSk7DQo+ICsNCj4gK3VubG9j
a19hdHRhY2g6DQo+ICAgCW11dGV4X3VubG9jaygmZG1hYnVmLT5sb2NrKTsNCj4gICANCj4gICAJ
cmV0dXJuIGF0dGFjaDsNCj4gQEAgLTU5OSw2ICs2MTcsMTEgQEAgdm9pZCBkbWFfYnVmX2RldGFj
aChzdHJ1Y3QgZG1hX2J1ZiAqZG1hYnVmLCBzdHJ1Y3QgZG1hX2J1Zl9hdHRhY2htZW50ICphdHRh
Y2gpDQo+ICAgCWlmIChXQVJOX09OKCFkbWFidWYgfHwgIWF0dGFjaCkpDQo+ICAgCQlyZXR1cm47
DQo+ICAgDQo+ICsJLyogRGVjcmVhc2UgdGhlIHJlZmNvdW50IGZvciBjYWNoZV9zZ3RfbWFwcGlu
ZyB1c2UgY2FzZXMgKi8NCj4gKwlpZiAoZG1hYnVmLT5vcHMtPmNhY2hlX3NndF9tYXBwaW5nICYm
DQo+ICsJICAgIGF0b21pY19kZWNfcmV0dXJuKCZhdHRhY2gtPnJlZmNvdW50KSkNCj4gKwkJcmV0
dXJuOw0KPiArDQo+ICAgCWlmIChhdHRhY2gtPnNndCkNCj4gICAJCWRtYWJ1Zi0+b3BzLT51bm1h
cF9kbWFfYnVmKGF0dGFjaCwgYXR0YWNoLT5zZ3QsIGF0dGFjaC0+ZGlyKTsNCj4gICANCj4gZGlm
ZiAtLWdpdCBhL2luY2x1ZGUvbGludXgvZG1hLWJ1Zi5oIGIvaW5jbHVkZS9saW51eC9kbWEtYnVm
LmgNCj4gaW5kZXggOGEzMjc1NjZkN2Y0Li42NWYxMjIxMmNhMmUgMTAwNjQ0DQo+IC0tLSBhL2lu
Y2x1ZGUvbGludXgvZG1hLWJ1Zi5oDQo+ICsrKyBiL2luY2x1ZGUvbGludXgvZG1hLWJ1Zi5oDQo+
IEBAIC0zMzMsNiArMzMzLDcgQEAgc3RydWN0IGRtYV9idWYgew0KPiAgICAqIEBkZXY6IGRldmlj
ZSBhdHRhY2hlZCB0byB0aGUgYnVmZmVyLg0KPiAgICAqIEBub2RlOiBsaXN0IG9mIGRtYV9idWZf
YXR0YWNobWVudC4NCj4gICAgKiBAc2d0OiBjYWNoZWQgbWFwcGluZy4NCj4gKyAqIEByZWZjb3Vu
dDogcmVmY291bnQgb2YgdGhlIGF0dGFjaG1lbnQgZm9yIHRoZSBzYW1lIGRldmljZS4NCj4gICAg
KiBAZGlyOiBkaXJlY3Rpb24gb2YgY2FjaGVkIG1hcHBpbmcuDQo+ICAgICogQHByaXY6IGV4cG9y
dGVyIHNwZWNpZmljIGF0dGFjaG1lbnQgZGF0YS4NCj4gICAgKg0KPiBAQCAtMzUwLDYgKzM1MSw3
IEBAIHN0cnVjdCBkbWFfYnVmX2F0dGFjaG1lbnQgew0KPiAgIAlzdHJ1Y3QgZGV2aWNlICpkZXY7
DQo+ICAgCXN0cnVjdCBsaXN0X2hlYWQgbm9kZTsNCj4gICAJc3RydWN0IHNnX3RhYmxlICpzZ3Q7
DQo+ICsJYXRvbWljX3QgcmVmY291bnQ7DQo+ICAgCWVudW0gZG1hX2RhdGFfZGlyZWN0aW9uIGRp
cjsNCj4gICAJdm9pZCAqcHJpdjsNCj4gICB9Ow0KDQpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBs
aXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1h
bi9saXN0aW5mby9kcmktZGV2ZWw=
