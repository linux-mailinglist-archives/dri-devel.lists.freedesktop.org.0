Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 108289E5033
	for <lists+dri-devel@lfdr.de>; Thu,  5 Dec 2024 09:48:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6D83F10EDF4;
	Thu,  5 Dec 2024 08:48:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="gHIhX/4M";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 16DC310EDF4
 for <dri-devel@lists.freedesktop.org>; Thu,  5 Dec 2024 08:48:20 +0000 (UTC)
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi
 [81.175.209.231])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 6F1CD7E2;
 Thu,  5 Dec 2024 09:47:49 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1733388469;
 bh=kh1ZXVUS/kPUQYJb5ReNSJqKUxpeGMQq/7MUjMgViPo=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=gHIhX/4MnXbzQFe3SGYkSsgS+idt12lPeOfYUPzoTrwq09tuBwObLsiFzEIDU7/xz
 X3C6+L9P46MQbjWG+Dq/RHWmoL+u/bF/piePwSfQ3kc9MgUSUHmxAeFvLDZlKtE56H
 G2RhXTcpNhzPCIfCJ644fY8KVYNHMY0arcPwvM64=
Date: Thu, 5 Dec 2024 10:48:06 +0200
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
Subject: Re: [PATCH 6/9] drm/rcar-du: Add support for r8a779h0
Message-ID: <20241205084806.GB12436@pendragon.ideasonboard.com>
References: <20241203-rcar-gh-dsi-v1-0-738ae1a95d2a@ideasonboard.com>
 <20241203-rcar-gh-dsi-v1-6-738ae1a95d2a@ideasonboard.com>
 <20241203085654.GJ10736@pendragon.ideasonboard.com>
 <e155c9b1-a43f-4be3-9825-2639ac3bb61d@ideasonboard.com>
 <20241203104806.GN10736@pendragon.ideasonboard.com>
 <1c557030-a267-4311-a942-f6245a5cc81a@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <1c557030-a267-4311-a942-f6245a5cc81a@ideasonboard.com>
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

