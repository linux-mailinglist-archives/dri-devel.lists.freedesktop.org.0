Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C81969FBBD
	for <lists+dri-devel@lfdr.de>; Wed, 22 Feb 2023 20:09:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6CC9010E2DE;
	Wed, 22 Feb 2023 19:09:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oa1-x2d.google.com (mail-oa1-x2d.google.com
 [IPv6:2001:4860:4864:20::2d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 20F1F10E2DE;
 Wed, 22 Feb 2023 19:09:28 +0000 (UTC)
Received: by mail-oa1-x2d.google.com with SMTP id
 586e51a60fabf-17227cba608so8509938fac.3; 
 Wed, 22 Feb 2023 11:09:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=MKgEA/fOSlXr0CBhdOfob9+bJNSViu9v8V75uikiRi0=;
 b=mmA1Waa626q2PtBdhBbjLGkt3+D1c1xVhIq2gdFpndfuQ+S1Yzn2TGiYh4RR2Xk6IQ
 SsCtHePYIH48La84ApXcvVHy0v6wC/HNCSm5Vh+tP8Wqdpky380BATIhDMlWaJL6p9SF
 ywX7KYnXAyqlo62llKg7robwGs8pdr8CXTtQex3mMS8qcpOCrx5LhuhUZZB5gcFo69Sy
 YrZMhfV18M422GyMYd8/+zlNYasVsv/hToppCwRSV4EJzHKv2YDdRZjYpDhwds+DmOQK
 algUgqhu4SuLnI2ZCO64fcNc0GUej9qxkcR0M81fOpFBzE8ODS8mvCNomc1PPOnZOe/d
 DJ6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=MKgEA/fOSlXr0CBhdOfob9+bJNSViu9v8V75uikiRi0=;
 b=cLrMio2xzkaHNX8YmUNMsLPGgO3Q0g2EDDRK9ceJwv4xNjz9lramQ2a4vDA8og+f1Y
 0F2x4oKtyQ07NHWnto6iBVnY1bsmAEbNAyIXxLIt/EUP03R6S9gfPnxKwlD1awUUD16B
 2o3BKk+FHEb/VIFd3tTDWdkeCvD3POjuB5350Wn5upBYyh2sYhqeehgQYme4kwrkxtQo
 dwH3RvC8Yf1naI96RuH7CgVLp2QQG/+ZrO+L6/dlH83MlcX2GJ+zdZFmrOEVP2Gatylc
 WIQ6K3vqNNmzh5OBqOCwhWVO7/xaJ1coHTxdiMFsC3Bsj6vE8lQPE0bQXQG1Ca4+nNd9
 omfw==
X-Gm-Message-State: AO0yUKUeFwB/QyFPMLZGQP8mNC4mHIj+L6/qwTFKnetVDgjP2QcZwPAy
 OFHLfIntiOBCH8rjYp6GKsKIr5vrfU/ditZ9lvI=
X-Google-Smtp-Source: AK7set8OjezVhI9h0uCuF0+UcjamVY/154kO2FAuONaqAaoqamanQONsfK5EGak+6bty3QBuw4+kt7h79uDnvckNzgE=
X-Received: by 2002:a05:6870:808d:b0:16e:8a56:d0d2 with SMTP id
 q13-20020a056870808d00b0016e8a56d0d2mr1408005oab.38.1677092967347; Wed, 22
 Feb 2023 11:09:27 -0800 (PST)
MIME-Version: 1.0
References: <20230221101430.14546-1-johan+linaro@kernel.org>
 <20230221101430.14546-4-johan+linaro@kernel.org>
In-Reply-To: <20230221101430.14546-4-johan+linaro@kernel.org>
From: Rob Clark <robdclark@gmail.com>
Date: Wed, 22 Feb 2023 11:09:16 -0800
Message-ID: <CAF6AEGsco+h0f5twHz9CRFyCUeiK1WOJWcURW3wPiZx5muio0g@mail.gmail.com>
Subject: Re: [PATCH 3/4] drm/msm/adreno: drop redundant pm_runtime_disable()
To: Johan Hovold <johan+linaro@kernel.org>
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
Cc: freedreno@lists.freedesktop.org, Sean Paul <sean@poorly.run>,
 Bjorn Andersson <andersson@kernel.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Feb 21, 2023 at 2:16 AM Johan Hovold <johan+linaro@kernel.org> wrote:
>
> Since commit 4b18299b3365 ("drm/msm/adreno: Defer enabling runpm until
> hw_init()") runtime PM is no longer enabled at adreno_gpu_init(), which
> means that there are no longer any bind() error paths for which
> adreno_gpu_cleanup() is called with runtime PM enabled.
>
> As the runtime PM enable on first open() is balanced by the
> pm_runtime_force_suspend() call at unbind(), adreno_gpu_cleanup() is now
> always called with runtime PM disabled so that its pm_runtime_disable()
> call can be removed.
>
> Signed-off-by: Johan Hovold <johan+linaro@kernel.org>
> ---
>  drivers/gpu/drm/msm/adreno/adreno_gpu.c | 5 -----
>  1 file changed, 5 deletions(-)
>
> diff --git a/drivers/gpu/drm/msm/adreno/adreno_gpu.c b/drivers/gpu/drm/msm/adreno/adreno_gpu.c
> index ce6b76c45b6f..1101b8234b49 100644
> --- a/drivers/gpu/drm/msm/adreno/adreno_gpu.c
> +++ b/drivers/gpu/drm/msm/adreno/adreno_gpu.c
> @@ -1082,15 +1082,10 @@ int adreno_gpu_init(struct drm_device *drm, struct platform_device *pdev,
>
>  void adreno_gpu_cleanup(struct adreno_gpu *adreno_gpu)
>  {
> -       struct msm_gpu *gpu = &adreno_gpu->base;
> -       struct msm_drm_private *priv = gpu->dev ? gpu->dev->dev_private : NULL;
>         unsigned int i;
>
>         for (i = 0; i < ARRAY_SIZE(adreno_gpu->info->fw); i++)
>                 release_firmware(adreno_gpu->fw[i]);
>
> -       if (priv && pm_runtime_enabled(&priv->gpu_pdev->dev))
> -               pm_runtime_disable(&priv->gpu_pdev->dev);
> -

Maybe WARN_ON(priv && pm_runtime_enabled(&priv->gpu_pdev->dev))?

BR,
-R

>         msm_gpu_cleanup(&adreno_gpu->base);
>  }
> --
> 2.39.2
>
