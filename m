Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 31365503059
	for <lists+dri-devel@lfdr.de>; Sat, 16 Apr 2022 00:48:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6BA7A10E513;
	Fri, 15 Apr 2022 22:48:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-xb2b.google.com (mail-yb1-xb2b.google.com
 [IPv6:2607:f8b0:4864:20::b2b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D8D6D10E4B8
 for <dri-devel@lists.freedesktop.org>; Fri, 15 Apr 2022 22:48:48 +0000 (UTC)
Received: by mail-yb1-xb2b.google.com with SMTP id h8so16491261ybj.11
 for <dri-devel@lists.freedesktop.org>; Fri, 15 Apr 2022 15:48:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=93U8ho5CNe8T3TwcdmIxh7irOznkUUYITrccD9se7hc=;
 b=fujbsq108mCJ4CEvEI+/sw+IxHDqjWSMACLBxQL5zEtwsLlVK3ex5NZ0rqU2Hj5JAD
 QHwVwF//b8zB/c9U6hdcuZI61pluPDtYFowtO4FHY2Os0ItQGCSu0ugFzuV0rOmRrq/w
 lX9QMkRLnTR8mGBAMdZMsl/7m1KTQqogI+dRzprhdPRc6zIONdySqqgbfkVVqSqWpfhf
 8ZMFoOzu+JCGExdndm3/Ut89GQYlLSrvA++dF7kQruMi+yaHgLZUDJVOYn9zBSZJtlcP
 wBqwRVwYWjH3AO40JPjCCJRFdHwJ2viGCXgCVoCJyEQNDRel7mprSfrLjvrKadgZWWnP
 V9qQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=93U8ho5CNe8T3TwcdmIxh7irOznkUUYITrccD9se7hc=;
 b=L3rE86mEpbXNxygxmTn8BdLNugp5q1SSLYFvIzrdFVymOvXQzJE/4wACBaqnkzjdE2
 V27w7otHse8scoTo9+Bn+lRSRvSaleAXb/JYxuIQSAzFWT3RbFT8PomMtZJNjKZFN5F5
 H0egBEJ6AMWew3NcTkqIhEGNC8uf4VVUgaf9RWxTi0iQUl2ksAYaXMTyP28oDwFzM92l
 E6PXowjj89Yf4Oe09M4ODGhCC2HE3Q0mHJ0RXrwn4ZDWmLwbY+5RWGsJILgq9bITZNFH
 digCE4LLZRN0HQ1+D9qS21vj6ZOnSEo2uy8vbaCqdi5yyakwKfPPbSpX5jGwVI2qHmfy
 wH0Q==
X-Gm-Message-State: AOAM530F8XcTqLlV/UxEG9N/fBj+KfL2ZuEJjYUyT4YcW0QUjXIyYeem
 sdbvtsnkE2yngH5iIwWz2/IAyJ92FgMje0ePtQvk4g==
X-Google-Smtp-Source: ABdhPJweAxA2cp8gaTI9ovM+9bX7ZX/we2gaFQkBhOySPElm3zATqr97ZTaEZ+8RoHFODuzJcgFwQldF6HVksEMCRL0=
X-Received: by 2002:a25:d507:0:b0:63d:a541:1a8c with SMTP id
 r7-20020a25d507000000b0063da5411a8cmr1273646ybe.92.1650062928046; Fri, 15 Apr
 2022 15:48:48 -0700 (PDT)
MIME-Version: 1.0
References: <1650062064-11838-1-git-send-email-quic_khsieh@quicinc.com>
In-Reply-To: <1650062064-11838-1-git-send-email-quic_khsieh@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Sat, 16 Apr 2022 01:48:37 +0300
Message-ID: <CAA8EJpopw4rh0ZkFd5F4zHVJQw6GUNq=+HKVycOx0bXd5OWizQ@mail.gmail.com>
Subject: Re: [PATCH v7] drm/msm/dp: stop event kernel thread when DP unbind
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
Cc: quic_sbillaka@quicinc.com, quic_abhinavk@quicinc.com, airlied@linux.ie,
 freedreno@lists.freedesktop.org, vkoul@kernel.org,
 dri-devel@lists.freedesktop.org, swboyd@chromium.org, agross@kernel.org,
 linux-arm-msm@vger.kernel.org, quic_aravindh@quicinc.com,
 bjorn.andersson@linaro.org, sean@poorly.run, linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sat, 16 Apr 2022 at 01:34, Kuogee Hsieh <quic_khsieh@quicinc.com> wrote:
>
> Current DP driver implementation, event thread is kept running
> after DP display is unbind. This patch fix this problem by disabling
> DP irq and stop event thread to exit gracefully at dp_display_unbind().
>
> Changes in v2:
> -- start event thread at dp_display_bind()
>
> Changes in v3:
> -- disable all HDP interrupts at unbind
> -- replace dp_hpd_event_setup() with dp_hpd_event_thread_start()
> -- replace dp_hpd_event_stop() with dp_hpd_event_thread_stop()
> -- move init_waitqueue_head(&dp->event_q) to probe()
> -- move spin_lock_init(&dp->event_lock) to probe()
>
> Changes in v4:
> -- relocate both dp_display_bind() and dp_display_unbind() to bottom of file
>
> Changes in v5:
> -- cancel relocation of both dp_display_bind() and dp_display_unbind()
>
> Changes in v6:
> -- move empty event q to dp_event_thread_start()
>
> Changes in v7:
> -- call ktheread_stop() directly instead of dp_hpd_event_thread_stop() function
>
> Fixes: e91e3065a806 ("drm/msm/dp: Add DP compliance tests on Snapdragon Chipsets")
> Signed-off-by: Kuogee Hsieh <quic_khsieh@quicinc.com>
> Reported-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> Reviewed-by: Stephen Boyd <swboyd@chromium.org>
> ---
>  drivers/gpu/drm/msm/dp/dp_display.c | 31 ++++++++++++++++++++++++-------
>  1 file changed, 24 insertions(+), 7 deletions(-)
>
> diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
> index 01453db..680e500 100644
> --- a/drivers/gpu/drm/msm/dp/dp_display.c
> +++ b/drivers/gpu/drm/msm/dp/dp_display.c
> @@ -113,6 +113,7 @@ struct dp_display_private {
>         u32 hpd_state;
>         u32 event_pndx;
>         u32 event_gndx;
> +       struct task_struct *ev_tsk;
>         struct dp_event event_list[DP_EVENT_Q_MAX];
>         spinlock_t event_lock;
>
> @@ -230,6 +231,8 @@ void dp_display_signal_audio_complete(struct msm_dp *dp_display)
>         complete_all(&dp->audio_comp);
>  }
>
> +static int dp_hpd_event_thread_start(struct dp_display_private *dp_priv);
> +
>  static int dp_display_bind(struct device *dev, struct device *master,
>                            void *data)
>  {
> @@ -269,6 +272,7 @@ static int dp_display_bind(struct device *dev, struct device *master,
>         if (rc)
>                 DRM_ERROR("Audio registration Dp failed\n");

I think I asked it in v3 and didn't get an answer:
Isn't 'goto end' missing here?

>
> +       rc = dp_hpd_event_thread_start(dp);

if (rc) { DRM_ERROR(....); goto end; }
return 0;

Please.

>  end:
>         return rc;
>  }
> @@ -280,6 +284,11 @@ static void dp_display_unbind(struct device *dev, struct device *master,
>         struct drm_device *drm = dev_get_drvdata(master);
>         struct msm_drm_private *priv = drm->dev_private;
>
> +       /* disable all HPD interrupts */
> +       dp_catalog_hpd_config_intr(dp->catalog, DP_DP_HPD_INT_MASK, false);
> +
> +       kthread_stop(dp->ev_tsk);
> +
>         dp_power_client_deinit(dp->power);
>         dp_aux_unregister(dp->aux);
>         priv->dp[dp->id] = NULL;
> @@ -1054,7 +1063,7 @@ static int hpd_event_thread(void *data)
>
>         dp_priv = (struct dp_display_private *)data;
>
> -       while (1) {
> +       while (!kthread_should_stop()) {
>                 if (timeout_mode) {
>                         wait_event_timeout(dp_priv->event_q,
>                                 (dp_priv->event_pndx == dp_priv->event_gndx),
> @@ -1132,12 +1141,19 @@ static int hpd_event_thread(void *data)
>         return 0;
>  }
>
> -static void dp_hpd_event_setup(struct dp_display_private *dp_priv)
> +static int dp_hpd_event_thread_start(struct dp_display_private *dp_priv)
>  {
> -       init_waitqueue_head(&dp_priv->event_q);
> -       spin_lock_init(&dp_priv->event_lock);
> +       /* set event q to empty */
> +       dp_priv->event_gndx = 0;
> +       dp_priv->event_pndx = 0;
> +
> +       dp_priv->ev_tsk = kthread_run(hpd_event_thread, dp_priv, "dp_hpd_handler");
> +       if (IS_ERR(dp_priv->ev_tsk)) {
> +               DRM_ERROR("failed to create DP event thread\n");
> +               return PTR_ERR(dp_priv->ev_tsk);
> +       }
>
> -       kthread_run(hpd_event_thread, dp_priv, "dp_hpd_handler");
> +       return 0;
>  }
>
>  static irqreturn_t dp_display_irq_handler(int irq, void *dev_id)
> @@ -1266,7 +1282,10 @@ static int dp_display_probe(struct platform_device *pdev)
>                 return -EPROBE_DEFER;
>         }
>
> +       /* setup event q */
>         mutex_init(&dp->event_mutex);
> +       init_waitqueue_head(&dp->event_q);
> +       spin_lock_init(&dp->event_lock);
>
>         /* Store DP audio handle inside DP display */
>         dp->dp_display.dp_audio = dp->audio;
> @@ -1441,8 +1460,6 @@ void msm_dp_irq_postinstall(struct msm_dp *dp_display)
>
>         dp = container_of(dp_display, struct dp_display_private, dp_display);
>
> -       dp_hpd_event_setup(dp);
> -
>         dp_add_event(dp, EV_HPD_INIT_SETUP, 0, 100);
>  }
>
> --
> The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
> a Linux Foundation Collaborative Project
>


-- 
With best wishes
Dmitry
