Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C9A5A780807
	for <lists+dri-devel@lfdr.de>; Fri, 18 Aug 2023 11:11:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 66A1110E49C;
	Fri, 18 Aug 2023 09:11:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com
 [IPv6:2a00:1450:4864:20::131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 479A210E49C
 for <dri-devel@lists.freedesktop.org>; Fri, 18 Aug 2023 09:11:23 +0000 (UTC)
Received: by mail-lf1-x131.google.com with SMTP id
 2adb3069b0e04-4fe389d6f19so879051e87.3
 for <dri-devel@lists.freedesktop.org>; Fri, 18 Aug 2023 02:11:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1692349881; x=1692954681;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=hppdiLHxRC+WrN/l8lFHlm+JXNVG8Xpq1pA/rNyxg2k=;
 b=KV7tDQ+nW2HX81w2H5MvwXFL5pFdMLMXWoxAt6qD1EsDDSXHDdquCWYfjiK7TLYnO3
 UJiDoCFXJEtNi1Y32DQBlcNjMWf+e/QJF+Gh5LvbPTSDXhiFEy3VlMHTN2LFcVIaKwwa
 ybcczwdCQp0VySf/EBCv7W9oCLKtAWxu6yDNyZHmv9KjWX6i+4X6iTpDVYQPQahcZYTo
 FzEiG5icpQScWSXq7diHL+zx3Csgopa8Z7Snvb8ANhD//5LdJIAPdf79uxbcqR2TqfWk
 G3k24SUbGi6nQJyc8FE/B7xTTyoFNqENj84BDzdmXWlKLGK3sIN2p1wHe8wvsEB+x9nm
 p26g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1692349881; x=1692954681;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=hppdiLHxRC+WrN/l8lFHlm+JXNVG8Xpq1pA/rNyxg2k=;
 b=edM1YqsFE9C9vCPm+gg1hN8XMNzOwJtA2JrFQ+1BU+XlX1EdjRo0xyT+mcb3XSUdKZ
 koAXTpPrfjdj6lFuBN7zM9wyqrpXtoMUC459Bj4DqhLZ/mSozynJtoW+jgwhr82UnXd8
 aBAE05ZBgACD1r0P/eoGMG8jK3EIm7aOGH1ieIj5RsLAkoSTzvxN3l00krnM9NQY3wCY
 jSK9AnLuxhqVanHrzB27qCFmVF2441mohzS+r2o9ywxVQpkYot3cKhaP+n1FdUs2n0FF
 veCemqgJ2t5nouYoezAkh7rX+yN/+1mAL1Sm34zGQp5SMj/XRaH2p+7BloFtVPDCn9IJ
 7pPg==
X-Gm-Message-State: AOJu0YyDyq3Kce6AkxPX+JJRk6ntHecDCs7SfYMczWPHAGeFmOyy+vtb
 NHbFxe8x0ezWpGFuHlR3tNV2+w==
X-Google-Smtp-Source: AGHT+IGHU4mAV9jmOq2LFnucCcPeszMDErM4ugOh5cs8kUx7LNZQDnJzTHUr28s4FLQuA4LZGVj7yg==
X-Received: by 2002:ac2:4822:0:b0:4fe:d0f:1f1b with SMTP id
 2-20020ac24822000000b004fe0d0f1f1bmr1097397lft.65.1692349881192; 
 Fri, 18 Aug 2023 02:11:21 -0700 (PDT)
Received: from ?IPV6:2001:14ba:a0db:1f00::8a5?
 (dzdqv0yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a0db:1f00::8a5])
 by smtp.gmail.com with ESMTPSA id
 r7-20020ac25a47000000b004fe3c47253asm254079lfn.297.2023.08.18.02.11.20
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 18 Aug 2023 02:11:20 -0700 (PDT)
Message-ID: <ae9b7d7f-2003-4db8-b383-b34e178ec2c7@linaro.org>
Date: Fri, 18 Aug 2023 12:11:20 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/5] drm/bridge: tc358762: Split register programming from
 pre-enable to enable
To: Sam Ravnborg <sam@ravnborg.org>, Marek Vasut <marex@denx.de>
References: <20230615201902.566182-1-marex@denx.de>
 <20230616190203.GF1697490@ravnborg.org>
