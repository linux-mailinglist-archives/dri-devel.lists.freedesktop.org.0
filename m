Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BEF5633357
	for <lists+dri-devel@lfdr.de>; Mon,  3 Jun 2019 17:19:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 323E889291;
	Mon,  3 Jun 2019 15:19:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 207C289291;
 Mon,  3 Jun 2019 15:19:23 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by orsmga103.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 03 Jun 2019 08:19:22 -0700
X-ExtLoop1: 1
Received: from irsmsx153.ger.corp.intel.com ([163.33.192.75])
 by orsmga003.jf.intel.com with ESMTP; 03 Jun 2019 08:19:20 -0700
Received: from irsmsx104.ger.corp.intel.com ([169.254.5.93]) by
 IRSMSX153.ger.corp.intel.com ([169.254.9.129]) with mapi id 14.03.0415.000;
 Mon, 3 Jun 2019 16:19:14 +0100
From: "Ser, Simon" <simon.ser@intel.com>
To: "daniel@ffwll.ch" <daniel@ffwll.ch>, "michel@daenzer.net"
 <michel@daenzer.net>
Subject: Re: [PATCH v7 09/11] drm: uevent for connector status change
Thread-Topic: [PATCH v7 09/11] drm: uevent for connector status change
Thread-Index: AQHVCvEN5jc1dpU7oUmRMC7jlFLrlaZryKyAgAGRmYCAAEPRgIABbDEAgAUcVoCAAPb6gIAAECMAgBSPSoCAAFjEgIAAAwEA
Date: Mon, 3 Jun 2019 15:19:13 +0000
Message-ID: <6782500f2aa3a2b1fbf2dde6a6c31d1bba8b575c.camel@intel.com>
References: <CAKMK7uGMJMZiOP4rhhiu=Obu6sO0oav5se-vy8bNLu8dfoZmvA@mail.gmail.com>
 <20190515103731.16855195@eldfell.localdomain>
 <20190515082449.GA17751@phenom.ffwll.local>
 <20190516112211.1cd5a8c6@eldfell.localdomain>
 <20190516122455.GA3851@phenom.ffwll.local>
 <20190517130824.17372663@eldfell.localdomain>
 <20190520161107.GA21222@phenom.ffwll.local>
 <20190521095505.7ef1cbdf@eldfell.localdomain>
 <CAKMK7uGoVhAOkZN7G1fuzdUjihjxqRhVuVvE3K5HFZwGjyC6Hg@mail.gmail.com>
 <9953e1fa-dafa-21c1-9604-50ed1e9fecaf@daenzer.net>
 <20190603150834.GL21222@phenom.ffwll.local>
In-Reply-To: <20190603150834.GL21222@phenom.ffwll.local>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.237.72.181]
Content-ID: <E56B04E6B9E9E044A90DA35339C69BC3@intel.com>
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
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, "Mun,
 Gwan-gyeong" <gwan-gyeong.mun@intel.com>,
 "paul.kocialkowski@bootlin.com" <paul.kocialkowski@bootlin.com>,
 "maxime.ripard@bootlin.com" <maxime.ripard@bootlin.com>,
 "thomas.petazzoni@bootlin.com" <thomas.petazzoni@bootlin.com>, "Vetter,
 Daniel" <daniel.vetter@intel.com>, "sean@poorly.run" <sean@poorly.run>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gTW9uLCAyMDE5LTA2LTAzIGF0IDE3OjA4ICswMjAwLCBEYW5pZWwgVmV0dGVyIHdyb3RlOg0K
