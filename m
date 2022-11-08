Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 42C77621248
	for <lists+dri-devel@lfdr.de>; Tue,  8 Nov 2022 14:25:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D262610E461;
	Tue,  8 Nov 2022 13:25:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x62f.google.com (mail-ej1-x62f.google.com
 [IPv6:2a00:1450:4864:20::62f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2DBAD10E460
 for <dri-devel@lists.freedesktop.org>; Tue,  8 Nov 2022 13:25:17 +0000 (UTC)
Received: by mail-ej1-x62f.google.com with SMTP id y14so38557123ejd.9
 for <dri-devel@lists.freedesktop.org>; Tue, 08 Nov 2022 05:25:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=xIunjndO5rqOpIPjGIQJB4TuLtmFYebQ0fOsvPNeO54=;
 b=dY2KECnuVH7NYv0yOK7RrL62QdqUlhl2JmgS7xh7Aop7k+RcPrpLQgabXuGbHHpGQR
 eHydRYWR08BPIi0DGkFfFL5aziMJHQLfVfnBD+eU2h7KlhHzcO6P+1GLNOD4+iPtpIq9
 f+xJ7woffKNTUf34ylHgwFwugM0mjDy+MNR+/tosLv90DX21VaSDgG9tpTl2KCuCdJUO
 uOa6Dv9G/jILV/FYPlkjsMzVEJLK96Ug7G7tfkWymeifahO0bdSmcFGNxzhRtu8RVMPO
 uhbfFCJ4Ya/DrkwEqdNt0sBFZZ7Pau3qynHAmgL94y0H0QvBHa6kKlb7zVfFQiDHP0ks
 6ZQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=xIunjndO5rqOpIPjGIQJB4TuLtmFYebQ0fOsvPNeO54=;
 b=Tyz7J30g1srwz/f6mLuwEpOk+dzXii6I+vm6zgKoVE7klM5ONXjlv07QRJNpcbDf2D
 ONUMdWjHCR51rWTlym6mjSJg0FC6OMWvb+UJ2iLg8RpxiDwUlcNImx5UL1wCIhcW2cyh
 a1lOHO9kjAq+eKDRiwx/fuE/v0ZAi2GcQfPQuuOh/JeCp6Ek4vAt0ZE1/u/LYQzuXCTT
 06HOlfOxUTVbbKgBgIQ6YrJ3lnTrz+RnC3kVOX/5c/1mFvtN57uln3S5bWXIx8Y9EsBG
 vt+f+vB7zGFyrA7S4GWvigOXdcBTXGbIp689yvwYq4AeY7/2FOTVtdCM9ziRzDWkjOh1
 Q4Bw==
X-Gm-Message-State: ANoB5pnfZO1qZAj+jN1Mj+38p6cTzxRmRpeuOrJHn3U07M+ygctqPewu
 207T8bY7xnFLKLJMiNgQ3ZihDxJujG/PAxJe/5usSA==
X-Google-Smtp-Source: AA0mqf68wWCeuB7GkTzw5Vcyy6luDq6tRlJuZOq+6MaYhZcTvhkBj9mitsGYltXA5OQs4b2+osg1ro8i402jh/hf0IY=
X-Received: by 2002:a17:906:6acc:b0:7ae:658c:ee45 with SMTP id
 q12-20020a1709066acc00b007ae658cee45mr11184945ejs.190.1667913915716; Tue, 08
 Nov 2022 05:25:15 -0800 (PST)
MIME-Version: 1.0
References: <20221018-clk-range-checks-fixes-v2-0-f6736dec138e@cerno.tech>
 <20221018-clk-range-checks-fixes-v2-34-f6736dec138e@cerno.tech>
In-Reply-To: <20221018-clk-range-checks-fixes-v2-34-f6736dec138e@cerno.tech>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 8 Nov 2022 14:25:04 +0100
Message-ID: <CACRpkdYwM6X8bBABCisUGX=P4F=hcFb7QLT3Cu7XUWUvV4TE1Q@mail.gmail.com>
Subject: Re: [PATCH v2 34/65] clk: ux500: prcmu: Add a determine_rate hook
To: Maxime Ripard <maxime@cerno.tech>
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
Cc: Ulf Hansson <ulf.hansson@linaro.org>,
 Prashant Gaikwad <pgaikwad@nvidia.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Liam Girdwood <lgirdwood@gmail.com>,
 Michael Turquette <mturquette@baylibre.com>, Sekhar Nori <nsekhar@ti.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 dri-devel@lists.freedesktop.org, Jaroslav Kysela <perex@perex.cz>,
 Paul Cercueil <paul@crapouillou.net>, Max Filippov <jcmvbkbc@gmail.com>,
 Thierry Reding <thierry.reding@gmail.com>, linux-phy@lists.infradead.org,
 linux-stm32@st-md-mailman.stormreply.com, Abel Vesa <abelvesa@kernel.org>,
 Kishon Vijay Abraham I <kishon@kernel.org>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
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
 linux-mediatek@lists.infradead.org,
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

On Fri, Nov 4, 2022 at 2:32 PM Maxime Ripard <maxime@cerno.tech> wrote:

> The UX500 PRCMU "clkout" clock implements a mux with a set_parent hook,
> but doesn't provide a determine_rate implementation.
>
> This is a bit odd, since set_parent() is there to, as its name implies,
> change the parent of a clock. However, the most likely candidate to
> trigger that parent change is a call to clk_set_rate(), with
> determine_rate() figuring out which parent is the best suited for a
> given rate.
>
> The other trigger would be a call to clk_set_parent(), but it's far less
> used, and it doesn't look like there's any obvious user for that clock.
>
> So, the set_parent hook is effectively unused, possibly because of an
> oversight. However, it could also be an explicit decision by the
> original author to avoid any reparenting but through an explicit call to
> clk_set_parent().

It is actually set up from the device tree, typically like this:

/* clkout1 from ACLK divided by 8 */
clocks = <&clkout_clk DB8500_CLKOUT_1 DB8500_CLKOUT_SRC_ACLK 8>;

So the parent (source) and divisor comes in there.

clk->source and clk->divider is already set up when clk_hw_register() is
called.

So set/get_parent() is never used on clkout.

I think I just added the callbacks for completeness, should we delete them
altogether? The patch is probably fine as-is as well so
Acked-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
