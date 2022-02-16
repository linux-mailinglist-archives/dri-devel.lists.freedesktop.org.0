Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 03D1D4B7BD0
	for <lists+dri-devel@lfdr.de>; Wed, 16 Feb 2022 01:20:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 011B510E5D4;
	Wed, 16 Feb 2022 00:20:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qv1-xf35.google.com (mail-qv1-xf35.google.com
 [IPv6:2607:f8b0:4864:20::f35])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 362E410E5D6
 for <dri-devel@lists.freedesktop.org>; Wed, 16 Feb 2022 00:20:29 +0000 (UTC)
Received: by mail-qv1-xf35.google.com with SMTP id n6so670928qvk.13
 for <dri-devel@lists.freedesktop.org>; Tue, 15 Feb 2022 16:20:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=vgizmnkDTVaoVUjChQBB2sbXeMeJ7HXb1soHoVprhes=;
 b=B7PCdT0T+UlBCxXYQ1bZdPhK1SRz6Mx1a3kzX6KIZfGFADbqS0YtaZZQFARPlNyam/
 3soLwY2+LkEq8LWDn0Kfa0/4oiwQNo375KcT8QI9ZDhYuMVx1cQqEJ59W1CtIB06jSrN
 1Q8SaDFLsP4aJdEX/pLs/kbVkvUE8LeevTfNqEHy+Go3+u47hJhtsIRhGUNd3ax2rfkS
 kom+qXWflz11XeTpdlLmh1U9PNjOV5fal9IKk1urhRfgDTUCF+Rx54heSrMEo8X5boaH
 pkXFMiJJqvCUKESF0gL+oC51Nnj0TaLWUOI6FqhTq2wX8gF2ImXqrX3HDnvvJ00MJCf3
 x10w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=vgizmnkDTVaoVUjChQBB2sbXeMeJ7HXb1soHoVprhes=;
 b=jFT9w0SIYFS3Aa7clcBEcg6xFUGK+bKS8cTqB0OIp1+yht4mk3MMYuc34mtfWBibu8
 5w4qRvsADQZLDEsx+k/4mowZBzXH+Z1MccEpXRsRJqeNk/iwNroW7TM8dWiAB/Et8Lcz
 zYQ9TmTvN8Zu4JEk0FsvH31J4ui++IXf6sqhsDLsdEjn/7iZy+XzkHC76wdiCX3QGQBy
 K6fwa7Xft8q6Vj8Xx/CpWU8J4ovTw2Vn/Gw9oYlEm2yFCyFPsF4UEIR0a07AHw6qNkFk
 YVetjnXrmbienqVg9kowyeQl4GORxiWjpDiIiDzPhfUXqUEUVeLuciOH21G9l8QQeq0L
 +aYg==
X-Gm-Message-State: AOAM533RVemS0eO2xSMbtgAgUB2kK8q3vdJkXkoCjdEXF/hZCg4IYSer
 MHPtm2e+PTtpt8/uLSBi9khCWnNY5UPNepyBS+9Ftg==
X-Google-Smtp-Source: ABdhPJwjxdtJAaRsrtLZQYvNJR99xftQoMUQ7seP3iQLf2bthjNRFv+1brms+LNdRg7pkIEOcfKhHgIAK2Hz07XqTDE=
X-Received: by 2002:a0c:d807:0:b0:42c:1ff7:7242 with SMTP id
 h7-20020a0cd807000000b0042c1ff77242mr320155qvj.119.1644970827937; Tue, 15 Feb
 2022 16:20:27 -0800 (PST)
MIME-Version: 1.0
References: <20220215043353.1256754-1-bjorn.andersson@linaro.org>
 <20220215043353.1256754-2-bjorn.andersson@linaro.org>
 <be397e2e-05ab-5c18-8e2d-16c443f0a6d1@quicinc.com>
 <Ygvisfhi0SY6XdAz@builder.lan>
 <6a3ef247-b26b-d505-cd85-92fb277163dd@quicinc.com>
 <CAA8EJprCaiPW=Kk0B69RNNwAk0xcqaxQA031sfR0ky+BfzcWKQ@mail.gmail.com>
 <ceb861e5-b1c8-d33e-c0b0-bea0b4cc0b66@quicinc.com>
