Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6EC9C8C1E34
	for <lists+dri-devel@lfdr.de>; Fri, 10 May 2024 08:39:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1F3D010E342;
	Fri, 10 May 2024 06:39:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=fairphone.com header.i=@fairphone.com header.b="gOW71CVR";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f173.google.com (mail-lj1-f173.google.com
 [209.85.208.173])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9227610E342
 for <dri-devel@lists.freedesktop.org>; Fri, 10 May 2024 06:39:44 +0000 (UTC)
Received: by mail-lj1-f173.google.com with SMTP id
 38308e7fff4ca-2e3f6166e4aso29269071fa.1
 for <dri-devel@lists.freedesktop.org>; Thu, 09 May 2024 23:39:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=fairphone.com; s=fair; t=1715323182; x=1715927982; darn=lists.freedesktop.org;
 h=in-reply-to:references:cc:to:from:subject:message-id:date
 :content-transfer-encoding:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=yDDYjOZbYyI7+VrCFYHuMsQn9IaAJCiNGNvsyl18CMA=;
 b=gOW71CVR6cVwt1UMrmO5cG1xpyutTdSd623+Va/XYoRwnaQ8/dZdhVqtTLKD6VtBeG
 I2BY07xosVn7waw8nRV3dcNtE0wQ3HurF71hmhxZYr+5Z4mqGNTxnbyHmVqG1elJrBlG
 x/313WyRdjBjEy4uZaLTG0SgfRDFE2qq+cJhFwvKmGXODjLWoRkacDGc0ZpLhyjGkATA
 MKD9GMwmwWS4gp5UWo7v6MJGb8L6E2i+EEZdT+DEqZZeBCi2N54k2q/hK+PeTkZGquBV
 YkZwJnin0M/xRpDWJ8sbp+SUlu9sVd9i7uJ7UZImY/GGkufdXQO7WyIdicv3a5nWFvsn
 dAZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1715323182; x=1715927982;
 h=in-reply-to:references:cc:to:from:subject:message-id:date
 :content-transfer-encoding:mime-version:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=yDDYjOZbYyI7+VrCFYHuMsQn9IaAJCiNGNvsyl18CMA=;
 b=mp6HagI1uTHdRV3HfLhZkxQ7T6bEB0mwSXUaSuJfNG1BgJFzSq8GWY4ShdyYB09bMj
 zS77bn4rBVI5clPerVZeP9l6Vrc9Ha/fk4o87SCTlTaX+jB/W0akw2Tm6nUKeyVxVqtQ
 1CrutRoRwvjZam155Y3vPA1Ly9hluPi3z4bcWSMWqP5z345GTLe6RMHVxClOSh1097El
 eby0zW3qlUJsfb+aOsmjt1xDZtRMPcPUme544V91KnsvejJ8tWvEIQoNCCFZ8+/9tGb8
 hxyioBldvEpvQ99iN4t3BQreO+2SfaJdfl39AusBPELuTB/VPvp6iR/QDkYXKqpZr27D
 0EpQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWUmMRkdlSUVwawOG7K04IL9rlA8PTCBfRGgSvV1oQL/GjCd+I7FTwSkNR0v0qskWrlUYHkSIo4shHJ0hIuMx5vfjyxRCkEFcNxtLi9PVS9
X-Gm-Message-State: AOJu0Yw8vK4ETpc+X4Md8/5P0r4K64bCa/gCB8A7fQ546HEKdZkRlbBb
 vuVA1j5xzNR6ohZA6NrixwpyDbHnPWPTZ/Ct12jUxGkF4R1TEqqER7cInM42A14=
X-Google-Smtp-Source: AGHT+IGTdkIuRQEy0jY4PTiYExRK3QqxMe0SAVoIPw3mJH1Zqc0JsGLFwwgxvxkPwCC5Ylk5LEfNcA==
X-Received: by 2002:a19:761a:0:b0:519:e878:9385 with SMTP id
 2adb3069b0e04-5220fd7c7eemr1123427e87.18.1715323182260; 
 Thu, 09 May 2024 23:39:42 -0700 (PDT)
Received: from localhost
 (2a02-a210-20ba-5a00-9ceb-707b-2d57-26f7.cable.dynamic.v6.ziggo.nl.
 [2a02:a210:20ba:5a00:9ceb:707b:2d57:26f7])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a5a1781d207sm150850766b.22.2024.05.09.23.39.41
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 09 May 2024 23:39:41 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 10 May 2024 08:39:41 +0200
Message-Id: <D15RBIV5HF6S.2FFLSGU60X1UB@fairphone.com>
Subject: Re: [RFT PATCH v2 01/48] drm/panel: raydium-rm692e5: Stop tracking
 prepared
