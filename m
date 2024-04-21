Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 391858AC043
	for <lists+dri-devel@lfdr.de>; Sun, 21 Apr 2024 19:24:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 82ECF10F217;
	Sun, 21 Apr 2024 17:24:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="a15IbEAI";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f174.google.com (mail-lj1-f174.google.com
 [209.85.208.174])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E2FB610F217
 for <dri-devel@lists.freedesktop.org>; Sun, 21 Apr 2024 17:24:29 +0000 (UTC)
Received: by mail-lj1-f174.google.com with SMTP id
 38308e7fff4ca-2db13ca0363so56889281fa.3
 for <dri-devel@lists.freedesktop.org>; Sun, 21 Apr 2024 10:24:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1713720268; x=1714325068; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=qP4QRJgU1BApHuToLH0DTtNB0ZEyDCq59t66ZEJwTQg=;
 b=a15IbEAIFSpBCxND+YkerGtsxYiWxKItPfVjKovN10LZVJy8eeINJz8ZjFA2Jhx1EZ
 sDh0DUV2fq0KTqZEIqzPkqqZoeOW2tq/aK0I8KbRd8o6RxZG7e8fNXNmzLN8YNG30RFb
 xVaWBZQgJJUY8UWmLea616T/b7p4GsNZ0Wd/ykhiCdJ+Wvx0EraS5w596/6QKo4CvFC1
 ITbaYx/HAYt3KFd5EWum7OTXw5aoK7PVFZmqb073wDgmru2LiGLu4aZdUBtVWpIhGULw
 mBSgWtQH8js+ER6g1BvO4OUvdSpQyWVj5u0wR2RcKtKbgEiOrh6fpHKqj5lSFmGNqyji
 l9fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1713720268; x=1714325068;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=qP4QRJgU1BApHuToLH0DTtNB0ZEyDCq59t66ZEJwTQg=;
 b=UD2S8cncP8FIz0f+D3nVcsYK/h2pdwQYT5MidueLnuhxzdODn4WODSlVCk4shXjyw6
 8g21QDPwoe7/21ckSZh0daDawiPN97zAtGP32MV6baj6fY3N++nUd6ko8dFQLrp01Asa
 LBbWUIyepkS0EuRb8QV/unPD85GwyoCEnrKcFz+KTdqkp/MdOVwfun332MpBKXCQ6Iej
 pfKAPCYUM++Ax2E7a8xKGtgidflCOsu+ccb4pb2bkY/Jm8YOFiRKDiCY6t5AAFqWr4Wb
 R88LlIW2OcRcyws8jSbw8HGdGL57gPRll0oKLyg0eoRBCa/oehonBEOekddfPKHXe8xI
 /Jjg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXs2ihc5YsDCBqg/1KlasYJjX+Kzsprok6duG9mEfn0Hbs2Pj+8ZB/QbxoervyjKQuq0MLn4ZI9sqi5p3QfT+RIJQwyxosD5qCGVNPZPpCU
X-Gm-Message-State: AOJu0YwXqDMiMSvvpeyu09MnC6ck16EBrN/JQkcAEHQF8Xoq+sIfF2pa
 qp2dvcCmDdETcsG4L1ZX6TaEoQUq/llUOuNVyNcUkWAbc+m/tUOdpcfHppD9iv8=
X-Google-Smtp-Source: AGHT+IFLvHBYF/HR8/m7asEk356ewfwQEIZ3ux1d+BGEv1g/KRonZRM89ywg48Iy/h82lTw96asb1w==
X-Received: by 2002:a05:6512:370f:b0:518:c8e1:478 with SMTP id
 z15-20020a056512370f00b00518c8e10478mr5802469lfr.58.1713720267513; 
 Sun, 21 Apr 2024 10:24:27 -0700 (PDT)
Received: from eriador.lumag.spb.ru
 (dzdbxzyyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::8a5])
 by smtp.gmail.com with ESMTPSA id
 u18-20020ac25192000000b00518d5c5740esm1507389lfi.180.2024.04.21.10.24.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 21 Apr 2024 10:24:26 -0700 (PDT)
