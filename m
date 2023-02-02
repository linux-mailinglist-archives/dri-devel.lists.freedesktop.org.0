Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 69E0C6884D6
	for <lists+dri-devel@lfdr.de>; Thu,  2 Feb 2023 17:52:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 61C7910E2D8;
	Thu,  2 Feb 2023 16:52:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-xb36.google.com (mail-yb1-xb36.google.com
 [IPv6:2607:f8b0:4864:20::b36])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7C10E10E4CE
 for <dri-devel@lists.freedesktop.org>; Thu,  2 Feb 2023 16:52:55 +0000 (UTC)
Received: by mail-yb1-xb36.google.com with SMTP id 123so2965985ybv.6
 for <dri-devel@lists.freedesktop.org>; Thu, 02 Feb 2023 08:52:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=nX/zKmX0Q/GemuA0YNuQhGDyE378ITO+eXfiCy/ngwE=;
 b=o0iZfUGb6d0Kzi77xWmivymhyzo1OiRlbSXPyd4ZJkkocAluGk12XH6F7vfmddOae8
 uu3tB5tLJrHx2+NY7vB38Tbp4hvPviU/T3gjyDpZPiynPhIBeEVQ32wBqTD8De1WqV6k
 tSHXkufx9cQSrd5/NfwDUV77tMVBFaoUVYjto=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=nX/zKmX0Q/GemuA0YNuQhGDyE378ITO+eXfiCy/ngwE=;
 b=TeXWTxs5nRwcVgpbvbJzGh4E+AZNHAlho+1HIrHoEmH9rwehEvS7qEgTwFUDbuVVah
 borX0UUiAVwZwu1vE6ixdd4CJdXHmZtDXmyIfI3EUeRyt5Pkwgrfub+WvYnxgX+d3YHN
 tq2KhUZuva1fDVN1SoB//BU8ce3+6WzO7puB1teuFKg7JXksohWUmiQIGRFluqOf5l/x
 2AEH4mxwzmkMQctFvCW3YzpM1TWcUPfCnhaqkCxfGGgiOM2PienOqnZOVKrB+3GWTQWW
 r853SMUExLeJRWbVsks9d7VnJ3AN57jECwqHQY06kwvpAfqf/cUkQCKZpzktmxjQ1KEs
 OvMA==
X-Gm-Message-State: AO0yUKUKpzS02X2TSYHJ3vvwgc3g5AjB4hRJdJbF8JoiI9AGHJkXXW9W
 ZQwXqrXCmAr3oZkO7VD4HJ11iqVnHN5GGYgcipfV8Q==
X-Google-Smtp-Source: AK7set9dFxtaPugkWj9eqrIvDkCPGZubPuG7mA/tRz5amPypEJNQ3lfwKqr9dOM1wL5qUUX9j9LvPI+jwsr3S12X7rY=
X-Received: by 2002:a25:e68b:0:b0:814:9c19:383b with SMTP id
 d133-20020a25e68b000000b008149c19383bmr697473ybh.462.1675356774675; Thu, 02
 Feb 2023 08:52:54 -0800 (PST)
MIME-Version: 1.0
References: <20230123151212.269082-1-jagan@amarulasolutions.com>
 <20230123151212.269082-3-jagan@amarulasolutions.com>
 <20230126121227.qcnftqvgiz44egpg@houat>
 <CAMty3ZB6QiqgQN_zWEXULHiipQWU_VaWxDWf9W8OTVQvkACu5A@mail.gmail.com>
 <20230130125828.qkqsq6ax5mojkdbq@houat>
In-Reply-To: <20230130125828.qkqsq6ax5mojkdbq@houat>
From: Jagan Teki <jagan@amarulasolutions.com>
Date: Thu, 2 Feb 2023 22:22:42 +0530
Message-ID: <CAMty3ZD82xZnRxuTq2RdEGAJcEgnaJhKX3CDWGNeSWSQD7xNxg@mail.gmail.com>
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

Hi Maxime,

On Mon, Jan 30, 2023 at 6:28 PM Maxime Ripard <maxime@cerno.tech> wrote:
>
> On Thu, Jan 26, 2023 at 08:48:48PM +0530, Jagan Teki wrote:
> > On Thu, Jan 26, 2023 at 5:42 PM Maxime Ripard <maxime@cerno.tech> wrote:
> > >
> > > Hi,
> > >
> > > On Mon, Jan 23, 2023 at 08:41:56PM +0530, Jagan Teki wrote:
> > > > Add devm OF helper to return the next DSI bridge in the chain.
> > > >
> > > > Unlike general bridge return helper devm_drm_of_get_bridge, this
> > > > helper uses the dsi specific panel_or_bridge helper to find the
> > > > next DSI device in the pipeline.
> > > >
> > > > Helper lookup a given child DSI node or a DT node's port and
> > > > endpoint number, find the connected node and return either
> > > > the associated struct drm_panel or drm_bridge device.
> > >
> > > I'm not sure that using a device managed helper is the right choice
> > > here. The bridge will stay longer than the backing device so it will
> > > create a use-after-free. You should probably use a DRM-managed action
> > > here instead.
> >
> > Thanks for the comments. If I understand correctly we can use
> > drmm_panel_bridge_add instead devm_drm_panel_bridge_add once we found
> > the panel or bridge - am I correct?
>
> It's not that we can, it's that the devm_panel_bridge_add is unsafe:
> when the module is removed the device will go away and all the devm
> resources freed, but the DRM device sticks around until the last
> application with a fd open closes that fd.

Would you please check this, Here I'm trying to do

1. find a panel or bridge
2. if panel add it as a panel bridge
3. add DRM-managed action with the help of bridge->dev after step 2.

Didn't test the behavior, just wanted to check whether it can be a
possibility to use bridge->dev as this dev is assigned with
encoder->dev during the bridge attach the chain. Please check and let
me know.

struct drm_bridge *devm_drm_of_dsi_get_bridge(struct device *dev,
                                              struct device_node *np,
                                              u32 port, u32 endpoint)
{
        struct drm_bridge *bridge;
        struct drm_panel *panel;
        int ret;

        ret = drm_of_dsi_find_panel_or_bridge(np, port, endpoint,
                                              &panel, &bridge);
        if (ret)
                return ERR_PTR(ret);

        if (panel)
                bridge = devm_drm_panel_bridge_add(dev, panel);

        if (IS_ERR(bridge))
                return bridge;

        ret = drmm_add_action_or_reset(bridge->dev,
drmm_drm_panel_bridge_release,
                                       bridge);
        if (ret)
                return ERR_PTR(ret);

        return bridge;
}

Thanks,
Jagan.
