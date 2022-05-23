Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CA3D530EB7
	for <lists+dri-devel@lfdr.de>; Mon, 23 May 2022 14:50:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 53F0310F506;
	Mon, 23 May 2022 12:50:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x52f.google.com (mail-pg1-x52f.google.com
 [IPv6:2607:f8b0:4864:20::52f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 80F2F10F505
 for <dri-devel@lists.freedesktop.org>; Mon, 23 May 2022 12:50:33 +0000 (UTC)
Received: by mail-pg1-x52f.google.com with SMTP id t28so5990488pga.6
 for <dri-devel@lists.freedesktop.org>; Mon, 23 May 2022 05:50:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to;
 bh=YfnB11KMaX602mBm0PnlrHM5pqQzJfF9oigF++xZ/Ks=;
 b=UhKZbD+yQzdUWIBnTy9KAJYJYOuA2+70s+CqllAQ/sfA6KznKV5d+vWr5UMmThRA6t
 CN/wUjyaha4lokAFaS2EjzviEqNjZKn481mxdq73xHsysOXsSs0lN1Ioj0d8S7H3frGY
 zpktXvyQ8PNZz+rQJO4ONjCJNXfrpNMK+f+no0khs0tgm/GH/b91xMVDRll0IBzCL473
 zAd5sg7DTmGDlZUtmyRCDEe0etu0zWfk6hyquG2VAKDuO7UsaWt1MrChSlzBqVYXwWfO
 9T2NuBUhVpWS4KRU3807MP9VlUovGOrfaSusS7L6EAmlHxxZkvZhckWBlgh/VMaYpMIl
 /86w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to;
 bh=YfnB11KMaX602mBm0PnlrHM5pqQzJfF9oigF++xZ/Ks=;
 b=zWtkB0vZywCgh7TBCI9HJuPYT6fybrp5AcQPh9kc88RhRVFDxwysrCQ90U+1ZP1pAR
 BClpbNgqccgT1cXQTf3B+hZs6nqEW5fZVuGcq40fWhhylsdo1XIQSsgnyYoCU7pstvrV
 KyxYEmDrq1iYIBDu7PqN4NEv0rdNroAnsPkDZ21VTyUsHOFnegWpAER40MT5hqoYc9Xx
 PrbU8JT+shw+7Kut2KpicdTJHSZFhafZQNimoQTWkj0P3tx41OmVHhDprlTVbufAgTf1
 MoH82e+Zyv/FZQsaxHEA8boZBewqs7fD/w/irySkgdLJNOdEL2HWWJ5whlURx24uaqaC
 OMIA==
X-Gm-Message-State: AOAM532GiYWzadpfCcLm9NJGQYzJwW0pAQNw+vBZtcOg/5H0nE7QGtH2
 28+J70S7E2s48+o5814y9tlRwzkZYT9otSpTEYTA2g==
X-Google-Smtp-Source: ABdhPJwVH/O6Xo9nRgajes4j9eCZ5mpZVShQyUWGA9JFDSxnW70LHrFHFYzJSTkvaEFwySG6g2LXOgM+0tGd1nPpuRs=
X-Received: by 2002:a63:6901:0:b0:3f9:caa5:cffc with SMTP id
 e1-20020a636901000000b003f9caa5cffcmr12543131pgc.324.1653310233085; Mon, 23
 May 2022 05:50:33 -0700 (PDT)
MIME-Version: 1.0
References: <20220523084615.13510-1-robert.foss@linaro.org>
In-Reply-To: <20220523084615.13510-1-robert.foss@linaro.org>
From: Robert Foss <robert.foss@linaro.org>
Date: Mon, 23 May 2022 14:50:22 +0200
Message-ID: <CAG3jFytkFcmYjj6AHye3imsTDyP1LxHQvAzjswuRBsVVHRTnKg@mail.gmail.com>
Subject: Re: [PATCH v1 1/2] Revert "drm/bridge: anx7625: Use DPI bus type"
To: andrzej.hajda@intel.com, narmstrong@baylibre.com, robert.foss@linaro.org, 
 Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se,
 jernej.skrabec@gmail.com, 
 airlied@linux.ie, daniel@ffwll.ch, robh+dt@kernel.org, 
 krzysztof.kozlowski+dt@linaro.org, xji@analogixsemi.com, hsinyi@chromium.org, 
 sam@ravnborg.org, tzimmermann@suse.de, maxime@cerno.tech, 
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, 23 May 2022 at 10:46, Robert Foss <robert.foss@linaro.org> wrote:
>
> This reverts commit a77c2af0994e24ee36c7ffb6dc852770bdf06fb1.
> ---
>  drivers/gpu/drm/bridge/analogix/anx7625.c | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/gpu/drm/bridge/analogix/anx7625.c b/drivers/gpu/drm/bridge/analogix/anx7625.c
> index 01f46d9189c1..53a5da6c49dd 100644
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
> @@ -1640,8 +1640,8 @@ static int anx7625_parse_dt(struct device *dev,
>                 mipi_lanes = of_property_count_u32_elems(ep0, "data-lanes");
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

Signed-off-by: Robert Foss <robert.foss@linaro.org>
