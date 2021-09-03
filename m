Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9255940041B
	for <lists+dri-devel@lfdr.de>; Fri,  3 Sep 2021 19:29:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E50D56E8B8;
	Fri,  3 Sep 2021 17:29:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kapsi.fi (mail.kapsi.fi [IPv6:2001:67c:1be8::25])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9E4E86E8B8
 for <dri-devel@lists.freedesktop.org>; Fri,  3 Sep 2021 17:29:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=kapsi.fi;
 s=20161220; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Pv/OTFLCcCgh6NL0IiQ8EwNC5MSYN96U9rUEB9jsZqY=; b=lwWcwqiANiS6SjADGzKtg6U3IY
 paU30S6vpMYqkoidBfkMw4YTmgP9rm+FKwywQt9CNDkK3uqnioE5m3hjiFLLOzZ7ceQ70e/3JcK4S
 fTqFHGRC8jsMLDmo93wntLUmgl6DJ/dLSrheKm3k5wLfd93GVQ1xN37v5KP/DidUX7F0ZhK/+jS8U
 ADtIfgFNpOeCLAdZAqYo9aGRNgkw9WfqJGwZchdmAIF7gfZisIDztd/xBDkZ6kd3G+k5BHtbXV47u
 wAlW1xDp8mQsM7UPyG8lCGVfshnFyDQ2Ipi3NhC/UwU74yXaJxWVrLJo86eAv2GMzjy1UOTdX8dSk
 dwIGjO6Q==;
Received: from dsl-hkibng22-54f986-236.dhcp.inet.fi ([84.249.134.236]
 helo=[192.168.1.10])
 by mail.kapsi.fi with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.89) (envelope-from <cyndis@kapsi.fi>)
 id 1mMCzs-00071A-J6; Fri, 03 Sep 2021 20:29:00 +0300
Subject: Re: [PATCH v4 1/3] dt-bindings: Add YAML bindings for NVDEC
To: Rob Herring <robh@kernel.org>, Mikko Perttunen <mperttunen@nvidia.com>
Cc: thierry.reding@gmail.com, jonathanh@nvidia.com, airlied@linux.ie,
 daniel@ffwll.ch, dri-devel@lists.freedesktop.org,
 linux-tegra@vger.kernel.org, devicetree@vger.kernel.org
References: <20210903083155.690022-1-mperttunen@nvidia.com>
 <20210903083155.690022-2-mperttunen@nvidia.com>
 <YTJOg1oHJq848ZlE@robh.at.kernel.org>
