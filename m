Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A07450B9C6
	for <lists+dri-devel@lfdr.de>; Fri, 22 Apr 2022 16:14:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F2B2210EB2E;
	Fri, 22 Apr 2022 14:13:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x62d.google.com (mail-pl1-x62d.google.com
 [IPv6:2607:f8b0:4864:20::62d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ECAEA10EB2E
 for <dri-devel@lists.freedesktop.org>; Fri, 22 Apr 2022 14:13:57 +0000 (UTC)
Received: by mail-pl1-x62d.google.com with SMTP id q1so9945022plx.13
 for <dri-devel@lists.freedesktop.org>; Fri, 22 Apr 2022 07:13:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=zXfqWdJ/GLvoUjS9UlqMERMZ6c4eq4qtAdP5ouoRFc4=;
 b=yIL5pQgjVaJ1DFw/YwfK1UT/MWPCZp6d/YcNkK4HhELe/z4lnFdIq7Fl3CX3OwML/u
 zgEFZi9dezIwX82IHBOHOCczRcHGp77leR3ZNiGwFBJ1hYaJ/WECNZI9zi7UTNR9qRlO
 fNk0poWubxKn+BH+FNcvz1oqYx1V4R0VEM3+UVEhLgqRRWWrlLrBzk/3okzTSKxW1Mxs
 kALuYQ3cSA63urCDTDVQeebyfVxkXnTCmHeV/Pcnon7I6SrOotxDXeTYdDjFN0c+4K36
 DcatoPPpF9Ix9ID3GgeAdSPV66Mk77nQvlOOTYw5vo+4L4sekwajdyLFb4vCuE3pc0gx
 w3KA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=zXfqWdJ/GLvoUjS9UlqMERMZ6c4eq4qtAdP5ouoRFc4=;
 b=n/YWqzTxGS/7sA83HENBWasikrA1uL9JxVb+yMXLQcYAnfV5G8iOu89Bv79YWxAbha
 ujrznG/j22z03N/YM2N2qOlANpdDSTvyCEq2Pen5x/yol9tNSETgyoZm83vF6iGd5GEZ
 AhfeP35yVJPY4ya+WIXx0NkJLF1iCHKxBZnzzHg/x4M+cV7tVgBpkMXjxq7QM/vg7kiE
 szXCosYR9NBxTvM5Ito5DK1oaeeXJ6kiIV+wHznJZf/Nx14BVmc1MhnsTyjYdv1D6ibU
 XlRFyWQqZcW5RaArsjZHwXCeYN5OBfKZAU/Iclp8QPX0E9aJwBCScIe1o28OXLztBJCR
 yEWA==
X-Gm-Message-State: AOAM531QpqSvWriHnwO2t7i9pVY5/IoSmP5j4fEElDurkRD7I2dhcSqg
 O7RmBvBdiLtxhgjS/8XRI5ml6TPR2sBuAvk3acHxGA==
X-Google-Smtp-Source: ABdhPJzaKXh6kEeQvJ0coQDYWC9K1l7I0I2hJf8QO31KN+Ct4SXnJgNEKwRmPz9WuOlwyHrfPm7yIiMj6+T+6kV/VcM=
X-Received: by 2002:a17:90a:6501:b0:1ca:a7df:695c with SMTP id
 i1-20020a17090a650100b001caa7df695cmr5673540pjj.152.1650636837577; Fri, 22
 Apr 2022 07:13:57 -0700 (PDT)
MIME-Version: 1.0
References: <20220422084720.959271-1-xji@analogixsemi.com>
 <20220422084720.959271-4-xji@analogixsemi.com>
 <CAG3jFytWGSUM9mevHewdmEe-hq3JgB74s7_f0fsEQqkXr9VUHg@mail.gmail.com>
In-Reply-To: <CAG3jFytWGSUM9mevHewdmEe-hq3JgB74s7_f0fsEQqkXr9VUHg@mail.gmail.com>
From: Robert Foss <robert.foss@linaro.org>
Date: Fri, 22 Apr 2022 16:13:46 +0200
Message-ID: <CAG3jFyvEYbwkdGtiNR-6vFEXTLjcyT_viqp9qeVxFTu0PrJEVA@mail.gmail.com>
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

On Fri, 22 Apr 2022 at 16:01, Robert Foss <robert.foss@linaro.org> wrote:
>
> On Fri, 22 Apr 2022 at 10:49, Xin Ji <xji@analogixsemi.com> wrote:
> >
> > As V4L2_FWNODE_BUS_TYPE_PARALLEL not properly descript for DPI
> > interface, this patch use new defined V4L2_FWNODE_BUS_TYPE_DPI for it.
> >
> > Fixes: fd0310b6fe7d ("drm/bridge: anx7625: add MIPI DPI input feature")
> > Signed-off-by: Xin Ji <xji@analogixsemi.com>
> > ---
> >  drivers/gpu/drm/bridge/analogix/anx7625.c | 8 ++++----
> >  1 file changed, 4 insertions(+), 4 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/bridge/analogix/anx7625.c b/drivers/gpu/drm/bridge/analogix/anx7625.c
> > index 376da01243a3..71df977e8f53 100644
> > --- a/drivers/gpu/drm/bridge/analogix/anx7625.c
> > +++ b/drivers/gpu/drm/bridge/analogix/anx7625.c
> > @@ -1623,14 +1623,14 @@ static int anx7625_parse_dt(struct device *dev,
> >
> >         anx7625_get_swing_setting(dev, pdata);
> >
> > -       pdata->is_dpi = 1; /* default dpi mode */
> > +       pdata->is_dpi = 0; /* default dsi mode */
> >         pdata->mipi_host_node = of_graph_get_remote_node(np, 0, 0);
> >         if (!pdata->mipi_host_node) {
> >                 DRM_DEV_ERROR(dev, "fail to get internal panel.\n");
> >                 return -ENODEV;
> >         }
> >
> > -       bus_type = V4L2_FWNODE_BUS_TYPE_PARALLEL;
> > +       bus_type = 0;
> >         mipi_lanes = MAX_LANES_SUPPORT;
> >         ep0 = of_graph_get_endpoint_by_regs(np, 0, 0);
> >         if (ep0) {
> > @@ -1640,8 +1640,8 @@ static int anx7625_parse_dt(struct device *dev,
> >                 mipi_lanes = of_property_count_u32_elems(ep0, "data-lanes");
> >         }
> >
> > -       if (bus_type == V4L2_FWNODE_BUS_TYPE_PARALLEL) /* bus type is Parallel(DSI) */
> > -               pdata->is_dpi = 0;
> > +       if (bus_type == V4L2_FWNODE_BUS_TYPE_DPI) /* bus type is DPI */
> > +               pdata->is_dpi = 1;
> >
> >         pdata->mipi_lanes = mipi_lanes;
> >         if (pdata->mipi_lanes > MAX_LANES_SUPPORT || pdata->mipi_lanes <= 0)
>
> Reviewed-by: Robert Foss <robert.foss@linaro.org>

Acked-by: Robert Foss <robert.foss@linaro.org>
