Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B828C68BC9B
	for <lists+dri-devel@lfdr.de>; Mon,  6 Feb 2023 13:16:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F247610E397;
	Mon,  6 Feb 2023 12:16:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F2B5810E397
 for <dri-devel@lists.freedesktop.org>; Mon,  6 Feb 2023 12:16:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1675685791; x=1707221791;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=COccYeiX6s3NttyzLTYc1IGSAZO9u/EOlAGFDSN7tiM=;
 b=Bx+6OZox57K7lkAqZvxZvdBie7FAe0abpCqX3axn2G3tKPQffhF6cBT0
 j0mnWZuBR0NOTAIEtvFpINCp9VOCuoXZ4TBEOtpBp7XgHDYx8mQvJBL3a
 zQ8+1FydbS1dey62rqOSxRLpqR29Tm1NcFSD7BoG0/c+IYII+vGpGbb0J
 1Fzrfotk3nBl/TAtJ1ZdHmTwJWnFOJ0P5sZZEDu+0O/kbaunyQ0dayZGL
 FM5YyvB3GkTTCHRKYMBV62Nf4Xi8a1sY1wbiL5gGkXE//xJSLjj4l+v9w
 4r4ia2mjnsKX6Y2P8u4BF3KR+O2poO8GpCFwZpRXkLYKWcFI/IZxGWP/B A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10612"; a="329206947"
X-IronPort-AV: E=Sophos;i="5.97,276,1669104000"; d="scan'208";a="329206947"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Feb 2023 04:16:30 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10612"; a="729990282"
X-IronPort-AV: E=Sophos;i="5.97,276,1669104000"; d="scan'208";a="729990282"
Received: from smile.fi.intel.com ([10.237.72.54])
 by fmsmga008.fm.intel.com with ESMTP; 06 Feb 2023 04:16:23 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.96)
 (envelope-from <andriy.shevchenko@linux.intel.com>)
 id 1pP0Pz-003ALH-2E; Mon, 06 Feb 2023 14:16:19 +0200
Date: Mon, 6 Feb 2023 14:16:19 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Pin-yen Lin <treapking@chromium.org>
Subject: Re: [PATCH v11 6/9] drm/bridge: anx7625: Register Type C mode switches
Message-ID: <Y+Dvk63SwoFjBCsd@smile.fi.intel.com>
References: <20230204133040.1236799-1-treapking@chromium.org>
 <20230204133040.1236799-7-treapking@chromium.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230204133040.1236799-7-treapking@chromium.org>
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
 Prashant Malani <pmalani@chromium.org>,
 =?iso-8859-1?Q?Jos=E9_Exp=F3sito?= <jose.exposito89@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sat, Feb 04, 2023 at 09:30:37PM +0800, Pin-yen Lin wrote:
> Register USB Type-C mode switches when the "mode-switch" property and
> relevant ports are available in Device Tree. Configure the crosspoint
> switch based on the entered alternate mode for a specific Type-C
> connector.
> 
> Crosspoint switch can also be used for switching the output signal for
> different orientations of a single USB Type-C connector, but the
> orientation switch is not implemented yet. A TODO is added for this.

...

> +	for (i = 0; i < 2; i++) {
> +		if (ctx->port_data[i].dp_connected)
> +			anx7625_set_crosspoint_switch(
> +				ctx, ctx->port_data[i].orientation);

It's more than enough room to place ctx on the previous line.

> +	}

...

> +	struct anx7625_data *ctx = (struct anx7625_data *) port->data;

Redundant explicit casting.

...

> +	struct device *dev = &ctx->client->dev;

Do you really need to keep client in that struct and not simply dev?

...

> +	/* dp on, power on first */

DP ?

...

> +	/* dp off, power off last */

Ditto.

...

> +		num_lanes = fwnode_property_read_u32_array(fwnode, "data-lanes",
> +							   NULL, 0);

Read the kernel doc for this API and amend your code accordingly.

...

> +		if (num_lanes <= 0 || num_lanes > 2) {
> +			dev_err(dev,
> +				"Error on getting data lanes count from %pfwP: %d\n",
> +				fwnode, num_lanes);
> +			ret = num_lanes;

ret == 0?! Carefully consider all cases.

> +			goto unregister_mux;
> +		}

-- 
With Best Regards,
Andy Shevchenko


