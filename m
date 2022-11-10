Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FA5C6242DB
	for <lists+dri-devel@lfdr.de>; Thu, 10 Nov 2022 14:06:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 93D6B10E797;
	Thu, 10 Nov 2022 13:05:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x1034.google.com (mail-pj1-x1034.google.com
 [IPv6:2607:f8b0:4864:20::1034])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0085010E797
 for <dri-devel@lists.freedesktop.org>; Thu, 10 Nov 2022 13:05:53 +0000 (UTC)
Received: by mail-pj1-x1034.google.com with SMTP id
 c15-20020a17090a1d0f00b0021365864446so1456703pjd.4
 for <dri-devel@lists.freedesktop.org>; Thu, 10 Nov 2022 05:05:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=lrV3scjxXBUgyRehk9/on/q8TxNDq8MdTdotV2WeMBQ=;
 b=GVZ09h+ngHWOecbTC/uzghXW93HVi79Hc3aHUMBuHut0K+MRP4qjrmbxOsy9wAvyhh
 CzAf4wAUsz2LX8ScnTSnBYBlU0zD4SfZXHjTGLx4odMNe2HTZmWoc8/O0MjERSTJDuKQ
 9UeL9YNFV2iAuj4M769TxWHJzx0wEKM1UD/fL8Quarzgi8/jAHx03TmKPyEcNniVs1JP
 E1bQ9YyT5yBnS4K6hTH0QDyjNMb9vjtJqKa6/m2IeBhMmf0jPp66hTlfQCyxBUHnorSo
 4QxzB8BVVnzEGtFh63S81NhnvCx7MGrBaQEPEUdQo8KV1MCY/puvxsLONjSQ8GgFephe
 xQuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=lrV3scjxXBUgyRehk9/on/q8TxNDq8MdTdotV2WeMBQ=;
 b=hCnErJym/KHwLgsCMO2duFROkmKTCT4AupFnmYRAUqb9BKJe+CqcZi5S4NNozSsJHl
 yD3WgYZ38X8jm4LWWxPY5xLulvUjzhnKqMbHXhKlBWU3Cp9Ha0XYXLYlB5Cs0UNNXKaq
 lvHfL1e114VHKQD9O5kzm1qbxwXXv3nKa7TYeH8Az8Xf7e1dA2QK/dIdFdCOiuU56N0w
 KoTSa0PIUbyXPDNjrIS0MfSpBKzFjICJ/HgGK+o3J9SWWKRpNkVbcjLIjUExp7XrurJX
 HleCNZXPCSWuXCaXnwCpBhCtzucSXH9c5hgBbN+0vZpTbEfac5m8hn3BjbZjyFTV4Za7
 KNEQ==
X-Gm-Message-State: ACrzQf1tshGcYnvak2Y818s3+TSY6dmCSP/f8KVuG6UuvtgvgN1vI1Rc
 /itS6LRH7xNGhxTipCshZdkq9PNCZguOjtk41CQQ1A==
X-Google-Smtp-Source: AMsMyM4ntafpxKu1kZoVYdCyuwK4y2qgGm0PDcBHChl8r8c0pj7m0JmQ6SHmodBY/Un25AY0R73awNrQX1GtCyrtwGQ=
X-Received: by 2002:a17:903:100c:b0:186:63a1:3b5d with SMTP id
 a12-20020a170903100c00b0018663a13b5dmr65965693plb.148.1668085553525; Thu, 10
 Nov 2022 05:05:53 -0800 (PST)
MIME-Version: 1.0
References: <20221018-clk-range-checks-fixes-v2-0-f6736dec138e@cerno.tech>
 <20221018-clk-range-checks-fixes-v2-35-f6736dec138e@cerno.tech>
 <CAPDyKFoycVedCJMy0=UK+q5SiPQHqje_8bSN-gdkpBa6KhFfkg@mail.gmail.com>
 <CACRpkdYOj8uozJZO4MV-_OAKeOsQHhoEM=PyynVuNY-JkpgTOw@mail.gmail.com>
