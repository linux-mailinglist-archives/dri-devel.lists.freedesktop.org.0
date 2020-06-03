Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F3FBC1ECB3B
	for <lists+dri-devel@lfdr.de>; Wed,  3 Jun 2020 10:16:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E59D7892B7;
	Wed,  3 Jun 2020 08:16:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com
 [IPv6:2a00:1450:4864:20::444])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 446B7892B7
 for <dri-devel@lists.freedesktop.org>; Wed,  3 Jun 2020 08:16:21 +0000 (UTC)
Received: by mail-wr1-x444.google.com with SMTP id r7so1338346wro.1
 for <dri-devel@lists.freedesktop.org>; Wed, 03 Jun 2020 01:16:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=xm0i6mosmeNviMRp9Dq/gDSh0tT8mipewlnJAvRkxVY=;
 b=FW8Al+fTIAWa6oWVL1Ktv0M68HRiJ/xfe7DgM7EZNabphfUeso1XrOLzhbnsdh53XT
 b06HOTwVc+MV2yuTcWOC5pWTtanclLJXzybraXtdP44kdzZIi6j7SMTmvdcBm7ssRP8/
 5WjDeLfWvX5dEKu/TKCAS+L30ObB981UGBm8Q=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=xm0i6mosmeNviMRp9Dq/gDSh0tT8mipewlnJAvRkxVY=;
 b=bKRo+dhTSpuMy8zntvWDqOmrS2qNkOU3bLvLlSzH2fVl+2VT7KU3XTLDhM+fHuCasA
 L+Zaa03IyGvJx4FZMIHk8HDWrdNAwOHKg1ryCSawnHkWkuDxSZ2IUO+UGPC8n9ywv6bE
 ykKjO2KpK44Ic83efv3n+sUIvZfkibdov00yDhax6Rzbgk4D6HJIe/wzh7ENpfM+Y1DG
 Ne/VROezsnX4+yxYibSE1h4fv/ywYsFndQ1nQ+oHwKH5nMHQNLPFNxt3twCJXtAwr7O0
 XiFNcMe0FFApKzljbWmUxvcXFO5CL2goHdrKIMIqgFoWR67kT6UABELu+VhrtfU9ZXTV
 TauA==
X-Gm-Message-State: AOAM533Qk6+dovsYJIf/s7t4UhTNGpqYh3pRz3wGV1YbaEYm7skABnSq
 Mpjq2S8OBTsIOUOBPQUK2r7I4Q==
X-Google-Smtp-Source: ABdhPJzVwZYpNFFuOxA4y1+BiSbXhIW0gNVR+/l03abV4htm087+QBb0IikGFtJZPtGh4Dx332OUxA==
X-Received: by 2002:a05:6000:10d2:: with SMTP id
 b18mr29592501wrx.366.1591172179795; 
 Wed, 03 Jun 2020 01:16:19 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id n23sm1752129wmc.21.2020.06.03.01.16.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 Jun 2020 01:16:19 -0700 (PDT)
Date: Wed, 3 Jun 2020 10:16:17 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: Re: [PATCH 02/21] drm: mxsfb: Use drm_panel_bridge
Message-ID: <20200603081617.GF20149@phenom.ffwll.local>
References: <20200309195216.31042-1-laurent.pinchart@ideasonboard.com>
 <20200309195216.31042-3-laurent.pinchart@ideasonboard.com>
 <eb16f03d670a424a4a63d9c855fabe65@agner.ch>
 <20200530021421.GA20571@pendragon.ideasonboard.com>
 <20200602131237.GC20149@phenom.ffwll.local>
 <20200602171317.GH12043@pendragon.ideasonboard.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200602171317.GH12043@pendragon.ideasonboard.com>
X-Operating-System: Linux phenom 5.6.0-1-amd64 
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
Cc: Marek Vasut <marex@denx.de>, dri-devel@lists.freedesktop.org,
 kernel@pengutronix.de, linux-imx@nxp.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Jun 02, 2020 at 08:13:17PM +0300, Laurent Pinchart wrote:
> Hi Daniel,
> 
> On Tue, Jun 02, 2020 at 03:12:37PM +0200, Daniel Vetter wrote:
> > On Sat, May 30, 2020 at 05:14:21AM +0300, Laurent Pinchart wrote:
> > > On Mon, Mar 23, 2020 at 10:27:21PM +0100, Stefan Agner wrote:
> > > > On 2020-03-09 20:51, Laurent Pinchart wrote:
> > > > > Replace the manual connector implementation based on drm_panel with the
> > > > > drm_panel_bridge helper. This simplifies the mxsfb driver by removing
> > > > > connector-related code, and standardizing all pipeline control
> > > > > operations on bridges.
> > > > > 
> > > > > A hack is needed to get hold of the connector, as that's our only source
> > > > > of bus flags and formats for now. As soon as the bridge API provides us
> > > > > with that information this can be fixed.
> > > > 
> > > > This seems like a nice simplification.
> > > > 
> > > > I gave this a go applied on today's drm-misc-next using a Colibri iMX7
> > > > (imx7d-colibri-emmc-eval-v3.dts device tree). This device makes use of
> > > > the simple panel driver. I get this when booting:
> > > > 
> > > > [    2.976698] [drm] Supports vblank timestamp caching Rev 2
> > > > (21.10.2013).
> > > > [    2.983526] ------------[ cut here ]------------
> > > > [    2.988180] WARNING: CPU: 0 PID: 1 at
> > > > drivers/gpu/drm/bridge/panel.c:267 devm_drm_panel_bridge_add+0x25/0x28
> > > > [    2.998059] Modules linked in:
> > > > [    3.001159] CPU: 0 PID: 1 Comm: swapper/0 Not tainted
> > > > 5.6.0-rc5-yocto-standard-01250-ga4ce5db7c9f1 #29
> > > > [    3.010493] Hardware name: Freescale i.MX7 Dual (Device Tree)
> > > > [    3.016281] [<c010f089>] (unwind_backtrace) from [<c010a9bb>]
> > > > (show_stack+0xb/0xc)
> > > > [    3.023887] [<c010a9bb>] (show_stack) from [<c08b33cf>]
> > > > (dump_stack+0x63/0x70)
> > > > [    3.031144] [<c08b33cf>] (dump_stack) from [<c0124385>]
> > > > (__warn+0x9d/0xb0)
> > > > [    3.038047] [<c0124385>] (__warn) from [<c0124403>]
> > > > (warn_slowpath_fmt+0x6b/0x70)
> > > > [    3.045564] [<c0124403>] (warn_slowpath_fmt) from [<c04ebf65>]
> > > > (devm_drm_panel_bridge_add+0x25/0x28)
> > > > [    3.054736] [<c04ebf65>] (devm_drm_panel_bridge_add) from
> > > > [<c051fe7f>] (mxsfb_probe+0x197/0x2e0)
> > > > [    3.063559] [<c051fe7f>] (mxsfb_probe) from [<c0532e91>]
> > > > (platform_drv_probe+0x2d/0x60)
> > > > [    3.071598] [<c0532e91>] (platform_drv_probe) from [<c0531615>]
> > > > (really_probe+0x1dd/0x330)
> > > > [    3.079897] [<c0531615>] (really_probe) from [<c05318b3>]
> > > > (driver_probe_device+0x4f/0x154)
> > > > [    3.088195] [<c05318b3>] (driver_probe_device) from [<c0531b3f>]
> > > > (device_driver_attach+0x37/0x44)
> > > > [    3.097101] [<c0531b3f>] (device_driver_attach) from [<c0531bc7>]
> > > > (__driver_attach+0x7b/0xec)
> > > > [    3.105660] [<c0531bc7>] (__driver_attach) from [<c0530069>]
> > > > (bus_for_each_dev+0x3d/0x64)
> > > > [    3.113870] [<c0530069>] (bus_for_each_dev) from [<c0530b9b>]
> > > > (bus_add_driver+0xef/0x160)
> > > > [    3.122081] [<c0530b9b>] (bus_add_driver) from [<c053238d>]
> > > > (driver_register+0x35/0x9c)
> > > > [    3.130119] [<c053238d>] (driver_register) from [<c0102de9>]
> > > > (do_one_initcall+0x3d/0x1e4)
> > > > [    3.138333] [<c0102de9>] (do_one_initcall) from [<c1100d13>]
> > > > (kernel_init_freeable+0x1b3/0x1fc)
> > > > [    3.147069] [<c1100d13>] (kernel_init_freeable) from [<c08c3f7b>]
> > > > (kernel_init+0x7/0xd0)
> > > > [    3.155194] [<c08c3f7b>] (kernel_init) from [<c01010f9>]
> > > > (ret_from_fork+0x11/0x38)
> > > > [    3.162789] Exception stack(0xec0e3fb0 to 0xec0e3ff8)
> > > > [    3.167862] 3fa0:                                     00000000
> > > > 00000000 00000000 00000000
> > > > [    3.176071] 3fc0: 00000000 00000000 00000000 00000000 00000000
> > > > 00000000 00000000 00000000
> > > > [    3.184278] 3fe0: 00000000 00000000 00000000 00000000 00000013
> > > > 00000000
> > > > [    3.191029] ---[ end trace b69e1f44de470959 ]---
> > > > [    3.195671] mxsfb 30730000.lcdif: Cannot connect bridge: -19
> > > > 
> > > > Should we maybe use devm_drm_panel_bridge_add_typed?
> > > 
> > > As Sam reported, this is caused by the panel not setting connector_type.
> > > We could use devm_drm_panel_bridge_add_typed(), even if I like the
> > > warning as it uncovers the problematic panels and gets them fixed. What
> > > would be your preference ?
> > 
> > Adding warnings everywhere is kinda uncool, at least my experience is that
> > if there's too much you get warning overload and train people to ignore
> > them.
> > 
> > Imo either hide the wwarning for now, or if it's not too much work, review
> > all the panel drivers and make sure they set the connector type somewhere.
> 
> All panel drivers but panel-simple set the connector type. For
> panel-simple, the type is stored in the panel_desc panel description,
> and out of the 123 supported panels, only 48 have a connector type. I've
> just sent a patch to fix this for the 7 DSI panels, so only 68 panels to
> go :-) This will require trying to find the corresponding datasheets, so
> that's a large effort for a single developer. That's why I was hoping a
> WARN_ON() could help distributing the work :-) I hear your concern
> though, and I'll set a default in this driver for the time being.