From: Mikko Perttunen <cyndis@kapsi.fi>
Message-ID: <36d5b388-0d7f-c500-89b1-c4526849fb56@kapsi.fi>
Date: Fri, 3 Sep 2021 20:28:59 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.12.0
MIME-Version: 1.0
In-Reply-To: <YTJOg1oHJq848ZlE@robh.at.kernel.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-SA-Exim-Connect-IP: 84.249.134.236
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 9/3/21 7:34 PM, Rob Herring wrote:
> On Fri, Sep 03, 2021 at 11:31:53AM +0300, Mikko Perttunen wrote:
>> Add YAML device tree bindings for NVDEC, now in a more appropriate
>> place compared to the old textual Host1x bindings.
>>
>> Signed-off-by: Mikko Perttunen <mperttunen@nvidia.com>
>> ---
>> v4:
>> * Fix incorrect compatibility string in 'if' condition
>> v3:
>> * Drop host1x bindings
>> * Change read2 to read-1 in interconnect names
>> v2:
>> * Fix issues pointed out in v1
>> * Add T194 nvidia,instance property
>> ---
>>   .../gpu/host1x/nvidia,tegra210-nvdec.yaml     | 109 ++++++++++++++++++
>>   MAINTAINERS                                   |   1 +
>>   2 files changed, 110 insertions(+)
>>   create mode 100644 Documentation/devicetree/bindings/gpu/host1x/nvidia,tegra210-nvdec.yaml
>>
>> diff --git a/Documentation/devicetree/bindings/gpu/host1x/nvidia,tegra210-nvdec.yaml b/Documentation/devicetree/bindings/gpu/host1x/nvidia,tegra210-nvdec.yaml
>> new file mode 100644
>> index 000000000000..33d01c7dc759
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/gpu/host1x/nvidia,tegra210-nvdec.yaml
>> @@ -0,0 +1,109 @@
>> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
>> +%YAML 1.2
>> +---
>> +$id: "http://devicetree.org/schemas/gpu/host1x/nvidia,tegra210-nvdec.yaml#"
>> +$schema: "http://devicetree.org/meta-schemas/core.yaml#"
>> +
>> +title: Device tree binding for NVIDIA Tegra NVDEC
>> +
>> +description: |
>> +  NVDEC is the hardware video decoder present on NVIDIA Tegra210
>> +  and newer chips. It is located on the Host1x bus and typically
>> +  programmed through Host1x channels.
>> +
>> +maintainers:
>> +  - Thierry Reding <treding@gmail.com>
>> +  - Mikko Perttunen <mperttunen@nvidia.com>
>> +
>> +properties:
>> +  $nodename:
>> +    pattern: "^nvdec@[0-9a-f]*$"
>> +
>> +  compatible:
>> +    enum:
>> +      - nvidia,tegra210-nvdec
>> +      - nvidia,tegra186-nvdec
>> +      - nvidia,tegra194-nvdec
>> +
>> +  reg:
>> +    maxItems: 1
>> +
>> +  clocks:
>> +    maxItems: 1
>> +
>> +  clock-names:
>> +    items:
>> +      - const: nvdec
>> +
>> +  resets:
>> +    maxItems: 1
>> +
>> +  reset-names:
>> +    items:
>> +      - const: nvdec
>> +
>> +  power-domains:
>> +    maxItems: 1
>> +
>> +  iommus:
>> +    maxItems: 1
>> +
>> +  interconnects:
>> +    items:
>> +      - description: DMA read memory client
>> +      - description: DMA read 2 memory client
>> +      - description: DMA write memory client
>> +
>> +  interconnect-names:
>> +    items:
>> +      - const: dma-mem
>> +      - const: read-1
>> +      - const: write
>> +
>> +required:
>> +  - compatible
>> +  - reg
>> +  - clocks
>> +  - clock-names
>> +  - resets
>> +  - reset-names
>> +  - power-domains
>> +
>> +if:
>> +  properties:
>> +    compatible:
>> +      contains:
>> +        const: nvidia,tegra194-nvdec
>> +then:
>> +  properties:
>> +    nvidia,instance:
>> +      items:
>> +        - description: 0 for NVDEC0, or 1 for NVDEC1
> 
> I still don't understand what this is needed for. What is the difference
> between the instances? There must be some reason you care. We should
> describe that difference, not some made up index.
> 
> I'm not suggesting using the base address either. That's fragile too.

This device is on the Host1x bus. On that bus, each device has an 
identifier baked into hardware called 'class' that is used when 
accessing devices through some mechanisms (host1x channels). As such, 
when probing the device we need to specify the class of the device to 
the host1x driver so it knows how to talk to it. Those class numbers are 
fixed so we have hardcoded them in the driver, but now that we have two 
NVDECs, we need to distinguish between them so that we can specify the 
correct class for each instance to the host1x driver.

> 
>> +
>> +additionalProperties: true
> 
> 'true' here is not allowed unless the schema is not complete and
> intended to be included in a complete schema or unconditionally applied
> (i.e. 'select: true'). This case is neither. As pointed out previously,
> 'unevaluatedProperties' is what you'd want here.
> 
> However, I looked into supporting defining properties in if/then/else
> schemas as you have done and I don't think we will support that soon.
> It's problematic because we can't validate the schema under the if/then
> completely. The reason is properties under if/then schemas don't have to
> be complete as we expect a top level definition that is complete (e.g.
> vendor properties must have 'description'). To solve this, we'd have to
> only apply meta-schema checks if the property doesn't appear at the top
> level. That's more complicated than I care to implement ATM.

I see two paths here: either keep 'additionalProperties: true' or remove 
it and have this binding trigger validation failures. Which one do you 
suggest or is there some third option?

Thanks,
Mikko

> 
> Rob
> 
