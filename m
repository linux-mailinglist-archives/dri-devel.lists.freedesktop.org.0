Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B0F7FB3468
	for <lists+dri-devel@lfdr.de>; Mon, 16 Sep 2019 07:30:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 32FA56E0FD;
	Mon, 16 Sep 2019 05:30:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x343.google.com (mail-ot1-x343.google.com
 [IPv6:2607:f8b0:4864:20::343])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9FC626E0FD
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Sep 2019 05:30:02 +0000 (UTC)
Received: by mail-ot1-x343.google.com with SMTP id h17so30660142otn.5
 for <dri-devel@lists.freedesktop.org>; Sun, 15 Sep 2019 22:30:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=uaOfZgiRYci8brLu6u70UJApCKOz1WkeM0Sygqw8wnU=;
 b=pB2jdcoEraKsfBB/vinWgErTumCJ5vIIomYX9WOcIfYnlH1tk2xtaPEkcAO4nu87FD
 AD1BgDoWOX3nLtiw8dTE7FKL4M6FqtcB0dd/kPuXDzep2yuU0dsRS1NHM25PZUVpR7kN
 wOJnYVgEoilRfKqx3ZExO54roarpbSWY+WAAmvHtEb8/3Fwl1VydV4fPlte0UUS3Dlvw
 IUNU5WhlUc7KpduZmCbPaG4ufkZNBeW+KDg9N3UvyH5VEFgd/jCjjL3eETSOlzKqZJnk
 b0oh0S1U+XUxfQ0/UvZiEsMjGbaQL3+qmBujE5KqlkqtG79XRZms4ZGbnwoyf2S4TRpe
 HCpA==
X-Gm-Message-State: APjAAAUqBNGOtH/9XbOYQyP8g12T0AQiGP3+E7t3ZojkKAMMZIK7sAd6
 /7qwuwOThacV2b+GN5lMgLTgtlddmVzoFcu6LX4=
X-Google-Smtp-Source: APXvYqx9+/nthixP8A0pvQOeOP0zB3tjJ0mrqn4bOMi28alYMwtwVeyWhFVx9mdDHRY0hI1r9dz1fpHzngfdU0hjWqA=
X-Received: by 2002:a9d:7859:: with SMTP id c25mr18945488otm.371.1568611801814; 
 Sun, 15 Sep 2019 22:30:01 -0700 (PDT)
MIME-Version: 1.0
References: <20190915211818.GH4352@sirena.co.uk>
In-Reply-To: <20190915211818.GH4352@sirena.co.uk>
From: Vasily Khoruzhick <anarsoul@gmail.com>
Date: Sun, 15 Sep 2019 22:29:35 -0700
Message-ID: <CA+E=qVfm78f+2a2s=8Q7tL-fP7xCEj0v=_JXD_XbaR-2dfXmCA@mail.gmail.com>
Subject: Re: linux-next: manual merge of the drm tree with the drm-misc-fixes
 tree
To: Mark Brown <broonie@kernel.org>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=uaOfZgiRYci8brLu6u70UJApCKOz1WkeM0Sygqw8wnU=;
 b=dUaPMDJFgfbOyjiqlaeT54gDZiCJCSwKcGkpSShd2Bdb0E+fFnqdlfyolHVesJCpMs
 W3XA4yH4Y3xF7vw4Rrm3Yq/YvufvF5YCuGx0s4Bx5i2LZ4xkfAVeJLiTSmMJU5Am6g81
 TK0VtTndZobK6Ygt+fyZPeHVCurxCsCTYWKj7nbJRPAt7XwrOr7lDNw2VZtrjY4SbZ5h
 mgSDt+X5ssdM9BYvoupdRoKyL/LS9iDpdLUrlfazIYC/sdA9WYr9llrwSidsRb45A4Il
 X7sBCYO8dEuUdm0itK1/zcH+xLaJc9b5mpz+jKoXgKEdPsNUVd2VXn1GLI6h6FlgeDYp
 FcCA==
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
Cc: Dave Airlie <airlied@linux.ie>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 DRI <dri-devel@lists.freedesktop.org>,
 Linux Next Mailing List <linux-next@vger.kernel.org>,
 Qiang Yu <yuq825@gmail.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gU3VuLCBTZXAgMTUsIDIwMTkgYXQgMjoxOCBQTSBNYXJrIEJyb3duIDxicm9vbmllQGtlcm5l
