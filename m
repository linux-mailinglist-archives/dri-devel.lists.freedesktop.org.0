Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 523B21C485
	for <lists+dri-devel@lfdr.de>; Tue, 14 May 2019 10:18:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 38C018930E;
	Tue, 14 May 2019 08:18:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4FBAD8930E;
 Tue, 14 May 2019 08:18:37 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by orsmga104.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 14 May 2019 01:18:36 -0700
X-ExtLoop1: 1
Received: from irsmsx106.ger.corp.intel.com ([163.33.3.31])
 by orsmga003.jf.intel.com with ESMTP; 14 May 2019 01:18:33 -0700
Received: from irsmsx104.ger.corp.intel.com ([169.254.5.93]) by
 IRSMSX106.ger.corp.intel.com ([169.254.8.166]) with mapi id 14.03.0415.000;
 Tue, 14 May 2019 09:18:32 +0100
From: "Ser, Simon" <simon.ser@intel.com>
To: "daniel.vetter@ffwll.ch" <daniel.vetter@ffwll.ch>, "ppaalanen@gmail.com"
 <ppaalanen@gmail.com>
Subject: Re: [PATCH v7 09/11] drm: uevent for connector status change
Thread-Topic: [PATCH v7 09/11] drm: uevent for connector status change
Thread-Index: AQHVCWqJ5jc1dpU7oUmRMC7jlFLrlaZouqkAgAF4jgCAAARjAA==
Date: Tue, 14 May 2019 08:18:31 +0000
Message-ID: <9b6386239ecae396fc4f5cc4467f8e76721f2c83.camel@intel.com>
References: <20190507162745.25600-1-ramalingam.c@intel.com>
 <20190507162745.25600-10-ramalingam.c@intel.com>
 <31dad9a323382628911c5301a6eec179855aa815.camel@bootlin.com>
 <CAKMK7uEwHZ=As3B4z+WZ1fyd2yP5Krg3hVzfCcCAtv3jOxmTrA@mail.gmail.com>
 <8aa3980a6948b9b2b989c237f8453ca54e72ad95.camel@bootlin.com>
 <CAKMK7uFaEPm+kqYdc=vkb_iRRXDf=P6D98VTMMKtCMQHCixhLg@mail.gmail.com>
 <20190514110242.6f6ba4b0@eldfell.localdomain>
In-Reply-To: <20190514110242.6f6ba4b0@eldfell.localdomain>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.237.72.181]
Content-ID: <BDE44FE9BE68974E8C163C07F338C4EC@intel.com>
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
 "maxime.ripard@bootlin.com" <maxime.ripard@bootlin.com>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, "Mun, 
 Gwan-gyeong" <gwan-gyeong.mun@intel.com>,
 "paul.kocialkowski@bootlin.com" <paul.kocialkowski@bootlin.com>,
 "thomas.petazzoni@bootlin.com" <thomas.petazzoni@bootlin.com>, "Vetter,
 Daniel" <daniel.vetter@intel.com>, "sean@poorly.run" <sean@poorly.run>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVHVlLCAyMDE5LTA1LTE0IGF0IDExOjAyICswMzAwLCBQZWtrYSBQYWFsYW5lbiB3cm90ZToN
