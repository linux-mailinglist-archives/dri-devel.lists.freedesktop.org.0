Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 397DD57FE57
	for <lists+dri-devel@lfdr.de>; Mon, 25 Jul 2022 13:26:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D47A211B721;
	Mon, 25 Jul 2022 11:26:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 49B9B11B721
 for <dri-devel@lists.freedesktop.org>; Mon, 25 Jul 2022 11:26:41 +0000 (UTC)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
 by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 26PBQMxi021582;
 Mon, 25 Jul 2022 06:26:22 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1658748382;
 bh=adpleallZBD1hHgTHjCahIQ8myK4JXmP7E5IxMoG6dE=;
 h=Date:Subject:To:CC:References:From:In-Reply-To;
 b=k9OikX3PZ0aacFxqLFJ62BPB+SJUvn3vbXxgOjzOphtPSPQJ+BJm6FX0xcB23ybMe
 i5UUART6veFPCYQJ5IxK3+2aH4czGQNoTGwRTAxUajWIUs+3ysdUKsAX2R/cMFOWmr
 1k5XKP63O+YypkKg7q39XHBI8mWhGKGPiPZzY7i4=
Received: from DLEE105.ent.ti.com (dlee105.ent.ti.com [157.170.170.35])
 by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 26PBQMKT032933
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Mon, 25 Jul 2022 06:26:22 -0500
Received: from DLEE107.ent.ti.com (157.170.170.37) by DLEE105.ent.ti.com
 (157.170.170.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14; Mon, 25
 Jul 2022 06:26:21 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DLEE107.ent.ti.com
 (157.170.170.37) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14 via
 Frontend Transport; Mon, 25 Jul 2022 06:26:21 -0500
Received: from [172.24.157.172] (ileax41-snat.itg.ti.com [10.172.224.153])
 by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 26PBQFXu076997;
 Mon, 25 Jul 2022 06:26:16 -0500
Message-ID: <a2e5037c-22c0-8424-4031-0bf587120990@ti.com>
Date: Mon, 25 Jul 2022 16:56:15 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.0.3
Subject: Re: [PATCH 1/8] dt-bindings: display: ti,am65x-dss: Add port
 properties for DSS
Content-Language: en-US
To: Rob Herring <robh@kernel.org>
References: <20220719080845.22122-1-a-bhatia1@ti.com>
 <20220719080845.22122-2-a-bhatia1@ti.com>
 <20220720232845.GA4164694-robh@kernel.org>
From: Aradhya Bhatia <a-bhatia1@ti.com>
In-Reply-To: <20220720232845.GA4164694-robh@kernel.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
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
Cc: Nishanth Menon <nm@ti.com>, Devicetree List <devicetree@vger.kernel.org>,
 Tomi Valkeinen <tomba@kernel.org>, David Airlie <airlied@linux.ie>,
 Linux Kernel List <linux-kernel@vger.kernel.org>,
 DRI Development List <dri-devel@lists.freedesktop.org>,
 Krunal Bhargav <k-bhargav@ti.com>, Darren Etheridge <detheridge@ti.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Devarsh Thakkar <devarsht@ti.com>, a-bhatia1@ti.com,
 Jyri Sarha <jyri.sarha@iki.fi>, Rahul T R <r-ravikumar@ti.com>,
 Vignesh Raghavendra <vigneshr@ti.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 21-Jul-22 04:58, Rob Herring wrote:
> On Tue, Jul 19, 2022 at 01:38:38PM +0530, Aradhya Bhatia wrote:
>> Add "ti,oldi-mode" property to indicate the tidss driver the OLDI output
>> mode. The 2 OLDI TXes on am625-dss allow a 3 different types of panel
>> connections with the board.
>>
>> 1. Single Link / Single Mode on OLDI TX 0 OR 1.
>> 2. Single Link / Duplicate Mode on OLDI TX 0 and 1.
>> 3. Dual Link / Single Mode on OLDI TX 0 and 1.
>>
>> Add "ti,rgb565-to-888" property to override 16bit output from a videoport
>> for a bridge that only accepts 24bit RGB888 DPI input.
>>
>> On some boards the HDMI bridge takes a 24bit DPI input, but only 16 data
>> pins are actually enabled from the SoC.  This new property forces the
>> output to be RGB565 on a specific video port if the bridge requests a
>> 24bit RGB color space.
>>
>> This assumes that the video port is connected like so:
>>
>> SoC : Bridge
>> R0 ->   R3
>> R1 ->   R4
>> R2 ->   R5
>> R3 ->   R6
>> R4 ->   R7
>> G0 ->   G2
>> G1 ->   G3
>> G2 ->   G4
>> G3 ->   G5
>> G4 ->   G6
>> G5 ->   G7
>> B0 ->   B3
>> B1 ->   B4
>> B2 ->   B5
>> B3 ->   B6
>> B4 ->   B7
>>
>> On the bridge side R0->R2, G0->G1, B0->B2 would be tied to ground.
>> The bridge sees 24bits of data,  but the lsb's are always zero.
> 
> Unless the bridge ignores the LSBs, that's not the right way to do 16 to
> 24 bit. The LSBs should be connected to the MSB of the color component
> to get full color range.
> 
>>
>> Signed-off-by: Aradhya Bhatia <a-bhatia1@ti.com>
>> ---
>>   .../bindings/display/ti/ti,am65x-dss.yaml     | 25 +++++++++++++++++--
>>   1 file changed, 23 insertions(+), 2 deletions(-)
>>
>> diff --git a/Documentation/devicetree/bindings/display/ti/ti,am65x-dss.yaml b/Documentation/devicetree/bindings/display/ti/ti,am65x-dss.yaml
>> index 6bbce921479d..11d9b3821409 100644
>> --- a/Documentation/devicetree/bindings/display/ti/ti,am65x-dss.yaml
>> +++ b/Documentation/devicetree/bindings/display/ti/ti,am65x-dss.yaml
>> @@ -80,15 +80,35 @@ properties:
>>   
>>       properties:
>>         port@0:
>> -        $ref: /schemas/graph.yaml#/properties/port
>> +        $ref: /schemas/graph.yaml#/$defs/port-base
>> +        unevaluatedProperties: false
>>           description:
>>             The DSS OLDI output port node form video port 1
>>   
>> +        properties:
>> +          ti,oldi-mode:
>> +            description: TI specific property to indicate the mode the OLDI TXes
>> +              and the display panel are connected in.
>> +              0 -> OLDI TXes OFF (driver default for am625-dss)
>> +              1 -> Single link, Single Mode (OLDI0) (driver default for am65x-dss)
>> +              2 -> Single link, Single Mode (OLDI1)
>> +              3 -> Single link, Duplicate Mode
>> +              4 -> Dual link (Only Single Mode)
>> +            $ref: /schemas/types.yaml#/definitions/uint32
>> +            enum: [0, 1, 2, 3, 4]
> 
> Wouldn't 'data-lanes' property work for this purpose.
> 
> Generally, we don't put properties in port nodes.
> 
Thank you for the suggestions Rob!

I looked into the "data-lanes" property and it seems that the property
alone would not be able to help distinguish between the "Single link,
Duplicate mode" (Mode 3) and "Dual link, Single mode" (Mode 4). For both
the cases, the property will look like "data-lanes = <0 1>;" in the DT
node.

I have an idea on what the driver could use along with the data-lanes
property to ascertain the OLDI mode.

By means of number of remote-endpoints in DTS.
The OLDI output port of DSS can be made to have 2 remote endpoints when
2 panels are connected as "Single link, Duplicate Mode" vs only 1 remote
endpoint for "Dual Link, Single Mode". Based on the count, the driver
can distinguish between the two when both the data-lanes are activated
in DT node.

Let me know if you think this method would be appropriate.
>> +
>>         port@1:
>> -        $ref: /schemas/graph.yaml#/properties/port
>> +        $ref: /schemas/graph.yaml#/$defs/port-base
>> +        unevaluatedProperties: false
>>           description:
>>             The DSS DPI output port node from video port 2
>>   
>> +        properties:
>> +          ti,rgb565-to-888:
>> +            description:
>> +              property to override DPI output to 16bit for 24bit bridge
>> +            type: boolean
> 
> There's work underway for standard way to handle interface formats[1].
> Please help/comment on that to make sure it works for you.
> 
> Rob
> 
> [1] https://lore.kernel.org/all/20220628181838.2031-3-max.oss.09@gmail.com/

I also followed what this patch series is implementing. This seems to be
applicable for cases where the DPI pins are drawn and forwarded towards
a simple panel capable of accepting the raw parallel data.

It does not cover for the bridges with lesser number of formats to
support.


Regards
Aradhya
