Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6459F6C4DB4
	for <lists+dri-devel@lfdr.de>; Wed, 22 Mar 2023 15:30:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6211689C46;
	Wed, 22 Mar 2023 14:30:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2FB3F10E977
 for <dri-devel@lists.freedesktop.org>; Wed, 22 Mar 2023 14:30:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1679495451; x=1711031451;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=YpXIfF5+mJiCxg+eDEG0Br0ZjXo5m0PVri6m2PIOARM=;
 b=LkqY6WJ69UJBtkxdyOO6T/hlBDk73xFZ+AZU0BTzh5VfYiZr1pLMGLgJ
 pIWpJhs0AzxDzxA1TYftpn4/7r4DdVqeO9P8otjRkmSq7L3P92+A5oO8E
 a4yiu7KIntACscMNc9P623qHQ/v9XnALvJfi+iCzQuMKr8sVJLIeXtqa9
 irphi4o6hSmYOWlmjgJuqz05vZ5FUF2BFZHB7f6NtuLXa2LUKrfpkGBwF
 pALw8F2SMlExRhsIahv3/35p3fDt+f6lER9pP8sXtnMmrxzCPkJpsn9g/
 4MV+IjjTs2SpWcNdzicW33jL24pmgiJIVMIskYefg2LS8Jg1jqnT8gBM0 w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10657"; a="323071002"
X-IronPort-AV: E=Sophos;i="5.98,282,1673942400"; d="scan'208";a="323071002"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Mar 2023 07:30:41 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10657"; a="632010777"
X-IronPort-AV: E=Sophos;i="5.98,282,1673942400"; d="scan'208";a="632010777"
Received: from smile.fi.intel.com ([10.237.72.54])
 by orsmga003.jf.intel.com with ESMTP; 22 Mar 2023 07:30:33 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.96)
 (envelope-from <andriy.shevchenko@linux.intel.com>)
 id 1pezTy-007AGy-0O; Wed, 22 Mar 2023 16:30:30 +0200
Date: Wed, 22 Mar 2023 16:30:29 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Pin-yen Lin <treapking@chromium.org>
Subject: Re: [PATCH v14 10/10] drm/bridge: it6505: Register Type C mode
 switches
Message-ID: <ZBsRBV9dw+mb5ZxZ@smile.fi.intel.com>
References: <20230322104639.221402-1-treapking@chromium.org>
 <20230322104639.221402-11-treapking@chromium.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230322104639.221402-11-treapking@chromium.org>
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

On Wed, Mar 22, 2023 at 06:46:39PM +0800, Pin-yen Lin wrote:
> Register USB Type-C mode switches when the "mode-switch" property and
> relevant port are available in Device Tree. Configure the "lane_swap"
> state based on the entered alternate mode for a specific Type-C
> connector, which ends up updating the lane swap registers of the it6505
> chip.

...

> +	struct device_node *port_node = of_graph_get_port_by_id(dev->of_node, 1);
> +	struct drm_dp_typec_switch_desc *switch_desc = &it6505->switch_desc;
> +	int ret;
> +	u32 dp_lanes[4];
> +	unsigned int i, num_lanes;
> +
> +	ret = drm_dp_register_typec_switches(dev, &port_node->fwnode,
> +					     &it6505->switch_desc, it6505,
> +					     it6505_typec_mux_set);
> +	if (ret)
> +		return ret;
> +
> +	it6505->port_data = devm_kcalloc(dev, switch_desc->num_typec_switches,
> +					 sizeof(struct it6505_typec_port_data),
> +					 GFP_KERNEL);
> +	if (!it6505->port_data) {
> +		ret = -ENOMEM;
> +		goto unregister_mux;
> +	}

A couple of the similar comments as per previous similar patch.

...

>  	/* get extcon device from DTS */
>  	extcon = extcon_get_edev_by_phandle(dev, 0);
> -	if (PTR_ERR(extcon) == -EPROBE_DEFER)
> -		return -EPROBE_DEFER;
> -	if (IS_ERR(extcon)) {
> -		dev_err(dev, "can not get extcon device!");
> -		return PTR_ERR(extcon);
> +	ret = PTR_ERR_OR_ZERO(extcon);
> +	if (ret == -EPROBE_DEFER)
> +		return ret;

> +

Unnecessary blank line.

> +	if (ret) {
> +		if (ret != -ENODEV)
> +			dev_warn(dev, "Cannot get extcon device: %d\n", ret);
> +
> +		it6505->extcon = NULL;
> +	} else {
> +		it6505->extcon = extcon;

...

> +	ret = it6505_register_typec_switches(dev, it6505);
> +	if (ret != -ENODEV)
> +		dev_warn(dev, "Didn't register Type-C switches, err: %d\n", ret);

> +

Unnecessary blank line.

> +	if (ret && !it6505->extcon) {
> +		dev_err(dev, "Both extcon and Type-C switch are not registered.\n");
> +		return -EINVAL;

Why not return ret here?

> +	}

-- 
With Best Regards,
Andy Shevchenko


