Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CF60FC6B686
	for <lists+dri-devel@lfdr.de>; Tue, 18 Nov 2025 20:22:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 260F810E1A9;
	Tue, 18 Nov 2025 19:22:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="lFwHq4xp";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com
 [209.85.210.181])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4629510E1A9
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Nov 2025 19:22:37 +0000 (UTC)
Received: by mail-pf1-f181.google.com with SMTP id
 d2e1a72fcca58-7b8eff36e3bso2439210b3a.2
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Nov 2025 11:22:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1763493757; x=1764098557; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=gvEa0jnc5aqBUZoWbfiQtt/7FtL9NO49WZyr4JCqvhE=;
 b=lFwHq4xpce3oUOmp+SV58tMh3lN2r5flbx8lKjDSReEzW6cuIe+fouo0SwfoOZ4HZ1
 pupjPReFC3Gxvj4CJ1KjbRqRoWWt+xbX72ln3oXyPkeFvGFUsacOBevlFJ7GVPSvdN1n
 lGZf7n2ZXcFnWYqgmApC/I2aFQOm0aFmFz52OCu5vveBRAdIwrCdqfwk+J4JJWxD1U1I
 AIXzsKfoy1kZ0+bJV+HKMU1/LZ9vdV9hWdlfUTYYtD3OW+BdwFGwoPzuC3p8+Mcll/2j
 IKUS1Ua/FXjQS7+04UpzzoI6yJ97/4IKwWgjRzUWINclAzXb2frEPHsY/8/sfHBAlIiX
 fyfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1763493757; x=1764098557;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=gvEa0jnc5aqBUZoWbfiQtt/7FtL9NO49WZyr4JCqvhE=;
 b=nGm0krNw7p9b7FE+F0JDY/Pf84q7tViwC3rz/hjHZ13HmDjaHpsLvv5riPvkLaxptJ
 OKAd1ZtdzI9e/mDwRmyjfdOgIRuqIKAQIYLUHTcfiwUgsOrgT2JNVZu+4Luu33lTiXNL
 P1NGzCO2o6pdKfVRE9NYhEvFWxIlEXVsG3q0ywLYN/IlMXCMnLVpH3lZvZGCAQJafExy
 61+KVmIM1p5aeaq1qXcejZa0gkC8sxJH4R1FMn8g2Ah3QO5sLZsc+TuCMf2G8dpeCccs
 VXFCmbxelR1KfSeVt7fw259r0yQN4DdJnlYvWSa7d2BTB58lesLYKTEyf0zvF/Jx8LbQ
 gcYA==
X-Forwarded-Encrypted: i=1;
 AJvYcCW6agGT1tm1M+e68o53oiqEIIjLwztMG//2KX8R9MVXu28jOiafkhHptlprYyrKhhboNlPhilOWwFk=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwQssvql37+WFsX5L4CgQBMtWqPxWZ/aUI9y9zHviyHdsK1pbRI
 U4gpHI2zTwNTUQgb+HMQs1Qy9moME4IzVDGzaYTs9ziCUPwosKrJZBF9
X-Gm-Gg: ASbGncuHi/AfwPto0s24cWsWlSNQ3sm5TRwWRRcVzoNVg3D614wEAPMmjJVRHwC+tz3
 HjUvJisxdQi36VSZYud1E73/2CobwY39x5hgLg20iKyo7a1KBnT/enmuoDmeDPjjrOnnNVltXN0
 U0m3LeR3YK3F5CReR00JsBk/l4cbDIxkWMxHBGewWF8BpaYEfnn+iQxxxCK6MIdUkypcpg4RqFA
 qDFVRC93zqW+tm4lwu8VAwogZaldqk/jN5wHkDUi2yDPU+89NOSLoX6wSpqgBgqkNhBpXf+0KuH
 HaeVcn4MOmKrP1IB/gKuxEq8QWaYONxXr1TR2s7qq6Vsx1Wsn623pBCnTcRSacH0yQAbd2P8Wlm
 ajP3poKTOXZt07Jr7rqxQVE2tSGw1dLvMz/57LcweOgzVH4zqV6ighdd6YTVcS4BrBZok9p4DiK
 uKWlFO/5ngEdnRWrJjSqZ87oS5E7iaSNItR7OCakvI7iY7N4PEUvkeAqy6n4rao8bPDQu2mOH+9
 w==
