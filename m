Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CA97279D5C5
	for <lists+dri-devel@lfdr.de>; Tue, 12 Sep 2023 18:06:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 15D1C10E437;
	Tue, 12 Sep 2023 16:06:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id D6E0B10E437
 for <dri-devel@lists.freedesktop.org>; Tue, 12 Sep 2023 16:06:09 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 6143AC15;
 Tue, 12 Sep 2023 09:06:46 -0700 (PDT)
Received: from [10.1.196.40] (e121345-lin.cambridge.arm.com [10.1.196.40])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 517A53F738;
 Tue, 12 Sep 2023 09:06:06 -0700 (PDT)
Message-ID: <e6f236aa-4a16-baf0-6567-1714248e2fc0@arm.com>
Date: Tue, 12 Sep 2023 17:05:56 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux aarch64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.0
Subject: Re: [PATCH 8/9] dt-bindings: reserved-memory: MediaTek: Add reserved
 memory for SVP
Content-Language: en-GB
To: Rob Herring <robh@kernel.org>
References: <20230911023038.30649-1-yong.wu@mediatek.com>
 <20230911023038.30649-9-yong.wu@mediatek.com>
 <20230911154448.GA1279317-robh@kernel.org>
 <c2f1df12cc2dc25b342029e49c6d3f120d380b47.camel@mediatek.com>
 <c62a7ed8-d80a-3a82-040a-d4c74a71285a@linaro.org>
 <95f9dd3b-1f33-4af5-8757-a97e8b9bb216@arm.com>
 <20230912155338.GA842444-robh@kernel.org>
From: Robin Murphy <robin.murphy@arm.com>
In-Reply-To: <20230912155338.GA842444-robh@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
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
Cc: "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "conor+dt@kernel.org" <conor+dt@kernel.org>,
 "benjamin.gaignard@collabora.com" <benjamin.gaignard@collabora.com>,
 =?UTF-8?B?S3VvaG9uZyBXYW5nICjnjovlnIvptLsp?= <kuohong.wang@mediatek.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "christian.koenig@amd.com" <christian.koenig@amd.com>,
 "linaro-mm-sig@lists.linaro.org" <linaro-mm-sig@lists.linaro.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 "jstultz@google.com" <jstultz@google.com>,
 =?UTF-8?B?SmlhbmppYW8gWmVuZyAo5pu+5YGl5aejKQ==?= <Jianjiao.Zeng@mediatek.com>,
 "krzysztof.kozlowski+dt@linaro.org" <krzysztof.kozlowski+dt@linaro.org>,
 "matthias.bgg@gmail.com" <matthias.bgg@gmail.com>,
 "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
 "tjmercier@google.com" <tjmercier@google.com>,
 "angelogioacchino.delregno@collabora.com"
 <angelogioacchino.delregno@collabora.com>,
 "sumit.semwal@linaro.org" <sumit.semwal@linaro.org>,
 =?UTF-8?B?WW9uZyBXdSAo5ZC05YuHKQ==?= <Yong.Wu@mediatek.com>,
 "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 12/09/2023 4:53 pm, Rob Herring wrote:
> On Tue, Sep 12, 2023 at 11:13:50AM +0100, Robin Murphy wrote:
>> On 12/09/2023 9:28 am, Krzysztof Kozlowski wrote:
>>> On 12/09/2023 08:16, Yong Wu (吴勇) wrote:
>>>> Hi Rob,
>>>>
>>>> Thanks for your review.
>>>>
>>>> On Mon, 2023-09-11 at 10:44 -0500, Rob Herring wrote:
>>>>>    	
>>>>> External email : Please do not click links or open attachments until
>>>>> you have verified the sender or the content.
>>>>>    On Mon, Sep 11, 2023 at 10:30:37AM +0800, Yong Wu wrote:
>>>>>> This adds the binding for describing a CMA memory for MediaTek
>>>>> SVP(Secure
>>>>>> Video Path).
>>>>>
>>>>> CMA is a Linux thing. How is this related to CMA?
>>>>
>>>>>>
>>>>>> Signed-off-by: Yong Wu <yong.wu@mediatek.com>
>>>>>> ---
>>>>>>    .../mediatek,secure_cma_chunkmem.yaml         | 42
>>>>> +++++++++++++++++++
>>>>>>    1 file changed, 42 insertions(+)
>>>>>>    create mode 100644 Documentation/devicetree/bindings/reserved-
>>>>> memory/mediatek,secure_cma_chunkmem.yaml
>>>>>>
>>>>>> diff --git a/Documentation/devicetree/bindings/reserved-
>>>>> memory/mediatek,secure_cma_chunkmem.yaml
>>>>> b/Documentation/devicetree/bindings/reserved-
>>>>> memory/mediatek,secure_cma_chunkmem.yaml
>>>>>> new file mode 100644
>>>>>> index 000000000000..cc10e00d35c4
>>>>>> --- /dev/null
>>>>>> +++ b/Documentation/devicetree/bindings/reserved-
>>>>> memory/mediatek,secure_cma_chunkmem.yaml
>>>>>> @@ -0,0 +1,42 @@
>>>>>> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
>>>>>> +%YAML 1.2
>>>>>> +---
>>>>>> +$id:
>>>>> http://devicetree.org/schemas/reserved-memory/mediatek,secure_cma_chunkmem.yaml#
>>>>>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>>>>>> +
>>>>>> +title: MediaTek Secure Video Path Reserved Memory
>>>>>
>>>>> What makes this specific to Mediatek? Secure video path is fairly
>>>>> common, right?
>>>>
>>>> Here we just reserve a buffer and would like to create a dma-buf secure
>>>> heap for SVP, then the secure engines(Vcodec and DRM) could prepare
>>>> secure buffer through it.
>>>> But the heap driver is pure SW driver, it is not platform device and
>>>
>>> All drivers are pure SW.
>>>
>>>> we don't have a corresponding HW unit for it. Thus I don't think I
>>>> could create a platform dtsi node and use "memory-region" pointer to
>>>> the region. I used RESERVEDMEM_OF_DECLARE currently(The code is in
>>>> [9/9]). Sorry if this is not right.
>>>
>>> If this is not for any hardware and you already understand this (since
>>> you cannot use other bindings) then you cannot have custom bindings for
>>> it either.
>>>
>>>>
>>>> Then in our usage case, is there some similar method to do this? or
>>>> any other suggestion?
>>>
>>> Don't stuff software into DTS.
>>
>> Aren't most reserved-memory bindings just software policy if you look at it
>> that way, though? IIUC this is a pool of memory that is visible and
>> available to the Non-Secure OS, but is fundamentally owned by the Secure
>> TEE, and pages that the TEE allocates from it will become physically
>> inaccessible to the OS. Thus the platform does impose constraints on how the
>> Non-Secure OS may use it, and per the rest of the reserved-memory bindings,
>> describing it as a "reusable" reservation seems entirely appropriate. If
>> anything that's *more* platform-related and so DT-relevant than typical
>> arbitrary reservations which just represent "save some memory to dedicate to
>> a particular driver" and don't actually bear any relationship to firmware or
>> hardware at all.
> 
> Yes, a memory range defined by hardware or firmware is within scope of
> DT. (CMA at aribitrary address was questionable.)
> 
> My issue here is more that 'secure video memory' is not any way Mediatek
> specific. AIUI, it's a requirement from certain content providers for
> video playback to work. So why the Mediatek specific binding?

Based on the implementation, I'd ask the question the other way round - 
the way it works looks to be at least somewhat dependent on Mediatek's 
TEE, in ways where other vendors' equivalent implementations may be 
functionally incompatible, however nothing suggests it's actually 
specific to video (beyond that presumably being the primary use-case 
they had in mind).

Thanks,
Robin.
