Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 33AFF5311DA
	for <lists+dri-devel@lfdr.de>; Mon, 23 May 2022 18:17:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A78BA10FE60;
	Mon, 23 May 2022 16:17:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x102f.google.com (mail-pj1-x102f.google.com
 [IPv6:2607:f8b0:4864:20::102f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0FFFE10FE33
 for <dri-devel@lists.freedesktop.org>; Mon, 23 May 2022 16:17:28 +0000 (UTC)
Received: by mail-pj1-x102f.google.com with SMTP id
 a23-20020a17090acb9700b001df4e9f4870so14190150pju.1
 for <dri-devel@lists.freedesktop.org>; Mon, 23 May 2022 09:17:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=gVNiD7vP0L3vCHj36O4S/xcAq9fOvgGBuSkh3JaXOYE=;
 b=RWk6SuCADsteqryMbQGonZW8ugJLR0+nv3OTEZ1uCbffYsTcSuVqdso5JgZ8W3242o
 RN1FsTLhcwAu5xlb4KXNOCeLVDPBlFEevAR7XmLwMy7o4abbmCcpy1la2E6vng3M96Lb
 rouIWSDIYLek4Q6fi7PFuPDA1gpmlfwrFrcfCjibFVZmYrAIvkOFLNoI/Pu1zGwPTUGC
 LkDNIDxF2KZen43mQpFHQje5nePqY9oZyTrmRO319hMgohKDlrd4cDLJ8WeMWQU+Iiz6
 AqnlZ1W5uQqNDCU2igUpxf8UU+14OqFxspscIsOT3oifv6vUIdf3oP5juMLUKVlx1ERD
 Sg7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=gVNiD7vP0L3vCHj36O4S/xcAq9fOvgGBuSkh3JaXOYE=;
 b=O4EOYhM9CHtjqsaNQRzME5Pt0leZrgyk8bCbQty23oFnuVW7iReiACqfPdvB/yBmX8
 3zchdpMP0yiQd43mfgi62WTrtrnYqQX2G464fMso4m/79QW12Y9nDkD9W+Nz+cY2CzkI
 2dm3SU1VkECNJjvSpquCu6jr+Kj4fOlYhk/weTOKpBggzkdeCpvT48H0WPH7h8dqEsf5
 AruRXEBR2lAAfXlzElbvADnQCZ/xzRIT+wnW/r8WxeaVGOp/zdF64nUfeCBZzU3BK6j6
 n4FEbVxEnTXd/juxgKRzn0M+JFEwLNqXZ4CcMBw/ZyqP3Ofs3aE+fUZcLfqFuDIgOcay
 YKJA==
X-Gm-Message-State: AOAM5317vUGrDlAawuCyVJ0UvH8hVUAnec4aKe6aXpbM+EXN5nvrS8HW
 /QODxxsnQWnU6JdwIeDKQhzmbO7a95PA/oG4vsjD1g==
X-Google-Smtp-Source: ABdhPJyKf5MFfX+ZAnTFHA7p3LFDFK6zdI6kyxKzzlK8T2QiqbCeqyYwWZSaB8q7ekysEndtAEdUUlXRmo7QNdOfVc8=
X-Received: by 2002:a17:90b:380f:b0:1e0:aa6:9e24 with SMTP id
 mq15-20020a17090b380f00b001e00aa69e24mr15998545pjb.232.1653322647652; Mon, 23
 May 2022 09:17:27 -0700 (PDT)
MIME-Version: 1.0
References: <20220523161520.354687-1-robert.foss@linaro.org>
In-Reply-To: <20220523161520.354687-1-robert.foss@linaro.org>
From: Robert Foss <robert.foss@linaro.org>
Date: Mon, 23 May 2022 18:17:16 +0200
Message-ID: <CAG3jFyv=9xPh58Z2BOA-_t2CCPR4TOM43VuhE-_0C2OOaoUHAA@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] Revert "drm/bridge: anx7625: Use DPI bus type"
To: andrzej.hajda@intel.com, narmstrong@baylibre.com, robert.foss@linaro.org, 
 Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se,
 jernej.skrabec@gmail.com, 
 airlied@linux.ie, daniel@ffwll.ch, robh+dt@kernel.org, 
 krzysztof.kozlowski+dt@linaro.org, xji@analogixsemi.com, hsinyi@chromium.org, 
 sam@ravnborg.org, maxime@cerno.tech, tzimmermann@suse.de, 
 jose.exposito89@gmail.com, dri-devel@lists.freedesktop.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, 23 May 2022 at 18:15, Robert Foss <robert.foss@linaro.org> wrote:
>
> This reverts commit a77c2af0994e24ee36c7ffb6dc852770bdf06fb1.
>
> This patch depends on the patches just aplied to the media tree, and will
> not build without them, which leaves drm-misc-next in a broken state.
> Let's revert the two latter patches until rc1 has been branched,
> and rc1 has been backmerged into drm-misc-next.
>
> Signed-off-by: Robert Foss <robert.foss@linaro.org>
> Acked-by: Daniel Vetter <daniel.vetter@ffwll.ch>
> ---
>  drivers/gpu/drm/bridge/analogix/anx7625.c | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/gpu/drm/bridge/analogix/anx7625.c b/drivers/gpu/drm/bridge/analogix/anx7625.c
> index 0fab2aa47c67..e92eb4a40745 100644
> --- a/drivers/gpu/drm/bridge/analogix/anx7625.c
> +++ b/drivers/gpu/drm/bridge/analogix/anx7625.c
> @@ -1623,14 +1623,14 @@ static int anx7625_parse_dt(struct device *dev,
>
>         anx7625_get_swing_setting(dev, pdata);
>
> -       pdata->is_dpi = 0; /* default dsi mode */
> +       pdata->is_dpi = 1; /* default dpi mode */
>         pdata->mipi_host_node = of_graph_get_remote_node(np, 0, 0);
>         if (!pdata->mipi_host_node) {
>                 DRM_DEV_ERROR(dev, "fail to get internal panel.\n");
>                 return -ENODEV;
>         }
>
> -       bus_type = 0;
> +       bus_type = V4L2_FWNODE_BUS_TYPE_PARALLEL;
>         mipi_lanes = MAX_LANES_SUPPORT;
>         ep0 = of_graph_get_endpoint_by_regs(np, 0, 0);
>         if (ep0) {
> @@ -1641,8 +1641,8 @@ static int anx7625_parse_dt(struct device *dev,
>                 of_node_put(ep0);
>         }
>
> -       if (bus_type == V4L2_FWNODE_BUS_TYPE_DPI) /* bus type is DPI */
> -               pdata->is_dpi = 1;
> +       if (bus_type == V4L2_FWNODE_BUS_TYPE_PARALLEL) /* bus type is Parallel(DSI) */
> +               pdata->is_dpi = 0;
>
>         pdata->mipi_lanes = mipi_lanes;
>         if (pdata->mipi_lanes > MAX_LANES_SUPPORT || pdata->mipi_lanes <= 0)
> --
> 2.34.1
>

Series applied to drm-misc-next.
