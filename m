Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 67F2DA35078
	for <lists+dri-devel@lfdr.de>; Thu, 13 Feb 2025 22:28:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1B48710EBA8;
	Thu, 13 Feb 2025 21:27:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="ONvioHUF";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com
 [209.85.167.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9524210EBA8
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Feb 2025 21:27:55 +0000 (UTC)
Received: by mail-lf1-f45.google.com with SMTP id
 2adb3069b0e04-5450b91da41so1142025e87.3
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Feb 2025 13:27:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1739482074; x=1740086874; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=32pmN7Rojbq3WiE3YdIwTHw//I+OMOn4ggHoRZW/QSw=;
 b=ONvioHUFUHJdJA0y3yXrUl5IILG8hmO1/BRKPmM9SN20ZD9jY0+4YAk8l3SGNLPpV8
 gE2v2ylZXfcolXQ+7PC6pxlQNYfijKCRT+l9H6sVx2egPm5jCCQSY/2Ut45wbdT6+ZTH
 VXv+tNvO+8FsQUzzk8wRa2V+geiDR57mOVXKePZqE5OofzQGJ1a7cMycnFQmK1koAycH
 zn8oco15fgQRNYF6eFohPga00YrFoceNs7GLQEvNKl/3ks3+wMQILRndfVKQCKyPm2G7
 zMItOqqKmR2hN3YeZrHWvZe7glWQyo3X2ratX+HLf59MbgBr7f04qGqsnuZpEGNmF8dZ
 mvVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1739482074; x=1740086874;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=32pmN7Rojbq3WiE3YdIwTHw//I+OMOn4ggHoRZW/QSw=;
 b=HKc9zFBywC1ufcbvi8Sbnl+nuRHtcux+5OHtfBoW6Cs8Tv39i45VpK4/F7/ydWrdhh
 2UMJDU8bNHhAaEXTlG2XQDaETmRNqgljQC65AVoLHQKQrztL67UgUDQnlFi8rf5ReWgm
 iKfUrxm+2AeOdq8GcH46hETD7pJJMDaBVqMMw468jjY5bYQn5FBKQG2nAacQDMfruZIs
 uM0Z9R+VLsylWqhCNZKazYjs/UiSkpqVEvr4dBzki43ZzN9bfmB1zQjeHM8tZQ+gCkX6
 hhKhG1fBtnoGClxQG3HUwDGUsxIzXwUFmeG4S0AOceg2tIp19DNJ8PSAsRJYtSacK2w4
 pWrg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXUrUTMxOe3nIWK8QLce6UFcuaiHR5bgvOw0o5Fw5ypY9TeijtWzv+SYxpu66dNU/Ol6dKG5yWeF/g=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YysJLBYq7Y3qHDXeqHjc8KclayINyE9L51w4JRYLpdDPs+OkJEt
 bHudkKl/BdZKRayDdtEAGOccC2jMlt4Ag2gKXA2UONWvb8r2agUg3g7jQG+R0q4=
X-Gm-Gg: ASbGnctnebDJyZS0klDuFT7ko6dPVBacQWnnUg8luSn9eL+DRd3ljhUzFWq5Nv8X309
 HkLtY+OlNRsG4hSIwaBAhq+oDpG9MYaqOulMb2MqMptm4PwzPWQ3B/KJWO3vPHZX3+Pmu86SrRE
 fKaOJ7HCBt5s30W0Rysz+zrowfpzDvUN5xfV9ituC0QkIIIadSamFbdTlYd5P1s+cc/gAouBt2d
 Q+pV3KNCHin1Wvnb3t6/ht47lGhqXHmHdWuwPY6O0Tq8rnlFsRUMyKM37Ltxm3zm9/XWBVIijtx
 YKu5vKoPooiQbDTqbBVGeSfBuOQXUwwdlmaIgdWRgIsprjw87BTIcNP2duTc8N7VWTQ+YHg=
X-Google-Smtp-Source: AGHT+IFIGbtJJnFgvvWhZkYTvCJuMlZMYCd1Dn3/s6EA3d4JTiO9s/mkS5r3NViYziOC5l1QjLSJHQ==
X-Received: by 2002:a05:6512:3f0d:b0:545:646:7522 with SMTP id
 2adb3069b0e04-54517f78ef4mr3263770e87.0.1739482073789; 
 Thu, 13 Feb 2025 13:27:53 -0800 (PST)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5451f107f05sm295616e87.120.2025.02.13.13.27.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 13 Feb 2025 13:27:52 -0800 (PST)
Date: Thu, 13 Feb 2025 23:27:49 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Anusha Srivatsa <asrivats@redhat.com>
Cc: Neil Armstrong <neil.armstrong@linaro.org>, 
 Jessica Zhang <quic_jesszhan@quicinc.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Joel Selvaraj <jo@jsfamily.in>, 
 Ondrej Jirman <megi@xff.cz>, Javier Martinez Canillas <javierm@redhat.com>, 
 Jianhua Lu <lujianhua000@gmail.com>, Robert Chiras <robert.chiras@nxp.com>, 
 Artur Weber <aweber.kernel@gmail.com>, Jonathan Corbet <corbet@lwn.net>, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-doc@vger.kernel.org
Subject: Re: [PATCH 04/20] drm/panel/boe-bf060y8m-aj0: Move to using
 mipi_dsi_*_multi() variants
Message-ID: <qmp3ofpoynff2r66ye6ryv65lztfgbz2gsuoserfsuh3zgeglw@rlibvmp2serx>
References: <20250213-mipi_cocci_multi-v1-0-67d94ff319cc@redhat.com>
 <20250213-mipi_cocci_multi-v1-4-67d94ff319cc@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250213-mipi_cocci_multi-v1-4-67d94ff319cc@redhat.com>
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

On Thu, Feb 13, 2025 at 03:44:21PM -0500, Anusha Srivatsa wrote:
> Stop using deprecated API.
> Used Coccinelle to make the change.
> 
> @rule_3@
> identifier dsi_var;
> identifier r;
> identifier func;
> type t;
> position p;
> expression dsi_device;
> expression list es;
> @@
> t func(...) {
> ...
> struct mipi_dsi_device *dsi_var = dsi_device;
> +struct mipi_dsi_multi_context dsi_ctx = { .dsi = dsi_var };
> <+...
> (
> -mipi_dsi_dcs_write_seq(dsi_var,es);
> +mipi_dsi_dcs_write_seq_multi(&dsi_ctx,es);
> |
> -r = mipi_dsi_dcs_exit_sleep_mode(dsi_var)@p;
> +mipi_dsi_dcs_exit_sleep_mode_multi(&dsi_ctx);
> |
> -r = mipi_dsi_dcs_enter_sleep_mode(dsi_var)@p;
> +mipi_dsi_dcs_enter_sleep_mode_multi(&dsi_ctx);
> |
> -r = mipi_dsi_dcs_set_display_off(dsi_var)@p;
> +mipi_dsi_dcs_set_display_off_multi(&dsi_ctx);
> |
> .....//rest of the mipi APIs with _multi variant
> )
> <+...
> -if(r < 0) {
> -...
> -}
> ...+>
> }

Granted the amount of issues, I'd kindly ask you to manually review your
patches after coccinelle before sending them to the mailing list.

I'd really repeat Doug's suggestion: please perform those conversions
one by one, etc.

I'm not going to review the rest of the series, Coccinelle most likely
can not catch all of this.

Another note, this is version 2 of your series, so it should have been
marked with v2.

> 
> Signed-off-by: Anusha Srivatsa <asrivats@redhat.com>
> ---
>  drivers/gpu/drm/panel/panel-boe-bf060y8m-aj0.c | 75 +++++++++++---------------
>  1 file changed, 30 insertions(+), 45 deletions(-)
> 
> diff --git a/drivers/gpu/drm/panel/panel-boe-bf060y8m-aj0.c b/drivers/gpu/drm/panel/panel-boe-bf060y8m-aj0.c
> index 7e66db4a88bbed27920107458d01efd9cf4986df..8903a6c889794330fa1f54a30e779c7d5fbc4b14 100644
> --- a/drivers/gpu/drm/panel/panel-boe-bf060y8m-aj0.c
> +++ b/drivers/gpu/drm/panel/panel-boe-bf060y8m-aj0.c
> @@ -55,42 +55,34 @@ static void boe_bf060y8m_aj0_reset(struct boe_bf060y8m_aj0 *boe)
>  static int boe_bf060y8m_aj0_on(struct boe_bf060y8m_aj0 *boe)
>  {
>  	struct mipi_dsi_device *dsi = boe->dsi;
> -	struct device *dev = &dsi->dev;
> -	int ret;
> +	struct mipi_dsi_multi_context dsi_ctx = { .dsi = dsi };
>  
> -	mipi_dsi_dcs_write_seq(dsi, 0xb0, 0xa5, 0x00);
> -	mipi_dsi_dcs_write_seq(dsi, 0xb2, 0x00, 0x4c);
> -	mipi_dsi_dcs_write_seq(dsi, MIPI_DCS_SET_3D_CONTROL, 0x10);
> -	mipi_dsi_dcs_write_seq(dsi, MIPI_DCS_WRITE_POWER_SAVE, DCS_ALLOW_HBM_RANGE);
> -	mipi_dsi_dcs_write_seq(dsi, 0xf8,
> -			       0x00, 0x08, 0x10, 0x00, 0x22, 0x00, 0x00, 0x2d);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xb0, 0xa5, 0x00);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xb2, 0x00, 0x4c);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, MIPI_DCS_SET_3D_CONTROL, 0x10);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, MIPI_DCS_WRITE_POWER_SAVE,
> +				     DCS_ALLOW_HBM_RANGE);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xf8, 0x00, 0x08, 0x10, 0x00,
> +				     0x22, 0x00, 0x00, 0x2d);
>  
> -	ret = mipi_dsi_dcs_exit_sleep_mode(dsi);
> -	if (ret < 0) {
> -		dev_err(dev, "Failed to exit sleep mode: %d\n", ret);
> -		return ret;
> -	}
> +	mipi_dsi_dcs_exit_sleep_mode_multi(&dsi_ctx);
>  	msleep(30);

