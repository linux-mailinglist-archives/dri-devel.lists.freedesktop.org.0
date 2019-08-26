Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EE6F79CF02
	for <lists+dri-devel@lfdr.de>; Mon, 26 Aug 2019 14:08:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DE8FD89CC4;
	Mon, 26 Aug 2019 12:08:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6311C89CC4;
 Mon, 26 Aug 2019 12:08:23 +0000 (UTC)
X-Amp-Result: UNSCANNABLE
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga103.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 26 Aug 2019 05:08:22 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,433,1559545200"; d="scan'208";a="174188415"
Received: from stinkbox.fi.intel.com (HELO stinkbox) ([10.237.72.174])
 by orsmga008.jf.intel.com with SMTP; 26 Aug 2019 05:08:17 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Mon, 26 Aug 2019 15:08:16 +0300
Date: Mon, 26 Aug 2019 15:08:16 +0300
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Dariusz Marcinkiewicz <darekm@google.com>
Subject: Re: [PATCH v7 2/9] drm/i915/intel_hdmi: use
 cec_notifier_conn_(un)register
Message-ID: <20190826120816.GX5942@intel.com>
References: <20190814104520.6001-1-darekm@google.com>
 <20190814104520.6001-3-darekm@google.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190814104520.6001-3-darekm@google.com>
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
Cc: David Airlie <airlied@linux.ie>, intel-gfx@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, hverkuil-cisco@xs4all.nl,
 linux-media@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gV2VkLCBBdWcgMTQsIDIwMTkgYXQgMTI6NDU6MDBQTSArMDIwMCwgRGFyaXVzeiBNYXJjaW5r
