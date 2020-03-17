Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4271C1890AE
	for <lists+dri-devel@lfdr.de>; Tue, 17 Mar 2020 22:39:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 60E196E25E;
	Tue, 17 Mar 2020 21:38:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ua1-x942.google.com (mail-ua1-x942.google.com
 [IPv6:2607:f8b0:4864:20::942])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8093B6E25E
 for <dri-devel@lists.freedesktop.org>; Tue, 17 Mar 2020 21:38:54 +0000 (UTC)
Received: by mail-ua1-x942.google.com with SMTP id o16so8645460uap.6
 for <dri-devel@lists.freedesktop.org>; Tue, 17 Mar 2020 14:38:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=6ghtXsgbAT9V/qdmiRulN9WCXjI8Zsw5TK38MgGpUsw=;
 b=TRwFRRir2Iui8UGhvcz5sbtidCFKZFAkwpKjLd4j+1W/h/SigwMmzAnpNAX9NF1bdi
 P7qXkLqTochL01++CMdaH05+5onnBAEn4oSK5HVNQxFxJ9cSRm4YdTTDxnvPqe5p8fyO
 H4o9NHuLWlkTrh6sLMCtYrPuUHCtmIlcOInxA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=6ghtXsgbAT9V/qdmiRulN9WCXjI8Zsw5TK38MgGpUsw=;
 b=YS9UbnqvJkniKdqeVevuBEhGkpaeFp17M2SDeeI9H6afEsQV0RCHOXqpYcYXavzkK+
 1n2wS2HGAOWOPycucVWQKTSfe345e8XOYPPAyzirZy4UBQ2vBOEAxpFq5Vu5j3GjDh8k
 WRmITVrOcDJI6cwo8Z55uD4k/B28Qdi36wFz2+cJOJdNiN0bqBf/fkJ3Jc1pSrOWWqGR
 llhOODEVunO72YcaHZUjtQRFipvUgS5fG/CkGG4ZSXMxwzNNkfInMbPZNGoirS6jDl15
 xRwv5+bSckZRDMwCdPYZ61YaTtrL5hhUZuDeTYrzARL7Yx9wczpOIc2YW1dpD153iXF2
 p1cA==
X-Gm-Message-State: ANhLgQ2k8i9enZfwd1dJYPDmy+EuPnmXF6KcOxgNAPm/oZkQwbs0ewt2
 MxD8vT7YdMAleUsXihK4E3uMMYf6I8k=
X-Google-Smtp-Source: ADFU+vuXZjklceF0DOpoBbGP60L1UjKnqOvf5viyahNrfBcqcreFzARXWhBaZq2PWH0ttGMFuQC7BA==
X-Received: by 2002:ab0:20ad:: with SMTP id y13mr998954ual.46.1584481132573;
 Tue, 17 Mar 2020 14:38:52 -0700 (PDT)
Received: from mail-ua1-f49.google.com (mail-ua1-f49.google.com.
 [209.85.222.49])
 by smtp.gmail.com with ESMTPSA id y16sm1990808uag.20.2020.03.17.14.38.50
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 17 Mar 2020 14:38:51 -0700 (PDT)
Received: by mail-ua1-f49.google.com with SMTP id o16so8645407uap.6
 for <dri-devel@lists.freedesktop.org>; Tue, 17 Mar 2020 14:38:50 -0700 (PDT)
X-Received: by 2002:ab0:2881:: with SMTP id s1mr880973uap.8.1584481130400;
 Tue, 17 Mar 2020 14:38:50 -0700 (PDT)
MIME-Version: 1.0
References: <1584356720-24411-1-git-send-email-kalyan_t@codeaurora.org>
In-Reply-To: <1584356720-24411-1-git-send-email-kalyan_t@codeaurora.org>
From: Doug Anderson <dianders@chromium.org>
Date: Tue, 17 Mar 2020 14:38:39 -0700
X-Gmail-Original-Message-ID: <CAD=FV=VxzEV40g+ieuEN+7o=34+wM8MHO8o7T5zA1Yosx7SVWg@mail.gmail.com>
Message-ID: <CAD=FV=VxzEV40g+ieuEN+7o=34+wM8MHO8o7T5zA1Yosx7SVWg@mail.gmail.com>
Subject: Re: [PATCH] drm/msm/dpu: ensure device suspend happens during PM sleep
To: Kalyan Thota <kalyan_t@codeaurora.org>
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
Cc: "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, travitej@codeaurora.org,
 linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 LKML <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Stephen Boyd <swboyd@chromium.org>, Sean Paul <seanpaul@chromium.org>,
 "Kristian H. Kristensen" <hoegsberg@chromium.org>,
 freedreno <freedreno@lists.freedesktop.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On Mon, Mar 16, 2020 at 4:06 AM Kalyan Thota <kalyan_t@codeaurora.org> wrote:
