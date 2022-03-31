Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F6B34EDDE0
	for <lists+dri-devel@lfdr.de>; Thu, 31 Mar 2022 17:50:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 96C9F10E2F3;
	Thu, 31 Mar 2022 15:50:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x636.google.com (mail-pl1-x636.google.com
 [IPv6:2607:f8b0:4864:20::636])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 430F610E2F3
 for <dri-devel@lists.freedesktop.org>; Thu, 31 Mar 2022 15:50:14 +0000 (UTC)
Received: by mail-pl1-x636.google.com with SMTP id x2so23785445plm.7
 for <dri-devel@lists.freedesktop.org>; Thu, 31 Mar 2022 08:50:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=yqEvmZp5vU2UVgZbehjpNxu1D4eQCJKqa27aMFPDgWA=;
 b=sOWv9T2YSUZHAMoIBKIYVCaBCqp+OGT4IqAskiG0lobetuxN7UDXSJK65SRBq8W3w/
 t2m7WiwY9bxS26TYFoUQES+CI3vuEOXc9LMFpamoCdBaCvvfCM3uwF15mafS9F5ETHpy
 RIdh+AkqSoGoRGwPYDt6aaaeTvXBGLgBZW4mIYU8oNhDD3IGj2X3pa0dOrZk1ZhSfwI0
 LO5yBivWFllEeu56raoxPp6xQT74jzMrlvV+2GeFCCx4JVyJp/m5BFPKsja2zs2aqj6t
 HlZQQoI9RcKIBLlO+Alf3o08u6H2sogg5faTIrQiLwue0MLHwSm12BpdzqcwtmNxmBQn
 H9Cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=yqEvmZp5vU2UVgZbehjpNxu1D4eQCJKqa27aMFPDgWA=;
 b=XhYDVlofkQeuWuuhHZyZusjpNCrnZFvpB5Ph9WxJ9i90NbDA+J6ufv5s9MTXHyy2T0
 4VEnfzFuEqK2Cqp0WUSdTTLxasYkCNsN3b6V6iJaL4ou5EO0iArZVOIuJuzsTb+Rcxay
 ro2hwHlvcowbuDAfdgvLALARNrvl4PkAXs7vQZFZCtcnmUxNilK28frSQPW+xn5kGWbh
 anJjQxg9xQCy8xqmkhHXv7ogErXvVDaN7wzg0ZCl2I+6s7+0UIbmjPH6lUFMZNAfG/v+
 XLOAzVqrHuOdHvRY+KZrbi7kGE1aWOM4SodBEPzrilUSUrKsb9wBd61ndWJlZsq8pHdO
 iyVw==
X-Gm-Message-State: AOAM5324uZ6cSs9+hZ/3DCyHyPpkKVMO/xcqez7YOoEjClAgGXVAbGGe
 Bifcnz/w+7aAPoIYjxMaKfF4ZsJoliYcbIHg8uwdlg==
X-Google-Smtp-Source: ABdhPJwT6b/RdcNOopFkCgcWalt63bvS+l6AWT1keFjFVyk8g9kU/ie8vSElpJ2vYNvVwYns0VmSG0zz7iKKhLMP89o=
X-Received: by 2002:a17:903:30c4:b0:153:c102:8b9a with SMTP id
 s4-20020a17090330c400b00153c1028b9amr41831854plc.21.1648741813784; Thu, 31
 Mar 2022 08:50:13 -0700 (PDT)
MIME-Version: 1.0
References: <20220331154503.66054-1-jagan@amarulasolutions.com>
 <20220331154503.66054-3-jagan@amarulasolutions.com>
In-Reply-To: <20220331154503.66054-3-jagan@amarulasolutions.com>
From: Robert Foss <robert.foss@linaro.org>
Date: Thu, 31 Mar 2022 17:50:02 +0200
Message-ID: <CAG3jFystEb+QysYVY=qjUp9cOZDg9rRVuM7mi-PJwpF1cr612w@mail.gmail.com>
Subject: Re: [PATCH v4 3/5] drm: bridge: mtk_dsi: Switch to
 devm_drm_of_get_bridge
To: Jagan Teki <jagan@amarulasolutions.com>
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
 Neil Armstrong <narmstrong@baylibre.com>, Sam Ravnborg <sam@ravnborg.org>,
 dri-devel@lists.freedesktop.org,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>, linux-amarula@amarulasolutions.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, 31 Mar 2022 at 17:45, Jagan Teki <jagan@amarulasolutions.com> wrote:
>
> devm_drm_of_get_bridge is capable of looking up the downstream
> bridge and panel and trying to add a panel bridge if the panel
> is found.
>
> Replace explicit finding calls with devm_drm_of_get_bridge.
>
> Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>
> Cc: Philipp Zabel <p.zabel@pengutronix.de>
> Signed-off-by: Jagan Teki <jagan@amarulasolutions.com>
> ---
> Changes for v4, v3:
> - none
> Changes for v2:
> - split the patch
>
>  drivers/gpu/drm/mediatek/mtk_dsi.c | 14 +++-----------
>  1 file changed, 3 insertions(+), 11 deletions(-)
>
> diff --git a/drivers/gpu/drm/mediatek/mtk_dsi.c b/drivers/gpu/drm/mediatek/mtk_dsi.c
> index e91b3fff4342..1487cc308c5d 100644
> --- a/drivers/gpu/drm/mediatek/mtk_dsi.c
> +++ b/drivers/gpu/drm/mediatek/mtk_dsi.c
> @@ -1016,7 +1016,6 @@ static int mtk_dsi_probe(struct platform_device *pdev)
>  {
>         struct mtk_dsi *dsi;
>         struct device *dev = &pdev->dev;
> -       struct drm_panel *panel;
>         struct resource *regs;
>         int irq_num;
>         int ret;
> @@ -1033,17 +1032,10 @@ static int mtk_dsi_probe(struct platform_device *pdev)
>                 return ret;
>         }
>
> -       ret = drm_of_find_panel_or_bridge(dev->of_node, 0, 0,
> -                                         &panel, &dsi->next_bridge);
> -       if (ret)
> +       dsi->next_bridge = devm_drm_of_get_bridge(dev, dev->of_node, 0, 0);
> +       if (IS_ERR(dsi->next_bridge)) {
> +               ret = PTR_ERR(dsi->next_bridge);
>                 goto err_unregister_host;
> -
> -       if (panel) {
> -               dsi->next_bridge = devm_drm_panel_bridge_add(dev, panel);
> -               if (IS_ERR(dsi->next_bridge)) {
> -                       ret = PTR_ERR(dsi->next_bridge);
> -                       goto err_unregister_host;
> -               }
>         }
>
>         dsi->driver_data = of_device_get_match_data(dev);
> --
> 2.25.1
>

Reviewed-by: Robert Foss <robert.foss@linaro.org>
