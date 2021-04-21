Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6358D367568
	for <lists+dri-devel@lfdr.de>; Thu, 22 Apr 2021 00:57:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8BF676E045;
	Wed, 21 Apr 2021 22:57:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-f52.google.com (mail-ot1-f52.google.com
 [209.85.210.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6F2FD6E045
 for <dri-devel@lists.freedesktop.org>; Wed, 21 Apr 2021 22:57:43 +0000 (UTC)
Received: by mail-ot1-f52.google.com with SMTP id
 5-20020a9d09050000b029029432d8d8c5so14479046otp.11
 for <dri-devel@lists.freedesktop.org>; Wed, 21 Apr 2021 15:57:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=7gUtOOV9KcLOf0wlBAVa9uVjHIcSuYOVO49M1SrRIXU=;
 b=BSob6ofz0nLGjmPe60Y9bUOq02WhHOAcXj5/uxpH0MwsxxTqwXVgZuWjZzKR01jYUj
 Io9Jvc3HuoYtkEId+znH9oZZ8EMpc16rff0JKkJbcYPht8BgKTDwdZ2f35PnTYVu2AGL
 3lceB6j+DHybHsP/4c2kXhVr851hdek4/nK6osmCZlK2W4t6dg+urOCiXCZT1F5A8FdG
 oP/bJA1vPRSue8ItbDsCD4ED+WWfFio6fB3B9vqv+n7sIM3yWolKiIRaKfV0z/SA4Q1T
 rSZVCcNib22kmoZcBwlelMSCJcwY+V15z5h+3owySA0Z9JBkZzRrIGQgKRjsRed0MStV
 5RTw==
X-Gm-Message-State: AOAM5314tY/GNJAPuUAz6XwlC0w8RJvfvNLSuWQcq/1GASFQGZC7WPhn
 xR/F/SJZHMKPmlYWOKnJyQ==
X-Google-Smtp-Source: ABdhPJwzx7yNCetR6H1tZfEMFFVR4TklZtpIg9nFQeKreaeUFAVoF2RRu0yi1+aoWeqpKfQmikN4oA==
X-Received: by 2002:a9d:74d3:: with SMTP id a19mr389635otl.120.1619045862714; 
 Wed, 21 Apr 2021 15:57:42 -0700 (PDT)
Received: from robh.at.kernel.org (24-155-109-49.dyn.grandenetworks.net.
 [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id n37sm226073otn.9.2021.04.21.15.57.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 21 Apr 2021 15:57:42 -0700 (PDT)
Received: (nullmailer pid 1768471 invoked by uid 1000);
 Wed, 21 Apr 2021 22:57:40 -0000
Date: Wed, 21 Apr 2021 17:57:40 -0500
From: Rob Herring <robh@kernel.org>
To: Alistair Francis <alistair@alistair23.me>
Subject: Re: [PATCH 2/2] drm/panel: Add support for E Ink VB3300-KCA
Message-ID: <20210421225740.GA1761342@robh.at.kernel.org>
References: <20210418210956.3024-1-alistair@alistair23.me>
 <20210418210956.3024-2-alistair@alistair23.me>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210418210956.3024-2-alistair@alistair23.me>
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
Cc: devicetree@vger.kernel.org, geert+renesas@glider.be,
 kuninori.morimoto.gx@renesas.com, airlied@linux.ie, sam@ravnborg.org,
 daniel@0x0f.com, linux-kernel@vger.kernel.org, krzk@kernel.org,
 linux@rempel-privat.de, thierry.reding@gmail.com,
 dri-devel@lists.freedesktop.org, Max.Merchel@tq-group.com, shawnguo@kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Apr 19, 2021 at 07:09:56AM +1000, Alistair Francis wrote:
> Add support for the 10.3" E Ink panel described at:
> https://www.eink.com/product.html?type=productdetail&id=7
> 
> Signed-off-by: Alistair Francis <alistair@alistair23.me>
> ---
>  drivers/gpu/drm/panel/panel-simple.c | 29 ++++++++++++++++++++++++++++
>  1 file changed, 29 insertions(+)
> 
> diff --git a/drivers/gpu/drm/panel/panel-simple.c b/drivers/gpu/drm/panel/panel-simple.c
> index 4e2dad314c79..f1f6fd2517f6 100644
> --- a/drivers/gpu/drm/panel/panel-simple.c
> +++ b/drivers/gpu/drm/panel/panel-simple.c
> @@ -1964,6 +1964,32 @@ static const struct panel_desc edt_etm0700g0bdh6 = {
>  	.bus_flags = DRM_BUS_FLAG_DE_HIGH | DRM_BUS_FLAG_PIXDATA_DRIVE_POSEDGE,
>  };
>  
> +static const struct display_timing eink_vb3300_kca_timing = {
> +	.pixelclock = { 40000000, 40000000, 40000000 },
> +	.hactive = { 334, 334, 334 },
> +	.hfront_porch = { 1, 1, 1 },
> +	.hback_porch = { 1, 1, 1 },
> +	.hsync_len = { 1, 1, 1 },
> +	.vactive = { 1405, 1405, 1405 },
> +	.vfront_porch = { 1, 1, 1 },
> +	.vback_porch = { 1, 1, 1 },
> +	.vsync_len = { 1, 1, 1 },
> +	.flags = DISPLAY_FLAGS_HSYNC_LOW | DISPLAY_FLAGS_VSYNC_LOW |
> +		 DISPLAY_FLAGS_DE_HIGH | DISPLAY_FLAGS_PIXDATA_POSEDGE,
> +};
> +
> +static const struct panel_desc eink_vb3300_kca = {
> +	.modes = &edt_etm0700g0dh6_mode,
> +	.num_modes = 1,
> +	.bpc = 6,
> +	.size = {
> +		.width = 157,
> +		.height = 209,
> +	},
> +	.bus_format = MEDIA_BUS_FMT_RGB888_1X24,
> +	.bus_flags = DRM_BUS_FLAG_DE_HIGH | DRM_BUS_FLAG_PIXDATA_DRIVE_POSEDGE,
> +};
> +
>  static const struct display_timing evervision_vgg804821_timing = {
>  	.pixelclock = { 27600000, 33300000, 50000000 },
>  	.hactive = { 800, 800, 800 },
> @@ -4232,6 +4258,9 @@ static const struct of_device_id platform_of_match[] = {
>  	}, {
>  		.compatible = "edt,etm0700g0dh6",
>  		.data = &edt_etm0700g0dh6,
> +	}, {
> +		.compatible = "eink,vb3300-kca",

You have to document this string too.
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
