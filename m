Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F18FF6BCB85
	for <lists+dri-devel@lfdr.de>; Thu, 16 Mar 2023 10:53:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1234210EC37;
	Thu, 16 Mar 2023 09:53:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk [46.235.227.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 389F610EC37
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Mar 2023 09:53:51 +0000 (UTC)
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it
 [2.237.20.237])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: kholk11)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id AE59F660309E;
 Thu, 16 Mar 2023 09:53:48 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1678960429;
 bh=U016GfVVdnxsip9oeySV3RsjrHt+GbtN8I0vEam86cw=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=D1ZYug/Rc7GC9oaJibLCGVC1ot6HrZSJaaD6dBId+/IevQCU8BtC3krYiV1jYB1vG
 QntG3e3/vTGxkEjKz92r3TfeVbI0b974DjcPXf4GI2j705nXTtC9lwiOAd2/AnY/F6
 z0CXJd7cBrVcF76ENARf0NTaYVTa7yGwdM/0MVCXo3vZlYh0D5bvxoNXrF0aymJ3Zb
 F8uYdm9tAIDz6DQWBRSVg36L9plmJGvA5FyZrNRsHMRHMDyI3PxKybudbJIEiuNwVP
 V/QFPGh4hL2xHjhAFEFAKBm5yn+8gIYX9WiQd8Y0uE7XWaJ+xmz5ux83Th4WlKzPyS
 T+JmIMMYGK3Ig==
Message-ID: <e5ceec9e-d51b-2aeb-1db7-b79b151bd44c@collabora.com>
Date: Thu, 16 Mar 2023 10:53:45 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH v29 1/7] dt-bindings: mediatek: add ethdr definition for
 mt8195
Content-Language: en-US
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 =?UTF-8?B?TmFuY3kgTGluICjmnpfmrKPonqIp?= <Nancy.Lin@mediatek.com>,
 "p.zabel@pengutronix.de" <p.zabel@pengutronix.de>,
 "matthias.bgg@gmail.com" <matthias.bgg@gmail.com>,
 "chunkuang.hu@kernel.org" <chunkuang.hu@kernel.org>,
 "robh+dt@kernel.org" <robh+dt@kernel.org>,
 "krzysztof.kozlowski+dt@linaro.org" <krzysztof.kozlowski+dt@linaro.org>
References: <20221227081011.6426-1-nancy.lin@mediatek.com>
 <20221227081011.6426-2-nancy.lin@mediatek.com>
 <4aff6a7a3b606f26ec793192d9c75774276935e0.camel@mediatek.com>
 <2700bd6c-f00d-fa99-b730-2fcdf89089fa@linaro.org>
 <1d65e8b2de708db18b5f7a0faaa53834e1002d9f.camel@mediatek.com>
 <b04eb48e-c9aa-0404-33ec-bef623b8282f@linaro.org>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <b04eb48e-c9aa-0404-33ec-bef623b8282f@linaro.org>
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

Il 16/03/23 07:31, Krzysztof Kozlowski ha scritto:
> On 16/03/2023 07:19, Nancy Lin (林欣螢) wrote:
>> On Wed, 2023-03-15 at 08:16 +0100, Krzysztof Kozlowski wrote:
>>> On 15/03/2023 04:45, Nancy Lin (林欣螢) wrote:
>>>

..snip..

>>>>
>>>>
>>>> [1].
>>>> Documentation/devicetree/bindings/display/mediatek/mediatek,ethdr.e
>>>> xamp
>>>> le.dtb
>>>> /proj/mtk19347/cros/src/third_party/kernel/v5.10/Documentation/devi
>>>> cetr
>>>> ee/bindings/display/mediatek/mediatek,ethdr.example.dtb:
>>>> hdr-engine@1c114000: mediatek,gce-client-reg:0: [4294967295, 7,
>>>> 16384,
>>>> 4096, 4294967295, 7, 20480, 4096, 4294967295, 7, 28672, 4096,
>>>> 4294967295, 7, 36864, 4096, 4294967295, 7, 40960, 4096, 4294967295,
>>>> 7,
>>>> 45056, 4096, 4294967295, 7, 49152, 4096] is too long
>>>>          From schema:
>>>
>>> This looks like known issue with phandles with variable number of
>>> arguments. Either we add it to the exceptions or just define it in
>>> reduced way like in other cases - only maxItems: 1 without describing
>>> items.
>>>

...

>>
>> But I have several items for this vendor property in the binding
>> example.
> 
> Do you? I thought you have one phandle?
> 
>> Can I remove maxItems? Change the mediatek,gce-client-reg as [1].
>>
>> [1]
>>    mediatek,gce-client-reg:
>>      $ref: /schemas/types.yaml#/definitions/phandle-array
>>      description: The register of display function block to be set by
>> gce.
>>        There are 4 arguments in this property, gce node, subsys id,
>> offset and
>>        register size. The subsys id is defined in the gce header of each
>> chips
>>        include/dt-bindings/gce/<chip>-gce.h, mapping to the register of
>> display
>>        function block.
> 
> No, this needs some constraints.

Hello Krzysztof, Nancy,

Since this series has reached v29, can we please reach an agreement on the bindings
to use here, so that we can get this finally upstreamed?

I will put some examples to try to get this issue resolved.

### Example 1: Constrain the number of GCE entries to *seven* array elements (7x4!)

   mediatek,gce-client-reg:
     $ref: /schemas/types.yaml#/definitions/phandle-array
     maxItems: 1
     description: The register of display function block to be set by gce.
       There are 4 arguments in this property, gce node, subsys id, offset and
       register size. The subsys id is defined in the gce header of each chips
       include/dt-bindings/gce/<chip>-gce.h, mapping to the register of display
       function block.
     items:
       minItems: 28
       maxItems: 28
       items:                     <----- this block doesn't seem to get checked :\
         - description: phandle of GCE
         - description: GCE subsys id
         - description: register offset
         - description: register size


### Example 2: Don't care about constraining the number of arguments

   mediatek,gce-client-reg:
     $ref: /schemas/types.yaml#/definitions/phandle-array
     maxItems: 1
     description: The register of display function block to be set by gce.
       There are 4 arguments in this property, gce node, subsys id, offset and
       register size. The subsys id is defined in the gce header of each chips
       include/dt-bindings/gce/<chip>-gce.h, mapping to the register of display
       function block.


Regards,
Angelo
