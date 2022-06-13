Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1738F5485A9
	for <lists+dri-devel@lfdr.de>; Mon, 13 Jun 2022 16:12:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5867210E5B0;
	Mon, 13 Jun 2022 14:12:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.tq-group.com (mx1.tq-group.com [93.104.207.81])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2E80610E5B0
 for <dri-devel@lists.freedesktop.org>; Mon, 13 Jun 2022 14:12:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
 t=1655129537; x=1686665537;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=G8oaHtVT5fO69k9f5G2n2ofselguLNoR3qjSZ+lx9Ls=;
 b=WnrauOo7FDcPygZ5wJgxz/iaJ6/urVxOLn3RcsAxhf+gab0xSy5zvEQd
 CDdjl294pQfxuoMjdoBgCYSIckSCRA3JDAN7Fl5gqiraku4gpxDee/q3e
 3Ee+bnLqHmNjg01Jme+dLuJx0+qBnZfjaxZgV1v5oDdWEoQoZDADd24cR
 Qh6P8Etyxuzpvfr1wYD5FeGeOJcnoPohCrQr7fVB7y9CAzW4dZYEaMoMw
 EEQreiTGHAXkdFP92PbLbMpL6MmnrJm4ByhsP2hEBWSFGodQZtBCmpj2u
 BU9FA9442WKMdPXWetd4/UfVbKkq8Al619zz/dQB8P/KwFVk0WcAj/Ia1 g==;
X-IronPort-AV: E=Sophos;i="5.91,297,1647298800"; d="scan'208";a="24421954"
Received: from unknown (HELO tq-pgp-pr1.tq-net.de) ([192.168.6.15])
 by mx1-pgp.tq-group.com with ESMTP; 13 Jun 2022 16:12:15 +0200
Received: from mx1.tq-group.com ([192.168.6.7])
 by tq-pgp-pr1.tq-net.de (PGP Universal service);
 Mon, 13 Jun 2022 16:12:15 +0200
X-PGP-Universal: processed;
 by tq-pgp-pr1.tq-net.de on Mon, 13 Jun 2022 16:12:15 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
 t=1655129535; x=1686665535;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=G8oaHtVT5fO69k9f5G2n2ofselguLNoR3qjSZ+lx9Ls=;
 b=SLeCIFnlwi+SnqWMrLtU+W6NLNRtnLpC3wKA72G6ydY4FCeX8czzAmuj
 NElmW3ku6pFlvEQV/juvdzMmDj14QRXlCPm8G1TREzD8Zk9ZKN7m6iKQJ
 RyJR4DY/TpoYoWs1L252Lx8CaPTcebkwaU2qcZnvblh/vl7DEDriGGffB
 9e6DpLLX2VWcSvT4hdnca9heUUj7aE2NPQE/EJFrd4eznNEkntCjcRWgE
 datTlkzKi8lCz41gSGirFu4aAiArUgFvRRMBN4kyhmYYHQXmUCJor2Q5X
 OF38+ii0kFkFrvDNnPPQM37FrOufHRO0knWyZ95xMZ98eyhp9jFykO1zh A==;
X-IronPort-AV: E=Sophos;i="5.91,297,1647298800"; d="scan'208";a="24421953"
Received: from vtuxmail01.tq-net.de ([10.115.0.20])
 by mx1.tq-group.com with ESMTP; 13 Jun 2022 16:12:14 +0200
Received: from steina-w.localnet (unknown [10.123.49.12])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 by vtuxmail01.tq-net.de (Postfix) with ESMTPSA id 8279D280056;
 Mon, 13 Jun 2022 16:12:14 +0200 (CEST)
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: Liu Ying <victor.liu@nxp.com>
Subject: Re: (EXT) Re: (EXT) [PATCH v8 09/14] drm/bridge: imx: Add LDB driver
 helper support