Date: Sun, 21 Apr 2024 20:24:25 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Dharma Balasubiramani <dharma.b@microchip.com>
Cc: "andrzej . hajda @ intel . com" <andrzej.hajda@intel.com>, 
 "neil . armstrong @ linaro . org" <neil.armstrong@linaro.org>,
 "rfoss @ kernel . org" <rfoss@kernel.org>, 
 "Laurent . pinchart @ ideasonboard . com" <Laurent.pinchart@ideasonboard.com>,
 "jonas @ kwiboo . se" <jonas@kwiboo.se>, 
 "jernej . skrabec @ gmail . com" <jernej.skrabec@gmail.com>, 
 "maarten . lankhorst @ linux . intel . com"
 <maarten.lankhorst@linux.intel.com>,
 "mripard @ kernel . org" <mripard@kernel.org>, 
 "tzimmermann @ suse . de" <tzimmermann@suse.de>,
 "airlied @ gmail . com" <airlied@gmail.com>, 
 "daniel @ ffwll . ch" <daniel@ffwll.ch>,
 "robh+dt @ kernel . org" <robh+dt@kernel.org>, 
 "krzysztof . kozlowski+dt @ linaro . org" <krzysztof.kozlowski+dt@linaro.org>,
 "conor+dt @ kernel . org" <conor+dt@kernel.org>, 
 "linux @ armlinux . org . uk" <linux@armlinux.org.uk>, 
 "Nicolas . Ferre @ microchip . com" <Nicolas.Ferre@microchip.com>, 
 "alexandre . belloni @ bootlin . com" <alexandre.belloni@bootlin.com>,
 "claudiu . beznea @ tuxon . dev" <claudiu.beznea@tuxon.dev>, 
 "Manikandan . M @ microchip . com" <Manikandan.M@microchip.com>,
 "arnd @ arndb . de" <arnd@arndb.de>, 
 "geert+renesas @ glider . be" <geert+renesas@glider.be>,
 "Jason @ zx2c4 . com" <Jason@zx2c4.com>, 
 "mpe @ ellerman . id . au" <mpe@ellerman.id.au>,
 "gerg @ linux-m68k . org" <gerg@linux-m68k.org>, 
 "rdunlap @ infradead . org" <rdunlap@infradead.org>,
 "vbabka @ suse . cz" <vbabka@suse.cz>, 
 "dri-devel @ lists . freedesktop . org" <dri-devel@lists.freedesktop.org>,
 "devicetree @ vger . kernel . org" <devicetree@vger.kernel.org>, 
 "linux-kernel @ vger . kernel . org" <linux-kernel@vger.kernel.org>, 
 "oe-kbuild-all @ lists . linux . dev" <oe-kbuild-all@lists.linux.dev>, 
 "Hari . PrasathGE @ microchip . com" <Hari.PrasathGE@microchip.com>
Subject: Re: [PATCH v8 2/4] drm/bridge: add lvds controller support for sam9x7
Message-ID: <2ct5tav52onwd6ceuzqbbam4qsqfvxdjpsrbn72jbsyjtcgtsl@j3d7piqqheel>
References: <20240421011050.43265-1-dharma.b@microchip.com>
 <20240421011050.43265-3-dharma.b@microchip.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240421011050.43265-3-dharma.b@microchip.com>
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

On Sun, Apr 21, 2024 at 06:40:48AM +0530, Dharma Balasubiramani wrote:
> Add a new LVDS controller driver for sam9x7 which does the following:
> - Prepares and enables the LVDS Peripheral clock
> - Defines its connector type as DRM_MODE_CONNECTOR_LVDS and adds itself
> to the global bridge list.
> - Identifies its output endpoint as panel and adds it to the encoder
> display pipeline
> - Enables the LVDS serializer
> 
> Signed-off-by: Manikandan Muralidharan <manikandan.m@microchip.com>
> Signed-off-by: Dharma Balasubiramani <dharma.b@microchip.com>
> Acked-by: Hari Prasath Gujulan Elango <hari.prasathge@microchip.com>
> ---
> Changelog
> v7 -> v8
> - Assign ret variable properly before checking it for err.
> v6 -> v7
> - Remove setting encoder type from bridge driver.
> - Drop clk_disable() from pm_runtime_get_sync() error handling.
> - Use devm_clk_get() instead of prepared version.
> - Hence use clk_prepare_enable() and clk_disable_unprepare().
> - Use devm_drm_of_get_bridge() instead of devm_drm_panel_bridge_add().
> - Add error check for devm_pm_runtime_enable().
> - Use dev_err() instead of DRM_DEV_ERROR() as it is deprecated.
> - Add missing Acked-by tag.
> v5 -> v6
> - No Changes.
> v4 -> v5
> - Drop the unused variable 'format'.
> - Use DRM wrapper for dev_err() to maintain uniformity.
> - return -ENODEV instead of -EINVAL to maintain consistency with other DRM
>   bridge drivers.
> v3 -> v4
> - No changes.
> v2 ->v3
> - Correct Typo error "serializer".
> - Consolidate get() and prepare() functions and use devm_clk_get_prepared().
> - Remove unused variable 'ret' in probe().
> - Use devm_pm_runtime_enable() and drop the mchp_lvds_remove().
> v1 -> v2
> - Drop 'res' variable and combine two lines into one.
> - Handle deferred probe properly, use dev_err_probe().
> - Don't print anything on deferred probe. Dropped print.
> - Remove the MODULE_ALIAS and add MODULE_DEVICE_TABLE().
> - symbol 'mchp_lvds_driver' was not declared. It should be static.
> ---
>  drivers/gpu/drm/bridge/Kconfig          |   7 +
>  drivers/gpu/drm/bridge/Makefile         |   1 +
>  drivers/gpu/drm/bridge/microchip-lvds.c | 229 ++++++++++++++++++++++++
>  3 files changed, 237 insertions(+)
>  create mode 100644 drivers/gpu/drm/bridge/microchip-lvds.c
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>


-- 
With best wishes
Dmitry
