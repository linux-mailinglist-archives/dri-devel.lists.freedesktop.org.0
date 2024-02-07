Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 44B2684D276
	for <lists+dri-devel@lfdr.de>; Wed,  7 Feb 2024 20:56:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 47C3E10E81D;
	Wed,  7 Feb 2024 19:56:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="hAnAEq2E";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-f172.google.com (mail-yw1-f172.google.com
 [209.85.128.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 921CD10E803
 for <dri-devel@lists.freedesktop.org>; Wed,  7 Feb 2024 19:56:24 +0000 (UTC)
Received: by mail-yw1-f172.google.com with SMTP id
 00721157ae682-604a05e26c3so3634767b3.3
 for <dri-devel@lists.freedesktop.org>; Wed, 07 Feb 2024 11:56:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1707335783; x=1707940583; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=Wz7RFzUAYR3EUnuo70ELuUi/F3kU5JcqkqBZAyZnJ9g=;
 b=hAnAEq2ExcMMbwVeV9YRUsGO29XwuxjhYKuiE1CEMUwLtdORdajBR/7rpX7KZL1Q0y
 biKa/8juGgPNZm9Ggi56bIYmFXVll9fAL9d0rEVhfZj2MrwqSjO7YYtOC9pWR2C/zXhB
 OS8PxbOMGEsyBRWDLqweiahUtESGxmjtEmJjbcYwlPr4ecrm34fCGwWe4KcuTQj/Quo7
 l/xXx4cmMjLxfkuUObEINuBqe/2c63Oir3crWS8peJBuaJGoc8HcZvCZecwGsjh4vs/i
 qR5Ljhite9tnVIYSm76o4Xo7wnCAbe1pX3i3kMAdfBER3zKBfQrhBc+/cHTOeYMTVKwR
 1WaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1707335783; x=1707940583;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Wz7RFzUAYR3EUnuo70ELuUi/F3kU5JcqkqBZAyZnJ9g=;
 b=ElkSKudGyjDX/0gZZZlBQFlwivANOc+DHzbaYCyM2cNwQWP3q60l2q7AWeQpGzziS0
 x+hBTiViGm/clMo+EhmE0RPb9Zl1Qy0CHk6z/bNmmQGgLl6gYWKfo0IZ4ONYKOR4Z5nC
 +6gKpF5vt+wszmOTbgtHlVPRoq7mQT7IoCAqsrgqSNyuziTh8n8c0orHVbY0RvNepRbO
 TCUSFClkucTxtDB/RPH11LY9M+cAoRM0ipbrQC2ayeX/aetqD05Reo+WZutrQwZC1QGM
 rcbDONLOz45+Y255C7eLjTuNC2mwWS2/K7FtH3OyvF53Gj+aLLH7nULCOuKrkTIcy5X7
 Q9Ow==
X-Gm-Message-State: AOJu0YxvWE+lzal0JnQ6zGRFeqb5lsFBsOKXzTnFTvBPyauokZdNjthc
 0VuD7tzAvP9scHC2masezcQ7DLvcs2Lxcj7Xxgo4n7xvHO74BhkeACYLwWos1oDmzDutPnIYwh8
 Igv/5XEYlQFBWDuGZ34b/CvztGkpyR7neaCbFEA==
X-Google-Smtp-Source: AGHT+IEFJWETrkFXWbqnsGQ3Y+U0oT2Xdh2NeLWM/a4/aUl/8Lm6tQMK2gYOMBziyv5u+IGBAzvhEeg5M+/sFCO0tQU=
X-Received: by 2002:a81:e20d:0:b0:603:cf56:2b01 with SMTP id
 p13-20020a81e20d000000b00603cf562b01mr5309401ywl.29.1707335783601; Wed, 07
 Feb 2024 11:56:23 -0800 (PST)
MIME-Version: 1.0
References: <20240106-fd-migrate-mdp5-v3-0-3d2750378063@linaro.org>
 <20240106-fd-migrate-mdp5-v3-2-3d2750378063@linaro.org>
 <b10d6097-b13d-4b47-7127-9200e414b7be@quicinc.com>
In-Reply-To: <b10d6097-b13d-4b47-7127-9200e414b7be@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Wed, 7 Feb 2024 21:56:12 +0200
Message-ID: <CAA8EJppV_PYMyJBEogONrDVmZ91XmMkr=J0tsioO20GaAW8GoQ@mail.gmail.com>
Subject: Re: [PATCH v3 2/4] drm/msm/dpu: support binding to the mdp5 devices
To: Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, 
 Daniel Vetter <daniel@ffwll.ch>, linux-arm-msm@vger.kernel.org, 
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

On Wed, 7 Feb 2024 at 20:48, Abhinav Kumar <quic_abhinavk@quicinc.com> wrote:
>
>
>
> On 1/5/2024 3:34 PM, Dmitry Baryshkov wrote:
> > Existing MDP5 devices have slightly different bindings. The main
> > register region is called `mdp_phys' instead of `mdp'. Also vbif
> > register regions are a part of the parent, MDSS device. Add support for
> > handling this binding differences.
> >
> > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > ---
> >   drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c | 98 ++++++++++++++++++++++++++-------
> >   drivers/gpu/drm/msm/msm_drv.h           |  3 +
> >   drivers/gpu/drm/msm/msm_io_utils.c      | 13 +++++
> >   3 files changed, 93 insertions(+), 21 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
> > index 723cc1d82143..aa9e0ad33ebb 100644
> > --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
> > +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
> > @@ -1197,6 +1197,78 @@ static int dpu_kms_init(struct drm_device *ddev)
> >       return 0;
> >   }
> >
> > +static int dpu_kms_mmap_mdp5(struct dpu_kms *dpu_kms)
> > +{
> > +     struct platform_device *pdev = dpu_kms->pdev;
> > +     struct platform_device *mdss_dev;
> > +     int ret;
> > +
> > +     if (dpu_kms->pdev->dev.bus != &platform_bus_type)
> > +             return -EINVAL;
> > +
>
> !dev_is_platform() perhaps?

looks good

>
> But I would like to understand this check a bit more. Can you pls
> explain for which case this check was added?

It is necessary to be sure that we can perform to_platform_device() on
the next line.

>
> > +     mdss_dev = to_platform_device(dpu_kms->pdev->dev.parent);
> > +
> > +     dpu_kms->mmio = msm_ioremap(pdev, "mdp_phys");
> > +     if (IS_ERR(dpu_kms->mmio)) {
> > +             ret = PTR_ERR(dpu_kms->mmio);
> > +             DPU_ERROR("mdp register memory map failed: %d\n", ret);
> > +             dpu_kms->mmio = NULL;
> > +             return ret;
> > +     }
> > +     DRM_DEBUG("mapped dpu address space @%pK\n", dpu_kms->mmio);
> > +
> > +     dpu_kms->vbif[VBIF_RT] = msm_ioremap_mdss(mdss_dev,
> > +                                               dpu_kms->pdev,
> > +                                               "vbif_phys");
> > +     if (IS_ERR(dpu_kms->vbif[VBIF_RT])) {
> > +             ret = PTR_ERR(dpu_kms->vbif[VBIF_RT]);
> > +             DPU_ERROR("vbif register memory map failed: %d\n", ret);
> > +             dpu_kms->vbif[VBIF_RT] = NULL;
> > +             return ret;
> > +     }
> > +
> > +     dpu_kms->vbif[VBIF_NRT] = msm_ioremap_mdss(mdss_dev,
> > +                                                dpu_kms->pdev,
> > +                                                "vbif_nrt_phys");
>
> Do you think a "quiet" version would be better?

Yep, why not.

>
>
> > +     if (IS_ERR(dpu_kms->vbif[VBIF_NRT])) {
> > +             dpu_kms->vbif[VBIF_NRT] = NULL;
> > +             DPU_DEBUG("VBIF NRT is not defined");
> > +     }
> > +
> > +     return 0;
> > +}
> > +
> > +static int dpu_kms_mmap_dpu(struct dpu_kms *dpu_kms)
> > +{
> > +     struct platform_device *pdev = dpu_kms->pdev;
> > +     int ret;
> > +
> > +     dpu_kms->mmio = msm_ioremap(pdev, "mdp");
> > +     if (IS_ERR(dpu_kms->mmio)) {
> > +             ret = PTR_ERR(dpu_kms->mmio);
> > +             DPU_ERROR("mdp register memory map failed: %d\n", ret);
> > +             dpu_kms->mmio = NULL;
> > +             return ret;
> > +     }
> > +     DRM_DEBUG("mapped dpu address space @%pK\n", dpu_kms->mmio);
> > +
> > +     dpu_kms->vbif[VBIF_RT] = msm_ioremap(pdev, "vbif");
> > +     if (IS_ERR(dpu_kms->vbif[VBIF_RT])) {
> > +             ret = PTR_ERR(dpu_kms->vbif[VBIF_RT]);
> > +             DPU_ERROR("vbif register memory map failed: %d\n", ret);
> > +             dpu_kms->vbif[VBIF_RT] = NULL;
> > +             return ret;
> > +     }
> > +
> > +     dpu_kms->vbif[VBIF_NRT] = msm_ioremap_quiet(pdev, "vbif_nrt");
> > +     if (IS_ERR(dpu_kms->vbif[VBIF_NRT])) {
> > +             dpu_kms->vbif[VBIF_NRT] = NULL;
> > +             DPU_DEBUG("VBIF NRT is not defined");
> > +     }
> > +
> > +     return 0;
> > +}
> > +
> >   static int dpu_dev_probe(struct platform_device *pdev)
> >   {
> >       struct device *dev = &pdev->dev;
> > @@ -1230,28 +1302,12 @@ static int dpu_dev_probe(struct platform_device *pdev)
> >
> >       dpu_kms->base.irq = irq;
> >
> > -     dpu_kms->mmio = msm_ioremap(pdev, "mdp");
> > -     if (IS_ERR(dpu_kms->mmio)) {
> > -             ret = PTR_ERR(dpu_kms->mmio);
> > -             DPU_ERROR("mdp register memory map failed: %d\n", ret);
> > -             dpu_kms->mmio = NULL;
> > -             return ret;
> > -     }
> > -     DRM_DEBUG("mapped dpu address space @%pK\n", dpu_kms->mmio);
> > -
> > -     dpu_kms->vbif[VBIF_RT] = msm_ioremap(pdev, "vbif");
> > -     if (IS_ERR(dpu_kms->vbif[VBIF_RT])) {
> > -             ret = PTR_ERR(dpu_kms->vbif[VBIF_RT]);
> > -             DPU_ERROR("vbif register memory map failed: %d\n", ret);
> > -             dpu_kms->vbif[VBIF_RT] = NULL;
> > +     if (of_device_is_compatible(dpu_kms->pdev->dev.of_node, "qcom,mdp5"))
> > +             ret = dpu_kms_mmap_mdp5(dpu_kms);
> > +     else
> > +             ret = dpu_kms_mmap_dpu(dpu_kms);
> > +     if (ret)
> >               return ret;
> > -     }
> > -
> > -     dpu_kms->vbif[VBIF_NRT] = msm_ioremap_quiet(pdev, "vbif_nrt");
> > -     if (IS_ERR(dpu_kms->vbif[VBIF_NRT])) {
> > -             dpu_kms->vbif[VBIF_NRT] = NULL;
> > -             DPU_DEBUG("VBIF NRT is not defined");
> > -     }
> >
> >       ret = dpu_kms_parse_data_bus_icc_path(dpu_kms);
> >       if (ret)
> > diff --git a/drivers/gpu/drm/msm/msm_drv.h b/drivers/gpu/drm/msm/msm_drv.h
> > index 16a7cbc0b7dd..01e783130054 100644
> > --- a/drivers/gpu/drm/msm/msm_drv.h
> > +++ b/drivers/gpu/drm/msm/msm_drv.h
> > @@ -476,6 +476,9 @@ void __iomem *msm_ioremap(struct platform_device *pdev, const char *name);
> >   void __iomem *msm_ioremap_size(struct platform_device *pdev, const char *name,
> >               phys_addr_t *size);
> >   void __iomem *msm_ioremap_quiet(struct platform_device *pdev, const char *name);
> > +void __iomem *msm_ioremap_mdss(struct platform_device *mdss_pdev,
> > +                            struct platform_device *dev,
> > +                            const char *name);
> >
> >   struct icc_path *msm_icc_get(struct device *dev, const char *name);
> >
> > diff --git a/drivers/gpu/drm/msm/msm_io_utils.c b/drivers/gpu/drm/msm/msm_io_utils.c
> > index 59d2788c4510..afedd61c3e28 100644
> > --- a/drivers/gpu/drm/msm/msm_io_utils.c
> > +++ b/drivers/gpu/drm/msm/msm_io_utils.c
> > @@ -50,6 +50,19 @@ struct clk *msm_clk_get(struct platform_device *pdev, const char *name)
> >       return clk;
> >   }
> >
> > +void __iomem *msm_ioremap_mdss(struct platform_device *mdss_pdev,
> > +                            struct platform_device *pdev,
> > +                            const char *name)
> > +{
> > +     struct resource *res;
> > +
> > +     res = platform_get_resource_byname(mdss_pdev, IORESOURCE_MEM, name);
> > +     if (!res)
> > +             return ERR_PTR(-EINVAL);
> > +
> > +     return devm_ioremap_resource(&pdev->dev, res);
> > +}
> > +
> >   static void __iomem *_msm_ioremap(struct platform_device *pdev, const char *name,
> >                                 bool quiet, phys_addr_t *psize)
> >   {
> >



-- 
With best wishes
Dmitry
