Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 357BBAE4B6
	for <lists+dri-devel@lfdr.de>; Tue, 10 Sep 2019 09:34:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2DA5B6E840;
	Tue, 10 Sep 2019 07:34:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 587246E840;
 Tue, 10 Sep 2019 07:34:34 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga106.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 10 Sep 2019 00:34:33 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,487,1559545200"; d="scan'208";a="184071800"
Received: from irsmsx106.ger.corp.intel.com ([163.33.3.31])
 by fmsmga008.fm.intel.com with ESMTP; 10 Sep 2019 00:34:32 -0700
Received: from irsmsx155.ger.corp.intel.com (163.33.192.3) by
 IRSMSX106.ger.corp.intel.com (163.33.3.31) with Microsoft SMTP Server (TLS)
 id 14.3.439.0; Tue, 10 Sep 2019 08:34:32 +0100
Received: from irsmsx106.ger.corp.intel.com ([169.254.8.184]) by
 irsmsx155.ger.corp.intel.com ([169.254.14.139]) with mapi id 14.03.0439.000;
 Tue, 10 Sep 2019 08:34:31 +0100
From: "Mun, Gwan-gyeong" <gwan-gyeong.mun@intel.com>
To: "imirkin@alum.mit.edu" <imirkin@alum.mit.edu>
Subject: Re: [PATCH v4 3/7] drm: Add DisplayPort colorspace property
Thread-Topic: [PATCH v4 3/7] drm: Add DisplayPort colorspace property
Thread-Index: AQHVYlULXtt7lENbLk26VEgEx3grD6ced/GAgAADE4CAABxMAIACOMSAgAAoQICAA4aagA==
Date: Tue, 10 Sep 2019 07:34:31 +0000
Message-ID: <7f4e42bdaaf50390314ee8e9c4f94183df1bd0a1.camel@intel.com>
References: <20190903091235.32304-1-gwan-gyeong.mun@intel.com>
 <20190903091235.32304-4-gwan-gyeong.mun@intel.com>
 <CAKb7Uvi4aO-im=cBi_xy8QoDhUXsJmuxcL8ewOrMvFbky9Je0g@mail.gmail.com>
 <E7C9878FBA1C6D42A1CA3F62AEB6945F821DC31F@BGSMSX104.gar.corp.intel.com>
 <20190906114255.GS7482@intel.com>
 <CAKb7UvjdjrVtueEDM+eij0LvCrdAbwzUyNpbPde=AZ-7Dega2A@mail.gmail.com>
 <23376377793be0aecd14e08f6cbda7f699a5c761.camel@intel.com>
 <CAKb7UviqX5G2s-YJeXULe1Cg0oO1+auQZpONUbbm0JsQccfwHQ@mail.gmail.com>
