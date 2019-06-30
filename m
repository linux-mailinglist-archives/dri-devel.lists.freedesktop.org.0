Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C02B5B061
	for <lists+dri-devel@lfdr.de>; Sun, 30 Jun 2019 17:26:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C95E3898CA;
	Sun, 30 Jun 2019 15:26:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x543.google.com (mail-ed1-x543.google.com
 [IPv6:2a00:1450:4864:20::543])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5A213898CA;
 Sun, 30 Jun 2019 15:26:02 +0000 (UTC)
Received: by mail-ed1-x543.google.com with SMTP id k8so18499563edr.11;
 Sun, 30 Jun 2019 08:26:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=gHDuyQyipf6+B4/tN6dPauaHdhnnRjQUM73xUOdIo4Y=;
 b=JLDwWT60qaWmDHV2fCxu2ea0aOqMHlvjmuMeNVVgde/vgqdDblctgUFnSbyEPuOIRs
 bn2EBfWXZc3iDYba/rOqvSgX45eue2axsvhK9N0GxXEWCUm6Tkyvzy/sETbwG2uVn4s0
 I+qHRqTrQAlCTYpkxFBu25MabFxvgx/D+iKJN+OOOcn/KjY+XKvfYe2B+9TtS7B+p6OT
 oW2rf7HWqutMAH3QMZoTvh0EejeIhtBXn1Cll5UNSwaepfHNVV8slWYSfSVmS+scq/AJ
 pEI3SGL6jFZ3vt3xTSoKYaNJmHvAN5h3d+3Xe+SYFvVyQm0uhM4m4pe/oNFIyM005cSK
 VKnw==
X-Gm-Message-State: APjAAAXSliVx/pieHoRP3TKsJRq+9lThbrHJjFzxYsa/kCWnt6zQHHIE
 HKL89np2rRSnnCgkWzw0TmntZXcNhngL3h8vSUs=
X-Google-Smtp-Source: APXvYqxZ9nP6Qq2+dhZaSf9o86LLcNw3JpZzAZYVZtz/9E9mZvwLSU8JYIAlcm9Ap2Rzd45G312eAPczGSWb4PiCoFo=
X-Received: by 2002:aa7:d888:: with SMTP id u8mr23439480edq.264.1561908360841; 
 Sun, 30 Jun 2019 08:26:00 -0700 (PDT)
MIME-Version: 1.0
References: <20190629125933.679-1-linus.walleij@linaro.org>
 <20190629125933.679-4-linus.walleij@linaro.org>
 <CAF6AEGun2QEMVyO+L3W0UJubgzVPrFr5jkVoTOwHpy9b4MeJMQ@mail.gmail.com>
 <CACRpkdYAmVSiUQozgCvaNe_X1hcmhAzeApQcSxdhWC_wg0tdsg@mail.gmail.com>
In-Reply-To: <CACRpkdYAmVSiUQozgCvaNe_X1hcmhAzeApQcSxdhWC_wg0tdsg@mail.gmail.com>
From: Rob Clark <robdclark@gmail.com>
Date: Sun, 30 Jun 2019 08:25:44 -0700
Message-ID: <CAF6AEGtn+VEHszMeuap9zkPCm4NFc0CskjnF40HprUOzYi=1+Q@mail.gmail.com>
Subject: Re: [PATCH 4/7] gpio: of: Support some legacy Qualcomm HDMI bindings
To: Linus Walleij <linus.walleij@linaro.org>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=gHDuyQyipf6+B4/tN6dPauaHdhnnRjQUM73xUOdIo4Y=;
 b=JLRZSukeG+yRwOttw1L3BnWxitCLcqmur4EOXDxIG1IzDA7QVtWhebBqbRTwt1ClYD
 HE/OZsAycryAGYPJacynE3B2iCj3goyRHRZl7qGK1rvaLQ5cuF9k2pH6CUkkZiZdEsbb
 xtc/yFonh5PK7r0GaA3G22L+BsSbGO+dWDCuEIwB+jIyufhe2uWZn7qNk6BCf34eJ3ey
 BjIJUJFpsll2YFXWvH6Oy8elJIMhdmpx0YlEg9ydydXfCcMF/mrsKkTECG9Tu81P4Y5D
 sKt2/HA45TFFtbsAq8VA0mIIemFtNUHr9n3trpgiVyRwUIuRcvJwC3Z8/qqIYKVLNg2K
 JaaA==
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
Cc: freedreno <freedreno@lists.freedesktop.org>,
 Maxime Ripard <maxime.ripard@bootlin.com>,
 linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>, Sean Paul <sean@poorly.run>,
 "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE"
 <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gU3VuLCBKdW4gMzAsIDIwMTkgYXQgODoxOCBBTSBMaW51cyBXYWxsZWlqIDxsaW51cy53YWxs
ZWlqQGxpbmFyby5vcmc+IHdyb3RlOgo+Cj4gT24gU3VuLCBKdW4gMzAsIDIwMTkgYXQgMzoyNiBQ
TSBSb2IgQ2xhcmsgPHJvYmRjbGFya0BnbWFpbC5jb20+IHdyb3RlOgo+Cj4gPiBJJ20gb2sgd2l0
aCB0aGlzLi4gYWx0aG91Z2ggSSB3b25kZXIgaWYgd2UgbmVlZCB0byB0cnkgdGhpcyBoYXJkIGZv
cgo+ID4gYmFja3dhcmRzIGNvbXBhdD8gIEF0IGxlYXN0IEkgZG9uJ3Qgc2VlIGFueSB1cHN0cmVh
bSBkdHMKPiA+IHVzaW5nIHRoZSBvbGQgbmFtZXMuICBNYXliZSBpdCBpcyBvayB0byBqdXN0IGxv
b2sgdGhlIG90aGVyIHdheSBhbmQgYnJlYWsgdGhlbS4KPgo+IEkgYW0gdXN1YWxseSBvZiB0aGUg
b3BpbmlvbiB0aGF0IGlmIGEgdHJlZSBmYWxscyBpbiB0aGUgZm9yZXN0IGFuZCBub29uZQo+IGlz
IHRoZXJlIHRvIGhlYXIgaXQsIHdobyBjYXJlcyB3aGF0IHNvdW5kIGl0IG1ha2VzLgo+Cj4gU28g
d2UgY2FuIGp1c3QgYXBwbHkgdGhlIG90aGVyIHBhdGNoZXMgYW5kIG5vdCB0aGlzIG9uZSwgd2hp
Y2gKPiBzaG91bGQgd29yayBqdXN0IGZpbmUuIEl0IHdpbGwgc3VwcG9ydCB0aGUgdmFyaWFudHMg
b2YgdGhlCj4gYmluZGluZ3MgZW5kaW5nIHdpdGggIi1ncGlvcyIgb3IgIi1ncGlvIi4KClNvdW5k
cyBnb29kLi4gaWYgdGhlIHRyZWUgZmFsbHMgbG91ZCBlbm91Z2ggdGhhdCBzb21lb25lIGRvZXMg
aW5kZWVkCmhlYXIgaXQsIHdlIGNhbiByZXN1cnJlY3QgdGhpcyBwYXRjaCA6LSkKCkJSLAotUgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwg
bWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0
cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
