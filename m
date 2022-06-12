Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0ABEF547A08
	for <lists+dri-devel@lfdr.de>; Sun, 12 Jun 2022 14:15:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0C75710E28F;
	Sun, 12 Jun 2022 12:15:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailrelay1-1.pub.mailoutpod1-cph3.one.com
 (mailrelay1-1.pub.mailoutpod1-cph3.one.com [46.30.210.182])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 744DF10E28F
 for <dri-devel@lists.freedesktop.org>; Sun, 12 Jun 2022 12:15:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ravnborg.org; s=rsa1;
 h=in-reply-to:content-type:mime-version:references:message-id:subject:cc:to:
 from:date:from;
 bh=JVt5tbU0/8sEzbi/IEhtvK+6s+xYi0FQvxkJCa49khQ=;
 b=Da7Wth7f0VkN8k+aw/ONqeAmJM+2Uwm0m/E6BPmf16T757XosdDMUYHKWIf4h6ERvZQbzbQvv6dDK
 vrZ1hyndcBtlpVCMqybaYzPzkiFahS9dZJ9peQrV64fQ7mrVMIVCqMgt4tgGfzSASbhFVo8Ndr5t8w
 EC2K7g/exubQEJvZv6xemlIe9fWFgvDuoPBBNSvzrI/0tJZFrxctDyq0VwoHysLGdv+tn2ngLIlwGr
 wxDEqOtspyULtZXsHW6cXsu1/r04wXg2CiRXEJTrGG+fQ8IDjPvuZjNpsrayWJvXhAi3TQ6Iw0w0jt
 uMmdzsk5ryoI4Uq76eTtOnol9Fj3a9w==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed;
 d=ravnborg.org; s=ed1;
 h=in-reply-to:content-type:mime-version:references:message-id:subject:cc:to:
 from:date:from;
 bh=JVt5tbU0/8sEzbi/IEhtvK+6s+xYi0FQvxkJCa49khQ=;
 b=1itWjXg6o/GonoX+30q7nhEdTCr+bkUGIsrvFm+rjJI0CpJDTZLdvYY0+HDaw+Uo9Ytz4ApfobkDs
 urwjuuVCw==
X-HalOne-Cookie: 4104859ebcfa399314616d0c165037d7b4600ac8
X-HalOne-ID: 4cd85b3a-ea49-11ec-a6c1-d0431ea8a283
Received: from mailproxy4.cst.dirpod3-cph3.one.com
 (80-162-45-141-cable.dk.customer.tdc.net [80.162.45.141])
 by mailrelay1.pub.mailoutpod1-cph3.one.com (Halon) with ESMTPSA
 id 4cd85b3a-ea49-11ec-a6c1-d0431ea8a283;
 Sun, 12 Jun 2022 12:15:08 +0000 (UTC)
Date: Sun, 12 Jun 2022 14:15:06 +0200
From: Sam Ravnborg <sam@ravnborg.org>
To: Marek Vasut <marex@denx.de>
Subject: Re: [PATCH v3] drm/bridge: ti-sn65dsi83: Convert to
 drm_of_get_data_lanes_count
Message-ID: <YqXYyrQG2LKtnRet@ravnborg.org>
References: <20220612102947.13912-1-marex@denx.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220612102947.13912-1-marex@denx.de>
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
Cc: robert.foss@linaro.org, Andrzej Hajda <andrzej.hajda@intel.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 dri-devel@lists.freedesktop.org, Maxime Ripard <maxime@cerno.tech>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Marek,

On Sun, Jun 12, 2022 at 12:29:47PM +0200, Marek Vasut wrote:
> Convert driver to use this new helper to standardize
> OF "data-lanes" parsing.
> 
> Reviewed-by: Andrzej Hajda <andrzej.hajda@intel.com>
> Signed-off-by: Marek Vasut <marex@denx.de>
> Cc: Andrzej Hajda <andrzej.hajda@intel.com>
> Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> Cc: Lucas Stach <l.stach@pengutronix.de>
> Cc: Maxime Ripard <maxime@cerno.tech>
> Cc: Robert Foss <robert.foss@linaro.org>
> Cc: Sam Ravnborg <sam@ravnborg.org>
> To: dri-devel@lists.freedesktop.org

Looks fine.

I wondered why the _ep variant could not be used, but endpoint is
required later and there is no need to look it up twice.

Acked-by: Sam Ravnborg <sam@ravnborg.org>

	Sam

> ---
> V2: - Rename drm_of_get_data_lanes{,_ep} to drm_of_get_data_lanes_count{,_ep}
>     - Add RB from Andrzej
> V3: - Rebase on latest next
> ---
>  drivers/gpu/drm/bridge/ti-sn65dsi83.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/bridge/ti-sn65dsi83.c b/drivers/gpu/drm/bridge/ti-sn65dsi83.c
> index 8bf99b32776e2..b27c0d7c451ad 100644
> --- a/drivers/gpu/drm/bridge/ti-sn65dsi83.c
> +++ b/drivers/gpu/drm/bridge/ti-sn65dsi83.c
> @@ -620,7 +620,7 @@ static int sn65dsi83_host_attach(struct sn65dsi83 *ctx)
>  	int dsi_lanes, ret;
>  
>  	endpoint = of_graph_get_endpoint_by_regs(dev->of_node, 0, -1);
> -	dsi_lanes = of_property_count_u32_elems(endpoint, "data-lanes");
> +	dsi_lanes = drm_of_get_data_lanes_count(endpoint, 1, 4);
>  	host_node = of_graph_get_remote_port_parent(endpoint);
>  	host = of_find_mipi_dsi_host_by_node(host_node);
>  	of_node_put(host_node);
> -- 
> 2.35.1
