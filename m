Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 49B5715111C
	for <lists+dri-devel@lfdr.de>; Mon,  3 Feb 2020 21:39:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4384A6ECF5;
	Mon,  3 Feb 2020 20:38:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 30BE86ECF4;
 Mon,  3 Feb 2020 20:38:57 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga107.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 03 Feb 2020 12:38:56 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,398,1574150400"; d="scan'208";a="234834815"
Received: from fmsmsx106.amr.corp.intel.com ([10.18.124.204])
 by orsmga006.jf.intel.com with ESMTP; 03 Feb 2020 12:38:56 -0800
Received: from FMSMSX110.amr.corp.intel.com (10.18.116.10) by
 FMSMSX106.amr.corp.intel.com (10.18.124.204) with Microsoft SMTP Server (TLS)
 id 14.3.439.0; Mon, 3 Feb 2020 12:38:55 -0800
Received: from bgsmsx154.gar.corp.intel.com (10.224.48.47) by
 fmsmsx110.amr.corp.intel.com (10.18.116.10) with Microsoft SMTP Server (TLS)
 id 14.3.439.0; Mon, 3 Feb 2020 12:38:54 -0800
Received: from bgsmsx104.gar.corp.intel.com ([169.254.5.36]) by
 BGSMSX154.gar.corp.intel.com ([169.254.7.133]) with mapi id 14.03.0439.000;
 Tue, 4 Feb 2020 02:08:51 +0530
From: "Shankar, Uma" <uma.shankar@intel.com>
To: Alex Deucher <alexdeucher@gmail.com>, Ville Syrjala
 <ville.syrjala@linux.intel.com>
Subject: RE: [Intel-gfx] [PATCH 8/8] drm/edid: Dump bogus 18 byte descriptors
Thread-Topic: [Intel-gfx] [PATCH 8/8] drm/edid: Dump bogus 18 byte descriptors
Thread-Index: AQHV0vFXM3BptgrE0Eu7xOHdOOfiTaf+wwGAgAs60WA=
Date: Mon, 3 Feb 2020 20:38:52 +0000
Message-ID: <E7C9878FBA1C6D42A1CA3F62AEB6945F823AA06A@BGSMSX104.gar.corp.intel.com>
References: <20200124200231.10517-1-ville.syrjala@linux.intel.com>
 <20200124200231.10517-8-ville.syrjala@linux.intel.com>
 <CADnq5_P4z0XFouqQ5idxgBUeT1CSLScgNarKOZ0C2JnKt02ehw@mail.gmail.com>
In-Reply-To: <CADnq5_P4z0XFouqQ5idxgBUeT1CSLScgNarKOZ0C2JnKt02ehw@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ctpclassification: CTP_NT
x-titus-metadata-40: eyJDYXRlZ29yeUxhYmVscyI6IiIsIk1ldGFkYXRhIjp7Im5zIjoiaHR0cDpcL1wvd3d3LnRpdHVzLmNvbVwvbnNcL0ludGVsMyIsImlkIjoiZmFmZGU2MWQtZDEyNC00ODcyLTg1NjAtNzljNjFmYzljNjkzIiwicHJvcHMiOlt7Im4iOiJDVFBDbGFzc2lmaWNhdGlvbiIsInZhbHMiOlt7InZhbHVlIjoiQ1RQX05UIn1dfV19LCJTdWJqZWN0TGFiZWxzIjpbXSwiVE1DVmVyc2lvbiI6IjE3LjEwLjE4MDQuNDkiLCJUcnVzdGVkTGFiZWxIYXNoIjoieVhBXC9cL1NDV2pFbW05dVwvT1o4cGpZMjZYUEtWNEppekFaMUJKU0NDeWdDd0N4dExZSlBOSVRDQ3VQeE8zNEJkMiJ9
dlp-product: dlpe-windows
dlp-version: 11.2.0.6
dlp-reaction: no-action
x-originating-ip: [10.223.10.10]
MIME-Version: 1.0
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
Cc: Intel Graphics Development <intel-gfx@lists.freedesktop.org>, Maling
 list - DRI developers <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogSW50ZWwtZ2Z4IDxpbnRl
