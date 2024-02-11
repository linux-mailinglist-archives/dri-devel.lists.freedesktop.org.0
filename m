Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C147850B14
	for <lists+dri-devel@lfdr.de>; Sun, 11 Feb 2024 20:25:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 528E910E2BD;
	Sun, 11 Feb 2024 19:25:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; secure) header.d=xff.cz header.i=@xff.cz header.b="sWJbAR6O";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from vps.xff.cz (vps.xff.cz [195.181.215.36])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E086710E2BD
 for <dri-devel@lists.freedesktop.org>; Sun, 11 Feb 2024 19:25:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=xff.cz; s=mail;
 t=1707679529; bh=Z25xX+bia1okSsqB7nry5Ae+hz9tSpeaIvW4gUl9Nvk=;
 h=Date:From:To:Cc:Subject:X-My-GPG-KeyId:References:From;
 b=sWJbAR6OOaa2c8K/IhfYfHLR//CTYGvBOg2nHOeuBAGccuAKi+qMKGIC+vOuxFTml
 4N6LAxX7rt5h0tCtN1PtHKZgSaft/hCB6K38T1lXJj03Z2uB3GDnpJet3eodCdfLnV
 QVaK/RQqsgePuQcFmuB5IKOYAbiDrHJugcqnxkWQ=
Date: Sun, 11 Feb 2024 20:25:29 +0100
From: =?utf-8?Q?Ond=C5=99ej?= Jirman <megi@xff.cz>
To: Frank Oltmanns <frank@oltmanns.dev>
Cc: Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Chen-Yu Tsai <wens@csie.org>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>,
 Guido =?utf-8?Q?G=C3=BCnther?= <agx@sigxcpu.org>,
 Purism Kernel Team <kernel@puri.sm>, 
 Neil Armstrong <neil.armstrong@linaro.org>,
 Jessica Zhang <quic_jesszhan@quicinc.com>, 
 Sam Ravnborg <sam@ravnborg.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, linux-clk@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, 
 linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org
Subject: Re: [PATCH v2 0/6] Pinephone video out fixes (flipping between two
 frames)
Message-ID: <s7uslavg5gzqzzdetwcushcknwe3nuicmqhfhb7gbapzxx2npy@srjc252uinqv>
Mail-Followup-To: =?utf-8?Q?Ond=C5=99ej?= Jirman <megi@xff.cz>, 
 Frank Oltmanns <frank@oltmanns.dev>,
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Chen-Yu Tsai <wens@csie.org>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>,
 Guido =?utf-8?Q?G=C3=BCnther?= <agx@sigxcpu.org>,
 Purism Kernel Team <kernel@puri.sm>, 
 Neil Armstrong <neil.armstrong@linaro.org>,
 Jessica Zhang <quic_jesszhan@quicinc.com>, 
 Sam Ravnborg <sam@ravnborg.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, linux-clk@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, 
 linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org
X-My-GPG-KeyId: EBFBDDE11FB918D44D1F56C1F9F0A873BE9777ED
 <https://xff.cz/key.txt>
References: <20240205-pinephone-pll-fixes-v2-0-96a46a2d8c9b@oltmanns.dev>
 <jzl3mlzk4j7qvgcedvipgale5nhinznefodrnaehwsqfnseiwc@7zzlxd4dpueh>
 <bgyyemyi4shj3spo6qy4icvk56nrp5sihnzqurnozqdyktwugc@ikurx4ojoxpi>
 <87wmrbxckj.fsf@oltmanns.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <87wmrbxckj.fsf@oltmanns.dev>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Frank,

On Sun, Feb 11, 2024 at 04:09:16PM +0100, Frank Oltmanns wrote:
> Hi Ondřej,
> 
> On 2024-02-05 at 17:02:00 +0100, Ondřej Jirman <megi@xff.cz> wrote:
> > On Mon, Feb 05, 2024 at 04:54:07PM +0100, Ondřej Jirman wrote:
> >> On Mon, Feb 05, 2024 at 04:22:23PM +0100, Frank Oltmanns wrote:
> >>
> >> [...]
> >>
> >> Also sunxi-ng clk driver does apply NM factors at once to PLL_GPU clock,
> >> which can cause sudden frequency increase beyond intended output frequency,
> >> because division is applied immediately while multiplication is reflected
> >> slowly.
> >>
> >> Eg. if you're changing divider from 7 to 1, you can get a sudden 7x output
> >> frequency spike, before PLL VCO manages to lower the frequency through N clk
> >> divider feedback loop and lock on again. This can mess up whatever's connected
> >> to the output quite badly.
> >>
> >> You'd have to put logging on kernel writes to PLL_GPU register to see what
> >> is written in there and if divider is lowered significantly on some GPU
> >> devfreq frequency transitions.
> 
> By looking at the clocks in clk_summary in debugfs, the rate of PLL-GPU
> always matches the rate of the GPU (at least at 120, 312, and 432 MHz).
> This is further underlined by the fact, that none of the rates can be
> achieved by integer dividing one of the other rates. sunxi-ng would
> only favor a different rate for pll-gpu than the one that is requested
> for the gpu, if pll-gpu is already running at a rate such that there
> exists an M ∈ {1, 2, 3, 4, 5, 6, 7, 8}, where
>   rate of pll-gpu / M = requested gpu rate
> or if the requested rate could not be reached directly by pll-gpu. Both
> is not the case for the rates in question (120, 192, 312, and 432 MHz).
> 
> This means that the following divisor/multipliers are used by sunxi-ng's
> ccu_nm:
> N =  5, M = 1 for 120 MHz (min value without PATCH 6)
> N =  8, M = 1 for 192 MHz (min value after applying PATCH 6)
> N = 13, M = 1 for 312 MHz
> N = 18, M = 1 for 432 MHz
> 
> So, with or without PATCH 6, the divider stays constant and it's only
> the multiplier that changes. This means, there should be no unexpected
> frequency spikes, right?