From: "Luca Weiss" <luca.weiss@fairphone.com>
To: "Douglas Anderson" <dianders@chromium.org>,
 <dri-devel@lists.freedesktop.org>, "Maxime Ripard" <mripard@kernel.org>
Cc: "Linus Walleij" <linus.walleij@linaro.org>, "Chris Morgan"
 <macromorgan@hotmail.com>, "Yuran Pereira" <yuran.pereira@hotmail.com>,
 "Neil Armstrong" <neil.armstrong@linaro.org>, "Konrad Dybcio"
 <konrad.dybcio@linaro.org>, "Daniel Vetter" <daniel@ffwll.ch>, "David
 Airlie" <airlied@gmail.com>, "Jessica Zhang" <quic_jesszhan@quicinc.com>,
 "Maarten Lankhorst" <maarten.lankhorst@linux.intel.com>, "Sam Ravnborg"
 <sam@ravnborg.org>, "Thomas Zimmermann" <tzimmermann@suse.de>,
 <linux-kernel@vger.kernel.org>
X-Mailer: aerc 0.17.0
References: <20240503213441.177109-1-dianders@chromium.org>
 <20240503143327.RFT.v2.1.I784238de4810658212a5786b219f128460562a37@changeid>
In-Reply-To: <20240503143327.RFT.v2.1.I784238de4810658212a5786b219f128460562a37@changeid>
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

On Fri May 3, 2024 at 11:32 PM CEST, Douglas Anderson wrote:
> As talked about in commit d2aacaf07395 ("drm/panel: Check for already
> prepared/enabled in drm_panel"), we want to remove needless code from
> panel drivers that was storing and double-checking the
> prepared/enabled state. Even if someone was relying on the
> double-check before, that double-check is now in the core and not
> needed in individual drivers.
>
> Cc: Luca Weiss <luca.weiss@fairphone.com>
> Cc: Konrad Dybcio <konrad.dybcio@linaro.org>
> Signed-off-by: Douglas Anderson <dianders@chromium.org>

Seems to match with the changes I did for another (generated) panel
driver I upstreamed - see also:
https://github.com/msm8916-mainline/linux-mdss-dsi-panel-driver-generator/c=
ommit/74c104440dfd828aa94194fd279c0c505ab55854

Functionally also seems to be fine, I don't see any problems. Thanks!

Tested-by: Luca Weiss <luca.weiss@fairphone.com>

Regards
Luca

> ---
>
> Changes in v2:
> - New
>
>  drivers/gpu/drm/panel/panel-raydium-rm692e5.c | 10 ----------
>  1 file changed, 10 deletions(-)
>
> diff --git a/drivers/gpu/drm/panel/panel-raydium-rm692e5.c b/drivers/gpu/=
drm/panel/panel-raydium-rm692e5.c
> index a613ba5b816c..21d97f6b8a2f 100644
> --- a/drivers/gpu/drm/panel/panel-raydium-rm692e5.c
> +++ b/drivers/gpu/drm/panel/panel-raydium-rm692e5.c
> @@ -23,7 +23,6 @@ struct rm692e5_panel {
>  	struct drm_dsc_config dsc;
>  	struct regulator_bulk_data supplies[3];
>  	struct gpio_desc *reset_gpio;
> -	bool prepared;
>  };
> =20
>  static inline struct rm692e5_panel *to_rm692e5_panel(struct drm_panel *p=
anel)
> @@ -171,9 +170,6 @@ static int rm692e5_prepare(struct drm_panel *panel)
>  	struct device *dev =3D &ctx->dsi->dev;
>  	int ret;
> =20
> -	if (ctx->prepared)
> -		return 0;
> -
>  	ret =3D regulator_bulk_enable(ARRAY_SIZE(ctx->supplies), ctx->supplies)=
;
>  	if (ret < 0) {
>  		dev_err(dev, "Failed to enable regulators: %d\n", ret);
> @@ -213,8 +209,6 @@ static int rm692e5_prepare(struct drm_panel *panel)
> =20
>  	mipi_dsi_generic_write_seq(ctx->dsi, 0xfe, 0x00);
> =20
> -	ctx->prepared =3D true;
> -
>  	return 0;
>  }
> =20
> @@ -222,13 +216,9 @@ static int rm692e5_unprepare(struct drm_panel *panel=
)
>  {
>  	struct rm692e5_panel *ctx =3D to_rm692e5_panel(panel);
> =20
> -	if (!ctx->prepared)
> -		return 0;
> -
>  	gpiod_set_value_cansleep(ctx->reset_gpio, 1);
>  	regulator_bulk_disable(ARRAY_SIZE(ctx->supplies), ctx->supplies);
> =20
> -	ctx->prepared =3D false;
>  	return 0;
>  }
> =20

