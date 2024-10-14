Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 09DB099C622
	for <lists+dri-devel@lfdr.de>; Mon, 14 Oct 2024 11:44:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BDB9310E116;
	Mon, 14 Oct 2024 09:44:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=microchip.com header.i=@microchip.com header.b="C1iL++/G";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com
 [68.232.154.123])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2ABB610E116
 for <dri-devel@lists.freedesktop.org>; Mon, 14 Oct 2024 09:44:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1728899044; x=1760435044;
 h=message-id:date:mime-version:subject:to:references:from:
 in-reply-to:content-transfer-encoding;
 bh=d8mmBTMzQw0eATTs8K+Ognc0TOnmxw6QIf4V8eWf3h0=;
 b=C1iL++/GyXVryYfccoIetErDrpw0tlLqH9wWEV+qGwI/mL/AKZdXb8IN
 8TGDUvjc14qxTJRyxUvmcfsBbogHhLvyhLIjmc+0jMqz8BzaDpGuVsqry
 OLCd9px+TKY17u+1e/yQEhn45s3xkAxRFyu+znLG1z/CZWY0VrH8CfEvT
 QrxBOxoSJmuLvMNyFUIlZR0Ff2sbicQylmucNorWHbTwmqg9J729FshWK
 OZZIJXxFXxUSwkrw8fU9F2M97YmFeuuBVjZw2l33p9EY8EO9ccekPHo6L
 x8lSTcu6AsE6/STsg/iWE2kbNvHzmZBxz8HH9GmU53FoLl6r8IJjXzVXJ Q==;
X-CSE-ConnectionGUID: nSGur+sPSS29M1xsOrSxxQ==
X-CSE-MsgGUID: sfdqwUpWRm6ZzStgyyQ/PA==
X-IronPort-AV: E=Sophos;i="6.11,202,1725346800"; d="scan'208";a="32778525"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
 by esa4.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 14 Oct 2024 02:44:02 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Mon, 14 Oct 2024 02:44:00 -0700
Received: from [10.159.245.205] (10.10.85.11) by chn-vm-ex03.mchp-main.com
 (10.10.85.151) with Microsoft SMTP Server id 15.1.2507.35 via Frontend
 Transport; Mon, 14 Oct 2024 02:43:58 -0700
Message-ID: <16e23ecd-24e3-4d6e-a336-da3c4308011d@microchip.com>
Date: Mon, 14 Oct 2024 11:44:10 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm: atmel-hlcdc: update the LCDC_ATTRE register in plane
 atomic_disable
Content-Language: en-US, fr-FR
To: Manikandan Muralidharan <manikandan.m@microchip.com>, <sam@ravnborg.org>, 
 <bbrezillon@kernel.org>, <maarten.lankhorst@linux.intel.com>,
 <mripard@kernel.org>, <tzimmermann@suse.de>, <airlied@gmail.com>,
 <simona@ffwll.ch>, <alexandre.belloni@bootlin.com>,
 <claudiu.beznea@tuxon.dev>, <dri-devel@lists.freedesktop.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>
References: <20241014064644.292943-1-manikandan.m@microchip.com>
From: Nicolas Ferre <nicolas.ferre@microchip.com>
Organization: microchip
In-Reply-To: <20241014064644.292943-1-manikandan.m@microchip.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
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

On 14/10/2024 at 08:46, Manikandan Muralidharan wrote:
> update the LCDC_ATTRE register in drm plane atomic_disable to handle
> the configuration changes of each layer when a plane is disabled.
> 
> Signed-off-by: Manikandan Muralidharan <manikandan.m@microchip.com>

Reviewed-by: Nicolas Ferre <nicolas.ferre@microchip.com>

Thanks Mani. Best regards,
   Nicolas

