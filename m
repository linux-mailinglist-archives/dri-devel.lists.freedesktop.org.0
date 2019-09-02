Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6EA0BA5CF6
	for <lists+dri-devel@lfdr.de>; Mon,  2 Sep 2019 22:16:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 45A40899DB;
	Mon,  2 Sep 2019 20:15:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D124D890D2;
 Mon,  2 Sep 2019 11:55:15 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 30DC1ACA5;
 Mon,  2 Sep 2019 11:55:14 +0000 (UTC)
Date: Mon, 2 Sep 2019 13:55:21 +0200
From: Jean Delvare <jdelvare@suse.de>
To: Ville =?UTF-8?B?U3lyasOkbMOk?= <ville.syrjala@linux.intel.com>
Subject: Re: [PATCH 3/3] drm/edid: no CEA extension is not an error
Message-ID: <20190902135521.274c0fbf@endymion>
In-Reply-To: <20190902114651.GS7482@intel.com>
References: <20190830181423.4f31a28f@endymion>
 <20190830181652.5b58727b@endymion>
 <20190902114651.GS7482@intel.com>
Organization: SUSE Linux
X-Mailer: Claws Mail 3.17.3 (GTK+ 2.24.32; x86_64-suse-linux-gnu)
MIME-Version: 1.0
X-Mailman-Approved-At: Mon, 02 Sep 2019 20:15:58 +0000
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
 Christian =?UTF-8?B?S8O2bmln?= <christian.koenig@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gTW9uLCAyIFNlcCAyMDE5IDE0OjQ2OjUxICswMzAwLCBWaWxsZSBTeXJqw6Rsw6Qgd3JvdGU6
Cj4gT24gRnJpLCBBdWcgMzAsIDIwMTkgYXQgMDY6MTY6NTJQTSArMDIwMCwgSmVhbiBEZWx2YXJl
IHdyb3RlOgo+ID4gSXQgaXMgZmluZSBmb3IgZGlzcGxheXMgd2l0aG91dCBhdWRpbyBmdW5jdGlv
bmFsaXR5IHRvIG5vdCBpbXBsZW1lbnQKPiA+IENFQSBleHRlbnNpb24gaW4gdGhlaXIgRURJRC4g
RG8gbm90IHJldHVybiBhbiBlcnJvciBpbiB0aGF0IGNhc2UsCj4gPiBpbnN0ZWFkIHJldHVybiAw
IGFzIGlmIHRoZXJlIHdhcyBhIENFQSBleHRlbnNpb24gd2l0aCBubyBhdWRpbyBvcgo+ID4gc3Bl
YWtlciBibG9jay4KPiA+IAo+ID4gVGhpcyBmaXhlcyBoYWxmIG9mIGJ1ZyBmZG8jMTA3ODI1Ogo+
ID4gaHR0cHM6Ly9idWdzLmZyZWVkZXNrdG9wLm9yZy9zaG93X2J1Zy5jZ2k/aWQ9MTA3ODI1Cj4g
PiAKPiA+IFNpZ25lZC1vZmYtYnk6IEplYW4gRGVsdmFyZSA8amRlbHZhcmVAc3VzZS5kZT4KPiA+
IENjOiBNYWFydGVuIExhbmtob3JzdCA8bWFhcnRlbi5sYW5raG9yc3RAbGludXguaW50ZWwuY29t
Pgo+ID4gQ2M6IE1heGltZSBSaXBhcmQgPG1heGltZS5yaXBhcmRAYm9vdGxpbi5jb20+Cj4gPiBD
YzogU2VhbiBQYXVsIDxzZWFuQHBvb3JseS5ydW4+Cj4gPiBDYzogRGF2aWQgQWlybGllIDxhaXJs
aWVkQGxpbnV4LmllPgo+ID4gQ2M6IERhbmllbCBWZXR0ZXIgPGRhbmllbEBmZndsbC5jaD4KPiA+
IC0tLQo+ID4gIGRyaXZlcnMvZ3B1L2RybS9kcm1fZWRpZC5jIHwgICAgNCArKy0tCj4gPiAgMSBm
aWxlIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkKPiA+IAo+ID4gLS0t
IGxpbnV4LTUuMi5vcmlnL2RyaXZlcnMvZ3B1L2RybS9kcm1fZWRpZC5jCTIwMTktMDgtMzAgMTc6
NTc6MzguMTk5OTkwOTk1ICswMjAwCj4gPiArKysgbGludXgtNS4yL2RyaXZlcnMvZ3B1L2RybS9k
cm1fZWRpZC5jCTIwMTktMDgtMzAgMTg6MDQ6MzYuODQwMzMzODM0ICswMjAwCj4gPiBAQCAtNDEz
MCw3ICs0MTMwLDcgQEAgaW50IGRybV9lZGlkX3RvX3NhZChzdHJ1Y3QgZWRpZCAqZWRpZCwgcwo+
ID4gIAljZWEgPSBkcm1fZmluZF9jZWFfZXh0ZW5zaW9uKGVkaWQpOwo+ID4gIAlpZiAoIWNlYSkg
ewo+ID4gIAkJRFJNX0RFQlVHX0tNUygiU0FEOiBubyBDRUEgRXh0ZW5zaW9uIGZvdW5kXG4iKTsK
PiA+IC0JCXJldHVybiAtRU5PRU5UOwo+ID4gKwkJcmV0dXJuIDA7Cj4gPiAgCX0gIAo+IAo+IFNl
ZW1zIHJlYXNvbmFibGUuIE1heWJlIHRoZSBjZWFfcmV2aXNpb248MyBicmFuY2hlcyBzaG91bGQg
YWxzZSByZXR1cm4gMD8KCkkgd2Fzbid0IHN1cmUgYWJvdXQgdGhhdCBvbmUsIGFzIEknbSBub3Qg
ZmFtaWxpYXIgd2l0aCB0aGlzIENFQQpleHRlbnNpb24gdGhpbmcuCgpJZiByZXZpc2lvbiA8IDMg
bWVhbnMgdGhlIGRhdGEgaXMgaW52YWxpZCB0aGVuIHJldHVybmluZyBhbiBlcnJvciBpcwpmaW5l
LiBJZiBvbiB0aGUgb3RoZXIgaGFuZCByZXZpc2lvbiA8IDMgc2ltcGx5IG1lYW5zIHRoYXQgdGhl
IGJsb2NrCnR5cGVzIHdlIGFyZSBsb29raW5nIGZvciB3ZXJlIG5vdCBkZWZpbmVkIGJhY2sgdGhl
biB5ZXMgcmV0dXJuaW5nIDAKaW5zdGVhZCB3b3VsZCBiZSBiZXR0ZXIuCgpJJ2xsIGRvIHdoYXRl
dmVyIGRldmVsb3BlcnMgbW9yZSBmYW1pbGlhciB3aXRoIHRoaXMgdG9waWMgdGhpbmsgaXMKYmV0
dGVyLgoKPiBFaXRoZXIgd2F5Cj4gUmV2aWV3ZWQtYnk6IFZpbGxlIFN5cmrDpGzDpCA8dmlsbGUu
c3lyamFsYUBsaW51eC5pbnRlbC5jb20+CgpUaGFua3MsCi0tIApKZWFuIERlbHZhcmUKU1VTRSBM
MyBTdXBwb3J0Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpo
dHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
