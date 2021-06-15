Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D5A3D3A8698
	for <lists+dri-devel@lfdr.de>; Tue, 15 Jun 2021 18:35:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A32D46E364;
	Tue, 15 Jun 2021 16:35:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-xb2d.google.com (mail-yb1-xb2d.google.com
 [IPv6:2607:f8b0:4864:20::b2d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A895A6E364
 for <dri-devel@lists.freedesktop.org>; Tue, 15 Jun 2021 16:35:18 +0000 (UTC)
Received: by mail-yb1-xb2d.google.com with SMTP id f84so21484967ybg.0
 for <dri-devel@lists.freedesktop.org>; Tue, 15 Jun 2021 09:35:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=XrIsCHyX+bwWzHgbgovzre+ZaaHXJKaZn7XOa25gCec=;
 b=PatCXQETHYY9XZ53afwA59txjpJweu9t/dPWH0nW1HR1SILNwO2DdXJtbx9J85d7QI
 U7tij/eGyHFT+l7qc7GooDpf5c60GchUnckhE8JJKnO5TDShvhzAsONxp/jt0LzWv4s2
 C2PeXQoIO6RSoOvBXqc/Cz3fM7tRxUGRaCbF2hJvLM/STZID1CiOHG43t5fBmWnpY+vz
 w31s09Ap9J1yAKXMZ5gGYrR7HwB5Vb0WgMhSx5uzwTgG7osSm3ePD2SPurgEm4wVIOAN
 hkRpiesf9uAip3kNQQ+9/6a6LXSu/L8PodQEecQL/nEkNrStRlSBkGdMzTSTXJHI6L1g
 jV3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=XrIsCHyX+bwWzHgbgovzre+ZaaHXJKaZn7XOa25gCec=;
 b=ouRkqWYx6L0d0woaKiM6AMFo9bLUixSs+3EDjwKBR7/qlMKdfNNn6mV2he11lw6/v9
 LZ2ikmiQGHd0SBaYeFRL8xr9wWgY85Atqo4FOl+qKRgSoeqONUH2F3EHlp61hOQ3OOa0
 JtIlBJP+IdJaeiUwy96Yu7p5ObRkBD5KdkYIt9jPNWmr3d4XzII+8u5xdCKNZQmQ0Myi
 43P2Q5Nr6kF4ja0Tx8jdA4HC7gMc+DONIeVWU7F9M9rBKzbatZB6QP4HSzQ8szsnM4vP
 99voRDU0ofYXC86n2MgozxnqDJWNpKVh8r228jouRFRvqYkhrCZPdcfTspiISlSsAlLA
 Yw8g==
X-Gm-Message-State: AOAM533AAvKX7JVeYkNVl01tNubXuvD3wgqzXIiTbvFjKhkxitZNd6TP
 B1P+gfj7wo3q4pjXbLpFJ5+wZs1OLMfbaGvAA2LcoA==
X-Google-Smtp-Source: ABdhPJwyQ8m9Ejz1YcCBf9T7Kr9DLxB3/0BYL2DarvqJ36C7cAcoJIt/7AFjv3HJlKAazPAs4JIc1SNyHVjleVgV+0U=
X-Received: by 2002:a25:bb4e:: with SMTP id b14mr20894ybk.412.1623774917738;
 Tue, 15 Jun 2021 09:35:17 -0700 (PDT)
MIME-Version: 1.0
References: <20210615155009.62894-1-sashal@kernel.org>
 <20210615155009.62894-5-sashal@kernel.org>
In-Reply-To: <20210615155009.62894-5-sashal@kernel.org>
From: Saravana Kannan <saravanak@google.com>
Date: Tue, 15 Jun 2021 09:34:41 -0700
Message-ID: <CAGETcx9-ahe0OBaHvxV+YP6cYpQQ3qsFjJFnZWPjTEWXr278MQ@mail.gmail.com>
Subject: Re: [PATCH AUTOSEL 4.19 05/12] drm/sun4i: dw-hdmi: Make HDMI PHY into
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

Not needed. fw_devlink isn't present in 4.19.

-Saravana

>
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
> index 5073622cbb56..ab048f9412e7 100644
> --- a/drivers/gpu/drm/sun4i/sun8i_dw_hdmi.c
> +++ b/drivers/gpu/drm/sun4i/sun8i_dw_hdmi.c
> @@ -144,7 +144,7 @@ static int sun8i_dw_hdmi_bind(struct device *dev, struct device *master,
>                 goto err_disable_clk_tmds;
>         }
>
> -       ret = sun8i_hdmi_phy_probe(hdmi, phy_node);
> +       ret = sun8i_hdmi_phy_get(hdmi, phy_node);
>         of_node_put(phy_node);
>         if (ret) {
>                 dev_err(dev, "Couldn't get the HDMI PHY\n");
> @@ -179,7 +179,6 @@ static int sun8i_dw_hdmi_bind(struct device *dev, struct device *master,
>
>  cleanup_encoder:
>         drm_encoder_cleanup(encoder);
> -       sun8i_hdmi_phy_remove(hdmi);
>  err_disable_clk_tmds:
>         clk_disable_unprepare(hdmi->clk_tmds);
>  err_assert_ctrl_reset:
> @@ -194,7 +193,6 @@ static void sun8i_dw_hdmi_unbind(struct device *dev, struct device *master,
>         struct sun8i_dw_hdmi *hdmi = dev_get_drvdata(dev);
>
>         dw_hdmi_unbind(hdmi->hdmi);
> -       sun8i_hdmi_phy_remove(hdmi);
>         clk_disable_unprepare(hdmi->clk_tmds);
>         reset_control_assert(hdmi->rst_ctrl);
>  }
> @@ -230,7 +228,32 @@ static struct platform_driver sun8i_dw_hdmi_pltfm_driver = {
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
> index aadbe0a10b0c..41355bf3aca8 100644
> --- a/drivers/gpu/drm/sun4i/sun8i_dw_hdmi.h
> +++ b/drivers/gpu/drm/sun4i/sun8i_dw_hdmi.h
> @@ -179,14 +179,15 @@ struct sun8i_dw_hdmi {
>         struct reset_control            *rst_ctrl;
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
>  const struct dw_hdmi_phy_ops *sun8i_hdmi_phy_get_ops(void);
> diff --git a/drivers/gpu/drm/sun4i/sun8i_hdmi_phy.c b/drivers/gpu/drm/sun4i/sun8i_hdmi_phy.c
> index dc9b1398adb9..7e7a81f9d29a 100644
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
> @@ -433,10 +434,30 @@ static const struct of_device_id sun8i_hdmi_phy_of_table[] = {
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
> @@ -540,7 +561,7 @@ int sun8i_hdmi_phy_probe(struct sun8i_dw_hdmi *hdmi, struct device_node *node)
>                 clk_prepare_enable(phy->clk_phy);
>         }
>
> -       hdmi->phy = phy;
> +       platform_set_drvdata(pdev, phy);
>
>         return 0;
>
> @@ -564,9 +585,9 @@ int sun8i_hdmi_phy_probe(struct sun8i_dw_hdmi *hdmi, struct device_node *node)
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
> @@ -580,4 +601,14 @@ void sun8i_hdmi_phy_remove(struct sun8i_dw_hdmi *hdmi)
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
