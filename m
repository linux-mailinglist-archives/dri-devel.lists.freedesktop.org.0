Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F04C9E4D49
	for <lists+dri-devel@lfdr.de>; Thu,  5 Dec 2024 06:41:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5B2D010ED9E;
	Thu,  5 Dec 2024 05:41:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="A8NZXBKd";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 83E7210ED9E
 for <dri-devel@lists.freedesktop.org>; Thu,  5 Dec 2024 05:41:16 +0000 (UTC)
Received: from [192.168.88.20] (91-157-155-49.elisa-laajakaista.fi
 [91.157.155.49])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 1280D2B3;
 Thu,  5 Dec 2024 06:40:45 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1733377246;
 bh=qDAoDRz8/a6ebOykhzr8jAX+oxO/ZNOdAADQGp3ckKc=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=A8NZXBKdtfYUMtt8hEik8q6uDozVKMhikEHWh6fnrIjI3NaxTEz/8UtY0K2Xx4a2Q
 sfggpsElgvnLOSIMtbwoyGEVhxCLKclgDNT/i5QOhXCsNElxpUThJpEXpie/Xv8KBb
 9oABovlXP0x0kVXeFLxaxjS59/g3dBPMcZA3iyXg=
Message-ID: <1c557030-a267-4311-a942-f6245a5cc81a@ideasonboard.com>
Date: Thu, 5 Dec 2024 07:41:09 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 6/9] drm/rcar-du: Add support for r8a779h0
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Magnus Damm <magnus.damm@gmail.com>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, LUU HOAI <hoai.luu.ub@renesas.com>,
 Jagan Teki <jagan@amarulasolutions.com>, Sam Ravnborg <sam@ravnborg.org>,
 Biju Das <biju.das.jz@bp.renesas.com>, dri-devel@lists.freedesktop.org,
 linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
 Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
References: <20241203-rcar-gh-dsi-v1-0-738ae1a95d2a@ideasonboard.com>
 <20241203-rcar-gh-dsi-v1-6-738ae1a95d2a@ideasonboard.com>
 <20241203085654.GJ10736@pendragon.ideasonboard.com>
 <e155c9b1-a43f-4be3-9825-2639ac3bb61d@ideasonboard.com>
 <20241203104806.GN10736@pendragon.ideasonboard.com>
Content-Language: en-US
From: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Autocrypt: addr=tomi.valkeinen@ideasonboard.com; keydata=
 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
In-Reply-To: <20241203104806.GN10736@pendragon.ideasonboard.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
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

Hi Laurent,