Date: Mon, 13 Jun 2022 16:12:14 +0200
Message-ID: <5832505.lOV4Wx5bFT@steina-w>
Organization: TQ-Systems GmbH
In-Reply-To: <9f86afed1282a5749f416b0e5b9a39a1f972017a.camel@nxp.com>
References: <20220609064931.3068601-1-victor.liu@nxp.com>
 <4748166.31r3eYUQgx@steina-w>
 <9f86afed1282a5749f416b0e5b9a39a1f972017a.camel@nxp.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
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
Cc: andrzej.hajda@intel.com, narmstrong@baylibre.com, airlied@linux.ie,
 dri-devel@lists.freedesktop.org, Laurent.pinchart@ideasonboard.com,
 krzysztof.kozlowski+dt@linaro.org, lee.jones@linaro.org,
 jernej.skrabec@gmail.com, marcel.ziswiler@toradex.com, linux-imx@nxp.com,
 linux-media@vger.kernel.org, devicetree@vger.kernel.org, kernel@pengutronix.de,
 jonas@kwiboo.se, s.hauer@pengutronix.de, robh+dt@kernel.org,
 mchehab@kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, robert.foss@linaro.org, shawnguo@kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

Am Freitag, 10. Juni 2022, 05:01:21 CEST schrieb Liu Ying:
> > reading this I got reminded of fsl-ldb [1], which is accepted
> > already. At a
> > first glance reading the RM the LDB peripheral are similar, although
> > not
> > identical. Is it worth merging them into one driver (at some point)?
> 
> fsl-ldb is for i.MX8mp LDB. It couples the lvds phy(LVDS_CTRL register)
> with LDB(LDB_CTRL register) hardly.
> 
> Eventually, I think there would be separate LDB bridge drivers for
> i.MX8mp/qxp/qm LDBs, as they are far or less different(LVDS PHY IPs,
> clocks, ways of dual link usage...). So, maybe, the question is that
> can fsl-ldb use this LDB helper driver. AFAICS, the different DT
> bindings between i.MX8mp LDB and i.MX8qxp/qm LDB make this difficult.
> This LDB helper takes each LDB child node(channel node) of i.MX8qxp/qm
> as a bridge, while i.MX8mp LDB bindings put input and output ports in
> 'ports' node.  Like i.MX8qxp/qm LDB, i.MX6 LDB
> binding(Documentation/devicetree/bindings/display/imx/ldb.txt) also
> uses 'channel' nodes, though i.MX6 LDB has a separate encoder driver.
> I think the 'channel' node better reflects HW design.
> So, maybe, fsl-ldb for i.MX8mp won't use this LDB helper.

Apparently the hardware is too different to share much common code. Yes, 
bindings seem very different as well, so maybe it's ot possible. Thanks for 
the explanation though.

Best regards,
Alexander

