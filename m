Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AB2A220D5E0
	for <lists+dri-devel@lfdr.de>; Mon, 29 Jun 2020 21:57:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5D9F589F92;
	Mon, 29 Jun 2020 19:57:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x542.google.com (mail-ed1-x542.google.com
 [IPv6:2a00:1450:4864:20::542])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2653089F77;
 Mon, 29 Jun 2020 19:57:31 +0000 (UTC)
Received: by mail-ed1-x542.google.com with SMTP id dm19so7771890edb.13;
 Mon, 29 Jun 2020 12:57:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=AaIAGXzm3zle6m3IyH6J6bY+lak3D/cEfWozndthNJQ=;
 b=bH7wT0Px6bC7hXr1S6yEgmoWByAw/Sx0DSg0e3sBnS6GfVDVkgciX1P6xiXpE5ikWi
 EKNxcnejGmYA74L9W6I79GzlF+DEBoJDK9EZpI3DGdPHozeUi933NqosK1opTbyWgskW
 ta2XN6jexhlUpxoUpJJ68E+L+6RcUF4kcyij9OgF1o7eM6Y8JzUP8cafX4ViUqNz6TaB
 Lt0FKK9Nu+u4VEyFbOojPocJ0pnx/8RJPCHhxka9jm3y2F6G1YUMZAPRUbSdvYM8RrPh
 ANjOnT2SH02GOZKMLwoa4t0cOvQGEENFu0/ZhL9smtbFnj2dZfjMa2k4ysF/piDp7gd0
 Bl6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=AaIAGXzm3zle6m3IyH6J6bY+lak3D/cEfWozndthNJQ=;
 b=lcsXFui/+wtakxX3P+lKasbnVwrv2uEELTwHz1OlcMNxuZaEUjSR8PRL8xikm1e1fD
 09/EyQ0zj5ZEmVGG2slNlITHebzDbYJsCNw/8HSGEirs92fR9gli95fa1t4XrYZo1KjP
 Au/sg96NiEx2/ZHc5ZRqlWztwaGcEsylZDXUdnq8IOYRxK5tYnLsfD/H7Kl3zhYC0zA6
 KEAnYgEDbPvz/6mObl8g/qzBxQDBbW/YrBLvugWXIdhFXIV4Vp1Mx+pudUF8+/NzBcGG
 wjqT7hldPE/h6AZdKsqcbc4wndoSuKgsEuQe1WWD2YGYrJ24hhGf9TqMT1RdRgWKuCBs
 OBNQ==
X-Gm-Message-State: AOAM531vxi3a+cwJYLPKLJ7fBaktmqlxTqz1ejokUKUkhg3fxY9oUAXt
 c1XxgPq+0eFIZzNPhpbu9Us16yM+tW5ojjOVpJY=
X-Google-Smtp-Source: ABdhPJxuqVeCta8VoAgMN0v4dnb20yspX1tWXnf7++Cbpyc1biLAcvlB00qweNwifDIJzhl2qqHoB4gCEw2ejQUXIfA=
X-Received: by 2002:aa7:d792:: with SMTP id s18mr19820549edq.7.1593460649733; 
 Mon, 29 Jun 2020 12:57:29 -0700 (PDT)
MIME-Version: 1.0
References: <20200629181921.3019271-1-eric@anholt.net>
 <20200629181921.3019271-2-eric@anholt.net>
In-Reply-To: <20200629181921.3019271-2-eric@anholt.net>
From: Rob Clark <robdclark@gmail.com>
Date: Mon, 29 Jun 2020 12:57:59 -0700
Message-ID: <CAF6AEGstctXSCwW9Hv=MmB_Ca1VGA_DZNtzvqSY-1NqPTK+WPQ@mail.gmail.com>
Subject: Re: [PATCH 2/2] drm/msm: Quiet error during failure in optional
 resource mappings.
To: Eric Anholt <eric@anholt.net>
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
Cc: freedreno <freedreno@lists.freedesktop.org>,
 linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>, Sean Paul <sean@poorly.run>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Jun 29, 2020 at 11:19 AM Eric Anholt <eric@anholt.net> wrote:
>
> We don't expect to find vbif_nrt or regdma on cheza, but were clogging
> up dmesg with errors about it.