In-Reply-To: <ceb861e5-b1c8-d33e-c0b0-bea0b4cc0b66@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Wed, 16 Feb 2022 03:20:16 +0300
Message-ID: <CAA8EJppj+OBPVUgvefO38zp1RHpJw5pL0-4DCkgn3iAcPH-ptA@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] drm/msm/dpu: Add SC8180x to hw catalog
To: Abhinav Kumar <quic_abhinavk@quicinc.com>
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
Cc: linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Bjorn Andersson <bjorn.andersson@linaro.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, 15 Feb 2022 at 23:21, Abhinav Kumar <quic_abhinavk@quicinc.com> wrote:
> On 2/15/2022 10:42 AM, Dmitry Baryshkov wrote:
> > On Tue, 15 Feb 2022 at 20:42, Abhinav Kumar <quic_abhinavk@quicinc.com> wrote:
> >> On 2/15/2022 9:28 AM, Bjorn Andersson wrote:
> >>> On Tue 15 Feb 11:14 CST 2022, Abhinav Kumar wrote:
> >>>
> >>>>
> >>>>
> >>>> On 2/14/2022 8:33 PM, Bjorn Andersson wrote:
> >>>>> From: Rob Clark <robdclark@chromium.org>
> >>>>>
> >>>>> Add SC8180x to the hardware catalog, for initial support for the
> >>>>> platform. Due to limitations in the DP driver only one of the four DP
> >>>>> interfaces is left enabled.
> >>>>>
> >>>>> The SC8180x platform supports the newly added DPU_INTF_WIDEBUS flag and
> >>>>> the Windows-on-Snapdragon bootloader leaves the widebus bit set, so this
> >>>>> is flagged appropriately to ensure widebus is disabled - for now.
> >>>>>
> >>>>> Signed-off-by: Rob Clark <robdclark@chromium.org>
> >>>>> [bjorn: Reworked intf and irq definitions]
> >>>>> Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
> >>>>> ---
> >>>>>
> >>>>> Changes since v1:
> >>>>> - Dropped widebus flag
> >>>>>
> >>>>>     .../gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c    | 129 ++++++++++++++++++
> >>>>>     .../gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h    |   1 +
> >>>>>     drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c       |   1 +
> >>>>>     drivers/gpu/drm/msm/msm_drv.c                 |   1 +
> >>>>>     4 files changed, 132 insertions(+)
> >>>>>
> >>>>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
> >>>>> index aa75991903a6..7ac0fe32df49 100644
> >>>>> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
> >>>>> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
> >>>>> @@ -90,6 +90,17 @@
> >>>>>                       BIT(MDP_INTF3_INTR) | \
> >>>>>                       BIT(MDP_INTF4_INTR))
> >>>>> +#define IRQ_SC8180X_MASK (BIT(MDP_SSPP_TOP0_INTR) | \
> >>>>> +                     BIT(MDP_SSPP_TOP0_INTR2) | \
> >>>>> +                     BIT(MDP_SSPP_TOP0_HIST_INTR) | \
> >>>>> +                     BIT(MDP_INTF0_INTR) | \
> >>>>> +                     BIT(MDP_INTF1_INTR) | \
> >>>>> +                     BIT(MDP_INTF2_INTR) | \
> >>>>> +                     BIT(MDP_INTF3_INTR) | \
> >>>>> +                     BIT(MDP_INTF4_INTR) | \
> >>>>> +                     BIT(MDP_INTF5_INTR) | \
> >>>>> +                     BIT(MDP_AD4_0_INTR) | \
> >>>>> +                     BIT(MDP_AD4_1_INTR))
> >>>>>     #define DEFAULT_PIXEL_RAM_SIZE           (50 * 1024)
> >>>>>     #define DEFAULT_DPU_LINE_WIDTH           2048
> >>>>> @@ -225,6 +236,22 @@ static const struct dpu_caps sm8150_dpu_caps = {
> >>>>>      .max_vdeci_exp = MAX_VERT_DECIMATION,
> >>>>>     };
> >>>>> +static const struct dpu_caps sc8180x_dpu_caps = {
> >>>>> +   .max_mixer_width = DEFAULT_DPU_OUTPUT_LINE_WIDTH,
> >>>>> +   .max_mixer_blendstages = 0xb,
> >>>>> +   .qseed_type = DPU_SSPP_SCALER_QSEED3,
> >>>>> +   .smart_dma_rev = DPU_SSPP_SMART_DMA_V2, /* TODO: v2.5 */
> >>>>> +   .ubwc_version = DPU_HW_UBWC_VER_30,
> >>>>> +   .has_src_split = true,
> >>>>> +   .has_dim_layer = true,
> >>>>> +   .has_idle_pc = true,
> >>>>> +   .has_3d_merge = true,
> >>>>> +   .max_linewidth = 4096,
> >>>>> +   .pixel_ram_size = DEFAULT_PIXEL_RAM_SIZE,
> >>>>> +   .max_hdeci_exp = MAX_HORZ_DECIMATION,
> >>>>> +   .max_vdeci_exp = MAX_VERT_DECIMATION,
> >>>>> +};
> >>>>> +
> >>>>>     static const struct dpu_caps sm8250_dpu_caps = {
> >>>>>      .max_mixer_width = DEFAULT_DPU_OUTPUT_LINE_WIDTH,
> >>>>>      .max_mixer_blendstages = 0xb,
> >>>>> @@ -293,6 +320,31 @@ static const struct dpu_mdp_cfg sc7180_mdp[] = {
> >>>>>      },
> >>>>>     };
> >>>>> +static const struct dpu_mdp_cfg sc8180x_mdp[] = {
> >>>>> +   {
> >>>>> +   .name = "top_0", .id = MDP_TOP,
> >>>>> +   .base = 0x0, .len = 0x45C,
> >>>>> +   .features = 0,
> >>>>> +   .highest_bank_bit = 0x3,
> >>>>> +   .clk_ctrls[DPU_CLK_CTRL_VIG0] = {
> >>>>> +                   .reg_off = 0x2AC, .bit_off = 0},
> >>>>> +   .clk_ctrls[DPU_CLK_CTRL_VIG1] = {
> >>>>> +                   .reg_off = 0x2B4, .bit_off = 0},
> >>>>> +   .clk_ctrls[DPU_CLK_CTRL_VIG2] = {
> >>>>> +                   .reg_off = 0x2BC, .bit_off = 0},
> >>>>> +   .clk_ctrls[DPU_CLK_CTRL_VIG3] = {
> >>>>> +                   .reg_off = 0x2C4, .bit_off = 0},
> >>>>> +   .clk_ctrls[DPU_CLK_CTRL_DMA0] = {
> >>>>> +                   .reg_off = 0x2AC, .bit_off = 8},
> >>>>> +   .clk_ctrls[DPU_CLK_CTRL_DMA1] = {
> >>>>> +                   .reg_off = 0x2B4, .bit_off = 8},
> >>>>> +   .clk_ctrls[DPU_CLK_CTRL_CURSOR0] = {
> >>>>> +                   .reg_off = 0x2BC, .bit_off = 8},
> >>>>> +   .clk_ctrls[DPU_CLK_CTRL_CURSOR1] = {
> >>>>> +                   .reg_off = 0x2C4, .bit_off = 8},
> >>>>> +   },
> >>>>> +};
> >>>>> +
> >>>>>     static const struct dpu_mdp_cfg sm8250_mdp[] = {
> >>>>>      {
> >>>>>      .name = "top_0", .id = MDP_TOP,
> >>>>> @@ -861,6 +913,16 @@ static const struct dpu_intf_cfg sc7280_intf[] = {
> >>>>>      INTF_BLK("intf_5", INTF_5, 0x39000, INTF_DP, MSM_DP_CONTROLLER_1, 24, INTF_SC7280_MASK, MDP_SSPP_TOP0_INTR, 22, 23),
> >>>>>     };
> >>>>> +static const struct dpu_intf_cfg sc8180x_intf[] = {
> >>>>> +   INTF_BLK("intf_0", INTF_0, 0x6A000, INTF_DP, MSM_DP_CONTROLLER_0, 24, INTF_SC7180_MASK, MDP_SSPP_TOP0_INTR, 24, 25),
> >>>>> +   INTF_BLK("intf_1", INTF_1, 0x6A800, INTF_DSI, 0, 24, INTF_SC7180_MASK, MDP_SSPP_TOP0_INTR, 26, 27),
> >>>>> +   INTF_BLK("intf_2", INTF_2, 0x6B000, INTF_DSI, 1, 24, INTF_SC7180_MASK, MDP_SSPP_TOP0_INTR, 28, 29),
> >>>>> +   /* INTF_3 is for MST, wired to INTF_DP 0 and 1, use dummy index until this is supported */
> >>>>> +   INTF_BLK("intf_3", INTF_3, 0x6B800, INTF_DP, 999, 24, INTF_SC7180_MASK, MDP_SSPP_TOP0_INTR, 30, 31),
> >>>>> +   INTF_BLK("intf_4", INTF_4, 0x6C000, INTF_DP, MSM_DP_CONTROLLER_1, 24, INTF_SC7180_MASK, MDP_SSPP_TOP0_INTR, 20, 21),
> >>>>> +   INTF_BLK("intf_5", INTF_5, 0x6C800, INTF_DP, MSM_DP_CONTROLLER_2, 24, INTF_SC7180_MASK, MDP_SSPP_TOP0_INTR, 22, 23),
> >>>>
> >>>> This is a continued discussion from
> >>>> https://patchwork.freedesktop.org/patch/474179/.
> >>>>
> >>>> Shouldnt INTF_5 be marked as INTF_eDP?
> >>>>
> >>>
> >>> Might be, I didn't even know we had an INTF_EDP define...
> >>>
> >>> Is there any reason to distinguish DP and EDP in the DPU?  I see sc7280
> >>> doesn't distinguish the DP and EDP interfaces.
> >>>
> >>> Regards,
> >>> Bjorn
> >>>
> >>
> >> Like I have mentioned in the other patch, I think we have enough
> >> confusion between eDP and DP with the common driver. Since DPU does have
> >> separate interfaces I think we should fix that.
> >>
> >> Regarding sc7280 using INTF_DP, I synced up with Sankeerth. He referred
> >> to your change
> >> https://patchwork.freedesktop.org/patch/457776/?series=92992&rev=5 as it
> >> was posted earlier and ended up using the same INTF_DP macro. So its
> >> turning out to be a cyclical error.
> >>
> >> I think we should fix both.
> >
> > So, what is the value for DPU to distinguish between eDP and DP interfaces?
> > Would we get anything except the (intf_type == INTF_EDP || intf_type
> > == INTF_DP) instead of (intf_type == INTF_DP) in all the cases where
> > the type is checked?
>
> There are only two places currently where I am seeing this OR condition
> between INTF_DP and INTF_eDP. I do not have an example to give you today
> of where we would need to distinguish eDP and DP but I cannot guarantee
> we will not have such a case.
>
> > (thus leading us to cases when someone would forget to add INTF_EDP
> > next to INTF_DP)
> >
> > Also, if we are switching from INTF_DP to INTF_EDP, should we stop
> > using end-to-end numbering (like MSM_DP_CONTROLLER_2 for INTF_5) and
> > add a separate numbering scheme for INTF_EDP?
> >
> We should change the controller ID to match what it actually is.
>
> Now that you pointed this out, this looks even more confusing to me to
> say that  MSM_DP_CONTROLLER_2 is actually a EDP controller because
> fundamentally and even hardware block wise they are different.

So, do we split msm_priv->dp too? It's indexed using
MSM_DP_CONTROLLER_n entries.
Do we want to teach drm/msm/dp code that there are priv->dp[] and
priv->edp arrays?

> Why do we want to keep building something on top of this confusing
> terminology knowing that it can be corrected when its fairly in the
> development stage rather than realizing later it will break.
>
> We have only been discussing that eDP and DP are treated equally in the
> DPU code and hence why do we need to distinguish.
>
> As per current code yes, but I cannot and probably noone else can
> guarantee that in future there can be cases were we want to distinguish
> the two for something.

Me too. For now I see INTF_DP as a useful abstraction for 'the
interface that's handled by drm/msm/dp and shares common timing
requirements'.

At this moment I estimate that splitting it properly into INTF_DP and
INTF_EDP can bring more troubles than possible future cases.
If at some point we were to distinguish DP and eDP usecases of
INTF_DP, I would suggest adding is_embedded property rather than
splitting away INTF_EDP.

It's good to think about future cases and expansions.
But it's too easy to create a monstruosos constructs supporting all
possible features that no one can understand, grok and maintain.
Been there, created several of them, refactored others.

Let me throw in yet-another-possible-if: if at some point the hardware
supported iDP using the same DP block, would you split INTF_iDP?

> Thats the overally consensus within our team.
>
> So if this going to work smoothly by just fixing two entries in the hw
> catalog I would rather do that now rather than realizing this down the
> line again just to save usage of one more enum.
>
> > With all that in mind I'd suggest to:
> > - use INTF_DP for both DP and new eDP interfaces
> > - remove INTF_EDP usage from the dpu1 driver
> > - add a note that INTF_EDP corresponds to older eDP blocks (found on 8x74/8x84)
> >
> >>
> >>>>> +};
> >>>>> +
> >>>>>     /*************************************************************
> >>>>>      * VBIF sub blocks config
> >>>>>      *************************************************************/
> >>>>> @@ -931,6 +993,10 @@ static const struct dpu_qos_lut_entry sm8150_qos_linear[] = {
> >>>>>      {.fl = 0, .lut = 0x0011222222223357 },
> >>>>>     };
> >>>>> +static const struct dpu_qos_lut_entry sc8180x_qos_linear[] = {
> >>>>> +   {.fl = 4, .lut = 0x0000000000000357 },
> >>>>> +};
> >>>>> +
> >>>>>     static const struct dpu_qos_lut_entry sdm845_qos_macrotile[] = {
> >>>>>      {.fl = 10, .lut = 0x344556677},
> >>>>>      {.fl = 11, .lut = 0x3344556677},
> >>>>> @@ -944,6 +1010,10 @@ static const struct dpu_qos_lut_entry sc7180_qos_macrotile[] = {
> >>>>>      {.fl = 0, .lut = 0x0011223344556677},
> >>>>>     };
> >>>>> +static const struct dpu_qos_lut_entry sc8180x_qos_macrotile[] = {
> >>>>> +   {.fl = 10, .lut = 0x0000000344556677},
> >>>>> +};
> >>>>> +
> >>>>>     static const struct dpu_qos_lut_entry sdm845_qos_nrt[] = {
> >>>>>      {.fl = 0, .lut = 0x0},
> >>>>>     };
> >>>>> @@ -1045,6 +1115,33 @@ static const struct dpu_perf_cfg sm8150_perf_data = {
> >>>>>      .bw_inefficiency_factor = 120,
> >>>>>     };
> >>>>> +static const struct dpu_perf_cfg sc8180x_perf_data = {
> >>>>> +   .max_bw_low = 9600000,
> >>>>> +   .max_bw_high = 9600000,
> >>>>> +   .min_core_ib = 2400000,
> >>>>> +   .min_llcc_ib = 800000,
> >>>>> +   .min_dram_ib = 800000,
> >>>>> +   .danger_lut_tbl = {0xf, 0xffff, 0x0, 0x0},
> >>>>> +   .qos_lut_tbl = {
> >>>>> +           {.nentry = ARRAY_SIZE(sc8180x_qos_linear),
> >>>>> +           .entries = sc8180x_qos_linear
> >>>>> +           },
> >>>>> +           {.nentry = ARRAY_SIZE(sc8180x_qos_macrotile),
> >>>>> +           .entries = sc8180x_qos_macrotile
> >>>>> +           },
> >>>>> +           {.nentry = ARRAY_SIZE(sc7180_qos_nrt),
> >>>>> +           .entries = sc7180_qos_nrt
> >>>>> +           },
> >>>>> +           /* TODO: macrotile-qseed is different from macrotile */
> >>>>> +   },
> >>>>> +   .cdp_cfg = {
> >>>>> +           {.rd_enable = 1, .wr_enable = 1},
> >>>>> +           {.rd_enable = 1, .wr_enable = 0}
> >>>>> +   },
> >>>>> +   .clk_inefficiency_factor = 105,
> >>>>> +   .bw_inefficiency_factor = 120,
> >>>>> +};
> >>>>> +
> >>>>>     static const struct dpu_perf_cfg sm8250_perf_data = {
> >>>>>      .max_bw_low = 13700000,
> >>>>>      .max_bw_high = 16600000,
> >>>>> @@ -1199,6 +1296,37 @@ static void sm8150_cfg_init(struct dpu_mdss_cfg *dpu_cfg)
> >>>>>      };
> >>>>>     }
> >>>>> +/*
> >>>>> + * sc8180x_cfg_init(): populate sc8180 dpu sub-blocks reg offsets
> >>>>> + * and instance counts.
> >>>>> + */
> >>>>> +static void sc8180x_cfg_init(struct dpu_mdss_cfg *dpu_cfg)
> >>>>> +{
> >>>>> +   *dpu_cfg = (struct dpu_mdss_cfg){
> >>>>> +           .caps = &sc8180x_dpu_caps,
> >>>>> +           .mdp_count = ARRAY_SIZE(sc8180x_mdp),
> >>>>> +           .mdp = sc8180x_mdp,
> >>>>> +           .ctl_count = ARRAY_SIZE(sm8150_ctl),
> >>>>> +           .ctl = sm8150_ctl,
> >>>>> +           .sspp_count = ARRAY_SIZE(sdm845_sspp),
> >>>>> +           .sspp = sdm845_sspp,
> >>>>> +           .mixer_count = ARRAY_SIZE(sm8150_lm),
> >>>>> +           .mixer = sm8150_lm,
> >>>>> +           .pingpong_count = ARRAY_SIZE(sm8150_pp),
> >>>>> +           .pingpong = sm8150_pp,
> >>>>> +           .merge_3d_count = ARRAY_SIZE(sm8150_merge_3d),
> >>>>> +           .merge_3d = sm8150_merge_3d,
> >>>>> +           .intf_count = ARRAY_SIZE(sc8180x_intf),
> >>>>> +           .intf = sc8180x_intf,
> >>>>> +           .vbif_count = ARRAY_SIZE(sdm845_vbif),
> >>>>> +           .vbif = sdm845_vbif,
> >>>>> +           .reg_dma_count = 1,
> >>>>> +           .dma_cfg = sm8150_regdma,
> >>>>> +           .perf = sc8180x_perf_data,
> >>>>> +           .mdss_irqs = IRQ_SC8180X_MASK,
> >>>>> +   };
> >>>>> +}
> >>>>> +
> >>>>>     /*
> >>>>>      * sm8250_cfg_init(): populate sm8250 dpu sub-blocks reg offsets
> >>>>>      * and instance counts.
> >>>>> @@ -1260,6 +1388,7 @@ static const struct dpu_mdss_hw_cfg_handler cfg_handler[] = {
> >>>>>      { .hw_rev = DPU_HW_VER_401, .cfg_init = sdm845_cfg_init},
> >>>>>      { .hw_rev = DPU_HW_VER_500, .cfg_init = sm8150_cfg_init},
> >>>>>      { .hw_rev = DPU_HW_VER_501, .cfg_init = sm8150_cfg_init},
> >>>>> +   { .hw_rev = DPU_HW_VER_510, .cfg_init = sc8180x_cfg_init},
> >>>>>      { .hw_rev = DPU_HW_VER_600, .cfg_init = sm8250_cfg_init},
> >>>>>      { .hw_rev = DPU_HW_VER_620, .cfg_init = sc7180_cfg_init},
> >>>>>      { .hw_rev = DPU_HW_VER_720, .cfg_init = sc7280_cfg_init},
> >>>>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
> >>>>> index 31af04afda7d..9572d29ff2ff 100644
> >>>>> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
> >>>>> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
> >>>>> @@ -39,6 +39,7 @@
> >>>>>     #define DPU_HW_VER_410   DPU_HW_VER(4, 1, 0) /* sdm670 v1.0 */
> >>>>>     #define DPU_HW_VER_500   DPU_HW_VER(5, 0, 0) /* sm8150 v1.0 */
> >>>>>     #define DPU_HW_VER_501   DPU_HW_VER(5, 0, 1) /* sm8150 v2.0 */
> >>>>> +#define DPU_HW_VER_510     DPU_HW_VER(5, 1, 1) /* sc8180 */
> >>>>>     #define DPU_HW_VER_600   DPU_HW_VER(6, 0, 0) /* sm8250 */
> >>>>>     #define DPU_HW_VER_620   DPU_HW_VER(6, 2, 0) /* sc7180 v1.0 */
> >>>>>     #define DPU_HW_VER_720   DPU_HW_VER(7, 2, 0) /* sc7280 */
> >>>>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
> >>>>> index 47fe11a84a77..cedc631f8498 100644
> >>>>> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
> >>>>> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
> >>>>> @@ -1351,6 +1351,7 @@ const struct of_device_id dpu_dt_match[] = {
> >>>>>      { .compatible = "qcom,sdm845-dpu", },
> >>>>>      { .compatible = "qcom,sc7180-dpu", },
> >>>>>      { .compatible = "qcom,sc7280-dpu", },
> >>>>> +   { .compatible = "qcom,sc8180x-dpu", },
> >>>>>      { .compatible = "qcom,sm8150-dpu", },
> >>>>>      { .compatible = "qcom,sm8250-dpu", },
> >>>>>      {}
> >>>>> diff --git a/drivers/gpu/drm/msm/msm_drv.c b/drivers/gpu/drm/msm/msm_drv.c
> >>>>> index 555666e3f960..0f441d358b60 100644
> >>>>> --- a/drivers/gpu/drm/msm/msm_drv.c
> >>>>> +++ b/drivers/gpu/drm/msm/msm_drv.c
> >>>>> @@ -1438,6 +1438,7 @@ static const struct of_device_id dt_match[] = {
> >>>>>      { .compatible = "qcom,sdm845-mdss", .data = (void *)KMS_DPU },
> >>>>>      { .compatible = "qcom,sc7180-mdss", .data = (void *)KMS_DPU },
> >>>>>      { .compatible = "qcom,sc7280-mdss", .data = (void *)KMS_DPU },
> >>>>> +   { .compatible = "qcom,sc8180x-mdss", .data = (void *)KMS_DPU },
> >>>>>      { .compatible = "qcom,sm8150-mdss", .data = (void *)KMS_DPU },
> >>>>>      { .compatible = "qcom,sm8250-mdss", .data = (void *)KMS_DPU },
> >>>>>      {}
> >
> >
> >



-- 
With best wishes
Dmitry
