Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DBC079D8805
	for <lists+dri-devel@lfdr.de>; Mon, 25 Nov 2024 15:31:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EEAA110E3D0;
	Mon, 25 Nov 2024 14:30:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="PMpbqfx7";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8D02910E670
 for <dri-devel@lists.freedesktop.org>; Mon, 25 Nov 2024 14:30:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1732545056;
 bh=Vaw2d8oop474FmniEdU/1m+YsHpuOS3//yAHGO+vuQ8=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=PMpbqfx7tRj7ftNgiqW0roZHr6aM75u0vJgPaWI4eAQm+TswqxOWEGpqQzXO+IusU
 Wl51arWjGPupxQbWCLQBvgS4nrTD1+FkPUHF2aS9BAJCl19U7Z9T8Xbn7CrCOCOmNK
 Phgad/kADKL6xiTrCcamUL07P6uWWgf6RegQlgN/6CXGrmrb1pycHM84zriNYf//HX
 2jdFu+RC9G5+JYdmdfAXnVNBm62kr9NYx4ErvrfTaly/MbG0JJvEq75gDGnTfL64Ad
 WAS/Aoq8zWyOc4lBQaBnoHsoEiJYwK4SAd+LPNHIgmOWGCVZ96ABZ5JxeEsTUsgRWo
 /z6N6oIY4WwiQ==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it
 [2.237.20.237])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: kholk11)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id 579FF17E36AD;
 Mon, 25 Nov 2024 15:30:55 +0100 (CET)
Message-ID: <f65f0a22-1214-4fad-960c-24a75b81a22b@collabora.com>
Date: Mon, 25 Nov 2024 15:30:54 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 1/7] dt-bindings: display: mediatek: Add binding for
 HDMIv2 DDC
To: Rob Herring <robh@kernel.org>
Cc: chunkuang.hu@kernel.org, p.zabel@pengutronix.de, airlied@gmail.com,
 simona@ffwll.ch, maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 tzimmermann@suse.de, krzk+dt@kernel.org, conor+dt@kernel.org,
 matthias.bgg@gmail.com, ck.hu@mediatek.com, dri-devel@lists.freedesktop.org,
 linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 kernel@collabora.com
References: <20241120124512.134278-1-angelogioacchino.delregno@collabora.com>
 <20241120124512.134278-2-angelogioacchino.delregno@collabora.com>
 <20241121210235.GA3798341-robh@kernel.org>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20241121210235.GA3798341-robh@kernel.org>
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

Il 21/11/24 22:02, Rob Herring ha scritto:
> On Wed, Nov 20, 2024 at 01:45:06PM +0100, AngeloGioacchino Del Regno wrote:
>> Add a binding for the Display Data Channel (DDC) IP in MediaTek
>> SoCs with version 2 HDMI TX IP.
>>
>> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
>> ---
>>   .../mediatek/mediatek,mt8195-hdmi-ddc.yaml    | 41 +++++++++++++++++++
>>   1 file changed, 41 insertions(+)
>>   create mode 100644 Documentation/devicetree/bindings/display/mediatek/mediatek,mt8195-hdmi-ddc.yaml
>>
>> diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,mt8195-hdmi-ddc.yaml b/Documentation/devicetree/bindings/display/mediatek/mediatek,mt8195-hdmi-ddc.yaml
>> new file mode 100644
>> index 000000000000..d85e8ed2ffa7
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,mt8195-hdmi-ddc.yaml
>> @@ -0,0 +1,41 @@
>> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
>> +%YAML 1.2
>> +---
>> +$id: http://devicetree.org/schemas/display/mediatek/mediatek,mt8195-hdmi-ddc.yaml#
>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>> +
>> +title: MediaTek HDMI Display Data Channel (DDC) v2
>> +
>> +maintainers:
>> +  - AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
>> +  - CK Hu <ck.hu@mediatek.com>
>> +
>> +properties:
>> +  compatible:
>> +    oneOf:
>> +      - const: mediatek,mt8195-hdmi-ddc
>> +      - items:
>> +          - const: mediatek,mt8188-hdmi-ddc
>> +          - const: mediatek,mt8195-hdmi-ddc
>> +
>> +  clocks:
>> +    maxItems: 1
>> +
>> +  power-domains:
>> +    maxItems: 1
>> +
>> +required:
>> +  - compatible
>> +  - clocks
>> +
>> +additionalProperties: false
>> +
>> +examples:
>> +  - |
>> +    hdmi {
>> +        hdmi_ddc: i2c {
>> +            compatible = "mediatek,mt8195-hdmi-ddc";
>> +            clocks = <&clk26m>;
> 
> Is this really a separate block? Doesn't really look like it. You don't
> even have registers to interact with it.
> 

MTK DDCv2, subnode of HDMI, uses registers from the iospace of its parent, so,
from the HDMI controller.

That one is a separate block, it's just that some of its registers are mixed inside
of the register space of the HDMI controller itself... MediaTek likes to do that a
lot... in this case, that is because of some hotplug detection bits (and some MCU
related ones too) being shared between the DDC controller and the HDMI one, but
then - apart from that - the DDC controller is the DDC controller and the HDMI one
is... the HDMI one. :-)

Cheers,
Angelo

>> +        };
>> +    };
>> +...
>> -- 
>> 2.47.0
>>


