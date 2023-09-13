Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9878979E2CB
	for <lists+dri-devel@lfdr.de>; Wed, 13 Sep 2023 10:58:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DFD3B10E05D;
	Wed, 13 Sep 2023 08:58:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x536.google.com (mail-ed1-x536.google.com
 [IPv6:2a00:1450:4864:20::536])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3B56C10E05D
 for <dri-devel@lists.freedesktop.org>; Wed, 13 Sep 2023 08:58:43 +0000 (UTC)
Received: by mail-ed1-x536.google.com with SMTP id
 4fb4d7f45d1cf-51e28cac164so1503643a12.1
 for <dri-devel@lists.freedesktop.org>; Wed, 13 Sep 2023 01:58:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1694595521; x=1695200321; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=Vc1DY5wzwzaibqui8TMdK8lO4RUiDXh6n26JHSshLyk=;
 b=hWYylbk5xn15f+Hoy7sR9ch/K921epw9UsV2ZL79UgaeevAB5jv+AGnRnKOB6GCoZq
 ABYNxkj3uq6vDMzFLGeY5DeheaEBc1qJnOLodpH5HJlaj2iaxWhaHT8cpfYem9PgPDCl
 TKREsMpXrzp8Jak+0ngEp9O9Eaal/iq2fpPU5ioRqIHV7D1Kk+LxdTTw69NJVOTORGTr
 BY4/gP4qZSF8ucJhddWwEwxvvGIhUWlWuITrdLlTqnXt5oyF+mbyocD70oZpTawyeft3
 Iq2angc6ktWNE0KawSXqGRhbCs7uGQDTJA9PAzKh33IwIiHXrWDmPlG68dONcttmcdQL
 d4jQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1694595521; x=1695200321;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Vc1DY5wzwzaibqui8TMdK8lO4RUiDXh6n26JHSshLyk=;
 b=V3uqq3JdAHIFZXIFouNoDCJn6bagoUQL6plGA0foYP/TDbBJfKpBhf+lPvhqV3C6w6
 8/FL/1lTFajFAU47Fg5BZAEcg2/08deocUPoob7IlxL8t6EuAlH8gMX5v9QnVLg5uSFr
 k7iSWvtOyNpxGVnVyvXdNPHEJjHApFfsRzNI1HlEyL9ADX/r47yW6fFKfIametAn1ixn
 U+quhi1uEdCr/Cjf52QLY6nXZDts0dc0JiDg7WbfFVXhPgCUarry6Dwrfw7la+YONsLf
 VaIfq0T6nTToGkGf6bIcZMqYe7iLers/ya31nkwZYLfB4q4kHa8IIzQG2BY1xf3ROXsW
 MpLA==
X-Gm-Message-State: AOJu0YwnwiKxxl+JjrsE7mHuNGJDxRvtXYrPm1K7Ip1DrolK2Y4xvpFn
 tq0Enu1ajpsq5WzcZSIh0L9Irw==
X-Google-Smtp-Source: AGHT+IGmJS6RbMoHG5npa8M9J1HCW+qcpAcwXT+onT2fFYSrjW4H0h6ONgbWtYQVCYNkV70DiYAXSA==
X-Received: by 2002:aa7:d8d0:0:b0:523:b37e:b83b with SMTP id
 k16-20020aa7d8d0000000b00523b37eb83bmr3001054eds.13.1694595521375; 
 Wed, 13 Sep 2023 01:58:41 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.214.188])
 by smtp.gmail.com with ESMTPSA id
 w7-20020aa7d287000000b0052a063e52b8sm6952013edq.83.2023.09.13.01.58.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 13 Sep 2023 01:58:40 -0700 (PDT)
Message-ID: <c0cf592a-3cde-4bad-431b-6d80c1970638@linaro.org>
Date: Wed, 13 Sep 2023 10:58:38 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.0
Subject: Re: [PATCH v5 3/3] dt-binding: mediatek: add MediaTek mt8195 MDP3
 components
Content-Language: en-US
To: =?UTF-8?B?TW91ZHkgSG8gKOS9leWul+WOnyk=?= <Moudy.Ho@mediatek.com>,
 "robh+dt@kernel.org" <robh+dt@kernel.org>,
 "chunkuang.hu@kernel.org" <chunkuang.hu@kernel.org>,
 "mchehab@kernel.org" <mchehab@kernel.org>, "daniel@ffwll.ch"
 <daniel@ffwll.ch>, "p.zabel@pengutronix.de" <p.zabel@pengutronix.de>,
 "conor+dt@kernel.org" <conor+dt@kernel.org>,
 "hverkuil-cisco@xs4all.nl" <hverkuil-cisco@xs4all.nl>,
 "airlied@gmail.com" <airlied@gmail.com>,
 "krzysztof.kozlowski+dt@linaro.org" <krzysztof.kozlowski+dt@linaro.org>,
 "matthias.bgg@gmail.com" <matthias.bgg@gmail.com>
References: <20230912075651.10693-1-moudy.ho@mediatek.com>
 <20230912075651.10693-4-moudy.ho@mediatek.com>
 <e4119fa6-a4b7-f59e-7115-044fa83c9063@linaro.org>
 <0b4f1ab2753d4fdb4934e8f76df6e584bba2d628.camel@mediatek.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <0b4f1ab2753d4fdb4934e8f76df6e584bba2d628.camel@mediatek.com>
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
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
 "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
 "angelogioacchino.delregno@collabora.com"
 <angelogioacchino.delregno@collabora.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 13/09/2023 10:39, Moudy Ho (何宗原) wrote:

>>> @@ -63,7 +64,6 @@ properties:
>>>  required:
>>>    - compatible
>>>    - reg
>>> -  - interrupts
>>
>> Why? commit msg tells nothing about it. Why interrupt is not erquired
>> in
>> mt8173? How dropping such requirement is anyhow related to mt8195?
>>
>>
> The signals of the MDP engines are completely controlled by MTK's MUTEX
> for starting and stopping frame processing, eliminating the need for
> additional interrupts.

Then it does not look like related to this patch at all.

...

>>>  
>>>    reg:
>>>      maxItems: 1
>>> @@ -50,17 +51,19 @@ properties:
>>>      maxItems: 1
>>>  
>>>    clocks:
>>> -    items:
>>> -      - description: RDMA clock
>>> -      - description: RSZ clock
>>> +    oneOf:
>>> +      - items:
>>> +          - description: RDMA clock
>>> +          - description: SRAM shared component clock
>>> +      - items:
>>> +          - description: RDMA clock
>>
>> Why now mt8183 can have SRAM clock optional? How changing mt8183 is
>> related to this patch?
>>
>> I'll finish the review, sorry fix basics here.
>>
>> Best regards,
>> Krzysztof
>>
> The RDMA of only the 8183 needed to share SRMA with other component due
> to the old desgin.
> I attempted to describe both the situation of the 8183 and new designs
> like the 8195, but it appears that this writing style may lead to
> misunderstandings.
> I am unsure if there are any ways to enhance it.

Just like many other bindings, just look at Qualcomm, use allOf to
restrict entries per variants.

Best regards,
Krzysztof

