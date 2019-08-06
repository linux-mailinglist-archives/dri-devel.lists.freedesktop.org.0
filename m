Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A45F18395D
	for <lists+dri-devel@lfdr.de>; Tue,  6 Aug 2019 21:07:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2B4746E51B;
	Tue,  6 Aug 2019 19:07:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fireflyinternet.com (mail.fireflyinternet.com [109.228.58.192])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 608936E30C;
 Tue,  6 Aug 2019 19:07:32 +0000 (UTC)
X-Default-Received-SPF: pass (skip=forwardok (res=PASS))
 x-ip-name=78.156.65.138; 
Received: from localhost (unverified [78.156.65.138]) 
 by fireflyinternet.com (Firefly Internet (M1)) with ESMTP (TLS) id
 17909680-1500050 for multiple; Tue, 06 Aug 2019 20:07:28 +0100
MIME-Version: 1.0
From: Chris Wilson <chris@chris-wilson.co.uk>
User-Agent: alot/0.6
To: =?utf-8?q?Christian_K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>,
 dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 linaro-mm-sig@lists.linaro.org
References: <20190806150134.104222-1-christian.koenig@amd.com>
 <20190806150134.104222-3-christian.koenig@amd.com>
In-Reply-To: <20190806150134.104222-3-christian.koenig@amd.com>
Message-ID: <156511844626.6198.5922314990162379870@skylake-alporthouse-com>
Subject: Re: [PATCH 3/8] drm/i915: stop using seqcount for fenc pruning
Date: Tue, 06 Aug 2019 20:07:26 +0100
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

UXVvdGluZyBDaHJpc3RpYW4gS8O2bmlnICgyMDE5LTA4LTA2IDE2OjAxOjI5KQo+IEFmdGVyIHdh
aXRpbmcgZm9yIGEgcmVzZXJ2YXRpb24gb2JqZWN0IHVzZSByZXNlcnZhdGlvbl9vYmplY3RfdGVz
dF9zaWduYWxlZF9yY3UKPiB0byBvcHBvcnR1bmlzdGljYWxseSBwcnVuZSB0aGUgZmVuY2VzIG9u
IHRoZSBvYmplY3QuCj4gCj4gVGhpcyBhbGxvd3MgcmVtb3ZhbCBvZiB0aGUgc2VxY291bnQgaGFu
ZGxpbmcgaW4gdGhlIHJlc2VydmF0aW9uIG9iamVjdC4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBDaHJp
c3RpYW4gS8O2bmlnIDxjaHJpc3RpYW4ua29lbmlnQGFtZC5jb20+ClJldmlld2VkLWJ5OiBDaHJp
cyBXaWxzb24gPGNocmlzQGNocmlzLXdpbHNvbi5jby51az4KCkkgbGlrZSBrZWVwaW5nIHRoZSBy
ZW1pbmRlciBhYm91dCB0aGUgbGFjayBvZiBwcnVuaW5nIG9uIGlkbGUgb2JqZWN0cyA6KQotQ2hy
aXMKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRl
dmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8v
bGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
