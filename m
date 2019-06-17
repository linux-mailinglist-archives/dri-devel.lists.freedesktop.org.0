Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 00A3749A02
	for <lists+dri-devel@lfdr.de>; Tue, 18 Jun 2019 09:12:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6E1CB6E0EF;
	Tue, 18 Jun 2019 07:12:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-vs1-xe44.google.com (mail-vs1-xe44.google.com
 [IPv6:2607:f8b0:4864:20::e44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E13D1891AC
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Jun 2019 16:16:00 +0000 (UTC)
Received: by mail-vs1-xe44.google.com with SMTP id n21so6456697vsp.12
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Jun 2019 09:16:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=qQmSRu+9/ciMEk74FdjnT5EyLM/oYfhns2Sv98gXQKQ=;
 b=mQc3fs35RvjWmbvbIvCGqG7oJsKsx94A9VEV2r4ejoMn73RJUrcUDFcR5lNs7P9QWh
 2ecpJlh7fb7gpROdMuFmfznuOVPQRXmzNaP4a9E/UmE6c9303qMMav3cvqkrL6EGikx+
 OW4lZIRM4Xy/24c1nkyQpHixNfX09TKsPqCJUJtLN4mx454NlvhvqO1vTriqzM/8zkOP
 wzuzHKeH2lDumA1fK9J/s23IovTgLh4wShi/9sIgXU1W9pOIAFZ+U8eOxHlljErZGwsh
 Zso+dtHrvYiW6xCT/Vl5kHgQh7Sk/5b9IN9Pr/4k3eyDQc/s8DKmkz5SM0Edh9MXsBPi
 v+Rw==
X-Gm-Message-State: APjAAAVyoIV0FWXq2mGPObrEVQNTQJebt6sQ40pv07+kc7S69QQ5w/G+
 S/U2LYwHtyFOJK6aEJEIuE+1EVidN9LJ6isZWck=
X-Google-Smtp-Source: APXvYqzjRBBZjUcF4pveR06nHvyJQ46JmxJV/AnG40g/cVPwL2BF5JdmZMIDvskR2BhvlBGM6E3kQ6SK1aYsBQ4tJok=
X-Received: by 2002:a67:f998:: with SMTP id b24mr49714206vsq.180.1560788159899; 
 Mon, 17 Jun 2019 09:15:59 -0700 (PDT)
MIME-Version: 1.0
References: <20190614203144.3850-2-joseph.kogut@gmail.com>
 <20190614235719.8134-1-joseph.kogut@gmail.com>
 <20190616085928.GB3826@kozik-lap>
In-Reply-To: <20190616085928.GB3826@kozik-lap>
From: Joseph Kogut <joseph.kogut@gmail.com>
Date: Mon, 17 Jun 2019 09:15:23 -0700
Message-ID: <CAMWSM7j8dtsS4d-hOc3Sk6OJHs+SiGC9tEaZBEmO0VKmtJguKw@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] arm: dts: add ARM Mali GPU node for Odroid XU3
To: Krzysztof Kozlowski <krzk@kernel.org>
X-Mailman-Approved-At: Tue, 18 Jun 2019 07:12:01 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=qQmSRu+9/ciMEk74FdjnT5EyLM/oYfhns2Sv98gXQKQ=;
 b=TCZMnL+FLD4zJekHRbUA172UIv9s/PfZRpM+7lk5d5crxqQkbWMH4nQ7nVeABx5Zy1
 VO/tRNFw5InXjJr3dOIiAj6JkBUmUBoU/N3Evcn4NRXL/BF9E9Zcr9GFHqhdSWGOxPhc
 eT8fdgbwbObFgkJ2s0BlHuI+ZfoFlHaKYHG5hGVpYHLxAMdmroXn77Jwh85pgthDHVnt
 RCfOQ7rSL9VGRw1Vb+uIjiUHPTnMJUioxJJt6SQ5EU/0aqoge+8yWJ+k5kOWdbGzFLJ6
 xl6XUTrJa0LLsvVLFfA9qhuZTJ5TpNrkRKZ9Ps2j9+sQIUcitV86uCfbk9Zz1VJHxVkL
 rrnw==
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
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org,
 linux-samsung-soc@vger.kernel.org, airlied@linux.ie,
 dri-devel@lists.freedesktop.org, robh+dt@kernel.org, kgene@kernel.org,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgS3J6eXN6dG9mLAoKVGhhbmtzIGZvciB0aGUgcmV2aWV3LgoKT24gU3VuLCBKdW4gMTYsIDIw
MTkgYXQgMTo1OSBBTSBLcnp5c3p0b2YgS296bG93c2tpIDxrcnprQGtlcm5lbC5vcmc+IHdyb3Rl
Ogo+Cj4gT24gRnJpLCBKdW4gMTQsIDIwMTkgYXQgMDQ6NTc6MTlQTSAtMDcwMCwgSm9zZXBoIEtv
Z3V0IHdyb3RlOgo+ID4gQWRkIGRldmljZSB0cmVlIG5vZGUgZm9yIG1hbGkgZ3B1IG9uIE9kcm9p
ZCBYVTMgU29Dcy4KPiA+Cj4gPiBTaWduZWQtb2ZmLWJ5OiBKb3NlcGggS29ndXQgPGpvc2VwaC5r
b2d1dEBnbWFpbC5jb20+Cj4gPiAtLS0KPiA+Cj4gPiBDaGFuZ2VzIHYxIC0+IHYyOgo+ID4gLSBV
c2UgaW50ZXJydXB0IG5hbWUgb3JkZXJpbmcgZnJvbSBiaW5kaW5nIGRvYwo+ID4gLSBTcGVjaWZ5
IGEgc2luZ2xlIGNsb2NrIGZvciBHUFUgbm9kZQo+ID4gLSBBZGQgZ3B1IG9wcCB0YWJsZQo+ID4g
LSBGaXggd2FybmluZ3MgZnJvbSBJUlFfVFlQRV9OT05FCj4gPgo+ID4gIC4uLi9ib290L2R0cy9l
eHlub3M1NDIyLW9kcm9pZHh1My1jb21tb24uZHRzaSB8IDI2ICsrKysrKysrKysrKysrKysrKysK
Pgo+IFRoaXMgc2hvdWxkIGdvIHRvIGV4eW5vczU0MjItb2Ryb2lkLWNvcmUuZHRzaSBpbnN0ZWFk
LCBiZWNhdXNlIGl0IGlzCj4gY29tbW9uIHRvIGVudGlyZSBPZHJvaWQgRXh5bm9zNTQyMiBmYW1p
bHkgKG5vdCBvbmx5IFhVMyBmYW1pbHkpLgo+Cj4gPiAgMSBmaWxlIGNoYW5nZWQsIDI2IGluc2Vy
dGlvbnMoKykKPiA+Cj4gPiBkaWZmIC0tZ2l0IGEvYXJjaC9hcm0vYm9vdC9kdHMvZXh5bm9zNTQy
Mi1vZHJvaWR4dTMtY29tbW9uLmR0c2kgYi9hcmNoL2FybS9ib290L2R0cy9leHlub3M1NDIyLW9k
cm9pZHh1My1jb21tb24uZHRzaQo+ID4gaW5kZXggOTNhNDhmMmRkYTQ5Li5iOGE0MjQ2ZTNiMzcg
MTAwNjQ0Cj4gPiAtLS0gYS9hcmNoL2FybS9ib290L2R0cy9leHlub3M1NDIyLW9kcm9pZHh1My1j
b21tb24uZHRzaQo+ID4gKysrIGIvYXJjaC9hcm0vYm9vdC9kdHMvZXh5bm9zNTQyMi1vZHJvaWR4
dTMtY29tbW9uLmR0c2kKPiA+IEBAIC00OCw2ICs0OCwzMiBAQAo+ID4gICAgICAgICAgICAgICBj
b29saW5nLWxldmVscyA9IDwwIDEzMCAxNzAgMjMwPjsKPiA+ICAgICAgIH07Cj4gPgo+ID4gKyAg
ICAgZ3B1OiBncHVAMTE4MDAwMDAgewo+ID4gKyAgICAgICAgICAgICBjb21wYXRpYmxlID0gInNh
bXN1bmcsZXh5bm9zLW1hbGkiLCAiYXJtLG1hbGktdDYyOCI7Cj4KPiBUaGlzIGlzIGNvbW1vbiB0
byBhbGwgRXh5bm9zNTQyeCBjaGlwcyBzbyBpdCBzaG91bGQgZ28gdG8KPiBleHlub3M1NDIwLmR0
c2kuIEhlcmUgeW91IHdvdWxkIG5lZWQgdG8gb25seSBlbmFibGUgaXQgYW5kIHByb3ZpZGUKPiBy
ZWd1bGF0b3IuCj4KClRvIGNsYXJpZnksIHdoaWNoIHBpZWNlcyBhcmUgc3BlY2lmaWMgdG8gdGhl
IE9kcm9pZCBFeHlub3MgNTQyMgpmYW1pbHksIGFuZCB3aGljaCBhcmUgY29tbW9uIHRvIHRoZSBl
bnRpcmUgRXh5bm9zIDU0MnggZmFtaWx5PyBJJ20KdGhpbmtpbmcgdGhlIGdwdSBub2RlIGlzIGNv
bW1vbiB0byB0aGUgNTQyeCBmYW1pbHksIGluY2x1ZGluZyB0aGUKaW50ZXJydXB0cyBhbmQgY2xv
Y2ssIGFuZCB0aGUgcmVndWxhdG9yIGFuZCBvcHAgdGFibGUgYXJlIHNwZWNpZmljIHRvCnRoZSBP
ZHJvaWQgNTQyMj8KCj4gUHJvYmFibHkgdGhpcyBzaG91bGQgYmUgYWxzbyBhc3NvY2lhdGVkIHdp
dGggdG11X2dwdSBhcyBhIGNvb2xpbmcgZGV2aWNlCj4gKGlmIE1hbGkgcmVnaXN0ZXJzIGEgY29v
bGluZyBkZXZpY2UuLi4pLiBPdGhlcndpc2UgdGhlIHRtdV9ncHUgaXMgbm90Cj4gcmVhbGx5IHVz
ZWQgZm9yIGl0Lgo+CgpXZSBoYXZlIHR3byBvcGVyYXRpbmcgcGVyZm9ybWFuY2UgcG9pbnRzIGZv
ciB0aGUgR1BVLCBidXQgSSdtIG5vdCBzdXJlCmF0IHdoYXQgdGVtcGVyYXR1cmUgd2Ugc2hvdWxk
IHRyaXAgdGhlIGxvd2VyIG9wcC4gTG9va2luZyBhdCB0aGUgdHJpcAp0ZW1wZXJhdHVyZXMgZm9y
IHRoZSBDUFUsIHdlIGhhdmUgZm91ciBhbGVydHMsIGFuZCBvbmUgY3JpdGljYWwgdHJpcC4KVGhl
IGhpZ2hlc3QgYWxlcnQgaXMgODUgQywgd291bGQgaXQgYmUgcmVhc29uYWJsZSB0byB0cmlnZ2Vy
IHRoZSBsb3dlcgpHUFUgb3BwIGF0IHRoaXMgdGVtcGVyYXR1cmU/IFNob3VsZCBpdCB0cmlnZ2Vy
IHNvb25lcj8KCj4gPiArICAgICAgICAgICAgIHJlZyA9IDwweDExODAwMDAwIDB4NTAwMD47Cj4g
PiArICAgICAgICAgICAgIGludGVycnVwdHMgPSA8R0lDX1NQSSAyMTkgSVJRX1RZUEVfTEVWRUxf
SElHSD4sCj4gPiArICAgICAgICAgICAgICAgICAgICAgICAgICA8R0lDX1NQSSA3NCAgSVJRX1RZ
UEVfTEVWRUxfSElHSD4sCj4gPiArICAgICAgICAgICAgICAgICAgICAgICAgICA8R0lDX1NQSSAx
MTcgSVJRX1RZUEVfTEVWRUxfSElHSD47Cj4gPiArICAgICAgICAgICAgIGludGVycnVwdC1uYW1l
cyA9ICJqb2IiLCAibW11IiwgImdwdSI7Cj4gPiArICAgICAgICAgICAgIGNsb2NrcyA9IDwmY2xv
Y2sgQ0xLX0czRD47Cj4gPiArICAgICAgICAgICAgIG1hbGktc3VwcGx5ID0gPCZidWNrNF9yZWc+
Owo+Cj4gUGxlYXNlIGNoZWNrIGlmIGFsd2F5cy1vbiBwcm9wZXJ0eSBjb3VsZCBiZSByZW1vdmVk
IGZyb20gYnVjazQuCgpJJ3ZlIGNoZWNrZWQsIGFuZCB0aGlzIHByb3BlcnR5IGNhbiBiZSByZW1v
dmVkIHNhZmVseS4KCj4gQWxzbywgd2hhdCBhYm91dCBMRE8yNz8gSXQgc2hvdWxkIGJlIHVzZWQg
YXMgd2VsbCAobWF5YmUgdGhyb3VnaAo+IHZlbmRvci1zcGVjaWZpYyBwcm9wZXJ0aWVzIHdoaWNo
IHdvdWxkIGp1c3RpZnkgdGhlIG5lZWQgb2YgbmV3IHZlbmRvcgo+IGNvbXBhdGlibGUpLgo+CgpJ
J20gdW5zdXJlIGhvdyBMRE8yNyBpcyB1c2VkLCBjYW4geW91IGVsYWJvcmF0ZT8KCkJlc3QsCkpv
c2VwaApfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmkt
ZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6
Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
