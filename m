Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D78DD529CD8
	for <lists+dri-devel@lfdr.de>; Tue, 17 May 2022 10:44:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B997510E777;
	Tue, 17 May 2022 08:44:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kapsi.fi (mail.kapsi.fi [IPv6:2001:67c:1be8::25])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D608110E947
 for <dri-devel@lists.freedesktop.org>; Tue, 17 May 2022 08:44:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=kapsi.fi;
 s=20161220; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
 References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=mf5hiU0Wj2EhjghVQXyv38WFdl7R2Qi21AxqkS6wRlw=; b=o5TBBdg5JNxooYZYi62HKOkKGw
 Rncp31Wt2/LDM9HH+T52+r5m07TkYs/gawTqYptdhIBeFYZ4ZWv8CFg/8WJ8Vz79wD1Ke7Ie2Ewph
 sKsE2WiSE+iU3EG208CKxg8k8+Nq29BBhaf4MutAEe/LNLyQPrOYRiluf108gB0+tIAxIpGrAVlss
 DaTQonzqYHTgpk4oD2WWfP0CbsG2aWdHv8pKJ3lJ0LCfEaWNST2KvvZesXZhOhFT3i5mPUjU15kJv
 j/1kvvn2fc/6WuzT01DBvSQMY0ZNsLp8LVp9HTvBHNhVN68U6Pt4mVJ+JrbKuOy2phsU6W2XgRmnX
 GDQWLStQ==;
Received: from 91-158-25-70.elisa-laajakaista.fi ([91.158.25.70]
 helo=[192.168.1.10])
 by mail.kapsi.fi with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.92) (envelope-from <cyndis@kapsi.fi>)
 id 1nqsPj-0002zc-B9; Tue, 17 May 2022 11:18:43 +0300
Message-ID: <c4fc1963-f4d5-8852-2119-90a631a41a0d@kapsi.fi>
Date: Tue, 17 May 2022 11:18:42 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.1
Subject: Re: [PATCH v1 01/13] dt-bindings: Add bindings for Tegra234 Host1x
 and VIC
Content-Language: en-US
To: Rob Herring <robh@kernel.org>
References: <20220516100213.1536571-1-cyndis@kapsi.fi>
 <20220516100213.1536571-2-cyndis@kapsi.fi>
 <20220516163325.GA2793304-robh@kernel.org>
From: Mikko Perttunen <cyndis@kapsi.fi>
In-Reply-To: <20220516163325.GA2793304-robh@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-SA-Exim-Connect-IP: 91.158.25.70
X-SA-Exim-Mail-From: cyndis@kapsi.fi
X-SA-Exim-Scanned: No (on mail.kapsi.fi); SAEximRunCond expanded to false
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
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, jonathanh@nvidia.com,
 thierry.reding@gmail.com, krzysztof.kozlowski+dt@linaro.org,
 linux-tegra@vger.kernel.org, digetx@gmail.com,
 Mikko Perttunen <mperttunen@nvidia.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 5/16/22 19:33, Rob Herring wrote:
> On Mon, May 16, 2022 at 01:02:01PM +0300, cyndis@kapsi.fi wrote:
>> From: Mikko Perttunen <mperttunen@nvidia.com>
>>
>> Update VIC and Host1x bindings for changes in Tegra234.
>>
>> Namely,
>> - New compatible strings
>> - Sharded syncpoint interrupts
>> - Optional reset.
>>
>> Signed-off-by: Mikko Perttunen <mperttunen@nvidia.com>
>> ---
>>   .../display/tegra/nvidia,tegra124-vic.yaml    |   1 +
>>   .../display/tegra/nvidia,tegra20-host1x.yaml  | 108 +++++++++++++++---
>>   2 files changed, 95 insertions(+), 14 deletions(-)
>>
>> diff --git a/Documentation/devicetree/bindings/display/tegra/nvidia,tegra124-vic.yaml b/Documentation/devicetree/bindings/display/tegra/nvidia,tegra124-vic.yaml
>> index 37bb5ddc1963..7200095ef19e 100644
>> --- a/Documentation/devicetree/bindings/display/tegra/nvidia,tegra124-vic.yaml
>> +++ b/Documentation/devicetree/bindings/display/tegra/nvidia,tegra124-vic.yaml
>> @@ -21,6 +21,7 @@ properties:
>>             - nvidia,tegra210-vic
>>             - nvidia,tegra186-vic
>>             - nvidia,tegra194-vic
>> +          - nvidia,tegra234-vic
>>   
>>         - items:
>>             - const: nvidia,tegra132-vic
>> diff --git a/Documentation/devicetree/bindings/display/tegra/nvidia,tegra20-host1x.yaml b/Documentation/devicetree/bindings/display/tegra/nvidia,tegra20-host1x.yaml
>> index 0adeb03b9e3a..83c58b7dae98 100644
>> --- a/Documentation/devicetree/bindings/display/tegra/nvidia,tegra20-host1x.yaml
>> +++ b/Documentation/devicetree/bindings/display/tegra/nvidia,tegra20-host1x.yaml
>> @@ -24,6 +24,7 @@ properties:
>>             - nvidia,tegra210-host1x
>>             - nvidia,tegra186-host1x
>>             - nvidia,tegra194-host1x
>> +          - nvidia,tegra234-host1x
>>   
>>         - items:
>>             - const: nvidia,tegra132-host1x
>> @@ -31,23 +32,19 @@ properties:
>>   
>>     reg:
>>       minItems: 1
>> -    maxItems: 2
>> +    maxItems: 3
>>   
>>     reg-names:
>>       minItems: 1
>> -    maxItems: 2
>> +    maxItems: 3
>>   
>>     interrupts:
>> -    items:
>> -      - description: host1x syncpoint interrupt
>> -      - description: host1x general interrupt
>>       minItems: 1
>> +    maxItems: 9
>>   
>>     interrupt-names:
>> -    items:
>> -      - const: syncpt
>> -      - const: host1x
>>       minItems: 1
>> +    maxItems: 9
>>   
>>     '#address-cells':
>>       description: The number of cells used to represent physical base addresses
>> @@ -110,13 +107,32 @@ required:
>>     - reg
>>     - clocks
>>     - clock-names
>> -  - resets
>> -  - reset-names
> 
> Shouldn't these still be required on some platforms?

