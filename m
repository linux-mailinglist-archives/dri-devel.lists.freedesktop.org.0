Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 94A813DFC10
	for <lists+dri-devel@lfdr.de>; Wed,  4 Aug 2021 09:25:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0B9186E9ED;
	Wed,  4 Aug 2021 07:25:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C88816E9ED
 for <dri-devel@lists.freedesktop.org>; Wed,  4 Aug 2021 07:25:40 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10065"; a="194149011"
X-IronPort-AV: E=Sophos;i="5.84,293,1620716400"; d="scan'208";a="194149011"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Aug 2021 00:25:40 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.84,293,1620716400"; d="scan'208";a="437329247"
Received: from orsmsx604.amr.corp.intel.com ([10.22.229.17])
 by orsmga002.jf.intel.com with ESMTP; 04 Aug 2021 00:25:39 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX604.amr.corp.intel.com (10.22.229.17) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.10; Wed, 4 Aug 2021 00:25:38 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.10; Wed, 4 Aug 2021 00:25:37 -0700
Received: from orsmsx611.amr.corp.intel.com ([10.22.229.24]) by
 ORSMSX611.amr.corp.intel.com ([10.22.229.24]) with mapi id 15.01.2242.010;
 Wed, 4 Aug 2021 00:25:37 -0700
From: "Kasireddy, Vivek" <vivek.kasireddy@intel.com>
To: =?utf-8?B?TWljaGVsIETDpG56ZXI=?= <michel@daenzer.net>, Daniel Vetter
 <daniel@ffwll.ch>
CC: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, "Gerd
 Hoffmann" <kraxel@redhat.com>, Pekka Paalanen <ppaalanen@gmail.com>, "Simon
 Ser" <contact@emersion.fr>, "Zhang, Tina" <tina.zhang@intel.com>, "Kim,
 Dongwon" <dongwon.kim@intel.com>, "Singh, Satyeshwar"
 <satyeshwar.singh@intel.com>
Subject: RE: [RFC v1 0/4] drm: Add support for DRM_CAP_DEFERRED_OUT_FENCE
 capability
Thread-Topic: [RFC v1 0/4] drm: Add support for DRM_CAP_DEFERRED_OUT_FENCE
 capability
Thread-Index: AQHXhFPnN1B4zkQxMkK/V9zRY5/TqKtbxyyAgABF0uCABEyGAIAAS7kwgAE7RYCAAJNQcA==
Date: Wed, 4 Aug 2021 07:25:37 +0000
Message-ID: <aae401e013c44c20aff3d1a214ee5dce@intel.com>
References: <20210729081659.2255499-1-vivek.kasireddy@intel.com>
 <YQPTo0D5SZfX44dn@phenom.ffwll.local>
 <612fd31a51384cb28ac6da9db3e840ca@intel.com>
 <YQepZMFaCNLBNGx9@phenom.ffwll.local>
 <fa53f9db229e481784bfe3a61a195fd3@intel.com>
 <1b96e91f-d65c-a155-8c8c-8a4326733c4e@daenzer.net>
