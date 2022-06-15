Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 958A054D40A
	for <lists+dri-devel@lfdr.de>; Wed, 15 Jun 2022 23:59:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 490241138D9;
	Wed, 15 Jun 2022 21:59:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qv1-xf2b.google.com (mail-qv1-xf2b.google.com
 [IPv6:2607:f8b0:4864:20::f2b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D43091138D7
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Jun 2022 21:59:13 +0000 (UTC)
Received: by mail-qv1-xf2b.google.com with SMTP id i19so10275642qvu.13
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Jun 2022 14:59:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=AjtCcr1otywJJft7QhHhYY4k1NkowkQRAMqif6cFR4I=;
 b=tFmMq9hUlun2Ubw7g3fgSKXkRIhjvl2VCtNoR0h6ONzY32x/1Ac7FGiDD/B6/E4g+5
 0E/qzz8+cr9wkieuQseJ+ECH1JVFkUclk+nsAa7hQStdKrUEwISC9i4NJ8EaDGvSjyG/
 dxcPfNHEeMkFmV5+74orgeDc6aQeAqel2gpqJKLXw16eYM3UKHyAd3y/vZtXpO61UMbs
 uGPZB75PMuhOk/dO0HhDTemzm217au2v/G3n6YlgAMCNMdBvrfiwmxf6Esk6EE1KHL4w
 xe+Z5IFiJiDYDL68ERXK+yqE1Rz9DH0Kb3IdxrFEvsCeBQVJMviwP+ociuayU/AzCBM/
 JFPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=AjtCcr1otywJJft7QhHhYY4k1NkowkQRAMqif6cFR4I=;
 b=fiJCnQvWJ8IE/xggMbVbyRdVB+WMbKseAbNhvcniuwTrDqFE+Nkn4VFl/KEKOj6rj3
 uV/WWXieIpqrGvrBTFIWwtrITyU6RKUe/yPFRZtABSvYN0R2WfEMK2Wpusy+2CF1Xg1i
 v68t8nV1OXVzMRuxH8GQNuhfKCvxSN0boiFgljf49gkXPyaebQZ5XxDxhY4sWaz5C2Pc
 lufeM/7r2ZTC4vjT8JP2/+IZYDHYWmtJtFFa+7NRPQKh7MIauU1yJKwggS6X7bACdC1Z
 Huo/mjGcZFte00Gn/9VnWHYvc2EuGQGkF5LYLL0tQ8XJf+KDMIA2HvMObgTOCICIT90R
 sS+Q==
X-Gm-Message-State: AJIora/c3zcEJB61YEbQ9EzcIcMcRzQSMTxCxhsBPVOkPeOzrjCuhUEO
 okJ5x0FK1umt66PVZ/e9cUd9EOY5TI2f+BYXhukV5w==
X-Google-Smtp-Source: AGRyM1sIm8Ml4jI9orl5uYN0vCBzM+ah83e3Yffmsx/SZYX8fvriqmwQV4EKxUYhWlB4nX89Bgh15cl/50Jy8N2mg1c=
X-Received: by 2002:a05:622a:34a:b0:304:f25a:ecf0 with SMTP id
 r10-20020a05622a034a00b00304f25aecf0mr1551754qtw.62.1655330352789; Wed, 15
 Jun 2022 14:59:12 -0700 (PDT)
MIME-Version: 1.0
References: <1655328122-23619-1-git-send-email-quic_abhinavk@quicinc.com>
In-Reply-To: <1655328122-23619-1-git-send-email-quic_abhinavk@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Thu, 16 Jun 2022 00:59:01 +0300
Message-ID: <CAA8EJpp80=-uwXVQhkgGq6-nXw17Lv-5fRg0kuZOAQENcDmVrw@mail.gmail.com>
Subject: Re: [PATCH v2 1/3] drm/msm/dpu: move intf and wb assignment to
 dpu_encoder_setup_display()
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
Cc: markyacoub@chromium.org, dri-devel@lists.freedesktop.org,
 swboyd@chromium.org, seanpaul@chromium.org, quic_jesszhan@quicinc.com,
 quic_aravindh@quicinc.com, freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, 16 Jun 2022 at 00:22, Abhinav Kumar <quic_abhinavk@quicinc.com> wrote:
>
> intf and wb resources are not dependent on the rm global
> state so need not be allocated during dpu_encoder_virt_atomic_mode_set().
>
> Move the allocation of intf and wb resources to dpu_encoder_setup_display()
> so that we can utilize the hw caps even during atomic_check() phase.
>
> Since dpu_encoder_setup_display() already has protection against
> setting invalid intf_idx and wb_idx, these checks can now
> be dropped as well.
>
> changes in v2:
>         - add phys->hw_intf and phys->hw_wb checks back
>
> Fixes: e02a559a720f ("make changes to dpu_encoder to support virtual encoder")
> Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

> ---
>  drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c | 36 ++++++++++++++---------------
>  1 file changed, 18 insertions(+), 18 deletions(-)
>
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> index 3a462e327e0e..3be73211d631 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> @@ -1048,24 +1048,6 @@ static void dpu_encoder_virt_atomic_mode_set(struct drm_encoder *drm_enc,
>                 phys->hw_pp = dpu_enc->hw_pp[i];
>                 phys->hw_ctl = to_dpu_hw_ctl(hw_ctl[i]);
>
> -               if (phys->intf_idx >= INTF_0 && phys->intf_idx < INTF_MAX)
> -                       phys->hw_intf = dpu_rm_get_intf(&dpu_kms->rm, phys->intf_idx);
> -
> -               if (phys->wb_idx >= WB_0 && phys->wb_idx < WB_MAX)
> -                       phys->hw_wb = dpu_rm_get_wb(&dpu_kms->rm, phys->wb_idx);
> -
> -               if (!phys->hw_intf && !phys->hw_wb) {
> -                       DPU_ERROR_ENC(dpu_enc,
> -                                     "no intf or wb block assigned at idx: %d\n", i);
> -                       return;
> -               }
> -
> -               if (phys->hw_intf && phys->hw_wb) {
> -                       DPU_ERROR_ENC(dpu_enc,
> -                                       "invalid phys both intf and wb block at idx: %d\n", i);
> -                       return;
> -               }
> -
>                 phys->cached_mode = crtc_state->adjusted_mode;
>                 if (phys->ops.atomic_mode_set)
>                         phys->ops.atomic_mode_set(phys, crtc_state, conn_state);
> @@ -2293,7 +2275,25 @@ static int dpu_encoder_setup_display(struct dpu_encoder_virt *dpu_enc,
>                 struct dpu_encoder_phys *phys = dpu_enc->phys_encs[i];
>                 atomic_set(&phys->vsync_cnt, 0);
>                 atomic_set(&phys->underrun_cnt, 0);
> +
> +               if (phys->intf_idx >= INTF_0 && phys->intf_idx < INTF_MAX)
> +                       phys->hw_intf = dpu_rm_get_intf(&dpu_kms->rm, phys->intf_idx);
> +
> +               if (phys->wb_idx >= WB_0 && phys->wb_idx < WB_MAX)
> +                       phys->hw_wb = dpu_rm_get_wb(&dpu_kms->rm, phys->wb_idx);
> +
> +               if (!phys->hw_intf && !phys->hw_wb) {
> +                       DPU_ERROR_ENC(dpu_enc, "no intf or wb block assigned at idx: %d\n", i);
> +                       ret = -EINVAL;
> +               }
> +
> +               if (phys->hw_intf && phys->hw_wb) {
> +                       DPU_ERROR_ENC(dpu_enc,
> +                                       "invalid phys both intf and wb block at idx: %d\n", i);
> +                       ret = -EINVAL;
> +               }
>         }
> +
>         mutex_unlock(&dpu_enc->enc_lock);
>
>         return ret;
> --
> 2.7.4
>


-- 
With best wishes
Dmitry
