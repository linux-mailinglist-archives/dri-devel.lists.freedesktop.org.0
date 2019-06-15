Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DBA146F3C
	for <lists+dri-devel@lfdr.de>; Sat, 15 Jun 2019 11:14:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5FA0E892A8;
	Sat, 15 Jun 2019 09:14:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x243.google.com (mail-oi1-x243.google.com
 [IPv6:2607:f8b0:4864:20::243])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B83D6892A8
 for <dri-devel@lists.freedesktop.org>; Sat, 15 Jun 2019 09:14:50 +0000 (UTC)
Received: by mail-oi1-x243.google.com with SMTP id s184so3711863oie.9
 for <dri-devel@lists.freedesktop.org>; Sat, 15 Jun 2019 02:14:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=7nFGT83KUMQga2ToUSrlRH9JDnT55s8cSq0IgVm+6LE=;
 b=jB8yUZloq5YfiGwIzd6fh4vFGLGTTh3KPPbxCb6pGelG6eG2kZe4fOvJUZmzaHxDzX
 ec7JPBiTfV6DYZ6Hv+cvrjYJBa1cCllVILEABjlag68pIq0vjSptEuuSTVRZbjKg06yO
 8sP5GiY5ZMhwz0IRqu9tG0IkMYBaHiPaqG+u1PuCGgE/HAMfuEj22MSNkK+cmWxuDzcz
 LGRGjFSDlEysIyba7A4jG5D0PX3dXGRnaYORPNljPWteyktjBm28SjUGNViVdh1MptvH
 bL2udn6TT2u/yJFBnbzpkFqwSOMMalA6R1tX69bpwhimpnASdCduaC5Y9Sm4HIJaJtFY
 2KWw==
X-Gm-Message-State: APjAAAWW1jSSjOQEbbZfAdGl2I4cMfNaJ5Dd6YphIvwaSTIHUSpDUGB+
 entX5IuQvVUrhFgwb+N6H6TzE7UKKH89qKv1XCIWSA==
X-Google-Smtp-Source: APXvYqze3vt0iZ1v9GqjCAcwK0yeL7Fq8WIIsHgF5QNxL95/O3LLZrvzjyt5FO8owsKmJeBqTwx4cxbDCiCb7X7ESZI=
X-Received: by 2002:aca:b2d5:: with SMTP id b204mr4280774oif.101.1560590089581; 
 Sat, 15 Jun 2019 02:14:49 -0700 (PDT)
MIME-Version: 1.0
References: <20190614203615.12639-1-daniel.vetter@ffwll.ch>
 <20190614203615.12639-33-daniel.vetter@ffwll.ch>
 <CACRpkdaoGHaNT6dQEfMnCcuzUsJDNp=7=zc9Nrz5yAH6KiWWwQ@mail.gmail.com>
