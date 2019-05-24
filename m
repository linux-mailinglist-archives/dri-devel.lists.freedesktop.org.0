Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 95F222A15D
	for <lists+dri-devel@lfdr.de>; Sat, 25 May 2019 00:40:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2CE086E11C;
	Fri, 24 May 2019 22:40:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM01-BN3-obe.outbound.protection.outlook.com
 (mail-bn3nam01on060d.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:fe41::60d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ADC106E11C
 for <dri-devel@lists.freedesktop.org>; Fri, 24 May 2019 22:40:00 +0000 (UTC)
Received: from MN2PR05MB6141.namprd05.prod.outlook.com (20.178.241.217) by
 MN2PR05MB6574.namprd05.prod.outlook.com (20.178.248.31) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1943.10; Fri, 24 May 2019 22:39:54 +0000
Received: from MN2PR05MB6141.namprd05.prod.outlook.com
 ([fe80::c19e:e8f8:b151:9ad]) by MN2PR05MB6141.namprd05.prod.outlook.com
 ([fe80::c19e:e8f8:b151:9ad%6]) with mapi id 15.20.1922.013; Fri, 24 May 2019
 22:39:54 +0000
From: Thomas Hellstrom <thellstrom@vmware.com>
To: "emil.l.velikov@gmail.com" <emil.l.velikov@gmail.com>
Subject: Re: [PATCH 4/5] drm/vmwgfx: remove custom ioctl io encoding check
Thread-Topic: [PATCH 4/5] drm/vmwgfx: remove custom ioctl io encoding check
Thread-Index: AQHVEL1o/6Se9/15V0mUxf0kK0ZgxaZ4RJKAgAHuVQCAAA3ugIAAJ+QAgAB5AAA=
Date: Fri, 24 May 2019 22:39:53 +0000
Message-ID: <27cb3f6d2002edcf45a4d50e6cef0854ba80766a.camel@vmware.com>
References: <20190522164119.24139-1-emil.l.velikov@gmail.com>
 <20190522164119.24139-4-emil.l.velikov@gmail.com>
 <a2ec4b6f529ffdc6146903decec6b5ba4cab0a1d.camel@vmware.com>
 <20190524121410.GB6233@arch-x1c3>
 <280025344d8590a4d10edfd9990d26d15a983264.camel@vmware.com>
 <20190524152648.GD8938@arch-x1c3>
In-Reply-To: <20190524152648.GD8938@arch-x1c3>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [155.4.205.35]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 4165101e-0771-4ff6-61ef-08d6e098bda0
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(5600148)(711020)(4605104)(1401327)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(2017052603328)(7193020);
 SRVR:MN2PR05MB6574; 
x-ms-traffictypediagnostic: MN2PR05MB6574:
x-ld-processed: b39138ca-3cee-4b4a-a4d6-cd83d9dd62f0,ExtAddr
x-microsoft-antispam-prvs: <MN2PR05MB657431AA77A78520FD624D32A1020@MN2PR05MB6574.namprd05.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-forefront-prvs: 0047BC5ADE
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(376002)(396003)(136003)(346002)(366004)(39860400002)(199004)(189003)(36756003)(5640700003)(2351001)(71200400001)(229853002)(76116006)(66066001)(73956011)(71190400001)(66476007)(66556008)(66446008)(64756008)(6436002)(6486002)(91956017)(316002)(256004)(6512007)(66946007)(54906003)(1361003)(6246003)(107886003)(5660300002)(25786009)(4326008)(53936002)(102836004)(76176011)(6506007)(478600001)(118296001)(99286004)(2906002)(6116002)(3846002)(186003)(476003)(2616005)(11346002)(446003)(26005)(7736002)(8936002)(305945005)(14454004)(86362001)(6916009)(486006)(2501003)(81166006)(81156014)(8676002)(68736007)(175924003);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MN2PR05MB6574;
 H:MN2PR05MB6141.namprd05.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: vmware.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: qiM/6YdWv1up9KG+HEpQs0hvjGi08ej+Oc4hx4ttt0pkg53Oal0+FuKYKc4YNdCrMJNjY2TDBuDUjMhroyosAbMhPdBx7tfKyr1Y//jCLj6Cr10mNnqGIIwfEoxteDU9x9Jtl6PINkJRzkITj4oetAosIGiZOivVvnCDukq8UAKZKiirB+AkdDOGagT2beZnBqTI6lLuQBnRckkxHdjsyaMy5OeCwzIx/NDMv4Ez9bsK3uBbb6tv0Omz63YDJ4stbY5ufIuYHo0tI1dd3j8DS2Pxzm5xng3TGv4Kh6/H2qdYhqHNZ8ufKus/L7Rg+DbiwAbSzokZoSqxYL+44Y/7stRm4S/6zf81uibFP4uaBoELmuv+K3gA9wLWUVzSBvdaRb5n0fV96uaYWPbJ+zo3aFFL2ip6W54kPZbrMWptBCs=
Content-ID: <FF2740130952F642BC99A50C8A1993EB@namprd05.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: vmware.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4165101e-0771-4ff6-61ef-08d6e098bda0
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 May 2019 22:39:53.9170 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b39138ca-3cee-4b4a-a4d6-cd83d9dd62f0
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: thellstrom@vmware.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR05MB6574
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=vmware.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gvPvn1W/Vdc2XwDukSKiRWYm1t4VaVxz6106qySl+fs=;
 b=BCurVSF6McJW0/6dx2XMlvpVBY1q2ln840el3CG8yJrcJySahmdR47JwSkG4W+7fzjJKHSh/jT6iALdgPjFMtJ2iuXbWFh6eE2Krq63wD3pVUSDOOW8zR2cjC6YPY5MTKgJcLviBjneHXm5+/WzVTZ4xlJBpBbX5CDxw9VZ3hyo=
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

SGksIEVtaWwNCg0KT24gRnJpLCAyMDE5LTA1LTI0IGF0IDE2OjI2ICswMTAwLCBFbWlsIFZlbGlr
b3Ygd3JvdGU6DQo+IE9uIDIwMTkvMDUvMjQsIFRob21hcyBIZWxsc3Ryb20gd3JvdGU6DQo+ID4g
T24gRnJpLCAyMDE5LTA1LTI0IGF0IDEzOjE0ICswMTAwLCBFbWlsIFZlbGlrb3Ygd3JvdGU6DQo+
ID4gPiBPbiAyMDE5LzA1LzIzLCBUaG9tYXMgSGVsbHN0cm9tIHdyb3RlOg0KPiA+ID4gPiBIaSwg
RW1pbCwNCj4gPiA+ID4gDQo+ID4gPiA+IE9uIFdlZCwgMjAxOS0wNS0yMiBhdCAxNzo0MSArMDEw
MCwgRW1pbCBWZWxpa292IHdyb3RlOg0KPiA+ID4gPiA+IEZyb206IEVtaWwgVmVsaWtvdiA8ZW1p
bC52ZWxpa292QGNvbGxhYm9yYS5jb20+DQo+ID4gPiA+ID4gDQo+ID4gPiA+ID4gRHJvcCB0aGUg
Y3VzdG9tIGlvY3RsIGlvIGVuY29kaW5nIGNoZWNrIC0gY29yZSBkcm0gZG9lcyBpdA0KPiA+ID4g
PiA+IGZvcg0KPiA+ID4gPiA+IHVzLg0KPiA+ID4gPiANCj4gPiA+ID4gSSBmYWlsIHRvIHNlZSB3
aGVyZSB0aGUgY29yZSBkb2VzIHRoaXMsIG9yIGRvIEkgbWlzcyBzb21ldGhpbmc/DQo+ID4gPiAN
Cj4gPiA+IGRybV9pb2N0bCgpIGFsbG93cyBmb3IgdGhlIGVuY29kaW5nIHRvIGJlIGNoYW5nZWQg
YW5kIGF0dHJpYnV0ZXMNCj4gPiA+IHRoYXQNCj4gPiA+IG9ubHkgdGhlDQo+ID4gPiBhcHByb3By
aWF0ZSBzaXplIGlzIGNvcGllZCBpbi9vdXQgb2YgdGhlIGtlcm5lbC4NCj4gPiA+IA0KPiA+ID4g
VGVjaG5pY2FsbHkgdGhlIGZ1bmN0aW9uIGlzIG1vcmUgcmVsYXhlZCByZWxhdGl2ZSB0byB0aGUg
dm13Z2Z4DQo+ID4gPiBjaGVjaywgeWV0DQo+ID4gPiBzZWVtcyBwZXJmZWN0bHkgcmVhc29uYWJs
ZS4NCj4gPiA+IA0KPiA+ID4gSXMgdGhlcmUgYW55IGNvcm5lci1jYXNlIHRoYXQgaXNuJ3QgYnV0
IHNob3VsZCBiZSBoYW5kbGVkIGluDQo+ID4gPiBkcm1faW9jdGwoKT8NCj4gPiANCj4gPiBJJ2Qg
bGlrZSB0byB0dXJuIHRoZSBxdWVzdGlvbiBhcm91bmQgYW5kIGFzayB3aGV0aGVyIHRoZXJlJ3Mg
YQ0KPiA+IHJlYXNvbg0KPiA+IHdlIHNob3VsZCByZWxheCB0aGUgdm13Z2Z4IHRlc3Q/IEluIHRo
ZSBwYXN0IGl0IGhhcyB0cmFwcGVkIHF1aXRlIGENCj4gPiBmZXcNCj4gPiB1c2VyLXNwYWNlIGVy
cm9ycy4NCj4gPiANCj4gVGhlIHdheSBJIHNlZSBpdCBlaXRoZXI6DQo+ICAtIHRoZSBjaGVjaywg
YXMtaXMsIGlzIHVubmVzc2VzYXJ5LCBvcg0KPiAgLSBpdCBpcyBuZWVkZWQsIGFuZCB3ZSBzaG91
bGQgZG8gc29tZXRoaW5nIGVxdWl2YWxlbnQgZm9yIGFsbCBvZiBEUk0NCj4gDQo+IFdlIGhhZCBh
IHZlcnkgbG9uZyBicmFpbnN0b3JtaW5nIHNlc3Npb24gd2l0aCBhIGNvbGxlYWd1ZSBhbmQgd2UN
Cj4gY291bGQgbm90IHNlZQ0KPiBhbnkgY2FzZXMgd2hlcmUgdGhpcyB3b3VsZCBjYXVzZSBhIHBy
b2JsZW0uIElmIHlvdSByZWNhbGwgYW55dGhpbmcNCj4gY29uY3JldGUNCj4gcGxlYXNlIGxldCBt
ZSBrbm93IC0gSSB3b3VsZCBiZSBtb3JlIHRoYW4gaGFwcHkgdG8gdGFrZSBhIGNsb3Nlcg0KPiBs
b29rLg0KDQpJZiB5b3UgaGF2ZSBhIGdvb2QgcmVhc29uIHRvIGRyb3AgYW4gaW9jdGwgc2FuaXR5
IGNoZWNrLCBJJ2QgYmUNCnBlcmZlY3RseSBoYXBweSB0byBkbyBpdC4gVG8gbWUsIGEgZ29vZCBy
ZWFzb24gZXZlbiBpbmNsdWRlcyAiSSBoYXZlIGENCm5vbi1vcGVuLXNvdXJjZSBjdXN0b21lciBo
YXZpbmcgcHJvYmxlbXMgd2l0aCB0aGlzIGNoZWNrIiBiZWNhdXNlIG9mDQpyZWFzb24gZXRjLiBl
dGMuIGFzIGxvbmcgYXMgSSBoYXZlIGEgd2F5IHRvIGV2YWx1YXRlIHRob3NlIHJlYXNvbnMgYW5k
DQpkZXRlcm1pbmUgaWYgdGhleSdyZSB2YWxpZCBvciBub3QuICJObyBvdGhlciBkcm0gZHJpdmVy
IG5vciB0aGUgY29yZSBpcw0KZG9pbmcgdGhpcyIgaXMgTk9UIGEgdmFsaWQgcmVhc29uIHRvIG1l
LiBJbiBwYXJ0aWN1bGFyIGlmIHRoZSBjaGVjayBpcw0Kbm90IGFmZmVjdGluZyBwZXJmb3JtYW5j
ZS4gU28gdW5sZXNzIHlvdSBwcm92aWRlIGFkZGl0aW9uYWwgcmVhc29ucyB0bw0KZHJvcCB0aGlz
IGNoZWNrLCBpdCdzIGEgc29saWQgTkFLIGZyb20gbXkgc2lkZS4NCg0KVGhhbmtzLA0KVGhvbWFz
DQoNCg0KPiANCj4gVGhhbmtzDQo+IEVtaWwNCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3Rz
LmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xp
c3RpbmZvL2RyaS1kZXZlbA==
