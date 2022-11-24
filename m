Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 721A06378B7
	for <lists+dri-devel@lfdr.de>; Thu, 24 Nov 2022 13:18:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D29A210E6F4;
	Thu, 24 Nov 2022 12:18:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D3A6E10E6F1
 for <dri-devel@lists.freedesktop.org>; Thu, 24 Nov 2022 12:18:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1669292305; x=1700828305;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=88JzpGsV3l3i1UU+gsY2jc1hU9imedkQHBbOB9+/b6U=;
 b=UPTW2saftpdE1EgOUxlADZoHRZaWV7uiyfQ69y5ar4DLSStNEwBhgybe
 lcA0m8Fz//2lm0a+XdILIJEKIP7762svjJ/J4GSZctDZvvZe1m7e6ZBzm
 TN77HgLJmfrp45SZh/JVoDFc0HenE5pj46gizX+tMiOkTENuqj9vf8zKU
 bh9zn11wtSEKFCXDN7dTo0sJ4O4bxNzzJqLQE4+q8F4n08ogJOIqbrkYu
 WrSy+AjL7X8Abln3Ec52X2NAhSaaimqSPpvWl/0hFxuSlU1mgqKS6Qbsx
 gLMWQOH8LxvXFiQzCvUsLRlzYLQ11nb097IIsBJSbwDc686NdBumkjyF5 w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10540"; a="294675161"
X-IronPort-AV: E=Sophos;i="5.96,190,1665471600"; d="scan'208";a="294675161"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Nov 2022 04:18:16 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10540"; a="887356125"
X-IronPort-AV: E=Sophos;i="5.96,190,1665471600"; d="scan'208";a="887356125"
Received: from smile.fi.intel.com ([10.237.72.54])
 by fmsmga006.fm.intel.com with ESMTP; 24 Nov 2022 04:18:08 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.96)
 (envelope-from <andriy.shevchenko@linux.intel.com>)
 id 1oyBB6-00Gjps-36; Thu, 24 Nov 2022 14:18:04 +0200
Date: Thu, 24 Nov 2022 14:18:04 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Pin-yen Lin <treapking@chromium.org>
Subject: Re: [PATCH v6 5/7] drm/bridge: anx7625: Register Type C mode switches
Message-ID: <Y39g/OBLW3pt9qdy@smile.fi.intel.com>
References: <20221124102056.393220-1-treapking@chromium.org>
 <20221124102056.393220-6-treapking@chromium.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221124102056.393220-6-treapking@chromium.org>
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
 chrome-platform@lists.linux.dev, Javier Martinez Canillas <javierm@redhat.com>,
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
 Robert Foss <robert.foss@linaro.org>, Daniel Scally <djrscally@gmail.com>,
 Prashant Malani <pmalani@chromium.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Nov 24, 2022 at 06:20:54PM +0800, Pin-yen Lin wrote:
> Register USB Type-C mode switches when the "mode-switch" property and
> relevant port are available in Device Tree. Configure the crosspoint
> switch based on the entered alternate mode for a specific Type-C
> connector.

...

> +static void anx7625_typec_two_ports_update(struct anx7625_data *ctx)
> +{
> +	if (ctx->typec_ports[0].dp_connected && ctx->typec_ports[1].dp_connected)
> +		/* Both ports available, do nothing to retain the current one. */
> +		return;

> +	else if (ctx->typec_ports[0].dp_connected)

This 'else' is redundant. I would rewrite above as

	/* Check if both ports available and do nothing to retain the current one */
	if (ctx->typec_ports[0].dp_connected && ctx->typec_ports[1].dp_connected)
		return;

	if (ctx->typec_ports[0].dp_connected)

> +		anx7625_set_crosspoint_switch(ctx, TYPEC_ORIENTATION_NORMAL);
> +	else if (ctx->typec_ports[1].dp_connected)
> +		anx7625_set_crosspoint_switch(ctx, TYPEC_ORIENTATION_REVERSE);
> +}

...

> +	data->dp_connected = (state->alt && state->alt->svid == USB_TYPEC_DP_SID &&
> +			      state->alt->mode == USB_TYPEC_DP_MODE);

Parentheses are not needed.

...

> +	/*
> +	 * <0 1> refers to SSRX1/SSTX1, and <2 3> refers to SSRX2/SSTX2.
> +	 */
> +	for (i = 0; i < num_lanes; i++) {

> +		if (port_num != -1 && port_num != dp_lanes[i] / 2) {
> +			dev_err(dev, "Invalid data lane numbers\n");
> +			return -EINVAL;
> +		}

According to Rob Linux must not validate device tree. If you need it, use
proper YAML schema.

> +		port_num = dp_lanes[i] / 2;
> +	}

...

> +	if (!ctx->num_typec_switches) {
> +		dev_warn(dev, "No Type-C switches node found\n");

> +		return ret;

Why not to return 0 explicitly?

> +	}

...

> +	ctx->typec_ports = devm_kcalloc(

Broken indentation.

> +		dev, ctx->num_typec_switches, sizeof(struct anx7625_port_data),
> +		GFP_KERNEL);
> +	if (!ctx->typec_ports)
> +		return -ENOMEM;

...

> +struct anx7625_port_data {

> +	bool dp_connected;

You can save some bytes on some architectures if move this to be last field.

> +	struct typec_mux_dev *typec_mux;
> +	struct anx7625_data *ctx;
> +};

-- 
With Best Regards,
Andy Shevchenko


