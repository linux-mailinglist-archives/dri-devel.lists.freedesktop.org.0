Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CD92748589
	for <lists+dri-devel@lfdr.de>; Wed,  5 Jul 2023 15:55:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 28C0D10E1C4;
	Wed,  5 Jul 2023 13:55:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com
 [IPv6:2a00:1450:4864:20::436])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8A04F10E1C4
 for <dri-devel@lists.freedesktop.org>; Wed,  5 Jul 2023 13:55:29 +0000 (UTC)
Received: by mail-wr1-x436.google.com with SMTP id
 ffacd0b85a97d-31438512cafso3389870f8f.2
 for <dri-devel@lists.freedesktop.org>; Wed, 05 Jul 2023 06:55:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1688565325; x=1691157325;
 h=content-transfer-encoding:in-reply-to:organization:references:cc:to
 :content-language:subject:reply-to:from:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to;
 bh=QDtJCKqfKjcaKFw75l+br9FSk3/UDaoY4ROK4bND+g4=;
 b=bMY4zcmVkRkJZuGTA/33qY4pDQWVLuUTDNqW/Ux6jP9erW+UhwIf8QtmjuEgBm2vsv
 ghUmFqo7e48R9GIW9Tv1zVyXNUmvK/H7vYx8tZ73fxSftzxvB0D/fENKY5xY+uUVP2gK
 oxS8XvPWaS326vR+V8PJvOIhZr59gE5i7ZPhyRlgpf6FGMihAysHqNhkw2MzhxKQRYQ+
 ynmXBDhPXypo8gW7b0viowmjJanw3tmV74qmbkMLTP2pFGg3Q3llS3m75Qat1+yR6y34
 8WiXgiGWQpcBc+BprKeMv3lLlUkl4A8DdI/0xx2+VNWrtvOTpHozakUvW7U7TI+dG7Y4
 NncA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1688565325; x=1691157325;
 h=content-transfer-encoding:in-reply-to:organization:references:cc:to
 :content-language:subject:reply-to:from:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=QDtJCKqfKjcaKFw75l+br9FSk3/UDaoY4ROK4bND+g4=;
 b=bsARS7Mo3j4KhorGET5X1SAUmW9nO4mVpo+dLoAtSWEvKM3bogDgj8hlWCuZaTgNxR
 tse+SfQtgD0bSd9dxT+GOrc12I8Nzb6WIa2Zl9fL1qiiLGArBy6ciim61yfY/7YDrpGF
 +VIyRsId9PDFZg91BM9YwgF2IqukxIsGCaT49sp48V98ZZefUVk96eCBTPGXlSAOB7lD
 DStg1gCyOmZRmhix5zk2j1l1CLFE3jMk+Tp5mtJiTvUW+LmM5O2YY+0+xKL9o2jexMSj
 OHmkRxYyLvCxNorV3S6wOVOsE3b10o2xYygL62dcnIloqmBK3tfqiVLC/P3+ewBC2C+T
 VvsA==
X-Gm-Message-State: ABy/qLZ6CXFIKpaMUgof33zpfqHYI6clM5c6cAnqfbp5TTuWosjLH9ne
 H2P3I1Qi0D3tp0K3JL+7tlbzBw==
X-Google-Smtp-Source: APBJJlEDj7353XXfmQuL/K85xJsW2fbnWCsuq5RfNgpui++UqX0DPWU+I7uxm15VgnfHX9RGnjKMLg==
X-Received: by 2002:adf:e747:0:b0:314:2f5b:2ce with SMTP id
 c7-20020adfe747000000b003142f5b02cemr10156381wrn.12.1688565325537; 
 Wed, 05 Jul 2023 06:55:25 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:982:cbb0:65eb:d140:2d45:ee85?
 ([2a01:e0a:982:cbb0:65eb:d140:2d45:ee85])
 by smtp.gmail.com with ESMTPSA id
 u11-20020adfdd4b000000b003143765e207sm8251847wrm.49.2023.07.05.06.55.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 05 Jul 2023 06:55:25 -0700 (PDT)
