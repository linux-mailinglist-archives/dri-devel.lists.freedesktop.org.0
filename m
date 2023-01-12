Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D6165667325
	for <lists+dri-devel@lfdr.de>; Thu, 12 Jan 2023 14:27:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A7F6410E8E1;
	Thu, 12 Jan 2023 13:27:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BDB6D10E8E1
 for <dri-devel@lists.freedesktop.org>; Thu, 12 Jan 2023 13:27:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1673530039; x=1705066039;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=NAfWh46V7/4xTNxgEj+yJfX0uaEeW75r1+cw67vSYTM=;
 b=Y2e8HrMWagc0FSLvo3a7hkzlZI/ht0gn6micTxODmxPU+vexWEzZzOam
 oCoEPGT3GsK4q4J0HDqDy9N67lV3lb9P17mhnbDN8RahoFG+o6TA66sQo
 APcj7IFnl4KUEo9yRxlFir6k8f947m60XB2bgVbTdDhKhbFIrCFwSE2Xr
 rUa5r9K5q32AshLh0ysF9WFJbP9ox0GLhGpiCRCrDog3Kzkg5lUAZJ+KV
 9QFWQGv8uoO7JA8d8cqg7dxhuXQ1CZdQU7RjO3ZADnk4Z/wrfoPHNkmBH
 nMbFeZ5XOgya00B4nKy2IzV3nEI49xKnrwinjQ4k5yKaB6AlmilfI/xa2 A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10587"; a="311526158"
X-IronPort-AV: E=Sophos;i="5.97,319,1669104000"; d="scan'208";a="311526158"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jan 2023 05:27:19 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10587"; a="800209398"
X-IronPort-AV: E=Sophos;i="5.97,319,1669104000"; d="scan'208";a="800209398"
Received: from kuha.fi.intel.com ([10.237.72.185])
 by fmsmga001.fm.intel.com with SMTP; 12 Jan 2023 05:27:09 -0800
Received: by kuha.fi.intel.com (sSMTP sendmail emulation);
 Thu, 12 Jan 2023 15:27:09 +0200
Date: Thu, 12 Jan 2023 15:27:09 +0200
From: Heikki Krogerus <heikki.krogerus@linux.intel.com>
To: Pin-yen Lin <treapking@chromium.org>
Subject: Re: [PATCH v10 1/9] device property: Add remote endpoint to devcon
 matcher
Message-ID: <Y8AKrYS19n/dvZEk@kuha.fi.intel.com>
References: <20230112042104.4107253-1-treapking@chromium.org>
 <20230112042104.4107253-2-treapking@chromium.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230112042104.4107253-2-treapking@chromium.org>
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
Cc: Andrzej Hajda <andrzej.hajda@intel.com>,
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
 Hsin-Yi Wang <hsinyi@chromium.org>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Xin Ji <xji@analogixsemi.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-kernel@vger.kernel.org,
 Robert Foss <robert.foss@linaro.org>, Daniel Scally <djrscally@gmail.com>,
 Prashant Malani <pmalani@chromium.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Jan 12, 2023 at 12:20:56PM +0800, Pin-yen Lin wrote:
> From: Prashant Malani <pmalani@chromium.org>
> 
> When searching the device graph for device matches, check the
> remote-endpoint itself for a match.
> 
> Some drivers register devices for individual endpoints. This allows
> the matcher code to evaluate those for a match too, instead
> of only looking at the remote parent devices. This is required when a
> device supports two mode switches in its endpoints, so we can't simply
> register the mode switch with the parent node.
> 
> Signed-off-by: Prashant Malani <pmalani@chromium.org>
> Signed-off-by: Pin-yen Lin <treapking@chromium.org>
> Reviewed-by: Chen-Yu Tsai <wenst@chromium.org>
> Tested-by: Chen-Yu Tsai <wenst@chromium.org>

Acked-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>

> ---
> 
> Changes in v10:
> - Collected Reviewed-by and Tested-by tags
> 
> Changes in v6:
> - New in v6
> 
>  drivers/base/property.c | 15 +++++++++++++++
>  1 file changed, 15 insertions(+)
> 
> diff --git a/drivers/base/property.c b/drivers/base/property.c
> index 2a5a37fcd998..48877af4e444 100644
> --- a/drivers/base/property.c
> +++ b/drivers/base/property.c
> @@ -1223,6 +1223,21 @@ static unsigned int fwnode_graph_devcon_matches(struct fwnode_handle *fwnode,
>  			break;
>  		}
>  
> +		/*
> +		 * Some drivers may register devices for endpoints. Check
> +		 * the remote-endpoints for matches in addition to the remote
> +		 * port parent.
> +		 */
> +		node = fwnode_graph_get_remote_endpoint(ep);
> +		if (fwnode_device_is_available(node)) {
> +			ret = match(node, con_id, data);
> +			if (ret) {
> +				if (matches)
> +					matches[count] = ret;
> +				count++;
> +			}
> +		}
> +
>  		node = fwnode_graph_get_remote_port_parent(ep);
>  		if (!fwnode_device_is_available(node)) {
>  			fwnode_handle_put(node);
> -- 
> 2.39.0.314.g84b9a713c41-goog

-- 
heikki
