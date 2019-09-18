Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 07B2FB6A79
	for <lists+dri-devel@lfdr.de>; Wed, 18 Sep 2019 20:23:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7056D6F426;
	Wed, 18 Sep 2019 18:23:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1C0456F422;
 Wed, 18 Sep 2019 18:23:46 +0000 (UTC)
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by orsmga103.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 18 Sep 2019 11:23:46 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,521,1559545200"; d="scan'208";a="187850232"
Received: from labuser-z97x-ud5h.jf.intel.com (HELO intel.com) ([10.54.75.49])
 by fmsmga007.fm.intel.com with ESMTP; 18 Sep 2019 11:23:45 -0700
Date: Wed, 18 Sep 2019 11:25:28 -0700
From: Manasi Navare <manasi.d.navare@intel.com>
To: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
Subject: Re: [PATCH] drm/i915/dp: Fix DP MST error after unplugging TypeC cable
Message-ID: <20190918182528.GB31062@intel.com>
References: <1568770783-169735-1-git-send-email-srinivasan.s@intel.com>
 <20190918175038.GA31062@intel.com>
 <20190918181136.GQ1208@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190918181136.GQ1208@intel.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
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
Cc: srinivasan.s@intel.com, intel-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gV2VkLCBTZXAgMTgsIDIwMTkgYXQgMDk6MTE6MzZQTSArMDMwMCwgVmlsbGUgU3lyasOkbMOk
IHdyb3RlOgo+IE9uIFdlZCwgU2VwIDE4LCAyMDE5IGF0IDEwOjUwOjM5QU0gLTA3MDAsIE1hbmFz
aSBOYXZhcmUgd3JvdGU6Cj4gPiBPbiBXZWQsIFNlcCAxOCwgMjAxOSBhdCAwNzowOTo0M0FNICsw
NTMwLCBzcmluaXZhc2FuLnNAaW50ZWwuY29tIHdyb3RlOgo+ID4gPiBGcm9tOiBTcmluaXZhc2Fu
IFMgPHNyaW5pdmFzYW4uc0BpbnRlbC5jb20+Cj4gPiA+IAo+ID4gPiBUaGlzIHBhdGNoIGF2b2lk
cyBEUCBNU1QgcGF5bG9hZCBlcnJvciBtZXNzYWdlIGluIGRtZXNnLCBhcyBpdCBpcyB0cnlpbmcK
PiA+ID4gdG8gcmVhZCB0aGUgcGF5bG9hZCBmcm9tIHRoZSBkaXNjb25uZWN0ZWQgRFAgTVNUIGRl
dmljZS4gQWZ0ZXIgdGhlIHVucGx1Zwo+ID4gPiB0aGUgY29ubmVjdG9yIHN0YXR1cyBpcyBkaXNj
b25uZWN0ZWQgYW5kIHdlIHNob3VsZCBub3QgYmUgbG9va2luZyBmb3IgdGhlCj4gPiA+IHBheWxv
YWQgYW5kIGhlbmNlIHJlbW92ZSB0aGUgZXJyb3IgYW5kIHRocm93IHRoZSB3YXJuaW5nLgo+ID4g
PiAKPiA+ID4gVGhpcyBkZXRhaWxzIGNhbiBiZSBmb3VuZCBpbjoKPiA+ID4gaHR0cHM6Ly9idWdz
LmZyZWVkZXNrdG9wLm9yZy9zaG93X2J1Zy5jZ2k/aWQ9MTExNjMyCj4gPiAKPiA+IFBsZWFzZSBh
ZGQgdGhpcyBsaW5rIGFzIEJ1Z3ppbGxhOiBodHRwczovL2J1Z3MuZnJlZWRlc2t0b3Aub3JnL3No
b3dfYnVnLmNnaT9pZD0xMTE2MzIgYWZ0ZXIgdGhlIFNpZ24gb2ZmCj4gPiBzdGF0ZW1lbnQKPiA+
IAo+ID4gPiAKPiA+ID4gU2lnbmVkLW9mZi1ieTogU3Jpbml2YXNhbiBTIDxzcmluaXZhc2FuLnNA
aW50ZWwuY29tPgo+ID4gPiAtLS0KPiA+ID4gIGRyaXZlcnMvZ3B1L2RybS9pOTE1L2Rpc3BsYXkv
aW50ZWxfZHBfbXN0LmMgfCA3ICsrKysrKy0KPiA+ID4gIDEgZmlsZSBjaGFuZ2VkLCA2IGluc2Vy
dGlvbnMoKyksIDEgZGVsZXRpb24oLSkKPiA+ID4gCj4gPiA+IGRpZmYgLS1naXQgYS9kcml2ZXJz
L2dwdS9kcm0vaTkxNS9kaXNwbGF5L2ludGVsX2RwX21zdC5jIGIvZHJpdmVycy9ncHUvZHJtL2k5
MTUvZGlzcGxheS9pbnRlbF9kcF9tc3QuYwo+ID4gPiBpbmRleCBlZWViM2Y5MzNhYTQuLjViMjI3
OGZkZjY3NSAxMDA2NDQKPiA+ID4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL2k5MTUvZGlzcGxheS9p
bnRlbF9kcF9tc3QuYwo+ID4gPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vaTkxNS9kaXNwbGF5L2lu
dGVsX2RwX21zdC5jCj4gPiA+IEBAIC0yMTUsNyArMjE1LDEyIEBAIHN0YXRpYyB2b2lkIGludGVs
X21zdF9kaXNhYmxlX2RwKHN0cnVjdCBpbnRlbF9lbmNvZGVyICplbmNvZGVyLAo+ID4gPiAgCj4g
PiA+ICAJcmV0ID0gZHJtX2RwX3VwZGF0ZV9wYXlsb2FkX3BhcnQxKCZpbnRlbF9kcC0+bXN0X21n
cik7Cj4gPiA+ICAJaWYgKHJldCkgewo+ID4gPiAtCQlEUk1fRVJST1IoImZhaWxlZCB0byB1cGRh
dGUgcGF5bG9hZCAlZFxuIiwgcmV0KTsKPiA+ID4gKwkJaWYgKCFjb25uZWN0b3IgfHwKPiA+ID4g
KwkJICAgIGNvbm5lY3Rvci0+YmFzZS5zdGF0dXMgIT0gY29ubmVjdG9yX3N0YXR1c19jb25uZWN0
ZWQpIHsKPiA+ID4gKwkJCURSTV9XQVJOKCJEUCBNU1QgZGlzY29ubmVjdFxuIik7Cj4gPiAKPiA+
IE1heSBiZSBhZGRpbmcgdGhpcyBjaGVjayBiZWZvcmUgY2FsbGluZyBkcm1fZHBfdXBkYXRlX3Bh
eWxvYWRfcGFydDEoKSBpcyBhIGJldHRlciBpZGVhPwo+ID4gSWYgdGhlIGNvbm5lY3RvciBpcyBk
aXNjb25uZWN0ZWQsIHdoeSB1cGRhdGUgcGF5bG9hZD8KPiA+IAo+ID4gSmFuaSwgVmlsbGUsIHRo
b3VnaHRzPwo+IAo+IE9yIGp1c3QgY29udmVydCBpdCB0byBhIGRlYnVnPwoKU3VyZSB0aGF0IHdp
bGwgd29yaywgYnV0IGRvIHdlIHJlYWxseSB3YW50IHRvIHVwZGF0ZSB0aGUgcGF5bG9hZCBpZiB0
aGUgY29ubmVjdG9yIHN0YXR1cyBpcyBkaXNjb25uZWN0ZWQuClNvIHNob3VsZG50IGNoZWNraW5n
IHRoYXQgYmVmb3JlIGNhbGxpbmcgdGhlIGZ1bmN0aW9uIGJlIGEgYmV0dGVyIGZpeD8KCk1hbmFz
aQoKPiAKPiA+IAo+ID4gUmVnYXJkcwo+ID4gTWFuYXNpCj4gPiAKPiA+ID4gKwkJfSBlbHNlIHsK
PiA+ID4gKwkJCURSTV9FUlJPUigiZmFpbGVkIHRvIHVwZGF0ZSBwYXlsb2FkICVkXG4iLCByZXQp
Owo+ID4gPiArCQl9Cj4gPiA+ICAJfQo+ID4gPiAgCWlmIChvbGRfY3J0Y19zdGF0ZS0+aGFzX2F1
ZGlvKQo+ID4gPiAgCQlpbnRlbF9hdWRpb19jb2RlY19kaXNhYmxlKGVuY29kZXIsCj4gPiA+IC0t
IAo+ID4gPiAyLjcuNAo+ID4gPiAKPiAKPiAtLSAKPiBWaWxsZSBTeXJqw6Rsw6QKPiBJbnRlbAo+
IF9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCj4gZHJpLWRl
dmVsIG1haWxpbmcgbGlzdAo+IGRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKPiBodHRw
czovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbApfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFp
bGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
