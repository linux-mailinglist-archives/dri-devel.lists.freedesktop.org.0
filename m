Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 261FF2E0283
	for <lists+dri-devel@lfdr.de>; Mon, 21 Dec 2020 23:30:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 714FF891E1;
	Mon, 21 Dec 2020 22:30:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-f181.google.com (mail-oi1-f181.google.com
 [209.85.167.181])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 93ACE891E1
 for <dri-devel@lists.freedesktop.org>; Mon, 21 Dec 2020 22:30:01 +0000 (UTC)
Received: by mail-oi1-f181.google.com with SMTP id l200so12814935oig.9
 for <dri-devel@lists.freedesktop.org>; Mon, 21 Dec 2020 14:30:01 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=sisPDAs9i+2uMX2z7wDDD4p5KFYrHxtdzjTUQaGvK4Y=;
 b=DRZHpRgPLho4uGXtMMNleNLAgafR/0JcAAkIc4sDdG6okCJt+E3VN0u2j0ZNE/JYth
 iTohzHMdwagxrY4TdY6PUSR6uOlmRLCmuL0SAVrPMfnkqTX0grZrsA/7ocK1jEuxmWL3
 lJiQzjE23X4aNuWpcMXFNY6cF5rlLFp2GQDlpz64lO76bo0Rln06YYGxdWzQArUkLtq5
 Ly8YUOCkqh7+6ZrDled4VeXYgA5SUjxYGZuIdEi9hB7A4iwUaHe4AHcDgKP2x1IkT5w+
 DtAr7qJox4ARqPrkIk4Y+t0xFbKmK6AdA2iZBVDD/pDT+wkJ3dZgvMRzAhNuXr+SSo+g
 HzFw==
X-Gm-Message-State: AOAM530vIP52oRubkIKxD0rqP0DH10vV2HLpUT1yLFt7nL7l+vhfvlRg
 tCkPQkK+lzAFeLzsYiuhiA==
X-Google-Smtp-Source: ABdhPJxjLw2QGOVawHNevZU/xGhb5ustZhRIXB3BEerBKxzlV1lf8sqU/vPE+py1Q1soeVfWVpic4Q==
X-Received: by 2002:aca:ec43:: with SMTP id k64mr12714690oih.43.1608589800845; 
 Mon, 21 Dec 2020 14:30:00 -0800 (PST)
Received: from robh.at.kernel.org ([64.188.179.253])
 by smtp.gmail.com with ESMTPSA id p18sm3914243ood.48.2020.12.21.14.29.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 21 Dec 2020 14:29:59 -0800 (PST)
Received: (nullmailer pid 687179 invoked by uid 1000);
 Mon, 21 Dec 2020 22:29:55 -0000
Date: Mon, 21 Dec 2020 15:29:55 -0700
From: Rob Herring <robh@kernel.org>
To: Liu Ying <victor.liu@nxp.com>
Subject: Re: [PATCH 07/14] drm/bridge: imx: Add i.MX8qm/qxp display pixel
 link support
Message-ID: <20201221222955.GA652934@robh.at.kernel.org>
References: <1608199173-28760-1-git-send-email-victor.liu@nxp.com>
 <1608199173-28760-8-git-send-email-victor.liu@nxp.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1608199173-28760-8-git-send-email-victor.liu@nxp.com>
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
Cc: devicetree@vger.kernel.org, jernej.skrabec@siol.net,
 Laurent.pinchart@ideasonboard.com, kernel@pengutronix.de,
 narmstrong@baylibre.com, airlied@linux.ie, s.hauer@pengutronix.de,
 jonas@kwiboo.se, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 kishon@ti.com, a.hajda@samsung.com, vkoul@kernel.org, linux-imx@nxp.com,
 mchehab@kernel.org, shawnguo@kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-media@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Dec 17, 2020 at 05:59:26PM +0800, Liu Ying wrote:
