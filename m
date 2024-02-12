Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 997358513B6
	for <lists+dri-devel@lfdr.de>; Mon, 12 Feb 2024 13:44:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0A3B810E125;
	Mon, 12 Feb 2024 12:44:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="IN3hfphm";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com
 [209.85.167.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5330E10E125
 for <dri-devel@lists.freedesktop.org>; Mon, 12 Feb 2024 12:44:35 +0000 (UTC)
Received: by mail-lf1-f50.google.com with SMTP id
 2adb3069b0e04-51187830d6dso1117271e87.3
 for <dri-devel@lists.freedesktop.org>; Mon, 12 Feb 2024 04:44:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1707741872; x=1708346672; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=XvN0mE8+X+sOTUoptopXTmTpNcPMMCKjy4OSqGx44gE=;
 b=IN3hfphmeKNYrwjxBjeDEoLXAyCaBrhiZwF+Hi1f1Szedayp5Ich75qNmKdt5Mg4WT
 XWYiX9JFTQfto8Lu59y62z4s/6CcjvK/VyT7UdBTI+yyXUlSBEOnEJNd0T5GVvGK0Eph
 dWcRubcQNL7o6pNZWz5maqIAOaiREHJJmS2SDiTD2RfNbdyaIwB3G2D3jlZ26HlNRU4A
 jJqXiNZf8YcmN+M7VSgsM7fAV+Itu2JoGFmraB3C483gq4UfPKie5EmL2wBZhibd871U
 8QM349Fe5X7uL/L6V6XdMhdbGC9/JZ7sNocP3eb1bGPvJkts5CAlK/qrOx2ikkXF7fL0
 8I3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1707741872; x=1708346672;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=XvN0mE8+X+sOTUoptopXTmTpNcPMMCKjy4OSqGx44gE=;
 b=K5rrXjxP1xfRYvHM+X0KSAyQ+dQFsls45Vn3/pwiXv29CyJTcGmGpeROnU9UOBOW6R
 6VvYMLZg9xuS10+88I+l4toRhmhurUoWdjDhG+07wbCYB9G+mAwur7zCMDeoAcoULhtS
 QmMwpl/PT3guxYDFJ7X49FiaDn86UAJUtKsSUJMgNQcU0XqZrK/LafzBvubHEmGwH+ZD
 h7X7FYnjjkP3fq/WV3FHs8Mx9VsKN3fw+ZAK+KkpoCyz17u7M62/2JTIhvzKTBbZgqCu
 NYmtanxh3TYPvZPlELP/bvPvyfG6+KDnV5xbN4YtbE7liXOvLGEUphIlwRU3ORch/u6F
 2eOA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXFwpltVp9bsE/jQvi2LZZQJkViJnMd2aNB0NWMwVOvlFh2tKuvLeQW8PqdHSzhjpghgX8v88qlyCOY34KEBQ5g2N37nMfeBYeJ2wx0MZr/
X-Gm-Message-State: AOJu0YxG+hg2+k2ctlg+xFtv0qskqZz2dj3yaMxen684zQGa5rn/hrXk
 04TPMzeXaPtLaLW6ziHqmjp3UaK4HycF6DzzOfqI8F8Wz4xpijPgRCPV33YYUYE=
X-Google-Smtp-Source: AGHT+IECaQR8SxGdAuBdoh2ITf4ZKxq5Ebe9H8QzZh9YQ3kzq6zuiVOl/DFf3eiPYe3IBXg8A7rqMw==
X-Received: by 2002:a05:6512:12cc:b0:511:86f8:f6a9 with SMTP id
 p12-20020a05651212cc00b0051186f8f6a9mr3076899lfg.22.1707741872466; 
 Mon, 12 Feb 2024 04:44:32 -0800 (PST)
X-Forwarded-Encrypted: i=1;
 AJvYcCXQsyLmcNz7AYCWiLFIm8eWdCgWxh+lwKbempYrtW3ICNHWg++T6oOCAsu15mIwbSj7xBE5Pml36z949yFxdSfbFZiOJHiSd2jMydY2g0oJNeQb3u0ojclTjj/XA2C6BydwAX5Q441VrduzhUdJlOuZB3hd1Mhu8CFIqwY2KC5ggXBixcxSjrWAOOt8IA/2aJu461D76jqi5nX48TALXh322aRUgGDRcmslPG9Mnlezh9zHHqhO/wDGkJefoc1aCgdO6iO+XygCM3w2dt7QyWon1GSITb66+vzDNlKwG8Ti1so6E8m9Zn2+m0CdUgSoV1zPZGZkGDmlOBROoPt9dXJWJIfYs/sTLnrTxbMVr12ASfOEKLTUG/khxdb94p9GDw8ToaLtpn6BqfkWIRFfsJwhJrF8FsZA4i2PAHhpwjNLA8RpGjtpWA==
Received: from aspen.lan
 (aztw-34-b2-v4wan-166919-cust780.vm26.cable.virginm.net. [82.37.195.13])
 by smtp.gmail.com with ESMTPSA id
 7-20020a05600c248700b0040fddaf9ff4sm8470964wms.40.2024.02.12.04.44.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 12 Feb 2024 04:44:30 -0800 (PST)
Date: Mon, 12 Feb 2024 12:44:28 +0000
From: Daniel Thompson <daniel.thompson@linaro.org>
To: Arnd Bergmann <arnd@kernel.org>
Cc: Lee Jones <lee@kernel.org>, Jingoo Han <jingoohan1@gmail.com>,
 Helge Deller <deller@gmx.de>,
 Duje =?utf-8?Q?Mihanovi=C4=87?= <duje.mihanovic@skole.hr>,
 Linus Walleij <linus.walleij@linaro.org>,
 Arnd Bergmann <arnd@arndb.de>, Flavio Suligoi <f.suligoi@asem.it>,
 Hans de Goede <hdegoede@redhat.com>, Jianhua Lu <lujianhua000@gmail.com>,
 "Matthew Wilcox (Oracle)" <willy@infradead.org>,
 dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH] backlight: ktd2801: fix LED dependency
