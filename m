Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5EB442D9D7A
	for <lists+dri-devel@lfdr.de>; Mon, 14 Dec 2020 18:21:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4406189C19;
	Mon, 14 Dec 2020 17:21:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 3644 seconds by postgrey-1.36 at gabe;
 Mon, 14 Dec 2020 17:21:05 UTC
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 04C5C89C19
 for <dri-devel@lists.freedesktop.org>; Mon, 14 Dec 2020 17:21:05 +0000 (UTC)
Received: from [192.168.0.217]
 (cpc89244-aztw30-2-0-cust3082.18-1.cable.virginm.net [86.31.172.11])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 3F5F296;
 Mon, 14 Dec 2020 18:21:03 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1607966463;
 bh=To6w7sMxRq2uR6JgWO87fqq2ukTxnmUqc85pHu7t0eU=;
 h=Reply-To:Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=EghpsyH1j4vA/s892I/55yRfC6nGc3rafiFy8f08tf/raXQRixXdS628UDARfshtN
 GuY/KArjAnLMxRPEu2GTFqpNn1Ung6DGk2CRvxRYnkvrUa9bz0xySAdT9ugDPt4BVG
 iYonCaegop62OBiaOhKqFOc7lMQ8WNaoUCFOPOcQ=
Subject: Re: [PATCH 8/9] drm: rcar-du: Skip encoder allocation for LVDS1 in
 dual-link mode
To: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
 dri-devel@lists.freedesktop.org
References: <20201204220139.15272-1-laurent.pinchart+renesas@ideasonboard.com>
 <20201204220139.15272-9-laurent.pinchart+renesas@ideasonboard.com>
From: Kieran Bingham <kieran.bingham@ideasonboard.com>
Autocrypt: addr=kieran.bingham@ideasonboard.com; keydata=
 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
 WZw01QYHU/GUV/zHJSFk
Organization: Ideas on Board
Message-ID: <5f4d5bf8-44b0-7fe8-5833-e2a3ef1fc8cf@ideasonboard.com>
Date: Mon, 14 Dec 2020 17:21:00 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201204220139.15272-9-laurent.pinchart+renesas@ideasonboard.com>
Content-Language: en-GB
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
Reply-To: kieran.bingham@ideasonboard.com
Cc: linux-renesas-soc@vger.kernel.org,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Laurent,

On 04/12/2020 22:01, Laurent Pinchart wrote:
> The rcar-du driver skips registration of the encoder for the LVDS1
> output when LVDS is used in dual-link mode, as the LVDS0 and LVDS1 links
> are bundled and handled through the LVDS0 output. It however still
> allocates the encoder and immediately destroys it, which is pointless.
> Skip allocation of the encoder altogether in that case.
> 
> Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>

I love it when re-ordering code simplifies all the error conditions.

Reviewed-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>

> ---
>  drivers/gpu/drm/rcar-du/rcar_du_encoder.c | 51 ++++++++++-------------
>  1 file changed, 22 insertions(+), 29 deletions(-)
> 
> diff --git a/drivers/gpu/drm/rcar-du/rcar_du_encoder.c b/drivers/gpu/drm/rcar-du/rcar_du_encoder.c
> index e4f35a88d00f..49c0b27e2f5a 100644
> --- a/drivers/gpu/drm/rcar-du/rcar_du_encoder.c
> +++ b/drivers/gpu/drm/rcar-du/rcar_du_encoder.c
> @@ -65,17 +65,6 @@ int rcar_du_encoder_init(struct rcar_du_device *rcdu,
>  	struct drm_bridge *bridge;
>  	int ret;
>  
> -	renc = kzalloc(sizeof(*renc), GFP_KERNEL);
> -	if (renc == NULL)
> -		return -ENOMEM;
> -
> -	rcdu->encoders[output] = renc;
> -	renc->output = output;
> -	encoder = rcar_encoder_to_drm_encoder(renc);
> -
> -	dev_dbg(rcdu->dev, "initializing encoder %pOF for output %u\n",
> -		enc_node, output);
> -
>  	/*
>  	 * Locate the DRM bridge from the DT node. For the DPAD outputs, if the
>  	 * DT node has a single port, assume that it describes a panel and
> @@ -86,23 +75,17 @@ int rcar_du_encoder_init(struct rcar_du_device *rcdu,
>  	    rcar_du_encoder_count_ports(enc_node) == 1) {
>  		struct drm_panel *panel = of_drm_find_panel(enc_node);
>  
> -		if (IS_ERR(panel)) {
> -			ret = PTR_ERR(panel);
> -			goto error;
> -		}
> +		if (IS_ERR(panel))
> +			return PTR_ERR(panel);
>  
>  		bridge = devm_drm_panel_bridge_add_typed(rcdu->dev, panel,
>  							 DRM_MODE_CONNECTOR_DPI);
> -		if (IS_ERR(bridge)) {
> -			ret = PTR_ERR(bridge);
> -			goto error;
> -		}
> +		if (IS_ERR(bridge))
> +			return PTR_ERR(bridge);
>  	} else {
>  		bridge = of_drm_find_bridge(enc_node);
> -		if (!bridge) {
> -			ret = -EPROBE_DEFER;
> -			goto error;
> -		}
> +		if (!bridge)
> +			return -EPROBE_DEFER;
>  
>  		if (output == RCAR_DU_OUTPUT_LVDS0 ||
>  		    output == RCAR_DU_OUTPUT_LVDS1)
> @@ -110,16 +93,26 @@ int rcar_du_encoder_init(struct rcar_du_device *rcdu,
>  	}
>  
>  	/*
> -	 * On Gen3 skip the LVDS1 output if the LVDS1 encoder is used as a
> -	 * companion for LVDS0 in dual-link mode.
> +	 * Create and initialize the encoder. On Gen3 skip the LVDS1 output if
> +	 * the LVDS1 encoder is used as a companion for LVDS0 in dual-link
> +	 * mode.
>  	 */
>  	if (rcdu->info->gen >= 3 && output == RCAR_DU_OUTPUT_LVDS1) {
> -		if (rcar_lvds_dual_link(bridge)) {
> -			ret = -ENOLINK;
> -			goto error;
> -		}
> +		if (rcar_lvds_dual_link(bridge))
> +			return -ENOLINK;
>  	}
>  
> +	renc = kzalloc(sizeof(*renc), GFP_KERNEL);
> +	if (renc == NULL)
> +		return -ENOMEM;
> +
> +	rcdu->encoders[output] = renc;
> +	renc->output = output;
> +	encoder = rcar_encoder_to_drm_encoder(renc);
> +
> +	dev_dbg(rcdu->dev, "initializing encoder %pOF for output %u\n",
> +		enc_node, output);
> +
>  	ret = drm_encoder_init(&rcdu->ddev, encoder, &rcar_du_encoder_funcs,
>  			       DRM_MODE_ENCODER_NONE, NULL);
>  	if (ret < 0)
> 

-- 
Regards
--
Kieran
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
