Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 92761A3BE80
	for <lists+dri-devel@lfdr.de>; Wed, 19 Feb 2025 13:49:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0C1F410E312;
	Wed, 19 Feb 2025 12:49:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="HCLC3kZR";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 269FE10E312
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Feb 2025 12:49:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1739969352;
 bh=ZRkBJqfwNxsy4NNpzr6JGnP5yZqlVEWFWw7cYvuNgiw=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=HCLC3kZRyknIKRy4X4tvHCuM73kSn2JvXMr5HWCdfodgZMf5ZskztPuQhJnC/o/8l
 8y/TqOf0WiTDwN6dkwSyoNzE85TdLcn9ThMii2ol/CbLK7BdU21egioKu4yGj5UPh/
 H7y9bde6V2EDGDIAzCR3gyPCmSYGugYImPZN1knxFb0kYTS+qZkn26zRL9fUOW+dya
 7BhQwkYfgc4LRStI1jzfKwHfJhC122UFk5Pcz9B/JVTPHX2bGJwm+jGGKvaWpMJQOA
 viyqoQgJYNoH6mjFR1KuMOdlyJpB0P/S4AC4tLrpcNYEpWsG5M/zG84j9DgfZZkZG7
 ZA4sEm145csZg==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it
 [2.237.20.237])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits))
 (No client certificate requested) (Authenticated sender: kholk11)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id BD53817E14D5;
 Wed, 19 Feb 2025 13:49:11 +0100 (CET)
Message-ID: <ce224b2e-a3c2-4543-9926-c524944ef1b6@collabora.com>
Date: Wed, 19 Feb 2025 13:49:11 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 7/7] dt-bindings: display: mediatek: tdshp: Add support
 for MT8196
To: Krzysztof Kozlowski <krzk@kernel.org>, Jay Liu <jay.liu@mediatek.com>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Matthias Brugger
 <matthias.bgg@gmail.com>, Yongqiang Niu <yongqiang.niu@mediatek.com>,
 CK Hu <ck.hu@mediatek.com>, Hsin-Yi Wang <hsinyi@chromium.org>
Cc: dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com
References: <20250219092040.11227-1-jay.liu@mediatek.com>
 <20250219092040.11227-8-jay.liu@mediatek.com>
 <4d8abd3f-c39b-49ea-8a43-b6ad0cf6fb15@kernel.org>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <4d8abd3f-c39b-49ea-8a43-b6ad0cf6fb15@kernel.org>
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

Il 19/02/25 10:25, Krzysztof Kozlowski ha scritto:
> On 19/02/2025 10:20, Jay Liu wrote:
>> Add a compatible string for MediaTek MT8196 SoC
> 
> No, this is just bogus commit msg.
> 
> You did not try enough, just pasted same useless and incorrect message
> to every patch.
> 
>>
>> Signed-off-by: Jay Liu <jay.liu@mediatek.com>
>> ---
>>   .../display/mediatek/mediatek,tdshp.yaml      | 51 +++++++++++++++++++
>>   1 file changed, 51 insertions(+)
>>   create mode 100644 Documentation/devicetree/bindings/display/mediatek/mediatek,tdshp.yaml
>>
>> diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,tdshp.yaml b/Documentation/devicetree/bindings/display/mediatek/mediatek,tdshp.yaml
>> new file mode 100644
>> index 000000000000..5ed7bdd53d0e
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,tdshp.yaml
> 
> Filename matching exactly compatible.
> 
>> @@ -0,0 +1,51 @@
>> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
>> +%YAML 1.2
>> +---
>> +$id: http://devicetree.org/schemas/display/mediatek/mediatek,tdshp.yaml#
>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>> +
>> +title: MediaTek display clarity correction


Adding more comments to Krzysztof's review....

What does "TDSHP" stand for? "Display Clarity Correction" rolls up as "DCC" which
is not "TDSHP".

Please clarify the title by unrolling "TDSHP"

title: MediaTek T.. Display... S... H... P

>> +
>> +maintainers:
>> +  - Chun-Kuang Hu <chunkuang.hu@kernel.org>
>> +  - Philipp Zabel <p.zabel@pengutronix.de>
>> +
>> +description: |
> 
> Do not need '|' unless you need to preserve formatting.
> 
>> +  MediaTek display clarity correction, namely TDSHP, provides a

Again, TDSHP does not stand for "display clarity correction" - that's what it is
for, and it is ok to say what it is for, but say what TDSHP stands for.

MediaTek T... Display Sharpness? (TDSHP) provides means to adjust
the image sharpness displayed on a physical screen, therefore this
IP is meant to perform display clarity correction.

...rest of the blurb, etc.

>> +  operation used to adjust sharpness in display system.
>> +  TDSHP device node must be siblings to the central MMSYS_CONFIG node.
>> +  For a description of the MMSYS_CONFIG binding, see
>> +  Documentation/devicetree/bindings/arm/mediatek/mediatek,mmsys.yaml
>> +  for details.
> 
> Missing blank line. Do not introduce own style.
> 
>> +properties:
>> +  compatible:
>> +    oneOf:
> 
> Drop, unless this is already going to grow?
> 
> 

krzk: oh, it is, guaranteed!! but ... not exactly right now (not very soon),
so dropping the oneOf is a sane recommendation, I agree.


Cheers,
Angelo

>> +      - enum:
>> +          - mediatek,mt8196-disp-tdshp
>> +
>> +  reg:
>> +    maxItems: 1
>> +
>> +  clocks:
>> +    maxItems: 1
>> +
>> +required:
>> +  - compatible
>> +  - reg
>> +  - clocks
>> +
>> +additionalProperties: false
>> +
>> +examples:
>> +  - |
>> +
> 
> Drop
> 
> 
> Best regards,
> Krzysztof



