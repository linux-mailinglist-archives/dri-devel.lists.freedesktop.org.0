Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EBB52C33A0
	for <lists+dri-devel@lfdr.de>; Tue,  1 Oct 2019 14:01:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A10B36E5E1;
	Tue,  1 Oct 2019 12:01:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B47B96E4FB;
 Tue,  1 Oct 2019 12:01:06 +0000 (UTC)
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga105.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 01 Oct 2019 05:01:06 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,571,1559545200"; d="scan'208";a="195623866"
Received: from stinkbox.fi.intel.com (HELO stinkbox) ([10.237.72.174])
 by orsmga006.jf.intel.com with SMTP; 01 Oct 2019 05:01:02 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Tue, 01 Oct 2019 15:01:02 +0300
Date: Tue, 1 Oct 2019 15:01:02 +0300
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: srinivasan.s@intel.com
Subject: Re: [PATCH] drm/i915/dp: Fix DP MST error after unplugging TypeC cable
Message-ID: <20191001120102.GF1208@intel.com>
References: <1569371742-109402-1-git-send-email-srinivasan.s@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1569371742-109402-1-git-send-email-srinivasan.s@intel.com>
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
Cc: manasi.d.navare@intel.com, intel-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, lakshminarayana.vudum@intel.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gV2VkLCBTZXAgMjUsIDIwMTkgYXQgMDY6MDU6NDJBTSArMDUzMCwgc3Jpbml2YXNhbi5zQGlu
dGVsLmNvbSB3cm90ZToKPiBGcm9tOiBTcmluaXZhc2FuIFMgPHNyaW5pdmFzYW4uc0BpbnRlbC5j
b20+Cj4gCj4gVGhpcyBwYXRjaCBhdm9pZHMgRFAgTVNUIHBheWxvYWQgZXJyb3IgbWVzc2FnZSBp
biBkbWVzZywgYXMgaXQgaXMgdHJ5aW5nCj4gdG8gdXBkYXRlIHRoZSBwYXlsb2FkIHRvIHRoZSBk
aXNjb25uZWN0ZWQgRFAgTVNUIGRldmljZS4gQWZ0ZXIgRFAgTVNUCj4gZGV2aWNlIGlzIGRpc2Nv
bm5lY3RlZCB3ZSBzaG91bGQgbm90IGJlIHVwZGF0aW5nIHRoZSBwYXlsb2FkIGFuZAo+IGhlbmNl
IHJlbW92ZSB0aGUgZXJyb3IuCj4gCj4gdjI6IFJlbW92ZWQgdGhlIGNvbm5lY3RvciBzdGF0dXMg
Y2hlY2sgYW5kIGNvbnZlcnRlZCBmcm9tIGVycm9yIHRvIGRlYnVnLgo+IAo+IEJ1Z3ppbGxhOiBo
dHRwczovL2J1Z3MuZnJlZWRlc2t0b3Aub3JnL3Nob3dfYnVnLmNnaT9pZD0xMTE2MzIKPiBTaWdu
ZWQtb2ZmLWJ5OiBTcmluaXZhc2FuIFMgPHNyaW5pdmFzYW4uc0BpbnRlbC5jb20+CgpQdXNoZWQg
dG8gZGlucS4gVGhhbmtzIGZvciB0aGUgcGF0Y2guCgpQUy4gTmV4dCB0aW1lIHBsZWFzZSB1c2Ug
LS1pbi1yZXBseS10byB3aGVuIHNlbmRpbmcgYW4gdXBkYXRlZCBwYXRjaApzbyB0aGF0IGl0J3Mg
ZWFzaWVyIHRvIGtlZXAgdHJhY2sgb2YgdGhlIGRpc2N1c3Npb24uCgo+IC0tLQo+ICBkcml2ZXJz
L2dwdS9kcm0vaTkxNS9kaXNwbGF5L2ludGVsX2RwX21zdC5jIHwgMiArLQo+ICAxIGZpbGUgY2hh
bmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKPiAKPiBkaWZmIC0tZ2l0IGEvZHJp
dmVycy9ncHUvZHJtL2k5MTUvZGlzcGxheS9pbnRlbF9kcF9tc3QuYyBiL2RyaXZlcnMvZ3B1L2Ry
bS9pOTE1L2Rpc3BsYXkvaW50ZWxfZHBfbXN0LmMKPiBpbmRleCBlZWViM2Y5MzNhYTQuLjQ5N2E2
YWUwZDJjMCAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vaTkxNS9kaXNwbGF5L2ludGVs
X2RwX21zdC5jCj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL2k5MTUvZGlzcGxheS9pbnRlbF9kcF9t
c3QuYwo+IEBAIC0yMTUsNyArMjE1LDcgQEAgc3RhdGljIHZvaWQgaW50ZWxfbXN0X2Rpc2FibGVf
ZHAoc3RydWN0IGludGVsX2VuY29kZXIgKmVuY29kZXIsCj4gIAo+ICAJcmV0ID0gZHJtX2RwX3Vw
ZGF0ZV9wYXlsb2FkX3BhcnQxKCZpbnRlbF9kcC0+bXN0X21ncik7Cj4gIAlpZiAocmV0KSB7Cj4g
LQkJRFJNX0VSUk9SKCJmYWlsZWQgdG8gdXBkYXRlIHBheWxvYWQgJWRcbiIsIHJldCk7Cj4gKwkJ
RFJNX0RFQlVHX0tNUygiZmFpbGVkIHRvIHVwZGF0ZSBwYXlsb2FkICVkXG4iLCByZXQpOwo+ICAJ
fQo+ICAJaWYgKG9sZF9jcnRjX3N0YXRlLT5oYXNfYXVkaW8pCj4gIAkJaW50ZWxfYXVkaW9fY29k
ZWNfZGlzYWJsZShlbmNvZGVyLAo+IC0tIAo+IDIuNy40CgotLSAKVmlsbGUgU3lyasOkbMOkCklu
dGVsCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1k
ZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczov
L2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