Message-ID: <20240212124428.GB4593@aspen.lan>
References: <20240212111819.936815-1-arnd@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240212111819.936815-1-arnd@kernel.org>
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

On Mon, Feb 12, 2024 at 12:18:12PM +0100, Arnd Bergmann wrote:
> From: Arnd Bergmann <arnd@arndb.de>
>
> The new backlight driver unconditionally selects LEDS_EXPRESSWIRE, which
> is in a different subsystem that may be disabled here:
>
> WARNING: unmet direct dependencies detected for LEDS_EXPRESSWIRE
>   Depends on [n]: NEW_LEDS [=n] && GPIOLIB [=y]
>   Selected by [y]:
>   - BACKLIGHT_KTD2801 [=y] && HAS_IOMEM [=y] && BACKLIGHT_CLASS_DEVICE [=y]
>
> Change the select to depends, to ensure the indirect dependency is
> met as well even when LED support is disabled.
>
> Fixes: 66c76c1cd984 ("backlight: Add Kinetic KTD2801 backlight support")
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> ---
>  drivers/video/backlight/Kconfig | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/video/backlight/Kconfig b/drivers/video/backlight/Kconfig
> index 230bca07b09d..f83f9ef037fc 100644
> --- a/drivers/video/backlight/Kconfig
> +++ b/drivers/video/backlight/Kconfig
> @@ -185,7 +185,7 @@ config BACKLIGHT_KTD253
>
>  config BACKLIGHT_KTD2801
>  	tristate "Backlight Driver for Kinetic KTD2801"
> -	select LEDS_EXPRESSWIRE
> +	depends on LEDS_EXPRESSWIRE

As far as I can tell this resolves the warning by making it impossible
to enable BACKLIGHT_KTD2801 unless a largely unrelated driver
(LEDS_KTD2692) is also enabled!

A better way to resolve this problem might be to eliminate the NEW_LEDS
dependency entirely:
~~~
diff --git a/drivers/leds/Kconfig b/drivers/leds/Kconfig
index 64bb2de237e95..a08816cde78ae 100644
--- a/drivers/leds/Kconfig
+++ b/drivers/leds/Kconfig
@@ -186,10 +186,6 @@ config LEDS_EL15203000
          To compile this driver as a module, choose M here: the module
          will be called leds-el15203000.

-config LEDS_EXPRESSWIRE
-       bool
-       depends on GPIOLIB
-
 config LEDS_TURRIS_OMNIA
        tristate "LED support for CZ.NIC's Turris Omnia"
        depends on LEDS_CLASS_MULTICOLOR
@@ -936,3 +932,10 @@ comment "Simple LED drivers"
 source "drivers/leds/simple/Kconfig"

 endif # NEW_LEDS
+
+# This is library code that is useful for LEDs but can be enable/disabled
+# independently of NEW_LEDS. In fact it must be independent so it can be
+# selected from other sub-systems.
+config LEDS_EXPRESSWIRE
+       bool
+       depends on GPIOLIB
~~~

Alternatively we could add a "depends on NEW_LEDS" alongside the
existing select or just make LEDS_EXPRESSWIRE user selectable.

It also looks like we should put back the GPIOLIB dependency to both
 KTD2801 and KTD2692... and I'll take a mea-culpa for providing bad
 advice during the review cycles!


Daniel.
