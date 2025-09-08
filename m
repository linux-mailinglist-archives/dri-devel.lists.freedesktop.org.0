Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 754BCB49867
	for <lists+dri-devel@lfdr.de>; Mon,  8 Sep 2025 20:36:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1BF6210E5A9;
	Mon,  8 Sep 2025 18:36:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=collabora.com header.i=ariel.dalessandro@collabora.com header.b="UhaQwwTj";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com
 [136.143.188.112])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E310C10E5A9
 for <dri-devel@lists.freedesktop.org>; Mon,  8 Sep 2025 18:36:30 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1757356580; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=cdVYgURB89dbHupAw4KMy46mfFbhabKB0fbmHFBgRBvBYvTtSQExrU1sKpfkpjcx1w/YUJ8oV4j9+YhGcpEjW7Zwj1jsW1OKgfubHjb4G2koqFAxMLoVYAz8Ccw0+lylg0YO1Htsg+KdPOqoubvi0rri2cAvyirq77JW+Ay5MYc=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1757356580;
 h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To;
 bh=mqorkaZP8K3w37+KQC5xsu9iciTdS53JJYYC8j1jjZY=; 
 b=lw0+9hG76wtgGAX2WMoklsJubSvxRXKF08iwS28xRKhrNx1q6Cy5o04wQBEzwFoYCfg3NXiHFcSLuWgyv23G8QKMtYdPesUVladZMLFYZLSp6+nayixftZ6vLJb3H28vG8XCLQdinZhZxABbk/hAEKpPDM5kWMqp0o6B9ah+w94=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=collabora.com;
 spf=pass  smtp.mailfrom=ariel.dalessandro@collabora.com;
 dmarc=pass header.from=<ariel.dalessandro@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1757356580; 
 s=zohomail; d=collabora.com; i=ariel.dalessandro@collabora.com;
 h=Message-ID:Date:Date:MIME-Version:Subject:Subject:To:To:Cc:Cc:References:From:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
 bh=mqorkaZP8K3w37+KQC5xsu9iciTdS53JJYYC8j1jjZY=;
 b=UhaQwwTja7SFF9hVLfmnIc1Nk3Ao2vojsdkFkQ1NSXggwHTHU8YksUOjnlk+k/dQ
 Zo810evf7Bf1W1IQVDWhYK4GEiE3z9tw0FTs6kDO5JCJJ8/no4Jni8fjICCwkBC3Oo8
 n7wmxd995Nc2uwbGBP5jZdIa+Dk2ftPoB1SA5g1U=
Received: by mx.zohomail.com with SMTPS id 1757356577657388.2831972624366;
 Mon, 8 Sep 2025 11:36:17 -0700 (PDT)
Message-ID: <79baaa0a-7cc4-44f0-bf71-38aff550b177@collabora.com>
Date: Mon, 8 Sep 2025 15:35:58 -0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 02/14] media: dt-bindings: Convert MediaTek mt8173-vpu
 bindings to YAML
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: airlied@gmail.com, amergnat@baylibre.com, andrew+netdev@lunn.ch,
 andrew-ct.chen@mediatek.com, angelogioacchino.delregno@collabora.com,
 broonie@kernel.org, chunkuang.hu@kernel.org, ck.hu@mediatek.com,
 conor+dt@kernel.org, davem@davemloft.net, dmitry.torokhov@gmail.com,
 edumazet@google.com, flora.fu@mediatek.com, houlong.wei@mediatek.com,
 jeesw@melfas.com, jmassot@collabora.com, kernel@collabora.com,
 krzk+dt@kernel.org, kuba@kernel.org,
 kyrie.wu@mediatek.corp-partner.google.com, lgirdwood@gmail.com,
 linus.walleij@linaro.org, louisalexis.eyraud@collabora.com,
 maarten.lankhorst@linux.intel.com, matthias.bgg@gmail.com,
 mchehab@kernel.org, minghsiu.tsai@mediatek.com, mripard@kernel.org,
 p.zabel@pengutronix.de, pabeni@redhat.com, robh@kernel.org,
 sean.wang@kernel.org, simona@ffwll.ch, support.opensource@diasemi.com,
 tiffany.lin@mediatek.com, tzimmermann@suse.de, yunfei.dong@mediatek.com,
 devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org,
 linux-gpio@vger.kernel.org, linux-input@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
 linux-mediatek@lists.infradead.org, linux-sound@vger.kernel.org,
 netdev@vger.kernel.org
