Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 76C837DBAA
	for <lists+dri-devel@lfdr.de>; Thu,  1 Aug 2019 14:40:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4018C6E5BC;
	Thu,  1 Aug 2019 12:40:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fireflyinternet.com (mail.fireflyinternet.com [109.228.58.192])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 26ACA6E5BC
 for <dri-devel@lists.freedesktop.org>; Thu,  1 Aug 2019 12:40:37 +0000 (UTC)
X-Default-Received-SPF: pass (skip=forwardok (res=PASS))
 x-ip-name=78.156.65.138; 
Received: from localhost (unverified [78.156.65.138]) 
 by fireflyinternet.com (Firefly Internet (M1)) with ESMTP (TLS) id
 17788023-1500050 for multiple; Thu, 01 Aug 2019 13:40:29 +0100
MIME-Version: 1.0
From: Chris Wilson <chris@chris-wilson.co.uk>
User-Agent: alot/0.6
To: David Airlie <airlied@linux.ie>, Deepak Sharma <deepak.sharma@amd.com>,
 Emil Velikov <emil.velikov@collabora.com>, Eric Anholt <eric@anholt.net>,
 Eric Biggers <ebiggers@google.com>, Imre Deak <imre.deak@intel.com>,
 Rob Clark <robdclark@chromium.org>, Rob Clark <robdclark@gmail.com>,
 Sean Paul <sean@poorly.run>, Thomas Zimmermann <tzimmermann@suse.de>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20190717211542.30482-1-robdclark@gmail.com>
 <20190719092153.GJ15868@phenom.ffwll.local>
 <20190731192331.GT104440@art_vandelay>
In-Reply-To: <20190731192331.GT104440@art_vandelay>
Message-ID: <156466322613.6045.7313079853087889718@skylake-alporthouse-com>
Subject: Re: [PATCH] drm/vgem: fix cache synchronization on arm/arm64
Date: Thu, 01 Aug 2019 13:40:26 +0100
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

UXVvdGluZyBTZWFuIFBhdWwgKDIwMTktMDctMzEgMjA6MjM6MzEpCj4gT24gRnJpLCBKdWwgMTks
IDIwMTkgYXQgMTE6MjE6NTNBTSArMDIwMCwgRGFuaWVsIFZldHRlciB3cm90ZToKPiA+IE9uIFdl
ZCwgSnVsIDE3LCAyMDE5IGF0IDAyOjE1OjM3UE0gLTA3MDAsIFJvYiBDbGFyayB3cm90ZToKPiA+
ID4gRnJvbTogUm9iIENsYXJrIDxyb2JkY2xhcmtAY2hyb21pdW0ub3JnPgo+ID4gPiAKPiA+ID4g
ZHJtX2NmbHVzaF9wYWdlcygpIGlzIG5vLW9wIG9uIGFybS9hcm02NC4gIEJ1dCBpbnN0ZWFkIHdl
IGNhbiB1c2UKPiA+ID4gZG1hX3N5bmMgQVBJLgo+ID4gPiAKPiA+ID4gRml4ZXMgZmFpbHVyZXMg
dy8gdmdlbV90ZXN0Lgo+ID4gPiAKPiA+ID4gU2lnbmVkLW9mZi1ieTogUm9iIENsYXJrIDxyb2Jk
Y2xhcmtAY2hyb21pdW0ub3JnPgo+ID4gPiAtLS0KPiA+ID4gQW4gYWx0ZXJuYXRpdmUgYXBwcm9h
Y2ggdG8gdGhlIHNlcmllc1sxXSBJIHNlbnQgeWVzdGVyZGF5Cj4gPiA+IAo+ID4gPiBPbiB0aGUg
cGx1cyBzaWRlLCBpdCBrZWVwcyB0aGUgV0MgYnVmZmVycyBhbmQgYXZvaWRzIGFueSBkcm0gY29y
ZQo+ID4gPiBjaGFuZ2VzLiAgT24gdGhlIG1pbnVzIHNpZGUsIEkgZG9uJ3QgdGhpbmsgaXQgd2ls
bCB3b3JrIChhdCBsZWFzdAo+ID4gPiBvbiBhcm02NCkgcHJpb3IgdG8gdjUuMFsyXSwgc28gdGhl
IGZpeCBjYW4ndCBiZSBiYWNrcG9ydGVkIHZlcnkKPiA+ID4gZmFyLgo+ID4gCj4gPiBZZWFoIHNl
ZW1zIGEgbG90IG1vcmUgcmVhc29uYWJsZS4KPiA+IAo+ID4gQWNrZWQtYnk6IERhbmllbCBWZXR0
ZXIgPGRhbmllbC52ZXR0ZXJAZmZ3bGwuY2g+Cj4gCj4gQXBwbGllZCB0byBkcm0tbWlzYy1maXhl
cywgdGhhbmtzIQoKQnV0IGl0IGRpZG4ndCBhY3R1YWxseSBmaXggdGhlIGZhaWx1cmVzIGluIENJ
LgotQ2hyaXMKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
ZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0
dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
