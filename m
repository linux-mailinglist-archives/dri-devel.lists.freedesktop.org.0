Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 11BD16286A6
	for <lists+dri-devel@lfdr.de>; Mon, 14 Nov 2022 18:08:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E6B6C10E2FE;
	Mon, 14 Nov 2022 17:08:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-il1-x12e.google.com (mail-il1-x12e.google.com
 [IPv6:2607:f8b0:4864:20::12e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2D0A010E2F6
 for <dri-devel@lists.freedesktop.org>; Mon, 14 Nov 2022 17:08:10 +0000 (UTC)
Received: by mail-il1-x12e.google.com with SMTP id o13so6034176ilc.7
 for <dri-devel@lists.freedesktop.org>; Mon, 14 Nov 2022 09:08:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=oF/VcIh9DTYrhAUqYIlPwKu3W+9vwFyq9IleIpZ5NpU=;
 b=IejkMWnbEtrCIW34zXKAXdTdSqzeYCSA02JWvPusgw+ATTNrPw2vzXGTPTEFqCLgCf
 kSs5YMWvmpur8TqLfDn/tmv3IW3+XVtE47wWdBdIw0Q0j5veb5Y22o/E4stswVe8HXGf
 zLLY9+Sorn2UT4/Az09J4CF4lJomjjsKnCJ5U=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=oF/VcIh9DTYrhAUqYIlPwKu3W+9vwFyq9IleIpZ5NpU=;
 b=U1AiXusZAj11Hw+r4pdGQVoBwiEe41a+Uenbf2XpZ0qHNS8kYjGvE60hW+Zd3x5N/q
 Pzv8vz/VQlDLGBTOgSnS4KZl0RlHdK8CaXQF3AIa6S3Bwg2LrdlwbWj6trD16S1w4uSZ
 k2CXJnhGWLJpocidNqGOlGzv7hvs8sDakiBTWPdH+jRUKroqpE8XWeLWj/Q1eQLQGiWf
 uFlkOBf/er/WPf06LvDq/FYuijtVPMpWPVa4vIu7oGkXxaI2aPTsN7+HAuDF+S46QOt8
 la3hxgKWpR1O6gwIOjjKwTdcfCyJV9kUhP8N3QvkopBr7MuTmaUuMz7wajTf5+8DH7ax
 d7MQ==
X-Gm-Message-State: ANoB5pmmynscgW8MW2ODXJAF2kbl31wXcjtDVYEHrskAJd3mCH79FZAI
 UkKuEzsFXsETzxdDMObxkzFqrgy9EPSr2tugrxW5jg==
X-Google-Smtp-Source: AA0mqf6sioIaRYWc8BAtigtcGdJkglBwffFn/RmQ+IWH/p41+NXLK7ysWc5wY9HXC5i9+XuhoLdFbrHJmZ4zkM/Allw=
X-Received: by 2002:a05:6e02:1bae:b0:2ff:e796:926 with SMTP id
 n14-20020a056e021bae00b002ffe7960926mr6493107ili.216.1668445689318; Mon, 14
 Nov 2022 09:08:09 -0800 (PST)
MIME-Version: 1.0
References: <20221110183853.3678209-1-jagan@amarulasolutions.com>
 <CGME20221110184122eucas1p11379ff6b85cf9a66455a026259c93340@eucas1p1.samsung.com>
 <20221110183853.3678209-10-jagan@amarulasolutions.com>
 <b13635de-26ce-a8e8-e38e-13c49a99312d@samsung.com>
 <56cab7d0-d9fb-d890-0b1c-678980eafd9c@samsung.com>
In-Reply-To: <56cab7d0-d9fb-d890-0b1c-678980eafd9c@samsung.com>
From: Jagan Teki <jagan@amarulasolutions.com>
Date: Mon, 14 Nov 2022 22:37:58 +0530
Message-ID: <CAMty3ZD_+m_3aj2-rXThaEDtP=m3Knfo=bmXvMPH_7LSf6N5qA@mail.gmail.com>
Subject: Re: [PATCH v8 09/14] drm: bridge: samsung-dsim: Add
 atomic_get_input_bus_fmts
To: Marek Szyprowski <m.szyprowski@samsung.com>
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
Cc: Marek Vasut <marex@denx.de>, linux-samsung-soc@vger.kernel.org,
 Joonyoung Shim <jy0922.shim@samsung.com>, dri-devel@lists.freedesktop.org,
 Tommaso Merciai <tommaso.merciai@amarulasolutions.com>,
 linux-amarula <linux-amarula@amarulasolutions.com>,
 Seung-Woo Kim <sw0312.kim@samsung.com>, Neil Armstrong <narmstrong@linaro.org>,
 Frieder Schrempf <frieder.schrempf@kontron.de>,
 Kyungmin Park <kyungmin.park@samsung.com>,
 Matteo Lisi <matteo.lisi@engicam.com>, Robert Foss <robert.foss@linaro.org>,
 Andrzej Hajda <andrzej.hajda@intel.com>, NXP Linux Team <linux-imx@nxp.com>,
 Fancy Fang <chen.fang@nxp.com>,
 Michael Nazzareno Trimarchi <michael@amarulasolutions.com>,
 Adam Ford <aford173@gmail.com>, linux-arm-kernel@lists.infradead.org,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Nov 14, 2022 at 8:10 PM Marek Szyprowski
<m.szyprowski@samsung.com> wrote:
>
> On 14.11.2022 11:57, Marek Szyprowski wrote:
> > On 10.11.2022 19:38, Jagan Teki wrote:
> >> Finding the right input bus format throughout the pipeline is hard
> >> so add atomic_get_input_bus_fmts callback and initialize with the
> >> proper input format from list of supported output formats.
> >>
> >> This format can be used in pipeline for negotiating bus format between
> >> the DSI-end of this bridge and the other component closer to pipeline
> >> components.
> >>
> >> List of Pixel formats are taken from,
> >> AN13573 i.MX 8/RT MIPI DSI/CSI-2, Rev. 0, 21 March 2022
> >> 3.7.4 Pixel formats
> >> Table 14. DSI pixel packing formats
> >>
> >> v8:
> >> * added pixel formats supported by NXP AN13573 i.MX 8/RT MIPI DSI/CSI-2
> >>
> >> v7, v6, v5, v4:
> >> * none
> >>
> >> v3:
> >> * include media-bus-format.h
> >>
> >> v2:
> >> * none
> >>
> >> v1:
> >> * new patch
> >>
> >> Signed-off-by: Jagan Teki <jagan@amarulasolutions.com>
> >> ---
> >>   drivers/gpu/drm/bridge/samsung-dsim.c | 53 +++++++++++++++++++++++++++
> >>   1 file changed, 53 insertions(+)
> >>
> >> diff --git a/drivers/gpu/drm/bridge/samsung-dsim.c
> >> b/drivers/gpu/drm/bridge/samsung-dsim.c
> >> index 0fe153b29e4f..33e5ae9c865f 100644
> >> --- a/drivers/gpu/drm/bridge/samsung-dsim.c
> >> +++ b/drivers/gpu/drm/bridge/samsung-dsim.c
> >> @@ -15,6 +15,7 @@
> >>   #include <linux/clk.h>
> >>   #include <linux/delay.h>
> >>   #include <linux/irq.h>
> >> +#include <linux/media-bus-format.h>
> >>   #include <linux/of_device.h>
> >>   #include <linux/phy/phy.h>
> >>   @@ -1321,6 +1322,57 @@ static void
> >> samsung_dsim_atomic_post_disable(struct drm_bridge *bridge,
> >>       pm_runtime_put_sync(dsi->dev);
> >>   }
> >>   +/*
> >> + * This pixel output formats list referenced from,
> >> + * AN13573 i.MX 8/RT MIPI DSI/CSI-2, Rev. 0, 21 March 2022
> >> + * 3.7.4 Pixel formats
> >> + * Table 14. DSI pixel packing formats
> >> + */
> >> +static const u32 samsung_dsim_pixel_output_fmts[] = {
> >> +    MEDIA_BUS_FMT_UYVY8_1X16,
> >> +    MEDIA_BUS_FMT_RGB101010_1X30,
> >> +    MEDIA_BUS_FMT_RGB121212_1X36,
> >> +    MEDIA_BUS_FMT_RGB565_1X16,
> >> +    MEDIA_BUS_FMT_RGB666_1X18,
> >> +    MEDIA_BUS_FMT_RGB888_1X24,
> >> +};
> >> +
> >> +static bool samsung_dsim_pixel_output_fmt_supported(u32 fmt)
> >> +{
> >> +    int i;
> >> +
> >> +    for (i = 0; i < ARRAY_SIZE(samsung_dsim_pixel_output_fmts); i++) {
> >> +        if (samsung_dsim_pixel_output_fmts[i] == fmt)
> >> +            return true;
> >> +    }
> >> +
> >> +    return false;
> >> +}
> >> +
> >> +static u32 *
> >> +samsung_dsim_atomic_get_input_bus_fmts(struct drm_bridge *bridge,
> >> +                       struct drm_bridge_state *bridge_state,
> >> +                       struct drm_crtc_state *crtc_state,
> >> +                       struct drm_connector_state *conn_state,
> >> +                       u32 output_fmt,
> >> +                       unsigned int *num_input_fmts)
> >> +{
> >> +    u32 *input_fmts;
> >> +
> >> +    if (!samsung_dsim_pixel_output_fmt_supported(output_fmt))
> >> +        return NULL;
> >
> >
> > Please add support for MEDIA_BUS_FMT_FIXED and maybe default to
> > MEDIA_BUS_FMT_RGB888_1X24 if requested format is not matched.
> >
> > Otherwise the above check breaks all current clients of the Samsung
> > DSIM/Exynos DSI. I didn't dig into the bus matching code yet, but all
> > DSI panels requests such format on my test systems...
>
> I've checked a bit more the bus format related code and it looks that
> there are more issues. The DSI panels don't use the MEDIA_BUS_FMT_*
> formats thus the bridge negotiation code selects MEDIA_BUS_FMT_FIXED for
> them. On Arndale board with Toshiba tc358764 bridge the
> MEDIA_BUS_FMT_RGB888_1X7X4_SPWG output_fmt is requested in
> samsung_dsim_atomic_get_input_bus_fmts() (forwarded from the LVDS panel,

dsim => tc358764 => panel-simple

If I understand the bridge format negotiation correctly - If
atomic_get_input_bus_fmts is not implemented in tc358764 then
MEDIA_BUS_FMT_FIXED will be the output_fmt for dsim so we can assign
MEDIA_BUS_FMT_RGB888_1X24 for FIXED formats.

from include/drm/drm_bridge.h:

         * This method is called on all elements of the bridge chain as part of
         * the bus format negotiation process that happens in
         * drm_atomic_bridge_chain_select_bus_fmts().
         * This method is optional. When not implemented, the core will bypass
         * bus format negotiation on this element of the bridge without
         * failing, and the previous element in the chain will be passed
         * MEDIA_BUS_FMT_FIXED as its output bus format.

As I can see tc358764 is not implemented either
atomic_get_input_bus_fmts or atomic API, so I think dsim gets the
MEDIA_BUS_FMT_FIXED bridge pipeline. I have tested sn65dsi without
atomic_get_input_bus_fmts I can see the dsim is getting
MEDIA_BUS_FMT_FIXED.

Can you check the same from your side?

On the other side, MEDIA_BUS_FMT_RGB888_1X7X4_SPWG is 24-bit samples
transferred over an LVDS bus with four differential data pairs,
serialized into 7-time slots using SPWG which indeed a
MEDIA_BUS_FMT_RGB888_1X24 input_fmt for the bridge. so handling in the
supported list and reassigning the RGB888_1X24 would be the proper way
to handle this format.

Jagan.
