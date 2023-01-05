Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BCD7365F023
	for <lists+dri-devel@lfdr.de>; Thu,  5 Jan 2023 16:34:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E9A0110E122;
	Thu,  5 Jan 2023 15:34:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E72C310E122
 for <dri-devel@lists.freedesktop.org>; Thu,  5 Jan 2023 15:33:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1672932839; x=1704468839;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=d9qCGfnbvV19YiK+oGf2OAoM9AmsakV5jBBNht6wFH0=;
 b=RUg/oDH99oWWSFK5zCzfmEZQpA8cAYwLefAf40po42+a5kNIx4/KMoBt
 f4UF1sEftm0ej268dxg1Bsc97ykfmaZHffVxrSUz14d3G+snqTzn0MoWK
 PNsRR/RvGEtlmHVTTHLLAzm+QGnRU08n21c/+pyYRBXYbtdG219U9bggi
 lq5paF4qNOKcBqNl3XjiNrOPHwVkuTzNpSFwQG12NEc+LOLnBURI5lSYr
 tDeORLNj08+NeXXZs0BbFZI88Ay4KeW4RgQEReF3ld1eEuefuxmpor/Rb
 z3gwTIJyB7gNuMS2jimwLV8uRMYB9rASfu/zpGs2qslbKz/E0FBq5/2LZ w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10580"; a="349448707"
X-IronPort-AV: E=Sophos;i="5.96,303,1665471600"; d="scan'208";a="349448707"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Jan 2023 07:33:11 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10580"; a="797964616"
X-IronPort-AV: E=Sophos;i="5.96,303,1665471600"; d="scan'208";a="797964616"
Received: from smile.fi.intel.com ([10.237.72.54])
 by fmsmga001.fm.intel.com with ESMTP; 05 Jan 2023 07:33:03 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.96)
 (envelope-from <andriy.shevchenko@linux.intel.com>)
 id 1pDSEl-004oxQ-31; Thu, 05 Jan 2023 17:32:59 +0200
Date: Thu, 5 Jan 2023 17:32:59 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Pin-yen Lin <treapking@chromium.org>
Subject: Re: [PATCH v7 2/9] platform/chrome: cros_ec_typec: Purge blocking
 switch devlinks
Message-ID: <Y7btq4kLxrE4v3TL@smile.fi.intel.com>
References: <20230105132457.4125372-1-treapking@chromium.org>
 <20230105132457.4125372-3-treapking@chromium.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230105132457.4125372-3-treapking@chromium.org>
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

On Thu, Jan 05, 2023 at 09:24:50PM +0800, Pin-yen Lin wrote:
> From: Prashant Malani <pmalani@chromium.org>
> 
> When using OF graph, the fw_devlink code will create links between the
> individual port driver (cros-ec-typec here) and the parent device for
> a Type-C switch (like mode-switch). Since the mode-switch will in turn
> have the usb-c-connector (i.e the child of the port driver) as a
> supplier, fw_devlink will not be able to resolve the cyclic dependency
> correctly.
> 
> As a result, the mode-switch driver probe() never runs, so mode-switches
> are never registered. Because of that, the port driver probe constantly
> fails with -EPROBE_DEFER, because the Type-C connector class requires all
> switch devices to be registered prior to port registration.
> 
> To break this deadlock and allow the mode-switch registration to occur,
> purge all the usb-c-connector nodes' absent suppliers. This eliminates
> the connector as a supplier for a switch and allows it to be probed.

> Signed-off-by: Prashant Malani <pmalani@chromium.org>
> 
> Signed-off-by: Pin-yen Lin <treapking@chromium.org>

Tag block mustn't have the blank line(s).

...

> +	/*
> +	 * OF graph may have set up some device links with switches, since
> +	 * connectors have their own compatible. Purge these to avoid a deadlock
> +	 * in switch probe (the switch mistakenly assumes the connector is a
> +	 * supplier).
> +	 */

Perhaps even

	/*
	 * OF graph may have set up some device links with switches,
	 * since connectors have their own compatible. Purge these
	 * to avoid a deadlock in switch probe (the switch mistakenly
	 * assumes the connector is a supplier).
	 */

?

> +	if (dev->of_node)

I would use if (dev_of_node(dev)), but it's up to you and maintainers.

> +		device_for_each_child_node(dev, fwnode)
> +			fw_devlink_purge_absent_suppliers(fwnode);

-- 
With Best Regards,
Andy Shevchenko


