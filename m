Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 301AF46EE40
	for <lists+dri-devel@lfdr.de>; Thu,  9 Dec 2021 17:55:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4DCA110E303;
	Thu,  9 Dec 2021 16:53:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-xd33.google.com (mail-io1-xd33.google.com
 [IPv6:2607:f8b0:4864:20::d33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 29A0810E116
 for <dri-devel@lists.freedesktop.org>; Thu,  9 Dec 2021 06:29:57 +0000 (UTC)
Received: by mail-io1-xd33.google.com with SMTP id p23so5454767iod.7
 for <dri-devel@lists.freedesktop.org>; Wed, 08 Dec 2021 22:29:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Q8iVKmula6kup2FggoACJYgOZKL5qkbL208e7B7YSZ0=;
 b=lIsVrGsHT/UrtLfGXyU57lgKV3+kffBBbS8DOnD4PJqXXM+TcoGFb8Aa7vvsW3mFj7
 GcILKQXBND1a2zNPqau8LY8JYlD9v1p/XyNrCvwquWQKTgZge72zMANLefatUAVOCUqS
 ShKC5y65hWZ2c6w6o5LRBc2TX71bQ8XZHklFk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Q8iVKmula6kup2FggoACJYgOZKL5qkbL208e7B7YSZ0=;
 b=f36roMg6nV7I8+9TsKBlj4jt4I66FwysubzdlySmfWmYIK3m9dGUlp7+aBUgI6gGhf
 +pwJaLhnqXflN4nfhDOXQ7nvfnTRHnuEzd+9eqDAC5iTjH/50r1MWsxK7fY4dLoTpq8g
 OresKTJ9g7uSeB2KSden1DMf1TtpYCfXmN9u9mVGpq18N8SL/C7j43u1l65S2Gdq9NP3
 i3Q/CMBylTK7FoRi0pE0EJpNxknVFNxdZMhteTj8abcBTuzEuWnnbhOrSXGoLqc11+E0
 hxAsaDw1r7QgBOAXXZ+4clTmHeGNJDs12+Ah2gdsDnUBR+7iWaRF/1l8V8u63blUScTb
 GHng==
X-Gm-Message-State: AOAM532IpWwYiWsbxAi80d1jcGAbXhUD13atFDDn4xYJ37kkxoquwHx0
 N4gljB/eNaarLVxP0vqsHIqFoNhVig40t89lGDhAhQ==
X-Google-Smtp-Source: ABdhPJz1ziC9jdN583VzYZiyMCss/621HPuZKoxSvszO++lZ7FQD6vUcUIB1z0a0HEZnAytrVVflJqwOW8m4dTCGqDg=
X-Received: by 2002:a6b:2bc3:: with SMTP id
 r186mr12772991ior.167.1639031396270; 
 Wed, 08 Dec 2021 22:29:56 -0800 (PST)
MIME-Version: 1.0
References: <20211110130623.20553-1-granquet@baylibre.com>
 <20211110130623.20553-8-granquet@baylibre.com>
In-Reply-To: <20211110130623.20553-8-granquet@baylibre.com>
From: Hsin-Yi Wang <hsinyi@chromium.org>
Date: Thu, 9 Dec 2021 14:29:30 +0800
Message-ID: <CAJMQK-gGE78qZoR92d8OH6_vTzBR5ry04nKGS22Dw48vAo7+AA@mail.gmail.com>
Subject: Re: [PATCH v6 7/7] drm/mediatek: Add mt8195 DisplayPort driver
To: Guillaume Ranquet <granquet@baylibre.com>
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
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@linux.ie>,
 linux-kernel@vger.kernel.org, Markus Schneider-Pargmann <msp@baylibre.com>,
 linux-mediatek@lists.infradead.org, dri-devel@lists.freedesktop.org,
 Matthias Brugger <matthias.bgg@gmail.com>,
 linux-arm-kernel@lists.infradead.org, kernel test robot <lkp@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Nov 10, 2021 at 9:08 PM Guillaume Ranquet <granquet@baylibre.com> wrote:
>
> From: Markus Schneider-Pargmann <msp@baylibre.com>
>
> This patch adds a DisplayPort driver for the Mediatek mt8195 SoC and a
> according phy driver mediatek-dp-phy.
>
> It supports both functional units on the mt8195, the embedded
> DisplayPort as well as the external DisplayPort units. It offers
> hot-plug-detection, audio up to 8 channels, and DisplayPort 1.4 with up
> to 4 lanes.
>
> The driver creates a child device for the phy. The child device will
> never exist without the parent being active. As they are sharing a
> register range, the parent passes a regmap pointer to the child so that
> both can work with the same register range. The phy driver sets device
> data that is read by the parent to get the phy device that can be used
> to control the phy properties.
>
> This driver is based on an initial version by
> Jason-JH.Lin <jason-jh.lin@mediatek.com>.
>
> Signed-off-by: Markus Schneider-Pargmann <msp@baylibre.com>
> Signed-off-by: Guillaume Ranquet <granquet@baylibre.com>
> Reported-by: kernel test robot <lkp@intel.com>
> ---


<snip>

> +static int mtk_dp_probe(struct platform_device *pdev)
> +{
> +       struct mtk_dp *mtk_dp;
> +       struct device *dev = &pdev->dev;
> +       int ret;
> +       int irq_num = 0;
> +       struct drm_panel *panel = NULL;
> +
> +       mtk_dp = devm_kzalloc(dev, sizeof(*mtk_dp), GFP_KERNEL);
> +       if (!mtk_dp)
> +               return -ENOMEM;
> +
> +       mtk_dp->dev = dev;
> +
> +       irq_num = platform_get_irq(pdev, 0);
> +       if (irq_num < 0) {
> +               dev_err(dev, "failed to request dp irq resource\n");
> +               return -EPROBE_DEFER;
> +       }
> +
> +       ret = drm_of_find_panel_or_bridge(dev->of_node, 1, 0, &panel,
> +                                         &mtk_dp->next_bridge);
> +       if (ret == -ENODEV) {
> +               dev_info(
> +                       dev,
> +                       "No panel connected in devicetree, continuing as external DP\n");
> +               mtk_dp->next_bridge = NULL;
> +       } else if (ret) {
> +               dev_err(dev, "Failed to find panel or bridge: %d\n", ret);

Hi,

We're seeing
[    0.424599] mediatek-drm-dp 1c500000.edp_tx: Failed to find panel
or bridge: -517

It's probably better to use dev_err_probe here.

Thanks

> +               return ret;
> +       }
> +
> +       if (panel) {
> +               mtk_dp->next_bridge = devm_drm_panel_bridge_add(dev, panel);
> +               if (IS_ERR(mtk_dp->next_bridge)) {
> +                       ret = PTR_ERR(mtk_dp->next_bridge);
> +                       dev_err(dev, "Failed to create bridge: %d\n", ret);
> +                       return -EPROBE_DEFER;
> +               }
> +       }


<snip>

> _______________________________________________
> Linux-mediatek mailing list
> Linux-mediatek@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-mediatek
