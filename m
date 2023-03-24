Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C79BB6C87F8
	for <lists+dri-devel@lfdr.de>; Fri, 24 Mar 2023 23:04:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1FD3610ECAC;
	Fri, 24 Mar 2023 22:03:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com
 [IPv6:2a00:1450:4864:20::42a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8864110E258
 for <dri-devel@lists.freedesktop.org>; Fri, 24 Mar 2023 22:03:56 +0000 (UTC)
Received: by mail-wr1-x42a.google.com with SMTP id e18so3130128wra.9
 for <dri-devel@lists.freedesktop.org>; Fri, 24 Mar 2023 15:03:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112; t=1679695435;
 h=mime-version:message-id:in-reply-to:date:subject:cc:to:from
 :references:from:to:cc:subject:date:message-id:reply-to;
 bh=eQ3RSbBi4GxRzlwFNletxU5cxz92xG3Lj6FTyrjdc0o=;
 b=T3F8aNz2ox9uoURQlE0mq2sXW4z262BpvG7ZxRtAtIbFhPc/TQEpQM0a0SgR+TrqHO
 CLYGJXT6hxHwzdY9UN32CZG2dOkIF2LFvXUPmwkIF/2GkwmMW7kb6axItHjQcEjAF96P
 YoZ2Q3loL8sCvN2e52vHQqe+AQbmZyqmh9t2+HCpPytsWAA2sxbaBc61b92bJ1dDr0QQ
 Tdx2iHxB/Aa/m/jyDHMcs00O0mdizZduxSlMQxMVQw/7cAeVdYgYGEV+MFN8ajK6+qK2
 SFuRxlx0kY19AQ86OkmU5aCJ9GqDDqrZ45+h67Pz4nAn4V4ElL3E8abtemphkRCVy/gF
 HzMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679695435;
 h=mime-version:message-id:in-reply-to:date:subject:cc:to:from
 :references:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=eQ3RSbBi4GxRzlwFNletxU5cxz92xG3Lj6FTyrjdc0o=;
 b=yxXWmUJOMGB9LDEzEENZcC2Sh2DAXn+9wjMRknBwVp3KZ8ju32qaAStX50qCFrTAnx
 MbAPyIaTgAzEbcElryvU9d2TH4RSfia/1YbKuoraxXBDnZ/D/M7q0uzXYNBnC7qvrESi
 lIf3n6FKo43icGCGJSm2OT8D0RZOhzPLczcwVdV9dLAT9yJwjp2ueyyjPYAU33+u5vDK
 c3dPg8c7aEUhh7Xno206IxJiO53o2A1JgRNjAd0xQLog06WVCd2nZ63VlR5XL45elHMx
 +2N6e5VjCfF/leqXN+YiiqSZPn4pqS7Y1C7/mnal0kr7AxyvVyEDhAW7AYe9nasPy/1j
 t6Pg==
X-Gm-Message-State: AAQBX9cvVtsvDHPr/INTjaVNXTJOKTkLao/JoiN2QHNlJWY1fwAgVSaC
 MgV4O54DNEMXImNaE73pGPo=
X-Google-Smtp-Source: AKy350bTnEgVdoWb1kTWyTj04kbZ8RkYf2o8/EHnYZiiSg63myut6K0B/vHtQugbPkbZgvwsB8kF9A==
X-Received: by 2002:adf:e905:0:b0:2ce:a096:3ff2 with SMTP id
 f5-20020adfe905000000b002cea0963ff2mr3187613wrm.63.1679695434807; 
 Fri, 24 Mar 2023 15:03:54 -0700 (PDT)
Received: from localhost (94.197.5.156.threembb.co.uk. [94.197.5.156])
 by smtp.gmail.com with ESMTPSA id
 e9-20020adffc49000000b002be5bdbe40csm19237361wrs.27.2023.03.24.15.03.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 24 Mar 2023 15:03:54 -0700 (PDT)
References: <20221018-clk-range-checks-fixes-v2-0-f6736dec138e@cerno.tech>
 <20221018-clk-range-checks-fixes-v2-56-f6736dec138e@cerno.tech>
 <80VTKR.CE8RVN8M3ZYK3@crapouillou.net>
 <20221104145946.orsyrhiqvypisl5j@houat>
 <cp7Yh29ndlOOi1yW8KwCcpzoLPLxm1vR@localhost>
 <20221107085417.xrsh6xy3ouwdkp4z@houat>
 <ucJ6KSBqdPTxfxUQqLUr9C9RGiQRnY1I@localhost>
 <20221109110045.j24vwkaq3s4yzoy3@houat>
 <06a293adc75990ed3e297b076fc38d8a.sboyd@kernel.org>
 <xpKMzGb1sOsucWMTlJIMzrT5KjLlZ7JP@localhost>
 <20230324111959.frjf4neopbs67ugd@houat>
From: Aidan MacDonald <aidanmacdonald.0x0@gmail.com>
To: Maxime Ripard <maxime@cerno.tech>
Subject: Re: [PATCH v2 56/65] clk: ingenic: cgu: Switch to determine_rate
Date: Fri, 24 Mar 2023 20:58:48 +0000
In-reply-to: <20230324111959.frjf4neopbs67ugd@houat>
Message-ID: <rTJKpeLOBeu3eOLW5z3P5fEpcOJJLrGs@localhost>
MIME-Version: 1.0
Content-Type: text/plain
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
 linux-rtc@vger.kernel.org, linux-clk@vger.kernel.org,
 Charles Keepax <ckeepax@opensource.cirrus.com>, alsa-devel@alsa-project.org,
 Manivannan Sadhasivam <mani@kernel.org>, linux-kernel@vger.kernel.org,
 Sascha Hauer <s.hauer@pengutronix.de>, linux-actions@lists.infradead.org,
 Richard Fitzgerald <rf@opensource.cirrus.com>, Mark Brown <broonie@kernel.org>,
 linux-mediatek@lists.infradead.org,
 Baolin Wang <baolin.wang@linux.alibaba.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 linux-arm-kernel@lists.infradead.org,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Alessandro Zummo <a.zummo@towertech.it>, linux-sunxi@lists.linux.dev,
 Stephen Boyd <sboyd@kernel.org>, patches@opensource.cirrus.com,
 Peter De Schrijver <pdeschrijver@nvidia.com>,
 Nicolas Ferre <nicolas.ferre@microchip.com>,
 Andreas =?utf-8?Q?F=C3=A4rber?= <afaerber@suse.de>,
 linux-renesas-soc@vger.kernel.org, Dinh Nguyen <dinguyen@kernel.org>,
 Vinod Koul <vkoul@kernel.org>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 David Lechner <david@lechnology.com>, Shawn Guo <shawnguo@kernel.org>,
 Claudiu Beznea <claudiu.beznea@microchip.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


Maxime Ripard <maxime@cerno.tech> writes:

> On Thu, Mar 23, 2023 at 03:35:30PM +0000, Aidan MacDonald wrote:
>>
>> Stephen Boyd <sboyd@kernel.org> writes:
>>
>> > Quoting Maxime Ripard (2022-11-09 03:00:45)
>> >> On Mon, Nov 07, 2022 at 08:57:22PM +0000, Aidan MacDonald wrote:
>> >> >
>> >> > Maxime Ripard <maxime@cerno.tech> writes:
>> >> >
>> >> > > Hi,
>> >> > >
>> >> > > On Fri, Nov 04, 2022 at 05:35:29PM +0000, Aidan MacDonald wrote:
>> >> >
>> >> > Assigning the parent clock in the DT works once, at boot, but going off
>> >> > what you wrote in the commit message, if the clock driver has a
>> >> > .determine_rate() implementation that *can* reparent clocks then it
>> >> > probably *will* reparent them, and the DT assignment will be lost.
>> >>
>> >> Yes, indeed, but assigned-clock-parents never provided any sort of
>> >> guarantee on whether or not the clock was allowed to reparent or not.
>> >> It's just a one-off thing, right before probe, and a clk_set_parent()
>> >> call at probe will override that just fine.
>> >>
>> >> Just like assigned-clock-rates isn't permanent.
>> >>
>> >> > What I'm suggesting is a runtime constraint that the clock subsystem
>> >> > would enforce, and actively prevent drivers from changing the parent.
>> >> > Either explicitly with clk_set_parent() or due to .determine_rate().
>> >> >
>> >> > That way you could write a .determine_rate() implementation that *can*
>> >> > select a better parent, but if the DT applies a constraint to fix the
>> >> > clock to a particular parent, the clock subsystem will force that parent
>> >> > to be used so you can be sure the clock is never reparented by accident.
>> >>
>> >> Yeah, that sounds like a good idea, and CLK_SET_RATE_NO_REPARENT isn't
>> >> too far off from this, it's just ignored by clk_set_parent() for now. I
>> >> guess we could rename CLK_SET_RATE_NO_REPARENT to CLK_NO_REPARENT, make
>> >> clk_set_parent handle it, and set that flag whenever
>> >> assigned-clock-parents is set on a clock.
>> >>
>> >> It's out of scope for this series though, and I certainly don't want to
>> >> deal with all the regressions it might create :)
>> >>
>> >
>> > This sounds like a new dt binding that says the assigned parent should
>> > never change. It sounds sort of like gpio hogs. A clock-hogs binding?
>>
>> Ideally we want the clock driver to be able to reparent clocks freely
>> to get the best rate. But we also need some control over that to stop
>> consumers from being reparented in undesired ways. Eg. you might want
>> to make sure the GPU gets its own PLL so it can be reclocked easily,
>> and putting another device on the GPU's PLL could prevent that.
>>
>> The only way to achieve this today is (1) never do any reparenting in
>> the clock driver; and (2) use assigned-clock-parents in the DT to set
>> up the entire clock tree manually.
>>
>> Maxime said that (2) is basically wrong -- if assigned-clock-parents
>> provides no guarantee on what the OS does "after boot" then the OS is
>> pretty much free to ignore it.
>
> I didn't really say it's wrong, just that it never provided the
> guarantee you expect it to provide. I can't really say whether it's an
> issue or not on your platform.
>
> It's mostly unrelated to this series though, none of these patches
> affect that behavior in one way or the other.

