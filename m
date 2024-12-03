Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 372D69E15E9
	for <lists+dri-devel@lfdr.de>; Tue,  3 Dec 2024 09:37:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 424FE10E10F;
	Tue,  3 Dec 2024 08:37:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="ThMdEicJ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7E94810E10F
 for <dri-devel@lists.freedesktop.org>; Tue,  3 Dec 2024 08:37:51 +0000 (UTC)
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi
 [81.175.209.231])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 080D68DB;
 Tue,  3 Dec 2024 09:37:23 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1733215043;
 bh=PYHQYJMAlXFNnWhLgpfhqxgPeimkafKhp9uGyvCwl2w=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=ThMdEicJ+cJ2NLIxjymB3476Nrp2qS9QxLdkIAKUWOrvDQDF2q46vs1gH0wqX+72/
 8wu9GOmfAxKfNJlWor95paWzw4sXdtafinEYF38QoKbzdHQYT2s1GI2590WZSTZbzd
 A+osDw1FJhDaO9mcLvOYQc7rWOuXH++HmlTF96Hg=
Date: Tue, 3 Dec 2024 10:37:38 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Cc: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Robert Foss <rfoss@kernel.org>, Jonas Karlman <jonas@kwiboo.se>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Magnus Damm <magnus.damm@gmail.com>,
 Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>, LUU HOAI <hoai.luu.ub@renesas.com>,
 Jagan Teki <jagan@amarulasolutions.com>, Sam Ravnborg <sam@ravnborg.org>,
 Biju Das <biju.das.jz@bp.renesas.com>,
 dri-devel@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-clk@vger.kernel.org,
 Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
Subject: Re: [PATCH 3/9] clk: renesas: r8a779h0: Add display clocks
Message-ID: <20241203083738.GF10736@pendragon.ideasonboard.com>
References: <20241203-rcar-gh-dsi-v1-0-738ae1a95d2a@ideasonboard.com>
 <20241203-rcar-gh-dsi-v1-3-738ae1a95d2a@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20241203-rcar-gh-dsi-v1-3-738ae1a95d2a@ideasonboard.com>
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

Hi Tomi,

Thank you for the patch.

On Tue, Dec 03, 2024 at 10:01:37AM +0200, Tomi Valkeinen wrote:
> From: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
> 
> Add display related clocks for DU, DSI, FCPVD, and VSPD.
> 
> Signed-off-by: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
> ---
>  drivers/clk/renesas/r8a779h0-cpg-mssr.c | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/drivers/clk/renesas/r8a779h0-cpg-mssr.c b/drivers/clk/renesas/r8a779h0-cpg-mssr.c
> index e20c048bfa9b..dc37e987c0e6 100644
> --- a/drivers/clk/renesas/r8a779h0-cpg-mssr.c
> +++ b/drivers/clk/renesas/r8a779h0-cpg-mssr.c
> @@ -179,6 +179,9 @@ static const struct mssr_mod_clk r8a779h0_mod_clks[] __initconst = {
>  	DEF_MOD("canfd0",	328,	R8A779H0_CLK_SASYNCPERD2),
>  	DEF_MOD("csi40",	331,	R8A779H0_CLK_CSI),
>  	DEF_MOD("csi41",	400,	R8A779H0_CLK_CSI),
> +	DEF_MOD("dis0",		411,	R8A779H0_CLK_S0D3),
> +	DEF_MOD("dsitxlink0",	415,	R8A779H0_CLK_DSIREF),
> +	DEF_MOD("fcpvd0",	508,	R8A779H0_CLK_S0D3),
>  	DEF_MOD("hscif0",	514,	R8A779H0_CLK_SASYNCPERD1),
>  	DEF_MOD("hscif1",	515,	R8A779H0_CLK_SASYNCPERD1),
>  	DEF_MOD("hscif2",	516,	R8A779H0_CLK_SASYNCPERD1),
> @@ -227,6 +230,7 @@ static const struct mssr_mod_clk r8a779h0_mod_clks[] __initconst = {
>  	DEF_MOD("vin15",	811,	R8A779H0_CLK_S0D4_VIO),
>  	DEF_MOD("vin16",	812,	R8A779H0_CLK_S0D4_VIO),
>  	DEF_MOD("vin17",	813,	R8A779H0_CLK_S0D4_VIO),
> +	DEF_MOD("vspd0",	830,	R8A779H0_CLK_S0D1_VIO),

The clock names and numbers are fine. The parents are not explicitly
listed in documentation, but the VIODBUSD1 clock description (table
8.1.4a) mentions FCPVD and VSPD as target modules. This is something
that should probably be double-checked. Quite interestingly, VIOBUSD2
also mentions the same target modules, hinting as a more complex clock
tree. A similar issue is perhaps present for "dis0" too, that's a DU
clock and the DU isn't listed as a target module of S0D3.

The way we model the "module stop" bits as clocks is clearly a limiting
factor as it can't represent real clock topologies. I don't however
don't expect it to cause any functional issue here, as the devices
related to the above clocks do not depend on the clock frequency.
There's no strict need to model the real hardware clock tree if it has
no impact on software, so

Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>

I think it could be worth it check with Renesas what parent to use here,
and we can update the clock definitions later if needed.

>  	DEF_MOD("wdt1:wdt0",	907,	R8A779H0_CLK_R),
>  	DEF_MOD("cmt0",		910,	R8A779H0_CLK_R),
>  	DEF_MOD("cmt1",		911,	R8A779H0_CLK_R),
> 

-- 
Regards,

Laurent Pinchart
