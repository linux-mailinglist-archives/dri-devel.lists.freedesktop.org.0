Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E2EADBB1627
	for <lists+dri-devel@lfdr.de>; Wed, 01 Oct 2025 19:44:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 351CC10E73A;
	Wed,  1 Oct 2025 17:44:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=collabora.com header.i=ariel.dalessandro@collabora.com header.b="Zq1MQMGC";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com
 [136.143.188.112])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8CD4310E73A
 for <dri-devel@lists.freedesktop.org>; Wed,  1 Oct 2025 17:44:09 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1759340639; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=Dv6ghvPHN7AGcU7+5CH3htq5hdDmi012lRE1Inj162ECXRJK3bG7GZb2hch25vig+ys1DfSf76h7uYavSU8+G0S7pNV1/57GmOFCYV4UoLXjOrUdBf9Bcc3+DaSa0/FVyM4rE2flHWLhezO4odVFNnMgoOxGJF3aLdx4UykSz2w=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1759340639;
 h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To;
 bh=X1qxdtwKIY3V1sCLiuzk767gsjs7kipJUMmkwVcO3FY=; 
 b=M5kvq5PRgWWIKyuHZiYxwdKRTjrzhGm8MfWV+UY6CZ0LMDoAChPzow/dWnFR8wpxmqRLUqef1+LJq8Tot1uKQh4BOgu08K+nronjQEP5Y+3vy451a+ijiH9DhzVWTxWGlHIIhKsnr4mcrtZSAWNugM6fUbqr0ctWqyzbXxNx9/k=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=collabora.com;
 spf=pass  smtp.mailfrom=ariel.dalessandro@collabora.com;
 dmarc=pass header.from=<ariel.dalessandro@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1759340639; 
 s=zohomail; d=collabora.com; i=ariel.dalessandro@collabora.com;
 h=Message-ID:Date:Date:MIME-Version:Subject:Subject:To:To:Cc:Cc:References:From:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
 bh=X1qxdtwKIY3V1sCLiuzk767gsjs7kipJUMmkwVcO3FY=;
 b=Zq1MQMGCGotD+rJbqQrTxX/7xwW2aTNQNC9HTL3C/QxltTLuE2sT+80pYH/52OLd
 JqbrTO6RJaj2HBl1EanausCyXQYMtT+QAMSZj+dz+D2xbW7MsrDAqwRIgPgmsaMlI8X
 H8JNEVAWFHpRoctoROmUczLCT7TTMRhhFLbChWQg=
Received: by mx.zohomail.com with SMTPS id 1759340637638418.15942640933406;
 Wed, 1 Oct 2025 10:43:57 -0700 (PDT)
Message-ID: <4eda73fc-76cb-4ac1-8b6c-d0f1c1117905@collabora.com>
Date: Wed, 1 Oct 2025 14:43:40 -0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 09/12] dt-bindings: regulator: Convert Dialog DA9211
 Regulators to DT schema
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 airlied@gmail.com, amergnat@baylibre.com, andrew+netdev@lunn.ch,
 andrew-ct.chen@mediatek.com, broonie@kernel.org, chunkuang.hu@kernel.org,
 conor+dt@kernel.org, davem@davemloft.net, dmitry.torokhov@gmail.com,
 edumazet@google.com, flora.fu@mediatek.com, heiko@sntech.de,
 houlong.wei@mediatek.com, jeesw@melfas.com, kernel@collabora.com,
 krzk+dt@kernel.org, kuba@kernel.org, lgirdwood@gmail.com,
 linus.walleij@linaro.org, louisalexis.eyraud@collabora.com,
 luiz.dentz@gmail.com, maarten.lankhorst@linux.intel.com,
 marcel@holtmann.org, matthias.bgg@gmail.com, mchehab@kernel.org,
 minghsiu.tsai@mediatek.com, mripard@kernel.org, p.zabel@pengutronix.de,
 pabeni@redhat.com, robh@kernel.org, sean.wang@kernel.org, simona@ffwll.ch,
 support.opensource@diasemi.com, tiffany.lin@mediatek.com,
 tzimmermann@suse.de, yunfei.dong@mediatek.com