>
> "The PM core always increments the runtime usage counter
> before calling the ->suspend() callback and decrements it
> after calling the ->resume() callback"
>
> DPU and DSI are managed as runtime devices. When
> suspend is triggered, PM core adds a refcount on all the
> devices and calls device suspend, since usage count is
> already incremented, runtime suspend was not getting called
> and it kept the clocks on which resulted in target not
> entering into XO shutdown.
>
> Add changes to manage runtime devices during pm sleep.
>
> Signed-off-by: Kalyan Thota <kalyan_t@codeaurora.org>
> ---
>  drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c | 41 +++++++++++++++++++++++++++++++++
>  drivers/gpu/drm/msm/dsi/dsi.c           |  7 ++++++
>  drivers/gpu/drm/msm/msm_drv.c           | 14 +++++++++++
>  drivers/gpu/drm/msm/msm_kms.h           |  2 ++
>  4 files changed, 64 insertions(+)
>
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
> index cb08faf..6e103d5 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
> @@ -26,6 +26,7 @@
>  #include "dpu_encoder.h"
>  #include "dpu_plane.h"
>  #include "dpu_crtc.h"
> +#include "dsi.h"
>
>  #define CREATE_TRACE_POINTS
>  #include "dpu_trace.h"
> @@ -250,6 +251,37 @@ static void dpu_kms_disable_commit(struct msm_kms *kms)
>         pm_runtime_put_sync(&dpu_kms->pdev->dev);
>  }
>
> +static void _dpu_kms_disable_dpu(struct msm_kms *kms)
> +{
> +       struct drm_device *dev;
> +       struct msm_drm_private *priv;
> +       struct dpu_kms *dpu_kms;
> +       int i = 0;
> +       struct msm_dsi *dsi;
> +
> +       dpu_kms = to_dpu_kms(kms);
> +       dev = dpu_kms->dev;
> +       if (!dev) {
> +               DPU_ERROR("invalid device\n");
> +               return;
> +       }
> +
> +       priv = dev->dev_private;
> +       if (!priv) {
> +               DPU_ERROR("invalid private data\n");
> +               return;
> +       }
> +
> +       dpu_kms_disable_commit(kms);
> +
> +       for (i = 0; i < ARRAY_SIZE(priv->dsi); i++) {
> +               if (!priv->dsi[i])
> +                       continue;
> +               dsi = priv->dsi[i];
> +               pm_runtime_put_sync(&dsi->pdev->dev);
> +       }
> +}
> +
>  static ktime_t dpu_kms_vsync_time(struct msm_kms *kms, struct drm_crtc *crtc)
>  {
>         struct drm_encoder *encoder;
> @@ -683,6 +715,7 @@ static void dpu_irq_uninstall(struct msm_kms *kms)
>  #ifdef CONFIG_DEBUG_FS
>         .debugfs_init    = dpu_kms_debugfs_init,
>  #endif
> +       .disable_dpu = _dpu_kms_disable_dpu,
>  };
>
>  static void _dpu_kms_mmu_destroy(struct dpu_kms *dpu_kms)
> @@ -1053,7 +1086,15 @@ static int __maybe_unused dpu_runtime_resume(struct device *dev)
>         return rc;
>  }
>
> +
> +static int __maybe_unused dpu_pm_suspend_late(struct device *dev)
> +{
> +       pm_runtime_get_noresume(dev);
> +       return 0;
> +}
> +
>  static const struct dev_pm_ops dpu_pm_ops = {
> +       SET_LATE_SYSTEM_SLEEP_PM_OPS(dpu_pm_suspend_late, NULL)
>         SET_RUNTIME_PM_OPS(dpu_runtime_suspend, dpu_runtime_resume, NULL)
>  };
>
> diff --git a/drivers/gpu/drm/msm/dsi/dsi.c b/drivers/gpu/drm/msm/dsi/dsi.c
> index 55ea4bc2..3d3740e 100644
> --- a/drivers/gpu/drm/msm/dsi/dsi.c
> +++ b/drivers/gpu/drm/msm/dsi/dsi.c
> @@ -154,12 +154,19 @@ static int dsi_dev_remove(struct platform_device *pdev)
>         return 0;
>  }
>
> +static int __maybe_unused dsi_pm_suspend_late(struct device *dev)
> +{
> +       pm_runtime_get_noresume(dev);
> +       return 0;
> +}
> +
>  static const struct of_device_id dt_match[] = {
>         { .compatible = "qcom,mdss-dsi-ctrl" },
>         {}
>  };
>
>  static const struct dev_pm_ops dsi_pm_ops = {
> +       SET_LATE_SYSTEM_SLEEP_PM_OPS(dsi_pm_suspend_late, NULL)
>         SET_RUNTIME_PM_OPS(msm_dsi_runtime_suspend, msm_dsi_runtime_resume, NULL)
>  };
>
> diff --git a/drivers/gpu/drm/msm/msm_drv.c b/drivers/gpu/drm/msm/msm_drv.c
> index e4b750b..12ec1c6 100644
> --- a/drivers/gpu/drm/msm/msm_drv.c
> +++ b/drivers/gpu/drm/msm/msm_drv.c
> @@ -1038,6 +1038,7 @@ static int msm_pm_suspend(struct device *dev)
>  {
>         struct drm_device *ddev = dev_get_drvdata(dev);
>         struct msm_drm_private *priv = ddev->dev_private;
> +       struct msm_kms *kms = priv->kms;
>
>         if (WARN_ON(priv->pm_state))
>                 drm_atomic_state_put(priv->pm_state);
> @@ -1049,6 +1050,11 @@ static int msm_pm_suspend(struct device *dev)
>                 return ret;
>         }
>
> +       if (kms->funcs->disable_dpu)
> +               kms->funcs->disable_dpu(kms);
> +
> +       pm_runtime_put_sync(dev);
> +
>         return 0;
>  }
>
> @@ -1067,6 +1073,13 @@ static int msm_pm_resume(struct device *dev)
>
>         return ret;
>  }
> +
> +static int msm_pm_suspend_late(struct device *dev)
> +{
> +       pm_runtime_get_noresume(dev);
> +       return 0;
> +}
> +
>  #endif
>
>  #ifdef CONFIG_PM
> @@ -1100,6 +1113,7 @@ static int msm_runtime_resume(struct device *dev)
>  #endif
>
>  static const struct dev_pm_ops msm_pm_ops = {
> +       SET_LATE_SYSTEM_SLEEP_PM_OPS(msm_pm_suspend_late, NULL)
>         SET_SYSTEM_SLEEP_PM_OPS(msm_pm_suspend, msm_pm_resume)
>         SET_RUNTIME_PM_OPS(msm_runtime_suspend, msm_runtime_resume, NULL)
>  };
> diff --git a/drivers/gpu/drm/msm/msm_kms.h b/drivers/gpu/drm/msm/msm_kms.h
> index 1cbef6b..c73a89b 100644
> --- a/drivers/gpu/drm/msm/msm_kms.h
> +++ b/drivers/gpu/drm/msm/msm_kms.h
> @@ -126,6 +126,8 @@ struct msm_kms_funcs {
>         /* debugfs: */
>         int (*debugfs_init)(struct msm_kms *kms, struct drm_minor *minor);
>  #endif
> +       void (*disable_dpu)(struct msm_kms *kms);
> +

I'm by no means an expert on any of this, but it seems awfully
asymmetric to me and that feels like you're going to end up with bugs.

* Is it possible that disable_dpu() will be called more than once
during normal operation, like if the screen goes off?  Will your
counts be off then?

* What happens if suspend is aborted partway through (by getting a
wakeup even as you're suspending, for instance)?  In such a case some
of the normal suspend calls will be called but "suspend_late" won't be
called.  Does that mess up your counting?


From your description, it sure seems like this part of the
runtime_pm.rst doc is relevant to you:

> Namely, if a system suspend .prepare() callback returns a positive
> number for a device, that indicates to the PM core that the device
> appears to be runtime-suspended and its state is fine, so it may
> be left in runtime suspend provided that all of its descendants
> are also left in runtime suspend.

Did I misunderstand and this isn't what you want?  Looking a bit
further, maybe the right thing is to use the "SMART_SUSPEND" flag?

I'll also note that sometimes when people just want to be Runtime PM
managed that I see this pattern:

SET_SYSTEM_SLEEP_PM_OPS(pm_runtime_force_suspend, pm_runtime_force_resume)


-Doug
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
