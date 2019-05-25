Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E325B2A371
	for <lists+dri-devel@lfdr.de>; Sat, 25 May 2019 10:25:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F379D89F97;
	Sat, 25 May 2019 08:25:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM01-BY2-obe.outbound.protection.outlook.com
 (mail-eopbgr810047.outbound.protection.outlook.com [40.107.81.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 83DB089F97
 for <dri-devel@lists.freedesktop.org>; Sat, 25 May 2019 08:25:36 +0000 (UTC)
Received: from MN2PR05MB6141.namprd05.prod.outlook.com (20.178.241.217) by
 MN2PR05MB6175.namprd05.prod.outlook.com (20.178.242.83) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1943.13; Sat, 25 May 2019 08:25:27 +0000
Received: from MN2PR05MB6141.namprd05.prod.outlook.com
 ([fe80::c19e:e8f8:b151:9ad]) by MN2PR05MB6141.namprd05.prod.outlook.com
 ([fe80::c19e:e8f8:b151:9ad%6]) with mapi id 15.20.1922.021; Sat, 25 May 2019
 08:25:27 +0000
From: Thomas Hellstrom <thellstrom@vmware.com>
To: "emil.l.velikov@gmail.com" <emil.l.velikov@gmail.com>
Subject: Re: [PATCH 4/5] drm/vmwgfx: remove custom ioctl io encoding check
Thread-Topic: [PATCH 4/5] drm/vmwgfx: remove custom ioctl io encoding check
Thread-Index: AQHVEL1o/6Se9/15V0mUxf0kK0ZgxaZ4RJKAgAHuVQCAAA3ugIAAJ+QAgAB5AACAAKOLgA==
Date: Sat, 25 May 2019 08:25:26 +0000
Message-ID: <7dd79b21d58dc74b9b2d81d6aa812fe8d4564596.camel@vmware.com>
References: <20190522164119.24139-1-emil.l.velikov@gmail.com>
 <20190522164119.24139-4-emil.l.velikov@gmail.com>
 <a2ec4b6f529ffdc6146903decec6b5ba4cab0a1d.camel@vmware.com>
 <20190524121410.GB6233@arch-x1c3>
 <280025344d8590a4d10edfd9990d26d15a983264.camel@vmware.com>
 <20190524152648.GD8938@arch-x1c3>
 <27cb3f6d2002edcf45a4d50e6cef0854ba80766a.camel@vmware.com>
In-Reply-To: <27cb3f6d2002edcf45a4d50e6cef0854ba80766a.camel@vmware.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [155.4.205.35]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 7ab4ee8f-3d84-4dee-e9f3-08d6e0ea8a7f
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328)(7193020);
 SRVR:MN2PR05MB6175; 
x-ms-traffictypediagnostic: MN2PR05MB6175:
x-ld-processed: b39138ca-3cee-4b4a-a4d6-cd83d9dd62f0,ExtAddr
x-microsoft-antispam-prvs: <MN2PR05MB617505AD692D310C28E29466A1030@MN2PR05MB6175.namprd05.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-forefront-prvs: 0048BCF4DA
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(346002)(366004)(396003)(136003)(39860400002)(376002)(199004)(189003)(118296001)(446003)(11346002)(6436002)(6486002)(6916009)(486006)(476003)(2616005)(186003)(66066001)(36756003)(5660300002)(53936002)(256004)(6512007)(81166006)(478600001)(2351001)(1361003)(2501003)(229853002)(71190400001)(14454004)(86362001)(54906003)(8936002)(316002)(5640700003)(71200400001)(81156014)(8676002)(7736002)(4326008)(25786009)(6246003)(107886003)(76176011)(102836004)(99286004)(26005)(305945005)(6506007)(6116002)(3846002)(2906002)(73956011)(91956017)(66556008)(66446008)(66946007)(76116006)(68736007)(64756008)(66476007)(175924003);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MN2PR05MB6175;
 H:MN2PR05MB6141.namprd05.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: vmware.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: ftrpGZRJ7FJgWtgRO9IhY/DkK2vXZiUXtk4Ck5JRtq6bwRup8J6tGGNsP79m9S8T30zruNK36tjzhqcQyBnfYgNRb73UN9AbbjP5FlJlCYGAYEZmmMT61K54YzxIWRmKKT8Xxj4BPtcKj06Iy9QLgx9pksLJBQkhcRz6q6ezLiUOM/qooDWhgEDYofDufCLamTvYRZelygA6JtcD6LfoLLa7ISy73RgqEEHZBV3SUDJxhG8gOU1KHFVAP03h2fM85yruKFduv6I6zSK0TYTU96BfAUusspE+4jsv3gaRSCBJ2M9hb++6uFFdTF4Hzbbcf4nHH9j4e7qjQdkVmLOFXybCw7gywvlgK7sFw2FybHti3K/Q8JPFJ5KJH1r1ZZhDcKql6Ttgzmu3rPNKxYB2ogM/kepKrkO0JyTakzlYw80=
Content-ID: <D6F1706F8795394BAC2DA62EE860F89E@namprd05.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: vmware.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7ab4ee8f-3d84-4dee-e9f3-08d6e0ea8a7f
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 May 2019 08:25:26.8392 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b39138ca-3cee-4b4a-a4d6-cd83d9dd62f0
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: thellstrom@vmware.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR05MB6175
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=vmware.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DnQ6mg3wJTn58e8bmvWrTI1JAOUGnrrI77EwJjagm98=;
 b=JNlaaE9eXq34r+35TCXV7nIwNWiIwr80lga9jTQKQ+MvrurVsxNl2JASMFNrBg/yKJfPC8K/gVpTGMeK3sofBjqwPMs9LsXrFIlBQ10wLOgedPqmIF/opEj9KrXYka0fx9cP0wv2XUR+qxKWTolajLg70JHoNUByiboQZ8q6Lkg=
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
Cc: "kernel@collabora.com" <kernel@collabora.com>,
 Linux-graphics-maintainer <Linux-graphics-maintainer@vmware.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gU2F0LCAyMDE5LTA1LTI1IGF0IDAwOjM5ICswMjAwLCBUaG9tYXMgSGVsbHN0csO2bSB3cm90
ZToNCj4gSGksIEVtaWwNCj4gDQo+IE9uIEZyaSwgMjAxOS0wNS0yNCBhdCAxNjoyNiArMDEwMCwg
RW1pbCBWZWxpa292IHdyb3RlOg0KPiA+IE9uIDIwMTkvMDUvMjQsIFRob21hcyBIZWxsc3Ryb20g
d3JvdGU6DQo+ID4gPiBPbiBGcmksIDIwMTktMDUtMjQgYXQgMTM6MTQgKzAxMDAsIEVtaWwgVmVs
aWtvdiB3cm90ZToNCj4gPiA+ID4gT24gMjAxOS8wNS8yMywgVGhvbWFzIEhlbGxzdHJvbSB3cm90
ZToNCj4gPiA+ID4gPiBIaSwgRW1pbCwNCj4gPiA+ID4gPiANCj4gPiA+ID4gPiBPbiBXZWQsIDIw
MTktMDUtMjIgYXQgMTc6NDEgKzAxMDAsIEVtaWwgVmVsaWtvdiB3cm90ZToNCj4gPiA+ID4gPiA+
IEZyb206IEVtaWwgVmVsaWtvdiA8ZW1pbC52ZWxpa292QGNvbGxhYm9yYS5jb20+DQo+ID4gPiA+
ID4gPiANCj4gPiA+ID4gPiA+IERyb3AgdGhlIGN1c3RvbSBpb2N0bCBpbyBlbmNvZGluZyBjaGVj
ayAtIGNvcmUgZHJtIGRvZXMgaXQNCj4gPiA+ID4gPiA+IGZvcg0KPiA+ID4gPiA+ID4gdXMuDQo+
ID4gPiA+ID4gDQo+ID4gPiA+ID4gSSBmYWlsIHRvIHNlZSB3aGVyZSB0aGUgY29yZSBkb2VzIHRo
aXMsIG9yIGRvIEkgbWlzcw0KPiA+ID4gPiA+IHNvbWV0aGluZz8NCj4gPiA+ID4gDQo+ID4gPiA+
IGRybV9pb2N0bCgpIGFsbG93cyBmb3IgdGhlIGVuY29kaW5nIHRvIGJlIGNoYW5nZWQgYW5kDQo+
ID4gPiA+IGF0dHJpYnV0ZXMNCj4gPiA+ID4gdGhhdA0KPiA+ID4gPiBvbmx5IHRoZQ0KPiA+ID4g
PiBhcHByb3ByaWF0ZSBzaXplIGlzIGNvcGllZCBpbi9vdXQgb2YgdGhlIGtlcm5lbC4NCj4gPiA+
ID4gDQo+ID4gPiA+IFRlY2huaWNhbGx5IHRoZSBmdW5jdGlvbiBpcyBtb3JlIHJlbGF4ZWQgcmVs
YXRpdmUgdG8gdGhlIHZtd2dmeA0KPiA+ID4gPiBjaGVjaywgeWV0DQo+ID4gPiA+IHNlZW1zIHBl
cmZlY3RseSByZWFzb25hYmxlLg0KPiA+ID4gPiANCj4gPiA+ID4gSXMgdGhlcmUgYW55IGNvcm5l
ci1jYXNlIHRoYXQgaXNuJ3QgYnV0IHNob3VsZCBiZSBoYW5kbGVkIGluDQo+ID4gPiA+IGRybV9p
b2N0bCgpPw0KPiA+ID4gDQo+ID4gPiBJJ2QgbGlrZSB0byB0dXJuIHRoZSBxdWVzdGlvbiBhcm91
bmQgYW5kIGFzayB3aGV0aGVyIHRoZXJlJ3MgYQ0KPiA+ID4gcmVhc29uDQo+ID4gPiB3ZSBzaG91
bGQgcmVsYXggdGhlIHZtd2dmeCB0ZXN0PyBJbiB0aGUgcGFzdCBpdCBoYXMgdHJhcHBlZCBxdWl0
ZQ0KPiA+ID4gYQ0KPiA+ID4gZmV3DQo+ID4gPiB1c2VyLXNwYWNlIGVycm9ycy4NCj4gPiA+IA0K
PiA+IFRoZSB3YXkgSSBzZWUgaXQgZWl0aGVyOg0KPiA+ICAtIHRoZSBjaGVjaywgYXMtaXMsIGlz
IHVubmVzc2VzYXJ5LCBvcg0KPiA+ICAtIGl0IGlzIG5lZWRlZCwgYW5kIHdlIHNob3VsZCBkbyBz
b21ldGhpbmcgZXF1aXZhbGVudCBmb3IgYWxsIG9mDQo+ID4gRFJNDQo+ID4gDQo+ID4gV2UgaGFk
IGEgdmVyeSBsb25nIGJyYWluc3Rvcm1pbmcgc2Vzc2lvbiB3aXRoIGEgY29sbGVhZ3VlIGFuZCB3
ZQ0KPiA+IGNvdWxkIG5vdCBzZWUNCj4gPiBhbnkgY2FzZXMgd2hlcmUgdGhpcyB3b3VsZCBjYXVz
ZSBhIHByb2JsZW0uIElmIHlvdSByZWNhbGwgYW55dGhpbmcNCj4gPiBjb25jcmV0ZQ0KPiA+IHBs
ZWFzZSBsZXQgbWUga25vdyAtIEkgd291bGQgYmUgbW9yZSB0aGFuIGhhcHB5IHRvIHRha2UgYSBj
bG9zZXINCj4gPiBsb29rLg0KPiANCj4gSWYgeW91IGhhdmUgYSBnb29kIHJlYXNvbiB0byBkcm9w
IGFuIGlvY3RsIHNhbml0eSBjaGVjaywgSSdkIGJlDQo+IHBlcmZlY3RseSBoYXBweSB0byBkbyBp
dC4gVG8gbWUsIGEgZ29vZCByZWFzb24gZXZlbiBpbmNsdWRlcyAiSSBoYXZlDQo+IGENCj4gbm9u
LW9wZW4tc291cmNlIGN1c3RvbWVyIGhhdmluZyBwcm9ibGVtcyB3aXRoIHRoaXMgY2hlY2siIGJl
Y2F1c2Ugb2YNCj4gcmVhc29uIGV0Yy4gZXRjLiBhcyBsb25nIGFzIEkgaGF2ZSBhIHdheSB0byBl
dmFsdWF0ZSB0aG9zZSByZWFzb25zDQo+IGFuZA0KPiBkZXRlcm1pbmUgaWYgdGhleSdyZSB2YWxp
ZCBvciBub3QuICJObyBvdGhlciBkcm0gZHJpdmVyIG5vciB0aGUgY29yZQ0KPiBpcw0KPiBkb2lu
ZyB0aGlzIiBpcyBOT1QgYSB2YWxpZCByZWFzb24gdG8gbWUuIEluIHBhcnRpY3VsYXIgaWYgdGhl
IGNoZWNrDQo+IGlzDQo+IG5vdCBhZmZlY3RpbmcgcGVyZm9ybWFuY2UuIFNvIHVubGVzcyB5b3Ug
cHJvdmlkZSBhZGRpdGlvbmFsIHJlYXNvbnMNCj4gdG8NCj4gZHJvcCB0aGlzIGNoZWNrLCBpdCdz
IGEgc29saWQgTkFLIGZyb20gbXkgc2lkZS4NCg0KVG8gY2xhcmlmeSBteSBwb2ludCBvZiB2aWV3
IGEgYml0LCB0aGlzIGNoZWNrIGlzIHVzZWZ1bCB0byBlYXJseSBjYXRjaA0KdXNlcnNwYWNlIHVz
aW5nIGluY29ycmVjdCBmbGFncyBhbmQgc2l6ZXMsIHdoaWNoIG90aGVyd2lzZSBtaWdodCBtYWtl
DQppdCBvdXQgdG8gZGlzdHJvcyBhbmQgYWZ0ZXIgdGhhdCwgaW50cm9kdWNpbmcgYSBjaGVjayBs
aWtlIHRoaXMgd291bGQNCmJlIGltcG9zc2libGUsIHNpbmNlIGl0IG1pZ2h0IGJyZWFrIG9sZCB1
c2VyLXNwYWNlLiBGb3IgdGhlIHNhbWUgcmVhc29uDQppdCB3b3VsZCBwcm9iYWJseSBiZSB2ZXJ5
IGRpZmZpY3VsdCB0byBpbnRyb2R1Y2UgaXQgaW4gY29yZSBkcm0uIA0KDQpUaGFua3MsDQpUaG9t
YXMNCg0KDQoNCj4gDQo+IFRoYW5rcywNCj4gVGhvbWFzDQo+IA0KPiANCj4gPiBUaGFua3MNCj4g
PiBFbWlsDQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpk
cmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0
cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