nit: s/cheza/sdm845/ (since this really applies to the SoC rather than
the board..

also, maybe msm_ioremap_optional() ?

BR,
-R

>
> Signed-off-by: Eric Anholt <eric@anholt.net>
> ---
>  drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c |  4 ++--
>  drivers/gpu/drm/msm/msm_drv.c           | 22 ++++++++++++++++++----
>  drivers/gpu/drm/msm/msm_drv.h           |  2 ++
>  3 files changed, 22 insertions(+), 6 deletions(-)
>
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
> index a4ab802fee6d..d9aef2b5e930 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
> @@ -838,13 +838,13 @@ static int dpu_kms_hw_init(struct msm_kms *kms)
>                 dpu_kms->vbif[VBIF_RT] = NULL;
>                 goto error;
>         }
> -       dpu_kms->vbif[VBIF_NRT] = msm_ioremap(dpu_kms->pdev, "vbif_nrt", "vbif_nrt");
> +       dpu_kms->vbif[VBIF_NRT] = msm_ioremap_quiet(dpu_kms->pdev, "vbif_nrt", "vbif_nrt");
>         if (IS_ERR(dpu_kms->vbif[VBIF_NRT])) {
>                 dpu_kms->vbif[VBIF_NRT] = NULL;
>                 DPU_DEBUG("VBIF NRT is not defined");
>         }
>
> -       dpu_kms->reg_dma = msm_ioremap(dpu_kms->pdev, "regdma", "regdma");
> +       dpu_kms->reg_dma = msm_ioremap_quiet(dpu_kms->pdev, "regdma", "regdma");
>         if (IS_ERR(dpu_kms->reg_dma)) {
>                 dpu_kms->reg_dma = NULL;
>                 DPU_DEBUG("REG_DMA is not defined");
> diff --git a/drivers/gpu/drm/msm/msm_drv.c b/drivers/gpu/drm/msm/msm_drv.c
> index f6ce40bf3699..df4a3c6a49cd 100644
> --- a/drivers/gpu/drm/msm/msm_drv.c
> +++ b/drivers/gpu/drm/msm/msm_drv.c
> @@ -120,8 +120,8 @@ struct clk *msm_clk_get(struct platform_device *pdev, const char *name)
>         return clk;
>  }
>
> -void __iomem *msm_ioremap(struct platform_device *pdev, const char *name,
> -               const char *dbgname)
> +void __iomem *_msm_ioremap(struct platform_device *pdev, const char *name,
> +                          const char *dbgname, bool quiet)
>  {
>         struct resource *res;
>         unsigned long size;
> @@ -133,7 +133,8 @@ void __iomem *msm_ioremap(struct platform_device *pdev, const char *name,
>                 res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
>
>         if (!res) {
> -               DRM_DEV_ERROR(&pdev->dev, "failed to get memory resource: %s\n", name);
> +               if (!quiet)
> +                       DRM_DEV_ERROR(&pdev->dev, "failed to get memory resource: %s\n", name);
>                 return ERR_PTR(-EINVAL);
>         }
>
> @@ -141,7 +142,8 @@ void __iomem *msm_ioremap(struct platform_device *pdev, const char *name,
>
>         ptr = devm_ioremap(&pdev->dev, res->start, size);
>         if (!ptr) {
> -               DRM_DEV_ERROR(&pdev->dev, "failed to ioremap: %s\n", name);
> +               if (!quiet)
> +                       DRM_DEV_ERROR(&pdev->dev, "failed to ioremap: %s\n", name);
>                 return ERR_PTR(-ENOMEM);
>         }
>
> @@ -151,6 +153,18 @@ void __iomem *msm_ioremap(struct platform_device *pdev, const char *name,
>         return ptr;
>  }
>
> +void __iomem *msm_ioremap(struct platform_device *pdev, const char *name,
> +                         const char *dbgname)
> +{
> +       return _msm_ioremap(pdev, name, dbgname, false);
> +}
> +
> +void __iomem *msm_ioremap_quiet(struct platform_device *pdev, const char *name,
> +                               const char *dbgname)
> +{
> +       return _msm_ioremap(pdev, name, dbgname, true);
> +}
> +
>  void msm_writel(u32 data, void __iomem *addr)
>  {
>         if (reglog)
> diff --git a/drivers/gpu/drm/msm/msm_drv.h b/drivers/gpu/drm/msm/msm_drv.h
> index e2d6a6056418..2687f7a42c15 100644
> --- a/drivers/gpu/drm/msm/msm_drv.h
> +++ b/drivers/gpu/drm/msm/msm_drv.h
> @@ -411,6 +411,8 @@ struct clk *msm_clk_bulk_get_clock(struct clk_bulk_data *bulk, int count,
>         const char *name);
>  void __iomem *msm_ioremap(struct platform_device *pdev, const char *name,
>                 const char *dbgname);
> +void __iomem *msm_ioremap_quiet(struct platform_device *pdev, const char *name,
> +               const char *dbgname);
>  void msm_writel(u32 data, void __iomem *addr);
>  u32 msm_readl(const void __iomem *addr);
>
> --
> 2.26.2
>
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
