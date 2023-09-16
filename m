Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FBD17A2CDC
	for <lists+dri-devel@lfdr.de>; Sat, 16 Sep 2023 03:10:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 99C6910E6B9;
	Sat, 16 Sep 2023 01:10:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x32e.google.com (mail-ot1-x32e.google.com
 [IPv6:2607:f8b0:4864:20::32e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B93FC10E099
 for <dri-devel@lists.freedesktop.org>; Sat, 16 Sep 2023 01:09:59 +0000 (UTC)
Received: by mail-ot1-x32e.google.com with SMTP id
 46e09a7af769-6bd0a0a6766so1715909a34.2
 for <dri-devel@lists.freedesktop.org>; Fri, 15 Sep 2023 18:09:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1694826599; x=1695431399; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=g9WSRgTaw/6et2RmeGdNg8ZMy5I67EliZD9RP5+ifD0=;
 b=iMHpydh6VEg1nDg1zBM61qNxlOGKDUbLaYmdOIFn2ScRSUawEYBdq7t9bnypGizC3x
 5x3wj/Fp9Hsa2B9/HWePtIsX0o3Ihx9I9/YU6x4HBtWwh3GdBzZUaA3iGaf0Kpg567WT
 sCwEaG+rAu9AUyebKQNmeCWd09OnXqHsgWj47bS6L/T62gRHLAEpknRzQ3Il2/0X0qYn
 +XM99pCVs8yzNi7aSfkY7LGmfUqDMDJA/OG4tb+UP7cbNdR9lSKAjzMM6QIiZnLAsLO3
 LBo5Z4zGnqxpRjFg31qutu9Dfl7irUohDoms9IIzNSlgNUUlxXMgnD3K+RhKMlH8kG1R
 jUlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1694826599; x=1695431399;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=g9WSRgTaw/6et2RmeGdNg8ZMy5I67EliZD9RP5+ifD0=;
 b=tUvhTCk4At3ieW0u3yCUBqClOCNjc+BD/Blifx0mqmEopMfQhg9PbTkDdUNZhLV+gA
 OfQQjLHTgml+t1QvQbqjlhokaYy3UROxu6OC876vu1CytjIE821OyZd9YZU5+/ja1nF1
 kbM2fkmFe/64HT98z9Nv45e6keIN+XmgUgi3a7aSpJ+qjD2jec36SaIXZDD85tIQN0j8
 fKaCNCHa0inazSZc8KKbvWKvOC2K6nN7I5Zas9BMpXdFGfXvGtiTycN9JjY9QQJh7M9g
 XbF+xcyrvZA9hBhykjvkSQh5CQ7RMbHvEgb/r+U90xa5Ohjhzx8xj4mmQW+Z/1o/RJBs
 KWZQ==
X-Gm-Message-State: AOJu0YzdwvcWKNwFthl1khMRNqmexbjBN0TA8P/jDx0nkEZ2kbm8AQUQ
 HC2o+ThzRibzngoMBNVykLY4xD1kOCx5W4//ffwRLw==
X-Google-Smtp-Source: AGHT+IGG3Egk3rmGcPDco6agP7soG2wHCQVK3RvI3bQXRv1/5cgN8gQV27Ug0GnSJl1EGWa4AgX6HemkpKSXYIpKq4s=
X-Received: by 2002:a05:6830:2008:b0:6b9:4d79:e08a with SMTP id
 e8-20020a056830200800b006b94d79e08amr3653815otp.32.1694826598950; Fri, 15 Sep
 2023 18:09:58 -0700 (PDT)
MIME-Version: 1.0
References: <1694813901-26952-1-git-send-email-quic_khsieh@quicinc.com>
 <1694813901-26952-6-git-send-email-quic_khsieh@quicinc.com>
In-Reply-To: <1694813901-26952-6-git-send-email-quic_khsieh@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Sat, 16 Sep 2023 04:09:48 +0300
Message-ID: <CAA8EJprKA=H0iFOPKiotqQB-b5r4NYdEDdudzJeDU0qBxMkF_A@mail.gmail.com>
Subject: Re: [PATCH v3 5/7] drm/msm/dp: delete EV_HPD_INIT_SETUP
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

On Sat, 16 Sept 2023 at 00:38, Kuogee Hsieh <quic_khsieh@quicinc.com> wrote:
>
> EV_HPD_INIT_SETUP flag is used to trigger the initialization of external
> DP host controller. Since external DP host controller initialization had
> been incorporated into pm_runtime_resume(), this flag become obsolete.

became

> Lets get rid of it.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

>
> Changes in v3:
> -- drop EV_HPD_INIT_SETUP and msm_dp_irq_postinstall()

This is not a changelog of the patch. It is a short description of the
patch itself. Please describe changes.

>
> Signed-off-by: Kuogee Hsieh <quic_khsieh@quicinc.com>
> ---
>  drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c |  4 ----
>  drivers/gpu/drm/msm/dp/dp_display.c     | 16 ----------------
>  drivers/gpu/drm/msm/msm_drv.h           |  5 -----
>  3 files changed, 25 deletions(-)
>
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
> index aa8499d..71d0670 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
> @@ -870,7 +870,6 @@ static int dpu_irq_postinstall(struct msm_kms *kms)
>  {
>         struct msm_drm_private *priv;
>         struct dpu_kms *dpu_kms = to_dpu_kms(kms);
> -       int i;
>
>         if (!dpu_kms || !dpu_kms->dev)
>                 return -EINVAL;
> @@ -879,9 +878,6 @@ static int dpu_irq_postinstall(struct msm_kms *kms)
>         if (!priv)
>                 return -EINVAL;
>
> -       for (i = 0; i < ARRAY_SIZE(priv->dp); i++)
> -               msm_dp_irq_postinstall(priv->dp[i]);
> -
>         return 0;
>  }
>
> diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
> index e7af7f7..b6992202 100644
> --- a/drivers/gpu/drm/msm/dp/dp_display.c
> +++ b/drivers/gpu/drm/msm/dp/dp_display.c
> @@ -55,7 +55,6 @@ enum {
>  enum {
>         EV_NO_EVENT,
>         /* hpd events */
> -       EV_HPD_INIT_SETUP,
>         EV_HPD_PLUG_INT,
>         EV_IRQ_HPD_INT,
>         EV_HPD_UNPLUG_INT,
> @@ -1092,8 +1091,6 @@ static int hpd_event_thread(void *data)
>                 spin_unlock_irqrestore(&dp_priv->event_lock, flag);
>
>                 switch (todo->event_id) {
> -               case EV_HPD_INIT_SETUP:
> -                       break;
>                 case EV_HPD_PLUG_INT:
>                         dp_hpd_plug_handle(dp_priv, todo->data);
>                         break;
> @@ -1469,19 +1466,6 @@ void __exit msm_dp_unregister(void)
>         platform_driver_unregister(&dp_display_driver);
>  }
>
> -void msm_dp_irq_postinstall(struct msm_dp *dp_display)
> -{
> -       struct dp_display_private *dp;
> -
> -       if (!dp_display)
> -               return;
> -
> -       dp = container_of(dp_display, struct dp_display_private, dp_display);
> -
> -       if (!dp_display->is_edp)
> -               dp_add_event(dp, EV_HPD_INIT_SETUP, 0, 0);
> -}
> -
>  bool msm_dp_wide_bus_available(const struct msm_dp *dp_display)
>  {
>         struct dp_display_private *dp;
> diff --git a/drivers/gpu/drm/msm/msm_drv.h b/drivers/gpu/drm/msm/msm_drv.h
> index e13a8cb..ff8be59 100644
> --- a/drivers/gpu/drm/msm/msm_drv.h
> +++ b/drivers/gpu/drm/msm/msm_drv.h
> @@ -381,7 +381,6 @@ int __init msm_dp_register(void);
>  void __exit msm_dp_unregister(void);
>  int msm_dp_modeset_init(struct msm_dp *dp_display, struct drm_device *dev,
>                          struct drm_encoder *encoder);
> -void msm_dp_irq_postinstall(struct msm_dp *dp_display);
>  void msm_dp_snapshot(struct msm_disp_state *disp_state, struct msm_dp *dp_display);
>
>  void msm_dp_debugfs_init(struct msm_dp *dp_display, struct drm_minor *minor);
> @@ -402,10 +401,6 @@ static inline int msm_dp_modeset_init(struct msm_dp *dp_display,
>         return -EINVAL;
>  }
>
> -static inline void msm_dp_irq_postinstall(struct msm_dp *dp_display)
> -{
> -}
> -
>  static inline void msm_dp_snapshot(struct msm_disp_state *disp_state, struct msm_dp *dp_display)
>  {
>  }
> --
> 2.7.4
>


-- 
With best wishes
Dmitry
