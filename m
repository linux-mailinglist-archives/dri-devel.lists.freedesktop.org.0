Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DB0D27EB0B3
	for <lists+dri-devel@lfdr.de>; Tue, 14 Nov 2023 14:18:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D37D110E0EB;
	Tue, 14 Nov 2023 13:18:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id C733010E0EB
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Nov 2023 13:18:48 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 73274C15;
 Tue, 14 Nov 2023 05:19:33 -0800 (PST)
Received: from [10.1.196.40] (e121345-lin.cambridge.arm.com [10.1.196.40])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 98F5B3F6C4;
 Tue, 14 Nov 2023 05:18:43 -0800 (PST)
Message-ID: <3daaa2aa-61d4-40db-b36d-cd825a340d2b@arm.com>
Date: Tue, 14 Nov 2023 13:18:35 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 6/8] dt-bindings: reserved-memory: Add secure CMA
 reserved memory range
To: =?UTF-8?B?WW9uZyBXdSAo5ZC05YuHKQ==?= <Yong.Wu@mediatek.com>,
 "matthias.bgg@gmail.com" <matthias.bgg@gmail.com>,
 "christian.koenig@amd.com" <christian.koenig@amd.com>,
 "krzysztof.kozlowski@linaro.org" <krzysztof.kozlowski@linaro.org>,
 "robh+dt@kernel.org" <robh+dt@kernel.org>,
 "sumit.semwal@linaro.org" <sumit.semwal@linaro.org>
References: <20231111111559.8218-1-yong.wu@mediatek.com>
 <20231111111559.8218-7-yong.wu@mediatek.com>
 <0ccee72f-98ac-4a08-9253-9c22dad4d95a@linaro.org>
 <5d7b2458b8d1896ce575f4ed2d413f4e8eeb92b4.camel@mediatek.com>
Content-Language: en-GB
From: Robin Murphy <robin.murphy@arm.com>
In-Reply-To: <5d7b2458b8d1896ce575f4ed2d413f4e8eeb92b4.camel@mediatek.com>
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
Cc: "jkardatzke@google.com" <jkardatzke@google.com>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "conor+dt@kernel.org" <conor+dt@kernel.org>,
 "benjamin.gaignard@collabora.com" <benjamin.gaignard@collabora.com>,
 "ckoenig.leichtzumerken@gmail.com" <ckoenig.leichtzumerken@gmail.com>,
 "quic_vjitta@quicinc.com" <quic_vjitta@quicinc.com>,
 =?UTF-8?B?S3VvaG9uZyBXYW5nICjnjovlnIvptLsp?= <kuohong.wang@mediatek.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "nicolas@ndufresne.ca" <nicolas@ndufresne.ca>,
 "linaro-mm-sig@lists.linaro.org" <linaro-mm-sig@lists.linaro.org>,
 "joakim.bech@linaro.org" <joakim.bech@linaro.org>,
 "jstultz@google.com" <jstultz@google.com>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
 "krzysztof.kozlowski+dt@linaro.org" <krzysztof.kozlowski+dt@linaro.org>,
 "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
 "tjmercier@google.com" <tjmercier@google.com>,
 "angelogioacchino.delregno@collabora.com"
 <angelogioacchino.delregno@collabora.com>,
 =?UTF-8?B?SmlhbmppYW8gWmVuZyAo5pu+5YGl5aejKQ==?= <Jianjiao.Zeng@mediatek.com>,
 "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 13/11/2023 6:37 am, Yong Wu (吴勇) wrote:
[...]
>>> +properties:
>>> +  compatible:
>>> +    const: secure_cma_region
>>
>> Still wrong compatible. Look at other bindings - there is nowhere
>> underscore. Look at other reserved memory bindings especially.
>>
>> Also, CMA is a Linux thingy, so either not suitable for bindings at
>> all,
>> or you need Linux specific compatible. I don't quite get why do you
>> evennot
>> put CMA there - adding Linux specific stuff will get obvious
>> pushback...
> 
> Thanks. I will change to: secure-region. Is this ok?

No, the previous discussion went off in entirely the wrong direction. To 
reiterate, the point of the binding is not to describe the expected 
usage of the thing nor the general concept of the thing, but to describe 
the actual thing itself. There are any number of different ways software 
may interact with a "secure region", so that is meaningless as a 
compatible. It needs to describe *this* secure memory interface offered 
by *this* TEE, so that software knows that to use it requires making 
those particular SiP calls with that particular UUID etc.

Thanks,
Robin.
