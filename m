Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C53C7849ED6
	for <lists+dri-devel@lfdr.de>; Mon,  5 Feb 2024 16:54:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 37E8D10F9FC;
	Mon,  5 Feb 2024 15:54:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; secure) header.d=xff.cz header.i=@xff.cz header.b="FobrK0UM";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from vps.xff.cz (unknown [195.181.215.36])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2D07410F9FC
 for <dri-devel@lists.freedesktop.org>; Mon,  5 Feb 2024 15:54:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=xff.cz; s=mail;
 t=1707148447; bh=b/Dem0ECsfMrCXdGfQp14Mkyx8f0VspGV1icFGlRQeA=;
 h=Date:From:To:Cc:Subject:X-My-GPG-KeyId:References:From;
 b=FobrK0UMQyhHSrlREwoLvPtAVptvi2xFUmDJg36QNbRUJrs/xpegkCawOJQT74A6E
 9oPkfNja6Z7Ij2bGtj+KsGR/kId4f8a376BX1e2miJcsdLuRJoT9Bhmj6k3eO6exlc
 ct90WiwR4YUPjLuWr5oX1IOv4M4X5tjcaxHchuzE=
Date: Mon, 5 Feb 2024 16:54:07 +0100
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
Message-ID: <jzl3mlzk4j7qvgcedvipgale5nhinznefodrnaehwsqfnseiwc@7zzlxd4dpueh>
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
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240205-pinephone-pll-fixes-v2-0-96a46a2d8c9b@oltmanns.dev>
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

On Mon, Feb 05, 2024 at 04:22:23PM +0100, Frank Oltmanns wrote:
> On some pinephones the video output sometimes freezes (flips between two
> frames) [1]. It seems to be that the reason for this behaviour is that
> PLL-MIPI, PLL-GPU and GPU are operating outside their limits.
> 
> In this patch series I propose the followin changes:
>   1. sunxi-ng: Adhere to the following constraints given in the
>      Allwinner A64 Manual regarding PLL-MIPI:
>       * M/N <= 3
>       * (PLL_VIDEO0)/M >= 24MHz
>       * 500MHz <= clockrate <= 1400MHz
> 
>   2. Choose a higher clock rate for the ST7703 based XDB599 panel, so
>      that the panel function well with the Allwinner A64 SOC. PLL-MIPI
>      must run between 500 MHz and 1.4 GHz. As PLL-MIPI runs at 6 times
>      the panel's clock rate, we need the panel's clock to be at least
>      83.333 MHz.
> 
>   3. Increase the minimum frequency in the A64 DTS OPPs from 120 MHz to
>      192 MHz. This further reduces the issue.
> 
> Unfortunately, with these patches the issue [1] is not completely gone,
> but becomes less likely.
> 
> Note, that when pinning the GPU to 432 MHz the issue completely
> disappears for me. I've searched the BSP and could not find any
> indication that supports the idea of having the three OPPs. The only
> frequency I found in the BPSs for A64 is 432 MHz, that has also proven
> stable for me. So, while increasing the minimum frequency to 192 MHz
> reduces the issue, should we maybe instead set the GPU to a fixed 432
> MHz instead?

Per A64 User Manual 1.1 page 81:

(9). Clock output of PLL_GPU can be used for GPU;and dynamic frequency scaling is not supported;

Also sunxi-ng clk driver does apply NM factors at once to PLL_GPU clock,
which can cause sudden frequency increase beyond intended output frequency,
because division is applied immediately while multiplication is reflected
slowly.

Eg. if you're changing divider from 7 to 1, you can get a sudden 7x output
frequency spike, before PLL VCO manages to lower the frequency through N clk
divider feedback loop and lock on again. This can mess up whatever's connected
to the output quite badly.

You'd have to put logging on kernel writes to PLL_GPU register to see what
is written in there and if divider is lowered significantly on some GPU
devfreq frequency transitions.

It's also unclear what happens when FRAC_CLK_OUT or PLL_MODE_SEL changes.
Maybe not much because M is supposed to be set to 1, but you still need to
care when enabling fractional mode, and setting M to 1 because that's exactly
the bad scenario if M was previously higher than 1.

It's tricky.

Having GPU module clock gated during PLL config changes may help! You can
do that without locking yourself out, unlike with the CPU PLL.

There's a gate enable bit for it at GPU_CLK_REG.SCLK_GATING. (page 122)

Kind regards,
	o.

> I very much appreciate your feedback!
> 
> [1] https://gitlab.com/postmarketOS/pmaports/-/issues/805
> 
> Signed-off-by: Frank Oltmanns <frank@oltmanns.dev>
> ---
> Changes in v2:
> - dts: Increase minimum GPU frequency to 192 MHz.
> - nkm and a64: Add minimum and maximum rate for PLL-MIPI.
> - nkm: Use the same approach for skipping invalid rates in
>   ccu_nkm_find_best() as in ccu_nkm_find_best_with_parent_adj().
> - nkm: Improve names for ratio struct members and hence get rid of
>   describing comments.
> - nkm and a64: Correct description in the commit messages: M/N <= 3
> - Remove patches for nm as they were not needed.
> - st7703: Rework the commit message to cover more background for the
>   change.
> - Link to v1: https://lore.kernel.org/r/20231218-pinephone-pll-fixes-v1-0-e238b6ed6dc1@oltmanns.dev
> 
> ---
> Frank Oltmanns (6):
>       clk: sunxi-ng: nkm: Support constraints on m/n ratio and parent rate
>       clk: sunxi-ng: a64: Add constraints on PLL-MIPI's n/m ratio and parent rate
>       clk: sunxi-ng: nkm: Support minimum and maximum rate
>       clk: sunxi-ng: a64: Set minimum and maximum rate for PLL-MIPI
>       drm/panel: st7703: Drive XBD599 panel at higher clock rate
>       arm64: dts: allwinner: a64: Fix minimum GPU OPP rate
> 
>  arch/arm64/boot/dts/allwinner/sun50i-a64.dtsi |  4 ++--
>  drivers/clk/sunxi-ng/ccu-sun50i-a64.c         | 14 +++++++----
>  drivers/clk/sunxi-ng/ccu_nkm.c                | 34 +++++++++++++++++++++++++++
>  drivers/clk/sunxi-ng/ccu_nkm.h                |  4 ++++
>  drivers/gpu/drm/panel/panel-sitronix-st7703.c | 14 +++++------
>  5 files changed, 56 insertions(+), 14 deletions(-)
> ---
> base-commit: 059c53e877ca6e723e10490c27c1487a63e66efe
> change-id: 20231218-pinephone-pll-fixes-0ccdfde273e4
> 
> Best regards,
> -- 
> Frank Oltmanns <frank@oltmanns.dev>
> 
