Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CFA238FE513
	for <lists+dri-devel@lfdr.de>; Thu,  6 Jun 2024 13:17:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 037E910E8FF;
	Thu,  6 Jun 2024 11:17:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="4GoOi8sn";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madrid.collaboradmins.com (madrid.collaboradmins.com
 [46.235.227.194])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1FDE110E900
 for <dri-devel@lists.freedesktop.org>; Thu,  6 Jun 2024 11:17:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1717672630;
 bh=oeA5U1dOP1fkZuCJTDBmCrBPiCffZl7cApyojpOoeKA=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=4GoOi8snV8Yb/VuOTJ5QixOhvORfiktqnLBtl0DCGL1cm6Wp6wRqRoSMQ8qbqllOV
 P8CMtQgmIQjkgkqX5g79flLvzr5rvaiSSyrnK8sswcfSDKg2wHxltGGHba6Wf4To5N
 AkmLmJlrZirdWzGE3I5UIXq9OUurbm8YgDqBhONEEH4S22RkSar96DF+EFuJOQWeXT
 lb5t2H/9zNQeAejsLTBSeIvF3jadA7vGo4JixiM8a4iEqVzQOpvW/ItuiBwqTr86nQ
 t3UlI0xoUF1xFbEI3AwLOy3X9/6BifNtjxQGSrMQkgqD+1JgBAeXyWY/jVycW2Omi3
 CNxPgsrOi8vqQ==
Received: from [100.113.186.2] (cola.collaboradmins.com [195.201.22.229])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: kholk11)
 by madrid.collaboradmins.com (Postfix) with ESMTPSA id 82FB7378061A;
 Thu,  6 Jun 2024 11:17:08 +0000 (UTC)
Message-ID: <7f1b4a45-04cf-4b6d-878a-5bd0054a9ac0@collabora.com>
Date: Thu, 6 Jun 2024 13:17:07 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 2/3] dt-bindings: arm: mediatek: mmsys: Add OF graph
 support for board path
To: Chen-Yu Tsai <wenst@chromium.org>
Cc: =?UTF-8?B?Q0sgSHUgKOiDoeS/iuWFiSk=?= <ck.hu@mediatek.com>,
 "chunkuang.hu@kernel.org" <chunkuang.hu@kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "tzimmermann@suse.de" <tzimmermann@suse.de>,
 =?UTF-8?B?U2hhd24gU3VuZyAo5a6L5a2d6KyZKQ==?= <Shawn.Sung@mediatek.com>,
 "mripard@kernel.org" <mripard@kernel.org>,
 =?UTF-8?B?Sml0YW8gU2hpICjnn7PorrDmtpsp?= <jitao.shi@mediatek.com>,
 "daniel@ffwll.ch" <daniel@ffwll.ch>,
 "p.zabel@pengutronix.de" <p.zabel@pengutronix.de>,
 "conor+dt@kernel.org" <conor+dt@kernel.org>,
 "maarten.lankhorst@linux.intel.com" <maarten.lankhorst@linux.intel.com>,
 "robh@kernel.org" <robh@kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "airlied@gmail.com" <airlied@gmail.com>,
 "krzysztof.kozlowski+dt@linaro.org" <krzysztof.kozlowski+dt@linaro.org>,
 "kernel@collabora.com" <kernel@collabora.com>,
 "matthias.bgg@gmail.com" <matthias.bgg@gmail.com>,
 =?UTF-8?B?WXUtY2hhbmcgTGVlICjmnY7nprnnkosp?= <Yu-chang.Lee@mediatek.com>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>,
 "amergnat@baylibre.com" <amergnat@baylibre.com>
References: <20240521075717.50330-1-angelogioacchino.delregno@collabora.com>
 <20240521075717.50330-3-angelogioacchino.delregno@collabora.com>
 <e7845300fa822413f6308cb6297222cde89c39e0.camel@mediatek.com>
 <0e0fe86c-92da-43f5-89d7-8084274a908a@collabora.com>
 <CAGXv+5FgVk9z3DhAC5oYoGXSJ+wJf+sa6wFSyJ_Nhy3JrKkCng@mail.gmail.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <CAGXv+5FgVk9z3DhAC5oYoGXSJ+wJf+sa6wFSyJ_Nhy3JrKkCng@mail.gmail.com>
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