aWV3aWN6IHdyb3RlOgo+IFVzZSB0aGUgbmV3IGNlY19ub3RpZmllcl9jb25uXyh1bilyZWdpc3Rl
cigpIGZ1bmN0aW9ucyB0bwo+ICh1bilyZWdpc3RlciB0aGUgbm90aWZpZXIgZm9yIHRoZSBIRE1J
IGNvbm5lY3RvciwgYW5kIGZpbGwgaW4KPiB0aGUgY2VjX2Nvbm5lY3Rvcl9pbmZvLgo+IAo+IFNp
Z25lZC1vZmYtYnk6IERhcml1c3ogTWFyY2lua2lld2ljeiA8ZGFyZWttQGdvb2dsZS5jb20+Cj4g
U2lnbmVkLW9mZi1ieTogSGFucyBWZXJrdWlsIDxodmVya3VpbC1jaXNjb0B4czRhbGwubmw+Cj4g
VGVzdGVkLWJ5OiBIYW5zIFZlcmt1aWwgPGh2ZXJrdWlsLWNpc2NvQHhzNGFsbC5ubD4KClJldmll
d2VkLWJ5OiBWaWxsZSBTeXJqw6Rsw6QgPHZpbGxlLnN5cmphbGFAbGludXguaW50ZWwuY29tPgoK
PiAtLS0KPiAgZHJpdmVycy9ncHUvZHJtL2k5MTUvZGlzcGxheS9pbnRlbF9oZG1pLmMgfCAxMyAr
KysrKysrKystLS0tCj4gIDEgZmlsZSBjaGFuZ2VkLCA5IGluc2VydGlvbnMoKyksIDQgZGVsZXRp
b25zKC0pCj4gCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2Rpc3BsYXkvaW50
ZWxfaGRtaS5jIGIvZHJpdmVycy9ncHUvZHJtL2k5MTUvZGlzcGxheS9pbnRlbF9oZG1pLmMKPiBp
bmRleCBiMWNhOGU1YmRiNTZkLi45ZmNmMmM1OGMyOWM1IDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMv
Z3B1L2RybS9pOTE1L2Rpc3BsYXkvaW50ZWxfaGRtaS5jCj4gKysrIGIvZHJpdmVycy9ncHUvZHJt
L2k5MTUvZGlzcGxheS9pbnRlbF9oZG1pLmMKPiBAQCAtMjc1Miw4ICsyNzUyLDkgQEAgaW50ZWxf
aGRtaV9jb25uZWN0b3JfcmVnaXN0ZXIoc3RydWN0IGRybV9jb25uZWN0b3IgKmNvbm5lY3RvcikK
PiAgCj4gIHN0YXRpYyB2b2lkIGludGVsX2hkbWlfZGVzdHJveShzdHJ1Y3QgZHJtX2Nvbm5lY3Rv
ciAqY29ubmVjdG9yKQo+ICB7Cj4gLQlpZiAoaW50ZWxfYXR0YWNoZWRfaGRtaShjb25uZWN0b3Ip
LT5jZWNfbm90aWZpZXIpCj4gLQkJY2VjX25vdGlmaWVyX3B1dChpbnRlbF9hdHRhY2hlZF9oZG1p
KGNvbm5lY3RvciktPmNlY19ub3RpZmllcik7Cj4gKwlzdHJ1Y3QgY2VjX25vdGlmaWVyICpuID0g
aW50ZWxfYXR0YWNoZWRfaGRtaShjb25uZWN0b3IpLT5jZWNfbm90aWZpZXI7Cj4gKwo+ICsJY2Vj
X25vdGlmaWVyX2Nvbm5fdW5yZWdpc3RlcihuKTsKPiAgCj4gIAlpbnRlbF9jb25uZWN0b3JfZGVz
dHJveShjb25uZWN0b3IpOwo+ICB9Cj4gQEAgLTMwNjgsNiArMzA2OSw3IEBAIHZvaWQgaW50ZWxf
aGRtaV9pbml0X2Nvbm5lY3RvcihzdHJ1Y3QgaW50ZWxfZGlnaXRhbF9wb3J0ICppbnRlbF9kaWdf
cG9ydCwKPiAgCXN0cnVjdCBkcm1fZGV2aWNlICpkZXYgPSBpbnRlbF9lbmNvZGVyLT5iYXNlLmRl
djsKPiAgCXN0cnVjdCBkcm1faTkxNV9wcml2YXRlICpkZXZfcHJpdiA9IHRvX2k5MTUoZGV2KTsK
PiAgCWVudW0gcG9ydCBwb3J0ID0gaW50ZWxfZW5jb2Rlci0+cG9ydDsKPiArCXN0cnVjdCBjZWNf
Y29ubmVjdG9yX2luZm8gY29ubl9pbmZvOwo+ICAKPiAgCURSTV9ERUJVR19LTVMoIkFkZGluZyBI
RE1JIGNvbm5lY3RvciBvbiBwb3J0ICVjXG4iLAo+ICAJCSAgICAgIHBvcnRfbmFtZShwb3J0KSk7
Cj4gQEAgLTMxMjAsOCArMzEyMiwxMSBAQCB2b2lkIGludGVsX2hkbWlfaW5pdF9jb25uZWN0b3Io
c3RydWN0IGludGVsX2RpZ2l0YWxfcG9ydCAqaW50ZWxfZGlnX3BvcnQsCj4gIAkJSTkxNV9XUklU
RShQRUdfQkFORF9HQVBfREFUQSwgKHRlbXAgJiB+MHhmKSB8IDB4ZCk7Cj4gIAl9Cj4gIAo+IC0J
aW50ZWxfaGRtaS0+Y2VjX25vdGlmaWVyID0gY2VjX25vdGlmaWVyX2dldF9jb25uKGRldi0+ZGV2
LAo+IC0JCQkJCQkJIHBvcnRfaWRlbnRpZmllcihwb3J0KSk7Cj4gKwljZWNfZmlsbF9jb25uX2lu
Zm9fZnJvbV9kcm0oJmNvbm5faW5mbywgY29ubmVjdG9yKTsKPiArCj4gKwlpbnRlbF9oZG1pLT5j
ZWNfbm90aWZpZXIgPQo+ICsJCWNlY19ub3RpZmllcl9jb25uX3JlZ2lzdGVyKGRldi0+ZGV2LCBw
b3J0X2lkZW50aWZpZXIocG9ydCksCj4gKwkJCQkJICAgJmNvbm5faW5mbyk7Cj4gIAlpZiAoIWlu
dGVsX2hkbWktPmNlY19ub3RpZmllcikKPiAgCQlEUk1fREVCVUdfS01TKCJDRUMgbm90aWZpZXIg
Z2V0IGZhaWxlZFxuIik7Cj4gIH0KPiAtLSAKPiAyLjIzLjAucmMxLjE1My5nZGVlZDgwMzMwZi1n
b29nCgotLSAKVmlsbGUgU3lyasOkbMOkCkludGVsCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxp
c3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFu
L2xpc3RpbmZvL2RyaS1kZXZlbA==
