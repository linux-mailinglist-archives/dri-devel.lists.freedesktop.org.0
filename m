Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A1D889BCCD
	for <lists+dri-devel@lfdr.de>; Mon,  8 Apr 2024 12:16:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 843FA1123F1;
	Mon,  8 Apr 2024 10:16:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="aaY5QGWE";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madrid.collaboradmins.com (madrid.collaboradmins.com
 [46.235.227.194])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 61A1A1123F1
 for <dri-devel@lists.freedesktop.org>; Mon,  8 Apr 2024 10:16:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1712571365;
 bh=su42lLW6PD3z+UBwwbFQ0posL3pq3ei8eZhPwV7J1QU=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=aaY5QGWExwVtL7oX5bMM2dEOfNtL1HOeztXi5FJXuvvhWIuxrbzODt/767fCfgNvi
 zFUowTzx0VKnymoQvkXzj73u5/ZHw4o/2BC7HmPwmdUT3jojDy1H1vCFpTxsmGv3KI
 tqXGNeshynXl0YQS/vODDfUl5DWbZb0jAF5cJTATPg+tJOiV8rVXVnHSk5nMQUsJnf
 jNnAHdgwqkmoVMzktYrKnyEfxgO5Xjf9GQL0MdukR/htkCPqqzBsVERbgLMZNWNky6
 JCeLMA0hrNlXYb0IisVRdkZzWodc6l3iK4n+qLUxeV3mn+zWLAp63ZhnESId8gZoMb
 3B+cTnpnSZDew==
Received: from [100.113.186.2] (cola.collaboradmins.com [195.201.22.229])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: kholk11)
 by madrid.collaboradmins.com (Postfix) with ESMTPSA id 398633780627;
 Mon,  8 Apr 2024 10:16:04 +0000 (UTC)
Message-ID: <5e385c2e-6509-4347-96a5-4606b32d20ff@collabora.com>
Date: Mon, 8 Apr 2024 12:16:03 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 2/3] dt-bindings: arm: mediatek: mmsys: Add OF graph
 support for board path
To: Chen-Yu Tsai <wenst@chromium.org>
Cc: chunkuang.hu@kernel.org, robh@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
 p.zabel@pengutronix.de, airlied@gmail.com, daniel@ffwll.ch,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 matthias.bgg@gmail.com, shawn.sung@mediatek.com, yu-chang.lee@mediatek.com,
 ck.hu@mediatek.com, jitao.shi@mediatek.com, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 kernel@collabora.com
References: <20240404081635.91412-1-angelogioacchino.delregno@collabora.com>
 <20240404081635.91412-3-angelogioacchino.delregno@collabora.com>
 <CAGXv+5F9rfTVDExKSCF7fBKwR+HijNzFYE6+4aHKw3ZP81DG9w@mail.gmail.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <CAGXv+5F9rfTVDExKSCF7fBKwR+HijNzFYE6+4aHKw3ZP81DG9w@mail.gmail.com>
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

Il 08/04/24 05:20, Chen-Yu Tsai ha scritto:
> On Thu, Apr 4, 2024 at 4:16 PM AngeloGioacchino Del Regno
> <angelogioacchino.delregno@collabora.com> wrote:
>>
>> Document OF graph on MMSYS/VDOSYS: this supports up to three DDP paths
>> per HW instance (so potentially up to six displays for multi-vdo SoCs).
>>
>> The MMSYS or VDOSYS is always the first component in the DDP pipeline,
>> so it only supports an output port with multiple endpoints - where each
>> endpoint defines the starting point for one of the (currently three)
>> possible hardware paths.
>>
>> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
>> ---
>>   .../bindings/arm/mediatek/mediatek,mmsys.yaml | 23 +++++++++++++++++++
>>   1 file changed, 23 insertions(+)
>>
>> diff --git a/Documentation/devicetree/bindings/arm/mediatek/mediatek,mmsys.yaml b/Documentation/devicetree/bindings/arm/mediatek/mediatek,mmsys.yaml
>> index b3c6888c1457..90758bb5bcb1 100644
>> --- a/Documentation/devicetree/bindings/arm/mediatek/mediatek,mmsys.yaml
>> +++ b/Documentation/devicetree/bindings/arm/mediatek/mediatek,mmsys.yaml
>> @@ -93,6 +93,29 @@ properties:
>>     '#reset-cells':
>>       const: 1
>>
>> +  port:
>> +    $ref: /schemas/graph.yaml#/properties/port
>> +    description:
>> +      Output port node. This port connects the MMSYS/VDOSYS output to
>> +      the first component of one display pipeline, for example one of
>> +      the available OVL or RDMA blocks.
>> +      Some MediaTek SoCs support up to three display outputs per MMSYS.
>> +    properties:
>> +      endpoint@0:
>> +        $ref: /schemas/graph.yaml#/properties/endpoint
>> +        description: Output to the primary display pipeline
>> +
>> +      endpoint@1:
>> +        $ref: /schemas/graph.yaml#/properties/endpoint
>> +        description: Output to the secondary display pipeline
>> +
>> +      endpoint@2:
>> +        $ref: /schemas/graph.yaml#/properties/endpoint
>> +        description: Output to the tertiary display pipeline
>> +
>> +      required:
>> +        - endpoint@0
>> +
> 
> Technically the mmsys device serves as an glue layer for the display
> pipeline, providing things like clock control and signal routing; the
> device itself is not part of the pipeline, and probably shouldn't be
> part of the graph?
> 

That is (only) partially true: in the case of older SoCs, the MMSYS can only
connect to a single first IP of the pipeline, but in the case of newer ones,
and especially (but not limited to) MT8195 onwards having multiple instances
of VDOSYS, that really becomes part of the pipeline.

This is not because of the possible different first IP in the pipeline, but
because of support for dual-interface (DSI and DP) that, in even newer SoCs,
can be done with cross-mmsys (cross-vdosys, actually...) as some of those do
have the two in different VDOs.

So yes, this can be done without the graph in MMSYS *in this precise moment in
time*, but we'll anyway end up adding it sooner than later - and I'm doing this
right now, instead of later, because it's also simplifying the implementation
so like that I'm "catching two birds with one stone" :-)

Cheers,
Angelo

> ChenYu
> 
>>   required:
>>     - compatible
>>     - reg
>> --
>> 2.44.0
>>


