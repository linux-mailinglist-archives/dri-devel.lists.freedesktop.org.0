Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 94E1B91C58A
	for <lists+dri-devel@lfdr.de>; Fri, 28 Jun 2024 20:16:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0E61610ECF6;
	Fri, 28 Jun 2024 18:16:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="QIhKm26q";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-f52.google.com (mail-io1-f52.google.com
 [209.85.166.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 58EFD10ECF6
 for <dri-devel@lists.freedesktop.org>; Fri, 28 Jun 2024 18:16:31 +0000 (UTC)
Received: by mail-io1-f52.google.com with SMTP id
 ca18e2360f4ac-7f6154e20bbso34753939f.2
 for <dri-devel@lists.freedesktop.org>; Fri, 28 Jun 2024 11:16:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1719598590; x=1720203390; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=oCsaVaw4BhqD+Xyg8ynJ6DJaSe0bJqCFl9DQMDKbxYg=;
 b=QIhKm26qeNUR+clErar7sMmvfdNeMK3F8YgtGcraFH8OTfGqT9xLbd5BYSCJmamJyO
 Gb5IsouNBUVZyJJILrm84VheYbT7nAS8bs55PT790w1XQGEdJRtphDepP0bmn8G7EmVa
 F5JvtU8f/jCaFbAUrTcabDVk0x8u4EWE7XEzMsSNOmSiXZptfO1FRGWCmev0gckoQpNP
 XDBV4bK3x4JUTEi/MhJUaCtV/gvfxFbWSCLhpo8GfD0WZbGn38c32v+m1cW+rvujUciu
 +WQpzqNeWujsHOOCMSiAhbIPQ3XG3WDMD8SmzQU8Dm1n1veCOjUuSvbIKm3jM1fEwQvp
 m3xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1719598590; x=1720203390;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=oCsaVaw4BhqD+Xyg8ynJ6DJaSe0bJqCFl9DQMDKbxYg=;
 b=h5KWU78YI749VcL4lOiVqgRjgioJ12upP/T3H3/B9kpjJBWkRxR3Y20RFmUDKJXdgf
 4ggLyiTAOXDx7jpxongd+y/ZOXZ5zb3hIfp3fLg3938Asjw+hQvue0tTRMY9f1ZiJpHA
 L5taToHh/XLOqljACLtSrHUR6mGKXgYw9ew8CdLMsCqy7fB+V1iCXCyuDX1SougMF0e5
 tfbGmYM4CaTwLTv88Q4TDuMEeTTB+sS0r+5A1N5DzX4BNRlRTsUYDLkMH4hQSqwAMh0H
 pJ6g18MFdn/g1oCp6lChXS7Y/3BbeSdNZsA0BgNctINN3Gd6sYVgSjxaCVrlu4VZgOIb
 af1Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCVBs4D8DME2bX36M5Iyo7f3OzbyHXsnebM19KF6zohvUdGlAPq0hgNg/N4Og4Aux/kAMPWW9HRtVTFSZBTeA8D8JsxwA4x7VFRH7r6tVjW+
X-Gm-Message-State: AOJu0YzW5gA2VY1miDWTqpkeCd6sgLPCgxOJNJLC1arfW8UpGCKwjm5m
 myEp4M1lX5pT+GELpaA8fSktFFrTKyZxeBlH62PrAggDl2DMss0Z
X-Google-Smtp-Source: AGHT+IGuKG9hnWHCmMAXNatkQYs5+I9y300IdNC6/HNAZ5tSrEEUeSsWTdrlSPRh9aBkW3sh3wAz9A==
X-Received: by 2002:a05:6602:2dd2:b0:7eb:5250:a54a with SMTP id
 ca18e2360f4ac-7f3a75a6321mr2326073139f.7.1719598590363; 
 Fri, 28 Jun 2024 11:16:30 -0700 (PDT)
Received: from [10.0.0.19] ([122.172.84.231]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-708044b1124sm1920736b3a.181.2024.06.28.11.16.27
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 28 Jun 2024 11:16:30 -0700 (PDT)
Message-ID: <db64751c-1305-4dc2-a889-3d5da2ebd455@gmail.com>
Date: Fri, 28 Jun 2024 23:46:26 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/panel: asus-z00t-tm5p5-n35596: transition to mipi_dsi
 wrapped functions
To: neil.armstrong@linaro.org, quic_jesszhan@quicinc.com
Cc: dianders@chromium.org, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com, daniel@ffwll.ch,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20240628181238.169681-1-tejasvipin76@gmail.com>
 <20240628181238.169681-4-tejasvipin76@gmail.com>
Content-Language: en-US
From: Tejas Vipin <tejasvipin76@gmail.com>
In-Reply-To: <20240628181238.169681-4-tejasvipin76@gmail.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Sorry, didn't intend to send this. please ignore it :p

On 6/28/24 11:42 PM, Tejas Vipin wrote:
> Use functions introduced in commit 966e397e4f60 ("drm/mipi-dsi:
> Introduce mipi_dsi_*_write_seq_multi()") and commit f79d6d28d8fe
> ("drm/mipi-dsi: wrap more functions for streamline handling") for the
> asus-z00t-tm5p5-n35596 panel.
> 
> Signed-off-by: Tejas Vipin <tejasvipin76@gmail.com>
> ---
>  .../drm/panel/panel-asus-z00t-tm5p5-n35596.c  | 140 ++++++++----------
>  1 file changed, 59 insertions(+), 81 deletions(-)
> 
> diff --git a/drivers/gpu/drm/panel/panel-asus-z00t-tm5p5-n35596.c b/drivers/gpu/drm/panel/panel-asus-z00t-tm5p5-n35596.c
> index bcaa63d1955f..b05a663c134c 100644
> --- a/drivers/gpu/drm/panel/panel-asus-z00t-tm5p5-n35596.c
> +++ b/drivers/gpu/drm/panel/panel-asus-z00t-tm5p5-n35596.c
> @@ -33,119 +33,97 @@ static void tm5p5_nt35596_reset(struct tm5p5_nt35596 *ctx)
>  	usleep_range(15000, 16000);
>  }
>  
> -static int tm5p5_nt35596_on(struct tm5p5_nt35596 *ctx)
> +static void tm5p5_nt35596_on(struct mipi_dsi_multi_context *dsi_ctx)
>  {
> -	struct mipi_dsi_device *dsi = ctx->dsi;
> -
> -	mipi_dsi_generic_write_seq(dsi, 0xff, 0x05);
> -	mipi_dsi_generic_write_seq(dsi, 0xfb, 0x01);
> -	mipi_dsi_generic_write_seq(dsi, 0xc5, 0x31);
> -	mipi_dsi_generic_write_seq(dsi, 0xff, 0x04);
> -	mipi_dsi_generic_write_seq(dsi, 0x01, 0x84);
> -	mipi_dsi_generic_write_seq(dsi, 0x05, 0x25);
> -	mipi_dsi_generic_write_seq(dsi, 0x06, 0x01);
> -	mipi_dsi_generic_write_seq(dsi, 0x07, 0x20);
> -	mipi_dsi_generic_write_seq(dsi, 0x08, 0x06);
> -	mipi_dsi_generic_write_seq(dsi, 0x09, 0x08);
> -	mipi_dsi_generic_write_seq(dsi, 0x0a, 0x10);
> -	mipi_dsi_generic_write_seq(dsi, 0x0b, 0x10);
> -	mipi_dsi_generic_write_seq(dsi, 0x0c, 0x10);
> -	mipi_dsi_generic_write_seq(dsi, 0x0d, 0x14);
> -	mipi_dsi_generic_write_seq(dsi, 0x0e, 0x14);
> -	mipi_dsi_generic_write_seq(dsi, 0x0f, 0x14);
> -	mipi_dsi_generic_write_seq(dsi, 0x10, 0x14);
> -	mipi_dsi_generic_write_seq(dsi, 0x11, 0x14);
> -	mipi_dsi_generic_write_seq(dsi, 0x12, 0x14);
> -	mipi_dsi_generic_write_seq(dsi, 0x17, 0xf3);
> -	mipi_dsi_generic_write_seq(dsi, 0x18, 0xc0);
> -	mipi_dsi_generic_write_seq(dsi, 0x19, 0xc0);
> -	mipi_dsi_generic_write_seq(dsi, 0x1a, 0xc0);
> -	mipi_dsi_generic_write_seq(dsi, 0x1b, 0xb3);
> -	mipi_dsi_generic_write_seq(dsi, 0x1c, 0xb3);
> -	mipi_dsi_generic_write_seq(dsi, 0x1d, 0xb3);
> -	mipi_dsi_generic_write_seq(dsi, 0x1e, 0xb3);
> -	mipi_dsi_generic_write_seq(dsi, 0x1f, 0xb3);
> -	mipi_dsi_generic_write_seq(dsi, 0x20, 0xb3);
> -	mipi_dsi_generic_write_seq(dsi, 0xfb, 0x01);
> -	mipi_dsi_generic_write_seq(dsi, 0xff, 0x00);
> -	mipi_dsi_generic_write_seq(dsi, 0xfb, 0x01);
> -	mipi_dsi_generic_write_seq(dsi, 0x35, 0x01);
> -	mipi_dsi_generic_write_seq(dsi, 0xd3, 0x06);
> -	mipi_dsi_generic_write_seq(dsi, 0xd4, 0x04);
> -	mipi_dsi_generic_write_seq(dsi, 0x5e, 0x0d);
> -	mipi_dsi_generic_write_seq(dsi, 0x11, 0x00);
> -	msleep(100);
> -	mipi_dsi_generic_write_seq(dsi, 0x29, 0x00);
> -	mipi_dsi_generic_write_seq(dsi, 0x53, 0x24);
> -
> -	return 0;
> +	mipi_dsi_generic_write_seq_multi(dsi_ctx, 0xff, 0x05);
> +	mipi_dsi_generic_write_seq_multi(dsi_ctx, 0xfb, 0x01);
> +	mipi_dsi_generic_write_seq_multi(dsi_ctx, 0xc5, 0x31);
> +	mipi_dsi_generic_write_seq_multi(dsi_ctx, 0xff, 0x04);
> +	mipi_dsi_generic_write_seq_multi(dsi_ctx, 0x01, 0x84);
> +	mipi_dsi_generic_write_seq_multi(dsi_ctx, 0x05, 0x25);
> +	mipi_dsi_generic_write_seq_multi(dsi_ctx, 0x06, 0x01);
> +	mipi_dsi_generic_write_seq_multi(dsi_ctx, 0x07, 0x20);
> +	mipi_dsi_generic_write_seq_multi(dsi_ctx, 0x08, 0x06);
> +	mipi_dsi_generic_write_seq_multi(dsi_ctx, 0x09, 0x08);
> +	mipi_dsi_generic_write_seq_multi(dsi_ctx, 0x0a, 0x10);
> +	mipi_dsi_generic_write_seq_multi(dsi_ctx, 0x0b, 0x10);
> +	mipi_dsi_generic_write_seq_multi(dsi_ctx, 0x0c, 0x10);
> +	mipi_dsi_generic_write_seq_multi(dsi_ctx, 0x0d, 0x14);
> +	mipi_dsi_generic_write_seq_multi(dsi_ctx, 0x0e, 0x14);
> +	mipi_dsi_generic_write_seq_multi(dsi_ctx, 0x0f, 0x14);
> +	mipi_dsi_generic_write_seq_multi(dsi_ctx, 0x10, 0x14);
> +	mipi_dsi_generic_write_seq_multi(dsi_ctx, 0x11, 0x14);
> +	mipi_dsi_generic_write_seq_multi(dsi_ctx, 0x12, 0x14);
> +	mipi_dsi_generic_write_seq_multi(dsi_ctx, 0x17, 0xf3);
> +	mipi_dsi_generic_write_seq_multi(dsi_ctx, 0x18, 0xc0);
> +	mipi_dsi_generic_write_seq_multi(dsi_ctx, 0x19, 0xc0);
> +	mipi_dsi_generic_write_seq_multi(dsi_ctx, 0x1a, 0xc0);
> +	mipi_dsi_generic_write_seq_multi(dsi_ctx, 0x1b, 0xb3);
> +	mipi_dsi_generic_write_seq_multi(dsi_ctx, 0x1c, 0xb3);
> +	mipi_dsi_generic_write_seq_multi(dsi_ctx, 0x1d, 0xb3);
> +	mipi_dsi_generic_write_seq_multi(dsi_ctx, 0x1e, 0xb3);
> +	mipi_dsi_generic_write_seq_multi(dsi_ctx, 0x1f, 0xb3);
> +	mipi_dsi_generic_write_seq_multi(dsi_ctx, 0x20, 0xb3);
> +	mipi_dsi_generic_write_seq_multi(dsi_ctx, 0xfb, 0x01);
> +	mipi_dsi_generic_write_seq_multi(dsi_ctx, 0xff, 0x00);
> +	mipi_dsi_generic_write_seq_multi(dsi_ctx, 0xfb, 0x01);
> +	mipi_dsi_generic_write_seq_multi(dsi_ctx, 0x35, 0x01);
> +	mipi_dsi_generic_write_seq_multi(dsi_ctx, 0xd3, 0x06);
> +	mipi_dsi_generic_write_seq_multi(dsi_ctx, 0xd4, 0x04);
> +	mipi_dsi_generic_write_seq_multi(dsi_ctx, 0x5e, 0x0d);
> +	mipi_dsi_generic_write_seq_multi(dsi_ctx, 0x11, 0x00);
> +
> +	mipi_dsi_msleep(dsi_ctx, 100);
> +
> +	mipi_dsi_generic_write_seq_multi(dsi_ctx, 0x29, 0x00);
> +	mipi_dsi_generic_write_seq_multi(dsi_ctx, 0x53, 0x24);
>  }
>  
> -static int tm5p5_nt35596_off(struct tm5p5_nt35596 *ctx)
> +static void tm5p5_nt35596_off(struct mipi_dsi_multi_context *dsi_ctx)
>  {
> -	struct mipi_dsi_device *dsi = ctx->dsi;
> -	struct device *dev = &dsi->dev;
> -	int ret;
> -
> -	ret = mipi_dsi_dcs_set_display_off(dsi);
> -	if (ret < 0) {
> -		dev_err(dev, "Failed to set display off: %d\n", ret);
> -		return ret;
> -	}
> -	msleep(60);
> +	mipi_dsi_dcs_set_display_off_multi(dsi_ctx);
>  
> -	ret = mipi_dsi_dcs_enter_sleep_mode(dsi);
> -	if (ret < 0) {
> -		dev_err(dev, "Failed to enter sleep mode: %d\n", ret);
> -		return ret;
> -	}
> +	mipi_dsi_msleep(dsi_ctx, 60);
>  
> -	mipi_dsi_dcs_write_seq(dsi, 0x4f, 0x01);
> +	mipi_dsi_dcs_enter_sleep_mode_multi(dsi_ctx);
>  
> -	return 0;
> +	mipi_dsi_dcs_write_seq_multi(dsi_ctx, 0x4f, 0x01);
>  }
>  
>  static int tm5p5_nt35596_prepare(struct drm_panel *panel)
>  {
>  	struct tm5p5_nt35596 *ctx = to_tm5p5_nt35596(panel);
> -	struct device *dev = &ctx->dsi->dev;
> -	int ret;
> +	struct mipi_dsi_multi_context dsi_ctx =	{.dsi = ctx->dsi};
>  
> -	ret = regulator_bulk_enable(ARRAY_SIZE(ctx->supplies), ctx->supplies);
> -	if (ret < 0) {
> -		dev_err(dev, "Failed to enable regulators: %d\n", ret);
> -		return ret;
> -	}
> +	dsi_ctx.accum_err = regulator_bulk_enable(ARRAY_SIZE(ctx->supplies), ctx->supplies);
> +	if (dsi_ctx.accum_err)
> +		return dsi_ctx.accum_err;
>  
>  	tm5p5_nt35596_reset(ctx);
>  
> -	ret = tm5p5_nt35596_on(ctx);
> -	if (ret < 0) {
> -		dev_err(dev, "Failed to initialize panel: %d\n", ret);
> +	tm5p5_nt35596_on(&dsi_ctx);
> +
> +	if (dsi_ctx.accum_err) {
>  		gpiod_set_value_cansleep(ctx->reset_gpio, 0);
>  		regulator_bulk_disable(ARRAY_SIZE(ctx->supplies),
>  				       ctx->supplies);
> -		return ret;
>  	}
>  
> -	return 0;
> +	return dsi_ctx.accum_err;
>  }
>  
>  static int tm5p5_nt35596_unprepare(struct drm_panel *panel)
>  {
>  	struct tm5p5_nt35596 *ctx = to_tm5p5_nt35596(panel);
> -	struct device *dev = &ctx->dsi->dev;
> -	int ret;
> +	struct mipi_dsi_multi_context dsi_ctx =	{.dsi = ctx->dsi};
>  
> -	ret = tm5p5_nt35596_off(ctx);
> -	if (ret < 0)
> -		dev_err(dev, "Failed to un-initialize panel: %d\n", ret);
> +	tm5p5_nt35596_off(&dsi_ctx);
>  
>  	gpiod_set_value_cansleep(ctx->reset_gpio, 0);
>  	regulator_bulk_disable(ARRAY_SIZE(ctx->supplies),
>  			       ctx->supplies);
>  
> -	return 0;
> +	return dsi_ctx.accum_err;
>  }
>  
>  static const struct drm_display_mode tm5p5_nt35596_mode = {

-- 
Tejas Vipin
