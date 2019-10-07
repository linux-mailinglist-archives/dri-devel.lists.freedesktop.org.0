Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 548F7CEE9C
	for <lists+dri-devel@lfdr.de>; Mon,  7 Oct 2019 23:49:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EBF2D6E12F;
	Mon,  7 Oct 2019 21:49:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fireflyinternet.com (mail.fireflyinternet.com [109.228.58.192])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2DDA789994;
 Mon,  7 Oct 2019 21:49:54 +0000 (UTC)
X-Default-Received-SPF: pass (skip=forwardok (res=PASS))
 x-ip-name=78.156.65.138; 
Received: from localhost (unverified [78.156.65.138]) 
 by fireflyinternet.com (Firefly Internet (M1)) with ESMTP (TLS) id
 18757211-1500050 for multiple; Mon, 07 Oct 2019 22:49:45 +0100
MIME-Version: 1.0
To: Colin King <colin.king@canonical.com>, Daniel Vetter <daniel@ffwll.ch>,
 David Airlie <airlied@linux.ie>, Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, dri-devel@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org
From: Chris Wilson <chris@chris-wilson.co.uk>
In-Reply-To: <157046537209.5063.10118308844290609426@skylake-alporthouse-com>
References: <20191007154151.23245-1-colin.king@canonical.com>
 <157046537209.5063.10118308844290609426@skylake-alporthouse-com>
Message-ID: <157048498331.8520.2832276261708225981@skylake-alporthouse-com>
User-Agent: alot/0.6
Subject: Re: [PATCH] drm/i915: make array hw_engine_mask static,
 makes object smaller
Date: Mon, 07 Oct 2019 22:49:43 +0100
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

UXVvdGluZyBDaHJpcyBXaWxzb24gKDIwMTktMTAtMDcgMTc6MjI6NTIpCj4gUXVvdGluZyBDb2xp
biBLaW5nICgyMDE5LTEwLTA3IDE2OjQxOjUxKQo+ID4gRnJvbTogQ29saW4gSWFuIEtpbmcgPGNv
bGluLmtpbmdAY2Fub25pY2FsLmNvbT4KPiA+IAo+ID4gRG9uJ3QgcG9wdWxhdGUgdGhlIGFycmF5
IGh3X2VuZ2luZV9tYXNrIG9uIHRoZSBzdGFjayBidXQgaW5zdGVhZCBtYWtlIGl0Cj4gPiBzdGF0
aWMuIE1ha2VzIHRoZSBvYmplY3QgY29kZSBzbWFsbGVyIGJ5IDMxNiBieXRlcy4KPiA+IAo+ID4g
QmVmb3JlOgo+ID4gICAgdGV4dCAgICBkYXRhICAgICBic3MgICAgIGRlYyAgICAgaGV4IGZpbGVu
YW1lCj4gPiAgIDM0MDA0ICAgIDQzODggICAgIDMyMCAgIDM4NzEyICAgIDk3MzggZ3B1L2RybS9p
OTE1L2d0L2ludGVsX3Jlc2V0Lm8KPiA+IAo+ID4gQWZ0ZXI6Cj4gPiAgICB0ZXh0ICAgIGRhdGEg
ICAgIGJzcyAgICAgZGVjICAgICBoZXggZmlsZW5hbWUKPiA+ICAgMzM1MjggICAgNDU0OCAgICAg
MzIwICAgMzgzOTYgICAgOTVmYyBncHUvZHJtL2k5MTUvZ3QvaW50ZWxfcmVzZXQubwo+ID4gCj4g
PiAoZ2NjIHZlcnNpb24gOS4yLjEsIGFtZDY0KQo+ID4gCj4gPiBTaWduZWQtb2ZmLWJ5OiBDb2xp
biBJYW4gS2luZyA8Y29saW4ua2luZ0BjYW5vbmljYWwuY29tPgo+IFJldmlld2VkLWJ5OiBDaHJp
cyBXaWxzb24gPGNocmlzQGNocmlzLXdpbHNvbi5jby51az4KCkFuZCBwdXNoZWQsIHRoYW5rcyBm
b3IgdGhlIHBhdGNoLgotQ2hyaXMKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRl
c2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8v
ZHJpLWRldmVs
