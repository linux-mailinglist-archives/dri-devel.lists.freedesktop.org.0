Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B62A8D2996
	for <lists+dri-devel@lfdr.de>; Wed, 29 May 2024 02:48:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 35BC710E102;
	Wed, 29 May 2024 00:48:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="mVerHYnh";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C334110FEC6
 for <dri-devel@lists.freedesktop.org>; Wed, 29 May 2024 00:47:59 +0000 (UTC)
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi
 [81.175.209.231])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 3BD489CA;
 Wed, 29 May 2024 02:47:55 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1716943675;
 bh=yNW3rG6pZ4UL9Ggbp80ChOyff9I5y5PiTC7mr1zcTF4=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=mVerHYnhPHx9r33n0Y6mi4ZsEFcEjZxG0fPinytbQgXe7ziqo2Oh3i/ZkPn8dkdTM
 KfbBQP98Q9F2BafkrE0C92FvVqKAkTr8bSyr9uyTvEVpkFTwmILnR+nkbSyAGbVBr0
 GH1SCrTNVi506VZMGPHKg0Jq9g5u9DXgwuydSfjw=
Date: Wed, 29 May 2024 03:47:46 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: prabhakar.csengg@gmail.com,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Claudiu Beznea <claudiu.beznea@tuxon.dev>,
 Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@gmail.com>,
 Eugen Hristev <eugen.hristev@collabora.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Helge Deller <deller@gmx.de>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Maxime Ripard <mripard@kernel.org>, Michal Simek <michal.simek@amd.com>,
 Nicolas Ferre <nicolas.ferre@microchip.com>,
 Rob Herring <robh+dt@kernel.org>,
 Suzuki K Poulose <suzuki.poulose@arm.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
 coresight@lists.linaro.org, dri-devel@lists.freedesktop.org,
 linux-arm-kernel@lists.infradead.org, linux-fbdev@vger.kernel.org,
 linux-media@vger.kernel.org, linux-staging@lists.linux.dev
Subject: Re: [PATCH v2 resend 4/8] media: platform: ti: use
 for_each_endpoint_of_node()
Message-ID: <20240529004746.GD1436@pendragon.ideasonboard.com>
References: <87ikyx4hm1.wl-kuninori.morimoto.gx@renesas.com>
 <87cyp54hky.wl-kuninori.morimoto.gx@renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <87cyp54hky.wl-kuninori.morimoto.gx@renesas.com>
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

Hello Morimoto-san,

Thank you for the patch.

On Tue, May 28, 2024 at 11:55:42PM +0000, Kuninori Morimoto wrote:
> We already have for_each_endpoint_of_node(), don't use
> of_graph_get_next_endpoint() directly. Replace it.
> 
> Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>

Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>

> ---
>  drivers/media/platform/ti/am437x/am437x-vpfe.c   | 12 +++++-------
>  drivers/media/platform/ti/davinci/vpif_capture.c | 12 ++++++------
>  2 files changed, 11 insertions(+), 13 deletions(-)
> 
> diff --git a/drivers/media/platform/ti/am437x/am437x-vpfe.c b/drivers/media/platform/ti/am437x/am437x-vpfe.c
> index 77e12457d1495..009ff68a2b43c 100644
> --- a/drivers/media/platform/ti/am437x/am437x-vpfe.c
> +++ b/drivers/media/platform/ti/am437x/am437x-vpfe.c
> @@ -2287,7 +2287,7 @@ static const struct v4l2_async_notifier_operations vpfe_async_ops = {
>  static struct vpfe_config *
>  vpfe_get_pdata(struct vpfe_device *vpfe)
>  {
> -	struct device_node *endpoint = NULL;
> +	struct device_node *endpoint;
>  	struct device *dev = vpfe->pdev;
>  	struct vpfe_subdev_info *sdinfo;
>  	struct vpfe_config *pdata;
> @@ -2306,14 +2306,11 @@ vpfe_get_pdata(struct vpfe_device *vpfe)
>  	if (!pdata)
>  		return NULL;
>  
> -	for (i = 0; ; i++) {
> +	i = 0;
> +	for_each_endpoint_of_node(dev->of_node, endpoint) {
>  		struct v4l2_fwnode_endpoint bus_cfg = { .bus_type = 0 };
>  		struct device_node *rem;
>  
> -		endpoint = of_graph_get_next_endpoint(dev->of_node, endpoint);
> -		if (!endpoint)
> -			break;
> -
>  		sdinfo = &pdata->sub_devs[i];
>  		sdinfo->grp_id = 0;
>  
> @@ -2371,9 +2368,10 @@ vpfe_get_pdata(struct vpfe_device *vpfe)
>  		of_node_put(rem);
>  		if (IS_ERR(pdata->asd[i]))
>  			goto cleanup;
> +
> +		i++;
>  	}
>  
> -	of_node_put(endpoint);
>  	return pdata;
>  
>  cleanup:
> diff --git a/drivers/media/platform/ti/davinci/vpif_capture.c b/drivers/media/platform/ti/davinci/vpif_capture.c
> index c28794b6677b7..078ae11cd0787 100644
> --- a/drivers/media/platform/ti/davinci/vpif_capture.c
> +++ b/drivers/media/platform/ti/davinci/vpif_capture.c
> @@ -1517,16 +1517,12 @@ vpif_capture_get_pdata(struct platform_device *pdev,
>  	if (!pdata->subdev_info)
>  		return NULL;
>  
> -	for (i = 0; i < VPIF_CAPTURE_NUM_CHANNELS; i++) {
> +	i = 0;
> +	for_each_endpoint_of_node(pdev->dev.of_node, endpoint) {
>  		struct v4l2_fwnode_endpoint bus_cfg = { .bus_type = 0 };
>  		unsigned int flags;
>  		int err;
>  
> -		endpoint = of_graph_get_next_endpoint(pdev->dev.of_node,
> -						      endpoint);
> -		if (!endpoint)
> -			break;
> -
>  		rem = of_graph_get_remote_port_parent(endpoint);
>  		if (!rem) {
>  			dev_dbg(&pdev->dev, "Remote device at %pOF not found\n",
> @@ -1577,6 +1573,10 @@ vpif_capture_get_pdata(struct platform_device *pdev,
>  			goto err_cleanup;
>  
>  		of_node_put(rem);
> +
> +		i++;
> +		if (i >= VPIF_CAPTURE_NUM_CHANNELS)
> +			break;
>  	}
>  
>  done:

-- 
Regards,

Laurent Pinchart