Yes, I'll add them back in the tegra20..tegra210 conditional.

> 
>>   
>>   additionalProperties:
>>     type: object
>>   
>>   allOf:
>> +  - if:
>> +      properties:
>> +        compatible:
>> +          contains:
>> +            enum:
>> +              - nvidia,tegra20-host1x
>> +              - nvidia,tegra30-host1x
>> +              - nvidia,tegra114-host1x
>> +              - nvidia,tegra124-host1x
>> +              - nvidia,tegra210-host1x
>> +    then:
>> +      properties:
>> +        interrupts:
>> +          items:
>> +            - description: host1x syncpoint interrupt
>> +            - description: host1x general interrupt
>> +
>> +        interrupt-names:
>> +          items:
>> +            - const: syncpt
>> +            - const: host1x
>>     - if:
>>         properties:
>>           compatible:
>> @@ -133,10 +149,10 @@ allOf:
>>   
>>           reg:
>>             items:
>> -            - description: physical base address and length of the register
>> -                region assigned to the VM
>>               - description: physical base address and length of the register
>>                   region used by the hypervisor
>> +            - description: physical base address and length of the register
>> +                region assigned to the VM
> 
> You can't just change the order at least without a good explanation why
> in the commit message. It's an ABI.

Yeah, this doesn't change ABI, it's just a documentation bugfix, but 
indeed I should have mentioned it in the commit message. In 'reg-names' 
the order is given as 'hypervisor, vm' and the descriptions here were 
the wrong way around.

> 
>>   
>>           resets:
>>             maxItems: 1
>> @@ -144,6 +160,70 @@ allOf:
>>           reset-names:
>>             maxItems: 1
>>   
>> +        interrupts:
>> +          items:
>> +            - description: host1x syncpoint interrupt
>> +            - description: host1x general interrupt
>> +
>> +        interrupt-names:
>> +          items:
>> +            - const: syncpt
>> +            - const: host1x
>> +
>> +        iommu-map:
>> +          description: Specification of stream IDs available for memory context device
>> +            use. Should be a mapping of IDs 0..n to IOMMU entries corresponding to
>> +            usable stream IDs.
>> +
>> +      required:
>> +        - reg-names
>> +  - if:
>> +      properties:
>> +        compatible:
>> +          contains:
>> +            enum:
>> +              - nvidia,tegra234-host1x
>> +    then:
>> +      properties:
>> +        reg-names:
>> +          items:
>> +            - const: common
>> +            - const: hypervisor
>> +            - const: vm
>> +
>> +        reg:
>> +          items:
>> +            - description: physical base address and length of the register
>> +                region used by host1x server
>> +            - description: physical base address and length of the register
>> +                region used by the hypervisor
>> +            - description: physical base address and length of the register
>> +                region assigned to the VM
> 
> I guess this is just copied, but 'physical base address and length of
> the ' is redundant. That's every 'reg'.

I'll fix these up in the next revision.

Thanks,
Mikko

> 
>> +
>> +        interrupts:
>> +          items:
>> +            - description: host1x syncpoint interrupt 0
>> +            - description: host1x syncpoint interrupt 1
>> +            - description: host1x syncpoint interrupt 2
>> +            - description: host1x syncpoint interrupt 3
>> +            - description: host1x syncpoint interrupt 4
>> +            - description: host1x syncpoint interrupt 5
>> +            - description: host1x syncpoint interrupt 6
>> +            - description: host1x syncpoint interrupt 7
>> +            - description: host1x general interrupt
>> +
>> +        interrupt-names:
>> +          items:
>> +            - const: syncpt0
>> +            - const: syncpt1
>> +            - const: syncpt2
>> +            - const: syncpt3
>> +            - const: syncpt4
>> +            - const: syncpt5
>> +            - const: syncpt6
>> +            - const: syncpt7
>> +            - const: host1x
>> +
>>           iommu-map:
>>             description: Specification of stream IDs available for memory context device
>>               use. Should be a mapping of IDs 0..n to IOMMU entries corresponding to
>> @@ -160,8 +240,8 @@ examples:
>>       host1x@50000000 {
>>           compatible = "nvidia,tegra20-host1x";
>>           reg = <0x50000000 0x00024000>;
>> -        interrupts = <0 65 0x04   /* mpcore syncpt */
>> -                      0 67 0x04>; /* mpcore general */
>> +        interrupts = <0 65 0x04>, /* mpcore syncpt */
>> +                     <0 67 0x04>; /* mpcore general */
>>           interrupt-names = "syncpt", "host1x";
>>           clocks = <&tegra_car TEGRA20_CLK_HOST1X>;
>>           clock-names = "host1x";
>> -- 
>> 2.36.1
>>
>>