Maybe. Thanks for giving it a try. There may still be other kinds of glitches
even if the divisor stays the same. It all depends how the register update is
implemented in the PLL block. It's hard to say. I guess, unless Allwinner
guarantees glitchless output from a given PLL when changing its parameters,
you can't rely on the output being clean during changes.

> >> It's also unclear what happens when FRAC_CLK_OUT or PLL_MODE_SEL changes.
> 
> Those are not changed once the clock is initialized. The bug however
> occurs hours or days after booting. IMO, this makes it unlikely that this
> could be the culprit.
> 
> >> Maybe not much because M is supposed to be set to 1, but you still need to
> >> care when enabling fractional mode, and setting M to 1 because that's exactly
> >> the bad scenario if M was previously higher than 1.
> >>
> >> It's tricky.
> >>
> >> Having GPU module clock gated during PLL config changes may help! You can
> >> do that without locking yourself out, unlike with the CPU PLL.
> >>
> >> There's a gate enable bit for it at GPU_CLK_REG.SCLK_GATING. (page 122)
> 
> The GPU should already be properly gated:
> https://elixir.bootlin.com/linux/v6.7.4/source/drivers/clk/sunxi-ng/ccu-sun50i-a64.c#L599

How so? That's just clock declaration. How does it guarantee the clock to the
module is gated during parent PLL configuration changes?

CLK_SET_RATE_PARENT only gates output on re-parenting, not on parent rate changes,
according to the header:

  https://elixir.bootlin.com/linux/v6.7.4/source/include/linux/clk-provider.h#L19

You'd need perhaps CLK_SET_RATE_GATE *and* still verify that it actually works
as expected via some tracing of gpu clock enable/disable/set_rate and pll-gpu
set_rate. CLK_SET_RATE_GATE seems confusingly docummented:

  https://elixir.bootlin.com/linux/v6.7.4/source/drivers/clk/clk.c#L1034

so I don't particularly trust it does exaclty what the header claims and what
would be needed to test the theory that gating gpu clock during rate change
might help.

kind regards,
	o.

> Thank you for your detailed proposal! It was insightful to read. But
> while those were all great ideas, they have all already been taken care
> of. I'm fresh out of ideas again (except for pinning the GPU rate).
> 
> Again, thank you so much,
>   Frank
> 
> >>
> >> Kind regards,
> >> 	o.
> >>
> >> > I very much appreciate your feedback!
> >> >
> >> > [1] https://gitlab.com/postmarketOS/pmaports/-/issues/805
> >> >
> >> > Signed-off-by: Frank Oltmanns <frank@oltmanns.dev>
> >> > ---
> >> > Changes in v2:
> >> > - dts: Increase minimum GPU frequency to 192 MHz.
> >> > - nkm and a64: Add minimum and maximum rate for PLL-MIPI.
> >> > - nkm: Use the same approach for skipping invalid rates in
> >> >   ccu_nkm_find_best() as in ccu_nkm_find_best_with_parent_adj().
> >> > - nkm: Improve names for ratio struct members and hence get rid of
> >> >   describing comments.
> >> > - nkm and a64: Correct description in the commit messages: M/N <= 3
> >> > - Remove patches for nm as they were not needed.
> >> > - st7703: Rework the commit message to cover more background for the
> >> >   change.
> >> > - Link to v1: https://lore.kernel.org/r/20231218-pinephone-pll-fixes-v1-0-e238b6ed6dc1@oltmanns.dev
> >> >
> >> > ---
> >> > Frank Oltmanns (6):
> >> >       clk: sunxi-ng: nkm: Support constraints on m/n ratio and parent rate
> >> >       clk: sunxi-ng: a64: Add constraints on PLL-MIPI's n/m ratio and parent rate
> >> >       clk: sunxi-ng: nkm: Support minimum and maximum rate
> >> >       clk: sunxi-ng: a64: Set minimum and maximum rate for PLL-MIPI
> >> >       drm/panel: st7703: Drive XBD599 panel at higher clock rate
> >> >       arm64: dts: allwinner: a64: Fix minimum GPU OPP rate
> >> >
> >> >  arch/arm64/boot/dts/allwinner/sun50i-a64.dtsi |  4 ++--
> >> >  drivers/clk/sunxi-ng/ccu-sun50i-a64.c         | 14 +++++++----
> >> >  drivers/clk/sunxi-ng/ccu_nkm.c                | 34 +++++++++++++++++++++++++++
> >> >  drivers/clk/sunxi-ng/ccu_nkm.h                |  4 ++++
> >> >  drivers/gpu/drm/panel/panel-sitronix-st7703.c | 14 +++++------
> >> >  5 files changed, 56 insertions(+), 14 deletions(-)
> >> > ---
> >> > base-commit: 059c53e877ca6e723e10490c27c1487a63e66efe
> >> > change-id: 20231218-pinephone-pll-fixes-0ccdfde273e4
> >> >
> >> > Best regards,
> >> > --
> >> > Frank Oltmanns <frank@oltmanns.dev>
> >> >
