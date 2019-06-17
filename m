Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E165C4895C
	for <lists+dri-devel@lfdr.de>; Mon, 17 Jun 2019 18:54:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D229D892C8;
	Mon, 17 Jun 2019 16:54:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp.domeneshop.no (smtp.domeneshop.no
 [IPv6:2a01:5b40:0:3005::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 15BB4892C8;
 Mon, 17 Jun 2019 16:54:13 +0000 (UTC)
Received: from 211.81-166-168.customer.lyse.net ([81.166.168.211]:50550
 helo=[192.168.10.173])
 by smtp.domeneshop.no with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.84_2) (envelope-from <noralf@tronnes.org>)
 id 1hcutX-0004bi-1z; Mon, 17 Jun 2019 18:54:11 +0200
Subject: Re: [PATCH 01/59] drm/todo: Improve drm_gem_object funcs todo
To: Daniel Vetter <daniel@ffwll.ch>
References: <20190614203615.12639-1-daniel.vetter@ffwll.ch>
 <20190614203615.12639-2-daniel.vetter@ffwll.ch>
 <f326e4e2-2cc3-6e90-f9d3-96b5c8c8b070@tronnes.org>
 <20190617162951.GJ12905@phenom.ffwll.local>
From: =?UTF-8?Q?Noralf_Tr=c3=b8nnes?= <noralf@tronnes.org>
Message-ID: <fd97eea4-32cd-81a4-6b3e-076a1d524a4a@tronnes.org>
Date: Mon, 17 Jun 2019 18:54:04 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <20190617162951.GJ12905@phenom.ffwll.local>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt;
 c=relaxed/relaxed; d=tronnes.org; s=ds201810; 
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:Subject;
 bh=bQe9hWz4zkSMXbONvSr1U9lvI+2SNaLA89PCY+bTrVE=; 
 b=kO5kEltBnoV3hW9nrASuJ5N60PVtGdiUdBJ3bxHQnBDYcZw5/iIWWugE1ADu0faJ24X7nk0frRZFnXAoqpDOorsG+d+U010K2JAfDgToGnA97Y59/fIeUMfxFly/VR238/fbcZVNeDEnobMRFpKiis7GXoaimBlP52ELB9deIpUBiiVd8Op7IbkfSQrjnCh1+Nz/OR1cSfUH0bP7PTAsHc9wCRm/ETNtsBHE0LHJSp4epYW56h+iLNfzbQyCzBcaVRwuDyecutLojBmO7ba+e2b6fFKq4KCacFPrVVOQ0SlhZjbn4NgcxwOkk2Zkgp9GwSJLtTzN16NQT483GA/QMg==;
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Gerd Hoffmann <kraxel@redhat.com>, Thomas Zimmermann <tzimmermann@suse.de>,
 Daniel Vetter <daniel.vetter@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

CgpEZW4gMTcuMDYuMjAxOSAxOC4yOSwgc2tyZXYgRGFuaWVsIFZldHRlcjoKPiBPbiBNb24sIEp1
biAxNywgMjAxOSBhdCAwNTo0Nzo1MFBNICswMjAwLCBOb3JhbGYgVHLDuG5uZXMgd3JvdGU6Cj4+
Cj4+Cj4+IERlbiAxNC4wNi4yMDE5IDIyLjM1LCBza3JldiBEYW5pZWwgVmV0dGVyOgo+Pj4gV2Un
cmUga2luZGEgZ29pbmcgaW4gdGhlIHdyb25nIGRpcmVjdGlvbi4gU3BvdHRlZCB3aGlsZSB0eXBp
bmcgYmV0dGVyCj4+PiBnZW0vcHJpbWUgZG9jcy4KPj4+Cj4+PiBDYzogVGhvbWFzIFppbW1lcm1h
bm4gPHR6aW1tZXJtYW5uQHN1c2UuZGU+Cj4+PiBDYzogR2VyZCBIb2ZmbWFubiA8a3JheGVsQHJl
ZGhhdC5jb20+Cj4+PiBDYzogUm9iIEhlcnJpbmcgPHJvYmhAa2VybmVsLm9yZz4KPj4+IENjOiBO
b3JhbGYgVHLDuG5uZXMgPG5vcmFsZkB0cm9ubmVzLm9yZz4KPj4+IFNpZ25lZC1vZmYtYnk6IERh
bmllbCBWZXR0ZXIgPGRhbmllbC52ZXR0ZXJAaW50ZWwuY29tPgo+Pj4gLS0tCj4+PiAgRG9jdW1l
bnRhdGlvbi9ncHUvdG9kby5yc3QgfCA0ICsrKysKPj4+ICAxIGZpbGUgY2hhbmdlZCwgNCBpbnNl
cnRpb25zKCspCj4+Pgo+Pj4gZGlmZiAtLWdpdCBhL0RvY3VtZW50YXRpb24vZ3B1L3RvZG8ucnN0
IGIvRG9jdW1lbnRhdGlvbi9ncHUvdG9kby5yc3QKPj4+IGluZGV4IGI0YTc2YzI3MDNlNS4uMjM1
ODNmMGUzNzU1IDEwMDY0NAo+Pj4gLS0tIGEvRG9jdW1lbnRhdGlvbi9ncHUvdG9kby5yc3QKPj4+
ICsrKyBiL0RvY3VtZW50YXRpb24vZ3B1L3RvZG8ucnN0Cj4+PiBAQCAtMjI4LDYgKzIyOCwxMCBA
QCBzdHJ1Y3QgZHJtX2dlbV9vYmplY3RfZnVuY3MKPj4+ICBHRU0gb2JqZWN0cyBjYW4gbm93IGhh
dmUgYSBmdW5jdGlvbiB0YWJsZSBpbnN0ZWFkIG9mIGhhdmluZyB0aGUgY2FsbGJhY2tzIG9uIHRo
ZQo+Pj4gIERSTSBkcml2ZXIgc3RydWN0LiBUaGlzIGlzIG5vdyB0aGUgcHJlZmVycmVkIHdheSBh
bmQgZHJpdmVycyBjYW4gYmUgbW92ZWQgb3Zlci4KPj4+ICAKPj4+ICtVbmZvcnR1bmF0ZWx5IHNv
bWUgb2YgdGhlIHJlY2VudGx5IGFkZGVkIEdFTSBoZWxwZXJzIGFyZSBnb2luZyBpbiB0aGUgd3Jv
bmcKPj4+ICtkaXJlY3Rpb24gYnkgYWRkaW5nIE9QUyBtYWNyb3MgdGhhdCB1c2UgdGhlIG9sZCwg
ZGVwcmVjYXRlZCBob29rcy4gU2VlCj4+PiArRFJNX0dFTV9DTUFfVk1BUF9EUklWRVJfT1BTLCBE
Uk1fR0VNX1NITUVNX0RSSVZFUl9PUFMsIGFuZCBEUk1fR0VNX1ZSQU1fRFJJVkVSX1BSSU1FLgo+
Pj4gKwo+Pgo+PiBCb3RoIERSTV9HRU1fQ01BX1ZNQVBfRFJJVkVSX09QUyBhbmQgRFJNX0dFTV9T
SE1FTV9EUklWRVJfT1BTIHVzZSB0aGUKPj4gR0VNIHZ0YWJsZS4gT3IgYW0gSSBtaXNzaW5nIHNv
bWV0aGluZyBoZXJlPwo+IAo+IGdlbSB2dGFibGUgSSBtZWFuIGRybV9nZW1fb2JqZWN0X2Z1bmNz
LiBXaGljaCB0aGVzZSBtYWNyb3MgZGVmaW5pdGVseQo+IGFyZW4ndCB1c2VmdWwgZm9yLgoKI2Rl
ZmluZSBEUk1fR0VNX0NNQV9WTUFQX0RSSVZFUl9PUFMgXAoJLmdlbV9jcmVhdGVfb2JqZWN0CT0g
ZHJtX2NtYV9nZW1fY3JlYXRlX29iamVjdF9kZWZhdWx0X2Z1bmNzLCBcCgkuZHVtYl9jcmVhdGUJ
CT0gZHJtX2dlbV9jbWFfZHVtYl9jcmVhdGUsIFwKCS5wcmltZV9oYW5kbGVfdG9fZmQJPSBkcm1f
Z2VtX3ByaW1lX2hhbmRsZV90b19mZCwgXAoJLnByaW1lX2ZkX3RvX2hhbmRsZQk9IGRybV9nZW1f
cHJpbWVfZmRfdG9faGFuZGxlLCBcCgkuZ2VtX3ByaW1lX2ltcG9ydF9zZ190YWJsZSA9IGRybV9n
ZW1fY21hX3ByaW1lX2ltcG9ydF9zZ190YWJsZV92bWFwLCBcCgkuZ2VtX3ByaW1lX21tYXAJCT0g
ZHJtX2dlbV9wcmltZV9tbWFwCgpfX2RybV9nZW1fY21hX2NyZWF0ZSgpIGNhbGxzIC0+Z2VtX2Ny
ZWF0ZV9vYmplY3QuCgpkcm1fY21hX2dlbV9jcmVhdGVfb2JqZWN0X2RlZmF1bHRfZnVuY3MoKSBz
ZXRzOgoJY21hX29iai0+YmFzZS5mdW5jcyA9ICZkcm1fY21hX2dlbV9kZWZhdWx0X2Z1bmNzOwoK
c3RhdGljIGNvbnN0IHN0cnVjdCBkcm1fZ2VtX29iamVjdF9mdW5jcyBkcm1fY21hX2dlbV9kZWZh
dWx0X2Z1bmNzID0gewoJLmZyZWUgPSBkcm1fZ2VtX2NtYV9mcmVlX29iamVjdCwKCS5wcmludF9p
bmZvID0gZHJtX2dlbV9jbWFfcHJpbnRfaW5mbywKCS5nZXRfc2dfdGFibGUgPSBkcm1fZ2VtX2Nt
YV9wcmltZV9nZXRfc2dfdGFibGUsCgkudm1hcCA9IGRybV9nZW1fY21hX3ByaW1lX3ZtYXAsCgku
dm1fb3BzID0gJmRybV9nZW1fY21hX3ZtX29wcywKfTsKClRoZSBHRU0gU0hNRU0gaGVscGVyIHdh
cyBtYWRlIGFmdGVyIGRybV9nZW1fb2JqZWN0X2Z1bmNzIGNhbWUgYWJvdXQgc28KaXQgc2V0cyB0
aGUgZGVmYXVsdCB2dGFibGUgaW4gZHJtX2dlbV9zaG1lbV9jcmVhdGUoKToKCQlvYmotPmZ1bmNz
ID0gJmRybV9nZW1fc2htZW1fZnVuY3M7CgpzdGF0aWMgY29uc3Qgc3RydWN0IGRybV9nZW1fb2Jq
ZWN0X2Z1bmNzIGRybV9nZW1fc2htZW1fZnVuY3MgPSB7CgkuZnJlZSA9IGRybV9nZW1fc2htZW1f
ZnJlZV9vYmplY3QsCgkucHJpbnRfaW5mbyA9IGRybV9nZW1fc2htZW1fcHJpbnRfaW5mbywKCS5w
aW4gPSBkcm1fZ2VtX3NobWVtX3BpbiwKCS51bnBpbiA9IGRybV9nZW1fc2htZW1fdW5waW4sCgku
Z2V0X3NnX3RhYmxlID0gZHJtX2dlbV9zaG1lbV9nZXRfc2dfdGFibGUsCgkudm1hcCA9IGRybV9n
ZW1fc2htZW1fdm1hcCwKCS52dW5tYXAgPSBkcm1fZ2VtX3NobWVtX3Z1bm1hcCwKCS52bV9vcHMg
PSAmZHJtX2dlbV9zaG1lbV92bV9vcHMsCn07CgojZGVmaW5lIERSTV9HRU1fU0hNRU1fRFJJVkVS
X09QUyBcCgkucHJpbWVfaGFuZGxlX3RvX2ZkCT0gZHJtX2dlbV9wcmltZV9oYW5kbGVfdG9fZmQs
IFwKCS5wcmltZV9mZF90b19oYW5kbGUJPSBkcm1fZ2VtX3ByaW1lX2ZkX3RvX2hhbmRsZSwgXAoJ
LmdlbV9wcmltZV9pbXBvcnRfc2dfdGFibGUgPSBkcm1fZ2VtX3NobWVtX3ByaW1lX2ltcG9ydF9z
Z190YWJsZSwgXAoJLmdlbV9wcmltZV9tbWFwCQk9IGRybV9nZW1fcHJpbWVfbW1hcCwgXAoJLmR1
bWJfY3JlYXRlCQk9IGRybV9nZW1fc2htZW1fZHVtYl9jcmVhdGUKClNvIHRoZSB0d28gZHJpdmVy
IG9wcyBtYWNyb2VzIG9ubHkgc2V0IHRoZSBuZWNlc3NhcnkgYml0cyB0byBlbmFibGUKcHJpbWUg
aW1wb3J0L2V4cG9ydC9tbWFwIGFuZCBkdW1iIGJ1ZmZlciBjcmVhdGlvbiwgbGVhdmluZyB0aGUg
cmVzdCB0bwpkcm1fZ2VtX29iamVjdF9mdW5jcy4KSGF2ZSB3ZSBkZXByZWNhdGVkIGFueSBvZiB0
aGVzZSBob29rcz8KCk5vcmFsZi4KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRl
c2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8v
ZHJpLWRldmVs
