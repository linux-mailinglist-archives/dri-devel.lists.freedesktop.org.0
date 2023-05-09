Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FD906FC0B3
	for <lists+dri-devel@lfdr.de>; Tue,  9 May 2023 09:48:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 69A6A10E348;
	Tue,  9 May 2023 07:48:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com
 [IPv6:2a00:1450:4864:20::32c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 49CA910E348
 for <dri-devel@lists.freedesktop.org>; Tue,  9 May 2023 07:48:21 +0000 (UTC)
Received: by mail-wm1-x32c.google.com with SMTP id
 5b1f17b1804b1-3f1950f5628so54819865e9.3
 for <dri-devel@lists.freedesktop.org>; Tue, 09 May 2023 00:48:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1683618499; x=1686210499;
 h=content-transfer-encoding:in-reply-to:organization:references:cc:to
 :content-language:subject:reply-to:from:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to;
 bh=dz2x6aipT8dV5bqbZaxuGPCu/aufRcC5B7MiUyrsI4w=;
 b=UDdQvsD5NxYEtsfvB8oz9xYvTik16Cjg57Lwl1T2CzbB820snSkc6VSygVLY+Tge3n
 pbaEBIRdEWj4xf5Mn457oRu0JYWEkv6krlENuR1BzWq8PwhU69zLWsLim8zJvx3Btgei
 CDDyLPNr0fV3VtyJ3v/EHsSyRw0yQSkHBau/OFoTJRcpu5U1k/MAozDmqIKJfeup9waI
 hY5i2zvr7a2MKImJcPlvgVL/GNaoVH2T7cThViv6J9nRatIRr2xiOZIGAs+yBQtuw5Xs
 556FIb/Did5j7MMZc0YVNPPmASFvmVlMgSWh27htWQNfv+VWJ2wbzExhaYMEgMaRQGm2
 dUiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683618499; x=1686210499;
 h=content-transfer-encoding:in-reply-to:organization:references:cc:to
 :content-language:subject:reply-to:from:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=dz2x6aipT8dV5bqbZaxuGPCu/aufRcC5B7MiUyrsI4w=;
 b=aSwNJPFGAEft7ibiTImos6Nxw1m2SrtxZHtj8rwhcstkpBOolg2rSIe9KrjolLBPHN
 VVR+bmN1HrUcgZvFfnpCR8kU3BEkDmujV1ikKwXiKkTUQhhAzYpC0lEq6qFycMo3dTg7
 MPgUCz35qx05pJ31wLIZ86N8K2lz6OqD4wSBKpKWKUdvrslnO2yH3NZtZncK1AEfAkG5
 3rLTLyTkm5aariXknzfGo5SISt7VOppVij+Fepd5QKejkTtf2On+GlZ2styW+7LdwwCM
 0RwvR0Gpp1zMPOpoY498Q6YuakP8O6T2mTfd1/ptFNWgk5I0mSRXXGofXs3m3xx/xrav
 lINQ==
X-Gm-Message-State: AC+VfDzPx3me4sSu+ZK/kwh+aFzFwgNz9eCa8mMVVIFcl3emTRm1EYRa
 xedNYs/8H9thgUGRM2O3NbPGhg==
X-Google-Smtp-Source: ACHHUZ7tOZeC0wLEU8Nzq3QnBnELC/mribYPL//a+hRL++pPDU3b/lVe8MmbEvyuIK8y8JpwTw+9ZA==
X-Received: by 2002:a7b:ce05:0:b0:3f4:2b86:28c5 with SMTP id
 m5-20020a7bce05000000b003f42b8628c5mr1013873wmc.38.1683618499285; 
 Tue, 09 May 2023 00:48:19 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:982:cbb0:79ab:8da0:d16d:9990?
 ([2a01:e0a:982:cbb0:79ab:8da0:d16d:9990])
 by smtp.gmail.com with ESMTPSA id
 k22-20020a05600c0b5600b003f40049a65bsm17831303wmr.21.2023.05.09.00.48.18
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 09 May 2023 00:48:18 -0700 (PDT)
Message-ID: <f55ac345-5f7b-f08e-0a54-f488434aa4dc@linaro.org>
Date: Tue, 9 May 2023 09:48:18 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.1
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH 2/2] drm/panel: sharp-ls043t1le01: drop dummy functions
 and data fields
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Sam Ravnborg <sam@ravnborg.org>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>
References: <20230507172639.2320934-1-dmitry.baryshkov@linaro.org>
 <20230507172639.2320934-2-dmitry.baryshkov@linaro.org>
