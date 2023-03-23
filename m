Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 62E556C7D08
	for <lists+dri-devel@lfdr.de>; Fri, 24 Mar 2023 12:09:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0C47410E16B;
	Fri, 24 Mar 2023 11:09:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com
 [IPv6:2a00:1450:4864:20::42a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2AFC910E16B
 for <dri-devel@lists.freedesktop.org>; Fri, 24 Mar 2023 11:09:42 +0000 (UTC)
Received: by mail-wr1-x42a.google.com with SMTP id v1so1393026wrv.1
 for <dri-devel@lists.freedesktop.org>; Fri, 24 Mar 2023 04:09:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112; t=1679656180;
 h=mime-version:message-id:in-reply-to:date:subject:cc:to:from
 :references:from:to:cc:subject:date:message-id:reply-to;
 bh=KKGzHAjESOwY5CJ6aIkXRblEUT9vcmLWXQ+M0lRFaT8=;
 b=hzyILuXnSZ7lMaDYB5rhB/bnNUkufwU6fB5inzHRnGwGUpJquemA3X84Lzp++Y2YJ+
 xX92fJNLk8xQHwS1+YxTda7OSm5DtCOvp4pDLhNSgUC+z/fJXup9nphjXvyJHgvtZySv
 Ing1oEJUNGaC5fkPShiXmhVhP4ZVm14D3SAO1J3Mw26nhpiPZuGPtANkaXRqnth94OzX
 eWmkntp/5aW21aNCDZJKirG9vn5GmZabE2CYZSk/g1dEY9qxrgIgg/yw5kqOFSzwoNBS
 JwX3UeufEHb7ANEt7KtJeAKptHBPlTmLr2bfmp8WEFpNkr4PD3Q/FNi6OhewGezr1Z61
 Chlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679656180;
 h=mime-version:message-id:in-reply-to:date:subject:cc:to:from
 :references:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=KKGzHAjESOwY5CJ6aIkXRblEUT9vcmLWXQ+M0lRFaT8=;
 b=WK51lw06ZOhSxDg0BUV5o+HkPc9sxPv2C+HDtFlEYcxyrwmVXtaSf3U6ytuZq8yznD
 c6CUER9yqdfbxjtwjBmWGsho5JIuQFiGPyxaUKCe1gRG+18rd73TR7ms7IKDnD56praK
 MXcbogxEyGuRRQZ0yqp0zEeXT8DPATT1IuQmjq7+uR060sOrlJTKH6QHolPrudq5CTv0
 KTnkRG0yiC70OuZYaMmZjPj4cSxOL+X5aUwYPetBZ1jUF9010IjWsWJVveuJuJSEtdge
 CtxGIGBbkm3KXyfk2Pf9+Xf6zBW5hbIcNxAMdTHzfmRN41kf8dejSH4SMUDuXauMqhpL
 Yk6Q==
X-Gm-Message-State: AAQBX9fkDqBzzfIzUZQyt4S+w34CGoNRuGMYlJUn20wmyn8CuAtjVHCC
 i3lmiI3QBY+YmfqbKZCFtPw=
X-Google-Smtp-Source: AKy350ZmBQJTJNYHdzNhp0Qvsm2ha5bci7Pffhjn47i2N4HkGJnSU/0GajVbD8LVTLhlg10uq2ysNw==
X-Received: by 2002:a5d:6290:0:b0:2da:53e3:57cf with SMTP id
 k16-20020a5d6290000000b002da53e357cfmr1959487wru.71.1679656180460; 
 Fri, 24 Mar 2023 04:09:40 -0700 (PDT)
Received: from localhost (188.28.8.105.threembb.co.uk. [188.28.8.105])
 by smtp.gmail.com with ESMTPSA id
 a8-20020a056000100800b002d8566128e5sm9760336wrx.25.2023.03.24.04.09.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 24 Mar 2023 04:09:39 -0700 (PDT)
References: <20221018-clk-range-checks-fixes-v2-0-f6736dec138e@cerno.tech>
 <20221018-clk-range-checks-fixes-v2-56-f6736dec138e@cerno.tech>
 <80VTKR.CE8RVN8M3ZYK3@crapouillou.net>
 <20221104145946.orsyrhiqvypisl5j@houat>
 <cp7Yh29ndlOOi1yW8KwCcpzoLPLxm1vR@localhost>
 <20221107085417.xrsh6xy3ouwdkp4z@houat>
 <ucJ6KSBqdPTxfxUQqLUr9C9RGiQRnY1I@localhost>
 <20221109110045.j24vwkaq3s4yzoy3@houat>
 <06a293adc75990ed3e297b076fc38d8a.sboyd@kernel.org>
From: Aidan MacDonald <aidanmacdonald.0x0@gmail.com>
To: Stephen Boyd <sboyd@kernel.org>
Subject: Re: [PATCH v2 56/65] clk: ingenic: cgu: Switch to determine_rate
Date: Thu, 23 Mar 2023 15:35:30 +0000
In-reply-to: <06a293adc75990ed3e297b076fc38d8a.sboyd@kernel.org>
Message-ID: <xpKMzGb1sOsucWMTlJIMzrT5KjLlZ7JP@localhost>
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
 linux-mediatek@lists.infradead.org, Maxime Ripard <maxime@cerno.tech>,
 Baolin Wang <baolin.wang@linux.alibaba.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 linux-arm-kernel@lists.infradead.org,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Alessandro Zummo <a.zummo@towertech.it>, linux-sunxi@lists.linux.dev,
 patches@opensource.cirrus.com, Peter De Schrijver <pdeschrijver@nvidia.com>,
 Nicolas Ferre <nicolas.ferre@microchip.com>,
 Andreas =?utf-8?Q?F=C3=A4rber?= <afaerber@suse.de>,
 linux-renesas-soc@vger.kernel.org, Dinh Nguyen <dinguyen@kernel.org>,
 Vinod Koul <vkoul@kernel.org>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 David Lechner <david@lechnology.com>, Shawn Guo <shawnguo@kernel.org>,
 Claudiu Beznea <claudiu.beznea@microchip.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


Stephen Boyd <sboyd@kernel.org> writes:

> Quoting Maxime Ripard (2022-11-09 03:00:45)
>> On Mon, Nov 07, 2022 at 08:57:22PM +0000, Aidan MacDonald wrote:
>> >
>> > Maxime Ripard <maxime@cerno.tech> writes:
>> >
>> > > Hi,
>> > >
>> > > On Fri, Nov 04, 2022 at 05:35:29PM +0000, Aidan MacDonald wrote:
>> >
>> > Assigning the parent clock in the DT works once, at boot, but going off
>> > what you wrote in the commit message, if the clock driver has a
>> > .determine_rate() implementation that *can* reparent clocks then it
>> > probably *will* reparent them, and the DT assignment will be lost.
>>
>> Yes, indeed, but assigned-clock-parents never provided any sort of
>> guarantee on whether or not the clock was allowed to reparent or not.
>> It's just a one-off thing, right before probe, and a clk_set_parent()
>> call at probe will override that just fine.
>>
>> Just like assigned-clock-rates isn't permanent.
>>
>> > What I'm suggesting is a runtime constraint that the clock subsystem
>> > would enforce, and actively prevent drivers from changing the parent.
>> > Either explicitly with clk_set_parent() or due to .determine_rate().
>> >
>> > That way you could write a .determine_rate() implementation that *can*
>> > select a better parent, but if the DT applies a constraint to fix the
>> > clock to a particular parent, the clock subsystem will force that parent
>> > to be used so you can be sure the clock is never reparented by accident.
>>
>> Yeah, that sounds like a good idea, and CLK_SET_RATE_NO_REPARENT isn't
>> too far off from this, it's just ignored by clk_set_parent() for now. I
>> guess we could rename CLK_SET_RATE_NO_REPARENT to CLK_NO_REPARENT, make
>> clk_set_parent handle it, and set that flag whenever
>> assigned-clock-parents is set on a clock.
>>
>> It's out of scope for this series though, and I certainly don't want to
>> deal with all the regressions it might create :)
>>
>
> This sounds like a new dt binding that says the assigned parent should
> never change. It sounds sort of like gpio hogs. A clock-hogs binding?