> Regards,
> Liu Ying
> 
> > Best regards,
> > Alexander
> > 
> > [1]
> > https://eur01.safelinks.protection.outlook.com/?url=https%3A%2F%2Fpatchwor
> > k.freedesktop.org%2Fpatch%2Fmsgid%2F20220426193645.244792-2-marex%40denx.d
> > e&amp;data=05%7C01%7Cvictor.liu%40nxp.com%7Ca4ee326b3f314cf48a3408da49ec5a
> > 33%7C686ea1d3bc2b4c6fa92cd99c5c301635%7C0%7C0%7C637903576722519563%7CUnkno
> > wn%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXV
> > CI6Mn0%3D%7C3000%7C%7C%7C&amp;sdata=yJhovCeB7Dx2eWJqKohZskA7fX3NLwqmW1GxeQ
> > lDe40%3D&amp;reserved=0> 
> > > Marcel, I add your T-b tag from v6, let me know if you want me to
> > > drop it,
> > > as the checkpatch fix in v7 and the rebase in v8 are trivial.
> > > 
> > > v7->v8:
> > > * Use devm_drm_of_get_bridge() due to the rebase upon v5.19-rc1.
> > > 
> > > v6->v7:
> > > * Fix below complaints from 'checkpatch.pl --strict'. (Robert)
> > > 
> > >    - 'Alignment should match open parenthesis'
> > >    - 'Prefer using the BIT macro'
> > > 
> > > * Add Marcel's T-b tag.
> > > * Add Robert's R-b tag.
> > > 
> > > v5->v6:
> > > * No change.
> > > 
> > > v4->v5:
> > > * Make imx-ldb-helper be a pure object to be linked with i.MX8qxp
> > > LDB bridge
> > > driver and i.MX8qm LDB bridge driver. (Robert)
> > > * Move 'imx_ldb_helper.h' to 'drivers/gpu/drm/bridge/imx/imx-ldb-
> > > helper.h'.
> > > 
> > >   (Robert)
> > > 
> > > * s/__FSL_IMX_LDB__/__IMX_LDB_HELPER__/  for 'imx-ldb-helper.h'.
> > > 
> > > v3->v4:
> > > * No change.
> > > 
> > > v2->v3:
> > > * Call syscon_node_to_regmap() to get regmap instead of
> > > 
> > >   syscon_regmap_lookup_by_phandle().
> > > 
> > > v1->v2:
> > > * No change.
> > > 
> > >  drivers/gpu/drm/bridge/imx/imx-ldb-helper.c | 220
> > > 
> > > ++++++++++++++++++++
> > > 
> > >  drivers/gpu/drm/bridge/imx/imx-ldb-helper.h |  96 +++++++++
> > >  2 files changed, 316 insertions(+)
> > >  create mode 100644 drivers/gpu/drm/bridge/imx/imx-ldb-helper.c
> > >  create mode 100644 drivers/gpu/drm/bridge/imx/imx-ldb-helper.h
> > > 
> > > diff --git a/drivers/gpu/drm/bridge/imx/imx-ldb-helper.c
> > > b/drivers/gpu/drm/bridge/imx/imx-ldb-helper.c new file mode 100644
> > > index 000000000000..e85eb9ab5947
> > > --- /dev/null
> > > +++ b/drivers/gpu/drm/bridge/imx/imx-ldb-helper.c
> > > @@ -0,0 +1,220 @@
> > > +// SPDX-License-Identifier: GPL-2.0+
> > > +/*
> > > + * Copyright (C) 2012 Sascha Hauer, Pengutronix
> > > + * Copyright 2019,2020,2022 NXP
> > > + */
> > > +
> > > +#include <linux/mfd/syscon.h>
> > > +#include <linux/of.h>
> > > +#include <linux/regmap.h>
> > > +
> > > +#include <drm/drm_bridge.h>
> > > +#include <drm/drm_of.h>
> > > +#include <drm/drm_print.h>
> > > +
> > > +#include "imx-ldb-helper.h"
> > > +
> > > +bool ldb_channel_is_single_link(struct ldb_channel *ldb_ch)
> > > +{
> > > +	return ldb_ch->link_type == LDB_CH_SINGLE_LINK;
> > > +}
> > > +
> > > +bool ldb_channel_is_split_link(struct ldb_channel *ldb_ch)
> > > +{
> > > +	return ldb_ch->link_type == LDB_CH_DUAL_LINK_EVEN_ODD_PIXELS ||
> > > +	       ldb_ch->link_type == LDB_CH_DUAL_LINK_ODD_EVEN_PIXELS;
> > > +}
> > > +
> > > +int ldb_bridge_atomic_check_helper(struct drm_bridge *bridge,
> > > +				   struct drm_bridge_state
> > 
> > *bridge_state,
> > 
> > > +				   struct drm_crtc_state
> > 
> > *crtc_state,
> > 
> > > +				   struct drm_connector_state
> > 
> > *conn_state)
> > 
> > > +{
> > > +	struct ldb_channel *ldb_ch = bridge->driver_private;
> > > +
> > > +	ldb_ch->in_bus_format = bridge_state->input_bus_cfg.format;
> > > +	ldb_ch->out_bus_format = bridge_state->output_bus_cfg.format;
> > > +
> > > +	return 0;
> > > +}
> > > +
> > > +void ldb_bridge_mode_set_helper(struct drm_bridge *bridge,
> > > +				const struct drm_display_mode
> > 
> > *mode,
> > 
> > > +				const struct drm_display_mode
> > 
> > *adjusted_mode)
> > 
> > > +{
> > > +	struct ldb_channel *ldb_ch = bridge->driver_private;
> > > +	struct ldb *ldb = ldb_ch->ldb;
> > > +	bool is_split = ldb_channel_is_split_link(ldb_ch);
> > > +
> > > +	if (is_split)
> > > +		ldb->ldb_ctrl |= LDB_SPLIT_MODE_EN;
> > > +
> > > +	switch (ldb_ch->out_bus_format) {
> > > +	case MEDIA_BUS_FMT_RGB666_1X7X3_SPWG:
> > > +		break;
> > > +	case MEDIA_BUS_FMT_RGB888_1X7X4_SPWG:
> > > +		if (ldb_ch->chno == 0 || is_split)
> > > +			ldb->ldb_ctrl |= LDB_DATA_WIDTH_CH0_24;
> > > +		if (ldb_ch->chno == 1 || is_split)
> > > +			ldb->ldb_ctrl |= LDB_DATA_WIDTH_CH1_24;
> > > +		break;
> > > +	case MEDIA_BUS_FMT_RGB888_1X7X4_JEIDA:
> > > +		if (ldb_ch->chno == 0 || is_split)
> > > +			ldb->ldb_ctrl |= LDB_DATA_WIDTH_CH0_24 |
> > > +					 LDB_BIT_MAP_CH0_JEIDA;
> > > +		if (ldb_ch->chno == 1 || is_split)
> > > +			ldb->ldb_ctrl |= LDB_DATA_WIDTH_CH1_24 |
> > > +					 LDB_BIT_MAP_CH1_JEIDA;
> > > +		break;
> > > +	}
> > > +}
> > > +
> > > +void ldb_bridge_enable_helper(struct drm_bridge *bridge)
> > > +{
> > > +	struct ldb_channel *ldb_ch = bridge->driver_private;
> > > +	struct ldb *ldb = ldb_ch->ldb;
> > > +
> > > +	/*
> > > +	 * Platform specific bridge drivers should set ldb_ctrl
> > > properly
> > > +	 * for the enablement, so just write the ctrl_reg here.
> > > +	 */
> > > +	regmap_write(ldb->regmap, ldb->ctrl_reg, ldb->ldb_ctrl);
> > > +}
> > > +
> > > +void ldb_bridge_disable_helper(struct drm_bridge *bridge)
> > > +{
> > > +	struct ldb_channel *ldb_ch = bridge->driver_private;
> > > +	struct ldb *ldb = ldb_ch->ldb;
> > > +	bool is_split = ldb_channel_is_split_link(ldb_ch);
> > > +
> > > +	if (ldb_ch->chno == 0 || is_split)
> > > +		ldb->ldb_ctrl &= ~LDB_CH0_MODE_EN_MASK;
> > > +	if (ldb_ch->chno == 1 || is_split)
> > > +		ldb->ldb_ctrl &= ~LDB_CH1_MODE_EN_MASK;
> > > +
> > > +	regmap_write(ldb->regmap, ldb->ctrl_reg, ldb->ldb_ctrl);
> > > +}
> > > +
> > > +int ldb_bridge_attach_helper(struct drm_bridge *bridge,
> > > +			     enum drm_bridge_attach_flags flags)
> > > +{
> > > +	struct ldb_channel *ldb_ch = bridge->driver_private;
> > > +	struct ldb *ldb = ldb_ch->ldb;
> > > +
> > > +	if (!(flags & DRM_BRIDGE_ATTACH_NO_CONNECTOR)) {
> > > +		DRM_DEV_ERROR(ldb->dev,
> > > +			      "do not support creating a
> > 
> > drm_connector\n");
> > 
> > > +		return -EINVAL;
> > > +	}
> > > +
> > > +	if (!bridge->encoder) {
> > > +		DRM_DEV_ERROR(ldb->dev, "missing encoder\n");
> > > +		return -ENODEV;
> > > +	}
> > > +
> > > +	return drm_bridge_attach(bridge->encoder,
> > > +				ldb_ch->next_bridge, bridge,
> > > +				DRM_BRIDGE_ATTACH_NO_CONNECTOR);
> > > +}
> > > +
> > > +int ldb_init_helper(struct ldb *ldb)
> > > +{
> > > +	struct device *dev = ldb->dev;
> > > +	struct device_node *np = dev->of_node;
> > > +	struct device_node *child;
> > > +	int ret;
> > > +	u32 i;
> > > +
> > > +	ldb->regmap = syscon_node_to_regmap(np->parent);
> > > +	if (IS_ERR(ldb->regmap)) {
> > > +		ret = PTR_ERR(ldb->regmap);
> > > +		if (ret != -EPROBE_DEFER)
> > 
> > > +			DRM_DEV_ERROR(dev, "failed to get regmap:
> > %d\n", ret);
> > 
> > > +		return ret;
> > > +	}
> > > +
> > > +	for_each_available_child_of_node(np, child) {
> > > +		struct ldb_channel *ldb_ch;
> > > +
> > > +		ret = of_property_read_u32(child, "reg", &i);
> > > +		if (ret || i > MAX_LDB_CHAN_NUM - 1) {
> > > +			ret = -EINVAL;
> > > +			DRM_DEV_ERROR(dev,
> > > +				      "invalid channel node
> > 
> > address: %u\n", i);
> > 
> > > +			of_node_put(child);
> > > +			return ret;
> > > +		}
> > > +
> > > +		ldb_ch = ldb->channel[i];
> > > +		ldb_ch->ldb = ldb;
> > > +		ldb_ch->chno = i;
> > > +		ldb_ch->is_available = true;
> > > +		ldb_ch->np = child;
> > > +
> > > +		ldb->available_ch_cnt++;
> > > +	}
> > > +
> > > +	return 0;
> > > +}
> > > +
> > > +int ldb_find_next_bridge_helper(struct ldb *ldb)
> > > +{
> > > +	struct device *dev = ldb->dev;
> > > +	struct ldb_channel *ldb_ch;
> > > +	int ret, i;
> > > +
> > > +	for (i = 0; i < MAX_LDB_CHAN_NUM; i++) {
> > > +		ldb_ch = ldb->channel[i];
> > > +
> > > +		if (!ldb_ch->is_available)
> > > +			continue;
> > > +
> > > +		ldb_ch->next_bridge = devm_drm_of_get_bridge(dev,
> > 
> > ldb_ch->np,
> > 
> > > +
> > 
> > 1, 0);
> > 
> > > +		if (IS_ERR(ldb_ch->next_bridge)) {
> > > +			ret = PTR_ERR(ldb_ch->next_bridge);
> > > +			if (ret != -EPROBE_DEFER)
> > > +				DRM_DEV_ERROR(dev,
> > > +					      "failed to get
> > 
> > next bridge: %d\n",
> > 
> > > +					      ret);
> > > +			return ret;
> > > +		}
> > > +	}
> > > +
> > > +	return 0;
> > > +}
> > > +
> > > +void ldb_add_bridge_helper(struct ldb *ldb,
> > > +			   const struct drm_bridge_funcs
> > 
> > *bridge_funcs)
> > 
> > > +{
> > > +	struct ldb_channel *ldb_ch;
> > > +	int i;
> > > +
> > > +	for (i = 0; i < MAX_LDB_CHAN_NUM; i++) {
> > > +		ldb_ch = ldb->channel[i];
> > > +
> > > +		if (!ldb_ch->is_available)
> > > +			continue;
> > > +
> > > +		ldb_ch->bridge.driver_private = ldb_ch;
> > > +		ldb_ch->bridge.funcs = bridge_funcs;
> > > +		ldb_ch->bridge.of_node = ldb_ch->np;
> > > +
> > > +		drm_bridge_add(&ldb_ch->bridge);
> > > +	}
> > > +}
> > > +
> > > +void ldb_remove_bridge_helper(struct ldb *ldb)
> > > +{
> > > +	struct ldb_channel *ldb_ch;
> > > +	int i;
> > > +
> > > +	for (i = 0; i < MAX_LDB_CHAN_NUM; i++) {
> > > +		ldb_ch = ldb->channel[i];
> > > +
> > > +		if (!ldb_ch->is_available)
> > > +			continue;
> > > +
> > > +		drm_bridge_remove(&ldb_ch->bridge);
> > > +	}
> > > +}
> > > diff --git a/drivers/gpu/drm/bridge/imx/imx-ldb-helper.h
> > > b/drivers/gpu/drm/bridge/imx/imx-ldb-helper.h new file mode 100644
> > > index 000000000000..a0a5cde27fbc
> > > --- /dev/null
> > > +++ b/drivers/gpu/drm/bridge/imx/imx-ldb-helper.h
> > > @@ -0,0 +1,96 @@
> > > +/* SPDX-License-Identifier: GPL-2.0+ */
> > > +
> > > +/*
> > > + * Copyright 2019,2020,2022 NXP
> > > + */
> > > +
> > > +#ifndef __IMX_LDB_HELPER__
> > > +#define __IMX_LDB_HELPER__
> > > +
> > > +#include <linux/device.h>
> > > +#include <linux/kernel.h>
> > > +#include <linux/of.h>
> > > +#include <linux/regmap.h>
> > > +
> > > +#include <drm/drm_atomic.h>
> > > +#include <drm/drm_bridge.h>
> > > +#include <drm/drm_device.h>
> > > +#include <drm/drm_encoder.h>
> > > +#include <drm/drm_modeset_helper_vtables.h>
> > > +
> > > +#define LDB_CH0_MODE_EN_TO_DI0		BIT(0)
> > > +#define LDB_CH0_MODE_EN_TO_DI1		(3 << 0)
> > > +#define LDB_CH0_MODE_EN_MASK		(3 << 0)
> > > +#define LDB_CH1_MODE_EN_TO_DI0		BIT(2)
> > > +#define LDB_CH1_MODE_EN_TO_DI1		(3 << 2)
> > > +#define LDB_CH1_MODE_EN_MASK		(3 << 2)
> > > +#define LDB_SPLIT_MODE_EN		BIT(4)
> > > +#define LDB_DATA_WIDTH_CH0_24		BIT(5)
> > > +#define LDB_BIT_MAP_CH0_JEIDA		BIT(6)
> > > +#define LDB_DATA_WIDTH_CH1_24		BIT(7)
> > > +#define LDB_BIT_MAP_CH1_JEIDA		BIT(8)
> > > +#define LDB_DI0_VS_POL_ACT_LOW		BIT(9)
> > > +#define LDB_DI1_VS_POL_ACT_LOW		BIT(10)
> > > +
> > > +#define MAX_LDB_CHAN_NUM		2
> > > +
> > > +enum ldb_channel_link_type {
> > > +	LDB_CH_SINGLE_LINK,
> > > +	LDB_CH_DUAL_LINK_EVEN_ODD_PIXELS,
> > > +	LDB_CH_DUAL_LINK_ODD_EVEN_PIXELS,
> > > +};
> > > +
> > > +struct ldb;
> > > +
> > > +struct ldb_channel {
> > > +	struct ldb *ldb;
> > > +	struct drm_bridge bridge;
> > > +	struct drm_bridge *next_bridge;
> > > +	struct device_node *np;
> > > +	u32 chno;
> > > +	bool is_available;
> > > +	u32 in_bus_format;
> > > +	u32 out_bus_format;
> > > +	enum ldb_channel_link_type link_type;
> > > +};
> > > +
> > > +struct ldb {
> > > +	struct regmap *regmap;
> > > +	struct device *dev;
> > > +	struct ldb_channel *channel[MAX_LDB_CHAN_NUM];
> > > +	unsigned int ctrl_reg;
> > > +	u32 ldb_ctrl;
> > > +	unsigned int available_ch_cnt;
> > > +};
> > > +
> > > +#define bridge_to_ldb_ch(b)	container_of(b, struct
> > > ldb_channel, bridge)
> > > +
> > > +bool ldb_channel_is_single_link(struct ldb_channel *ldb_ch);
> > > +bool ldb_channel_is_split_link(struct ldb_channel *ldb_ch);
> > > +
> > > +int ldb_bridge_atomic_check_helper(struct drm_bridge *bridge,
> > > +				   struct drm_bridge_state
> > 
> > *bridge_state,
> > 
> > > +				   struct drm_crtc_state
> > 
> > *crtc_state,
> > 
> > > +				   struct drm_connector_state
> > 
> > *conn_state);
> > 
> > > +
> > > +void ldb_bridge_mode_set_helper(struct drm_bridge *bridge,
> > > +				const struct drm_display_mode
> > 
> > *mode,
> > 
> > > +				const struct drm_display_mode
> > 
> > *adjusted_mode);
> > 
> > > +
> > > +void ldb_bridge_enable_helper(struct drm_bridge *bridge);
> > > +
> > > +void ldb_bridge_disable_helper(struct drm_bridge *bridge);
> > > +
> > > +int ldb_bridge_attach_helper(struct drm_bridge *bridge,
> > > +			     enum drm_bridge_attach_flags flags);
> > > +
> > > +int ldb_init_helper(struct ldb *ldb);
> > > +
> > > +int ldb_find_next_bridge_helper(struct ldb *ldb);
> > > +
> > > +void ldb_add_bridge_helper(struct ldb *ldb,
> > > +			   const struct drm_bridge_funcs
> > 
> > *bridge_funcs);
> > 
> > > +
> > > +void ldb_remove_bridge_helper(struct ldb *ldb);
> > > +
> > > +#endif /* __IMX_LDB_HELPER__ */




