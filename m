Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AF953688F9B
	for <lists+dri-devel@lfdr.de>; Fri,  3 Feb 2023 07:22:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2E9D610E71B;
	Fri,  3 Feb 2023 06:22:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 22AEF10E71B
 for <dri-devel@lists.freedesktop.org>; Fri,  3 Feb 2023 06:22:18 +0000 (UTC)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
 by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 3136Lf7W035470;
 Fri, 3 Feb 2023 00:21:41 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1675405301;
 bh=l25UEVixOyFOcihudAXONA6spJ9+qf/KGX7SmPDUpy8=;
 h=Date:From:Subject:To:CC:References:In-Reply-To;
 b=qjR6+d/UB5ekuJr3MiVFs8p0g7m0yrdKHoZaudFhcFOCfbLx2Oh+LhyjBCzcHFyed
 SgRi87UzmQOR55kVzJaHdmit8OAFqTT2MTTUihcIjT1ehCTPpSslV1Vk4saKD0rufr
 at9rNlCW6mzqUTS3nlqD2ccdgy5vwkRQiqpybA24=
Received: from DLEE107.ent.ti.com (dlee107.ent.ti.com [157.170.170.37])
 by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 3136LfdC023256
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Fri, 3 Feb 2023 00:21:41 -0600
Received: from DLEE100.ent.ti.com (157.170.170.30) by DLEE107.ent.ti.com
 (157.170.170.37) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.16; Fri, 3
 Feb 2023 00:21:40 -0600
