Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5ED296C2E4A
	for <lists+dri-devel@lfdr.de>; Tue, 21 Mar 2023 10:55:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F102410E18F;
	Tue, 21 Mar 2023 09:54:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk [46.235.227.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A24E510E707
 for <dri-devel@lists.freedesktop.org>; Tue, 21 Mar 2023 09:54:56 +0000 (UTC)
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it
 [2.237.20.237])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits))
 (No client certificate requested) (Authenticated sender: kholk11)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id 35C4F66030DA;
 Tue, 21 Mar 2023 09:54:54 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1679392495;
 bh=1JltmLgRNV4IHmYEsNUnZUzP3ExsG4axYz1jkhP27SY=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=Owh7RWhB7Db/pjY5RqGj1SkTPYKhoygsU7DooP1X/gCOchYEMhLFV/Uf88sVaShzh
 leEbyY5ujLEw9bBnOrQ2DGZvSI9bnX0JDvQFCb3AfqKBO7xzJZUSU1anJsD3YRTHdI
 in2uy0sTPQEjMPv9OyT030GpbpkQESfRo4zjqOuTDzYIQrQ0USzlrY3XQeFisjCKq7
 AYWUu68nxWsP44n2mIPqXfmMaHBCDtlJW2UmDNITmMRth6N9D+K7g0VM2v7sBniZJP
 TCuWeTQinerSBuHT2+PKepMLfAYmmo9N7W9nm/pCV1SSJq56wqhp6ZR7GkuuPM/5VN
 tlJiaAiAXHSgQ==
Message-ID: <cac08caf-a5ef-08d7-ac90-cd852cd63e3c@collabora.com>
Date: Tue, 21 Mar 2023 10:54:51 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH v29 1/7] dt-bindings: mediatek: add ethdr definition for
 mt8195
Content-Language: en-US
To: =?UTF-8?B?TmFuY3kgTGluICjmnpfmrKPonqIp?= <Nancy.Lin@mediatek.com>,
 "p.zabel@pengutronix.de" <p.zabel@pengutronix.de>,
 "matthias.bgg@gmail.com" <matthias.bgg@gmail.com>,
 "krzysztof.kozlowski@linaro.org" <krzysztof.kozlowski@linaro.org>,
 "chunkuang.hu@kernel.org" <chunkuang.hu@kernel.org>,
 "robh+dt@kernel.org" <robh+dt@kernel.org>,
 "krzysztof.kozlowski+dt@linaro.org" <krzysztof.kozlowski+dt@linaro.org>
References: <20221227081011.6426-1-nancy.lin@mediatek.com>
 <20221227081011.6426-2-nancy.lin@mediatek.com>
 <4aff6a7a3b606f26ec793192d9c75774276935e0.camel@mediatek.com>
 <2700bd6c-f00d-fa99-b730-2fcdf89089fa@linaro.org>
 <1d65e8b2de708db18b5f7a0faaa53834e1002d9f.camel@mediatek.com>
 <b04eb48e-c9aa-0404-33ec-bef623b8282f@linaro.org>
 <e5ceec9e-d51b-2aeb-1db7-b79b151bd44c@collabora.com>
 <0ebf187d-972e-4228-d8a0-8c0ce02f642d@linaro.org>
 <72cf6344a1c5942bff0872d05dce82b787b49b76.camel@mediatek.com>
 <4027714e-b4e8-953b-68e2-f74f7a7f0e8e@linaro.org>
 <fdd0a157-eedb-bf21-c632-79b02a4cd6b0@collabora.com>
 <5695b8e5ab8339764c646ee581529cb6cee04346.camel@mediatek.com>
 <34c758c0-cbbb-da11-6263-e7b084040ed6@collabora.com>
 <74dca3fa90d5cd78286281e2ced45842bee21f91.camel@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <74dca3fa90d5cd78286281e2ced45842bee21f91.camel@mediatek.com>
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
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 Project_Global_Chrome_Upstream_Group
 <Project_Global_Chrome_Upstream_Group@mediatek.com>,
 =?UTF-8?B?U2luZ28gQ2hhbmcgKOW8teiIiOWciyk=?= <Singo.Chang@mediatek.com>,
 "ndesaulniers@google.com" <ndesaulniers@google.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "nathan@kernel.org" <nathan@kernel.org>,
 "clang-built-linux@googlegroups.com" <clang-built-linux@googlegroups.com>,
 "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Il 21/03/23 06:33, Nancy Lin (林欣螢) ha scritto:
