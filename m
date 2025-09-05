Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 13F77B453D7
	for <lists+dri-devel@lfdr.de>; Fri,  5 Sep 2025 11:57:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C393810EB5E;
	Fri,  5 Sep 2025 09:57:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=ti.com header.i=@ti.com header.b="GHcdqo+a";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from lelvem-ot02.ext.ti.com (lelvem-ot02.ext.ti.com [198.47.23.235])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D62F710EB5E
 for <dri-devel@lists.freedesktop.org>; Fri,  5 Sep 2025 09:57:50 +0000 (UTC)
Received: from fllvem-sh04.itg.ti.com ([10.64.41.54])
 by lelvem-ot02.ext.ti.com (8.15.2/8.15.2) with ESMTP id 5859vPdr3728318;
 Fri, 5 Sep 2025 04:57:25 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1757066245;
 bh=jS0ZrR2l17DwC+yF7KoEi0rpPViblg/G7ns3YIthCs4=;
 h=Date:Subject:To:CC:References:From:In-Reply-To;
 b=GHcdqo+aI6AmHcCDE+3BC8k1m0/2+elixBSCC1+tq3zF+MaaswShQg8PEcNJZ1d9q
 yjQIulENuskEDDbCjPbAg0V8Mqh6ZS9Xta40vi09r5nfaX0QdeVAvWqWIjGwWpQQUB
 uZt6ID8qKXSGB9PJTVSy35L93VubzYwzrMAwh0wc=
Received: from DLEE111.ent.ti.com (dlee111.ent.ti.com [157.170.170.22])
 by fllvem-sh04.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 5859vOad1561954
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
 Fri, 5 Sep 2025 04:57:24 -0500
Received: from DLEE100.ent.ti.com (157.170.170.30) by DLEE111.ent.ti.com
 (157.170.170.22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Fri, 5
 Sep 2025 04:57:24 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE100.ent.ti.com
 (157.170.170.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55 via
 Frontend Transport; Fri, 5 Sep 2025 04:57:23 -0500
Received: from [172.24.235.208] (hkshenoy.dhcp.ti.com [172.24.235.208])
 by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 5859vHwl265232;
 Fri, 5 Sep 2025 04:57:18 -0500
Message-ID: <4bbaefae-1d10-461a-a7a2-61a052241028@ti.com>
Date: Fri, 5 Sep 2025 15:27:17 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] dt-bindings: drm/bridge: MHDP8546 bridge binding
 changes for DSC
To: Rob Herring <robh@kernel.org>
CC: <andrzej.hajda@intel.com>, <neil.armstrong@linaro.org>, <rfoss@kernel.org>,
 <Laurent.pinchart@ideasonboard.com>, <jonas@kwiboo.se>,
 <jernej.skrabec@gmail.com>, <airlied@gmail.com>, <simona@ffwll.ch>,
 <maarten.lankhorst@linux.intel.com>, <mripard@kernel.org>,
 <tzimmermann@suse.de>, <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
 <sjakhade@cadence.com>, <yamonkar@cadence.com>,
 <dri-devel@lists.freedesktop.org>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <devarsht@ti.com>, <u-kumar1@ti.com>,
 <s-jain1@ti.com>
References: <20250903111357.2605199-1-h-shenoy@ti.com>
 <20250903220312.GA2903503-robh@kernel.org>
Content-Language: en-US
From: Harikrishna Shenoy <h-shenoy@ti.com>
In-Reply-To: <20250903220312.GA2903503-robh@kernel.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
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


On 9/4/25 03:33, Rob Herring wrote:
> On Wed, Sep 03, 2025 at 04:43:57PM +0530, Harikrishna Shenoy wrote:
>> From: Swapnil Jakhade <sjakhade@cadence.com>
>>
>> Add binding changes for DSC(Display Stream Compression) in the MHDP8546
>> DPI/DP bridge.
>>
>> Signed-off-by: Swapnil Jakhade <sjakhade@cadence.com>
>> Signed-off-by: Harikrishna Shenoy <h-shenoy@ti.com>
>> ---
>>   .../bindings/display/bridge/cdns,mhdp8546.yaml        | 11 +++++++----
>>   1 file changed, 7 insertions(+), 4 deletions(-)
>>
>> diff --git a/Documentation/devicetree/bindings/display/bridge/cdns,mhdp8546.yaml b/Documentation/devicetree/bindings/display/bridge/cdns,mhdp8546.yaml
>> index c2b369456e4e..6e749c002669 100644
>> --- a/Documentation/devicetree/bindings/display/bridge/cdns,mhdp8546.yaml
>> +++ b/Documentation/devicetree/bindings/display/bridge/cdns,mhdp8546.yaml
>> @@ -27,6 +27,8 @@ properties:
>>             Register block for DSS_EDP0_INTG_CFG_VP registers in case of TI J7 SoCs.
>>         - description:
>>             Register block of mhdptx sapb registers.
>> +      - description:
>> +          Register block for mhdptx DSC encoder registers.
>>   
>>     reg-names:
>>       minItems: 1
>> @@ -34,6 +36,7 @@ properties:
>>         - const: mhdptx
>>         - const: j721e-intg
>>         - const: mhdptx-sapb
>> +      - const: mhdptx-dsc
> 'mhdptx' is redundant. Don't continue that pattern. Just 'dsc'.

so sequence should be mhdptx, j721e-intg, mhdptx-sapb, dsc?


>
>>   
>>     clocks:
>>       maxItems: 1
>> @@ -100,18 +103,18 @@ allOf:
>>         properties:
>>           reg:
>>             minItems: 2
>> -          maxItems: 3
>> +          maxItems: 4
>>           reg-names:
>>             minItems: 2
>> -          maxItems: 3
>> +          maxItems: 4
>>       else:
>>         properties:
>>           reg:
>>             minItems: 1
>> -          maxItems: 2
>> +          maxItems: 3
>>           reg-names:
>>             minItems: 1
>> -          maxItems: 2
>> +          maxItems: 3
> Have you tested this works? While it might work for TI with the
> j721e-intg registers in the middle, it won't work for platforms without
> them. You're going to have to have 2 lists of reg-names.
>
> Rob
>
I will add two lists one with and one without j721e-integ in the 'if' 
condtional
