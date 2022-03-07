Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 191CB4D0364
	for <lists+dri-devel@lfdr.de>; Mon,  7 Mar 2022 16:49:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D568910E008;
	Mon,  7 Mar 2022 15:49:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x1036.google.com (mail-pj1-x1036.google.com
 [IPv6:2607:f8b0:4864:20::1036])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F083A10E008
 for <dri-devel@lists.freedesktop.org>; Mon,  7 Mar 2022 15:49:22 +0000 (UTC)
Received: by mail-pj1-x1036.google.com with SMTP id v4so13979786pjh.2
 for <dri-devel@lists.freedesktop.org>; Mon, 07 Mar 2022 07:49:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=FL0gXsWbGhLI04YBjzXHDJu+JMl7WurtGcAsv91Hz5k=;
 b=Kp5yZGW0Ab5T2mjqzxPvmuVftl8sYQc7xz0cyW35fQuBN9lAzVFYMt+71xB4nVz2zH
 OeqnKiQ8ARMsefAnzjPdcQQr0qnaZSFSofHxl3uXNmPUJE+TWv9vC7pKnQ0E86RGO26f
 OmWvW9mIB3DCeM5SjFKiW2Eo6gDntru4y4WsxiJDX/YLcpy5ikRdvD8ki+fQtSYMyuSl
 8qHCRcaikR+yQiYofkjmEKsDWTY1r3w/SMRn3ST1rrDZ5PuIsof8pGiNyTxsNx3AA4gJ
 1afiH/g1Ob+IDASGSyiF5K7SScsJ7FSqIlYSkwfT9pdjNq5uF1A/5znvHVkBLct0O5sh
 nO+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=FL0gXsWbGhLI04YBjzXHDJu+JMl7WurtGcAsv91Hz5k=;
 b=x5CHgZUJ2+wiperw96IuMwhPaXYcyh2tRBb6crzDBwCaqOYjZmnAE1lT5Wf6Y7ayeI
 4oZwHoy68XdE6Y39c8EQouW+ZN3j1M8ODObZ8vcwj6OrrngfAhMXOuYsgVQcL2e6nBLG
 jhTcb0CvZ1u4l8MeAGlLdfM1lloP802dRkgTvCto8esvGR3jyjPM1blIo+paCzJBdgCm
 Ft4wCcev2KpEzkHoFwKhyHBa82T+l68AslhUKDLa+jqp0DjBrHjVd1fRRVMKdbkkIeNJ
 Tu5mOLQKVYKGsjmw6U7YpT/KtqCH45BQ4BLvg9gXsvP/gYJltUWFon2wUCB7crq93QAY
 kAZg==
X-Gm-Message-State: AOAM530YN7NztLwNhWb+zqvalCjsJ+ubbehpcKu3PetXvrjt2ufloi8Q
 KO6OQTHiIStvgNMMS6PeIuYn/+COIZmZ/AVH5978xQ==
X-Google-Smtp-Source: ABdhPJy2roW03lthAIX6j+2h+EPCsVhhcpMTUdZeJAti7tvAKjOU/gBksPov6kZj/ME8zDET9PX1au5aJNKDhNlfY8s=
X-Received: by 2002:a17:90b:124c:b0:1bc:369b:7db5 with SMTP id
 gx12-20020a17090b124c00b001bc369b7db5mr26044708pjb.179.1646668162460; Mon, 07
 Mar 2022 07:49:22 -0800 (PST)
MIME-Version: 1.0
References: <20211105031904.2641088-1-xji@analogixsemi.com>
 <20211105031904.2641088-3-xji@analogixsemi.com>
 <YiTruiCIkyxs3jTC@pendragon.ideasonboard.com>
 <YiWiYpEfTOOqgyAN@google.com>
In-Reply-To: <YiWiYpEfTOOqgyAN@google.com>
From: Robert Foss <robert.foss@linaro.org>
Date: Mon, 7 Mar 2022 16:49:11 +0100
Message-ID: <CAG3jFys-BYsBp07AAFQ2O_TFsXOwhcVDnsOh8WVNNSag3HZw+Q@mail.gmail.com>
Subject: Re: [PATCH v12 3/4] drm/bridge: anx7625: add MIPI DPI input feature
To: Chen-Yu Tsai <wenst@chromium.org>
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
Cc: narmstrong@baylibre.com, airlied@linux.ie, dri-devel@lists.freedesktop.org,
 a.hajda@samsung.com, Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 bliang@analogixsemi.com, drinkcat@google.com, sam@ravnborg.org,
 jernej.skrabec@gmail.com, tzungbi@google.com, dan.carpenter@oracle.com,
 devicetree@vger.kernel.org,
 =?UTF-8?B?TsOtY29sYXMgRi4gUi4gQS4gUHJhZG8=?= <nfraprado@collabora.com>,
 jonas@kwiboo.se, qwen@analogixsemi.com, robh+dt@kernel.org, maxime@cerno.tech,
 pihsun@chromium.org, hsinyi@chromium.org, Xin Ji <xji@analogixsemi.com>,
 linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, 7 Mar 2022 at 07:12, Chen-Yu Tsai <wenst@chromium.org> wrote:
>
> On Sun, Mar 06, 2022 at 07:13:30PM +0200, Laurent Pinchart wrote:
> > Hello Xin,
> >
> > (Question for Rob below, and I'm afraid this is urgent as we need to
> > merge a fix in v5.17).
> >
> > On Fri, Nov 05, 2021 at 11:19:03AM +0800, Xin Ji wrote:
> > > The basic anx7625 driver only support MIPI DSI rx signal input.
> > > This patch add MIPI DPI rx input configuration support, after apply
> > > this patch, the driver can support DSI rx or DPI rx by adding
> > > 'bus-type' in DT.
> > >
> > > Reviewed-by: Robert Foss <robert.foss@linaro.org>
> > > Signed-off-by: Xin Ji <xji@analogixsemi.com>
> > > ---
> > >  drivers/gpu/drm/bridge/analogix/anx7625.c | 247 ++++++++++++++++------
> > >  drivers/gpu/drm/bridge/analogix/anx7625.h |  18 +-
> > >  2 files changed, 205 insertions(+), 60 deletions(-)
> > >
> > > diff --git a/drivers/gpu/drm/bridge/analogix/anx7625.c b/drivers/gpu/drm/bridge/analogix/anx7625.c
> > > index f48e91134c20..f7c3386c8929 100644
> > > --- a/drivers/gpu/drm/bridge/analogix/anx7625.c
> > > +++ b/drivers/gpu/drm/bridge/analogix/anx7625.c
>
> [...]
>
> > >  static int anx7625_parse_dt(struct device *dev,
> > >                         struct anx7625_platform_data *pdata)
> > >  {
> > > -   struct device_node *np = dev->of_node;
> > > +   struct device_node *np = dev->of_node, *ep0;
> > >     struct drm_panel *panel;
> > >     int ret;
> > > +   int bus_type, mipi_lanes;
> > > +
> > > +   anx7625_get_swing_setting(dev, pdata);
> > >
> > > +   pdata->is_dpi = 1; /* default dpi mode */
> > >     pdata->mipi_host_node = of_graph_get_remote_node(np, 0, 0);
> > >     if (!pdata->mipi_host_node) {
> > >             DRM_DEV_ERROR(dev, "fail to get internal panel.\n");
> > >             return -ENODEV;
> > >     }
> > >
> > > -   DRM_DEV_DEBUG_DRIVER(dev, "found dsi host node.\n");
> > > +   bus_type = V4L2_FWNODE_BUS_TYPE_PARALLEL;
> > > +   mipi_lanes = MAX_LANES_SUPPORT;
> > > +   ep0 = of_graph_get_endpoint_by_regs(np, 0, 0);
> > > +   if (ep0) {
> > > +           if (of_property_read_u32(ep0, "bus-type", &bus_type))
> > > +                   bus_type = 0;
> > > +
> > > +           mipi_lanes = of_property_count_u32_elems(ep0, "data-lanes");
> > > +   }
> > > +
> > > +   if (bus_type == V4L2_FWNODE_BUS_TYPE_PARALLEL) /* bus type is Parallel(DSI) */
> >
> > This is not correct *at all*. V4L2_FWNODE_BUS_TYPE_PARALLEL has nothing
> > to do with DSI. DSI stands for Digital *Serial* Interface. If anything,
> > the V4L2_FWNODE_BUS_TYPE_PARALLEL type would map better to DPI, even if
> > it's not an exact match.
> >
> > This patch has landed in v5.17-rc1, along with the corresponding
> > bindings. As DT bindings are an ABI, we should really fix this before
> > v5.17 is released. There is no DSI bus types defined in DT, and adding
> > one as a fix so late in the v5.17-rc cycle seems a bit of a stretch to
> > me (unless Rob disagrees).
> >
> > It would seem best to revert this series and the corresponding bindings,
> > and retry in v5.18.
>
> There is a DT patch using this property that is already queued up for 5.17
> in the soc tree:
>
> https://lore.kernel.org/all/20220214200507.2500693-1-nfraprado@collabora.com/
>
> merged here:
>
> http://git.kernel.org/soc/soc/c/32568ae37596b529628ac09b875f4874e614f63f
>
> We will need to revert that one as well.

I just submitted a series reverting the dt-binding change + the
related commit to "mt8183: jacuzzi".
Can I get a quick r-b/a-b in order to get this into v5.17.

https://lore.kernel.org/all/20220307154558.2505734-3-robert.foss@linaro.org/

>
> ChenYu
