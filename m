Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BF1CD8392A
	for <lists+dri-devel@lfdr.de>; Tue,  6 Aug 2019 20:57:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B56E46E314;
	Tue,  6 Aug 2019 18:57:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fireflyinternet.com (mail.fireflyinternet.com [109.228.58.192])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4BBA16E2F9;
 Tue,  6 Aug 2019 18:57:40 +0000 (UTC)
X-Default-Received-SPF: pass (skip=forwardok (res=PASS))
 x-ip-name=78.156.65.138; 
Received: from localhost (unverified [78.156.65.138]) 
 by fireflyinternet.com (Firefly Internet (M1)) with ESMTP (TLS) id
 17909567-1500050 for multiple; Tue, 06 Aug 2019 19:57:34 +0100
MIME-Version: 1.0
From: Chris Wilson <chris@chris-wilson.co.uk>
User-Agent: alot/0.6
To: =?utf-8?q?Christian_K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>,
 dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 linaro-mm-sig@lists.linaro.org
References: <20190806150134.104222-1-christian.koenig@amd.com>
In-Reply-To: <20190806150134.104222-1-christian.koenig@amd.com>
Message-ID: <156511785146.6198.12664699085110516720@skylake-alporthouse-com>
Subject: Re: [PATCH 1/8] dma-buf: fix busy wait for new shared fences
Date: Tue, 06 Aug 2019 19:57:31 +0100
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

UXVvdGluZyBDaHJpc3RpYW4gS8O2bmlnICgyMDE5LTA4LTA2IDE2OjAxOjI3KQo+IFdoZW4gcmVz
ZXJ2YXRpb25fb2JqZWN0X2FkZF9zaGFyZWRfZmVuY2UgaXMgcmVwbGFjaW5nIGFuIG9sZCBmZW5j
ZSB3aXRoIGEgbmV3Cj4gb25lIHdlIHNob3VsZCBub3QgZHJvcCB0aGUgb2xkIG9uZSBiZWZvcmUg
dGhlIG5ldyBvbmUgaXMgaW4gcGxhY2UuCj4gCj4gT3RoZXJ3aXNlIG90aGVyIGNvcmVzIGNhbiBi
dXN5IHdhaXQgZm9yIHRoZSBuZXcgb25lIHRvIGFwcGVhci4KCkkgc2VlLiBUaGUgcmVhZGVyIHdp
bGwgc2VlIGEgcmVmY291bnQ9PTAgZmVuY2UgYW5kIHJlc3RhcnQsIHdoZXJlYXMgYnkKZHJvcHBp
bmcgdGhlIHJlZiBsYXRlciwgdGhhdCByZWFkZXIgaGFzIGEgYmV0dGVyIGNoYW5jZSBvZiBnZXR0
aW5nIHRvCnRoZSBlbmQgYmVmb3JlIG5vdGljaW5nIHRoZSBjaGFuZ2UuCgo+IFNpZ25lZC1vZmYt
Ynk6IENocmlzdGlhbiBLw7ZuaWcgPGNocmlzdGlhbi5rb2VuaWdAYW1kLmNvbT4KUmV2aWV3ZWQt
Ynk6IENocmlzIFdpbHNvbiA8Y2hyaXNAY2hyaXMtd2lsc29uLmNvLnVrPgotQ2hyaXMKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxp
bmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJl
ZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