Content-Language: en-GB
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20230616190203.GF1697490@ravnborg.org>
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
Cc: Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Jonas Karlman <jonas@kwiboo.se>, dri-devel@lists.freedesktop.org,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 16/06/2023 22:02, Sam Ravnborg wrote:
> Hi Marek,
> 
> On Thu, Jun 15, 2023 at 10:18:58PM +0200, Marek Vasut wrote:
>> Move the register programming part, which actually enables the bridge and
>> makes it push data out of its DPI side, into the enable callback. The DSI
>> host like DSIM may not be able to transmit commands in pre_enable, moving
>> the register programming into enable assures it can transmit commands.
>>
>> Signed-off-by: Marek Vasut <marex@denx.de>
> 
> I was about to complain that the use of .enable is deprecated, but the
> following patch fixes this.
> So:
> Reviewed-by: Sam Ravnborg <sam@ravnborg.org>

Dear drm-misc / bridge maintainers. About two years ago nearly the same 
patch was rejected ([1]) on the grounds of some hosts (sunxi) being 
unable to send DCS commands in HS state. Later Dave created and landed 
patches that potentially enable all peripherals to send DSI commands 
from the pre_enable callback ([2]) and tc358762 picked up usage of these 
flags ([3]).

And then we land this patch, which contradicts all previous steps.
I think I fail to understand your actions.

[1] 
https://lore.kernel.org/linux-arm-msm/CAPY8ntBrhYAmsraDqJGuTrSL6VjGXBAMVoN7xweV7E4qZv+v3Q@mail.gmail.com/

[2] 
https://lore.kernel.org/r/20221205173328.1395350-5-dave.stevenson@raspberrypi.com

[3] 
https://lore.kernel.org/dri-devel/20230131141756.RFT.v2.1.I723a3761d57ea60c5dd754c144aed6c3b2ea6f5a@changeid/

> 
> 
>> ---
>> Cc: Andrzej Hajda <andrzej.hajda@intel.com>
>> Cc: Daniel Vetter <daniel@ffwll.ch>
>> Cc: David Airlie <airlied@gmail.com>
>> Cc: Jernej Skrabec <jernej.skrabec@gmail.com>
>> Cc: Jonas Karlman <jonas@kwiboo.se>
>> Cc: Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
>> Cc: Neil Armstrong <neil.armstrong@linaro.org>
>> Cc: Robert Foss <rfoss@kernel.org>
>> Cc: dri-devel@lists.freedesktop.org
>> ---
>>   drivers/gpu/drm/bridge/tc358762.c | 11 +++++++++--
>>   1 file changed, 9 insertions(+), 2 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/bridge/tc358762.c b/drivers/gpu/drm/bridge/tc358762.c
>> index 5641395fd310e..df9703eacab1f 100644
>> --- a/drivers/gpu/drm/bridge/tc358762.c
>> +++ b/drivers/gpu/drm/bridge/tc358762.c
>> @@ -162,11 +162,17 @@ static void tc358762_pre_enable(struct drm_bridge *bridge)
>>   		usleep_range(5000, 10000);
>>   	}
>>   
>> +	ctx->pre_enabled = true;
>> +}
>> +
>> +static void tc358762_enable(struct drm_bridge *bridge)
>> +{
>> +	struct tc358762 *ctx = bridge_to_tc358762(bridge);
>> +	int ret;
>> +
>>   	ret = tc358762_init(ctx);
>>   	if (ret < 0)
>>   		dev_err(ctx->dev, "error initializing bridge (%d)\n", ret);
>> -
>> -	ctx->pre_enabled = true;
>>   }
>>   
>>   static int tc358762_attach(struct drm_bridge *bridge,
>> @@ -181,6 +187,7 @@ static int tc358762_attach(struct drm_bridge *bridge,
>>   static const struct drm_bridge_funcs tc358762_bridge_funcs = {
>>   	.post_disable = tc358762_post_disable,
>>   	.pre_enable = tc358762_pre_enable,
>> +	.enable = tc358762_enable,
>>   	.attach = tc358762_attach,
>>   };
>>   
>> -- 
>> 2.39.2

-- 
With best wishes
Dmitry

