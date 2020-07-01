Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DEFBE2110CC
	for <lists+dri-devel@lfdr.de>; Wed,  1 Jul 2020 18:38:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1C67B6E139;
	Wed,  1 Jul 2020 16:38:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x144.google.com (mail-lf1-x144.google.com
 [IPv6:2a00:1450:4864:20::144])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BA41F89B03
 for <dri-devel@lists.freedesktop.org>; Wed,  1 Jul 2020 16:38:06 +0000 (UTC)
Received: by mail-lf1-x144.google.com with SMTP id s16so8612646lfp.12
 for <dri-devel@lists.freedesktop.org>; Wed, 01 Jul 2020 09:38:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :content-transfer-encoding;
 bh=b+AvB/0HQsEmT/6dVyBt3aUmExGSI3jLVgR9pfCU6xI=;
 b=NGc3nSr+n0h4fP2ID26hOQgQ2mGQdX3utJApv6cBWQXcVI3h7Fc+D1QRBIQaXZnr11
 YgeqOntiAqKrnsCCfaKpVcqsrtPXTzfVbTUkjmkkNrnOIPMZykmbNj/2u4WCkAliAREg
 srt7gl91XjqmoYUp20v+a/dbguhGPKL1fabJgEWJI6T56t9/1CNQ8lqfXza8DolyiRh6
 YxcJG9lxOqaRR4KuOUA6S0lwFg3/kr+z1P4eliDfSaqRZvBfkOqJO2GlrsIs8/2UUGY3
 8VYcedkvX4qpBycLPBECUs7hYIk9hfSJ36kCPXDg9vPZk30LJD4yXA32EQ3JE1OeBAZY
 JHcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:content-transfer-encoding;
 bh=b+AvB/0HQsEmT/6dVyBt3aUmExGSI3jLVgR9pfCU6xI=;
 b=DY5DgZto+6ZwH4CJIVPb78YfXoWMJlrzSKelIpX3xJwy53oudYioacpbXy+0zTOLP7
 n4bW4lgKr2QV3JdChHN21yC9+W0F0igriy/u52T8yDZLQhDMavNB6QAAR8K1G1B32l0A
 CqLr4FEEUyn+XWDQkXKQcQMGGg7rJIwzJmhs0LpRlttgqENqbRr2FuZLyXoqAryVau+/
 FFbeO15/DYCsKAJnk1OrRzrDKKtHGZHYqiksgEflkPT5d+uEf6ZGiEDoqvESxfAqg87X
 pX1Ec9wEvn42p1pXOnHUGqzsk00AMq3qZX/VwJX+Ks0B+k6uQfvY5hiSfURN5NrBxGfL
 TFFA==
X-Gm-Message-State: AOAM531hUTMiJhe/n59zOHv0h8Z4lafalbI24p3UGqT6Yw8Bme0zUzC7
 OxQB/sZfhbvqhjg3QMtV5xTyWJHhStV1nFbNnyozyg==
X-Google-Smtp-Source: ABdhPJxK/nguThkBJd2Ux3XYuXE4KGHsrekK6XDG2RPUaVUVOzza6kVDTgWwFrm43mM2dign3+VsxQTsCovpxW3dEZ0=
X-Received: by 2002:ac2:47ed:: with SMTP id b13mr15611694lfp.21.1593621485126; 
 Wed, 01 Jul 2020 09:38:05 -0700 (PDT)
MIME-Version: 1.0
References: <20200701103126.1512615-1-megous@megous.com>
 <20200701152532.GA670324@ravnborg.org>
 <20200701163018.cfweuzp76qx5nsew@core.my.home>
In-Reply-To: <20200701163018.cfweuzp76qx5nsew@core.my.home>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Wed, 1 Jul 2020 18:37:53 +0200
Message-ID: <CACRpkdYf87RymMwUFL=nXNs3dFVveLt7u0X3haL=SN+N6+V_vQ@mail.gmail.com>
Subject: Re: [PATCH v6 00/13] Add support for PinePhone LCD panel
To: =?UTF-8?Q?Ond=C5=99ej_Jirman?= <megous@megous.com>, 
 Sam Ravnborg <sam@ravnborg.org>, linux-sunxi <linux-sunxi@googlegroups.com>, 
 Thierry Reding <thierry.reding@gmail.com>, David Airlie <airlied@linux.ie>, 
 Daniel Vetter <daniel@ffwll.ch>,
 =?UTF-8?Q?Guido_G=C3=BCnther?= <agx@sigxcpu.org>, 
 Purism Kernel Team <kernel@puri.sm>, Rob Herring <robh+dt@kernel.org>,
 Maxime Ripard <mripard@kernel.org>, 
 Chen-Yu Tsai <wens@csie.org>, Linus Walleij <linus.walleij@linaro.org>, 
 Icenowy Zheng <icenowy@aosc.io>, 
 "open list:DRM PANEL DRIVERS" <dri-devel@lists.freedesktop.org>, 
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, 
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 Samuel Holland <samuel@sholland.org>, 
 Martijn Braam <martijn@brixit.nl>, Luca Weiss <luca@z3ntu.xyz>,
 Bhushan Shah <bshah@kde.org>
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

