Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 277FD644CF
	for <lists+dri-devel@lfdr.de>; Wed, 10 Jul 2019 12:00:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6CEC58961D;
	Wed, 10 Jul 2019 10:00:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 53F7A8961D
 for <dri-devel@lists.freedesktop.org>; Wed, 10 Jul 2019 10:00:06 +0000 (UTC)
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by orsmga101.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 10 Jul 2019 03:00:05 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.63,474,1557212400"; d="scan'208";a="186111514"
Received: from stinkbox.fi.intel.com (HELO stinkbox) ([10.237.72.174])
 by fmsmga001.fm.intel.com with SMTP; 10 Jul 2019 03:00:01 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Wed, 10 Jul 2019 13:00:00 +0300
Date: Wed, 10 Jul 2019 13:00:00 +0300
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Dmitry Osipenko <digetx@gmail.com>
Subject: Re: [PATCH v1] drm/modes: Skip invalid cmdline mode
Message-ID: <20190710100000.GZ5942@intel.com>
References: <20190709145151.23086-1-digetx@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190709145151.23086-1-digetx@gmail.com>
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
Cc: Maxime Ripard <maxime.ripard@bootlin.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Jonathan Hunter <jonathanh@nvidia.com>,
 David Airlie <airlied@linux.ie>, Thierry Reding <thierry.reding@gmail.com>,
 linux-tegra@vger.kernel.org, Sean Paul <sean@poorly.run>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVHVlLCBKdWwgMDksIDIwMTkgYXQgMDU6NTE6NTFQTSArMDMwMCwgRG1pdHJ5IE9zaXBlbmtv
