Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CF3A73EFF19
	for <lists+dri-devel@lfdr.de>; Wed, 18 Aug 2021 10:24:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 846BA6E4AD;
	Wed, 18 Aug 2021 08:24:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kapsi.fi (mail.kapsi.fi [IPv6:2001:67c:1be8::25])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 978746E4AD
 for <dri-devel@lists.freedesktop.org>; Wed, 18 Aug 2021 08:24:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=kapsi.fi;
 s=20161220; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=TSnCTxSRjTwtgHcmESr4fWXccCLIJFCo0VVdeqHZ2L8=; b=jD5tzdmtd5oxN24uPULbq2bb6q
 9xWzMjs7gpHr9VBVg+Cu6tuTZI30d0Kzc/Sk1dPF/Wz64qtqZimvmAPB9lincZx1AgUXY2SB+MQ2M
 fRwSwsYWtqAxLaJbzPMXuJTiE6Z3WcDWo174VJGATmFMF1yx5sRhzpnbAo1hHWQ3RioGA1wPgCuau
 huLVDQM8qWvd71JCO6Zn5g/M3d+hsr6Mf9Mi6txA9Q4naTtoHtuPEz5YeEaHe/ix8RZxQoyZxdOhl
 IZJ23DeGBlDp83ddulJuHiosFXYPiCtH8B3NJ+5ACyPL8akoPa7st8T5jpmZR5F8Vq1GqcE9hVKjN
 HGodTYfA==;
Received: from dsl-hkibng22-54f986-236.dhcp.inet.fi ([84.249.134.236]
 helo=[192.168.1.10])
 by mail.kapsi.fi with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.89) (envelope-from <cyndis@kapsi.fi>)
 id 1mGGs9-0006a5-9t; Wed, 18 Aug 2021 11:24:29 +0300
Subject: Re: [PATCH v3 1/3] dt-bindings: Add YAML bindings for NVDEC
To: Rob Herring <robh@kernel.org>, Mikko Perttunen <mperttunen@nvidia.com>
Cc: thierry.reding@gmail.com, jonathanh@nvidia.com, airlied@linux.ie,
 daniel@ffwll.ch, dri-devel@lists.freedesktop.org,
 linux-tegra@vger.kernel.org, devicetree@vger.kernel.org
References: <20210811105030.3458521-1-mperttunen@nvidia.com>
 <20210811105030.3458521-2-mperttunen@nvidia.com>
 <YRwoKW4nOc52MAQV@robh.at.kernel.org>
From: Mikko Perttunen <cyndis@kapsi.fi>
Message-ID: <1dfd5173-5654-9df8-1e8e-d0e365ed914d@kapsi.fi>
Date: Wed, 18 Aug 2021 11:24:28 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <YRwoKW4nOc52MAQV@robh.at.kernel.org>
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

On 8/18/21 12:20 AM, Rob Herring wrote:
> On Wed, Aug 11, 2021 at 01:50:28PM +0300, Mikko Perttunen wrote:
>> Add YAML device tree bindings for NVDEC, now in a more appropriate
>> place compared to the old textual Host1x bindings.
>>
>> Signed-off-by: Mikko Perttunen <mperttunen@nvidia.com>
>> ---
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
>> index 000000000000..571849625da8
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
>> +        const: nvidia,tegra194-host1x
> 
> host1x? This will never be true as the schema is only applied to nodes
> with the nvdec compatible.

Argh, it's a typo indeed. Should be nvidia,tegra194-nvdec.

> 
>> +then:
>> +  properties:
>> +    nvidia,instance:
>> +      items:
>> +        - description: 0 for NVDEC0, or 1 for NVDEC1
> 
> What's this for? We generally don't do indices in DT.

When programming the hardware through Host1x, we need to know the "class 
ID" of the hardware, specific to each instance. So we need to know which 
instance it is. Technically of course we could derive this from the MMIO 
address but that seems more confusing.

> 
>> +
>> +additionalProperties: true
> 
> This should be false or 'unevaluatedProperties: false'

I tried that but it resulted in validation failures; please see the 
discussion in v2.

Thanks,
Mikko

> 
> Rob
> 
