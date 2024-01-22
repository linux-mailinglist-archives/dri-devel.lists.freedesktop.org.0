Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C84FA835F65
	for <lists+dri-devel@lfdr.de>; Mon, 22 Jan 2024 11:21:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 08E3C10EC83;
	Mon, 22 Jan 2024 10:20:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com
 [209.85.128.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9100310EC7E
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Jan 2024 10:20:30 +0000 (UTC)
Received: by mail-wm1-f45.google.com with SMTP id
 5b1f17b1804b1-40e5afc18f5so33383075e9.3
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Jan 2024 02:20:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1705918769; x=1706523569; darn=lists.freedesktop.org;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:from:to
 :cc:subject:date:message-id:reply-to;
 bh=6CUlLsOEJCO3o0htEYr8Lbj/bayNpoeF4Yah4if4kLc=;
 b=B/7qi7EYGcCHrNuupib7vukmM1MZSuBEHuzk/RsYyQViCEvm2L6GjHY9ElraEoqlOe
 Oj5Qn8fiJ+cEq/qeDPZ9j05I76OoDW+b/3S2CEr24EeZJ1p8pzVWSZwTET/x5N2jPXGU
 zOD53lZc7vnH756UCSLrJ66sZ2XOfMBtyUQaOcMZmCbEjX+BTMocqCjH2fFGUkyGyeb5
 QJgoHk6q9eJSEU9e/YrOEmVbwvcvGL3z9tzIyFHhoQ/FNEXr81RC157PUzMnDRnHI7Bw
 n1EB2MhlMeaehGKF5IiH5d1VLTfFn6aZpz2ummzvM/ccV99UkdzWfLHR+HOATWbcBGME
 k6cQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1705918769; x=1706523569;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=6CUlLsOEJCO3o0htEYr8Lbj/bayNpoeF4Yah4if4kLc=;
 b=ffNYLc07aijJ96G9z/Vwf31/9EtRl7zWmw4ZD4SfcNbbR2LWvN2eFmu3cOVtwlFM4B
 yvDoGZG8ZbxTqhU+Vw77wEw5PHEkqFXzU/K62ZDt1zEY4goqdwHKvhh8DIta0/gJax9M
 IcQ6aku5pjNep6DJ8C2eOEny0JedaOJqMuGzPukxBSF1vNEfol1jiwAyvEtmxwjk/jSG
 g51wz5+tRr2WkjGLveZFJu5Ap0bJ4c+N09sH88LRmZPZBIJl9tCsM+H6mqyeYuYbBHf/
 2Ghhzeo/nJyJ44yJ0GHt4n2s3M3dMHscQlodA6lJUkHY3YiUpn229mE4rUiLfE/dq6sz
 AVTg==
X-Gm-Message-State: AOJu0YxTYlzMy/CqmWIbeA7Wl6zPt0XwjTDPlZsszL55FPguoNICfvM5
 TQO1pSYTOl0cm2Y7SmOW8Nmux+uBmjWZjEwoL/qtlJju4hzyJESUvbKKqJE78/0=
X-Google-Smtp-Source: AGHT+IGiXCkeFT62mIizDAGCPWlt7/MMpjwMRYs+WW2Kwg136ect9locc0HoNUSbJlXRnS59IcBghQ==
X-Received: by 2002:a05:600c:5486:b0:40e:7c23:898d with SMTP id
 iv6-20020a05600c548600b0040e7c23898dmr2156961wmb.102.1705918769050; 
 Mon, 22 Jan 2024 02:19:29 -0800 (PST)
Received: from aspen.lan
 (aztw-34-b2-v4wan-166919-cust780.vm26.cable.virginm.net. [82.37.195.13])
 by smtp.gmail.com with ESMTPSA id
 iv11-20020a05600c548b00b0040d8ff79fd8sm38663573wmb.7.2024.01.22.02.19.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 22 Jan 2024 02:19:28 -0800 (PST)
Date: Mon, 22 Jan 2024 10:19:26 +0000
From: Daniel Thompson <daniel.thompson@linaro.org>
To: Duje =?utf-8?Q?Mihanovi=C4=87?= <duje.mihanovic@skole.hr>
Subject: Re: [PATCH v3 1/3] leds: ktd2692: move ExpressWire code to library
Message-ID: <20240122101926.GA8596@aspen.lan>
References: <20240120-ktd2801-v3-0-fe2cbafffb21@skole.hr>
 <20240120-ktd2801-v3-1-fe2cbafffb21@skole.hr>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240120-ktd2801-v3-1-fe2cbafffb21@skole.hr>
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
Cc: devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
 Pavel Machek <pavel@ucw.cz>, Jingoo Han <jingoohan1@gmail.com>,
 Helge Deller <deller@gmx.de>, Lee Jones <lee@kernel.org>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Karel Balej <balejk@matfyz.cz>, linux-fbdev@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>, ~postmarketos/upstreaming@lists.sr.ht,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 phone-devel@vger.kernel.org, linux-leds@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sat, Jan 20, 2024 at 10:26:43PM +0100, Duje Mihanović wrote:
> The ExpressWire protocol is shared between at least KTD2692 and KTD2801
> with slight differences such as timings and the former not having a
> defined set of pulses for enabling the protocol (possibly because it
> does not support PWM unlike KTD2801). Despite these differences the
> ExpressWire handling code can be shared between the two, so move it into
> a library in preparation for adding KTD2801 support.
>
> Suggested-by: Daniel Thompson <daniel.thompson@linaro.org>
> Signed-off-by: Duje Mihanović <duje.mihanovic@skole.hr>
> ---
>  MAINTAINERS                       |  7 +++
>  drivers/leds/Kconfig              |  3 ++
>  drivers/leds/Makefile             |  3 ++
>  drivers/leds/flash/Kconfig        |  1 +
>  drivers/leds/flash/leds-ktd2692.c | 91 +++++++++++----------------------------
>  drivers/leds/leds-expresswire.c   | 59 +++++++++++++++++++++++++
>  include/linux/leds-expresswire.h  | 35 +++++++++++++++
>  7 files changed, 132 insertions(+), 67 deletions(-)
>
> diff --git a/MAINTAINERS b/MAINTAINERS
> index a7c4cf8201e0..87b12d2448a0 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -7902,6 +7902,13 @@ S:	Maintained
>  T:	git git://git.kernel.org/pub/scm/linux/kernel/git/linkinjeon/exfat.git
>  F:	fs/exfat/
>
> +EXPRESSWIRE PROTOCOL LIBRARY
> +M:	Duje Mihanović <duje.mihanovic@skole.hr>
> +L:	linux-leds@vger.kernel.org
> +S:	Maintained
> +F:	drivers/leds/leds-expresswire.c
> +F:	include/linux/leds-expresswire.h
> +
>  EXT2 FILE SYSTEM
>  M:	Jan Kara <jack@suse.com>
>  L:	linux-ext4@vger.kernel.org
> diff --git a/drivers/leds/Kconfig b/drivers/leds/Kconfig
> index 6292fddcc55c..d29b6823e7d1 100644
> --- a/drivers/leds/Kconfig
> +++ b/drivers/leds/Kconfig
> @@ -181,6 +181,9 @@ config LEDS_EL15203000
>  	  To compile this driver as a module, choose M here: the module
>  	  will be called leds-el15203000.
>
> +config LEDS_EXPRESSWIRE
> +	bool
> +

Shouldn't there be a "select GPIOLIB" here? It seems odd to make the
clients responsible for the dependencies.

BTW there seems to be very little consistency across the kernel between
"depends on GPIOLIB" and "select GPIOLIB".. but select is marginally
more popular (283 vs. 219 in the kernel I checked).


> diff --git a/drivers/leds/flash/leds-ktd2692.c b/drivers/leds/flash/leds-ktd2692.c
> index 598eee5daa52..8c17de3d621f 100644
> --- a/drivers/leds/flash/leds-ktd2692.c
> +++ b/drivers/leds/flash/leds-ktd2692.c
>  <snip>
>  static void ktd2692_expresswire_write(struct ktd2692_context *led, u8 value)
>  {
>  	int i;
>
> -	ktd2692_expresswire_start(led);
> +	expresswire_start(&led->props);
>  	for (i = 7; i >= 0; i--)
> -		ktd2692_expresswire_set_bit(led, value & BIT(i));
> -	ktd2692_expresswire_end(led);
> +		expresswire_set_bit(&led->props, value & BIT(i));
> +	expresswire_end(&led->props);
>  }

Is there any reason not to have an expresswire_write_u8() method in the
library code? It is a concept that appears in both drivers.


Daniel.
