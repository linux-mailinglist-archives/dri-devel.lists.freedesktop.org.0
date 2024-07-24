Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CB2293B5F2
	for <lists+dri-devel@lfdr.de>; Wed, 24 Jul 2024 19:28:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A4DB410E779;
	Wed, 24 Jul 2024 17:28:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=freebox-fr.20230601.gappssmtp.com header.i=@freebox-fr.20230601.gappssmtp.com header.b="O8EnzeeY";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com
 [209.85.128.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 96F1210E779
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Jul 2024 17:28:44 +0000 (UTC)
Received: by mail-wm1-f47.google.com with SMTP id
 5b1f17b1804b1-4279c924ca7so63685e9.2
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Jul 2024 10:28:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=freebox-fr.20230601.gappssmtp.com; s=20230601; t=1721842123; x=1722446923;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=Sg/nq8n4SP1vVkJBbHllFuHt6DH0ZuXLw1auy1fJN9I=;
 b=O8EnzeeYxglhb7i/TuDxwZU2RtAaguUhyk46/pB3oF8MP3apyr0jcKffb2zJZ1IHHc
 T3MmCuENOutbj9S9Ez6/DokCzN5H5QisFSQlaeKOzh3E58JQx05h0k9XmyPR8QYjyV2T
 HO8owlpfnfKZ0OkBqVuZtMlW7RD8A4x2gHvWW1qq9DhDrskm+m6Ok44Gv6+LHHZPs+Lw
 i+vrQtHbcnsCDTMB6KSYTTPRC1khLzu6UjZUvaK+X93prjzttsLlO5+wF0n2sW+MYd7I
 Ek7knWRPiPRx/W7O+/PLJyAXpb+E5o6iAtHd+8SaItw6wwM/Z10gpXpRNMOSySEbBgQI
 2bmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1721842123; x=1722446923;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Sg/nq8n4SP1vVkJBbHllFuHt6DH0ZuXLw1auy1fJN9I=;
 b=emJjNNprNnEzA9EXnhOfCcPauMi4WfKoWcpxxmx7FlYis5R6Dx5nrgSy/imms9DvDY
 xmc4ufxIw4VsmqGQntJnDqaAnQ14RzatZZ3IjrGQ4Y2Agm/xgbaX5tXK9C+lTHZ5ftXC
 2Xg7QhWQ8iHl0xHhUMc9gNdICibNYYHSICuwgQUgkLpqPh3J5AL4kj8c/hs9ziJ3Fs1d
 X6Z24dkHuZlzMUd/qCFa44iOm7oGhIMOO6BuRz41Wd0D6qn8BPg09cH4D145vvyDLpPc
 pibO+n0Is0We0KARqcb6uAGbVJLqhYX+rvXn7jWRU3yC6S5iRHS1CrG+c0EBIh2bSXQc
 IkAQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUqDu5XwfF5/F5kETov9JYUDlHGelIEyycJm6HBUBe+3JtfkjlGsoSGirW0+D6Ng58vve13wrz9zqqV5QuACpXmcfGW2cDpx+m34MG3DpKY
X-Gm-Message-State: AOJu0YxPaa4eQTcskgQ1s8auS+CxSI6UJi7fT6g1gMRWcr7AkAaUhVzj
 DC2lfwox0VtjsKV+H8suw9/AgXBDlv1gFSAAjQHTPWA9dUqxwR86hqMv9jxENwk=
X-Google-Smtp-Source: AGHT+IGdiRJOTRunJ2te0j0qGzCBOJF3slECMQfQgsBJys2FbWtVzHhpWFXxAWL/1q8InFZIf/QTqQ==
X-Received: by 2002:a5d:50ca:0:b0:369:b842:5082 with SMTP id
 ffacd0b85a97d-36b31a8aba3mr229192f8f.50.1721842122813; 
 Wed, 24 Jul 2024 10:28:42 -0700 (PDT)
Received: from ?IPV6:2a01:e34:ec24:52e0:fcff:6f45:dab:b3a8?
 ([2a01:e34:ec24:52e0:fcff:6f45:dab:b3a8])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-427f93ac157sm36274575e9.39.2024.07.24.10.28.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 24 Jul 2024 10:28:42 -0700 (PDT)
Message-ID: <2cd0af8d-aced-4460-95d0-376ecb783806@freebox.fr>
Date: Wed, 24 Jul 2024 19:28:41 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/2] dt-bindings: display: bridge: add TI TDP158
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Maxime Ripard <mripard@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Rob Herring <robh@kernel.org>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 Arnaud Vrac <avrac@freebox.fr>, Pierre-Hugues Husson <phhusson@freebox.fr>
References: <20240627-tdp158-v3-0-fb2fbc808346@freebox.fr>
 <20240627-tdp158-v3-1-fb2fbc808346@freebox.fr>
 <20240701-bug-of-great-honeydew-cfb6ef@houat>
 <e7bbbe4e-7deb-46c3-9cce-1922f9b6b3a2@freebox.fr>
 <20240708-ethereal-romantic-piculet-d4ae66@houat>
 <pp3rc5zob3xeghlatw4vnpzplc4yjpjadkea465zmhft55dyl5@3cpoc2zovftv>
 <20240715-shiny-enigmatic-firefly-2a6dec@houat>
 <f40de173-0c61-4400-87b2-51c171a52baa@freebox.fr>
 <j2ouvtywaasnkxq344rm4b6mrlqtu6bxlq4wrvz4fawzww3xad@yjp7k4zmfygu>
