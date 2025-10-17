Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 34EBCBE8306
	for <lists+dri-devel@lfdr.de>; Fri, 17 Oct 2025 12:58:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2F36E10E00C;
	Fri, 17 Oct 2025 10:58:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=ti.com header.i=@ti.com header.b="fiYzf6Qp";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fllvem-ot03.ext.ti.com (fllvem-ot03.ext.ti.com [198.47.19.245])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7055710E00C
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Oct 2025 10:58:45 +0000 (UTC)
Received: from fllvem-sh03.itg.ti.com ([10.64.41.86])
 by fllvem-ot03.ext.ti.com (8.15.2/8.15.2) with ESMTP id 59HAwOol252484;
 Fri, 17 Oct 2025 05:58:24 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1760698704;
 bh=KTD192e+GHwuTmB/AOyJZZkgH94hw9SU/1NoyZZJevE=;
 h=Date:Subject:From:To:CC:References:In-Reply-To;
 b=fiYzf6QpiDzcdgAB4Yzy6YXrIRbHZzqmWBTidch/tF3LHnuU94Is7ZNWwiZJidBHe
 x7CV6vKCWnOh5j/QHRDyCohtWK1PgdlpKQtIhaK4NNvhq4hFt6J5WhfcjHcN5G/IRX
 r0cLchne4HJyiezJ4yG5oH1CJb6bZYQkCwcuiXTw=
Received: from DLEE205.ent.ti.com (dlee205.ent.ti.com [157.170.170.85])
 by fllvem-sh03.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 59HAwOVW2358912
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
 Fri, 17 Oct 2025 05:58:24 -0500
Received: from DLEE214.ent.ti.com (157.170.170.117) by DLEE205.ent.ti.com
 (157.170.170.85) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Fri, 17 Oct
 2025 05:58:23 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE214.ent.ti.com
 (157.170.170.117) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Fri, 17 Oct 2025 05:58:23 -0500
Received: from [172.24.235.208] (hkshenoy.dhcp.ti.com [172.24.235.208])
 by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 59HAwF6J1183031;
 Fri, 17 Oct 2025 05:58:16 -0500
Message-ID: <8ace674c-9d57-4500-b155-caa662903774@ti.com>
Date: Fri, 17 Oct 2025 16:28:15 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 1/2] dt-bindings: drm/bridge: MHDP8546 bridge binding
 changes for DSC
From: Harikrishna shenoy <h-shenoy@ti.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
CC: <andrzej.hajda@intel.com>, <neil.armstrong@linaro.org>, <rfoss@kernel.org>,
 <Laurent.pinchart@ideasonboard.com>, <jonas@kwiboo.se>,
 <jernej.skrabec@gmail.com>, <airlied@gmail.com>, <simona@ffwll.ch>,
 <maarten.lankhorst@linux.intel.com>, <mripard@kernel.org>,
 <tzimmermann@suse.de>, <robh@kernel.org>, <krzk+dt@kernel.org>,
 <conor+dt@kernel.org>, <sjakhade@cadence.com>, <yamonkar@cadence.com>,
 <lumag@kernel.org>, <dianders@chromium.org>, <jani.nikula@intel.com>,
 <luca.ceresoli@bootlin.com>, <andy.yan@rock-chips.com>,
 <dri-devel@lists.freedesktop.org>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <devarsht@ti.com>, <u-kumar1@ti.com>,
 <s-jain1@ti.com>, <tomi.valkeinen@ideasonboard.com>
References: <20250915103041.3891448-1-h-shenoy@ti.com>
 <20250915103041.3891448-2-h-shenoy@ti.com>
 <20250918-dandelion-guan-of-storm-fa2051@kuoka>
 <d2367789-6b54-4fc2-bb7c-609c0fe084d3@ti.com>
Content-Language: en-US
In-Reply-To: <d2367789-6b54-4fc2-bb7c-609c0fe084d3@ti.com>
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



