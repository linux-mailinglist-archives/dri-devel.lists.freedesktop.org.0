Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 563694C9AAC
	for <lists+dri-devel@lfdr.de>; Wed,  2 Mar 2022 02:47:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0B15410E33A;
	Wed,  2 Mar 2022 01:47:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-x732.google.com (mail-qk1-x732.google.com
 [IPv6:2607:f8b0:4864:20::732])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C57FC10E1CF
 for <dri-devel@lists.freedesktop.org>; Wed,  2 Mar 2022 01:47:44 +0000 (UTC)
Received: by mail-qk1-x732.google.com with SMTP id d84so154550qke.8
 for <dri-devel@lists.freedesktop.org>; Tue, 01 Mar 2022 17:47:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Mgf1HAXmo18JSbss+8HqPirEGYISw1T1YWytow0MUCs=;
 b=LUX5mz/uFs1tXRIyjHFWvNomENb+XL1uTGGmGp/Sv0C6k7AU6+O+nZ+rrdxX/q7eay
 yoSXrmjDlwwTx1wsjkJzkiLYjjYRCc9nuqfKyJP8LsiR6WEmdPP8+KjhPfJSs4UTJk0U
 MOv9Z0S2VDibn98ytvyhkhI9BGvz28EloqmS+aOiYl0LYBsEF1ot8nHSriUKtIsCFGLW
 1tljeoqleRlL+iNjA1iX6fuTt/t8hfnW03BQspKnkljtUFnOmRjEcUzzQxxWV/qw5wmF
 qUS5bbz8u4Lyf4Tbx7pWT6qDrANRDkDsdJsqXXaIG6iT9yWHw87tJq+gWHPMB8P0bplS
 YF/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Mgf1HAXmo18JSbss+8HqPirEGYISw1T1YWytow0MUCs=;
 b=CzUU2LWG1ur2pZsZwVoO+1YKo0diPhp0Dki8ZpMvFIlMeZrUEkIqsdIePYvw1WN7iF
 PfmgApz72qeB1Y/qkch5kz4CuMQRrlSdeiYxtNUX/JAuYGl1rkDv8J1zkZdvbcafbaw5
 kYP761kQxFZUu8q1wcCMivLDCpmQs1R2VDBETixPlP4fCcTAow23d6i6tzgB05eekgV6
 77al0TP0v9BlnI0g09m6raMenWwOyNnb/gGlQxajmny+cyJU/sb34Dmj/hNbw88C+O7Y
 2ocz6CdMkJhniR/YUNBvB2NxWujH31LwVP7CBLSTx0ERB5/zjqvArlozpA5W2ap3UjaC
 39iw==
X-Gm-Message-State: AOAM533A80y0ERTXNRWo09s3Ab+UilxGu3kJ5nRW8uBxudAKMBG5XG7Q
 5xNcU3ULmKBSQIrTrNQXnlhYLOiPJpF9nEjCzuPQIRHzGxi3yA==
X-Google-Smtp-Source: ABdhPJzrU2fR07uEXITY9Nq9WB/Rf4BURiyOAXE3/3F5S7O6zXheS1LlqUyywuxrHbREKt0PcmAq73kOAe+5zjC2QGs=
X-Received: by 2002:a05:620a:4307:b0:507:d5b1:f65e with SMTP id
 u7-20020a05620a430700b00507d5b1f65emr15266386qko.363.1646185663888; Tue, 01
 Mar 2022 17:47:43 -0800 (PST)
MIME-Version: 1.0
References: <20220302012931.4107196-1-bjorn.andersson@linaro.org>
 <20220302012931.4107196-2-bjorn.andersson@linaro.org>
In-Reply-To: <20220302012931.4107196-2-bjorn.andersson@linaro.org>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Wed, 2 Mar 2022 04:47:32 +0300
Message-ID: <CAA8EJppiNbJhrdFgJ0sESBM5m3oyazS-8dG8919xdZu50fZ8aQ@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] drm/msm/dpu: Issue MDSS reset during initialization
To: Bjorn Andersson <bjorn.andersson@linaro.org>
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
Cc: devicetree@vger.kernel.org, Loic Poulain <loic.poulain@linaro.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
 linux-arm-msm@vger.kernel.org, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>, freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, 2 Mar 2022 at 04:27, Bjorn Andersson <bjorn.andersson@linaro.org> wrote:
