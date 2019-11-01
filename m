Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C98EEC903
	for <lists+dri-devel@lfdr.de>; Fri,  1 Nov 2019 20:25:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 12E226E2C8;
	Fri,  1 Nov 2019 19:25:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8D3856E2C8
 for <dri-devel@lists.freedesktop.org>; Fri,  1 Nov 2019 19:25:03 +0000 (UTC)
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmsmga102.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 01 Nov 2019 12:25:02 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.68,256,1569308400"; d="scan'208";a="284278334"
Received: from stinkbox.fi.intel.com (HELO stinkbox) ([10.237.72.174])
 by orsmga001.jf.intel.com with SMTP; 01 Nov 2019 12:24:59 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Fri, 01 Nov 2019 21:24:58 +0200
Date: Fri, 1 Nov 2019 21:24:58 +0200
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Rob Clark <robdclark@gmail.com>
Subject: Re: [PATCH 2/2] drm/atomic: clear new_state pointers at hw_done
Message-ID: <20191101192458.GI1208@intel.com>
References: <20191101180713.5470-1-robdclark@gmail.com>
 <20191101180713.5470-2-robdclark@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191101180713.5470-2-robdclark@gmail.com>
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
Cc: Rob Clark <robdclark@chromium.org>, David Airlie <airlied@linux.ie>,
 open list <linux-kernel@vger.kernel.org>, dri-devel@lists.freedesktop.org,
 Sean Paul <seanpaul@chromium.org>, Sean Paul <sean@poorly.run>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gRnJpLCBOb3YgMDEsIDIwMTkgYXQgMTE6MDc6MTNBTSAtMDcwMCwgUm9iIENsYXJrIHdyb3Rl
