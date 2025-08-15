Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B7BD2B280F1
	for <lists+dri-devel@lfdr.de>; Fri, 15 Aug 2025 15:54:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 09AE110E95E;
	Fri, 15 Aug 2025 13:54:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=ti.com header.i=@ti.com header.b="oI/47SlC";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from lelvem-ot01.ext.ti.com (lelvem-ot01.ext.ti.com [198.47.23.234])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C48E810E95E
 for <dri-devel@lists.freedesktop.org>; Fri, 15 Aug 2025 13:54:47 +0000 (UTC)
Received: from lelvem-sh02.itg.ti.com ([10.180.78.226])
 by lelvem-ot01.ext.ti.com (8.15.2/8.15.2) with ESMTP id 57FDsaVF2166057;
 Fri, 15 Aug 2025 08:54:36 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1755266076;
 bh=yo96BNTH5gwA2pF19/gHstAx+MYnVBFRjR3H0r/l9bk=;
 h=Date:Subject:To:CC:References:From:In-Reply-To;
 b=oI/47SlClztqsbLxw7gQ3pDAxuUoMUIkBpSI3KoMnoJJCpdLOzt3xdfD+zOFp/UI6
 Y+pWQ3ePg3hL1iS/lFblGC7AoriGZ0qXqYaTRzup/KynZktLFVg0pB2jGO8WbwkdRh
 7/y041Qhf50F6ed+Dg7WAiKcvG+LVnIOBJqT8o2Y=
Received: from DLEE104.ent.ti.com (dlee104.ent.ti.com [157.170.170.34])
 by lelvem-sh02.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 57FDsadR2481498
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
 Fri, 15 Aug 2025 08:54:36 -0500
