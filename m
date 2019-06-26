Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AC1D956A68
	for <lists+dri-devel@lfdr.de>; Wed, 26 Jun 2019 15:27:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CB1146E42F;
	Wed, 26 Jun 2019 13:27:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3979F6E42F
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Jun 2019 13:27:41 +0000 (UTC)
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by orsmga105.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 26 Jun 2019 06:27:40 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.63,420,1557212400"; d="scan'208";a="170066599"
Received: from stinkbox.fi.intel.com (HELO stinkbox) ([10.237.72.174])
 by FMSMGA003.fm.intel.com with SMTP; 26 Jun 2019 06:27:33 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Wed, 26 Jun 2019 16:27:32 +0300
Date: Wed, 26 Jun 2019 16:27:32 +0300
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Robert Beckett <bob.beckett@collabora.com>
Subject: Re: [PATCH v3 3/4] drm/vblank: estimate vblank while disabling
 vblank if interrupt disabled
Message-ID: <20190626132732.GP5942@intel.com>
References: <cover.1561483965.git.bob.beckett@collabora.com>
 <b96132cef4b63118df1026a99b3c345692e3de26.1561483965.git.bob.beckett@collabora.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <b96132cef4b63118df1026a99b3c345692e3de26.1561483965.git.bob.beckett@collabora.com>
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
Cc: Maxime Ripard <maxime.ripard@bootlin.com>, Sean Paul <sean@poorly.run>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 David Airlie <airlied@linux.ie>, NXP Linux Team <linux-imx@nxp.com>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Shawn Guo <shawnguo@kernel.org>, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVHVlLCBKdW4gMjUsIDIwMTkgYXQgMDY6NTk6MTRQTSArMDEwMCwgUm9iZXJ0IEJlY2tldHQg
d3JvdGU6Cj4gSWYgaW50ZXJydXB0cyBhcmUgZGlzYWJsZWQgKGUuZy4gdmlhIHZibGFua19kaXNh
YmxlX2ZuKSBhbmQgd2UgY29tZSB0bwo+IGRpc2FibGUgdmJsYW5rLCB1cGRhdGUgdGhlIHZibGFu
ayBjb3VudCB0byBiZXN0IGd1ZXNzIGFzIHRvIHdoYXQgaXQKPiB3b3VsZCBiZSBoYWQgdGhlIGlu
dGVycnVwdHMgcmVtYWluZWQgZW5hYmxlZCwgYW5kIHVwZGF0ZSB0aGUgdGltZXNhbXAgdG8KPiBu
b3cuCj4gCj4gVGhpcyBhdm9pZHMgYSBzdGFsZSB2YmxhbmsgZXZlbnQgYmVpbmcgc2VudCB3aGls
ZSBkaXNhYmxpbmcgY3J0Y3MgZHVyaW5nCj4gYXRvbWljIG1vZGVzZXQuCj4gCj4gRml4ZXM6IDY4
MDM2YjA4YjkxYmMgKCJkcm0vdmJsYW5rOiBEbyBub3QgdXBkYXRlIHZibGFuayBjb3VudCBpZiBp
bnRlcnJ1cHRzCj4gYXJlIGFscmVhZHkgZGlzYWJsZWQuIikKCkkgZG9uJ3QgdW5kZXJzdGFuZCB0
aGF0IGNvbW1pdC4gZHJtX3ZibGFua19vZmYoKSBzaG91bGQgYmUgY2FsbGVkCndoZW4gdGhlIHBv
d2VyIGlzIHN0aWxsIHByZXNlbnQsIHNvIGl0IGxvb2tzIHRvIG1lIGxpa2UgdGhhdApjb21taXQg
aXMgYWN0dWFsbHkgd3JvbmcuIFNvIEkgdGhpbmsgd2UgbWF5IHdhbnQgdG8ganVzdCByZXZlcnQK
aXQgYW5kIGZpZ3VyZSBvdXQgd2hhdCB0aGUgYWN0dWFsIGJ1ZyB3YXMuCgo+IAo+IFNpZ25lZC1v
ZmYtYnk6IFJvYmVydCBCZWNrZXR0IDxib2IuYmVja2V0dEBjb2xsYWJvcmEuY29tPgo+IC0tLQo+
ICBkcml2ZXJzL2dwdS9kcm0vZHJtX3ZibGFuay5jIHwgMTYgKysrKysrKysrKysrKysrLQo+ICAx
IGZpbGUgY2hhbmdlZCwgMTUgaW5zZXJ0aW9ucygrKSwgMSBkZWxldGlvbigtKQo+IAo+IGRpZmYg
LS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vZHJtX3ZibGFuay5jIGIvZHJpdmVycy9ncHUvZHJtL2Ry
bV92YmxhbmsuYwo+IGluZGV4IDdkYWJiMmJkYjczMy4uZGI2OGI4Y2JmNzk3IDEwMDY0NAo+IC0t
LSBhL2RyaXZlcnMvZ3B1L2RybS9kcm1fdmJsYW5rLmMKPiArKysgYi9kcml2ZXJzL2dwdS9kcm0v
ZHJtX3ZibGFuay5jCj4gQEAgLTM3NSw5ICszNzUsMjMgQEAgdm9pZCBkcm1fdmJsYW5rX2Rpc2Fi
bGVfYW5kX3NhdmUoc3RydWN0IGRybV9kZXZpY2UgKmRldiwgdW5zaWduZWQgaW50IHBpcGUpCj4g
IAkgKiBpbnRlcnJ1cHRzIHdlcmUgZW5hYmxlZC4gVGhpcyBhdm9pZHMgY2FsbGluZyB0aGUgLT5k
aXNhYmxlX3ZibGFuaygpCj4gIAkgKiBvcGVyYXRpb24gaW4gYXRvbWljIGNvbnRleHQgd2l0aCB0
aGUgaGFyZHdhcmUgcG90ZW50aWFsbHkgcnVudGltZQo+ICAJICogc3VzcGVuZGVkLgo+ICsJICog
SWYgaW50ZXJydXB0cyBhcmUgZGlzYWJsZWQgKGUuZy4gdmlhIGJsYW5rX2Rpc2FibGVfZm4pIHRo
ZW4gbWFrZQo+ICsJICogYmVzdCBndWVzcyBhcyB0byB3aGF0IGl0IHdvdWxkIGJlIG5vdyBhbmQg
bWFrZSBzdXJlIHdlIGhhdmUgYW4gdXAKPiArCSAqIHRvIGRhdGUgdGltZXN0YW1wLgo+ICAJICov
Cj4gLQlpZiAoIXZibGFuay0+ZW5hYmxlZCkKPiArCWlmICghdmJsYW5rLT5lbmFibGVkKSB7Cj4g
KwkJa3RpbWVfdCBub3cgPSBrdGltZV9nZXQoKTsKPiArCQl1MzIgZGlmZiA9IDA7Cj4gKwkJaWYg
KHZibGFuay0+ZnJhbWVkdXJfbnMpIHsKPiArCQkJdTY0IGRpZmZfbnMgPSBrdGltZV90b19ucyhr
dGltZV9zdWIobm93LCB2YmxhbmstPnRpbWUpKTsKPiArCQkJZGlmZiA9IERJVl9ST1VORF9DTE9T
RVNUX1VMTChkaWZmX25zLAo+ICsJCQkJCQkgICAgIHZibGFuay0+ZnJhbWVkdXJfbnMpOwo+ICsJ
CX0KPiArCj4gKwkJc3RvcmVfdmJsYW5rKGRldiwgcGlwZSwgZGlmZiwgbm93LCB2YmxhbmstPmNv
dW50KTsKPiArCj4gIAkJZ290byBvdXQ7Cj4gKwl9Cj4gIAo+ICAJLyoKPiAgCSAqIFVwZGF0ZSB0
aGUgY291bnQgYW5kIHRpbWVzdGFtcCB0byBtYWludGFpbiB0aGUKPiAtLSAKPiAyLjE4LjAKPiAK
PiBfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwo+IGRyaS1k
ZXZlbCBtYWlsaW5nIGxpc3QKPiBkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCj4gaHR0
cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwKCi0t
IApWaWxsZSBTeXJqw6Rsw6QKSW50ZWwKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJl
ZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGlu
Zm8vZHJpLWRldmVs
