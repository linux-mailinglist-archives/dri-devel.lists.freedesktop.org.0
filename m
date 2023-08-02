Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 51FDB76D6C9
	for <lists+dri-devel@lfdr.de>; Wed,  2 Aug 2023 20:22:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 12D1510E55F;
	Wed,  2 Aug 2023 18:22:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-xb32.google.com (mail-yb1-xb32.google.com
 [IPv6:2607:f8b0:4864:20::b32])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9FCB010E0E0
 for <dri-devel@lists.freedesktop.org>; Wed,  2 Aug 2023 18:22:44 +0000 (UTC)
Received: by mail-yb1-xb32.google.com with SMTP id
 3f1490d57ef6-ca4a6e11f55so102227276.1
 for <dri-devel@lists.freedesktop.org>; Wed, 02 Aug 2023 11:22:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1691000564; x=1691605364;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=Ae5epmyMSgwEaKPoiZdDHz+XlPWQsao3AH8Jqs9WmdU=;
 b=UuqXKQfOGoWGMgGrhbzQ7Wa0/vXE/PUmfIVrIYA9KkQvmIFU/S5Eo9JvSfi0pm11uu
 VyHZup/WLbdqVsF0nfd5Ho2XcMC+1tlM9ssgHC0FQstbia3K70xkAzuV0SNyAs/DzKQt
 kmlPg8Sb+MSfYIwSBqS3H8dPFn3WYFmE0eDMVeA/EnYkoHXGoRFnz+uEx1Gy3qGQbnoV
 9l3MOYYUM9CXOZ9KjIy57KCeno+2RambOPlV02yrJSN29vjf62d/1peDAzGVb+FaLOh9
 ZKdDM8oRS70Ri/LQHtPVXCmXMm/a4NihlVaTAPODCRZYzceXEGpapsv7QZnsHaK1PhM8
 IudA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1691000564; x=1691605364;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Ae5epmyMSgwEaKPoiZdDHz+XlPWQsao3AH8Jqs9WmdU=;
 b=grimwh5qxrBfUiCcq7ASHEp6UkaPyIdZ3nAruwWnUEkFvQZjIfdtfwrrCQdXfQCyCy
 luyGlAizHsJngrJtqMGfyJ4+Txcq+StrvawmwZXKgPyA5SspG8igCXcIwY/XKk3TT/EZ
 GJVo9+qRDE9s0dxaFGPWwOmnSE2EukRoBs0alf88qzJvZ3riEoFnuoLHJxhT89oi4o66
 K5gk19S+YnjZPQwxrYwedrTo/XcWdhvCldiniHTJ2XYq2s+ncjHrOZNjUQ480EWcLsdc
 kEd5dINgdvymEBa0nrmcxiKhK4eB8ozNRaVe/NKYxgWUauv1lU+L/eD2e566MtkctI3q
 xVbQ==
X-Gm-Message-State: ABy/qLYocejWYSkoEQBx+9DKpDCBAs+PKkxpkuwraDX8MuwFe4O4pZrl
 uSlQ9c0piOMj3YdnWggUchiTsVC5uAswiA8MynpCpQ==
X-Google-Smtp-Source: APBJJlGZ6j6qKs+9G6d2w79KwHIPTThBY36/+BubF52WqifMDyo3N6LxG7I0oOMtg4goYv9jDrIm2vRKw2e81Yj1nck=
X-Received: by 2002:a25:5542:0:b0:c12:29ac:1d3b with SMTP id
 j63-20020a255542000000b00c1229ac1d3bmr13193825ybb.11.1691000563690; Wed, 02
 Aug 2023 11:22:43 -0700 (PDT)
MIME-Version: 1.0
References: <20230802-add-widebus-support-v3-0-2661706be001@quicinc.com>
 <20230802-add-widebus-support-v3-1-2661706be001@quicinc.com>
In-Reply-To: <20230802-add-widebus-support-v3-1-2661706be001@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Wed, 2 Aug 2023 21:22:32 +0300
Message-ID: <CAA8EJpogs_AsU5CG22m+azdGvDdyDuJE+89n67EoBxmoFtTsWQ@mail.gmail.com>
Subject: Re: [PATCH v3 1/4] drm/msm/dpu: Move DPU encoder wide_bus_en setting
To: Jessica Zhang <quic_jesszhan@quicinc.com>
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
Cc: freedreno@lists.freedesktop.org, quic_abhinavk@quicinc.com,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, Marijn Suijten <marijn.suijten@somainline.org>,
 Sean Paul <sean@poorly.run>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, 2 Aug 2023 at 21:09, Jessica Zhang <quic_jesszhan@quicinc.com> wrote:
>
> Move the setting of dpu_enc.wide_bus_en to
> dpu_encoder_virt_atomic_enable() so that it mirrors the setting of
> dpu_enc.dsc.

because ... ?

>
> Signed-off-by: Jessica Zhang <quic_jesszhan@quicinc.com>
> ---
>  drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c | 11 +++++++----
>  1 file changed, 7 insertions(+), 4 deletions(-)

Other than the commit message:

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

>
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> index d34e684a4178..3dcd37c48aac 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> @@ -1194,11 +1194,18 @@ static void dpu_encoder_virt_atomic_enable(struct drm_encoder *drm_enc,
>         struct dpu_encoder_virt *dpu_enc = NULL;
>         int ret = 0;
>         struct drm_display_mode *cur_mode = NULL;
> +       struct msm_drm_private *priv = drm_enc->dev->dev_private;
> +       struct msm_display_info *disp_info;
>
>         dpu_enc = to_dpu_encoder_virt(drm_enc);
> +       disp_info = &dpu_enc->disp_info;
>
>         dpu_enc->dsc = dpu_encoder_get_dsc_config(drm_enc);
>
> +       if (disp_info->intf_type == INTF_DP)
> +               dpu_enc->wide_bus_en = msm_dp_wide_bus_available(
> +                               priv->dp[disp_info->h_tile_instance[0]]);
> +
>         mutex_lock(&dpu_enc->enc_lock);
>         cur_mode = &dpu_enc->base.crtc->state->adjusted_mode;
>
> @@ -2383,10 +2390,6 @@ struct drm_encoder *dpu_encoder_init(struct drm_device *dev,
>         timer_setup(&dpu_enc->frame_done_timer,
>                         dpu_encoder_frame_done_timeout, 0);
>
> -       if (disp_info->intf_type == INTF_DP)
> -               dpu_enc->wide_bus_en = msm_dp_wide_bus_available(
> -                               priv->dp[disp_info->h_tile_instance[0]]);
> -
>         INIT_DELAYED_WORK(&dpu_enc->delayed_off_work,
>                         dpu_encoder_off_work);
>         dpu_enc->idle_timeout = IDLE_TIMEOUT;
>
> --
> 2.41.0
>


-- 
With best wishes
Dmitry