In-Reply-To: <CAKb7UviqX5G2s-YJeXULe1Cg0oO1+auQZpONUbbm0JsQccfwHQ@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.237.66.159]
Content-ID: <94DCFE6C9899814D90AAEFDD43C7D705@intel.com>
MIME-Version: 1.0
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
Cc: "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "Shankar, Uma" <uma.shankar@intel.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gU2F0LCAyMDE5LTA5LTA3IGF0IDIxOjQzIC0wNDAwLCBJbGlhIE1pcmtpbiB3cm90ZToNCj4g
T24gU2F0LCBTZXAgNywgMjAxOSBhdCA3OjIwIFBNIE11biwgR3dhbi1neWVvbmcNCj4gPGd3YW4t
Z3llb25nLm11bkBpbnRlbC5jb20+IHdyb3RlOg0KPiA+IE9uIEZyaSwgMjAxOS0wOS0wNiBhdCAw
OToyNCAtMDQwMCwgSWxpYSBNaXJraW4gd3JvdGU6DQo+ID4gPiBPbiBGcmksIFNlcCA2LCAyMDE5
IGF0IDc6NDMgQU0gVmlsbGUgU3lyasOkbMOkDQo+ID4gPiA8dmlsbGUuc3lyamFsYUBsaW51eC5p
bnRlbC5jb20+IHdyb3RlOg0KPiA+ID4gPiBPbiBGcmksIFNlcCAwNiwgMjAxOSBhdCAxMTozMTo1
NUFNICswMDAwLCBTaGFua2FyLCBVbWEgd3JvdGU6DQo+ID4gPiA+ID4gPiAtLS0tLU9yaWdpbmFs
IE1lc3NhZ2UtLS0tLQ0KPiA+ID4gPiA+ID4gRnJvbTogSWxpYSBNaXJraW4gPGltaXJraW5AYWx1
bS5taXQuZWR1Pg0KPiA+ID4gPiA+ID4gU2VudDogVHVlc2RheSwgU2VwdGVtYmVyIDMsIDIwMTkg
NjoxMiBQTQ0KPiA+ID4gPiA+ID4gVG86IE11biwgR3dhbi1neWVvbmcgPGd3YW4tZ3llb25nLm11
bkBpbnRlbC5jb20+DQo+ID4gPiA+ID4gPiBDYzogSW50ZWwgR3JhcGhpY3MgRGV2ZWxvcG1lbnQg
PA0KPiA+ID4gPiA+ID4gaW50ZWwtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZw0KPiA+ID4gPiA+
ID4gPiA7IFNoYW5rYXIsIFVtYQ0KPiA+ID4gPiA+ID4gPHVtYS5zaGFua2FyQGludGVsLmNvbT47
IGRyaS1kZXZlbCA8DQo+ID4gPiA+ID4gPiBkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3Jn
Pg0KPiA+ID4gPiA+ID4gU3ViamVjdDogUmU6IFtQQVRDSCB2NCAzLzddIGRybTogQWRkIERpc3Bs
YXlQb3J0IGNvbG9yc3BhY2UNCj4gPiA+ID4gPiA+IHByb3BlcnR5DQo+ID4gPiA+ID4gPiANCj4g
PiA+ID4gPiA+IFNvIGhvdyB3b3VsZCB0aGlzIHdvcmsgd2l0aCBhIERQKysgY29ubmVjdG9yPyBT
aG91bGQgaXQNCj4gPiA+ID4gPiA+IGxpc3QNCj4gPiA+ID4gPiA+IHRoZSBIRE1JIG9yIERQDQo+
ID4gPiA+ID4gPiBwcm9wZXJ0aWVzPyBPciBkbyB3ZSBuZWVkIGEgY3VzdG9tIHByb3BlcnR5IGNo
ZWNrZXIgd2hpY2gNCj4gPiA+ID4gPiA+IGlzDQo+ID4gPiA+ID4gPiBhd2FyZSBvZiB3aGF0IGlz
DQo+ID4gPiA+ID4gPiBjdXJyZW50bHkgcGx1Z2dlZCBpbiB0byB2YWxpZGF0ZSB0aGUgdmFsdWVz
Pw0KPiA+ID4gPiA+IA0KPiA+ID4gPiA+IEFGQUlVIEZvciBEUCsrIGNhc2VzLCB3ZSBkZXRlY3Qg
d2hhdCBraW5kIG9mIHNpbmsgaXRzIGRyaXZpbmcNCj4gPiA+ID4gPiBEUA0KPiA+ID4gPiA+IG9y
IEhETUkgKHdpdGggYSBwYXNzaXZlIGRvbmdsZSkuDQo+ID4gPiA+ID4gQmFzZWQgb24gdGhlIHR5
cGUgb2Ygc2luayBkZXRlY3RlZCwgd2Ugc2hvdWxkIGV4cG9zZSBEUCBvcg0KPiA+ID4gPiA+IEhE
TUkNCj4gPiA+ID4gPiBjb2xvcnNwYWNlcyB0byB1c2Vyc3BhY2UuDQo+ID4gPiA+IA0KPiA+ID4g
PiBGb3IgaTkxNSBEUCBjb25uZWN0b3IgYWx3YXlzIGRyaXZlcyBEUCBtb2RlLCBIRE1JIGNvbm5l
Y3Rvcg0KPiA+ID4gPiBhbHdheXMNCj4gPiA+ID4gZHJpdmVzDQo+ID4gPiA+IEhETUkgbW9kZSwg
ZXZlbiB3aGVuIHRoZSBwaHlzaWNhbCBjb25uZWN0b3IgaXMgRFArKy4NCj4gPiA+IA0KPiA+ID4g
UmlnaHQsIGk5MTUgY3JlYXRlcyAyIGNvbm5lY3RvcnMsIHdoaWxlIG5vdXZlYXUsIHJhZGVvbiwg
YW5kDQo+ID4gPiBhbWRncHUNCj4gPiA+IGNyZWF0ZSAxIGNvbm5lY3RvciAobm90IHN1cmUgYWJv
dXQgb3RoZXIgZHJpdmVycykgZm9yIGEgc2luZ2xlDQo+ID4gPiBwaHlzaWNhbCBEUCsrIHNvY2tl
dC4gU2luY2Ugd2Ugc3VwcGx5IHRoZSBsaXN0IG9mIHZhbGlkIHZhbHVlcyBhdA0KPiA+ID4gdGhl
DQo+ID4gPiB0aW1lIG9mIGNyZWF0aW5nIHRoZSBjb25uZWN0b3IsIHdlIGNhbid0IGtub3cgYXQg
dGhhdCBwb2ludA0KPiA+ID4gd2hldGhlcg0KPiA+ID4gaW4NCj4gPiA+IHRoZSBmdXR1cmUgYSBI
RE1JIG9yIERQIHdpbGwgYmUgcGx1Z2dlZCBpbnRvIGl0Lg0KPiA+ID4gDQo+ID4gPiAgIC1pbGlh
DQo+ID4gSWxpYSwgZG9lcyBpdCBtZWFuIHRoYXQgdGhlIGRybV9jb25uZWN0b3IgdHlwZSBpcw0K
PiA+IERSTV9NT0RFX0NPTk5FQ1RPUl9EaXNwbGF5UG9ydCBhbmQgcHJvdG9jb2wgaXMgRFArKyBt
b2RlPw0KPiANCj4gVGhhdCBpcyBjb3JyZWN0LiBUaGUgY29ubmVjdG9yIHR5cGUgaXMgIkRpc3Bs
YXlQb3J0IiBpbiBzdWNoIGEgY2FzZS4NCj4gDQo+IENoZWVycywNCj4gDQo+ICAgLWlsaWENCg0K
Rm9yIG5vdyBkcm1fbW9kZV9jcmVhdGVfY29sb3JzcGFjZV9wcm9wZXJ0eSgpIGlzIG9ubHkgdXNl
ZCBmb3IgaTkxNS4NCklNSE8sIHdoZW4gb3RoZXIgZHJpdmVycyAoIG5vdXZlYXUsIHJhZGVvbiwg
YW5kIGFtZGdwdSApIGFyZSByZWFkeSBmb3INCnVzaW5nIG9mIGRybV9tb2RlX2NyZWF0ZV9jb2xv
cnNwYWNlX3Byb3BlcnR5KCksDQp3aGF0IGFib3V0IGRvIHdlIGFkZCBhIHZhcmlhYmxlIHdoaWNo
IGNhbiBpZGVudGlmeSBEUCsrIGFuZCBEUCB0bw0KZHJtX2Nvbm5lY3Rvcj8NCkFuZCB3aGVuIHRo
ZSBkcml2ZXJzIChub3V2ZWF1LCByYWRlb24sIGFuZCBhbWRncHUpIGRldGVjdCB0aGUgY3VycmVu
dA0KcHJvdG9jb2wsIHRoZSBkcml2ZXJzIHdpbGwgc2V0IHRoZSB2YXJpYWJsZS4NCg0KQnIsDQot
IEcuRy4NCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRy
aS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRw
czovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
