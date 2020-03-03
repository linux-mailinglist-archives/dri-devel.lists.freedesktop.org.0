Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5048D176E19
	for <lists+dri-devel@lfdr.de>; Tue,  3 Mar 2020 05:38:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EE4156E3DF;
	Tue,  3 Mar 2020 04:38:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 47AD46E3DF;
 Tue,  3 Mar 2020 04:38:13 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by orsmga103.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 02 Mar 2020 20:38:12 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,510,1574150400"; d="scan'208";a="233630998"
Received: from fmsmsx107.amr.corp.intel.com ([10.18.124.205])
 by fmsmga008.fm.intel.com with ESMTP; 02 Mar 2020 20:38:12 -0800
Received: from FMSMSX109.amr.corp.intel.com (10.18.116.9) by
 fmsmsx107.amr.corp.intel.com (10.18.124.205) with Microsoft SMTP Server (TLS)
 id 14.3.439.0; Mon, 2 Mar 2020 20:38:12 -0800
Received: from bgsmsx154.gar.corp.intel.com (10.224.48.47) by
 fmsmsx109.amr.corp.intel.com (10.18.116.9) with Microsoft SMTP Server (TLS)
 id 14.3.439.0; Mon, 2 Mar 2020 20:38:11 -0800
Received: from BGSMSX107.gar.corp.intel.com ([169.254.9.58]) by
 BGSMSX154.gar.corp.intel.com ([169.254.7.245]) with mapi id 14.03.0439.000;
 Tue, 3 Mar 2020 10:08:08 +0530
From: "Laxminarayan Bharadiya, Pankaj"
 <pankaj.laxminarayan.bharadiya@intel.com>
To: Daniel Vetter <daniel@ffwll.ch>, Emil Velikov <emil.l.velikov@gmail.com>
Subject: RE: [Intel-gfx] [PATCH v2 0/7] drm: drm_fb_helper cleanup.
Thread-Topic: [Intel-gfx] [PATCH v2 0/7] drm: drm_fb_helper cleanup.
Thread-Index: AQHV8LBL8+V2W+0rDEejJ760teGdoag1QS2AgAA4a4CAAACCAIAAzpkw
Date: Tue, 3 Mar 2020 04:38:07 +0000
Message-ID: <E92BA18FDE0A5B43B7B3DA7FCA0312860577DFAA@BGSMSX107.gar.corp.intel.com>
References: <20200302162151.52349-1-pankaj.laxminarayan.bharadiya@intel.com>
 <CACvgo50_0ZE3dxbwwv2g6937F3mA15thM_qXv=BBVodYy=mbxg@mail.gmail.com>
 <20200302214319.GI2363188@phenom.ffwll.local>
 <20200302214508.GJ2363188@phenom.ffwll.local>