Cc: devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-arm-kernel@lists.infradead.org, linux-bluetooth@vger.kernel.org,
 linux-gpio@vger.kernel.org, linux-input@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
 linux-mediatek@lists.infradead.org, linux-rockchip@lists.infradead.org,
 linux-sound@vger.kernel.org, netdev@vger.kernel.org
References: <20250911151001.108744-1-ariel.dalessandro@collabora.com>
 <20250911151001.108744-10-ariel.dalessandro@collabora.com>
 <990cc068-adc9-473a-b4c7-9113583cb83c@collabora.com>
Content-Language: en-US
From: Ariel D'Alessandro <ariel.dalessandro@collabora.com>
In-Reply-To: <990cc068-adc9-473a-b4c7-9113583cb83c@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
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

Angelo,

On 9/12/25 5:11 AM, AngeloGioacchino Del Regno wrote:
> Il 11/09/25 17:09, Ariel D'Alessandro ha scritto:
>> Convert the existing text-based DT bindings for Dialog Semiconductor 
>> DA9211
>> Voltage Regulators family to a DT schema. Examples are simplified, as 
>> these
>> are all equal.
>>
>> Signed-off-by: Ariel D'Alessandro <ariel.dalessandro@collabora.com>
>> ---
>>   .../devicetree/bindings/regulator/da9211.txt  | 205 ------------------
>>   .../bindings/regulator/dlg,da9211.yaml        | 104 +++++++++
>>   2 files changed, 104 insertions(+), 205 deletions(-)
>>   delete mode 100644 Documentation/devicetree/bindings/regulator/ 
>> da9211.txt
>>   create mode 100644 Documentation/devicetree/bindings/regulator/ 
>> dlg,da9211.yaml
>>
> 
> ..snip..
> 
>> diff --git a/Documentation/devicetree/bindings/regulator/ 
>> dlg,da9211.yaml b/Documentation/devicetree/bindings/regulator/ 
>> dlg,da9211.yaml
>> new file mode 100644
>> index 0000000000000..9d5e25bc3872c
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/regulator/dlg,da9211.yaml
>> @@ -0,0 +1,104 @@
>> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
>> +%YAML 1.2
>> +---
>> +$id: http://devicetree.org/schemas/regulator/dlg,da9211.yaml#
>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>> +
>> +title:
>> +  Dialog Semiconductor DA9211/DA9212/DA9213/DA9223/DA9214/DA9224/ 
>> DA9215/DA9225
>> +  Voltage Regulator
> 
> Dialog Semiconductor DA9211-9215, DA9223-9225 Voltage Regulators
> 
> Better? :-)

Much better, thanks! Will fix in v3.

> 
>> +
>> +maintainers:
>> +  - Ariel D'Alessandro <ariel.dalessandro@collabora.com>
>> +
>> +properties:
>> +  compatible:
>> +    enum:
>> +      - dlg,da9211
>> +      - dlg,da9212
>> +      - dlg,da9213
>> +      - dlg,da9214
>> +      - dlg,da9215
>> +      - dlg,da9223
>> +      - dlg,da9224
>> +      - dlg,da9225
>> +
>> +  reg:
>> +    maxItems: 1
>> +
>> +  interrupts:
>> +    maxItems: 1
>> +
>> +  regulators:
>> +    type: object
>> +    additionalProperties: false
>> +    description:
>> +      List of regulators provided by the device
>> +
>> +    patternProperties:
>> +      "^BUCK([AB])$":
>> +        type: object
>> +        $ref: regulator.yaml#
>> +        unevaluatedProperties: false
>> +        description: |
> 
> Please drop the vertical bar | from all descriptions

Ack. Fixed in v3.

> 
> after which,
> 
> Reviewed-by: AngeloGioacchino Del Regno 
> <angelogioacchino.delregno@collabora.com>

Thanks a lot!

Regards,

-- 
Ariel D'Alessandro
Software Engineer

Collabora Ltd.
Platinum Building, St John's Innovation Park, Cambridge CB4 0DS, UK 
Registered in England & Wales, no. 5513718

