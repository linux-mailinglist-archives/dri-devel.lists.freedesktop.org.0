Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C2D46378CA
	for <lists+dri-devel@lfdr.de>; Thu, 24 Nov 2022 13:25:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3409710E054;
	Thu, 24 Nov 2022 12:25:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D494A10E054
 for <dri-devel@lists.freedesktop.org>; Thu, 24 Nov 2022 12:25:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1669292701; x=1700828701;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=KrpjK4F7jdU1QpIQ8SnZenQcGxWFonbm3xOqctiSeP0=;
 b=VmrG2TAyOI1rQbt/Sj1qiXTqaqNwKfs21ATwpT0dR8o3yuvX+QuyTLBq
 qAUGbL3ScpKJIo8XP8vWKuoAL9IE9ho6Eked4m5B28k4eRSdkYjD1Nb3j
 ukdjKUVXTmdSMPCCBpDQ+ZbA9i1a0+lJKiHeJSCG8q333q2cE8UFaj35W
 IwyuHSjgidBWrWij4kqaVPZKE3iS/0AI0xNB9Uj9BWDrZsILOY/vccV8Q
 NtbH2Wzle4H72XL2NfNpqpi/9PetLh71PsNr+LS2ZJ2c14xz3MzBs03e4
 TkABhvWYRoOTvU5S4o4fzOEAdBiYssuYLpqb2yh7IcOVqnbx9yPWQ+Mvj g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10540"; a="312991343"
X-IronPort-AV: E=Sophos;i="5.96,190,1665471600"; d="scan'208";a="312991343"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Nov 2022 04:25:01 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10540"; a="592905313"
X-IronPort-AV: E=Sophos;i="5.96,190,1665471600"; d="scan'208";a="592905313"
Received: from smile.fi.intel.com ([10.237.72.54])
 by orsmga003.jf.intel.com with ESMTP; 24 Nov 2022 04:24:52 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.96)
 (envelope-from <andriy.shevchenko@linux.intel.com>)
 id 1oyBHd-00Gjxg-1Q; Thu, 24 Nov 2022 14:24:49 +0200
Date: Thu, 24 Nov 2022 14:24:49 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Pin-yen Lin <treapking@chromium.org>
Subject: Re: [PATCH v6 2/7] platform/chrome: cros_ec_typec: Purge blocking
 switch devlinks
Message-ID: <Y39ikbcqx5/pEc64@smile.fi.intel.com>
References: <20221124102056.393220-1-treapking@chromium.org>
 <20221124102056.393220-3-treapking@chromium.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221124102056.393220-3-treapking@chromium.org>
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

On Thu, Nov 24, 2022 at 06:20:51PM +0800, Pin-yen Lin wrote:
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

...

> +	/*
> +	 * OF graph may have set up some device links with switches, since connectors have their
> +	 * own compatible. Purge these to avoid a deadlock in switch probe (the switch mistakenly
> +	 * assumes the connector is a supplier).
> +	 */

A bit too long lines...

> +	if (dev->of_node)

Why do you need this check?

> +		device_for_each_child_node(dev, fwnode)
> +			fw_devlink_purge_absent_suppliers(fwnode);

-- 
With Best Regards,
Andy Shevchenko


