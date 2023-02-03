Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E6C268972B
	for <lists+dri-devel@lfdr.de>; Fri,  3 Feb 2023 11:44:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C00DD10E752;
	Fri,  3 Feb 2023 10:44:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-xb30.google.com (mail-yb1-xb30.google.com
 [IPv6:2607:f8b0:4864:20::b30])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8668510E752
 for <dri-devel@lists.freedesktop.org>; Fri,  3 Feb 2023 10:44:01 +0000 (UTC)
Received: by mail-yb1-xb30.google.com with SMTP id 74so5476004ybl.12
 for <dri-devel@lists.freedesktop.org>; Fri, 03 Feb 2023 02:44:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=S7VhcKV+ZFPX+Qz9s+IUdt/dAvA8DMpbAaiW2dHB/78=;
 b=WPKEt+csQ+poj49Obnxk1IiKCatBi+rRyCnJ5PBDjXwO4hslpWRI4R+00oX8BQrxTp
 zaiXAZLCM0T5hSgDjdqgPJPXLQjOTbpHDyp/d+N8bVj9+NpMEoSEmudvhoI+9f0X7s4k
 ZMX8Lfuv59UrzjxY4TBKa8ULwU5oMQ3IF84Y8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=S7VhcKV+ZFPX+Qz9s+IUdt/dAvA8DMpbAaiW2dHB/78=;
 b=x35TpZaOYaO/lq1oV8o1kidwIu8mUivA3HC6A8fZjVrhLilmRsUEShKANPUGCIKsBt
 0c7kr7uVQvDDdEL2YkN+W/t8wTe/wrzZ9cdI3o1NfGt8TrQb6O4NTarMHwTQ6nI5GF+I
 cMKxykdSqzI2Q6JykMQV9tvRH7DIALPTSVoqFGHf6IX+XuHqwPHFksoi3mZ03o/GeXUL
 ZUC5/bWaCZP8kXmSdsHYBoH0+cjpNYfMVM52FS1cQ+/lpexRpu2hFOWr8yjhsEm+GDvJ
 Ke3FVUNWYjMrVbCjD1XIUc/qseijpYcKCDDFu3qRO+RNcegCoTFaoCKkMlloWSKIlzyO
 f6sA==
X-Gm-Message-State: AO0yUKX2lDm3HEQWZXvVN5/eeIwjvfTCJici/vOhnBU1wq0tHspoOVVU
 54hCW1a3X8jfi7UMdH8COLAtmmlIuQBdvAzzw87ftg==
X-Google-Smtp-Source: AK7set+L9tRWOkGhK5vWUmcJD0ppP0w4EuqIAWFJSMIxWeMPwYan9MGURLFIiaqO7MBY4Ze/4x1w9hL8+s2CfH9AMc8=
X-Received: by 2002:a25:d413:0:b0:80b:6fc1:8b32 with SMTP id
 m19-20020a25d413000000b0080b6fc18b32mr1027978ybf.126.1675421040641; Fri, 03
 Feb 2023 02:44:00 -0800 (PST)
MIME-Version: 1.0
References: <20230123151212.269082-1-jagan@amarulasolutions.com>
 <20230123151212.269082-3-jagan@amarulasolutions.com>
 <20230126121227.qcnftqvgiz44egpg@houat>
 <CAMty3ZB6QiqgQN_zWEXULHiipQWU_VaWxDWf9W8OTVQvkACu5A@mail.gmail.com>
 <20230130125828.qkqsq6ax5mojkdbq@houat>
 <CAMty3ZD82xZnRxuTq2RdEGAJcEgnaJhKX3CDWGNeSWSQD7xNxg@mail.gmail.com>
 <20230203082607.xu6xv7c6eq2yq64c@houat>
In-Reply-To: <20230203082607.xu6xv7c6eq2yq64c@houat>
From: Jagan Teki <jagan@amarulasolutions.com>
Date: Fri, 3 Feb 2023 16:13:49 +0530
Message-ID: <CAMty3ZCYi7k=MdxZA-VMW6tfU1tqu7vrwUQyj25Oyssc0HTOKQ@mail.gmail.com>
Subject: Re: [RESEND PATCH v11 02/18] drm: bridge: panel: Add
 devm_drm_of_dsi_get_bridge helper
To: Maxime Ripard <maxime@cerno.tech>
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
Cc: dri-devel@lists.freedesktop.org,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>, Fancy Fang <chen.fang@nxp.com>,
 Marek Szyprowski <m.szyprowski@samsung.com>, Marek Vasut <marex@denx.de>,
 linux-samsung-soc@vger.kernel.org, Joonyoung Shim <jy0922.shim@samsung.com>,
 Neil Armstrong <narmstrong@linaro.org>,
 Frieder Schrempf <frieder.schrempf@kontron.de>,
 Tommaso Merciai <tommaso.merciai@amarulasolutions.com>,
 NXP Linux Team <linux-imx@nxp.com>,
 Michael Nazzareno Trimarchi <michael@amarulasolutions.com>,
 Matteo Lisi <matteo.lisi@engicam.com>, Adam Ford <aford173@gmail.com>,
 linux-arm-kernel@lists.infradead.org, Seung-Woo Kim <sw0312.kim@samsung.com>,
 Robert Foss <robert.foss@linaro.org>,
 Kyungmin Park <kyungmin.park@samsung.com>,
 linux-amarula <linux-amarula@amarulasolutions.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Feb 3, 2023 at 1:56 PM Maxime Ripard <maxime@cerno.tech> wrote:
