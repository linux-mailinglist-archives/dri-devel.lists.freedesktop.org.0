Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2154B13F5C9
	for <lists+dri-devel@lfdr.de>; Thu, 16 Jan 2020 19:59:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 95F2C6EE97;
	Thu, 16 Jan 2020 18:59:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fireflyinternet.com (mail.fireflyinternet.com [109.228.58.192])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0AE0C6EE95;
 Thu, 16 Jan 2020 18:59:07 +0000 (UTC)
X-Default-Received-SPF: pass (skip=forwardok (res=PASS))
 x-ip-name=78.156.65.138; 
Received: from localhost (unverified [78.156.65.138]) 
 by fireflyinternet.com (Firefly Internet (M1)) with ESMTP (TLS) id
 19906572-1500050 for multiple; Thu, 16 Jan 2020 18:58:56 +0000
MIME-Version: 1.0
From: Chris Wilson <chris@chris-wilson.co.uk>
User-Agent: alot/0.6
To: akeem.g.abodunrin@intel.com, d.scott.phillips@intel.com,
 daniel.vetter@intel.com, david.c.stewart@intel.com,
 dri-devel@lists.freedesktop.org, francesco.balestrieri@intel.com,
 intel-gfx@lists.freedesktop.org, jani.nikula@intel.com,
 jon.bloomfield@intel.com, joonas.lahtinen@intel.com, mika.kuoppala@intel.com, 
 omer.aran@intel.com, pragyansri.pathi@intel.com,
 prathap.kumar.valsan@intel.com, sudeep.dutt@intel.com, tony.luck@intel.com
References: <20200114174549.74643-1-akeem.g.abodunrin@intel.com>
 <20200114174549.74643-3-akeem.g.abodunrin@intel.com>
In-Reply-To: <20200114174549.74643-3-akeem.g.abodunrin@intel.com>
Message-ID: <157920113389.7612.3195730584391044825@skylake-alporthouse-com>
Subject: Re: [RFC PATCH v2 2/2] drm/i915/gen7: Clear all EU/L3 residual
 contexts
Date: Thu, 16 Jan 2020 18:58:53 +0000
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

UXVvdGluZyBBa2VlbSBHIEFib2R1bnJpbiAoMjAyMC0wMS0xNCAxNzo0NTo0OCkKPiBkaWZmIC0t
Z2l0IGEvZHJpdmVycy9ncHUvZHJtL2k5MTUvZ3QvZ2VuN19yZW5kZXJjbGVhci5oIGIvZHJpdmVy
cy9ncHUvZHJtL2k5MTUvZ3QvZ2VuN19yZW5kZXJjbGVhci5oCj4gbmV3IGZpbGUgbW9kZSAxMDA2
NDQKPiBpbmRleCAwMDAwMDAwMDAwMDAuLjRiODhkZDhkMGZkNAo+IC0tLSAvZGV2L251bGwKPiAr
KysgYi9kcml2ZXJzL2dwdS9kcm0vaTkxNS9ndC9nZW43X3JlbmRlcmNsZWFyLmgKPiBAQCAtMCww
ICsxLDE2IEBACj4gKy8qIFNQRFgtTGljZW5zZS1JZGVudGlmaWVyOiBNSVQgKi8KPiArLyoKPiAr
ICogQ29weXJpZ2h0IMKpIDIwMTkgSW50ZWwgQ29ycG9yYXRpb24KPiArICovCj4gKwo+ICsjaWZu
ZGVmIF9fR0VON19SRU5ERVJDTEVBUl9IX18KPiArI2RlZmluZSBfX0dFTjdfUkVOREVSQ0xFQVJf
SF9fCj4gKwo+ICsjZGVmaW5lIGJhdGNoX2FkdmFuY2UoWSwgQ1MpIEdFTV9CVUdfT04oKFkpLT5l
bmQgIT0gKENTKSkKCkl0IHdvcmtzIGJldHRlciBpZiB5b3UgYWN0dWFsbHkgcHV0IGl0IHRvIHVz
ZSwgYWZ0ZXIgZXZlcnkKYmF0Y2hfYWxsb2NfaXRlbXMoKSBbZ2l2ZSBvciB0YWtlXS4gQW5kIGl0
IGRvZXNuJ3QgbmVlZCB0byBiZSB1c2VkCm91dHNpZGUgb2YgZ2VuN19yZW5kZXJjbGVhci5jIHNv
IGNhbiBsaXZlIHRoZXJlLgotQ2hyaXMKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJl
ZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGlu
Zm8vZHJpLWRldmVsCg==
