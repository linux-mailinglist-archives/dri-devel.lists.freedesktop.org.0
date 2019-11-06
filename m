Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A96BF17B2
	for <lists+dri-devel@lfdr.de>; Wed,  6 Nov 2019 14:53:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B1C3C6E21E;
	Wed,  6 Nov 2019 13:53:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fireflyinternet.com (mail.fireflyinternet.com [109.228.58.192])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3FA356E21E
 for <dri-devel@lists.freedesktop.org>; Wed,  6 Nov 2019 13:53:49 +0000 (UTC)
X-Default-Received-SPF: pass (skip=forwardok (res=PASS))
 x-ip-name=78.156.65.138; 
Received: from localhost (unverified [78.156.65.138]) 
 by fireflyinternet.com (Firefly Internet (M1)) with ESMTP (TLS) id
 19102606-1500050 for multiple; Wed, 06 Nov 2019 13:53:11 +0000
MIME-Version: 1.0
To: "airlied@linux.ie" <airlied@linux.ie>,
 "daniel.vetter@ffwll.ch" <daniel.vetter@ffwll.ch>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "james qian wang \(Arm Technology China\)" <james.qian.wang@arm.com>,
 "maarten.lankhorst@linux.intel.com" <maarten.lankhorst@linux.intel.com>,
 "malidp@foss.arm.com" <malidp@foss.arm.com>,
 "maxime.ripard@bootlin.com" <maxime.ripard@bootlin.com>,
 "seanpaul@chromium.org" <seanpaul@chromium.org>,
 Alexandru-Cosmin Gheorghe <Alexandru-Cosmin.Gheorghe@arm.com>,
 Ayan Halder <Ayan.Halder@arm.com>, Brian Starkey <Brian.Starkey@arm.com>,
 Charles Xu <Charles.Xu@arm.com>, David Garbett <David.Garbett@arm.com>,
 Lisa Wu <lisa.wu@arm.com>, Liviu Dudau <Liviu.Dudau@arm.com>,
 Matt Szczesiak <matt.szczesiak@arm.com>,
 Raymond Smith <Raymond.Smith@arm.com>
From: Chris Wilson <chris@chris-wilson.co.uk>
In-Reply-To: <20181029171419.4512-9-alexandru-cosmin.gheorghe@arm.com>
References: <20181029171419.4512-1-alexandru-cosmin.gheorghe@arm.com>
 <20181029171419.4512-9-alexandru-cosmin.gheorghe@arm.com>
Message-ID: <157304838822.24928.14943045397657479505@skylake-alporthouse-com>
User-Agent: alot/0.6
Subject: Re: [PATCH v6 8/9] drm: Add macro to export functions only when
 CONFIG_DRM_DEBUG_SELFTEST is enabled
Date: Wed, 06 Nov 2019 13:53:08 +0000
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
Cc: nd <nd@arm.com>,
 Alexandru-Cosmin Gheorghe <Alexandru-Cosmin.Gheorghe@arm.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

