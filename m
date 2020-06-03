Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C11C41ED09E
	for <lists+dri-devel@lfdr.de>; Wed,  3 Jun 2020 15:17:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 690CD8997C;
	Wed,  3 Jun 2020 13:17:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail2.protonmail.ch (mail2.protonmail.ch [185.70.40.22])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4BADB8997C
 for <dri-devel@lists.freedesktop.org>; Wed,  3 Jun 2020 13:17:22 +0000 (UTC)
Date: Wed, 03 Jun 2020 13:17:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=emersion.fr;
 s=protonmail; t=1591190239;
 bh=4F+nlohqWQXtqeVpU/E3G2P/EsMIQwmznCz20+77RJ4=;
 h=Date:To:From:Cc:Reply-To:Subject:In-Reply-To:References:From;
 b=O2sFHiY+sIqb+FojGMH40Dw/i5tWqsOc+fghP2RPm1My3ZfSjkjR6WYwHKK+MNCz5
 7ft38HTg64wG54hy/JKh0v7BDqUgy+Q4gWb71Ah1OIrOPP1T195bhs9ABvO50Ll5kG
 5fF8FMRLmDkfbElIKjxrZ9V8vXKu/GNqCB/3tYgI=
To: Daniel Vetter <daniel@ffwll.ch>
From: Simon Ser <contact@emersion.fr>
Subject: Re: [PATCH] drm/atomic: don't reset link-status to GOOD without
 ALLOW_MODESET
Message-ID: <JVT0GCme37ZPwkrYR-Ly9A-jZKs8QGDGOgPcmyDgPHvYRwtNutsoG53fkrrKB95t-ml7YKa0gEpCchaW7jIgDW-XnBCYh6xjPrsO-3W05mo=@emersion.fr>
In-Reply-To: <20200603113646.GK20149@phenom.ffwll.local>
References: <6Q-O7vKObfRu8cOyvcAxR_uRWgjQdlYgVursTGN2AaHtdaUZICSC6szFjkkDGXhyKF22Grj-aGCTC74OGhtuJ9JChitqvqtCVi1wr_Lnh6Y=@emersion.fr>
 <20200603111343.GO6112@intel.com>
 <20200603113646.GK20149@phenom.ffwll.local>
MIME-Version: 1.0
X-Spam-Status: No, score=-1.2 required=7.0 tests=ALL_TRUSTED,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF shortcircuit=no
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on mail.protonmail.ch
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
Reply-To: Simon Ser <contact@emersion.fr>
Cc: Manasi Navare <manasi.d.navare@intel.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gV2VkbmVzZGF5LCBKdW5lIDMsIDIwMjAgMTozNiBQTSwgRGFuaWVsIFZldHRlciA8ZGFuaWVs
QGZmd2xsLmNoPiB3cm90ZToKCj4gT24gV2VkLCBKdW4gMDMsIDIwMjAgYXQgMDI6MTM6NDNQTSAr
MDMwMCwgVmlsbGUgU3lyasOkbMOkIHdyb3RlOgo+Cj4gPiBPbiBXZWQsIEp1biAwMywgMjAyMCBh
dCAxMDo0NToyM0FNICswMDAwLCBTaW1vbiBTZXIgd3JvdGU6Cj4gPgo+ID4gPiBJbiB1cGRhdGVf
b3V0cHV0X3N0YXRlLCB0aGUgbGluay1zdGF0dXMgcHJvcGVydHkgd2FzIHJlc2V0IHRvIEdPT0Qg
dG8KPiA+ID4gZW5zdXJlIGxlZ2FjeSBkcm1Nb2RlU2V0Q3J0YyByZS10cmFpbnMgdGhlIGxpbmsu
IEhvd2V2ZXIgdGhpcyBhdXRvLXJlc2V0Cj4gPiA+IGlzIGFsc28gcGVyZm9ybWVkIG9uIGFuIGF0
b21pYyBjb21taXQgd2l0aG91dCBBTExMT1dfTU9ERVNFVC4gSWYgYQo+ID4KPiA+IEkgZGlkbid0
IHRoaW5rIHVkYXRlX291dHB1dF9zdGF0ZSgpIHdhcyBnZXR0aW5nIGNhbGxlZCBmb3IKPiA+IG5v
bi1sZWdhY3kgcGF0aHMuIFdoZXJlIGlzIHRoYXQgY29taW5nIGZyb20/Cj4KPiBPb3BzLCBJJ20g
YmxpbmQgYW5kIHlvdSdyZSByaWdodCwgdGhlcmUncyBubyBidWcuIFdlIGFscmVhZHkgb25seQo+
IGZvcmNlLXNldCB0aGlzIGZvciBsZWdhY3kgbW9kZXNldCAoYW5kIGZiY29uKS4KCkluZGVlZCwg
Z29vZCBjYXRjaCBWaWxsZS4gc2V0X2NvbmZpZyBpcyBwdXJlbHkgYSBsZWdhY3kgdGhpbmcuCgo+
IFRoYXQgYWxzbyBtZWFucyB0aGF0IGF0b21pYyB1c2Vyc3BhY2UgaGFzIHRvIGhhbmRsZSB0aGlz
LCB3aGljaCBpcyBtYXliZQo+IG5vdCBzbyBhd2Vzb21lIC4uLiBTbyBtYXliZSB3ZSBuZWVkIHRv
IGR1Y3QtdGFwZSBvdmVyIHRoaXMgZm9yIGF0b21pYyB0b28sCj4gYW5kIGluIHRoYXQgY2FzZSBp
dCBzaG91bGQgYmUgb25seSBkb25lIHdoZW4gQUxMT1dfTU9ERVNFVCBpcyBzZXQuCj4KPiBCdXQg
bWF5YmUgYWxsIHRoZSBjb21wb3NpdG9ycyB0aGF0IGNhcmUgd2lsbCBoYW5kbGUgdGhpcyA6LS8K
Ck5vdCBmb25kIG9mIHRoaXMgYmVjYXVzZSB3ZSdsbCBiYXNpY2FsbHkgZW5kIHVwIHdpdGggc29t
ZSBkcml2ZXJzCmNoZWNraW5nIGZvciBsaW5rLXN0YXR1cyAobm9uZSBkbyB0aGF0IHlldCkgYW5k
IHNvbWUgdXNlci1zcGFjZQpyZXNldHRpbmcgaXQgdG8gR09PRC4gSXQnbGwgYnJlYWsgb25seSBp
ZiB1c2VyLXNwYWNlIGRvZXNuJ3QgcmVzZXQgYW5kCmEgZHJpdmVyIHdoaWNoIGNoZWNrcyBsaW5r
LXN0YXR1cyBpcyB1c2VkLiBEcml2ZXItc3BlY2lmaWMgYmVoYXZpb3VyCmlzbid0IGdyZWF0Lgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwg
bWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0
cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
