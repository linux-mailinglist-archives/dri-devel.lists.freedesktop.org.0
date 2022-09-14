Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8157D5B8814
	for <lists+dri-devel@lfdr.de>; Wed, 14 Sep 2022 14:19:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3ED1410E040;
	Wed, 14 Sep 2022 12:19:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kapsi.fi (mail.kapsi.fi [IPv6:2001:67c:1be8::25])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EC68610E040
 for <dri-devel@lists.freedesktop.org>; Wed, 14 Sep 2022 12:19:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=kapsi.fi;
 s=20161220; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
 References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=xEmQH4SIObJfyxK0zAEzEJdzflGqo6hRb+i9V0c8Ass=; b=bZtQ+qkWkrMKxX+Yef6bTYA9Pv
 3/+DaI9fbqgj7qfJ5UVRiFsxG1PK4rTIC6Cuqy1L6zNAJcC+1jEInqLARcNxxOeM9a+s5KNNwuvJj
 Kk3J3DXfZqPiDS0StsX9kk71yMjejKBwDl70l2uXrZL9HTtrkADdNhMH3G2Cne5yMMnBAPNxzMSIT
 IFD2VqzQ+IVKUdqULhklK4tjh+a5MGyQRosOZMGZRc4yD05KP3MRzgkP/yHyTc03k1thcbCCtjZF2
 WBG0+ssfWUYvwMnaG5+c58Tunn51gaIhMx0+qAS1Z0BV3sgqux28OvDBJD0xErZRyLaX+IgFO28UZ
 0WEGKJ0A==;
Received: from 91-158-25-70.elisa-laajakaista.fi ([91.158.25.70]
 helo=[192.168.1.10]) by mail.kapsi.fi with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256 (Exim 4.94.2)
 (envelope-from <cyndis@kapsi.fi>)
 id 1oYRM6-002i1C-Ti; Wed, 14 Sep 2022 15:19:03 +0300
Message-ID: <6d739e27-c41c-e18f-8d13-0c38b912aa86@kapsi.fi>
Date: Wed, 14 Sep 2022 15:19:01 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.1
Subject: Re: [PATCH v2 3/8] dt-bindings: Add bindings for Tegra234 NVDEC
Content-Language: en-US
To: Rob Herring <robh@kernel.org>
References: <20220913131447.2877280-1-cyndis@kapsi.fi>
 <20220913131447.2877280-4-cyndis@kapsi.fi>
 <20220914120840.GA1837218-robh@kernel.org>
From: Mikko Perttunen <cyndis@kapsi.fi>
In-Reply-To: <20220914120840.GA1837218-robh@kernel.org>
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
Cc: devicetree@vger.kernel.org, David Airlie <airlied@linux.ie>,
 Sameer Pujar <spujar@nvidia.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Jonathan Hunter <jonathanh@nvidia.com>,
 Thierry Reding <thierry.reding@gmail.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 linux-tegra@vger.kernel.org, Mikko Perttunen <mperttunen@nvidia.com>,
 Ashish Mhetre <amhetre@nvidia.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 9/14/22 15:08, Rob Herring wrote:
