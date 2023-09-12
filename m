Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8318179C9E9
	for <lists+dri-devel@lfdr.de>; Tue, 12 Sep 2023 10:28:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BCF2E10E3B9;
	Tue, 12 Sep 2023 08:28:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x633.google.com (mail-ej1-x633.google.com
 [IPv6:2a00:1450:4864:20::633])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0F15A10E3B9
 for <dri-devel@lists.freedesktop.org>; Tue, 12 Sep 2023 08:28:40 +0000 (UTC)
Received: by mail-ej1-x633.google.com with SMTP id
 a640c23a62f3a-99c1c66876aso679579966b.2
 for <dri-devel@lists.freedesktop.org>; Tue, 12 Sep 2023 01:28:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1694507318; x=1695112118; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=VLzVKDkkOXZ4N+LBDosJ9GVpBHoDNwCkMSqFqUtTQYE=;
 b=d76qqCeE37ewfCRCavwstP5cbyt79zVLP0i+m+96OVvEfmQ6rAveSmaYybd7/opx40
 ePlz/Lw93djNXVTkeVhX34vPyBF5LFeYsNDrX+pK85y+510Pta6jwLlR4COHx5zLlCOm
 BhRRW3EKOTe800kgJY/JGUwRTeny5sbu9k75+H/gmYZa7nmEp3WA5TKVRUxLIF9LB0nK
 kcMWiZkas3rnVw1v0rIawsWeKmpY4j/T1Jt8pUDcJJWNnRhJ4Ay05bWk+41T4qMf5WAv
 oD52n5ZuPs5S0HhgCRW8/rgBekaErg2zHltj1tcaALHMZHVZdoa8/DZAkqYtCznmQXTY
 J2mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1694507318; x=1695112118;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=VLzVKDkkOXZ4N+LBDosJ9GVpBHoDNwCkMSqFqUtTQYE=;
 b=TmwSa02gP9plsglhKAKXA3TFd8PWz79uNPWFU8EptY7a/mRHOMY2BxH+sbPJ1znagr
 tDMZqv4fHrqShDqCXC1LAn8MyIOxQ7jjxR1vSBAD+64/Tn6B6jmY4OW4e++aTa9K5BrJ
 BIFY9FHFMwjDQKc5XrYwajGsYOr7SyVY0Bxb5MFisgNfNVM13elDPjPCiRzTT/CTv4rh
 NClzJ7NUE11Tyos7k8c2Zz0T3KnxH6eNht5uQsyr/AVGoc4iaQ7Kf4SQzOpPGIWNwRdY
 +7dVZmrGuxpJ1JFpOMLX5E5iHeoubRY7RsWq4Giendn9EpyZTOmS7eJ2Tc8zWycX4EG3
 nKbA==
X-Gm-Message-State: AOJu0Yzap/hwpZh8LGh0NCO7YCIg4XbaYpi5oNLrhWSdRYxt4eYL+bzI
 VRbBtxUS+IsY1E9FG7+i0qgIQQ==
X-Google-Smtp-Source: AGHT+IHki0HI2dzDOWH07bBWQQqpwLHYoRHu3OffIZhdj/Y17PLOWS/fEeXHSa+TXIl8iuit84dkTA==
X-Received: by 2002:a17:907:2ccb:b0:9a9:ee3d:48e3 with SMTP id
 hg11-20020a1709072ccb00b009a9ee3d48e3mr9692911ejc.12.1694507318462; 
 Tue, 12 Sep 2023 01:28:38 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.214.188])
 by smtp.gmail.com with ESMTPSA id
 q18-20020a170906a09200b0099b8234a9fesm6507600ejy.1.2023.09.12.01.28.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 12 Sep 2023 01:28:37 -0700 (PDT)
Message-ID: <c62a7ed8-d80a-3a82-040a-d4c74a71285a@linaro.org>
Date: Tue, 12 Sep 2023 10:28:35 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.0
Subject: Re: [PATCH 8/9] dt-bindings: reserved-memory: MediaTek: Add reserved
 memory for SVP
Content-Language: en-US
To: =?UTF-8?B?WW9uZyBXdSAo5ZC05YuHKQ==?= <Yong.Wu@mediatek.com>,
 "robh@kernel.org" <robh@kernel.org>
