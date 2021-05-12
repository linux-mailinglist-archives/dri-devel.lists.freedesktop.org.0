Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F70637EF0C
	for <lists+dri-devel@lfdr.de>; Thu, 13 May 2021 01:06:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7AC7E6E591;
	Wed, 12 May 2021 23:06:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-x834.google.com (mail-qt1-x834.google.com
 [IPv6:2607:f8b0:4864:20::834])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2B6DB6E591
 for <dri-devel@lists.freedesktop.org>; Wed, 12 May 2021 23:06:30 +0000 (UTC)
Received: by mail-qt1-x834.google.com with SMTP id g13so18528221qts.4
 for <dri-devel@lists.freedesktop.org>; Wed, 12 May 2021 16:06:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=fSA6VzsIwmfQzLcNKI8LXXgzEauW/SKmRsgvPavPb1Q=;
 b=lSgJwqGGYIigKbhvNgOo5aPNIj7rMjm2SPJFubN+7K5mKdrR8GO1Rx/jKYWJGfq9fU
 mfRcpFg5O5xuwz+8NbUAIi8oOfNXfuIwEAe9Ec90tSZH3w4F1LQhC+PZeUn9tmlgj7t+
 3CCB0o28l3U+PQuZ6jE+ex/et0/sYpu/Y5o4RFFgqjHOx4/9zCJINGJANaQLBJqroAoZ
 MJ3my72/dxeWIVJNdVhzDYdeWkDdTpxo37cTQhTn7SsJgtHH8mDnkTBQgYjwira3xoGu
 Wg4SvmXPoNv7oAcUifXU6/Xv+t0YXcyY37NdoOT2VjUqJIadDe0IgrAAUWxSC+TcXwc0
 wteA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=fSA6VzsIwmfQzLcNKI8LXXgzEauW/SKmRsgvPavPb1Q=;
 b=EwKTgGTpJBYT9PjlCmSAGDPtgaG0Zo43r7eT8dik5hSex3qOj3wW7JCl/i9Ustklcp
 TkJAqopi2HCVGV34rzLQvcFV5u9Ic+qcf5xmVziY7mWlEUbWhVE+lrPTP9CDQjAvHhPL
 7yXrIoulpk6+Gwv+eFsw/fzDl1d3HU5qPrDkqpCcS+wjxm6o84an0PFkVby3WTHeH+PW
 dYtRYL5y8tvBAYz7plnDtald4FkZ+Y9RVkga25y9MmxXQm9wADYej0mWxUpbuaapg46L
 tih+ko8G22jWGg0DtKuN56T+XDUKXxNnfBGiRQyxrGyon3C01kuBs9gKglUMWKFwdfu1
 +5MA==
X-Gm-Message-State: AOAM530YogpKOiFBCfY/ksCJVetnEMOvS6c9Zq3WA8iLA2o8OhzSqwwO
 BzzF+U4Arz7MMmFXK/qIZ+YRKxlipcJSGCFE5xKuOA==
X-Google-Smtp-Source: ABdhPJwNY+3a9n8mvM9DQXFuQkiS1A43uoxqFXSgOGsLEv6At8EWBnkk+1fje3jZYNb2xSA8jH5nPvQV2HkOUdp/aYg=
X-Received: by 2002:ac8:7d14:: with SMTP id g20mr16022130qtb.298.1620860789269; 
 Wed, 12 May 2021 16:06:29 -0700 (PDT)
MIME-Version: 1.0
References: <20210511041852.592295-1-bjorn.andersson@linaro.org>
 <20210511041852.592295-3-bjorn.andersson@linaro.org>
In-Reply-To: <20210511041852.592295-3-bjorn.andersson@linaro.org>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Thu, 13 May 2021 02:06:18 +0300
Message-ID: <CAA8EJpqQ3TV3VkYs8f3w0fmM_ZBW9gHB3P8ErzHe6SiKf3-aGg@mail.gmail.com>
Subject: Re: [PATCH 2/4] drm/msm/dpu: Clear boot loader configured data paths
To: Bjorn Andersson <bjorn.andersson@linaro.org>
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
Cc: freedreno <freedreno@lists.freedesktop.org>,
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, David Airlie <airlied@linux.ie>,
 "open list:DRM DRIVER FOR MSM ADRENO GPU" <linux-arm-msm@vger.kernel.org>,
 open list <linux-kernel@vger.kernel.org>,
 "open list:DRM DRIVER FOR MSM ADRENO GPU" <dri-devel@lists.freedesktop.org>,
 Rob Herring <robh+dt@kernel.org>, Sean Paul <sean@poorly.run>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, 11 May 2021 at 07:18, Bjorn Andersson
<bjorn.andersson@linaro.org> wrote:
>
> It's typical for the bootloader to configure CTL_0 for the boot splash
> or EFIFB, but for non-DSI use cases the DPU driver tend to pick another
> CTL and the system might end up with two configured data paths producing
> data on the same INTF - with resulting graphical artifacts.
>
> Naturally the end goal would be to inherit the bootloader's
> configuration and provide the user with a glitch free handover from the
> boot configuration to a running DPU.
> But such effort will affect clocks, regulators, power-domains etc, so in
> the meantime this patch simply disables all INTFs and clear all
> configured data paths, to avoid the graphical artifacts.

