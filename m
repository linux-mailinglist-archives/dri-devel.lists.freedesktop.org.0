Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 85BA15A3EBF
	for <lists+dri-devel@lfdr.de>; Sun, 28 Aug 2022 19:12:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DEA8810EEC0;
	Sun, 28 Aug 2022 17:12:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp.domeneshop.no (smtp.domeneshop.no
 [IPv6:2a01:5b40:0:3005::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 541B910EEC0
 for <dri-devel@lists.freedesktop.org>; Sun, 28 Aug 2022 17:12:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=tronnes.org
 ; s=ds202112;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
 References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=hUHwNV0Eqbp5+kyWPg3hdOExuH1sZ2s4LMJ069EmR+Q=; b=o7UwfkwgYp36t92og3iHfkSouB
 YESi0tfVO5wQICewKkSIRbnr2KQipFWbED5nxDMlPC6qob1lkztp3GWsGFlwmo57QQBexIlYLG5QA
 0N1jODHJj2leBFYzx8UPKqX7Z4Anid1HmiyoYemZSvmN1c91xkAfeNNe7XImj/sm5cH680dxftoNP
 o6B3Qx4dYIa1MEyo+dCXkTnJoat7p46foI6y5CJaeHVq8jgEl0xLshfAP7yf4PwFRWFZPTKR9U/WH
 k/qJOtNdlEV2tqDF0EFUFOZsGDHd58w18s33QoT3CDvL7rsKMHZmGvGIT8EWk7DLfdVADiXHqLwu/
 mD0kle2g==;
Received: from [2a01:799:961:d200:cca0:57ac:c55d:a485] (port=60629)
 by smtp.domeneshop.no with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.92) (envelope-from <noralf@tronnes.org>)
 id 1oSLpX-000560-9b; Sun, 28 Aug 2022 19:12:15 +0200
Message-ID: <011bcfa3-b655-0851-cfd4-560504efd8b1@tronnes.org>
Date: Sun, 28 Aug 2022 19:12:12 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PATCH v1 32/35] drm/sun4i: tv: Convert to the new TV mode
 property
To: Maxime Ripard <maxime@cerno.tech>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Chen-Yu Tsai <wens@csie.org>, Philipp Zabel <p.zabel@pengutronix.de>,
 Jerome Brunet <jbrunet@baylibre.com>, Samuel Holland <samuel@sholland.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Daniel Vetter <daniel@ffwll.ch>,
 Emma Anholt <emma@anholt.net>, David Airlie <airlied@linux.ie>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Kevin Hilman <khilman@baylibre.com>, Neil Armstrong
 <narmstrong@baylibre.com>, Maxime Ripard <mripard@kernel.org>
References: <20220728-rpi-analog-tv-properties-v1-0-3d53ae722097@cerno.tech>
 <20220728-rpi-analog-tv-properties-v1-32-3d53ae722097@cerno.tech>
From: =?UTF-8?Q?Noralf_Tr=c3=b8nnes?= <noralf@tronnes.org>
In-Reply-To: <20220728-rpi-analog-tv-properties-v1-32-3d53ae722097@cerno.tech>
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
Cc: Dom Cobley <dom@raspberrypi.com>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org,
 Mateusz Kwiatkowski <kfyatek+publicgit@gmail.com>,
 =?UTF-8?Q?Noralf_Tr=c3=b8nnes?= <noralf@tronnes.org>,
 Geert Uytterhoeven <geert@linux-m68k.org>, linux-amlogic@lists.infradead.org,
 linux-sunxi@lists.linux.dev, Phil Elwell <phil@raspberrypi.com>,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



Den 29.07.2022 18.35, skrev Maxime Ripard:
> Now that the core can deal fine with analog TV modes, let's convert the
> sun4i TV driver to leverage those new features.
> 
> Signed-off-by: Maxime Ripard <maxime@cerno.tech>
> 
> diff --git a/drivers/gpu/drm/sun4i/sun4i_tv.c b/drivers/gpu/drm/sun4i/sun4i_tv.c
> index 74ff5ad6a8b9..bed52423776e 100644
> --- a/drivers/gpu/drm/sun4i/sun4i_tv.c
> +++ b/drivers/gpu/drm/sun4i/sun4i_tv.c

> @@ -586,8 +524,17 @@ static int sun4i_tv_bind(struct device *dev, struct device *master,
>  
>  	drm_connector_attach_encoder(&tv->connector, &tv->encoder);
>  
> +	ret = drm_mode_create_tv_properties(drm,
> +					    DRM_MODE_TV_NORM_NTSC_M |
> +					    DRM_MODE_TV_NORM_PAL_B,
> +					    0, NULL);
> +	if (ret)
> +		goto err_cleanup_connector;
> +

Looks like you have forgotten to attach the property?

Noralf.

>  	return 0;
>  
> +err_cleanup_connector:
> +	drm_connector_cleanup(&tv->connector);
>  err_cleanup_encoder:
>  	drm_encoder_cleanup(&tv->encoder);
>  err_disable_clk:
> 
