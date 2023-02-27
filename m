Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BBA146A4088
	for <lists+dri-devel@lfdr.de>; Mon, 27 Feb 2023 12:26:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5EA1E10E3B5;
	Mon, 27 Feb 2023 11:25:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-x1129.google.com (mail-yw1-x1129.google.com
 [IPv6:2607:f8b0:4864:20::1129])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 10CBB10E3B5
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Feb 2023 11:25:56 +0000 (UTC)
Received: by mail-yw1-x1129.google.com with SMTP id
 00721157ae682-536cb25982eso165286657b3.13
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Feb 2023 03:25:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=nNg2nPpMgLLDVX3xnf9PMvVBiF465kosAtVWrVSaXbU=;
 b=GMuA1QClha2DZejPEjCPW/CWDxHuv/6wFK/t/rGhf3Fk9RkktV8Q2MRlwvgtgZfv0J
 2n6/wySrbQfV+46Q+ezMsh9/4fIy7Bt3pHLlu1skxzBmQVfvMsLw6QzMj7dSxvhhEft/
 ETKGAKC4V7H+rLCulC9BTnM+yDd/sdVe2EWGs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=nNg2nPpMgLLDVX3xnf9PMvVBiF465kosAtVWrVSaXbU=;
 b=x7skYGuFJCnAhTQCeTKH617c8mF4v7DVzxmzYP+B06oEOPf97ix4qyqw6vx1ATW0sd
 AVm1JgvqeF2fckK0GGcvNOfeWttTACJjln4zyj9O/kgSFvEQG2JU+hV75zFXkCwBhYtE
 mrHrFMdCde1WBQxapv7peK12iqFqGaIsTAHtpjfkjgC+OBVfg2rmz4/dRBv4nZx8fmR4
 SxmmJxqmW50iDScxtE31AuDTWz1+BkpArnbGQw5ScsIaWq+OBypEJUvfMJ16/eVCBHJR
 nCCtjSPc3+Zxjgqp6JhwGmaKB4yiSOJ4xOcB6m/OVjsdm8YQHP18XZjHmhLXtApOu6Of
 3Y1w==
X-Gm-Message-State: AO0yUKUthbmWU7OqXM7vwPGJscD1WpPaNyAXq4RCj2L25lbQFrMOzZSf
 I/8s9K8OpyffxsDyJuV9UL4KG5TdbxZMUdic3dxvmA==
X-Google-Smtp-Source: AK7set+bEA2GTil328S9PwuohS6+IhKvhKBhLJUYJA6fq6nVzOquyvDFaVaYnpi1K4ip4bDmE+V8Xt3tbTa6iHYsMmc=
X-Received: by 2002:a81:af5d:0:b0:52e:cea7:f6e3 with SMTP id
 x29-20020a81af5d000000b0052ecea7f6e3mr9917618ywj.10.1677497155043; Mon, 27
 Feb 2023 03:25:55 -0800 (PST)
MIME-Version: 1.0
References: <20230123151212.269082-1-jagan@amarulasolutions.com>
 <20230123151212.269082-3-jagan@amarulasolutions.com>
 <20230126121227.qcnftqvgiz44egpg@houat>
 <CAMty3ZB6QiqgQN_zWEXULHiipQWU_VaWxDWf9W8OTVQvkACu5A@mail.gmail.com>
 <20230130125828.qkqsq6ax5mojkdbq@houat>
 <CAMty3ZD82xZnRxuTq2RdEGAJcEgnaJhKX3CDWGNeSWSQD7xNxg@mail.gmail.com>
 <20230203082607.xu6xv7c6eq2yq64c@houat>
 <CAMty3ZCYi7k=MdxZA-VMW6tfU1tqu7vrwUQyj25Oyssc0HTOKQ@mail.gmail.com>
 <20230203104938.qink5iuibxux2bjz@houat>
 <CAMty3ZB=v=0SZ5SX2y4bDMty8bdN260zs5ZCOy3Esr0+ZZsZ7A@mail.gmail.com>
 <20230203110437.otzl2azscbujigv6@houat>
In-Reply-To: <20230203110437.otzl2azscbujigv6@houat>
From: Jagan Teki <jagan@amarulasolutions.com>
Date: Mon, 27 Feb 2023 16:55:43 +0530
Message-ID: <CAMty3ZBRtWcqBoEhtka+Zt9+j+8FYNfXgbnTVc6KstPQ0+VHWQ@mail.gmail.com>
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

