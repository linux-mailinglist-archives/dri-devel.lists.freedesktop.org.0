Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 025466A0543
	for <lists+dri-devel@lfdr.de>; Thu, 23 Feb 2023 10:52:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E7B0A10E037;
	Thu, 23 Feb 2023 09:52:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from loongson.cn (mail.loongson.cn [114.242.206.163])
 by gabe.freedesktop.org (Postfix) with ESMTP id 0BE5F10E037
 for <dri-devel@lists.freedesktop.org>; Thu, 23 Feb 2023 09:52:07 +0000 (UTC)
Received: from loongson.cn (unknown [10.20.42.133])
 by gateway (Coremail) with SMTP id _____8AxII9EN_djmhQEAA--.2569S3;
 Thu, 23 Feb 2023 17:52:04 +0800 (CST)
Received: from [10.20.42.133] (unknown [10.20.42.133])
 by localhost.localdomain (Coremail) with SMTP id
 AQAAf8Bxb+Q_N_djApA5AA--.3797S3; 
 Thu, 23 Feb 2023 17:52:01 +0800 (CST)
Message-ID: <84796070-7740-eb69-65c0-9a3d8e464a0f@loongson.cn>
Date: Thu, 23 Feb 2023 17:51:59 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH 2/2] dt-bindings: display: Add Loongson display controller
To: Krzysztof Kozlowski <krzk@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, Rob Herring <robh+dt@kernel.org>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>
References: <20230222165514.684729-1-suijingfeng@loongson.cn>
 <20230222165514.684729-2-suijingfeng@loongson.cn>
 <76bc79c9-a892-c43e-1f49-d07b54f52c90@kernel.org>
Content-Language: en-US
From: suijingfeng <suijingfeng@loongson.cn>
In-Reply-To: <76bc79c9-a892-c43e-1f49-d07b54f52c90@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: AQAAf8Bxb+Q_N_djApA5AA--.3797S3
X-CM-SenderInfo: xvxlyxpqjiv03j6o00pqjv00gofq/
X-Coremail-Antispam: 1Uk129KBjvJXoW3WF1UJw43KrW8Cr4xZw43ZFb_yoW7Cr1rpa
 nrCFsrJF4DtF17A39Yqa48Gr45Zr95AFnrGFsxJw17K3srua4SvayfKF1DXF47JF97Zay0
 vFW0gaySgFn7A3DanT9S1TB71UUUUUJqnTZGkaVYY2UrUUUUj1kv1TuYvTs0mT0YCTnIWj
 qI5I8CrVACY4xI64kE6c02F40Ex7xfYxn0WfASr-VFAUDa7-sFnT9fnUUIcSsGvfJTRUUU
 bfkYFVCjjxCrM7AC8VAFwI0_Jr0_Gr1l1xkIjI8I6I8E6xAIw20EY4v20xvaj40_Wr0E3s
 1l1IIY67AEw4v_Jrv_JF1l8cAvFVAK0II2c7xJM28CjxkF64kEwVA0rcxSw2x7M28EF7xv
 wVC0I7IYx2IY67AKxVW8JVW5JwA2z4x0Y4vE2Ix0cI8IcVCY1x0267AKxVW8JVWxJwA2z4
 x0Y4vEx4A2jsIE14v26F4UJVW0owA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_Cr1j6rxdM2kK
 e7AKxVWUXVWUAwAS0I0E0xvYzxvE52x082IY62kv0487Mc804VCY07AIYIkI8VC2zVCFFI
 0UMc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0I7IYx2IY67AKxVWUXVWUAwAv7VC2z280
 aVAFwI0_Gr0_Cr1lOx8S6xCaFVCjc4AY6r1j6r4UM4x0Y48IcVAKI48JMxk0xIA0c2IEe2
 xFo4CEbIxvr21l42xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1l4IxYO2xF
 xVAFwI0_Jrv_JF1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s026x8GjcxK67AKxVWUGVWUWw
 C2zVAF1VAY17CE14v26r1q6r43MIIYrxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_Jr0_
 JF4lIxAIcVC0I7IYx2IY6xkF7I0E14v26r1j6r4UMIIF0xvE42xK8VAvwI8IcIk0rVWUJV
 WUCwCI42IY6I8E87Iv67AKxVW8JVWxJwCI42IY6I8E87Iv6xkF7I0E14v26r4j6r4UJbIY
 CTnIWIevJa73UjIFyTuYvjxU4s2-UUUUU
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
Cc: devicetree@vger.kernel.org, linux-mips@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On 2023/2/23 02:30, Krzysztof Kozlowski wrote:
> On 22/02/2023 17:55, suijingfeng wrote:
>> This patch add a trival DT usages for loongson display controller found
>> in LS2k1000 SoC.
> Trivial yet so many things to improve... if you only started from recent
> kernel tree (since you Cced wrong address, I doubt you did) and bindings
> you would avoid half of these comments.

Yes, you are right.

I will double check the Cced next time, I'm start from drm-tip.

but Cced using a record before.

