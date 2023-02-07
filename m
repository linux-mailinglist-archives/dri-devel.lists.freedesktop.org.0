Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 65F8E68E2F0
	for <lists+dri-devel@lfdr.de>; Tue,  7 Feb 2023 22:25:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8586210E210;
	Tue,  7 Feb 2023 21:25:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B4AB710E210
 for <dri-devel@lists.freedesktop.org>; Tue,  7 Feb 2023 21:25:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1675805148; x=1707341148;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=wNen/FnBjNX3bzOs+p58aweLxojs1tMz6HAqiUGxA78=;
 b=nSw0aCbzUxoOJHDfdhovuqlCyUkaw2b6iaSXK6dO/2DNwjtqSPQsI/g/
 kSq1nJO8aqLkMX3joqHdvWMKB/YoPZdCAkYe8dHsNDaqiQcHu/zSfUM1L
 1l3c5oOFPpgsnCW5EcV0MUQmxqlSl8IK/G09OvAk4THQxMBlIYyhi11CF
 ci1ec0blrwR9rUzN8SO3/fqfC5XI6SK7Kw0z7u+V/wu7uVm5HbOTjW6lj
 9f3dOMQfGJSFvcAFW8/2UX85F91xS8MB9ab8HBPLHKNmfuOh0aDD127+K
 Th6eoPpMD79PzKCCzpIJheUGy9HzbhS5PQAwjP7a+M9d6ojStomA1wMcS Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10614"; a="331765724"
X-IronPort-AV: E=Sophos;i="5.97,279,1669104000"; d="scan'208";a="331765724"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Feb 2023 13:25:47 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10614"; a="730595933"
X-IronPort-AV: E=Sophos;i="5.97,279,1669104000"; d="scan'208";a="730595933"
Received: from isergee-mobl3.ger.corp.intel.com (HELO intel.com)
 ([10.249.37.137])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Feb 2023 13:25:37 -0800
Date: Tue, 7 Feb 2023 22:25:34 +0100
From: Andi Shyti <andi.shyti@linux.intel.com>
To: Pin-yen Lin <treapking@chromium.org>
Subject: Re: [PATCH v11 3/9] drm/display: Add Type-C switch helpers
Message-ID: <Y+LBzkP+/j6RQ5Jy@ashyti-mobl2.lan>
References: <20230204133040.1236799-1-treapking@chromium.org>
 <20230204133040.1236799-4-treapking@chromium.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230204133040.1236799-4-treapking@chromium.org>
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
 Douglas Anderson <dianders@chromium.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Guenter Roeck <groeck@chromium.org>, Kees Cook <keescook@chromium.org>,
 Marek Vasut <marex@denx.de>, chrome-platform@lists.linux.dev,
 Javier Martinez Canillas <javierm@redhat.com>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, linux-acpi@vger.kernel.org,
 "Gustavo A. R. Silva" <gustavoars@kernel.org>,
 Andi Shyti <andi.shyti@linux.intel.com>, Thierry Reding <treding@nvidia.com>,
 devicetree@vger.kernel.org, Sakari Ailus <sakari.ailus@linux.intel.com>,
 =?iso-8859-15?Q?N=EDcolas_F_=2E_R_=2E_A_=2E?= Prado <nfraprado@collabora.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jani Nikula <jani.nikula@intel.com>,
 Allen Chen <allen.chen@ite.com.tw>, Stephen Boyd <swboyd@chromium.org>,
 Rob Herring <robh+dt@kernel.org>, Hsin-Yi Wang <hsinyi@chromium.org>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Xin Ji <xji@analogixsemi.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-kernel@vger.kernel.org,
 Robert Foss <robert.foss@linaro.org>, Daniel Scally <djrscally@gmail.com>,
 Prashant Malani <pmalani@chromium.org>,
 Alex Deucher <alexander.deucher@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Pin-yen,

[...]