bC1nZngtYm91bmNlc0BsaXN0cy5mcmVlZGVza3RvcC5vcmc+IE9uIEJlaGFsZiBPZiBBbGV4DQo+
IERldWNoZXINCj4gU2VudDogVHVlc2RheSwgSmFudWFyeSAyOCwgMjAyMCA0OjA5IEFNDQo+IFRv
OiBWaWxsZSBTeXJqYWxhIDx2aWxsZS5zeXJqYWxhQGxpbnV4LmludGVsLmNvbT4NCj4gQ2M6IElu
dGVsIEdyYXBoaWNzIERldmVsb3BtZW50IDxpbnRlbC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3Jn
PjsgTWFsaW5nIGxpc3QgLSBEUkkNCj4gZGV2ZWxvcGVycyA8ZHJpLWRldmVsQGxpc3RzLmZyZWVk
ZXNrdG9wLm9yZz4NCj4gU3ViamVjdDogUmU6IFtJbnRlbC1nZnhdIFtQQVRDSCA4LzhdIGRybS9l
ZGlkOiBEdW1wIGJvZ3VzIDE4IGJ5dGUgZGVzY3JpcHRvcnMNCj4gDQo+IE9uIEZyaSwgSmFuIDI0
LCAyMDIwIGF0IDM6MDMgUE0gVmlsbGUgU3lyamFsYSA8dmlsbGUuc3lyamFsYUBsaW51eC5pbnRl
bC5jb20+IHdyb3RlOg0KPiA+DQo+ID4gRnJvbTogVmlsbGUgU3lyasOkbMOkIDx2aWxsZS5zeXJq
YWxhQGxpbnV4LmludGVsLmNvbT4NCj4gPg0KPiA+IEknbSBjdXJpb3VzIGlmIHRoZXJlIGFyZSBh
bnkgYm9ndXMgMTggYnl0ZSBkZXNjcmlwdG9ycyBhcm91bmQuDQo+ID4gTGV0J3MgZHVtcCB0aGVt
IG91dCBpZiB3ZSBlbmNvdW50ZXIgdGhlbS4NCj4gPg0KPiA+IE5vdCBzdXJlIHdlJ2QgYWN0dWFs
bHkgd2FudCB0aGlzLCBidXQgYXQgbGVhc3QgSSBnZXQgdG8gc2VlIGlmIG91ciBDSQ0KPiA+IGhh
cyBhbnl0aGluZyB0aGF0IGhpdHMgdGhpcyA6KQ0KPiA+DQo+ID4gU2lnbmVkLW9mZi1ieTogVmls
bGUgU3lyasOkbMOkIDx2aWxsZS5zeXJqYWxhQGxpbnV4LmludGVsLmNvbT4NCj4gDQo+IEFja2Vk
LWJ5OiBBbGV4IERldWNoZXIgPGFsZXhhbmRlci5kZXVjaGVyQGFtZC5jb20+DQoNCkxvb2tzIGdv
b2QgdG8gbWUgYXMgd2VsbC4NClJldmlld2VkLWJ5OiBVbWEgU2hhbmthciA8dW1hLnNoYW5rYXJA
aW50ZWwuY29tPg0KDQo+ID4gLS0tDQo+ID4gIGRyaXZlcnMvZ3B1L2RybS9kcm1fZWRpZC5jIHwg
MjIgKysrKysrKysrKysrKysrKysrKy0tLQ0KPiA+ICAxIGZpbGUgY2hhbmdlZCwgMTkgaW5zZXJ0
aW9ucygrKSwgMyBkZWxldGlvbnMoLSkNCj4gPg0KPiA+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dw
dS9kcm0vZHJtX2VkaWQuYyBiL2RyaXZlcnMvZ3B1L2RybS9kcm1fZWRpZC5jDQo+ID4gaW5kZXgg
OGU3NmVmZTE2NTRkLi40ZDgzMDNlNTY1MzYgMTAwNjQ0DQo+ID4gLS0tIGEvZHJpdmVycy9ncHUv
ZHJtL2RybV9lZGlkLmMNCj4gPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vZHJtX2VkaWQuYw0KPiA+
IEBAIC0yMjAyLDYgKzIyMDIsMTIgQEAgc3RhdGljIGJvb2wgaXNfZGlzcGxheV9kZXNjcmlwdG9y
KGNvbnN0IHU4IGRbMThdLCB1OA0KPiB0YWcpDQo+ID4gICAgICAgICAgICAgICAgIGRbMl0gPT0g
MHgwMCAmJiBkWzNdID09IHRhZzsgIH0NCj4gPg0KPiA+ICtzdGF0aWMgYm9vbCBpc19hbnlfZGlz
cGxheV9kZXNjcmlwdG9yKGNvbnN0IHU4IGRbMThdKSB7DQo+ID4gKyAgICAgICByZXR1cm4gZFsw
XSA9PSAweDAwICYmIGRbMV0gPT0gMHgwMCAmJg0KPiA+ICsgICAgICAgICAgICAgICBkWzJdID09
IDB4MDA7DQo+ID4gK30NCj4gPiArDQo+ID4gIHN0YXRpYyBib29sIGlzX2RldGFpbGVkX3RpbWlu
Z19kZXNjcmlwdG9yKGNvbnN0IHU4IGRbMThdKSAgew0KPiA+ICAgICAgICAgcmV0dXJuIGRbMF0g
IT0gMHgwMCB8fCBkWzFdICE9IDB4MDA7IEBAIC0yMjA5LDYgKzIyMTUsMTUgQEANCj4gPiBzdGF0
aWMgYm9vbCBpc19kZXRhaWxlZF90aW1pbmdfZGVzY3JpcHRvcihjb25zdCB1OCBkWzE4XSkNCj4g
Pg0KPiA+ICB0eXBlZGVmIHZvaWQgZGV0YWlsZWRfY2IoY29uc3Qgc3RydWN0IGRldGFpbGVkX3Rp
bWluZyAqdGltaW5nLCB2b2lkDQo+ID4gKmNsb3N1cmUpOw0KPiA+DQo+ID4gK3N0YXRpYyB2b2lk
IGRvX2RldGFpbGVkX2Jsb2NrKGNvbnN0IHU4IGRbMThdLCBkZXRhaWxlZF9jYiAqY2IsIHZvaWQN
Cj4gPiArKmNsb3N1cmUpIHsNCj4gPiArICAgICAgIGlmICghaXNfZGV0YWlsZWRfdGltaW5nX2Rl
c2NyaXB0b3IoZCkgJiYNCj4gPiArICAgICAgICAgICAhaXNfYW55X2Rpc3BsYXlfZGVzY3JpcHRv
cihkKSkNCj4gPiArICAgICAgICAgICAgICAgRFJNX1dBUk4oIlVucmVjb2duaXplZCAxOCBieXRl
IGRlc2NyaXB0b3I6ICUqcGhcbiIsDQo+ID4gKzE4LCBkKTsNCj4gPiArDQo+ID4gKyAgICAgICBj
YigoY29uc3Qgc3RydWN0IGRldGFpbGVkX3RpbWluZyAqKWQsIGNsb3N1cmUpOyB9DQo+ID4gKw0K
PiA+ICBzdGF0aWMgdm9pZA0KPiA+ICBjZWFfZm9yX2VhY2hfZGV0YWlsZWRfYmxvY2soY29uc3Qg
dTggKmV4dCwgZGV0YWlsZWRfY2IgKmNiLCB2b2lkDQo+ID4gKmNsb3N1cmUpICB7IEBAIC0yMjIx
LDcgKzIyMzYsNyBAQCBjZWFfZm9yX2VhY2hfZGV0YWlsZWRfYmxvY2soY29uc3QNCj4gPiB1OCAq
ZXh0LCBkZXRhaWxlZF9jYiAqY2IsIHZvaWQgKmNsb3N1cmUpDQo+ID4NCj4gPiAgICAgICAgIG4g
PSAoMTI3IC0gZCkgLyAxODsNCj4gPiAgICAgICAgIGZvciAoaSA9IDA7IGkgPCBuOyBpKyspDQo+
ID4gLSAgICAgICAgICAgICAgIGNiKChjb25zdCBzdHJ1Y3QgZGV0YWlsZWRfdGltaW5nICopKGRl
dF9iYXNlICsgMTggKiBpKSwgY2xvc3VyZSk7DQo+ID4gKyAgICAgICAgICAgICAgIGRvX2RldGFp
bGVkX2Jsb2NrKGRldF9iYXNlICsgMTggKiBpLCBjYiwgY2xvc3VyZSk7DQo+ID4gIH0NCj4gPg0K
PiA+ICBzdGF0aWMgdm9pZA0KPiA+IEBAIC0yMjM0LDcgKzIyNDksNyBAQCB2dGJfZm9yX2VhY2hf
ZGV0YWlsZWRfYmxvY2soY29uc3QgdTggKmV4dCwgZGV0YWlsZWRfY2INCj4gKmNiLCB2b2lkICpj
bG9zdXJlKQ0KPiA+ICAgICAgICAgICAgICAgICByZXR1cm47IC8qIHVua25vd24gdmVyc2lvbiAq
Lw0KPiA+DQo+ID4gICAgICAgICBmb3IgKGkgPSAwOyBpIDwgbjsgaSsrKQ0KPiA+IC0gICAgICAg
ICAgICAgICBjYigoY29uc3Qgc3RydWN0IGRldGFpbGVkX3RpbWluZyAqKShkZXRfYmFzZSArIDE4
ICogaSksIGNsb3N1cmUpOw0KPiA+ICsgICAgICAgICAgICAgICBkb19kZXRhaWxlZF9ibG9jayhk
ZXRfYmFzZSArIDE4ICogaSwgY2IsIGNsb3N1cmUpOw0KPiA+ICB9DQo+ID4NCj4gPiAgc3RhdGlj
IHZvaWQNCj4gPiBAQCAtMjI0Nyw3ICsyMjYyLDggQEAgZHJtX2Zvcl9lYWNoX2RldGFpbGVkX2Js
b2NrKGNvbnN0IHU4ICpyYXdfZWRpZCwNCj4gZGV0YWlsZWRfY2IgKmNiLCB2b2lkICpjbG9zdXJl
KQ0KPiA+ICAgICAgICAgICAgICAgICByZXR1cm47DQo+ID4NCj4gPiAgICAgICAgIGZvciAoaSA9
IDA7IGkgPCBFRElEX0RFVEFJTEVEX1RJTUlOR1M7IGkrKykNCj4gPiAtICAgICAgICAgICAgICAg
Y2IoJihlZGlkLT5kZXRhaWxlZF90aW1pbmdzW2ldKSwgY2xvc3VyZSk7DQo+ID4gKyAgICAgICAg
ICAgICAgIGRvX2RldGFpbGVkX2Jsb2NrKChjb25zdCB1OCAqKSZlZGlkLT5kZXRhaWxlZF90aW1p
bmdzW2ldLA0KPiA+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBjYiwgY2xvc3Vy
ZSk7DQo+ID4NCj4gPiAgICAgICAgIGZvciAoaSA9IDE7IGkgPD0gcmF3X2VkaWRbMHg3ZV07IGkr
Kykgew0KPiA+ICAgICAgICAgICAgICAgICBjb25zdCB1OCAqZXh0ID0gcmF3X2VkaWQgKyAoaSAq
IEVESURfTEVOR1RIKTsNCj4gPiAtLQ0KPiA+IDIuMjQuMQ0KPiA+DQo+ID4gX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18NCj4gPiBkcmktZGV2ZWwgbWFpbGlu
ZyBsaXN0DQo+ID4gZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZw0KPiA+IGh0dHBzOi8v
bGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsDQo+IF9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fDQo+IEludGVsLWdmeCBt
YWlsaW5nIGxpc3QNCj4gSW50ZWwtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZw0KPiBodHRwczov
L2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2ludGVsLWdmeA0KX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxp
bmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJl
ZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==
