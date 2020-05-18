Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2115C1D7E62
	for <lists+dri-devel@lfdr.de>; Mon, 18 May 2020 18:26:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 464C36E431;
	Mon, 18 May 2020 16:26:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fireflyinternet.com (mail.fireflyinternet.com [109.228.58.192])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8B8CB6E431
 for <dri-devel@lists.freedesktop.org>; Mon, 18 May 2020 16:26:26 +0000 (UTC)
X-Default-Received-SPF: pass (skip=forwardok (res=PASS))
 x-ip-name=78.156.65.138; 
Received: from localhost (unverified [78.156.65.138]) 
 by fireflyinternet.com (Firefly Internet (M1)) with ESMTP (TLS) id
 21232292-1500050 for multiple; Mon, 18 May 2020 17:26:21 +0100
MIME-Version: 1.0
In-Reply-To: <CACvgo535juMCoP3Lkg3L6UM8WYsYKP_pkAiO480Z8eouqnPhtA@mail.gmail.com>
References: <20200516212330.13633-1-chris@chris-wilson.co.uk>
 <20200516212330.13633-2-chris@chris-wilson.co.uk>
 <CACvgo535juMCoP3Lkg3L6UM8WYsYKP_pkAiO480Z8eouqnPhtA@mail.gmail.com>
From: Chris Wilson <chris@chris-wilson.co.uk>
To: Emil Velikov <emil.l.velikov@gmail.com>
Subject: Re: [PATCH 2/4] drm: Help unconfuse gcc,
 avoid accidental impossible unsigned comparisons
Message-ID: <158981918069.7442.11219722065952629986@build.alporthouse.com>
User-Agent: alot/0.8.1
Date: Mon, 18 May 2020 17:26:20 +0100
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
Cc: ML dri-devel <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

UXVvdGluZyBFbWlsIFZlbGlrb3YgKDIwMjAtMDUtMTggMTc6MjM6MjEpCj4gT24gU2F0LCAxNiBN
YXkgMjAyMCBhdCAyMjoyMywgQ2hyaXMgV2lsc29uIDxjaHJpc0BjaHJpcy13aWxzb24uY28udWs+
IHdyb3RlOgo+ID4KPiA+IGRyaXZlcnMvZ3B1L2RybS9kcm1fY2xpZW50X21vZGVzZXQuYzogSW4g
ZnVuY3Rpb24g4oCYZHJtX2NsaWVudF9maXJtd2FyZV9jb25maWfigJk6Cj4gPiAuL2luY2x1ZGUv
bGludXgvYml0cy5oOjI2OjI4OiB3YXJuaW5nOiBjb21wYXJpc29uIG9mIHVuc2lnbmVkIGV4cHJl
c3Npb24gPCAwIGlzIGFsd2F5cyBmYWxzZSBbLVd0eXBlLWxpbWl0c10KPiA+ICAgIF9fYnVpbHRp
bl9jb25zdGFudF9wKChsKSA+IChoKSksIChsKSA+IChoKSwgMCkpKQo+ID4KPiBIbW0gdGhpcyBz
ZWVtcyBsaWtlIGEgaGFjayBhcm91bmQgYSBtYWNybyBidWcuIEknbGwgc2VuZCBhIGZpeCBmb3Ig
dGhlCj4gbWFjcm8gaW4gYSBmZXcgbWludXRlcy4KPiBXaXRoIHRoYXQgeW91IGRvbid0IGhhdmUg
dG8gdGlua2VyIHRvIG1ha2UgaXQgdW5zaWduZWQsIGFsdGhvdWdoIGNvbnN0Cj4gd2lsbCBiZSBh
cHByZWNpYXRlZC4KClN0cmVhbXMgY3Jvc3NlZC4gSSBhZGRlZCBEYW5pZWwncyBzdWdnZXN0aW9u
IGZvciBhIFdBUk5fT04gdG8gbWFrZSBpdApjbGVhciB0aGF0IHdlIHNob3VsZCBuZXZlciBwYXNz
IGNvbm5lY3RvcnNfY291bnQ9PTAgdG8KZHJtX2NsaWVudF9maXJtd2FyZV9jb25maWcKLUNocmlz
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZl
bCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xp
c3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=
