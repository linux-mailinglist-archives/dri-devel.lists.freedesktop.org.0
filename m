Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 19A2398EC65
	for <lists+dri-devel@lfdr.de>; Thu,  3 Oct 2024 11:43:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ABC1610E7DD;
	Thu,  3 Oct 2024 09:43:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="aPRf/DSG";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2D13610E7DD
 for <dri-devel@lists.freedesktop.org>; Thu,  3 Oct 2024 09:43:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1727948592; x=1759484592;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=kKheSpvNhKnnOCs4OPuTFoh9bYM2IVoqL5zJ0I4iiA0=;
 b=aPRf/DSGO+v6faCuEZe1nSqYQkPRjs4DbgBxYn9sFfZq78ZLG5vhEHNA
 uhZeuq1XRA2HCyMmN6fcnUihkAPhsxblCd4e8Yc3YUUX0OVVfHsTDoRPm
 VPA7R3RHn7lUDdfEMeGtkQbKho/tI9C6POAfXd1ein8XTCUwPmuGqWuLn
 fOqZrS3eGXRdMl2eBN84NzP3GM2AaJAhie+D1+yTiHblKjOLwdAtbmjfN
 RngT5P9gnHjZhSXh8FYA/B0OHuqGdBS7+8tT8wuvsXRKH7pcg36YNpKas
 ibNNQkJR4fTywPw+jSXz9lVROteAyARe5njS3kKAknj9Yin+cpB86MtOA A==;
X-CSE-ConnectionGUID: jIRJSNl6RVWmW16BBxMlKA==
X-CSE-MsgGUID: XxI7QpOEShWajcGeuNCKoA==
X-IronPort-AV: E=McAfee;i="6700,10204,11213"; a="27004823"
X-IronPort-AV: E=Sophos;i="6.11,174,1725346800"; d="scan'208";a="27004823"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Oct 2024 02:43:10 -0700
X-CSE-ConnectionGUID: O4wAEbQkTLmaeFPky2TQRA==
X-CSE-MsgGUID: PWK+fE28TIuwbifN1Tu/fw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,174,1725346800"; d="scan'208";a="79062025"
Received: from soc-5cg4213gc7.clients.intel.com (HELO [10.66.114.183])
 ([10.66.114.183])
 by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Oct 2024 02:43:05 -0700
Message-ID: <6523649b-9143-42d8-b301-a143088530b9@intel.com>
Date: Thu, 3 Oct 2024 15:13:02 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] drm/bridge: sii902x: Provide data-lines property to
 input endpoint
To: Wadim Egorov <w.egorov@phytec.de>, andrzej.hajda@intel.com,
 neil.armstrong@linaro.org, rfoss@kernel.org
Cc: Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se,
 jernej.skrabec@gmail.com, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com, simona@ffwll.ch,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, bbrezillon@kernel.org, conor+dt@kernel.org,
 krzk+dt@kernel.org, robh@kernel.org, upstream@lists.phytec.de
References: <20241003082006.2728617-1-w.egorov@phytec.de>
Content-Language: en-US
From: Aradhya Bhatia <aradhya.bhatia@intel.com>
In-Reply-To: <20241003082006.2728617-1-w.egorov@phytec.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Wadim,

Thanks for the patch.

Probably a nit, but the dt-binding patch should come before the driver
patch.

On 03-10-2024 13:50, Wadim Egorov wrote:
> Introduce a data-lines property to define the number of parallel RGB
> input pins connected to the transmitter. The input bus formats are updated
> accordingly. If the property is not specified, default to 24 data lines.
> 
> Signed-off-by: Wadim Egorov <w.egorov@phytec.de>
> ---
>  drivers/gpu/drm/bridge/sii902x.c | 27 ++++++++++++++++++++++++++-
>  1 file changed, 26 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/bridge/sii902x.c b/drivers/gpu/drm/bridge/sii902x.c
> index 7f91b0db161e..3565c3533597 100644
> --- a/drivers/gpu/drm/bridge/sii902x.c
> +++ b/drivers/gpu/drm/bridge/sii902x.c
> @@ -180,6 +180,8 @@ struct sii902x {
>  	struct gpio_desc *reset_gpio;
>  	struct i2c_mux_core *i2cmux;
>  	bool sink_is_hdmi;
> +	u32 pd_lines; /* number of Parallel Port Input Data Lines */
> +
>  	/*
>  	 * Mutex protects audio and video functions from interfering
>  	 * each other, by keeping their i2c command sequences atomic.
> @@ -477,6 +479,8 @@ static u32 *sii902x_bridge_atomic_get_input_bus_fmts(struct drm_bridge *bridge,
>  						     u32 output_fmt,
>  						     unsigned int *num_input_fmts)
>  {
> +
> +	struct sii902x *sii902x = bridge_to_sii902x(bridge);
>  	u32 *input_fmts;
>  
>  	*num_input_fmts = 0;
> @@ -485,7 +489,19 @@ static u32 *sii902x_bridge_atomic_get_input_bus_fmts(struct drm_bridge *bridge,
>  	if (!input_fmts)
>  		return NULL;
>  
> -	input_fmts[0] = MEDIA_BUS_FMT_RGB888_1X24;
> +	switch (sii902x->pd_lines) {
> +	case 16:
> +		input_fmts[0] = MEDIA_BUS_FMT_RGB565_1X16;
> +		break;
> +	case 18:
> +		input_fmts[0] = MEDIA_BUS_FMT_RGB666_1X18;
> +		break;
> +	default:

For backward compatibility - in cases where the property is absent - you
have already defaulted sii902x->pd_lines to 24 below, which I think is
the right way.

So, the default case should be kept separately, as an error case -
which should then return back NULL / num_input_fmts = 0.

> +	case 24:
> +		input_fmts[0] = MEDIA_BUS_FMT_RGB888_1X24;
> +		break;
> +	}
> +
>  	*num_input_fmts = 1;
>  
>  	return input_fmts;
> @@ -1167,6 +1183,15 @@ static int sii902x_probe(struct i2c_client *client)
>  		return PTR_ERR(sii902x->reset_gpio);
>  	}
>
> +	endpoint = of_graph_get_endpoint_by_regs(dev->of_node, 0, -1);
> +	if (endpoint) {
> +		ret = of_property_read_u32(endpoint, "data-lines", &sii902x->pd_lines);
> +		if (ret) {
> +			dev_dbg(dev, "Could not get data-lines, fallback to 24 data-lines\n");
> +			sii902x->pd_lines = 24;
> +		}
> +	}
> +
>  	endpoint = of_graph_get_endpoint_by_regs(dev->of_node, 1, -1);
>  	if (endpoint) {
>  		struct device_node *remote = of_graph_get_remote_port_parent(endpoint);

--
Regards
Aradhya

