Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 27DCDAE490
	for <lists+dri-devel@lfdr.de>; Tue, 10 Sep 2019 09:21:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 704AD6E833;
	Tue, 10 Sep 2019 07:21:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 416166E833;
 Tue, 10 Sep 2019 07:21:31 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by orsmga102.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 10 Sep 2019 00:21:30 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,487,1559545200"; d="scan'208";a="185427605"
Received: from irsmsx109.ger.corp.intel.com ([163.33.3.23])
 by fmsmga007.fm.intel.com with ESMTP; 10 Sep 2019 00:21:28 -0700
Received: from irsmsx155.ger.corp.intel.com (163.33.192.3) by
 IRSMSX109.ger.corp.intel.com (163.33.3.23) with Microsoft SMTP Server (TLS)
 id 14.3.439.0; Tue, 10 Sep 2019 08:21:28 +0100
Received: from irsmsx106.ger.corp.intel.com ([169.254.8.184]) by
 irsmsx155.ger.corp.intel.com ([169.254.14.139]) with mapi id 14.03.0439.000;
 Tue, 10 Sep 2019 08:21:28 +0100
From: "Mun, Gwan-gyeong" <gwan-gyeong.mun@intel.com>
To: "ville.syrjala@linux.intel.com" <ville.syrjala@linux.intel.com>
Subject: Re: [PATCH v4 3/7] drm: Add DisplayPort colorspace property
Thread-Topic: [PATCH v4 3/7] drm: Add DisplayPort colorspace property
Thread-Index: AQHVYlULXtt7lENbLk26VEgEx3grD6ced/GAgAADE4CAABxMAIACOMSAgAJMLYCAAV8GgA==
Date: Tue, 10 Sep 2019 07:21:27 +0000
Message-ID: <6e9a1378a10d64908c919988ba916224a01dcda8.camel@intel.com>
References: <20190903091235.32304-1-gwan-gyeong.mun@intel.com>
 <20190903091235.32304-4-gwan-gyeong.mun@intel.com>
 <CAKb7Uvi4aO-im=cBi_xy8QoDhUXsJmuxcL8ewOrMvFbky9Je0g@mail.gmail.com>
 <E7C9878FBA1C6D42A1CA3F62AEB6945F821DC31F@BGSMSX104.gar.corp.intel.com>
 <20190906114255.GS7482@intel.com>
 <CAKb7UvjdjrVtueEDM+eij0LvCrdAbwzUyNpbPde=AZ-7Dega2A@mail.gmail.com>
 <23376377793be0aecd14e08f6cbda7f699a5c761.camel@intel.com>
 <20190909102503.GV7482@intel.com>
In-Reply-To: <20190909102503.GV7482@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.237.66.159]
Content-ID: <A2D08424CFD3E24487B7CD8358420487@intel.com>
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