T24gV2VkLCBKdWwgMSwgMjAyMCBhdCA2OjMwIFBNIE9uZMWZZWogSmlybWFuIDxtZWdvdXNAbWVn
b3VzLmNvbT4gd3JvdGU6Cj4gT24gV2VkLCBKdWwgMDEsIDIwMjAgYXQgMDU6MjU6MzJQTSArMDIw
MCwgU2FtIFJhdm5ib3JnIHdyb3RlOgo+ID4gSGkgT25kcmVqLgo+ID4KPiA+IE9uIFdlZCwgSnVs
IDAxLCAyMDIwIGF0IDEyOjMxOjEzUE0gKzAyMDAsIE9uZHJlaiBKaXJtYW4gd3JvdGU6Cj4gPiA+
IFRoaXMgcGF0Y2hzZXQgYWRkcyBzdXBwb3J0IGZvciB0aGUgTENEIHBhbmVsIG9mIFBpbmVQaG9u
ZS4KPiA+ID4KPiA+ID4gSSd2ZSB0ZXN0ZWQgdGhpcyBvbiBQaW5lUGhvbmUgMS4wIGFuZCAxLjIu
Cj4gPiA+Cj4gPiA+IFBsZWFzZSB0YWtlIGEgbG9vay4KPiA+ID4KPiA+ID4gdGhhbmsgeW91IGFu
ZCByZWdhcmRzLAo+ID4gPiAgIE9uZHJlaiBKaXJtYW4KPiA+ID4KPiA+ID4gQ2hhbmdlcyBpbiB2
NjoKPiA+ID4gLSBGaXhlZCBzcGFjaW5nIGluIHlhbWwKPiA+ID4gLSBGaXhlZCB3cm9uZyB2Y2Np
by0+aW92Y2Mgc3VwcGx5IG5hbWUgaW4gdGhlIGJpbmRpbmdzIGRvYwo+ID4gPiAtIEkgbm90aWNl
ZCB0aGF0IHRoZSBvcmlnaW5hbCBkcml2ZXIgdXNlcyBhIGRlbGF5IG9mIDIwbXMgaW4gdGhlIGlu
aXQKPiA+ID4gICBmdW5jdGlvbiB0byBhY2hpZXZlIGEgY29tYmluZWQgdG90YWwgb2YgMTIwbXMg
cmVxdWlyZWQgZnJvbSBwb3N0LXJlc2V0Cj4gPiA+ICAgdG8gZGlzcGxheV9vbi4gSSd2ZSBhZGRl
ZCBhIHNpbWlsYXIgZGVsYXkgdG8geGJkNTk5X2luaXQsIHNvIHRoYXQKPiA+ID4gICB4YmQ1OTkg
cGFuZWwgYWxzbyBoYXMgdGhlIHJpZ2h0IHRpbWluZy4gKHBhdGNoIDkpCj4gPiA+IC0gdjUtPnY2
IGRpZmY6IGh0dHBzOi8vbWVnb3VzLmNvbS9kbC90bXAvdjUtdjYucGF0Y2gKPiA+ID4gLSBBZGRl
ZCByZXZpZXcvYWNrIHRhZ3MKPiA+ID4gLSBMZWFybmVkIHRvIHJ1biBkdF9iaW5kaW5nX2NoZWNr
IGJ5IG15c2VsZiA7KQo+ID4gVGhlIHBhdGNoLXNldCBkb2VzIG5vdCBhcHBseSBjbGVhbiBvbiB0
b3Agb2YgZHJtLW1pc2MtbmV4dCAtIGR1ZSB0bwo+ID4gdnJlZnJlc2ggcmVtb3ZhbC4KPiA+IFBs
ZWFzZSByZS1zcGluLgo+Cj4gU29ycnkgZm9yIHRoYXQuIFJlYmFzZWQgYW5kIHJldGVzdGVkLgoK
U2FtIHdpbGwgeW91IGFwcGx5IGl0PyBJIHdhcyBpbiB0aGUgbWlkZGxlIG9mIGFwcGx5aW5nIGFu
ZCByYW4gaW50byB0aGUgc2FtZQppc3N1ZSA6RAoKWW91cnMsCkxpbnVzIFdhbGxlaWoKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxp
bmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJl
ZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==