UXVvdGluZyBBbGV4YW5kcnUtQ29zbWluIEdoZW9yZ2hlICgyMDE4LTEwLTI5IDE3OjE0OjQzKQo+
IElmIHdlIHdhbnQgdG8gYmUgYWJsZSB0byB3cml0ZSBkcm1zZWxmdGVzdHMgZm9yIG5vbi1zdGF0
aWMgY29yZQo+IGZ1bmN0aW9ucyB0aGF0IGFyZSBub3QgaW50ZW5kZWQgdG8gYmUgdXNlZCBieSBk
cml2ZXJzIHdlIG5lZWQgdGhpcwo+IGZ1bmN0aW9ucyB0byBiZSBleHBvcnRlZC4KPiAKPiBUaGlz
IGFkZHMgYSBtYWNybyB0aGF0IGlzIHRpZWQgb2YgQ09ORklHX0RSTV9ERUJVR19TRUxGVEVTVCwg
YW5kIHVzZXMKPiB0aGF0IHRvIGV4cG9ydCBkcm1faW50ZXJuYWxfZnJhbWVidWZmZXJfY3JlYXRl
LCBpbiBvcmRlciBmb3IKPiBzdWJzZXF1ZW50IHBhdGNoZXMgdG8gYmUgYWJsZSB0byB0ZXN0IGl0
Lgo+IAo+IFNpZ25lZC1vZmYtYnk6IEFsZXhhbmRydSBHaGVvcmdoZSA8YWxleGFuZHJ1LWNvc21p
bi5naGVvcmdoZUBhcm0uY29tPgo+IC0tLQo+ICBkcml2ZXJzL2dwdS9kcm0vZHJtX2ZyYW1lYnVm
ZmVyLmMgfCAxICsKPiAgaW5jbHVkZS9kcm0vZHJtUC5oICAgICAgICAgICAgICAgIHwgNiArKysr
KysKPiAgMiBmaWxlcyBjaGFuZ2VkLCA3IGluc2VydGlvbnMoKykKPiAKPiBkaWZmIC0tZ2l0IGEv
ZHJpdmVycy9ncHUvZHJtL2RybV9mcmFtZWJ1ZmZlci5jIGIvZHJpdmVycy9ncHUvZHJtL2RybV9m
cmFtZWJ1ZmZlci5jCj4gaW5kZXggMTY3YzFjNDU0NGFmLi5mY2FlYThmNTA1MTMgMTAwNjQ0Cj4g
LS0tIGEvZHJpdmVycy9ncHUvZHJtL2RybV9mcmFtZWJ1ZmZlci5jCj4gKysrIGIvZHJpdmVycy9n
cHUvZHJtL2RybV9mcmFtZWJ1ZmZlci5jCj4gQEAgLTMyMyw2ICszMjMsNyBAQCBkcm1faW50ZXJu
YWxfZnJhbWVidWZmZXJfY3JlYXRlKHN0cnVjdCBkcm1fZGV2aWNlICpkZXYsCj4gIAo+ICAgICAg
ICAgcmV0dXJuIGZiOwo+ICB9Cj4gK0VYUE9SVF9TWU1CT0xfRk9SX1RFU1RTX09OTFkoZHJtX2lu
dGVybmFsX2ZyYW1lYnVmZmVyX2NyZWF0ZSk7Cj4gIAo+ICAvKioKPiAgICogZHJtX21vZGVfYWRk
ZmIyIC0gYWRkIGFuIEZCIHRvIHRoZSBncmFwaGljcyBjb25maWd1cmF0aW9uCj4gZGlmZiAtLWdp
dCBhL2luY2x1ZGUvZHJtL2RybVAuaCBiL2luY2x1ZGUvZHJtL2RybVAuaAo+IGluZGV4IDA1MzUw
NDI0YTRkMy4uNTE0YmViMmQ0ODNhIDEwMDY0NAo+IC0tLSBhL2luY2x1ZGUvZHJtL2RybVAuaAo+
ICsrKyBiL2luY2x1ZGUvZHJtL2RybVAuaAo+IEBAIC0xMTAsNCArMTEwLDEwIEBAIHN0YXRpYyBp
bmxpbmUgYm9vbCBkcm1fY2FuX3NsZWVwKHZvaWQpCj4gICAgICAgICByZXR1cm4gdHJ1ZTsKPiAg
fQo+ICAKPiArI2lmIGRlZmluZWQoQ09ORklHX0RSTV9ERUJVR19TRUxGVEVTVF9NT0RVTEUpCj4g
KyNkZWZpbmUgRVhQT1JUX1NZTUJPTF9GT1JfVEVTVFNfT05MWSh4KSBFWFBPUlRfU1lNQk9MKHgp
Cj4gKyNlbHNlCj4gKyNkZWZpbmUgRVhQT1JUX1NZTUJPTF9GT1JfVEVTVFNfT05MWSh4KQo+ICsj
ZW5kaWYKClRoZXJlJ3Mgbm8gS2NvbmZpZyBzdGFuemEgZm9yIHRoaXMgc3ltYm9sLgotQ2hyaXMK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