T24gTW9uLCAyMDE5LTA5LTA5IGF0IDEzOjI1ICswMzAwLCBWaWxsZSBTeXJqw6Rsw6Qgd3JvdGU6
DQo+IE9uIFNhdCwgU2VwIDA3LCAyMDE5IGF0IDExOjE5OjU1UE0gKzAwMDAsIE11biwgR3dhbi1n
eWVvbmcgd3JvdGU6DQo+ID4gT24gRnJpLCAyMDE5LTA5LTA2IGF0IDA5OjI0IC0wNDAwLCBJbGlh
IE1pcmtpbiB3cm90ZToNCj4gPiA+IE9uIEZyaSwgU2VwIDYsIDIwMTkgYXQgNzo0MyBBTSBWaWxs
ZSBTeXJqw6Rsw6QNCj4gPiA+IDx2aWxsZS5zeXJqYWxhQGxpbnV4LmludGVsLmNvbT4gd3JvdGU6
DQo+ID4gPiA+IE9uIEZyaSwgU2VwIDA2LCAyMDE5IGF0IDExOjMxOjU1QU0gKzAwMDAsIFNoYW5r
YXIsIFVtYSB3cm90ZToNCj4gPiA+ID4gPiA+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+
ID4gPiA+ID4gPiBGcm9tOiBJbGlhIE1pcmtpbiA8aW1pcmtpbkBhbHVtLm1pdC5lZHU+DQo+ID4g
PiA+ID4gPiBTZW50OiBUdWVzZGF5LCBTZXB0ZW1iZXIgMywgMjAxOSA2OjEyIFBNDQo+ID4gPiA+
ID4gPiBUbzogTXVuLCBHd2FuLWd5ZW9uZyA8Z3dhbi1neWVvbmcubXVuQGludGVsLmNvbT4NCj4g
PiA+ID4gPiA+IENjOiBJbnRlbCBHcmFwaGljcyBEZXZlbG9wbWVudCA8DQo+ID4gPiA+ID4gPiBp
bnRlbC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnDQo+ID4gPiA+ID4gPiA+IDsgU2hhbmthciwg
VW1hDQo+ID4gPiA+ID4gPiA8dW1hLnNoYW5rYXJAaW50ZWwuY29tPjsgZHJpLWRldmVsIDwNCj4g
PiA+ID4gPiA+IGRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmc+DQo+ID4gPiA+ID4gPiBT
dWJqZWN0OiBSZTogW1BBVENIIHY0IDMvN10gZHJtOiBBZGQgRGlzcGxheVBvcnQgY29sb3JzcGFj
ZQ0KPiA+ID4gPiA+ID4gcHJvcGVydHkNCj4gPiA+ID4gPiA+IA0KPiA+ID4gPiA+ID4gU28gaG93
IHdvdWxkIHRoaXMgd29yayB3aXRoIGEgRFArKyBjb25uZWN0b3I/IFNob3VsZCBpdA0KPiA+ID4g
PiA+ID4gbGlzdA0KPiA+ID4gPiA+ID4gdGhlIEhETUkgb3IgRFANCj4gPiA+ID4gPiA+IHByb3Bl
cnRpZXM/IE9yIGRvIHdlIG5lZWQgYSBjdXN0b20gcHJvcGVydHkgY2hlY2tlciB3aGljaA0KPiA+
ID4gPiA+ID4gaXMNCj4gPiA+ID4gPiA+IGF3YXJlIG9mIHdoYXQgaXMNCj4gPiA+ID4gPiA+IGN1
cnJlbnRseSBwbHVnZ2VkIGluIHRvIHZhbGlkYXRlIHRoZSB2YWx1ZXM/DQo+ID4gPiA+ID4gDQo+
ID4gPiA+ID4gQUZBSVUgRm9yIERQKysgY2FzZXMsIHdlIGRldGVjdCB3aGF0IGtpbmQgb2Ygc2lu
ayBpdHMgZHJpdmluZw0KPiA+ID4gPiA+IERQDQo+ID4gPiA+ID4gb3IgSERNSSAod2l0aCBhIHBh
c3NpdmUgZG9uZ2xlKS4NCj4gPiA+ID4gPiBCYXNlZCBvbiB0aGUgdHlwZSBvZiBzaW5rIGRldGVj
dGVkLCB3ZSBzaG91bGQgZXhwb3NlIERQIG9yDQo+ID4gPiA+ID4gSERNSQ0KPiA+ID4gPiA+IGNv
bG9yc3BhY2VzIHRvIHVzZXJzcGFjZS4NCj4gPiA+ID4gDQo+ID4gPiA+IEZvciBpOTE1IERQIGNv
bm5lY3RvciBhbHdheXMgZHJpdmVzIERQIG1vZGUsIEhETUkgY29ubmVjdG9yDQo+ID4gPiA+IGFs
d2F5cw0KPiA+ID4gPiBkcml2ZXMNCj4gPiA+ID4gSERNSSBtb2RlLCBldmVuIHdoZW4gdGhlIHBo
eXNpY2FsIGNvbm5lY3RvciBpcyBEUCsrLg0KPiA+ID4gDQo+ID4gPiBSaWdodCwgaTkxNSBjcmVh
dGVzIDIgY29ubmVjdG9ycywgd2hpbGUgbm91dmVhdSwgcmFkZW9uLCBhbmQNCj4gPiA+IGFtZGdw
dQ0KPiA+ID4gY3JlYXRlIDEgY29ubmVjdG9yIChub3Qgc3VyZSBhYm91dCBvdGhlciBkcml2ZXJz
KSBmb3IgYSBzaW5nbGUNCj4gPiA+IHBoeXNpY2FsIERQKysgc29ja2V0LiBTaW5jZSB3ZSBzdXBw
bHkgdGhlIGxpc3Qgb2YgdmFsaWQgdmFsdWVzIGF0DQo+ID4gPiB0aGUNCj4gPiA+IHRpbWUgb2Yg
Y3JlYXRpbmcgdGhlIGNvbm5lY3Rvciwgd2UgY2FuJ3Qga25vdyBhdCB0aGF0IHBvaW50DQo+ID4g
PiB3aGV0aGVyDQo+ID4gPiBpbg0KPiA+ID4gdGhlIGZ1dHVyZSBhIEhETUkgb3IgRFAgd2lsbCBi
ZSBwbHVnZ2VkIGludG8gaXQuDQo+ID4gPiANCj4gPiA+ICAgLWlsaWENCj4gPiBJbGlhLCBkb2Vz
IGl0IG1lYW4gdGhhdCB0aGUgZHJtX2Nvbm5lY3RvciB0eXBlIGlzDQo+ID4gRFJNX01PREVfQ09O
TkVDVE9SX0Rpc3BsYXlQb3J0IGFuZCBwcm90b2NvbCBpcyBEUCsrIG1vZGU/DQo+ID4gDQo+ID4g
QW5kIFZpbGxlIGFuZCBVbWEsICB3aGVuIHdlIGFyZSB1c2VpbmcgZHAgYWN0aXZlIGRvbmdsZSAo
RFAgdG8gSERNSQ0KPiA+IGRvbmdsZSBhbmQgRFAgYnJhbmNoIGRldmljZSBpcyBIRE1JKSBzaG91
bGQgd2UgZXhwb3NlIEhETUkNCj4gPiBjb2xvcnNwYWNlPw0KPiANCj4gV2Ugc3RpbGwgc2V0IGl0
IHVwIHZpYSBEUCBNU0EvVlNDIG5vPyBJbiB0aGF0IGNhc2UgaXQgc2hvdWxkIGZvbGxvdw0KPiB0
aGUNCj4gRFAgc3BlYyBJIHRoaW5rLiBMU1BDT04gaXMgcHJvYmFibHkgZGlmZmVyZW50IGJlY2F1
c2Ugd2UgbWFudWFsbHkgDQpZZXMsIEkgYWdyZWUgdG9vLiANCg0KLSBHLkcuDQo+IGdlbmVyYXRl
DQo+IHRoZSBBVkkgaW5mb2ZyYW1lIGZvciBpdC4gQnV0IEknbSBub3Qgc3VyZSBob3cgd2UncmUg
Z29pbmcgdG8NCj4gcmVjb25jaWxlDQo+IHRoYXQgd2l0aCB0aGUgRFAgc3R1ZmYgd2UgYWxzbyBz
ZXQgdXAgZm9yIGl0Lg0KPiANCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNr
dG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2Ry
aS1kZXZlbA==
