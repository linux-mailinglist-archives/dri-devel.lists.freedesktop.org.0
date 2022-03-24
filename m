Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BB8224E6A4E
	for <lists+dri-devel@lfdr.de>; Thu, 24 Mar 2022 22:37:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D8EE910E3AB;
	Thu, 24 Mar 2022 21:37:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oa1-x2e.google.com (mail-oa1-x2e.google.com
 [IPv6:2001:4860:4864:20::2e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 33E5B10E3AB
 for <dri-devel@lists.freedesktop.org>; Thu, 24 Mar 2022 21:37:26 +0000 (UTC)
Received: by mail-oa1-x2e.google.com with SMTP id
 586e51a60fabf-dacc470e03so6257429fac.5
 for <dri-devel@lists.freedesktop.org>; Thu, 24 Mar 2022 14:37:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:in-reply-to:references:from:user-agent:date:message-id
 :subject:to:cc;
 bh=HdoEr39nJ8XLLzmRv7t9DcJ2NEuZdicrQhgJMIplMGA=;
 b=nr+pJcEfaxKZFWLOyHW123YG2KCr26yDBn3v81ePVZIch5SOqrWM7iZ2qRgTr9MPJ9
 4QGiQuknNnMf2Ia7etw4ZOe7V0kAgdOwH2oMhCsFqlQzqH+PzBz7Az+vKoN2TP4LUBa/
 bU6WLPj9gh6W4J2h3BvVBrRJuBBsztFzMx75U=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:in-reply-to:references:from
 :user-agent:date:message-id:subject:to:cc;
 bh=HdoEr39nJ8XLLzmRv7t9DcJ2NEuZdicrQhgJMIplMGA=;
 b=zEDI7YVMabb13oXdBJMCGBWmK4u6gFBOwYRGvAdZZ6SDMzdX8pJBwwg3fYpDshJJNu
 4zpQ72uiaAoQFfIJXCzmGw9GEhGiAYWzQL+uP/VXvqpcdfZ1DAMAzMvpJ4Vio3safF1C
 9gfQu9cuJ7qHqPwRSWdEzb8Pd2Ms7v/yzkN0WnWxl1EX/9IfIawJl61B3Rit3ILLNPU2
 ysoqkJz3DkxzuvdGTXZfJxmFw02BDOF8BdVRd1v5Ig7G1BZWxbl6IA+5sNv4HveKwRVg
 4kESsfjeBLiJI5L3wq3l0hDP3WkHfFcfNwqVDqk1spogVnqF4JSSKKxn1nRgZ/wv1Em6
 zSmA==
X-Gm-Message-State: AOAM533YKIJqfqkEtDhs8cQAz/vWIovXsQvX4Gj7J2ysPJubEeIlTji1
 hKG6NF3TsskwhNRy4TnJr1J4KcL7gHJc2K+eq7syDg==
X-Google-Smtp-Source: ABdhPJzO4fhdphXFf/keg/5TBfNUkepirTBLzE8Zcx2CsDXOfdqgNwltvB1Zzof+7t6gNMJcMiaLnjkt8A/oTp6SjGw=
X-Received: by 2002:a05:6870:b69c:b0:dd:b74b:4099 with SMTP id
 cy28-20020a056870b69c00b000ddb74b4099mr3250679oab.193.1648157845385; Thu, 24
 Mar 2022 14:37:25 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 24 Mar 2022 16:37:24 -0500
MIME-Version: 1.0
In-Reply-To: <20220323092538.1757880-7-dmitry.baryshkov@linaro.org>
References: <20220323092538.1757880-1-dmitry.baryshkov@linaro.org>
 <20220323092538.1757880-7-dmitry.baryshkov@linaro.org>
From: Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.10
Date: Thu, 24 Mar 2022 16:37:24 -0500
Message-ID: <CAE-0n51VvGu5w9dSUKUt4GywYbSpOaqxfWypB7ObJZg1pM5BAQ@mail.gmail.com>
Subject: Re: [PATCH v3 6/6] drm/msm: make mdp5/dpu devices master components
To: Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Bjorn Andersson <bjorn.andersson@linaro.org>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Rob Clark <robdclark@gmail.com>,
 Sean Paul <sean@poorly.run>
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
Cc: David Airlie <airlied@linux.ie>, linux-arm-msm@vger.kernel.org,
 freedreno@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Quoting Dmitry Baryshkov (2022-03-23 02:25:38)
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
> index 38627ccf3068..ab8a35e09bc9 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
> @@ -381,8 +381,8 @@ static int dpu_kms_parse_data_bus_icc_path(struct dpu_kms *dpu_kms)
>         struct icc_path *path1;
>         struct drm_device *dev = dpu_kms->dev;
>
> -       path0 = of_icc_get(dev->dev, "mdp0-mem");
> -       path1 = of_icc_get(dev->dev, "mdp1-mem");
> +       path0 = of_icc_get(dev->dev->parent, "mdp0-mem");

dev->dev->parent is long

> +       path1 = of_icc_get(dev->dev->parent, "mdp1-mem");
>
>         if (IS_ERR_OR_NULL(path0))
>                 return PTR_ERR_OR_ZERO(path0);
> @@ -837,6 +837,9 @@ static void dpu_kms_destroy(struct msm_kms *kms)
>         _dpu_kms_hw_destroy(dpu_kms);
>
>         msm_kms_destroy(&dpu_kms->base);
> +
> +       if (dpu_kms->rpm_enabled)
> +               pm_runtime_disable(&dpu_kms->pdev->dev);
>  }
>
>  static irqreturn_t dpu_irq(struct msm_kms *kms)
> @@ -978,7 +981,7 @@ static int _dpu_kms_mmu_init(struct dpu_kms *dpu_kms)
>         if (!domain)
>                 return 0;
>
> -       mmu = msm_iommu_new(dpu_kms->dev->dev, domain);
> +       mmu = msm_iommu_new(dpu_kms->dev->dev->parent, domain);

And dpu_kms->dev->dev->parent is longer. Can we get some local variable
or something that is more descriptive? I guess it is an 'mdss_dev'?

>         if (IS_ERR(mmu)) {
>                 iommu_domain_free(domain);
>                 return PTR_ERR(mmu);
> @@ -1172,40 +1175,15 @@ static int dpu_kms_hw_init(struct msm_kms *kms)
>         return rc;
>  }
>
> -static int dpu_kms_init(struct drm_device *dev)
> -{
> -       struct msm_drm_private *priv;
> -       struct dpu_kms *dpu_kms;
> -       int irq;
> -
> -       if (!dev) {
> -               DPU_ERROR("drm device node invalid\n");
> -               return -EINVAL;
> -       }
> -
> -       priv = dev->dev_private;
> -       dpu_kms = to_dpu_kms(priv->kms);
> -
> -       irq = irq_of_parse_and_map(dpu_kms->pdev->dev.of_node, 0);
> -       if (irq < 0) {
> -               DPU_ERROR("failed to get irq: %d\n", irq);
> -               return irq;
> -       }
> -       dpu_kms->base.irq = irq;
> -
> -       return 0;
> -}
> -
> -static int dpu_bind(struct device *dev, struct device *master, void *data)
> +static int dpu_kms_init(struct drm_device *ddev)
>  {
> -       struct msm_drm_private *priv = dev_get_drvdata(master);
> +       struct msm_drm_private *priv = ddev->dev_private;
> +       struct device *dev = ddev->dev;
>         struct platform_device *pdev = to_platform_device(dev);
> -       struct drm_device *ddev = priv->dev;
>         struct dpu_kms *dpu_kms;
> +       int irq;
>         int ret = 0;
>
> -       priv->kms_init = dpu_kms_init;
> -
>         dpu_kms = devm_kzalloc(&pdev->dev, sizeof(*dpu_kms), GFP_KERNEL);
>         if (!dpu_kms)
>                 return -ENOMEM;
> @@ -1227,8 +1205,6 @@ static int dpu_bind(struct device *dev, struct device *master, void *data)
>         }
>         dpu_kms->num_clocks = ret;
>
> -       platform_set_drvdata(pdev, dpu_kms);
> -
>         ret = msm_kms_init(&dpu_kms->base, &kms_funcs);
>         if (ret) {
>                 DPU_ERROR("failed to init kms, ret=%d\n", ret);
> @@ -1242,31 +1218,25 @@ static int dpu_bind(struct device *dev, struct device *master, void *data)
>
>         priv->kms = &dpu_kms->base;
>
> -       return ret;
> -}
> -
> -static void dpu_unbind(struct device *dev, struct device *master, void *data)
> -{
> -       struct platform_device *pdev = to_platform_device(dev);
> -       struct dpu_kms *dpu_kms = platform_get_drvdata(pdev);
> +       irq = irq_of_parse_and_map(dpu_kms->pdev->dev.of_node, 0);

Why doesn't platform_get_irq() work? This is code movement but I'm
trying to understand why OF APIs are required.

> +       if (irq < 0) {
> +               DPU_ERROR("failed to get irq: %d\n", irq);
> +               return irq;
> +       }
> +       dpu_kms->base.irq = irq;
>
> -       if (dpu_kms->rpm_enabled)
> -               pm_runtime_disable(&pdev->dev);
> +       return 0;
>  }
>
> diff --git a/drivers/gpu/drm/msm/msm_kms.h b/drivers/gpu/drm/msm/msm_kms.h
> index 1f571372e928..ab25fff271f9 100644
> --- a/drivers/gpu/drm/msm/msm_kms.h
> +++ b/drivers/gpu/drm/msm/msm_kms.h
> @@ -194,9 +194,6 @@ static inline void msm_kms_destroy(struct msm_kms *kms)
>                 msm_atomic_destroy_pending_timer(&kms->pending_timers[i]);
>  }
>
> -extern const struct of_device_id dpu_dt_match[];
> -extern const struct of_device_id mdp5_dt_match[];
> -
>  #define for_each_crtc_mask(dev, crtc, crtc_mask) \
>         drm_for_each_crtc(crtc, dev) \
>                 for_each_if (drm_crtc_mask(crtc) & (crtc_mask))
> diff --git a/drivers/gpu/drm/msm/msm_mdss.c b/drivers/gpu/drm/msm/msm_mdss.c
> index 7451105cbf01..9ecae833037d 100644
> --- a/drivers/gpu/drm/msm/msm_mdss.c
> +++ b/drivers/gpu/drm/msm/msm_mdss.c
> @@ -329,14 +310,7 @@ static int mdss_probe(struct platform_device *pdev)
>         if (IS_ERR(mdss))
>                 return PTR_ERR(mdss);
>
> -       priv = devm_kzalloc(&pdev->dev, sizeof(*priv), GFP_KERNEL);
> -       if (!priv) {
> -               ret = -ENOMEM;
> -               goto fail;
> -       }
> -
> -       priv->mdss = mdss;
> -       platform_set_drvdata(pdev, priv);
> +       platform_set_drvdata(pdev, mdss);
>
>         /*
>          * MDP5/DPU based devices don't have a flat hierarchy. There is a top
> @@ -350,39 +324,18 @@ static int mdss_probe(struct platform_device *pdev)
>                 goto fail;

Can the goto fail be removed? And replaced with

	if (ret)
		msm_mdss_destroy(mdss)

	return ret;

>         }
>
> -       mdp_dev = device_find_child(dev, NULL, find_mdp_node);
> -       if (!mdp_dev) {
> -               DRM_DEV_ERROR(dev, "failed to find MDSS MDP node\n");
> -               of_platform_depopulate(dev);
> -               ret = -ENODEV;
> -               goto fail;
> -       }
> -
> -       /*
> -        * on MDP5 based platforms, the MDSS platform device is the component
> -        * that adds MDP5 and other display interface components to
> -        * itself.
> -        */
> -       ret = msm_drv_probe(dev, mdp_dev);
> -       put_device(mdp_dev);
> -       if (ret)
> -               goto fail;
> -

I see a lot of removal of 'goto fail'.

>         return 0;
>
>  fail:
> -       of_platform_depopulate(dev);
> -       msm_mdss_destroy(priv->mdss);
> +       msm_mdss_destroy(mdss);
>
>         return ret;
>  }
>
