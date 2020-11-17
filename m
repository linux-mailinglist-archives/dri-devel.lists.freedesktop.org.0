Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A13B32B705B
	for <lists+dri-devel@lfdr.de>; Tue, 17 Nov 2020 21:43:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C549989BFD;
	Tue, 17 Nov 2020 20:43:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x243.google.com (mail-lj1-x243.google.com
 [IPv6:2a00:1450:4864:20::243])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E518189BAE
 for <dri-devel@lists.freedesktop.org>; Tue, 17 Nov 2020 20:43:38 +0000 (UTC)
Received: by mail-lj1-x243.google.com with SMTP id 11so25888148ljf.2
 for <dri-devel@lists.freedesktop.org>; Tue, 17 Nov 2020 12:43:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=t7NI13simGsyc9aw9w73uuvgucZyGXooSIdE2T5x8G8=;
 b=yvcEFOq9BcF7LgquEChbWT4/s0xCg8aFic302owme6IFLWGlM1wuKgWXZlbhk7CbXN
 EOeUoNM//JKFYDew1/pRpdloV0PJtNVqfFew3mosWMYx9PC53HQ/LVtsb6/jWHt4WKV9
 HIjeR7TmgXzDgPny8bCfkMwy1XsVkKUeexifYd60cCUUotM5at3yQbSb3hL8IzRdj3NE
 I7iJ/01rf90J84+3GYwLF+qbEG5EBjRtVxgchn3UzLWqSFBwmc64eLOr+xz6H87e890T
 tiyxfREvCrYZytqd/iaw4fJPOCUuwIwiMExY3rro3RqpHKK9rjRQqED4R5Uf3SWq1PqT
 wh4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=t7NI13simGsyc9aw9w73uuvgucZyGXooSIdE2T5x8G8=;
 b=kDl51OjCFF/fr4Rz5y+CBeFr6HP+24x4WWiPUMDTvOsSw1BmL6Y5hbaiHWvn2WEw5s
 4TYeehtRJZXdyth3+FEKTdEBawHqMaSxfvwWrDLkk+Z7Vz3TCsDfJjlERuUlEjd7ugVJ
 iouMvxX80HkZvLWlOfTF/OWhRKj4fLNjBOI5ePGZedZI2VRaUAKMFd0V3CZ/r2TYzqCF
 s2pXOzoE4qxO3N2ugParalSKH3PWP0QLCK3vodPW8Ew8ocz16YI2zVItRpM9Pf5zothD
 4Yjx9LlPd8zIBhBNxC0i3AguAB5WL7lCajLVdw2iG8GTbnY+1iqwScsRK1wZW/4PdF3z
 j7eA==
X-Gm-Message-State: AOAM533uRorfjI5uDvynygYFpFu06kXY/OVLUPSZD63Gf/JPwbpTbYAh
 No1+PGgU0caHn0hyRWnb/EvUlw++Xu5U3XRyODt1hg==
X-Google-Smtp-Source: ABdhPJyukBzfTaQq1ffcAx84TNgxYchrEu/Cc8M9PnwoFuv8kBKflAmTRmLuAqvUSXMvMr7YoQWVMuqH24bQq+R5b7w=
X-Received: by 2002:a2e:7d08:: with SMTP id y8mr2488637ljc.144.1605645817321; 
 Tue, 17 Nov 2020 12:43:37 -0800 (PST)
MIME-Version: 1.0
References: <cover.1605635248.git.agx@sigxcpu.org>
 <31b1013d78f539537a6e9e2b70bd9865b430a69e.1605635248.git.agx@sigxcpu.org>
In-Reply-To: <31b1013d78f539537a6e9e2b70bd9865b430a69e.1605635248.git.agx@sigxcpu.org>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 17 Nov 2020 21:43:26 +0100
Message-ID: <CACRpkdb+EqyV5qHLvJ=8a_S5QnguUArVRVr+eg4=TGUXSSu4MA@mail.gmail.com>
Subject: Re: [PATCH v1 6/6] dt-binding: display: mantix: Add compatible for
 panel from YS
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
cHUub3JnPiB3cm90ZToKCj4gVGhpcyBwYW5lbCBmcm9tIFNoZW56aGVuIFlhc2hpIENoYW5naHVh
IEludGVsbGlnZW50IFRlY2hub2xvZ3kgQ28KPiB1c2VzIHRoZSBzYW1lIGRyaXZlciBJQyBidXQg
YSBkaWZmZXJlbnQgTENELgo+Cj4gU2lnbmVkLW9mZi1ieTogR3VpZG8gR8O8bnRoZXIgPGFneEBz
aWd4Y3B1Lm9yZz4KClJldmlld2VkLWJ5OiBMaW51cyBXYWxsZWlqIDxsaW51cy53YWxsZWlqQGxp
bmFyby5vcmc+CgpZb3VycywKTGludXMgV2FsbGVpagpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBs
aXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1h
bi9saXN0aW5mby9kcmktZGV2ZWwK
