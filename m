Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E67DE6E4A14
	for <lists+dri-devel@lfdr.de>; Mon, 17 Apr 2023 15:38:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DAF0A10E314;
	Mon, 17 Apr 2023 13:38:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x232.google.com (mail-lj1-x232.google.com
 [IPv6:2a00:1450:4864:20::232])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A657E10E314
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Apr 2023 13:38:25 +0000 (UTC)
Received: by mail-lj1-x232.google.com with SMTP id c3so3187027ljf.7
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Apr 2023 06:38:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1681738703; x=1684330703;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=sxeJD9/zGNXy/RTKZruExxY/TG6TAvdOAAv05PMUESw=;
 b=kKNbP91GQ5UBPQ4iiq3aw+/n+Z11Q3G8KtkL8hQugnCtuiclhvkJIugzsNiNDf9j01
 t13oIqP8/z8+tAzRksiHRwZqPCufUGUWa3eLYLyQsY38QEcn49NMY59jqMeI6e1+YYzU
 Sp3/LlmAFTuOEbD34/7ZWVeHliouu8EdtK6pZDYb9qEqxpVgSsAiJxSJqv79RGjnlu9H
 CZbB7j6LlAyUuhgtZ3IHIMY4e86GXydNf5NgbsZ6nEtdcA0MJNwV8O8Sr6ZEPGXIhFEl
 8Mvc1OG40atCGSvX5hM/td8PHeyYmhStI6FTlKPYsHJzN62HOf86kgsjn9qvsUdIUK+B
 kH1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1681738703; x=1684330703;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=sxeJD9/zGNXy/RTKZruExxY/TG6TAvdOAAv05PMUESw=;
 b=jwCEhpigsx6Pa90Tuy/gLeVLG5hxpZ6VLowy17U7MMeKWjZoylSGeyXt46VR0n5fJi
 QV7tCuffmitMhJC6qpgRXOTRiqS3LaKriYRUzUk7tig9O4XQUlHOfrrdgb0HXYaaUxIF
 lGmo+pxsdtc4Zg6EUbjw/swh6sXjtl23R/J9aLiJdcxq7zmgqtMaxG5wE42KSkN3Kf0t
 OvhOR0nlgOc+YRdriH0izHfnzuMG9igyC1T4+5Xizv3KgQc/AnsM7sg9kHKa0/fdSlCi
 6ti4q2hZkX4IlNVa5AebkGQh869XY2OBS3iTDZA7r7DJjP5sLsMXUbybvf+OgS9E7IMm
 JtPA==
X-Gm-Message-State: AAQBX9c1wZncvkXi1ccWkh4Oy1xifip5IbXVUsTqtA6N833wUbbm2glf
 ArWQudbc7KCh+io6ySaOwkJnjw==
X-Google-Smtp-Source: AKy350YZvftTLyPAfQnKUozMLRKcke2ymH9J45/NHW6VLrKWxkbu0FTJ7YG8zldXLyTsUb8BbzH7Iw==
X-Received: by 2002:a2e:8ec9:0:b0:299:ac61:4e78 with SMTP id
 e9-20020a2e8ec9000000b00299ac614e78mr4024831ljl.10.1681738703310; 
 Mon, 17 Apr 2023 06:38:23 -0700 (PDT)
Received: from [192.168.1.101] (abyk99.neoplus.adsl.tpnet.pl. [83.9.30.99])
 by smtp.gmail.com with ESMTPSA id
 z22-20020a2e9b96000000b002a8c1462ecbsm742157lji.137.2023.04.17.06.38.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 17 Apr 2023 06:38:22 -0700 (PDT)
Message-ID: <df752738-824c-20be-f7d9-83e470912260@linaro.org>
Date: Mon, 17 Apr 2023 15:38:20 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.1
Subject: Re: [PATCH] drm/panel: novatek-nt35950: Improve error handling
Content-Language: en-US
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 neil.armstrong@linaro.org, Sam Ravnborg <sam@ravnborg.org>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>
References: <20230415-konrad-longbois-next-v1-1-ce695dc9df84@linaro.org>
 <ea9f27a2-ce75-01a9-3758-0fe0bfcd1e5e@linaro.org>
 <e9c2e179-eacc-151e-123b-a4e425e76333@collabora.com>
 <51d94c13-853c-519d-f206-722288b5edf4@collabora.com>
From: Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <51d94c13-853c-519d-f206-722288b5edf4@collabora.com>
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
Cc: Marijn Suijten <marijn.suijten@somainline.org>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 17.04.2023 11:44, AngeloGioacchino Del Regno wrote:
> Il 17/04/23 11:44, AngeloGioacchino Del Regno ha scritto:
>> Il 17/04/23 09:25, Neil Armstrong ha scritto:
>>> On 15/04/2023 13:00, Konrad Dybcio wrote:
>>>> In a very peculiar case when probing and registering with the secondary
>>>> DSI host succeeds, but the OF backlight or DSI attachment fails, the
>>>> primary DSI device is automatically cleaned up, but the secondary one
>>>> is not, leading to -EEXIST when the driver core tries to handle
>>>> -EPROBE_DEFER.
>>>>
>>>> Unregister the DSI1 device manually on failure to prevent that.
>>>>
>>>> Fixes: 623a3531e9cf ("drm/panel: Add driver for Novatek NT35950 DSI DriverIC panels")
>>>> Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
>>>> ---
>>>>   drivers/gpu/drm/panel/panel-novatek-nt35950.c | 8 +++++++-
>>>>   1 file changed, 7 insertions(+), 1 deletion(-)
>>>>
>>>> diff --git a/drivers/gpu/drm/panel/panel-novatek-nt35950.c b/drivers/gpu/drm/panel/panel-novatek-nt35950.c
>>>> index abf752b36a52..7498fc6258bb 100644
>>>> --- a/drivers/gpu/drm/panel/panel-novatek-nt35950.c
>>>> +++ b/drivers/gpu/drm/panel/panel-novatek-nt35950.c
>>>> @@ -585,8 +585,11 @@ static int nt35950_probe(struct mipi_dsi_device *dsi)
>>>>                  DRM_MODE_CONNECTOR_DSI);
>>>>       ret = drm_panel_of_backlight(&nt->panel);
>>>> -    if (ret)
>>>> +    if (ret) {
>>
>> If this is not a dual-DSI case, nt->dsi[1] will be NULL: I agree it's still
>> fine as in the kernel won't crash in that case, but for logical correctness
>> I would still account for that:
>>
>>          if (num_dsis == 2)
>>              mipi_dsi_device_unregister(nt->dsi[1]);
>>
>>>> +        mipi_dsi_device_unregister(nt->dsi[1]);
>>>> +
>>>>           return dev_err_probe(dev, ret, "Failed to get backlight\n");
>>>> +    }
>>>>       drm_panel_add(&nt->panel);
>>>> @@ -602,6 +605,9 @@ static int nt35950_probe(struct mipi_dsi_device *dsi)
>>>>           ret = mipi_dsi_attach(nt->dsi[i]);
>>>>           if (ret < 0) {
>>
>> Same here, please add a check for num_dsis.
Right, I'll send an incremental patch to fix the fix, thanks
for spotting this!

Konrad
>>
>> Regards,
>> Angelo
> 
> Eh, too late, I just noticed that this got picked already...
