Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A10EA8AA98F
	for <lists+dri-devel@lfdr.de>; Fri, 19 Apr 2024 09:54:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B05EA10E1A5;
	Fri, 19 Apr 2024 07:54:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="kgGLnf3i";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madrid.collaboradmins.com (madrid.collaboradmins.com
 [46.235.227.194])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4650F10E1D8
 for <dri-devel@lists.freedesktop.org>; Fri, 19 Apr 2024 07:54:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1713513243;
 bh=XNjaagRG9HKGPXCD4NFNDozHtEtNCZhSQLrYfOGDUFo=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=kgGLnf3iWCBYa2O8IuukcmY0plEAa+VQM/fi7CeRQbQwJJ0A0jEHbuJW1Xad9+oWg
 gqNFtRBi7mX789sr1YbjJmWCiK2VXzI1sKzO5CnCSIlwPCKyFGsqIfX+tYo6vQ3xEr
 Qj+rTevV7awJ7Ixa5CVLTTmwkjWPBLylCdWwdngNMLCg8aMEeKzRHnKIfri1LqzcSD
 dCTt2cdJX3jDtdFW1YcfLkpAPaZRwjmgnNrrZeuS8/StnTUUfpVk2cST4Dg3LY5V8R
 Unfe4AwiSlaHfD4NdtkmCseGZL2TMw7k2f0Cf9YFcnDjIfbNHMuFvEVgycxDoduvmV
 aEVQs6Zu3EtKg==
Received: from [100.113.186.2] (cola.collaboradmins.com [195.201.22.229])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: kholk11)
 by madrid.collaboradmins.com (Postfix) with ESMTPSA id A8FBE3781116;
 Fri, 19 Apr 2024 07:54:02 +0000 (UTC)
Message-ID: <4ca51396-3ccd-4346-b777-9b42842cb26b@collabora.com>
Date: Fri, 19 Apr 2024 09:54:02 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/3] dt-bindings: arm: mediatek: mmsys: Add OF graph
 support for board path
To: Rob Herring <robh@kernel.org>
Cc: chunkuang.hu@kernel.org, krzysztof.kozlowski+dt@linaro.org,
 conor+dt@kernel.org, p.zabel@pengutronix.de, airlied@gmail.com,
 daniel@ffwll.ch, maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 tzimmermann@suse.de, matthias.bgg@gmail.com, shawn.sung@mediatek.com,
 yu-chang.lee@mediatek.com, ck.hu@mediatek.com, jitao.shi@mediatek.com,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, wenst@chromium.org,
 kernel@collabora.com
References: <20240409120211.321153-1-angelogioacchino.delregno@collabora.com>
 <20240409120211.321153-3-angelogioacchino.delregno@collabora.com>
 <20240410191524.GA903053-robh@kernel.org>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20240410191524.GA903053-robh@kernel.org>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Il 10/04/24 21:15, Rob Herring ha scritto:
> On Tue, Apr 09, 2024 at 02:02:10PM +0200, AngeloGioacchino Del Regno wrote:
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
>> index b3c6888c1457..4e9acd966aa5 100644
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
> 
> I'm have a hard time understanding this, but is it 3 outputs
> simultaneously or connect mmsys to 1 of 3. Generally it's multiple ports
> for the former and endpoints for the latter.
> 

Yes I feel you, MediaTek SoCs are a bit strange, but I do have a reason to
use one port and multiple endpoints, instead of multiple ports and one endpoint.

On MediaTek SoCs, there are multiple ports: those multiple ports are represented
by multiple MMSYS or multiple VDOSYS (depending on the SoC), which do then have
multiple endpoints.

However, the multiple ports, at least for now, are represented by multiple MMSYS
and/or multiple VDOSYS nodes instead of one MM/VDO node with multiple iostart for
the multiple blocks in `reg`.

The multiple iostart "thing" was the initial design by MediaTek, but there was no
way to get them really connected the right way unless adding an iostart restriction
in the driver itself (so that the mmsys driver would check an iostart to probe the
mediatek-drm components for the right IP number), so, after quite many reviews and
many series versions, they had to resort to use multiple nodes for each VDO.

I think that, after this series, we could also clean that mess up (sorry for the
strong words) and make it right - assigning the MMIO for all VDOSYS blocks to one
node, and adding the multiple ports - however, that will require a bit of work that
is simply too much for this series alone.

Summarizing, so that you don't have to carefully proof-read all this wall of text:

- MediaTek SoCs have got multiple `port` for MMSYS and VDOSYS
   - Currently the driver implementation doesn't allow that
     - MediaTek had to work around no OF graph support!
   - Multiple ports are the multiple MMSYS/VDOSYS
- One MMSYS / One VDOSYS have multiple `endpoints`

That's how the HW is.

Hope that's clear now?

Cheers,
Angelo


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
>> +    required:
>> +      - endpoint@0
>> +
>>   required:
>>     - compatible
>>     - reg
>> -- 
>> 2.44.0
>>