>> Signed-off-by: suijingfeng <suijingfeng@loongson.cn>
>> ---
>>   .../loongson/loongson,display-controller.yaml | 58 +++++++++++++++++++
>>   1 file changed, 58 insertions(+)
>>   create mode 100644 Documentation/devicetree/bindings/display/loongson/loongson,display-controller.yaml
>>
>> diff --git a/Documentation/devicetree/bindings/display/loongson/loongson,display-controller.yaml b/Documentation/devicetree/bindings/display/loongson/loongson,display-controller.yaml
>> new file mode 100644
>> index 000000000000..98b78f449a80
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/display/loongson/loongson,display-controller.yaml
> Filename based on compatible, so "loongson,ls2k1000-dc.yaml"

what if we have more than one SoC,

we have  loongson,ls2k1000-dc, loongson,ls2k2000-dc and loongson,ls2k0500-dc

we will have loongson,ls2k3000-dc in the future, then how should i write 
this?

I want a single file yaml file include them all.

I'm asking because we don't know which method is good, write three piece 
of yaml or just one.

Just tell me how to write this, i will follow you instruction.

>> @@ -0,0 +1,58 @@
>> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
>> +%YAML 1.2
>> +---
>> +$id: http://devicetree.org/schemas/display/loongson/loongson,display-controller.yaml#
>>
>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>> +
>> +title: Loongson Display Controller Device Tree Bindings
> Drop "Device Tree Bindings"
OK,
>> +
>> +maintainers:
>> +  - Sui Jingfeng <suijingfeng@loongson.cn>
>> +
>> +description: |+
> Drop |+
>
>> +
> No need for blank line. Do you see it anywhere else in the bindings?
OK, acceptable.
>> +  The display controller is a PCI device, it has two display pipe.
>> +  For the DC in LS2K1000 each way has a DVO output interface which
>> +  provide RGB888 signals, vertical & horizontal synchronisations
>> +  and the pixel clock. Each CRTC is able to support 1920x1080@60Hz,
>> +  the maximum resolution is 2048x2048 according to the hardware spec.
>> +
>> +properties:
>> +  $nodename:
>> +    pattern: "^display-controller@[0-9a-f],[0-9a-f]$"
> Drop nodename.

Are you sure about this?  When i  write this property, I'm reference the 
ingenic,lcd.yaml .

ingenic,lcd.yaml has nodename too.

If I delete $nodename, then the test results say 
'^display-controller@[0-9a-f],[0-9a-f]$'  is not of type 'object'.

log is pasted at below.


make -j$(nproc) ARCH=loongarch 
CROSS_COMPILE=loongarch64-unknown-linux-gnu- dt_binding_check 
DT_SCHEMA_FILES=Documentation/devicetree/bindings/display/loongson/loongson,display-controller.yaml 
dtbs_check 
DT_SCHEMA_FILES=Documentation/devicetree/bindings/display/loongson/loongson,display-controller.yaml
   LINT    Documentation/devicetree/bindings
   DTEX 
Documentation/devicetree/bindings/display/loongson/loongson,display-controller.example.dts
   CHKDT   Documentation/devicetree/bindings/processed-schema.json
/home/suijingfeng/UpStream/drm-tip/Documentation/devicetree/bindings/display/loongson/loongson,display-controller.yaml: 
properties:pattern: '^display-controller@[0-9a-f],[0-9a-f]$' is not of 
type 'object', 'boolean'
     from schema $id: http://json-schema.org/draft-07/schema#
/home/suijingfeng/UpStream/drm-tip/Documentation/devicetree/bindings/display/loongson/loongson,display-controller.yaml: 
properties: 'pattern' should not be valid under {'$ref': 
'#/definitions/json-schema-prop-names'}
     hint: A json-schema keyword was found instead of a DT property name.
     from schema $id: http://devicetree.org/meta-schemas/keywords.yaml#
   SCHEMA  Documentation/devicetree/bindings/processed-schema.json
/home/suijingfeng/UpStream/drm-tip/Documentation/devicetree/bindings/display/loongson/loongson,display-controller.yaml: 
ignoring, error in schema: properties: pattern
   DTC_CHK 
Documentation/devicetree/bindings/display/loongson/loongson,display-controller.example.dtb

>
>> +
>> +  compatible:
>> +    oneOf:
> Drop oneOf
>
>> +      - items:
> and items...
>
>> +          - enum:
>> +              - loongson,ls2k1000-dc
>> +  reg:
>> +    maxItems: 1
>> +
>> +  interrupts:
>> +    maxItems: 1
>> +
>> +required:
>> +  - compatible
>> +  - reg
>> +  - interrupts
>> +
>> +additionalProperties: false
>> +
>> +examples:
>> +  - |
>> +    #include <dt-bindings/interrupt-controller/irq.h>
>> +    bus {
>> +
> Drop blank line.
>
>> +        #address-cells = <3>;
>> +        #size-cells = <2>;
>> +        #interrupt-cells = <2>;
> Why do you need interrupt-cells?
>
>> +
>> +        display-controller@6,0 {
>> +            compatible = "loongson,ls2k1000-dc";
>> +            reg = <0x3000 0x0 0x0 0x0 0x0>;> +            interrupts = <28 IRQ_TYPE_LEVEL_LOW>;
>> +        };
>> +    };
>> +
>> +...
> Best regards,
> Krzysztof

