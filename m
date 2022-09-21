Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6AB195BF64A
	for <lists+dri-devel@lfdr.de>; Wed, 21 Sep 2022 08:28:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4513110E842;
	Wed, 21 Sep 2022 06:28:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com
 [IPv6:2a00:1450:4864:20::12b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5A53910E841
 for <dri-devel@lists.freedesktop.org>; Wed, 21 Sep 2022 06:28:38 +0000 (UTC)
Received: by mail-lf1-x12b.google.com with SMTP id o2so7521992lfc.10
 for <dri-devel@lists.freedesktop.org>; Tue, 20 Sep 2022 23:28:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date;
 bh=NjkZdkL1JldrqDVNu0N/8E6w/nwH+oo08ZTDDHx3Epc=;
 b=xBlD5VT0+GduvjYgiHX+YZzlJUZA8q9L4yxkve+xXIEyB9mmDTfzAor1+U+jobGoNj
 raXJkajU9gsQNIzU89o4Ptl9jtFEECS3k/NqFXOrKKc50pNnIcEnYIpTq9QITj9CA1qV
 iJYA7nzbkN7XPLVWkcD2OakJVTbED9sa8mvlg3AFrasK//ROrpyE/J7TPenyCvNaoaFk
 0UrzYZz2yOl4aEpfz3ThydDQJ3NPYDoahAalwOdGZQk1ho6akDe3xa2NReSuBsRWtAUD
 rYCC73F7qCY3g7LR99Vndm3I1eY3rMSX0OaSN0Oei2c2iaVV5d1RbwfivMlD1iKHIHST
 vTcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date;
 bh=NjkZdkL1JldrqDVNu0N/8E6w/nwH+oo08ZTDDHx3Epc=;
 b=UmDmHKfytiMLGoIsKVGk1lYjExTseguFiWURjnxCXZwcAs+K/vTdYS4mp5Oo8OVPYl
 CFxg4HXjhVMBk0bSDNAwaId8SGnsRbb6s59MCwuyvUZSL5c55gXgVHCHXqZMLlLN9NAN
 VbEsOQ4v14TjOWC6MgrakZpCHmN8UIfpKy8NyRCgu/EzNfxZqnAY856l8C9QHk0ElMbr
 rsN/dUxHz22xxycTXBq4Y3GQE/QHmMvsPUWlmg9QwX1qv9bj4wQCXXmhqQnjR02ixCnS
 dqlPlN3af4pe25gDXaSU4O85wtdbfKhs4DIABH4ghp7YhnnhcdOOtXUfh8beeuG5ktt3
 8mdQ==
X-Gm-Message-State: ACrzQf015RMtI7EJa7XEF9IZ8yG/QkluNd57P462SN3outPuycviccnR
 4mlzKpiGL+hJdUScUcJ9zdsm5g==
X-Google-Smtp-Source: AMsMyM5EWxKhU/JvV1HGm5Jvoeu4U9WCBLswwA2sX1HdMqQ3ux4ZgMTlmqk875wqoOxHMnFPciKMGA==
X-Received: by 2002:a05:6512:12c1:b0:49f:d13f:56f3 with SMTP id
 p1-20020a05651212c100b0049fd13f56f3mr2977436lfg.657.1663741716577; 
 Tue, 20 Sep 2022 23:28:36 -0700 (PDT)
Received: from [192.168.0.21] (78-11-189-27.static.ip.netia.com.pl.
 [78.11.189.27]) by smtp.gmail.com with ESMTPSA id
 x20-20020ac25dd4000000b00492a0f02758sm305109lfq.28.2022.09.20.23.28.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 20 Sep 2022 23:28:35 -0700 (PDT)
Message-ID: <29a06da0-ddf5-15eb-ac3d-0bc2e0006ae9@linaro.org>
Date: Wed, 21 Sep 2022 08:28:34 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [PATCH v3 1/6] dt-bindings: arm: mediatek: mmsys: change
 compatible for MT8195
Content-Language: en-US
To: Jason-JH Lin <jason-jh.lin@mediatek.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
References: <20220920140145.19973-1-jason-jh.lin@mediatek.com>
 <20220920140145.19973-2-jason-jh.lin@mediatek.com>
 <65c93c5d-941a-267b-408d-95be83dc2454@linaro.org>
 <8fba20bf37326504b871fb55ce171cd37720a9a0.camel@mediatek.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <8fba20bf37326504b871fb55ce171cd37720a9a0.camel@mediatek.com>
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

On 21/09/2022 06:16, Jason-JH Lin wrote:
> Hi Krzysztof,
> 
> Thanks for the reviews.
> 
> On Tue, 2022-09-20 at 17:25 +0200, Krzysztof Kozlowski wrote:
>> On 20/09/2022 16:01, Jason-JH.Lin wrote:
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
>>>  .../devicetree/bindings/arm/mediatek/mediatek,mmsys.yaml      | 4
>>> ++++
>>>  1 file changed, 4 insertions(+)
>>>
>>> diff --git
>>> a/Documentation/devicetree/bindings/arm/mediatek/mediatek,mmsys.yam
>>> l
>>> b/Documentation/devicetree/bindings/arm/mediatek/mediatek,mmsys.yam
>>> l
>>> index 6ad023eec193..df9184b6772c 100644
>>> ---
>>> a/Documentation/devicetree/bindings/arm/mediatek/mediatek,mmsys.yam
>>> l
>>> +++
>>> b/Documentation/devicetree/bindings/arm/mediatek/mediatek,mmsys.yam
>>> l
>>> @@ -38,6 +38,10 @@ properties:
>>>            - const: mediatek,mt7623-mmsys
>>>            - const: mediatek,mt2701-mmsys
>>>            - const: syscon
>>> +      - items:
>>> +          - const: mediatek,mt8195-vdosys0
>>> +          - const: mediatek,mt8195-mmsys
>>> +          - const: syscon
>>
>> and why mediatek,mt8195-mmsys is kept as non-deprecated?
> 
> Shouldn't we keep this for fallback compatible?

I am not talking about it.

> 
> I think this items could support the device node like:
> foo {
>   compatible = "mediatek,mt8195-vdosys0", "mediatek,mt8195-mmsys", 
> 	       "syscon";
> }
> 

Yes, this one ok.

> 
> Or should I change the items like this?
> - items:
>     - const: mediatek,mt8195-vdosys0
>     - enum:
>         - mediatek,mt8195-mmsys
>     - const: syscon
> 

No, this does not look correct.

I asked why do you keep old mediatek,mt8195-mmsys compatible in the same
place (the alone one), without making it deprecated?

Best regards,
Krzysztof
