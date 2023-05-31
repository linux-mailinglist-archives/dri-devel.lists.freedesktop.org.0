Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AB5D1717B86
	for <lists+dri-devel@lfdr.de>; Wed, 31 May 2023 11:15:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3BE7F10E49A;
	Wed, 31 May 2023 09:15:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com
 [IPv6:2a00:1450:4864:20::333])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DF1AC10E49A
 for <dri-devel@lists.freedesktop.org>; Wed, 31 May 2023 09:15:32 +0000 (UTC)
Received: by mail-wm1-x333.google.com with SMTP id
 5b1f17b1804b1-3f623adec61so57718515e9.0
 for <dri-devel@lists.freedesktop.org>; Wed, 31 May 2023 02:15:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1685524531; x=1688116531;
 h=content-transfer-encoding:in-reply-to:organization:references:cc:to
 :content-language:subject:reply-to:from:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to;
 bh=ZhUEIe/6jVYKIhcwPw65eyzwSFNkodI6e5UfoL8epWs=;
 b=jhV57lScxsr9IeKjBixIWVvCjBf+0owXdN0K/fqaH0X1HEd4WO2RnICxwAEgxpVMwP
 uEieZr5gSeH18agiJ50So9Wjy5NJeUCLaQypfjjJMvgpaHAp4lOpIS5b5y7SmyMZfdac
 64IoQLDP4HS70afhLp+IZL//JXl0OZf/A8aJKRziw04AaY70HvVmyul267OrhHEE57Kj
 Gchi1UK4Q60CH6FgtMm1VGAqYhqojjTXyycbuDZv8TVaLAbl9xbcbPu2MqUSBBsERfTS
 WozLmmTyPrPWx0RPZcLGhIKGrhvqREP1EgCru2vSeOu8M5+VLV0yR5HBmYH7nW/r9EjB
 UqoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1685524531; x=1688116531;
 h=content-transfer-encoding:in-reply-to:organization:references:cc:to
 :content-language:subject:reply-to:from:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=ZhUEIe/6jVYKIhcwPw65eyzwSFNkodI6e5UfoL8epWs=;
 b=bFJ7YYG4zKHfY4zf7INxyX5oWU/ngO0dLD4TL6UV6tcb3Aa6LSgKLckZTlbdjnjMax
 Wx99g6mpzNuHQWPtmTyLpLP/oPisVQ1a3M2/yd4y2BjE0CVCBpLCU0LcUP5hUXsr1ZSc
 MnqzlMIM1tC9/ZEn6dcSMRNhWgyooVUHeSU/0S3nhRgZZ2EdEpb/yPxo3ZiRy0mm8aT1
 fikmvesYwbxxuxOqloJ8h8EVpYtGec6p/XryvqFkQPuPD880B3w5Ol7pjqnre+ZDyq4J
 ifojYnkM4pYTRO53bWEILFL3RGwmZSjPSiPrSaoiZLwmr1i/5YRY012iUlysAOptOLP9
 6Yig==
X-Gm-Message-State: AC+VfDz38oBlzhwrPbnZsHHRsEQKLB4EcrkuLCwweiGpF1JKSby6xNwf
 n5OBmdtC9JC8RoXS53znri6vboYHihAN6Jt8+C8Dfg==
X-Google-Smtp-Source: ACHHUZ7+HdgzP4NlSBpNC603KAdhtElqbx4tgguvZ8r0eKVgpGDmzybK5nMtKWtN3fjuqJ8po2beIg==
X-Received: by 2002:a7b:cb91:0:b0:3f6:476:915 with SMTP id
 m17-20020a7bcb91000000b003f604760915mr3141483wmi.6.1685524530762; 
 Wed, 31 May 2023 02:15:30 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:982:cbb0:5c28:3ad5:fcda:7779?
 ([2a01:e0a:982:cbb0:5c28:3ad5:fcda:7779])
 by smtp.gmail.com with ESMTPSA id
 w8-20020a1cf608000000b003f18b942338sm20163471wmc.3.2023.05.31.02.15.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 31 May 2023 02:15:30 -0700 (PDT)
Message-ID: <2c6b5c55-92dc-4f7d-758b-5b4f69f28482@linaro.org>
Date: Wed, 31 May 2023 11:15:29 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.1
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH] gpu: drm/panel: Change the return value of s6d7aa0_lock
 to void
Content-Language: en-US
To: Lu Hongfei <luhongfei@vivo.com>, Artur Weber <aweber.kernel@gmail.com>,
 Sam Ravnborg <sam@ravnborg.org>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>,
 "open list:DRM PANEL DRIVERS" <dri-devel@lists.freedesktop.org>,
 open list <linux-kernel@vger.kernel.org>
