Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3181EA578D
	for <lists+dri-devel@lfdr.de>; Mon,  2 Sep 2019 15:18:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6774D89AB6;
	Mon,  2 Sep 2019 13:18:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 569DC89AB6;
 Mon,  2 Sep 2019 13:18:03 +0000 (UTC)
X-Amp-Result: UNSCANNABLE
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by orsmga104.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 02 Sep 2019 06:18:02 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,459,1559545200"; d="scan'208";a="198581400"
Received: from stinkbox.fi.intel.com (HELO stinkbox) ([10.237.72.174])
 by fmsmga001.fm.intel.com with SMTP; 02 Sep 2019 06:17:59 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Mon, 02 Sep 2019 16:17:58 +0300
Date: Mon, 2 Sep 2019 16:17:58 +0300
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Jean Delvare <jdelvare@suse.de>
Subject: Re: [PATCH 3/3] drm/edid: no CEA extension is not an error
Message-ID: <20190902131758.GV7482@intel.com>
References: <20190830181423.4f31a28f@endymion>
 <20190830181652.5b58727b@endymion>
 <20190902114651.GS7482@intel.com>
 <20190902135521.274c0fbf@endymion>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190902135521.274c0fbf@endymion>
User-Agent: Mutt/1.10.1 (2018-07-13)
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
Cc: Maxime Ripard <maxime.ripard@bootlin.com>, dri-devel@lists.freedesktop.org,
 David Airlie <airlied@linux.ie>, amd-gfx@lists.freedesktop.org,
 Leo Li <sunpeng.li@amd.com>, Alex Deucher <alexander.deucher@amd.com>,
 Sean Paul <sean@poorly.run>,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gTW9uLCBTZXAgMDIsIDIwMTkgYXQgMDE6NTU6MjFQTSArMDIwMCwgSmVhbiBEZWx2YXJlIHdy
