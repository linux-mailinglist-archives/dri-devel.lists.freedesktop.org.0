Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B40AB4B3152
	for <lists+dri-devel@lfdr.de>; Sat, 12 Feb 2022 00:36:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9E48410EB4E;
	Fri, 11 Feb 2022 23:36:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-x82a.google.com (mail-qt1-x82a.google.com
 [IPv6:2607:f8b0:4864:20::82a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9C21010EB33
 for <dri-devel@lists.freedesktop.org>; Fri, 11 Feb 2022 23:36:41 +0000 (UTC)
Received: by mail-qt1-x82a.google.com with SMTP id j12so10492542qtr.2
 for <dri-devel@lists.freedesktop.org>; Fri, 11 Feb 2022 15:36:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=WG5k+B0lV7CrUABwtgvGajHugojxli7tl5EUiLu8xiE=;
 b=R7hlMWRg+u9ThSNZUL3M/YEQMJzhczNKB+HVPESg5hccrwxBZKMtlgaOMTHEyz0A2y
 tUipd1LkkMJB4R3psAnybe0qse2XjZoW2wIYyt30LezMDYfmDjaqKXzpXU8QPO7K8PHk
 9EnnzKX+42iRyjSgE+ieJS4VKMCRRMBuHww63c+GPd5FnOzLJBohYLlPTBz4U88+8WJD
 CZnFzjbDL1uE7gNj+24JRT+ZY1wmvr9ijsO6RUkYZ7s5L3XH8a8Meh7FRArwooiLfy0c
 eRQB8ABRwcDFDb/k2d1EWFwMZ1QgTWH0Awt9yybhh4DckyAp7whozI6cGq4bmxr0FOQe
 cAVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=WG5k+B0lV7CrUABwtgvGajHugojxli7tl5EUiLu8xiE=;
 b=u6Yadc+aarkRo/d7mYlt2ddVklxSdz0Ij+S3lMOnuhndA5xvf5xcwHiY8k74p1bjM6
 3g2KyeFBeaJakS2gPnWbogjejRp+4TC8gC3RjASISjFcs0+FLmR+N6tUtN27EYKvnUMK
 9Q4/qtSIq5tcFRrpHu1FEa3Z6BWPlnum/L1jYRFUrKOtOft0wUW5eYOO2aoyz02X1+Dc
 tyqmuPXGyKqHnw9P90icyu6VyFOKRJzZwFtdubtwvQfAu5qtuMAWaHa9SFwGqCCGruCj
 HyB1e1c+l0/VKuobG+5icZkGeSB24Ha/Ur1tkUvew1LfIbotrfVS8kkzq0GIf20/IT4u
 XbjQ==
X-Gm-Message-State: AOAM531hYESaTYgZN0qYTka6j/hWuCgBvbMp/yIZn8gYgX9TZDhQV27S
 orlVOaY8ic+v1mAjfju+lGMEWaViCXmDIlaMJl9x+A==
X-Google-Smtp-Source: ABdhPJy0rWyAoEGABnzg5qLa2bkeCwPpRw+TfpLVlWFJzB30Cfw9FysHKCmhO9MfpXGQaW9H2tlyvbC+7X2oDYdaOF8=
X-Received: by 2002:a05:622a:4d:: with SMTP id
 y13mr2941923qtw.629.1644622600592; 
 Fri, 11 Feb 2022 15:36:40 -0800 (PST)
MIME-Version: 1.0
References: <1644621822-25407-1-git-send-email-quic_khsieh@quicinc.com>
In-Reply-To: <1644621822-25407-1-git-send-email-quic_khsieh@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Sat, 12 Feb 2022 02:36:29 +0300
Message-ID: <CAA8EJpqwAxDa142B_N6NA7KkQ6WuuG_Ma7No5SXEpJdBmgKvXQ@mail.gmail.com>
Subject: Re: [PATCH] drm/msm: populate intf_audio_select() base on hardware
 capability
To: Kuogee Hsieh <quic_khsieh@quicinc.com>
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
Cc: quic_abhinavk@quicinc.com, airlied@linux.ie,
 freedreno@lists.freedesktop.org, vkoul@kernel.org,
 dri-devel@lists.freedesktop.org, swboyd@chromium.org, agross@kernel.org,
 linux-arm-msm@vger.kernel.org, quic_aravindh@quicinc.com,
 bjorn.andersson@linaro.org, sean@poorly.run, linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sat, 12 Feb 2022 at 02:23, Kuogee Hsieh <quic_khsieh@quicinc.com> wrote:
>
> intf_audio_select() callback function use to configure
> HDMI_DP_CORE_SELECT to decide audio output routes to HDMI or DP
> interface. HDMI is obsoleted at newer chipset. To keep supporting
> legacy hdmi application, intf_audio_select call back function have
> to be populated base on hardware chip capability where legacy
> chipsets have has_audio_select flag set to true.
>
> Signed-off-by: Kuogee Hsieh <quic_khsieh@quicinc.com>
> ---
>  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c | 2 ++
>  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h | 1 +
>  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_top.c     | 9 ++++++---
>  3 files changed, 9 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
> index 272b14b..23680e7 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
> @@ -201,6 +201,7 @@ static const struct dpu_caps sdm845_dpu_caps = {
>         .has_dim_layer = true,
>         .has_idle_pc = true,
>         .has_3d_merge = true,
> +       .has_audio_select = true,
>         .max_linewidth = DEFAULT_DPU_OUTPUT_LINE_WIDTH,
>         .pixel_ram_size = DEFAULT_PIXEL_RAM_SIZE,
>         .max_hdeci_exp = MAX_HORZ_DECIMATION,
> @@ -229,6 +230,7 @@ static const struct dpu_caps sm8150_dpu_caps = {
>         .has_dim_layer = true,
>         .has_idle_pc = true,
>         .has_3d_merge = true,
> +       .has_audio_select = true,
>         .max_linewidth = 4096,
>         .pixel_ram_size = DEFAULT_PIXEL_RAM_SIZE,
>         .max_hdeci_exp = MAX_HORZ_DECIMATION,
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
> index e5a96d6..b33f91b 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
> @@ -357,6 +357,7 @@ struct dpu_caps {
>         bool has_dim_layer;
>         bool has_idle_pc;
>         bool has_3d_merge;
> +       bool has_audio_select;

I'd suggest adding a bit to dpu_mdp_cfg's features instead, following
the example of other hardware blocks.

>         /* SSPP limits */
>         u32 max_linewidth;
>         u32 pixel_ram_size;
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_top.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_top.c
> index 282e3c6..e608f4d 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_top.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_top.c
> @@ -261,14 +261,17 @@ static void dpu_hw_intf_audio_select(struct dpu_hw_mdp *mdp)
>  }
>
>  static void _setup_mdp_ops(struct dpu_hw_mdp_ops *ops,
> -               unsigned long cap)
> +               unsigned long cap,
> +               const struct dpu_mdss_cfg *m)
>  {
>         ops->setup_split_pipe = dpu_hw_setup_split_pipe;
>         ops->setup_clk_force_ctrl = dpu_hw_setup_clk_force_ctrl;
>         ops->get_danger_status = dpu_hw_get_danger_status;
>         ops->setup_vsync_source = dpu_hw_setup_vsync_source;
>         ops->get_safe_status = dpu_hw_get_safe_status;
> -       ops->intf_audio_select = dpu_hw_intf_audio_select;
> +
> +       if (m->caps->has_audio_select)
> +               ops->intf_audio_select = dpu_hw_intf_audio_select;
>  }
>
>  static const struct dpu_mdp_cfg *_top_offset(enum dpu_mdp mdp,
> @@ -320,7 +323,7 @@ struct dpu_hw_mdp *dpu_hw_mdptop_init(enum dpu_mdp idx,
>          */
>         mdp->idx = idx;
>         mdp->caps = cfg;
> -       _setup_mdp_ops(&mdp->ops, mdp->caps->features);
> +       _setup_mdp_ops(&mdp->ops, mdp->caps->features, m);
>
>         return mdp;
>  }

-- 
With best wishes
Dmitry
