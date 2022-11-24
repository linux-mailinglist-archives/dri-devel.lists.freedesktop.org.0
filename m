Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 889F36378C2
	for <lists+dri-devel@lfdr.de>; Thu, 24 Nov 2022 13:24:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 16BF910E26F;
	Thu, 24 Nov 2022 12:23:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7C29C10E277
 for <dri-devel@lists.freedesktop.org>; Thu, 24 Nov 2022 12:23:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1669292627; x=1700828627;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=ObxTC5S376qcP+jc5Vqug+j/70Vb8bRa53QKgt/sNI0=;
 b=TAkd87MI3g9IIv6jKxilbUyRn7Xtf91ySoQVrSKBa76amUvI/djlpyzA
 Qp59Yye0ah75bHWg9ssGDdK3+8JSeEUzRFGK0YLvTvvePRiME0WX5fbL7
 IlIBZTfO80x1cHOaoboFtTMDpQdBkHAwhKutyBk58JvqjJVJoqV4i5ag2
 6f/342glZbcNdrdhVE4dDbaNnot7T0UaMja7bgJqoELxsJ5JVMN7irWlz
 7wCE23nVKBxk6/mPyJgCuQobHXkkooTF1i6Ubp6LZczIZ/x5pZvk++dSn
 tl4XoIuPSXBJvB2tIMein+e1b7cEH8yqNrUoMlRKU+C27D+9w5rJ3VMQ7 Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10540"; a="293994900"
X-IronPort-AV: E=Sophos;i="5.96,190,1665471600"; d="scan'208";a="293994900"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Nov 2022 04:23:46 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10540"; a="642336159"
X-IronPort-AV: E=Sophos;i="5.96,190,1665471600"; d="scan'208";a="642336159"
Received: from smile.fi.intel.com ([10.237.72.54])
 by orsmga002.jf.intel.com with ESMTP; 24 Nov 2022 04:23:37 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.96)
 (envelope-from <andriy.shevchenko@linux.intel.com>)
 id 1oyBGQ-00GjwQ-0y; Thu, 24 Nov 2022 14:23:34 +0200
Date: Thu, 24 Nov 2022 14:23:34 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Pin-yen Lin <treapking@chromium.org>
Subject: Re: [PATCH v6 7/7] drm/bridge: it6505: Register Type C mode switches
Message-ID: <Y39iRg2TZCljOyNN@smile.fi.intel.com>
References: <20221124102056.393220-1-treapking@chromium.org>
 <20221124102056.393220-8-treapking@chromium.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221124102056.393220-8-treapking@chromium.org>
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

On Thu, Nov 24, 2022 at 06:20:56PM +0800, Pin-yen Lin wrote:
> Register USB Type-C mode switches when the "mode-switch" property and
> relevant port are available in Device Tree. Configure the "lane_swap"
> state based on the entered alternate mode for a specific Type-C
> connector, which ends up updating the lane swap registers of the it6505
> chip.

...

>  config DRM_ITE_IT6505
>          tristate "ITE IT6505 DisplayPort bridge"
>          depends on OF
> +	depends on TYPEC || TYPEC=n
>  	select DRM_DISPLAY_DP_HELPER
>  	select DRM_DISPLAY_HDCP_HELPER
>  	select DRM_DISPLAY_HELPER

Something went wrong with the indentation. Perhaps you need to fix it first.

...

>  #include <drm/drm_edid.h>
>  #include <drm/drm_print.h>
>  #include <drm/drm_probe_helper.h>
> +#include <drm/drm_of.h>

Make it ordered?

...

> +struct it6505_port_data {

> +	bool dp_connected;

Perhaps make it last?

> +	struct typec_mux_dev *typec_mux;
> +	struct it6505 *it6505;
> +};

...

> +static void it6505_typec_ports_update(struct it6505 *it6505)
> +{
> +	usleep_range(3000, 4000);
> +
> +	if (it6505->typec_ports[0].dp_connected && it6505->typec_ports[1].dp_connected)
> +		/* Both ports available, do nothing to retain the current one. */
> +		return;
> +	else if (it6505->typec_ports[0].dp_connected)
> +		it6505->lane_swap = false;
> +	else if (it6505->typec_ports[1].dp_connected)
> +		it6505->lane_swap = true;
> +
> +	usleep_range(3000, 4000);
> +}

As per previous patch comments.

Also, comment out these long sleeps. Why they are needed.

...

> +		int ret = pm_runtime_get_sync(dev);
> +
> +		/*
> +		 * On system resume, mux_set can be triggered before
> +		 * pm_runtime_force_resume re-enables runtime power management.

We refer to the functions as func().

> +		 * Handling the error here to make sure the bridge is powered on.
> +		 */
> +		if (ret < 0)
> +			it6505_poweron(it6505);

This seems needed a bit more of explanation, esp. why you leave PM runtime
reference count bumped up.

...

> +	num_lanes = drm_of_get_data_lanes_count(node, 0, 2);
> +	if (num_lanes <= 0) {
> +		dev_err(dev, "Error on getting data lanes count: %d\n",
> +			num_lanes);
> +		return num_lanes;
> +	}
> +
> +	ret = of_property_read_u32_array(node, "data-lanes", dp_lanes, num_lanes);
> +	if (ret) {
> +		dev_err(dev, "Failed to read the data-lanes variable: %d\n",
> +			ret);
> +		return ret;
> +	}
> +
> +	for (i = 0; i < num_lanes; i++) {
> +		if (port_num != -1 && port_num != dp_lanes[i] / 2) {
> +			dev_err(dev, "Invalid data lane numbers\n");
> +			return -EINVAL;
> +		}

As per previous patch comments.

> +		port_num = dp_lanes[i] / 2;
> +	}

The above seems like tons of duplicating code that drivers need to implement.
Can we shrink that burden by adding some library functions?

-- 
With Best Regards,
Andy Shevchenko