> On Tue, Sep 13, 2022 at 04:14:41PM +0300, Mikko Perttunen wrote:
>> From: Mikko Perttunen <mperttunen@nvidia.com>
>>
>> Update NVDEC bindings for Tegra234. This new engine version only has
>> two memory clients, but now requires three clocks, and as a bigger
>> change the engine loads firmware from a secure carveout configured by
>> the bootloader.
>>
>> For the latter, we need to add a phandle to the memory controller
>> to query the location of this carveout, and several other properties
>> containing offsets into the firmware inside the carveout. These
>> properties are intended to be populated through a device tree overlay
>> configured at flashing time, so that the values correspond to the
>> flashed NVDEC firmware.
>>
>> As the binding was getting large with many conditional properties,
>> also split the Tegra234 version out into a separate file.
>>
>> Signed-off-by: Mikko Perttunen <mperttunen@nvidia.com>
>> ---
>> v2:
>> - Split out into separate file to avoid complexity with
>>    conditionals etc.
>> ---
>>   .../gpu/host1x/nvidia,tegra234-nvdec.yaml     | 154 ++++++++++++++++++
>>   1 file changed, 154 insertions(+)
>>   create mode 100644 Documentation/devicetree/bindings/gpu/host1x/nvidia,tegra234-nvdec.yaml
>>
>> diff --git a/Documentation/devicetree/bindings/gpu/host1x/nvidia,tegra234-nvdec.yaml b/Documentation/devicetree/bindings/gpu/host1x/nvidia,tegra234-nvdec.yaml
>> new file mode 100644
>> index 000000000000..eab0475ca983
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/gpu/host1x/nvidia,tegra234-nvdec.yaml
>> @@ -0,0 +1,154 @@
>> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
>> +%YAML 1.2
>> +---
>> +$id: "http://devicetree.org/schemas/gpu/host1x/nvidia,tegra234-nvdec.yaml#"
>> +$schema: "http://devicetree.org/meta-schemas/core.yaml#"
>> +
>> +title: Device tree binding for NVIDIA Tegra234 NVDEC
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
>> +      - nvidia,tegra234-nvdec
>> +
>> +  reg:
>> +    maxItems: 1
>> +
>> +  clocks:
>> +    maxItems: 3
>> +
>> +  clock-names:
>> +    items:
>> +      - const: nvdec
>> +      - const: fuse
>> +      - const: tsec_pka
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
>> +  dma-coherent: true
>> +
>> +  interconnects:
>> +    items:
>> +      - description: DMA read memory client
>> +      - description: DMA write memory client
>> +
>> +  interconnect-names:
>> +    items:
>> +      - const: dma-mem
>> +      - const: write
>> +
>> +  nvidia,memory-controller:
>> +    $ref: /schemas/types.yaml#/definitions/phandle
>> +    description:
>> +      phandle to the memory controller for determining carveout information.
>> +
>> +  nvidia,bl-manifest-offset:
>> +    $ref: /schemas/types.yaml#/definitions/uint32
>> +    description:
>> +      Offset to bootloader manifest from beginning of firmware. Typically set as
>> +      part of a device tree overlay corresponding to flashed firmware.
>> +
>> +  nvidia,bl-code-offset:
>> +    $ref: /schemas/types.yaml#/definitions/uint32
>> +    description:
>> +      Offset to bootloader code section from beginning of firmware. Typically set as
>> +      part of a device tree overlay corresponding to flashed firmware.
>> +
>> +  nvidia,bl-data-offset:
>> +    $ref: /schemas/types.yaml#/definitions/uint32
>> +    description:
>> +      Offset to bootloader data section from beginning of firmware. Typically set as
>> +      part of a device tree overlay corresponding to flashed firmware.
>> +
>> +  nvidia,os-manifest-offset:
>> +    $ref: /schemas/types.yaml#/definitions/uint32
>> +    description:
>> +      Offset to operating system manifest from beginning of firmware. Typically set as
>> +      part of a device tree overlay corresponding to flashed firmware.
>> +
>> +  nvidia,os-code-offset:
>> +    $ref: /schemas/types.yaml#/definitions/uint32
>> +    description:
>> +      Offset to operating system code section from beginning of firmware. Typically set as
>> +      part of a device tree overlay corresponding to flashed firmware.
>> +
>> +  nvidia,os-data-offset:
>> +    $ref: /schemas/types.yaml#/definitions/uint32
>> +    description:
>> +      Offset to operating system data section from beginning of firmware. Typically set as
>> +      part of a device tree overlay corresponding to flashed firmware.
> 
> I don't think DT is the place for describing your runtime loaded
> firmware layout.
> 
> Rob

The way I see it, from the kernel's point of view it's not runtime 
loaded but a contract with the bootloader. Bootloader sets up hardware 
in a certain way the kernel doesn't otherwise know so the bootloader 
needs to tell the kernel how the hardware is set up.

The fact that the information is supplied through an overlay is 
accidental -- equivalently the bootloader that sets up the firmware 
could adjust the device tree like we do in other situations, but in this 
case an overlay is an easier implementation method.

Thanks,
Mikko