References: <20230911023038.30649-1-yong.wu@mediatek.com>
 <20230911023038.30649-9-yong.wu@mediatek.com>
 <20230911154448.GA1279317-robh@kernel.org>
 <c2f1df12cc2dc25b342029e49c6d3f120d380b47.camel@mediatek.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <c2f1df12cc2dc25b342029e49c6d3f120d380b47.camel@mediatek.com>
Content-Type: text/plain; charset=UTF-8
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
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "conor+dt@kernel.org" <conor+dt@kernel.org>,
 "benjamin.gaignard@collabora.com" <benjamin.gaignard@collabora.com>,
 =?UTF-8?B?S3VvaG9uZyBXYW5nICjnjovlnIvptLsp?= <kuohong.wang@mediatek.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "sumit.semwal@linaro.org" <sumit.semwal@linaro.org>,
 "linaro-mm-sig@lists.linaro.org" <linaro-mm-sig@lists.linaro.org>,
 "jstultz@google.com" <jstultz@google.com>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
 "krzysztof.kozlowski+dt@linaro.org" <krzysztof.kozlowski+dt@linaro.org>,
 "matthias.bgg@gmail.com" <matthias.bgg@gmail.com>,
 "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
 "tjmercier@google.com" <tjmercier@google.com>,
 "angelogioacchino.delregno@collabora.com"
 <angelogioacchino.delregno@collabora.com>,
 "christian.koenig@amd.com" <christian.koenig@amd.com>,
 =?UTF-8?B?SmlhbmppYW8gWmVuZyAo5pu+5YGl5aejKQ==?= <Jianjiao.Zeng@mediatek.com>,
 "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 12/09/2023 08:16, Yong Wu (吴勇) wrote:
> Hi Rob,
> 
> Thanks for your review.
> 
> On Mon, 2023-09-11 at 10:44 -0500, Rob Herring wrote:
>>  	 
>> External email : Please do not click links or open attachments until
>> you have verified the sender or the content.
>>  On Mon, Sep 11, 2023 at 10:30:37AM +0800, Yong Wu wrote:
>>> This adds the binding for describing a CMA memory for MediaTek
>> SVP(Secure
>>> Video Path).
>>
>> CMA is a Linux thing. How is this related to CMA?
> 
>>>
>>> Signed-off-by: Yong Wu <yong.wu@mediatek.com>
>>> ---
>>>  .../mediatek,secure_cma_chunkmem.yaml         | 42
>> +++++++++++++++++++
>>>  1 file changed, 42 insertions(+)
>>>  create mode 100644 Documentation/devicetree/bindings/reserved-
>> memory/mediatek,secure_cma_chunkmem.yaml
>>>
>>> diff --git a/Documentation/devicetree/bindings/reserved-
>> memory/mediatek,secure_cma_chunkmem.yaml
>> b/Documentation/devicetree/bindings/reserved-
>> memory/mediatek,secure_cma_chunkmem.yaml
>>> new file mode 100644
>>> index 000000000000..cc10e00d35c4
>>> --- /dev/null
>>> +++ b/Documentation/devicetree/bindings/reserved-
>> memory/mediatek,secure_cma_chunkmem.yaml
>>> @@ -0,0 +1,42 @@
>>> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
>>> +%YAML 1.2
>>> +---
>>> +$id: 
>> http://devicetree.org/schemas/reserved-memory/mediatek,secure_cma_chunkmem.yaml#
>>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>>> +
>>> +title: MediaTek Secure Video Path Reserved Memory
>>
>> What makes this specific to Mediatek? Secure video path is fairly 
>> common, right?
> 
> Here we just reserve a buffer and would like to create a dma-buf secure
> heap for SVP, then the secure engines(Vcodec and DRM) could prepare
> secure buffer through it.
>  
> But the heap driver is pure SW driver, it is not platform device and

All drivers are pure SW.

> we don't have a corresponding HW unit for it. Thus I don't think I
> could create a platform dtsi node and use "memory-region" pointer to
> the region. I used RESERVEDMEM_OF_DECLARE currently(The code is in 
> [9/9]). Sorry if this is not right.

If this is not for any hardware and you already understand this (since
you cannot use other bindings) then you cannot have custom bindings for
it either.

> 
> Then in our usage case, is there some similar method to do this? or
> any other suggestion?

Don't stuff software into DTS.

Best regards,
Krzysztof

