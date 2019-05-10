Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 16CD019F71
	for <lists+dri-devel@lfdr.de>; Fri, 10 May 2019 16:39:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E5ADA89728;
	Fri, 10 May 2019 14:39:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5CFB589728;
 Fri, 10 May 2019 14:39:13 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga106.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 10 May 2019 07:39:12 -0700
X-ExtLoop1: 1
Received: from irsmsx108.ger.corp.intel.com ([163.33.3.3])
 by orsmga003.jf.intel.com with ESMTP; 10 May 2019 07:39:07 -0700
Received: from irsmsx104.ger.corp.intel.com ([169.254.5.44]) by
 IRSMSX108.ger.corp.intel.com ([169.254.11.82]) with mapi id 14.03.0415.000;
 Fri, 10 May 2019 15:39:06 +0100
From: "Ser, Simon" <simon.ser@intel.com>
To: "daniel.vetter@ffwll.ch" <daniel.vetter@ffwll.ch>,
 "paul.kocialkowski@bootlin.com" <paul.kocialkowski@bootlin.com>
Subject: Re: Improving DRM connector hotplug uevents
Thread-Topic: Improving DRM connector hotplug uevents
Thread-Index: AQHVBwP3pyc2kyNrs06x4LIMtKtNgaZj7NEAgABwmoA=
Date: Fri, 10 May 2019 14:39:05 +0000
Message-ID: <2be4c7cb5b26c5bd802deb8d475f7b1f878b5a82.camel@intel.com>
References: <20190506175123.16445-1-imre.deak@intel.com>
 <20190508082442.7800-1-imre.deak@intel.com>
 <0a6aa43b2bc6db4e6b6f0fa3b31749cd62764160.camel@bootlin.com>
 <20190509120845.GC11264@ideak-desk.fi.intel.com>
 <856d50c4dfb80a98d73ed93bc0edf7ef8cc008d0.camel@bootlin.com>
 <274ecc5762db9314ef39fb2d9cec852b652b902c.camel@redhat.com>
 <419d16c1869b4f63e79fa9cf0f14dd32aa0db502.camel@intel.com>
 <6c87fea83175c1790a32c55d128d751eb43185a6.camel@bootlin.com>
 <CAKMK7uHAWEptEHAbAAS3FX2UHnyc5Dmix2J9fDU8uYVLYOz4Tw@mail.gmail.com>
In-Reply-To: <CAKMK7uHAWEptEHAbAAS3FX2UHnyc5Dmix2J9fDU8uYVLYOz4Tw@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.237.72.181]
Content-ID: <305727962510F14A979910AC80C5E30F@intel.com>
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
Cc: "airlied@linux.ie" <airlied@linux.ie>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>,
 "maxime.ripard@bootlin.com" <maxime.ripard@bootlin.com>,
 "thomas.petazzoni@bootlin.com" <thomas.petazzoni@bootlin.com>,
 "sean@poorly.run" <sean@poorly.run>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gRnJpLCAyMDE5LTA1LTEwIGF0IDA5OjU2ICswMjAwLCBEYW5pZWwgVmV0dGVyIHdyb3RlOg0K
