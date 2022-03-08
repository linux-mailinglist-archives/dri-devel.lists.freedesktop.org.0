Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 820924D141B
	for <lists+dri-devel@lfdr.de>; Tue,  8 Mar 2022 11:00:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A60CC10E230;
	Tue,  8 Mar 2022 10:00:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x102e.google.com (mail-pj1-x102e.google.com
 [IPv6:2607:f8b0:4864:20::102e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0609110E230
 for <dri-devel@lists.freedesktop.org>; Tue,  8 Mar 2022 10:00:31 +0000 (UTC)
Received: by mail-pj1-x102e.google.com with SMTP id
 mv5-20020a17090b198500b001bf2a039831so1725352pjb.5
 for <dri-devel@lists.freedesktop.org>; Tue, 08 Mar 2022 02:00:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=w3pwSt00P8dq6UBwqoWZplPcJrIB0Twk+vNu1P1BFVs=;
 b=L7srTIOZ8D0DZTGnRZ7EHHRoCmawxSsPAQyn/J9KoAPqsTr+S5L+A2Wrx55SIn5X+H
 l6oRFyDkbe2VZLF9uHm4CqDRJpfC5E6s8qTi5CGq5NTLl1ZXQ+2ngxCTbu5MoLwZRCjX
 FE/dnSTMzKVHzHr3G41DX6xkQb5EMUvQquStOPuzl0jSHoi1yequGbqPgo7XswP6tjh8
 z74qBjieToCxyJ8JyCVa9UOomtKdiXwHHMoJ4TpefldBA93npQYduoRrrD3eFEfeBaeB
 va8s4KKAXSXJDOMFpKFb+v+rbgCCQ+4j4Z4qzKQPxE/ArYrt1PYwb0Jcme81inWNactP
 Zs6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=w3pwSt00P8dq6UBwqoWZplPcJrIB0Twk+vNu1P1BFVs=;
 b=w8SD2Fu73+PgYs6OHtYnYvfg/FHoetcUx7WpmdCd2Y/PhbWzDk+7V+6+uhoJx8RlZ9
 ME8pZZYlZD/emMBah8Bzei5sLPA5s1gq1nQl5de6Pn1pU6dIdoE2qyiJrDnPr/3O42II
 Jmy9dZU8mCyuBS+ykmgQbXl1MBQ+17wQs9312ydkbVV45zF0O9pXdoEO1PEyxgj3K0S9
 POB0b+H2LWuDfJrc/paoZddaKR5zE6louslZkeM7YMhK6wWtxA1tAhS/nUzhmxbNoadY
 ssPREz/m9WnZScCSxNr7LCkeps5R5y3vN3S8/pyzZHyyzcNOX5n4A19peorK0cTxFW3d
 uDdw==
X-Gm-Message-State: AOAM532YLSRHUJzNb2uotT6aEjdOdyy3oBw1z8/ti7GzsiMz9Dpr47VT
 v/PucdvlP4NDCwj+Tz/IH0atwdJUAokBAWt2KeNXCQ==
X-Google-Smtp-Source: ABdhPJzXQqAcXnz/aS3XETnYjpLXEoBzJ29ntiGDh/VQ4OO+pWZTDXDaij3GjfN1QM1mGyOkybVK52zKUs0tJl9KZPs=
X-Received: by 2002:a17:90b:906:b0:1be:e765:882 with SMTP id
 bo6-20020a17090b090600b001bee7650882mr3815408pjb.152.1646733631227; Tue, 08
 Mar 2022 02:00:31 -0800 (PST)
MIME-Version: 1.0
References: <20211105031904.2641088-1-xji@analogixsemi.com>
 <20211105031904.2641088-3-xji@analogixsemi.com>
 <YiTruiCIkyxs3jTC@pendragon.ideasonboard.com>
 <YiWiYpEfTOOqgyAN@google.com>
 <CAG3jFys-BYsBp07AAFQ2O_TFsXOwhcVDnsOh8WVNNSag3HZw+Q@mail.gmail.com>
In-Reply-To: <CAG3jFys-BYsBp07AAFQ2O_TFsXOwhcVDnsOh8WVNNSag3HZw+Q@mail.gmail.com>
From: Robert Foss <robert.foss@linaro.org>
Date: Tue, 8 Mar 2022 11:00:20 +0100
Message-ID: <CAG3jFyu47cv8oSecONM95KVoP=NOvgwafAp4TQ33CZ0Y4zWmnQ@mail.gmail.com>
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

On Mon, 7 Mar 2022 at 16:49, Robert Foss <robert.foss@linaro.org> wrote:
>
> On Mon, 7 Mar 2022 at 07:12, Chen-Yu Tsai <wenst@chromium.org> wrote:
> >
> > On Sun, Mar 06, 2022 at 07:13:30PM +0200, Laurent Pinchart wrote:
> > > Hello Xin,
> > >
> > > (Question for Rob below, and I'm afraid this is urgent as we need to
> > > merge a fix in v5.17).
> > >
> > > On Fri, Nov 05, 2021 at 11:19:03AM +0800, Xin Ji wrote:
> > > > The basic anx7625 driver only support MIPI DSI rx signal input.
> > > > This patch add MIPI DPI rx input configuration support, after apply
> > > > this patch, the driver can support DSI rx or DPI rx by adding
> > > > 'bus-type' in DT.
> > > >
> > > > Reviewed-by: Robert Foss <robert.foss@linaro.org>
> > > > Signed-off-by: Xin Ji <xji@analogixsemi.com>
> > > > ---
> > > >  drivers/gpu/drm/bridge/analogix/anx7625.c | 247 ++++++++++++++++------
> > > >  drivers/gpu/drm/bridge/analogix/anx7625.h |  18 +-
> > > >  2 files changed, 205 insertions(+), 60 deletions(-)
> > > >
> > > > diff --git a/drivers/gpu/drm/bridge/analogix/anx7625.c b/drivers/gpu/drm/bridge/analogix/anx7625.c
> > > > index f48e91134c20..f7c3386c8929 100644
> > > > --- a/drivers/gpu/drm/bridge/analogix/anx7625.c
> > > > +++ b/drivers/gpu/drm/bridge/analogix/anx7625.c
> >
> > [...]
> >
> > > >  static int anx7625_parse_dt(struct device *dev,
> > > >                         struct anx7625_platform_data *pdata)
> > > >  {
> > > > -   struct device_node *np = dev->of_node;
> > > > +   struct device_node *np = dev->of_node, *ep0;
> > > >     struct drm_panel *panel;
> > > >     int ret;
> > > > +   int bus_type, mipi_lanes;
> > > > +
> > > > +   anx7625_get_swing_setting(dev, pdata);
> > > >
> > > > +   pdata->is_dpi = 1; /* default dpi mode */
> > > >     pdata->mipi_host_node = of_graph_get_remote_node(np, 0, 0);
> > > >     if (!pdata->mipi_host_node) {
> > > >             DRM_DEV_ERROR(dev, "fail to get internal panel.\n");
> > > >             return -ENODEV;
> > > >     }
> > > >
> > > > -   DRM_DEV_DEBUG_DRIVER(dev, "found dsi host node.\n");
> > > > +   bus_type = V4L2_FWNODE_BUS_TYPE_PARALLEL;
> > > > +   mipi_lanes = MAX_LANES_SUPPORT;
> > > > +   ep0 = of_graph_get_endpoint_by_regs(np, 0, 0);
> > > > +   if (ep0) {
> > > > +           if (of_property_read_u32(ep0, "bus-type", &bus_type))
> > > > +                   bus_type = 0;
> > > > +
> > > > +           mipi_lanes = of_property_count_u32_elems(ep0, "data-lanes");
> > > > +   }
> > > > +
> > > > +   if (bus_type == V4L2_FWNODE_BUS_TYPE_PARALLEL) /* bus type is Parallel(DSI) */
> > >
> > > This is not correct *at all*. V4L2_FWNODE_BUS_TYPE_PARALLEL has nothing
> > > to do with DSI. DSI stands for Digital *Serial* Interface. If anything,
> > > the V4L2_FWNODE_BUS_TYPE_PARALLEL type would map better to DPI, even if
> > > it's not an exact match.
> > >
> > > This patch has landed in v5.17-rc1, along with the corresponding
> > > bindings. As DT bindings are an ABI, we should really fix this before
> > > v5.17 is released. There is no DSI bus types defined in DT, and adding
> > > one as a fix so late in the v5.17-rc cycle seems a bit of a stretch to
> > > me (unless Rob disagrees).
> > >
> > > It would seem best to revert this series and the corresponding bindings,
> > > and retry in v5.18.
> >
> > There is a DT patch using this property that is already queued up for 5.17
> > in the soc tree:
> >
> > https://lore.kernel.org/all/20220214200507.2500693-1-nfraprado@collabora.com/
> >
> > merged here:
> >
> > http://git.kernel.org/soc/soc/c/32568ae37596b529628ac09b875f4874e614f63f
> >
> > We will need to revert that one as well.
>
> I just submitted a series reverting the dt-binding change + the
> related commit to "mt8183: jacuzzi".
> Can I get a quick r-b/a-b in order to get this into v5.17.
>
> https://lore.kernel.org/all/20220307154558.2505734-3-robert.foss@linaro.org/
>

v2 of revert submitted.

https://lore.kernel.org/all/20220308094911.2680291-1-robert.foss@linaro.org/

Xin: Will you spin a series that adds DPI support and re-enables DPI
for anx7625? Additionally, "mt8183: jacuzzi" will have to have DPI
re-enabled.