In-Reply-To: <20200302214508.GJ2363188@phenom.ffwll.local>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
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
Cc: Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 ML dri-devel <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogRGFuaWVsIFZldHRlciA8
ZGFuaWVsQGZmd2xsLmNoPg0KPiBTZW50OiAwMyBNYXJjaCAyMDIwIDAzOjE1DQo+IFRvOiBFbWls
IFZlbGlrb3YgPGVtaWwubC52ZWxpa292QGdtYWlsLmNvbT4NCj4gQ2M6IExheG1pbmFyYXlhbiBC
aGFyYWRpeWEsIFBhbmthag0KPiA8cGFua2FqLmxheG1pbmFyYXlhbi5iaGFyYWRpeWFAaW50ZWwu
Y29tPjsgSmFuaSBOaWt1bGENCj4gPGphbmkubmlrdWxhQGxpbnV4LmludGVsLmNvbT47IERhbmll
bCBWZXR0ZXIgPGRhbmllbEBmZndsbC5jaD47IEludGVsDQo+IEdyYXBoaWNzIERldmVsb3BtZW50
IDxpbnRlbC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnPjsgTUwgZHJpLWRldmVsIDxkcmktDQo+
IGRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZz4NCj4gU3ViamVjdDogUmU6IFtJbnRlbC1nZnhd
IFtQQVRDSCB2MiAwLzddIGRybTogZHJtX2ZiX2hlbHBlciBjbGVhbnVwLg0KPiANCj4gT24gTW9u
LCBNYXIgMDIsIDIwMjAgYXQgMTA6NDM6MTlQTSArMDEwMCwgRGFuaWVsIFZldHRlciB3cm90ZToN
Cj4gPiBPbiBNb24sIE1hciAwMiwgMjAyMCBhdCAwNjoyMToyM1BNICswMDAwLCBFbWlsIFZlbGlr
b3Ygd3JvdGU6DQo+ID4gPiBIaSBQYW5rYWosDQo+ID4gPg0KPiA+ID4gT24gTW9uLCAyIE1hciAy
MDIwIGF0IDE2OjMzLCBQYW5rYWogQmhhcmFkaXlhDQo+ID4gPiA8cGFua2FqLmxheG1pbmFyYXlh
bi5iaGFyYWRpeWFAaW50ZWwuY29tPiB3cm90ZToNCj4gPiA+ID4NCj4gPiA+ID4gVGhpcyBzZXJp
ZXMgYWRkcmVzc2VzIGJlbG93IGRybV9mYl9oZWxwZXIgdGFza3MgZnJvbQ0KPiA+ID4gPiBEb2N1
bWVudGF0aW9uL2dwdS90b2RvLnJzdC4NCj4gPiA+ID4NCj4gPiA+ID4gLSBUaGUgbWF4IGNvbm5l
Y3RvciBhcmd1bWVudCBmb3IgZHJtX2ZiX2hlbHBlcl9pbml0KCkgaXNuJ3QgdXNlZA0KPiA+ID4g
PiAgIGFueW1vcmUgYW5kIGNhbiBiZSByZW1vdmVkLg0KPiA+ID4gPg0KPiA+ID4gPiAtIFRoZSBo
ZWxwZXIgZG9lc24ndCBrZWVwIGFuIGFycmF5IG9mIGNvbm5lY3RvcnMgYW55bW9yZSBzbyB0aGVz
ZSBjYW4NCj4gPiA+ID4gICBiZSByZW1vdmVkOiBkcm1fZmJfaGVscGVyX3NpbmdsZV9hZGRfYWxs
X2Nvbm5lY3RvcnMoKSwNCj4gPiA+ID4gICBkcm1fZmJfaGVscGVyX2FkZF9vbmVfY29ubmVjdG9y
KCkgYW5kDQo+ID4gPiA+ICAgZHJtX2ZiX2hlbHBlcl9yZW1vdmVfb25lX2Nvbm5lY3RvcigpLg0K
PiA+ID4gPg0KPiA+ID4gPiBDaGFuZ2VzIHNpbmNlIHYxOg0KPiA+ID4gPiAgICAtIFNxdWFzaGVk
IHdhcm5pbmcgZml4ZXMgaW50byB0aGUgcGF0Y2ggdGhhdCBpbnRyb2R1Y2VkIHRoZQ0KPiA+ID4g
PiAgICAgIHdhcm5pbmdzIChpbnRvIDUvNykgKExhdXJlbnQpDQo+ID4gPiA+ICAgIC0gRml4ZWQg
cmVmbG93IGluIGluIDkvOSAoTGF1cmVudCkNCj4gPiA+ID4NCj4gPiA+IEZvciB0aGUgZnV0dXJl
LCBpbmNsdWRlIHRoZSBjaGFuZ2Vsb2cgaW4gdGhlIHJlc3BlY3RpdmUgcGF0Y2hlcy4NCj4gPiA+
IFRoaXMgbWFrZXMgaXQgZWFzaWVyIGZvciByZXZpZXdlcnMuLi4NCj4gPiA+IFBsdXMgeW91J3Jl
IGFscmVhZHkgY2hhbmdpbmcgdGhlIGNvbW1pdCAtIG1pZ2h0IGFzIHdlbGwgbWVudGlvbg0KPiA+
ID4gd2hhdC93aHkgOi0pDQo+ID4gPg0KPiA+ID4gQWxzbyBkbyBpbmNsdWRlIHRoZSBSLUIsIEFj
a2VkLWJ5LCBvdGhlciB0YWdzIGFjY3VtdWxhdGVkIHVwLXRvIHRoYXQNCj4gPiA+IHBvaW50LCB3
aGVuIHNlbmRpbmcgbmV3IHJldmlzaW9uLg0KPiA+DQo+ID4gWXVwLCBjYW4geW91IHBscyByZXNl
bmQgdGhhdCBlbnRpcmUgcGlsZSB3aXRoIGFsbCB0aGUgYWNrL3JldmlldyB0YWdzDQo+ID4gZnJv
bSB0aGUgZWFybGllciB2ZXJzaW9ucyBpbmNsdWRlZD8gSWYgeW91IGRvbid0IGRvIHRoYXQgeW91
IHdhc3RlDQo+ID4gcmV2aWV3ZXJzIHRpbWUuIEFub3RoZXIgb25lIGlzIHRoYXQgcmVzZW5kIHJp
Z2h0IGF3YXkgYWxzbyBraW5kYQ0KPiA+IHdhc3RlcyBwZW9wbGVzIHRpbWUsIGJlY2F1c2UgdGhl
cmUncyBhIG11Y2ggYmlnZ2VyIGNoYW5jZSB0aGF0IHNvbWVvbmUNCj4gPiB3aWxsIHJldmlldyB0
aGUgb2xkIHZlcnNpb24sIGluc3RlYWQgb2YgeW91ciBuZXcgb25lLiBCZXR0ZXIgd2FpdCBvZg0K
PiA+IGF0IGxlYXN0IDEtMiBkYXlzIG9yIHNvLg0KPiANCj4gSG0ganVzdCBub3RpY2VkIHRoYXQg
cGVvcGxlIGFyZSBzdGlsbCByZXZpZXdpbmcgdjEuIEknZCBzYXkgbGV0cyBmb3JnZXQgYWJvdXQN
Cj4gdGhpcyB2MiBoZXJlLCB3YWl0IDEtMiBkYXlzLCBhbmQgdGhlbiByZXNlbmQgd2l0aCBldmVy
eXRoaW5nIGNvbWJpbmVkLg0KPiBIb3BlZnVsbHkgbm90IHRvbyBtYW55IHdpbGwgcmUtcmV2aWV3
IHYyIGhlcmUgYW5kIHdhc3RlIHRpbWUgb24gc3R1ZmYgdGhhdCdzDQo+IHJldmlld2VkIGFscmVh
ZHkuIFJlc2VuZGluZyB3aXRoaW4gaG91cnMgaXMgcmVhbGx5IG5vdCBnb29kIG9uIG1haWxpbmcg
bGlzdHMNCj4gKHdpdGggbWVyZ2UgcmVxdWVzdHMgb3Igd2hhdGV2ZXIgaXQgZG9lc24ndCBtYXR0
ZXIsIGJlY2F1c2UgZXZlcnlvbmUNCj4gYWx3YXlzIGxvb2tzIGF0IHRoZSBsYXRlc3QgdmVyc2lv
bikuDQoNCk5vdGVkIPCfmIouIFRoYW5rcyBmb3IgdGhlIGZlZWRiYWNrLiANCldpbGwgc2VuZCB0
aGUgbmV3IHNlcmllcyB3aXRoIHRhZ3MgYWNjdW11bGF0ZWQgYWZ0ZXIgMS0yIGRheXMuDQoNClRo
YW5rcywNClBhbmthag0KPiAtRGFuaWVsDQo+IA0KPiA+DQo+ID4gPiBUaGF0IHNhaWQsIGlmIHlv
dSdyZSBpbnRlcmVzdGVkIGluIGZ1cnRoZXIgY2xlYW5pbmcgdGhpcyB1cCwgb25lIGNhbg0KPiA+
ID4gY2xlYW51cCB0aGUgZHJtX2RwX21zdF90b3BvbG9neV9jYnMgaG9va3MuDQo+ID4gPiBJbiBw
YXJ0aWN1bGFyIDo6cmVnaXN0ZXJfY29ubmVjdG9yIGlzIGlkZW50aWNhbCBhY3Jvc3MgdGhlIGJv
YXJkIC0NCj4gPiA+IGNyZWF0ZSBhIGhlbHBlciBmdW5jdGlvbiB1c2luZyBpdCBkaXJlY3RseSBp
biBjb3JlLCBraWxsaW5nIHRoZSBob29rLg0KPiA+ID4NCj4gPiA+IFdoaWxlIGZvciA6OmRlc3Ry
b3lfY29ubmVjdG9yIC0gdGhlcmUncyBzb21lIGFtZGdwdSBzcGVjaWZpYyBjb2RlIGluDQo+ID4g
PiB0aGVyZS4uLiB3aGljaCBJJ20gbm90IHN1cmUgaWYgaXQgc2hvdWxkIHN0YXkgb3Igbm90Lg0K
PiA+ID4gVG8gYmUgb24gdGhlIHNhdmUgc2lkZSAtIGNyZWF0ZSBhIGhlbHBlciB3aGljaCB3aWxs
IGJlIGNhbGxlZCBmb3INCj4gPiA+IGRyaXZlcnMgd2hlcmUgdGhlIGhvb2sgaXMgIT1OVUxMIChh
a2EgZXZlcnlvbmUgYnV0IGFtZGdwdSkuDQo+ID4NCj4gPiBZZWFoIHRoYXQgc3R1ZmYgbG9va3Mg
ZmlzaHkuIFNtZWxscyBhIGJpdCBsaWtlIG9sZCBtc3QgY29kZSBkZXZlbG9wZWQNCj4gPiBiZWZv
cmUgTHl1ZGUgZml4ZWQgdGhlIHJlZmNvdW50aW5nIGZvciByZWFsLCBpdCBzZWVtcyB0byBtYW51
YWxseSBzaHV0DQo+ID4gZG93biBzdHVmZiB0aGF0IHNob3VsZCBiZSBjbGVhbmVkIHVwIHdpdGgg
bm9ybWFsIGNvZGUgcGF0aHMgKG1vZGVzZXQNCj4gPiBhbmQvb3IgZmluYWwga3JlZl9wdXQgb24g
dGhlIGNvbm5lY3RvcikuDQo+ID4gLURhbmllbA0KPiA+IC0tDQo+ID4gRGFuaWVsIFZldHRlcg0K
PiA+IFNvZnR3YXJlIEVuZ2luZWVyLCBJbnRlbCBDb3Jwb3JhdGlvbg0KPiA+IGh0dHA6Ly9ibG9n
LmZmd2xsLmNoDQo+IA0KPiAtLQ0KPiBEYW5pZWwgVmV0dGVyDQo+IFNvZnR3YXJlIEVuZ2luZWVy
LCBJbnRlbCBDb3Jwb3JhdGlvbg0KPiBodHRwOi8vYmxvZy5mZndsbC5jaA0KX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlz
dApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0
b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==
