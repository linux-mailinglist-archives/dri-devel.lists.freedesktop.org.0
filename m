Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 230596E1E6C
	for <lists+dri-devel@lfdr.de>; Fri, 14 Apr 2023 10:34:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AA56310EC8F;
	Fri, 14 Apr 2023 08:34:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x62a.google.com (mail-ej1-x62a.google.com
 [IPv6:2a00:1450:4864:20::62a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4376010EC8F
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Apr 2023 08:34:51 +0000 (UTC)
Received: by mail-ej1-x62a.google.com with SMTP id
 a640c23a62f3a-94a35b0ec77so406608566b.3
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Apr 2023 01:34:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1681461289; x=1684053289;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=MBhd+vki+l/y35U/QxrHM0V6qWO53SJzOsxvHiS3VI4=;
 b=IkuwrlTZ7zhdSP0BuUPKvyREuOd14Kbfh+OkUBnZYPh19M/pPTs1AehNACOKrDUdOG
 mS4MITBjLL7awLODadt0N7TgsMQrt20z+ehY4MsckGyU/ZLfEpRUMjJ6zZJFFo1pUHm+
 DaOoGRLicugjTWnlVrxNhWHsxHKyfybWO7o1a5FbdhVsF2XFWdtON7SqlBPMawhF3wMn
 FgcSDitIhYEKTfb/ee7KSmy9bA+543T+wqlwInRxiSu8cwOxfZjhq57bAYdmU3dSXrxH
 nEIwLbiwZWKYu1v4zqBLmdoTxBkfuWIR5SYBNxNo67kvqzNok8hvxQXzZI/WpPM9sHD9
 aXuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1681461289; x=1684053289;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=MBhd+vki+l/y35U/QxrHM0V6qWO53SJzOsxvHiS3VI4=;
 b=VBoaqTSiYjlpgyDwIyx4oYKJr1aA1Mkkd9IvGwr2rMN3yQkLmUg5VEVWzFtgq4Osg7
 IFOK3smzQew/nd7cL6InQ7NZZqpLxNHy+Zbx4xqWyfqO7M1kTXHtZXOL0X7uPWVtyV8Y
 Qu0jzhm+22CCPkFOh3QX9kvv4Dh3ZMG1rljZcAvWT/a+iqHO3A59rHCXTple9VjvSI7L
 +r+la8+pfZ14wHz4MDvZ+11lLHkL9ilGJOF462ZN3yvJ6wXQnbO8R1lpnN9/cL4sasLv
 7QGNZn18kUqUQrE0atLsrrn7wLzRspwNTw6GCV4nuOnXrI2G05vmli6ogp2LPebMvcRr
 cJyA==
X-Gm-Message-State: AAQBX9cGhDROFFzU7L/ctJ+PfUhTwDmrKAoNMcg7AbPOiMsEBSAkLiXt
 VsXZo6F3atRgeL1eV3Uk6wRwNg==
X-Google-Smtp-Source: AKy350b+AJCpD5JSQDbMuD6wVN5frKxcfCROijIG1NiaMj6S2xAmFKa5BnZL7BAyt/fgf8Mo/weUUQ==
X-Received: by 2002:aa7:d50f:0:b0:504:80f8:f6b2 with SMTP id
 y15-20020aa7d50f000000b0050480f8f6b2mr4795583edq.25.1681461289674; 
 Fri, 14 Apr 2023 01:34:49 -0700 (PDT)
Received: from ?IPV6:2a02:810d:15c0:828:8a60:6b0f:105a:eefb?
 ([2a02:810d:15c0:828:8a60:6b0f:105a:eefb])
 by smtp.gmail.com with ESMTPSA id
 j23-20020aa7de97000000b0050432d2b443sm1883036edv.48.2023.04.14.01.34.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 14 Apr 2023 01:34:49 -0700 (PDT)
Message-ID: <f8a4fd52-52b6-dded-c8b7-864be549e2ad@linaro.org>
Date: Fri, 14 Apr 2023 10:34:47 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.1
Subject: Re: [PATCH 01/27] dt-bindings: pwm: Add compatible for MediaTek MT6795
Content-Language: en-US
To: =?UTF-8?Q?Uwe_Kleine-K=c3=b6nig?= <u.kleine-koenig@pengutronix.de>
References: <20230412112739.160376-1-angelogioacchino.delregno@collabora.com>
 <20230412112739.160376-2-angelogioacchino.delregno@collabora.com>
 <aaeeb18d-f8e8-d6c1-1272-e5b797554b9e@linaro.org>
 <20230414083019.cpomx37tax4ibe5u@pengutronix.de>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230414083019.cpomx37tax4ibe5u@pengutronix.de>
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
Cc: devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
 thierry.reding@gmail.com, krzysztof.kozlowski+dt@linaro.org,
 linux-phy@lists.infradead.org, kernel@collabora.com, xinlei.lee@mediatek.com,
 kishon@kernel.org, phone-devel@vger.kernel.org, jassisinghbrar@gmail.com,
 linux-pwm@vger.kernel.org, chunkuang.hu@kernel.org, jitao.shi@mediatek.com,
 houlong.wei@mediatek.com, chunfeng.yun@mediatek.com, robh+dt@kernel.org,
 linux-mediatek@lists.infradead.org, ~postmarketos/upstreaming@lists.sr.ht,
 matthias.bgg@gmail.com, linux-arm-kernel@lists.infradead.org,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 linux-kernel@vger.kernel.org, vkoul@kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 14/04/2023 10:30, Uwe Kleine-König wrote:
> On Fri, Apr 14, 2023 at 10:21:05AM +0200, Krzysztof Kozlowski wrote:
>> On 12/04/2023 13:27, AngeloGioacchino Del Regno wrote:
>>> Add a compatible string for MediaTek Helio X10 MT6795's display PWM
>>> block: this is the same as MT8173.
>>>
>>> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
>>> ---
>>>  Documentation/devicetree/bindings/pwm/mediatek,pwm-disp.yaml | 4 +++-
>>>  1 file changed, 3 insertions(+), 1 deletion(-)
>>>
>>> diff --git a/Documentation/devicetree/bindings/pwm/mediatek,pwm-disp.yaml b/Documentation/devicetree/bindings/pwm/mediatek,pwm-disp.yaml
>>> index 0088bc8e7c54..153e146df7d4 100644
>>> --- a/Documentation/devicetree/bindings/pwm/mediatek,pwm-disp.yaml
>>> +++ b/Documentation/devicetree/bindings/pwm/mediatek,pwm-disp.yaml
>>> @@ -22,7 +22,9 @@ properties:
>>>            - mediatek,mt8173-disp-pwm
>>>            - mediatek,mt8183-disp-pwm
>>>        - items:
>>> -          - const: mediatek,mt8167-disp-pwm
>>> +          - enum:
>>> +              - mediatek,mt6795-disp-pwm
>>> +              - mediatek,mt8167-disp-pwm
>>
>> This does not look correct. You do not add compatible, you replace
>> breaking all mt8167-disp-pwm. At least it looks like this from context.
> 
> I thought the old semantic to be:
> 
> 	"mediatek,mt8167-disp-pwm"
> 
> and the new
> 
> 	"mediatek,mt6795-disp-pwm" or "mediatek,mt8167-disp-pwm"
> 
> . What am I missing?

The new is ok for mt6795 but it is not valid for mt8167.

Best regards,
Krzysztof

