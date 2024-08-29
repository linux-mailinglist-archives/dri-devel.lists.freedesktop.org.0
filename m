Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7051E96437E
	for <lists+dri-devel@lfdr.de>; Thu, 29 Aug 2024 13:51:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4694B10E650;
	Thu, 29 Aug 2024 11:51:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="jNko93Ag";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-f174.google.com (mail-yw1-f174.google.com
 [209.85.128.174])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4479110E650
 for <dri-devel@lists.freedesktop.org>; Thu, 29 Aug 2024 11:51:44 +0000 (UTC)
Received: by mail-yw1-f174.google.com with SMTP id
 00721157ae682-6cf6d1a2148so5278827b3.3
 for <dri-devel@lists.freedesktop.org>; Thu, 29 Aug 2024 04:51:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1724932303; x=1725537103; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=ADjazXa2UYYZoyIa934Wbzo/pDx1HciCmyz3zetZEmw=;
 b=jNko93AgMjmRanUNtYijjn3LGTrqwsK2R/i8yEiD3Jo8RyIi5umwELrkZUGXiD5a+D
 YjS6L/sB+nIecyk8M5+qZM5lNr8OYOIOPmbhQGpGu3bm/VHJmEbZ0Zx1Sq85IkjiW5iB
 k6sfgh8LmZ8Kj5EheOjx92hW9Y6P7fkkfnt6pIKHZJBjIOsRYK0caknnmoCNwV9RlVSy
 Q4h2ww6P/N3zJKc4NBPFWZ35POFAjYCj+QxMXmaL2skelodJJByvaM6ZvRSvDtUnhw4q
 gsosQaFzMcajKXKzcs+euvuPVSUXZ2Sr125h6aLSgRczCYbiLfAEGu2cHdvo4rTzNz9i
 ntpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1724932303; x=1725537103;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=ADjazXa2UYYZoyIa934Wbzo/pDx1HciCmyz3zetZEmw=;
 b=G8ldyeAgv7tOIXx0zep7u8De9PLjTaatRx5C/yX6fJ5K5HUqR8ybBtFFPoxi8FaaWy
 ORZgrU3ZIArf1CxYrHk1e0GyNR9oG0dv8W/fRE3UGVIyAfo0WE3RwAQKFVtmzrzak37J
 tD8IlvKMuwYfCY5dHKOOBJAQZluI6oH4+e5Xik4eA2jXBUsVthzPHUkEQybCgsyH9j2h
 7NYLsV3t47RjuY9KMUk+RyvUyrEVb38PMv9Lt/BhYDH21o98AjmYgSAMPLg74rfTYlQk
 TkFl1l2GTLJOiKbOtqsETdOxEuLnL3ZyD26BFVPTkDhmXXqHjOXL4C0TMjaAKw5aaCtW
 0qow==
X-Forwarded-Encrypted: i=1;
 AJvYcCVEmHPO5fF1Ps3oUeJtaW5TkI+0wEh9LCgKsy4lX3Tjn+wUH22LSOWnu5o9XNR+HPHVeq0P9FRZzWY=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyGp9Y5sDPdyRIwwByM5heD0/ofXexIUhbGyp1huCB/VrZSsULf
 vKrYjr3OjhmG4EWrBvcCw/y1HGP50A0srhPw2dTtX+U0uYD94Qw0LcVkQoWu0lGRys9opV9Itfg
 +bNrbzU33XU6Sd/RgUkGjsOYfjkXJbtzXIq0foQ==
X-Google-Smtp-Source: AGHT+IHM1biX7BPGHYNLG30VmvjSr6bvRec9+xxWR0NidjjN7pSt1m9npJbRC3W75m5/3m4thgqZi2aUNr67Rb7+mIo=
X-Received: by 2002:a05:690c:6e10:b0:6b9:d327:9ad6 with SMTP id
 00721157ae682-6d277a78f56mr33393267b3.33.1724932303041; Thu, 29 Aug 2024
 04:51:43 -0700 (PDT)
MIME-Version: 1.0
References: <20240829-sm8650-v6-11-hmd-pocf-mdss-quad-upstream-8-v1-0-bdb05b4b5a2e@linaro.org>
 <20240829-sm8650-v6-11-hmd-pocf-mdss-quad-upstream-8-v1-18-bdb05b4b5a2e@linaro.org>
