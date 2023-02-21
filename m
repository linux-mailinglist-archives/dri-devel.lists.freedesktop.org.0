Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BB7E269DF5A
	for <lists+dri-devel@lfdr.de>; Tue, 21 Feb 2023 12:55:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DF01510E464;
	Tue, 21 Feb 2023 11:55:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EC39010E464
 for <dri-devel@lists.freedesktop.org>; Tue, 21 Feb 2023 11:55:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1676980508; x=1708516508;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=QCQCaIZW5z5pVDWUHNmY/rYFh3F6mLZ18lRrmfZVXQI=;
 b=FyY7BsRMLDrA298Hgb1n1Ylj0BkFNKw3Wachp8Mwwm/u6H4yMUEZQqEB
 46xHk1Q6eYfVzMYVYPoZve7azOqhGMmcdYtx4HnTStC5XS7IoefaWeb0D
 nQZB1WJbe3BZzThNEi2VBuXrOFTd9VURbDPQTBY4LxV+2X1fUBOKMEiu6
 2MHYQNHX7SVyQMrotMv7yuaftkajFdshMOY7J1eM6k0RENdeaINyqECtk
 e3DIsy3XDjybbYIM+a7ZVJ7KCdG80xYcxoCrpFrZ4l8EYu4D86bQKtYos
 DfczTVtEkbPlbsMCDsPHAdIfqEFvFDhIMYsi8RwsUwQ31yjOJFWsX9/K3 Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10627"; a="418835400"
X-IronPort-AV: E=Sophos;i="5.97,315,1669104000"; d="scan'208";a="418835400"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Feb 2023 03:55:08 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10627"; a="845656952"
X-IronPort-AV: E=Sophos;i="5.97,315,1669104000"; d="scan'208";a="845656952"
Received: from smile.fi.intel.com ([10.237.72.54])
 by orsmga005.jf.intel.com with ESMTP; 21 Feb 2023 03:55:00 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.96)
 (envelope-from <andriy.shevchenko@linux.intel.com>)
 id 1pUREW-009wQN-25; Tue, 21 Feb 2023 13:54:56 +0200
Date: Tue, 21 Feb 2023 13:54:56 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Pin-yen Lin <treapking@chromium.org>
Subject: Re: [PATCH v12 10/10] drm/bridge: it6505: Register Type C mode
 switches
Message-ID: <Y/SxEEwDFI2CWMv3@smile.fi.intel.com>
References: <20230221095054.1868277-1-treapking@chromium.org>
 <20230221095054.1868277-11-treapking@chromium.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230221095054.1868277-11-treapking@chromium.org>
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
 Hsin-Yi Wang <hsinyi@chromium.org>, Benson Leung <bleung@chromium.org>,
 Xin Ji <xji@analogixsemi.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-kernel@vger.kernel.org,
 Daniel Scally <djrscally@gmail.com>, Prashant Malani <pmalani@chromium.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Feb 21, 2023 at 05:50:54PM +0800, Pin-yen Lin wrote:
> Register USB Type-C mode switches when the "mode-switch" property and
> relevant port are available in Device Tree. Configure the "lane_swap"
> state based on the entered alternate mode for a specific Type-C
> connector, which ends up updating the lane swap registers of the it6505
> chip.

...

> +static void it6505_typec_ports_update(struct it6505 *it6505)
> +{
> +	int i;

unsigned?

(and just note that here you have already blank line which is good)

> +	/* Check if both ports available and do nothing to retain the current one */
> +	if (it6505->port_data[0].dp_connected && it6505->port_data[1].dp_connected)
> +		return;
> +
> +	for (i = 0; i < 2; i++) {
> +		if (it6505->port_data[i].dp_connected)
> +			it6505->lane_swap = it6505->port_data[i].lane_swap;
> +	}
> +}


,,,

> +	it6505->port_data[port->port_num].dp_connected =
> +		state->alt && state->alt->svid == USB_TYPEC_DP_SID &&
> +		state->alt->mode == USB_TYPEC_DP_MODE;

Split first parameter?

...

> +	it6505->port_data = devm_kcalloc(
> +		dev, switch_desc->num_typec_switches,

Strange indentation.

> +		sizeof(struct it6505_typec_port_data), GFP_KERNEL);

> +

Redundant blank line.

> +	if (!it6505->port_data) {
> +		ret = -ENOMEM;
> +		goto unregister_mux;
> +	}

...

> +		num_lanes = fwnode_property_count_u32(fwnode, "data-lanes");
> +
> +		if (num_lanes < 0) {
> +			dev_err(dev,
> +				"Error on getting data lanes count from %pfwP: %d\n",
> +				fwnode, num_lanes);
> +			ret = num_lanes;
> +			goto unregister_mux;
> +		}

Same two comments as per previous patch of similar semantics.

-- 
With Best Regards,
Andy Shevchenko