> ---
>   drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_dc.h    |  3 ++-
>   drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_plane.c | 17 ++++++++++++++---
>   2 files changed, 16 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_dc.h b/drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_dc.h
> index e1a0bb24b511..53d47f01db0b 100644
> --- a/drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_dc.h
> +++ b/drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_dc.h
> @@ -378,7 +378,8 @@ struct atmel_lcdc_dc_ops {
>   	void (*lcdc_update_buffers)(struct atmel_hlcdc_plane *plane,
>   				    struct atmel_hlcdc_plane_state *state,
>   				    u32 sr, int i);
> -	void (*lcdc_atomic_disable)(struct atmel_hlcdc_plane *plane);
> +	void (*lcdc_atomic_disable)(struct atmel_hlcdc_plane *plane,
> +				    struct atmel_hlcdc_dc *dc);
>   	void (*lcdc_update_general_settings)(struct atmel_hlcdc_plane *plane,
>   					     struct atmel_hlcdc_plane_state *state);
>   	void (*lcdc_atomic_update)(struct atmel_hlcdc_plane *plane,
> diff --git a/drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_plane.c b/drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_plane.c
> index 4a7ba0918eca..4bcaf2cd7672 100644
> --- a/drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_plane.c
> +++ b/drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_plane.c
> @@ -816,7 +816,8 @@ static int atmel_hlcdc_plane_atomic_check(struct drm_plane *p,
>   	return 0;
>   }
>   
> -static void atmel_hlcdc_atomic_disable(struct atmel_hlcdc_plane *plane)
> +static void atmel_hlcdc_atomic_disable(struct atmel_hlcdc_plane *plane,
> +				       struct atmel_hlcdc_dc *dc)
>   {
>   	/* Disable interrupts */
>   	atmel_hlcdc_layer_write_reg(&plane->layer, ATMEL_HLCDC_LAYER_IDR,
> @@ -832,7 +833,8 @@ static void atmel_hlcdc_atomic_disable(struct atmel_hlcdc_plane *plane)
>   	atmel_hlcdc_layer_read_reg(&plane->layer, ATMEL_HLCDC_LAYER_ISR);
>   }
>   
> -static void atmel_xlcdc_atomic_disable(struct atmel_hlcdc_plane *plane)
> +static void atmel_xlcdc_atomic_disable(struct atmel_hlcdc_plane *plane,
> +				       struct atmel_hlcdc_dc *dc)
>   {
>   	/* Disable interrupts */
>   	atmel_hlcdc_layer_write_reg(&plane->layer, ATMEL_XLCDC_LAYER_IDR,
> @@ -842,6 +844,15 @@ static void atmel_xlcdc_atomic_disable(struct atmel_hlcdc_plane *plane)
>   	atmel_hlcdc_layer_write_reg(&plane->layer,
>   				    ATMEL_XLCDC_LAYER_ENR, 0);
>   
> +	/*
> +	 * Updating XLCDC_xxxCFGx, XLCDC_xxxFBA and XLCDC_xxxEN,
> +	 * (where xxx indicates each layer) requires writing one to the
> +	 * Update Attribute field for each layer in LCDC_ATTRE register for SAM9X7.
> +	 */
> +	regmap_write(dc->hlcdc->regmap, ATMEL_XLCDC_ATTRE, ATMEL_XLCDC_BASE_UPDATE |
> +		     ATMEL_XLCDC_OVR1_UPDATE | ATMEL_XLCDC_OVR3_UPDATE |
> +		     ATMEL_XLCDC_HEO_UPDATE);
> +
>   	/* Clear all pending interrupts */
>   	atmel_hlcdc_layer_read_reg(&plane->layer, ATMEL_XLCDC_LAYER_ISR);
>   }
> @@ -852,7 +863,7 @@ static void atmel_hlcdc_plane_atomic_disable(struct drm_plane *p,
>   	struct atmel_hlcdc_plane *plane = drm_plane_to_atmel_hlcdc_plane(p);
>   	struct atmel_hlcdc_dc *dc = plane->base.dev->dev_private;
>   
> -	dc->desc->ops->lcdc_atomic_disable(plane);
> +	dc->desc->ops->lcdc_atomic_disable(plane, dc);
>   }
>   
>   static void atmel_hlcdc_atomic_update(struct atmel_hlcdc_plane *plane,