On 03/12/2024 12:48, Laurent Pinchart wrote:
> On Tue, Dec 03, 2024 at 11:22:15AM +0200, Tomi Valkeinen wrote:
>> On 03/12/2024 10:56, Laurent Pinchart wrote:
>>> On Tue, Dec 03, 2024 at 10:01:40AM +0200, Tomi Valkeinen wrote:
>>>> From: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
>>>>
>>>> Add support for r8a779h0. It is very similar to r8a779g0, but has only
>>>> one output.
>>>>
>>>> Signed-off-by: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
>>>> ---
>>>>    drivers/gpu/drm/renesas/rcar-du/rcar_du_drv.c   | 19 +++++++++++++++++++
>>>>    drivers/gpu/drm/renesas/rcar-du/rcar_du_drv.h   |  1 +
>>>>    drivers/gpu/drm/renesas/rcar-du/rcar_du_group.c | 16 ++++++++++------
>>>>    3 files changed, 30 insertions(+), 6 deletions(-)
>>>>
>>>> diff --git a/drivers/gpu/drm/renesas/rcar-du/rcar_du_drv.c b/drivers/gpu/drm/renesas/rcar-du/rcar_du_drv.c
>>>> index fb719d9aff10..afbc74e18cce 100644
>>>> --- a/drivers/gpu/drm/renesas/rcar-du/rcar_du_drv.c
>>>> +++ b/drivers/gpu/drm/renesas/rcar-du/rcar_du_drv.c
>>>> @@ -545,6 +545,24 @@ static const struct rcar_du_device_info rcar_du_r8a779g0_info = {
>>>>    	.dsi_clk_mask =  BIT(1) | BIT(0),
>>>>    };
>>>>    
>>>> +static const struct rcar_du_device_info rcar_du_r8a779h0_info = {
>>>> +	.gen = 4,
>>>> +	.features = RCAR_DU_FEATURE_CRTC_IRQ
>>>> +		  | RCAR_DU_FEATURE_VSP1_SOURCE
>>>> +		  | RCAR_DU_FEATURE_NO_BLENDING
>>>> +		  | RCAR_DU_FEATURE_NO_DPTSR,
>>>> +	.channels_mask = BIT(0),
>>>> +	.routes = {
>>>> +		/* R8A779H0 has one MIPI DSI output. */
>>>> +		[RCAR_DU_OUTPUT_DSI0] = {
>>>> +			.possible_crtcs = BIT(0),
>>>> +			.port = 0,
>>>> +		},
>>>> +	},
>>>> +	.num_rpf = 5,
>>>> +	.dsi_clk_mask = BIT(0),
>>>> +};
>>>> +
>>>>    static const struct of_device_id rcar_du_of_table[] = {
>>>>    	{ .compatible = "renesas,du-r8a7742", .data = &rcar_du_r8a7790_info },
>>>>    	{ .compatible = "renesas,du-r8a7743", .data = &rzg1_du_r8a7743_info },
>>>> @@ -571,6 +589,7 @@ static const struct of_device_id rcar_du_of_table[] = {
>>>>    	{ .compatible = "renesas,du-r8a77995", .data = &rcar_du_r8a7799x_info },
>>>>    	{ .compatible = "renesas,du-r8a779a0", .data = &rcar_du_r8a779a0_info },
>>>>    	{ .compatible = "renesas,du-r8a779g0", .data = &rcar_du_r8a779g0_info },
>>>> +	{ .compatible = "renesas,du-r8a779h0", .data = &rcar_du_r8a779h0_info },
>>>>    	{ }
>>>>    };
>>>>    
>>>> diff --git a/drivers/gpu/drm/renesas/rcar-du/rcar_du_drv.h b/drivers/gpu/drm/renesas/rcar-du/rcar_du_drv.h
>>>> index 5cfa2bb7ad93..d7004f76f735 100644
>>>> --- a/drivers/gpu/drm/renesas/rcar-du/rcar_du_drv.h
>>>> +++ b/drivers/gpu/drm/renesas/rcar-du/rcar_du_drv.h
>>>> @@ -32,6 +32,7 @@ struct rcar_du_device;
>>>>    #define RCAR_DU_FEATURE_INTERLACED	BIT(3)	/* HW supports interlaced */
>>>>    #define RCAR_DU_FEATURE_TVM_SYNC	BIT(4)	/* Has TV switch/sync modes */
>>>>    #define RCAR_DU_FEATURE_NO_BLENDING	BIT(5)	/* PnMR.SPIM does not have ALP nor EOR bits */
>>>> +#define RCAR_DU_FEATURE_NO_DPTSR	BIT(6)  /* V4M does not have DPTSR */
>>>
>>> Do we need a quirk ? At first glance it seems the DPTSR register is only
>>> used for DU instances that have two channels, so a check on the number
>>> of channels should be enough ?
>>
>> What do you mean with "DPTSR register is only used for DU instances that
>> have two channels"? The upstream code sets it for all SoCs, doesn't it,
>> without any checks?
> 
> DPTSR is one of those registers that controls features shared between
> channels, in this specific case plane assignment to DU channels. The
> default register value (i.e. all 0's) splits resources between the
> channels. For DU groups with a single channel, there's no need for
> resource assignment. Logically speaking, the all 0's register value as
> documented in instances that have two channels would assign all the
> resources that exist in the single-channel group to the single channel.
> When computing the DPTSR value, the driver will (or at least should)
> therefore always come up with 0x00000000. Writing that to the register
> should be a no-op.
> 
> It's not clear if the register is present or not when the group has a
> single channel. Some datasheets document the register is not being
> applicable. Writing to it has never caused issues, so we may be dealing
> with the hardware just ignoring writes to a non-implemented register, or
> the register may be there, with only 0x00000000 being a meaningful
> value. This being said, some people are concerned about writes to
> registers that are not documented as present, as they could possibly
> cause issues. Safety certification of the driver could be impacted.
> We've updated the DU driver over the past few years to avoid those
> writes for this reason.
> 
> TL;DR: yes, the DU driver writes to DPTSR for DU groups with a single
> channel, but that seem it could be wrong, and we could fix it for all
> single-channel groups in one go without introducing this feature bit. I
> can test a patch on a M3 board that has a single channel in the second
> group.

Do you have docs for r8a77970? Is the register there?

Do you want me to change the series to use the number of channels here, 
or shall we go with the current version and change it later if we're 
confident that the change works?

  Tomi

>> Most of the SoCs seem to have two channels, but r8a77970 has one.
>> However, I don't have docs for that one. It could be that it does not
>> have DPTSR register, and indeed we could use the num_crtcs > 1 check there.
>>
>>>>    #define RCAR_DU_QUIRK_ALIGN_128B	BIT(0)	/* Align pitches to 128 bytes */
>>>>    
>>>> diff --git a/drivers/gpu/drm/renesas/rcar-du/rcar_du_group.c b/drivers/gpu/drm/renesas/rcar-du/rcar_du_group.c
>>>> index 2ccd2581f544..132d930670eb 100644
>>>> --- a/drivers/gpu/drm/renesas/rcar-du/rcar_du_group.c
>>>> +++ b/drivers/gpu/drm/renesas/rcar-du/rcar_du_group.c
>>>> @@ -107,10 +107,12 @@ static void rcar_du_group_setup_didsr(struct rcar_du_group *rgrp)
>>>>    		 */
>>>>    		rcrtc = rcdu->crtcs;
>>>>    		num_crtcs = rcdu->num_crtcs;
>>>> -	} else if (rcdu->info->gen >= 3 && rgrp->num_crtcs > 1) {
>>>> +	} else if ((rcdu->info->gen == 3 && rgrp->num_crtcs > 1) ||
>>>> +		   rcdu->info->gen == 4) {
>>>>    		/*
>>>>    		 * On Gen3 dot clocks are setup through per-group registers,
>>>>    		 * only available when the group has two channels.
>>>> +		 * On Gen4 the registers are there for single channel too.
>>>>    		 */
>>>>    		rcrtc = &rcdu->crtcs[rgrp->index * 2];
>>>>    		num_crtcs = rgrp->num_crtcs;
>>>> @@ -185,11 +187,13 @@ static void rcar_du_group_setup(struct rcar_du_group *rgrp)
>>>>    		dorcr |= DORCR_PG1T | DORCR_DK1S | DORCR_PG1D_DS1;
>>>>    	rcar_du_group_write(rgrp, DORCR, dorcr);
>>>>    
>>>> -	/* Apply planes to CRTCs association. */
>>>> -	mutex_lock(&rgrp->lock);
>>>> -	rcar_du_group_write(rgrp, DPTSR, (rgrp->dptsr_planes << 16) |
>>>> -			    rgrp->dptsr_planes);
>>>> -	mutex_unlock(&rgrp->lock);
>>>> +	if (!rcar_du_has(rcdu, RCAR_DU_FEATURE_NO_DPTSR)) {
>>>> +		/* Apply planes to CRTCs association. */
>>>> +		mutex_lock(&rgrp->lock);
>>>> +		rcar_du_group_write(rgrp, DPTSR, (rgrp->dptsr_planes << 16) |
>>>> +				    rgrp->dptsr_planes);
>>>> +		mutex_unlock(&rgrp->lock);
>>>> +	}
>>>>    }
>>>>    
>>>>    /*
> 

