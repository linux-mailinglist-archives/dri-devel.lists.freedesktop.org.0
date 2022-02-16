Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 42B784B7D10
	for <lists+dri-devel@lfdr.de>; Wed, 16 Feb 2022 03:14:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DCB3F10E5FE;
	Wed, 16 Feb 2022 02:14:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oo1-xc2d.google.com (mail-oo1-xc2d.google.com
 [IPv6:2607:f8b0:4864:20::c2d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CA4FD10E603
 for <dri-devel@lists.freedesktop.org>; Wed, 16 Feb 2022 02:14:35 +0000 (UTC)
Received: by mail-oo1-xc2d.google.com with SMTP id
 x6-20020a4a4106000000b003193022319cso900641ooa.4
 for <dri-devel@lists.freedesktop.org>; Tue, 15 Feb 2022 18:14:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=qs5Wv3pL+wFWfpiRhHn2AdJWY7PJclGJQXknrkKkS5Q=;
 b=DPHS3FA258EKnrCH+ke1TpLXySX6tU9Lt+zh4YgoJ9WdSvHN9o2N/qViFYXwenkbdA
 TRzVNQzOiApWxViOwGaNRA4yNodmKBX3tO7J4B9FrIAkSJPWCXgyEkE+qHhd9T78E6bj
 HBYdsc+mm/xiNTXFNd4DBY42XK/BhP4ZHY2UjZ0t2Fg2QR98DtwFeuOthNQCsv/mgXte
 63ZitVCjQaEJOogvzsp10p3xGGSw6EldbxNNpeKqSycGfH1HT1Xfcq/alSeYvBiFr72J
 NBJDtogM+uDxm1nAY/zPI7+WbL7sHoh4IM8uueJACVBnEFkTdqav8ks86k5lU/uBGwP5
 TTUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=qs5Wv3pL+wFWfpiRhHn2AdJWY7PJclGJQXknrkKkS5Q=;
 b=S3QSfGsrPgW8FDgD0y6BLg1OQRBU+gLw8F9HM7O1CtjaTVNaINusEQx8QqDyFaaFkC
 s6bPvtKzs4uYevw1AeaNxF5tjCHGd1miY5Vw9YzG/IMgXr9tk2WCFiqRE3XCeQT4YWfw
 yNKsKLWiBv7zzzt1hulQRygbcqKWNUG0GKpkbVDxMHwUOweh+8zYpQDaUF9HbEJ/YgAk
 1idNKcHGbMaSl+JJtXW0ru9viyUUHIGVzVXPXzLWH7Q2Zv/Ufbh5ku1mw9IccCNozDO4
 xQdiojIaSQRi4JzH3YNAtIDKnBuz3Ae8WmHtCzE9IMTAXzGzzpVtFX77b/HM9cTxe8+P
 Npyg==
X-Gm-Message-State: AOAM5322m4EKEGzifLovZNSIn2mpH4ww12ErWsbOeuubgSBUGrMfRWVr
 yPrttyE2Kmya+7Lx83U6mh4zQQ==
X-Google-Smtp-Source: ABdhPJyw8MHZ2eUchmz87xRT+ihExh1FY1306UMIXaLsKy270Z8smoUE5bHuN3hbumiSLC9Pkg43QA==
X-Received: by 2002:a05:6870:4994:b0:c4:7dc0:d74b with SMTP id
 ho20-20020a056870499400b000c47dc0d74bmr281884oab.286.1644977675001; 
 Tue, 15 Feb 2022 18:14:35 -0800 (PST)
Received: from builder.lan ([2600:1700:a0:3dc8:3697:f6ff:fe85:aac9])
 by smtp.gmail.com with ESMTPSA id bj8sm15451410oib.20.2022.02.15.18.14.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 15 Feb 2022 18:14:34 -0800 (PST)
Date: Tue, 15 Feb 2022 20:14:32 -0600
From: Bjorn Andersson <bjorn.andersson@linaro.org>
To: Abhinav Kumar <quic_abhinavk@quicinc.com>
Subject: Re: [PATCH v2 2/2] drm/msm/dpu: Add SC8180x to hw catalog
Message-ID: <YgxeCHi5AsYPTmeZ@builder.lan>
References: <20220215043353.1256754-1-bjorn.andersson@linaro.org>
 <20220215043353.1256754-2-bjorn.andersson@linaro.org>
 <be397e2e-05ab-5c18-8e2d-16c443f0a6d1@quicinc.com>
 <Ygvisfhi0SY6XdAz@builder.lan>
 <6a3ef247-b26b-d505-cd85-92fb277163dd@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <6a3ef247-b26b-d505-cd85-92fb277163dd@quicinc.com>
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

On Tue 15 Feb 11:42 CST 2022, Abhinav Kumar wrote:

> 
> 
> On 2/15/2022 9:28 AM, Bjorn Andersson wrote:
> > On Tue 15 Feb 11:14 CST 2022, Abhinav Kumar wrote:
> > 
> > > 
> > > 
> > > On 2/14/2022 8:33 PM, Bjorn Andersson wrote:
> > > > From: Rob Clark <robdclark@chromium.org>
> > > > 
> > > > Add SC8180x to the hardware catalog, for initial support for the
> > > > platform. Due to limitations in the DP driver only one of the four DP
> > > > interfaces is left enabled.
> > > > 
> > > > The SC8180x platform supports the newly added DPU_INTF_WIDEBUS flag and
> > > > the Windows-on-Snapdragon bootloader leaves the widebus bit set, so this
> > > > is flagged appropriately to ensure widebus is disabled - for now.
> > > > 
> > > > Signed-off-by: Rob Clark <robdclark@chromium.org>
> > > > [bjorn: Reworked intf and irq definitions]
> > > > Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
> > > > ---
> > > > 
> > > > Changes since v1:
> > > > - Dropped widebus flag
> > > > 
> > > >    .../gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c    | 129 ++++++++++++++++++
> > > >    .../gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h    |   1 +
> > > >    drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c       |   1 +
> > > >    drivers/gpu/drm/msm/msm_drv.c                 |   1 +
> > > >    4 files changed, 132 insertions(+)
> > > > 
> > > > diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
> > > > index aa75991903a6..7ac0fe32df49 100644
> > > > --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
> > > > +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
> > > > @@ -90,6 +90,17 @@
> > > >    			 BIT(MDP_INTF3_INTR) | \
> > > >    			 BIT(MDP_INTF4_INTR))
> > > > +#define IRQ_SC8180X_MASK (BIT(MDP_SSPP_TOP0_INTR) | \
> > > > +			  BIT(MDP_SSPP_TOP0_INTR2) | \
> > > > +			  BIT(MDP_SSPP_TOP0_HIST_INTR) | \
> > > > +			  BIT(MDP_INTF0_INTR) | \
> > > > +			  BIT(MDP_INTF1_INTR) | \
> > > > +			  BIT(MDP_INTF2_INTR) | \
> > > > +			  BIT(MDP_INTF3_INTR) | \
> > > > +			  BIT(MDP_INTF4_INTR) | \
> > > > +			  BIT(MDP_INTF5_INTR) | \
> > > > +			  BIT(MDP_AD4_0_INTR) | \
> > > > +			  BIT(MDP_AD4_1_INTR))
> > > >    #define DEFAULT_PIXEL_RAM_SIZE		(50 * 1024)
> > > >    #define DEFAULT_DPU_LINE_WIDTH		2048
> > > > @@ -225,6 +236,22 @@ static const struct dpu_caps sm8150_dpu_caps = {
> > > >    	.max_vdeci_exp = MAX_VERT_DECIMATION,
> > > >    };
> > > > +static const struct dpu_caps sc8180x_dpu_caps = {
> > > > +	.max_mixer_width = DEFAULT_DPU_OUTPUT_LINE_WIDTH,
> > > > +	.max_mixer_blendstages = 0xb,
> > > > +	.qseed_type = DPU_SSPP_SCALER_QSEED3,
> > > > +	.smart_dma_rev = DPU_SSPP_SMART_DMA_V2, /* TODO: v2.5 */
> > > > +	.ubwc_version = DPU_HW_UBWC_VER_30,
> > > > +	.has_src_split = true,
> > > > +	.has_dim_layer = true,
> > > > +	.has_idle_pc = true,
> > > > +	.has_3d_merge = true,
> > > > +	.max_linewidth = 4096,
> > > > +	.pixel_ram_size = DEFAULT_PIXEL_RAM_SIZE,
> > > > +	.max_hdeci_exp = MAX_HORZ_DECIMATION,
> > > > +	.max_vdeci_exp = MAX_VERT_DECIMATION,
> > > > +};
> > > > +
> > > >    static const struct dpu_caps sm8250_dpu_caps = {
> > > >    	.max_mixer_width = DEFAULT_DPU_OUTPUT_LINE_WIDTH,
> > > >    	.max_mixer_blendstages = 0xb,
> > > > @@ -293,6 +320,31 @@ static const struct dpu_mdp_cfg sc7180_mdp[] = {
> > > >    	},
> > > >    };
> > > > +static const struct dpu_mdp_cfg sc8180x_mdp[] = {
> > > > +	{
> > > > +	.name = "top_0", .id = MDP_TOP,
> > > > +	.base = 0x0, .len = 0x45C,
> > > > +	.features = 0,
> > > > +	.highest_bank_bit = 0x3,
> > > > +	.clk_ctrls[DPU_CLK_CTRL_VIG0] = {
> > > > +			.reg_off = 0x2AC, .bit_off = 0},
> > > > +	.clk_ctrls[DPU_CLK_CTRL_VIG1] = {
> > > > +			.reg_off = 0x2B4, .bit_off = 0},
> > > > +	.clk_ctrls[DPU_CLK_CTRL_VIG2] = {
> > > > +			.reg_off = 0x2BC, .bit_off = 0},
> > > > +	.clk_ctrls[DPU_CLK_CTRL_VIG3] = {
> > > > +			.reg_off = 0x2C4, .bit_off = 0},
> > > > +	.clk_ctrls[DPU_CLK_CTRL_DMA0] = {
> > > > +			.reg_off = 0x2AC, .bit_off = 8},
> > > > +	.clk_ctrls[DPU_CLK_CTRL_DMA1] = {
> > > > +			.reg_off = 0x2B4, .bit_off = 8},
> > > > +	.clk_ctrls[DPU_CLK_CTRL_CURSOR0] = {
> > > > +			.reg_off = 0x2BC, .bit_off = 8},
> > > > +	.clk_ctrls[DPU_CLK_CTRL_CURSOR1] = {
> > > > +			.reg_off = 0x2C4, .bit_off = 8},
> > > > +	},
> > > > +};
> > > > +
> > > >    static const struct dpu_mdp_cfg sm8250_mdp[] = {
> > > >    	{
> > > >    	.name = "top_0", .id = MDP_TOP,
> > > > @@ -861,6 +913,16 @@ static const struct dpu_intf_cfg sc7280_intf[] = {
> > > >    	INTF_BLK("intf_5", INTF_5, 0x39000, INTF_DP, MSM_DP_CONTROLLER_1, 24, INTF_SC7280_MASK, MDP_SSPP_TOP0_INTR, 22, 23),
> > > >    };
> > > > +static const struct dpu_intf_cfg sc8180x_intf[] = {
> > > > +	INTF_BLK("intf_0", INTF_0, 0x6A000, INTF_DP, MSM_DP_CONTROLLER_0, 24, INTF_SC7180_MASK, MDP_SSPP_TOP0_INTR, 24, 25),
> > > > +	INTF_BLK("intf_1", INTF_1, 0x6A800, INTF_DSI, 0, 24, INTF_SC7180_MASK, MDP_SSPP_TOP0_INTR, 26, 27),
> > > > +	INTF_BLK("intf_2", INTF_2, 0x6B000, INTF_DSI, 1, 24, INTF_SC7180_MASK, MDP_SSPP_TOP0_INTR, 28, 29),
> > > > +	/* INTF_3 is for MST, wired to INTF_DP 0 and 1, use dummy index until this is supported */
> > > > +	INTF_BLK("intf_3", INTF_3, 0x6B800, INTF_DP, 999, 24, INTF_SC7180_MASK, MDP_SSPP_TOP0_INTR, 30, 31),
> > > > +	INTF_BLK("intf_4", INTF_4, 0x6C000, INTF_DP, MSM_DP_CONTROLLER_1, 24, INTF_SC7180_MASK, MDP_SSPP_TOP0_INTR, 20, 21),
> > > > +	INTF_BLK("intf_5", INTF_5, 0x6C800, INTF_DP, MSM_DP_CONTROLLER_2, 24, INTF_SC7180_MASK, MDP_SSPP_TOP0_INTR, 22, 23),
> > > 
> > > This is a continued discussion from
> > > https://patchwork.freedesktop.org/patch/474179/.
> > > 
> > > Shouldnt INTF_5 be marked as INTF_eDP?
> > > 
> > 
> > Might be, I didn't even know we had an INTF_EDP define...
> > 
> > Is there any reason to distinguish DP and EDP in the DPU?  I see sc7280
> > doesn't distinguish the DP and EDP interfaces.
> > 
> > Regards,
> > Bjorn
> > 
> 
> Like I have mentioned in the other patch, I think we have enough confusion
> between eDP and DP with the common driver. Since DPU does have separate
> interfaces I think we should fix that.
> 
> Regarding sc7280 using INTF_DP, I synced up with Sankeerth. He referred to
> your change
> https://patchwork.freedesktop.org/patch/457776/?series=92992&rev=5 as it was
> posted earlier and ended up using the same INTF_DP macro. So its turning out
> to be a cyclical error.
> 

That made me take a second look at the HPG, and sure enough INTF_5 on
SC7280 is connected to a eDP/DP Combo PHY. We have the same setup in
SC8280XP.

In SC8180X, INTF_5 is documented as being connected to a eDP (only) PHY,
so perhaps it makes sense to do it there, but for the others its wrong.

Regards,
Bjorn