mipi_dsi_msleep();

>  
> -	mipi_dsi_dcs_write_seq(dsi, 0xb0, 0xa5, 0x00);
> -	mipi_dsi_dcs_write_seq(dsi, 0xc0,
> -			       0x08, 0x48, 0x65, 0x33, 0x33, 0x33,
> -			       0x2a, 0x31, 0x39, 0x20, 0x09);
> -	mipi_dsi_dcs_write_seq(dsi, 0xc1, 0x00, 0x00, 0x00, 0x1f, 0x1f,
> -			       0x1f, 0x1f, 0x1f, 0x1f, 0x1f, 0x1f, 0x1f,
> -			       0x1f, 0x1f, 0x1f, 0x1f, 0x1f, 0x1f);
> -	mipi_dsi_dcs_write_seq(dsi, 0xe2, 0x20, 0x04, 0x10, 0x12, 0x92,
> -			       0x4f, 0x8f, 0x44, 0x84, 0x83, 0x83, 0x83,
> -			       0x5c, 0x5c, 0x5c);
> -	mipi_dsi_dcs_write_seq(dsi, 0xde, 0x01, 0x2c, 0x00, 0x77, 0x3e);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xb0, 0xa5, 0x00);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xc0, 0x08, 0x48, 0x65, 0x33,
> +				     0x33, 0x33, 0x2a, 0x31, 0x39, 0x20, 0x09);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xc1, 0x00, 0x00, 0x00, 0x1f,
> +				     0x1f, 0x1f, 0x1f, 0x1f, 0x1f, 0x1f, 0x1f,
> +				     0x1f, 0x1f, 0x1f, 0x1f, 0x1f, 0x1f, 0x1f);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xe2, 0x20, 0x04, 0x10, 0x12,
> +				     0x92, 0x4f, 0x8f, 0x44, 0x84, 0x83, 0x83,
> +				     0x83, 0x5c, 0x5c, 0x5c);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xde, 0x01, 0x2c, 0x00, 0x77,
> +				     0x3e);
>  
>  	msleep(30);

