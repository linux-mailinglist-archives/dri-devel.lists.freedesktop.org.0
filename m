Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D47AB5108D
	for <lists+dri-devel@lfdr.de>; Wed, 10 Sep 2025 10:08:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6F07010E896;
	Wed, 10 Sep 2025 08:08:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=ti.com header.i=@ti.com header.b="CX1/coYv";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from lelvem-ot01.ext.ti.com (lelvem-ot01.ext.ti.com [198.47.23.234])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AA3E010E896
 for <dri-devel@lists.freedesktop.org>; Wed, 10 Sep 2025 08:08:42 +0000 (UTC)
Received: from lelvem-sh01.itg.ti.com ([10.180.77.71])
 by lelvem-ot01.ext.ti.com (8.15.2/8.15.2) with ESMTP id 58A88LvL095414;
 Wed, 10 Sep 2025 03:08:21 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1757491702;
 bh=ISe2QleZokgkYclvuW677FsPG22emPPyU0CtFKxyG/I=;
 h=Date:Subject:To:CC:References:From:In-Reply-To;
 b=CX1/coYvASgXaFrtPzzVUj3SLn/KBnUykHzIEw3PLeChZhoKMSyHvAU3N4cu25SC3
 xZPpFLo3ZQ5V6/Z3qH/aRMN1r5RgLNY0aZbUQKcrJ5pTrEpAUujSLPhMTTLjr3fjvX
 eqWo6DJlVh4babVK9Sd8Aw0Zcsea9Qa8HCFaPCLE=
Received: from DLEE108.ent.ti.com (dlee108.ent.ti.com [157.170.170.38])
 by lelvem-sh01.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 58A88Lsa3773653
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
 Wed, 10 Sep 2025 03:08:21 -0500
Received: from DLEE213.ent.ti.com (157.170.170.116) by DLEE108.ent.ti.com
 (157.170.170.38) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Wed, 10
 Sep 2025 03:08:20 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE213.ent.ti.com
 (157.170.170.116) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Wed, 10 Sep 2025 03:08:20 -0500
Received: from [172.24.235.208] (hkshenoy.dhcp.ti.com [172.24.235.208])
 by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 58A88DcL171472;
 Wed, 10 Sep 2025 03:08:14 -0500
Message-ID: <a04ded27-a3b2-4290-9084-70d302f77381@ti.com>
Date: Wed, 10 Sep 2025 13:38:13 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4] dt-bindings: drm/bridge: MHDP8546 bridge binding
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
References: <20250909054622.1439487-1-h-shenoy@ti.com>
 <20250910023608.GA3662482-robh@kernel.org>
Content-Language: en-US
From: Harikrishna Shenoy <h-shenoy@ti.com>
In-Reply-To: <20250910023608.GA3662482-robh@kernel.org>
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


On 9/10/25 08:06, Rob Herring wrote:
> On Tue, Sep 09, 2025 at 11:16:22AM +0530, Harikrishna Shenoy wrote:
>> From: Swapnil Jakhade <sjakhade@cadence.com>
>>
>> Add binding changes for DSC(Display Stream Compression) in the MHDP8546
>> DPI/DP bridge.
>>
>> Signed-off-by: Swapnil Jakhade <sjakhade@cadence.com>
>> Signed-off-by: Harikrishna Shenoy <h-shenoy@ti.com>
>> ---
>> Changelog v3 -> v4:
>> -Remove maxItems as item list is mentioned for reg-names, resolves
>> dt_bindings_check warning.
>> Log link- <https://gist.github.com/h-shenoy/5391ea514bb58a6cba3f39248d20916b>
>> Link to v3- https://lore.kernel.org/all/20250908054609.1113360-1-h-shenoy@ti.com/
>>
>>   .../bindings/display/bridge/cdns,mhdp8546.yaml | 18 ++++++++++++++----
>>   1 file changed, 14 insertions(+), 4 deletions(-)
>>
>> diff --git a/Documentation/devicetree/bindings/display/bridge/cdns,mhdp8546.yaml b/Documentation/devicetree/bindings/display/bridge/cdns,mhdp8546.yaml
>> index c2b369456e4e..b40630de6d89 100644
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
>> +      - const: dsc
>>   
>>     clocks:
>>       maxItems: 1
>> @@ -100,18 +103,25 @@ allOf:
>>         properties:
>>           reg:
>>             minItems: 2
>> -          maxItems: 3
>> +          maxItems: 4
>>           reg-names:
>>             minItems: 2
>> -          maxItems: 3
>> +          items:
>> +            - const: mhdptx
>> +            - const: j721e-intg
>> +            - const: mhdptx-sapb
>> +            - const: dsc
>>       else:
>>         properties:
>>           reg:
>>             minItems: 1
>> -          maxItems: 2
>> +          maxItems: 3
>>           reg-names:
>>             minItems: 1
>> -          maxItems: 2
>> +          items:
>> +            - const: mhdptx
>> +            - const: mhdptx-sapb
>> +            - const: dsc
> Still obviously not tested with a DT having this. Because this
> contradicts the top-level schema. Both cannot be true.
>
> Rob
Will update and test with the other compatible on some dummy dt and 
share logs