Ogo+IEZyb206IFJvYiBDbGFyayA8cm9iZGNsYXJrQGNocm9taXVtLm9yZz4KPiAKPiBUaGUgbmV3
IHN0YXRlIHNob3VsZCBub3QgYmUgYWNjZXNzZWQgYWZ0ZXIgdGhpcyBwb2ludC4gIENsZWFyIHRo
ZQo+IHBvaW50ZXJzIHRvIG1ha2UgdGhhdCBleHBsaWNpdC4KPiAKPiBUaGlzIG1ha2VzIHRoZSBl
cnJvciBjb3JyZWN0ZWQgaW4gdGhlIHByZXZpb3VzIHBhdGNoIG1vcmUgb2J2aW91cy4KPiAKPiBT
aWduZWQtb2ZmLWJ5OiBSb2IgQ2xhcmsgPHJvYmRjbGFya0BjaHJvbWl1bS5vcmc+Cj4gLS0tCj4g
IGRyaXZlcnMvZ3B1L2RybS9kcm1fYXRvbWljX2hlbHBlci5jIHwgMjkgKysrKysrKysrKysrKysr
KysrKysrKysrKysrKysKPiAgMSBmaWxlIGNoYW5nZWQsIDI5IGluc2VydGlvbnMoKykKPiAKPiBk
aWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2RybV9hdG9taWNfaGVscGVyLmMgYi9kcml2ZXJz
L2dwdS9kcm0vZHJtX2F0b21pY19oZWxwZXIuYwo+IGluZGV4IDczMmJkMGNlOTI0MS4uMTc2ODMx
ZGY4MTYzIDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9kcm1fYXRvbWljX2hlbHBlci5j
Cj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL2RybV9hdG9taWNfaGVscGVyLmMKPiBAQCAtMjIzNCwx
MyArMjIzNCw0MiBAQCBFWFBPUlRfU1lNQk9MKGRybV9hdG9taWNfaGVscGVyX2Zha2VfdmJsYW5r
KTsKPiAgICovCj4gIHZvaWQgZHJtX2F0b21pY19oZWxwZXJfY29tbWl0X2h3X2RvbmUoc3RydWN0
IGRybV9hdG9taWNfc3RhdGUgKm9sZF9zdGF0ZSkKPiAgewo+ICsJc3RydWN0IGRybV9jb25uZWN0
b3IgKmNvbm5lY3RvcjsKPiArCXN0cnVjdCBkcm1fY29ubmVjdG9yX3N0YXRlICpvbGRfY29ubl9z
dGF0ZSwgKm5ld19jb25uX3N0YXRlOwo+ICAJc3RydWN0IGRybV9jcnRjICpjcnRjOwo+ICAJc3Ry
dWN0IGRybV9jcnRjX3N0YXRlICpvbGRfY3J0Y19zdGF0ZSwgKm5ld19jcnRjX3N0YXRlOwo+ICsJ
c3RydWN0IGRybV9wbGFuZSAqcGxhbmU7Cj4gKwlzdHJ1Y3QgZHJtX3BsYW5lX3N0YXRlICpvbGRf
cGxhbmVfc3RhdGUsICpuZXdfcGxhbmVfc3RhdGU7Cj4gIAlzdHJ1Y3QgZHJtX2NydGNfY29tbWl0
ICpjb21taXQ7Cj4gKwlzdHJ1Y3QgZHJtX3ByaXZhdGVfb2JqICpvYmo7Cj4gKwlzdHJ1Y3QgZHJt
X3ByaXZhdGVfc3RhdGUgKm9sZF9vYmpfc3RhdGUsICpuZXdfb2JqX3N0YXRlOwo+ICAJaW50IGk7
Cj4gIAo+ICsJLyoKPiArCSAqIEFmdGVyIHRoaXMgcG9pbnQsIGRyaXZlcnMgc2hvdWxkIG5vdCBh
Y2Nlc3MgdGhlIHBlcm1hbmVudCBtb2Rlc2V0Cj4gKwkgKiBzdGF0ZSwgc28gd2UgYWxzbyBjbGVh
ciB0aGUgbmV3X3N0YXRlIHBvaW50ZXJzIHRvIG1ha2UgdGhpcwo+ICsJICogcmVzdHJpY3Rpb24g
ZXhwbGljaXQuCj4gKwkgKgo+ICsJICogRm9yIHRoZSBDUlRDIHN0YXRlLCB3ZSBkbyB0aGlzIGlu
IHRoZSBzYW1lIGxvb3Agd2hlcmUgd2Ugc2lnbmFsCj4gKwkgKiBod19kb25lLCBzaW5jZSB3ZSBz
dGlsbCBuZWVkIHRvIG5ld19jcnRjX3N0YXRlIHRvIGZpc2ggb3V0IHRoZQo+ICsJICogY29tbWl0
Lgo+ICsJICovCj4gKwo+ICsJZm9yX2VhY2hfb2xkbmV3X2Nvbm5lY3Rvcl9pbl9zdGF0ZShvbGRf
c3RhdGUsIGNvbm5lY3Rvciwgb2xkX2Nvbm5fc3RhdGUsIG5ld19jb25uX3N0YXRlLCBpKSB7Cj4g
KwkJb2xkX3N0YXRlLT5jb25uZWN0b3JzW2ldLm5ld19zdGF0ZSA9IE5VTEw7Cj4gKwl9Cj4gKwo+
ICsJZm9yX2VhY2hfb2xkbmV3X3BsYW5lX2luX3N0YXRlKG9sZF9zdGF0ZSwgcGxhbmUsIG9sZF9w
bGFuZV9zdGF0ZSwgbmV3X3BsYW5lX3N0YXRlLCBpKSB7Cj4gKwkJb2xkX3N0YXRlLT5wbGFuZXNb
aV0ubmV3X3N0YXRlID0gTlVMTDsKPiArCX0KPiArCj4gKwlmb3JfZWFjaF9vbGRuZXdfcHJpdmF0
ZV9vYmpfaW5fc3RhdGUob2xkX3N0YXRlLCBvYmosIG9sZF9vYmpfc3RhdGUsIG5ld19vYmpfc3Rh
dGUsIGkpIHsKPiArCQlvbGRfc3RhdGUtPnByaXZhdGVfb2Jqc1tpXS5uZXdfc3RhdGUgPSBOVUxM
Owo+ICsJfQo+ICsKPiAgCWZvcl9lYWNoX29sZG5ld19jcnRjX2luX3N0YXRlKG9sZF9zdGF0ZSwg
Y3J0Yywgb2xkX2NydGNfc3RhdGUsIG5ld19jcnRjX3N0YXRlLCBpKSB7Cj4gIAkJb2xkX3N0YXRl
LT5jcnRjc1tpXS5uZXdfc2VsZl9yZWZyZXNoX2FjdGl2ZSA9IG5ld19jcnRjX3N0YXRlLT5zZWxm
X3JlZnJlc2hfYWN0aXZlOwo+ICsJCW9sZF9zdGF0ZS0+Y3J0Y3NbaV0ubmV3X3N0YXRlID0gTlVM
TDsKClRoYXQncyBnb2luZyB0byBiZSBhIHJlYWwgUElUQSB3aGVuIGRvaW5nIHByb2dyYW1taW5n
IGFmdGVyIHRoZSBmYWN0IGZyb20KYSB2Ymxhbmsgd29ya2VyLiBJdCdzIGFscmVhZHkgYSBwYWlu
IHRoYXQgdGhlIG5ld19jcnRjX3N0YXRlLT5zdGF0ZSBpcwpnZXR0aW5nIE5VTExlZCBzb21ld2hl
cmUuCgo+ICAKPiAgCQljb21taXQgPSBuZXdfY3J0Y19zdGF0ZS0+Y29tbWl0Owo+ICAJCWlmICgh
Y29tbWl0KQo+IC0tIAo+IDIuMjEuMAo+IAo+IF9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCj4gZHJpLWRldmVsIG1haWxpbmcgbGlzdAo+IGRyaS1kZXZlbEBs
aXN0cy5mcmVlZGVza3RvcC5vcmcKPiBodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWls
bWFuL2xpc3RpbmZvL2RyaS1kZXZlbAoKLS0gClZpbGxlIFN5cmrDpGzDpApJbnRlbApfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGlu
ZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVl
ZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
