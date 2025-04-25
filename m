Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D1BB0A9BF5C
	for <lists+dri-devel@lfdr.de>; Fri, 25 Apr 2025 09:12:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 87AE710E8A4;
	Fri, 25 Apr 2025 07:12:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=ti.com header.i=@ti.com header.b="om4JOWba";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 6082 seconds by postgrey-1.36 at gabe;
 Fri, 25 Apr 2025 03:14:08 UTC
Received: from lelvem-ot02.ext.ti.com (lelvem-ot02.ext.ti.com [198.47.23.235])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0EF4B10E887
 for <dri-devel@lists.freedesktop.org>; Fri, 25 Apr 2025 03:14:07 +0000 (UTC)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
 by lelvem-ot02.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 53P1WRab2803412
 (version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 24 Apr 2025 20:32:27 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1745544747;
 bh=wIOxnoc70kR5bhgT0T/889MsOFpWtiefqaMQ7rtCI5w=;
 h=Date:Subject:To:CC:References:From:In-Reply-To;
 b=om4JOWbaB4bHfy/HK4qUfxUfUAKAuABgqd4N2+FHNf5GcpDXdYsK7z6csD+oUek1g
 7RwHbIxJ/4FNcyhYV1BIF4UbTshNA2EbmGoPh5ESsVnOXrUmCPfXck1e6zRQGuauRD
 GriuAy9M4QxtmeyNnWXVoRECvoblWhwLILnuA0zk=
Received: from DLEE102.ent.ti.com (dlee102.ent.ti.com [157.170.170.32])
 by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 53P1WRpB000426
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Thu, 24 Apr 2025 20:32:27 -0500
Received: from DLEE115.ent.ti.com (157.170.170.26) by DLEE102.ent.ti.com
 (157.170.170.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Thu, 24
 Apr 2025 20:32:26 -0500
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DLEE115.ent.ti.com
 (157.170.170.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Thu, 24 Apr 2025 20:32:26 -0500
Received: from [10.249.141.75] ([10.249.141.75])
 by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 53P1WJse041608;
 Thu, 24 Apr 2025 20:32:20 -0500
Message-ID: <3f44ec0b-216c-4534-a6de-7b17929cb9e1@ti.com>
Date: Fri, 25 Apr 2025 07:02:18 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH] drm/bridge: ti-sn65dsi86: Enable HPD functionality
To: Jayesh Choudhary <j-choudhary@ti.com>, <dianders@chromium.org>,
 <andrzej.hajda@intel.com>, <neil.armstrong@linaro.org>,
 <rfoss@kernel.org>, <Laurent.pinchart@ideasonboard.com>,
 <dri-devel@lists.freedesktop.org>, <tomi.valkeinen@ideasonboard.com>
CC: <jonas@kwiboo.se>, <jernej.skrabec@gmail.com>,
 <maarten.lankhorst@linux.intel.com>, <mripard@kernel.org>,
 <tzimmermann@suse.de>, <airlied@gmail.com>, <simona@ffwll.ch>,
 <linux-kernel@vger.kernel.org>, <u-kumar1@ti.com>
References: <20250424105432.255309-1-j-choudhary@ti.com>
Content-Language: en-US
From: "Kumar, Udit" <u-kumar1@ti.com>
In-Reply-To: <20250424105432.255309-1-j-choudhary@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-Mailman-Approved-At: Fri, 25 Apr 2025 07:12:50 +0000
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

Hello Jayesh,

On 4/24/2025 4:24 PM, Jayesh Choudhary wrote:
> For TI SoC J784S4, the display pipeline looks like:
> TIDSS -> CDNS-DSI -> SN65DSI86 -> DisplayConnector -> DisplaySink
> This requires HPD to detect connection form the connector.
> By default, the HPD is disabled for eDP. So enable it conditionally
> based on a new flag 'keep-hpd' as mentioned in the comments in the
> driver.
>
> Signed-off-by: Jayesh Choudhary <j-choudhary@ti.com>
> ---
>
> Hello All,
>
> Sending this RFC patch to get some thoughts on hpd for sn65dsi86.
>
> Now that we have a usecase for hpd in sn65dsi86, I wanted to get
> some comments on this approach to "NOT DISABLE" hpd in the bridge.
> As the driver considers the eDP case, it disables hpd by default.
> So I have added another property in the binding for keeping hpd
> functionality (the name used is still debatable) and used it in
> the driver.
>
> Is this approach okay?
> Also should this have a "Fixes" tag?

>
>   .../bindings/display/bridge/ti,sn65dsi86.yaml      |  6 ++++++
>   drivers/gpu/drm/bridge/ti-sn65dsi86.c              | 14 +++++++++-----
>   2 files changed, 15 insertions(+), 5 deletions(-)
>
> diff --git a/Documentation/devicetree/bindings/display/bridge/ti,sn65dsi86.yaml b/Documentation/devicetree/bindings/display/bridge/ti,sn65dsi86.yaml
> index c93878b6d718..5948be612849 100644
> --- a/Documentation/devicetree/bindings/display/bridge/ti,sn65dsi86.yaml
> +++ b/Documentation/devicetree/bindings/display/bridge/ti,sn65dsi86.yaml
> @@ -34,6 +34,12 @@ properties:
>         Set if the HPD line on the bridge isn't hooked up to anything or is
>         otherwise unusable.
>   
> +  keep-hpd:
> +    type: boolean
> +    description:
> +      HPD is disabled in the bridge by default. Set it if HPD line makes
> +      sense and is used.
> +

Here are my suggestions

1) use interrupt in binding as optional instead of keep-hpd

2) use interrupt field (if present to enable of disable HPD functions in 
driver)


>     vccio-supply:
>       description: A 1.8V supply that powers the digital IOs.
>   
> diff --git a/drivers/gpu/drm/bridge/ti-sn65dsi86.c b/drivers/gpu/drm/bridge/ti-sn65dsi86.c
> index f72675766e01..4081cc957c6c 100644
> --- a/drivers/gpu/drm/bridge/ti-sn65dsi86.c
> +++ b/drivers/gpu/drm/bridge/ti-sn65dsi86.c
> @@ -191,6 +191,7 @@ struct ti_sn65dsi86 {
>   	u8				ln_polrs;
>   	bool				comms_enabled;
>   	struct mutex			comms_mutex;
> +	bool				keep_hpd;
>   
>   #if defined(CONFIG_OF_GPIO)
>   	struct gpio_chip		gchip;
> @@ -348,12 +349,15 @@ static void ti_sn65dsi86_enable_comms(struct ti_sn65dsi86 *pdata,
>   	 * 200 ms.  We'll assume that the panel driver will have the hardcoded
>   	 * delay in its prepare and always disable HPD.
>   	 *
> -	 * If HPD somehow makes sense on some future panel we'll have to
> -	 * change this to be conditional on someone specifying that HPD should
> -	 * be used.
> +	 * If needed, use 'keep-hpd' property in the hardware description in
> +	 * board file as a conditional specifying that HPD should be used.
>   	 */
> -	regmap_update_bits(pdata->regmap, SN_HPD_DISABLE_REG, HPD_DISABLE,
> -			   HPD_DISABLE);
> +
> +	pdata->keep_hpd = of_property_read_bool(pdata->dev->of_node, "keep-hpd");
> +
> +	if (!pdata->keep_hpd)
> +		regmap_update_bits(pdata->regmap, SN_HPD_DISABLE_REG, HPD_DISABLE,
> +				   HPD_DISABLE);

you may want to extend interrupt support in this driver if HPD is enabled.


>   
>   	pdata->comms_enabled = true;
>   
