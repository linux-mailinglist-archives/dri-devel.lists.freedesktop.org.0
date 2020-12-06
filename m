Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CE5B2D05A9
	for <lists+dri-devel@lfdr.de>; Sun,  6 Dec 2020 16:24:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 057B089AC3;
	Sun,  6 Dec 2020 15:24:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail2.protonmail.ch (mail2.protonmail.ch [185.70.40.22])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 43DFE89AC3
 for <dri-devel@lists.freedesktop.org>; Sun,  6 Dec 2020 15:24:37 +0000 (UTC)
Date: Sun, 06 Dec 2020 15:24:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=emersion.fr;
 s=protonmail2; t=1607268274;
 bh=zRVY6/aKao5b8PXRY6VLD9cK6Z875ECLQLndqOJyTJA=;
 h=Date:To:From:Cc:Reply-To:Subject:In-Reply-To:References:From;
 b=jSnfpGNrUcQ25/DS5znns1/jIwo+4fZjmiNhLT2DqebqAhi3eQQ+I4VsFeB46HFVV
 FzdzYWFUmVX7OVdbOugBtPNNi97bsEAWA9eWAi4zztm3tl0AYbcaYynEiD+QRJQb/5
 cm4ypIyyjQ6I3iB6h+ndkixpYFUGe6+Vp8JjRV1Kk93SIxgEfKdS3KMTxbvZ3yLhTt
 uTTBDbK0caDzREn/j9nv0wOPo77aE6v3X9iAmCZY03OkQMQ279ntRGuNLD+BSjtAZ4
 /G9L1OVwOHIQ5sVWm+K/JwgMiMsN2kqZ2D8GimL0GquRB1ao8Qpis7qR9yNWn8ldM8
 WDW/zj+/LKNUA==
To: Daniel Vetter <daniel@ffwll.ch>
From: Simon Ser <contact@emersion.fr>
Subject: Re: [PATCH] drm: drivers may provide multiple primary planes per CRTC
Message-ID: <1A6pssulTBjmoPioJfGenq9NdbnGjw2dhBoivqmrgraY67Gac7BoUHupkvqc7UBF_q2P5RwEcXP-m-5Jd00vC2hg-QMkGj2Ms_Jh5nLz-os=@emersion.fr>
In-Reply-To: <20200807130636.GD2352366@phenom.ffwll.local>
References: <TJAyvL7GM0cZ61sbzYMZ7IbVow2d32QQntnAB5_zpBOdcKVIAy8qhZg4En6C8Ka-mUXV-goV21ExVsA8Q3N_lJV4jf6g6llQBQSDs602jgs=@emersion.fr>
 <20200807090706.GA2352366@phenom.ffwll.local>
 <20200807123802.6058baca@eldfell>
 <20200807130636.GD2352366@phenom.ffwll.local>
MIME-Version: 1.0
X-Spam-Status: No, score=-1.2 required=10.0 tests=ALL_TRUSTED,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF shortcircuit=no
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on
 mailout.protonmail.ch
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
Cc: dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

