Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A03F498EE93
	for <lists+dri-devel@lfdr.de>; Thu,  3 Oct 2024 13:56:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 26DE910E817;
	Thu,  3 Oct 2024 11:56:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=phytec.de header.i=@phytec.de header.b="DCTtmhTj";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mickerik.phytec.de (mickerik.phytec.de [91.26.50.163])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7BC1F10E817
 for <dri-devel@lists.freedesktop.org>; Thu,  3 Oct 2024 11:56:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; d=phytec.de; s=a4; c=relaxed/simple;
 q=dns/txt; i=@phytec.de; t=1727956587; x=1730548587;
 h=From:Sender:Reply-To:Subject:Date:Message-ID:To:CC:MIME-Version:Content-Type:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=2oXidsECbo17EKcwyv3E95/7ldPxjJn5LAlgQqLlR3s=;
 b=DCTtmhTjIV9dPz0YnMfZwEiY9P0eJxUJV0iRQlAFLL6L502q0ZcaC716K/OiJymg
 1OQlwJrDEvFntzV5SILcNcaAQD0jiAV3iA4xIzorAgsVAxVyZG25AWdqQPrDPY0W
 CGJ7Vaf+5HRIxeZLfu0/C+C5wDR6DjvIuKJLbOtneZw=;
X-AuditID: ac14000a-4577e70000004e2a-f5-66fe866be723
Received: from berlix.phytec.de (Unknown_Domain [172.25.0.12])
 (using TLS with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (Client did not present a certificate)
 by mickerik.phytec.de (PHYTEC Mail Gateway) with SMTP id 72.B5.20010.B668EF66;
 Thu,  3 Oct 2024 13:56:27 +0200 (CEST)
Received: from [172.25.39.28] (172.25.0.11) by Berlix.phytec.de (172.25.0.12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.6; Thu, 3 Oct 2024
 13:56:25 +0200
Message-ID: <d28be8e9-b235-43e0-aaed-dd65a87c5797@phytec.de>
Date: Thu, 3 Oct 2024 13:56:24 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] dt-bindings: display: bridge: sil,sii9022: Add
 data-lines
To: Krzysztof Kozlowski <krzk@kernel.org>, <andrzej.hajda@intel.com>,
 <neil.armstrong@linaro.org>, <rfoss@kernel.org>
CC: <Laurent.pinchart@ideasonboard.com>, <jonas@kwiboo.se>,
 <jernej.skrabec@gmail.com>, <maarten.lankhorst@linux.intel.com>,
 <mripard@kernel.org>, <tzimmermann@suse.de>, <airlied@gmail.com>,
 <simona@ffwll.ch>, <dri-devel@lists.freedesktop.org>,
 <linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>,
 <bbrezillon@kernel.org>, <conor+dt@kernel.org>, <krzk+dt@kernel.org>,
 <robh@kernel.org>, <upstream@lists.phytec.de>
References: <20241003082006.2728617-1-w.egorov@phytec.de>
 <20241003082006.2728617-2-w.egorov@phytec.de>
 <fbb7d268-76f9-4d2e-9168-c927ccfdac50@kernel.org>
Content-Language: en-US
From: Wadim Egorov <w.egorov@phytec.de>
In-Reply-To: <fbb7d268-76f9-4d2e-9168-c927ccfdac50@kernel.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [172.25.0.11]
X-ClientProxiedBy: Florix.phytec.de (172.25.0.13) To Berlix.phytec.de
 (172.25.0.12)
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrHIsWRmVeSWpSXmKPExsWyRpKBRze77V+awfd5YhYnri9isri/+DOL
 xeqW6YwWa/aeY7KYf+Qcq8WVr+/ZLJ7PX8docfLNVRaLl7PusVmcP7+B3aJz4hJ2i8u75rBZ
 LPy4lcWirXMZq8X7nbcYLSbNu8lq8X/PDnaL2e/2s1tseTOR1aL7nbqDiMfebwtYPHbOusvu
 MbtjJqvH4j0vmTw2repk8zgx4RKTx51re9g85p0M9LjffZzJo7+7hdVj8+lqj8+b5AJ4orhs
 UlJzMstSi/TtErgy1ra/YC1YI1pxrH8fWwPjboEuRk4OCQETiTurDrB3MXJxCAksYZKY1tbH
 BuHcYZR4sOA0I0gVr4CNxPElK1lBbBYBFYk75/+zQcQFJU7OfMICYosKyEvcvzWDHcQWFgiR
 +HL2BlhcRKBcYsK7JhaQocwCm5glPr/ezQqxYS6jxJqLb8E6mAXEJW49mc8EYrMJqEvc2fAN
 bBungJ1Ez8RNbBA1FhKL3xyEqpeX2P52DjOILQRkv7i0nAXiH3mJaedeM0PYoRJHNq1mmsAo
 PAvJsbOQrJuFZOwsJGMXMLKsYhTKzUzOTi3KzNYryKgsSU3WS0ndxAhKAyIMXDsY++Z4HGJk
 4mA8xCjBwawkwjtv+980Id6UxMqq1KL8+KLSnNTiQ4zSHCxK4ryrO4JThQTSE0tSs1NTC1KL
 YLJMHJxSDYwsxWWHLWa0vnIu0NINufexXDdBRuD8vmLjT2+O/NZYoJJ//xHvni+CM399Oho1
 ocu3cXrjnhl/tZM/Xym1m6wqfmV79a+ow7uYViWK6zKLTJTO6FT9GNJ+Q/wd67ofJfMlTipo
 BcVkCGy/9T+lK3CbifB6x6nLK7svLZjM7Hr5lO72VPlvb2qVWIozEg21mIuKEwHMe+Ft8QIA
 AA==
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



Am 03.10.24 um 12:03 schrieb Krzysztof Kozlowski:
> On 03/10/2024 10:20, Wadim Egorov wrote:
>> The SI9022 HDMI transmitter can be configured with 16, 18, or 24 input
>> data lines. This commit introduces the data-lines property to the input
> 
> lines? lanes? What are lines? like pins?

Yes, "lines" in this context refers to the number of pins used for the 
input pixel data bus, which can support 16, 18, or 24-bit wide data 
buses. These are parallel data lines (or pins) that carry uncompressed 
digital video to the HDMI transmitter.

> 
>> endpoint, specifying the number of parallel RGB input pins connected
>> to the transmitter.
>>
>> Signed-off-by: Wadim Egorov <w.egorov@phytec.de>
>> ---
>>   .../bindings/display/bridge/sil,sii9022.yaml        | 13 ++++++++++++-
>>   1 file changed, 12 insertions(+), 1 deletion(-)
>>
>> diff --git a/Documentation/devicetree/bindings/display/bridge/sil,sii9022.yaml b/Documentation/devicetree/bindings/display/bridge/sil,sii9022.yaml
>> index 5a69547ad3d7..24306f8eb107 100644
>> --- a/Documentation/devicetree/bindings/display/bridge/sil,sii9022.yaml
>> +++ b/Documentation/devicetree/bindings/display/bridge/sil,sii9022.yaml
>> @@ -81,9 +81,20 @@ properties:
>>   
>>       properties:
>>         port@0:
>> -        $ref: /schemas/graph.yaml#/properties/port
>> +        unevaluatedProperties: false
>> +        $ref: /schemas/graph.yaml#/$defs/port-base
>>           description: Parallel RGB input port
>>   
>> +        properties:
>> +          endpoint:
>> +            $ref: /schemas/graph.yaml#/$defs/endpoint-base
>> +            unevaluatedProperties: false
>> +
>> +            properties:
>> +              data-lines:
> 
> No, this will confuse everyone. Considering lack of description how
> anyone would figure out what this means?

I guess from working with the hardware/reference manual and using this chip?

I don't think it is overly confusing, especially since the port is 
already described as the "Parallel RGB input port" which clearly implies 
the use of pins for data transmission.

I am open to other suggestions if you believe a different name would 
improve clarity.

Btw, bridge/toshiba,tc358768.yaml, which performs a similar function, 
also uses the term data-lines.

Regards,
Wadim

> 
> I don't know much about RGB parallel port to advice how this should be
> called. Can you describe the hardware more?
> 
>> +                $ref: /schemas/types.yaml#/definitions/uint32
>> +                enum: [ 16, 18, 24 ]
>> +
>>         port@1:
>>           $ref: /schemas/graph.yaml#/properties/port
>>           description: HDMI output port
> 
> Best regards,
> Krzysztof
> 