X-Google-Smtp-Source: AGHT+IELEZhYWlXzd98KtP04N9FRevtbbB+qIzdu2jhq6XqeRQcPW3sY3BwS8IiZhjDpaOtgcw6rPw==
X-Received: by 2002:a05:7022:43a6:b0:11a:49bd:be28 with SMTP id
 a92af1059eb24-11b40e846demr7788674c88.4.1763493756655; 
 Tue, 18 Nov 2025 11:22:36 -0800 (PST)
Received: from google.com ([2a00:79e0:2ebe:8:a011:6b85:c55d:d1f5])
 by smtp.gmail.com with ESMTPSA id
 a92af1059eb24-11b06088625sm64635016c88.8.2025.11.18.11.22.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 18 Nov 2025 11:22:36 -0800 (PST)
Date: Tue, 18 Nov 2025 11:22:32 -0800
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Josua Mayer <josua@solid-run.com>
Cc: Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
 Shawn Guo <shawnguo@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>, 
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
 Thierry Reding <thierry.reding@gmail.com>, 
 Jon Nettleton <jon@solid-run.com>,
 Mikhail Anikin <mikhail.anikin@solid-run.com>, 
 Yazan Shhady <yazan.shhady@solid-run.com>, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, linux-input@vger.kernel.org,
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v3 04/11] Input: ilitek_ts_i2c: fix warning with gpio
 controllers that sleep
Message-ID: <rifyic7w2zyjupbmzwcewcslryqiyexxdvbgcuxtkw3trmtulw@y4otarfyvgm7>
References: <20251117-imx8mp-hb-iiot-v3-0-bf1a4cf5fa8e@solid-run.com>
 <20251117-imx8mp-hb-iiot-v3-4-bf1a4cf5fa8e@solid-run.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251117-imx8mp-hb-iiot-v3-4-bf1a4cf5fa8e@solid-run.com>
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

Hi Josua,

On Mon, Nov 17, 2025 at 01:28:46PM +0100, Josua Mayer wrote:
> The ilitek touchscreen driver uses the non-sleeping gpiod_set_value
> function for reset.
> 
> Switch to using gpiod_set_value_cansleep() when controlling reset_gpio to
> support GPIO providers that may sleep, such as I2C GPIO expanders.
> 
> This fixes noisy complaints in kernel log for gpio providers that do
> sleep.
> 
> Signed-off-by: Josua Mayer <josua@solid-run.com>
> ---
>  drivers/input/touchscreen/ilitek_ts_i2c.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/input/touchscreen/ilitek_ts_i2c.c b/drivers/input/touchscreen/ilitek_ts_i2c.c
> index 0dd632724a003..8c5a54b336816 100644
> --- a/drivers/input/touchscreen/ilitek_ts_i2c.c
> +++ b/drivers/input/touchscreen/ilitek_ts_i2c.c
> @@ -396,9 +396,9 @@ static const struct ilitek_protocol_map ptl_func_map[] = {
>  static void ilitek_reset(struct ilitek_ts_data *ts, int delay)
>  {
>  	if (ts->reset_gpio) {
> -		gpiod_set_value(ts->reset_gpio, 1);
> +		gpiod_set_value_cansleep(ts->reset_gpio, 1);
>  		mdelay(10);

This (and below) should be usleep_range/msleep/fsleep.

> -		gpiod_set_value(ts->reset_gpio, 0);
> +		gpiod_set_value_cansleep(ts->reset_gpio, 0);
>  		mdelay(delay);
>  	}
>  }
> 

Thanks.

-- 
Dmitry
