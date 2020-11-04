Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BAC22A6B95
	for <lists+dri-devel@lfdr.de>; Wed,  4 Nov 2020 18:24:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 67D5A6E15E;
	Wed,  4 Nov 2020 17:24:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com
 [IPv6:2a00:1450:4864:20::444])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9F3826E15E;
 Wed,  4 Nov 2020 17:24:51 +0000 (UTC)
Received: by mail-wr1-x444.google.com with SMTP id n15so22971471wrq.2;
 Wed, 04 Nov 2020 09:24:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=2t6bsOvcaKKa8aR9J8fbfDJiM/7JPVfDs636SBMVeQg=;
 b=oqswMzax2NZZWri8s+7sGggS2Z+ar/36vEeNk36cbDsmy1CY3nBah1lCxd1L/24Kit
 +eAnPGyMvdMn2c+CZxHiSavR4e8HpFo4WUOawJOnSTGxEUltgSv/M36sKB0PIickks8o
 EqbPTlbU40dcDX5LeK7g21AnU0f0LLlOQp8hIv4yCQK6axPIarhcLoCBBQvPNUxtGH3T
 1XvlQLxcfJ8ywZof2f4IMr5RAvLFsULLg6fyyqsPoFe01tjO6aOj8j73YpSIOnLBlx4s
 EOJMxrQbQ0cr9NPxHzMs3bu+4JV+WGcYelcvhTyBCTruWVbEpvYBF0JIvhA/xsD4ivpV
 vY1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=2t6bsOvcaKKa8aR9J8fbfDJiM/7JPVfDs636SBMVeQg=;
 b=YkNOKF+XZrREsttyyJdpRXS50hzXWzmuuu4goguYybL435TJVDh5qRl+V080YalWJi
 nKnjI9NDPVyjAW8AHqX99Cq50DM2q/e/mX9sF+Zsf3btw1F/M/ovxFJUM2XJ4rf4t0HY
 OisC3/6+8YsQ75TdqfgqJhaBA+3v1YDuwxbW7kh89TtOQpIfXD8LajIOswrB0CLEb6xL
 KVWyVBHjko8bMi7aDtJLXeBV1BuAwUixgaROawZzXQ26bxKSMTy1xs5N6ahLlOfe/ojX
 6tAuMvvdW67u+7yP+etQO3Pot82VlLgGiMt/qs+TqoKJa6bJMXdABxalk/y0Bnmu21wk
 Dg2Q==
X-Gm-Message-State: AOAM530ZRq35bbUPJlEEN3h7EB6/CSFsxrLUitQLiJ/F5BUUtSO4QZq2
 mDqKPsGLkLrVBcB6mWouqhxDQ8/qMcTVisvuG0I=
X-Google-Smtp-Source: ABdhPJyCoTGhdf3bFvQiuuwVj6l+bkeSchp/yzLV6WBnd0fB4fTk+dADo/wtaXwoaSS9CpQtn69K1BCKxbfXS+Rrcb4=
X-Received: by 2002:a5d:640d:: with SMTP id z13mr32281679wru.28.1604510690248; 
 Wed, 04 Nov 2020 09:24:50 -0800 (PST)
MIME-Version: 1.0
References: <20201030010101.4345-1-abhinavk@codeaurora.org>
 <20201030010101.4345-4-abhinavk@codeaurora.org>
In-Reply-To: <20201030010101.4345-4-abhinavk@codeaurora.org>
From: Rob Clark <robdclark@gmail.com>
Date: Wed, 4 Nov 2020 09:26:24 -0800
Message-ID: <CAF6AEGseHWb43jx0HzqL0aZSGMeijnXcv2eOi7oU9d8peAQOVA@mail.gmail.com>
Subject: Re: [Freedreno] [PATCH v2 3/4] drm/msm: register the base address
 with dpu_dbg module
To: Abhinav Kumar <abhinavk@codeaurora.org>
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
Cc: linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Stephen Boyd <swboyd@chromium.org>, Kuogee Hsieh <khsieh@codeaurora.org>,
 Sean Paul <seanpaul@chromium.org>, Tanmay Shah <tanmay@codeaurora.org>,
 aravindh@codeaurora.org, freedreno <freedreno@lists.freedesktop.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Oct 29, 2020 at 6:01 PM Abhinav Kumar <abhinavk@codeaurora.org> wrote:
