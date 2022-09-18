Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 01CD45BBCD3
	for <lists+dri-devel@lfdr.de>; Sun, 18 Sep 2022 11:32:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6045210E32C;
	Sun, 18 Sep 2022 09:32:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com
 [IPv6:2a00:1450:4864:20::136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3FFBF10E32C
 for <dri-devel@lists.freedesktop.org>; Sun, 18 Sep 2022 09:32:07 +0000 (UTC)
Received: by mail-lf1-x136.google.com with SMTP id x27so9029573lfu.0
 for <dri-devel@lists.freedesktop.org>; Sun, 18 Sep 2022 02:32:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date;
 bh=jRfTWemLr6NthIORn54hYU2A7/v8x5DzAcs7HxCHtt0=;
 b=HlQfxtbd4p2nTCd2bPVs6NsfI6/NyeGnjwrBFoVcpxotPfhSAArkhB95zEL3SJtwWH
 nKbU4i7D1uWa0VIcmsocgNOI5j8nLCBZeesbCENXDcF1i6MGeEqbcwLCu72DtueKZqsm
 jtkIvLKRSDVLwnehbuBQeENj+01OD3cTC/GTvlQ8NWhUTKnIKSq3joVtgXqUBWsU35eG
 8GAyHNqI66NlF1adLSwmfxgrsIDk6gpy6BeEZJES5OgsCf1ltuAFyYbOI/UrGoY/Wy2S
 Lvc2yBC6CQFbYwovKYL5FZiGyHbyy5C9XdT0VYvSIocFky8Z5TafaSdfv0sqLpGilJBS
 08Lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date;
 bh=jRfTWemLr6NthIORn54hYU2A7/v8x5DzAcs7HxCHtt0=;
 b=irITUgtMwpAq3a2DMhlGTWm5i1Qs8V+KeHhSCBnO7OH7yOW5tKaUeP2WInSLTZKncs
 QXboeTUF63YkIVBus8B/F5nKuf1Xy563c1YKwps+JyHzyGXcTVbJu2gidkGDD9B8CSfi
 k9ag+Iu4j6LHmn7nSLDFXsbSNH43Zpt7aq4W7UlpqfDzPTfJaFqpZRCgpxFNsv/bAt+X
 6DN2kcegVNmkdZcsgqEV6Qge+ptPgbzGzTHfOH0wSSlrjX/XO75z9qEN2lSl/OIHDG5R
 +RUuMvnB+nrIDkA7uLmwTeIc31psbFmLimRNG99+vApl0EiebfPyTOM+hWixC5kQIJLC
 M2BQ==
X-Gm-Message-State: ACrzQf00hFIODtebnHdgV4qtZSooPRSkDupnbtf1Ntr0UqSlLc+jP6/X
 J1uPwBa65E4IhdZAni2wy6nHog==
X-Google-Smtp-Source: AMsMyM6LutjsjtgHTG/aA+H1yVQ7fmKsKsJ2x+CnLGCMnrdlR7RpV6+ZVk1d7/e5+0oAOutW6nNuGg==
X-Received: by 2002:a19:7619:0:b0:49f:6cd7:45c2 with SMTP id
 c25-20020a197619000000b0049f6cd745c2mr1769336lff.7.1663493525421; 
 Sun, 18 Sep 2022 02:32:05 -0700 (PDT)
Received: from [192.168.0.21] (78-11-189-27.static.ip.netia.com.pl.
 [78.11.189.27]) by smtp.gmail.com with ESMTPSA id
 b20-20020a2ebc14000000b0026c15d60ad1sm78103ljf.132.2022.09.18.02.32.04
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 18 Sep 2022 02:32:04 -0700 (PDT)
Message-ID: <17cacc6f-173f-ad6c-9056-1b17635c984d@linaro.org>
Date: Sun, 18 Sep 2022 10:31:55 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [PATCH v2 1/6] dt-bindings: arm: mediatek: mmsys: change
 compatible for MT8195
Content-Language: en-US
To: Jason-JH Lin <jason-jh.lin@mediatek.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
References: <20220915161817.10307-1-jason-jh.lin@mediatek.com>
 <20220915161817.10307-2-jason-jh.lin@mediatek.com>
 <e6921ed7-a14c-aadb-abd4-1e7ee0a63be9@gmail.com>
 <f30bd382eb8923256d6f39342ec7832774c0f547.camel@mediatek.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <f30bd382eb8923256d6f39342ec7832774c0f547.camel@mediatek.com>
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
Cc: devicetree@vger.kernel.org, Singo Chang <singo.chang@mediatek.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com,
 Rex-BC Chen <rex-bc.chen@mediatek.com>, Nancy Lin <nancy.lin@mediatek.com>,
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 16/09/2022 04:34, Jason-JH Lin wrote:
> Hi Matthias,
> 
> Thanks for the review.
> 
> On Fri, 2022-09-16 at 00:05 +0200, Matthias Brugger wrote:
>>
>> On 15/09/2022 18:18, Jason-JH.Lin wrote:
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
>>> ---
>>>   .../devicetree/bindings/arm/mediatek/mediatek,mmsys.yaml        |
>>> 2 +-
>>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>>
>>> diff --git
>>> a/Documentation/devicetree/bindings/arm/mediatek/mediatek,mmsys.yam
>>> l
>>> b/Documentation/devicetree/bindings/arm/mediatek/mediatek,mmsys.yam
>>> l
>>> index 6ad023eec193..0e267428eaa6 100644
>>> ---
>>> a/Documentation/devicetree/bindings/arm/mediatek/mediatek,mmsys.yam
>>> l
>>> +++
>>> b/Documentation/devicetree/bindings/arm/mediatek/mediatek,mmsys.yam
>>> l
>>> @@ -31,7 +31,7 @@ properties:
>>>                 - mediatek,mt8183-mmsys
>>>                 - mediatek,mt8186-mmsys
>>>                 - mediatek,mt8192-mmsys
>>> -              - mediatek,mt8195-mmsys
>>> +              - mediatek,mt8195-vdosys0
>>
>> Nack, we miss the fallback compatible, as I already said twice.
>>
>> Regards,
>> Matthias
> 
> I'm sorry this happened again.
> I'll keep the compatible "mediatek,mt8195-mmsys" at next version.
> 
> The patch "dt-bindings: arm: mediatek: mmsys: remove the unused
> compatible for mt8195" should be sent after accepting the vdosys1
> series, right?

I don't think there will be no such patch...

You need to add a bindings change which will accept device nodes like:
foo {
  compatible = "mediatek,mt8195-vdosys0", "mediatek,mt8195-mmsys";

}

Example-schema shows how to do it.

Best regards,
Krzysztof
