Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 67CB467181D
	for <lists+dri-devel@lfdr.de>; Wed, 18 Jan 2023 10:45:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E736410E624;
	Wed, 18 Jan 2023 09:45:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com
 [IPv6:2a00:1450:4864:20::434])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A650E10E6CE
 for <dri-devel@lists.freedesktop.org>; Wed, 18 Jan 2023 09:45:34 +0000 (UTC)
Received: by mail-wr1-x434.google.com with SMTP id d2so13181996wrp.8
 for <dri-devel@lists.freedesktop.org>; Wed, 18 Jan 2023 01:45:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:organization:references:cc:to
 :content-language:subject:reply-to:from:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to;
 bh=bxTEriY1MvSGeJlo84GqMLFfzsCCLCqbUF/mz0HRuGk=;
 b=U0+jiQ8YZms1L9R000j+kcQGuYANmrpPeAz3lPkkDReAp1VJSpkw9WHC28jnRnKNfb
 8VkT9GftcWVhL/zjhpnm+mD/UMtaS+xOCNfriKRE4u2V4zNDUBAUab618FlYViuDlbeM
 ddzPzmSXN4M/5kwRERUEiPeTIGRdllkk6IObfw7vyzdg+Ejx6+NakqWwI+/MsFOrkSuk
 DedVYbdWBbwdtZfWG5bqzN2BBG58HtK4tFdTUqbSUzwG4BgtNwlSdtWzlrkbb/ii1JoS
 KIDt5bA2Jd7Jx5YfTTSzBOfqOgYmikhTJNxgAdP2u7/3H/K9XvlCoovACTY3Vl5Z+Ur2
 TUJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:organization:references:cc:to
 :content-language:subject:reply-to:from:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=bxTEriY1MvSGeJlo84GqMLFfzsCCLCqbUF/mz0HRuGk=;
 b=0WH9mHt/yZL+8EbXVv99MtcHQnLrq9J+arYNTxCSpfBSV/+25OOqau1SZAp80pivzV
 qcA5LIz+joHFbBRZ0kYONrXAFpqdF98yhvQcMdHvRi5Isx4PJga4f97nvMjbQu8l9G+c
 CUJbMZ3ltM4Rv+EaLnEbIcoIvQAgaXOm3A2WpMW+ZCq6mE++gZtmu4GBt/SjwTjbMrKQ
 MDPiUmXOi9K0RAP+jCSgo3qR7jKTs2vYxjjdwFkBNe9dj1RuWrRbLsgX2ad7SMIplQ5b
 c6/gpruDXbFgIJdj6YlF2VveaAOtWSTxk/GAf0VXHAKdsYGRmRqBQsTCIDy+0OIPdJAm
 Gcqg==
X-Gm-Message-State: AFqh2kqLDiRtAzlnvdrgeJDvujxx6frSU+bzPqA7WV4KAwngRRAVatjC
 CnvbmsLsb6pulgCxMmFUg6UlQg==
X-Google-Smtp-Source: AMrXdXvPz5Z0HWf4/hGC7pwgdDdiwlsH0fE3k2waPcVeYNniv7Eo/9HnxV3PHkpgZZY+1Ca0flYlNQ==
X-Received: by 2002:a5d:4446:0:b0:2ba:c946:868b with SMTP id
 x6-20020a5d4446000000b002bac946868bmr5416810wrr.23.1674035133127; 
 Wed, 18 Jan 2023 01:45:33 -0800 (PST)
Received: from ?IPV6:2a01:e0a:982:cbb0:37dc:5071:959c:93e4?
 ([2a01:e0a:982:cbb0:37dc:5071:959c:93e4])
 by smtp.gmail.com with ESMTPSA id
 e10-20020adfe38a000000b002bc7fcf08ddsm23460721wrm.103.2023.01.18.01.45.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 18 Jan 2023 01:45:32 -0800 (PST)
Message-ID: <47b70ca1-2601-0e71-80bd-6d3f3f845601@linaro.org>
Date: Wed, 18 Jan 2023 10:45:30 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [RFC PATCH v3 3/3] drm/panel: vtdr6130: Use 16-bit brightness
 function
Content-Language: en-US
To: Richard Acayan <mailingradian@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>,
 Emil Velikov <emil.l.velikov@gmail.com>, Vinay Simha BN
 <simhavcs@gmail.com>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
References: <20230116224909.23884-1-mailingradian@gmail.com>
 <20230116224909.23884-4-mailingradian@gmail.com>
Organization: Linaro Developer Services
In-Reply-To: <20230116224909.23884-4-mailingradian@gmail.com>
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
Cc: Caleb Connolly <caleb@connolly.tech>, Daniel Mentz <danielmentz@google.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 16/01/2023 23:49, Richard Acayan wrote:
> This panel communicates brightness in big endian. This is not a quirk of
> the panels themselves, but rather, a part of the MIPI standard. Use the
> new mipi_dsi_dcs_set_display_brightness_large() function that properly
> handles 16-bit brightness instead of bypassing the brightness functions
> entirely.
> 
> Signed-off-by: Richard Acayan <mailingradian@gmail.com>
> ---
>   drivers/gpu/drm/panel/panel-visionox-vtdr6130.c | 5 +----
>   1 file changed, 1 insertion(+), 4 deletions(-)
> 
> diff --git a/drivers/gpu/drm/panel/panel-visionox-vtdr6130.c b/drivers/gpu/drm/panel/panel-visionox-vtdr6130.c
> index f9a6abc1e121..1092075b31a5 100644
> --- a/drivers/gpu/drm/panel/panel-visionox-vtdr6130.c
> +++ b/drivers/gpu/drm/panel/panel-visionox-vtdr6130.c
> @@ -243,12 +243,9 @@ static int visionox_vtdr6130_bl_update_status(struct backlight_device *bl)
>   {
>   	struct mipi_dsi_device *dsi = bl_get_data(bl);
>   	u16 brightness = backlight_get_brightness(bl);
> -	/* Panel needs big-endian order of brightness value */
> -	u8 payload[2] = { brightness >> 8, brightness & 0xff };
>   	int ret;
>   
> -	ret = mipi_dsi_dcs_write(dsi, MIPI_DCS_SET_DISPLAY_BRIGHTNESS,
> -				 payload, sizeof(payload));
> +	mipi_dsi_dcs_set_display_brightness_large(dsi, brightness);
>   	if (ret < 0)
>   		return ret;
>   

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
Tested-by: Neil Armstrong <neil.armstrong@linaro.org> # on SM8550-MTP

Thanks !
