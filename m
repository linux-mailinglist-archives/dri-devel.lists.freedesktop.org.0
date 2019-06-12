Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DB27341E9E
	for <lists+dri-devel@lfdr.de>; Wed, 12 Jun 2019 10:06:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 04AFA89242;
	Wed, 12 Jun 2019 08:05:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-BL2-obe.outbound.protection.outlook.com
 (mail-eopbgr750073.outbound.protection.outlook.com [40.107.75.73])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9A0C489242
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Jun 2019 08:05:56 +0000 (UTC)
Received: from DM5PR12MB1546.namprd12.prod.outlook.com (10.172.36.23) by
 DM5PR12MB1388.namprd12.prod.outlook.com (10.168.239.8) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1987.11; Wed, 12 Jun 2019 08:05:53 +0000
Received: from DM5PR12MB1546.namprd12.prod.outlook.com
 ([fe80::e1b1:5b6f:b2df:afa5]) by DM5PR12MB1546.namprd12.prod.outlook.com
 ([fe80::e1b1:5b6f:b2df:afa5%7]) with mapi id 15.20.1965.017; Wed, 12 Jun 2019
 08:05:53 +0000
From: "Koenig, Christian" <Christian.Koenig@amd.com>
To: Nicolin Chen <nicoleotsuka@gmail.com>
Subject: Re: [PATCH] dma-buf: refcount the attachment for cache_sgt_mapping
Thread-Topic: [PATCH] dma-buf: refcount the attachment for cache_sgt_mapping
Thread-Index: AQHVIL1FUykFich2jk+2KmuqNh9/V6aXpCSAgAAEqwCAAAD9AA==
Date: Wed, 12 Jun 2019 08:05:53 +0000
Message-ID: <170c3828-115b-38e5-35fc-1b88c08c492a@amd.com>
References: <20190612012219.21652-1-nicoleotsuka@gmail.com>
 <261b46c7-0c5e-4268-619d-f8381fbc3aeb@amd.com>
 <20190612080214.GA8876@Asurada>
In-Reply-To: <20190612080214.GA8876@Asurada>
Accept-Language: de-DE, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
x-originating-ip: [2a02:908:1252:fb60:be8a:bd56:1f94:86e7]
x-clientproxiedby: AM4PR05CA0001.eurprd05.prod.outlook.com (2603:10a6:205::14)
 To DM5PR12MB1546.namprd12.prod.outlook.com
 (2603:10b6:4:8::23)
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 70c279b8-86ec-487a-63a1-08d6ef0cca20
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:DM5PR12MB1388; 
x-ms-traffictypediagnostic: DM5PR12MB1388:
x-microsoft-antispam-prvs: <DM5PR12MB13887A515824140B3890EDD283EC0@DM5PR12MB1388.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-forefront-prvs: 0066D63CE6
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(39860400002)(376002)(346002)(366004)(396003)(136003)(199004)(189003)(51914003)(102836004)(4326008)(8936002)(68736007)(81166006)(7736002)(5660300002)(25786009)(8676002)(305945005)(386003)(31696002)(6506007)(6116002)(64756008)(2906002)(73956011)(66476007)(66556008)(66946007)(66446008)(86362001)(65806001)(65956001)(1411001)(99286004)(81156014)(54906003)(6436002)(6246003)(14454004)(6512007)(52116002)(53936002)(6916009)(65826007)(31686004)(64126003)(316002)(72206003)(478600001)(6486002)(486006)(476003)(446003)(11346002)(2616005)(36756003)(186003)(46003)(71200400001)(76176011)(229853002)(256004)(14444005)(5024004)(71190400001)(58126008)(56590200001);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DM5PR12MB1388;
 H:DM5PR12MB1546.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: sc8LEeDc2TUD8VS/FJ/vGqwhxVDA2PezAknAwPEjng3WA62opCHA+9ABvwyQcivs+vsndd+9CJaRSRBqhgekBgoA+J7DUugZi0UVW1DNdOQSGJtS2T7PIQKDRkYfpZqyl8swwbbiC+N/KIgrLMCL0aq3zJhWVehy4voXZcphbvz7iYjlhuqw/jWJWT7k1Oco3QXtNiO9afZSlUfnAdj1aACObR26+o+pTcBoq3xJ/teSw0SCAwfoVDSfHQp+WGXxuY7KWcSPVo/gxbwG3noLCt7aW2+J/yCIFAiGboZWRFTeLa5DzOAHpCocmGn8V4rLjodUJnuEZbg9jKk817p5XO03ZAKbqNipT1e5ynHFcgah6kVyI/O2tuqxnMdtLvHU5ZqzcdnHBq0Cc6lCZ1pxBtDxaAPYtUbolGT7KTAsIAw=