Il 06/06/24 08:46, Chen-Yu Tsai ha scritto:
> On Wed, Jun 5, 2024 at 7:15 PM AngeloGioacchino Del Regno
> <angelogioacchino.delregno@collabora.com> wrote:
>>
>> Il 05/06/24 03:38, CK Hu (胡俊光) ha scritto:
>>> Hi, Angelo:
>>>
>>> On Tue, 2024-05-21 at 09:57 +0200, AngeloGioacchino Del Regno wrote:
>>>> Document OF graph on MMSYS/VDOSYS: this supports up to three DDP paths
>>>> per HW instance (so potentially up to six displays for multi-vdo SoCs).
>>>>
>>>> The MMSYS or VDOSYS is always the first component in the DDP pipeline,
>>>> so it only supports an output port with multiple endpoints - where each
>>>> endpoint defines the starting point for one of the (currently three)
>>>> possible hardware paths.
>>>>
>>>> Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
>>>> Reviewed-by: Alexandre Mergnat <amergnat@baylibre.com>
>>>> Tested-by: Alexandre Mergnat <amergnat@baylibre.com>
>>>> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
>>>> ---
>>>>    .../bindings/arm/mediatek/mediatek,mmsys.yaml | 28 +++++++++++++++++++
>>>>    1 file changed, 28 insertions(+)
>>>>
>>>> diff --git a/Documentation/devicetree/bindings/arm/mediatek/mediatek,mmsys.yaml b/Documentation/devicetree/bindings/arm/mediatek/mediatek,mmsys.yaml
>>>> index b3c6888c1457..0ef67ca4122b 100644
>>>> --- a/Documentation/devicetree/bindings/arm/mediatek/mediatek,mmsys.yaml
>>>> +++ b/Documentation/devicetree/bindings/arm/mediatek/mediatek,mmsys.yaml
>>>> @@ -93,6 +93,34 @@ properties:
>>>>      '#reset-cells':
>>>>        const: 1
>>>>
>>>> +  port:
>>>> +    $ref: /schemas/graph.yaml#/properties/port
>>>> +    description:
>>>> +      Output port node. This port connects the MMSYS/VDOSYS output to
>>>> +      the first component of one display pipeline, for example one of
>>>> +      the available OVL or RDMA blocks.
>>>> +      Some MediaTek SoCs support multiple display outputs per MMSYS.
>>>
>>> This patch looks good to me. Just want to share another information for you.
>>> Here is an example that mmsys/vdosys could point to the display interface node.
>>>
>>> vdosys0: syscon@1c01a000 {
>>>             mmsys-display-interface = <&dsi0>, <&dsi1>, <&dp_intf0>;
>>> };
>>>
>>> vdosys1: syscon@1c100000 {
>>>             mmsys-display-interface = <&dp_intf1>;
>>> };
>>>
>>> There is no conflict that mmsys/vdosys point to first component of one display pipeline or point to display interface.
>>> Both could co-exist.
>>>
>>
>> Hey CK,
>>
>> yes, this could be an alternative to the OF graphs, and I'm sure that it'd work,
>> even though this kind of solution would still require partial hardcoding of the
>> display paths up until mmsys-display-interface (so, up until DSI0, or DSI1, etc).
> 
> I think you might be misunderstanding CK's proposal? He's simply saying that
> instead of pointing to the start of the pipeline, point to the end instead.
> You can still use the OF graph and work backwards from the output.
> 

Oh, well, if I'm misunderstanding, sorry about that!

Though, OF Graphs are describing a "sequence of stuff" (sorry for the suboptimal
wording) and, well, the data goes from A to C with B in the middle, so the graph
starts at A, goes to B, then goes to C.

Starting from A, going to C, then backwards to B would be actually wrong, as that
appears to describe that the pipeline goes A->C->B instead of A->B->C.

>> The problem with a solution like this is that, well, even though it would work,
>> even if we ignore the suboptimal partial hardcoding, OF graphs are something
>> generic, while the mmsys-display-interface would be a MediaTek specific/custom
>> property.
>>
>> In the end, reusing generic kernel apis/interfaces/etc is always preferred
>> compared to custom solutions, especially in this case, in which the generic
>> stuff is on-par (or actually, depending purely on personal opinions, superior).
> 
> Here you are mixing hardware descriptions and kernel implementation details.
> 

Not really. I'm saying that OF Graph would be preferred compared to a custom
propety, when they both do the same.

But again, I might have misunderstood what CK was trying to say, so just leave it.

> I think this goes back to whether the mmsys/vdosys is actually part of the
> graph or not. It certainly controls the muxes within the graph. But that
> doesn't mean it has to be within the graph itself. It can just have pointers
> to entry points of the graph (for which you would have a couple lines of
> custom code [1]). If the data doesn't flow through the mmsys/vdosys, then

               ^^^ [1] is a link I think? You missed it! :-)

> I would argue that it is not part of the graph.

It's part of the graph, because it is setting up the pipeline - and it's doing that
in hardware, by doing the muxing as you said.
I could even go on arguing that the data does actually pass through that, but I
don't want to start any big deal around that, so I won't.

> 
> I would also argue that the data path should be fully described in the
> device tree, not hardcoding paths based on board usage.

Yes, that's what I also said (perhaps I should've been clearer) since the very
beginning, and it's exactly what made me put effort in making this series, so
we are totally agreeing on this point.


Cheers,
Angelo

> The latter is
> a policy / design decision, not a hardware capability.
> 
> 
> ChenYu
> 
>> As for the two to co-exist, I'm not sure that this is actually needed, as the
>> OF graphs are already (at the end of the graph) pointing to the display interface.
>>
>> In any case, just as a reminder: if there will be any need to add any custom
>> MediaTek specific properties later, it's ok and we can do that at any time.
>>
>> Cheers!
>> Angelo
>>
>>> Regards,
>>> CK
>>>
>>>> +    properties:
>>>> +      endpoint@0:
>>>> +        $ref: /schemas/graph.yaml#/properties/endpoint
>>>> +        description: Output to the primary display pipeline
>>>> +
>>>> +      endpoint@1:
>>>> +        $ref: /schemas/graph.yaml#/properties/endpoint
>>>> +        description: Output to the secondary display pipeline
>>>> +
>>>> +      endpoint@2:
>>>> +        $ref: /schemas/graph.yaml#/properties/endpoint
>>>> +        description: Output to the tertiary display pipeline
>>>> +
>>>> +    anyOf:
>>>> +      - required:
>>>> +          - endpoint@0
>>>> +      - required:
>>>> +          - endpoint@1
>>>> +      - required:
>>>> +          - endpoint@2
>>>> +
>>>>    required:
>>>>      - compatible
>>>>      - reg
>>
>>

