Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 52BA9B435BF
	for <lists+dri-devel@lfdr.de>; Thu,  4 Sep 2025 10:29:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 01AA610E99A;
	Thu,  4 Sep 2025 08:29:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=ti.com header.i=@ti.com header.b="v/WVw/iO";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fllvem-ot04.ext.ti.com (fllvem-ot04.ext.ti.com [198.47.19.246])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DB6E810E99A
 for <dri-devel@lists.freedesktop.org>; Thu,  4 Sep 2025 08:29:11 +0000 (UTC)
Received: from lelvem-sh02.itg.ti.com ([10.180.78.226])
 by fllvem-ot04.ext.ti.com (8.15.2/8.15.2) with ESMTP id 5848Svw03428666;
 Thu, 4 Sep 2025 03:28:57 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1756974537;
 bh=gy2Gy45lLeX0odcLNygy1AOk1VBFVVsVlHH30uMOI0s=;
 h=Date:Subject:To:CC:References:From:In-Reply-To;
 b=v/WVw/iOLP2UqlOHgpfiCa7l/vlFONunik/NLl5tjpdQ1vgR8axlREGW2c6OtxJyr
 Iwy6bZ8zYOmZlD+Hfn4eVzTHHhDz1gbryBSfpeRuHdDb4wjy1fZkroE3toAkAFtHII
 OJ1cO6ZvSPc8TiWz6p0nMybEJtATNKMaypdWJL9U=
Received: from DLEE102.ent.ti.com (dlee102.ent.ti.com [157.170.170.32])
 by lelvem-sh02.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 5848Svsc039314
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
 Thu, 4 Sep 2025 03:28:57 -0500
Received: from DLEE102.ent.ti.com (157.170.170.32) by DLEE102.ent.ti.com
 (157.170.170.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Thu, 4
 Sep 2025 03:28:56 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE102.ent.ti.com
 (157.170.170.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55 via
 Frontend Transport; Thu, 4 Sep 2025 03:28:56 -0500
Received: from [172.24.233.62] (devarsh-precision-tower-3620.dhcp.ti.com
 [172.24.233.62])
 by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 5848SoWi2680491;
 Thu, 4 Sep 2025 03:28:50 -0500
Message-ID: <ee992556-6c90-4ad0-b3a1-1ddd9a232923@ti.com>
Date: Thu, 4 Sep 2025 13:58:49 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] dt-bindings: drm/bridge: MHDP8546 bridge binding
 changes for DSC
To: Rob Herring <robh@kernel.org>, Harikrishna Shenoy <h-shenoy@ti.com>
CC: <andrzej.hajda@intel.com>, <neil.armstrong@linaro.org>, <rfoss@kernel.org>,
 <Laurent.pinchart@ideasonboard.com>, <jonas@kwiboo.se>,
 <jernej.skrabec@gmail.com>, <airlied@gmail.com>, <simona@ffwll.ch>,
 <maarten.lankhorst@linux.intel.com>, <mripard@kernel.org>,
 <tzimmermann@suse.de>, <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
 <sjakhade@cadence.com>, <yamonkar@cadence.com>,
 <dri-devel@lists.freedesktop.org>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <u-kumar1@ti.com>, <s-jain1@ti.com>
References: <20250903111357.2605199-1-h-shenoy@ti.com>
 <20250903220312.GA2903503-robh@kernel.org>
Content-Language: en-US
From: Devarsh Thakkar <devarsht@ti.com>
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

Hi Hari,

On 04/09/25 03:33, Rob Herring wrote:
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
> 
> 'mhdptx' is redundant. Don't continue that pattern. Just 'dsc'.
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
> 
> Have you tested this works? While it might work for TI with the
> j721e-intg registers in the middle, it won't work for platforms without
> them. You're going to have to have 2 lists of reg-names.
> 

Yes, as discussed offline you probably need an if else for reg blocks 
too here i.e. one for generic cadence compatible which would have 
cadence specific blocks common for all SoCs and other for j721e specific 
compatible which would have j721e specific reg blocks.

Regards
Devarsh

> Rob
> 

