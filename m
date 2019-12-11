Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 958E811AC79
	for <lists+dri-devel@lfdr.de>; Wed, 11 Dec 2019 14:53:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B1C036EB57;
	Wed, 11 Dec 2019 13:53:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5EE8F6EB57
 for <dri-devel@lists.freedesktop.org>; Wed, 11 Dec 2019 13:53:15 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga102.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 11 Dec 2019 05:53:14 -0800
X-IronPort-AV: E=Sophos;i="5.69,301,1571727600"; d="scan'208";a="203571236"
Received: from jnikula-mobl3.fi.intel.com (HELO localhost) ([10.237.66.161])
 by orsmga007-auth.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 11 Dec 2019 05:53:12 -0800
From: Jani Nikula <jani.nikula@intel.com>
To: Daniel Vetter <daniel.vetter@ffwll.ch>,
 DRI Development <dri-devel@lists.freedesktop.org>
Subject: Re: [PATCH] drm/gma500: globle no more!
In-Reply-To: <20191211120001.1167980-1-daniel.vetter@ffwll.ch>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20191211120001.1167980-1-daniel.vetter@ffwll.ch>
Date: Wed, 11 Dec 2019 15:53:08 +0200
Message-ID: <87r21b2cl7.fsf@intel.com>
MIME-Version: 1.0
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>,
 Daniel Vetter <daniel.vetter@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gV2VkLCAxMSBEZWMgMjAxOSwgRGFuaWVsIFZldHRlciA8ZGFuaWVsLnZldHRlckBmZndsbC5j
aD4gd3JvdGU6Cj4gZ2xvYmxlLCBnb2JsaW4sIG1vYmxpbj8KPgo+IEl0J3MgZGVhZCBjb2RlLCB3
ZSBsdWNrZWQgb3V0LgoKT2gsIHNhZCB0byBzZWUgaXQgZ28uIFRoZSBvbGRlc3QgcmVmZXJlbmNl
IHRvIGdsb2JsZV9kZXYgSSBjb3VsZCBmaW5kCndhcyBmcm9tIDIwMTEuCgpBY2tlZC1ieTogSmFu
aSBOaWt1bGEgPGphbmkubmlrdWxhQGludGVsLmNvbT4KCj4KPiBDYzogVmlsbGUgU3lyasOkbMOk
IDx2aWxsZS5zeXJqYWxhQGxpbnV4LmludGVsLmNvbT4KPiBDYzogSmFuaSBOaWt1bGEgPGphbmku
bmlrdWxhQGludGVsLmNvbT4KPiBTaWduZWQtb2ZmLWJ5OiBEYW5pZWwgVmV0dGVyIDxkYW5pZWwu
dmV0dGVyQGludGVsLmNvbT4KPiAtLS0KPiAgZHJpdmVycy9ncHUvZHJtL2dtYTUwMC9tZGZsZF9p
bnRlbF9kaXNwbGF5LmMgfCAyMyAtLS0tLS0tLS0tLS0tLS0tLS0tLQo+ICAxIGZpbGUgY2hhbmdl
ZCwgMjMgZGVsZXRpb25zKC0pCj4KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2dtYTUw
MC9tZGZsZF9pbnRlbF9kaXNwbGF5LmMgYi9kcml2ZXJzL2dwdS9kcm0vZ21hNTAwL21kZmxkX2lu
dGVsX2Rpc3BsYXkuYwo+IGluZGV4IGI4YmZiOTYwMDhiOC4uNGZmZjExMGM0OTIxIDEwMDY0NAo+
IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9nbWE1MDAvbWRmbGRfaW50ZWxfZGlzcGxheS5jCj4gKysr
IGIvZHJpdmVycy9ncHUvZHJtL2dtYTUwMC9tZGZsZF9pbnRlbF9kaXNwbGF5LmMKPiBAQCAtMTEz
LDI3ICsxMTMsNiBAQCBzdGF0aWMgaW50IHBzYl9pbnRlbF9wYW5lbF9maXR0ZXJfcGlwZShzdHJ1
Y3QgZHJtX2RldmljZSAqZGV2KQo+ICAJcmV0dXJuIChwZml0X2NvbnRyb2wgPj4gMjkpICYgMHgz
Owo+ICB9Cj4gIAo+IC1zdGF0aWMgc3RydWN0IGRybV9kZXZpY2UgZ2xvYmxlX2RldjsKPiAtCj4g
LXZvaWQgbWRmbGRfX2ludGVsX3BsYW5lX3NldF9hbHBoYShpbnQgZW5hYmxlKQo+IC17Cj4gLQlz
dHJ1Y3QgZHJtX2RldmljZSAqZGV2ID0gJmdsb2JsZV9kZXY7Cj4gLQlpbnQgZHNwY250cl9yZWcg
PSBEU1BBQ05UUjsKPiAtCXUzMiBkc3BjbnRyOwo+IC0KPiAtCWRzcGNudHIgPSBSRUdfUkVBRChk
c3BjbnRyX3JlZyk7Cj4gLQo+IC0JaWYgKGVuYWJsZSkgewo+IC0JCWRzcGNudHIgJj0gfkRJU1BQ
TEFORV8zMkJQUF9OT19BTFBIQTsKPiAtCQlkc3BjbnRyIHw9IERJU1BQTEFORV8zMkJQUDsKPiAt
CX0gZWxzZSB7Cj4gLQkJZHNwY250ciAmPSB+RElTUFBMQU5FXzMyQlBQOwo+IC0JCWRzcGNudHIg
fD0gRElTUFBMQU5FXzMyQlBQX05PX0FMUEhBOwo+IC0JfQo+IC0KPiAtCVJFR19XUklURShkc3Bj
bnRyX3JlZywgZHNwY250cik7Cj4gLX0KPiAtCj4gIHN0YXRpYyBpbnQgY2hlY2tfZmIoc3RydWN0
IGRybV9mcmFtZWJ1ZmZlciAqZmIpCj4gIHsKPiAgCWlmICghZmIpCj4gQEAgLTE2NCw4ICsxNDMs
NiBAQCBzdGF0aWMgaW50IG1kZmxkX19pbnRlbF9waXBlX3NldF9iYXNlKHN0cnVjdCBkcm1fY3J0
YyAqY3J0YywgaW50IHgsIGludCB5LAo+ICAJdTMyIGRzcGNudHI7Cj4gIAlpbnQgcmV0Owo+ICAK
PiAtCW1lbWNweSgmZ2xvYmxlX2RldiwgZGV2LCBzaXplb2Yoc3RydWN0IGRybV9kZXZpY2UpKTsK
PiAtCj4gIAlkZXZfZGJnKGRldi0+ZGV2LCAicGlwZSA9IDB4JXguXG4iLCBwaXBlKTsKPiAgCj4g
IAkvKiBubyBmYiBib3VuZCAqLwoKLS0gCkphbmkgTmlrdWxhLCBJbnRlbCBPcGVuIFNvdXJjZSBH
cmFwaGljcyBDZW50ZXIKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Au
b3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRl
dmVsCg==
