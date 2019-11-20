Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 956F6103757
	for <lists+dri-devel@lfdr.de>; Wed, 20 Nov 2019 11:21:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4D0776E18F;
	Wed, 20 Nov 2019 10:21:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2DD3E6E18F
 for <dri-devel@lists.freedesktop.org>; Wed, 20 Nov 2019 10:21:06 +0000 (UTC)
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmsmga101.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 20 Nov 2019 02:21:06 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.69,221,1571727600"; d="scan'208";a="215747961"
Received: from stinkbox.fi.intel.com (HELO stinkbox) ([10.237.72.174])
 by fmsmga001.fm.intel.com with SMTP; 20 Nov 2019 02:21:03 -0800
Received: by stinkbox (sSMTP sendmail emulation);
 Wed, 20 Nov 2019 12:21:03 +0200
Date: Wed, 20 Nov 2019 12:21:03 +0200
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
Subject: Re: [PATCH] drm/crc-debugfs: fix crtc_crc_poll()'s return type
Message-ID: <20191120102103.GD1208@intel.com>
References: <20191120000754.30710-1-luc.vanoostenryck@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191120000754.30710-1-luc.vanoostenryck@gmail.com>
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
Cc: David Airlie <airlied@linux.ie>, Sean Paul <sean@poorly.run>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gV2VkLCBOb3YgMjAsIDIwMTkgYXQgMDE6MDc6NTRBTSArMDEwMCwgTHVjIFZhbiBPb3N0ZW5y
eWNrIHdyb3RlOgo+IGNydGNfY3JjX3BvbGwoKSBpcyBkZWZpbmVkIGFzIHJldHVybmluZyAndW5z
aWduZWQgaW50JyBidXQgdGhlCj4gLnBvbGwgbWV0aG9kIGlzIGRlY2xhcmVkIGFzIHJldHVybmlu
ZyAnX19wb2xsX3QnLCBhIGJpdHdpc2UgdHlwZS4KPiAKPiBGaXggdGhpcyBieSB1c2luZyB0aGUg
cHJvcGVyIHJldHVybiB0eXBlIGFuZCB1c2luZyB0aGUgRVBPTEwKPiBjb25zdGFudHMgaW5zdGVh
ZCBvZiB0aGUgUE9MTCBvbmVzLCBhcyByZXF1aXJlZCBmb3IgX19wb2xsX3QuCgpBbHJlYWR5IGZp
eGVkLiAxYWIyYTk5ZWRiMzcgKCJkcm06IEZpeCByZXR1cm4gdHlwZSBvZiBjcmMgLnBvbGwoKSIp
Cgo+IAo+IENDOiBNYWFydGVuIExhbmtob3JzdCA8bWFhcnRlbi5sYW5raG9yc3RAbGludXguaW50
ZWwuY29tPgo+IENDOiBNYXhpbWUgUmlwYXJkIDxtcmlwYXJkQGtlcm5lbC5vcmc+Cj4gQ0M6IFNl
YW4gUGF1bCA8c2VhbkBwb29ybHkucnVuPgo+IENDOiBEYXZpZCBBaXJsaWUgPGFpcmxpZWRAbGlu
dXguaWU+Cj4gQ0M6IERhbmllbCBWZXR0ZXIgPGRhbmllbEBmZndsbC5jaD4KPiBDQzogZHJpLWRl
dmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwo+IFNpZ25lZC1vZmYtYnk6IEx1YyBWYW4gT29zdGVu
cnljayA8bHVjLnZhbm9vc3RlbnJ5Y2tAZ21haWwuY29tPgo+IC0tLQo+ICBkcml2ZXJzL2dwdS9k
cm0vZHJtX2RlYnVnZnNfY3JjLmMgfCA2ICsrKy0tLQo+ICAxIGZpbGUgY2hhbmdlZCwgMyBpbnNl
cnRpb25zKCspLCAzIGRlbGV0aW9ucygtKQo+IAo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9k
cm0vZHJtX2RlYnVnZnNfY3JjLmMgYi9kcml2ZXJzL2dwdS9kcm0vZHJtX2RlYnVnZnNfY3JjLmMK
PiBpbmRleCBiZTFiN2JhOTJmZmUuLjBiYjBhYTBlYmJjYSAxMDA2NDQKPiAtLS0gYS9kcml2ZXJz
L2dwdS9kcm0vZHJtX2RlYnVnZnNfY3JjLmMKPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vZHJtX2Rl
YnVnZnNfY3JjLmMKPiBAQCAtMzM0LDE3ICszMzQsMTcgQEAgc3RhdGljIHNzaXplX3QgY3J0Y19j
cmNfcmVhZChzdHJ1Y3QgZmlsZSAqZmlsZXAsIGNoYXIgX191c2VyICp1c2VyX2J1ZiwKPiAgCXJl
dHVybiBMSU5FX0xFTihjcmMtPnZhbHVlc19jbnQpOwo+ICB9Cj4gIAo+IC1zdGF0aWMgdW5zaWdu
ZWQgaW50IGNydGNfY3JjX3BvbGwoc3RydWN0IGZpbGUgKmZpbGUsIHBvbGxfdGFibGUgKndhaXQp
Cj4gK3N0YXRpYyBfX3BvbGxfdCBjcnRjX2NyY19wb2xsKHN0cnVjdCBmaWxlICpmaWxlLCBwb2xs
X3RhYmxlICp3YWl0KQo+ICB7Cj4gIAlzdHJ1Y3QgZHJtX2NydGMgKmNydGMgPSBmaWxlLT5mX2lu
b2RlLT5pX3ByaXZhdGU7Cj4gIAlzdHJ1Y3QgZHJtX2NydGNfY3JjICpjcmMgPSAmY3J0Yy0+Y3Jj
Owo+IC0JdW5zaWduZWQgcmV0Owo+ICsJX19wb2xsX3QgcmV0Owo+ICAKPiAgCXBvbGxfd2FpdChm
aWxlLCAmY3JjLT53cSwgd2FpdCk7Cj4gIAo+ICAJc3Bpbl9sb2NrX2lycSgmY3JjLT5sb2NrKTsK
PiAgCWlmIChjcmMtPnNvdXJjZSAmJiBjcnRjX2NyY19kYXRhX2NvdW50KGNyYykpCj4gLQkJcmV0
ID0gUE9MTElOIHwgUE9MTFJETk9STTsKPiArCQlyZXQgPSBFUE9MTElOIHwgRVBPTExSRE5PUk07
Cj4gIAllbHNlCj4gIAkJcmV0ID0gMDsKPiAgCXNwaW5fdW5sb2NrX2lycSgmY3JjLT5sb2NrKTsK
PiAtLSAKPiAyLjI0LjAKPiAKPiBfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwo+IGRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKPiBkcmktZGV2ZWxAbGlzdHMuZnJl
ZWRlc2t0b3Aub3JnCj4gaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0
aW5mby9kcmktZGV2ZWwKCi0tIApWaWxsZSBTeXJqw6Rsw6QKSW50ZWwKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApk
cmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Au
b3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