PiBPbiBGcmksIE1heSAxMCwgMjAxOSBhdCA5OjQyIEFNIFBhdWwgS29jaWFsa293c2tpDQo+IDxw
YXVsLmtvY2lhbGtvd3NraUBib290bGluLmNvbT4gd3JvdGU6DQo+ID4gSGksDQo+ID4gDQo+ID4g
U28gdGhpcyB0aHJlYWQgaGFzIGRyaWZ0ZWQgb2ZmIGZyb20gSUdUIHRvIGEgZ2VuZXJhbCBEUk0g
aW1wcm92ZW1lbnQsDQo+ID4gc28gcmVuYW1pbmcgdGhlIHRocmVhZCBhbmQgYWRkaW5nIHNvbWUg
Q0NzLg0KPiA+IA0KPiA+IEl0J3MgYWJvdXQgYXZvaWRpbmcgZnVsbCByZXByb2JlcyAod2hpY2gg
bWF5IGluY2x1ZGUgc2xvdyBFRElEIHJlYWRzLA0KPiA+IGV0Yykgd2hlbiBhIGNvbm5lY3RvciBj
aGFuZ2Ugd2FzIGRldGVjdGVkLCBieSBwcm92aWRpbmcgaW5mb3JtYXRpb24NCj4gPiBhYm91dCB0
aGUgY29ubmVjdG9yIGFuZCB0aGUgbmV3IHN0YXRlIHRvIHVzZXJzcGFjZS4gVGhpcyB3YXksIHVz
ZXJzcGFjZQ0KPiA+IGNhbiByZXByb2JlIHRoZSBjaGFuZ2VkIGNvbm5lY3RvciBhbG9uZSAob3Ig
bm90IHJlcHJvYmUgYXQgYWxsIGluIGNhc2UNCj4gPiBvZiBhIGRpc2Nvbm5lY3QpLg0KPiA+IA0K
PiA+IEl0IGZlZWxzIGxpa2UgdGhlcmUgaXMgZ3Jvd2luZyB0ZW1wdGF0aW9uIHRvIGhhdmUgcGVy
LWRyaXZlciBoYWNrcyB0bw0KPiA+IGF2b2lkIGZ1bGwgcmVwcm9iZXMgd2hlbiB0aGUgZHJpdmVy
IGtub3dzIHRoYXQgbm90aGluZyBjaGFuZ2VkLCBidXQgSQ0KPiA+IHRoaW5rIGl0IG1ha2VzIG1v
cmUgc2Vuc2UgdG8gZml4dXAgdGhlIHVldmVudCB3ZSBzZW5kIHRvIG1ha2Ugc3VyZSB0aGF0DQo+
ID4gdXNlcnNwYWNlIGtub3dzIHdoYXQgdG8gcHJvYmUgZXhhY3RseS4NCj4gPiANCj4gPiBPbiBG
cmksIDIwMTktMDUtMTAgYXQgMDY6NTUgKzAwMDAsIFNlciwgU2ltb24gd3JvdGU6DQo+ID4gPiBP
biBUaHUsIDIwMTktMDUtMDkgYXQgMTE6NTYgLTA0MDAsIEx5dWRlIFBhdWwgd3JvdGU6DQo+ID4g
PiA+IEknbSBpbiBzdXBwb3J0IG9mIHRoaXMgYXMgd2VsbCwgd2UgcmVhbGx5IGNvdWxkIHVzZSBi
ZXR0ZXIgaG90cGx1ZyBldmVudHMuDQo+ID4gPiA+IEZlZWwgZnJlZSB0byBjYyBwYXRjaGVzIHRv
IG1lIGZvciByZXZpZXcgOikNCj4gPiA+IA0KPiA+ID4gQW55IGlkZWEocykgaG93IHRoZSBBUEkg
d291bGQgbG9vayBsaWtlPw0KPiA+IA0KPiA+IEZyb20gYSBxdWljayBjaGF0IG9uIElSQyB5ZXN0
ZXJkYXksIGl0IHNlZW1zIHRoYXQganVzdCBhZGRpbmcgZW50cmllcw0KPiA+IHRvIHRoZSB1ZXZl
bnQgd291bGQgZG8gYW5kIHdvdWxkIGJlIGJhY2t3YXJkcy1jb21wYXRpYmxlICh3ZWxsLA0KPiA+
IHByb3ZpZGVkIHRoYXQgdGhlIHVzZXJzcGFjZSB1ZXZlbnQgcGFyc2VycyB3aWxsIG5vdCBmYWls
IGlmIHNvbWV0aGluZw0KPiA+IGV4dHJhIHRvICJIT1RQTFVHPTEiIGlzIHByb3ZpZGVkKS4NCj4g
PiANCj4gPiBDdXJyZW50bHksIHRoZSBub3RpZmljYXRpb24gaXMgc2VudCBnbG9iYWxseSBhdCBl
YWNoIHJvdW5kIG9mIGRldGVjdGVkDQo+ID4gY29ubmVjdG9yIGNoYW5nZSAod2hpY2ggbWF5IGNv
bmNlcm4gbXVsdGlwbGUgY29ubmVjdG9ycykuIFNvIEkgdGhpbmsgd2UNCj4gPiBzaG91bGQganVz
dCBsaXN0IHRoZSBjb25uZWN0b3JzIHRoYXQgY2hhbmdlZCBpbiB0aGUgdWV2ZW50IGFuZCB0aGVp
cg0KPiA+IG5ldyBzdGF0ZS4gU28gbXkgcHJvcG9zYWwgaGVyZSBpcyBzb21ldGhpbmcgbGlrZToN
Cj4gPiANCj4gPiBIT1RQTFVHPTENCj4gPiBDT05ORUNUT1JfSUQ9NDcNCj4gPiBTVEFUVVM9Q29u
bmVjdGVkDQo+ID4gQ09OTkVDVE9SX0lEPTQ4DQo+ID4gU1RBVFVTPURpc2Nvbm5lY3RlZA0KPiA+
IA0KPiA+IFdoZXJlIGVhY2ggU1RBVFVTIGVudHJ5IHdvdWxkIHJlZmVyIHRvIHRoZSBwcmV2aW91
cyBDT05ORUNUT1JfSUQgZW50cnkuDQo+ID4gDQo+ID4gV2hhdCBkbyB5b3UgdGhpbms/DQo+IA0K
PiBXZSBoYXZlIHRoZSBiZXR0ZXIgdWV2ZW50IGFscmVhZHksIGFsbCB3ZSBuZWVkIGlzIHdpcmlu
ZyB1cCwgbG90cyBvZg0KPiBjb2RlLCBhbmQgdXNlcnNwYWNlIGZvciBpdC4gT2ssIG5vdCBxdWl0
ZSwgcGF0Y2ggaXMgc3RpbGwgaW4gZmxpZ2h0Og0KPiANCj4gaHR0cHM6Ly9wYXRjaHdvcmsua2Vy
bmVsLm9yZy9wYXRjaC8xMDkwNjY3Ny8NCg0KRXhjZWxsZW50Lg0KDQpJIGNhbiBoZWxwIHdpdGgg
YSB1c2Vyc3BhY2UgaW1wbGVtZW50YXRpb24gaWYgbmVlZGVkLg0KX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmkt
ZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3Jn
L21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
