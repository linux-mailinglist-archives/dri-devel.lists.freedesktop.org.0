Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D97CB3A8672
	for <lists+dri-devel@lfdr.de>; Tue, 15 Jun 2021 18:26:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 037606E40A;
	Tue, 15 Jun 2021 16:26:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-xb2f.google.com (mail-yb1-xb2f.google.com
 [IPv6:2607:f8b0:4864:20::b2f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 36B7B6E40A
 for <dri-devel@lists.freedesktop.org>; Tue, 15 Jun 2021 16:26:54 +0000 (UTC)
Received: by mail-yb1-xb2f.google.com with SMTP id p15so6198152ybe.6
 for <dri-devel@lists.freedesktop.org>; Tue, 15 Jun 2021 09:26:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=axnFf8hFhq6CeSn9dYxCAGJW/gxwZt3SQaGFtCETUzk=;
 b=Q60TauyOe0h3Wa+A019l6/TGMgTSSw4GAIiDi9+1P9OJLUgVAFBni6Znxkinlc1kYL
 Y5pE/QNZzRODHN0iarY7flEQbbdM/lU2wUOY/tsd/ICFr2t/dU06dEYFhzkYNnijMlh+
 SY6fUa2ze0YWe3PHeOEK1/9uMEy26J0LNF1z6O9RpYkbAIClMVPsRkC6VVIGV6quoM57
 bCn+wf1Llcv61sru/hynO4uMYwhERMTDzySy8ZT6LBsWTrDMR5MjmdyREIS+kg8weVgC
 t3x5CjdUGmauD/9mK6aVXhPO27WJpnSUm7qSbTAn4L5tWNsj0DiYmeLkmmttOdsjgPP3
 ER6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=axnFf8hFhq6CeSn9dYxCAGJW/gxwZt3SQaGFtCETUzk=;
 b=k6DaPcF/ihYPq6R326WTVnSyDYNY6eyfaAZQQRQGCE8oZkrn9q187JEfafk9Ygyw/E
 sxu8wC7bmoqYIUQDZ5CRb7B0RybUIIuij9jAg/BO4xrrNymOADWpv0LSJerJl/5Qf6Oy
 jtfcUvCaxzuiUjYfrG7E5tJRQsfrFamF0hDBu2VL3uA+/5uOyRwdtvqXhReXbcZD8pvr
 reeHxjJ9cXLmS25YAsvDn2fdfcdEao83EGsZ2XHyAEF9uDku4WbeDL9lHvOxIiz8dW9D
 A3Ryp3lM4dkbVZ6puWo020+VMeW3aC/DzQm7We8kcgoD8ry9E6CwPSdoHE3YbXKp7LKE
 Ty7w==
X-Gm-Message-State: AOAM530Cwqea1BLPyRZMQzF87C+g5qYovGvNnCpIVcJX7akH4BGPmTvP
 FKwVWZlV5/+a9HMrwtkff+0Pbn75mFpf2I8qj3HAFA==
X-Google-Smtp-Source: ABdhPJxwI4uYCPP+SkNAuD8FHpVqTm3ELhRvcDpyv/2o1O9RdKW6gsCxYGkRy9Rpuol9X/B4l5EnCq81faTXNdbMhMs=
X-Received: by 2002:a25:bb46:: with SMTP id b6mr31808728ybk.346.1623774412801; 
 Tue, 15 Jun 2021 09:26:52 -0700 (PDT)
MIME-Version: 1.0
References: <20210615154948.62711-1-sashal@kernel.org>
 <20210615154948.62711-7-sashal@kernel.org>
In-Reply-To: <20210615154948.62711-7-sashal@kernel.org>
From: Saravana Kannan <saravanak@google.com>
Date: Tue, 15 Jun 2021 09:26:16 -0700
Message-ID: <CAGETcx95bOAHiOm0MHqFWSbc8ONBPEzXbDyP82pO4B5o2QOX1A@mail.gmail.com>
Subject: Re: [PATCH AUTOSEL 5.4 07/15] drm/sun4i: dw-hdmi: Make HDMI PHY into
 a platform device
To: Sasha Levin <sashal@kernel.org>
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
Cc: Ondrej Jirman <megous@megous.com>, Andre Przywara <andre.przywara@arm.com>,
 LKML <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>, stable <stable@vger.kernel.org>,
 "open list:ARM/Allwinner sunXi SoC support" <linux-sunxi@lists.linux.dev>,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
 Maxime Ripard <maxime@cerno.tech>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Jun 15, 2021 at 8:50 AM Sasha Levin <sashal@kernel.org> wrote:
>
> From: Saravana Kannan <saravanak@google.com>
>
> [ Upstream commit 9bf3797796f570b34438235a6a537df85832bdad ]
>
> On sunxi boards that use HDMI output, HDMI device probe keeps being
> avoided indefinitely with these repeated messages in dmesg:
>
>   platform 1ee0000.hdmi: probe deferral - supplier 1ef0000.hdmi-phy
>     not ready
>
> There's a fwnode_link being created with fw_devlink=on between hdmi
> and hdmi-phy nodes, because both nodes have 'compatible' property set.
>
> Fw_devlink code assumes that nodes that have compatible property
> set will also have a device associated with them by some driver
> eventually. This is not the case with the current sun8i-hdmi
> driver.
>

fw_devlink isn't present in 5.4 or earlier. So technically this patch
isn't needed.

-Saravana

> This commit makes sun8i-hdmi-phy into a proper platform device
> and fixes the display pipeline probe on sunxi boards that use HDMI.
>
> More context: https://lkml.org/lkml/2021/5/16/203
>
> Signed-off-by: Saravana Kannan <saravanak@google.com>
> Signed-off-by: Ondrej Jirman <megous@megous.com>
> Tested-by: Andre Przywara <andre.przywara@arm.com>
> Signed-off-by: Maxime Ripard <maxime@cerno.tech>
> Link: https://patchwork.freedesktop.org/patch/msgid/20210607085836.2827429-1-megous@megous.com
> Signed-off-by: Sasha Levin <sashal@kernel.org>
> ---
>  drivers/gpu/drm/sun4i/sun8i_dw_hdmi.c  | 31 ++++++++++++++++---
>  drivers/gpu/drm/sun4i/sun8i_dw_hdmi.h  |  5 ++--
>  drivers/gpu/drm/sun4i/sun8i_hdmi_phy.c | 41 ++++++++++++++++++++++----
>  3 files changed, 66 insertions(+), 11 deletions(-)
>
> diff --git a/drivers/gpu/drm/sun4i/sun8i_dw_hdmi.c b/drivers/gpu/drm/sun4i/sun8i_dw_hdmi.c
> index 8f721be26477..cfb63cae4b12 100644
> --- a/drivers/gpu/drm/sun4i/sun8i_dw_hdmi.c
> +++ b/drivers/gpu/drm/sun4i/sun8i_dw_hdmi.c
> @@ -211,7 +211,7 @@ static int sun8i_dw_hdmi_bind(struct device *dev, struct device *master,
>                 goto err_disable_clk_tmds;
>         }
>
> -       ret = sun8i_hdmi_phy_probe(hdmi, phy_node);
> +       ret = sun8i_hdmi_phy_get(hdmi, phy_node);
>         of_node_put(phy_node);
>         if (ret) {
>                 dev_err(dev, "Couldn't get the HDMI PHY\n");
> @@ -244,7 +244,6 @@ static int sun8i_dw_hdmi_bind(struct device *dev, struct device *master,
>
>  cleanup_encoder:
>         drm_encoder_cleanup(encoder);
> -       sun8i_hdmi_phy_remove(hdmi);
>  err_disable_clk_tmds:
>         clk_disable_unprepare(hdmi->clk_tmds);
>  err_assert_ctrl_reset:
> @@ -265,7 +264,6 @@ static void sun8i_dw_hdmi_unbind(struct device *dev, struct device *master,
>         struct sun8i_dw_hdmi *hdmi = dev_get_drvdata(dev);
>
>         dw_hdmi_unbind(hdmi->hdmi);
> -       sun8i_hdmi_phy_remove(hdmi);
>         clk_disable_unprepare(hdmi->clk_tmds);
>         reset_control_assert(hdmi->rst_ctrl);
>         gpiod_set_value(hdmi->ddc_en, 0);
> @@ -322,7 +320,32 @@ static struct platform_driver sun8i_dw_hdmi_pltfm_driver = {
>                 .of_match_table = sun8i_dw_hdmi_dt_ids,
>         },
>  };
> -module_platform_driver(sun8i_dw_hdmi_pltfm_driver);
> +
> +static int __init sun8i_dw_hdmi_init(void)
> +{
> +       int ret;
> +
> +       ret = platform_driver_register(&sun8i_dw_hdmi_pltfm_driver);
> +       if (ret)
> +               return ret;
> +
> +       ret = platform_driver_register(&sun8i_hdmi_phy_driver);
> +       if (ret) {
> +               platform_driver_unregister(&sun8i_dw_hdmi_pltfm_driver);
> +               return ret;
> +       }
> +
> +       return ret;
> +}
> +
> +static void __exit sun8i_dw_hdmi_exit(void)
> +{
> +       platform_driver_unregister(&sun8i_dw_hdmi_pltfm_driver);
> +       platform_driver_unregister(&sun8i_hdmi_phy_driver);
> +}
> +
> +module_init(sun8i_dw_hdmi_init);
> +module_exit(sun8i_dw_hdmi_exit);
>
>  MODULE_AUTHOR("Jernej Skrabec <jernej.skrabec@siol.net>");
>  MODULE_DESCRIPTION("Allwinner DW HDMI bridge");
> diff --git a/drivers/gpu/drm/sun4i/sun8i_dw_hdmi.h b/drivers/gpu/drm/sun4i/sun8i_dw_hdmi.h
> index d707c9171824..5a299a6f5aa5 100644
> --- a/drivers/gpu/drm/sun4i/sun8i_dw_hdmi.h
> +++ b/drivers/gpu/drm/sun4i/sun8i_dw_hdmi.h
> @@ -194,14 +194,15 @@ struct sun8i_dw_hdmi {
>         struct gpio_desc                *ddc_en;
>  };
>
> +extern struct platform_driver sun8i_hdmi_phy_driver;
> +
>  static inline struct sun8i_dw_hdmi *
>  encoder_to_sun8i_dw_hdmi(struct drm_encoder *encoder)
>  {
>         return container_of(encoder, struct sun8i_dw_hdmi, encoder);
>  }
>
> -int sun8i_hdmi_phy_probe(struct sun8i_dw_hdmi *hdmi, struct device_node *node);
> -void sun8i_hdmi_phy_remove(struct sun8i_dw_hdmi *hdmi);
> +int sun8i_hdmi_phy_get(struct sun8i_dw_hdmi *hdmi, struct device_node *node);
>
>  void sun8i_hdmi_phy_init(struct sun8i_hdmi_phy *phy);
>  void sun8i_hdmi_phy_set_ops(struct sun8i_hdmi_phy *phy,
> diff --git a/drivers/gpu/drm/sun4i/sun8i_hdmi_phy.c b/drivers/gpu/drm/sun4i/sun8i_hdmi_phy.c
> index a4012ec13d4b..c6289328c874 100644
> --- a/drivers/gpu/drm/sun4i/sun8i_hdmi_phy.c
> +++ b/drivers/gpu/drm/sun4i/sun8i_hdmi_phy.c
> @@ -5,6 +5,7 @@
>
>  #include <linux/delay.h>
>  #include <linux/of_address.h>
> +#include <linux/of_platform.h>
>
>  #include "sun8i_dw_hdmi.h"
>
> @@ -596,10 +597,30 @@ static const struct of_device_id sun8i_hdmi_phy_of_table[] = {
>         { /* sentinel */ }
>  };
>
> -int sun8i_hdmi_phy_probe(struct sun8i_dw_hdmi *hdmi, struct device_node *node)
> +int sun8i_hdmi_phy_get(struct sun8i_dw_hdmi *hdmi, struct device_node *node)
> +{
> +       struct platform_device *pdev = of_find_device_by_node(node);
> +       struct sun8i_hdmi_phy *phy;
> +
> +       if (!pdev)
> +               return -EPROBE_DEFER;
> +
> +       phy = platform_get_drvdata(pdev);
> +       if (!phy)
> +               return -EPROBE_DEFER;
> +
> +       hdmi->phy = phy;
> +
> +       put_device(&pdev->dev);
> +
> +       return 0;
> +}
> +
> +static int sun8i_hdmi_phy_probe(struct platform_device *pdev)
>  {
>         const struct of_device_id *match;
> -       struct device *dev = hdmi->dev;
> +       struct device *dev = &pdev->dev;
> +       struct device_node *node = dev->of_node;
>         struct sun8i_hdmi_phy *phy;
>         struct resource res;
>         void __iomem *regs;
> @@ -703,7 +724,7 @@ int sun8i_hdmi_phy_probe(struct sun8i_dw_hdmi *hdmi, struct device_node *node)
>                 clk_prepare_enable(phy->clk_phy);
>         }
>
> -       hdmi->phy = phy;
> +       platform_set_drvdata(pdev, phy);
>
>         return 0;
>
> @@ -727,9 +748,9 @@ int sun8i_hdmi_phy_probe(struct sun8i_dw_hdmi *hdmi, struct device_node *node)
>         return ret;
>  }
>
> -void sun8i_hdmi_phy_remove(struct sun8i_dw_hdmi *hdmi)
> +static int sun8i_hdmi_phy_remove(struct platform_device *pdev)
>  {
> -       struct sun8i_hdmi_phy *phy = hdmi->phy;
> +       struct sun8i_hdmi_phy *phy = platform_get_drvdata(pdev);
>
>         clk_disable_unprepare(phy->clk_mod);
>         clk_disable_unprepare(phy->clk_bus);
> @@ -743,4 +764,14 @@ void sun8i_hdmi_phy_remove(struct sun8i_dw_hdmi *hdmi)
>         clk_put(phy->clk_pll1);
>         clk_put(phy->clk_mod);
>         clk_put(phy->clk_bus);
> +       return 0;
>  }
> +
> +struct platform_driver sun8i_hdmi_phy_driver = {
> +       .probe  = sun8i_hdmi_phy_probe,
> +       .remove = sun8i_hdmi_phy_remove,
> +       .driver = {
> +               .name = "sun8i-hdmi-phy",
> +               .of_match_table = sun8i_hdmi_phy_of_table,
> +       },
> +};
> --
> 2.30.2
>