IHdyb3RlOgo+IFRoZSBuYW1lZCBtb2RlIGNvdWxkIGJlIGludmFsaWQgYW5kIHRoZW4gY21kbGlu
ZSBwYXJzZXIgbWlzc2VzIHRvIHZhbGlkYXRlCj4gbW9kZSdzIGRpbWVuc2lvbnMsIGhhcHBpbHkg
YWRkaW5nIDB4MCBtb2RlIGFzIGEgdmFsaWQgbW9kZS4gT25lIGNhc2Ugd2hlcmUKPiB0aGlzIGhh
cHBlbnMgaXMgTlZJRElBIFRlZ3JhIGRldmljZXMgdGhhdCBhcmUgdXNpbmcgZG93bnN0cmVhbSBi
b290bG9hZGVyCj4gd2hpY2ggYWRkcyAidmlkZW89dGVncmFmYiIgdG8gdGhlIGtlcm5lbCdzIGNt
ZGxpbmUgYW5kIHRodXMgdXBzdHJlYW0gVGVncmEKPiBEUk0gZHJpdmVyIGZhaWxzIHRvIHByb2Jl
IGJlY2F1c2Ugb2YgdGhlIGludmFsaWQgbW9kZS4KPiAKPiBGaXhlczogM2FlZWIxM2Q4OTk2ICgi
ZHJtL21vZGVzOiBTdXBwb3J0IG1vZGVzIG5hbWVzIG9uIHRoZSBjb21tYW5kIGxpbmUiKQoKSXMg
dGhhdCBhY3R1YWxseSB0cnVlPyBUaGlzIHByb2JsZW0gaGFzIGJlZW4gaW4gdGhlIGNvZGUgc2lu
Y2UgZm9yZXZlciBBRkFJQ1MuCgo+IFNpZ25lZC1vZmYtYnk6IERtaXRyeSBPc2lwZW5rbyA8ZGln
ZXR4QGdtYWlsLmNvbT4KPiAtLS0KPiAgZHJpdmVycy9ncHUvZHJtL2RybV9jbGllbnRfbW9kZXNl
dC5jIHwgMyArKy0KPiAgZHJpdmVycy9ncHUvZHJtL2RybV9tb2Rlcy5jICAgICAgICAgIHwgNiAr
KysrKysKPiAgMiBmaWxlcyBjaGFuZ2VkLCA4IGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkK
PiAKPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2RybV9jbGllbnRfbW9kZXNldC5jIGIv
ZHJpdmVycy9ncHUvZHJtL2RybV9jbGllbnRfbW9kZXNldC5jCj4gaW5kZXggZTk1ZmNlYWM4Zjhi
Li41NmQzNjc3OWQyMTMgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL2RybV9jbGllbnRf
bW9kZXNldC5jCj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL2RybV9jbGllbnRfbW9kZXNldC5jCj4g
QEAgLTE4MCw3ICsxODAsOCBAQCBkcm1fY29ubmVjdG9yX3BpY2tfY21kbGluZV9tb2RlKHN0cnVj
dCBkcm1fY29ubmVjdG9yICpjb25uZWN0b3IpCj4gIAo+ICBjcmVhdGVfbW9kZToKPiAgCW1vZGUg
PSBkcm1fbW9kZV9jcmVhdGVfZnJvbV9jbWRsaW5lX21vZGUoY29ubmVjdG9yLT5kZXYsIGNtZGxp
bmVfbW9kZSk7Cj4gLQlsaXN0X2FkZCgmbW9kZS0+aGVhZCwgJmNvbm5lY3Rvci0+bW9kZXMpOwo+
ICsJaWYgKG1vZGUpCj4gKwkJbGlzdF9hZGQoJm1vZGUtPmhlYWQsICZjb25uZWN0b3ItPm1vZGVz
KTsKClRoYXQncyB0aGUgc2FtZSBhcyB3aGF0IEkgZGlkIGhlcmUKaHR0cHM6Ly9wYXRjaHdvcmsu
ZnJlZWRlc2t0b3Aub3JnL3BhdGNoLzMwOTIyMy8/c2VyaWVzPTYxNzgxJnJldj0xCgpCdXQgSSdk
IGhhdmUgdG8gcmViYXNlIHRoYXQgc28gbGV0J3MganVzdCBnbyB3aXRoIHlvdXIgcGF0Y2guCgo+
ICAKPiAgCXJldHVybiBtb2RlOwo+ICB9Cj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9k
cm1fbW9kZXMuYyBiL2RyaXZlcnMvZ3B1L2RybS9kcm1fbW9kZXMuYwo+IGluZGV4IDkxMDU2MWQ0
ZjA3MS4uNzRhNTczOWRmNTA2IDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9kcm1fbW9k
ZXMuYwo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9kcm1fbW9kZXMuYwo+IEBAIC0xNTgsNiArMTU4
LDkgQEAgc3RydWN0IGRybV9kaXNwbGF5X21vZGUgKmRybV9jdnRfbW9kZShzdHJ1Y3QgZHJtX2Rl
dmljZSAqZGV2LCBpbnQgaGRpc3BsYXksCj4gIAlpbnQgaW50ZXJsYWNlOwo+ICAJdTY0IHRtcDsK
PiAgCj4gKwlpZiAoIWhkaXNwbGF5IHx8ICF2ZGlzcGxheSkKPiArCQlyZXR1cm4gTlVMTDsKPiAr
Cj4gIAkvKiBhbGxvY2F0ZSB0aGUgZHJtX2Rpc3BsYXlfbW9kZSBzdHJ1Y3R1cmUuIElmIGZhaWx1
cmUsIHdlIHdpbGwKPiAgCSAqIHJldHVybiBkaXJlY3RseQo+ICAJICovCj4gQEAgLTM5Miw2ICsz
OTUsOSBAQCBkcm1fZ3RmX21vZGVfY29tcGxleChzdHJ1Y3QgZHJtX2RldmljZSAqZGV2LCBpbnQg
aGRpc3BsYXksIGludCB2ZGlzcGxheSwKPiAgCWludCBoc3luYywgaGZyb250X3BvcmNoLCB2b2Rk
X2Zyb250X3BvcmNoX2xpbmVzOwo+ICAJdW5zaWduZWQgaW50IHRtcDEsIHRtcDI7Cj4gIAo+ICsJ
aWYgKCFoZGlzcGxheSB8fCAhdmRpc3BsYXkpCj4gKwkJcmV0dXJuIE5VTEw7Cj4gKwoKVGhlc2Ug
bGd0bQoKUGF0Y2ggaXMKUmV2aWV3ZWQtYnk6IFZpbGxlIFN5cmrDpGzDpCA8dmlsbGUuc3lyamFs
YUBsaW51eC5pbnRlbC5jb20+Cgo+ICAJZHJtX21vZGUgPSBkcm1fbW9kZV9jcmVhdGUoZGV2KTsK
PiAgCWlmICghZHJtX21vZGUpCj4gIAkJcmV0dXJuIE5VTEw7Cj4gLS0gCj4gMi4yMi4wCj4gCj4g
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KPiBkcmktZGV2
ZWwgbWFpbGluZyBsaXN0Cj4gZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwo+IGh0dHBz
Oi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCgotLSAK
VmlsbGUgU3lyasOkbMOkCkludGVsCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVk
ZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZv
L2RyaS1kZXZlbA==
