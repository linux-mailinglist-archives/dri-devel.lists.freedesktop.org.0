Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F1CEAFA94
	for <lists+dri-devel@lfdr.de>; Wed, 11 Sep 2019 12:39:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 88C346E22E;
	Wed, 11 Sep 2019 10:39:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A8C886E22E;
 Wed, 11 Sep 2019 10:39:03 +0000 (UTC)
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga105.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 11 Sep 2019 03:39:02 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,493,1559545200"; d="scan'208";a="185786167"
Received: from stinkbox.fi.intel.com (HELO stinkbox) ([10.237.72.174])
 by fmsmga007.fm.intel.com with SMTP; 11 Sep 2019 03:39:00 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Wed, 11 Sep 2019 13:39:00 +0300
Date: Wed, 11 Sep 2019 13:39:00 +0300
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Subject: Re: [Intel-gfx] [PATCH 05/19] drm/i915: Allow downscale factor of
 <3.0 on glk+ for all formats
Message-ID: <20190911103900.GX7482@intel.com>
References: <20190708125325.16576-1-ville.syrjala@linux.intel.com>
 <20190708125325.16576-6-ville.syrjala@linux.intel.com>
 <f84f813d-02c1-3d60-d320-1f7ed7202395@linux.intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <f84f813d-02c1-3d60-d320-1f7ed7202395@linux.intel.com>
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
Cc: intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gV2VkLCBTZXAgMTEsIDIwMTkgYXQgMTE6NTM6NTRBTSArMDIwMCwgTWFhcnRlbiBMYW5raG9y
c3Qgd3JvdGU6Cj4gT3AgMDgtMDctMjAxOSBvbSAxNDo1MyBzY2hyZWVmIFZpbGxlIFN5cmphbGE6
Cj4gPiBGcm9tOiBWaWxsZSBTeXJqw6Rsw6QgPHZpbGxlLnN5cmphbGFAbGludXguaW50ZWwuY29t
Pgo+ID4KPiA+IEJzcGVjIHNheXMgdGhhdCBnbGsrIG1heCBkb3duc2NhbGUgZmFjdG9yIGlzIDwz
LjAgZm9yIGFsbCBwaXhlbCBmb3JtYXRzLgo+ID4gT2xkZXIgcGxhdGZvcm1zIGhhZCBhIG1heCBv
ZiA8Mi4wIGZvciBOVjEyLiBVcGRhdGUgdGhlIGNvZGUgdG8gZGVhbCB3aXRoCj4gPiB0aGlzLgo+
ID4KPiA+IFNpZ25lZC1vZmYtYnk6IFZpbGxlIFN5cmrDpGzDpCA8dmlsbGUuc3lyamFsYUBsaW51
eC5pbnRlbC5jb20+Cj4gPiAtLS0KPiA+ICBkcml2ZXJzL2dwdS9kcm0vaTkxNS9kaXNwbGF5L2lu
dGVsX2Rpc3BsYXkuYyB8IDkgKysrKysrLS0tCj4gPiAgMSBmaWxlIGNoYW5nZWQsIDYgaW5zZXJ0
aW9ucygrKSwgMyBkZWxldGlvbnMoLSkKPiA+Cj4gPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUv
ZHJtL2k5MTUvZGlzcGxheS9pbnRlbF9kaXNwbGF5LmMgYi9kcml2ZXJzL2dwdS9kcm0vaTkxNS9k
aXNwbGF5L2ludGVsX2Rpc3BsYXkuYwo+ID4gaW5kZXggZWU5MzU3N2JkZjk1Li4yYjhhNmE4NDYw
NWMgMTAwNjQ0Cj4gPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vaTkxNS9kaXNwbGF5L2ludGVsX2Rp
c3BsYXkuYwo+ID4gKysrIGIvZHJpdmVycy9ncHUvZHJtL2k5MTUvZGlzcGxheS9pbnRlbF9kaXNw
bGF5LmMKPiA+IEBAIC0xNDQ3Miw3ICsxNDQ3Miw3IEBAIHNrbF9tYXhfc2NhbGUoY29uc3Qgc3Ry
dWN0IGludGVsX2NydGNfc3RhdGUgKmNydGNfc3RhdGUsCj4gPiAgewo+ID4gIAlzdHJ1Y3QgaW50
ZWxfY3J0YyAqY3J0YyA9IHRvX2ludGVsX2NydGMoY3J0Y19zdGF0ZS0+YmFzZS5jcnRjKTsKPiA+
ICAJc3RydWN0IGRybV9pOTE1X3ByaXZhdGUgKmRldl9wcml2ID0gdG9faTkxNShjcnRjLT5iYXNl
LmRldik7Cj4gPiAtCWludCBtYXhfc2NhbGUsIG11bHQ7Cj4gPiArCWludCBtYXhfc2NhbGU7Cj4g
PiAgCWludCBjcnRjX2Nsb2NrLCBtYXhfZG90Y2xrLCB0bXBjbGsxLCB0bXBjbGsyOwo+ID4gIAo+
ID4gIAlpZiAoIWNydGNfc3RhdGUtPmJhc2UuZW5hYmxlKQo+ID4gQEAgLTE0NDkzLDggKzE0NDkz
LDExIEBAIHNrbF9tYXhfc2NhbGUoY29uc3Qgc3RydWN0IGludGVsX2NydGNfc3RhdGUgKmNydGNf
c3RhdGUsCj4gPiAgCSAqICAgICAgICAgICAgb3IKPiA+ICAJICogICAgY2RjbGsvY3J0Y19jbG9j
awo+ID4gIAkgKi8KPiA+IC0JbXVsdCA9IGRybV9mb3JtYXRfaW5mb19pc195dXZfc2VtaXBsYW5h
cihmb3JtYXQpID8gMiA6IDM7Cj4gPiAtCXRtcGNsazEgPSAoMSA8PCAxNikgKiBtdWx0IC0gMTsK
PiA+ICsJaWYgKElOVEVMX0dFTihkZXZfcHJpdikgPj0gMTAgfHwgSVNfR0VNSU5JTEFLRShkZXZf
cHJpdikgfHwKPiA+ICsJICAgICFkcm1fZm9ybWF0X2luZm9faXNfeXV2X3NlbWlwbGFuYXIoZm9y
bWF0KSkKPiA+ICsJCXRtcGNsazEgPSAweDMwMDAwIC0gMTsKPiA+ICsJZWxzZQo+ID4gKwkJdG1w
Y2xrMSA9IDB4MjAwMDAgLSAxOwo+ID4gIAl0bXBjbGsyID0gKDEgPDwgOCkgKiAoKG1heF9kb3Rj
bGsgPDwgOCkgLyBjcnRjX2Nsb2NrKTsKPiA+ICAJbWF4X3NjYWxlID0gbWluKHRtcGNsazEsIHRt
cGNsazIpOwo+ID4gIAo+IAo+IEZvciB0aGlzIHBhdGNoIGFuZCA0LCA2LCA3LCA4Ogo+IAo+IFJl
dmlld2VkLWJ5OiBNYWFydGVuIExhbmtob3JzdCA8bWFhcnRlbi5sYW5raG9yc3RAbGludXguaW50
ZWwuY29tPgo+IAo+IFBhdGNoIDQgc2VlbXMgdG8gYmUgZXhhY3RseSB0aGUgc2FtZSBhcyB0aGUg
cGF0Y2ggSSB3cm90ZSBmb3IgaXQsIHNvIGxldHMgdXBzdHJlYW0gdGhpcyBBU0FQIGJlZm9yZSBz
b21lb25lIGVsc2UgZG9lcyBhcyB3ZWxsLiA7KQoKQWxtb3N0IHRoZSBzYW1lLCBleGNlcHQgdGhl
ICdpZiAoZm91cmNjICYmIC4uLiknIHBhcnQgaW4gdGhlIHJlYWRvdXQuCklJUkMgb3RoZXJ3aXNl
IGl0IHdvdWxkIFdBUk4gd2hlbiB3ZSB0cnkgdG8gbG9vayB1cCB0aGUgZm9ybWF0IGluZm8Kdy8g
Zm91cmNjPT0wLgoKVGhhbmtzIGZvciB0aGUgcmV2aWV3LgoKLS0gClZpbGxlIFN5cmrDpGzDpApJ
bnRlbApfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmkt
ZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6
Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