Content-Language: en-US
From: Marc Gonzalez <mgonzalez@freebox.fr>
In-Reply-To: <j2ouvtywaasnkxq344rm4b6mrlqtu6bxlq4wrvz4fawzww3xad@yjp7k4zmfygu>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
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

On 24/07/2024 19:25, Dmitry Baryshkov wrote:
> On Wed, Jul 24, 2024 at 07:18:39PM GMT, Marc Gonzalez wrote:
>> On 15/07/2024 16:42, Maxime Ripard wrote:
>>> On Mon, Jul 08, 2024 at 11:29:46PM GMT, Dmitry Baryshkov wrote:
>>>> On Mon, Jul 08, 2024 at 04:59:23PM GMT, Maxime Ripard wrote:
>>>>> On Mon, Jul 01, 2024 at 05:36:18PM GMT, Marc Gonzalez wrote:
>>>>>> On 01/07/2024 15:50, Maxime Ripard wrote:
>>>>>>
>>>>>>> On Thu, Jun 27, 2024 at 01:13:03PM GMT, Marc Gonzalez wrote:
>>>>>>>
>>>>>>>> TDP158 is an AC-coupled DVI / HDMI to TMDS level shifting Redriver.
>>>>>>>> It supports DVI 1.0, HDMI 1.4b and 2.0b.
>>>>>>>> It supports 4 TMDS channels, HPD, and a DDC interface.
>>>>>>>> It supports dual power supply rails (1.1V on VDD, 3.3V on VCC)
>>>>>>>> for power reduction. Several methods of power management are
>>>>>>>> implemented to reduce overall power consumption.
>>>>>>>> It supports fixed receiver EQ gain using I2C or pin strap to
>>>>>>>> compensate for different lengths input cable or board traces.
>>>>>>>>
>>>>>>>> Features
>>>>>>>>
>>>>>>>> - AC-coupled TMDS or DisplayPort dual-mode physical layer input
>>>>>>>> to HDMI 2.0b TMDS physical layer output supporting up to 6Gbps
>>>>>>>> data rate, compatible with HDMI 2.0b electrical parameters
>>>>>>>> - DisplayPort dual-mode standard version 1.1
>>>>>>>> - Programmable fixed receiver equalizer up to 15.5dB
>>>>>>>> - Global or independent high speed lane control, pre-emphasis
>>>>>>>> and transmit swing, and slew rate control
>>>>>>>> - I2C or pin strap programmable
>>>>>>>> - Configurable as a DisplayPort redriver through I2C
>>>>>>>> - Full lane swap on main lanes
>>>>>>>> - Low power consumption (200 mW at 6Gbps, 8 mW in shutdown)
>>>>>>>>
>>>>>>>> https://www.ti.com/lit/ds/symlink/tdp158.pdf
>>>>>>>>
>>>>>>>> Signed-off-by: Marc Gonzalez <mgonzalez@freebox.fr>
>>>>>>>> ---
>>>>>>>>  .../bindings/display/bridge/ti,tdp158.yaml         | 51 ++++++++++++++++++++++
>>>>>>>>  1 file changed, 51 insertions(+)
>>>>>>>>
>>>>>>>> diff --git a/Documentation/devicetree/bindings/display/bridge/ti,tdp158.yaml b/Documentation/devicetree/bindings/display/bridge/ti,tdp158.yaml
>>>>>>>> new file mode 100644
>>>>>>>> index 0000000000000..21c8585c3bb2d
>>>>>>>> --- /dev/null
>>>>>>>> +++ b/Documentation/devicetree/bindings/display/bridge/ti,tdp158.yaml
>>>>>>>> @@ -0,0 +1,51 @@
>>>>>>>> +# SPDX-License-Identifier: GPL-2.0-only
>>>>>>>> +%YAML 1.2
>>>>>>>> +---
>>>>>>>> +$id: http://devicetree.org/schemas/display/bridge/ti,tdp158.yaml#
>>>>>>>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>>>>>>>> +
>>>>>>>> +title: TI TDP158 HDMI to TMDS Redriver
>>>>>>>> +
>>>>>>>> +maintainers:
>>>>>>>> +  - Arnaud Vrac <avrac@freebox.fr>
>>>>>>>> +  - Pierre-Hugues Husson <phhusson@freebox.fr>
>>>>>>>> +
>>>>>>>> +properties:
>>>>>>>> +  compatible:
>>>>>>>> +    const: ti,tdp158
>>>>>>>> +
>>>>>>>> +  reg:
>>>>>>>> +    description: I2C address of the device
>>>>>>>> +
>>>>>>>> +  enable-gpios:
>>>>>>>> +    description: GPIO controlling bridge enable
>>>>>>>> +
>>>>>>>> +  vcc-supply:
>>>>>>>> +    description: Power supply 3.3V
>>>>>>>> +
>>>>>>>> +  vdd-supply:
>>>>>>>> +    description: Power supply 1.1V
>>>>>>>> +
>>>>>>>> +  ports:
>>>>>>>> +    $ref: /schemas/graph.yaml#/properties/ports
>>>>>>>> +
>>>>>>>> +    properties:
>>>>>>>> +      port@0:
>>>>>>>> +        $ref: /schemas/graph.yaml#/properties/port
>>>>>>>> +        description: Bridge input
>>>>>>>> +
>>>>>>>> +      port@1:
>>>>>>>> +        $ref: /schemas/graph.yaml#/properties/port
>>>>>>>> +        description: Bridge output
>>>>>>>> +
>>>>>>>> +    required:
>>>>>>>> +      - port@0
>>>>>>>> +      - port@1
>>>>>>>
>>>>>>> The device supports DVI, HDMI or DP input, with various requirements and
>>>>>>> capabilities depending on the input. Your binding doesn't address that.
>>>>>>>
>>>>>>> Similarly, it can do lane-swapping, so we should probably have a
>>>>>>> property to describe what mapping we want to use.
>>>>>>>
>>>>>>> The i2c register access (and the whole behaviour of the device) is
>>>>>>> constrained on the I2C_EN pin status, and you can't read it from the
>>>>>>> device, so it's also something we need to have in the DT.
>>>>>>
>>>>>> We are using the device in its default configuration.
>>>>>> (Power on via OE, then it works as expected)
>>>>>
>>>>> I know, but that doesn't really matter for a binding.
>>>>>
>>>>>> Can we leave any additional properties to be defined by whomever needs
>>>>>> them in the future?
>>>>>
>>>>> If you can guarantee that doing so would be backward compatible, sure.
>>>>> But that means being able to answer those questions with a reasonable
>>>>> plan.
>>>>
>>>> I think proposed bindings are generic enough to cover other possible
>>>> usecases in future.
>>>
>>> I don't think it is. The current binding is for a I2C device that
>>> shouldn't be accessed through I2C.
>>>
>>> It's working for now because the driver doesn't do any access, so it's
>>> all great, but as soon as we add support for the other case, then we'll
>>> have to add a property that states that while it's an i2c device, it
>>> shouldn't be accessed.
>>>
>>> And adding such a property is a compatibility-breaking change.
>>
>> Why do you say:
>> "current binding is for a I2C device that
>> shouldn't be accessed through I2C" ?
>>
>> As a matter of fact, my debug code queries the device ID using
>> regmap_read() to make sure I set the correct I2C address.
> 
> Please note: bingdings do not cover the driver at all. The driver might
> do whatever it wants. The bindings describe the hardware.

OK.
How does the proposed binding say
"I2C device shouldn't be accessed through I2C" ?

The tfp410 has the same property that it can be configured
either through pin straps or via I2C.


