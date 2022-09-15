Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 136A65B9F8A
	for <lists+dri-devel@lfdr.de>; Thu, 15 Sep 2022 18:20:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3D96510EB6A;
	Thu, 15 Sep 2022 16:20:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x52a.google.com (mail-ed1-x52a.google.com
 [IPv6:2a00:1450:4864:20::52a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A84A910EB66
 for <dri-devel@lists.freedesktop.org>; Thu, 15 Sep 2022 16:20:35 +0000 (UTC)
Received: by mail-ed1-x52a.google.com with SMTP id e18so27737352edj.3
 for <dri-devel@lists.freedesktop.org>; Thu, 15 Sep 2022 09:20:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date;
 bh=Kd+JAIxoatS6fqpZjKg+PafGJDvgpv06EAtknvwbZaQ=;
 b=F72x7QYZIhbmFjR0ChiYcfO63EjAeyERPyBY55RLEnhiiokBPHqF50G9KkbcsNROkA
 lYQEegvB+fu3ppSt53cWMXH+tkODzC8u62kgMKqmu0OhOAxg+BrNr6XVxIE2nNV8P4bI
 P71fNfJnKryq4wYh4Geo7Ow9ztj5pRH/lDi5sTHfQPwPziIuSOTSD3LJojcshvV7couK
 0odQpei6AzHdQZLYwpxEZ0GVfoRsgLFDyI2/l/trh/4lUZu9GYR+H06Xi4BhjZFdWNrE
 0T1xy5zADQ3cvJbuBqlZ+znEVnuXjTQVQ8GF7rwRIg3WCgCwMoQSAGM/NfpkgmOdxb4d
 EE0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date;
 bh=Kd+JAIxoatS6fqpZjKg+PafGJDvgpv06EAtknvwbZaQ=;
 b=TLM4kIbuL5dEOR5OaRnZVdX80vv5OKHpT6W3PAePzLZUoWuwUbfsp/mNYzGZBqyBUG
 zKcAOhn+aqFqHupC5m0cuMWgWxPJy54xgWP2TGcUN8LI2+Vs5VTMfttu1XJD4gpEePNl
 s95Muhfgxf6+dU/62e2m7+r/M/wFzElBNfb1wrEppr3juz2FCGXpE3pVrhpVRNAUT6bZ
 SRTxlYZx6H3R4Jqdyn8USt98TY9DBTvfVfgndXvCh2uJA9GtaWqGSqRwii6VAVScCy0c
 254VgNUcnvnH+SOtEyP5PcfFEan9eG7x2NIYqmsoUxGW4SBmbpHYbaSguz036ftu9ERy
 XcCw==
X-Gm-Message-State: ACrzQf0wDj2gE9iTgY8YI60wg3PpCZuMDssHdmD7JE8/ltUolvlTHkgp
 DB8N41Ah2C0RrFAqOmq2ATY04fgK4WM=
X-Google-Smtp-Source: AMsMyM63oHtUjcmEQaYXKXqjqIFTLT8HB0HjfWwV868jYlpt/GWlhdq2iBhj+mSI9knUF4WLNHgqkw==
X-Received: by 2002:aa7:cd8e:0:b0:452:2682:a955 with SMTP id
 x14-20020aa7cd8e000000b004522682a955mr516912edv.379.1663258834101; 
 Thu, 15 Sep 2022 09:20:34 -0700 (PDT)
Received: from [192.168.2.177] ([207.188.167.132])
 by smtp.gmail.com with ESMTPSA id
 e21-20020a170906315500b00772061034dbsm1534324eje.182.2022.09.15.09.20.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 15 Sep 2022 09:20:32 -0700 (PDT)
Message-ID: <a8e18b62-f49f-7c99-e046-3ee609e11627@gmail.com>
Date: Thu, 15 Sep 2022 18:20:28 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.1
Subject: Re: [PATCH 1/5] dt-bindings: arm: mediatek: mmsys: change compatible
 for MT8195
Content-Language: en-US
To: Jason-JH Lin <jason-jh.lin@mediatek.com>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
References: <20220914182331.20515-1-jason-jh.lin@mediatek.com>
 <20220914182331.20515-2-jason-jh.lin@mediatek.com>
 <1b739216-8bb1-162b-1af5-24acba7324bf@gmail.com>
 <296155e2a12a474439ba092e73b4bcffbf3d3edc.camel@mediatek.com>
From: Matthias Brugger <matthias.bgg@gmail.com>
In-Reply-To: <296155e2a12a474439ba092e73b4bcffbf3d3edc.camel@mediatek.com>
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
Cc: devicetree@vger.kernel.org, Singo Chang <singo.chang@mediatek.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com,
 Rex-BC Chen <rex-bc.chen@mediatek.com>, Nancy Lin <nancy.lin@mediatek.com>,
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Jason,

On 15/09/2022 03:24, Jason-JH Lin wrote:
> Hi Matthias,
> 
> Thanks for the reviews.
> 
> On Wed, 2022-09-14 at 23:24 +0200, Matthias Brugger wrote:
>>
>> On 14/09/2022 20:23, Jason-JH.Lin wrote:
>>> For previous MediaTek SoCs, such as MT8173, there are 2 display HW
>>> pipelines binding to 1 mmsys with the same power domain, the same
>>> clock driver and the same mediatek-drm driver.
>>>
>>> For MT8195, VDOSYS0 and VDOSYS1 are 2 display HW pipelines binding
>>> to
>>> 2 different power domains, different clock drivers and different
>>> mediatek-drm drivers.
>>>
>>> Moreover, Hardware pipeline of VDOSYS0 has these components: COLOR,
>>> CCORR, AAL, GAMMA, DITHER. They are related to the PQ (Picture
>>> Quality)
>>> and they makes VDOSYS0 supports PQ function while they are not
>>> including in VDOSYS1.
>>>
>>> Hardware pipeline of VDOSYS1 has the component ETHDR (HDR related
>>> component). It makes VDOSYS1 supports the HDR function while it's
>>> not
>>> including in VDOSYS0.
>>>
>>> To summarize0:
>>> Only VDOSYS0 can support PQ adjustment.
>>> Only VDOSYS1 can support HDR adjustment.
>>>
>>> Therefore, we need to separate these two different mmsys hardwares
>>> to
>>> 2 different compatibles for MT8195.
>>>
>>> Fixes: 81c5a41d10b9 ("dt-bindings: arm: mediatek: mmsys: add mt8195
>>> SoC binding")
>>> Signed-off-by: Jason-JH.Lin <jason-jh.lin@mediatek.com>
>>> Signed-off-by: Bo-Chen Chen <rex-bc.chen@mediatek.com>
>>> Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
>>
>> I'm not sure Krzysztof gave his Acked-by tag.
> 
> I'll remove this tag.
>>
>>> ---
>>>    .../devicetree/bindings/arm/mediatek/mediatek,mmsys.yaml        |
>>> 2 ++
>>>    1 file changed, 2 insertions(+)
>>>
>>> diff --git
>>> a/Documentation/devicetree/bindings/arm/mediatek/mediatek,mmsys.yam
>>> l
>>> b/Documentation/devicetree/bindings/arm/mediatek/mediatek,mmsys.yam
>>> l
>>> index 6ad023eec193..a53b32c0a608 100644
>>> ---
>>> a/Documentation/devicetree/bindings/arm/mediatek/mediatek,mmsys.yam
>>> l
>>> +++
>>> b/Documentation/devicetree/bindings/arm/mediatek/mediatek,mmsys.yam
>>> l
>>> @@ -32,6 +32,8 @@ properties:
>>>                  - mediatek,mt8186-mmsys
>>>                  - mediatek,mt8192-mmsys
>>>                  - mediatek,mt8195-mmsys
>>> +              - mediatek,mt8195-vdosys0
>>
>> As I said in the last submission, we should make mediatek,mt8195-
>> mmsys as a
>> fallback of vdosys0. Actually mediatek,mt8195-mmsys is only used for
>> the
>> fallback of vdosys0.
> 
> I think adding both vdosys0 and vdosys1 can make the description of
> this patch clearer.
> 
> It's find to me to only add "mediatek,mt8195-vdosys0" in this patch.
> So I'll remove the "mediatek,mt8195-vdosys1" at the next version.
> 

That's not what I wanted to suggest. Up to now in upstream kernel compatible 
mediatek,mt8195-mmsys enables support fro vdosys0. The vdosys1 is not yet 
upstream, so no support.
If we change the compatible, we should keep mediatek,mt8195-mmsys as fallback of 
"mediatek,mt8195-vdosys0" so that older device tree blobs won't break with a 
newer kernel.
For "mediatek,mt8195-vdosys1" we do not need a fallback compatible as the code 
never reached upstream, so no breakage expected.

Hope I explain myself now.

Regards,
Matthias


> Regards,
> Jason-JH.Lin
>>
>> Regards,
>> Matthias
>>
>>> +              - mediatek,mt8195-vdosys1
>>>                  - mediatek,mt8365-mmsys
>>>              - const: syscon
>>>          - items:
>>
>>
