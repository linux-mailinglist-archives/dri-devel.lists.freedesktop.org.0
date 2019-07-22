Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C1E2A70459
	for <lists+dri-devel@lfdr.de>; Mon, 22 Jul 2019 17:46:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C9ADC89C9C;
	Mon, 22 Jul 2019 15:46:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-vk1-xa43.google.com (mail-vk1-xa43.google.com
 [IPv6:2607:f8b0:4864:20::a43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4DE1189C9C;
 Mon, 22 Jul 2019 15:46:32 +0000 (UTC)
Received: by mail-vk1-xa43.google.com with SMTP id e83so7910964vke.12;
 Mon, 22 Jul 2019 08:46:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=f2F+5qgDekILYO7bsAOjwGcUthxc3K3xGyMAbPXpwmw=;
 b=b7UBLctvScFLNfzJHg5wb2B7QauiLzkSRU8UWWgXQIDPz408hDRaEPILDWoNNFxwXK
 vIJ5KGPPQyDNchOeRQE+KhizZtIJURLW1f4i2B1EW5bTz6OC1RmehVmxPg4NDFzl6Yio
 Zmux5uCHHn5SjjwLDsjbF4GsleEEwqwr/fmCckh/qmHzkyooHwoq7xlJS/qWrth+xnor
 vFEOvCsaa5xSns6+KwkHR/AlDncm2WG/cU9d7fzLF/3Dy76vtzhrJVaQk8HXaAsZJCkC
 jmGDg5lfgU5Id8slxgYTnW9/okwTZyfu08KJd3EwZyVOLWQTVilOMQezWP4xWq0csS/m
 Z2kA==
X-Gm-Message-State: APjAAAVB4OR4tYKsGJv2+XmcoarNqKSaeKO7t7iAK4cR/liU94IRvUAa
 qtrZ2KJJAJqwkMY+lXVxFJq2xSxtoeJUpjOpsqI=
X-Google-Smtp-Source: APXvYqwfjX06LqTfYwbKirE7I6DZcjQL3a48H3gr6GTV4LCgOFWpFVflonT8MXb84z83qDGYUWT3cs7yImoHpM48Mf8=
X-Received: by 2002:a1f:2242:: with SMTP id i63mr25506484vki.69.1563810391376; 
 Mon, 22 Jul 2019 08:46:31 -0700 (PDT)
MIME-Version: 1.0
References: <20190720084527.12593-1-sam@ravnborg.org>
 <20190720084527.12593-3-sam@ravnborg.org>
In-Reply-To: <20190720084527.12593-3-sam@ravnborg.org>
From: Emil Velikov <emil.l.velikov@gmail.com>
Date: Mon, 22 Jul 2019 16:46:08 +0100
Message-ID: <CACvgo53GQns4Ge7kC1K0xLNVNmjuFMPm8hG32sPBApn5XgUgmQ@mail.gmail.com>
Subject: Re: [PATCH v2 2/4] drm/via: add VIA_WAIT_ON()
To: Sam Ravnborg <sam@ravnborg.org>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=f2F+5qgDekILYO7bsAOjwGcUthxc3K3xGyMAbPXpwmw=;
 b=kwk1fOyGwI00qvXfyTxnp96EgkXSgwi0aa6KwIcZvTmlePk+clblgoQjD9Ob6x5cob
 qNyU/jAmaZDN87B5RofDmdzLsXkNDO4U88b5d4URjP4dUopFU7GyBiyEckyRrpT6P0rO
 Ps+vonquT47z9NIKc9Rw9eibL5MG9kNNB71mvpOSqm9FX8PNh/UKDNLs9OFVG73FBhMv
 yXTP+MC7zPTpIPacHMFJ4vLSm52akARPrhZ7qtE8XGFpEwaFCOejGUKTLz2wvaNcVbnI
 rd/Ig63wqynzf/kEhXI9Dz7diWTA4vv8DA7o7ICmycgc1cX8w+ocqWAX/CnEZ2QwrDc5
 g6Xw==
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
Cc: Thomas Hellstrom <thellstrom@vmware.com>,
 "Gustavo A. R. Silva" <gustavo@embeddedor.com>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel.vetter@ffwll.ch>,
 openchrome-devel@lists.freedesktop.org, Kevin Brace <kevinbrace@gmx.com>,
 ML dri-devel <dri-devel@lists.freedesktop.org>,
 Emil Velikov <emil.velikov@collabora.com>, Ira Weiny <ira.weiny@intel.com>,
 =?UTF-8?Q?Michel_D=C3=A4nzer?= <michel@daenzer.net>,
 Mike Marshall <hubcap@omnibond.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gU2F0LCAyMCBKdWwgMjAxOSBhdCAwOTo0NiwgU2FtIFJhdm5ib3JnIDxzYW1AcmF2bmJvcmcu
b3JnPiB3cm90ZToKPgo+IFZJQV9XQUlUX09OKCkgaXMgYSBkaXJlY3QgY29weSBvZiBEUk1fV0FJ
VF9PTigpIGZyb20KPiBkcm1fb3NfbGludXguaC4KPiBUaGUgY29weSBpcyBtYWRlIHNvIHdlIGNh
biBhdm9pZCB0aGUgZGVwZW5kZW5jeSBvbiB0aGUgbGVnYWN5IGhlYWRlci4KPiBBIG1vcmUgaW52
b2x2ZWQgYXBwcm9hY2ggaGFkIGJlZW4gdG8gaW50cm9kdWNlIHdhaXRfZXZlbnRfKiBidXQgZm9y
IHRoaXMKPiBsZWdhY3kgZHJpdmVyIHRoZSBzaW1wbGVyIGFuZCBtb3JlIHNhZmUgYXBwcm9hY2gg
d2l0aCBhIGNvcHkgb2YgdGhlCj4gbWFjcm8gd2FzIHNlbGVjdGVkLgo+IEFkZGVkIHRoZSByZWxl
dmFudCBoZWFkZXIgZmlsZXMgZm9yIHRoZSBmdW5jdGlvbnMgdXNlZCBpbiBWSUFfV0FJVF9PTi4K
Pgo+IFVzZXJzIG9mIHRoZSBtYWNybyB3aWxsIGNvbWUgaW4gYSBmb2xsb3ctdXAgcGF0Y2guCj4K
U2luY2Ugbm90aGluZyAibmV3IiBpcyBhZGRlZCBoZXJlIEkgd291bGQgY2hhbmdlIHRoZSBzdW1t
YXJ5IHRvCiJkcm0vdmlhOiBjb3B5IERSTV9XQUlUX09OIGFzIFZJQV9XQUlUX09OIGFuZCB1c2Ug
aXQiCklNSE8gdGhlcmUncyBsaXR0bGUgcG9pbnQgaW4gc3BsaXR0aW5nIGludHJvZHVjdGlvbiBh
bmQgdXNhZ2UuCgotRW1pbApfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3Rv
cC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmkt
ZGV2ZWw=