Ideally we want the clock driver to be able to reparent clocks freely
to get the best rate. But we also need some control over that to stop
consumers from being reparented in undesired ways. Eg. you might want
to make sure the GPU gets its own PLL so it can be reclocked easily,
and putting another device on the GPU's PLL could prevent that.

The only way to achieve this today is (1) never do any reparenting in
the clock driver; and (2) use assigned-clock-parents in the DT to set
up the entire clock tree manually.

Maxime said that (2) is basically wrong -- if assigned-clock-parents
provides no guarantee on what the OS does "after boot" then the OS is
pretty much free to ignore it.

My suggestion: add a per-clock bitmap to keep track of which parents
are allowed. Any operation that would select a parent clock not on the
whitelist should fail. Automatic reparenting should only select from
clocks on the whitelist. And we need new DT bindings for controlling
the whitelist, for example:

    clock-parents-0 = <&clk1>, <&pll_c>;
    clock-parents-1 = <&clk2>, <&pll_a>, <&pll_b>;

This means that clk1 can only have pll_c as a parent, while clk2 can
have pll_a or pll_b as parents. By default every clock will be able
to use any parent, so a list is only needed if the machine needs a
more restrictive policy.

assigned-clock-parents should disable automatic reparenting, but allow
explicit clk_set_parent(). This will allow clock drivers to start doing
reparenting without breaking old DTs.
