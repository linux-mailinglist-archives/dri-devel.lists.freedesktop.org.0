Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A82F4B7FF0
	for <lists+dri-devel@lfdr.de>; Wed, 16 Feb 2022 06:14:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 02EE010E15C;
	Wed, 16 Feb 2022 05:14:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x233.google.com (mail-oi1-x233.google.com
 [IPv6:2607:f8b0:4864:20::233])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 628B010E15C
 for <dri-devel@lists.freedesktop.org>; Wed, 16 Feb 2022 05:14:41 +0000 (UTC)
Received: by mail-oi1-x233.google.com with SMTP id i21so1349284oie.3
 for <dri-devel@lists.freedesktop.org>; Tue, 15 Feb 2022 21:14:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=JzieIz/quQx0v66XTXVexGl+rrUJrCz9u9Gq3FB0j7Y=;
 b=EEt9RMMe9lHYzkNoJKfCVG9BErWMdf3fgCvVRBhvvF+aTQBF6OyapHCm1JE8gc0OO1
 VA4iqMf7hjzyhOw1IthsNWKv3IZoaySlHumZFUadfwpB2oTnFdECbkchYU7cTQEE1KY1
 Yo6PZwnO+6bclywn41agz/KKPiLSssox98twx+2sDy0dXy1gsnQ8yBSlLCa7Vbyun3xq
 FsIKi7GiT/HjMHRrd3SVwqaaSjvKAZB9ufM7vdYTArnPb02I7ZUmE7BN6+IOp8SNaaG9
 hUj1/sjMuwEqA2ZgUFn5r/8bcrN/3rL61UC1lEeuX3C7vkFB0ie5hVGD3e4HA0mIHLQ7
 YVjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=JzieIz/quQx0v66XTXVexGl+rrUJrCz9u9Gq3FB0j7Y=;
 b=YmAXIyN97IBifsXCpKYdxstM/B+aGh+gRWOSWg7PUVUMgFZ2oHpUJEm9i4eEpzFATc
 XSBZnuDFvcNtriCENUy8qC6dgrjRNzCkmLcwJdclOMVjDjU1faBKgudmTv1mL52dP5mR
 0CF0+y1kJgKQaBJpl38uvt38PAhZ2GGVDzGGF9QgVyitUP5qXQI2A3NsQDYvos+6KCHW
 qqU2My1sLhCAm6O0a09glLJtAe9nN3F4Oq6Hu0WD8gi00nhk5qTqHLy+qquXDiUG4RAg
 RdxzsYekdAHpl8SlZYsyozUcHt9hUJ6gHTXRvU1UD81m7pRxhZ1/yKiBMBKFXTxmDcYs
 3wRg==
X-Gm-Message-State: AOAM531nz+Eal9+fulshHhltZkezjhALehPMsP6SJjbVbddHdG+IvprV
 +F30Q50HFk6qgvsqkNu6h3risQ==
X-Google-Smtp-Source: ABdhPJxwFaHWVjIXyEnBpywfQOij7zCjdd5TWwvQ7lYT0d+4Kw2OV5BHI+kpgUYLUL/LNnuZ31IzKQ==
X-Received: by 2002:a05:6808:3029:b0:2d3:a03d:165d with SMTP id
 ay41-20020a056808302900b002d3a03d165dmr2941703oib.325.1644988480578; 
 Tue, 15 Feb 2022 21:14:40 -0800 (PST)
Received: from yoga ([2600:1700:a0:3dc8:5c39:baff:fe03:898d])
 by smtp.gmail.com with ESMTPSA id q16sm7324000oiv.16.2022.02.15.21.14.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 15 Feb 2022 21:14:40 -0800 (PST)
