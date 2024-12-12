Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C46479EE67B
	for <lists+dri-devel@lfdr.de>; Thu, 12 Dec 2024 13:18:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CF1E010ED95;
	Thu, 12 Dec 2024 12:18:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=denx.de header.i=@denx.de header.b="gy2FgI5l";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 453 seconds by postgrey-1.36 at gabe;
 Thu, 12 Dec 2024 12:17:59 UTC
Received: from mx.denx.de (mx.denx.de [89.58.32.78])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6A5B910ED95
 for <dri-devel@lists.freedesktop.org>; Thu, 12 Dec 2024 12:17:59 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 513A51047DC21; Thu, 12 Dec 2024 13:10:17 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de; s=mx-20241105;
 t=1734005422;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=z5uxgXWeF42zSM0+xNA+3NBRH5J4QrQYZwCAA7BDALo=;
 b=gy2FgI5lpHsWE3+7vNVtxxA5uAGq8cXGIdI5oKNzA5t3PLoTd42ckYDJaq46Wcyc6B3sAh
 qL1fifSXfWtMbwMdqjxS4nf+ehx+0l+ZyzHr4gx2biYq4C5osLSwDtHAHBRxTCZFEOY4iZ
 pzY+e+2yo03CFBn0w+jcd/zup3yjMqUhDarZ3h8/iwu47JSnOWuUN3aZdqLj2/o22CJyFB
 QM8xH1eKR6DbeC1jclRJRQfQi7ntgUrcShNePdgHb5jTNih4q2so6Twp+kdKzEXKAl+46k
 SAtrmyeWRYae1JwqEiAGl8V8p45aWOpzeg0MDXbUhR38aYZUW9EVmAX6vDx4aQ==
Message-ID: <1d10a13c-edc5-4efc-8de5-95fe08b11cf6@denx.de>
Date: Thu, 12 Dec 2024 13:09:44 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] drm/panel: simple: add Multi-Inno Technology
 MI0700A2T-30
To: dri-devel@lists.freedesktop.org
Cc: Conor Dooley <conor+dt@kernel.org>, David Airlie <airlied@gmail.com>,
 Jessica Zhang <quic_jesszhan@quicinc.com>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>, Rob Herring <robh@kernel.org>,
 Sam Ravnborg <sam@ravnborg.org>, Simona Vetter <simona@ffwll.ch>,
 Thierry Reding <thierry.reding@gmail.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, devicetree@vger.kernel.org
References: <20241125013413.160725-1-marex@denx.de>
 <20241125013413.160725-2-marex@denx.de>
Content-Language: en-US
From: Marek Vasut <marex@denx.de>
In-Reply-To: <20241125013413.160725-2-marex@denx.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Last-TLS-Session-Version: TLSv1.3
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

On 11/25/24 2:33 AM, Marek Vasut wrote:
> Add Multi-Inno Technology MI0700A2T-30 7" 800x480 LVDS panel support.
> 
> Signed-off-by: Marek Vasut <marex@denx.de>
> ---
> Cc: Conor Dooley <conor+dt@kernel.org>
> Cc: David Airlie <airlied@gmail.com>
> Cc: Jessica Zhang <quic_jesszhan@quicinc.com>
> Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>
> Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> Cc: Maxime Ripard <mripard@kernel.org>
> Cc: Neil Armstrong <neil.armstrong@linaro.org>
> Cc: Rob Herring <robh@kernel.org>
> Cc: Sam Ravnborg <sam@ravnborg.org>
> Cc: Simona Vetter <simona@ffwll.ch>
> Cc: Thierry Reding <thierry.reding@gmail.com>
> Cc: Thomas Zimmermann <tzimmermann@suse.de>
> Cc: devicetree@vger.kernel.org
> Cc: dri-devel@lists.freedesktop.org
> ---
>   drivers/gpu/drm/panel/panel-simple.c | 30 ++++++++++++++++++++++++++++
>   1 file changed, 30 insertions(+)
> 
> diff --git a/drivers/gpu/drm/panel/panel-simple.c b/drivers/gpu/drm/panel/panel-simple.c
> index 06381c6282097..4e2582e1a2bd1 100644
> --- a/drivers/gpu/drm/panel/panel-simple.c
> +++ b/drivers/gpu/drm/panel/panel-simple.c
> @@ -3222,6 +3222,33 @@ static const struct panel_desc mitsubishi_aa084xe01 = {
>   	.bus_flags = DRM_BUS_FLAG_DE_HIGH | DRM_BUS_FLAG_PIXDATA_SAMPLE_NEGEDGE,
>   };
>   
> +static const struct display_timing multi_inno_mi0700a2t_30_timing = {
> +	.pixelclock = { 26400000, 33000000, 46800000 },
> +	.hactive = { 800, 800, 800 },
> +	.hfront_porch = { 16, 204, 354 },
> +	.hback_porch = { 46, 46, 46 },
> +	.hsync_len = { 1, 6, 40 },
> +	.vactive = { 480, 480, 480 },
> +	.vfront_porch = { 7, 22, 147 },
> +	.vback_porch = { 23, 23, 23 },
> +	.vsync_len = { 1, 3, 20 },
> +	.flags = DISPLAY_FLAGS_HSYNC_LOW | DISPLAY_FLAGS_VSYNC_LOW |
> +		 DISPLAY_FLAGS_DE_HIGH,
> +};
> +
> +static const struct panel_desc multi_inno_mi0700a2t_30 = {
> +	.timings = &multi_inno_mi0700a2t_30_timing,
> +	.num_timings = 1,
> +	.bpc = 6,
> +	.size = {
> +		.width = 153,
> +		.height = 92,
> +	},
> +	.bus_format = MEDIA_BUS_FMT_RGB666_1X7X3_SPWG,
> +	.bus_flags = DRM_BUS_FLAG_DE_HIGH,
> +	.connector_type = DRM_MODE_CONNECTOR_LVDS,
> +};
> +
>   static const struct display_timing multi_inno_mi0700s4t_6_timing = {
>   	.pixelclock = { 29000000, 33000000, 38000000 },
>   	.hactive = { 800, 800, 800 },
> @@ -4905,6 +4932,9 @@ static const struct of_device_id platform_of_match[] = {
>   	}, {
>   		.compatible = "mitsubishi,aa084xe01",
>   		.data = &mitsubishi_aa084xe01,
> +	}, {
> +		.compatible = "multi-inno,mi0700a2t-30",
> +		.data = &multi_inno_mi0700a2t_30,
>   	}, {
>   		.compatible = "multi-inno,mi0700s4t-6",
>   		.data = &multi_inno_mi0700s4t_6,

Anything I need to do /wrt this patch ?