References: <20250820171302.324142-1-ariel.dalessandro@collabora.com>
 <20250820171302.324142-3-ariel.dalessandro@collabora.com>
 <20250821-piquant-rapid-bear-8cedc0@kuoka>
Content-Language: en-US
From: Ariel D'Alessandro <ariel.dalessandro@collabora.com>
In-Reply-To: <20250821-piquant-rapid-bear-8cedc0@kuoka>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ZohoMailClient: External
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

Krzysztof,

On 8/21/25 3:47 AM, Krzysztof Kozlowski wrote:
> On Wed, Aug 20, 2025 at 02:12:50PM -0300, Ariel D'Alessandro wrote:
>> Convert the existing text-based DT bindings for Mediatek MT8173 Video Processor
>> Unit to a YAML schema.
> 
> DT schema, not YAML. Don't say YAML at all, neither here nor in subject.

Ack.

> 
> Also looks not wrapped...

Ack.

> 
>>
>> Signed-off-by: Ariel D'Alessandro <ariel.dalessandro@collabora.com>
>> ---
>>   .../bindings/media/mediatek,mt8173-vpu.yaml   | 76 +++++++++++++++++++
>>   .../bindings/media/mediatek-vpu.txt           | 31 --------
>>   2 files changed, 76 insertions(+), 31 deletions(-)
>>   create mode 100644 Documentation/devicetree/bindings/media/mediatek,mt8173-vpu.yaml
>>   delete mode 100644 Documentation/devicetree/bindings/media/mediatek-vpu.txt
>>
>> diff --git a/Documentation/devicetree/bindings/media/mediatek,mt8173-vpu.yaml b/Documentation/devicetree/bindings/media/mediatek,mt8173-vpu.yaml
>> new file mode 100644
>> index 0000000000000..44f5d7cc44042
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/media/mediatek,mt8173-vpu.yaml
>> @@ -0,0 +1,76 @@
>> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
>> +%YAML 1.2
>> +---
>> +$id: http://devicetree.org/schemas/media/mediatek,mt8173-vpu.yaml#
>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>> +
>> +title: Mediatek MT8173 Video Processor Unit
>> +
>> +maintainers:
>> +  - Ariel D'Alessandro <ariel.dalessandro@collabora.com>
>> +
>> +description:
>> +  Video Processor Unit is a HW video controller. It controls HW Codec including
>> +  H.264/VP8/VP9 Decode, H.264/VP8 Encode and Image Processor (scale/rotate/color convert).
> 
> Please wrap code according to the preferred limit expressed in Kernel
> coding style (checkpatch is not a coding style description, but only a
> tool).  However don't wrap blindly (see Kernel coding style).

Thanks for the comment. Wrapped to 80 column width.

> 
>> +
>> +properties:
>> +  compatible:
>> +    const: mediatek,mt8173-vpu
>> +
>> +  reg:
>> +    minItems: 2
> 
> No, from where do you get such syntax?

IIUC, what you mean is s/minItems/maxItems.

> 
>> +
>> +  reg-names:
>> +    items:
>> +      - const: tcm
>> +      - const: cfg_reg
>> +
>> +  interrupts:
>> +    maxItems: 1
>> +
>> +  clocks:
>> +    maxItems: 1
>> +
>> +  clock-names:
>> +    items:
>> +      - const: main
>> +
>> +  memory-region:
>> +    description:
>> +      phandle to a node describing reserved memory used by VPU
>> +      (see bindings/reserved-memory/reserved-memory.txt)
> 
> Drop, redundant description.

Ack.

Thanks a lot!

-- 
Ariel D'Alessandro
Software Engineer

Collabora Ltd.
Platinum Building, St John's Innovation Park, Cambridge CB4 0DS, UK 
Registered in England & Wales, no. 5513718

