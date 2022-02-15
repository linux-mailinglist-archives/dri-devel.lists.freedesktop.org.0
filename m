Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 888C24B6F92
	for <lists+dri-devel@lfdr.de>; Tue, 15 Feb 2022 16:16:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0F76510E28B;
	Tue, 15 Feb 2022 15:16:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x236.google.com (mail-oi1-x236.google.com
 [IPv6:2607:f8b0:4864:20::236])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C21C010E28B
 for <dri-devel@lists.freedesktop.org>; Tue, 15 Feb 2022 15:16:00 +0000 (UTC)
Received: by mail-oi1-x236.google.com with SMTP id i5so21071865oih.1
 for <dri-devel@lists.freedesktop.org>; Tue, 15 Feb 2022 07:16:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=I0VnhROKkBi4dtf21+79RpDBG1aGmguFKe9ZiPB4Eq0=;
 b=xVCfK1LN+I6iwSWNtKEeju0I09FcEDFWuzizRZT8uxxPb/TlJ5xOwMjvlUhU7yfOya
 relwyrZ9dnGa423jgX7TI0D3JuE9erfwh23lFw+mgFOirYHzuwVFJe5ORNXsk9+5Lvdv
 MbF3qtbk9WLXmuDvQzcx/q1eL9NmZdOm/WwTL+qNGWSqM7Kc+2Tk5yp6MZwrsSPL4r3o
 /Z4CJ4RZ5O7IgivR7Se4HyIYSFe47ozt5gXRrhUDNp+8q49yvJfLBFndGmFm/7m7QLCF
 o4Fs3EFfsUuxX+RA6XyajhWc3TdpIjR8CluO59F6uCLMX/FS6xTpxqPtsMY2QDYHeaPh
 D5Bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=I0VnhROKkBi4dtf21+79RpDBG1aGmguFKe9ZiPB4Eq0=;
 b=uvnHjkGJbzESvpPL260ZcRq7GDKIr47N1RTGPobhpGhgVME+1dBcJcfENA+RuPMRbj
 pGyX1VpuUCGWZrQ+i5cAxKhnFM3tFwN132r6mui18r8+J03gzS77VwC9mtQt0MY6SCfu
 Lzjw9gXb5lktuA3pq+BnBssIGow+juSKIELpy1MH5/g31ijbofJ7IwwtOd6/mt92oBU1
 Guh9vr5MaJI2m+wN/n0MFBWO4kxBI/WDtT5iQ3LkUeBI1x7xqa3Lg42t/RwW0fiJLY2g
 shc015KaasspSVGz68DnXrB76E8Aw1l4ybiE7dhO8NbxHy2FdtLi5IdgtN2MYdN5SvFK
 coQg==
X-Gm-Message-State: AOAM531G5jHUjY9n0W9xDcuj3YY522o0USWrC7KzsWQZNhr3s+W8Ak59
 Uad4xl0c9zTbequTMsvajcQ/VQ==
X-Google-Smtp-Source: ABdhPJwYo5wNw2IV5T32mI1cM3Pqz048fDRVUkw6/B15L3hD9mmisGBAWzLrF9B6LM4vtFUbMlV4Lg==
X-Received: by 2002:aca:6286:0:b0:2d3:d3f1:5b0f with SMTP id
 w128-20020aca6286000000b002d3d3f15b0fmr1848246oib.290.1644938159976; 
 Tue, 15 Feb 2022 07:15:59 -0800 (PST)
Received: from yoga ([2600:1700:a0:3dc8:5c39:baff:fe03:898d])
 by smtp.gmail.com with ESMTPSA id o14sm4782888oaq.37.2022.02.15.07.15.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 15 Feb 2022 07:15:59 -0800 (PST)
Date: Tue, 15 Feb 2022 09:15:57 -0600
From: Bjorn Andersson <bjorn.andersson@linaro.org>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Subject: Re: [PATCH] drm/msm/dpu: Disable boot loader configured data paths
Message-ID: <YgvDrXoK4a0+HLpz@yoga>
References: <20220215043708.1256854-1-bjorn.andersson@linaro.org>
 <460e0036-74b5-bccd-c11c-2573290012ae@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <460e0036-74b5-bccd-c11c-2573290012ae@linaro.org>
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
Cc: linux-arm-msm@vger.kernel.org, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue 15 Feb 08:44 CST 2022, Dmitry Baryshkov wrote:

