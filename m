Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 350FFF071C
	for <lists+dri-devel@lfdr.de>; Tue,  5 Nov 2019 21:38:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 710406E2EA;
	Tue,  5 Nov 2019 20:38:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fireflyinternet.com (mail.fireflyinternet.com [109.228.58.192])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 067CC6E2EA;
 Tue,  5 Nov 2019 20:38:16 +0000 (UTC)
X-Default-Received-SPF: pass (skip=forwardok (res=PASS))
 x-ip-name=78.156.65.138; 
Received: from localhost (unverified [78.156.65.138]) 
 by fireflyinternet.com (Firefly Internet (M1)) with ESMTP (TLS) id
 19094375-1500050 for multiple; Tue, 05 Nov 2019 20:38:04 +0000
MIME-Version: 1.0
To: DRI Development <dri-devel@lists.freedesktop.org>,
 Daniel Vetter <daniel.vetter@ffwll.ch>
From: Chris Wilson <chris@chris-wilson.co.uk>
In-Reply-To: <20191105193829.11599-1-daniel.vetter@ffwll.ch>
References: <20191105193829.11599-1-daniel.vetter@ffwll.ch>
Message-ID: <157298628160.18566.1185169568557179711@skylake-alporthouse-com>
User-Agent: alot/0.6
Subject: Re: [Intel-gfx] [PATCH] drm/i915: Don't select BROKEN
Date: Tue, 05 Nov 2019 20:38:01 +0000
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
Cc: Daniel Vetter <daniel.vetter@intel.com>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 Stephen Rothwell <sfr@canb.auug.org.au>,
 Daniel Vetter <daniel.vetter@ffwll.ch>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

UXVvdGluZyBEYW5pZWwgVmV0dGVyICgyMDE5LTExLTA1IDE5OjM4OjI5KQo+IEl0J3MgYnJva2Vu
Lgo+IAo+IFJlcG9ydGVkLWJ5OiBTdGVwaGVuIFJvdGh3ZWxsIDxzZnJAY2FuYi5hdXVnLm9yZy5h
dT4KPiBSZWZlcmVuY2VzOiBodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9hcmNoaXZlcy9k
cmktZGV2ZWwvMjAxOS1Ob3ZlbWJlci8yNDI2MjUuaHRtbAo+IFNpZ25lZC1vZmYtYnk6IERhbmll
bCBWZXR0ZXIgPGRhbmllbC52ZXR0ZXJAaW50ZWwuY29tPgo+IC0tLQo+IE5vdGU6IFByb2JhYmx5
IGJlc3QgdG8gYXBwbHkgdGhpcyBkaXJlY3RseSBvbnRvIGRybS1uZXh0IHRvIGF2b2lkCj4gaGF2
aW5nIGRybS1uZXh0IGRyb3BwZWQgZnJvbSBsaW51eC1uZXh0IHVudGlsIHRoZSBuZXh0IHB1bGwg
cmVxdWVzdC4KPiAtRGFuaWVsCj4gLS0tCj4gIGRyaXZlcnMvZ3B1L2RybS9pOTE1L0tjb25maWcu
ZGVidWcgfCAxIC0KPiAgMSBmaWxlIGNoYW5nZWQsIDEgZGVsZXRpb24oLSkKPiAKPiBkaWZmIC0t
Z2l0IGEvZHJpdmVycy9ncHUvZHJtL2k5MTUvS2NvbmZpZy5kZWJ1ZyBiL2RyaXZlcnMvZ3B1L2Ry
bS9pOTE1L0tjb25maWcuZGVidWcKPiBpbmRleCBlZjEyM2ViMjkxNjguLmQyYmE4ZjdlNWU1MCAx
MDA2NDQKPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vaTkxNS9LY29uZmlnLmRlYnVnCj4gKysrIGIv
ZHJpdmVycy9ncHUvZHJtL2k5MTUvS2NvbmZpZy5kZWJ1Zwo+IEBAIC00NCw3ICs0NCw2IEBAIGNv
bmZpZyBEUk1fSTkxNV9ERUJVRwo+ICAgICAgICAgc2VsZWN0IERSTV9JOTE1X1NFTEZURVNUCj4g
ICAgICAgICBzZWxlY3QgRFJNX0k5MTVfREVCVUdfUlVOVElNRV9QTQo+ICAgICAgICAgc2VsZWN0
IERSTV9JOTE1X0RFQlVHX01NSU8KPiAtICAgICAgIHNlbGVjdCBCUk9LRU4gIyBmb3IgcHJvdG90
eXBlIHVBUEkKCllvdSBoYXZlIHRvIHJlcGxhY2UgaXQgd2l0aCBhbm90aGVyIHNlY3JldCBib29s
IGFzIHlvdSBjYW5ub3Qgb3RoZXJ3aXNlCmVuYWJsZSBDT05GSUdfQlJPS0VOIGluIC5jb25maWcu
Ci1DaHJpcwpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpk
cmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0
cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