On Fri, Feb 3, 2023 at 4:34 PM Maxime Ripard <maxime@cerno.tech> wrote:
>
> On Fri, Feb 03, 2023 at 04:28:30PM +0530, Jagan Teki wrote:
> > On Fri, Feb 3, 2023 at 4:19 PM Maxime Ripard <maxime@cerno.tech> wrote:
> > >
> > > On Fri, Feb 03, 2023 at 04:13:49PM +0530, Jagan Teki wrote:
> > > > On Fri, Feb 3, 2023 at 1:56 PM Maxime Ripard <maxime@cerno.tech> wrote:
> > > > >
> > > > > On Thu, Feb 02, 2023 at 10:22:42PM +0530, Jagan Teki wrote:
> > > > > > Hi Maxime,
> > > > > >
> > > > > > On Mon, Jan 30, 2023 at 6:28 PM Maxime Ripard <maxime@cerno.tech> wrote:
> > > > > > >
> > > > > > > On Thu, Jan 26, 2023 at 08:48:48PM +0530, Jagan Teki wrote:
> > > > > > > > On Thu, Jan 26, 2023 at 5:42 PM Maxime Ripard <maxime@cerno.tech> wrote:
> > > > > > > > >
> > > > > > > > > Hi,
> > > > > > > > >
> > > > > > > > > On Mon, Jan 23, 2023 at 08:41:56PM +0530, Jagan Teki wrote:
> > > > > > > > > > Add devm OF helper to return the next DSI bridge in the chain.
> > > > > > > > > >
> > > > > > > > > > Unlike general bridge return helper devm_drm_of_get_bridge, this
> > > > > > > > > > helper uses the dsi specific panel_or_bridge helper to find the
> > > > > > > > > > next DSI device in the pipeline.
> > > > > > > > > >
> > > > > > > > > > Helper lookup a given child DSI node or a DT node's port and
> > > > > > > > > > endpoint number, find the connected node and return either
> > > > > > > > > > the associated struct drm_panel or drm_bridge device.
> > > > > > > > >
> > > > > > > > > I'm not sure that using a device managed helper is the right choice
> > > > > > > > > here. The bridge will stay longer than the backing device so it will
> > > > > > > > > create a use-after-free. You should probably use a DRM-managed action
> > > > > > > > > here instead.
> > > > > > > >
> > > > > > > > Thanks for the comments. If I understand correctly we can use
> > > > > > > > drmm_panel_bridge_add instead devm_drm_panel_bridge_add once we found
> > > > > > > > the panel or bridge - am I correct?
> > > > > > >
> > > > > > > It's not that we can, it's that the devm_panel_bridge_add is unsafe:
> > > > > > > when the module is removed the device will go away and all the devm
> > > > > > > resources freed, but the DRM device sticks around until the last
> > > > > > > application with a fd open closes that fd.
> > > > > >
> > > > > > Would you please check this, Here I'm trying to do
> > > > > >
> > > > > > 1. find a panel or bridge
> > > > > > 2. if panel add it as a panel bridge
> > > > > > 3. add DRM-managed action with the help of bridge->dev after step 2.
> > > > >
> > > > > The logic is sound in your patch
> > > > >
> > > > > > Didn't test the behavior, just wanted to check whether it can be a
> > > > > > possibility to use bridge->dev as this dev is assigned with
> > > > > > encoder->dev during the bridge attach the chain. Please check and let
> > > > > > me know.
> > > > > >
> > > > > > struct drm_bridge *devm_drm_of_dsi_get_bridge(struct device *dev,
> > > > > >                                               struct device_node *np,
> > > > > >                                               u32 port, u32 endpoint)
> > > > > > {
> > > > > >         struct drm_bridge *bridge;
> > > > > >         struct drm_panel *panel;
> > > > > >         int ret;
> > > > > >
> > > > > >         ret = drm_of_dsi_find_panel_or_bridge(np, port, endpoint,
> > > > > >                                               &panel, &bridge);
> > > > > >         if (ret)
> > > > > >                 return ERR_PTR(ret);
> > > > > >
> > > > > >         if (panel)
> > > > > >                 bridge = devm_drm_panel_bridge_add(dev, panel);
> > > > > >
> > > > > >         if (IS_ERR(bridge))
> > > > > >                 return bridge;
> > > > > >
> > > > > >         ret = drmm_add_action_or_reset(bridge->dev,
> > > > > > drmm_drm_panel_bridge_release,
> > > > > >                                        bridge);
> > > > > >         if (ret)
> > > > > >                 return ERR_PTR(ret);
> > > > > >
> > > > > >         return bridge;
> > > > > > }
> > > > >
> > > > > It's the implementation that isn't. You cannot use a devm hook to
> > > > > register a KMS structure, so it's not that you should add a
> > > > > drmm_add_action call, it's that you shouldn't call
> > > > > devm_drm_panel_bridge_add in the first place.
> > > >
> > > > I think it is because the remove action helper uses
> > > > drm_panel_bridge_remove instead of devm hook.
> > > > >
> > > > > So either you use drm_panel_bridge_add and a custom drmm action, or you
> > > > > add a drmm_panel_bridge_add function and use it.
> > > >
> > > > It is not possible to use this helper as it is expecting drm_device
> > >
> > > It's definitely possible, just change the prototype of the function to
> > > take a drm_device pointer, just like any other drmm_* function.
> >
> > But, in my case, I only get the drm_device pointer once I found the
> > bridge pointer of panel_bridge but the actual bridge finding for
> > panel_bridge is happening in the drmm_panel_bridge_add definition.
> > Doesn't it redundant if I find the panel_bridge and pass drm_device
> > and panel pointer for calling drmm_panel_bridge_add?
>
> We've already discussed this, but you can't use
> devm_drm_of_dsi_get_bridge() from the MIPI-DSI host attach function. So
> fix that first, and then you'll have access to the DRM device in your
> driver.

I have updated the new series with this change. Please have a look.

Thanks,
Jagan.