Good idea. We'd have to be careful to test this with interfaces in command mode.

>
> Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
> ---
>  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c |  4 +++
>  drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c    |  2 ++
>  drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c     | 36 ++++++++++++++++++++++
>  drivers/gpu/drm/msm/disp/dpu1/dpu_rm.h     |  8 +++++
>  4 files changed, 50 insertions(+)
>
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c
> index 2d4645e01ebf..7aba27c1055a 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c
> @@ -349,9 +349,13 @@ static void dpu_hw_ctl_clear_all_blendstages(struct dpu_hw_ctl *ctx)
>                 DPU_REG_WRITE(c, CTL_LAYER_EXT(LM_0 + i), 0);
>                 DPU_REG_WRITE(c, CTL_LAYER_EXT2(LM_0 + i), 0);
>                 DPU_REG_WRITE(c, CTL_LAYER_EXT3(LM_0 + i), 0);
> +
> +               ctx->pending_flush_mask |= dpu_hw_ctl_get_bitmask_mixer(ctx, LM_0 + i);
>         }
>
>         DPU_REG_WRITE(c, CTL_FETCH_PIPE_ACTIVE, 0);
> +
> +       ctx->pending_flush_mask |= CTL_FLUSH_MASK_CTL;
>  }
>
>  static void dpu_hw_ctl_setup_blendstage(struct dpu_hw_ctl *ctx,
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
> index 88e9cc38c13b..8b01cb660381 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
> @@ -970,6 +970,8 @@ static int dpu_kms_hw_init(struct msm_kms *kms)
>
>         dpu_kms->rm_init = true;
>
> +       dpu_rm_clear_boot_config(&dpu_kms->rm, dpu_kms->catalog);
> +
>         dpu_kms->hw_mdp = dpu_hw_mdptop_init(MDP_TOP, dpu_kms->mmio,
>                                              dpu_kms->catalog);
>         if (IS_ERR(dpu_kms->hw_mdp)) {
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c
> index fd2d104f0a91..2cf47084482f 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c
> @@ -4,6 +4,7 @@
>   */
>
>  #define pr_fmt(fmt)    "[drm:%s] " fmt, __func__
> +#include <linux/delay.h>
>  #include "dpu_kms.h"
>  #include "dpu_hw_lm.h"
>  #include "dpu_hw_ctl.h"
> @@ -229,6 +230,41 @@ int dpu_rm_init(struct dpu_rm *rm,
>         return rc ? rc : -EFAULT;
>  }
>
> +void dpu_rm_clear_boot_config(struct dpu_rm *rm, struct dpu_mdss_cfg *cat)
> +{
> +       struct dpu_hw_intf *intf;
> +       struct dpu_hw_ctl *ctl;
> +       int i;
> +
> +       for (i = INTF_0; i < INTF_MAX; i++) {
> +               if (!rm->intf_blks[i - INTF_0])
> +                       continue;
> +
> +               DPU_DEBUG("disabling intf%d timing engine\n", i - INTF_0);
> +
> +               intf = to_dpu_hw_intf(rm->intf_blks[i - INTF_0]);
> +               intf->ops.enable_timing(intf, 0);
> +       }
> +
> +       /*
> +        * Wait one frame for the INTF timing engine to stop, and then wait one
> +        * more frame, per the documentation.
> +        */
> +       msleep(32);
> +
> +       for (i = CTL_0; i < CTL_MAX; i++) {
> +               if (!rm->ctl_blks[i - CTL_0])
> +                       continue;
> +
> +               DPU_DEBUG("clearing ctl%d layer configuration\n", i - CTL_0);
> +
> +               ctl = to_dpu_hw_ctl(rm->ctl_blks[i - CTL_0]);
> +               ctl->ops.clear_all_blendstages(ctl);
> +               ctl->ops.trigger_flush(ctl);
> +               ctl->ops.trigger_start(ctl);
> +       }
> +}
> +
>  static bool _dpu_rm_needs_split_display(const struct msm_display_topology *top)
>  {
>         return top->num_intf > 1;
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.h
> index 1f12c8d5b8aa..53cd649614a3 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.h
> @@ -88,5 +88,13 @@ void dpu_rm_release(struct dpu_global_state *global_state,
>  int dpu_rm_get_assigned_resources(struct dpu_rm *rm,
>         struct dpu_global_state *global_state, uint32_t enc_id,
>         enum dpu_hw_blk_type type, struct dpu_hw_blk **blks, int blks_size);
> +
> +/**
> + * dpu_rm_clear_boot_config() - Tear down any data paths configured by boot
> + * @rm: DPU Resource Manger handle
> + * @cat: Pointer to hardware catalog
> + */
> +void dpu_rm_clear_boot_config(struct dpu_rm *rm, struct dpu_mdss_cfg *cat);
> +
>  #endif /* __DPU_RM_H__ */
>
> --
> 2.29.2
>


-- 
With best wishes
Dmitry
