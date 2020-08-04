Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 455BC23B496
	for <lists+dri-devel@lfdr.de>; Tue,  4 Aug 2020 07:50:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E52366E3F5;
	Tue,  4 Aug 2020 05:49:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 40E3C6E3BC;
 Tue,  4 Aug 2020 05:49:55 +0000 (UTC)
IronPort-SDR: Lh66lTmEIoIt9sdswRBKJsqMJ6PbMHECfF/PlzojShYs6p511+rEsJREMiPiQAFXyVM93WXFwK
 xn3UnzGA33lg==
X-IronPort-AV: E=McAfee;i="6000,8403,9702"; a="132313645"
X-IronPort-AV: E=Sophos;i="5.75,433,1589266800"; d="scan'208";a="132313645"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Aug 2020 22:49:54 -0700
IronPort-SDR: gdrudahZ5Y1iH7hK+2y1WfGrBe2vnx1EdX4d8GKsx0Wa5yfuGdDxc8IL1G+hin6KULMNf4i0Pu
 MDfVAb3BlRuQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.75,433,1589266800"; d="scan'208";a="330491015"
Received: from fmsmsx604.amr.corp.intel.com ([10.18.126.84])
 by FMSMGA003.fm.intel.com with ESMTP; 03 Aug 2020 22:49:54 -0700
Received: from fmsmsx604.amr.corp.intel.com (10.18.126.84) by
 fmsmsx604.amr.corp.intel.com (10.18.126.84) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Mon, 3 Aug 2020 22:49:53 -0700
Received: from fmsmsx121.amr.corp.intel.com (10.18.125.36) by
 fmsmsx604.amr.corp.intel.com (10.18.126.84) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.1.1713.5
 via Frontend Transport; Mon, 3 Aug 2020 22:49:53 -0700
Received: from bgsmsx151.gar.corp.intel.com (10.224.48.42) by
 fmsmsx121.amr.corp.intel.com (10.18.125.36) with Microsoft SMTP Server (TLS)
 id 14.3.439.0; Mon, 3 Aug 2020 22:49:52 -0700
Received: from bgsmsx152.gar.corp.intel.com ([169.254.6.230]) by
 BGSMSX151.gar.corp.intel.com ([169.254.3.196]) with mapi id 14.03.0439.000;
 Tue, 4 Aug 2020 11:19:48 +0530
From: "Kulkarni, Vandita" <vandita.kulkarni@intel.com>
To: =?utf-8?B?TWljaGVsIETDpG56ZXI=?= <michel@daenzer.net>, "Zanoni, Paulo R"
 <paulo.r.zanoni@intel.com>, "Vetter, Daniel" <daniel.vetter@intel.com>, "B S, 
 Karthik" <karthik.b.s@intel.com>, "intel-gfx@lists.freedesktop.org"
 <intel-gfx@lists.freedesktop.org>
Subject: RE: [PATCH v5 0/5] Asynchronous flip implementation for i915
Thread-Topic: [PATCH v5 0/5] Asynchronous flip implementation for i915
Thread-Index: AQHWXoyF0I+Yv7gbOU2b76Vu8RIWKqkXCk8AgAcHqLD//8nwAIAJqTLw
Date: Tue, 4 Aug 2020 05:49:48 +0000
Message-ID: <57510F3E2013164E925CD03ED7512A3B916F1058@BGSMSX152.gar.corp.intel.com>
References: <20200720113117.16131-1-karthik.b.s@intel.com>
 <9e43a819525424c36438329222fa1a3946c57c89.camel@intel.com>
 <57510F3E2013164E925CD03ED7512A3B86351230@BGSMSX102.gar.corp.intel.com>
 <f439795a-6a95-2e96-b511-42b4f5725e04@daenzer.net>
In-Reply-To: <f439795a-6a95-2e96-b511-42b4f5725e04@daenzer.net>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
dlp-product: dlpe-windows
dlp-version: 11.5.1.3
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
Cc: "Shankar, Uma" <uma.shankar@intel.com>,
 "nicholas.kazlauskas@amd.com" <nicholas.kazlauskas@amd.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBNaWNoZWwgRMOkbnplciA8bWlj