PiBPbiBNb24sIEp1biAwMywgMjAxOSBhdCAxMTo1MDo1M0FNICswMjAwLCBNaWNoZWwgRMOkbnpl
ciB3cm90ZToNCj4gPiBPbiAyMDE5LTA1LTIxIDk6NTIgYS5tLiwgRGFuaWVsIFZldHRlciB3cm90
ZToNCj4gPiA+IE9uIFR1ZSwgTWF5IDIxLCAyMDE5IGF0IDg6NTUgQU0gUGVra2EgUGFhbGFuZW4g
PHBwYWFsYW5lbkBnbWFpbC5jb20+IHdyb3RlOg0KPiA+ID4gPiBPbiBNb24sIDIwIE1heSAyMDE5
IDE4OjExOjA3ICswMjAwDQo+ID4gPiA+IERhbmllbCBWZXR0ZXIgPGRhbmllbEBmZndsbC5jaD4g
d3JvdGU6DQo+ID4gPiA+IA0KPiA+ID4gPiA+IFRoZXJlJ3MgYWxzbyBhIGZhaXJseSBlYXN5IGZp
eCBmb3IgdGhhdCAtbW9kZXNldHRpbmcgaXNzdWU6IFdlIGRvbid0DQo+ID4gPiA+ID4gZXhwb3Nl
IGF0b21pYyBpZiB0aGUgY29tcG9zaXRvciBoYXMgYSBwcm9jZXNzIG5hbWUgb2YgIlhzZXJ2ZXIi
LiBCcnV0YWwsDQo+ID4gPiA+ID4gYnV0IGdldHMgdGhlIGpvYiBkb25lLiBPbmNlIFggaXMgZml4
ZWQsIHdlIGNhbiBnaXZlIGEgbmV3ICJJJ20gbm90IHRvdGFsbHkNCj4gPiA+ID4gPiBicm9rZW4g
YW55bW9yZSIgaW50ZXJmYWNlIHRvIGdldCBiYWNrIGF0IGF0b21pYy4NCj4gPiA+ID4gDQo+ID4g
PiA+IFlvdSBtZWFuICJYb3JnIi4gT3IgbWF5YmUgIlgiLiBPciBtYXliZSB0aGUgc2V0dWlkIGhl
bHBlcj8gV2FpdCwgZG8geW91DQo+ID4gPiA+IGNoZWNrIGFnYWluc3QgdGhlIHByb2Nlc3MgaXNz
dWluZyBpb2N0bCBieSBpb2N0bCwgb3IgdGhlIHByb2Nlc3MgdGhhdA0KPiA+ID4gPiBvcGVuZWQg
dGhlIGRldmljZT8gV2hpY2ggd291bGQgYmUgbG9naW5kPyBXaGF0IGFib3V0IERSTSBsZWFzaW5n
PyAuLi4NCj4gPiA+IA0KPiA+ID4gSW4gdGhlIEdldC9TZXRDYXBzIGlvY3RsIHdlIGNhbiBkbyB0
aGUgY2hlY2ssIHdoaWNoIGlzIGNhbGxlZCBmcm9tIFgsDQo+ID4gPiBub3QgbG9naW5kLiBXZSBq
dXN0IG5lZWQgc29tZSB3YXkgdG8gdGVsbCAtbW9kZXNldHRpbmcgYXBhcnQgZnJvbQ0KPiA+ID4g
ZXZlcnl0aGluZyBlbHNlLCBhbmQgbHVja2lseSB0aGVyZSdzIG5vdCBhbnkgb3RoZXIgYXRvbWlj
IFggZHJpdmVycy4NCj4gPiANCj4gPiBOb3QgeWV0Li4uDQo+ID4gDQo+ID4gQXMgZm9yIGEgIkkn
bSBub3QgdG90YWxseSBicm9rZW4gYW55bW9yZSIgaW50ZXJmYWNlLCB3ZSBkaWQgc29tZXRoaW5n
DQo+ID4gbGlrZSB0aGF0ICh0aG91Z2gga2luZCBvZiBpbiB0aGUgb3RoZXIgZGlyZWN0aW9uKSB3
aXRoDQo+ID4gUkFERU9OX0lORk9fQUNDRUxfV09SS0lORywgYnV0IGxhdGVyIFJBREVPTl9JTkZP
X0FDQ0VMX1dPUktJTkcyIGhhZCB0bw0KPiA+IGJlIGFkZGVkLCBiZWNhdXNlIHRoZSBmb3JtZXIg
Y2xhaW1lZCBhY2NlbGVyYXRpb24gd2FzICJ3b3JraW5nIiBpbiBjYXNlcw0KPiA+IHdoZXJlIGl0
IHJlYWxseSB3YXNuJ3QuLi4gVGhhdCBraW5kIG9mIHRoaW5nIGNvdWxkIGJlY29tZSB1Z2x5IGlu
IHRoZQ0KPiA+IGxvbmcgcnVuIGlmIG90aGVyIFhvcmcgZHJpdmVyIHN0YXJ0IHVzaW5nIGF0b21p
YywgYW5kIHRoZXknbGwgaW5ldml0YWJseQ0KPiA+IGJlIGJyb2tlbiBpbiBkaWZmZXJlbnQgd2F5
cy4NCj4gDQo+IEl0J3MgZGVmaW5pdGVseSBhIHZlcnkgc3Vib3B0aW1hbCBzaXR1YXRpb24uIE5v
dCBzdXJlIHRoZXJlJ3MgYSBnb29kIHdheQ0KPiBvdXQuIFRoZSB0cm91YmxlIGhlcmUgaXMgdGhh
dCBpOTE1IGVuZGVkIHVwIGNvbmZpZ3VyaW5nIGNydGMvY29ubmVjdG9ycw0KPiBkaWZmZXJlbnRs
eSB0aGFuIC1tb2Rlc2V0dGluZyAodG8gYWxsb3cgZmFzdGJvb3QsIHdoaWNoIEkgdGhpbmsgaXMg
c3RpbGwNCj4gaTkxNSBleGNsdXNpdmUpLiBUaGlzIHRoZW4gaGlnaGxpZ2h0ZWQgdGhhdCBtb2Rl
c2V0dGluZyBjYW4ndCBkbyBhdG9taWMNCj4gbW9kZXNldHMgaWYgeW91IHRyeSB0byByZWFzc2ln
biBjb25uZWN0b3JzLg0KPiANCj4gT25lIGlkZWEgSSBoYXZlIGlzIHRoYXQgdmdtcyB3b3VsZCBo
ZWxwIGNvbXBvc2l0b3JzIHRvIHBsYXkgb3V0IGEgYnVuY2ggb2YNCg0KSnVzdCBzbyBwZW9wbGUg
YXJlbid0IGNvbmZ1c2VkOiBJIHRoaW5rIERhbmllbCBtZWFudCAidmttcyIgaGVyZSA6UA0KDQo+
IHN0YW5kYXJkIHNjZW5hcmlvcywgZXZlbiBhdXRvbWF0ZWQuIEJ1dCB0aGF0J3Mgbm90IHRoZXJl
IHlldCwgYW5kIGV2ZXJ5DQo+IGNvbXBvc2l0b3IgcHJvamVjdCBuZWVkcyB0byBjYXJlIGJleW9u
ZCAiYm9vdHMgb24gbXkgbGFwdG9wLCBzaGlwIGl0Ii4gTm8NCj4gaWRlYSB0aGF0J3MgZXZlbiBw
b3NzaWJsZS4NCg0KSGF2aW5nIGRvY3VtZW50YXRpb24gZm9yIHVzZXJzcGFjZSBpcyBhbHNvIGlt
cG9ydGFudCBJTUhPLg0KDQpSZWdhcmRpbmcgYXV0b21hdGVkIGNvbXBvc2l0b3IgdGVzdGluZywg
aXQncyBwcm9iYWJseSBub3QgcG9zc2libGUgdG8NCmhhdmUgYSBzaW5nbGUgcGxhY2Ugd2hlcmUg
YWxsIGNvbXBvc2l0b3JzIGFyZSB0ZXN0ZWQ6IHZrbXMgc2hvdWxkDQpwcm9iYWJseSBiZSBpbmNs
dWRlZCBhcyBwYXJ0IG9mIHRoZWlyIENJLiBUaG91Z2h0cz8NCg0KQW55d2F5LCB3ZSBjb3VsZCBz
dGFydCBhIGRpc2N1c3Npb24gdG8gc2VlIGlmIGNvbXBvc2l0b3IgcGVvcGxlIGFyZQ0KaW50ZXJl
c3RlZC4gT3IgaGF2ZSB5b3UgYWxyZWFkeSB0YWxrZWQgdG8gc29tZSBjb21wb3NpdG9yIG1haW50
YWluZXJzPw0KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
ZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0
dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
