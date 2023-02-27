Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AF9DD6A4B85
	for <lists+dri-devel@lfdr.de>; Mon, 27 Feb 2023 20:49:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F02F910E464;
	Mon, 27 Feb 2023 19:49:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-x112b.google.com (mail-yw1-x112b.google.com
 [IPv6:2607:f8b0:4864:20::112b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6E91010E3D6
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Feb 2023 19:49:36 +0000 (UTC)
Received: by mail-yw1-x112b.google.com with SMTP id
 00721157ae682-53852143afcso208115487b3.3
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Feb 2023 11:49:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=cfgMa6MI3iWpbT/swEza+T2yjOIbdOUut5Vc7UuIZtg=;
 b=nHC+E8z7U05lspS2iBYiDEmfrklJdr3yYOG1D5WdDTkzPqFpRD901mkkxd3fMhMWZo
 3HkJyEiSKO/XgzrWnGs+2/9tdhe6P0eu2M0US0wPAGgQPwUd6aUutTLABr3+RqZTHG2e
 vDkRIkIVUBHPd7YGa/i9U7mwTnn1JWtetIbNI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=cfgMa6MI3iWpbT/swEza+T2yjOIbdOUut5Vc7UuIZtg=;
 b=N8Z+4jotUuEktvgbc5b1WZZfAWc6eCYzlATlpAV0OE/VHFCSxGIoXxnAPz5dc+TCIP
 HQcLZjuFL0hTlJVfgpkgf87emgvoR9fIdkZsHnief0cJow17GISyJv/6FZKDxf19EfFI
 4YFzOxo7ppwFz+B1Sdrd+lhwC4+2cgs0VIuxQ/h5zsSUQu4kOvUxTF+uZJ2uNwqC8eIh
 n0kAWB//n8R3EXl949PfJ5m0YLn21TdEjUDw6QR2BKPZbFcdvTKDH/Ydk2GSuHbWqNKt
 0ldgZg5whAihhKpQbKKcFOoxEFDWg6pn88XoOPc/vmuLsDN6rx7gCW1URR6juJjo8g1r
 StRw==
X-Gm-Message-State: AO0yUKV5G9N3S1kaEY3TJOOldsWZ0oKsYMz4YEkRi3qtlwI6gm1tOJCe
 oVULWQ/HoJIInnzzD8pQs66AME2plfifiDtfozL7kg==
X-Google-Smtp-Source: AK7set9dWGptuEVM4B3PEI8tKK6q5bsBta7RCgcJRboIZHkg6FZQJa+imOgfrwrT3RG3+bxt4u/KvdtdJ8h9Rncy7u8=
X-Received: by 2002:a05:6902:305:b0:98e:6280:74ca with SMTP id
 b5-20020a056902030500b0098e628074camr9757466ybs.1.1677527375542; Mon, 27 Feb
 2023 11:49:35 -0800 (PST)
MIME-Version: 1.0
References: <20230227113925.875425-1-jagan@amarulasolutions.com>
 <20230227113925.875425-5-jagan@amarulasolutions.com>
 <3c2f91d3-0406-7730-d4e4-c94868f23c91@denx.de>
 <CAMty3ZA6_pKiOK6gWq4iQFtKsoxfUgnSFBqkgDBzEp1DcBEt3A@mail.gmail.com>
 <7b59aaf9-1f72-fd9f-29ac-1857ec3f91f3@denx.de>
 <CAMty3ZC6vqpFfdh2F=KUsAgm_KCksVXBV9ON1csjJd1m+gJpVQ@mail.gmail.com>
 <6066dff9-5a66-0da5-14d9-66162a2fbb39@denx.de>
 <CAMty3ZDjwD+3SKJiOgZLbYYTtq=udWkXbqnsyYaM73rsYxDumQ@mail.gmail.com>
 <47b8ad7d-cfc1-112c-2117-cb3612c1bba5@denx.de>
In-Reply-To: <47b8ad7d-cfc1-112c-2117-cb3612c1bba5@denx.de>
From: Jagan Teki <jagan@amarulasolutions.com>
Date: Tue, 28 Feb 2023 01:19:23 +0530
Message-ID: <CAMty3ZDMJFW36g5=A1=_08VT1dZUMemEg3YcQMh08iZNRa+cTw@mail.gmail.com>
Subject: Re: [PATCH v13 04/18] drm: exynos: dsi: Switch to DSI panel or bridge
 find helper
To: Marek Vasut <marex@denx.de>
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
Cc: dri-devel@lists.freedesktop.org, linux-samsung-soc@vger.kernel.org,
 Matteo Lisi <matteo.lisi@engicam.com>, Maxime Ripard <maxime@cerno.tech>,
 linux-amarula <linux-amarula@amarulasolutions.com>,
 Seung-Woo Kim <sw0312.kim@samsung.com>, NXP Linux Team <linux-imx@nxp.com>,
 Frieder Schrempf <frieder.schrempf@kontron.de>,
 Kyungmin Park <kyungmin.park@samsung.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>, Adam Ford <aford173@gmail.com>,
 linux-arm-kernel@lists.infradead.org,
 Marek Szyprowski <m.szyprowski@samsung.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Feb 28, 2023 at 1:11 AM Marek Vasut <marex@denx.de> wrote:
>
> On 2/27/23 20:34, Jagan Teki wrote:
> > On Tue, Feb 28, 2023 at 12:54 AM Marek Vasut <marex@denx.de> wrote:
> >>
> >> On 2/27/23 20:15, Jagan Teki wrote:
> >>> On Tue, Feb 28, 2023 at 12:38 AM Marek Vasut <marex@denx.de> wrote:
> >>>>
> >>>> On 2/27/23 20:01, Jagan Teki wrote:
> >>>>> On Tue, Feb 28, 2023 at 12:25 AM Marek Vasut <marex@denx.de> wrote:
> >>>>>>
> >>>>>> On 2/27/23 12:39, Jagan Teki wrote:
> >>>>>>> drm_of_dsi_find_panel_or_bridge is capable of looking up the
> >>>>>>> downstream DSI bridge and panel and trying to add a panel bridge
> >>>>>>> if the panel is found.
> >>>>>>>
> >>>>>>> Replace explicit finding calls with drm_of_dsi_find_panel_or_bridge
> >>>>>>> followed with drmm_panel_bridge_add.
> >>>>>>>
> >>>>>>> Signed-off-by: Jagan Teki <jagan@amarulasolutions.com>
> >>>>>>> ---
> >>>>>>> Changes for v13, v12, v11:
> >>>>>>> - none
> >>>>>>> Changes for v10:
> >>>>>>> - new patch
> >>>>>>>
> >>>>>>>      drivers/gpu/drm/exynos/exynos_drm_dsi.c | 25 +++++++++++++------------
> >>>>>>>      1 file changed, 13 insertions(+), 12 deletions(-)
> >>>>>>>
> >>>>>>> diff --git a/drivers/gpu/drm/exynos/exynos_drm_dsi.c b/drivers/gpu/drm/exynos/exynos_drm_dsi.c
> >>>>>>> index df15501b1075..12a6dd987e8f 100644
> >>>>>>> --- a/drivers/gpu/drm/exynos/exynos_drm_dsi.c
> >>>>>>> +++ b/drivers/gpu/drm/exynos/exynos_drm_dsi.c
> >>>>>>> @@ -25,6 +25,7 @@
> >>>>>>>      #include <drm/drm_atomic_helper.h>
> >>>>>>>      #include <drm/drm_bridge.h>
> >>>>>>>      #include <drm/drm_mipi_dsi.h>
> >>>>>>> +#include <drm/drm_of.h>
> >>>>>>>      #include <drm/drm_panel.h>
> >>>>>>>      #include <drm/drm_print.h>
> >>>>>>>      #include <drm/drm_probe_helper.h>
> >>>>>>> @@ -1470,24 +1471,26 @@ static int exynos_dsi_host_attach(struct mipi_dsi_host *host,
> >>>>>>>          struct device *dev = dsi->dev;
> >>>>>>>          struct drm_encoder *encoder = &dsi->encoder;
> >>>>>>>          struct drm_device *drm = encoder->dev;
> >>>>>>> +     struct drm_bridge *bridge;
> >>>>>>>          struct drm_panel *panel;
> >>>>>>>          int ret;
> >>>>>>>
> >>>>>>> -     panel = of_drm_find_panel(device->dev.of_node);
> >>>>>>> -     if (!IS_ERR(panel)) {
> >>>>>>> -             dsi->out_bridge = devm_drm_panel_bridge_add(dev, panel);
> >>>>>>> -     } else {
> >>>>>>> -             dsi->out_bridge = of_drm_find_bridge(device->dev.of_node);
> >>>>>>> -             if (!dsi->out_bridge)
> >>>>>>> -                     dsi->out_bridge = ERR_PTR(-EINVAL);
> >>>>>>> -     }
> >>>>>>
> >>>>>> As far as I understand this from my conversation with Maxime (please put
> >>>>>> him on CC of V15), the change here should instead perform the panel look
> >>>>>> up NOT in exynos_dsi_host_attach() , but in exynos_dsi_bind() , i.e. in
> >>>>>> the component_ops .bind callback . Here is an example of correct
> >>>>>> implementation:
> >>>>>>
> >>>>>> https://cgit.freedesktop.org/drm-misc/tree/drivers/gpu/drm/vc4/vc4_dsi.c#n1805
> >>>>>
> >>>>> But, we don't have component_ops.bind for imx8m case, so where do we
> >>>>> want to place the panel hook?
> >>>>>
> >>>>> Exynos drm drivers are component-based but, imx8mm is not.
> >>>>
> >>>> In 14/18 patch, the same should be added to generic_dsim_register_host()
> >>>> , which is called from the driver .probe() callback, but that is OK.
> >>>>
> >>>> That's ^ is the iMX part.
> >>>
> >>> Ohh. You mean, we need to find the panel hook separately in two places like
> >>> - bind for exynos
> >>> - probe for imx8mm
> >>
> >> Yes
> >>
> >>> If so? how can I find the drm_device pointer in the probe?
> >>
> >> What for ? The panel lookup uses OF graph . Where do you need the
> >> drm_device in it ?
> >
> > May I can summarize the whole setback here so that everybody is on the
> > same page and find the proper solution?
> >
> > The key blocker is accessing the DRM pointer in order to use the
> > DRM-managed action helper.
> >
> > 1. If we find the panel hook in Exynos component_ops.bind then we can
> > use the DRM pointer directly as VC4 does.
> > 2. if we find the panel hook in Samsung drm_bridge_funcs.attach (for
> > imx8mm) then we can use the DRM pointer directly via bridge->dev.
> >
> > If we make 2) has common across like finding the panel hook in
> > drm_bridge_funcs.attach the Exynos drm pipeline cannot find the
> > panels.
> >
> > The common solution for both exynos and imx8m is host.attach but if we
> > do so we cannot get find the DRM pointer.
>
> There isn't going to be common solution, you would really have to do the
> look up in component_ops .bind callback for exynos , and
> generic_dsim_register_host() for i.MX .
>
> > If we go ahead with no need for DRM-managed helper at the moment, then
> > find the panel hook in host.attach and then drop 2/18.
>
> The panel lookup must happen in .bind/.probe for exynos/imx respectively
> , that's really all that is required here. Then you can drop 1,2,3/18
> and get this series applied (I hope) .

I'm not quite sure, if the panel hook in .bind work for exynos or not?
the host. attach has KMS hotplug code after the panel hook and
bridge_attach as before. I believe that is a working scenario for
Exynos to be the panel hook in the host. attach.

>
> Can you implement just this one change ?
>
> There is no need to use drmm_* helper for now, that can be improved
> later if possible.

If this is the case then 1/18 will need otherwise we can drop 1,2,3/18
by doing the panel hook we did in v7
https://patchwork.kernel.org/project/dri-devel/patch/20221005151309.7278-3-jagan@amarulasolutions.com/

Jagan