> +static int drm_dp_register_mode_switch(struct device *dev,
> +				       struct fwnode_handle *fwnode,
> +				       struct drm_dp_typec_switch_desc *switch_desc,
> +				       void *data, typec_mux_set_fn_t mux_set)
> +{
> +	struct drm_dp_typec_port_data *port_data;
> +	struct typec_mux_desc mux_desc = {};
> +	char name[32];
> +	u32 port_num;
> +	int ret;
> +
> +	ret = fwnode_property_read_u32(fwnode, "reg", &port_num);
> +	if (ret) {
> +		dev_err(dev, "Failed to read reg property: %d\n", ret);
> +		return ret;
> +	}
> +
> +	port_data = &switch_desc->typec_ports[port_num];
> +	port_data->data = data;
> +	port_data->port_num = port_num;
> +	port_data->fwnode = fwnode;
> +	mux_desc.fwnode = fwnode;
> +	mux_desc.drvdata = port_data;
> +	snprintf(name, sizeof(name), "%pfwP-%u", fwnode, port_num);
> +	mux_desc.name = name;
> +	mux_desc.set = mux_set;
> +
> +	port_data->typec_mux = typec_mux_register(dev, &mux_desc);
> +	if (IS_ERR(port_data->typec_mux)) {
> +		ret = PTR_ERR(port_data->typec_mux);
> +		dev_err(dev, "Mode switch register for port %d failed: %d\n",
> +			port_num, ret);
> +
> +		return ret;

you don't need this return here...

> +	}
> +
> +	return 0;

Just "return ret;" here.

> +}
> +
> +/**
> + * drm_dp_register_typec_switches() - register Type-C switches
> + * @dev: Device that registers Type-C switches
> + * @port: Device node for the switch
> + * @switch_desc: A Type-C switch descriptor
> + * @data: Private data for the switches
> + * @mux_set: Callback function for typec_mux_set
> + *
> + * This function registers USB Type-C switches for DP bridges that can switch
> + * the output signal between their output pins.
> + *
> + * Currently only mode switches are implemented, and the function assumes the
> + * given @port device node has endpoints with "mode-switch" property.
> + * The port number is determined by the "reg" property of the endpoint.
> + */
> +int drm_dp_register_typec_switches(struct device *dev, struct fwnode_handle *port,
> +				   struct drm_dp_typec_switch_desc *switch_desc,
> +				   void *data, typec_mux_set_fn_t mux_set)
> +{
> +	struct fwnode_handle *sw;
> +	int ret;
> +
> +	fwnode_for_each_child_node(port, sw) {
> +		if (fwnode_property_present(sw, "mode-switch"))
> +			switch_desc->num_typec_switches++;
> +	}

no need for brackets here

> +
> +	if (!switch_desc->num_typec_switches) {
> +		dev_dbg(dev, "No Type-C switches node found\n");

dev_warn()?

> +		return 0;
> +	}
> +
> +	switch_desc->typec_ports = devm_kcalloc(
> +		dev, switch_desc->num_typec_switches,
> +		sizeof(struct drm_dp_typec_port_data), GFP_KERNEL);
> +
> +	if (!switch_desc->typec_ports)
> +		return -ENOMEM;
> +
> +	/* Register switches for each connector. */
> +	fwnode_for_each_child_node(port, sw) {
> +		if (!fwnode_property_present(sw, "mode-switch"))
> +			continue;
> +		ret = drm_dp_register_mode_switch(dev, sw, switch_desc, data, mux_set);
> +		if (ret)
> +			goto err_unregister_typec_switches;
> +	}
> +
> +	return 0;
> +
> +err_unregister_typec_switches:
> +	fwnode_handle_put(sw);
> +	drm_dp_unregister_typec_switches(switch_desc);
> +	dev_err(dev, "Failed to register mode switch: %d\n", ret);

there is a bit of dmesg spamming. Please choose where you want to
print the error, either in this function or in
drm_dp_register_mode_switch().

Andi

> +	return ret;
> +}
> +EXPORT_SYMBOL(drm_dp_register_typec_switches);

[...]