> Dear Angelo,
> 
> Sorry for late reply.
> 
> On Fri, 2023-03-17 at 10:58 +0100, AngeloGioacchino Del Regno wrote:
>> Il 17/03/23 10:52, Nancy Lin (林欣螢) ha scritto:
>>> On Fri, 2023-03-17 at 10:37 +0100, AngeloGioacchino Del Regno
>>> wrote:
>>>> Il 17/03/23 10:03, Krzysztof Kozlowski ha scritto:
>>>>> On 17/03/2023 08:55, Nancy Lin (林欣螢) wrote:
>>>>>> On Thu, 2023-03-16 at 12:36 +0100, Krzysztof Kozlowski wrote:
>>>>>>> On 16/03/2023 10:53, AngeloGioacchino Del Regno wrote:
>>>>>>>
>>>>>>>> Hello Krzysztof, Nancy,
>>>>>>>>
>>>>>>>> Since this series has reached v29, can we please reach an
>>>>>>>> agreement
>>>>>>>> on the bindings
>>>>>>>> to use here, so that we can get this finally upstreamed?
>>>>>>>>
>>>>>>>> I will put some examples to try to get this issue
>>>>>>>> resolved.
>>>>>>>>
>>>>>>>> ### Example 1: Constrain the number of GCE entries to
>>>>>>>> *seven*
>>>>>>>> array
>>>>>>>> elements (7x4!)
>>>>>>>>
>>>>>>>>       mediatek,gce-client-reg:
>>>>>>>>         $ref: /schemas/types.yaml#/definitions/phandle-
>>>>>>>> array
>>>>>>>>         maxItems: 1
>>>>>>>>         description: The register of display function
>>>>>>>> block to
>>>>>>>> be set
>>>>>>>> by gce.
>>>>>>>>           There are 4 arguments in this property, gce
>>>>>>>> node,
>>>>>>>> subsys id,
>>>>>>>> offset and
>>>>>>>>           register size. The subsys id is defined in the
>>>>>>>> gce
>>>>>>>> header of
>>>>>>>> each chips
>>>>>>>>           include/dt-bindings/gce/<chip>-gce.h, mapping to
>>>>>>>> the
>>>>>>>> register of display
>>>>>>>>           function block.
>>>>>>>>         items:
>>>>>>>>           minItems: 28
>>>>>>>>           maxItems: 28
>>>>>>>>           items:                     <----- this block
>>>>>>>> doesn't
>>>>>>>> seem to
>>>>>>>> get checked :\
>>>>>>>>             - description: phandle of GCE
>>>>>>>>             - description: GCE subsys id
>>>>>>>>             - description: register offset
>>>>>>>>             - description: register size
>>>>>>>
>>>>>>> This is what we would like to have but it requires
>>>>>>> exception in
>>>>>>> dtschema. Thus:
>>>>>>>
>>>>>>>>
>>>>>>>>
>>>>>>>> ### Example 2: Don't care about constraining the number
>>>>>>>> of
>>>>>>>> arguments
>>>>>>>>
>>>>>>>>       mediatek,gce-client-reg:
>>>>>>>>         $ref: /schemas/types.yaml#/definitions/phandle-
>>>>>>>> array
>>>>>>>>         maxItems: 1
>>>>>>>>         description: The register of display function
>>>>>>>> block to
>>>>>>>> be set
>>>>>>>> by gce.
>>>>>>>>           There are 4 arguments in this property, gce
>>>>>>>> node,
>>>>>>>> subsys id,
>>>>>>>> offset and
>>>>>>>>           register size. The subsys id is defined in the
>>>>>>>> gce
>>>>>>>> header of
>>>>>>>> each chips
>>>>>>>>           include/dt-bindings/gce/<chip>-gce.h, mapping to
>>>>>>>> the
>>>>>>>> register of display
>>>>>>>>           function block.
>>>>>>>
>>>>>>> use this.
>>>>>>>
>>>>>>> Best regards,
>>>>>>> Krzysztof
>>>>>>
>>>>>>
>>>>>> Hi Krzysztof, Angelo,
>>>>>>
>>>>>> Thanks for the comment.
>>>>>> The Example 2 can pass dt_binding_check.
>>>>>>
>>>>>> But the example in the binding has 7 items [1] and dts [2].
>>>>>> Does
>>>>>> the
>>>>>> "maxItems: 1" affect any other schema or dts check?
>>>>>
>>>>> Ah, then it should be maxItems: 7, not 1.
>>>>>
>>>>
>>>> Keep in mind for your v30:
>>>>
>>>> maxItems: 7 will pass - but only if minItems is *not* 7 :-)
>>>>
>>>> -> (so, do not declare minItems, as default is 1) <-
>>>>
>>>> Regards,
>>>> Angelo
>>>>
>>>
>>> Hi Angelo,
>>>
>>> I still have one message [1] when runing dt_binding_check for
>>> "example
>>> 2 + maxItems: 7" [2].
>>>
>>> [1]
>>> /proj/mtk19347/cros/src/third_party/kernel/v5.10/Documentation/devi
>>> cetr
>>> ee/bindings/display/mediatek/mediatek,ethdr.example.dtb:
>>> hdr-engine@1c114000: mediatek,gce-client-reg: [[4294967295, 7,
>>> 16384,
>>> 4096, 4294967295, 7, 20480, 4096, 4294967295, 7, 28672, 4096,
>>> 4294967295, 7, 36864, 4096, 4294967295, 7, 40960, 4096, 4294967295,
>>> 7,
>>> 45056, 4096, 4294967295, 7, 49152, 4096]] is too short
>>>
>>>
>>> [2]
>>>      mediatek,gce-client-reg:
>>>        $ref: /schemas/types.yaml#/definitions/phandle-array
>>>        maxItems: 7
>>>        description: The register of display function block to be set
>>> by
>>> gce.
>>>          There are 4 arguments in this property, gce node, subsys
>>> id,
>>> offset and
>>>          register size. The subsys id is defined in the gce header
>>> of
>>> each chips
>>>          include/dt-bindings/gce/<chip>-gce.h, mapping to the
>>> register of
>>> display
>>>          function block.
>>>
>>
>> Maybe I'm wrong about the "do not declare minItems"... try with
>>
>> minItems: 1
>> maxItems: 7
>>
>>
>> ...does it work now?
>>
> 
> Yes, It works well with "example2 + minItems:1 + maxItems: 7" [1]
> 
> [1]
>    mediatek,gce-client-reg:
>      $ref: /schemas/types.yaml#/definitions/phandle-array
>      minItems: 1
>      maxItems: 7
>      description: The register of display function block to be set by
> gce.
>        There are 4 arguments in this property, gce node, subsys id,
> offset and
>        register size. The subsys id is defined in the gce header of each
> chips
>        include/dt-bindings/gce/<chip>-gce.h, mapping to the register of
> display
>        function block.
> 

Please send a v30 with that solution ASAP then, so that we may perhaps *finally*
get it in for v6.4.

Regards,
Angelo