Received: from lelv0326.itg.ti.com (10.180.67.84) by DLEE100.ent.ti.com
 (157.170.170.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.16 via
 Frontend Transport; Fri, 3 Feb 2023 00:21:40 -0600
Received: from [172.24.222.47] (ileaxei01-snat2.itg.ti.com [10.180.69.6])
 by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 3136LUTK032367;
 Fri, 3 Feb 2023 00:21:31 -0600
Message-ID: <4134f4c2-450c-e560-82c2-82fe1fc4e90d@ti.com>
Date: Fri, 3 Feb 2023 11:51:30 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
From: Aradhya Bhatia <a-bhatia1@ti.com>
Subject: Re: [PATCH v2 3/4] dt-bindings: panel: Introduce dual-link LVDS panel
To: Rob Herring <robh@kernel.org>
References: <20230124101238.4542-1-a-bhatia1@ti.com>
 <20230124101238.4542-4-a-bhatia1@ti.com>
 <20230130170441.GA2796575-robh@kernel.org>
Content-Language: en-US
In-Reply-To: <20230130170441.GA2796575-robh@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
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
Cc: Nishanth Menon <nm@ti.com>, Vignesh Raghavendra <vigneshr@ti.com>,
 Devarsh Thakkar <devarsht@ti.com>,
 DRI Development List <dri-devel@lists.freedesktop.org>,
 Linux Kernel List <linux-kernel@vger.kernel.org>,
 Thierry Reding <thierry.reding@gmail.com>, Guo Ren <guoren@kernel.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Linux RISC-V List <linux-riscv@lists.infradead.org>,
 Sam Ravnborg <sam@ravnborg.org>,
 Linux C-SKY Arch List <linux-csky@vger.kernel.org>,
 Devicetree List <devicetree@vger.kernel.org>,
 Albert Ou <aou@eecs.berkeley.edu>, Jai Luthra <j-luthra@ti.com>,
 Rahul T R <r-ravikumar@ti.com>,
 Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
 Mark Brown <broonie@kernel.org>,
 Linux Mediatek List <linux-mediatek@lists.infradead.org>,
 Maxime Ripard <maxime@cerno.tech>, Paul Walmsley <paul.walmsley@sifive.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Linux ARM Kernel List <linux-arm-kernel@lists.infradead.org>,
 Jayesh Choudhary <j-choudhary@ti.com>, Tomi Valkeinen <tomba@kernel.org>,
 Liam Girdwood <lgirdwood@gmail.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Jyri Sarha <jyri.sarha@iki.fi>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Rob,

On 30-Jan-23 22:34, Rob Herring wrote:
> On Tue, Jan 24, 2023 at 03:42:37PM +0530, Aradhya Bhatia wrote:
>> Dual-link LVDS interfaces have 2 links, with even pixels traveling on
>> one link, and odd pixels on the other. These panels are also generic in
>> nature, with no documented constraints, much like their single-link
>> counterparts, "panel-lvds".
>>
>> Add a new compatible, "panel-dual-lvds", and a dt-binding document for
>> these panels.
>>
>> Signed-off-by: Aradhya Bhatia <a-bhatia1@ti.com>
>> ---
>>   .../display/panel/panel-dual-lvds.yaml        | 149 ++++++++++++++++++
>>   MAINTAINERS                                   |   1 +
>>   2 files changed, 150 insertions(+)
>>   create mode 100644 Documentation/devicetree/bindings/display/panel/panel-dual-lvds.yaml
>>
>> diff --git a/Documentation/devicetree/bindings/display/panel/panel-dual-lvds.yaml b/Documentation/devicetree/bindings/display/panel/panel-dual-lvds.yaml
>> new file mode 100644
>> index 000000000000..e2ce1768e9a3
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/display/panel/panel-dual-lvds.yaml
>> @@ -0,0 +1,149 @@
>> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
>> +%YAML 1.2
>> +---
>> +$id: http://devicetree.org/schemas/display/panel/panel-dual-lvds.yaml#
>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>> +
>> +title: Generic Dual-Link LVDS Display Panel
>> +
>> +maintainers:
>> +  - Aradhya Bhatia <a-bhatia1@ti.com>
>> +  - Thierry Reding <thierry.reding@gmail.com>
>> +
>> +description: |
>> +  A dual-LVDS interface is a dual-link connection with the even pixels
>> +  traveling on one link, and the odd pixels traveling on the other.
>> +
>> +allOf:
>> +  - $ref: panel-common.yaml#
>> +  - $ref: /schemas/display/lvds.yaml#
>> +
>> +properties:
>> +  compatible:
>> +    items:
>> +      - enum:
>> +          - lincolntech,lcd185-101ct
>> +          - microtips,mf-101hiebcaf0
>> +      - const: panel-dual-lvds
> 
> Why do we need a new compatible? You have ports and properties to see if
> the panel is dual link.

Do you mean to say that we can have a generic dual-link panel
dt-binding, which will allow others to add their own dual-link panel
compatibles, but instead with the mandatory compatible "panel-lvds"?

> 
> We already have dual link LVDS supported in advantech,idk-2121wr.yaml
> which says is compatible with 'panel-lvds', so that decision has already
> been made. The hint was you added the compatible match to the driver
> with 0 other changes needed.
> 

The code which represents the HW difference between the 2 types of
panels was merged in drm/drm_of.c along with the advantech binding.

And a dual-link panel can still be made to work as single-link, as Tomi
had pointed out in the previous series[1]. So, it wouldn't be wrong to
say that a dual-link panel is panel-lvds.

The reason I have been pushing for a new compatible and binding is
because the 2nd sink in dual-lvds panels make them different enough
their from single link counterparts. At the very least, we should have
different bindings for the both of them, for ease of maintenance in
future, when more properties will get added. So, if you indeed are
suggesting that we have a separate dt-binding for these panels, but not
a new generic compatible, then I can get behind that.

And If we do go that way, I think one of your suggestions on advantech
dt-binding series[2] also gets relevant here.

oneOf:
  - required: [ports]
  - required: [port]

This way, we can have dual-lvds panels support single link mode as well.

> That schema is missing type definitions and constraints for
> dual-lvds-odd-pixels/dual-lvds-even-pixels so there does need to be some
> changes to add those.

You are right. AFAIK, the the advantech,idk-2121wr panel is also a
generic model. Which is why, these patches started out as a renaming of
the advantech binding and making the properties generic. But the diff
got bigger and I decided to make a new file.

The idea for future work, now, is to merge the "advantech,idk-2121wr"
compatible along with other panel specific compatibles in this binding.


Regards
Aradhya


[1]: https://lore.kernel.org/all/808e831f-4282-0e58-ebb2-2f556aaeaca4@ideasonboard.com/
[2]: https://lore.kernel.org/all/CAL_Jsq+5FMHK4W4UQU24g+rm3CLjnhRcB29skygRB++GaJyM0A@mail.gmail.com/

> 
>> +
>> +  ports:
>> +    $ref: /schemas/graph.yaml#/properties/ports
>> +
>> +    properties:
>> +      port@0:
>> +        $ref: /schemas/graph.yaml#/$defs/port-base
>> +        unevaluatedProperties: false
>> +        description: The sink for first set of LVDS pixels.
>> +
>> +        properties:
>> +          dual-lvds-odd-pixels:
>> +            type: boolean
>> +
>> +          dual-lvds-even-pixels:
>> +            type: boolean
>> +
>> +        oneOf:
>> +          - required: [dual-lvds-odd-pixels]
>> +          - required: [dual-lvds-even-pixels]
>> +
>> +      port@1:
>> +        $ref: /schemas/graph.yaml#/$defs/port-base
>> +        unevaluatedProperties: false
>> +        description: The sink for second set of LVDS pixels.
>> +
>> +        properties:
>> +          dual-lvds-even-pixels:
>> +            type: boolean
>> +
>> +          dual-lvds-odd-pixels:
>> +            type: boolean
>> +
>> +        oneOf:
>> +          - required: [dual-lvds-even-pixels]
>> +          - required: [dual-lvds-odd-pixels]
>> +
>> +    allOf:
>> +      - if:
>> +          properties:
>> +            port@0:
>> +              required:
>> +                - dual-lvds-odd-pixels
>> +        then:
>> +          properties:
>> +            port@1:
>> +              properties:
>> +                dual-lvds-odd-pixels: false
>> +
>> +      - if:
>> +          properties:
>> +            port@0:
>> +              required:
>> +                - dual-lvds-even-pixels
>> +        then:
>> +          properties:
>> +            port@1:
>> +              properties:
>> +                dual-lvds-even-pixels: false
>> +
>> +    required:
>> +      - port@0
>> +      - port@1
>> +
>> +  port: false
>> +
>> +unevaluatedProperties: false
>> +
>> +required:
>> +  - compatible
>> +  - width-mm
>> +  - height-mm
>> +  - data-mapping
>> +  - panel-timing
>> +  - ports
>> +
>> +examples:
>> +  - |
>> +    panel {
>> +      compatible = "microtips,mf-101hiebcaf0", "panel-dual-lvds";
>> +
>> +      width-mm = <217>;
>> +      height-mm = <136>;
>> +
>> +      data-mapping = "vesa-24";
>> +
>> +      panel-timing {
>> +        clock-frequency = <150275000>;
>> +        hactive = <1920>;
>> +        vactive = <1200>;
>> +        hfront-porch = <32>;
>> +        hsync-len = <52>;
>> +        hback-porch = <24>;
>> +        vfront-porch = <24>;
>> +        vsync-len = <8>;
>> +        vback-porch = <3>;
>> +        de-active = <1>;
>> +      };
>> +
>> +      ports {
>> +        #address-cells = <1>;
>> +        #size-cells = <0>;
>> +
>> +        port@0 {
>> +          reg = <0>;
>> +          dual-lvds-odd-pixels;
>> +          lcd_in0: endpoint {
>> +            remote-endpoint = <&oldi_out0>;
>> +          };
>> +        };
>> +
>> +        port@1 {
>> +          reg = <1>;
>> +          dual-lvds-even-pixels;
>> +          lcd_in1: endpoint {
>> +            remote-endpoint = <&oldi_out1>;
>> +          };
>> +        };
>> +      };
>> +    };
>> +
>> +...
>> diff --git a/MAINTAINERS b/MAINTAINERS
>> index 5e18388b4579..6025bb024586 100644
>> --- a/MAINTAINERS
>> +++ b/MAINTAINERS
>> @@ -6461,6 +6461,7 @@ T:	git git://anongit.freedesktop.org/drm/drm-misc
>>   S:	Maintained
>>   F:	drivers/gpu/drm/panel/panel-lvds.c
>>   F:	Documentation/devicetree/bindings/display/lvds.yaml
>> +F:	Documentation/devicetree/bindings/display/panel/panel-dual-lvds.yaml
>>   F:	Documentation/devicetree/bindings/display/panel/panel-lvds.yaml
>>   
>>   DRM DRIVER FOR MANTIX MLAF057WE51 PANELS
>> -- 
>> 2.39.0
>>
