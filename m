Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 23D7719E503
	for <lists+dri-devel@lfdr.de>; Sat,  4 Apr 2020 14:46:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 89DAC6E1E8;
	Sat,  4 Apr 2020 12:45:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail26.static.mailgun.info (mail26.static.mailgun.info
 [104.130.122.26])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 947006EB68
 for <dri-devel@lists.freedesktop.org>; Fri,  3 Apr 2020 11:15:53 +0000 (UTC)
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1585912553; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=mSmG7afz/Gw/5tgEIkf0PoeOsMIBUFVaXaoVhWb0fb4=;
 b=ErHeWcvxWlItKop4Qbhz6f14Q/0gOtn8g1cXiyoBFqwj7qKU1Il0vp18XXURfLXXinwIo2gF
 a7ZY8L5e4dqTkTwZeU99KmwjQBzrQHWU6UISndqb9smZyaxscGc56BG1VWQHDdKpJBHtN/7V
 NhN8vm5yEq+5DTMNq/iQ+tkZ4Ko=
X-Mailgun-Sending-Ip: 104.130.122.26
X-Mailgun-Sid: WyJkOTU5ZSIsICJkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnIiwgImJlOWU0YSJd
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171])
 by mxa.mailgun.org with ESMTP id 5e871ae8.7feb33db61b8-smtp-out-n02;
 Fri, 03 Apr 2020 11:15:52 -0000 (UTC)
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id 372EFC4478F; Fri,  3 Apr 2020 11:15:51 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
 aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED
 autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
 (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested) (Authenticated sender: kgunda)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 9CE69C433F2;
 Fri,  3 Apr 2020 11:15:49 +0000 (UTC)
MIME-Version: 1.0
Date: Fri, 03 Apr 2020 16:45:49 +0530
From: kgunda@codeaurora.org
To: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH V4 1/4] backlight: qcom-wled: convert the wled bindings to
 .yaml format
In-Reply-To: <20200331175401.GA9791@bogus>
References: <1584985618-25689-1-git-send-email-kgunda@codeaurora.org>
 <1584985618-25689-2-git-send-email-kgunda@codeaurora.org>
 <20200331175401.GA9791@bogus>
Message-ID: <ac8f25113a3bb233c11fd7cd9e62c2cf@codeaurora.org>
X-Sender: kgunda@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
X-Mailman-Approved-At: Sat, 04 Apr 2020 12:45:43 +0000
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
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org,
 daniel.thompson@linaro.org, b.zolnierkie@samsung.com, jingoohan1@gmail.com,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 bjorn.andersson@linaro.org, jacek.anaszewski@gmail.com, pavel@ucw.cz,
 linux-arm-msm@vger.kernel.org,
 Subbaraman Narayanamurthy <subbaram@codeaurora.org>, lee.jones@linaro.org,
 linux-leds@vger.kernel.org, Dan Murphy <dmurphy@ti.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 2020-03-31 23:24, Rob Herring wrote:
