Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9AAC470B5E
	for <lists+dri-devel@lfdr.de>; Mon, 22 Jul 2019 23:30:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F341E89E57;
	Mon, 22 Jul 2019 21:30:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fireflyinternet.com (mail.fireflyinternet.com [109.228.58.192])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1698089E50;
 Mon, 22 Jul 2019 21:30:31 +0000 (UTC)
X-Default-Received-SPF: pass (skip=forwardok (res=PASS))
 x-ip-name=78.156.65.138; 
Received: from localhost (unverified [78.156.65.138]) 
 by fireflyinternet.com (Firefly Internet (M1)) with ESMTP (TLS) id
 17515877-1500050 for multiple; Mon, 22 Jul 2019 22:30:16 +0100
MIME-Version: 1.0
To: DRI Development <dri-devel@lists.freedesktop.org>,
 Daniel Vetter <daniel.vetter@ffwll.ch>
From: Chris Wilson <chris@chris-wilson.co.uk>
In-Reply-To: <20190722212101.26030-1-daniel.vetter@ffwll.ch>
References: <20190722212101.26030-1-daniel.vetter@ffwll.ch>
Message-ID: <156383101421.31349.4717845942559074982@skylake-alporthouse-com>
User-Agent: alot/0.6
Subject: Re: [Intel-gfx] [PATCH] drm/i915: Fix up broken merge
Date: Mon, 22 Jul 2019 22:30:14 +0100
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
Cc: Maxime Ripard <maxime.ripard@bootlin.com>,
 Daniel Vetter <daniel.vetter@ffwll.ch>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 Daniel Vetter <daniel.vetter@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

UXVvdGluZyBEYW5pZWwgVmV0dGVyICgyMDE5LTA3LTIyIDIyOjIxOjAxKQo+IE1heGltZSBkaWRu
J3QgcmVhbGx5IGNvbXBpbGUtdGVzdCB0aGlzIDotLwo+IAo+IFdlIG5lZWQgdG8gcmUtYXBwbHkK
PiAKPiBjb21taXQgZTRmYTg0NTdiMjE5NzExODUzOGExNDAwYjc1Yzg5OGY5ZmFhZjE2NAo+IEF1
dGhvcjogRGFuaWVsIFZldHRlciA8ZGFuaWVsLnZldHRlckBmZndsbC5jaD4KPiBEYXRlOiAgIEZy
aSBKdW4gMTQgMjI6MzU6MjUgMjAxOSArMDIwMAo+IAo+ICAgICBkcm0vcHJpbWU6IEFsaWduIGdl
bV9wcmltZV9leHBvcnQgd2l0aCBvYmpfZnVuY3MuZXhwb3J0Cj4gCj4gcGx1cyBtYWtlIHN1cmUg
aTkxNV9nZW1fZG1hX2J1Zi5jIGRvZXNuJ3QgZ2V0IHpvbWJpZS1yZXN1cnJlY3QuIEl0Cj4gbW92
ZWQgaW4KPiAKPiBjb21taXQgMTBiZTk4YTc3YzU1OGY4Y2ZiODIzY2QyNzc3MTcxZmJiMzUwNDBm
Ngo+IEF1dGhvcjogQ2hyaXMgV2lsc29uIDxjaHJpc0BjaHJpcy13aWxzb24uY28udWs+Cj4gRGF0
ZTogICBUdWUgTWF5IDI4IDEwOjI5OjQ5IDIwMTkgKzAxMDAKPiAKPiAgICAgZHJtL2k5MTU6IE1v
dmUgbW9yZSBHRU0gb2JqZWN0cyB1bmRlciBnZW0vCj4gCj4gRml4ZXM6IDAzYjBmMmNlNzM1ZSAo
Ik1lcmdlIHY1LjMtcmMxIGludG8gZHJtLW1pc2MtbmV4dCIpCj4gQ2M6IE1heGltZSBSaXBhcmQg
PG1heGltZS5yaXBhcmRAYm9vdGxpbi5jb20+Cj4gU2lnbmVkLW9mZi1ieTogRGFuaWVsIFZldHRl
ciA8ZGFuaWVsLnZldHRlckBpbnRlbC5jb20+Cj4gLS0tCj4gIGRyaXZlcnMvZ3B1L2RybS9pOTE1
L2dlbS9pOTE1X2dlbV9kbWFidWYuYyB8ICAgNSArLQo+ICBkcml2ZXJzL2dwdS9kcm0vaTkxNS9p
OTE1X2dlbV9kbWFidWYuYyAgICAgfCAzMzYgLS0tLS0tLS0tLS0tLS0tLS0tLS0tCgo0IGxpdHRs
ZSBmaXhlcyBmb3IgdGhlIGNoYW5nZSBpbiBpZmFjZSBmb3IKZ2VtL3NlbGZ0ZXN0cy9pOTE1X2dl
bV9kbWFidWYuYyAocGx1cyBnaXQgcm0Kc2VsZnRlc3RzL2k5MTVfZ2VtX2RtYWJ1Zi5jKQotQ2hy
aXMKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRl
dmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8v
bGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
