Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D358068BC81
	for <lists+dri-devel@lfdr.de>; Mon,  6 Feb 2023 13:11:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C2B4110E391;
	Mon,  6 Feb 2023 12:11:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B95EE10E391
 for <dri-devel@lists.freedesktop.org>; Mon,  6 Feb 2023 12:11:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1675685486; x=1707221486;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=Buxqumc71tPCMU+/bMMfLWufol4wdbFjIc0pfWlajJk=;
 b=YXviQME297C/H6VbIFdx+nFzpVeSauoPTnuFsnwQD/VCTNo3sAfbutND
 aDyaG+jOzC46jJJnc5KxdgeqrzYVOGIgdKDi7DyOQW0SMSvaRSDBukpIx
 I49dxpstGuubezcMws78mcS5SwSx3xZg1yDcVPLipdAnPf3ThAhr1Sjz4
 ClROni/v9qabM1FYZ28xpN2FeIvBqE8yTnANpln4a3q0c1kCUwNxJ07oJ
 v5NmkDyy1oFQ0yKklk7IqfJyIkvpBoRj4Vq/nL0crJrleJhLk+nYi+xGN
 j9cKx0rXRMHxcvzUV0gVs8Njdyg+sD2SB40mM+OsN0kmC8KpQzoW5CS5D A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10612"; a="393788592"
X-IronPort-AV: E=Sophos;i="5.97,276,1669104000"; d="scan'208";a="393788592"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Feb 2023 04:11:25 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10612"; a="911902820"
X-IronPort-AV: E=Sophos;i="5.97,276,1669104000"; d="scan'208";a="911902820"
Received: from smile.fi.intel.com ([10.237.72.54])
 by fmsmga006.fm.intel.com with ESMTP; 06 Feb 2023 04:11:11 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.96)
 (envelope-from <andriy.shevchenko@linux.intel.com>)
 id 1pP0Ky-003AEF-1G; Mon, 06 Feb 2023 14:11:08 +0200
Date: Mon, 6 Feb 2023 14:11:08 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Pin-yen Lin <treapking@chromium.org>
Subject: Re: [PATCH v11 5/9] drm/bridge: anx7625: Check for Type-C during
 panel registration
Message-ID: <Y+DuXKlcAQfErVik@smile.fi.intel.com>
References: <20230204133040.1236799-1-treapking@chromium.org>
 <20230204133040.1236799-6-treapking@chromium.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230204133040.1236799-6-treapking@chromium.org>
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
 Chen-Yu Tsai <wenst@chromium.org>, devicetree@vger.kernel.org,
 Sakari Ailus <sakari.ailus@linux.intel.com>,
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

On Sat, Feb 04, 2023 at 09:30:36PM +0800, Pin-yen Lin wrote:
> The output port endpoints can be connected to USB-C connectors.
> Running drm_of_find_panel_or_bridge() with such endpoints leads to
> a continuous return value of -EPROBE_DEFER, even though there is
> no panel present.
> 
> To avoid this, check for the existence of a "mode-switch" property in
> the port endpoint, and skip panel registration completely if so.

...

> +	/*
> +	 * Don't bother finding a panel if a Type-C `mode-switch` property is
> +	 * present in one of the endpoints.
> +	 */
> +	for_each_endpoint_of_node(np, sw) {
> +		if (of_property_read_bool(sw, "mode-switch")) {

Might be that the same helper can be used here. Dunno if the endpoint traverse
should be used for the other driver as well.

> +			of_node_put(sw);
> +			return 0;
> +		}
> +	}

-- 
With Best Regards,
Andy Shevchenko


