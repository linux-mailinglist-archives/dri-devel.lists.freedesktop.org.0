Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B6CC16C6841
	for <lists+dri-devel@lfdr.de>; Thu, 23 Mar 2023 13:26:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8395210E040;
	Thu, 23 Mar 2023 12:26:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BB4FB10E040
 for <dri-devel@lists.freedesktop.org>; Thu, 23 Mar 2023 12:26:53 +0000 (UTC)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
 by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 32NCQUZh104782;
 Thu, 23 Mar 2023 07:26:30 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1679574390;
 bh=aKqINq5Ot9zplt5xAt4YKK+ybHwjeTQa8lKUsA3qixk=;
 h=Date:Subject:To:CC:References:From:In-Reply-To;
 b=fyxuZrWH2Gwgs+Q69WsAEbi9lok+EwZV5LFFTy39ebtdnnI2VqaZQA/qr1hV3/nqP
 aTSyWa1EoZotFEBH1yGm1ei7hA1pbSK5KAo92jYG/VEI/HRJ6O6PzLWbThAQvAOlwx
 ugOo1e9s9stRrXpTQOMuE2zwdU6Z/RlG+UeVf3Yg=
Received: from DFLE103.ent.ti.com (dfle103.ent.ti.com [10.64.6.24])
 by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 32NCQUjb118598
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Thu, 23 Mar 2023 07:26:30 -0500
Received: from DFLE112.ent.ti.com (10.64.6.33) by DFLE103.ent.ti.com
 (10.64.6.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.16; Thu, 23
 Mar 2023 07:26:29 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DFLE112.ent.ti.com
 (10.64.6.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.16 via
 Frontend Transport; Thu, 23 Mar 2023 07:26:29 -0500
Received: from [172.24.145.176] (ileaxei01-snat2.itg.ti.com [10.180.69.6])
 by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 32NCQMRW009091;
 Thu, 23 Mar 2023 07:26:23 -0500
Message-ID: <5cae1874-9c10-a909-906c-160ce3f91286@ti.com>
Date: Thu, 23 Mar 2023 17:56:21 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH 1/2] dt-bindings: drm/bridge: Add no-hpd property
Content-Language: en-US
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 <dri-devel@lists.freedesktop.org>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>
References: <20230316140823.234263-1-j-choudhary@ti.com>
 <20230316140823.234263-2-j-choudhary@ti.com>
 <dbc43c09-f8ec-f877-598a-adff47d44b0e@linaro.org>
 <79ce5fe8-9fb0-5caa-67a0-87dee7867856@ti.com>
 <55cfacf6-03e0-b9bc-83f3-3e9f2d7b2d4d@linaro.org>
 <d72bf0df-28d7-6419-56a5-58e04dcb30f2@ti.com>
 <d8be08b9-3043-d517-b5b8-86ea7a602e0b@linaro.org>
From: Jayesh Choudhary <j-choudhary@ti.com>
In-Reply-To: <d8be08b9-3043-d517-b5b8-86ea7a602e0b@linaro.org>
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
Cc: andrzej.hajda@intel.com, tomi.valkeinen@ideasonboard.com,
 Laurent.pinchart@ideasonboard.com, krzysztof.kozlowski+dt@linaro.org,
 sam@ravnborg.org, r-ravikumar@ti.com, rfoss@kernel.org, a-bhatia1@ti.com,
 javierm@redhat.com, jernej.skrabec@gmail.com, sjakhade@cadence.com,
 tzimmermann@suse.de, jonas@kwiboo.se, jani.nikula@intel.com,
 robh+dt@kernel.org, neil.armstrong@linaro.org, yamonkar@cadence.com,
 alexander.deucher@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 21/03/23 20:47, Krzysztof Kozlowski wrote:
> On 21/03/2023 15:28, Jayesh Choudhary wrote:
>>
>>
>> On 21/03/23 18:08, Krzysztof Kozlowski wrote:
>>> On 21/03/2023 13:02, Jayesh Choudhary wrote:
>>>>>
>>>>>> +    type: boolean
>>>>>> +    description:
>>>>>> +      Set if the HPD line on the bridge isn't hooked up to anything or is
>>>>>> +      otherwise unusable.
>>>>>
>>>>> It's the property of the panel, not bridge. Unless you want to say that
>>>>> bridge physically does not have HPD? Does it follow the standard in such
>>>>> case?
>>>>
>>>> MHDP does have hpd. But the mhdp driver should handle the cases when the
>>>
>>> This is about bindings, not driver. Your driver can still handle this as
>>> it wishes.
>>>
>>>> hpd pin of bridge is not connected to that of the DP-connector. This is
>>>> to add support for that. (optional property)
>>>
>>> Which is indicated by panel no-hpd, right?
>>
>> Actually no panel is involved in this. For TI SoC J721S2, the data
>> pipeline involves the bridge whose endpoint is directly the DP connector
>> with compatible 'dp-connector'. And in the binding dp-connector.yaml,
>> there isn't any 'no-hpd' property for this indication.
>>
>> Does this clarifies the issue? Or did I misinterpret your comment?
> 
> Yes, then you only need to narrow which hardware does not have HPD
> hooked up. Or at least clarify that it is not about driver having or not
> having HPD control...
> 

Okay. I will edit the commit message in v2. (after further review of the 
driver changes for this series)

I will mention that the mhdp bridge can work without its HPD pin hooked
up to the connector, but the current bridge driver throws an error when
hpd line is not connected to the connector. For such cases, using this 
optional property, we can bypass the hpd detection and instead use the 
auxiliary channels connected to the DP connector to confirm the connection.

Thanks,
-Jayesh


