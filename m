Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 74BBE50DB0C
	for <lists+dri-devel@lfdr.de>; Mon, 25 Apr 2022 10:25:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0C4AC10E063;
	Mon, 25 Apr 2022 08:25:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-x1136.google.com (mail-yw1-x1136.google.com
 [IPv6:2607:f8b0:4864:20::1136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8772510E063
 for <dri-devel@lists.freedesktop.org>; Mon, 25 Apr 2022 08:25:02 +0000 (UTC)
Received: by mail-yw1-x1136.google.com with SMTP id
 00721157ae682-2f7d621d1caso28690517b3.11
 for <dri-devel@lists.freedesktop.org>; Mon, 25 Apr 2022 01:25:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=6PKUUhwBuA+ch0Uuq1T1DwshtjMaHDXX/uf2rDKBNDQ=;
 b=LfPW9WXgTpr+8/iVd5AE2JI65Goo9Kb2vfmKqdAD7xilZMOadB4Hs7hyaEuHJcebSq
 Jb6OAXCefLv+Q4wDL3KmNpjmMTgKBGfeHRrT+Wa1UxLqcTruKd81ztbl6lCMZFjlmDC4
 g9lfIGc9u5ZZt7MRgeKrf6IK7WUXWAptRCM0o=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=6PKUUhwBuA+ch0Uuq1T1DwshtjMaHDXX/uf2rDKBNDQ=;
 b=qpEecUFlhi+lrQlDatNT4pNGNu4B3kt8UR7RLLQNI1PNRZ0SYssq3qY3Jq0s9zlrKn
 QwYbPMZHwS28frLbHBgHMm63jt4JGBe/KcUK7GON8CulayUGzHF+URi7XvYKuP8OUwxT
 z12PPLRCqPfpnnn5cSZs0I4+VwaYk2LEcH1pipTq3QXQS68oMpr2YNJ9vqgsklY/sYVj
 fxoVvgavP+qjgh+Hy8M7eEYzmM3nnnX58fvw9ZAJI9DfkZJf3n2l/zOno+xf2XJlJqaz
 MOBeb49/ehR6FDz3JKXDgKUwvJTyCFoRkksVHupw+FCXxotpEoe8/3pqGqUFTrSUFW8M
 6tAA==
X-Gm-Message-State: AOAM533QYT+i92s+sgpzhtH6oU5YiEByqdJLn3FcoGaddw30THNObz/q
 MfFbrBQz+uFO4swS2Mvn63z/7mU5g59NeFm+ejdOhg==
X-Google-Smtp-Source: ABdhPJxbt5i4+hFeo1dGmq14YTb4HSm9CGzOHMOg7ZYoAkkPlsj1JpB9JC+WReAMlPR0hNsAbsVPwv+zgr881d/xQJs=
X-Received: by 2002:a81:b044:0:b0:2d6:bd1f:5d8b with SMTP id
 x4-20020a81b044000000b002d6bd1f5d8bmr15448618ywk.27.1650875101688; Mon, 25
 Apr 2022 01:25:01 -0700 (PDT)
MIME-Version: 1.0
References: <20220422084720.959271-1-xji@analogixsemi.com>
 <20220422084720.959271-4-xji@analogixsemi.com>
 <CAG3jFytWGSUM9mevHewdmEe-hq3JgB74s7_f0fsEQqkXr9VUHg@mail.gmail.com>
 <CAG3jFyvEYbwkdGtiNR-6vFEXTLjcyT_viqp9qeVxFTu0PrJEVA@mail.gmail.com>
In-Reply-To: <CAG3jFyvEYbwkdGtiNR-6vFEXTLjcyT_viqp9qeVxFTu0PrJEVA@mail.gmail.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Mon, 25 Apr 2022 16:24:50 +0800
Message-ID: <CAGXv+5E1cCNWD98fMDjC38y2UztZd=PNQ+=G=wrBYfoXkswvHA@mail.gmail.com>
Subject: Re: [PATCH v2 4/4] drm/bridge: anx7625: Use DPI bus type
To: Robert Foss <robert.foss@linaro.org>, Xin Ji <xji@analogixsemi.com>
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
Cc: Neil Armstrong <narmstrong@baylibre.com>, David Airlie <airlied@linux.ie>,
 qwen@analogixsemi.com, Jonas Karlman <jonas@kwiboo.se>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>, bliang@analogixsemi.com,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Apr 22, 2022 at 10:13 PM Robert Foss <robert.foss@linaro.org> wrote:
>
> On Fri, 22 Apr 2022 at 16:01, Robert Foss <robert.foss@linaro.org> wrote:
> >
> > On Fri, 22 Apr 2022 at 10:49, Xin Ji <xji@analogixsemi.com> wrote:
> > >
> > > As V4L2_FWNODE_BUS_TYPE_PARALLEL not properly descript for DPI
> > > interface, this patch use new defined V4L2_FWNODE_BUS_TYPE_DPI for it.
> > >
> > > Fixes: fd0310b6fe7d ("drm/bridge: anx7625: add MIPI DPI input feature")
> > > Signed-off-by: Xin Ji <xji@analogixsemi.com>
> > > ---
> > >  drivers/gpu/drm/bridge/analogix/anx7625.c | 8 ++++----
> > >  1 file changed, 4 insertions(+), 4 deletions(-)
> > >
> > > diff --git a/drivers/gpu/drm/bridge/analogix/anx7625.c b/drivers/gpu/drm/bridge/analogix/anx7625.c
> > > index 376da01243a3..71df977e8f53 100644
> > > --- a/drivers/gpu/drm/bridge/analogix/anx7625.c
> > > +++ b/drivers/gpu/drm/bridge/analogix/anx7625.c
> > > @@ -1623,14 +1623,14 @@ static int anx7625_parse_dt(struct device *dev,
> > >
> > >         anx7625_get_swing_setting(dev, pdata);
> > >
> > > -       pdata->is_dpi = 1; /* default dpi mode */
> > > +       pdata->is_dpi = 0; /* default dsi mode */
> > >         pdata->mipi_host_node = of_graph_get_remote_node(np, 0, 0);
> > >         if (!pdata->mipi_host_node) {
> > >                 DRM_DEV_ERROR(dev, "fail to get internal panel.\n");
> > >                 return -ENODEV;
> > >         }
> > >
> > > -       bus_type = V4L2_FWNODE_BUS_TYPE_PARALLEL;
> > > +       bus_type = 0;
> > >         mipi_lanes = MAX_LANES_SUPPORT;
> > >         ep0 = of_graph_get_endpoint_by_regs(np, 0, 0);
> > >         if (ep0) {
> > > @@ -1640,8 +1640,8 @@ static int anx7625_parse_dt(struct device *dev,
> > >                 mipi_lanes = of_property_count_u32_elems(ep0, "data-lanes");
> > >         }
> > >
> > > -       if (bus_type == V4L2_FWNODE_BUS_TYPE_PARALLEL) /* bus type is Parallel(DSI) */
> > > -               pdata->is_dpi = 0;
> > > +       if (bus_type == V4L2_FWNODE_BUS_TYPE_DPI) /* bus type is DPI */
> > > +               pdata->is_dpi = 1;
> > >
> > >         pdata->mipi_lanes = mipi_lanes;
> > >         if (pdata->mipi_lanes > MAX_LANES_SUPPORT || pdata->mipi_lanes <= 0)
> >
> > Reviewed-by: Robert Foss <robert.foss@linaro.org>
>
> Acked-by: Robert Foss <robert.foss@linaro.org>

Tested-by: Chen-Yu Tsai <wenst@chromium.org>

Confirmed this fixes the display on Juniper (Acer Chromebook Spin 311) on
mainline (next-20220422).

Xin, in the future, please send the whole series to all recipients of
all patches listed by get_maintainers.pl, not just the recipients of
each patch. In the case of this series, they should have been sent
to all of the mailing lists (media, devicetree, dri-devel) so that
everyone has the same, full view of the patches.

ChenYu