Date: Tue, 15 Feb 2022 23:14:38 -0600
From: Bjorn Andersson <bjorn.andersson@linaro.org>
To: Abhinav Kumar <quic_abhinavk@quicinc.com>
Subject: Re: [PATCH v2 2/2] drm/msm/dpu: Add SC8180x to hw catalog
Message-ID: <YgyIPnc/sZLE0ABn@yoga>
References: <20220215043353.1256754-1-bjorn.andersson@linaro.org>
 <20220215043353.1256754-2-bjorn.andersson@linaro.org>
 <be397e2e-05ab-5c18-8e2d-16c443f0a6d1@quicinc.com>
 <Ygvisfhi0SY6XdAz@builder.lan>
 <6a3ef247-b26b-d505-cd85-92fb277163dd@quicinc.com>
 <YgxeCHi5AsYPTmeZ@builder.lan>
 <51675806-641d-c57e-ada7-a044e37ad808@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <51675806-641d-c57e-ada7-a044e37ad808@quicinc.com>
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
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue 15 Feb 20:38 CST 2022, Abhinav Kumar wrote:

> 
> 
> On 2/15/2022 6:14 PM, Bjorn Andersson wrote:
> > On Tue 15 Feb 11:42 CST 2022, Abhinav Kumar wrote:
> > 
> > > 
> > > 
> > > On 2/15/2022 9:28 AM, Bjorn Andersson wrote:
> > > > On Tue 15 Feb 11:14 CST 2022, Abhinav Kumar wrote:
> > > > 
> > > > > 
> > > > > 
> > > > > On 2/14/2022 8:33 PM, Bjorn Andersson wrote:
> > > > > > From: Rob Clark <robdclark@chromium.org>
> > > > > > 
> > > > > > Add SC8180x to the hardware catalog, for initial support for the
> > > > > > platform. Due to limitations in the DP driver only one of the four DP
> > > > > > interfaces is left enabled.
> > > > > > 
> > > > > > The SC8180x platform supports the newly added DPU_INTF_WIDEBUS flag and
> > > > > > the Windows-on-Snapdragon bootloader leaves the widebus bit set, so this
> > > > > > is flagged appropriately to ensure widebus is disabled - for now.
> > > > > > 
> > > > > > Signed-off-by: Rob Clark <robdclark@chromium.org>
> > > > > > [bjorn: Reworked intf and irq definitions]
> > > > > > Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
> > > > > > ---
> > > > > > 
> > > > > > Changes since v1:
> > > > > > - Dropped widebus flag
> > > > > > 
> > > > > >     .../gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c    | 129 ++++++++++++++++++
> > > > > >     .../gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h    |   1 +
> > > > > >     drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c       |   1 +
> > > > > >     drivers/gpu/drm/msm/msm_drv.c                 |   1 +
> > > > > >     4 files changed, 132 insertions(+)
> > > > > > 
> > > > > > diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
> > > > > > index aa75991903a6..7ac0fe32df49 100644
> > > > > > --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
> > > > > > +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
> > > > > > @@ -90,6 +90,17 @@
> > > > > >     			 BIT(MDP_INTF3_INTR) | \
> > > > > >     			 BIT(MDP_INTF4_INTR))
> > > > > > +#define IRQ_SC8180X_MASK (BIT(MDP_SSPP_TOP0_INTR) | \
> > > > > > +			  BIT(MDP_SSPP_TOP0_INTR2) | \
> > > > > > +			  BIT(MDP_SSPP_TOP0_HIST_INTR) | \
> > > > > > +			  BIT(MDP_INTF0_INTR) | \
> > > > > > +			  BIT(MDP_INTF1_INTR) | \
> > > > > > +			  BIT(MDP_INTF2_INTR) | \
> > > > > > +			  BIT(MDP_INTF3_INTR) | \
> > > > > > +			  BIT(MDP_INTF4_INTR) | \
> > > > > > +			  BIT(MDP_INTF5_INTR) | \
> > > > > > +			  BIT(MDP_AD4_0_INTR) | \
> > > > > > +			  BIT(MDP_AD4_1_INTR))
> > > > > >     #define DEFAULT_PIXEL_RAM_SIZE		(50 * 1024)
> > > > > >     #define DEFAULT_DPU_LINE_WIDTH		2048
> > > > > > @@ -225,6 +236,22 @@ static const struct dpu_caps sm8150_dpu_caps = {
> > > > > >     	.max_vdeci_exp = MAX_VERT_DECIMATION,
> > > > > >     };
> > > > > > +static const struct dpu_caps sc8180x_dpu_caps = {
> > > > > > +	.max_mixer_width = DEFAULT_DPU_OUTPUT_LINE_WIDTH,
> > > > > > +	.max_mixer_blendstages = 0xb,
> > > > > > +	.qseed_type = DPU_SSPP_SCALER_QSEED3,
> > > > > > +	.smart_dma_rev = DPU_SSPP_SMART_DMA_V2, /* TODO: v2.5 */
> > > > > > +	.ubwc_version = DPU_HW_UBWC_VER_30,
> > > > > > +	.has_src_split = true,
> > > > > > +	.has_dim_layer = true,
> > > > > > +	.has_idle_pc = true,
> > > > > > +	.has_3d_merge = true,
> > > > > > +	.max_linewidth = 4096,
> > > > > > +	.pixel_ram_size = DEFAULT_PIXEL_RAM_SIZE,
> > > > > > +	.max_hdeci_exp = MAX_HORZ_DECIMATION,
> > > > > > +	.max_vdeci_exp = MAX_VERT_DECIMATION,
> > > > > > +};
> > > > > > +
> > > > > >     static const struct dpu_caps sm8250_dpu_caps = {
> > > > > >     	.max_mixer_width = DEFAULT_DPU_OUTPUT_LINE_WIDTH,
> > > > > >     	.max_mixer_blendstages = 0xb,
> > > > > > @@ -293,6 +320,31 @@ static const struct dpu_mdp_cfg sc7180_mdp[] = {
> > > > > >     	},
> > > > > >     };
> > > > > > +static const struct dpu_mdp_cfg sc8180x_mdp[] = {
> > > > > > +	{
> > > > > > +	.name = "top_0", .id = MDP_TOP,
> > > > > > +	.base = 0x0, .len = 0x45C,
> > > > > > +	.features = 0,
> > > > > > +	.highest_bank_bit = 0x3,
> > > > > > +	.clk_ctrls[DPU_CLK_CTRL_VIG0] = {
> > > > > > +			.reg_off = 0x2AC, .bit_off = 0},
> > > > > > +	.clk_ctrls[DPU_CLK_CTRL_VIG1] = {
> > > > > > +			.reg_off = 0x2B4, .bit_off = 0},
> > > > > > +	.clk_ctrls[DPU_CLK_CTRL_VIG2] = {
> > > > > > +			.reg_off = 0x2BC, .bit_off = 0},
> > > > > > +	.clk_ctrls[DPU_CLK_CTRL_VIG3] = {
> > > > > > +			.reg_off = 0x2C4, .bit_off = 0},
> > > > > > +	.clk_ctrls[DPU_CLK_CTRL_DMA0] = {
> > > > > > +			.reg_off = 0x2AC, .bit_off = 8},
> > > > > > +	.clk_ctrls[DPU_CLK_CTRL_DMA1] = {
> > > > > > +			.reg_off = 0x2B4, .bit_off = 8},
> > > > > > +	.clk_ctrls[DPU_CLK_CTRL_CURSOR0] = {
> > > > > > +			.reg_off = 0x2BC, .bit_off = 8},
> > > > > > +	.clk_ctrls[DPU_CLK_CTRL_CURSOR1] = {
> > > > > > +			.reg_off = 0x2C4, .bit_off = 8},
> > > > > > +	},
> > > > > > +};
> > > > > > +
> > > > > >     static const struct dpu_mdp_cfg sm8250_mdp[] = {
> > > > > >     	{
> > > > > >     	.name = "top_0", .id = MDP_TOP,
> > > > > > @@ -861,6 +913,16 @@ static const struct dpu_intf_cfg sc7280_intf[] = {
> > > > > >     	INTF_BLK("intf_5", INTF_5, 0x39000, INTF_DP, MSM_DP_CONTROLLER_1, 24, INTF_SC7280_MASK, MDP_SSPP_TOP0_INTR, 22, 23),
> > > > > >     };
> > > > > > +static const struct dpu_intf_cfg sc8180x_intf[] = {
> > > > > > +	INTF_BLK("intf_0", INTF_0, 0x6A000, INTF_DP, MSM_DP_CONTROLLER_0, 24, INTF_SC7180_MASK, MDP_SSPP_TOP0_INTR, 24, 25),
> > > > > > +	INTF_BLK("intf_1", INTF_1, 0x6A800, INTF_DSI, 0, 24, INTF_SC7180_MASK, MDP_SSPP_TOP0_INTR, 26, 27),
> > > > > > +	INTF_BLK("intf_2", INTF_2, 0x6B000, INTF_DSI, 1, 24, INTF_SC7180_MASK, MDP_SSPP_TOP0_INTR, 28, 29),
> > > > > > +	/* INTF_3 is for MST, wired to INTF_DP 0 and 1, use dummy index until this is supported */
> > > > > > +	INTF_BLK("intf_3", INTF_3, 0x6B800, INTF_DP, 999, 24, INTF_SC7180_MASK, MDP_SSPP_TOP0_INTR, 30, 31),
> > > > > > +	INTF_BLK("intf_4", INTF_4, 0x6C000, INTF_DP, MSM_DP_CONTROLLER_1, 24, INTF_SC7180_MASK, MDP_SSPP_TOP0_INTR, 20, 21),
> > > > > > +	INTF_BLK("intf_5", INTF_5, 0x6C800, INTF_DP, MSM_DP_CONTROLLER_2, 24, INTF_SC7180_MASK, MDP_SSPP_TOP0_INTR, 22, 23),
> > > > > 
> > > > > This is a continued discussion from
> > > > > https://patchwork.freedesktop.org/patch/474179/.
> > > > > 
> > > > > Shouldnt INTF_5 be marked as INTF_eDP?
> > > > > 
> > > > 
> > > > Might be, I didn't even know we had an INTF_EDP define...
> > > > 
> > > > Is there any reason to distinguish DP and EDP in the DPU?  I see sc7280
> > > > doesn't distinguish the DP and EDP interfaces.
> > > > 
> > > > Regards,
> > > > Bjorn
> > > > 
> > > 
> > > Like I have mentioned in the other patch, I think we have enough confusion
> > > between eDP and DP with the common driver. Since DPU does have separate
> > > interfaces I think we should fix that.
> > > 
> > > Regarding sc7280 using INTF_DP, I synced up with Sankeerth. He referred to
> > > your change
> > > https://patchwork.freedesktop.org/patch/457776/?series=92992&rev=5 as it was
> > > posted earlier and ended up using the same INTF_DP macro. So its turning out
> > > to be a cyclical error.
> > > 
> > 
> > That made me take a second look at the HPG, and sure enough INTF_5 on
> > SC7280 is connected to a eDP/DP Combo PHY. We have the same setup in
> > SC8280XP.
> > 
> > In SC8180X, INTF_5 is documented as being connected to a eDP (only) PHY,
> > so perhaps it makes sense to do it there, but for the others its wrong.
> > 
> 
> Here you are specifying the controller in the catalog.

No, I'm specifying the type of the INTF. We then use the type of the
intf and the index to match that to a particular DP TX block.

> So independent of the PHY thats being used, shouldnt this remain
> INTF_eDP?
> 

I don't think it's going to help anyone to say that an interface
connected to a PHY that can be either DP or EDP, should be INTF_EDP.

People are going to make assumptions in the code such as INTF_EDP does
not have audio and then someone designs a board based on SC7280 with DP
output where they expect audio. Or assumptions about HPD, panel etc...

I'm not saying that we have all the details figured out on how that's
going to be controlled, but until there's a reason to distinguish
INTF_DP from INTF_EDP I think we should not make one up. And I don't see
that those differences should be hard coded in the DPU driver.


If it's confusing to people that DP might be driving an EDP output, then
perhaps we can just name it TMDS again? ;)

Regards,
Bjorn
