Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CA6F126E26
	for <lists+dri-devel@lfdr.de>; Thu, 19 Dec 2019 20:46:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4F3166E3DA;
	Thu, 19 Dec 2019 19:46:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AAA686E3DA
 for <dri-devel@lists.freedesktop.org>; Thu, 19 Dec 2019 19:46:03 +0000 (UTC)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
 by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id xBJJjtw7056819;
 Thu, 19 Dec 2019 13:45:55 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1576784755;
 bh=bnJkCwgI6662K+w9YFRtMnsZJZSvXNL/+eXAs9HJUa0=;
 h=Subject:From:To:CC:References:Date:In-Reply-To;
 b=p8+1HDAv2O1s3sSfnsAnZkMWEEGH5Rm2tWS01GdPP0RuZ2mgWq4MjOeop1flBhhyP
 wgjAYocIsFtjkFr2HemGw8zP8ysLbxwQ5/CfNW/xfWzn4Y4mD9kuvrsz1P0v4cJZqu
 EhOsmEQpUyuXyw11QJ/qiJWOlpjy0GOm0ooAxklk=
Received: from DFLE113.ent.ti.com (dfle113.ent.ti.com [10.64.6.34])
 by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id xBJJjtIL022832
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Thu, 19 Dec 2019 13:45:55 -0600
Received: from DFLE102.ent.ti.com (10.64.6.23) by DFLE113.ent.ti.com
 (10.64.6.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3; Thu, 19
 Dec 2019 13:45:54 -0600
Received: from lelv0326.itg.ti.com (10.180.67.84) by DFLE102.ent.ti.com
 (10.64.6.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
 Frontend Transport; Thu, 19 Dec 2019 13:45:54 -0600
Received: from [10.1.3.6] (ileax41-snat.itg.ti.com [10.172.224.153])
 by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id xBJJjpiN108774;
 Thu, 19 Dec 2019 13:45:51 -0600
Subject: Re: [PATCH v4 3/5] dt-bindings: display: ti, j721e-dss: Add dt-schema
 yaml binding
From: Jyri Sarha <jsarha@ti.com>
To: Maxime Ripard <maxime@cerno.tech>
References: <cover.1576704528.git.jsarha@ti.com>
 <89db418c91689beb6e63e0c3c99b39655948b429.1576704528.git.jsarha@ti.com>
 <20191219083839.lmuhxynbbqy4d4hp@gilmour.lan>
 <2acd648f-6532-c7d8-c9d0-f4c5229c7923@ti.com>
Autocrypt: addr=jsarha@ti.com; prefer-encrypt=mutual; keydata=
 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
Message-ID: <866bff4e-3a24-626a-729d-35a9647a407b@ti.com>
Date: Thu, 19 Dec 2019 21:45:51 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <2acd648f-6532-c7d8-c9d0-f4c5229c7923@ti.com>
Content-Language: en-GB
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
Cc: devicetree@vger.kernel.org, yamonkar@cadence.com, praneeth@ti.com,
 sjakhade@cadence.com, dri-devel@lists.freedesktop.org, peter.ujfalusi@ti.com,
 robh+dt@kernel.org, tomi.valkeinen@ti.com, laurent.pinchart@ideasonboard.com,
 subhajit_paul@ti.com, sam@ravnborg.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 19/12/2019 16:01, Jyri Sarha wrote:
> On 19/12/2019 10:38, Maxime Ripard wrote:
>> Hi,
>>
>> On Thu, Dec 19, 2019 at 10:23:17AM +0200, Jyri Sarha wrote:
>>> Add dt-schema yaml bindig for J721E DSS, J721E version TI Keystone
>>> Display SubSystem.
>>>
>>> Version history:
>>>
>>> v2: no change
>>>
>>> v3: - reg-names: "wp" -> "wb"
>>>     - Add ports node
>>>     - Add includes to dts example
>>>     - reindent dts example
>>>
>>> v4: - Add descriptions to reg, clocks, and interrups properties
>>>     - Remove minItems when its value is the same as maxItems value
>>>
>>> Signed-off-by: Jyri Sarha <jsarha@ti.com>
>>> ---
>>>  .../bindings/display/ti/ti,j721e-dss.yaml     | 209 ++++++++++++++++++
>>>  1 file changed, 209 insertions(+)
>>>  create mode 100644 Documentation/devicetree/bindings/display/ti/ti,j721e-dss.yaml
>>>
>>> diff --git a/Documentation/devicetree/bindings/display/ti/ti,j721e-dss.yaml b/Documentation/devicetree/bindings/display/ti/ti,j721e-dss.yaml
>>> new file mode 100644
>>> index 000000000000..cd68c4294f9a
>>> --- /dev/null
>>> +++ b/Documentation/devicetree/bindings/display/ti/ti,j721e-dss.yaml
>>> @@ -0,0 +1,209 @@
>>> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
>>> +# Copyright 2019 Texas Instruments Incorporated
>>> +%YAML 1.2
>>> +---
>>> +$id: "http://devicetree.org/schemas/display/ti/ti,j721e-dss.yaml#"
>>> +$schema: "http://devicetree.org/meta-schemas/core.yaml#"
>>> +
>>> +title: Texas Instruments J721E Display Subsystem
>>> +
>>> +maintainers:
>>> +  - Jyri Sarha <jsarha@ti.com>
>>> +  - Tomi Valkeinen <tomi.valkeinen@ti.com>
>>> +
>>> +description: |
>>> +  The J721E TI Keystone Display SubSystem with four output ports and
>>> +  four video planes. There is two full video planes and two "lite
>>> +  planes" without scaling support. The video ports can be connected to
>>> +  the SoC's DPI pins or to integrated display bridges on the SoC.
>>> +
>>> +properties:
>>> +  compatible:
>>> +    const: ti,j721e-dss
>>> +
>>> +  reg:
>>> +    maxItems: 17
>>> +    description: |
>>> +      Addresses to each DSS memory region described in the SoC's TRM.
>>> +      The reg-names refer to memory regions as follows:
>>> +      reg-names: Region Name in TRM:     Description:
>>> +      common_m   DSS0_DISPC_0_COMMON_M   DSS Master common register area
>>> +      common_s0  DSS0_DISPC_0_COMMON_SO  DSS Shared common register area 0
>>> +      common_s1  DSS0_DISPC_0_COMMON_S1  DSS Shared common register area 1
>>> +      common_s2  DSS0_DISPC_0_COMMON_S2  DSS Shared common register area 2
>>> +      vidl1      DSS0_VIDL1              VIDL1 light video plane 1
>>> +      vidl2      DSS0_VIDL2              VIDL2 light video plane 2
>>> +      vid1       DSS0_VID1               VID1 video plane 1
>>> +      vid2       DSS0_VID2               VID1 video plane 2
>>> +      ovr1       DSS0_OVR1               OVR1 overlay manager for vp1
>>> +      ovr2       DSS0_OVR2               OVR2 overlay manager for vp2
>>> +      ovr3       DSS0_OVR3               OVR1 overlay manager for vp3
>>> +      ovr4       DSS0_OVR4               OVR2 overlay manager for vp4
>>> +      vp1        DSS0_VP1                VP1 video port 1
>>> +      vp2        DSS0_VP2                VP1 video port 2
>>> +      vp3        DSS0_VP3                VP1 video port 3
>>> +      vp4        DSS0_VP4                VP1 video port 4
>>> +      wp         DSS0_WB                 Write Back registers
>> I guess it applies to all your schemas in that patch series, but you
>> could just do something like
>>
>> reg:
>>   items:
>>     - description: DSS Master common register area
>>     - description: DSS Shared common register area 0
>>     - description: DSS Shared common register area 1
>>
> Ok, thanks. I was not sure if you can do that (still a newbie with
> yaml). What do you think about Peter Ujfalusi's suggestion of putting
> the descriptions to reg-names (and clock-names and  interrupt-names)?
> e.g. something like this:
> 
>   reg-names:
>     items:
>       - const: common_m
>       - description: DSS Master common register area
>       - const: common_s0
>       - description: DSS Master common register area
> ...
> 
> Or is that even allowed?
> 

Hmmm, it looks like make dt_binding_check does not like that. I guess I
go with your suggestion, but with reg-name reference in the description.

Best regards,
Jyri

-- 
Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki.
Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
