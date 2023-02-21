Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 41AD469DEF1
	for <lists+dri-devel@lfdr.de>; Tue, 21 Feb 2023 12:36:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6A08310E27D;
	Tue, 21 Feb 2023 11:36:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BC54910E2F9
 for <dri-devel@lists.freedesktop.org>; Tue, 21 Feb 2023 11:36:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1676979395; x=1708515395;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=7ANYBaN3BRH6hFLUyPVgrXSlXGHP/g9XCIrZnmRZ6dA=;
 b=I803OMaJ9zH543AV3PdUSws6trpc4tF9vNGxL5fCnps1ipT5paxbq1S9
 egGqF+w14l/KFhd445IBmN6N45AWcQrrFCWZIZ9o7wE5Hq09QDQlwMuda
 DfDleJc6RN/9Oe7Mi255PaHDfIc809IY8kYGsEWtr4Ors5xbMpIRSJSoW
 u4hE6Q70Y87gYHOaE/UwX5jn9N/SSDJOvgmhbp3Xhm25LI1kmwX2K35t8
 h2t5W4R6p46uN0zf6jnrvXTHwdpi6ppyyk4BKF0EcTIqBMEQG2vSsAuo2
 WiQoyYQJ/1Qb9S0xrmgxLDoZkqqUUM98OUNhW60MDkYJPQV7Fg7WkC4Lq g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10627"; a="332614502"
X-IronPort-AV: E=Sophos;i="5.97,315,1669104000"; d="scan'208";a="332614502"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Feb 2023 03:36:34 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10627"; a="795494041"
X-IronPort-AV: E=Sophos;i="5.97,315,1669104000"; d="scan'208";a="795494041"
Received: from smile.fi.intel.com ([10.237.72.54])
 by orsmga004.jf.intel.com with ESMTP; 21 Feb 2023 03:36:24 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.96)
 (envelope-from <andriy.shevchenko@linux.intel.com>)
 id 1pUQwW-009w6O-31; Tue, 21 Feb 2023 13:36:20 +0200
Date: Tue, 21 Feb 2023 13:36:20 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Pin-yen Lin <treapking@chromium.org>
Subject: Re: [PATCH v12 07/10] drm/bridge: anx7625: Register Type C mode
 switches
Message-ID: <Y/SstDfugez4/Qx4@smile.fi.intel.com>
References: <20230221095054.1868277-1-treapking@chromium.org>
 <20230221095054.1868277-8-treapking@chromium.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230221095054.1868277-8-treapking@chromium.org>
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
 Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>,
 devicetree@vger.kernel.org, Sakari Ailus <sakari.ailus@linux.intel.com>,
 =?iso-8859-1?Q?N=EDcolas_F_=2E_R_=2E_A_=2E?= Prado <nfraprado@collabora.com>,
 Jonas Karlman <jonas@kwiboo.se>, Allen Chen <allen.chen@ite.com.tw>,
 Stephen Boyd <swboyd@chromium.org>, Rob Herring <robh+dt@kernel.org>,
 Hsin-Yi Wang <hsinyi@chromium.org>, Benson Leung <bleung@chromium.org>,
 Xin Ji <xji@analogixsemi.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-kernel@vger.kernel.org,
 Daniel Scally <djrscally@gmail.com>, Prashant Malani <pmalani@chromium.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Feb 21, 2023 at 05:50:51PM +0800, Pin-yen Lin wrote:
> Register USB Type-C mode switches when the "mode-switch" property and
> relevant ports are available in Device Tree. Configure the crosspoint
> switch based on the entered alternate mode for a specific Type-C
> connector.
> 
> Crosspoint switch can also be used for switching the output signal for
> different orientations of a single USB Type-C connector, but the
> orientation switch is not implemented yet. A TODO is added for this.

...

> +static void anx7625_typec_two_ports_update(struct anx7625_data *ctx)
> +{
> +	int i;

unsigned?

+ Blank line.

> +	/* Check if both ports available and do nothing to retain the current one */
> +	if (ctx->port_data[0].dp_connected && ctx->port_data[1].dp_connected)
> +		return;
> +
> +	for (i = 0; i < 2; i++) {
> +		if (ctx->port_data[i].dp_connected)
> +			anx7625_set_crosspoint_switch(ctx,
> +						      ctx->port_data[i].orientation);
> +	}
> +}

...

> +	ctx->port_data[port->port_num].dp_connected =
> +		state->alt && state->alt->svid == USB_TYPEC_DP_SID &&

I would move the first parameter of && to the separate line for slightly better
readability.

> +		state->alt->mode == USB_TYPEC_DP_MODE;

...

> +	for (i = 0; i < switch_desc->num_typec_switches; i++) {
> +		struct drm_dp_typec_port_data *port = &switch_desc->typec_ports[i];
> +		struct fwnode_handle *fwnode = port->fwnode;
> +
> +		num_lanes = fwnode_property_count_u32(fwnode, "data-lanes");

> +

Redundant blank line.

> +		if (num_lanes < 0) {
> +			dev_err(dev,
> +				"Error on getting data lanes count from %pfwP: %d\n",
> +				fwnode, num_lanes);

> +			ret = num_lanes;

Can be written differently:

> +			goto unregister_mux;
> +		}

		ret = ...
		if (ret < 0) {
			...
		}
		num_lanes = ret;


What if it's 0?

> +		ret = fwnode_property_read_u32_array(fwnode, "data-lanes",
> +						     dp_lanes, num_lanes);
> +		if (ret) {
> +			dev_err(dev,
> +				"Failed to read the data-lanes variable: %d\n",
> +				ret);
> +			goto unregister_mux;
> +		}
> +
> +		ctx->port_data[i].orientation = (dp_lanes[0] / 2 == 0) ?
> +			TYPEC_ORIENTATION_REVERSE : TYPEC_ORIENTATION_NORMAL;
> +		ctx->port_data[i].dp_connected = false;
> +	}
> +	complete_all(&ctx->mux_register);
> +
> +	return 0;
> +
> +unregister_mux:
> +	complete_all(&ctx->mux_register);
> +	anx7625_unregister_typec_switches(ctx);
> +	return ret;
> +}

-- 
With Best Regards,
Andy Shevchenko


