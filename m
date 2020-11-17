Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D2772B703B
	for <lists+dri-devel@lfdr.de>; Tue, 17 Nov 2020 21:37:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4D3156E067;
	Tue, 17 Nov 2020 20:37:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x241.google.com (mail-lj1-x241.google.com
 [IPv6:2a00:1450:4864:20::241])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7AE996E067
 for <dri-devel@lists.freedesktop.org>; Tue, 17 Nov 2020 20:37:06 +0000 (UTC)
Received: by mail-lj1-x241.google.com with SMTP id x9so25842261ljc.7
 for <dri-devel@lists.freedesktop.org>; Tue, 17 Nov 2020 12:37:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=VBawTBZeGDei1h6v3qT5rtQtXBaTES0YnmaYqJM2GNs=;
 b=D+N/vgCe2QB5LLybajWeW3aLxWfyO6wqQ0s1MXm5AKuHEiaMK+zq0b6I+SbTc5jNMb
 fVgahe8wLHQTjRL5PEMhtUFS1/zunYiAzwibsGLFHlmb2q/q+sOyfThNJAnFdXDcMlQa
 bDPDKADnIiE60UbmgItJ1BP+RNIVmplSStluy/36J3KtDJGRcDhPKtwGXBBs4bfz4hrX
 C/d7fAogdTgk+F6kFerrwo9wl+7tG2esiZEaD40ieVHUuezWchN/w/Sm1m8u0lDcwNWl
 SZ8pg1OE1r/N3fKHQKDeD7b9bGEJ+2FKWk2HKvAFuufmRDSmP8qqeR691T4cNIzfkYJW
 m48w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=VBawTBZeGDei1h6v3qT5rtQtXBaTES0YnmaYqJM2GNs=;
 b=hwKUhw7R8mLetUSuk1vqq335W0tPUCR0riRovdIXpJuSCGKlZ4M8iB1aXWyFyuw0iW
 k2XpemvQgXoZpJH1ebCfExyUwvyGmUXKejK6f0jSjqsvNFZDuHjI2+cRVAhQsjJcIA4q
 pnfosYsCDMKLLm392CEo+S2QNa0Lt4S8AQa5BQ0RMJgLUVtzQHtBB9hYeo8sgIbf6mRo
 QwQqHnndsY5Sg5et1lGzdnhYDRcWpK6xC1vV1JOkl01UIf9GPrwEhC3eEP+Z23hPhvMP
 EP1B91AY6mc+tGdA95ZiD6I5B0hemS6x8+4W5c0lqL0nvtgqizRO2G8DesTj5WLPM0+c
 hu3A==
X-Gm-Message-State: AOAM532wpNDS42ODgwoMiLpkQH5Ako/fq1DyT7ndw9ucFLus0U73+QcW
 u4XLeZiQ0auchxjD7K96kZgDPZVu44+s/6aUCALxlQ==
X-Google-Smtp-Source: ABdhPJwaS2B6HfL/+PScb1mQInpJJpSlRKinA0MJAmBjiWs9aJ0EGtMf1sjwzqSjWpH0V50ABOt7UCdKF0FZIH63EBE=
X-Received: by 2002:a2e:b1c9:: with SMTP id e9mr1535370lja.283.1605645424802; 
 Tue, 17 Nov 2020 12:37:04 -0800 (PST)
MIME-Version: 1.0
References: <cover.1605635248.git.agx@sigxcpu.org>
 <1321f3abdc3df6e9d1999bd32b436ae71e89c27e.1605635248.git.agx@sigxcpu.org>
In-Reply-To: <1321f3abdc3df6e9d1999bd32b436ae71e89c27e.1605635248.git.agx@sigxcpu.org>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 17 Nov 2020 21:36:53 +0100
Message-ID: <CACRpkdbkcYz7RHz8_7ab-vVvBpOaD+SEosPZpvh8NNqDBuzfqA@mail.gmail.com>
Subject: Re: [PATCH v1 2/6] drm/panel: mantix: Tweak init sequence
To: =?UTF-8?Q?Guido_G=C3=BCnther?= <agx@sigxcpu.org>
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
Cc: Ondrej Jirman <megous@megous.com>,
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>, Arnd Bergmann <arnd@arndb.de>,
 David Airlie <airlied@linux.ie>, allen <allen.chen@ite.com.tw>,
 Mark Brown <broonie@kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Krzysztof Kozlowski <krzk@kernel.org>, Lubomir Rintel <lkundrak@v3.sk>,
 Rob Herring <robh+dt@kernel.org>, Thierry Reding <thierry.reding@gmail.com>,
 "open list:DRM PANEL DRIVERS" <dri-devel@lists.freedesktop.org>,
 Sam Ravnborg <sam@ravnborg.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVHVlLCBOb3YgMTcsIDIwMjAgYXQgNjo0OSBQTSBHdWlkbyBHw7xudGhlciA8YWd4QHNpZ3hj
cHUub3JnPiB3cm90ZToKCj4gV2UndmUgc2VlbiBzb21lIChub24gcGVybWFuZW50KSBidXJuIGlu
IGFuZCBiYWQgd2hpdGUgYmFsYW5jZQo+IG9uIHNvbWUgb2YgdGhlIHBhbmVscy4gQWRkaW5nIHRo
aXMgYml0IGZyb20gYSB2ZW5kb3Igc3VwcGxpZWQKPiBzZXF1ZW5jZSBmaXhlcyBpdC4KPgo+IEZp
eGVzOiA3Mjk2N2Q1NjE2ZDMgKCJkcm0vcGFuZWw6IEFkZCBwYW5lbCBkcml2ZXIgZm9yIHRoZSBN
YW50aXggTUxBRjA1N1dFNTEtWCBEU0kgcGFuZWwiKQo+IFNpZ25lZC1vZmYtYnk6IEd1aWRvIEfD
vG50aGVyIDxhZ3hAc2lneGNwdS5vcmc+CgpSZXZpZXdlZC1ieTogTGludXMgV2FsbGVpaiA8bGlu
dXMud2FsbGVpakBsaW5hcm8ub3JnPgoKWW91cnMsCkxpbnVzIFdhbGxlaWoKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlz
dApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0
b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==
