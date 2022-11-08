Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E614E621261
	for <lists+dri-devel@lfdr.de>; Tue,  8 Nov 2022 14:27:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2F5C310E460;
	Tue,  8 Nov 2022 13:27:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com
 [IPv6:2a00:1450:4864:20::629])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3125510E460
 for <dri-devel@lists.freedesktop.org>; Tue,  8 Nov 2022 13:27:19 +0000 (UTC)
Received: by mail-ej1-x629.google.com with SMTP id f5so38599035ejc.5
 for <dri-devel@lists.freedesktop.org>; Tue, 08 Nov 2022 05:27:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=N/2yj1vtV3WtEYwU3cNvgg/PVgtVCmwn3eJn8jo49wk=;
 b=VMnat+U1KSonabFKRPuR13L5JqFFcM/AvvqPUwa+9VtqcDpyz6Op4uI9k8fhWWUfgj
 OQMGyd7nBSVagfiyDveayuziCLNEcnxn2ErDoMUoLlpt3yo8/JHVhiTmfW1xUoXEQ8ch
 5jJZRKNOXfrIQxouT0FZtywu8oBKzwLv6/7PIprEyWb5tHAmIqyiFvsPphy4dzO+D1O/
 ByJEsT3p8EBbAPP+gKvFSCFRhufjqGSeVaHTdjl/xTUCo6crbpyBuirSVOUQflk15qBf
 1q39gU7+oVdTRiJwpV9lCujVgxFVrOBGfRo6fbxcreewXR1hDWvKWjF1rSAwPNJVX2jh
 IlsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=N/2yj1vtV3WtEYwU3cNvgg/PVgtVCmwn3eJn8jo49wk=;
 b=kZoNwwyyR3SWScBAcYOthUMnJltUBgwEF2ISbQ/O1gJq830nJLO7xx0N+0cOZo66A9
 m0OgNJppge0YbkNJnIEX3KOoDkCbRgiKIJjBFkXPWlMO/H0AeRHm4ooDPsq07B1h2KvP
 2gZ8YS2rB7vPT5h/ISf4rPDryRjEvd9YgND1/v6VHnl1XbUqh3YDoASvVlFLrLtVOpz0
 w4bYvHjKvc3Z5gddPsSjdYn7XOQDFWpxG22pQ+WAfoi4sknBXfk9keYhGkPQFqczo6gN
 eMBR8LQ8uFk5wBfGyDmST1YLVmJppzR51BS6+sIyF3NeB9itBBmjZCVqaXrzmvLLfF1q
 HPwQ==
X-Gm-Message-State: ACrzQf0h4ZuAiX3j0jcw7r01y/SM7P3LDRsmJPf62COxhrhWt8kLLioU
 cxVP1JPBxHDEjCgdqGHF6Jb9NIvtYseYzO0i1TtuaQ==
X-Google-Smtp-Source: AMsMyM4SQlliAGfUpQoe5HVHzBogl+LIrkzKv8wyDOakcTA7xnKfY84HO6wUWBApVXLz+WmeEpt0AVEmstNop5fvJLQ=
X-Received: by 2002:a17:906:4c4b:b0:7ad:a197:b58e with SMTP id
 d11-20020a1709064c4b00b007ada197b58emr54058070ejw.203.1667914037645; Tue, 08
 Nov 2022 05:27:17 -0800 (PST)
MIME-Version: 1.0
References: <20221018-clk-range-checks-fixes-v2-0-f6736dec138e@cerno.tech>
 <20221018-clk-range-checks-fixes-v2-35-f6736dec138e@cerno.tech>
In-Reply-To: <20221018-clk-range-checks-fixes-v2-35-f6736dec138e@cerno.tech>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 8 Nov 2022 14:27:06 +0100
Message-ID: <CACRpkdaOM=T1pRJNK6hdc76m5tQfrjvF9nVBp7ZDf3wOMNSwyg@mail.gmail.com>
Subject: Re: [PATCH v2 35/65] clk: ux500: sysctrl: Add a determine_rate hook
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

> The UX500 sysctrl "set_parent" clocks implement a mux with a set_parent
> hook, but doesn't provide a determine_rate implementation.
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
>
> The latter case would be equivalent to setting the flag
> CLK_SET_RATE_NO_REPARENT, together with setting our determine_rate hook
> to __clk_mux_determine_rate(). Indeed, if no determine_rate
> implementation is provided, clk_round_rate() (through
> clk_core_round_rate_nolock()) will call itself on the parent if
> CLK_SET_RATE_PARENT is set, and will not change the clock rate
> otherwise. __clk_mux_determine_rate() has the exact same behavior when
> CLK_SET_RATE_NO_REPARENT is set.
>
> And if it was an oversight, then we are at least explicit about our
> behavior now and it can be further refined down the line.
>
> Signed-off-by: Maxime Ripard <maxime@cerno.tech>

Acked-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