> On Mon, Mar 23, 2020 at 11:16:55PM +0530, Kiran Gunda wrote:
>> Convert the qcom-wled bindings from .txt to .yaml format.
>> 
>> Signed-off-by: Kiran Gunda <kgunda@codeaurora.org>
>> Signed-off-by: Subbaraman Narayanamurthy <subbaram@codeaurora.org>
>> Acked-by: Daniel Thompson <daniel.thompson@linaro.org>
>> ---
>>  .../bindings/leds/backlight/qcom-wled.txt          | 154 
>> -----------------
>>  .../bindings/leds/backlight/qcom-wled.yaml         | 184 
>> +++++++++++++++++++++
>>  2 files changed, 184 insertions(+), 154 deletions(-)
>>  delete mode 100644 
>> Documentation/devicetree/bindings/leds/backlight/qcom-wled.txt
>>  create mode 100644 
>> Documentation/devicetree/bindings/leds/backlight/qcom-wled.yaml
> 
>> diff --git 
>> a/Documentation/devicetree/bindings/leds/backlight/qcom-wled.yaml 
>> b/Documentation/devicetree/bindings/leds/backlight/qcom-wled.yaml
>> new file mode 100644
>> index 0000000..8a388bf
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/leds/backlight/qcom-wled.yaml
>> @@ -0,0 +1,184 @@
>> +# SPDX-License-Identifier: GPL-2.0-only
>> +%YAML 1.2
>> +---
>> +$id: http://devicetree.org/schemas/leds/backlight/qcom-wled.yaml#
>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>> +
>> +title: Binding for Qualcomm Technologies, Inc. WLED driver
>> +
>> +maintainers:
>> +  - Lee Jones <lee.jones@linaro.org>
> 
> Should be the h/w owner (you), not who applies patches.
> 
will address in next post.
>> +
>> +description: |
>> +  WLED (White Light Emitting Diode) driver is used for controlling 
>> display
>> +  backlight that is part of PMIC on Qualcomm Technologies, Inc. 
>> reference
>> +  platforms. The PMIC is connected to the host processor via SPMI 
>> bus.
>> +
>> +properties:
>> +  compatible :
> 
> Drop the space ^
> 
will address in next post.
>> +    enum:
>> +       - qcom,pm8941-wled
>> +       - qcom,pmi8998-wled
>> +       - qcom,pm660l-wled
> 
> Wrong indent (1 space too many).
> 
will address in next post.
>> +
>> +  reg:
>> +    maxItems: 1
>> +
>> +  default-brightness:
>> +    maxItems: 1
> 
> maxItems is for arrays and this is a single scalar.
> 
>> +    description:
>> +      brightness value on boot, value from 0-4095.
> 
> 0-4095 sounds like a constraint.
> 
will address in next post.
>> +    allOf:
>> +      - $ref: /schemas/types.yaml#/definitions/uint32
> 
> There should be a common definition for this.
> 
will address in next post.
>> +        default: 2048
>> +
>> +  label:
>> +    maxItems: 1
>> +    description:
>> +      The name of the backlight device.
>> +    allOf:
>> +      - $ref: /schemas/types.yaml#/definitions/string
> 
> Already has a type. Just 'label: true' is enough.
> 
will address in next post.
>> +
>> +  qcom,cs-out:
>> +    description:
>> +      enable current sink output.
>> +      This property is supported only for PM8941.
>> +    type: boolean
>> +
>> +  qcom,cabc:
>> +    description:
>> +      enable content adaptive backlight control.
>> +    type: boolean
>> +
>> +  qcom,ext-gen:
>> +    description:
>> +      use externally generated modulator signal to dim.
>> +      This property is supported only for PM8941.
>> +    type: boolean
>> +
>> +  qcom,current-limit:
>> +    maxItems: 1
> 
> Not an array.
> 
will address in next post.
>> +    allOf:
>> +      - $ref: /schemas/types.yaml#/definitions/uint32
>> +    description:
>> +      mA; per-string current limit; value from 0 to 25 with
> 
> 25 sounds like a constraint.
> 
will address in next post.
>> +      1 mA step. This property is supported only for pm8941.
>> +    default: 20
>> +
>> +  qcom,current-limit-microamp:
>> +    maxItems: 1
>> +    allOf:
>> +      - $ref: /schemas/types.yaml#/definitions/uint32
> 
> properties with unit suffix already have a type.
> 
will address in next post.
>> +    description:
>> +      uA; per-string current limit; value from 0 to 30000 with
>> +      2500 uA step.
> 
> steps can be expressed using 'multipleOf'
> 
will address in next post.
>> +    default: 25
> 
> 25 can never be a multiple of 2500
> 
will correct in next post.
>> +
>> +  qcom,current-boost-limit:
>> +    maxItems: 1
>> +    allOf:
>> +      - $ref: /schemas/types.yaml#/definitions/uint32
>> +    description:
>> +      mA; boost current limit.
>> +      For pm8941 one of 105, 385, 525, 805, 980, 1260, 1400, 1680.
>> +      Default, 805 mA.
>> +      For pmi8998 one of 105, 280, 450, 620, 970, 1150, 1300,
>> +      1500. Default 970 mA.
> 
> Constraints.
> 
will address in next post.
>> +
>> +  qcom,switching-freq:
>> +    maxItems: 1
>> +    allOf:
>> +      - $ref: /schemas/types.yaml#/definitions/uint32
>> +    description:
>> +      kHz; switching frequency; one of 600, 640, 685, 738,
>> +      800, 872, 960, 1066, 1200, 1371, 1600, 1920, 2400, 3200,
>> +      4800, 9600.
>> +      Default for pm8941 1600 kHz
>> +               for pmi8998 800 kHz
> 
> Constraints!
> 
will address in next post.
>> +
>> +  qcom,ovp:
>> +    maxItems: 1
>> +    allOf:
>> +      - $ref: /schemas/types.yaml#/definitions/uint32
>> +    description:
>> +      V; Over-voltage protection limit; one of 27, 29, 32, 35. 
>> Default 29V
>> +      This property is supported only for PM8941.
>> +
>> +  qcom,ovp-millivolt:
>> +    maxItems: 1
>> +    allOf:
>> +      - $ref: /schemas/types.yaml#/definitions/uint32
>> +    description:
>> +      mV; Over-voltage protection limit;
>> +      For pmi8998 one of 18100, 19600, 29600, 31100.
>> +      Default 29600 mV.
>> +      If this property is not specified for PM8941, it
>> +      falls back to "qcom,ovp" property.
>> +
>> +  qcom,num-strings:
>> +    maxItems: 1
>> +    allOf:
>> +      - $ref: /schemas/types.yaml#/definitions/uint32
>> +    description:
>> +      number of led strings attached;
>> +      value for PM8941 from 1 to 3. Default 2
>> +      For PMI8998 from 1 to 4.
>> +
>> +  interrupts:
>> +    maxItems: 2
> 
> items:
>   - description: ...
>   - description: ...
> 
will address in next post.
>> +    description:
>> +      Interrupts associated with WLED. This should be
>> +      "short" and "ovp" interrupts. Interrupts can be
>> +      specified as per the encoding listed under
>> +      Documentation/devicetree/bindings/spmi/
>> +      qcom,spmi-pmic-arb.txt.
> 
> encoding is outside the scope of the binding.
> 
will address in next post.
>> +
>> +  interrupt-names:
>> +    description:
>> +      Interrupt names associated with the interrupts.
>> +      Must be "short" and "ovp". The short circuit detection
>> +      is not supported for PM8941.
> 
> Names should be constraints.
> 
will address in next post.
>> +
>> +  qcom,enabled-strings:
>> +    maxItems: 1
>> +    allOf:
>> +      - $ref: /schemas/types.yaml#/definitions/uint32-array
>> +    description:
>> +      Array of the WLED strings numbered from 0 to 3. Each
>> +      string of leds are operated individually. Specify the
>> +      list of strings used by the device. Any combination of
>> +      led strings can be used.
>> +
>> +  qcom,external-pfet:
>> +    description:
>> +      Specify if external PFET control for short circuit
>> +      protection is used. This property is supported only
>> +      for PMI8998.
>> +    type: boolean
>> +
>> +  qcom,auto-string-detection:
>> +    description:
>> +      Enables auto-detection of the WLED string configuration.
>> +      This feature is not supported for PM8941.
>> +    type: boolean
>> +
>> +required:
>> +  - compatible
>> +  - reg
>> +  - label
>> +
>> +examples:
>> +  - |
>> +    pm8941-wled@d800 {
> 
> backlight@...
> 
will add in next post.
>> +        compatible = "qcom,pm8941-wled";
>> +        reg = <0xd800 0x100>;
>> +        label = "backlight";
>> +
>> +        qcom,cs-out;
>> +        qcom,current-limit = <20>;
>> +        qcom,current-boost-limit = <805>;
>> +        qcom,switching-freq = <1600>;
>> +        qcom,ovp = <29>;
>> +        qcom,num-strings = <2>;
>> +        qcom,enabled-strings = <0 1>;
>> +     };
>> --
>> The Qualcomm Innovation Center, Inc. is a member of the Code Aurora 
>> Forum,
>>  a Linux Foundation Collaborative Project
>> 
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