I know. Sorry for derailing your patch :(

>> My suggestion: add a per-clock bitmap to keep track of which parents
>> are allowed. Any operation that would select a parent clock not on the
>> whitelist should fail. Automatic reparenting should only select from
>> clocks on the whitelist. And we need new DT bindings for controlling
>> the whitelist, for example:
>>
>>     clock-parents-0 = <&clk1>, <&pll_c>;
>>     clock-parents-1 = <&clk2>, <&pll_a>, <&pll_b>;
>>
>> This means that clk1 can only have pll_c as a parent, while clk2 can
>> have pll_a or pll_b as parents. By default every clock will be able
>> to use any parent, so a list is only needed if the machine needs a
>> more restrictive policy.
>>
>> assigned-clock-parents should disable automatic reparenting, but allow
>> explicit clk_set_parent(). This will allow clock drivers to start doing
>> reparenting without breaking old DTs.
>
> I'm generally not a fan of putting all these policies in the device
> tree. Do you have an example where it wouldn't be possible to do exactly
> this from the driver itself?
>
> Maxime

I'm confused. What's implicit in the example is clk1 and clk2 might
have *other* possible choices of parent clock and the device tree is
limiting what the OS is allowed to choose.

Why would you put such arbitrary limitations into the driver? They
would be different from machine to machine, unless the clock tree is
so simple there is only *one* meaningful way to configure it. Most
SoCs are complicated enough that there will be tradeoffs depending
on what peripherals you are using (typically a single machine will
not use *every* peripheral device provided by the SoC).