aGVsQGRhZW56ZXIubmV0Pg0KPiBTZW50OiBXZWRuZXNkYXksIEp1bHkgMjksIDIwMjAgMTowNCBQ
TQ0KPiBUbzogS3Vsa2FybmksIFZhbmRpdGEgPHZhbmRpdGEua3Vsa2FybmlAaW50ZWwuY29tPjsg
WmFub25pLCBQYXVsbyBSDQo+IDxwYXVsby5yLnphbm9uaUBpbnRlbC5jb20+OyBWZXR0ZXIsIERh
bmllbCA8ZGFuaWVsLnZldHRlckBpbnRlbC5jb20+OyBCIFMsDQo+IEthcnRoaWsgPGthcnRoaWsu
Yi5zQGludGVsLmNvbT47IGludGVsLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcNCj4gQ2M6IGRy
aS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmc7IFNoYW5rYXIsIFVtYQ0KPiA8dW1hLnNoYW5r
YXJAaW50ZWwuY29tPjsgbmljaG9sYXMua2F6bGF1c2thc0BhbWQuY29tDQo+IFN1YmplY3Q6IFJl
OiBbUEFUQ0ggdjUgMC81XSBBc3luY2hyb25vdXMgZmxpcCBpbXBsZW1lbnRhdGlvbiBmb3IgaTkx
NQ0KPiANCj4gT24gMjAyMC0wNy0yOSA5OjIzIGEubS4sIEt1bGthcm5pLCBWYW5kaXRhIHdyb3Rl
Og0KPiA+DQo+ID4gT24gYXN5bmMgZmxpcHMsIHRoZXJlIG5lZWRzIHRvIGJlIHNvbWUgY2xhcml0
eS9ndWlkZWxpbmUgb24gdGhlDQo+ID4gYmVoYXZpb3VyIGFuZCBldmVudCBleHBlY3RhdGlvbiBm
cm9tIHRoZSBkcml2ZXIgYnkgdXNlciBzcGFjZS4NCj4gPiBIZXJlIGFyZSBmZXcgYXNzdW1wdGlv
bnMgdGhhdCB3ZSBoYXZlLCAxLiBPdXIgdW5kZXJzdGFuZGluZyBpcyB0aGF0DQo+ID4gdGhlIHVz
ZXIgc3BhY2UgZG9lc27igJl0IGV4cGVjdCB0aGUgdGltZXN0YW1wIGZvciBhc3luYyBmbGlwcyAo
YnV0IHN0aWxsDQo+ID4gZXhwZWN0cyB2YmxhbmsgdGltZXN0YW1wKSAsIG9yIGRvZXNu4oCZdCBk
byBhbnl0aGluZyB3aXRoIHRoYXQsIHNhbWUgaXMgdGhlDQo+IGFzc3VtcHRpb24gd3J0IHRoZSBm
bGlwIHNlcXVlbmNlLCBwbGVhc2UgY29ycmVjdCB1cyBpZiB3ZSBhcmUgd3JvbmcuDQo+ID4gMi4g
SW4gdGhlIHNlcXVlbmNlIHRoZSB1c2VyIHNwYWNlIHN0aWxsIGV4cGVjdHMgdGhlIGNvdW50ZXIg
dGhhdCBtYXJrcw0KPiB2YmxhbmtzLg0KPiA+IDMuIFRoZSB1c2VyIHNwYWNlIGNhbiB1c2UgZGlm
ZmVyZW50IGV2ZW50IHR5cGVzIGxpa2UgRFJNX0VWRU5UX1ZCTEFOSw0KPiA+IG9yIERSTV9FVkVO
VF9GTElQX0NPTVBMRVRFIGZvciBnZXR0aW5nIHRoZSBjb3JyZXNwb25kaW5nIGV2ZW50LiBBbmQN
Cj4gdGhlaXIgZGVzaWducyBhcmUgc3RpbGwgYWxpZ25lZCB0byB0aGlzIGV2ZW4gaW4gY2FzZSBv
ZiBhc3luYy4NCj4gPg0KPiA+IElmIHRoZXJlIGFyZSBhbnkgbW9yZSBleHBlY3RhdGlvbnMgZnJv
bSB0aGUgdXNlciBzcGFjZSB3cnQgdG8gdGhlDQo+ID4gZXZlbnQgdGhhdCBpcyBiZWluZyBzZW50
IGZyb20gdGhlIGRyaXZlciBpbiBjYXNlIG9mIGFzeW5jIGZsaXAsIHBsZWFzZSBsZXQgdXMNCj4g
a25vdy4NCj4gPg0KPiA+IElmIHRoZSB1c2VyIHNwYWNlIGRvZXNu4oCZdCBjYXJlIG11Y2ggYWJv
dXQgdGhlIGZsaXAgc2VxdWVuY2UgdGhlbiwgd2UNCj4gPiBjYW4ganVzdCBub3QgZG8gYW55dGhp
bmcgbGlrZSByZXR1cm5pbmcgdGhlIGZsaXAgY291bnRlciBsaWtlIHRoaXMgdmVyc2lvbiBpcw0K
PiBkb2luZyBhbmQganVzdCBzdGljayB0byByZXR1cm5pbmcgb2YgdGhlIGZyYW1lIGNvdW50ZXIg
dmFsdWUod2hpY2ggbWFya3MNCj4gdmJsYW5rcykuDQo+IA0KPiBUaGVyZSdzIG5vIHN1Y2ggdGhp
bmcgYXMgYSAiZmxpcCBzZXF1ZW5jZSIgaW4gdGhlIEtNUyBBUEkuIFRoZXJlJ3Mgb25seSB0aGUN
Cj4gcGVyLUNSVEMgdmJsYW5rIGNvdW50ZXIuIEVhY2ggZmxpcCBjb21wbGV0aW9uIGV2ZW50IG5l
ZWRzIHRvIGNvbnRhaW4gdGhlDQo+IHZhbHVlIG9mIHRoYXQgY291bnRlciB3aGVuIHRoZSBoYXJk
d2FyZSBjb21wbGV0ZWQgdGhlIGZsaXAsIHJlZ2FyZGxlc3Mgb2YNCj4gd2hldGhlciBpdCB3YXMg
YW4gYXN5bmMgZmxpcCBvciBub3QuDQo+IA0KPiBBcyBmb3IgdGhlIHRpbWVzdGFtcCBpbiB0aGUg
ZXZlbnQsIEknbSBub3Qgc3VyZSB3aGF0IHRoZSBleHBlY3RhdGlvbnMgYXJlIGZvcg0KPiBhc3lu
YyBmbGlwcywgYnV0IEkgc3VzcGVjdCBpdCBtYXkgbm90IHJlYWxseSBtYXR0ZXIuIEUuZy4gdGhl
IHRpbWVzdGFtcA0KPiBjYWxjdWxhdGVkIHRvIGNvcnJlc3BvbmQgdG8gdGhlIGVuZCBvZiB0aGUg
cHJldmlvdXMgdmVydGljYWwgYmxhbmsgcGVyaW9kDQo+IG1pZ2h0IGJlIGZpbmUuDQoNClRoYW5r
cyBNaWNoZWwsIFBhdWxvLCBEYW5pZWwsIE5pY2hvbGFzLCBWaWxsZSBmb3IgeW91ciBpbnB1dHMu
DQpBZnRlciBhbGwgdGhlIGRpc2N1c3Npb25zLCBsb29rcyBsaWtlIHRoZSBhc3luYyBmbGlwIHRp
bWUgc3RhbXAgaXMgbm90IG9mIG11Y2gNCnVzZSB0byB0aGUgdXNlcnNwYWNlIGFuZCB0aGUgYXN5
bmMgZmxpcCBzZXF1ZW5jZTsgaGVuY2Ugd2Ugd2lsbCBzdGljayB0byB0aGUgYXBwcm9hY2ggb2Yg
c2VuZGluZyB2YmxhbmsgdGltZSBzdGFtcA0KaXRzZWxmIGFuZCBoYXZlIGEgdGVzdCBjYXNlIGlu
IHRoZSBpZ3QgdG8gY292ZXIgdGhlIGFzeW5jIGZsaXBzIGNhc2VzIGluIGEgc2xpZ2h0bHkgZGlm
ZmVyZW50IHdheS4NCkFuZCB1cGRhdGUgdGhlIGRvY3VtZW50YXRpb24uDQoNClRoYW5rcywNClZh
bmRpdGENCj4gDQo+IA0KPiAtLQ0KPiBFYXJ0aGxpbmcgTWljaGVsIETDpG56ZXIgICAgICAgICAg
ICAgICB8ICAgICAgICAgICAgICAgaHR0cHM6Ly9yZWRoYXQuY29tDQo+IExpYnJlIHNvZnR3YXJl
IGVudGh1c2lhc3QgICAgICAgICAgICAgfCAgICAgICAgICAgICBNZXNhIGFuZCBYIGRldmVsb3Bl
cg0KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRl
dmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8v
bGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==