>
> On Thu, Feb 02, 2023 at 10:22:42PM +0530, Jagan Teki wrote:
> > Hi Maxime,
> >
> > On Mon, Jan 30, 2023 at 6:28 PM Maxime Ripard <maxime@cerno.tech> wrote:
> > >
> > > On Thu, Jan 26, 2023 at 08:48:48PM +0530, Jagan Teki wrote:
> > > > On Thu, Jan 26, 2023 at 5:42 PM Maxime Ripard <maxime@cerno.tech> wrote:
> > > > >
> > > > > Hi,
> > > > >
> > > > > On Mon, Jan 23, 2023 at 08:41:56PM +0530, Jagan Teki wrote:
> > > > > > Add devm OF helper to return the next DSI bridge in the chain.
> > > > > >
> > > > > > Unlike general bridge return helper devm_drm_of_get_bridge, this
> > > > > > helper uses the dsi specific panel_or_bridge helper to find the
> > > > > > next DSI device in the pipeline.
> > > > > >
> > > > > > Helper lookup a given child DSI node or a DT node's port and
> > > > > > endpoint number, find the connected node and return either
> > > > > > the associated struct drm_panel or drm_bridge device.
> > > > >
> > > > > I'm not sure that using a device managed helper is the right choice
> > > > > here. The bridge will stay longer than the backing device so it will
> > > > > create a use-after-free. You should probably use a DRM-managed action
> > > > > here instead.
> > > >
> > > > Thanks for the comments. If I understand correctly we can use
> > > > drmm_panel_bridge_add instead devm_drm_panel_bridge_add once we found
> > > > the panel or bridge - am I correct?
> > >
> > > It's not that we can, it's that the devm_panel_bridge_add is unsafe:
> > > when the module is removed the device will go away and all the devm
> > > resources freed, but the DRM device sticks around until the last
> > > application with a fd open closes that fd.
> >
> > Would you please check this, Here I'm trying to do
> >
> > 1. find a panel or bridge
> > 2. if panel add it as a panel bridge
> > 3. add DRM-managed action with the help of bridge->dev after step 2.
>
> The logic is sound in your patch
>
> > Didn't test the behavior, just wanted to check whether it can be a
> > possibility to use bridge->dev as this dev is assigned with
> > encoder->dev during the bridge attach the chain. Please check and let
> > me know.
> >
> > struct drm_bridge *devm_drm_of_dsi_get_bridge(struct device *dev,
> >                                               struct device_node *np,
> >                                               u32 port, u32 endpoint)
> > {
> >         struct drm_bridge *bridge;
> >         struct drm_panel *panel;
> >         int ret;
> >
> >         ret = drm_of_dsi_find_panel_or_bridge(np, port, endpoint,
> >                                               &panel, &bridge);
> >         if (ret)
> >                 return ERR_PTR(ret);
> >
> >         if (panel)
> >                 bridge = devm_drm_panel_bridge_add(dev, panel);
> >
> >         if (IS_ERR(bridge))
> >                 return bridge;
> >
> >         ret = drmm_add_action_or_reset(bridge->dev,
> > drmm_drm_panel_bridge_release,
> >                                        bridge);
> >         if (ret)
> >                 return ERR_PTR(ret);
> >
> >         return bridge;
> > }
>
> It's the implementation that isn't. You cannot use a devm hook to
> register a KMS structure, so it's not that you should add a
> drmm_add_action call, it's that you shouldn't call
> devm_drm_panel_bridge_add in the first place.

I think it is because the remove action helper uses
drm_panel_bridge_remove instead of devm hook.
>
> So either you use drm_panel_bridge_add and a custom drmm action, or you
> add a drmm_panel_bridge_add function and use it.

It is not possible to use this helper as it is expecting drm_device
point that would get only if we found panel_bridge, so combined calls
here can help.

Would you please check this updated implementation and let me know?

struct drm_bridge *drmm_panel_bridge_add_nodrm(struct drm_panel *panel)
{
        struct drm_bridge *bridge;
        int ret;

        bridge = drm_panel_bridge_add_typed(panel, panel->connector_type);
        if (IS_ERR(bridge))
                return bridge;

        ret = drmm_add_action_or_reset(bridge->dev,
drmm_drm_panel_bridge_release,
                                       bridge);
        if (ret)
                return ERR_PTR(ret);

        bridge->pre_enable_prev_first = panel->prepare_prev_first;

        return bridge;
}

struct drm_bridge *drm_of_dsi_get_bridge(struct device_node *np, u32
port, u32 endpoint)
{
        struct drm_bridge *bridge;
        struct drm_panel *panel;
        int ret;

        ret = drm_of_dsi_find_panel_or_bridge(np, port, endpoint,
                                              &panel, &bridge);
        if (ret)
                return ERR_PTR(ret);

        if (panel)
                bridge = drmm_panel_bridge_add_nodrm(panel);

        return bridge;
}

Thanks,
Jagan.