On 22/09/25 13:11, Harikrishna Shenoy wrote:
> 
> 
> On 9/18/25 07:00, Krzysztof Kozlowski wrote:
>> On Mon, Sep 15, 2025 at 04:00:40PM +0530, Harikrishna Shenoy wrote:
>>> From: Swapnil Jakhade<sjakhade@cadence.com>
>>>
>>> Add binding changes for DSC(Display Stream Compression) in the MHDP8546
>>> DPI/DP bridge.
>>>
>>> Signed-off-by: Swapnil Jakhade<sjakhade@cadence.com>
>>> Signed-off-by: Harikrishna Shenoy<h-shenoy@ti.com>
>>> ---
>>>   .../display/bridge/cdns,mhdp8546.yaml         | 24 ++++++++++++-------
>>>   1 file changed, 15 insertions(+), 9 deletions(-)
>>>
>>> diff --git a/Documentation/devicetree/bindings/display/bridge/cdns,mhdp8546.yaml b/Documentation/devicetree/bindings/display/bridge/cdns,mhdp8546.yaml
>>> index c2b369456e4e..2a05a7d5847f 100644
>>> --- a/Documentation/devicetree/bindings/display/bridge/cdns,mhdp8546.yaml
>>> +++ b/Documentation/devicetree/bindings/display/bridge/cdns,mhdp8546.yaml
>>> @@ -27,13 +27,12 @@ properties:
>>>             Register block for DSS_EDP0_INTG_CFG_VP registers in case of TI J7 SoCs.
>>>         - description:
>>>             Register block of mhdptx sapb registers.
>>> +      - description:
>>> +          Register block for mhdptx DSC encoder registers.
>>>   
>>>     reg-names:
>>> -    minItems: 1
>>> -    items:
>>> -      - const: mhdptx
>>> -      - const: j721e-intg
>>> -      - const: mhdptx-sapb
>>> +    description:
>>> +      Names corresponding to entries in the reg property.
>> No, top-level should have broadest constraints. In your case it is
>> min/maxItems.
>>
>> Description is completely redundant. Wasn't here before, so why adding
>> it?
>>
> Noted, will remove description and add minItems:1.
>>>   
>>>     clocks:
>>>       maxItems: 1
>>> @@ -100,18 +99,25 @@ allOf:
>>>         properties:
>>>           reg:
>>>             minItems: 2
>>> -          maxItems: 3
>>> +          maxItems: 4
>>>           reg-names:
>>>             minItems: 2
>>> -          maxItems: 3
>>> +          items:
>>> +            - const: mhdptx
>>> +            - const: j721e-intg
>>> +            - const: mhdptx-sapb
>>> +            - const: dsc
>>>       else:
>>>         properties:
>>>           reg:
>>>             minItems: 1
>>> -          maxItems: 2
>>> +          maxItems: 3
>>>           reg-names:
>>>             minItems: 1
>>> -          maxItems: 2
>>> +          items:
>>> +            - const: mhdptx
>>> +            - const: mhdptx-sapb
>> This is wrong. Previously CDNS variant had two items means it had
>> "j721e-intg". Now it's something else.
>>
>> First, this is an ABI break.
>>
>> Second, there is no explanation at all for it in the commit msg! Looks
>> like random change.
>>
>> Read carefully writing-bindings doc.
>>
>> Best regards,
>> Krzysztof
>>
> 
> Hi Krzysztof,
> 
> 
> Keeping this patch series aside, The existing binding-docs clearly have 
> a bug.
> 
> Since even for cadence specific compatible "cdns,mhdp8546" it 
> compulsorily expects "j721e-intg" register space
> 
> which is NOT part of the cadence IP block mhdp8546 and hence not 
> applicable to "cdns,mhdp8546".
> 
> This was also discussed here [1] and can also be referred in this TRM 
> section [2],
> 
> which clearly show that "j721e-intg" is part of TI wrapper IP block and 
> should be
> 
> applicable to "ti,j721e-mhdp8546" compatible.
> 
> Yes agreed it breaks the ABI but it also fixes a bug and I don't see any 
> one using only "cdns,mhdp8546" yet.
> 
> so I am thinking it's more appropriate to fix this as a separate patch 
> independent of this series.
> 
> Kindly let me know if I should submit a separate patch to fix this bug 
> or I should just ignore this bug.
> 
> Depending on your suggestion, if it's agreed upon to send the bug fix 
> patch first, I will send out an independent
> 
> bug fix to remove "j721e-intg" for compatible "cdns,mhdp8546" and then 
> rebase the series for adding DSC reg blocks
> 
> on top of bug fix.
> 
> [1]: https://lore.kernel.org/all/20250903220312.GA2903503- 
> robh@kernel.org/ <https://lore.kernel.org/all/20250903220312.GA2903503- 
> robh@kernel.org/>
> [2]: Link to TRM ZIP:https://www.ti.com/lit/zip/spruil1 <https:// 
> www.ti.com/lit/zip/spruil1>
> Table 2-1. MAIN Domain Memory Map
> DSS_EDP0_V2A_CORE_VP_REGS_APB are EDP core register identified by name 
> mhdptx in DT.
> DSS_EDP0_INTG_CFG_VP identified by j721e-intg in DT.
> 
> Section 12.6.6.16.4: EDP_CFG Registers
> 
> Driver use: TI j721e Cadence MHDP8546 DP wrapper(drivers/gpu/drm/bridge/ 
> cadence/cdns-mhdp8546-j721e.c)
> 
> 
> Regards.

Hi Krzysztof,

Could you please let us know your thoughts on above, will re-spin it 
accordingly.

Regards.

> 

