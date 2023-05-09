Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F0AFA6FC0B2
	for <lists+dri-devel@lfdr.de>; Tue,  9 May 2023 09:48:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3EB0210E347;
	Tue,  9 May 2023 07:48:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com
 [IPv6:2a00:1450:4864:20::330])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B828010E347
 for <dri-devel@lists.freedesktop.org>; Tue,  9 May 2023 07:48:08 +0000 (UTC)
Received: by mail-wm1-x330.google.com with SMTP id
 5b1f17b1804b1-3f41dceb93bso19356455e9.1
 for <dri-devel@lists.freedesktop.org>; Tue, 09 May 2023 00:48:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1683618486; x=1686210486;
 h=content-transfer-encoding:in-reply-to:organization:references:cc:to
 :content-language:subject:reply-to:from:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to;
 bh=omncBa6AelPbADQXzHKZhhm9n16/I3NnAgUAmD05QzE=;
 b=A7DCz0u4X+4lzxEb8k0mHSG6j52CJqk1BU7v3WYGKM/YwDMjAQZ/uDcb5V1QYazRJM
 xv5Gqi9LGLru2ATfHstVpvtvnctupCGZF6Y4l5c7W4ZjdTh9+ZTkIRn/uLmGD5Z4JrFH
 lSZVPKPXvNRY/xrBVIJ9CcjavyRvh7EvY9QyxcSFnF3j6Z6Kkyc4ROCQQyUinkjMUfPI
 WVXANytanLl5GoU45J2RX7wHBA91EFGJs0oD5c1G7VWPZBWSjjQGMXSNIEhYeObYZ/6R
 +ygRtCm7D4UDzXujIEU+x7sf9pjd2Ng8XErDnJWJUFzwNYenTnnrTb3J41wFEw3197xP
 tsLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683618486; x=1686210486;
 h=content-transfer-encoding:in-reply-to:organization:references:cc:to
 :content-language:subject:reply-to:from:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=omncBa6AelPbADQXzHKZhhm9n16/I3NnAgUAmD05QzE=;
 b=jnhbqLWLyIsUtVIyyrhp4U7pyzBIXk93oYFhBnlM87OlnZnVVsP5AiJLrCI03VV+HC
 SP9lUvWO1wWtvFfltwe/04aDgXAcSMrJncKFbNDgVk2b8GuOtaAl9LV+4bPsWfib2swn
 JppRr+Wl06M1JGOLXsv+MJwTkTGMljEWVt9/ZDfgoTeRbXd38t0uLfpAUsWs3S6czgCK
 8DToRuWSc9tUPiAR7Kdn/cdsxCucpWlxKN2d5eIcAziYP/0PReEVF5yuXUBkNmz0qr7f
 dfhgC+1K/z5z7Zqf0BYf2hlCFbPVhBPlHK3V6DAqlAeJoLK5I4MrK4KgdySgm9eNZBMG
 poFA==
X-Gm-Message-State: AC+VfDznq8tghUkAekyjiQGrfyczfuGVydIhe2KJ20CTHtAs7//fAYRM
 mxTQJaZeiznmXPPct/TpZ58aOw==
X-Google-Smtp-Source: ACHHUZ7nJYTctDR6/UIqMoUVFLX52kZrSY41kWVdxblWLozZ+50GcME63LITOAglbjpXF790FTUmrw==
X-Received: by 2002:adf:fe10:0:b0:2d5:39d:514f with SMTP id
 n16-20020adffe10000000b002d5039d514fmr8355593wrr.65.1683618486584; 
 Tue, 09 May 2023 00:48:06 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:982:cbb0:79ab:8da0:d16d:9990?
 ([2a01:e0a:982:cbb0:79ab:8da0:d16d:9990])
 by smtp.gmail.com with ESMTPSA id
 m2-20020a056000008200b0030630120e56sm13354821wrx.57.2023.05.09.00.48.05
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 09 May 2023 00:48:06 -0700 (PDT)
Message-ID: <43f55714-91ac-5bfd-c8b2-58525ae21d85@linaro.org>
Date: Tue, 9 May 2023 09:48:05 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.1
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH 1/2] drm/panel: sharp-ls043t1le01: adjust mode settings
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Sam Ravnborg <sam@ravnborg.org>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>
References: <20230507172639.2320934-1-dmitry.baryshkov@linaro.org>
Organization: Linaro Developer Services
In-Reply-To: <20230507172639.2320934-1-dmitry.baryshkov@linaro.org>
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
Cc: dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 07/05/2023 19:26, Dmitry Baryshkov wrote:
> Using current settings causes panel flickering on APQ8074 dragonboard.
> Adjust panel settings to follow the vendor-provided mode. This also
> enables MIPI_DSI_MODE_VIDEO_SYNC_PULSE, which is also specified by the
> vendor dtsi for the mentioned dragonboard.
> 
> Fixes: ee0172383190 ("drm/panel: Add Sharp LS043T1LE01 MIPI DSI panel")
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>   drivers/gpu/drm/panel/panel-sharp-ls043t1le01.c | 11 ++++++-----
>   1 file changed, 6 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/gpu/drm/panel/panel-sharp-ls043t1le01.c b/drivers/gpu/drm/panel/panel-sharp-ls043t1le01.c
> index d1ec80a3e3c7..ef148504cf24 100644
> --- a/drivers/gpu/drm/panel/panel-sharp-ls043t1le01.c
> +++ b/drivers/gpu/drm/panel/panel-sharp-ls043t1le01.c
> @@ -192,15 +192,15 @@ static int sharp_nt_panel_enable(struct drm_panel *panel)
>   }
>   
>   static const struct drm_display_mode default_mode = {
> -	.clock = 41118,
> +	.clock = (540 + 48 + 32 + 80) * (960 + 3 + 10 + 15) * 60 / 1000,
>   	.hdisplay = 540,
>   	.hsync_start = 540 + 48,
> -	.hsync_end = 540 + 48 + 80,
> -	.htotal = 540 + 48 + 80 + 32,
> +	.hsync_end = 540 + 48 + 32,
> +	.htotal = 540 + 48 + 32 + 80,
>   	.vdisplay = 960,
>   	.vsync_start = 960 + 3,
> -	.vsync_end = 960 + 3 + 15,
> -	.vtotal = 960 + 3 + 15 + 1,
> +	.vsync_end = 960 + 3 + 10,
> +	.vtotal = 960 + 3 + 10 + 15,
>   };
>   
>   static int sharp_nt_panel_get_modes(struct drm_panel *panel,
> @@ -280,6 +280,7 @@ static int sharp_nt_panel_probe(struct mipi_dsi_device *dsi)
>   	dsi->lanes = 2;
>   	dsi->format = MIPI_DSI_FMT_RGB888;
>   	dsi->mode_flags = MIPI_DSI_MODE_VIDEO |
> +			MIPI_DSI_MODE_VIDEO_SYNC_PULSE |
>   			MIPI_DSI_MODE_VIDEO_HSE |
>   			MIPI_DSI_CLOCK_NON_CONTINUOUS |
>   			MIPI_DSI_MODE_NO_EOT_PACKET;

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
