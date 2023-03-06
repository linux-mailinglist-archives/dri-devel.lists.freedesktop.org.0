Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C9366ABEB6
	for <lists+dri-devel@lfdr.de>; Mon,  6 Mar 2023 12:50:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B839510E234;
	Mon,  6 Mar 2023 11:49:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C57CF10E234
 for <dri-devel@lists.freedesktop.org>; Mon,  6 Mar 2023 11:49:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1678103394; x=1709639394;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=um7CQzxNZpfEkzvRsWCHjh149pxoosAWW6kD+77Ctas=;
 b=SVSGDvuFgbJ0v666TITbuJP+QDrGkY66mgoC+NYwaXJ5h472acCcQc71
 rI37QibQDOLm7EXHheO5QXOJ6fVoqeJSnVC1HcgK5mtsFska9FvhIKThA
 ICFnbPiQ1zzsAholfaS2wLBbllELA9CGRbfNApPCl+faFli6Drr0J2P0S
 GM3ADuuAmJ02s9XwzhIZEkfC1X/gSQ2TJQXn2xoFKjJh1RQv6BiIhJppy
 dbN3skJnYZcuJJTBZEZOzDzW2B5nAHj/BhFQzSoXPsVQyW3dEtTrTH9db
 YS1dIhOY4gF/7MevDoiEaJ+UKKHgjRdNI+7Y2nzwIIVdEJ//BjvycD9pp Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10640"; a="337851135"
X-IronPort-AV: E=Sophos;i="5.98,236,1673942400"; d="scan'208";a="337851135"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Mar 2023 03:49:53 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10640"; a="850263457"
X-IronPort-AV: E=Sophos;i="5.98,236,1673942400"; d="scan'208";a="850263457"
Received: from smile.fi.intel.com ([10.237.72.54])
 by orsmga005.jf.intel.com with ESMTP; 06 Mar 2023 03:49:44 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.96)
 (envelope-from <andriy.shevchenko@linux.intel.com>)
 id 1pZ9LZ-00GKdu-08; Mon, 06 Mar 2023 13:49:41 +0200
Date: Mon, 6 Mar 2023 13:49:40 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Pin-yen Lin <treapking@chromium.org>
Subject: Re: [PATCH v13 03/10] drm/display: Add Type-C switch helpers
Message-ID: <ZAXTVCAQpHvSj+6C@smile.fi.intel.com>
References: <20230303143350.815623-1-treapking@chromium.org>
 <20230303143350.815623-4-treapking@chromium.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230303143350.815623-4-treapking@chromium.org>
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
 Douglas Anderson <dianders@chromium.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Guenter Roeck <groeck@chromium.org>, Marek Vasut <marex@denx.de>,
 chrome-platform@lists.linux.dev, Robert Foss <rfoss@kernel.org>,
 Javier Martinez Canillas <javierm@redhat.com>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, linux-acpi@vger.kernel.org,
 devicetree@vger.kernel.org, Sakari Ailus <sakari.ailus@linux.intel.com>,
 =?iso-8859-1?Q?N=EDcolas_F_=2E_R_=2E_A_=2E?= Prado <nfraprado@collabora.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jani Nikula <jani.nikula@intel.com>,
 Allen Chen <allen.chen@ite.com.tw>, Stephen Boyd <swboyd@chromium.org>,
 Rob Herring <robh+dt@kernel.org>, Hsin-Yi Wang <hsinyi@chromium.org>,
 Xin Ji <xji@analogixsemi.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-kernel@vger.kernel.org,
 Daniel Scally <djrscally@gmail.com>, Prashant Malani <pmalani@chromium.org>,
 Alex Deucher <alexander.deucher@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Mar 03, 2023 at 10:33:43PM +0800, Pin-yen Lin wrote:
> Add helpers to register and unregister Type-C "switches" for bridges
> capable of switching their output between two downstream devices.
> 
> The helper registers USB Type-C mode switches when the "mode-switch"
> and the "reg" properties are available in Device Tree.

...

> +	port_data->typec_mux = typec_mux_register(dev, &mux_desc);
> +	if (IS_ERR(port_data->typec_mux)) {
> +		ret = PTR_ERR(port_data->typec_mux);
> +		dev_err(dev, "Mode switch register for port %d failed: %d\n",
> +			port_num, ret);

> +		return ret;
> +	}
> +
> +	return 0;

Can be simply

	port_data->typec_mux = typec_mux_register(dev, &mux_desc);
	ret = PTR_ERR_OR_ZERO(port_data->typec_mux);
	if (ret)
		dev_err(dev, "Mode switch register for port %d failed: %d\n",
			port_num, ret);

	return ret;

...

> +	switch_desc->typec_ports = devm_kcalloc(dev, switch_desc->num_typec_switches,
> +						sizeof(struct drm_dp_typec_port_data),
> +						GFP_KERNEL);
> +	if (!switch_desc->typec_ports)
> +		return -ENOMEM;

How often this function _can_ be called during the runtime?
If it's _possible_ to call it infinite times, consider *not* using devm.

-- 
With Best Regards,
Andy Shevchenko


