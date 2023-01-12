Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A0E7667335
	for <lists+dri-devel@lfdr.de>; Thu, 12 Jan 2023 14:32:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 17D8B10E8E5;
	Thu, 12 Jan 2023 13:32:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EB94D10E8E3
 for <dri-devel@lists.freedesktop.org>; Thu, 12 Jan 2023 13:32:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1673530367; x=1705066367;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=5s3rq0HPT7JhaK1ei+4B0dAg3NA3ZhC5O9DBhXYruHU=;
 b=Gy6tRqM2oWmyJkZJS1MR77B6LL/cdVT0d00gWPyEKT6Hl33/bCiyNjk8
 4m2R969sTk1WdZfDR/Vet3bVs3FJ/THhNlrRmDhp39uEyGbQoOQsUMu2M
 IPzibrL38pw799IVl/KXOVqh1MhYCbK/wMFaEgpGKX1TacNp4zJRiJ+fY
 QGPMxjbAnAzCWPleixQGnVzY5H/Xh0uxKFyUFjXEvbxu9MDvn/BV7zOz4
 rMzRQuVsCN1+eR1XOinGNloJ16QJ/iFGdB60GMFGIbXuxAgNWggiBxl1v
 Cs90c+OAUFhlzecjfZ54l3wph3j+u3xzJZ9jsuIaVrjlfX2SX3UtOFh4A Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10587"; a="386018580"
X-IronPort-AV: E=Sophos;i="5.97,319,1669104000"; d="scan'208";a="386018580"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jan 2023 05:32:45 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10587"; a="688334548"
X-IronPort-AV: E=Sophos;i="5.97,319,1669104000"; d="scan'208";a="688334548"
Received: from punajuuri.fi.intel.com (HELO paasikivi.fi.intel.com)
 ([10.237.72.43])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jan 2023 05:32:36 -0800
Received: from paasikivi.fi.intel.com (localhost [127.0.0.1])
 by paasikivi.fi.intel.com (Postfix) with SMTP id 4F4162021A;
 Thu, 12 Jan 2023 15:32:34 +0200 (EET)
Date: Thu, 12 Jan 2023 13:32:34 +0000
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Pin-yen Lin <treapking@chromium.org>
Subject: Re: [PATCH v10 1/9] device property: Add remote endpoint to devcon
 matcher
Message-ID: <Y8AL8nTcNcl6zX7H@paasikivi.fi.intel.com>
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
Cc: Heikki Krogerus <heikki.krogerus@linux.intel.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 "Rafael J . Wysocki" <rafael@kernel.org>, dri-devel@lists.freedesktop.org,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Guenter Roeck <groeck@chromium.org>, Marek Vasut <marex@denx.de>,
 chrome-platform@lists.linux.dev, Javier Martinez Canillas <javierm@redhat.com>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, linux-acpi@vger.kernel.org,
 Chen-Yu Tsai <wenst@chromium.org>, devicetree@vger.kernel.org,
 Thomas Zimmermann <tzimmermann@suse.de>,
 =?iso-8859-1?Q?N=EDcolas_F_=2E_R_=2E_A_=2E?= Prado <nfraprado@collabora.com>,
 Jonas Karlman <jonas@kwiboo.se>, Allen Chen <allen.chen@ite.com.tw>,
 Stephen Boyd <swboyd@chromium.org>, Rob Herring <robh+dt@kernel.org>,
 Hsin-Yi Wang <hsinyi@chromium.org>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Xin Ji <xji@analogixsemi.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-kernel@vger.kernel.org,
 Robert Foss <robert.foss@linaro.org>, Daniel Scally <djrscally@gmail.com>,
 Prashant Malani <pmalani@chromium.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Pin-yen,

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
> 
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

Aren't you missing fwnode_handle-put(node) here??

> +
>  		node = fwnode_graph_get_remote_port_parent(ep);
>  		if (!fwnode_device_is_available(node)) {
>  			fwnode_handle_put(node);

-- 
Kind regards,

Sakari Ailus
