Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7AA78834F0
	for <lists+dri-devel@lfdr.de>; Tue,  6 Aug 2019 17:17:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BFBF96E3DA;
	Tue,  6 Aug 2019 15:17:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5E2996E3DA
 for <dri-devel@lists.freedesktop.org>; Tue,  6 Aug 2019 15:17:26 +0000 (UTC)
Received: from mail-qt1-f173.google.com (mail-qt1-f173.google.com
 [209.85.160.173])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 1FF7420717
 for <dri-devel@lists.freedesktop.org>; Tue,  6 Aug 2019 15:17:26 +0000 (UTC)
Received: by mail-qt1-f173.google.com with SMTP id w17so4268011qto.10
 for <dri-devel@lists.freedesktop.org>; Tue, 06 Aug 2019 08:17:26 -0700 (PDT)
X-Gm-Message-State: APjAAAW7vQyAMxyFm3HPSN+mYXBux71t4OIQEVWGUAYyeKVn25HOhAd3
 ht2WgAvDgOKBxu0DxNK3t10XkmUXAHWpOLi5SQ==
X-Google-Smtp-Source: APXvYqwPuPPmaziv0aqb78eSBuyoFJxdBkH4XjABe+CabJ603+wBi76G4no+REuxzJFDMefmj38zKOLnaukDigblww0=
X-Received: by 2002:a0c:b627:: with SMTP id f39mr3597235qve.72.1565104645367; 
 Tue, 06 Aug 2019 08:17:25 -0700 (PDT)
MIME-Version: 1.0
References: <20190806135437.7451-1-linus.walleij@linaro.org>
In-Reply-To: <20190806135437.7451-1-linus.walleij@linaro.org>
From: Rob Herring <robh@kernel.org>
Date: Tue, 6 Aug 2019 09:17:14 -0600
X-Gmail-Original-Message-ID: <CAL_JsqKhQwqtU_bdTymEM_b035f2rcPgYRWP7L-_G2F=DO1VWQ@mail.gmail.com>
Message-ID: <CAL_JsqKhQwqtU_bdTymEM_b035f2rcPgYRWP7L-_G2F=DO1VWQ@mail.gmail.com>
Subject: Re: [PATCH 2/4 v3] drm/panel: simple: Add TI nspire panel bindings
To: Linus Walleij <linus.walleij@linaro.org>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=kernel.org; s=default; t=1565104646;
 bh=O7r2gpXOQ691eUhvxcBqHTnRWEAVRBQE6uOaSmCJ0ww=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=DVpBDt/iIMWNnmfMM2MMuyLg8KHBWkuWqY6H1EDOAIT+muOaaKSpY7Coip7A4eryn
 JbAiq1xgwOfNG6t2Ji2TMZL3VBxOScQm35wiicM1OE0jtGuxuX/tDTYvFXLskaTZ0e
 Kn0SplLQdqqPdxhiKWt37A3g0aeWDlyfwgf/Nmoo=
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
Cc: devicetree@vger.kernel.org, Maxime Ripard <maxime.ripard@bootlin.com>,
 dri-devel <dri-devel@lists.freedesktop.org>, Sean Paul <sean@poorly.run>,
 "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE"
 <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVHVlLCBBdWcgNiwgMjAxOSBhdCA3OjU1IEFNIExpbnVzIFdhbGxlaWogPGxpbnVzLndhbGxl
aWpAbGluYXJvLm9yZz4gd3JvdGU6Cj4KPiBBZGQgYmluZGluZ3MgZm9yIHRoZSBUSSBOU1BJUkUg
c2ltcGxlIGRpc3BsYXkgcGFuZWxzLgo+Cj4gQ2M6IGRldmljZXRyZWVAdmdlci5rZXJuZWwub3Jn
Cj4gU2lnbmVkLW9mZi1ieTogTGludXMgV2FsbGVpaiA8bGludXMud2FsbGVpakBsaW5hcm8ub3Jn
Pgo+IC0tLQo+IENoYW5lZ0xvZyB2Mi0+djM6Cj4gLSBTd2l0Y2ggdG8gR1BMLTIuMC1vbmx5IE9S
IEJTRC0yLUNsYXVzZSBsaWNlbnNlCj4gLSBVc2UgYSBzaW1wbGUgZW51bSBmb3IgdGhlIGNvbXBh
dGlibGUKPiAtIFVzZSB0aGUgbmV3IG5pZnR5IHBhbmVsLWNvbW1vbi55YW1sLCB0ZXN0ZWQgb24K
PiAgIGxpbnV4LW5leHQKPiBDaGFuZ2VMb2cgdjEtPnYyOgo+IC0gTmV3IHBhdGNoIGFzIGJpbmRp
bmdzIGFyZSByZXF1aXJlZAo+IC0gTGV0J3MgdXNlIFlBTUwKPiAtLS0KPiAgLi4uL2JpbmRpbmdz
L2Rpc3BsYXkvcGFuZWwvdGksbnNwaXJlLnlhbWwgICAgIHwgMzYgKysrKysrKysrKysrKysrKysr
Kwo+ICAxIGZpbGUgY2hhbmdlZCwgMzYgaW5zZXJ0aW9ucygrKQo+ICBjcmVhdGUgbW9kZSAxMDA2
NDQgRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2Rpc3BsYXkvcGFuZWwvdGksbnNw
aXJlLnlhbWwKClJldmlld2VkLWJ5OiBSb2IgSGVycmluZyA8cm9iaEBrZXJuZWwub3JnPgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFp
bGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
