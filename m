Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C3409704640
	for <lists+dri-devel@lfdr.de>; Tue, 16 May 2023 09:24:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0FB2210E300;
	Tue, 16 May 2023 07:24:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com
 [IPv6:2a00:1450:4864:20::42c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8E7D210E300
 for <dri-devel@lists.freedesktop.org>; Tue, 16 May 2023 07:24:28 +0000 (UTC)
Received: by mail-wr1-x42c.google.com with SMTP id
 ffacd0b85a97d-306f2b42a86so9021812f8f.3
 for <dri-devel@lists.freedesktop.org>; Tue, 16 May 2023 00:24:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1684221866; x=1686813866;
 h=content-transfer-encoding:in-reply-to:organization:references:cc:to
 :content-language:subject:reply-to:from:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to;
 bh=mriKUD+ePrXG2DRWD5gePTJ4sodjlKWYwwduKOxs8DI=;
 b=ST7RVOqLOXdhN4AiR9ZC4VSzODuLCFiQUdBe6NgMcrufpcWwPo6JVRYDK5b+vltIZP
 1kfmvNZ4dqGp0NINctE6TF4Uho6L+j7NuBrkGaybeHGliwi9c4ARwxdSfYI067feVfJ6
 PLs1SyMVNcrw2cVCuXKWzPQJ4tucHmRMrBQi0yNye/HqqcEl2JBTY79hrHoIbNA/VO/m
 8yx/rM9qno6IF7169ccBU5OoNTegeJqbnQXGOfD1IlaIcx+/FgsFkq020uoXm/H+r9WM
 DSdn34eAIwgarpCEaQs/evNpITPAlBQrwwxCkWgMqRaMIGDGbEV4vXE+kEoNifFU31+T
 WGsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1684221866; x=1686813866;
 h=content-transfer-encoding:in-reply-to:organization:references:cc:to
 :content-language:subject:reply-to:from:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=mriKUD+ePrXG2DRWD5gePTJ4sodjlKWYwwduKOxs8DI=;
 b=A/Cf32hqXB68pasFmaDovGs7zk/2/sFf36HA4GiyYT0l3nRdQACrELm/l5nmnDzFCi
 e2IHPYJckKWtoU+8Di+1qAx2RMM3C8bc8RLFYt80Q2H47l2KW3VTGfL7ideG+oaY7zRJ
 g0Ct/9eHO30XNkzAOk7ow2MnHJM9hLoiNmMP98NPqK476tA6pJT9Qr7yzgoW0JRxQyxH
 ea16SxQ+Ctv5dEfqD7Qynxot0Re/544vYP2+UggqVGLQ6svmpvUsP9c7gtmE0yTJEsIa
 xes3OTREVfBLR+rTw4GnpuyO7Wg/KLzuXPpgqA6QmjixSR/iS4M+5eKTRY2SSbqlL9EN
 P8yA==
X-Gm-Message-State: AC+VfDylUAwsgOxF7AH6Vp+ao92pzgNPEY2VGMlD+w98KufmQ3roV7Ss
 GjHWaG2rPsfo/RYSSnfUVELmwA==
X-Google-Smtp-Source: ACHHUZ5eFVgdU2s3k3MqpDCk0kG6vETBeL0nlTrXDSSeUAK0qUoOayOQCHMXkBKW56cq1tLSWvBWMQ==
X-Received: by 2002:adf:f245:0:b0:306:2d28:d556 with SMTP id
 b5-20020adff245000000b003062d28d556mr22320151wrp.34.1684221866463; 
 Tue, 16 May 2023 00:24:26 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:982:cbb0:86be:97a:a043:77a8?
 ([2a01:e0a:982:cbb0:86be:97a:a043:77a8])
 by smtp.gmail.com with ESMTPSA id
 r7-20020adff107000000b003012030a0c6sm1548409wro.18.2023.05.16.00.24.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 16 May 2023 00:24:25 -0700 (PDT)
Message-ID: <b43f0808-8ac8-746f-6cbc-5396722261aa@linaro.org>
Date: Tue, 16 May 2023 09:24:24 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.1
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH v6 4/8] drm/bridge: mhdp8546: Set input_bus_flags from
 atomic_check
Content-Language: en-US
To: Aradhya Bhatia <a-bhatia1@ti.com>, Tomi Valkeinen <tomba@kernel.org>,
 Jyri Sarha <jyri.sarha@iki.fi>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>, Robert Foss <rfoss@kernel.org>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Rahul T R <r-ravikumar@ti.com>, Swapnil Jakhade <sjakhade@cadence.com>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 Francesco Dolcini <francesco@dolcini.it>
References: <20230509093036.3303-1-a-bhatia1@ti.com>
 <20230509093036.3303-5-a-bhatia1@ti.com>
Organization: Linaro Developer Services
In-Reply-To: <20230509093036.3303-5-a-bhatia1@ti.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
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
Reply-To: neil.armstrong@linaro.org
Cc: Nishanth Menon <nm@ti.com>, Jayesh Choudhary <j-choudhary@ti.com>,
 Vignesh Raghavendra <vigneshr@ti.com>, Devarsh Thakkar <devarsht@ti.com>,
 Linux Kernel List <linux-kernel@vger.kernel.org>,
 DRI Development List <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 09/05/2023 11:30, Aradhya Bhatia wrote:
