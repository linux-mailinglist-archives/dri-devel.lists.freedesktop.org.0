Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9ADB66E1E10
	for <lists+dri-devel@lfdr.de>; Fri, 14 Apr 2023 10:23:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E46B810E180;
	Fri, 14 Apr 2023 08:23:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x635.google.com (mail-ej1-x635.google.com
 [IPv6:2a00:1450:4864:20::635])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7C1F910E180
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Apr 2023 08:23:55 +0000 (UTC)
Received: by mail-ej1-x635.google.com with SMTP id si1so13544609ejb.10
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Apr 2023 01:23:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1681460634; x=1684052634;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=HlmjkGlmEwPeG1vyNfy2LB3FLh3g3BVhfM8XvqJ5230=;
 b=QVQr2FnlD4RjAAT+O04gy+/OhztUE5CI1IOw03DdQeNErGKtZQ0QNmWPYJRhXAi/qZ
 rmEwmQflx7w+RXnfLh61kVd7/iWTKr/P8th0I6NycDg6WsYSLsUmohzDXBFB5MSvH58e
 SkWMdUoHcH8tnFI1NEIXNVAkvhlfoDup1i7u5U/dbf5Fdiq4R2tSFqATAfYIqHRLcoYy
 QE5SQsRQB4q33v+Xwz7TTh0OG6vu/o6ux78k8Dj5EkI97XpQZ8ecHx17F8rOcRu73+Bl
 +FQENJm7GHhO7PzDvr7n/Pzdv+AnsGK10INAN/iBbYfrgUCOHDmhx3Q4QQrfcMFrDFgr
 9Img==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1681460634; x=1684052634;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=HlmjkGlmEwPeG1vyNfy2LB3FLh3g3BVhfM8XvqJ5230=;
 b=bv8D/Q1ylxkaFNpXT/N08+fUoeFNRvBltm1pSgBLY3psMcPk9Iqqmg4mWsSyyVbKpL
 2GKFlFSmo4raoNEb3Yqx75XSMQZ4KNUKIYWVFHKikhfOFkpCWes9ih/S7vO2PquXYQ/x
 xaYoxFWqqIwJufK50lrbE/A5chcy/qFuEcAwt6iiRdXEZH1T5E3K56hJST1vwc7NDAKQ
 VTjD/f6XoSC7ZulmhLHuLGqMPXUCP0mslD02pi7TzLj0vOGtZLi1wlT0tbAa/OpHvwPG
 1Jyr8bFtIBmefqm4M0VhNF88sWodQRl9qsFTA2+7VWKT/wddyzed3ZySHP+zr/9Y5tLL
 9BUQ==
X-Gm-Message-State: AAQBX9d+mmG/4AWzXZPCGswKb68JcuewEa3Coy+zKg20/bcdCCb6DGnM
 /RKxuydWFsnHyXWczi0SkL0+PA==
X-Google-Smtp-Source: AKy350YDDfm28Hr4Wu9pej6rnmmCl1oHhpNzr5ms7AHGJkI6pneNOhN5mTSgVEdO2HuvAbf8V5rPPA==
X-Received: by 2002:a17:907:3a03:b0:94c:784f:7569 with SMTP id
 fb3-20020a1709073a0300b0094c784f7569mr5193398ejc.30.1681460633867; 
 Fri, 14 Apr 2023 01:23:53 -0700 (PDT)
Received: from ?IPV6:2a02:810d:15c0:828:8a60:6b0f:105a:eefb?
 ([2a02:810d:15c0:828:8a60:6b0f:105a:eefb])
 by smtp.gmail.com with ESMTPSA id
 l12-20020a056402344c00b00504803f4071sm1843079edc.44.2023.04.14.01.23.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 14 Apr 2023 01:23:53 -0700 (PDT)
Message-ID: <18a7f165-592c-8443-c661-6b0345a6cd00@linaro.org>
Date: Fri, 14 Apr 2023 10:23:51 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.1
Subject: Re: [PATCH 03/27] dt-bindings: display: mediatek: dpi: Add compatible
 for MediaTek MT6795
Content-Language: en-US
To: Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
References: <20230412112739.160376-1-angelogioacchino.delregno@collabora.com>
 <20230412112739.160376-4-angelogioacchino.delregno@collabora.com>
 <0416a00e-b567-1ae4-c49c-ec21e024ab0f@gmail.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <0416a00e-b567-1ae4-c49c-ec21e024ab0f@gmail.com>
Content-Type: text/plain; charset=UTF-8
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
Cc: devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
 thierry.reding@gmail.com, krzysztof.kozlowski+dt@linaro.org,
 linux-phy@lists.infradead.org, kernel@collabora.com, xinlei.lee@mediatek.com,
 kishon@kernel.org, phone-devel@vger.kernel.org, jassisinghbrar@gmail.com,
 linux-pwm@vger.kernel.org, u.kleine-koenig@pengutronix.de,
 chunkuang.hu@kernel.org, jitao.shi@mediatek.com, houlong.wei@mediatek.com,
 chunfeng.yun@mediatek.com, robh+dt@kernel.org,
 linux-mediatek@lists.infradead.org, ~postmarketos/upstreaming@lists.sr.ht,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 vkoul@kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 12/04/2023 14:35, Matthias Brugger wrote:
> 
> 
> On 12/04/2023 13:27, AngeloGioacchino Del Regno wrote:
>> Add a compatible string for the MediaTek Helio X10 MT6795 SoC, using
>> the same parameters as MT8183.
>>
>> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
>> ---
>>   .../display/mediatek/mediatek,dpi.yaml        | 23 +++++++++++--------
>>   1 file changed, 14 insertions(+), 9 deletions(-)
>>
>> diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,dpi.yaml b/Documentation/devicetree/bindings/display/mediatek/mediatek,dpi.yaml
>> index d976380801e3..803c00f26206 100644
>> --- a/Documentation/devicetree/bindings/display/mediatek/mediatek,dpi.yaml
>> +++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,dpi.yaml
>> @@ -17,15 +17,20 @@ description: |
>>   
>>   properties:
>>     compatible:
>> -    enum:
>> -      - mediatek,mt2701-dpi
>> -      - mediatek,mt7623-dpi
>> -      - mediatek,mt8173-dpi
>> -      - mediatek,mt8183-dpi
>> -      - mediatek,mt8186-dpi
>> -      - mediatek,mt8188-dp-intf
>> -      - mediatek,mt8192-dpi
>> -      - mediatek,mt8195-dp-intf
>> +    oneOf:
>> +      - enum:
>> +          - mediatek,mt2701-dpi
>> +          - mediatek,mt7623-dpi
>> +          - mediatek,mt8173-dpi
>> +          - mediatek,mt8183-dpi
>> +          - mediatek,mt8186-dpi
>> +          - mediatek,mt8188-dp-intf
>> +          - mediatek,mt8192-dpi
>> +          - mediatek,mt8195-dp-intf
>> +      - items:
>> +          - enum:
>> +              - mediatek,mt6795-dpi
>> +          - const: mediatek,mt8183-dpi
> 
> Shouldn't we declare both const: ?

I assume it is likely the enum will grow. If this is reasonably
anticipated, keep enum.

Best regards,
Krzysztof