Cj4gT24gTW9uLCAxMyBNYXkgMjAxOSAxMTozNDo1OCArMDIwMA0KPiBEYW5pZWwgVmV0dGVyIDxk
YW5pZWwudmV0dGVyQGZmd2xsLmNoPiB3cm90ZToNCj4gDQo+ID4gT24gTW9uLCBNYXkgMTMsIDIw
MTkgYXQgMTE6MDIgQU0gUGF1bCBLb2NpYWxrb3dza2kNCj4gPiA8cGF1bC5rb2NpYWxrb3dza2lA
Ym9vdGxpbi5jb20+IHdyb3RlOg0KPiA+ID4gSGksDQo+ID4gPiANCj4gPiA+IE9uIEZyaSwgMjAx
OS0wNS0xMCBhdCAxNjo1NCArMDIwMCwgRGFuaWVsIFZldHRlciB3cm90ZTogIA0KPiA+ID4gPiBP
biBGcmksIE1heSAxMCwgMjAxOSBhdCAyOjEyIFBNIFBhdWwgS29jaWFsa293c2tpDQo+ID4gPiA+
IDxwYXVsLmtvY2lhbGtvd3NraUBib290bGluLmNvbT4gd3JvdGU6ICANCj4gPiA+ID4gPiBIaSwN
Cj4gPiA+ID4gPiANCj4gPiA+ID4gPiBPbiBUdWUsIDIwMTktMDUtMDcgYXQgMjE6NTcgKzA1MzAs
IFJhbWFsaW5nYW0gQyB3cm90ZTogIA0KPiA+ID4gPiA+ID4gRFJNIEFQSSBmb3IgZ2VuZXJhdGlu
ZyB1ZXZlbnQgZm9yIGEgc3RhdHVzIGNoYW5nZXMgb2YgY29ubmVjdG9yJ3MNCj4gPiA+ID4gPiA+
IHByb3BlcnR5Lg0KPiA+ID4gPiA+ID4gDQo+ID4gPiA+ID4gPiBUaGlzIHVldmVudCB3aWxsIGhh
dmUgZm9sbG93aW5nIGRldGFpbHMgcmVsYXRlZCB0byB0aGUgc3RhdHVzIGNoYW5nZToNCj4gPiA+
ID4gPiA+IA0KPiA+ID4gPiA+ID4gICBIT1RQTFVHPTEsIENPTk5FQ1RPUj08Y29ubmVjdG9yX2lk
PiBhbmQgUFJPUEVSVFk9PHByb3BlcnR5X2lkPg0KPiA+ID4gPiA+ID4gDQo+ID4gPiA+ID4gPiBO
ZWVkIEFDSyBmcm9tIHRoaXMgdWV2ZW50IGZyb20gdXNlcnNwYWNlIGNvbnN1bWVyLiAgDQo+ID4g
PiA+ID4gDQo+ID4gPiA+ID4gU28gd2UganVzdCBoYWQgc29tZSBkaXNjdXNzaW9ucyBvdmVyIG9u
IElSQyBhbmQgYXQgYWJvdXQgdGhlIGhvdHBsdWcNCj4gPiA+ID4gPiBpc3N1ZSBhbmQgY2FtZSB1
cCB3aXRoIHNpbWlsYXIgaWRlYXM6DQo+ID4gPiA+ID4gaHR0cHM6Ly9saXN0cy5mcmVlZGVza3Rv
cC5vcmcvYXJjaGl2ZXMvZHJpLWRldmVsLzIwMTktTWF5LzIxNzQwOC5odG1sDQo+ID4gPiA+ID4g
DQo+ID4gPiA+ID4gVGhlIGNvbmNsdXNpb25zIG9mIHRoZXNlIGRpc2N1c3Npb25zIHNvIGZhciB3
b3VsZCBiZSB0byBoYXZlIGEgbW9yZSBvcg0KPiA+ID4gPiA+IGxlc3MgZmluZSBncmFpbiBvZiB1
ZXZlbnQgcmVwb3J0aW5nIGRlcGVuZGluZyBvbiB3aGF0IGhhcHBlbmVkLiBUaGUNCj4gPiA+ID4g
PiBwb2ludCBpcyB0aGF0IHdlIG5lZWQgdG8gY292ZXIgZGlmZmVyZW50IGNhc2VzOg0KPiA+ID4g
PiA+IC0gb25lIG9yIG1vcmUgcHJvcGVydGllcyBjaGFuZ2VkOw0KPiA+ID4gPiA+IC0gdGhlIGNv
bm5lY3RvciBzdGF0dXMgY2hhbmdlZDsNCj4gPiA+ID4gPiAtIHNvbWV0aGluZyBlbHNlIGFib3V0
IHRoZSBjb25uZWN0b3IgY2hhbmdlZCAoZS5nLiBFRElEL21vZGVzKQ0KPiA+ID4gPiA+IA0KPiA+
ID4gPiA+IEZvciB0aGUgZmlyc3QgY2FzZSwgd2UgY2FuIHNlbmQgb3V0Og0KPiA+ID4gPiA+IEhP
VFBMVUc9MQ0KPiA+ID4gPiA+IENPTk5FQ1RPUj08aWQ+DQo+ID4gPiA+ID4gUFJPUEVSVFk9PGlk
Pg0KPiA+ID4gPiA+IA0KPiA+ID4gPiA+IGFuZCBubyByZXByb2JlIGlzIHJlcXVpcmVkLg0KPiA+
ID4gPiA+IA0KPiA+ID4gPiA+IEZvciB0aGUgc2Vjb25kIG9uZSwgc29tZXRoaW5nIGxpa2U6DQo+
ID4gPiA+ID4gSE9UUExVRz0xDQo+ID4gPiA+ID4gQ09OTkVDVE9SPTxpZD4NCj4gPiA+ID4gPiBT
VEFUVVM9Q29ubmVjdGVkL0Rpc2Nvbm5lY3RlZA0KPiA+ID4gPiA+IA0KPiA+ID4gPiA+IGFuZCBh
IGNvbm5lY3RvciBwcm9iZSBpcyBuZWVkZWQgZm9yIGNvbm5lY3RlZCwgYnV0IG5vdCBmb3INCj4g
PiA+ID4gPiBkaXNjb25uZWN0ZWQ7DQo+ID4gPiA+ID4gDQo+ID4gPiA+ID4gRm9yIHRoZSB0aGly
ZCBvbmUsIHdlIGNhbiBvbmx5IGluZGljYXRlIHRoZSBjb25uZWN0b3I6DQo+ID4gPiA+ID4gSE9U
UExVRz0xDQo+ID4gPiA+ID4gQ09OTkVDVE9SPTxpZD4NCj4gPiA+ID4gPiANCj4gPiA+ID4gPiBh
bmQgYSByZXByb2JlIG9mIHRoZSBjb25uZWN0b3IgaXMgYWx3YXlzIG5lZWRlZCAgDQo+ID4gPiA+
IA0KPiA+ID4gPiBUaGVyZSdzIG5vIG1hdGVyaWFsIGRpZmZlcmVuY2UgYmV0d2VlbiB0aGlzIG9u
ZSBhbmQgdGhlIHByZXZpb3VzIG9uZS4NCj4gPiA+ID4gUGx1cyB0aGVyZSdzIG5vIGJlZW5maXQg
aW4gc3VwcGx5aW5nIHRoZSBhY3R1YWwgdmFsdWUgb2YgdGhlIHByb3BlcnR5LA0KPiA+ID4gPiBp
LmUuIHdlIGNhbiByZXVzZSB0aGUgc2FtZSBQUk9QRVJUWT08aWQtb2Ytc3RhdHVzLXByb3BlcnR5
PiB0cmljay4gIA0KPiA+ID4gDQo+ID4gPiBUaGF0J3MgdGhlIGlkZWEsIGJ1dCB3ZSBuZWVkIHRv
IGhhbmRsZSBzdGF0dXMgY2hhbmdlcyBkaWZmZXJlbnRseSB0aGFuDQo+ID4gPiBwcm9wZXJ0aWVz
LCBzaW5jZSBhcyBmYXIgYXMgSSBrbm93LCBjb25uZWN0ZWQvdW5jb25uZWN0ZWQgc3RhdHVzIGlz
IG5vdA0KPiA+ID4gZXhwb3NlZCBhcyBhIHByb3AgZm9yIHRoZSBjb25uZWN0b3IuICANCj4gPiAN
Cj4gPiBPb3BzLCB0b3RhbGx5IG1pc3NlZCB0aGF0LiAiRXZlcnl0aGluZyBpcyBhIHByb3BlcnR5
IiBpcyBraW5kYQ0KPiA+IG5ldy1pc2gsIGF0IGxlYXN0IGNvbXBhcmVkIHRvIGttcy4gS2luZGEg
dGVtcHRlZCB0byBqdXN0IG1ha2Ugc3RhdHVzDQo+ID4gaW50byBhIHByb3BlcnR5LiBPciBhbm90
aGVyIGV4Y3VzZSB3aHkgd2Ugc2hvdWxkIGV4cG9zZSB0aGUgZXBvY2gNCj4gPiBwcm9wZXJ0eSA6
LSkNCj4gDQo+IEhpIERhbmllbCwNCj4gDQo+IGp1c3QgdG8gY2xhcmlmeSB0aGUgZmlyc3QgY2Fz
ZSwgc3BlY2lmaWMgdG8gb25lIHZlcnkgcGFydGljdWxhcg0KPiBwcm9wZXJ0eToNCj4gDQo+IFdp
dGggSERDUCwgdGhlcmUgaXMgYSBwcm9wZXJ0eSB0aGF0IG1heSBjaGFuZ2UgZHluYW1pY2FsbHkg
YXQgcnVudGltZQ0KPiAodGhlIHVuZGVzaXJlZC9kZXNpcmVkL2VuYWJsZWQgdHJpc3RhdGUpLiBV
c2Vyc3BhY2UgbXVzdCBiZSBub3RpZmllZA0KPiB3aGVuIGl0IGNoYW5nZXMsIEkgZG8gbm90IHdh
bnQgdXNlcnNwYWNlIGhhdmUgdG8gcG9sbCB0aGF0IHByb3BlcnR5DQo+IHdpdGggYSB0aW1lci4N
Cj4gDQo+IFdoZW4gdGhhdCBwcm9wZXJ0eSBhbG9uZSBjaGFuZ2VzLCBhbmQgdXNlcnNwYWNlIGlz
IHByZXBhcmVkIHRvIGhhbmRsZQ0KPiB0aGF0IHByb3BlcnR5IGNoYW5naW5nIGFsb25lLCBpdCBt
dXN0IG5vdCB0cmlnZ2VyIGEgcmVwcm9iZSBvZiB0aGUNCj4gY29ubmVjdG9yLiBUaGVyZSBpcyBu
byByZWFzb24gdG8gcmVwcm9iZSBhdCB0aGF0IHBvaW50IEFGQUlVLg0KPiANCj4gSG93IGRvIHlv
dSBlbnN1cmUgdGhhdCB1c2Vyc3BhY2UgY2FuIGF2b2lkIHRyaWdnZXJpbmcgYSByZXByb2JlIHdp
dGggdGhlDQo+IGVwb2NoIGFwcHJvYWNoIG9yIHdpdGggYW55IGFsdGVybmF0ZSB1ZXZlbnQgZGVz
aWduPw0KPiANCj4gV2UgbmVlZCBhbiBldmVudCB0byB1c2Vyc3BhY2UgdGhhdCBpbmRpY2F0ZXMg
dGhhdCByZS1yZWFkaW5nIHRoZQ0KPiBwcm9wZXJ0aWVzIGlzIGVub3VnaCBhbmQgcmVwcm9iZSBv
ZiB0aGUgY29ubmVjdG9yIGlzIG5vdCBuZWNlc3NhcnkuDQo+IFRoaXMgaXMgY29tcGxlbWVudGFy
eSB0byBpbmRpY2F0aW5nIHRvIHVzZXJzcGFjZSB0aGF0IG9ubHkgc29tZQ0KPiBjb25uZWN0b3Jz
IG5lZWQgdG8gYmUgcmVwcm9iZWQgaW5zdGVhZCBvZiBldmVyeXRoaW5nLg0KDQpDYW4ndCB5b3Ug
dXNlIHRoZSBQUk9QRVJUWSBoaW50PyBJZiBQUk9QRVJUWSBpcyB0aGUgSERDUCBvbmUsIHNraXAg
dGhlDQpyZXByb2JpbmcuIFdvdWxkIHRoYXQgd29yaz8NCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVs
QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWls
bWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
