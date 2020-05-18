Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D31F11D7BE2
	for <lists+dri-devel@lfdr.de>; Mon, 18 May 2020 16:53:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F3A296E418;
	Mon, 18 May 2020 14:53:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fireflyinternet.com (mail.fireflyinternet.com [109.228.58.192])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 015E76E418
 for <dri-devel@lists.freedesktop.org>; Mon, 18 May 2020 14:53:33 +0000 (UTC)
X-Default-Received-SPF: pass (skip=forwardok (res=PASS))
 x-ip-name=78.156.65.138; 
Received: from localhost (unverified [78.156.65.138]) 
 by fireflyinternet.com (Firefly Internet (M1)) with ESMTP (TLS) id
 21231174-1500050 for multiple; Mon, 18 May 2020 15:53:29 +0100
MIME-Version: 1.0
In-Reply-To: <20200518144744.GP206103@phenom.ffwll.local>
References: <20200516212330.13633-1-chris@chris-wilson.co.uk>
 <20200516212330.13633-2-chris@chris-wilson.co.uk>
 <20200518144744.GP206103@phenom.ffwll.local>
From: Chris Wilson <chris@chris-wilson.co.uk>
To: Daniel Vetter <daniel@ffwll.ch>
Subject: Re: [PATCH 2/4] drm: Help unconfuse gcc,
 avoid accidental impossible unsigned comparisons
Message-ID: <158981360893.7442.2371163498721023137@build.alporthouse.com>
User-Agent: alot/0.8.1
Date: Mon, 18 May 2020 15:53:28 +0100
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
Cc: dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

UXVvdGluZyBEYW5pZWwgVmV0dGVyICgyMDIwLTA1LTE4IDE1OjQ3OjQ0KQo+IE9uIFNhdCwgTWF5
IDE2LCAyMDIwIGF0IDEwOjIzOjI4UE0gKzAxMDAsIENocmlzIFdpbHNvbiB3cm90ZToKPiA+IGRy
aXZlcnMvZ3B1L2RybS9kcm1fY2xpZW50X21vZGVzZXQuYzogSW4gZnVuY3Rpb24g4oCYZHJtX2Ns
aWVudF9maXJtd2FyZV9jb25maWfigJk6Cj4gPiAuL2luY2x1ZGUvbGludXgvYml0cy5oOjI2OjI4
OiB3YXJuaW5nOiBjb21wYXJpc29uIG9mIHVuc2lnbmVkIGV4cHJlc3Npb24gPCAwIGlzIGFsd2F5
cyBmYWxzZSBbLVd0eXBlLWxpbWl0c10KPiA+ICAgIF9fYnVpbHRpbl9jb25zdGFudF9wKChsKSA+
IChoKSksIChsKSA+IChoKSwgMCkpKQo+ID4gCj4gPiBTaWduZWQtb2ZmLWJ5OiBDaHJpcyBXaWxz
b24gPGNocmlzQGNocmlzLXdpbHNvbi5jby51az4KPiAKPiBUb29rIG1lIGEgd2hpbGUgdG8gc3Bv
dCB3aGVyZSB0aGlzIGdvZXMgYm9vbSwga2luZGEgd29uZGVyIHdoZXRoZXIgd2UKPiBzaG91bGQg
aGF2ZSBhbgo+IAo+ICAgICAgICAgaWYgKFdBUk5fT04oIWNvbm5lY3Rvcl9jb3VudCkpCj4gICAg
ICAgICAgICAgICAgIHJldHVybiAtRUlOVkFMOwoKQXRtLCBkcm1fY2xpZW50X2Zpcm13YXJlX2Nv
bmZpZygpIGlzIGNhbGxlZCBvbmx5IGlmIGNvbm5lY3Rvcl9jb3VudCE9MC4KQnV0IGlmIGNvdW50
PT0wLCB3ZSB3b3VsZCBoaXQgZ290byByZXRyeSBpbmRlZmluaXRlbHksIHNlZW1zIGxpa2UgdGhh
dAp3b3VsZCBiZSB3b3J0aCBhIFdBUk4uCi1DaHJpcwpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBs
aXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1h
bi9saXN0aW5mby9kcmktZGV2ZWwK