On Thu, Dec 05, 2024 at 07:41:09AM +0200, Tomi Valkeinen wrote:
> On 03/12/2024 12:48, Laurent Pinchart wrote:
> > On Tue, Dec 03, 2024 at 11:22:15AM +0200, Tomi Valkeinen wrote:
> >> On 03/12/2024 10:56, Laurent Pinchart wrote:
> >>> On Tue, Dec 03, 2024 at 10:01:40AM +0200, Tomi Valkeinen wrote:
> >>>> From: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
> >>>>
> >>>> Add support for r8a779h0. It is very similar to r8a779g0, but has only
> >>>> one output.
> >>>>
> >>>> Signed-off-by: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
> >>>> ---
> >>>>    drivers/gpu/drm/renesas/rcar-du/rcar_du_drv.c   | 19 +++++++++++++++++++
> >>>>    drivers/gpu/drm/renesas/rcar-du/rcar_du_drv.h   |  1 +
> >>>>    drivers/gpu/drm/renesas/rcar-du/rcar_du_group.c | 16 ++++++++++------
> >>>>    3 files changed, 30 insertions(+), 6 deletions(-)
> >>>>
> >>>> diff --git a/drivers/gpu/drm/renesas/rcar-du/rcar_du_drv.c b/drivers/gpu/drm/renesas/rcar-du/rcar_du_drv.c
> >>>> index fb719d9aff10..afbc74e18cce 100644
> >>>> --- a/drivers/gpu/drm/renesas/rcar-du/rcar_du_drv.c
> >>>> +++ b/drivers/gpu/drm/renesas/rcar-du/rcar_du_drv.c
> >>>> @@ -545,6 +545,24 @@ static const struct rcar_du_device_info rcar_du_r8a779g0_info = {
> >>>>    	.dsi_clk_mask =  BIT(1) | BIT(0),
> >>>>    };
> >>>>    
> >>>> +static const struct rcar_du_device_info rcar_du_r8a779h0_info = {
> >>>> +	.gen = 4,
> >>>> +	.features = RCAR_DU_FEATURE_CRTC_IRQ
> >>>> +		  | RCAR_DU_FEATURE_VSP1_SOURCE
> >>>> +		  | RCAR_DU_FEATURE_NO_BLENDING
> >>>> +		  | RCAR_DU_FEATURE_NO_DPTSR,
> >>>> +	.channels_mask = BIT(0),
> >>>> +	.routes = {
> >>>> +		/* R8A779H0 has one MIPI DSI output. */
> >>>> +		[RCAR_DU_OUTPUT_DSI0] = {
> >>>> +			.possible_crtcs = BIT(0),
> >>>> +			.port = 0,
> >>>> +		},
> >>>> +	},
> >>>> +	.num_rpf = 5,
> >>>> +	.dsi_clk_mask = BIT(0),
> >>>> +};
> >>>> +
> >>>>    static const struct of_device_id rcar_du_of_table[] = {
> >>>>    	{ .compatible = "renesas,du-r8a7742", .data = &rcar_du_r8a7790_info },
> >>>>    	{ .compatible = "renesas,du-r8a7743", .data = &rzg1_du_r8a7743_info },
> >>>> @@ -571,6 +589,7 @@ static const struct of_device_id rcar_du_of_table[] = {
> >>>>    	{ .compatible = "renesas,du-r8a77995", .data = &rcar_du_r8a7799x_info },
> >>>>    	{ .compatible = "renesas,du-r8a779a0", .data = &rcar_du_r8a779a0_info },
> >>>>    	{ .compatible = "renesas,du-r8a779g0", .data = &rcar_du_r8a779g0_info },
> >>>> +	{ .compatible = "renesas,du-r8a779h0", .data = &rcar_du_r8a779h0_info },
> >>>>    	{ }
> >>>>    };
> >>>>    
> >>>> diff --git a/drivers/gpu/drm/renesas/rcar-du/rcar_du_drv.h b/drivers/gpu/drm/renesas/rcar-du/rcar_du_drv.h
> >>>> index 5cfa2bb7ad93..d7004f76f735 100644
> >>>> --- a/drivers/gpu/drm/renesas/rcar-du/rcar_du_drv.h
> >>>> +++ b/drivers/gpu/drm/renesas/rcar-du/rcar_du_drv.h
> >>>> @@ -32,6 +32,7 @@ struct rcar_du_device;
> >>>>    #define RCAR_DU_FEATURE_INTERLACED	BIT(3)	/* HW supports interlaced */
> >>>>    #define RCAR_DU_FEATURE_TVM_SYNC	BIT(4)	/* Has TV switch/sync modes */
> >>>>    #define RCAR_DU_FEATURE_NO_BLENDING	BIT(5)	/* PnMR.SPIM does not have ALP nor EOR bits */
> >>>> +#define RCAR_DU_FEATURE_NO_DPTSR	BIT(6)  /* V4M does not have DPTSR */
> >>>
> >>> Do we need a quirk ? At first glance it seems the DPTSR register is only
> >>> used for DU instances that have two channels, so a check on the number
> >>> of channels should be enough ?
> >>
> >> What do you mean with "DPTSR register is only used for DU instances that
> >> have two channels"? The upstream code sets it for all SoCs, doesn't it,
> >> without any checks?
> > 
> > DPTSR is one of those registers that controls features shared between
> > channels, in this specific case plane assignment to DU channels. The
> > default register value (i.e. all 0's) splits resources between the
> > channels. For DU groups with a single channel, there's no need for
> > resource assignment. Logically speaking, the all 0's register value as
> > documented in instances that have two channels would assign all the
> > resources that exist in the single-channel group to the single channel.
> > When computing the DPTSR value, the driver will (or at least should)
> > therefore always come up with 0x00000000. Writing that to the register
> > should be a no-op.
> > 
> > It's not clear if the register is present or not when the group has a
> > single channel. Some datasheets document the register is not being
> > applicable. Writing to it has never caused issues, so we may be dealing
> > with the hardware just ignoring writes to a non-implemented register, or
> > the register may be there, with only 0x00000000 being a meaningful
> > value. This being said, some people are concerned about writes to
> > registers that are not documented as present, as they could possibly
> > cause issues. Safety certification of the driver could be impacted.
> > We've updated the DU driver over the past few years to avoid those
> > writes for this reason.
> > 
> > TL;DR: yes, the DU driver writes to DPTSR for DU groups with a single
> > channel, but that seem it could be wrong, and we could fix it for all
> > single-channel groups in one go without introducing this feature bit. I
> > can test a patch on a M3 board that has a single channel in the second
> > group.
> 
> Do you have docs for r8a77970? Is the register there?

According to the Gen3 documentation the register isn't preent in V3M.

> Do you want me to change the series to use the number of channels here, 
> or shall we go with the current version and change it later if we're 
> confident that the change works?

The change is easy so I'd like to do it now. It should be split to a
separate patch. I'll test it on Gen3 hardware right away.

> >> Most of the SoCs seem to have two channels, but r8a77970 has one.
> >> However, I don't have docs for that one. It could be that it does not
> >> have DPTSR register, and indeed we could use the num_crtcs > 1 check there.
> >>
> >>>>    #define RCAR_DU_QUIRK_ALIGN_128B	BIT(0)	/* Align pitches to 128 bytes */
> >>>>    
> >>>> diff --git a/drivers/gpu/drm/renesas/rcar-du/rcar_du_group.c b/drivers/gpu/drm/renesas/rcar-du/rcar_du_group.c
> >>>> index 2ccd2581f544..132d930670eb 100644
> >>>> --- a/drivers/gpu/drm/renesas/rcar-du/rcar_du_group.c
> >>>> +++ b/drivers/gpu/drm/renesas/rcar-du/rcar_du_group.c
> >>>> @@ -107,10 +107,12 @@ static void rcar_du_group_setup_didsr(struct rcar_du_group *rgrp)
> >>>>    		 */
> >>>>    		rcrtc = rcdu->crtcs;
> >>>>    		num_crtcs = rcdu->num_crtcs;
> >>>> -	} else if (rcdu->info->gen >= 3 && rgrp->num_crtcs > 1) {
> >>>> +	} else if ((rcdu->info->gen == 3 && rgrp->num_crtcs > 1) ||
> >>>> +		   rcdu->info->gen == 4) {
> >>>>    		/*
> >>>>    		 * On Gen3 dot clocks are setup through per-group registers,
> >>>>    		 * only available when the group has two channels.
> >>>> +		 * On Gen4 the registers are there for single channel too.
> >>>>    		 */
> >>>>    		rcrtc = &rcdu->crtcs[rgrp->index * 2];
> >>>>    		num_crtcs = rgrp->num_crtcs;
> >>>> @@ -185,11 +187,13 @@ static void rcar_du_group_setup(struct rcar_du_group *rgrp)
> >>>>    		dorcr |= DORCR_PG1T | DORCR_DK1S | DORCR_PG1D_DS1;
> >>>>    	rcar_du_group_write(rgrp, DORCR, dorcr);
> >>>>    
> >>>> -	/* Apply planes to CRTCs association. */
> >>>> -	mutex_lock(&rgrp->lock);
> >>>> -	rcar_du_group_write(rgrp, DPTSR, (rgrp->dptsr_planes << 16) |
> >>>> -			    rgrp->dptsr_planes);
> >>>> -	mutex_unlock(&rgrp->lock);
> >>>> +	if (!rcar_du_has(rcdu, RCAR_DU_FEATURE_NO_DPTSR)) {
> >>>> +		/* Apply planes to CRTCs association. */
> >>>> +		mutex_lock(&rgrp->lock);
> >>>> +		rcar_du_group_write(rgrp, DPTSR, (rgrp->dptsr_planes << 16) |
> >>>> +				    rgrp->dptsr_planes);
> >>>> +		mutex_unlock(&rgrp->lock);
> >>>> +	}
> >>>>    }
> >>>>    
> >>>>    /*

-- 
Regards,

Laurent Pinchart