In-Reply-To: <CACRpkdaoGHaNT6dQEfMnCcuzUsJDNp=7=zc9Nrz5yAH6KiWWwQ@mail.gmail.com>
From: Daniel Vetter <daniel.vetter@ffwll.ch>
Date: Sat, 15 Jun 2019 11:14:36 +0200
Message-ID: <CAKMK7uF2YTm8znmqkTQHjBwv-NM=ikBe8HWasMKBsAze0UPNUg@mail.gmail.com>
Subject: Re: [PATCH 32/59] drm/tve2000: Drop drm_gem_prime_export/import
To: Linus Walleij <linus.walleij@linaro.org>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=7nFGT83KUMQga2ToUSrlRH9JDnT55s8cSq0IgVm+6LE=;
 b=P/v3eCfOmc+dVqTZGiJdx4g4VEIvoCcKZBnWqIPlP+88YhGz4PsNqWZYk4S88zMs7K
 U5913z5gqtLUp9QhtXUQnrFrFf/jCYNP1mARjIqyOrjeRF/KgjMlc0N2+apeEd6dgsNB
 AOaeRvl2x8a5iIbaxv/col263y6ZACyOvZx4I=
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
Cc: Daniel Vetter <daniel.vetter@intel.com>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 DRI Development <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gU2F0LCBKdW4gMTUsIDIwMTkgYXQgMTA6MzUgQU0gTGludXMgV2FsbGVpaiA8bGludXMud2Fs
bGVpakBsaW5hcm8ub3JnPiB3cm90ZToKPgo+IE9uIEZyaSwgSnVuIDE0LCAyMDE5IGF0IDEwOjM2
IFBNIERhbmllbCBWZXR0ZXIgPGRhbmllbC52ZXR0ZXJAZmZ3bGwuY2g+IHdyb3RlOgo+Cj4gPiBU
aGV5J3JlIHRoZSBkZWZhdWx0Lgo+ID4KPiA+IEFzaWRlOiBXb3VsZCBiZSByZWFsbHkgbmljZSB0
byBzd2l0Y2ggdGhlIG90aGVycyBvdmVyIHRvCj4gPiBkcm1fZ2VtX29iamVjdF9mdW5jcy4KPiA+
Cj4gPiBTaWduZWQtb2ZmLWJ5OiBEYW5pZWwgVmV0dGVyIDxkYW5pZWwudmV0dGVyQGludGVsLmNv
bT4KPiA+IENjOiBMaW51cyBXYWxsZWlqIDxsaW51cy53YWxsZWlqQGxpbmFyby5vcmc+Cj4KPiBS
ZXZpZXdlZC1ieTogTGludXMgV2FsbGVpaiA8bGludXMud2FsbGVpakBsaW5hcm8ub3JnPgo+Cj4g
V2hlbiB5b3Ugd3JpdGUgIldvdWxkIGJlIHJlYWxseSBuaWNlIHRvIHN3aXRjaCB0aGUgb3RoZXJz
IG92ZXIgdG8KPiBkcm1fZ2VtX29iamVjdF9mdW5jcy4iIGFyZSB5b3UgcmVmZXJyaW5nIHRvIHRo
ZSBvdGhlcgo+IGRybSBkcml2ZXIgZnVuY3Rpb24gY2FsbGVkIGJ5IHRoaXMgb25lIGRyaXZlciwg
b3IgYXJlIHlvdQo+IHJlZmVycmluZyB0byBvdGhlciBkcml2ZXJzIG5vdCB1c2luZyB0aGVzZSBm
dW5jdGlvbnM/Cj4KPiBJZiB0aGUgZm9ybWVyIGFuZCBpZiB0aGVyZSBpcyBzb21lIG5pY2UgdXBz
dHJlYW0gY29tbWl0Cj4gSSBzaG91bGQgYmUgbG9va2luZyBhdCBmb3IgaW5zcGlyYXRpb24gSSBj
YW4gdGFrZSBhIHN0YWIgYXQKPiBmaXhpbmcgdGhpcyBkcml2ZXIuCgpUaGVyZSdzIGEgcGlsZSBv
ZiBjYWxsYmFja3MgaW4gZHJtX2RyaXZlciBhcm91bmQgZ2VtIG9iamVjdCBoYW5kbGluZwp3aGlj
aCB3ZSB3YW50IHRvIG1vdmUgb3ZlciB0byBkcm1fZ2VtX29iamVjdF9mdW5jcy4gUGF0Y2ggMiBp
biB0aGlzCnNlcmllcyBoZXJlIGhhcyBhIHByZXR0eSBiaWcgZG9jIHVwZGF0ZS4gVGhlIGhvb2tz
IGhhdmUgZXhhY3RseSB0aGUKc2FtZSBmdW5jdGlvbiBzaWduYXR1cmUgKGF0IGxlYXN0IGFmdGVy
IHRoaXMgc2VyaWVzKSBhbmQgc2VtYW50aWNzLApqdXN0IHN0b3JlZCBzb21ld2hlcmUgZWxzZS4g
Rm9yIHRoZSBkcml2ZXJzIHVzaW5nIGhlbHBlcnMgdGhpcyBzaG91bGQKYW1vdW50IHRvIGp1c3Qg
Y3JlYXRpbmcgYW4gZXhwb3J0IGRlZmF1bHQgZnVuY3Rpb24gdGFibGUgZm9yCmRybV9nZW1fb2Jq
ZWN0X2Z1bmNzIGFuZCB1c2luZyBpdCBldmVyeXdoZXJlLgoKQXNpZGU6IEluIGdlbmVyYWwgdGhl
IGNoYW90aWMgcGlsZSBvZiBob29rcyBpbiBzdHJ1Y3QgZHJtX2RyaXZlciBpcwpsYXJnZWx5IGRl
cHJlY2F0ZWQuIFRoZXJlJ3MgYSBmZXcgdGhpbmdzIHdoZXJlIHdlIGRvbid0IHlldCBoYXZlIG1v
cmUKZm9jdXNlZCB2dGFibGVzLgotRGFuaWVsCi0tIApEYW5pZWwgVmV0dGVyClNvZnR3YXJlIEVu
Z2luZWVyLCBJbnRlbCBDb3Jwb3JhdGlvbgorNDEgKDApIDc5IDM2NSA1NyA0OCAtIGh0dHA6Ly9i
bG9nLmZmd2xsLmNoCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9y
ZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZl
bA==