> On 15/02/2022 07:37, Bjorn Andersson wrote:
> > It's typical for the bootloader to configure CTL_0 for the boot splash
> > or EFIFB, but for non-DSI use cases the DPU driver tend to pick another
> > CTL and the system might end up with two configured data paths producing
> > data on the same INTF. In particular as the IOMMU configuration isn't
> > retained from the bootloader one of the data paths will push underflow
> > color, resulting in screen flickering.
> > 
> > Naturally the end goal would be to inherit the bootloader's
> > configuration and provide the user with a glitch-free handover from the
> > boot configuration to a running DPU.
> > 
> > But such effort will affect clocks, regulators, power-domains etc, and
> > will take time to implement. So in the meantime this patch simply
> > disables all the data paths, on platforms that has CTL_FETCH_ACTIVE, to
> > avoid the graphical artifacts.
> > 
> > Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
> > ---
> >   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c | 13 +++++++++++++
> >   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.h |  6 ++++++
> >   drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c    |  2 ++
> >   drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c     | 17 +++++++++++++++++
> >   drivers/gpu/drm/msm/disp/dpu1/dpu_rm.h     |  8 ++++++++
> >   5 files changed, 46 insertions(+)
> > 
> > diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c
> > index 02da9ecf71f1..69d4849484fa 100644
> > --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c
> > +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c
> > @@ -357,6 +357,18 @@ static void dpu_hw_ctl_clear_all_blendstages(struct dpu_hw_ctl *ctx)
> >   	DPU_REG_WRITE(c, CTL_FETCH_PIPE_ACTIVE, 0);
> >   }
> > +static void dpu_hw_ctl_disable_boot_config(struct dpu_hw_ctl *ctx)
> > +{
> > +	if (ctx->caps->features & BIT(DPU_CTL_FETCH_ACTIVE)) {
> 
> I see that you are changing only CTL_FETCH_PIPE_ACTIVE. However it still
> seems like a hack.

You're not wrong, it certainly seems a little bit hacky.

I think that it would be more appropriate to try to inherit the
bootloader configuration. So the proposal here is, in my view, a
stop-gap until we start to look at "continuous splash".

> What if instead we always disable boot config for all paths except CTL_0 (or
> CTL_0 and CTL_1)?
> 

On my laptop the bootloader sets up efifb using CTL_0. When Linux brings
up the eDP interface it seems to skip DPU_CTL_SPLIT_DISPLAY ctls and
picks CTL_2.

As mentioned in the message, I now have both CTL_0 and CTL_2 pushing
data to the one interface; resulting in flickering.

> > +		/*
> > +		 * Disable the pipe fetch and trigger a start, to disable the
> > +		 * data path
> > +		 */
> > +		DPU_REG_WRITE(&ctx->hw, CTL_FETCH_PIPE_ACTIVE, 0);
> > +		DPU_REG_WRITE(&ctx->hw, CTL_START, 0x1);
> 
> What about video vs cmd modes?
> 

Initially I was resetting a whole bunch of properties in the CTL, but
all I want to do is stop the data flow. It's my expectation that the
steps to follow will reset the interfaces and configure the actual data
paths anew.

Perhaps I'm missing some steps here, the documentation is not clear and
this has the expected visual outcome...

Regards,
Bjorn

> > +	}
> > +}
> > +
> >   static void dpu_hw_ctl_setup_blendstage(struct dpu_hw_ctl *ctx,
> >   	enum dpu_lm lm, struct dpu_hw_stage_cfg *stage_cfg)
> >   {
> > @@ -590,6 +602,7 @@ static void _setup_ctl_ops(struct dpu_hw_ctl_ops *ops,
> >   	ops->trigger_pending = dpu_hw_ctl_trigger_pending;
> >   	ops->reset = dpu_hw_ctl_reset_control;
> >   	ops->wait_reset_status = dpu_hw_ctl_wait_reset_status;
> > +	ops->disable_boot_config = dpu_hw_ctl_disable_boot_config;
> >   	ops->clear_all_blendstages = dpu_hw_ctl_clear_all_blendstages;
> >   	ops->setup_blendstage = dpu_hw_ctl_setup_blendstage;
> >   	ops->get_bitmask_sspp = dpu_hw_ctl_get_bitmask_sspp;
> > diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.h
> > index 806c171e5df2..c2734f6ab760 100644
> > --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.h
> > +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.h
> > @@ -159,6 +159,12 @@ struct dpu_hw_ctl_ops {
> >   	 */
> >   	void (*clear_all_blendstages)(struct dpu_hw_ctl *ctx);
> > +	/**
> > +	 * Disable the configuration setup by the bootloader
> > +	 * @ctx	      : ctl path ctx pointer
> > +	 */
> > +	void (*disable_boot_config)(struct dpu_hw_ctl *ctx);
> > +
> >   	/**
> >   	 * Configure layer mixer to pipe configuration
> >   	 * @ctx       : ctl path ctx pointer
> > diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
> > index cedc631f8498..eef2f017031a 100644
> > --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
> > +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
> > @@ -1107,6 +1107,8 @@ static int dpu_kms_hw_init(struct msm_kms *kms)
> >   	dpu_kms->rm_init = true;
> > +	dpu_rm_clear_boot_config(&dpu_kms->rm, dpu_kms->catalog);
> > +
> >   	dpu_kms->hw_mdp = dpu_hw_mdptop_init(MDP_TOP, dpu_kms->mmio,
> >   					     dpu_kms->catalog);
> >   	if (IS_ERR(dpu_kms->hw_mdp)) {
> > diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c
> > index f9c83d6e427a..3365c5e41e28 100644
> > --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c
> > +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c
> > @@ -4,6 +4,7 @@
> >    */
> >   #define pr_fmt(fmt)	"[drm:%s] " fmt, __func__
> > +#include <linux/delay.h>
> >   #include "dpu_kms.h"
> >   #include "dpu_hw_lm.h"
> >   #include "dpu_hw_ctl.h"
> > @@ -229,6 +230,22 @@ int dpu_rm_init(struct dpu_rm *rm,
> >   	return rc ? rc : -EFAULT;
> >   }
> > +void dpu_rm_clear_boot_config(struct dpu_rm *rm, struct dpu_mdss_cfg *cat)
> > +{
> > +	struct dpu_hw_ctl *ctl;
> > +	int i;
> > +
> > +	for (i = CTL_0; i < CTL_MAX; i++) {
> > +		if (!rm->ctl_blks[i - CTL_0])
> > +			continue;
> > +
> > +		DPU_DEBUG("disabling ctl%d boot configuration\n", i - CTL_0);
> > +
> > +		ctl = to_dpu_hw_ctl(rm->ctl_blks[i - CTL_0]);
> > +		ctl->ops.disable_boot_config(ctl);
> > +	}
> > +}
> > +
> >   static bool _dpu_rm_needs_split_display(const struct msm_display_topology *top)
> >   {
> >   	return top->num_intf > 1;
> > diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.h
> > index 1f12c8d5b8aa..d3e084541e67 100644
> > --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.h
> > +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.h
> > @@ -88,5 +88,13 @@ void dpu_rm_release(struct dpu_global_state *global_state,
> >   int dpu_rm_get_assigned_resources(struct dpu_rm *rm,
> >   	struct dpu_global_state *global_state, uint32_t enc_id,
> >   	enum dpu_hw_blk_type type, struct dpu_hw_blk **blks, int blks_size);
> > +
> > +/**
> > + * dpu_rm_clear_boot_config() - Tear down any data paths configured by boot
> > + * @rm: DPU Resource Manager handle
> > + * @cat: Pointer to hardware catalog
> > + */
> > +void dpu_rm_clear_boot_config(struct dpu_rm *rm, struct dpu_mdss_cfg *cat);
> > +
> >   #endif /* __DPU_RM_H__ */
> 
> 
> -- 
> With best wishes
> Dmitry
