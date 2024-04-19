Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A7DD38AAB64
	for <lists+dri-devel@lfdr.de>; Fri, 19 Apr 2024 11:23:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8BEF610E088;
	Fri, 19 Apr 2024 09:22:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="r79fBy8R";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com
 [209.85.128.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 08F7110E088
 for <dri-devel@lists.freedesktop.org>; Fri, 19 Apr 2024 09:22:55 +0000 (UTC)
Received: by mail-wm1-f43.google.com with SMTP id
 5b1f17b1804b1-4190a1bd2deso2497655e9.1
 for <dri-devel@lists.freedesktop.org>; Fri, 19 Apr 2024 02:22:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1713518574; x=1714123374;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=y576gXoPcjc3Y2FVL6fqBu3Gc7Q1+NXvtH+iYdNf3yU=;
 b=r79fBy8Rpq78T0mjdBh7jahuFEKtJV9x8UBPhnlZ27xUG4xYw+GvV3BcgkV76UY0mN
 jCD0y1eGAlvMFAH4J6j1fsQ3VjyspOVq6TQVK1vkCG1Gjm5RrxoNopVpNx14o4780XnU
 bjyEyBfYFn39VFoPA9o+6fViEOMQ0MGCd5nJ0clNXQpHmb9fjIect9aduyX2eOX9/j3h
 ao0GiSlvR+0cx6Mo7TN5fUb1wXrWFmkeZVoxMASKcLVyq3EuShJqenWC2q7qH1xUEJ0o
 LxJ0OxbpM0VGgrZ4CAz7Cd20ZMWXy67Gl08QLznTrJ7OEO6yiVuPbGVJYmQC/ZU0QMoL
 F/Yg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1713518574; x=1714123374;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=y576gXoPcjc3Y2FVL6fqBu3Gc7Q1+NXvtH+iYdNf3yU=;
 b=hlJCgDlXUind/bV+Ma26++BGqYpllHUsJheZF6HNtvuNKNyztL4wtsbkw3IFsAds/g
 ifeIXLnUfc5/pGt10fA5EHrESwP4hdkhGF8LGS5Pq/whZe7siV5P0RAPvyJDZXXcNz5x
 tXFFGZOyTEFn/6tH2Pmj412fIpI3aTbJmkuRPWQo7oC3g3qPXyyRgu8HgChoCGvO8dHR
 hA5wEY+llbLUoAON3tFHtVad0QpEXJK5SnPyXir++nlQeA+t+VlN2dUxD4Hx0qLlxUw/
 1rpu+tAuAApz6X7yzHjqrsXsw7Cg2R+HI4PMWpkaL17nL9NidDl1oHfidMmTiQxS5nbk
 xPUQ==
X-Gm-Message-State: AOJu0YzyPLsPK7KcIedkBildF/BVmB0qETncFtTkU+SqohN51KBDMeAu
 GI9ZNHgOj57vlBaF61hV64vUE0MIEk6tVb2IU7QsnY038/oDr4nraqNI2ImuRP4=
X-Google-Smtp-Source: AGHT+IGEMMwvqsWa1wBPlb1YxcuxGJHgk4ZlrLlGwj3TJU4+1nuQXEqo0CbuUtJgEODgebOizRMxsg==
X-Received: by 2002:a05:600c:1d0f:b0:418:f6b7:a383 with SMTP id
 l15-20020a05600c1d0f00b00418f6b7a383mr990122wms.2.1713518574007; 
 Fri, 19 Apr 2024 02:22:54 -0700 (PDT)
Received: from [192.168.1.172] ([93.5.22.158])
 by smtp.gmail.com with ESMTPSA id
 b10-20020a05600c4e0a00b00418f30874b4sm4015450wmq.17.2024.04.19.02.22.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 19 Apr 2024 02:22:53 -0700 (PDT)
Message-ID: <57705980-e776-4178-878d-15c2007f7ef3@baylibre.com>
Date: Fri, 19 Apr 2024 11:22:52 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 14/17] drm/mediatek: add MT8365 SoC support
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Matthias Brugger
 <matthias.bgg@gmail.com>, Jitao Shi <jitao.shi@mediatek.com>,
 CK Hu <ck.hu@mediatek.com>, =?UTF-8?Q?Uwe_Kleine-K=C3=B6nig?=
 <u.kleine-koenig@pengutronix.de>, Michael Turquette
 <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>,
 Fabien Parent <fparent@baylibre.com>,
 Markus Schneider-Pargmann <msp@baylibre.com>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>
Cc: dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-pwm@vger.kernel.org,
 linux-clk@vger.kernel.org
References: <20231023-display-support-v3-0-53388f3ed34b@baylibre.com>
 <20231023-display-support-v3-14-53388f3ed34b@baylibre.com>
 <9ef43fff-ee2a-4b2c-a595-30f5bf7588c2@collabora.com>
Content-Language: en-US
From: Alexandre Mergnat <amergnat@baylibre.com>
In-Reply-To: <9ef43fff-ee2a-4b2c-a595-30f5bf7588c2@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 19/04/2024 10:01, AngeloGioacchino Del Regno wrote:
> Il 18/04/24 16:17, amergnat@baylibre.com ha scritto:
>> From: Fabien Parent <fparent@baylibre.com>
>>
>> Add DRM support for MT8365 SoC.
>>
>> Signed-off-by: Fabien Parent <fparent@baylibre.com>
>> Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
>> Signed-off-by: Alexandre Mergnat <amergnat@baylibre.com>
> 
> There are two things that I want to point out. Please check below.
> 
> The series that I've sent for adding OF Graphs [1] support to MediaTek DRM is
> not going to be picked in time for v6.10, but I think neither your MT8365 support
> series is, and that's why I'm telling you this.
> 
> If your work was based off my series, you would not need to add the MT8365 ddp
> MAIN and EXT paths to mtk_drm_drv: you'd just add it to the bindings and then
> you would declare the paths in devicetree.

Ok then I will rebase my v4 on top of your serie

> 
> 
> [1]: https://lore.kernel.org/r/20240409120211.321153-1-angelogioacchino.delregno@collabora.com
> 
> There's also one more comment....
> 
>> ---
>>   drivers/gpu/drm/mediatek/mtk_drm_drv.c | 30 ++++++++++++++++++++++++++++++
>>   1 file changed, 30 insertions(+)
>>
>> diff --git a/drivers/gpu/drm/mediatek/mtk_drm_drv.c b/drivers/gpu/drm/mediatek/mtk_drm_drv.c
>> index 74832c213092..427b601309c4 100644
>> --- a/drivers/gpu/drm/mediatek/mtk_drm_drv.c
>> +++ b/drivers/gpu/drm/mediatek/mtk_drm_drv.c
> 
> ..snip..
> 
>> @@ -793,6 +821,8 @@ static const struct of_device_id mtk_ddp_comp_dt_ids[] = {
>>         .data = (void *)MTK_DSI },
>>       { .compatible = "mediatek,mt8188-dsi",
>>         .data = (void *)MTK_DSI },
>> +    { .compatible = "mediatek,mt8365-dpi",
> 
> You removed the mt8365 specific compatible from the DPI driver - why did you keep
> it here?! that's not needed! :-)

Sorry for that, I forgot to remove it in this driver too. Thanks to catched it.

> 
> Cheers,
> Angelo
> 
>> +      .data = (void *)MTK_DPI },
>>       { }
>>   };
>>
> 

-- 
Regards,
Alexandre
