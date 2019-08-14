Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 211858D956
	for <lists+dri-devel@lfdr.de>; Wed, 14 Aug 2019 19:08:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9CAB66E784;
	Wed, 14 Aug 2019 17:07:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fireflyinternet.com (mail.fireflyinternet.com [109.228.58.192])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6CC286E784;
 Wed, 14 Aug 2019 17:07:57 +0000 (UTC)
X-Default-Received-SPF: pass (skip=forwardok (res=PASS))
 x-ip-name=78.156.65.138; 
Received: from localhost (unverified [78.156.65.138]) 
 by fireflyinternet.com (Firefly Internet (M1)) with ESMTP (TLS) id
 18106770-1500050 for multiple; Wed, 14 Aug 2019 18:06:19 +0100
MIME-Version: 1.0
To: Daniel Vetter <daniel@ffwll.ch>, christian.koenig@amd.com
From: Chris Wilson <chris@chris-wilson.co.uk>
In-Reply-To: <156580096818.2714.13643616122908209617@skylake-alporthouse-com>
References: <20190807135312.1730-1-christian.koenig@amd.com>
 <20190807135312.1730-4-christian.koenig@amd.com>
 <156518744066.6198.17572013738158664135@skylake-alporthouse-com>
 <ccc20434-0380-c0b8-1ccb-1f7d9ae1a4a5@gmail.com>
 <20190814153908.GI7444@phenom.ffwll.local>
 <156580096818.2714.13643616122908209617@skylake-alporthouse-com>
Message-ID: <156580237838.2301.9210706924490719639@skylake-alporthouse-com>
User-Agent: alot/0.6
Subject: Re: [PATCH 4/4] dma-buf: nuke reservation_object seq number
Date: Wed, 14 Aug 2019 18:06:18 +0100
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
Cc: linaro-mm-sig@lists.linaro.org, Daniel Vetter <daniel.vetter@ffwll.ch>,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

UXVvdGluZyBDaHJpcyBXaWxzb24gKDIwMTktMDgtMTQgMTc6NDI6NDgpCj4gUXVvdGluZyBEYW5p
ZWwgVmV0dGVyICgyMDE5LTA4LTE0IDE2OjM5OjA4KQo+ID4gPiA+ID4gKyAgICAgICB9IHdoaWxl
IChyY3VfYWNjZXNzX3BvaW50ZXIob2JqLT5mZW5jZV9leGNsKSAhPSAqZXhjbCk7Cj4gPiAKPiA+
IFdoYXQgaWYgc29tZW9uZSBpcyByZWFsIGZhc3QgKGxpa2UgcmVhbGx5IHJlYWwgZmFzdCkgYW5k
IHJlY3ljbGVzIHRoZQo+ID4gZXhjbHVzaXZlIGZlbmNlIHNvIHlvdSByZWFkIHRoZSBzYW1lIHBv
aW50ZXIgdHdpY2UsIGJ1dCBldmVyeXRoaW5nIGVsc2UKPiA+IGNoYW5nZWQ/IHJldXNlZCBmZW5j
ZSBwb2ludGVyIGlzIGEgbG90IG1vcmUgbGlrZWx5IHRoYW4gc2VxbG9jayB3cmFwcGluZwo+ID4g
YXJvdW5kLgo+IAo+IEl0J3MgYW4gZXhjbHVzaXZlIGZlbmNlLiBJZiBpdCBpcyByZXBsYWNlZCwg
aXQgbXVzdCBiZSBsYXRlciB0aGFuIGFsbAo+IHRoZSBzaGFyZWQgZmVuY2VzIChhbmQgZGVwZW5k
ZW50IG9uIHRoZW0gZGlyZWN0bHkgb3IgaW5kaXJlY3RseSksIGFuZAo+IHNvIHN0aWxsIGEgY29u
c2lzdGVudCBzbmFwc2hvdC4KCkFuIGV4dGVuc2lvbiBvZiB0aGF0IGFyZ3VtZW50IHNheXMgd2Ug
ZG9uJ3QgZXZlbiBuZWVkIHRvIGxvb3AsCgoqbGlzdCA9IHJjdV9kZXJlZmVyZW5jZShvYmotPmZl
bmNlKTsKKnNoYXJlZF9jb3VudCA9ICpsaXN0ID8gKCpsaXN0KS0+c2hhcmVkX2NvdW50IDogMDsK
c21wX3JtYigpOwoqZXhjbCA9IHJjdV9kZXJlZmVyZW5jZShvYmotPmZlbmNlX2V4Y2wpOwoKR2l2
ZXMgYSBjb25zaXN0ZW50IHNuYXBzaG90LiBJdCBkb2Vzbid0IG1hdHRlciBpZiB0aGUgZmVuY2Vf
ZXhjbCBpcwpiZWZvcmUgb3IgYWZ0ZXIgdGhlIHNoYXJlZF9saXN0IC0tIGlmIGl0J3MgYWZ0ZXIs
IGl0J3MgYSBzdXBlcnNldCBvZiBhbGwKZmVuY2VzLCBpZiBpdCdzIGJlZm9yZSwgd2UgaGF2ZSBh
IGNvcnJlY3QgbGlzdCBvZiBzaGFyZWQgZmVuY2VzIHRoZQplYXJsaWVyIGZlbmNlX2V4Y2wuCi1D
aHJpcwpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmkt
ZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6
Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
