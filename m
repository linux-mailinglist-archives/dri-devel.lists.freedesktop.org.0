Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D19F625A93
	for <lists+dri-devel@lfdr.de>; Fri, 11 Nov 2022 13:39:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1180710E0F1;
	Fri, 11 Nov 2022 12:39:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x52f.google.com (mail-ed1-x52f.google.com
 [IPv6:2a00:1450:4864:20::52f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 83C1310E170
 for <dri-devel@lists.freedesktop.org>; Fri, 11 Nov 2022 12:39:16 +0000 (UTC)
Received: by mail-ed1-x52f.google.com with SMTP id x2so7482210edd.2
 for <dri-devel@lists.freedesktop.org>; Fri, 11 Nov 2022 04:39:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=cLINDIBaT9Y/w404CBXNAbKwXG6vwoYdNQOEUcgL5PE=;
 b=H0uD8Uw+bAlp9InbIYjHeNfaWitQuu3V4IORyQ/t+VVRpC7H3HhsAEFXgDK/7/E0oT
 fXnL0Of1XAj1gLDL5DT+zNGeEW2em3IufCFOSYk/Y/hHAI0CaN+VKYJV4lyXJElx3pZY
 sawxsLPU+AMEdMFg92Phay9ZhE9bh7Caki8SpdgRx6Hsb51FN+tbzsWBLo5VRYTfYtT0
 ulQzyq4RG/4KVQotums8X9Jj8H2+YHU8/XoouaVVsx/qXoXZrBCCmr22vd04MFtACbac
 WaQMDAUg7F1NI6PB43/6BhedUimB5hW4B58jzEU4DZkH3xPg0ic5rtqElTwN67mXOrU0
 pAZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=cLINDIBaT9Y/w404CBXNAbKwXG6vwoYdNQOEUcgL5PE=;
 b=0dBeP68tX0jEBLF0e2q9rUNV8NSmrOt+0e+KhLgMbcmeerkiuquXMXqn/TToAsrMoO
 zVYRcsmn8c6/6u5J6RojGS9B12tuYoi9H+zt9aNSJCRxmdejY5Tno24hnNw/VGg44qoo
 A1O3/5aGFpJAB6sZHznG5VZP0+H+upiq/pvlN0SPydArleeQqDLKVRgTrx3D35iTKhkd
 dV2idvxgcr7MfAhkiqXhKaUlD6FQJOPCDrIigQX4kCLR7BnM+CP9kXq96sYodFkUcVmY
 Txro/edeO9uNVgoMMGeFsnFyLCEQ61g/2cXt88GmPCGlT4f7w4vIHbpmaW7Br2MTuGdT
 H6pg==
X-Gm-Message-State: ANoB5pkeBQthEgX7NoEaQ07btSS5DwmdTWyBEisFpoo1AZQ1ONi66h1M
 lrQQRhu1OfAvNy4azte8MEyPWQxyrf7cG0NaA670bw==
X-Google-Smtp-Source: AA0mqf6KkSardAexkHjBQ0Va30Fmez2FnONS9ZtkQFZobXkLXoMvYAIScGRmBJBiS1d9/KlJeFvJNzlurRRwyTn0wNA=
X-Received: by 2002:a05:6402:22e9:b0:464:1297:8412 with SMTP id
 dn9-20020a05640222e900b0046412978412mr1289683edb.50.1668170354903; Fri, 11
 Nov 2022 04:39:14 -0800 (PST)
MIME-Version: 1.0
References: <20221028120812.339100-1-robert.foss@linaro.org>
 <20221028120812.339100-4-robert.foss@linaro.org>
 <f09429f2-0b21-7f8a-ad64-e51af056ea08@linaro.org>
In-Reply-To: <f09429f2-0b21-7f8a-ad64-e51af056ea08@linaro.org>
From: Robert Foss <robert.foss@linaro.org>
Date: Fri, 11 Nov 2022 13:39:03 +0100
Message-ID: <CAG3jFyuaaw-uXVc=84ViiZdxCN80hZSCZv0V-8wfbovjQsFgbA@mail.gmail.com>
Subject: Re: [PATCH v1 3/9] drm/msm/dpu: Add SM8350 to hw catalog
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
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
Cc: airlied@linux.ie, konrad.dybcio@somainline.org,
 dri-devel@lists.freedesktop.org, bjorn.andersson@linaro.org,
 krzysztof.kozlowski+dt@linaro.org, angelogioacchino.delregno@somainline.org,
 vinod.koul@linaro.org, Jonathan Marek <jonathan@marek.ca>,
 quic_vpolimer@quicinc.com, agross@kernel.org, quic_jesszhan@quicinc.com,
 devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 quic_abhinavk@quicinc.com, swboyd@chromium.org, robh+dt@kernel.org,
 sean@poorly.run, quic_kalyant@quicinc.com, loic.poulain@linaro.org,
 dianders@chromium.org, linux-kernel@vger.kernel.org, vkoul@kernel.org,
 freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, 28 Oct 2022 at 14:27, Dmitry Baryshkov
<dmitry.baryshkov@linaro.org> wrote:
>
> On 28/10/2022 15:08, Robert Foss wrote:
> > Add compatibility for SM8350 display subsystem, including
> > required entries in DPU hw catalog.
> > ---
> >   .../gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c    | 217 ++++++++++++++++++
> >   .../gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h    |   1 +
> >   2 files changed, 218 insertions(+)
> >
> > diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
> > index d0ce7612fee8..bc829d7bdd6e 100644
> > --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
> > +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
> > @@ -112,6 +112,15 @@
> >                        BIT(MDP_INTF3_INTR) | \
> >                        BIT(MDP_INTF4_INTR))
> >
> > +#define IRQ_SM8350_MASK (BIT(MDP_SSPP_TOP0_INTR) | \
> > +                      BIT(MDP_SSPP_TOP0_INTR2) | \
> > +                      BIT(MDP_SSPP_TOP0_HIST_INTR) | \
> > +                      BIT(MDP_INTF0_7xxx_INTR) | \
> > +                      BIT(MDP_INTF1_7xxx_INTR) | \
> > +                      BIT(MDP_INTF2_7xxx_INTR) | \
> > +                      BIT(MDP_INTF3_7xxx_INTR) | \
> > +                      0)
> > +
> >   #define IRQ_SC8180X_MASK (BIT(MDP_SSPP_TOP0_INTR) | \
> >                         BIT(MDP_SSPP_TOP0_INTR2) | \
> >                         BIT(MDP_SSPP_TOP0_HIST_INTR) | \
> > @@ -364,6 +373,20 @@ static const struct dpu_caps sm8250_dpu_caps = {
> >       .pixel_ram_size = DEFAULT_PIXEL_RAM_SIZE,
> >   };
> >
> > +static const struct dpu_caps sm8350_dpu_caps = {
> > +     .max_mixer_width = DEFAULT_DPU_OUTPUT_LINE_WIDTH,
> > +     .max_mixer_blendstages = 0xb,
> > +     .qseed_type = DPU_SSPP_SCALER_QSEED3LITE,
> > +     .smart_dma_rev = DPU_SSPP_SMART_DMA_V2, /* TODO: v2.5 */
> > +     .ubwc_version = DPU_HW_UBWC_VER_40,
> > +     .has_src_split = true,
> > +     .has_dim_layer = true,
> > +     .has_idle_pc = true,
> > +     .has_3d_merge = true,
> > +     .max_linewidth = 4096,
>
> Is it 4096 or 5120?

4096 is what I'm seeing in the downstream dts, except for the
wb-linewidth-linear property which is 5120.

So I would think 4096 is the correct value, what do you think?

>
> > +     .pixel_ram_size = DEFAULT_PIXEL_RAM_SIZE,
> > +};
> > +
> >   static const struct dpu_caps sc7280_dpu_caps = {
> >       .max_mixer_width = DEFAULT_DPU_OUTPUT_LINE_WIDTH,
> >       .max_mixer_blendstages = 0x7,
> > @@ -501,6 +524,33 @@ static const struct dpu_mdp_cfg sm8250_mdp[] = {
> >       },
> >   };
> >
> > +static const struct dpu_mdp_cfg sm8350_mdp[] = {
> > +     {
> > +     .name = "top_0", .id = MDP_TOP,
> > +     .base = 0x0, .len = 0x494,
> > +     .features = 0,
> > +     .highest_bank_bit = 0x3, /* TODO: 2 for LP_DDR4 */
> > +     .clk_ctrls[DPU_CLK_CTRL_VIG0] = {
> > +                     .reg_off = 0x2AC, .bit_off = 0},
> > +     .clk_ctrls[DPU_CLK_CTRL_VIG1] = {
> > +                     .reg_off = 0x2B4, .bit_off = 0},
> > +     .clk_ctrls[DPU_CLK_CTRL_VIG2] = {
> > +                     .reg_off = 0x2BC, .bit_off = 0},
> > +     .clk_ctrls[DPU_CLK_CTRL_VIG3] = {
> > +                     .reg_off = 0x2C4, .bit_off = 0},
> > +     .clk_ctrls[DPU_CLK_CTRL_DMA0] = {
> > +                     .reg_off = 0x2AC, .bit_off = 8},
> > +     .clk_ctrls[DPU_CLK_CTRL_DMA1] = {
> > +                     .reg_off = 0x2B4, .bit_off = 8},
> > +     .clk_ctrls[DPU_CLK_CTRL_CURSOR0] = {
> > +                     .reg_off = 0x2BC, .bit_off = 8},
> > +     .clk_ctrls[DPU_CLK_CTRL_CURSOR1] = {
> > +                     .reg_off = 0x2C4, .bit_off = 8},
> > +     .clk_ctrls[DPU_CLK_CTRL_REG_DMA] = {
> > +                     .reg_off = 0x2BC, .bit_off = 20},
> > +     },
> > +};
> > +
> >   static const struct dpu_mdp_cfg sc7280_mdp[] = {
> >       {
> >       .name = "top_0", .id = MDP_TOP,
> > @@ -659,6 +709,66 @@ static const struct dpu_ctl_cfg sm8150_ctl[] = {
> >       },
> >   };
> >
> > +static const struct dpu_ctl_cfg sm8350_ctl[] = {
> > +     {
> > +     .name = "ctl_0", .id = CTL_0,
> > +     .base = 0x15000, .len = 0x1e8,
> > +     .features = BIT(DPU_CTL_SPLIT_DISPLAY) |
> > +                 BIT(DPU_CTL_PINGPONG_SPLIT) |
> > +                 BIT(DPU_CTL_ACTIVE_CFG) |
> > +                 BIT(DPU_CTL_FETCH_ACTIVE) |
> > +                 BIT(DPU_CTL_VM_CFG) |
> > +                 BIT(DPU_CTL_UNIFIED_DSPP_FLUSH),
> > +     .intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 9),
> > +     },
> > +     {
> > +     .name = "ctl_1", .id = CTL_1,
> > +     .base = 0x16000, .len = 0x1e8,
> > +     .features = BIT(DPU_CTL_SPLIT_DISPLAY) |
> > +                 BIT(DPU_CTL_ACTIVE_CFG) |
> > +                 BIT(DPU_CTL_FETCH_ACTIVE) |
> > +                 BIT(DPU_CTL_VM_CFG) |
> > +                 BIT(DPU_CTL_UNIFIED_DSPP_FLUSH),
>
> The UNIFIED_DSPP_FLUSH is not merged. Could you please change this to
> BIT(DPU_CTL_SPLIT_DISPLAY) | CTL_SC7280_MASK (for first two CTLs) and
> just CTL_SC7280_MASK for the rest of them?

Ack.

>
> > +     .intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 10),
> > +     },
> > +     {
> > +     .name = "ctl_2", .id = CTL_2,
> > +     .base = 0x17000, .len = 0x1e8,
> > +     .features = BIT(DPU_CTL_ACTIVE_CFG) |
> > +                 BIT(DPU_CTL_FETCH_ACTIVE) |
> > +                 BIT(DPU_CTL_VM_CFG) |
> > +                 BIT(DPU_CTL_UNIFIED_DSPP_FLUSH),
> > +     .intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 11),
> > +     },
> > +     {
> > +     .name = "ctl_3", .id = CTL_3,
> > +     .base = 0x18000, .len = 0x1e8,
> > +     .features = BIT(DPU_CTL_ACTIVE_CFG) |
> > +                 BIT(DPU_CTL_FETCH_ACTIVE) |
> > +                 BIT(DPU_CTL_VM_CFG) |
> > +                 BIT(DPU_CTL_UNIFIED_DSPP_FLUSH),
> > +     .intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 12),
> > +     },
> > +     {
> > +     .name = "ctl_4", .id = CTL_4,
> > +     .base = 0x19000, .len = 0x1e8,
> > +     .features = BIT(DPU_CTL_ACTIVE_CFG) |
> > +                 BIT(DPU_CTL_FETCH_ACTIVE) |
> > +                 BIT(DPU_CTL_VM_CFG) |
> > +                 BIT(DPU_CTL_UNIFIED_DSPP_FLUSH),
> > +     .intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 13),
> > +     },
> > +     {
> > +     .name = "ctl_5", .id = CTL_5,
> > +     .base = 0x1a000, .len = 0x1e8,
> > +     .features = BIT(DPU_CTL_ACTIVE_CFG) |
> > +                 BIT(DPU_CTL_FETCH_ACTIVE) |
> > +                 BIT(DPU_CTL_VM_CFG) |
> > +                 BIT(DPU_CTL_UNIFIED_DSPP_FLUSH),
> > +     .intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 23),
> > +     },
> > +};
> > +
> >   static const struct dpu_ctl_cfg sc7280_ctl[] = {
> >       {
> >       .name = "ctl_0", .id = CTL_0,
> > @@ -1182,6 +1292,27 @@ static const struct dpu_pingpong_cfg sc7280_pp[] = {
> >       PP_BLK("pingpong_3", PINGPONG_3, 0x6c000, 0, sc7280_pp_sblk, -1, -1),
> >   };
> >
> > +static const struct dpu_pingpong_cfg sm8350_pp[] = {
> > +     PP_BLK_TE("pingpong_0", PINGPONG_0, 0x69000, MERGE_3D_0, sdm845_pp_sblk_te,
> > +                     DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 8),
> > +                     DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 12)),
> > +     PP_BLK_TE("pingpong_1", PINGPONG_1, 0x6a000, MERGE_3D_0, sdm845_pp_sblk_te,
> > +                     DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 9),
> > +                     DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 13)),
> > +     PP_BLK("pingpong_2", PINGPONG_2, 0x6b000, MERGE_3D_1, sdm845_pp_sblk,
> > +                     DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 10),
> > +                     DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 14)),
> > +     PP_BLK("pingpong_3", PINGPONG_3, 0x6c000, MERGE_3D_1, sdm845_pp_sblk,
> > +                     DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 11),
> > +                     DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 15)),
> > +     PP_BLK("pingpong_4", PINGPONG_4, 0x6d000, MERGE_3D_2, sdm845_pp_sblk,
> > +                     DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 30),
> > +                     -1),
> > +     PP_BLK("pingpong_5", PINGPONG_5, 0x6e000, MERGE_3D_2, sdm845_pp_sblk,
> > +                     DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 31),
> > +                     -1),
> > +};
> > +
> >   static struct dpu_pingpong_cfg qcm2290_pp[] = {
> >       PP_BLK("pingpong_0", PINGPONG_0, 0x70000, 0, sdm845_pp_sblk,
> >               DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 8),
> > @@ -1205,6 +1336,12 @@ static const struct dpu_merge_3d_cfg sm8150_merge_3d[] = {
> >       MERGE_3D_BLK("merge_3d_2", MERGE_3D_2, 0x83200),
> >   };
> >
> > +static const struct dpu_merge_3d_cfg sm8350_merge_3d[] = {
> > +     MERGE_3D_BLK("merge_3d_0", MERGE_3D_0, 0x4e000),
> > +     MERGE_3D_BLK("merge_3d_1", MERGE_3D_1, 0x4f000),
> > +     MERGE_3D_BLK("merge_3d_2", MERGE_3D_2, 0x50000),
> > +};
> > +
> >   /*************************************************************
> >    * DSC sub blocks config
> >    *************************************************************/
> > @@ -1222,6 +1359,12 @@ static struct dpu_dsc_cfg sdm845_dsc[] = {
> >       DSC_BLK("dsc_3", DSC_3, 0x80c00),
> >   };
> >
> > +static struct dpu_dsc_cfg sm8350_dsc[] = {
> > +     DSC_BLK("dsc_0", DSC_0, 0x80000),
> > +     DSC_BLK("dsc_1", DSC_1, 0x81000),
> > +     DSC_BLK("dsc_2", DSC_2, 0x82000),
> > +};
> > +
> >   /*************************************************************
> >    * INTF sub blocks config
> >    *************************************************************/
> > @@ -1269,6 +1412,13 @@ static const struct dpu_intf_cfg sc7280_intf[] = {
> >       INTF_BLK("intf_5", INTF_5, 0x39000, INTF_DP, MSM_DP_CONTROLLER_1, 24, INTF_SC7280_MASK, MDP_SSPP_TOP0_INTR, 22, 23),
> >   };
> >
> > +static const struct dpu_intf_cfg sm8350_intf[] = {
> > +     INTF_BLK("intf_0", INTF_0, 0x34000, INTF_DP, MSM_DP_CONTROLLER_0, 24, INTF_SC7280_MASK, MDP_SSPP_TOP0_INTR, 24, 25),
> > +     INTF_BLK("intf_1", INTF_1, 0x35000, INTF_DSI, 0, 24, INTF_SC7280_MASK, MDP_SSPP_TOP0_INTR, 26, 27),
> > +     INTF_BLK("intf_2", INTF_2, 0x36000, INTF_DSI, 1, 24, INTF_SC7280_MASK, MDP_SSPP_TOP0_INTR, 28, 29),
> > +     INTF_BLK("intf_3", INTF_3, 0x37000, INTF_DP, MSM_DP_CONTROLLER_1, 24, INTF_SC7280_MASK, MDP_SSPP_TOP0_INTR, 30, 31),
> > +};
> > +
> >   static const struct dpu_intf_cfg sc8180x_intf[] = {
> >       INTF_BLK("intf_0", INTF_0, 0x6A000, INTF_DP, MSM_DP_CONTROLLER_0, 24, INTF_SC7180_MASK, MDP_SSPP_TOP0_INTR, 24, 25),
> >       INTF_BLK("intf_1", INTF_1, 0x6A800, INTF_DSI, 0, 24, INTF_SC7180_MASK, MDP_SSPP_TOP0_INTR, 26, 27),
> > @@ -1397,6 +1547,14 @@ static const struct dpu_reg_dma_cfg sm8250_regdma = {
> >       .clk_ctrl = DPU_CLK_CTRL_REG_DMA,
> >   };
> >
> > +static const struct dpu_reg_dma_cfg sm8350_regdma = {
> > +     .base = 0x0,
> > +     .version = 0x00020000,
> > +     .trigger_sel_off = 0x119c,
> > +     .xin_id = 7,
> > +     .clk_ctrl = DPU_CLK_CTRL_REG_DMA,
> > +};
> > +
> >   /*************************************************************
> >    * PERF data config
> >    *************************************************************/
> > @@ -1700,6 +1858,36 @@ static const struct dpu_perf_cfg sc7280_perf_data = {
> >       .bw_inefficiency_factor = 120,
> >   };
> >
> > +static const struct dpu_perf_cfg sm8350_perf_data = {
> > +     .max_bw_low = 11800000,
> > +     .max_bw_high = 18200000,
> > +     .min_core_ib = 2500000,
> > +     .min_llcc_ib = 0,
> > +     .min_dram_ib = 800000,
> > +     .min_prefill_lines = 40,
> > +     /* FIXME: lut tables */
> > +     .danger_lut_tbl = {0x3ffff, 0x3ffff, 0x0},
> > +     .safe_lut_tbl = {0xfe00, 0xfe00, 0xffff},
> > +     .qos_lut_tbl = {
> > +             {.nentry = ARRAY_SIZE(sc7180_qos_linear),
> > +             .entries = sc7180_qos_linear
> > +             },
> > +             {.nentry = ARRAY_SIZE(sc7180_qos_macrotile),
> > +             .entries = sc7180_qos_macrotile
> > +             },
> > +             {.nentry = ARRAY_SIZE(sc7180_qos_nrt),
> > +             .entries = sc7180_qos_nrt
> > +             },
> > +             /* TODO: macrotile-qseed is different from macrotile */
> > +     },
> > +     .cdp_cfg = {
> > +             {.rd_enable = 1, .wr_enable = 1},
> > +             {.rd_enable = 1, .wr_enable = 0}
> > +     },
> > +     .clk_inefficiency_factor = 105,
> > +     .bw_inefficiency_factor = 120,
> > +};
> > +
> >   static const struct dpu_perf_cfg qcm2290_perf_data = {
> >       .max_bw_low = 2700000,
> >       .max_bw_high = 2700000,
> > @@ -1876,6 +2064,34 @@ static const struct dpu_mdss_cfg sm8250_dpu_cfg = {
> >       .mdss_irqs = IRQ_SM8250_MASK,
> >   };
> >
> > +static const struct dpu_mdss_cfg sm8350_dpu_cfg = {
> > +     .caps = &sm8350_dpu_caps,
> > +     .mdp_count = ARRAY_SIZE(sm8350_mdp),
> > +     .mdp = sm8350_mdp,
> > +     .ctl_count = ARRAY_SIZE(sm8350_ctl),
> > +     .ctl = sm8350_ctl,
> > +     .sspp_count = ARRAY_SIZE(sm8250_sspp),
> > +     .sspp = sm8250_sspp,
> > +     .mixer_count = ARRAY_SIZE(sm8150_lm),
> > +     .mixer = sm8150_lm,
> > +     .dspp_count = ARRAY_SIZE(sm8150_dspp),
> > +     .dspp = sm8150_dspp,
> > +     .pingpong_count = ARRAY_SIZE(sm8350_pp),
> > +     .pingpong = sm8350_pp,
> > +     .dsc_count = ARRAY_SIZE(sm8350_dsc),
> > +     .dsc = sm8350_dsc,
> > +     .merge_3d_count = ARRAY_SIZE(sm8350_merge_3d),
> > +     .merge_3d = sm8350_merge_3d,
> > +     .intf_count = ARRAY_SIZE(sm8350_intf),
> > +     .intf = sm8350_intf,
> > +     .vbif_count = ARRAY_SIZE(sdm845_vbif),
> > +     .vbif = sdm845_vbif,
> > +     .reg_dma_count = 1,
> > +     .dma_cfg = &sm8250_regdma,
> > +     .perf = &sm8350_perf_data,
> > +     .mdss_irqs = IRQ_SM8350_MASK,
> > +};
> > +
> >   static const struct dpu_mdss_cfg sc7280_dpu_cfg = {
> >       .caps = &sc7280_dpu_caps,
> >       .mdp_count = ARRAY_SIZE(sc7280_mdp),
> > @@ -1933,6 +2149,7 @@ static const struct dpu_mdss_hw_cfg_handler cfg_handler[] = {
> >       { .hw_rev = DPU_HW_VER_600, .dpu_cfg = &sm8250_dpu_cfg},
> >       { .hw_rev = DPU_HW_VER_620, .dpu_cfg = &sc7180_dpu_cfg},
> >       { .hw_rev = DPU_HW_VER_650, .dpu_cfg = &qcm2290_dpu_cfg},
> > +     { .hw_rev = DPU_HW_VER_700, .dpu_cfg = &sm8350_dpu_cfg},
> >       { .hw_rev = DPU_HW_VER_720, .dpu_cfg = &sc7280_dpu_cfg},
> >   };
> >
> > diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
> > index 71fe4c505f5b..e59630e06110 100644
> > --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
> > +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
> > @@ -45,6 +45,7 @@
> >   #define DPU_HW_VER_600      DPU_HW_VER(6, 0, 0) /* sm8250 */
> >   #define DPU_HW_VER_620      DPU_HW_VER(6, 2, 0) /* sc7180 v1.0 */
> >   #define DPU_HW_VER_650      DPU_HW_VER(6, 5, 0) /* qcm2290|sm4125 */
> > +#define DPU_HW_VER_700       DPU_HW_VER(7, 0, 0) /* sm8350 */
> >   #define DPU_HW_VER_720      DPU_HW_VER(7, 2, 0) /* sc7280 */
> >
> >   #define IS_MSM8996_TARGET(rev) IS_DPU_MAJOR_MINOR_SAME((rev), DPU_HW_VER_170)
>
> --
> With best wishes
> Dmitry
>