Content-ID: <2E5F357D90811D49AA7DB9391BAE0AD0@namprd12.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 70c279b8-86ec-487a-63a1-08d6ef0cca20
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Jun 2019 08:05:53.1622 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ckoenig@amd.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR12MB1388
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dAAInB1jCboraYln6qhWwaGHH1q1a7H+W+iRGdm1cLo=;
 b=si9cIrUD8k7MksUqwBKRmuxFogLkrGgWn7rvSuzwZ/gLjj2h/Q0yEFtHnNVKcsyMLa7R+2dBiQBAKkAJNw+rjlDH538T76RHLQC0To9DB4cWxOy2sNBJSq/cdV1tN+WMvswPgbOcAkZaN+3Xc2hYNMIHnqYKtZycQbwSVvurQto=
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
Cc: "daniel.vetter@ffwll.ch" <daniel.vetter@ffwll.ch>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linaro-mm-sig@lists.linaro.org" <linaro-mm-sig@lists.linaro.org>,
 "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

QW0gMTIuMDYuMTkgdW0gMTA6MDIgc2NocmllYiBOaWNvbGluIENoZW46DQo+IEhpIENocmlzdGlh
biwNCj4NCj4gVGhhbmtzIGZvciB0aGUgcXVpY2sgcmVwbHkuDQo+DQo+IE9uIFdlZCwgSnVuIDEy
LCAyMDE5IGF0IDA3OjQ1OjM4QU0gKzAwMDAsIEtvZW5pZywgQ2hyaXN0aWFuIHdyb3RlOg0KPj4g
QW0gMTIuMDYuMTkgdW0gMDM6MjIgc2NocmllYiBOaWNvbGluIENoZW46DQo+Pj4gQ29tbWl0IGYx
M2UxNDNlNzQ0NCAoImRtYS1idWY6IHN0YXJ0IGNhY2hpbmcgb2Ygc2dfdGFibGUgb2JqZWN0cyB2
MiIpDQo+Pj4gYWRkZWQgYSBzdXBwb3J0IG9mIGNhY2hpbmcgdGhlIHNndCBwb2ludGVyIGludG8g
YW4gYXR0YWNoIHBvaW50ZXIgdG8NCj4+PiBsZXQgdXNlcnMgcmV1c2UgdGhlIHNndCBwb2ludGVy
IHdpdGhvdXQgYW5vdGhlciBtYXBwaW5nLiBIb3dldmVyLCBpdA0KPj4+IG1pZ2h0IG5vdCB0b3Rh
bGx5IHdvcmsgYXMgbW9zdCBvZiBkbWEtYnVmIGNhbGxlcnMgYXJlIGRvaW5nIGF0dGFjaCgpDQo+
Pj4gYW5kIG1hcF9hdHRhY2htZW50KCkgYmFjay10by1iYWNrLCB1c2luZyBkcm1fcHJpbWUuYyBm
b3IgZXhhbXBsZToNCj4+PiAgICAgICBkcm1fZ2VtX3ByaW1lX2ltcG9ydF9kZXYoKSB7DQo+Pj4g
ICAgICAgICAgIGF0dGFjaCA9IGRtYV9idWZfYXR0YWNoKCkgew0KPj4+ICAgICAgICAgICAgICAg
LyogQWxsb2NhdGluZyBhIG5ldyBhdHRhY2ggKi8NCj4+PiAgICAgICAgICAgICAgIGF0dGFjaCA9
IGt6YWxsb2MoKTsNCj4+PiAgICAgICAgICAgICAgIC8qIC4uLi4gKi8NCj4+PiAgICAgICAgICAg
ICAgIHJldHVybiBhdHRhY2g7DQo+Pj4gICAgICAgICAgIH0NCj4+PiAgICAgICAgICAgZG1hX2J1
Zl9tYXBfYXR0YWNobWVudChhdHRhY2gsIGRpcmVjdGlvbikgew0KPj4+ICAgICAgICAgICAgICAg
LyogYXR0YWNoLT5zZ3Qgd291bGQgYmUgYWx3YXlzIGVtcHR5IGFzIGF0dGFjaCBpcyBuZXcgKi8N
Cj4+PiAgICAgICAgICAgICAgIGlmIChhdHRhY2gtPnNndCkgew0KPj4+ICAgICAgICAgICAgICAg
ICAgIC8qIFJldXNlIGF0dGFjaC0+c2d0ICovDQo+Pj4gICAgICAgICAgICAgICB9DQo+Pj4gICAg
ICAgICAgICAgICAvKiBPdGhlcndpc2UsIG1hcCBpdCAqLw0KPj4+ICAgICAgICAgICAgICAgYXR0
YWNoLT5zZ3QgPSBtYXAoKTsNCj4+PiAgICAgICAgICAgfQ0KPj4+ICAgICAgIH0NCj4+Pg0KPj4+
IFNvLCBmb3IgYSBjYWNoZV9zZ3RfbWFwcGluZyB1c2UgY2FzZSwgaXQgd291bGQgbmVlZCB0byBn
ZXQgdGhlIHNhbWUNCj4+PiBhdHRhY2htZW50IHBvaW50ZXIgaW4gb3JkZXIgdG8gcmV1c2UgaXRz
IHNndCBwb2ludGVyLiBTbyB0aGlzIHBhdGNoDQo+Pj4gYWRkcyBhIHJlZmNvdW50IHRvIHRoZSBh
dHRhY2goKSBmdW5jdGlvbiBhbmQgbGV0cyBpdCBzZWFyY2ggZm9yIHRoZQ0KPj4+IGV4aXN0aW5n
IGF0dGFjaCBwb2ludGVyIGJ5IG1hdGNoaW5nIHRoZSBkZXYgcG9pbnRlci4NCj4+IEkgZG9uJ3Qg
dGhpbmsgdGhhdCB0aGlzIGlzIGEgZ29vZCBpZGVhLg0KPj4NCj4+IFdlIHVzZSBzZ3QgY2FjaGlu
ZyBhcyB3b3JrYXJvdW5kIGZvciBsb2NraW5nIG9yZGVyIHByb2JsZW1zIGFuZCB3YW50IHRvDQo+
PiByZW1vdmUgaXQgYWdhaW4gaW4gdGhlIGxvbmcgdGVybS4NCj4gT2guIEkgdGhvdWdodCBpdCB3
YXMgZm9yIGEgcGVyZm9ybWFuY2UgaW1wcm92aW5nIHB1cnBvc2UuIEl0IG1heQ0KPiBiZSBhIG1p
c3VuZGVyc3RhbmRpbmcgdGhlbi4NCj4NCj4+IFNvIHdoYXQgaXMgdGhlIGFjdHVhbCB1c2UgY2Fz
ZSBvZiB0aGlzPw0KPiBXZSBoYXZlIHNvbWUgc2ltaWxhciBkb3duc3RyZWFtIGNoYW5nZXMgYXQg
ZG1hX2J1ZiB0byByZWR1Y2UgdGhlDQo+IG92ZXJoZWFkIGZyb20gbXVsdGlwbGUgY2xpZW50cyBv
ZiB0aGUgc2FtZSBkZXZpY2UgZG9pbmcgYXR0YWNoKCkNCj4gYW5kIG1hcF9hdHRhY2htZW50KCkg
Y2FsbHMgZm9yIHRoZSBzYW1lIGRtYV9idWYuDQoNCkkgZG9uJ3QgdGhpbmsgdGhhdCB0aGlzIGlz
IGEgZ29vZCBpZGVhIG92ZXIgYWxsLiBBIGRyaXZlciBjYWxsaW5nIGF0dGFjaCANCmZvciB0aGUg
c2FtZSBidWZmZXIgaXMgZG9pbmcgc29tZXRoaW5nIHdyb25nIGluIHRoZSBmaXJzdCBwbGFjZSBh
bmQgd2UgDQpzaG91bGQgbm90IHdvcmsgYXJvdW5kIHRoaXMgaW4gdGhlIERNQS1idWYgaGFuZGxp
bmcuDQoNCj4gV2UgaGF2ZW4ndCB1c2VkIERSTS9HUk1fUFJJTUUgeWV0IGJ1dCBJIGFtIGFsc28g
Y3VyaW91cyB3b3VsZCBpdA0KPiBiZW5lZml0IERSTSBhbHNvIGlmIHdlIHJlZHVjZSB0aGlzIG92
ZXJoZWFkIGluIHRoZSBkbWFfYnVmPw0KDQpObywgbm90IGF0IGFsbC4NCg0KUmVnYXJkcywNCkNo
cmlzdGlhbi4NCg0KPg0KPiBUaGFua3MNCj4gTmljb2xpbg0KDQpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1k
ZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcv
bWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
