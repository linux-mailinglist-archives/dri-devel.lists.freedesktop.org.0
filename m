Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DF9A94C49E
	for <lists+dri-devel@lfdr.de>; Thu, 20 Jun 2019 02:53:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8F34B6E49A;
	Thu, 20 Jun 2019 00:53:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-xd44.google.com (mail-io1-xd44.google.com
 [IPv6:2607:f8b0:4864:20::d44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1E5BE6E49A;
 Thu, 20 Jun 2019 00:53:04 +0000 (UTC)
Received: by mail-io1-xd44.google.com with SMTP id s7so855433iob.11;
 Wed, 19 Jun 2019 17:53:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=li+r14SDKIqHJv4KbOac1fTpdYEcS5HP4GgaJBk2r/o=;
 b=HIw2WFYWIz8IPrpXY01YhSReJSxP9iMUfHJ4Isc23gIsG06NchmaTUXP9dpRPcCtnG
 fwVnmhEiLj8mOfAZcefa/Faa5wc1lKKfRtIbf+Ikl4FJ/Q7sHKFhjmn/Po9LPlpemphH
 xiTz+/DpfyI3+WO+3Ivya1vWigqEhNJShQKGAhP5KpYHOhix0y2BGbcEbf7PpNpI9aAF
 J0GhHAq7Ei+en4FUUlRDoIt8iIqdfN0JzRG+aUgiDcGvR5FZqn37IZxI3Elu5ol3dE7P
 QVJid7WTet1OrJRCnN1GxUn76dab7kljVhX3Kjn7agIo2sBGK2lFLIr6BPNgg+LE/ZV7
 jjEg==
X-Gm-Message-State: APjAAAXToaVmfI9BZ/Zau9kJAWXQA5fVlRymeVkzzS0s+L0irxY8zTm2
 KQ2ZPFXALkG6VQOIj74Tl3+XDFg7YNNLL//dQ1w=
X-Google-Smtp-Source: APXvYqwkGwzSMQwks/z00/F8glQdMrPUwzjON21KAQbpE9JI43ZzKc6ZCqOWItnUvf2c17deO83TSZpkNUzWw8VsL2U=
X-Received: by 2002:a6b:f90f:: with SMTP id j15mr7415199iog.43.1560991983500; 
 Wed, 19 Jun 2019 17:53:03 -0700 (PDT)
MIME-Version: 1.0
References: <20190618185502.3839-1-krzk@kernel.org>
In-Reply-To: <20190618185502.3839-1-krzk@kernel.org>
From: Qiang Yu <yuq825@gmail.com>
Date: Thu, 20 Jun 2019 08:52:52 +0800
Message-ID: <CAKGbVbuai1sBvqovBQZg8BfqEKqFPnKO5YRs-yd_JKXijEHRLA@mail.gmail.com>
Subject: Re: [PATCH 1/3] drm/lima: Mark 64-bit number as ULL to silence Smatch
 warning
To: Krzysztof Kozlowski <krzk@kernel.org>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=li+r14SDKIqHJv4KbOac1fTpdYEcS5HP4GgaJBk2r/o=;
 b=KagjoOjeKfrvmdNtVCxeZybLpwXlC7xn3JvOMLWm/KbGu+x1paZeaqkEEznWDOifOK
 ihkAfAuE5QPJHKSRWCTW7aCpMcv7djUgSexcx0RA5xbUPeEnssVWKnMM+tVSTRdNvvQ0
 yG5QonqnbhbqOLY7LumoWJyDvdx5UsxyXmbeHqnGl2K1GnJ4SOPSmKu6fGU6XMrDyI40
 FBtU0ahfRdDg180uuZzC8q/yIbWEDaBEm4mtq4DcswSl2nR/CflmZjthI20mi3BNILaV
 1vd1YVT0ODGFR5pl5aYXwNsLW9YK525rLsPe1El6SYpYRuSHsy39pT3RvHIaHbzBIvbd
 cl9w==
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
Cc: lima@lists.freedesktop.org, Tomeu Vizoso <tomeu.vizoso@collabora.com>,
 David Airlie <airlied@linux.ie>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

TG9va3MgZ29vZCBmb3IgbWUsIHBhdGNoIGlzOgpSZXZpZXdlZC1ieTogUWlhbmcgWXUgPHl1cTgy
NUBnbWFpbC5jb20+CgpJJ2xsIGFwcGx5IGl0IHRvIGRybS1taXNjLW5leHQuCgpSZWdhcmRzLApR
aWFuZwoKT24gV2VkLCBKdW4gMTksIDIwMTkgYXQgMjo1NSBBTSBLcnp5c3p0b2YgS296bG93c2tp
IDxrcnprQGtlcm5lbC5vcmc+IHdyb3RlOgo+Cj4gTWFyayBsb25nIG51bWJlcnMgd2l0aCBVTEwg
dG8gc2lsZW5jZSB0aGUgU21hdGNoIHdhcm5pbmc6Cj4KPiAgICAgZHJpdmVycy9ncHUvZHJtL2xp
bWEvbGltYV9kZXZpY2UuYzozMTQ6MzI6IHdhcm5pbmc6IGNvbnN0YW50IDB4MTAwMDAwMDAwIGlz
IHNvIGJpZyBpdCBpcyBsb25nIGxvbmcKPgo+IFNpZ25lZC1vZmYtYnk6IEtyenlzenRvZiBLb3ps
b3dza2kgPGtyemtAa2VybmVsLm9yZz4KPiAtLS0KPiAgZHJpdmVycy9ncHUvZHJtL2xpbWEvbGlt
YV92bS5oIHwgNCArKy0tCj4gIDEgZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKyksIDIgZGVs
ZXRpb25zKC0pCj4KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2xpbWEvbGltYV92bS5o
IGIvZHJpdmVycy9ncHUvZHJtL2xpbWEvbGltYV92bS5oCj4gaW5kZXggY2FlZTJmOGEyOWI0Li5l
MGJkZWRjZjE0ZGQgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL2xpbWEvbGltYV92bS5o
Cj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL2xpbWEvbGltYV92bS5oCj4gQEAgLTE1LDkgKzE1LDkg
QEAKPiAgI2RlZmluZSBMSU1BX1ZNX05VTV9QVF9QRVJfQlQgKDEgPDwgTElNQV9WTV9OVU1fUFRf
UEVSX0JUX1NISUZUKQo+ICAjZGVmaW5lIExJTUFfVk1fTlVNX0JUIChMSU1BX1BBR0VfRU5UX05V
TSA+PiBMSU1BX1ZNX05VTV9QVF9QRVJfQlRfU0hJRlQpCj4KPiAtI2RlZmluZSBMSU1BX1ZBX1JF
U0VSVkVfU1RBUlQgIDB4RkZGMDAwMDAKPiArI2RlZmluZSBMSU1BX1ZBX1JFU0VSVkVfU1RBUlQg
IDB4MEZGRjAwMDAwVUxMCj4gICNkZWZpbmUgTElNQV9WQV9SRVNFUlZFX0RMQlUgICBMSU1BX1ZB
X1JFU0VSVkVfU1RBUlQKPiAtI2RlZmluZSBMSU1BX1ZBX1JFU0VSVkVfRU5EICAgIDB4MTAwMDAw
MDAwCj4gKyNkZWZpbmUgTElNQV9WQV9SRVNFUlZFX0VORCAgICAweDEwMDAwMDAwMFVMTAo+Cj4g
IHN0cnVjdCBsaW1hX2RldmljZTsKPgo+IC0tCj4gMi4xNy4xCj4KX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmkt
ZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3Jn
L21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
