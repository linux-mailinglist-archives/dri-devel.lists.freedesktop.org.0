Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A1164CE90C
	for <lists+dri-devel@lfdr.de>; Mon,  7 Oct 2019 18:23:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7E89E6E24E;
	Mon,  7 Oct 2019 16:23:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fireflyinternet.com (mail.fireflyinternet.com [109.228.58.192])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3C86989259;
 Mon,  7 Oct 2019 16:23:04 +0000 (UTC)
X-Default-Received-SPF: pass (skip=forwardok (res=PASS))
 x-ip-name=78.156.65.138; 
Received: from localhost (unverified [78.156.65.138]) 
 by fireflyinternet.com (Firefly Internet (M1)) with ESMTP (TLS) id
 18754431-1500050 for multiple; Mon, 07 Oct 2019 17:22:55 +0100
MIME-Version: 1.0
To: Colin King <colin.king@canonical.com>, Daniel Vetter <daniel@ffwll.ch>,
 David Airlie <airlied@linux.ie>, Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, dri-devel@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org
From: Chris Wilson <chris@chris-wilson.co.uk>
In-Reply-To: <20191007154151.23245-1-colin.king@canonical.com>
References: <20191007154151.23245-1-colin.king@canonical.com>
Message-ID: <157046537209.5063.10118308844290609426@skylake-alporthouse-com>
User-Agent: alot/0.6
Subject: Re: [PATCH] drm/i915: make array hw_engine_mask static,
 makes object smaller
Date: Mon, 07 Oct 2019 17:22:52 +0100
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
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

UXVvdGluZyBDb2xpbiBLaW5nICgyMDE5LTEwLTA3IDE2OjQxOjUxKQo+IEZyb206IENvbGluIElh
biBLaW5nIDxjb2xpbi5raW5nQGNhbm9uaWNhbC5jb20+Cj4gCj4gRG9uJ3QgcG9wdWxhdGUgdGhl
IGFycmF5IGh3X2VuZ2luZV9tYXNrIG9uIHRoZSBzdGFjayBidXQgaW5zdGVhZCBtYWtlIGl0Cj4g
c3RhdGljLiBNYWtlcyB0aGUgb2JqZWN0IGNvZGUgc21hbGxlciBieSAzMTYgYnl0ZXMuCj4gCj4g
QmVmb3JlOgo+ICAgIHRleHQgICAgZGF0YSAgICAgYnNzICAgICBkZWMgICAgIGhleCBmaWxlbmFt
ZQo+ICAgMzQwMDQgICAgNDM4OCAgICAgMzIwICAgMzg3MTIgICAgOTczOCBncHUvZHJtL2k5MTUv
Z3QvaW50ZWxfcmVzZXQubwo+IAo+IEFmdGVyOgo+ICAgIHRleHQgICAgZGF0YSAgICAgYnNzICAg
ICBkZWMgICAgIGhleCBmaWxlbmFtZQo+ICAgMzM1MjggICAgNDU0OCAgICAgMzIwICAgMzgzOTYg
ICAgOTVmYyBncHUvZHJtL2k5MTUvZ3QvaW50ZWxfcmVzZXQubwo+IAo+IChnY2MgdmVyc2lvbiA5
LjIuMSwgYW1kNjQpCj4gCj4gU2lnbmVkLW9mZi1ieTogQ29saW4gSWFuIEtpbmcgPGNvbGluLmtp
bmdAY2Fub25pY2FsLmNvbT4KUmV2aWV3ZWQtYnk6IENocmlzIFdpbHNvbiA8Y2hyaXNAY2hyaXMt
d2lsc29uLmNvLnVrPgotQ2hyaXMKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRl
c2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8v
ZHJpLWRldmVs
