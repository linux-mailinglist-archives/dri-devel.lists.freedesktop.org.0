Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 39AE350B962
	for <lists+dri-devel@lfdr.de>; Fri, 22 Apr 2022 16:02:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 70C9210E1DB;
	Fri, 22 Apr 2022 14:01:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x62a.google.com (mail-pl1-x62a.google.com
 [IPv6:2607:f8b0:4864:20::62a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AD0F810E1DB
 for <dri-devel@lists.freedesktop.org>; Fri, 22 Apr 2022 14:01:58 +0000 (UTC)
Received: by mail-pl1-x62a.google.com with SMTP id u15so7669022ple.4
 for <dri-devel@lists.freedesktop.org>; Fri, 22 Apr 2022 07:01:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Chb15DVMiI2nGn5AZ2xaunn8HK8CS50zKGvASbJkZjg=;
 b=QatWE9vcezju8KZl04JD7UfRVJ4Y7NOBD6/+Fdab+va2kyzFWhSohVlK06dqj0tqTQ
 +19nVVhwEG7HkHQOobNow0MogRGN1nGIsduZX12Mz1/QWkXK42qyq2wyqfaAwyu087W8
 H5oWGD+vF72x/7kygDyGvloW9TZGJwqd3XMpughfAmjols2y9vU913bLVepHpIWye+O5
 qlfOU+QGmLCJAtXHoDuyT/JoLl/2GsI1VFGjruoGHCFH4zAoy6KQSqBA5vuM6cMSPuse
 J+mcRdWWfL3Vb9B9LsnSnvO3mzM1OuM9OQJAMR98FVboKN2XN6WN6AUYp4h7cnIzP6om
 LzEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Chb15DVMiI2nGn5AZ2xaunn8HK8CS50zKGvASbJkZjg=;
 b=eYMP3Fzqz02hPZXWxwWdNHt6vNhYVd15cwFETyoq6x4jKKij6svgMY4hWnDscGU34I
 ThEvImqFV0f8JcQiOhB+GLXSEq4mNvqIA/ltLW1vwg6pZEZh7kgidPjBxK0pCKkbWfrL
 53hfkLVHZLl4qi/g6xpmNRXmIKdMN4ZGmHa9TCLfMilSmLIIuy92bw27YxTgkQ60526N
 46jHHJ9S+ghKcurlX98tl8N87NuCRQ+XdshL74ws3CUrNQrtDEC03DjC7VGwWFf+o0kW
 GmI2+LLZ/mxt5k/NIVP8saiR4Jy3IoDdLw45Y7rNg+GhQjoBJvlHUBNeOZjszBm+d2S+
 jhng==
X-Gm-Message-State: AOAM531UXu0gBOFpap219VtFI8Et3obbwqOq5MflzHcMZvUxDCqG+Yig
 Cfe1FfsRk9P7XfPxnegFuyMKGMiSGKALcZtR0q6rfQ==
X-Google-Smtp-Source: ABdhPJzF+5b6hj1uqWK03OgtUL14jzCt3qYijxoHNoT/KQlFt+N85j+F4eLD6WITOKqe4Cpy2YNOGDMYFU6lSAjI7O4=
X-Received: by 2002:a17:90b:3e84:b0:1d2:c015:2182 with SMTP id
 rj4-20020a17090b3e8400b001d2c0152182mr5548093pjb.232.1650636118195; Fri, 22
 Apr 2022 07:01:58 -0700 (PDT)
MIME-Version: 1.0
References: <20220422084720.959271-1-xji@analogixsemi.com>
 <20220422084720.959271-4-xji@analogixsemi.com>
In-Reply-To: <20220422084720.959271-4-xji@analogixsemi.com>
From: Robert Foss <robert.foss@linaro.org>
Date: Fri, 22 Apr 2022 16:01:47 +0200
Message-ID: <CAG3jFytWGSUM9mevHewdmEe-hq3JgB74s7_f0fsEQqkXr9VUHg@mail.gmail.com>
Subject: Re: [PATCH v2 4/4] drm/bridge: anx7625: Use DPI bus type
To: Xin Ji <xji@analogixsemi.com>
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
Cc: dri-devel@lists.freedesktop.org, Jonas Karlman <jonas@kwiboo.se>,
 David Airlie <airlied@linux.ie>, qwen@analogixsemi.com,
 Neil Armstrong <narmstrong@baylibre.com>, linux-kernel@vger.kernel.org,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>, bliang@analogixsemi.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, 22 Apr 2022 at 10:49, Xin Ji <xji@analogixsemi.com> wrote:
>
> As V4L2_FWNODE_BUS_TYPE_PARALLEL not properly descript for DPI
> interface, this patch use new defined V4L2_FWNODE_BUS_TYPE_DPI for it.
>
> Fixes: fd0310b6fe7d ("drm/bridge: anx7625: add MIPI DPI input feature")
> Signed-off-by: Xin Ji <xji@analogixsemi.com>
> ---
>  drivers/gpu/drm/bridge/analogix/anx7625.c | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/gpu/drm/bridge/analogix/anx7625.c b/drivers/gpu/drm/bridge/analogix/anx7625.c
> index 376da01243a3..71df977e8f53 100644
> --- a/drivers/gpu/drm/bridge/analogix/anx7625.c
> +++ b/drivers/gpu/drm/bridge/analogix/anx7625.c
> @@ -1623,14 +1623,14 @@ static int anx7625_parse_dt(struct device *dev,
>
>         anx7625_get_swing_setting(dev, pdata);
>
> -       pdata->is_dpi = 1; /* default dpi mode */
> +       pdata->is_dpi = 0; /* default dsi mode */
>         pdata->mipi_host_node = of_graph_get_remote_node(np, 0, 0);
>         if (!pdata->mipi_host_node) {
>                 DRM_DEV_ERROR(dev, "fail to get internal panel.\n");
>                 return -ENODEV;
>         }
>
> -       bus_type = V4L2_FWNODE_BUS_TYPE_PARALLEL;
> +       bus_type = 0;
>         mipi_lanes = MAX_LANES_SUPPORT;
>         ep0 = of_graph_get_endpoint_by_regs(np, 0, 0);
>         if (ep0) {
> @@ -1640,8 +1640,8 @@ static int anx7625_parse_dt(struct device *dev,
>                 mipi_lanes = of_property_count_u32_elems(ep0, "data-lanes");
>         }
>
> -       if (bus_type == V4L2_FWNODE_BUS_TYPE_PARALLEL) /* bus type is Parallel(DSI) */
> -               pdata->is_dpi = 0;
> +       if (bus_type == V4L2_FWNODE_BUS_TYPE_DPI) /* bus type is DPI */
> +               pdata->is_dpi = 1;
>
>         pdata->mipi_lanes = mipi_lanes;
>         if (pdata->mipi_lanes > MAX_LANES_SUPPORT || pdata->mipi_lanes <= 0)

Reviewed-by: Robert Foss <robert.foss@linaro.org>