References: <20230531073751.48451-1-luhongfei@vivo.com>
Organization: Linaro Developer Services
In-Reply-To: <20230531073751.48451-1-luhongfei@vivo.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
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
Reply-To: neil.armstrong@linaro.org
Cc: opensource.kernel@vivo.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 31/05/2023 09:37, Lu Hongfei wrote:
> The return value of s6d7aa0_lock is meaningless,

It is not, mipi_dsi_dcs_write_seq() can return an error value:

https://github.com/torvalds/linux/blob/master/include/drm/drm_mipi_dsi.h#L320

Neil

> it is better to modify it to void.
> This patch fixes this issue and modifies the place
> where s6d7aa0_lock is called.
> 
> Signed-off-by: Lu Hongfei <luhongfei@vivo.com>
> ---
>   drivers/gpu/drm/panel/panel-samsung-s6d7aa0.c | 29 ++++---------------
>   1 file changed, 5 insertions(+), 24 deletions(-)
> 
> diff --git a/drivers/gpu/drm/panel/panel-samsung-s6d7aa0.c b/drivers/gpu/drm/panel/panel-samsung-s6d7aa0.c
> index 102e1fc7ee38..c5924e7b9e36
> --- a/drivers/gpu/drm/panel/panel-samsung-s6d7aa0.c
> +++ b/drivers/gpu/drm/panel/panel-samsung-s6d7aa0.c
> @@ -63,10 +63,9 @@ static void s6d7aa0_reset(struct s6d7aa0 *ctx)
>   	msleep(50);
>   }
>   
> -static int s6d7aa0_lock(struct s6d7aa0 *ctx, bool lock)
> +static void s6d7aa0_lock(struct s6d7aa0 *ctx, bool lock)
>   {
>   	struct mipi_dsi_device *dsi = ctx->dsi;
> -	int ret = 0;
>   
>   	if (lock) {
>   		mipi_dsi_dcs_write_seq(dsi, MCS_PASSWD1, 0xa5, 0xa5);
> @@ -79,8 +78,6 @@ static int s6d7aa0_lock(struct s6d7aa0 *ctx, bool lock)
>   		if (ctx->desc->use_passwd3)
>   			mipi_dsi_dcs_write_seq(dsi, MCS_PASSWD3, 0xa5, 0xa5);
>   	}
> -
> -	return ret;
>   }
>   
>   static int s6d7aa0_on(struct s6d7aa0 *ctx)
> @@ -238,11 +235,7 @@ static int s6d7aa0_lsl080al02_init(struct s6d7aa0 *ctx)
>   
>   	usleep_range(20000, 25000);
>   
> -	ret = s6d7aa0_lock(ctx, false);
> -	if (ret < 0) {
> -		dev_err(dev, "Failed to unlock registers: %d\n", ret);
> -		return ret;
> -	}
> +	s6d7aa0_lock(ctx, false);
>   
>   	mipi_dsi_dcs_write_seq(dsi, MCS_OTP_RELOAD, 0x00, 0x10);
>   	usleep_range(1000, 1500);
> @@ -266,11 +259,7 @@ static int s6d7aa0_lsl080al02_init(struct s6d7aa0 *ctx)
>   	msleep(120);
>   	mipi_dsi_dcs_write_seq(dsi, MIPI_DCS_SET_ADDRESS_MODE, 0x00);
>   
> -	ret = s6d7aa0_lock(ctx, true);
> -	if (ret < 0) {
> -		dev_err(dev, "Failed to lock registers: %d\n", ret);
> -		return ret;
> -	}
> +	s6d7aa0_lock(ctx, true);
>   
>   	ret = mipi_dsi_dcs_set_display_on(dsi);
>   	if (ret < 0) {
> @@ -327,11 +316,7 @@ static int s6d7aa0_lsl080al03_init(struct s6d7aa0 *ctx)
>   
>   	usleep_range(20000, 25000);
>   
> -	ret = s6d7aa0_lock(ctx, false);
> -	if (ret < 0) {
> -		dev_err(dev, "Failed to unlock registers: %d\n", ret);
> -		return ret;
> -	}
> +	s6d7aa0_lock(ctx, false);
>   
>   	if (ctx->desc->panel_type == S6D7AA0_PANEL_LSL080AL03) {
>   		mipi_dsi_dcs_write_seq(dsi, MCS_BL_CTL, 0xc7, 0x00, 0x29);
> @@ -370,11 +355,7 @@ static int s6d7aa0_lsl080al03_init(struct s6d7aa0 *ctx)
>   		return ret;
>   	}
>   
> -	ret = s6d7aa0_lock(ctx, true);
> -	if (ret < 0) {
> -		dev_err(dev, "Failed to lock registers: %d\n", ret);
> -		return ret;
> -	}
> +	s6d7aa0_lock(ctx, true);
>   
>   	ret = mipi_dsi_dcs_set_display_on(dsi);
>   	if (ret < 0) {