Message-ID: <f7bf6f1a-1cc6-55e3-82a2-ecc6818be5c4@linaro.org>
Date: Wed, 5 Jul 2023 15:55:24 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH 1/3] drm/panel: ld9040: Use better magic values
Content-Language: en-US
To: Paul Cercueil <paul@crapouillou.net>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Rob Herring <robh+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 Alim Akhtar <alim.akhtar@samsung.com>, Sam Ravnborg <sam@ravnborg.org>
References: <20230703214715.623447-1-paul@crapouillou.net>
 <20230703214715.623447-2-paul@crapouillou.net>
Organization: Linaro Developer Services
In-Reply-To: <20230703214715.623447-2-paul@crapouillou.net>
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
Cc: devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi

On 03/07/2023 23:47, Paul Cercueil wrote:
> I have no idea what the prior magic values mean, and I have no idea
> what my replacement (extracted from [1]) magic values mean.
> 
> What I do know, is that these new values result in a much better
> picture, where the blacks are really black (as you would expect on an
> AMOLED display) instead of grey-ish.
> 
> [1] https://github.com/dorimanx/Dorimanx-SG2-I9100-Kernel/blob/master-jelly-bean/arch/arm/mach-exynos/u1-panel.h
> 
> Signed-off-by: Paul Cercueil <paul@crapouillou.net>
> ---
>   drivers/gpu/drm/panel/panel-samsung-ld9040.c | 11 ++++++-----
>   1 file changed, 6 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/gpu/drm/panel/panel-samsung-ld9040.c b/drivers/gpu/drm/panel/panel-samsung-ld9040.c
> index 01eb211f32f7..7fd9444b42c5 100644
> --- a/drivers/gpu/drm/panel/panel-samsung-ld9040.c
> +++ b/drivers/gpu/drm/panel/panel-samsung-ld9040.c
> @@ -180,17 +180,18 @@ static void ld9040_init(struct ld9040 *ctx)
>   {
>   	ld9040_dcs_write_seq_static(ctx, MCS_USER_SETTING, 0x5a, 0x5a);
>   	ld9040_dcs_write_seq_static(ctx, MCS_PANEL_CONDITION,
> -		0x05, 0x65, 0x96, 0x71, 0x7d, 0x19, 0x3b, 0x0d,
> -		0x19, 0x7e, 0x0d, 0xe2, 0x00, 0x00, 0x7e, 0x7d,
> -		0x07, 0x07, 0x20, 0x20, 0x20, 0x02, 0x02);
> +		0x05, 0x5e, 0x96, 0x6b, 0x7d, 0x0d, 0x3f, 0x00,
> +		0x00, 0x32, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
> +		0x07, 0x05, 0x1f, 0x1f, 0x1f, 0x00, 0x00);
>   	ld9040_dcs_write_seq_static(ctx, MCS_DISPCTL,
> -		0x02, 0x08, 0x08, 0x10, 0x10);
> +		0x02, 0x06, 0x0a, 0x10, 0x10);
>   	ld9040_dcs_write_seq_static(ctx, MCS_MANPWR, 0x04);
>   	ld9040_dcs_write_seq_static(ctx, MCS_POWER_CTRL,
>   		0x0a, 0x87, 0x25, 0x6a, 0x44, 0x02, 0x88);
> -	ld9040_dcs_write_seq_static(ctx, MCS_ELVSS_ON, 0x0d, 0x00, 0x16);
> +	ld9040_dcs_write_seq_static(ctx, MCS_ELVSS_ON, 0x0f, 0x00, 0x16);
>   	ld9040_dcs_write_seq_static(ctx, MCS_GTCON, 0x09, 0x00, 0x00);
>   	ld9040_brightness_set(ctx);
> +

You can drop this spurious new line for v2

>   	ld9040_dcs_write_seq_static(ctx, MIPI_DCS_EXIT_SLEEP_MODE);
>   	ld9040_dcs_write_seq_static(ctx, MIPI_DCS_SET_DISPLAY_ON);
>   }

And add

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>

Neil