bC5vcmc+IHdyb3RlOgo+Cj4gSGkgYWxsLAoKSGkgTWFyaywKCj4gVG9kYXkncyBsaW51eC1uZXh0
IG1lcmdlIG9mIHRoZSBkcm0gdHJlZSBnb3QgYSBjb25mbGljdCBpbjoKPgo+ICAgZHJpdmVycy9n
cHUvZHJtL2xpbWEvbGltYV9nZW0uYwo+Cj4gYmV0d2VlbiBjb21taXQ6Cj4KPiAgIDIxNjcwYmQ3
OGEyNTAwMWNmOGUgKCJkcm0vbGltYTogZml4IGxpbWFfZ2VtX3dhaXQoKSByZXR1cm4gdmFsdWUi
KQo+Cj4gZnJvbSB0aGUgZHJtLW1pc2MtZml4ZXMgdHJlZSBhbmQgY29tbWl0Ogo+Cj4gICA1Mjc5
MWVlZWMxZDlmNGE3ZTdmICgiZG1hLWJ1ZjogcmVuYW1lIHJlc2VydmF0aW9uX29iamVjdCB0byBk
bWFfcmVzdiIpCj4KPiBmcm9tIHRoZSBkcm0gdHJlZS4KPgo+IEkgZml4ZWQgaXQgdXAgKHNlZSBi
ZWxvdykgYW5kIGNhbiBjYXJyeSB0aGUgZml4IGFzIG5lY2Vzc2FyeS4gVGhpcwo+IGlzIG5vdyBm
aXhlZCBhcyBmYXIgYXMgbGludXgtbmV4dCBpcyBjb25jZXJuZWQsIGJ1dCBhbnkgbm9uIHRyaXZp
YWwKPiBjb25mbGljdHMgc2hvdWxkIGJlIG1lbnRpb25lZCB0byB5b3VyIHVwc3RyZWFtIG1haW50
YWluZXIgd2hlbiB5b3VyIHRyZWUKPiBpcyBzdWJtaXR0ZWQgZm9yIG1lcmdpbmcuICBZb3UgbWF5
IGFsc28gd2FudCB0byBjb25zaWRlciBjb29wZXJhdGluZwo+IHdpdGggdGhlIG1haW50YWluZXIg
b2YgdGhlIGNvbmZsaWN0aW5nIHRyZWUgdG8gbWluaW1pc2UgYW55IHBhcnRpY3VsYXJseQo+IGNv
bXBsZXggY29uZmxpY3RzLgoKRml4IGxvb2tzIGNvcnJlY3QgdG8gbWUuIFNvcnJ5IGZvciBub3Qg
dGVzdGluZyBteSBwYXRjaCB3aXRoCmxpbnV4LW5leHQsIEknbGwgbWFrZSBzdXJlIGl0IGF0IGxl
YXN0IGNvbXBpbGVzIG5leHQgdGltZS4KCj4gZGlmZiAtLWNjIGRyaXZlcnMvZ3B1L2RybS9saW1h
L2xpbWFfZ2VtLmMKPiBpbmRleCBiNjA5ZGMwMzBkNmNhLGZmM2Q5YWNjMjRmY2YuLjAwMDAwMDAw
MDAwMDAKPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vbGltYS9saW1hX2dlbS5jCj4gKysrIGIvZHJp
dmVycy9ncHUvZHJtL2xpbWEvbGltYV9nZW0uYwo+IEBAQCAtMzQxLDggLTM0MSw4ICszNDEsOCBA
QEAgaW50IGxpbWFfZ2VtX3dhaXQoc3RydWN0IGRybV9maWxlICpmaWxlCj4KPiAgICAgICAgIHRp
bWVvdXQgPSBkcm1fdGltZW91dF9hYnNfdG9famlmZmllcyh0aW1lb3V0X25zKTsKPgo+IC0gICAg
ICAgcmV0ID0gZHJtX2dlbV9yZXNlcnZhdGlvbl9vYmplY3Rfd2FpdChmaWxlLCBoYW5kbGUsIHdy
aXRlLCB0aW1lb3V0KTsKPiArICAgICAgIHJldCA9IGRybV9nZW1fZG1hX3Jlc3Zfd2FpdChmaWxl
LCBoYW5kbGUsIHdyaXRlLCB0aW1lb3V0KTsKPiAgLSAgICAgIGlmIChyZXQgPT0gMCkKPiAgKyAg
ICAgIGlmIChyZXQgPT0gLUVUSU1FKQo+ICAgICAgICAgICAgICAgICByZXQgPSB0aW1lb3V0ID8g
LUVUSU1FRE9VVCA6IC1FQlVTWTsKPgo+ICAgICAgICAgcmV0dXJuIHJldDsKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlz
dApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0
b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