In-Reply-To: <1b96e91f-d65c-a155-8c8c-8a4326733c4e@daenzer.net>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
dlp-product: dlpe-windows
dlp-version: 11.5.1.3
dlp-reaction: no-action
x-originating-ip: [10.1.200.100]
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgTWljaGVsLA0KDQo+ID4NCj4gPj4+IFRoZSBnb2FsOg0KPiA+Pj4gLSBNYWludGFpbiBmdWxs
IGZyYW1lcmF0ZSBldmVuIHdoZW4gdGhlIEd1ZXN0IHNjYW5vdXQgRkIgaXMgZmxpcHBlZCBvbnRv
IGEgaGFyZHdhcmUNCj4gPj4gcGxhbmUNCj4gPj4+IG9uIHRoZSBIb3N0IC0tIHJlZ2FyZGxlc3Mg
b2YgZWl0aGVyIGNvbXBvc2l0b3IncyBzY2hlZHVsaW5nIHBvbGljeSAtLSB3aXRob3V0IG1ha2lu
Zw0KPiBhbnkNCj4gPj4+IGNvcGllcyBhbmQgZW5zdXJpbmcgdGhhdCBib3RoIEhvc3QgYW5kIEd1
ZXN0IGFyZSBub3QgYWNjZXNzaW5nIHRoZSBidWZmZXIgYXQgdGhlIHNhbWUNCj4gPj4gdGltZS4N
Cj4gPj4+DQo+ID4+PiBUaGUgcHJvYmxlbToNCj4gPj4+IC0gSWYgdGhlIEhvc3QgY29tcG9zaXRv
ciBmbGlwcyB0aGUgY2xpZW50J3MgYnVmZmVyIChpbiB0aGlzIGNhc2UgR3Vlc3QgY29tcG9zaXRv
cidzDQo+IGJ1ZmZlcikNCj4gPj4+IG9udG8gYSBoYXJkd2FyZSBwbGFuZSwgdGhlbiBpdCBjYW4g
c2VuZCBhIHdsX2J1ZmZlci5yZWxlYXNlIGV2ZW50IGZvciB0aGUgcHJldmlvdXMNCj4gYnVmZmVy
DQo+ID4+PiBvbmx5IGFmdGVyIGl0IGdldHMgYSBwYWdlZmxpcCBjb21wbGV0aW9uLiBBbmQsIGlm
IHRoZSBHdWVzdCBjb21wb3NpdG9yIHRha2VzIDEwLTEyIG1zDQo+IHRvDQo+ID4+PiBzdWJtaXQg
YSBuZXcgYnVmZmVyIGFuZCBnaXZlbiB0aGUgZmFjdCB0aGF0IHRoZSBIb3N0IGNvbXBvc2l0b3Ig
d2FpdHMgb25seSBmb3IgOSBtcywNCj4gdGhlDQo+ID4+PiBHdWVzdCBjb21wb3NpdG9yIHdpbGwg
bWlzcyB0aGUgSG9zdCdzIHJlcGFpbnQgY3ljbGUgcmVzdWx0aW5nIGluIGhhbHZlZCBmcmFtZS1y
YXRlLg0KPiA+Pj4NCj4gPj4+IFRoZSBzb2x1dGlvbjoNCj4gPj4+IC0gVG8gZW5zdXJlIGZ1bGwg
ZnJhbWVyYXRlLCB0aGUgR3Vlc3QgY29tcG9zaXRvciBoYXMgdG8gc3RhcnQgaXQncyByZXBhaW50
IGN5Y2xlDQo+IChpbmNsdWRpbmcNCj4gPj4+IHRoZSA5IG1zIHdhaXQpIHdoZW4gdGhlIEhvc3Qg
Y29tcG9zaXRvciBzZW5kcyB0aGUgZnJhbWUgY2FsbGJhY2sgZXZlbnQgdG8gaXRzIGNsaWVudHMu
DQo+ID4+PiBJbiBvcmRlciBmb3IgdGhpcyB0byBoYXBwZW4sIHRoZSBkbWEtZmVuY2UgdGhhdCB0
aGUgR3Vlc3QgS01TIHdhaXRzIG9uIC0tIGJlZm9yZQ0KPiBzZW5kaW5nDQo+ID4+PiBwYWdlZmxp
cCBjb21wbGV0aW9uIC0tIGNhbm5vdCBiZSB0aWVkIHRvIGEgd2xfYnVmZmVyLnJlbGVhc2UgZXZl
bnQuIFRoaXMgbWVhbnMgdGhhdCwNCj4gdGhlDQo+ID4+PiBHdWVzdCBjb21wb3NpdG9yIGhhcyB0
byBiZSBmb3JjZWQgdG8gdXNlIGEgbmV3IGJ1ZmZlciBmb3IgaXRzIG5leHQgcmVwYWludCBjeWNs
ZSB3aGVuDQo+IGl0DQo+ID4+PiBnZXRzIGEgcGFnZWZsaXAgY29tcGxldGlvbi4NCj4gPj4NCj4g
Pj4gSXMgdGhhdCByZWFsbHkgdGhlIG9ubHkgc29sdXRpb24/DQo+ID4gW0thc2lyZWRkeSwgVml2
ZWtdIFRoZXJlIGFyZSBhIGZldyBvdGhlcnMgSSBtZW50aW9uZWQgaGVyZToNCj4gPiBodHRwczov
L2dpdGxhYi5mcmVlZGVza3RvcC5vcmcvd2F5bGFuZC93ZXN0b24vLS9pc3N1ZXMvNTE0I25vdGVf
OTg2NTcyDQo+ID4gQnV0IEkgdGhpbmsgbm9uZSBvZiB0aGVtIGFyZSBhcyBjb21wZWxsaW5nIGFz
IHRoaXMgb25lLg0KPiA+DQo+ID4+DQo+ID4+IElmIHdlIGZpeCB0aGUgZXZlbnQgdGltZXN0YW1w
cyBzbyB0aGF0IGJvdGggZ3Vlc3QgYW5kIGhvc3QgdXNlIHRoZSBzYW1lDQo+ID4+IHRpbWVzdGFt
cCwgYnV0IHRoZW4gdGhlIGd1ZXN0IHN0YXJ0cyA1bXMgKG9yIHNvbWV0aGluZyBsaWtlIHRoYXQp
IGVhcmxpZXIsDQo+ID4+IHRoZW4gdGhpbmdzIHNob3VsZCB3b3JrIHRvbz8gSS5lLg0KPiA+PiAt
IGhvc3QgY29tcG9zaXRvciBzdGFydHMgYXQgKHByZXZpb3VzX2ZyYW1ldGltZSArIDltcykNCj4g
Pj4gLSBndWVzdCBjb21wb3NpdG9yIHN0YXJ0cyBhdCAocHJldmlvdXNfZnJhbWV0aW1lICsgNG1z
KQ0KPiA+Pg0KPiA+PiBPZmMgdGhpcyBvbmx5IHdvcmtzIGlmIHRoZSBmcmFtZXRpbWVzIHdlIGhh
bmQgb3V0IHRvIGJvdGggbWF0Y2ggX2V4YWN0bHlfDQo+ID4+IGFuZCBhcmUgYXMgaGlnaC1wcmVj
aXNpb24gYXMgdGhlIG9uZXMgb24gdGhlIGhvc3Qgc2lkZS4gV2hpY2ggZm9yIG1hbnkgZ3B1DQo+
ID4+IGRyaXZlcnMgYXQgbGVhc3QgaXMgdGhlIGNhc2UsIGFuZCBhbGwgdGhlIG9uZXMgeW91IGNh
cmUgYWJvdXQgZm9yIHN1cmUgOi0pDQo+ID4+DQo+ID4+IEJ1dCBpZiB0aGUgZnJhbWV0aW1lcyB0
aGUgZ3Vlc3QgcmVjZWl2ZXMgYXJlIHRoZSBub192YmxhbmsgZmFrZSBvbmVzLCB0aGVuDQo+ID4+
IHRoZXknbGwgYmUgYWxsIG92ZXIgdGhlIHBsYWNlIGFuZCB0aGlzIGNhcmVmdWxseSB0dW5lZCBs
b3ctbGF0ZW5jeSByZWRyYXcNCj4gPj4gbG9vcCBmYWxscyBhcGFydC4gQXNpZGUgZnJvbW0gdGhl
IGZhY3QgdGhhdCB3aXRob3V0IHR1bmluZyB0aGUgZ3Vlc3RzIHRvDQo+ID4+IGJlIGVhcmxpZXIg
dGhhbiB0aGUgaG9zdHMsIHlvdSdyZSBndWFyYW50ZWVkIHRvIG1pc3MgZXZlcnkgZnJhbWUgKGV4
Y2VwdA0KPiA+PiB3aGVuIHRoZSB0aW1pbmcgd29iYmxpbmVzcyBpbiB0aGUgZ3Vlc3QgaXMgYmln
IGVub3VnaCBieSBjaGFuY2UgdG8gbWFrZQ0KPiA+PiB0aGUgZGVhZGxpbmUgb24gdGhlIG9kZGJh
bGwgZnJhbWUpLg0KPiA+IFtLYXNpcmVkZHksIFZpdmVrXSBUaGUgR3Vlc3QgYW5kIEhvc3QgdXNl
IGRpZmZlcmVudCBldmVudCB0aW1lc3RhbXBzIGFzIHdlIGRvbid0DQo+ID4gc2hhcmUgdGhlc2Ug
YmV0d2VlbiB0aGUgR3Vlc3QgYW5kIHRoZSBIb3N0LiBJdCBkb2VzIG5vdCBzZWVtIHRvIGJlIGNh
dXNpbmcgYW55IG90aGVyDQo+ID4gcHJvYmxlbXMgc28gZmFyIGJ1dCB3ZSBkaWQgdHJ5IHRoZSBl
eHBlcmltZW50IHlvdSBtZW50aW9uZWQgKGkuZS4sIGFkanVzdGluZyB0aGUgZGVsYXlzKQ0KPiA+
IGFuZCBpdCB3b3Jrcy4gSG93ZXZlciwgdGhpcyBwYXRjaCBzZXJpZXMgaXMgbWVhbnQgdG8gZml4
IHRoZSBpc3N1ZSB3aXRob3V0IGhhdmluZyB0byB0d2Vhaw0KPiA+IGFueXRoaW5nIChkZWxheXMp
IGJlY2F1c2Ugd2UgY2FuJ3QgZG8gdGhpcyBmb3IgZXZlcnkgY29tcG9zaXRvciBvdXQgdGhlcmUu
DQo+IA0KPiBNYXliZSB0aGVyZSBjb3VsZCBiZSBhIG1lY2hhbmlzbSB3aGljaCBhbGxvd3MgdGhl
IGNvbXBvc2l0b3IgaW4gdGhlIGd1ZXN0IHRvDQo+IGF1dG9tYXRpY2FsbHkgYWRqdXN0IGl0cyBy
ZXBhaW50IGN5Y2xlIGFzIG5lZWRlZC4NCj4gDQo+IFRoaXMgbWlnaHQgZXZlbiBiZSBwb3NzaWJs
ZSB3aXRob3V0IHJlcXVpcmluZyBjaGFuZ2VzIGluIGVhY2ggY29tcG9zaXRvciwgYnkgYWRqdXN0
aW5nDQo+IHRoZSB2ZXJ0aWNhbCBibGFuayBwZXJpb2RzIGluIHRoZSBndWVzdCB0byBiZSBhbGln
bmVkIHdpdGggdGhlIGhvc3QgY29tcG9zaXRvciByZXBhaW50DQo+IGN5Y2xlcy4gTm90IHN1cmUg
YWJvdXQgdGhhdCB0aG91Z2guDQpbS2FzaXJlZGR5LCBWaXZla10gVGhlIHByb2JsZW0gcmVhbGx5
IGlzIHRoYXQgdGhlIEd1ZXN0IGNvbXBvc2l0b3IgLS0gb3IgYW55IG90aGVyIGNvbXBvc2l0b3IN
CmZvciB0aGF0IG1hdHRlciAtLSBhc3N1bWVzIHRoYXQgYWZ0ZXIgYSBwYWdlZmxpcCBjb21wbGV0
aW9uLCB0aGUgb2xkIGJ1ZmZlciBzdWJtaXR0ZWQgaW4gdGhlDQpwcmV2aW91cyBmbGlwIGlzIGZy
ZWUgYW5kIGNhbiBiZSByZXVzZWQgYWdhaW4uIEkgdGhpbmsgdGhpcyBpcyBhIGd1YXJhbnRlZSBn
aXZlbiBieSBLTVMuIElmIHdlIGhhdmUNCnRvIGVuZm9yY2UgdGhpcywgd2UgKEd1ZXN0IEtNUykg
aGF2ZSB0byB3YWl0IHVudGlsIHRoZSBIb3N0IGNvbXBvc2l0b3Igc2VuZHMgYSB3bF9idWZmZXIu
cmVsZWFzZSAtLQ0Kd2hpY2ggY2FuIG9ubHkgaGFwcGVuIGFmdGVyIEhvc3QgZ2V0cyBhIHBhZ2Vm
bGlwIGNvbXBsZXRpb24gYXNzdW1pbmcgaXQgdXNlcyBoYXJkd2FyZSBwbGFuZXMgLg0KRnJvbSB0
aGlzIHBvaW50IG9ud2FyZHMsIHRoZSBHdWVzdCBjb21wb3NpdG9yIG9ubHkgaGFzIDkgbXMgKGlu
IHRoZSBjYXNlIG9mIFdlc3RvbikgLS0gb3IgbGVzcw0KYmFzZWQgb24gdGhlIEhvc3QgY29tcG9z
aXRvcidzIHNjaGVkdWxpbmcgcG9saWN5IC0tIHRvIHN1Ym1pdCBhIG5ldyBmcmFtZS4NCg0KQWx0
aG91Z2gsIHdlIGNhbiBhZGp1c3QgdGhlIHJlcGFpbnQtd2luZG93IG9mIHRoZSBHdWVzdCBjb21w
b3NpdG9yIHRvIGVuc3VyZSBhIHN1Ym1pc3Npb24gDQp3aXRoaW4gOSBtcyBvciBpbmNyZWFzZSB0
aGUgZGVsYXkgb24gdGhlIEhvc3QsIHRoZXNlIHR3ZWFrcyBhcmUganVzdCBoZXVyaXN0aWNzLiBJ
IHRoaW5rIGluIG9yZGVyDQp0byBoYXZlIGEgZ2VuZXJpYyBzb2x1dGlvbiB0aGF0J2xsIHdvcmsg
aW4gYWxsIGNhc2VzIG1lYW5zIHRoYXQgdGhlIEd1ZXN0IGNvbXBvc2l0b3IgaGFzIHRvIHN0YXJ0
DQppdHMgcmVwYWludCBjeWNsZSB3aXRoIGEgbmV3IGJ1ZmZlciB3aGVuIHRoZSBIb3N0IHNlbmRz
IG91dCB0aGUgZnJhbWUgY2FsbGJhY2sgZXZlbnQuDQoNCj4gDQo+IEV2ZW4gaWYgbm90LCBib3Ro
IHRoaXMgc2VyaWVzIG9yIG1ha2luZyBpdCBwb3NzaWJsZSB0byBxdWV1ZSBtdWx0aXBsZSBmbGlw
cyByZXF1aXJlDQo+IGNvcnJlc3BvbmRpbmcgY2hhbmdlcyBpbiBlYWNoIGNvbXBvc2l0b3IgYXMg
d2VsbCB0byBoYXZlIGFueSBlZmZlY3QuDQpbS2FzaXJlZGR5LCBWaXZla10gWWVzLCB1bmZvcnR1
bmF0ZWx5OyBidXQgdGhlIGhvcGUgaXMgdGhhdCB0aGUgR3Vlc3QgS01TIGNhbiBkbyBtb3N0IG9m
DQp0aGUgaGVhdnkgbGlmdGluZyBhbmQga2VlcCB0aGUgY2hhbmdlcyBmb3IgdGhlIGNvbXBvc2l0
b3JzIGdlbmVyaWMgZW5vdWdoIGFuZCBtaW5pbWFsLg0KDQpUaGFua3MsDQpWaXZlaw0KPiANCj4g
DQo+IC0tDQo+IEVhcnRobGluZyBNaWNoZWwgRMOkbnplciAgICAgICAgICAgICAgIHwgICAgICAg
ICAgICAgICBodHRwczovL3JlZGhhdC5jb20NCj4gTGlicmUgc29mdHdhcmUgZW50aHVzaWFzdCAg
ICAgICAgICAgICB8ICAgICAgICAgICAgIE1lc2EgYW5kIFggZGV2ZWxvcGVyDQo=
