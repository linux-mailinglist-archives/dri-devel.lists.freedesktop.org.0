Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 319E3D2995
	for <lists+dri-devel@lfdr.de>; Thu, 10 Oct 2019 14:36:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D612C6EB1B;
	Thu, 10 Oct 2019 12:36:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 39C266EB1B
 for <dri-devel@lists.freedesktop.org>; Thu, 10 Oct 2019 12:36:29 +0000 (UTC)
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga101.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 10 Oct 2019 05:36:28 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.67,280,1566889200"; d="scan'208";a="187949369"
Received: from stinkbox.fi.intel.com (HELO stinkbox) ([10.237.72.174])
 by orsmga008.jf.intel.com with SMTP; 10 Oct 2019 05:36:25 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Thu, 10 Oct 2019 15:36:24 +0300
Date: Thu, 10 Oct 2019 15:36:24 +0300
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Subject: Re: [PATCH] drm/plane: Clarify our expectations for src/dst rectangles
Message-ID: <20191010123624.GD1208@intel.com>
References: <20191010112918.15724-1-maarten.lankhorst@linux.intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191010112918.15724-1-maarten.lankhorst@linux.intel.com>
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
Cc: Maxime Ripard <maxime.ripard@bootlin.com>, David Airlie <airlied@linux.ie>,
 Sean Paul <sean@poorly.run>, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVGh1LCBPY3QgMTAsIDIwMTkgYXQgMDE6Mjk6MTdQTSArMDIwMCwgTWFhcnRlbiBMYW5raG9y
c3Qgd3JvdGU6Cj4gVGhlIHJlY3RhbmdsZXMgYXJlIHVzdWFsbHkgY2xpcHBlZCwgYnV0IGl0IGNh
biBiZSB1c2VmdWwgdG8gaGF2ZQo+IHRoZW0gdW5jbGlwcGVkLCBmb3IgZXhhbXBsZSBmb3IgY3Vy
c29yIHBsYW5lcy4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBNYWFydGVuIExhbmtob3JzdCA8bWFhcnRl
bi5sYW5raG9yc3RAbGludXguaW50ZWwuY29tPgo+IC0tLQo+ICBpbmNsdWRlL2RybS9kcm1fcGxh
bmUuaCB8IDIyICsrKysrKysrKysrKysrKysrKysrLS0KPiAgMSBmaWxlIGNoYW5nZWQsIDIwIGlu
c2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0pCj4gCj4gZGlmZiAtLWdpdCBhL2luY2x1ZGUvZHJt
L2RybV9wbGFuZS5oIGIvaW5jbHVkZS9kcm0vZHJtX3BsYW5lLmgKPiBpbmRleCBjZDU5MDNhZDMz
ZjcuLjk0YmJiZjIxNTEwMCAxMDA2NDQKPiAtLS0gYS9pbmNsdWRlL2RybS9kcm1fcGxhbmUuaAo+
ICsrKyBiL2luY2x1ZGUvZHJtL2RybV9wbGFuZS5oCj4gQEAgLTE4Myw4ICsxODMsMjYgQEAgc3Ry
dWN0IGRybV9wbGFuZV9zdGF0ZSB7Cj4gIAkgKi8KPiAgCXN0cnVjdCBkcm1fcHJvcGVydHlfYmxv
YiAqZmJfZGFtYWdlX2NsaXBzOwo+ICAKPiAtCS8qKiBAc3JjOiBjbGlwcGVkIHNvdXJjZSBjb29y
ZGluYXRlcyBvZiB0aGUgcGxhbmUgKGluIDE2LjE2KSAqLwo+IC0JLyoqIEBkc3Q6IGNsaXBwZWQg
ZGVzdGluYXRpb24gY29vcmRpbmF0ZXMgb2YgdGhlIHBsYW5lICovCj4gKwkvKioKPiArCSAqIEBz
cmM6Cj4gKwkgKgo+ICsJICogc291cmNlIGNvb3JkaW5hdGVzIG9mIHRoZSBwbGFuZSAoaW4gMTYu
MTYpLgo+ICsJICoKPiArCSAqIFdoZW4gdXNpbmcgZHJtX2F0b21pY19oZWxwZXJfY2hlY2tfcGxh
bmVfc3RhdGUoKSwKPiArCSAqIHRoZSBjb29yZGluYXRlcyBhcmUgY2xpcHBlZCwgYnV0IHRoZSBk
cml2ZXIgbWF5IGNob29zZQo+ICsJICogdG8gdXNlIHVuY2xpcHBlZCBjb29yZGluYXRlcyBpbnN0
ZWFkLgo+ICsJICoKPiArCSAqIFRoaXMgY2FuIGJlIHVzZWZ1bCB3aGVuIHVzaW5nIGEgaGFyZGNv
ZGVkIHNpemUgaW4gYSBjdXJzb3IgcGxhbmUuCgpJIHdvdWxkIGluc3RlYWQgc2F5IHNvbWV0aGlu
ZyBsaWtlICJ3aGVuIHRoZSBoYXJkd2FyZSBwZXJmb3Jtcwp0aGUgY2xpcHBpbmcgYXV0b21hZ2lj
YWxseSIuCgo+ICsJICovCj4gKwkvKioKPiArCSAqIEBkc3Q6Cj4gKwkgKgo+ICsJICogV2hlbiB1
c2luZyBkcm1fYXRvbWljX2hlbHBlcl9jaGVja19wbGFuZV9zdGF0ZSgpLAo+ICsJICogdGhlIGNv
b3JkaW5hdGVzIGFyZSBjbGlwcGVkLCBidXQgdGhlIGRyaXZlciBtYXkgY2hvb3NlCj4gKwkgKiB0
byB1c2UgdW5jbGlwcGVkIGNvb3JkaW5hdGVzIGluc3RlYWQuCj4gKwkgKgo+ICsJICogVGhpcyBj
YW4gYmUgdXNlZnVsIHdoZW4gdXNpbmcgYSBoYXJkY29kZWQgc2l6ZSBpbiBhIGN1cnNvciBwbGFu
ZS4KPiArCSAqLwo+ICAJc3RydWN0IGRybV9yZWN0IHNyYywgZHN0Owo+ICAKPiAgCS8qKgo+IC0t
IAo+IDIuMjMuMAo+IAo+IF9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCj4gZHJpLWRldmVsIG1haWxpbmcgbGlzdAo+IGRyaS1kZXZlbEBsaXN0cy5mcmVlZGVz
a3RvcC5vcmcKPiBodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZv
L2RyaS1kZXZlbAoKLS0gClZpbGxlIFN5cmrDpGzDpApJbnRlbApfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1k
ZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcv
bWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