> This patch adds a drm bridge driver for i.MX8qm/qxp display pixel link.
> The pixel link forms a standard asynchronous linkage between
> pixel sources(display controller or camera module) and pixel
> consumers(imaging or displays).  It consists of two distinct
> functions, a pixel transfer function and a control interface.
> 
> Signed-off-by: Liu Ying <victor.liu@nxp.com>
> ---
>  drivers/gpu/drm/bridge/imx/Kconfig              |   8 +
>  drivers/gpu/drm/bridge/imx/Makefile             |   1 +
>  drivers/gpu/drm/bridge/imx/imx8qxp-pixel-link.c | 411 ++++++++++++++++++++++++
>  3 files changed, 420 insertions(+)
>  create mode 100644 drivers/gpu/drm/bridge/imx/imx8qxp-pixel-link.c
> 
> diff --git a/drivers/gpu/drm/bridge/imx/Kconfig b/drivers/gpu/drm/bridge/imx/Kconfig
> index f1c91b6..4d1f027 100644
> --- a/drivers/gpu/drm/bridge/imx/Kconfig
> +++ b/drivers/gpu/drm/bridge/imx/Kconfig
> @@ -6,3 +6,11 @@ config DRM_IMX8QXP_PIXEL_COMBINER
>  	help
>  	  Choose this to enable pixel combiner found in
>  	  Freescale i.MX8qm/qxp processors.
> +
> +config DRM_IMX8QXP_PIXEL_LINK
> +	tristate "Freescale i.MX8QM/QXP display pixel link"
> +	depends on OF
> +	select DRM_KMS_HELPER
> +	help
> +	  Choose this to enable display pixel link found in
> +	  Freescale i.MX8qm/qxp processors.
> diff --git a/drivers/gpu/drm/bridge/imx/Makefile b/drivers/gpu/drm/bridge/imx/Makefile
> index 7d7c8d6..c15469f 100644
> --- a/drivers/gpu/drm/bridge/imx/Makefile
> +++ b/drivers/gpu/drm/bridge/imx/Makefile
> @@ -1 +1,2 @@
>  obj-$(CONFIG_DRM_IMX8QXP_PIXEL_COMBINER) += imx8qxp-pixel-combiner.o
> +obj-$(CONFIG_DRM_IMX8QXP_PIXEL_LINK) += imx8qxp-pixel-link.o
> diff --git a/drivers/gpu/drm/bridge/imx/imx8qxp-pixel-link.c b/drivers/gpu/drm/bridge/imx/imx8qxp-pixel-link.c
> new file mode 100644
> index 00000000..1af7467
> --- /dev/null
> +++ b/drivers/gpu/drm/bridge/imx/imx8qxp-pixel-link.c
> @@ -0,0 +1,411 @@
> +// SPDX-License-Identifier: GPL-2.0+
> +
> +/*
> + * Copyright 2020 NXP
> + */
> +
> +#include <linux/firmware/imx/svc/misc.h>
> +#include <linux/module.h>
> +#include <linux/of.h>
> +#include <linux/of_graph.h>
> +#include <linux/platform_device.h>
> +
> +#include <drm/drm_atomic_state_helper.h>
> +#include <drm/drm_bridge.h>
> +#include <drm/drm_print.h>
> +
> +#include <dt-bindings/firmware/imx/rsrc.h>
> +
> +#define DRIVER_NAME		"imx8qxp-display-pixel-link"
> +#define PL_MAX_MST_ADDR		3
> +
> +struct imx8qxp_pixel_link {
> +	struct drm_bridge bridge;
> +	struct drm_bridge *next_bridge;
> +	struct device *dev;
> +	struct imx_sc_ipc *ipc_handle;
> +	int id;
> +	int stream_id;
> +	int dc_id;
> +	u32 sink_rsc;
> +	u32 mst_addr;
> +	u8 mst_addr_ctrl;
> +	u8 mst_en_ctrl;
> +	u8 mst_vld_ctrl;
> +	u8 sync_ctrl;
> +};
> +
> +#define DEFINE_IMX8QXP_PIXEL_LINK_ENABLE_CTRL(name)			\
> +static void								\
> +imx8qxp_pixel_link_enable_##name(struct imx8qxp_pixel_link *pl)		\
> +{									\
> +	int ret = imx_sc_misc_set_control(pl->ipc_handle, pl->sink_rsc,	\
> +					  pl->name##_ctrl, true);	\
> +	if (ret)							\
> +		DRM_DEV_ERROR(pl->dev,					\
> +			"failed to enable DC%d stream%d pixel link "	\
> +			#name ": %d\n",	pl->dc_id, pl->stream_id, ret);	\
> +}
> +
> +DEFINE_IMX8QXP_PIXEL_LINK_ENABLE_CTRL(mst_en)
> +DEFINE_IMX8QXP_PIXEL_LINK_ENABLE_CTRL(mst_vld)
> +DEFINE_IMX8QXP_PIXEL_LINK_ENABLE_CTRL(sync)
> +
> +#define DEFINE_IMX8QXP_PIXEL_LINK_DISABLE_CTRL(name)			\
> +static int								\
> +imx8qxp_pixel_link_disable_##name(struct imx8qxp_pixel_link *pl)	\
> +{									\
> +	int ret = imx_sc_misc_set_control(pl->ipc_handle, pl->sink_rsc,	\
> +					  pl->name##_ctrl, false);	\
> +	if (ret)							\
> +		DRM_DEV_ERROR(pl->dev,					\
> +			"failed to disable DC%d stream%d pixel link "	\
> +			#name ": %d\n",	pl->dc_id, pl->stream_id, ret);	\
> +									\
> +	return ret;							\
> +}
> +
> +DEFINE_IMX8QXP_PIXEL_LINK_DISABLE_CTRL(mst_en)
> +DEFINE_IMX8QXP_PIXEL_LINK_DISABLE_CTRL(mst_vld)
> +DEFINE_IMX8QXP_PIXEL_LINK_DISABLE_CTRL(sync)
> +
> +static void imx8qxp_pixel_link_set_mst_addr(struct imx8qxp_pixel_link *pl)
> +{
> +	int ret;
> +
> +	ret = imx_sc_misc_set_control(pl->ipc_handle,
> +				      pl->sink_rsc, pl->mst_addr_ctrl,
> +				      pl->mst_addr);
> +	if (ret)
> +		DRM_DEV_ERROR(pl->dev,
> +		    "failed to set DC%d stream%d pixel link mst addr(%u): %d\n",
> +		    pl->dc_id, pl->stream_id, pl->mst_addr, ret);
> +}
> +
> +static int imx8qxp_pixel_link_bridge_attach(struct drm_bridge *bridge,
> +					    enum drm_bridge_attach_flags flags)
> +{
> +	struct imx8qxp_pixel_link *pl = bridge->driver_private;
> +
> +	if (!(flags & DRM_BRIDGE_ATTACH_NO_CONNECTOR)) {
> +		DRM_DEV_ERROR(pl->dev,
> +			      "do not support creating a drm_connector\n");
> +		return -EINVAL;
> +	}
> +
> +	if (!bridge->encoder) {
> +		DRM_DEV_ERROR(pl->dev, "missing encoder\n");
> +		return -ENODEV;
> +	}
> +
> +	return drm_bridge_attach(bridge->encoder,
> +				 pl->next_bridge, bridge,
> +				 DRM_BRIDGE_ATTACH_NO_CONNECTOR);
> +}
> +
> +static void
> +imx8qxp_pixel_link_bridge_mode_set(struct drm_bridge *bridge,
> +				   const struct drm_display_mode *mode,
> +				   const struct drm_display_mode *adjusted_mode)
> +{
> +	struct imx8qxp_pixel_link *pl = bridge->driver_private;
> +
> +	imx8qxp_pixel_link_set_mst_addr(pl);
> +}
> +
> +static void imx8qxp_pixel_link_bridge_atomic_enable(struct drm_bridge *bridge,
> +			      struct drm_bridge_state *old_bridge_state)
> +{
> +	struct imx8qxp_pixel_link *pl = bridge->driver_private;
> +
> +	imx8qxp_pixel_link_enable_mst_en(pl);
> +	imx8qxp_pixel_link_enable_mst_vld(pl);
> +	imx8qxp_pixel_link_enable_sync(pl);
> +}
> +
> +static void imx8qxp_pixel_link_bridge_atomic_disable(struct drm_bridge *bridge,
> +				struct drm_bridge_state *old_bridge_state)
> +{
> +	struct imx8qxp_pixel_link *pl = bridge->driver_private;
> +
> +	imx8qxp_pixel_link_disable_mst_en(pl);
> +	imx8qxp_pixel_link_disable_mst_vld(pl);
> +	imx8qxp_pixel_link_disable_sync(pl);
> +}
> +
> +static const u32 imx8qxp_pixel_link_bus_output_fmts[] = {
> +	MEDIA_BUS_FMT_RGB888_1X36_CPADLO,
> +	MEDIA_BUS_FMT_RGB666_1X36_CPADLO,
> +};
> +
> +static bool imx8qxp_pixel_link_bus_output_fmt_supported(u32 fmt)
> +{
> +	int i;
> +
> +	for (i = 0; i < ARRAY_SIZE(imx8qxp_pixel_link_bus_output_fmts); i++) {
> +		if (imx8qxp_pixel_link_bus_output_fmts[i] == fmt)
> +			return true;
> +	}
> +
> +	return false;
> +}
> +
> +static u32 *
> +imx8qxp_pixel_link_bridge_atomic_get_input_bus_fmts(struct drm_bridge *bridge,
> +					struct drm_bridge_state *bridge_state,
> +					struct drm_crtc_state *crtc_state,
> +					struct drm_connector_state *conn_state,
> +					u32 output_fmt,
> +					unsigned int *num_input_fmts)
> +{
> +	u32 *input_fmts;
> +
> +	if (!imx8qxp_pixel_link_bus_output_fmt_supported(output_fmt))
> +		return NULL;
> +
> +	*num_input_fmts = 1;
> +
> +	input_fmts = kmalloc(sizeof(*input_fmts), GFP_KERNEL);
> +	if (!input_fmts)
> +		return NULL;
> +
> +	input_fmts[0] = output_fmt;
> +
> +	return input_fmts;
> +}
> +
> +static u32 *
> +imx8qxp_pixel_link_bridge_atomic_get_output_bus_fmts(struct drm_bridge *bridge,
> +					struct drm_bridge_state *bridge_state,
> +					struct drm_crtc_state *crtc_state,
> +					struct drm_connector_state *conn_state,
> +					unsigned int *num_output_fmts)
> +{
> +	*num_output_fmts = ARRAY_SIZE(imx8qxp_pixel_link_bus_output_fmts);
> +	return kmemdup(imx8qxp_pixel_link_bus_output_fmts,
> +			sizeof(imx8qxp_pixel_link_bus_output_fmts), GFP_KERNEL);
> +}
> +
> +static const struct drm_bridge_funcs imx8qxp_pixel_link_bridge_funcs = {
> +	.atomic_duplicate_state	= drm_atomic_helper_bridge_duplicate_state,
> +	.atomic_destroy_state	= drm_atomic_helper_bridge_destroy_state,
> +	.atomic_reset		= drm_atomic_helper_bridge_reset,
> +	.attach			= imx8qxp_pixel_link_bridge_attach,
> +	.mode_set		= imx8qxp_pixel_link_bridge_mode_set,
> +	.atomic_enable		= imx8qxp_pixel_link_bridge_atomic_enable,
> +	.atomic_disable		= imx8qxp_pixel_link_bridge_atomic_disable,
> +	.atomic_get_input_bus_fmts =
> +			imx8qxp_pixel_link_bridge_atomic_get_input_bus_fmts,
> +	.atomic_get_output_bus_fmts =
> +			imx8qxp_pixel_link_bridge_atomic_get_output_bus_fmts,
> +};
> +
> +static struct drm_bridge *
> +imx8qxp_pixel_link_find_next_bridge(struct imx8qxp_pixel_link *pl)
> +{
> +	struct device_node *np = pl->dev->of_node;
> +	struct device_node *port, *ep, *remote;
> +	struct of_endpoint endpoint;
> +	struct drm_bridge *next_bridge[2], *err_bridge;
> +	u32 port_id, vld_port_id;
> +	int port_cnt = 0, ep_cnt = 0;
> +	int bridge_sel = 0;	/* select the first next bridge by default */
> +	int ret;
> +
> +	for (port_id = 1; port_id <= PL_MAX_MST_ADDR + 1; port_id++) {
> +		port = of_graph_get_port_by_id(np, port_id);
> +		if (!port)
> +			continue;
> +
> +		if (of_device_is_available(port)) {
> +			port_cnt++;
> +			vld_port_id = port_id;
> +		}
> +
> +		of_node_put(port);
> +	}
> +
> +	/* check the number of available output ports */
> +	if (port_cnt == 0) {
> +		DRM_DEV_ERROR(pl->dev, "no available output port\n");
> +		return ERR_PTR(-ENODEV);
> +	} else if (port_cnt > 1) {
> +		DRM_DEV_ERROR(pl->dev, "invalid available output ports: %d\n",
> +								port_cnt);
> +		return ERR_PTR(-ENOTSUPP);
> +	}
> +
> +	port = of_graph_get_port_by_id(np, vld_port_id);
> +	if (!port) {
> +		DRM_DEV_ERROR(pl->dev, "failed to get output port\n");
> +		return ERR_PTR(-ENODEV);
> +	}
> +
> +	for_each_available_child_of_node(port, ep) {

for_each_endpoint_of_node

> +		/* 2 available endpoints at most */
> +		if (++ep_cnt > 2) {
> +			DRM_DEV_ERROR(pl->dev,
> +				      "invalid available endpoints: %d\n",
> +									ep_cnt);

Not really the kernel's job to validate the DT. Just get endpoints 0 and 
1 if those are the 2 you want.

> +			err_bridge = ERR_PTR(-ENOTSUPP);
> +			of_node_put(ep);
> +			goto err;
> +		}
> +
> +		ret = of_graph_parse_endpoint(ep, &endpoint);
> +		if (ret) {
> +			DRM_DEV_ERROR(pl->dev, "failed to parse endpoint: %d\n",
> +									ret);
> +			err_bridge = ERR_PTR(ret);
> +			of_node_put(ep);
> +			goto err;
> +		}
> +
> +		remote = of_graph_get_remote_port_parent(ep);
> +		if (!remote || !of_device_is_available(remote)) {
> +			DRM_DEV_ERROR(pl->dev,
> +				      "endpoint%u has no available remote\n",
> +								endpoint.id);
> +			of_node_put(remote);
> +			of_node_put(ep);
> +			err_bridge = ERR_PTR(-ENODEV);
> +			goto err;
> +		} else if (!of_device_is_available(remote->parent)) {
> +			DRM_DEV_ERROR(pl->dev,
> +				"endpoint%u remote parent is not available\n",
> +								endpoint.id);
> +			of_node_put(remote);
> +			of_node_put(ep);
> +			err_bridge = ERR_PTR(-ENODEV);
> +			goto err;
> +		}

Rewrite all this in terms of of_graph_get_remote_node(). It takes care 
of of_device_is_available checking for you.

> +
> +		next_bridge[ep_cnt - 1] = of_drm_find_bridge(remote);
> +		if (!next_bridge[ep_cnt - 1]) {
> +			of_node_put(remote);
> +			of_node_put(ep);
> +			err_bridge = ERR_PTR(-EPROBE_DEFER);
> +			goto err;
> +		}
> +
> +		/* specially select the next bridge with companion PXL2DPI */
> +		if (of_find_property(remote, "fsl,companion-pxl2dpi", NULL))
> +			bridge_sel = ep_cnt - 1;
> +
> +		of_node_put(remote);
> +	}
> +
> +	pl->mst_addr = vld_port_id - 1;
> +
> +	of_node_put(port);
> +
> +	return next_bridge[bridge_sel];
> +err:
> +	of_node_put(port);
> +
> +	return err_bridge;
> +}
> +
> +static int imx8qxp_pixel_link_bridge_probe(struct platform_device *pdev)
> +{
> +	struct imx8qxp_pixel_link *pl;
> +	struct device *dev = &pdev->dev;
> +	struct device_node *np = dev->of_node;
> +	int ret;
> +
> +	pl = devm_kzalloc(dev, sizeof(*pl), GFP_KERNEL);
> +	if (!pl)
> +		return -ENOMEM;
> +
> +	ret = imx_scu_get_handle(&pl->ipc_handle);
> +	if (ret) {
> +		if (ret != -EPROBE_DEFER)
> +			DRM_DEV_ERROR(dev, "failed to get SCU ipc handle: %d\n",
> +									ret);
> +		return ret;
> +	}
> +
> +	pl->id = of_alias_get_id(np, "dc_pl");

What's this needed for? I doubt aliases is the right thing to use here.

Rob
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
