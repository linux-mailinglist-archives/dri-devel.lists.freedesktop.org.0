Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 86CE734CDEC
	for <lists+dri-devel@lfdr.de>; Mon, 29 Mar 2021 12:26:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 349A789C48;
	Mon, 29 Mar 2021 10:26:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x62a.google.com (mail-ej1-x62a.google.com
 [IPv6:2a00:1450:4864:20::62a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4F94289C48
 for <dri-devel@lists.freedesktop.org>; Mon, 29 Mar 2021 10:26:35 +0000 (UTC)
Received: by mail-ej1-x62a.google.com with SMTP id b7so18622590ejv.1
 for <dri-devel@lists.freedesktop.org>; Mon, 29 Mar 2021 03:26:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=1PyRrHa88gP4fv3wzdBtGmE3s8qTaZ8kXi0Y5jLPfiM=;
 b=pOayFRW2XXssf7jvduFdDt/MTNW5dPU7zDIMbPZv7keXD0uhfdyiSib33dcSnA8Hu3
 Nd+m1hKYpbHlPA5PItXcCpemOcZIuqTUxD4CLZmQHKfuDrLWJpKcSE99/2WKCXx/WHae
 hBbdV4k3P9g5FmFGcS75iT5ULopTuJoESaOqijBnXYZRXgmLARrGmpyT/E0jqh/UtuFZ
 cH4x1wJBN7UMJBHfhKKRX49gL9a3nTG/jXjigM2MFXILb4enVacil07wnTKeex7niRpe
 Y2b24ft5kDHQLN5jVRiGZ11LtjeRRJ9Zfvat/PCZQWtGgC29mPTZJST1VdOER7CBbxRr
 zA3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=1PyRrHa88gP4fv3wzdBtGmE3s8qTaZ8kXi0Y5jLPfiM=;
 b=CDcgiuFfEXJoM262++WNn0Q4GxpaIgj3HC0Jb3rRbxQgQbXeh82SO772RvM51kFcCL
 zitVf88p/EXmWhPMGsjYipVK+lvb/28TIJW4gMxR7jJBfXVJ1j3QWIOEruuYUIHK7OXd
 IrPrH793MWBpN38+H8XAsojNXx5s63vWBBw6GL2yh8nHz4XIoVsO5RJyXMT1JeMcuK77
 ioUCoqOlmWNd1coRkOsNHCSDKYKQBAGwLOoLuChyqYRmnVULsRCuzwuZ9qFq30gw/iv0
 icXGy3QG1Ft+AuJooq+7vLnoLVZ7UiiQo/crW5C4RQalZauBHlbsaRsjcCHq7oPzhh2g
 MN7A==
X-Gm-Message-State: AOAM533AuFwSNmDaFh/PvtJY+C8eyPnNmcNKSvE/9GTOR/8z0Ka7aI/u
 fFj+80bPeZ0syTtoa6FukxWhZQ==
X-Google-Smtp-Source: ABdhPJwEpp/sTgjo1+tUndCYaoZ9JuP+Qb7/WRdkeCt0wFxr5qiwBvoIfCh+KQZ/+TzyZd8kqkweMA==
X-Received: by 2002:a17:906:3949:: with SMTP id
 g9mr27002955eje.7.1617013593990; 
 Mon, 29 Mar 2021 03:26:33 -0700 (PDT)
Received: from maple.lan (cpc141216-aztw34-2-0-cust174.18-1.cable.virginm.net.
 [80.7.220.175])
 by smtp.gmail.com with ESMTPSA id bx2sm8795750edb.80.2021.03.29.03.26.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 29 Mar 2021 03:26:33 -0700 (PDT)
Date: Mon, 29 Mar 2021 11:26:31 +0100
From: Daniel Thompson <daniel.thompson@linaro.org>
To: cy_huang <u0084500@gmail.com>
Subject: Re: [PATCH v6 4/4] backlight: rt4831: Adds support for Richtek
 RT4831 backlight
Message-ID: <20210329102631.sh5ttefjvfsfg6tk@maple.lan>
References: <1616945059-8718-1-git-send-email-u0084500@gmail.com>
 <1616945059-8718-4-git-send-email-u0084500@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1616945059-8718-4-git-send-email-u0084500@gmail.com>
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
Cc: linux-fbdev@vger.kernel.org, b.zolnierkie@samsung.com, jingoohan1@gmail.com,
 lgirdwood@gmail.com, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, ChiYuan Huang <cy_huang@richtek.com>,
 broonie@kernel.org, lee.jones@linaro.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sun, Mar 28, 2021 at 11:24:19PM +0800, cy_huang wrote:
> From: ChiYuan Huang <cy_huang@richtek.com>
> 
> Adds support for Richtek RT4831 backlight.
> 
> Signed-off-by: ChiYuan Huang <cy_huang@richtek.com>
> ---
> since v6
> - Fix Kconfig typo.
> - Remove internal mutex lock.
> - Add the prefix for max brightness.
> - rename init_device_properties to parse_backlight_properties.
> - Remove some warning message if default value is adopted.
> - Add backlight property scale to LINEAR mapping.
> - Fix regmap get to check NULL not IS_ERR.
> ---
>  drivers/video/backlight/Kconfig            |   8 ++
>  drivers/video/backlight/Makefile           |   1 +
>  drivers/video/backlight/rt4831-backlight.c | 203 +++++++++++++++++++++++++++++
>  3 files changed, 212 insertions(+)
>  create mode 100644 drivers/video/backlight/rt4831-backlight.c
> 
> diff --git a/drivers/video/backlight/Kconfig b/drivers/video/backlight/Kconfig
> index d83c87b..de96441 100644
> --- a/drivers/video/backlight/Kconfig
> +++ b/drivers/video/backlight/Kconfig
> @@ -289,6 +289,14 @@ config BACKLIGHT_QCOM_WLED
>  	  If you have the Qualcomm PMIC, say Y to enable a driver for the
>  	  WLED block. Currently it supports PM8941 and PMI8998.
>  
> +config BACKLIGHT_RT4831
> +	tristate "Richtek RT4831 Backlight Driver"
> +	depends on MFD_RT4831
> +	help
> +	  This enables support for Richtek RT4831 Backlight driver.
> +	  It's common used to drive the display WLED. There're four channels

Nitpicking but I was expecting the original typo be converted to
"commonly".


With that addressed:
Reviewed-by: Daniel Thompson <daniel.thompson@linaro.org>


Daniel.
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
