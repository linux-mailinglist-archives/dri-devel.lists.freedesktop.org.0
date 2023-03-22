Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 779FC6C48D6
	for <lists+dri-devel@lfdr.de>; Wed, 22 Mar 2023 12:16:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CF24310E91A;
	Wed, 22 Mar 2023 11:16:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1EE9510E92E
 for <dri-devel@lists.freedesktop.org>; Wed, 22 Mar 2023 11:16:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1679483764; x=1711019764;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=wzqzOip5nRM30jduumeE01e2CiTZUbRO+8j67GEvMOk=;
 b=ZIDeKiST62orRWLumb70an3moZniST+m+Y73RfVUGUctFTU5y4aNx8jb
 oXYlc3Hlw2XIPM/unD6SZq5ap2A593sz2RjldScR34T/kFmpArIJb3ruL
 RLotOt2qMTd0LCIE8hDagkmkagzd5b7S8PrjlfQ9KS96AgNYNlu3qvB8Y
 ZjE8ZFs11JYT8XUrePy3nJSUI2NnRwNNxPoSL/4FRtQqZshcs3n9Dxj3O
 t/Ze9lAlg2SH/CZJIbTU92TBW+FDBflcfSa9N74jlMonJ0pb458Ym4Zb8
 6+3C2M4MjrqsbZfSrwW8aCYplZ3HtPEpoQe+TLfFo9FnCx+Im2CEA3Wdu g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10656"; a="337908542"
X-IronPort-AV: E=Sophos;i="5.98,281,1673942400"; d="scan'208";a="337908542"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Mar 2023 04:16:03 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10656"; a="675226677"
X-IronPort-AV: E=Sophos;i="5.98,281,1673942400"; d="scan'208";a="675226677"
Received: from smile.fi.intel.com ([10.237.72.54])
 by orsmga007.jf.intel.com with ESMTP; 22 Mar 2023 04:15:54 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.96)
 (envelope-from <andriy.shevchenko@linux.intel.com>)
 id 1pewRa-007752-29; Wed, 22 Mar 2023 13:15:50 +0200
Date: Wed, 22 Mar 2023 13:15:50 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Pin-yen Lin <treapking@chromium.org>
Subject: Re: [PATCH v14 07/10] drm/bridge: anx7625: Register Type C mode
 switches
Message-ID: <ZBrjZj0VL20y1MUC@smile.fi.intel.com>
References: <20230322104639.221402-1-treapking@chromium.org>
 <20230322104639.221402-8-treapking@chromium.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230322104639.221402-8-treapking@chromium.org>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
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
Cc: Heikki Krogerus <heikki.krogerus@linux.intel.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 "Rafael J . Wysocki" <rafael@kernel.org>, dri-devel@lists.freedesktop.org,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Guenter Roeck <groeck@chromium.org>, Marek Vasut <marex@denx.de>,
 chrome-platform@lists.linux.dev, Robert Foss <rfoss@kernel.org>,
 Javier Martinez Canillas <javierm@redhat.com>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, linux-acpi@vger.kernel.org,
 devicetree@vger.kernel.org, Sakari Ailus <sakari.ailus@linux.intel.com>,
 =?iso-8859-1?Q?N=EDcolas_F_=2E_R_=2E_A_=2E?= Prado <nfraprado@collabora.com>,
 Jonas Karlman <jonas@kwiboo.se>, Allen Chen <allen.chen@ite.com.tw>,
 Stephen Boyd <swboyd@chromium.org>, Rob Herring <robh+dt@kernel.org>,
 Hsin-Yi Wang <hsinyi@chromium.org>, Xin Ji <xji@analogixsemi.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-kernel@vger.kernel.org,
 Daniel Scally <djrscally@gmail.com>, Prashant Malani <pmalani@chromium.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Mar 22, 2023 at 06:46:36PM +0800, Pin-yen Lin wrote:
> Register USB Type-C mode switches when the "mode-switch" property and
> relevant ports are available in Device Tree. Configure the crosspoint
> switch based on the entered alternate mode for a specific Type-C
> connector.
> 
> Crosspoint switch can also be used for switching the output signal for
> different orientations of a single USB Type-C connector, but the
> orientation switch is not implemented yet. A TODO is added for this.

...

> +static int anx7625_typec_mux_set(struct typec_mux_dev *mux,
> +				 struct typec_mux_state *state)
> +{
> +	struct drm_dp_typec_port_data *port = typec_mux_get_drvdata(mux);
> +	struct anx7625_data *ctx = port->data;
> +	struct device *dev = ctx->dev;
> +	struct drm_dp_typec_switch_desc switch_desc = ctx->switch_desc;
> +	bool new_dp_connected, old_dp_connected;
> +
> +	if (switch_desc.num_typec_switches == 1)
> +		return 0;

> +	wait_for_completion(&ctx->mux_register);

How do we guarantee this won't become an infinite waiting?
Perhaps a comment explaining that?

> +	old_dp_connected = ctx->port_data[0].dp_connected ||
> +			   ctx->port_data[1].dp_connected;
> +
> +	ctx->port_data[port->port_num].dp_connected =
> +		state->alt &&
> +		state->alt->svid == USB_TYPEC_DP_SID &&
> +		state->alt->mode == USB_TYPEC_DP_MODE;
> +
> +	dev_dbg(dev, "mux_set dp_connected: c0=%d, c1=%d\n",
> +		ctx->port_data[0].dp_connected, ctx->port_data[1].dp_connected);
> +
> +	new_dp_connected = ctx->port_data[0].dp_connected ||
> +			   ctx->port_data[1].dp_connected;
> +
> +	/* DP on, power on first */
> +	if (!old_dp_connected && new_dp_connected)
> +		pm_runtime_get_sync(dev);
> +
> +	anx7625_typec_two_ports_update(ctx);
> +
> +	/* DP off, power off last */
> +	if (old_dp_connected && !new_dp_connected)
> +		pm_runtime_put_sync(dev);
> +
> +	return 0;
> +}

...

> +	struct device_node *port_node = of_graph_get_port_by_id(dev->of_node, 1);

You use fwnode below, so why not fwnode_graph_...(dev_fwnode(dev), ...) ?

> +	struct drm_dp_typec_switch_desc *switch_desc = &ctx->switch_desc;
> +	int ret;
> +	u32 dp_lanes[4];
> +	unsigned int i, num_lanes;
> +
> +	/*
> +	 * Currently, only mode switch is implemented.
> +	 * TODO: Implement Type-C orientation switch for anx7625.
> +	 */
> +	ret = drm_dp_register_typec_switches(dev, &port_node->fwnode,
> +					     &ctx->switch_desc, ctx,
> +					     anx7625_typec_mux_set);
> +	if (ret)
> +		return ret;
> +
> +	ctx->port_data = devm_kcalloc(dev, switch_desc->num_typec_switches,
> +				      sizeof(struct anx7625_typec_port_data),

				      sizeof(*ctx->port_data),

?

> +				      GFP_KERNEL);
> +	if (!ctx->port_data) {
> +		ret = -ENOMEM;
> +		goto unregister_mux;
> +	}

...

> +struct anx7625_typec_port_data {
> +	bool dp_connected;
> +	enum typec_orientation orientation;

Most likely enum will be 32-bit and bool 8-bit. Which means that the data type
size become 8 bytes for no reason. Can you swap the lines and perhaps check this
with `pahole` tool?

> +};

-- 
With Best Regards,
Andy Shevchenko