In-Reply-To: <CACRpkdYOj8uozJZO4MV-_OAKeOsQHhoEM=PyynVuNY-JkpgTOw@mail.gmail.com>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Thu, 10 Nov 2022 14:05:16 +0100
Message-ID: <CAPDyKFr6VeF3s47JfzJ9urtMsEem+GiBtHeU=_S8jNaz-D+qnw@mail.gmail.com>
Subject: Re: [PATCH v2 35/65] clk: ux500: sysctrl: Add a determine_rate hook
To: Linus Walleij <linus.walleij@linaro.org>
Content-Type: text/plain; charset="UTF-8"
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
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Prashant Gaikwad <pgaikwad@nvidia.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Liam Girdwood <lgirdwood@gmail.com>,
 Michael Turquette <mturquette@baylibre.com>, Sekhar Nori <nsekhar@ti.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 dri-devel@lists.freedesktop.org, Jaroslav Kysela <perex@perex.cz>,
 Paul Cercueil <paul@crapouillou.net>, Max Filippov <jcmvbkbc@gmail.com>,
 Thierry Reding <thierry.reding@gmail.com>, linux-phy@lists.infradead.org,
 linux-stm32@st-md-mailman.stormreply.com, Abel Vesa <abelvesa@kernel.org>,
 Kishon Vijay Abraham I <kishon@kernel.org>,
 Samuel Holland <samuel@sholland.org>, Chunyan Zhang <zhang.lyra@gmail.com>,
 Takashi Iwai <tiwai@suse.com>, linux-tegra@vger.kernel.org,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>, Chen-Yu Tsai <wens@csie.org>,
 NXP Linux Team <linux-imx@nxp.com>, Orson Zhai <orsonzhai@gmail.com>,
 linux-mips@vger.kernel.org, Luca Ceresoli <luca.ceresoli@bootlin.com>,
 linux-sunxi@lists.linux.dev, linux-rtc@vger.kernel.org,
 linux-clk@vger.kernel.org, Charles Keepax <ckeepax@opensource.cirrus.com>,
 alsa-devel@alsa-project.org, Manivannan Sadhasivam <mani@kernel.org>,
 linux-kernel@vger.kernel.org, Sascha Hauer <s.hauer@pengutronix.de>,
 linux-actions@lists.infradead.org,
 Richard Fitzgerald <rf@opensource.cirrus.com>, Mark Brown <broonie@kernel.org>,
 linux-mediatek@lists.infradead.org, Maxime Ripard <maxime@cerno.tech>,
 Baolin Wang <baolin.wang@linux.alibaba.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 linux-arm-kernel@lists.infradead.org,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Alessandro Zummo <a.zummo@towertech.it>, Stephen Boyd <sboyd@kernel.org>,
 patches@opensource.cirrus.com, Peter De Schrijver <pdeschrijver@nvidia.com>,
 Nicolas Ferre <nicolas.ferre@microchip.com>,
 =?UTF-8?Q?Andreas_F=C3=A4rber?= <afaerber@suse.de>,
 linux-renesas-soc@vger.kernel.org, Dinh Nguyen <dinguyen@kernel.org>,
 Vinod Koul <vkoul@kernel.org>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 David Lechner <david@lechnology.com>, Shawn Guo <shawnguo@kernel.org>,
 Claudiu Beznea <claudiu.beznea@microchip.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, 10 Nov 2022 at 12:39, Linus Walleij <linus.walleij@linaro.org> wrote:
>
> On Thu, Nov 10, 2022 at 12:29 PM Ulf Hansson <ulf.hansson@linaro.org> wrote:
> > On Fri, 4 Nov 2022 at 14:32, Maxime Ripard <maxime@cerno.tech> wrote:
> > >
> > > The UX500 sysctrl "set_parent" clocks implement a mux with a set_parent
> > > hook, but doesn't provide a determine_rate implementation.
> > >
> > > This is a bit odd, since set_parent() is there to, as its name implies,
> > > change the parent of a clock. However, the most likely candidate to
> > > trigger that parent change is a call to clk_set_rate(), with
> > > determine_rate() figuring out which parent is the best suited for a
> > > given rate.
> > >
> > > The other trigger would be a call to clk_set_parent(), but it's far less
> > > used, and it doesn't look like there's any obvious user for that clock.
> >
> > If I recall correctly, that is the use case we did target for these
> > types of clocks. See sound/soc/ux500/ux500_ab85xx.c, for example.
>
> Hm I am trying to get that driver to work ... from time to time.
> It's just that ALSA SoC DT has changed to much that it turns out
> into a complete rewrite :/
>
> So in sound/soc/ux500/mop500_ab8500.c
> I see this:
>
>         status = clk_set_parent(drvdata->clk_ptr_intclk, clk_ptr);
>         if (status)
> (...)
>
> and there is elaborate code to switch between "SYSCLK" and
> "ULPCLK" (ulta-low power clock). Just like you say... however
> a clock named SYSCLK or ULPCLK does not appear in the
> code in drivers/clk/ux500 or any DT bindings so... it seems to
> be non-working for the time being.

It's definitely not working, but the corresponding clocks ("ulpclk",
"intclk", "audioclk", etc) are being registered in ab8500_reg_clks().

What seems to be missing is a DT conversion for these clocks, so they
can be consumed properly. Right?

Kind regards
Uffe
