Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FCDE73A856
	for <lists+dri-devel@lfdr.de>; Thu, 22 Jun 2023 20:37:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3D55F10E5A6;
	Thu, 22 Jun 2023 18:36:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-xb33.google.com (mail-yb1-xb33.google.com
 [IPv6:2607:f8b0:4864:20::b33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 23B1B10E5A3
 for <dri-devel@lists.freedesktop.org>; Thu, 22 Jun 2023 18:36:54 +0000 (UTC)
Received: by mail-yb1-xb33.google.com with SMTP id
 3f1490d57ef6-bb3a77abd7bso7234216276.0
 for <dri-devel@lists.freedesktop.org>; Thu, 22 Jun 2023 11:36:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1687459012; x=1690051012;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=//iH0bqfYBmUnbXo+bhKFynz91+0tnyWOGAyZ/SuDLM=;
 b=XxEQ8HCzJO+mzri75WwxEKPiNY5kG2RtruboMfgtewbqveU3SAFFShS6SHTkAdQ1xW
 3xtKe8pQOFCn4CQwLCbiP2kB+frF/fTQH3wKFo+uKJAGTfXdnOrQR95gVd5SyPl9Iu3s
 9o5w6rLAdqOjqvmnGu1PgtA9PCGntvp5TVw0F66JeXWu+UYS957UY1cAaRhxV5svnUNO
 HVt8eilZCZAexRjPolvmh9YvD2Em1lJvJxtBAqx5Ro550DhMUPxzkMa77uby89WPyCh/
 xFMNtwmD4HcfPWImPdxh9+94FrZADDBWaH21odtHYeQujJt42sePDHjPg7QPBvCtlc4L
 MO8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1687459012; x=1690051012;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=//iH0bqfYBmUnbXo+bhKFynz91+0tnyWOGAyZ/SuDLM=;
 b=iob5e4bUh3YL5QSbjK6061WGQkWpTi3KOImAtx3OyP9LNKMdxbcusIH1UUcaFT1GCy
 t+wKbEXLIWm5kuq8XJ8MsxGXjEUJQaqz59LItMKkskBPfxGO2njc13/6YVuetXGdVD5k
 usYkDtcO0hoFS2teNwFAqaq+TFf6Rc3Y0iABLCj2+4J9m6I1RfnR75h3LGWZxRQSCc23
 Np02HJ27FihoDpqKYtqH64KvdWMZqT6TdZLAWPvyarqnvBBCO9CkcWpt7T7/1nvDtpYy
 ORdhTsJbq2K8UG0c951FgEJSgSOBHdiyu0Vu9upfTknholiVVXgSSehzBLqBV94dclSG
 3O5g==
X-Gm-Message-State: AC+VfDxzs8JCKUmgCv88oDdRU6o9B6Rp/88he+vq9MgwqUvuRvIkevbe
 0xSgm3D5T2HCBkfeMh1R6REMSjpycLoxXvThTMZkIQ==
X-Google-Smtp-Source: ACHHUZ5HNiMJ1Au5OefxiYLzEEMpQCofd1JWFFf+nN3NSuiVIJTfvj/ZBGvWRBMTkqryEHgFWcKy+KeXN9K8zkMQUZY=
X-Received: by 2002:a25:7dc1:0:b0:c01:2f64:27ec with SMTP id
 y184-20020a257dc1000000b00c012f6427ecmr2910620ybc.21.1687459012553; Thu, 22
 Jun 2023 11:36:52 -0700 (PDT)
MIME-Version: 1.0
References: <1687454686-10340-1-git-send-email-quic_khsieh@quicinc.com>
 <1687454686-10340-2-git-send-email-quic_khsieh@quicinc.com>
In-Reply-To: <1687454686-10340-2-git-send-email-quic_khsieh@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Thu, 22 Jun 2023 21:36:41 +0300
Message-ID: <CAA8EJpoc+4Hx221Zf0i8yhRxFQ9BhgZ5H5QQ5EvwpAarXFu8Gg@mail.gmail.com>
Subject: Re: [PATCH v5 1/2] drm/msm/dpu: retrieve DSI DSC struct through
 priv->dsi[0]
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
Cc: freedreno@lists.freedesktop.org, quic_sbillaka@quicinc.com,
 linux-kernel@vger.kernel.org, quic_abhinavk@quicinc.com, andersson@kernel.org,
 dri-devel@lists.freedesktop.org, dianders@chromium.org, vkoul@kernel.org,
 agross@kernel.org, marijn.suijten@somainline.org, quic_jesszhan@quicinc.com,
 swboyd@chromium.org, sean@poorly.run, linux-arm-msm@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, 22 Jun 2023 at 20:25, Kuogee Hsieh <quic_khsieh@quicinc.com> wrote:
>
> Currently struct drm_dsc_config for DSI is populated at display
> setup during system boot up. This mechanism works fine with
> embedded display but not for pluggable displays as the
> struct drm_dsc_config will become stale once external display
> is unplugged.
>

Nit: "In preparation of adding support for DP DSC..."

If you don't mind, I'll append this phrase while applying the patch.

> Move storing of DSI DSC struct to atomic_enable() so that same
> mechanism will work for both embedded display and pluggable
> displays.
>
> Changes in v4:
> -- fix checkpatch.pl warning
>
> Changes in v5:
> -- delete dpu_encoder_get_dsc_config() from atomic_mode_set

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

>
> Signed-off-by: Kuogee Hsieh <quic_khsieh@quicinc.com>
> ---
>  drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c | 42 ++++++++++++++++++++---------
>  1 file changed, 30 insertions(+), 12 deletions(-)
>
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> index 2e1873d..edc559d 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> @@ -543,11 +543,24 @@ bool dpu_encoder_use_dsc_merge(struct drm_encoder *drm_enc)
>         return (num_dsc > 0) && (num_dsc > intf_count);
>  }
>
> +static struct drm_dsc_config *dpu_encoder_get_dsc_config(struct drm_encoder *drm_enc)
> +{
> +       struct msm_drm_private *priv = drm_enc->dev->dev_private;
> +       struct dpu_encoder_virt *dpu_enc = to_dpu_encoder_virt(drm_enc);
> +       int index = dpu_enc->disp_info.h_tile_instance[0];
> +
> +       if (dpu_enc->disp_info.intf_type == INTF_DSI)
> +               return msm_dsi_get_dsc_config(priv->dsi[index]);
> +
> +       return NULL;
> +}
> +
>  static struct msm_display_topology dpu_encoder_get_topology(
>                         struct dpu_encoder_virt *dpu_enc,
>                         struct dpu_kms *dpu_kms,
>                         struct drm_display_mode *mode,
> -                       struct drm_crtc_state *crtc_state)
> +                       struct drm_crtc_state *crtc_state,
> +                       struct drm_dsc_config *dsc)
>  {
>         struct msm_display_topology topology = {0};
>         int i, intf_count = 0;
> @@ -579,7 +592,7 @@ static struct msm_display_topology dpu_encoder_get_topology(
>
>         topology.num_intf = intf_count;
>
> -       if (dpu_enc->dsc) {
> +       if (dsc) {
>                 /*
>                  * In case of Display Stream Compression (DSC), we would use
>                  * 2 DSC encoders, 2 layer mixers and 1 interface
> @@ -605,6 +618,7 @@ static int dpu_encoder_virt_atomic_check(
>         struct drm_display_mode *adj_mode;
>         struct msm_display_topology topology;
>         struct dpu_global_state *global_state;
> +       struct drm_dsc_config *dsc;
>         int i = 0;
>         int ret = 0;
>
> @@ -640,7 +654,9 @@ static int dpu_encoder_virt_atomic_check(
>                 }
>         }
>
> -       topology = dpu_encoder_get_topology(dpu_enc, dpu_kms, adj_mode, crtc_state);
> +       dsc = dpu_encoder_get_dsc_config(drm_enc);
> +
> +       topology = dpu_encoder_get_topology(dpu_enc, dpu_kms, adj_mode, crtc_state, dsc);
>
>         /*
>          * Release and Allocate resources on every modeset
> @@ -1072,14 +1088,12 @@ static void dpu_encoder_virt_atomic_mode_set(struct drm_encoder *drm_enc,
>                 dpu_enc->hw_pp[i] = i < num_pp ? to_dpu_hw_pingpong(hw_pp[i])
>                                                 : NULL;
>
> -       if (dpu_enc->dsc) {
> -               num_dsc = dpu_rm_get_assigned_resources(&dpu_kms->rm, global_state,
> -                                                       drm_enc->base.id, DPU_HW_BLK_DSC,
> -                                                       hw_dsc, ARRAY_SIZE(hw_dsc));
> -               for (i = 0; i < num_dsc; i++) {
> -                       dpu_enc->hw_dsc[i] = to_dpu_hw_dsc(hw_dsc[i]);
> -                       dsc_mask |= BIT(dpu_enc->hw_dsc[i]->idx - DSC_0);
> -               }
> +       num_dsc = dpu_rm_get_assigned_resources(&dpu_kms->rm, global_state,
> +                                               drm_enc->base.id, DPU_HW_BLK_DSC,
> +                                               hw_dsc, ARRAY_SIZE(hw_dsc));
> +       for (i = 0; i < num_dsc; i++) {
> +               dpu_enc->hw_dsc[i] = to_dpu_hw_dsc(hw_dsc[i]);
> +               dsc_mask |= BIT(dpu_enc->hw_dsc[i]->idx - DSC_0);
>         }
>
>         dpu_enc->dsc_mask = dsc_mask;
> @@ -1187,6 +1201,8 @@ static void dpu_encoder_virt_atomic_enable(struct drm_encoder *drm_enc,
>
>         dpu_enc = to_dpu_encoder_virt(drm_enc);
>
> +       dpu_enc->dsc = dpu_encoder_get_dsc_config(drm_enc);
> +
>         mutex_lock(&dpu_enc->enc_lock);
>         cur_mode = &dpu_enc->base.crtc->state->adjusted_mode;
>
> @@ -2109,8 +2125,10 @@ void dpu_encoder_helper_phys_cleanup(struct dpu_encoder_phys *phys_enc)
>                                         phys_enc->hw_pp->merge_3d->idx);
>         }
>
> -       if (dpu_enc->dsc)
> +       if (dpu_enc->dsc) {
>                 dpu_encoder_unprep_dsc(dpu_enc);
> +               dpu_enc->dsc = NULL;
> +       }
>
>         intf_cfg.stream_sel = 0; /* Don't care value for video mode */
>         intf_cfg.mode_3d = dpu_encoder_helper_get_3d_blend_mode(phys_enc);
> --
> 2.7.4
>


-- 
With best wishes
Dmitry