I think some fallback in simple-panel.c with maybe a fixme would be ok for
this case. I don't think this has to be perfect, afaik userspace at best
just checks "is this a panel", not which specific type.
-Daniel

> 
> > Warnings are kinda ok once you're pretty sure you got them all, and want
> > to make sure newly added drivers get this all right. But not before we've
> > reached that.
> > 
> > > > Two more comments below.
> > > > 
> > > > > Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> > > > > ---
> > > > >  drivers/gpu/drm/mxsfb/Makefile    |   2 +-
> > > > >  drivers/gpu/drm/mxsfb/mxsfb_drv.c | 105 ++++++++++++++----------------
> > > > >  drivers/gpu/drm/mxsfb/mxsfb_drv.h |   5 +-
> > > > >  drivers/gpu/drm/mxsfb/mxsfb_out.c |  99 ----------------------------
> > > > >  4 files changed, 53 insertions(+), 158 deletions(-)
> > > > >  delete mode 100644 drivers/gpu/drm/mxsfb/mxsfb_out.c
> > > > > 
> > > > > diff --git a/drivers/gpu/drm/mxsfb/Makefile b/drivers/gpu/drm/mxsfb/Makefile
> > > > > index ff6e358088fa..811584e54ad1 100644
> > > > > --- a/drivers/gpu/drm/mxsfb/Makefile
> > > > > +++ b/drivers/gpu/drm/mxsfb/Makefile
> > > > > @@ -1,3 +1,3 @@
> > > > >  # SPDX-License-Identifier: GPL-2.0-only
> > > > > -mxsfb-y := mxsfb_drv.o mxsfb_crtc.o mxsfb_out.o
> > > > > +mxsfb-y := mxsfb_drv.o mxsfb_crtc.o
> > > > >  obj-$(CONFIG_DRM_MXSFB)	+= mxsfb.o
> > > > > diff --git a/drivers/gpu/drm/mxsfb/mxsfb_drv.c
> > > > > b/drivers/gpu/drm/mxsfb/mxsfb_drv.c
> > > > > index 2e6068d96034..cffc70257bd3 100644
> > > > > --- a/drivers/gpu/drm/mxsfb/mxsfb_drv.c
> > > > > +++ b/drivers/gpu/drm/mxsfb/mxsfb_drv.c
> > > > > @@ -29,7 +29,6 @@
> > > > >  #include <drm/drm_gem_framebuffer_helper.h>
> > > > >  #include <drm/drm_irq.h>
> > > > >  #include <drm/drm_of.h>
> > > > > -#include <drm/drm_panel.h>
> > > > >  #include <drm/drm_probe_helper.h>
> > > > >  #include <drm/drm_simple_kms_helper.h>
> > > > >  #include <drm/drm_vblank.h>
> > > > > @@ -100,29 +99,11 @@ static void mxsfb_pipe_enable(struct
> > > > > drm_simple_display_pipe *pipe,
> > > > >  			      struct drm_crtc_state *crtc_state,
> > > > >  			      struct drm_plane_state *plane_state)
> > > > >  {
> > > > > -	struct drm_connector *connector;
> > > > >  	struct mxsfb_drm_private *mxsfb = drm_pipe_to_mxsfb_drm_private(pipe);
> > > > >  	struct drm_device *drm = pipe->plane.dev;
> > > > >  
> > > > > -	if (!mxsfb->connector) {
> > > > > -		list_for_each_entry(connector,
> > > > > -				    &drm->mode_config.connector_list,
> > > > > -				    head)
> > > > > -			if (connector->encoder == &mxsfb->pipe.encoder) {
> > > > > -				mxsfb->connector = connector;
> > > > > -				break;
> > > > > -			}
> > > > > -	}
> > > > > -
> > > > > -	if (!mxsfb->connector) {
> > > > > -		dev_warn(drm->dev, "No connector attached, using default\n");
> > > > > -		mxsfb->connector = &mxsfb->panel_connector;
> > > > > -	}
> > > > > -
> > > > >  	pm_runtime_get_sync(drm->dev);
> > > > > -	drm_panel_prepare(mxsfb->panel);
> > > > >  	mxsfb_crtc_enable(mxsfb);
> > > > > -	drm_panel_enable(mxsfb->panel);
> > > > >  }
> > > > >  
> > > > >  static void mxsfb_pipe_disable(struct drm_simple_display_pipe *pipe)
> > > > > @@ -132,9 +113,7 @@ static void mxsfb_pipe_disable(struct
> > > > > drm_simple_display_pipe *pipe)
> > > > >  	struct drm_crtc *crtc = &pipe->crtc;
> > > > >  	struct drm_pending_vblank_event *event;
> > > > >  
> > > > > -	drm_panel_disable(mxsfb->panel);
> > > > >  	mxsfb_crtc_disable(mxsfb);
> > > > > -	drm_panel_unprepare(mxsfb->panel);
> > > > >  	pm_runtime_put_sync(drm->dev);
> > > > >  
> > > > >  	spin_lock_irq(&drm->event_lock);
> > > > > @@ -144,9 +123,6 @@ static void mxsfb_pipe_disable(struct
> > > > > drm_simple_display_pipe *pipe)
> > > > >  		drm_crtc_send_vblank_event(crtc, event);
> > > > >  	}
> > > > >  	spin_unlock_irq(&drm->event_lock);
> > > > > -
> > > > > -	if (mxsfb->connector != &mxsfb->panel_connector)
> > > > > -		mxsfb->connector = NULL;
> > > > >  }
> > > > >  
> > > > >  static void mxsfb_pipe_update(struct drm_simple_display_pipe *pipe,
> > > > > @@ -190,6 +166,48 @@ static struct drm_simple_display_pipe_funcs mxsfb_funcs = {
> > > > >  	.disable_vblank	= mxsfb_pipe_disable_vblank,
> > > > >  };
> > > > >  
> > > > > +static int mxsfb_attach_bridge(struct mxsfb_drm_private *mxsfb)
> > > > > +{
> > > > > +	struct drm_device *drm = mxsfb->drm;
> > > > > +	struct drm_connector_list_iter iter;
> > > > > +	struct drm_panel *panel;
> > > > > +	struct drm_bridge *bridge;
> > > > > +	int ret;
> > > > > +
> > > > > +	ret = drm_of_find_panel_or_bridge(drm->dev->of_node, 0, 0, &panel,
> > > > > +					  &bridge);
> > > > > +	if (ret)
> > > > > +		return ret;
> > > > > +
> > > > > +	if (panel) {
> > > > > +		bridge = devm_drm_panel_bridge_add(drm->dev, panel);
> > > > 
> > > > Do we need a select DRM_PANEL_BRIDGE in Kconfig maybe? From what I can
> > > > tell there is no devm_drm_panel_bridge_add() stub if DRM_PANEL_BRIDGE is
> > > > not selected.
> > > 
> > > You're right, I'll add it.
> > > 
> > > > > +		if (IS_ERR(bridge))
> > > > > +			return PTR_ERR(bridge);
> > > > > +	}
> > > > > +
> > > > > +	if (!bridge)
> > > > > +		return -ENODEV;
> > > > > +
> > > > > +	ret = drm_simple_display_pipe_attach_bridge(&mxsfb->pipe, bridge);
> > > > > +	if (ret) {
> > > > > +		DRM_DEV_ERROR(drm->dev,
> > > > > +			      "failed to attach bridge: %d\n", ret);
> > > > > +		return ret;
> > > > > +	}
> > > > > +
> > > > > +	mxsfb->bridge = bridge;
> > > > > +
> > > > > +	/*
> > > > > +	 * Get hold of the connector. This is a bit of a hack, until the bridge
> > > > > +	 * API gives us bus flags and formats.
> > > > > +	 */
> > > > > +	drm_connector_list_iter_begin(drm, &iter);
> > > > > +	mxsfb->connector = drm_connector_list_iter_next(&iter);
> > > > > +	drm_connector_list_iter_end(&iter);
> > > > 
> > > > Could we not just use drm_panel_bridge_connector() here?
> > > 
> > > There's no guarantee that mxsfb->bridge is a panel bridge, the LCDIF
> > > output could be connected to another bridge in which case
> > > drm_of_find_panel_or_bridge() will set panel to NULL and bridge to a
> > > non-NULL value).
> > > 
> > > > > +
> > > > > +	return 0;
> > > > > +}
> > > > > +
> > > > >  static int mxsfb_load(struct drm_device *drm, unsigned long flags)
> > > > >  {
> > > > >  	struct platform_device *pdev = to_platform_device(drm->dev);
> > > > > @@ -201,6 +219,7 @@ static int mxsfb_load(struct drm_device *drm,
> > > > > unsigned long flags)
> > > > >  	if (!mxsfb)
> > > > >  		return -ENOMEM;
> > > > >  
> > > > > +	mxsfb->drm = drm;
> > > > >  	drm->dev_private = mxsfb;
> > > > >  	mxsfb->devdata = &mxsfb_devdata[pdev->id_entry->driver_data];
> > > > >  
> > > > > @@ -236,41 +255,17 @@ static int mxsfb_load(struct drm_device *drm,
> > > > > unsigned long flags)
> > > > >  	/* Modeset init */
> > > > >  	drm_mode_config_init(drm);
> > > > >  
> > > > > -	ret = mxsfb_create_output(drm);
> > > > > -	if (ret < 0) {
> > > > > -		dev_err(drm->dev, "Failed to create outputs\n");
> > > > > -		goto err_vblank;
> > > > > -	}
> > > > > -
> > > > >  	ret = drm_simple_display_pipe_init(drm, &mxsfb->pipe, &mxsfb_funcs,
> > > > > -			mxsfb_formats, ARRAY_SIZE(mxsfb_formats), NULL,
> > > > > -			mxsfb->connector);
> > > > > +			mxsfb_formats, ARRAY_SIZE(mxsfb_formats), NULL, NULL);
> > > > >  	if (ret < 0) {
> > > > >  		dev_err(drm->dev, "Cannot setup simple display pipe\n");
> > > > >  		goto err_vblank;
> > > > >  	}
> > > > >  
> > > > > -	/*
> > > > > -	 * Attach panel only if there is one.
> > > > > -	 * If there is no panel attach, it must be a bridge. In this case, we
> > > > > -	 * need a reference to its connector for a proper initialization.
> > > > > -	 * We will do this check in pipe->enable(), since the connector won't
> > > > > -	 * be attached to an encoder until then.
> > > > > -	 */
> > > > > -
> > > > > -	if (mxsfb->panel) {
> > > > > -		ret = drm_panel_attach(mxsfb->panel, mxsfb->connector);
> > > > > -		if (ret) {
> > > > > -			dev_err(drm->dev, "Cannot connect panel: %d\n", ret);
> > > > > -			goto err_vblank;
> > > > > -		}
> > > > > -	} else if (mxsfb->bridge) {
> > > > > -		ret = drm_simple_display_pipe_attach_bridge(&mxsfb->pipe,
> > > > > -							    mxsfb->bridge);
> > > > > -		if (ret) {
> > > > > -			dev_err(drm->dev, "Cannot connect bridge: %d\n", ret);
> > > > > -			goto err_vblank;
> > > > > -		}
> > > > > +	ret = mxsfb_attach_bridge(mxsfb);
> > > > > +	if (ret) {
> > > > > +		dev_err(drm->dev, "Cannot connect bridge: %d\n", ret);
> > > > > +		goto err_vblank;
> > > > >  	}
> > > > >  
> > > > >  	drm->mode_config.min_width	= MXSFB_MIN_XRES;
> > > > > @@ -288,7 +283,7 @@ static int mxsfb_load(struct drm_device *drm,
> > > > > unsigned long flags)
> > > > >  
> > > > >  	if (ret < 0) {
> > > > >  		dev_err(drm->dev, "Failed to install IRQ handler\n");
> > > > > -		goto err_irq;
> > > > > +		goto err_vblank;
> > > > >  	}
> > > > >  
> > > > >  	drm_kms_helper_poll_init(drm);
> > > > > @@ -299,8 +294,6 @@ static int mxsfb_load(struct drm_device *drm,
> > > > > unsigned long flags)
> > > > >  
> > > > >  	return 0;
> > > > >  
> > > > > -err_irq:
> > > > > -	drm_panel_detach(mxsfb->panel);
> > > > >  err_vblank:
> > > > >  	pm_runtime_disable(drm->dev);
> > > > >  
> > > > > diff --git a/drivers/gpu/drm/mxsfb/mxsfb_drv.h
> > > > > b/drivers/gpu/drm/mxsfb/mxsfb_drv.h
> > > > > index 0b65b5194a9c..0e3e5a63bbf9 100644
> > > > > --- a/drivers/gpu/drm/mxsfb/mxsfb_drv.h
> > > > > +++ b/drivers/gpu/drm/mxsfb/mxsfb_drv.h
> > > > > @@ -8,6 +8,8 @@
> > > > >  #ifndef __MXSFB_DRV_H__
> > > > >  #define __MXSFB_DRV_H__
> > > > >  
> > > > > +struct drm_device;
> > > > > +
> > > > >  struct mxsfb_devdata {
> > > > >  	unsigned int	 transfer_count;
> > > > >  	unsigned int	 cur_buf;
> > > > > @@ -26,10 +28,9 @@ struct mxsfb_drm_private {
> > > > >  	struct clk			*clk_axi;
> > > > >  	struct clk			*clk_disp_axi;
> > > > >  
> > > > > +	struct drm_device		*drm;
> > > > >  	struct drm_simple_display_pipe	pipe;
> > > > > -	struct drm_connector		panel_connector;
> > > > >  	struct drm_connector		*connector;
> > > > > -	struct drm_panel		*panel;
> > > > >  	struct drm_bridge		*bridge;
> > > > >  };
> > > > >  
> > > > > diff --git a/drivers/gpu/drm/mxsfb/mxsfb_out.c
> > > > > b/drivers/gpu/drm/mxsfb/mxsfb_out.c
> > > > > deleted file mode 100644
> > > > > index 9eca1605d11d..000000000000
> > > > > --- a/drivers/gpu/drm/mxsfb/mxsfb_out.c
> > > > > +++ /dev/null
> > > > > @@ -1,99 +0,0 @@
> > > > > -// SPDX-License-Identifier: GPL-2.0-or-later
> > > > > -/*
> > > > > - * Copyright (C) 2016 Marek Vasut <marex@denx.de>
> > > > > - */
> > > > > -
> > > > > -#include <linux/of_graph.h>
> > > > > -
> > > > > -#include <drm/drm_atomic.h>
> > > > > -#include <drm/drm_atomic_helper.h>
> > > > > -#include <drm/drm_crtc.h>
> > > > > -#include <drm/drm_fb_cma_helper.h>
> > > > > -#include <drm/drm_gem_cma_helper.h>
> > > > > -#include <drm/drm_of.h>
> > > > > -#include <drm/drm_panel.h>
> > > > > -#include <drm/drm_plane_helper.h>
> > > > > -#include <drm/drm_probe_helper.h>
> > > > > -#include <drm/drm_simple_kms_helper.h>
> > > > > -
> > > > > -#include "mxsfb_drv.h"
> > > > > -
> > > > > -static struct mxsfb_drm_private *
> > > > > -drm_connector_to_mxsfb_drm_private(struct drm_connector *connector)
> > > > > -{
> > > > > -	return container_of(connector, struct mxsfb_drm_private,
> > > > > -			    panel_connector);
> > > > > -}
> > > > > -
> > > > > -static int mxsfb_panel_get_modes(struct drm_connector *connector)
> > > > > -{
> > > > > -	struct mxsfb_drm_private *mxsfb =
> > > > > -			drm_connector_to_mxsfb_drm_private(connector);
> > > > > -
> > > > > -	if (mxsfb->panel)
> > > > > -		return drm_panel_get_modes(mxsfb->panel, connector);
> > > > > -
> > > > > -	return 0;
> > > > > -}
> > > > > -
> > > > > -static const struct
> > > > > -drm_connector_helper_funcs mxsfb_panel_connector_helper_funcs = {
> > > > > -	.get_modes = mxsfb_panel_get_modes,
> > > > > -};
> > > > > -
> > > > > -static enum drm_connector_status
> > > > > -mxsfb_panel_connector_detect(struct drm_connector *connector, bool force)
> > > > > -{
> > > > > -	struct mxsfb_drm_private *mxsfb =
> > > > > -			drm_connector_to_mxsfb_drm_private(connector);
> > > > > -
> > > > > -	if (mxsfb->panel)
> > > > > -		return connector_status_connected;
> > > > > -
> > > > > -	return connector_status_disconnected;
> > > > > -}
> > > > > -
> > > > > -static void mxsfb_panel_connector_destroy(struct drm_connector *connector)
> > > > > -{
> > > > > -	struct mxsfb_drm_private *mxsfb =
> > > > > -			drm_connector_to_mxsfb_drm_private(connector);
> > > > > -
> > > > > -	if (mxsfb->panel)
> > > > > -		drm_panel_detach(mxsfb->panel);
> > > > > -
> > > > > -	drm_connector_unregister(connector);
> > > > > -	drm_connector_cleanup(connector);
> > > > > -}
> > > > > -
> > > > > -static const struct drm_connector_funcs mxsfb_panel_connector_funcs = {
> > > > > -	.detect			= mxsfb_panel_connector_detect,
> > > > > -	.fill_modes		= drm_helper_probe_single_connector_modes,
> > > > > -	.destroy		= mxsfb_panel_connector_destroy,
> > > > > -	.reset			= drm_atomic_helper_connector_reset,
> > > > > -	.atomic_duplicate_state	= drm_atomic_helper_connector_duplicate_state,
> > > > > -	.atomic_destroy_state	= drm_atomic_helper_connector_destroy_state,
> > > > > -};
> > > > > -
> > > > > -int mxsfb_create_output(struct drm_device *drm)
> > > > > -{
> > > > > -	struct mxsfb_drm_private *mxsfb = drm->dev_private;
> > > > > -	int ret;
> > > > > -
> > > > > -	ret = drm_of_find_panel_or_bridge(drm->dev->of_node, 0, 0,
> > > > > -					  &mxsfb->panel, &mxsfb->bridge);
> > > > > -	if (ret)
> > > > > -		return ret;
> > > > > -
> > > > > -	if (mxsfb->panel) {
> > > > > -		mxsfb->connector = &mxsfb->panel_connector;
> > > > > -		mxsfb->connector->dpms = DRM_MODE_DPMS_OFF;
> > > > > -		mxsfb->connector->polled = 0;
> > > > > -		drm_connector_helper_add(mxsfb->connector,
> > > > > -					 &mxsfb_panel_connector_helper_funcs);
> > > > > -		ret = drm_connector_init(drm, mxsfb->connector,
> > > > > -					 &mxsfb_panel_connector_funcs,
> > > > > -					 DRM_MODE_CONNECTOR_Unknown);
> > > > > -	}
> > > > > -
> > > > > -	return ret;
> > > > > -}
> 
> -- 
> Regards,
> 
> Laurent Pinchart

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