>
> It's typical for the bootloader to bring up the display for showing a
> boot splash or efi framebuffer. But in some cases the kernel driver ends
> up only partially configuring (in particular) the DPU, which might
> result in e.g. that two different data paths attempts to push data to
> the interface - with resulting graphical artifacts.
>
> Naturally the end goal would be to inherit the bootloader's
> configuration and provide the user with a glitch free handover from the
> boot configuration to a running DPU.
>
> But as implementing seamless transition from the bootloader
> configuration to the running OS will be a considerable effort, start by
> simply resetting the entire MDSS to its power-on state, to avoid the
> partial configuration.
>
> Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
> ---
>
> Changes since v1:
> - Rather than trying to deconfigure individual pieces of the DPU, reset the
>   entire block.
>
>  drivers/gpu/drm/msm/disp/dpu1/dpu_mdss.c | 18 ++++++++++++++++++
>  drivers/gpu/drm/msm/msm_drv.c            |  4 ++++
>  drivers/gpu/drm/msm/msm_kms.h            |  1 +
>  3 files changed, 23 insertions(+)
>
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_mdss.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_mdss.c
> index b10ca505f9ac..419eaaefe606 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_mdss.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_mdss.c
> @@ -7,6 +7,7 @@
>  #include <linux/irqchip.h>
>  #include <linux/irqdesc.h>
>  #include <linux/irqchip/chained_irq.h>
> +#include <linux/reset.h>
>  #include "dpu_kms.h"
>
>  #define to_dpu_mdss(x) container_of(x, struct dpu_mdss, base)
> @@ -31,6 +32,7 @@ struct dpu_mdss {
>         void __iomem *mmio;
>         struct clk_bulk_data *clocks;
>         size_t num_clocks;
> +       struct reset_control *reset;
>         struct dpu_irq_controller irq_controller;
>  };
>
> @@ -197,10 +199,18 @@ static void dpu_mdss_destroy(struct msm_mdss *mdss)
>         dpu_mdss->mmio = NULL;
>  }
>
> +static int dpu_mdss_reset(struct msm_mdss *mdss)
> +{
> +       struct dpu_mdss *dpu_mdss = to_dpu_mdss(mdss);
> +
> +       return reset_control_reset(dpu_mdss->reset);
> +}
> +
>  static const struct msm_mdss_funcs mdss_funcs = {
>         .enable = dpu_mdss_enable,
>         .disable = dpu_mdss_disable,
>         .destroy = dpu_mdss_destroy,
> +       .reset = dpu_mdss_reset,
>  };
>
>  int dpu_mdss_init(struct platform_device *pdev)
> @@ -227,6 +237,13 @@ int dpu_mdss_init(struct platform_device *pdev)
>         }
>         dpu_mdss->num_clocks = ret;
>
> +       dpu_mdss->reset = devm_reset_control_get_optional_exclusive(&pdev->dev, NULL);
> +       if (IS_ERR(dpu_mdss->reset)) {
> +               ret = PTR_ERR(dpu_mdss->reset);
> +               DPU_ERROR("failed to acquire mdss reset, ret=%d", ret);
> +               goto reset_parse_err;
> +       }
> +
>         dpu_mdss->base.dev = &pdev->dev;
>         dpu_mdss->base.funcs = &mdss_funcs;
>
> @@ -252,6 +269,7 @@ int dpu_mdss_init(struct platform_device *pdev)
>  irq_error:
>         _dpu_mdss_irq_domain_fini(dpu_mdss);
>  irq_domain_error:
> +reset_parse_err:
>  clk_parse_err:
>         if (dpu_mdss->mmio)
>                 devm_iounmap(&pdev->dev, dpu_mdss->mmio);
> diff --git a/drivers/gpu/drm/msm/msm_drv.c b/drivers/gpu/drm/msm/msm_drv.c
> index 129fa841ac22..7595f83da3f1 100644
> --- a/drivers/gpu/drm/msm/msm_drv.c
> +++ b/drivers/gpu/drm/msm/msm_drv.c
> @@ -388,6 +388,10 @@ static int msm_drm_init(struct device *dev, const struct drm_driver *drv)
>         if (ret)
>                 return ret;
>
> +       /* Issue a reset of the entire MDSS */
> +       if (priv->mdss && priv->mdss->funcs->reset)
> +               priv->mdss->funcs->reset(priv->mdss);
> +

I think this is incorrect. In this way reset happens after all
subdevice are probed. They might have programmed some state of the
corresponding block. The clocks are already registered, so the clock
framework will be out of sync.
I think the reset should happen before calling of_platform_populate(),
so the device state is consistent with the driver.

Also see the https://git.linaro.org/people/dmitry.baryshkov/kernel.git/log/?h=dpu-mdss-rework,
which reworks the mdss driver and mdss probing.

>         /* Bind all our sub-components: */
>         ret = component_bind_all(dev, ddev);
>         if (ret)
> diff --git a/drivers/gpu/drm/msm/msm_kms.h b/drivers/gpu/drm/msm/msm_kms.h
> index 2a4f0526cb98..716a34fca1cd 100644
> --- a/drivers/gpu/drm/msm/msm_kms.h
> +++ b/drivers/gpu/drm/msm/msm_kms.h
> @@ -205,6 +205,7 @@ struct msm_mdss_funcs {
>         int (*enable)(struct msm_mdss *mdss);
>         int (*disable)(struct msm_mdss *mdss);
>         void (*destroy)(struct msm_mdss *mdss);
> +       int (*reset)(struct msm_mdss *mdss);
>  };
>
>  struct msm_mdss {
> --
> 2.33.1
>


-- 
With best wishes
Dmitry
