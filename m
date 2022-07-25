Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A51857FE71
	for <lists+dri-devel@lfdr.de>; Mon, 25 Jul 2022 13:35:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4C4C79792B;
	Mon, 25 Jul 2022 11:35:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2D0059792B
 for <dri-devel@lists.freedesktop.org>; Mon, 25 Jul 2022 11:35:17 +0000 (UTC)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
 by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 26PBYrU5025725;
 Mon, 25 Jul 2022 06:34:53 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1658748894;
 bh=QBcAwyJjvWXZ51kHPhUxnwTYKafLt/x/UlVip1NXNCk=;
 h=Date:Subject:To:CC:References:From:In-Reply-To;
 b=nI2IW9j8DSn6RZ/2+eV8Om7YxAmcFIsujnNWYedQlyJ/TzNfQIZl/oTpeIDXTxo7L
 FuYYnoxJG1JA+bkKQo48bAP88ArPR42IKHW+1w/E4rwUuPfNhz1E7VzuKHiVYBj/Vn
 mUGFjQcBN2p5bct48cHphe5isHVzKLOHqvdZOPWc=
Received: from DLEE115.ent.ti.com (dlee115.ent.ti.com [157.170.170.26])
 by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 26PBYrUn023670
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Mon, 25 Jul 2022 06:34:53 -0500
Received: from DLEE112.ent.ti.com (157.170.170.23) by DLEE115.ent.ti.com
 (157.170.170.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14; Mon, 25
 Jul 2022 06:34:53 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DLEE112.ent.ti.com
 (157.170.170.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14 via
 Frontend Transport; Mon, 25 Jul 2022 06:34:53 -0500
Received: from [172.24.157.172] (ileax41-snat.itg.ti.com [10.172.224.153])
 by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 26PBYmuW076414;
 Mon, 25 Jul 2022 06:34:49 -0500
Message-ID: <37d22b9a-ac6e-9f7c-90d7-7ad5dcf47dbc@ti.com>
Date: Mon, 25 Jul 2022 17:04:47 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.0.3
Subject: Re: [PATCH 2/8] dt-bindings: display: ti,am65x-dss: Add IO CTRL
 property for AM625 OLDI
Content-Language: en-US
To: Rob Herring <robh@kernel.org>
References: <20220719080845.22122-1-a-bhatia1@ti.com>
 <20220719080845.22122-3-a-bhatia1@ti.com>
 <20220720233235.GA4180021-robh@kernel.org>
From: Aradhya Bhatia <a-bhatia1@ti.com>
In-Reply-To: <20220720233235.GA4180021-robh@kernel.org>
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
 Devarsh Thakkar <devarsht@ti.com>, Jyri Sarha <jyri.sarha@iki.fi>,
 Rahul T R <r-ravikumar@ti.com>, Vignesh Raghavendra <vigneshr@ti.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 21-Jul-22 05:02, Rob Herring wrote:
> On Tue, Jul 19, 2022 at 01:38:39PM +0530, Aradhya Bhatia wrote:
>> Add am625-io-ctrl dt property to provide access to the control MMR
>> registers for the OLDI TXes.
>>
>> These registers are used to control the power input to the OLDI TXes as
>> well as to configure them in the Loopback test mode.
>>
>> The MMR IO controller device has been updated since the AM65x SoC and
>> hence a newer property is needed to describe the one in AM625 SoC.
>>
>> Signed-off-by: Aradhya Bhatia <a-bhatia1@ti.com>
>> ---
>>   .../bindings/display/ti/ti,am65x-dss.yaml     | 21 +++++++++++++++++++
>>   1 file changed, 21 insertions(+)
>>
>> diff --git a/Documentation/devicetree/bindings/display/ti/ti,am65x-dss.yaml b/Documentation/devicetree/bindings/display/ti/ti,am65x-dss.yaml
>> index 11d9b3821409..672765ad1f30 100644
>> --- a/Documentation/devicetree/bindings/display/ti/ti,am65x-dss.yaml
>> +++ b/Documentation/devicetree/bindings/display/ti/ti,am65x-dss.yaml
>> @@ -118,12 +118,33 @@ properties:
>>         and OLDI_CLK_IO_CTRL registers. This property is needed for OLDI
>>         interface to work.
>>   
>> +  ti,am625-oldi-io-ctrl:
>> +    $ref: "/schemas/types.yaml#/definitions/phandle"
>> +    description:
>> +      phandle to syscon device node mapping OLDI IO_CTRL registers, for
>> +      AM625 SoC. The mapped range should point to OLDI0_DAT0_IO_CTRL,
>> +      and map the registers up till OLDI_LB_CTRL. This property allows
>> +      the driver to control the power delivery to the OLDI TXes and
>> +      their loopback control as well.
> 
> What's wrong with the existing ti,am65x-oldi-io-ctrl other than the less
> than ideal naming? And you just continued with the same issue so the
> next part will need yet another property. Sorry, no. Just use the
> existing property.
> 
I introduced the new property because the peripheral was a newer and
different implementation from the previous one.

However, the same property can be re-used. I will do so in the re-spin.

>> +
>>     max-memory-bandwidth:
>>       $ref: /schemas/types.yaml#/definitions/uint32
>>       description:
>>         Input memory (from main memory to dispc) bandwidth limit in
>>         bytes per second
>>   
>> +if:
>> +  properties:
>> +    compatible:
>> +      contains:
>> +        const: ti,am65x-dss
>> +then:
>> +  properties:
>> +    ti,am625-oldi-io-ctrl: false
>> +else:
>> +  properties:
>> +    ti,am65x-oldi-io-ctrl: false
>> +
>>   required:
>>     - compatible
>>     - reg
>> -- 
>> 2.37.0
>>
>>

Regards
Aradhya