Received: from DLEE104.ent.ti.com (157.170.170.34) by DLEE104.ent.ti.com
 (157.170.170.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Fri, 15
 Aug 2025 08:54:35 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE104.ent.ti.com
 (157.170.170.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55 via
 Frontend Transport; Fri, 15 Aug 2025 08:54:35 -0500
Received: from [10.249.42.149] ([10.249.42.149])
 by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 57FDsZ9R1072620;
 Fri, 15 Aug 2025 08:54:35 -0500
Message-ID: <5c3174f6-ab7e-48ec-a552-a682a22b184d@ti.com>
Date: Fri, 15 Aug 2025 08:54:34 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V3 4/4] drm/bridge: it66121: Add minimal it66122 support
To: Nishanth Menon <nm@ti.com>, Conor Dooley <conor+dt@kernel.org>, Krzysztof
 Kozlowski <krzk+dt@kernel.org>, Rob Herring <robh@kernel.org>, David Airlie
 <airlied@gmail.com>, Maxime Ripard <mripard@kernel.org>, Laurent Pinchart
 <Laurent.pinchart@ideasonboard.com>, Neil Armstrong
 <neil.armstrong@linaro.org>
CC: <linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>,
 <dri-devel@lists.freedesktop.org>, Robert Nelson <robertcnelson@gmail.com>,
 Jason Kridner <jkridner@beagleboard.org>,
 <tomi.valkeinen@ideasonboard.com>, <devarsht@ti.com>
References: <20250815034105.1276548-1-nm@ti.com>
 <20250815034105.1276548-5-nm@ti.com>
Content-Language: en-US
From: Andrew Davis <afd@ti.com>
In-Reply-To: <20250815034105.1276548-5-nm@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
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

On 8/14/25 10:41 PM, Nishanth Menon wrote:
> The IT66122 is a pin compatible replacement for the IT66122. Based on
> empirical testing, the new device looks to be compatible with IT66121.
> However due to a lack of public data sheet at this time beyond overall
> feature list[1] (which seems to add additional features vs ITT66121),
> it is hard to determine that additional register operations required
> to enable additional features.
> 
> So, introduce the device as a new compatible that we will detect based
> on vid/pid match, with explicit id that can be used to extend the
> driver capability as information becomes available later on.
> 
> [1] https://www.ite.com.tw/en/product/cate1/IT66122
> 
> Signed-off-by: Nishanth Menon <nm@ti.com>
> ---
> Changes in V3:
> * Dropped the claim that it is 1-1 replacement of IT66121.
> * Based on emperical test result[2], introduce the same configuration of
>    IT66121, but provide ID as suggested by Devarsh to allow for future
>    expansion of functionality.
> 
> NOTE: I did consider the possibility of converting the chip_id into a
> bitfield, but decided it is over-engineering, so kept the enum.
> 

But over-engineering is so much more fun :D

Reviewed-by: Andrew Davis <afd@ti.com>

> [2] https://github.com/beagleboard/linux/commits/v6.1.83-ti-rt-r40
> 
> V2: https://lore.kernel.org/all/20250813204106.580141-4-nm@ti.com/
> 
>   drivers/gpu/drm/bridge/ite-it66121.c | 14 +++++++++-----
>   1 file changed, 9 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/gpu/drm/bridge/ite-it66121.c b/drivers/gpu/drm/bridge/ite-it66121.c
> index 5ac9631bcd9a..a108d287722d 100644
> --- a/drivers/gpu/drm/bridge/ite-it66121.c
> +++ b/drivers/gpu/drm/bridge/ite-it66121.c
> @@ -287,6 +287,7 @@
>   enum chip_id {
>   	ID_IT6610,
>   	ID_IT66121,
> +	ID_IT66122,
>   };
>   
>   struct it66121_chip_info {
> @@ -402,7 +403,7 @@ static int it66121_configure_afe(struct it66121_ctx *ctx,
>   		if (ret)
>   			return ret;
>   
> -		if (ctx->id == ID_IT66121) {
> +		if (ctx->id == ID_IT66121 || ctx->id == ID_IT66122) {
>   			ret = regmap_write_bits(ctx->regmap, IT66121_AFE_IP_REG,
>   						IT66121_AFE_IP_EC1, 0);
>   			if (ret)
> @@ -428,7 +429,7 @@ static int it66121_configure_afe(struct it66121_ctx *ctx,
>   		if (ret)
>   			return ret;
>   
> -		if (ctx->id == ID_IT66121) {
> +		if (ctx->id == ID_IT66121 || ctx->id == ID_IT66122) {
>   			ret = regmap_write_bits(ctx->regmap, IT66121_AFE_IP_REG,
>   						IT66121_AFE_IP_EC1,
>   						IT66121_AFE_IP_EC1);
> @@ -599,7 +600,7 @@ static int it66121_bridge_attach(struct drm_bridge *bridge,
>   	if (ret)
>   		return ret;
>   
> -	if (ctx->id == ID_IT66121) {
> +	if (ctx->id == ID_IT66121 || ctx->id == ID_IT66122) {
>   		ret = regmap_write_bits(ctx->regmap, IT66121_CLK_BANK_REG,
>   					IT66121_CLK_BANK_PWROFF_RCLK, 0);
>   		if (ret)
> @@ -802,7 +803,7 @@ void it66121_bridge_mode_set(struct drm_bridge *bridge,
>   	if (regmap_write(ctx->regmap, IT66121_HDMI_MODE_REG, IT66121_HDMI_MODE_HDMI))
>   		goto unlock;
>   
> -	if (ctx->id == ID_IT66121 &&
> +	if ((ctx->id == ID_IT66121 || ctx->id == ID_IT66122) &&
>   	    regmap_write_bits(ctx->regmap, IT66121_CLK_BANK_REG,
>   			      IT66121_CLK_BANK_PWROFF_TXCLK,
>   			      IT66121_CLK_BANK_PWROFF_TXCLK)) {
> @@ -815,7 +816,7 @@ void it66121_bridge_mode_set(struct drm_bridge *bridge,
>   	if (it66121_configure_afe(ctx, adjusted_mode))
>   		goto unlock;
>   
> -	if (ctx->id == ID_IT66121 &&
> +	if ((ctx->id == ID_IT66121 || ctx->id == ID_IT66122) &&
>   	    regmap_write_bits(ctx->regmap, IT66121_CLK_BANK_REG,
>   			      IT66121_CLK_BANK_PWROFF_TXCLK, 0)) {
>   		goto unlock;
> @@ -1614,12 +1615,14 @@ static void it66121_remove(struct i2c_client *client)
>   }
>   
>   static const struct it66121_chip_info it66xx_chip_info[] = {
> +	{.id = ID_IT66122, .vid = 0x4954, .pid = 0x0622 },
>   	{.id = ID_IT66121, .vid = 0x4954, .pid = 0x0612 },
>   	{.id = ID_IT6610, .vid = 0xca00, .pid = 0x0611 },
>   	{ }
>   };
>   
>   static const struct of_device_id it66121_dt_match[] = {
> +	{ .compatible = "ite,it66122", &it66xx_chip_info },
>   	{ .compatible = "ite,it66121", &it66xx_chip_info },
>   	{ .compatible = "ite,it6610", &it66xx_chip_info },
>   	{ }
> @@ -1627,6 +1630,7 @@ static const struct of_device_id it66121_dt_match[] = {
>   MODULE_DEVICE_TABLE(of, it66121_dt_match);
>   
>   static const struct i2c_device_id it66121_id[] = {
> +	{ "it66122", (kernel_ulong_t)&it66xx_chip_info },
>   	{ "it66121", (kernel_ulong_t)&it66xx_chip_info },
>   	{ "it6610", (kernel_ulong_t)&it66xx_chip_info },
>   	{ }