In-Reply-To: <20240829-sm8650-v6-11-hmd-pocf-mdss-quad-upstream-8-v1-18-bdb05b4b5a2e@linaro.org>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Thu, 29 Aug 2024 14:51:32 +0300
Message-ID: <CAA8EJpoj6vs1JsDWgqof9Ogt-0Zq6hUpuaK42YwByDGrpUopnw@mail.gmail.com>
Subject: Re: [PATCH 18/21] drm/msm/dpu: blend pipes by left and right
To: Jun Nie <jun.nie@linaro.org>
Cc: Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, linux-arm-msm@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, 29 Aug 2024 at 13:21, Jun Nie <jun.nie@linaro.org> wrote:
>
> Blend pipes by left and right. The first 2 pipes are for
> left half screen and the later 2 pipes are for right in quad
> pipe case.
>
> Signed-off-by: Jun Nie <jun.nie@linaro.org>
> ---
>  drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c    | 13 +++++++++++--
>  drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c | 10 +++++++---
>  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c  | 19 +++++++++++++++++--
>  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.h  |  4 +++-
>  4 files changed, 38 insertions(+), 8 deletions(-)
>
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
> index 3b3cd17976082..8fd56f8f2851f 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
> @@ -574,8 +574,17 @@ static void _dpu_crtc_blend_setup(struct drm_crtc *crtc)
>                         mixer[i].mixer_op_mode,
>                         ctl->idx - CTL_0);
>
> -               ctl->ops.setup_blendstage(ctl, mixer[i].hw_lm->idx,
> -                       &stage_cfg);
> +               /*
> +                * call dpu_hw_ctl_setup_blendstage() to blend layers per stage cfg.
> +                * There is 4 mixers at most. The first 2 are for the left half, and
> +                * the later 2 are for the right half.
> +                */
> +               if (cstate->num_mixers == 4 && i >= 2)
> +                       ctl->ops.setup_blendstage(ctl, mixer[i].hw_lm->idx,
> +                               &stage_cfg, true);
> +               else
> +                       ctl->ops.setup_blendstage(ctl, mixer[i].hw_lm->idx,
> +                               &stage_cfg, false);
>         }
>  }
>
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> index 76793201b984e..5d927f23e35b2 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> @@ -2049,9 +2049,13 @@ static void dpu_encoder_helper_reset_mixers(struct dpu_encoder_phys *phys_enc)
>                 if (phys_enc->hw_ctl->ops.update_pending_flush_mixer)
>                         phys_enc->hw_ctl->ops.update_pending_flush_mixer(ctl, hw_mixer[i]->idx);
>
> -               /* clear all blendstages */
> -               if (phys_enc->hw_ctl->ops.setup_blendstage)
> -                       phys_enc->hw_ctl->ops.setup_blendstage(ctl, hw_mixer[i]->idx, NULL);
> +               /* clear all blendstages in both left and right */
> +               if (phys_enc->hw_ctl->ops.setup_blendstage) {
> +                       phys_enc->hw_ctl->ops.setup_blendstage(ctl,
> +                               hw_mixer[i]->idx, NULL, false);
> +                       phys_enc->hw_ctl->ops.setup_blendstage(ctl,
> +                               hw_mixer[i]->idx, NULL, true);
> +               }
>         }
>  }
>
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c
> index 602dfad127c2a..2072d18520326 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c
> @@ -478,12 +478,13 @@ static const struct ctl_blend_config ctl_blend_config[][2] = {
>  };
>
>  static void dpu_hw_ctl_setup_blendstage(struct dpu_hw_ctl *ctx,
> -       enum dpu_lm lm, struct dpu_hw_stage_cfg *stage_cfg)
> +       enum dpu_lm lm, struct dpu_hw_stage_cfg *stage_cfg, bool right)
>  {
>         struct dpu_hw_blk_reg_map *c = &ctx->hw;
>         u32 mix, ext, mix_ext;
>         u32 mixercfg[5] = { 0 };
>         int i, j;
> +       int pipe_start, pipe_end;
>         int stages;
>         int pipes_per_stage;
>
> @@ -502,13 +503,27 @@ static void dpu_hw_ctl_setup_blendstage(struct dpu_hw_ctl *ctx,
>         if (!stage_cfg)
>                 goto exit;
>
> +       /*
> +        * For quad pipe case, blend pipes in right side separately. Otherwise,
> +        * all content is on the left half by defaut (no splitting case).
> +        */
> +       if (!right) {

I think the approach to set PIPES_PER_STAGE to 4 is incorrect. It
complicates the code too much. Instead please use two separate
instances, each one representing a single LM pair and corresponding
set of SW pipes. Yes, you'd have to iterate over them manually.
However I think it's also going to make code simpler.

> +               pipe_start = 0;
> +               pipe_end = pipes_per_stage == PIPES_PER_STAGE ? 2 : 1;

pipe_end = pipes_per_stage

> +       } else {
> +               pipe_start = 2;
> +               pipe_end = PIPES_PER_STAGE;

So, the right part always has 2 pipes? What if the
DPU_MIXER_SOURCESPLIT isn't supported?


> +       }
> +
> +       DRM_DEBUG_ATOMIC("blend lm %d on the %s side\n", lm - LM_0,
> +                        right ? "right" : "left");
>         for (i = 0; i <= stages; i++) {
>                 /* overflow to ext register if 'i + 1 > 7' */
>                 mix = (i + 1) & 0x7;
>                 ext = i >= 7;
>                 mix_ext = (i + 1) & 0xf;
>
> -               for (j = 0 ; j < pipes_per_stage; j++) {
> +               for (j = pipe_start; j < pipe_end; j++) {
>                         enum dpu_sspp_multirect_index rect_index =
>                                 stage_cfg->multirect_index[i][j];
>                         enum dpu_sspp pipe = stage_cfg->stage[i][j];
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.h
> index 557ec9a924f81..2dac7885fc5e7 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.h
> @@ -25,6 +25,8 @@ struct dpu_hw_ctl;
>  /**
>   * struct dpu_hw_stage_cfg - blending stage cfg
>   * @stage : SSPP_ID at each stage
> + *          The first 2 in PIPES_PER_STAGE(4) are for the first SSPP.
> + *          The 3rd/4th in PIPES_PER_STAGE(4) are for the 2nd SSPP.
>   * @multirect_index: index of the rectangle of SSPP.
>   */
>  struct dpu_hw_stage_cfg {
> @@ -243,7 +245,7 @@ struct dpu_hw_ctl_ops {
>          * @cfg       : blend stage configuration
>          */
>         void (*setup_blendstage)(struct dpu_hw_ctl *ctx,
> -               enum dpu_lm lm, struct dpu_hw_stage_cfg *cfg);
> +               enum dpu_lm lm, struct dpu_hw_stage_cfg *cfg, bool right);
>
>         void (*set_active_pipes)(struct dpu_hw_ctl *ctx,
>                 unsigned long *fetch_active);
>
> --
> 2.34.1
>


--
With best wishes
Dmitry