mipi_dsi_msleep()

>  
> -	ret = mipi_dsi_dcs_set_display_on(dsi);
> -	if (ret < 0) {
> -		dev_err(dev, "Failed to set display on: %d\n", ret);
> -		return ret;
> -	}
> +	mipi_dsi_dcs_set_display_on_multi(&dsi_ctx);
>  	msleep(50);

mipi_dsi_msleep()

>  
>  	return 0;

return dsi_ctx.accum_err


> @@ -99,24 +91,18 @@ static int boe_bf060y8m_aj0_on(struct boe_bf060y8m_aj0 *boe)
>  static int boe_bf060y8m_aj0_off(struct boe_bf060y8m_aj0 *boe)
>  {
>  	struct mipi_dsi_device *dsi = boe->dsi;
> -	struct device *dev = &dsi->dev;
> -	int ret;
> +	struct mipi_dsi_multi_context dsi_ctx = { .dsi = dsi };
>  
>  	/* OFF commands sent in HS mode */
>  	dsi->mode_flags &= ~MIPI_DSI_MODE_LPM;
> -	ret = mipi_dsi_dcs_set_display_off(dsi);
> -	if (ret < 0) {
> -		dev_err(dev, "Failed to set display off: %d\n", ret);
> -		return ret;
> -	}
> +	mipi_dsi_dcs_set_display_off_multi(&dsi_ctx);
> +
>  	msleep(20);

mipi_dsi_msleep()

>  
> -	ret = mipi_dsi_dcs_enter_sleep_mode(dsi);
> -	if (ret < 0) {
> -		dev_err(dev, "Failed to enter sleep mode: %d\n", ret);
> -		return ret;
> -	}
> +	mipi_dsi_dcs_enter_sleep_mode_multi(&dsi_ctx);
> +
>  	usleep_range(1000, 2000);

mipi_dsi_usleep_range()

> +
>  	dsi->mode_flags |= MIPI_DSI_MODE_LPM;
>  
>  	return 0;

return dsi_ctx.accum_err;

> @@ -233,12 +219,10 @@ static const struct drm_panel_funcs boe_bf060y8m_aj0_panel_funcs = {
>  static int boe_bf060y8m_aj0_bl_update_status(struct backlight_device *bl)
>  {
>  	struct mipi_dsi_device *dsi = bl_get_data(bl);
> +	struct mipi_dsi_multi_context dsi_ctx = { .dsi = dsi };
>  	u16 brightness = backlight_get_brightness(bl);
> -	int ret;
>  
> -	ret = mipi_dsi_dcs_set_display_brightness(dsi, brightness);
> -	if (ret < 0)
> -		return ret;
> +	mipi_dsi_dcs_set_display_brightness_multi(&dsi_ctx, brightness);
>  
>  	return 0;

return dsi_ctx.accum_err;

But why? There is little point in coverting this function.

>  }
> @@ -246,6 +230,7 @@ static int boe_bf060y8m_aj0_bl_update_status(struct backlight_device *bl)
>  static int boe_bf060y8m_aj0_bl_get_brightness(struct backlight_device *bl)
>  {
>  	struct mipi_dsi_device *dsi = bl_get_data(bl);
> +
>  	u16 brightness;
>  	int ret;

-- 
With best wishes
Dmitry
