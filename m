Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CF96A645EE7
	for <lists+dri-devel@lfdr.de>; Wed,  7 Dec 2022 17:28:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1238610E3F3;
	Wed,  7 Dec 2022 16:28:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C4D7710E3F2;
 Wed,  7 Dec 2022 16:28:29 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id E0D4F61ADD;
 Wed,  7 Dec 2022 16:28:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DD250C433D6;
 Wed,  7 Dec 2022 16:28:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1670430508;
 bh=ipjSmsI9QqNeS01tUG949g1IQiVfVqA0GymYF8fe8BM=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=EuKEN5V/QlL3cMGwV8JMrjwhdvYF8TUIs9wJMUWSNhXTkFqLcVHB1x31XJtVIwYor
 f6U1oRnyT5X0+cYOxIIavjnCOyrQTxfl/f8IJpsOXRV8MyP8u5QtUeEo8Wc16yKPQZ
 81S1s0mrJBfv6P202Gz8IaMRHt+VdqUdpNkAVCkidecBvefyHzJjq2XPUon4a5lxYl
 Pb7HW4LxZIdSrb5hXKjiij7OgHfFl0FaWQS2mtD9718OyIPt3cu2Ilt4FYYqHsi5eN
 KukKvie9m67IJIqMK0DWUPQsaNqQolLBPLTnD73KAZSAlMEgS73T4r8iJnb/0nmyj0
 FL4jW1jGjwxhQ==
Date: Wed, 7 Dec 2022 10:28:24 -0600
From: Bjorn Andersson <andersson@kernel.org>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Subject: Re: [PATCH v4 02/13] drm/msm/dpu: Introduce SC8280XP
Message-ID: <20221207162824.kyxecdz43v5ojatx@builder.lan>
References: <20221205174433.16847-1-quic_bjorande@quicinc.com>
 <20221205174433.16847-3-quic_bjorande@quicinc.com>
 <0430d878-e0cd-3708-91a3-2eca66418386@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <0430d878-e0cd-3708-91a3-2eca66418386@linaro.org>
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
Cc: Kalyan Thota <quic_kalyant@quicinc.com>, freedreno@lists.freedesktop.org,
 Sankeerth Billakanti <quic_sbillaka@quicinc.com>,
 Bjorn Andersson <quic_bjorande@quicinc.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, dri-devel@lists.freedesktop.org,
 Kuogee Hsieh <quic_khsieh@quicinc.com>,
 Konrad Dybcio <konrad.dybcio@linaro.org>, Rob Herring <robh+dt@kernel.org>,
 linux-arm-msm@vger.kernel.org, Jessica Zhang <quic_jesszhan@quicinc.com>,
 Sean Paul <sean@poorly.run>, Johan Hovold <johan+linaro@kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Dec 07, 2022 at 04:49:07PM +0200, Dmitry Baryshkov wrote:
> On 05/12/2022 19:44, Bjorn Andersson wrote:
> > diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
[..]
> > +static const struct dpu_mdp_cfg sc8280xp_mdp[] = {
> > +	{
> > +	.name = "top_0", .id = MDP_TOP,
> > +	.base = 0x0, .len = 0x494,
> > +	.features = 0,
> > +	.highest_bank_bit = 0x3, /* TODO: 2 for LP_DDR4 */
> 
> ubwc_swizzle ? I'd suppose it's 6, but I'd bet on it.
> 

I don't see ubwc_swizzle defined for any other platform, and it seems to
be unused for DPU_HW_UBWC_VER_40. Am I perhaps missing something?

> > +	.clk_ctrls[DPU_CLK_CTRL_VIG0] = { .reg_off = 0x2ac, .bit_off = 0},
> > +	.clk_ctrls[DPU_CLK_CTRL_VIG1] = { .reg_off = 0x2b4, .bit_off = 0},
> > +	.clk_ctrls[DPU_CLK_CTRL_VIG2] = { .reg_off = 0x2bc, .bit_off = 0},
> > +	.clk_ctrls[DPU_CLK_CTRL_VIG3] = { .reg_off = 0x2c4, .bit_off = 0},
> > +	.clk_ctrls[DPU_CLK_CTRL_DMA0] = { .reg_off = 0x2ac, .bit_off = 8},
> > +	.clk_ctrls[DPU_CLK_CTRL_DMA1] = { .reg_off = 0x2b4, .bit_off = 8},
> > +	.clk_ctrls[DPU_CLK_CTRL_CURSOR0] = { .reg_off = 0x2bc, .bit_off = 8},
> > +	.clk_ctrls[DPU_CLK_CTRL_CURSOR1] = { .reg_off = 0x2c4, .bit_off = 8},
> > +	.clk_ctrls[DPU_CLK_CTRL_REG_DMA] = { .reg_off = 0x2bc, .bit_off = 20},
> > +	},
> > +};
> > +
> >   static const struct dpu_mdp_cfg qcm2290_mdp[] = {
> >   	{
> >   	.name = "top_0", .id = MDP_TOP,
> > @@ -648,6 +693,45 @@ static const struct dpu_ctl_cfg sc7180_ctl[] = {
> >   	},
> >   };
> > +static const struct dpu_ctl_cfg sc8280xp_ctl[] = {
> > +	{
> > +	.name = "ctl_0", .id = CTL_0,
> > +	.base = 0x15000, .len = 0x204,
> > +	.features = BIT(DPU_CTL_ACTIVE_CFG) | BIT(DPU_CTL_FETCH_ACTIVE) | BIT(DPU_CTL_VM_CFG),
> 
> Please use CTL_SC7270_MASK instead, unless you have a strong reasong not to
> do it.
> 

No strong reason, will update.

Thanks,
Bjorn