>
> Register the base address of various dpu sub-modules with the
> dpu_dbg module so that it can be dumped out during error scenarios.
>
> changes in v2:
>  - Fix an issue where the same dsi client was getting registered
>    multiple times to the dpu_dbg module
>
> Signed-off-by: Abhinav Kumar <abhinavk@codeaurora.org>
> ---
>  drivers/gpu/drm/msm/disp/dpu1/dpu_dbg.c       |  4 +--
>  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c    |  6 ++++-
>  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dspp.c   |  7 +++--
>  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c   |  5 +++-
>  .../gpu/drm/msm/disp/dpu1/dpu_hw_pingpong.c   |  6 ++++-
>  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c   |  8 +++++-
>  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_top.c    |  7 ++++-
>  drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c       | 12 +++++++--
>  drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h       |  4 ++-
>  drivers/gpu/drm/msm/dp/dp_catalog.c           | 12 +++++++++
>  drivers/gpu/drm/msm/dp/dp_catalog.h           |  4 +++
>  drivers/gpu/drm/msm/dp/dp_display.c           |  2 ++
>  drivers/gpu/drm/msm/dsi/dsi.c                 |  1 +
>  drivers/gpu/drm/msm/dsi/dsi.h                 |  1 +
>  drivers/gpu/drm/msm/dsi/dsi_host.c            | 15 ++++++++++-
>  drivers/gpu/drm/msm/msm_drv.c                 | 26 ++++++++++++++++++-
>  drivers/gpu/drm/msm/msm_drv.h                 |  3 ++-
>  17 files changed, 108 insertions(+), 15 deletions(-)
>

[snip]

> diff --git a/drivers/gpu/drm/msm/msm_drv.c b/drivers/gpu/drm/msm/msm_drv.c
> index f6fb0187388f..df505a3d53e8 100644
> --- a/drivers/gpu/drm/msm/msm_drv.c
> +++ b/drivers/gpu/drm/msm/msm_drv.c
> @@ -17,8 +17,8 @@
>  #include <drm/drm_prime.h>
>  #include <drm/drm_of.h>
>  #include <drm/drm_vblank.h>
> -#include "dpu_dbg.h"
>
> +#include "dpu_dbg.h"
>  #include "msm_drv.h"
>  #include "msm_debugfs.h"
>  #include "msm_fence.h"
> @@ -166,6 +166,24 @@ void __iomem *msm_ioremap_quiet(struct platform_device *pdev, const char *name,
>         return _msm_ioremap(pdev, name, dbgname, true);
>  }
>
> +unsigned long msm_iomap_size(struct platform_device *pdev, const char *name)
> +{
> +       struct resource *res;
> +
> +       if (name)
> +               res = platform_get_resource_byname(pdev, IORESOURCE_MEM, name);
> +       else
> +               res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
> +
> +       if (!res) {
> +               dev_dbg(&pdev->dev, "failed to get memory resource: %s\n",
> +                               name);
> +               return 0;
> +       }
> +
> +       return resource_size(res);
> +}
> +
>  void msm_writel(u32 data, void __iomem *addr)
>  {
>         if (reglog)
> @@ -535,6 +553,8 @@ static int msm_drm_init(struct device *dev, struct drm_driver *drv)
>         if (ret)
>                 goto err_msm_uninit;
>
> +       dpu_dbg_register_drm_dev(ddev);
> +
>         drm_mode_config_reset(ddev);
>
>  #ifdef CONFIG_DRM_FBDEV_EMULATION
> @@ -1282,6 +1302,10 @@ static int msm_pdev_probe(struct platform_device *pdev)
>         int ret;
>
>         if (get_mdp_ver(pdev)) {
> +               ret = dpu_dbg_init(&pdev->dev);
> +               if (ret)
> +                       pr_err("dpu_dbg_init failed ret = %d\n", ret);
> +
>                 ret = add_display_components(&pdev->dev, &match);
>                 if (ret)
>                         return ret;

I'm a bit skeptical about where you are registering/initializing dpu
dbg.. what happens on mdp4/mdp5 devices?

BR,
-R
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