b3RlOgo+IE9uIE1vbiwgMiBTZXAgMjAxOSAxNDo0Njo1MSArMDMwMCwgVmlsbGUgU3lyasOkbMOk
IHdyb3RlOgo+ID4gT24gRnJpLCBBdWcgMzAsIDIwMTkgYXQgMDY6MTY6NTJQTSArMDIwMCwgSmVh
biBEZWx2YXJlIHdyb3RlOgo+ID4gPiBJdCBpcyBmaW5lIGZvciBkaXNwbGF5cyB3aXRob3V0IGF1
ZGlvIGZ1bmN0aW9uYWxpdHkgdG8gbm90IGltcGxlbWVudAo+ID4gPiBDRUEgZXh0ZW5zaW9uIGlu
IHRoZWlyIEVESUQuIERvIG5vdCByZXR1cm4gYW4gZXJyb3IgaW4gdGhhdCBjYXNlLAo+ID4gPiBp
bnN0ZWFkIHJldHVybiAwIGFzIGlmIHRoZXJlIHdhcyBhIENFQSBleHRlbnNpb24gd2l0aCBubyBh
dWRpbyBvcgo+ID4gPiBzcGVha2VyIGJsb2NrLgo+ID4gPiAKPiA+ID4gVGhpcyBmaXhlcyBoYWxm
IG9mIGJ1ZyBmZG8jMTA3ODI1Ogo+ID4gPiBodHRwczovL2J1Z3MuZnJlZWRlc2t0b3Aub3JnL3No
b3dfYnVnLmNnaT9pZD0xMDc4MjUKPiA+ID4gCj4gPiA+IFNpZ25lZC1vZmYtYnk6IEplYW4gRGVs
dmFyZSA8amRlbHZhcmVAc3VzZS5kZT4KPiA+ID4gQ2M6IE1hYXJ0ZW4gTGFua2hvcnN0IDxtYWFy
dGVuLmxhbmtob3JzdEBsaW51eC5pbnRlbC5jb20+Cj4gPiA+IENjOiBNYXhpbWUgUmlwYXJkIDxt
YXhpbWUucmlwYXJkQGJvb3RsaW4uY29tPgo+ID4gPiBDYzogU2VhbiBQYXVsIDxzZWFuQHBvb3Js
eS5ydW4+Cj4gPiA+IENjOiBEYXZpZCBBaXJsaWUgPGFpcmxpZWRAbGludXguaWU+Cj4gPiA+IENj
OiBEYW5pZWwgVmV0dGVyIDxkYW5pZWxAZmZ3bGwuY2g+Cj4gPiA+IC0tLQo+ID4gPiAgZHJpdmVy
cy9ncHUvZHJtL2RybV9lZGlkLmMgfCAgICA0ICsrLS0KPiA+ID4gIDEgZmlsZSBjaGFuZ2VkLCAy
IGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0pCj4gPiA+IAo+ID4gPiAtLS0gbGludXgtNS4y
Lm9yaWcvZHJpdmVycy9ncHUvZHJtL2RybV9lZGlkLmMJMjAxOS0wOC0zMCAxNzo1NzozOC4xOTk5
OTA5OTUgKzAyMDAKPiA+ID4gKysrIGxpbnV4LTUuMi9kcml2ZXJzL2dwdS9kcm0vZHJtX2VkaWQu
YwkyMDE5LTA4LTMwIDE4OjA0OjM2Ljg0MDMzMzgzNCArMDIwMAo+ID4gPiBAQCAtNDEzMCw3ICs0
MTMwLDcgQEAgaW50IGRybV9lZGlkX3RvX3NhZChzdHJ1Y3QgZWRpZCAqZWRpZCwgcwo+ID4gPiAg
CWNlYSA9IGRybV9maW5kX2NlYV9leHRlbnNpb24oZWRpZCk7Cj4gPiA+ICAJaWYgKCFjZWEpIHsK
PiA+ID4gIAkJRFJNX0RFQlVHX0tNUygiU0FEOiBubyBDRUEgRXh0ZW5zaW9uIGZvdW5kXG4iKTsK
PiA+ID4gLQkJcmV0dXJuIC1FTk9FTlQ7Cj4gPiA+ICsJCXJldHVybiAwOwo+ID4gPiAgCX0gIAo+
ID4gCj4gPiBTZWVtcyByZWFzb25hYmxlLiBNYXliZSB0aGUgY2VhX3JldmlzaW9uPDMgYnJhbmNo
ZXMgc2hvdWxkIGFsc2UgcmV0dXJuIDA/Cj4gCj4gSSB3YXNuJ3Qgc3VyZSBhYm91dCB0aGF0IG9u
ZSwgYXMgSSdtIG5vdCBmYW1pbGlhciB3aXRoIHRoaXMgQ0VBCj4gZXh0ZW5zaW9uIHRoaW5nLgo+
IAo+IElmIHJldmlzaW9uIDwgMyBtZWFucyB0aGUgZGF0YSBpcyBpbnZhbGlkIHRoZW4gcmV0dXJu
aW5nIGFuIGVycm9yIGlzCj4gZmluZS4gSWYgb24gdGhlIG90aGVyIGhhbmQgcmV2aXNpb24gPCAz
IHNpbXBseSBtZWFucyB0aGF0IHRoZSBibG9jawo+IHR5cGVzIHdlIGFyZSBsb29raW5nIGZvciB3
ZXJlIG5vdCBkZWZpbmVkIGJhY2sgdGhlbiB5ZXMgcmV0dXJuaW5nIDAKPiBpbnN0ZWFkIHdvdWxk
IGJlIGJldHRlci4KClRoYXQgaXMgaW5kZWVkIHRoZSBjYXNlLiBBIHF1aWNrIHJlYWQgdGhyb3Vn
aCB0aGUgY29kZSBzaG93ZWQgdGhhdAp3ZSdyZSBub3QgMTAwJSBjb25zaXN0ZW50IGluIGNoZWNp
bmcgZm9yIHRoYXQgdGhvdWdoLiBJIGp1c3Qgc2VuZAphIGZldyBwYXRjaGVzIHRvIGZpeCB0aGF0
IHVwLgoKLS0gClZpbGxlIFN5cmrDpGzDpApJbnRlbApfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBs
aXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1h
bi9saXN0aW5mby9kcmktZGV2ZWw=
