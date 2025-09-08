Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 15729B49AA3
	for <lists+dri-devel@lfdr.de>; Mon,  8 Sep 2025 22:05:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 305DC10E1E9;
	Mon,  8 Sep 2025 20:05:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=collabora.com header.i=ariel.dalessandro@collabora.com header.b="hM5q/qJM";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com
 [136.143.188.112])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 719A710E1E9
 for <dri-devel@lists.freedesktop.org>; Mon,  8 Sep 2025 20:05:09 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1757361899; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=FBqZoto3NaNrr+QEk2kOlolOBw3muYFVoz92mSEsCqHEHx9bRDQVMBbpJvXLiEZn1Q7eNia7ROlo6ioobMA+XLoysc8dYZF2eB4bzoY2q4Mvdb1w+fUxt8QL5vlTMVEHXiU9sJF53nbHrsyPV3UhZpUZZNyk0Y2P5HGhidk7fn0=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1757361899;
 h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To;
 bh=8Qmtq2CeP5Jx7vZXKA2CMOipGElDjnWELU/7DNqKtTE=; 
 b=MxHttsUDp1O7iL94CxpC4azMxrqzbdHtZMwsjWmfVfDp8Kmnr2njcXzIJ9sg+185/H7MVUIhbYTGKo2AvEKkeCrHmqcY0aJmhVSm9dlrtrpjzhe6/gvFYThXkLahFKnJupZ127Pgmdll3zTjB/HE7cv6WeXprzWlrH1t6Cdaqrk=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=collabora.com;
 spf=pass  smtp.mailfrom=ariel.dalessandro@collabora.com;
 dmarc=pass header.from=<ariel.dalessandro@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1757361899; 
 s=zohomail; d=collabora.com; i=ariel.dalessandro@collabora.com;
 h=Message-ID:Date:Date:MIME-Version:Subject:Subject:To:To:Cc:Cc:References:From:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
 bh=8Qmtq2CeP5Jx7vZXKA2CMOipGElDjnWELU/7DNqKtTE=;
 b=hM5q/qJMILxUA2nOZg1Nvj3qrcEKZCqnn9aoxyH8Z6+lErg0o9Y5rGzh7VrQQh5j
 /Vq82lI51wz8mQvigoFmbhZv+IZco6nfWCamUyuuMcf08vsBx+PYt5RNWhKIKHVhwpk
 R/LDv7vzYP2AP5Oo+otV7uUA0uLne4OUJJM8R37A=
Received: by mx.zohomail.com with SMTPS id 1757361898233170.25250327031745;
 Mon, 8 Sep 2025 13:04:58 -0700 (PDT)
Message-ID: <d32af8e4-0771-4674-8317-78dd1e24c95b@collabora.com>
Date: Mon, 8 Sep 2025 17:04:41 -0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 05/14] sound: dt-bindings: Convert MediaTek RT5650
 codecs bindings to YAML
To: Rob Herring <robh@kernel.org>
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
 p.zabel@pengutronix.de, pabeni@redhat.com, sean.wang@kernel.org,
 simona@ffwll.ch, support.opensource@diasemi.com, tiffany.lin@mediatek.com,
 tzimmermann@suse.de, yunfei.dong@mediatek.com, devicetree@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org,
 linux-clk@vger.kernel.org, linux-gpio@vger.kernel.org,
 linux-input@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org, linux-mediatek@lists.infradead.org,
 linux-sound@vger.kernel.org, netdev@vger.kernel.org
References: <20250820171302.324142-1-ariel.dalessandro@collabora.com>
 <20250820171302.324142-6-ariel.dalessandro@collabora.com>
 <20250822151415.GA3819434-robh@kernel.org>
Content-Language: en-US
From: Ariel D'Alessandro <ariel.dalessandro@collabora.com>
In-Reply-To: <20250822151415.GA3819434-robh@kernel.org>
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

Rob,

On 8/22/25 12:14 PM, Rob Herring wrote:
> On Wed, Aug 20, 2025 at 02:12:53PM -0300, Ariel D'Alessandro wrote:
>> Convert the existing text-based DT bindings for Mediatek MT8173 RT5650
>> codecs to a YAML schema.
>>
>> Signed-off-by: Ariel D'Alessandro <ariel.dalessandro@collabora.com>
>> ---
>>   .../sound/mediatek,mt8173-rt5650.yaml         | 73 +++++++++++++++++++
>>   .../bindings/sound/mt8173-rt5650.txt          | 31 --------
>>   2 files changed, 73 insertions(+), 31 deletions(-)
>>   create mode 100644 Documentation/devicetree/bindings/sound/mediatek,mt8173-rt5650.yaml
>>   delete mode 100644 Documentation/devicetree/bindings/sound/mt8173-rt5650.txt
>>
>> diff --git a/Documentation/devicetree/bindings/sound/mediatek,mt8173-rt5650.yaml b/Documentation/devicetree/bindings/sound/mediatek,mt8173-rt5650.yaml
>> new file mode 100644
>> index 0000000000000..36e4f9c4c3d62
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/sound/mediatek,mt8173-rt5650.yaml
>> @@ -0,0 +1,73 @@
>> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
>> +%YAML 1.2
>> +---
>> +$id: http://devicetree.org/schemas/sound/mediatek,mt8173-rt5650.yaml#
>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>> +
>> +title: Mediatek MT8173 with RT5650 codecs and HDMI via I2S
>> +
>> +maintainers:
>> +  - Ariel D'Alessandro <ariel.dalessandro@collabora.com>
>> +
>> +properties:
>> +  compatible:
>> +    const: "mediatek,mt8173-rt5650"
> 
> Drop quotes.

Ack.

> 
>> +
>> +  reg:
>> +    maxItems: 1
>> +
>> +  interrupts:
>> +    maxItems: 1
>> +
>> +  mediatek,audio-codec:
>> +    $ref: /schemas/types.yaml#/definitions/phandle-array
>> +    description:
>> +      The phandles of rt5650 codecs and of the HDMI encoder node.
>> +    minItems: 2
>> +
>> +  mediatek,platform:
>> +    $ref: /schemas/types.yaml#/definitions/phandle
>> +    description:
>> +      The phandle of MT8173 ASoC platform.
>> +
>> +  mediatek,mclk:
>> +    $ref: /schemas/types.yaml#/definitions/uint32
>> +    description: |
>> +      The MCLK source.
>> +      0: external oscillator, MCLK = 12.288M
>> +      1: internal source from mt8173, MCLK = sampling rate * 256
>> +
>> +  codec-capture:
>> +    description: Subnode of rt5650 codec capture.
>> +    type: object
>> +
>> +    properties:
>> +      sound-dai:
>> +        maxItems: 1
>> +        description: phandle of the CPU DAI
>> +
>> +    additionalProperties: false
>> +
>> +required:
>> +  - compatible
>> +  - mediatek,audio-codec
>> +  - mediatek,platform
>> +
>> +additionalProperties: false
>> +
>> +examples:
>> +  - |
>> +    sound: sound {
> 
> Drop unused label.

Ack.

Thanks!

-- 
Ariel D'Alessandro
Software Engineer

Collabora Ltd.
Platinum Building, St John's Innovation Park, Cambridge CB4 0DS, UK 
Registered in England & Wales, no. 5513718