> From: Nikhil Devshatwar <nikhil.nd@ti.com>
> 
> input_bus_flags are specified in drm_bridge_timings (legacy) as well
> as drm_bridge_state->input_bus_cfg.flags
> 
> The flags from the timings will be deprecated. Bridges are supposed
> to validate and set the bridge state flags from atomic_check.
> 
> Signed-off-by: Nikhil Devshatwar <nikhil.nd@ti.com>
> [a-bhatia1: replace timings in cdns_mhdp_platform_info by input_bus_flags]
> Signed-off-by: Aradhya Bhatia <a-bhatia1@ti.com>
> ---
> 
> Notes:
> 
>      changes from v5:
>      * removed the wrongly addded return statement in tfp410 driver.
>      * replaced the timings field in cdns_mhdp_platform_info by
>        input_bus_flags field, in order to get rid of bridge->timings
>        altogether.
> 
>   drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-core.c  | 11 ++++++++---
>   drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-core.h  |  2 +-
>   drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-j721e.c |  9 ++++-----
>   drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-j721e.h |  2 +-
>   4 files changed, 14 insertions(+), 10 deletions(-)
> 
> diff --git a/drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-core.c b/drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-core.c
> index 623e4235c94f..a677b1267525 100644
> --- a/drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-core.c
> +++ b/drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-core.c
> @@ -2189,6 +2189,13 @@ static int cdns_mhdp_atomic_check(struct drm_bridge *bridge,
>   		return -EINVAL;
>   	}
>   
> +	/*
> +	 * There might be flags negotiation supported in future.
> +	 * Set the bus flags in atomic_check statically for now.
> +	 */
> +	if (mhdp->info)
> +		bridge_state->input_bus_cfg.flags = *mhdp->info->input_bus_flags;
> +
>   	mutex_unlock(&mhdp->link_mutex);
>   	return 0;
>   }
> @@ -2554,8 +2561,6 @@ static int cdns_mhdp_probe(struct platform_device *pdev)
>   	mhdp->bridge.ops = DRM_BRIDGE_OP_DETECT | DRM_BRIDGE_OP_EDID |
>   			   DRM_BRIDGE_OP_HPD;
>   	mhdp->bridge.type = DRM_MODE_CONNECTOR_DisplayPort;
> -	if (mhdp->info)
> -		mhdp->bridge.timings = mhdp->info->timings;

Won't this cause a breakage because at this point in time bridge.timings->input_bus_flags
seems to be still used by tidss right ?

Neil

>   
>   	ret = phy_init(mhdp->phy);
>   	if (ret) {
> @@ -2642,7 +2647,7 @@ static const struct of_device_id mhdp_ids[] = {
>   #ifdef CONFIG_DRM_CDNS_MHDP8546_J721E
>   	{ .compatible = "ti,j721e-mhdp8546",
>   	  .data = &(const struct cdns_mhdp_platform_info) {
> -		  .timings = &mhdp_ti_j721e_bridge_timings,
> +		  .input_bus_flags = &mhdp_ti_j721e_bridge_input_bus_flags,
>   		  .ops = &mhdp_ti_j721e_ops,
>   	  },
>   	},
> diff --git a/drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-core.h b/drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-core.h
> index bedddd510d17..bad2fc0c7306 100644
> --- a/drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-core.h
> +++ b/drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-core.h
> @@ -336,7 +336,7 @@ struct cdns_mhdp_bridge_state {
>   };
>   
>   struct cdns_mhdp_platform_info {
> -	const struct drm_bridge_timings *timings;
> +	const u32 *input_bus_flags;
>   	const struct mhdp_platform_ops *ops;
>   };
>   
> diff --git a/drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-j721e.c b/drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-j721e.c
> index dfe1b59514f7..12d04be4e242 100644
> --- a/drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-j721e.c
> +++ b/drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-j721e.c
> @@ -71,8 +71,7 @@ const struct mhdp_platform_ops mhdp_ti_j721e_ops = {
>   	.disable = cdns_mhdp_j721e_disable,
>   };
>   
> -const struct drm_bridge_timings mhdp_ti_j721e_bridge_timings = {
> -	.input_bus_flags = DRM_BUS_FLAG_PIXDATA_SAMPLE_NEGEDGE |
> -			   DRM_BUS_FLAG_SYNC_SAMPLE_NEGEDGE |
> -			   DRM_BUS_FLAG_DE_HIGH,
> -};
> +const u32
> +mhdp_ti_j721e_bridge_input_bus_flags = DRM_BUS_FLAG_PIXDATA_SAMPLE_NEGEDGE |
> +				       DRM_BUS_FLAG_SYNC_SAMPLE_NEGEDGE |
> +				       DRM_BUS_FLAG_DE_HIGH;
> diff --git a/drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-j721e.h b/drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-j721e.h
> index 97d20d115a24..5ddca07a4255 100644
> --- a/drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-j721e.h
> +++ b/drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-j721e.h
> @@ -14,6 +14,6 @@
>   struct mhdp_platform_ops;
>   
>   extern const struct mhdp_platform_ops mhdp_ti_j721e_ops;
> -extern const struct drm_bridge_timings mhdp_ti_j721e_bridge_timings;
> +extern const u32 mhdp_ti_j721e_bridge_input_bus_flags;
>   
>   #endif /* !CDNS_MHDP8546_J721E_H */

