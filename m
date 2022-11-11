Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D84362567C
	for <lists+dri-devel@lfdr.de>; Fri, 11 Nov 2022 10:20:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4BF4910E16C;
	Fri, 11 Nov 2022 09:20:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x52b.google.com (mail-ed1-x52b.google.com
 [IPv6:2a00:1450:4864:20::52b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 745AF10E16C
 for <dri-devel@lists.freedesktop.org>; Fri, 11 Nov 2022 09:20:48 +0000 (UTC)
Received: by mail-ed1-x52b.google.com with SMTP id v27so6842459eda.1
 for <dri-devel@lists.freedesktop.org>; Fri, 11 Nov 2022 01:20:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=KQqlnqh61yDEivsgLuzXFgBFvWeIkle9538NvChEgG4=;
 b=eRHEStFUgdZI+TOEkzLgPNAUqr8je9PakORGJBpBvetm722q6+52mzO4PuK6UP2C9B
 y5QKHELjwoL/I5ZveEAoHNQYPUFH2gG9BiO6rNE0Zoi1U/NPdjDb6jXihqpiYnUK7uS7
 SaEgVVAc1rCLsO+PywRf34jY4cKkxjJ5rpb0iLv7Lx6icnPxIKkBSReqSNOAi5AyQqJr
 wfParI72b+nyrA1C6NNwYpO2mYi/F3sK4RXxqU2kGu5IcDipfl9TyQkhA6GnH0/P0zga
 4Pzu7HawlgloyguZmgsGbfP6pqVHW5N9NgfDTgsFvjn4zWaBEAPihtz4CQ3ui15zn27r
 jJSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=KQqlnqh61yDEivsgLuzXFgBFvWeIkle9538NvChEgG4=;
 b=B47dIYUZx3ABUTL51oMDWqW7KwSsZE5/dNAkt462CBXxp8CAhVLM/LZd3Z3CSCz7Kx
 AvIvX0fNLRMe/50mrZ74YNQ6ZQIYO2rnnS2Q+q+jY14RdEM7se53c8sOuHAPN3+qcyWf
 UsAfQMekcz8uZ6L0pjxNJ4UlekRv93r5cWwK0Y5EG+t4AinraKQW0DEDPyFAIXFn9Qak
 FaFPPNr/sr55elksyE2hGG+3+RHOl3mQmh6RkKTzIK1qcTlHEvG5MT5LbTbNvN59g8Km
 9UgZcLi/Okz0eH6atDIa8/+Etp+6oOaNDVfEVsEBIsk/cFyBqQITiRpIosF7JGIo9jvO
 Q5TA==
X-Gm-Message-State: ANoB5pnwrtgHGobPbrEA/W0ZThQeAeLbO6zXf8xD734ttJ15zivAGw0r
 JfYFT2TFWZzIM1XtO9MrWqZbUUjPE68MNWDUAfgcRA==
X-Google-Smtp-Source: AA0mqf53QBR47pUgYWT2xVhbs/Lj4/kZl7NAGXQCY837HnfVAtbLsG6fA3g+X2q4OOQ/b93b11NyQoioTLD4pHwNxXU=
X-Received: by 2002:a50:ee13:0:b0:463:a83c:e0af with SMTP id
 g19-20020a50ee13000000b00463a83ce0afmr679526eds.158.1668158446767; Fri, 11
 Nov 2022 01:20:46 -0800 (PST)
MIME-Version: 1.0
References: <20221018-clk-range-checks-fixes-v2-0-f6736dec138e@cerno.tech>
 <20221018-clk-range-checks-fixes-v2-35-f6736dec138e@cerno.tech>
 <CAPDyKFoycVedCJMy0=UK+q5SiPQHqje_8bSN-gdkpBa6KhFfkg@mail.gmail.com>
 <CACRpkdYOj8uozJZO4MV-_OAKeOsQHhoEM=PyynVuNY-JkpgTOw@mail.gmail.com>
 <CAPDyKFr6VeF3s47JfzJ9urtMsEem+GiBtHeU=_S8jNaz-D+qnw@mail.gmail.com>
In-Reply-To: <CAPDyKFr6VeF3s47JfzJ9urtMsEem+GiBtHeU=_S8jNaz-D+qnw@mail.gmail.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Fri, 11 Nov 2022 10:20:34 +0100
Message-ID: <CACRpkdb8uYfs6w99FVjD_t6nZgDhPUx=yB1j=CmpHTHAM2QGQw@mail.gmail.com>
Subject: Re: [PATCH v2 35/65] clk: ux500: sysctrl: Add a determine_rate hook
To: Ulf Hansson <ulf.hansson@linaro.org>
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
 Thierry Reding <thierry.reding@gmail.com>, Lee Jones <lee@kernel.org>,
 linux-phy@lists.infradead.org, linux-stm32@st-md-mailman.stormreply.com,
 Abel Vesa <abelvesa@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>,
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

On Thu, Nov 10, 2022 at 2:05 PM Ulf Hansson <ulf.hansson@linaro.org> wrote:
> On Thu, 10 Nov 2022 at 12:39, Linus Walleij <linus.walleij@linaro.org> wrote:
> >
> > On Thu, Nov 10, 2022 at 12:29 PM Ulf Hansson <ulf.hansson@linaro.org> wrote:
> > > On Fri, 4 Nov 2022 at 14:32, Maxime Ripard <maxime@cerno.tech> wrote:
> > > >
> > > > The UX500 sysctrl "set_parent" clocks implement a mux with a set_parent
> > > > hook, but doesn't provide a determine_rate implementation.
> > > >
> > > > This is a bit odd, since set_parent() is there to, as its name implies,
> > > > change the parent of a clock. However, the most likely candidate to
> > > > trigger that parent change is a call to clk_set_rate(), with
> > > > determine_rate() figuring out which parent is the best suited for a
> > > > given rate.
> > > >
> > > > The other trigger would be a call to clk_set_parent(), but it's far less
> > > > used, and it doesn't look like there's any obvious user for that clock.
> > >
> > > If I recall correctly, that is the use case we did target for these
> > > types of clocks. See sound/soc/ux500/ux500_ab85xx.c, for example.
> >
> > Hm I am trying to get that driver to work ... from time to time.
> > It's just that ALSA SoC DT has changed to much that it turns out
> > into a complete rewrite :/
> >
> > So in sound/soc/ux500/mop500_ab8500.c
> > I see this:
> >
> >         status = clk_set_parent(drvdata->clk_ptr_intclk, clk_ptr);
> >         if (status)
> > (...)
> >
> > and there is elaborate code to switch between "SYSCLK" and
> > "ULPCLK" (ulta-low power clock). Just like you say... however
> > a clock named SYSCLK or ULPCLK does not appear in the
> > code in drivers/clk/ux500 or any DT bindings so... it seems to
> > be non-working for the time being.
>
> It's definitely not working, but the corresponding clocks ("ulpclk",
> "intclk", "audioclk", etc) are being registered in ab8500_reg_clks().
>
> What seems to be missing is a DT conversion for these clocks, so they
> can be consumed properly. Right?

Yeps that and a few more things, I have a scratch rewrite here:
https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-stericsson.git/log/?h=ux500-audio-rewrite

I remember Lee said he had audio working with the mainline kernel
on Snowball at one point, unfortunately I think that was before we
started with the DT conversions and then we probably broke it.

Yours,
Linus Walleij
