Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id F0B121B8F7
	for <lists+dri-devel@lfdr.de>; Mon, 13 May 2019 16:47:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BBB2E89EB8;
	Mon, 13 May 2019 14:47:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fireflyinternet.com (mail.fireflyinternet.com [109.228.58.192])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6125C89EBD
 for <dri-devel@lists.freedesktop.org>; Mon, 13 May 2019 14:47:30 +0000 (UTC)
X-Default-Received-SPF: pass (skip=forwardok (res=PASS))
 x-ip-name=78.156.65.138; 
Received: from localhost (unverified [78.156.65.138]) 
 by fireflyinternet.com (Firefly Internet (M1)) with ESMTP (TLS) id
 16541986-1500050 for multiple; Mon, 13 May 2019 15:47:23 +0100
MIME-Version: 1.0
To: Daniel Vetter <daniel@ffwll.ch>, Steven Price <steven.price@arm.com>
From: Chris Wilson <chris@chris-wilson.co.uk>
In-Reply-To: <20190513143921.GP17751@phenom.ffwll.local>
References: <20190513143244.16478-1-steven.price@arm.com>
 <20190513143921.GP17751@phenom.ffwll.local>
Message-ID: <155775884217.2165.11223399053598674062@skylake-alporthouse-com>
User-Agent: alot/0.6
Subject: Re: [PATCH] drm/panfrost: Use drm_gem_dump_map_offset()
Date: Mon, 13 May 2019 15:47:22 +0100
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
Cc: David Airlie <airlied@linux.ie>, Alyssa Rosenzweig <alyssa@rosenzweig.io>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Tomeu Vizoso <tomeu.vizoso@collabora.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

UXVvdGluZyBEYW5pZWwgVmV0dGVyICgyMDE5LTA1LTEzIDE1OjM5OjIxKQo+IE9uIE1vbiwgTWF5
IDEzLCAyMDE5IGF0IDAzOjMyOjQ0UE0gKzAxMDAsIFN0ZXZlbiBQcmljZSB3cm90ZToKPiA+IHBh
bmZyb3N0X2lvY3RsX21tYXBfYm8oKSBjb250YWlucyBhIHJlaW1wbGVtZW50YXRpb24gb2YKPiA+
IGRybV9nZW1fZHVtcF9tYXBfb2Zmc2V0KCkgYnV0IHdpdGggYSBidWcgLSBpdCBhbGxvd3MgbWFw
cGluZyBpbXBvcnRlZAo+ID4gb2JqZWN0cyAod2l0aG91dCBnb2luZyB0aHJvdWdoIHRoZSBleHBv
cnRlcikuIEZpeCB0aGlzIGJ5IHN3aXRjaGluZyB0bwo+ID4gdXNlIHRoZSBnZW5lcmljIGRybV9n
ZW1fZHVtcF9tYXBfb2Zmc2V0KCkgZnVuY3Rpb24gaW5zdGVhZCB3aGljaCBoYXMgdGhlCj4gPiBi
b251cyBvZiBzaW1wbGlmeWluZyB0aGUgY29kZS4KPiAKPiBnZW1fZHVtYiBzdHVmZiBpcyBmb3Ig
a21zIGRyaXZlcnMsIHBhbmZyb3N0IGlzIGEgcmVuZGVyIGRyaXZlci4gV2UncmUKPiBnZW5lcmFs
bHkgdHJ5aW5nIHRvIHNlcGFyYXRlIHRoZXNlIHR3byB3b3JsZHMgc29tZXdoYXQgY2xlYW5seS4K
PiAKPiBJIHRoaW5rIGl0J2QgYmUgZ29vZCB0byBoYXZlIGEgbm9uLWR1bWIgdmVyc2lvbiBvZiB0
aGlzIGluIHRoZSBjb3JlLCBhbmQKPiB1c2UgdGhhdC4gT3IgdXBncmFkZSB0aGUgZHVtYiB2ZXJz
aW9uIHRvIGJlIHRoYXQgaGVscGVyIGZvciBldmVyeW9uZSAoYW5kCj4gZHJvcCB0aGUgX2R1bWIp
LgoKTW9yZSBzcGVjaWZpY2FsbHksIHNpbmNlIHBhbmZyb3N0IGlzIHVzaW5nIHRoZSBkcm1fZ2Vt
X3NobWVtIGhlbHBlciBhbmQKdm1fb3BzLCBpdCB0b28gY2FuIHByb3ZpZGUgdGhlIHdyYXBwZXIg
YXMgaXQgaXMgdGhlIGRybV9nZW1fc2htZW0gbGF5ZXIKdGhhdCBpbXBsaWVzIHRoYXQgdHJ5aW5n
IHRvIG1tYXAgYW4gaW1wb3J0ZWQgb2JqZWN0IGlzIGFuIGlzc3VlIGFzIHRoYXQKaXMgbm90IGEg
dW5pdmVyc2FsIHByb2JsZW0uCi1DaHJpcwpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5m
cmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0
aW5mby9kcmktZGV2ZWw=