Organization: Linaro Developer Services
In-Reply-To: <20230507172639.2320934-2-dmitry.baryshkov@linaro.org>
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
> Drop sharp_nt_panel_disable() and sharp_nt_panel_enable(), which bear no
> useful code. Also drop sharp_nt_panel::enable and sharp_nt_panel::mode
> fields which also provide no use now.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>   .../gpu/drm/panel/panel-sharp-ls043t1le01.c   | 32 -------------------
>   1 file changed, 32 deletions(-)
> 
> diff --git a/drivers/gpu/drm/panel/panel-sharp-ls043t1le01.c b/drivers/gpu/drm/panel/panel-sharp-ls043t1le01.c
> index ef148504cf24..855e64444daa 100644
> --- a/drivers/gpu/drm/panel/panel-sharp-ls043t1le01.c
> +++ b/drivers/gpu/drm/panel/panel-sharp-ls043t1le01.c
> @@ -28,9 +28,6 @@ struct sharp_nt_panel {
>   	struct gpio_desc *reset_gpio;
>   
>   	bool prepared;
> -	bool enabled;
> -
> -	const struct drm_display_mode *mode;
>   };
>   
>   static inline struct sharp_nt_panel *to_sharp_nt_panel(struct drm_panel *panel)
> @@ -97,19 +94,6 @@ static int sharp_nt_panel_off(struct sharp_nt_panel *sharp_nt)
>   	return 0;
>   }
>   
> -
> -static int sharp_nt_panel_disable(struct drm_panel *panel)
> -{
> -	struct sharp_nt_panel *sharp_nt = to_sharp_nt_panel(panel);
> -
> -	if (!sharp_nt->enabled)
> -		return 0;
> -
> -	sharp_nt->enabled = false;
> -
> -	return 0;
> -}
> -
>   static int sharp_nt_panel_unprepare(struct drm_panel *panel)
>   {
>   	struct sharp_nt_panel *sharp_nt = to_sharp_nt_panel(panel);
> @@ -179,18 +163,6 @@ static int sharp_nt_panel_prepare(struct drm_panel *panel)
>   	return ret;
>   }
>   
> -static int sharp_nt_panel_enable(struct drm_panel *panel)
> -{
> -	struct sharp_nt_panel *sharp_nt = to_sharp_nt_panel(panel);
> -
> -	if (sharp_nt->enabled)
> -		return 0;
> -
> -	sharp_nt->enabled = true;
> -
> -	return 0;
> -}
> -
>   static const struct drm_display_mode default_mode = {
>   	.clock = (540 + 48 + 32 + 80) * (960 + 3 + 10 + 15) * 60 / 1000,
>   	.hdisplay = 540,
> @@ -227,10 +199,8 @@ static int sharp_nt_panel_get_modes(struct drm_panel *panel,
>   }
>   
>   static const struct drm_panel_funcs sharp_nt_panel_funcs = {
> -	.disable = sharp_nt_panel_disable,
>   	.unprepare = sharp_nt_panel_unprepare,
>   	.prepare = sharp_nt_panel_prepare,
> -	.enable = sharp_nt_panel_enable,
>   	.get_modes = sharp_nt_panel_get_modes,
>   };
>   
> @@ -239,8 +209,6 @@ static int sharp_nt_panel_add(struct sharp_nt_panel *sharp_nt)
>   	struct device *dev = &sharp_nt->dsi->dev;
>   	int ret;
>   
> -	sharp_nt->mode = &default_mode;
> -
>   	sharp_nt->supply = devm_regulator_get(dev, "avdd");
>   	if (IS_ERR(sharp_nt->supply))
>   		return PTR_ERR(sharp_nt->supply);

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