U29ycnksIEkgdGhpbmsgSSBsb3N0IHRyYWNrIG9mIHRoaXMgdGhyZWFkIGF0IHNvbWUgcG9pbnQg
YW5kIGZvcmdvdAphYm91dCBpdC4gVGhhdCBzYWlk4oCmCgpPbiBGcmlkYXksIEF1Z3VzdCA3dGgs
IDIwMjAgYXQgMzowNiBQTSwgRGFuaWVsIFZldHRlciA8ZGFuaWVsQGZmd2xsLmNoPiB3cm90ZToK
Cj4gT24gRnJpLCBBdWcgMDcsIDIwMjAgYXQgMTI6Mzg6MDJQTSArMDMwMCwgUGVra2EgUGFhbGFu
ZW4gd3JvdGU6Cj4gPiBPbiBGcmksIDcgQXVnIDIwMjAgMTE6MDc6MDYgKzAyMDAKPiA+IERhbmll
bCBWZXR0ZXIgPGRhbmllbEBmZndsbC5jaD4gd3JvdGU6Cj4gPgo+ID4gPiBPbiBUaHUsIEF1ZyAw
NiwgMjAyMCBhdCAxMDozMzozMUFNICswMDAwLCBTaW1vbiBTZXIgd3JvdGU6Cj4gPiA+ID4gU29t
ZSBkcml2ZXJzIG1heSBleHBvc2UgcHJpbWFyeSBwbGFuZXMgY29tcGF0aWJsZSB3aXRoIG11bHRp
cGxlIENSVENzLgo+ID4gPiA+IE1ha2UgdGhpcyBjbGVhciBpbiB0aGUgZG9jczogdGhlIGN1cnJl
bnQgd29yZGluZyBtYXkgYmUgbWlzdW5kZXJzdG9vZCBhcwo+ID4gPiA+ICJleGFjdGx5IG9uZSBw
cmltYXJ5IHBsYW5lIHBlciBDUlRDIi4KPiA+ID4gPgo+ID4gPiA+IFNpZ25lZC1vZmYtYnk6IFNp
bW9uIFNlciA8Y29udGFjdEBlbWVyc2lvbi5mcj4KPiA+ID4gPiBDYzogRGFuaWVsIFZldHRlciA8
ZGFuaWVsQGZmd2xsLmNoPgo+ID4gPiA+IC0tLQo+ID4gPiA+ICBkcml2ZXJzL2dwdS9kcm0vZHJt
X3BsYW5lLmMgfCA0ICsrLS0KPiA+ID4gPiAgMSBmaWxlIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygr
KSwgMiBkZWxldGlvbnMoLSkKPiA+ID4gPgo+ID4gPiA+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dw
dS9kcm0vZHJtX3BsYW5lLmMgYi9kcml2ZXJzL2dwdS9kcm0vZHJtX3BsYW5lLmMKPiA+ID4gPiBp
bmRleCBiN2I5MGIzYTJlMzguLjEwOGE5MjJlOGMyMyAxMDA2NDQKPiA+ID4gPiAtLS0gYS9kcml2
ZXJzL2dwdS9kcm0vZHJtX3BsYW5lLmMKPiA+ID4gPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vZHJt
X3BsYW5lLmMKPiA+ID4gPiBAQCAtNDksOCArNDksOCBAQAo+ID4gPiA+ICAgKiAmc3RydWN0IGRy
bV9wbGFuZSAocG9zc2libHkgYXMgcGFydCBvZiBhIGxhcmdlciBzdHJ1Y3R1cmUpIGFuZCByZWdp
c3RlcnMgaXQKPiA+ID4gPiAgICogd2l0aCBhIGNhbGwgdG8gZHJtX3VuaXZlcnNhbF9wbGFuZV9p
bml0KCkuCj4gPiA+ID4gICAqCj4gPiA+ID4gLSAqIEN1cnNvciBhbmQgb3ZlcmxheSBwbGFuZXMg
YXJlIG9wdGlvbmFsLiBBbGwgZHJpdmVycyBzaG91bGQgcHJvdmlkZSBvbmUKPiA+ID4gPiAtICog
cHJpbWFyeSBwbGFuZSBwZXIgQ1JUQyB0byBhdm9pZCBzdXJwcmlzaW5nIHVzZXJzcGFjZSB0b28g
bXVjaC4gU2VlIGVudW0KPiA+ID4gPiArICogQ3Vyc29yIGFuZCBvdmVybGF5IHBsYW5lcyBhcmUg
b3B0aW9uYWwuIEFsbCBkcml2ZXJzIHNob3VsZCBwcm92aWRlIGF0IGxlYXN0Cj4gPiA+ID4gKyAq
IG9uZSBwcmltYXJ5IHBsYW5lIHBlciBDUlRDIHRvIGF2b2lkIHN1cnByaXNpbmcgdXNlcnNwYWNl
IHRvbyBtdWNoLiBTZWUgZW51bQo+ID4gPgo+ID4gPiBJIHRoaW5rIHRoYXQncyBldmVuIG1vcmUg
Y29uZnVzaW5nLCBzaW5jZSB0aGlzIHJlYWRzIGxpa2UgdGhlcmUgY291bGQgYmUKPiA+ID4gbXVs
dGlwbGUgcHJpbWFyeSBwbGFuZXMgZm9yIGEgc3BlY2lmaWMgQ1JUQy4gVGhhdCdzIG5vdCB0aGUg
Y2FzZSwgdGhlcmUnCj4gPiA+IG9ubHkgb25lIHBvaW50ZXIgZ29pbmcgZnJvbSBkcm1fY3J0Yy0+
cHJpbWFyeSB0byBhIGRybV9wbGFuZSBpbiB0aGUKPiA+ID4ga2VybmVsLgo+ID4KPiA+IFRoZXJl
IGNvdWxkIGJlIG11bHRpcGxlIHByaW1hcnkgcGxhbmVzICp1c2FibGUqIGZvciBhIHNwZWNpZmlj
IENSVEMgYnV0Cj4gPiBqdXN0IG9uZSB1c2VkIGF0IGEgdGltZSwgcmlnaHQ/Cj4KPiBJJ20gbm90
IHN1cmUgd2hhdCB5b3UgbWVhbiBoZXJlLCB0aGUgY3J0Yy0+cHJpbWFyeSBsaW5rIGlzIGludmFy
aWFudCBvdmVyCj4gdGhlIGxpZmV0aW1lIG9mIGEgZHJpdmVyIGxvYWQuIFlvdSBjYW4ndCBwaWNr
IGEgZGlmZmVyZW50IG9uZSwgdGhhdCdzIHNldAo+IGF0IGRyaXZlciBpbml0IGJlZm9yZSBkcm1f
ZGV2X3JlZ2lzdGVyIChhbmQgaGVuY2UgYmVmb3JlIHVzZXJzcGFjZSBldmVyCj4gc2VlcyBhbnl0
aGluZykuCgpPSy4gSSdtIHBlcnNvbmFsbHkgbm90IHZlcnkgaW50ZXJlc3RlZCBpbiBkb2N1bWVu
dGluZyBsZWdhY3kgYml0cywgc28gSSdsbCBza2lwCnRoYXQuIEknbSBtYWlubHkgaW50ZXJlc3Rl
ZCBoZXJlIGluIG1ha2luZyBpdCBjbGVhciBwb3NzaWJsZV9jcnRjcyBmb3IgYQpwcmltYXJ5IHBs
YW5lIGNhbiBoYXZlIG1vcmUgdGhhbiBvbmUgYml0IHNldC4gQmVjYXVzZSBvZiB0aGUgcGFyYWdy
YXBoIGluIHRoZQpjdXJyZW50IGRvY3MsIHNvbWUgdXNlci1zcGFjZSBkZXZlbG9wZXJzIGhhdmUg
dW5kZXJzdG9vZCAibW9yZSB0aGFuIG9uZSBiaXQgc2V0CmluIHBvc3NpYmxlX2NydGNzIGZvciBh
IHByaW1hcnkgcGxhbmUgaXMgYSBrZXJuZWwgYnVnIi4KCkknbGwgc2VuZCBhIHYyIHRoYXQgbWFr
ZXMgaXQgY2xlYXIgdGhlc2UgcG9pbnRlcnMgYXJlIGZvciBsZWdhY3kgdUFQSS4KX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcg
bGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRl
c2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==
