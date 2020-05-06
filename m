Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FABB1C72A1
	for <lists+dri-devel@lfdr.de>; Wed,  6 May 2020 16:18:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D75536E2E1;
	Wed,  6 May 2020 14:18:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 13E106E2C7;
 Wed,  6 May 2020 14:18:37 +0000 (UTC)
IronPort-SDR: Ymf3ifhYK+AeEjDt8QBp7AXpbm9rOHk5EjpkvltRdA4M3jAmgUMz+Ptle7x64NVf2iM4YC7+jq
 5+Eaa3rwjBXg==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 May 2020 07:18:36 -0700
IronPort-SDR: 2wKKrkMuwNHxr6E7ELbP8IrGbLyzPMSYa5SnpH74IG0AXne5k0IRdJONmlAE12/FnW0CgV3SXu
 3aQWNamGciPw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,359,1583222400"; d="scan'208";a="461451541"
Received: from ramaling-i9x.iind.intel.com (HELO intel.com) ([10.99.66.154])
 by fmsmga005.fm.intel.com with ESMTP; 06 May 2020 07:18:32 -0700
Date: Wed, 6 May 2020 19:48:26 +0530
From: Ramalingam C <ramalingam.c@intel.com>
To: Sean Paul <sean@poorly.run>
Subject: Re: [PATCH v6 03/16] drm/i915: WARN if HDCP signalling is enabled
 upon disable
Message-ID: <20200506141826.GD30925@intel.com>
References: <20200429195502.39919-1-sean@poorly.run>
 <20200429195502.39919-4-sean@poorly.run>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200429195502.39919-4-sean@poorly.run>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.29
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
Cc: dri-devel@lists.freedesktop.org, daniel.vetter@ffwll.ch,
 intel-gfx@lists.freedesktop.org, seanpaul@chromium.org, juston.li@intel.com,
 rodrigo.vivi@intel.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gMjAyMC0wNC0yOSBhdCAxNTo1NDo0OSAtMDQwMCwgU2VhbiBQYXVsIHdyb3RlOgo+IEZyb206
IFNlYW4gUGF1bCA8c2VhbnBhdWxAY2hyb21pdW0ub3JnPgo+IAo+IEhEQ1Agc2lnbmFsbGluZyBz
aG91bGQgbm90IGJlIGxlZnQgb24sIFdBUk4gaWYgaXQgaXMKPiAKPiBDYzogVmlsbGUgU3lyasOk
bMOkIDx2aWxsZS5zeXJqYWxhQGxpbnV4LmludGVsLmNvbT4KPiBDYzogRGFuaWVsIFZldHRlciA8
ZGFuaWVsLnZldHRlckBmZndsbC5jaD4KPiBSZXZpZXdlZC1ieTogUmFtYWxpbmdhbSBDIDxyYW1h
bGluZ2FtLmNAaW50ZWwuY29tPgpKdXN0IHJlY29uZmlybWluZyB0aGUgUi1iLgoKLVJhbQo+IFNp
Z25lZC1vZmYtYnk6IFNlYW4gUGF1bCA8c2VhbnBhdWxAY2hyb21pdW0ub3JnPgo+IExpbms6IGh0
dHBzOi8vcGF0Y2h3b3JrLmZyZWVkZXNrdG9wLm9yZy9wYXRjaC9tc2dpZC8yMDE5MTIxMjE5MDIz
MC4xODg1MDUtNC1zZWFuQHBvb3JseS5ydW4gI3YyCj4gTGluazogaHR0cHM6Ly9wYXRjaHdvcmsu
ZnJlZWRlc2t0b3Aub3JnL3BhdGNoL21zZ2lkLzIwMjAwMTE3MTkzMTAzLjE1NjgyMS00LXNlYW5A
cG9vcmx5LnJ1biAjdjMKPiBMaW5rOiBodHRwczovL3BhdGNod29yay5mcmVlZGVza3RvcC5vcmcv
cGF0Y2gvbXNnaWQvMjAyMDAyMTgyMjAyNDIuMTA3MjY1LTQtc2VhbkBwb29ybHkucnVuICN2NAo+
IExpbms6IGh0dHBzOi8vcGF0Y2h3b3JrLmZyZWVkZXNrdG9wLm9yZy9wYXRjaC9tc2dpZC8yMDIw
MDMwNTIwMTIzNi4xNTIzMDctNC1zZWFuQHBvb3JseS5ydW4gI3Y1Cj4gCj4gQ2hhbmdlcyBpbiB2
MjoKPiAtQWRkZWQgdG8gdGhlIHNldCBpbiBsaWV1IG9mIGp1c3QgY2xlYXJpbmcgdGhlIGJpdAo+
IENoYW5nZXMgaW4gdjM6Cj4gLU5vbmUKPiBDaGFuZ2VzIGluIHY0Ogo+IC1Ob25lCj4gQ2hhbmdl
cyBpbiB2NToKPiAtQ2hhbmdlIFdBUk5fT04gdG8gZHJtX1dBUk5fT04KPiBDaGFuZ2VzIGluIHY2
Ogo+IC1Ob25lCj4gLS0tCj4gIGRyaXZlcnMvZ3B1L2RybS9pOTE1L2Rpc3BsYXkvaW50ZWxfZGRp
LmMgfCAyICsrCj4gIDEgZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKykKPiAKPiBkaWZmIC0t
Z2l0IGEvZHJpdmVycy9ncHUvZHJtL2k5MTUvZGlzcGxheS9pbnRlbF9kZGkuYyBiL2RyaXZlcnMv
Z3B1L2RybS9pOTE1L2Rpc3BsYXkvaW50ZWxfZGRpLmMKPiBpbmRleCA1NjAxNjczYzNmMzAuLjA4
ODQ0YmE5ZGNiNSAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vaTkxNS9kaXNwbGF5L2lu
dGVsX2RkaS5jCj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL2k5MTUvZGlzcGxheS9pbnRlbF9kZGku
Ywo+IEBAIC0xNjYzLDYgKzE2NjMsOCBAQCB2b2lkIGludGVsX2RkaV9kaXNhYmxlX3RyYW5zY29k
ZXJfZnVuYyhjb25zdCBzdHJ1Y3QgaW50ZWxfY3J0Y19zdGF0ZSAqY3J0Y19zdGF0ZQo+ICAKPiAg
CWN0bCA9IGludGVsX2RlX3JlYWQoZGV2X3ByaXYsIFRSQU5TX0RESV9GVU5DX0NUTChjcHVfdHJh
bnNjb2RlcikpOwo+ICAKPiArCWRybV9XQVJOX09OKGNydGMtPmJhc2UuZGV2LCBjdGwgJiBUUkFO
U19ERElfSERDUF9TSUdOQUxMSU5HKTsKPiArCj4gIAljdGwgJj0gflRSQU5TX0RESV9GVU5DX0VO
QUJMRTsKPiAgCj4gIAlpZiAoSVNfR0VOX1JBTkdFKGRldl9wcml2LCA4LCAxMCkpCj4gLS0gCj4g
U2VhbiBQYXVsLCBTb2Z0d2FyZSBFbmdpbmVlciwgR29vZ2xlIC8gQ2hyb21pdW0gT1MKPiAKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1h
aWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMu
ZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==
