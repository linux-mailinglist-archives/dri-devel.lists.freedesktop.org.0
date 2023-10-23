Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 69BF17D3839
	for <lists+dri-devel@lfdr.de>; Mon, 23 Oct 2023 15:36:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C102F10E1EE;
	Mon, 23 Oct 2023 13:35:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com
 [IPv6:2a00:1450:4864:20::133])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B3D3F10E1F1
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Oct 2023 13:35:35 +0000 (UTC)
Received: by mail-lf1-x133.google.com with SMTP id
 2adb3069b0e04-507c50b7c36so4527964e87.3
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Oct 2023 06:35:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1698068134; x=1698672934; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:autocrypt:from
 :content-language:references:cc:to:subject:user-agent:mime-version
 :date:message-id:from:to:cc:subject:date:message-id:reply-to;
 bh=6+lKZtPbq5BXji3rU4LiS+AvWqbaaS/S21HIUvYrQuo=;
 b=w94VJZp+PXNFeI1ElLDwS6WlGW93FCLumjp7EI71PbW1WjXd1rOrWLYxkjFt0d2Y//
 Omdx5WukxQikotMb12kD3B8seiRDh33VAbmDWlokRvt4YAeghsr7gasH48GIfsZ/n64o
 73uCdcCY1/ibMf0NYaxmH4k+ZPPZPJwCcs9WBm+fH9YLHmS62MkYmd6oHLbY1WRwGFU5
 74ljxfOS+EU+8eekTw886iSI332oE8kx5/POySZRnXnt5HAqS9LZMvF4VT5pNKyxph8L
 VblTNotDsPByhNUC8MRqhe0dKRgu4ymHvvGgH+5F67gKPbnxpR+fNnoCipj1aA9rxTQH
 85Tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1698068134; x=1698672934;
 h=content-transfer-encoding:in-reply-to:autocrypt:from
 :content-language:references:cc:to:subject:user-agent:mime-version
 :date:message-id:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=6+lKZtPbq5BXji3rU4LiS+AvWqbaaS/S21HIUvYrQuo=;
 b=LkNHmhrqCKmJKUvqk77JIbEyrPjyJYpJiR9I8SstXju90iAO3F9Cz6oCXTdAPbm+Ms
 ZZWx8jZ70jCUzaumybQ3SuYLZdz5aHUV138FBCx0tMjAgs2X8C8ojA6DsGCWQaMrOsgl
 rtoM8/GkbN9mGhwv/De451+Z1lEOD5yAFVB3Ozt4EjZnc/DLjflabGpqYfqob2v2SOgA
 k2W8hQQQNUaq6iTtX/RxvsHfTWrCGz2hk8t6dTmnhKUtZ4pFlJbe4PlYuExcw/vfpj3F
 v16S3Mp1/CMmhFwKrtL5bInHlmLn7qKcpnDm36o0gBOZg2EvNpXtDkL/DBXXa0QQQKku
 GOjw==
X-Gm-Message-State: AOJu0YzgOhyk5O/t+uvvl2wE1aUSa4knk47eWbl2FnO9bGbLLZ3fX4NA
 hxfDKp8Yc8bqKxcE3miDsk0VnQ==
X-Google-Smtp-Source: AGHT+IGMBSk7XI1KpdNrzUWAVuKmyjp7NoCDYdt+fQqzNrZzWgURBT2X7ujrmWiVH8QlwwaZqmX6lg==
X-Received: by 2002:a05:6512:1056:b0:507:a9ae:5c2 with SMTP id
 c22-20020a056512105600b00507a9ae05c2mr6928490lfb.44.1698068133912; 
 Mon, 23 Oct 2023 06:35:33 -0700 (PDT)
Received: from [192.168.204.110]
 (178235177080.dynamic-4-waw-k-1-1-0.vectranet.pl. [178.235.177.80])
 by smtp.gmail.com with ESMTPSA id
 m5-20020a056512114500b00507a7f55a92sm1702093lfg.61.2023.10.23.06.35.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 23 Oct 2023 06:35:33 -0700 (PDT)
Message-ID: <1e55e328-13e3-42cb-b2c3-8f527b444ce1@linaro.org>
Date: Mon, 23 Oct 2023 15:35:32 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/panel/raydium-rm692e5: select
 CONFIG_DRM_DISPLAY_DP_HELPER
To: neil.armstrong@linaro.org, Arnd Bergmann <arnd@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Luca Weiss <luca.weiss@fairphone.com>
References: <20231023115619.3551348-1-arnd@kernel.org>
 <00e81457-9148-4ca1-8433-4b7cad0652b5@linaro.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@linaro.org>
Autocrypt: addr=konrad.dybcio@linaro.org; keydata=
 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
 izWDgYvmBE8=
In-Reply-To: <00e81457-9148-4ca1-8433-4b7cad0652b5@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
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
Cc: Arnd Bergmann <arnd@arndb.de>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Jessica Zhang <quic_jesszhan@quicinc.com>,
 Sam Ravnborg <sam@ravnborg.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 23.10.2023 15:25, Neil Armstrong wrote:
> Hi,
> 
> On 23/10/2023 13:55, Arnd Bergmann wrote:
>> From: Arnd Bergmann <arnd@arndb.de>
>>
>> As with several other panel drivers, this fails to link without the DP
>> helper library:
>>
>> ld: drivers/gpu/drm/panel/panel-raydium-rm692e5.o: in function `rm692e5_prepare':
>> panel-raydium-rm692e5.c:(.text+0x11f4): undefined reference to `drm_dsc_pps_payload_pack'
>>
>> Select the same symbols that the others already use.
>>
>> Fixes: 988d0ff29ecf7 ("drm/panel: Add driver for BOE RM692E5 AMOLED panel")
>> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
>> ---
>>   drivers/gpu/drm/panel/Kconfig | 2 ++
>>   1 file changed, 2 insertions(+)
>>
>> diff --git a/drivers/gpu/drm/panel/Kconfig b/drivers/gpu/drm/panel/Kconfig
>> index 99e14dc212ecb..a4ac4b47777fe 100644
>> --- a/drivers/gpu/drm/panel/Kconfig
>> +++ b/drivers/gpu/drm/panel/Kconfig
>> @@ -530,6 +530,8 @@ config DRM_PANEL_RAYDIUM_RM692E5
>>       depends on OF
>>       depends on DRM_MIPI_DSI
>>       depends on BACKLIGHT_CLASS_DEVICE
>> +    select DRM_DISPLAY_DP_HELPER
>> +    select DRM_DISPLAY_HELPER
>>       help
>>         Say Y here if you want to enable support for Raydium RM692E5-based
>>         display panels, such as the one found in the Fairphone 5 smartphone.
> 
> Will apply once drm-misc-next-fixes is synced with the last drm-misc-next PR for v6.7.
Thanks Arnd, Neil.

Sounds like this helper should be extracted from DP specific code
in the future though, no?

Konrad
