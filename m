Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9774593B5C0
	for <lists+dri-devel@lfdr.de>; Wed, 24 Jul 2024 19:18:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0BECB10E771;
	Wed, 24 Jul 2024 17:18:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=freebox-fr.20230601.gappssmtp.com header.i=@freebox-fr.20230601.gappssmtp.com header.b="J2ETHWtf";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com
 [209.85.128.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DE0FF10E771
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Jul 2024 17:18:42 +0000 (UTC)
Received: by mail-wm1-f43.google.com with SMTP id
 5b1f17b1804b1-4266ea6a412so91555e9.1
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Jul 2024 10:18:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=freebox-fr.20230601.gappssmtp.com; s=20230601; t=1721841521; x=1722446321;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=BQaxjmAMq0/xp6YobYEUEMiu4h6XvMRuv8iaOxTtcz8=;
 b=J2ETHWtfkldvUUfAOdcRbtXoqwDmBkelrj2nFp3Lgs3F+7pnK9zmVtxlO3eOoKg6Pl
 cG7OnliWBGSDMc/lUQM/03I1zvvzS42a3PAwZ/zeHfX6iM1fYzUjPgriSJROSyPqSjHZ
 XFdTUf+A4s0TyBhen5/5A8SIeIWPCCCNtpbbQyk0poL3li9UmESIlKftgkcNwBki5uqf
 oHJUBANkr98Lg+aq0eni2lY1O46vWa7bZlay+cQREZYz1hPnCzcivOlDo0hepphEKyif
 +wIvWUYkRuk6cfcRhmADB7OPclf0o7zEeBHA844cWZLIeecn6QtEOiWEI7AkMZBXncRF
 Avvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1721841521; x=1722446321;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=BQaxjmAMq0/xp6YobYEUEMiu4h6XvMRuv8iaOxTtcz8=;
 b=bcZheEPT/k4xwsVsgCuJlBMtw5xDmQ8AUiNvGokFHdKB060uUhSrQFzj8vK0Ft4GsL
 VcroocuYhKI1X6KFmrNbrqxMgqgoFB0gAVuT2DehLuclSURJwj2N0dMy1qoNsP3s+D/p
 D0BY9LIMKG+Zt3xI3112HuAbi8gmQwZnSRJ/cWL9n8c/jFmxlm1aRx4pzx1o7GMXg6tZ
 LLTGE0/LnAxaE4v3MHZPeTsTOu7805kwKXp4iX+4GKbI7uszzLrT4VRA3xwr6flnso4T
 8tGBrUdxDNzroqqCcDmHq+w3qS7VsZ1iV2H+uoPESFxvB8s+6sAcPURHZMCmjgjC2tXo
 Lf7Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCXudihOuhY8CC60ejSn5MkP7XsVTa1Zib1f1XqjBPzLef+Z9qL/nYZ0cOrhuNttiDNOLJoAewRslfuESQz8mFEEtOiRoQmqDJxpBrV2LzX7
X-Gm-Message-State: AOJu0YzDl96iVmmhT5qu9BXXO3elIBAI5Fu0Sg6qqgt4XywUlRhaK2kg
 oPQIgQLk37wowDIZAewGgB5B1aGTp9usbignii+R45yhywZOBHqNSVlfx3d6Ya4=
X-Google-Smtp-Source: AGHT+IFi7AchcLgHEdKTa5PHgma3FsDXem4wCnlPVQP1KTsPD4ot5Jk8WLTeV2FWCrSUpUImWpcDcg==
X-Received: by 2002:a05:600c:4707:b0:427:ffa4:32d0 with SMTP id
 5b1f17b1804b1-427ffa449ccmr8352685e9.28.1721841520984; 
 Wed, 24 Jul 2024 10:18:40 -0700 (PDT)
Received: from ?IPV6:2a01:e34:ec24:52e0:fcff:6f45:dab:b3a8?
 ([2a01:e34:ec24:52e0:fcff:6f45:dab:b3a8])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-427f93827fesm38250415e9.20.2024.07.24.10.18.40
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 24 Jul 2024 10:18:40 -0700 (PDT)
Message-ID: <f40de173-0c61-4400-87b2-51c171a52baa@freebox.fr>
Date: Wed, 24 Jul 2024 19:18:39 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/2] dt-bindings: display: bridge: add TI TDP158
To: Maxime Ripard <mripard@kernel.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Conor Dooley <conor+dt@kernel.org>,
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
Content-Language: en-US
From: Marc Gonzalez <mgonzalez@freebox.fr>
In-Reply-To: <20240715-shiny-enigmatic-firefly-2a6dec@houat>
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

On 15/07/2024 16:42, Maxime Ripard wrote:
> On Mon, Jul 08, 2024 at 11:29:46PM GMT, Dmitry Baryshkov wrote:
>> On Mon, Jul 08, 2024 at 04:59:23PM GMT, Maxime Ripard wrote:
>>> On Mon, Jul 01, 2024 at 05:36:18PM GMT, Marc Gonzalez wrote:
>>>> On 01/07/2024 15:50, Maxime Ripard wrote:
>>>>
>>>>> On Thu, Jun 27, 2024 at 01:13:03PM GMT, Marc Gonzalez wrote:
>>>>>
>>>>>> TDP158 is an AC-coupled DVI / HDMI to TMDS level shifting Redriver.
>>>>>> It supports DVI 1.0, HDMI 1.4b and 2.0b.
>>>>>> It supports 4 TMDS channels, HPD, and a DDC interface.
>>>>>> It supports dual power supply rails (1.1V on VDD, 3.3V on VCC)
>>>>>> for power reduction. Several methods of power management are
>>>>>> implemented to reduce overall power consumption.
>>>>>> It supports fixed receiver EQ gain using I2C or pin strap to
>>>>>> compensate for different lengths input cable or board traces.
>>>>>>
>>>>>> Features
>>>>>>
>>>>>> - AC-coupled TMDS or DisplayPort dual-mode physical layer input
>>>>>> to HDMI 2.0b TMDS physical layer output supporting up to 6Gbps
>>>>>> data rate, compatible with HDMI 2.0b electrical parameters
>>>>>> - DisplayPort dual-mode standard version 1.1
>>>>>> - Programmable fixed receiver equalizer up to 15.5dB
>>>>>> - Global or independent high speed lane control, pre-emphasis
>>>>>> and transmit swing, and slew rate control
>>>>>> - I2C or pin strap programmable
>>>>>> - Configurable as a DisplayPort redriver through I2C
>>>>>> - Full lane swap on main lanes
>>>>>> - Low power consumption (200 mW at 6Gbps, 8 mW in shutdown)
>>>>>>
>>>>>> https://www.ti.com/lit/ds/symlink/tdp158.pdf
>>>>>>
>>>>>> Signed-off-by: Marc Gonzalez <mgonzalez@freebox.fr>
>>>>>> ---
>>>>>>  .../bindings/display/bridge/ti,tdp158.yaml         | 51 ++++++++++++++++++++++
>>>>>>  1 file changed, 51 insertions(+)
>>>>>>
>>>>>> diff --git a/Documentation/devicetree/bindings/display/bridge/ti,tdp158.yaml b/Documentation/devicetree/bindings/display/bridge/ti,tdp158.yaml
>>>>>> new file mode 100644
>>>>>> index 0000000000000..21c8585c3bb2d
>>>>>> --- /dev/null
>>>>>> +++ b/Documentation/devicetree/bindings/display/bridge/ti,tdp158.yaml
>>>>>> @@ -0,0 +1,51 @@
>>>>>> +# SPDX-License-Identifier: GPL-2.0-only
>>>>>> +%YAML 1.2
>>>>>> +---
>>>>>> +$id: http://devicetree.org/schemas/display/bridge/ti,tdp158.yaml#
>>>>>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>>>>>> +
>>>>>> +title: TI TDP158 HDMI to TMDS Redriver
>>>>>> +
>>>>>> +maintainers:
>>>>>> +  - Arnaud Vrac <avrac@freebox.fr>
>>>>>> +  - Pierre-Hugues Husson <phhusson@freebox.fr>
>>>>>> +
>>>>>> +properties:
>>>>>> +  compatible:
>>>>>> +    const: ti,tdp158
>>>>>> +
>>>>>> +  reg:
>>>>>> +    description: I2C address of the device
>>>>>> +
>>>>>> +  enable-gpios:
>>>>>> +    description: GPIO controlling bridge enable
>>>>>> +
>>>>>> +  vcc-supply:
>>>>>> +    description: Power supply 3.3V
>>>>>> +
>>>>>> +  vdd-supply:
>>>>>> +    description: Power supply 1.1V
>>>>>> +
>>>>>> +  ports:
>>>>>> +    $ref: /schemas/graph.yaml#/properties/ports
>>>>>> +
>>>>>> +    properties:
>>>>>> +      port@0:
>>>>>> +        $ref: /schemas/graph.yaml#/properties/port
>>>>>> +        description: Bridge input
>>>>>> +
>>>>>> +      port@1:
>>>>>> +        $ref: /schemas/graph.yaml#/properties/port
>>>>>> +        description: Bridge output
>>>>>> +
>>>>>> +    required:
>>>>>> +      - port@0
>>>>>> +      - port@1
>>>>>
>>>>> The device supports DVI, HDMI or DP input, with various requirements and
>>>>> capabilities depending on the input. Your binding doesn't address that.
>>>>>
>>>>> Similarly, it can do lane-swapping, so we should probably have a
>>>>> property to describe what mapping we want to use.
>>>>>
>>>>> The i2c register access (and the whole behaviour of the device) is
>>>>> constrained on the I2C_EN pin status, and you can't read it from the
>>>>> device, so it's also something we need to have in the DT.
>>>>
>>>> We are using the device in its default configuration.
>>>> (Power on via OE, then it works as expected)
>>>
>>> I know, but that doesn't really matter for a binding.
>>>
>>>> Can we leave any additional properties to be defined by whomever needs
>>>> them in the future?
>>>
>>> If you can guarantee that doing so would be backward compatible, sure.
>>> But that means being able to answer those questions with a reasonable
>>> plan.
>>
>> I think proposed bindings are generic enough to cover other possible
>> usecases in future.
> 
> I don't think it is. The current binding is for a I2C device that
> shouldn't be accessed through I2C.
> 
> It's working for now because the driver doesn't do any access, so it's
> all great, but as soon as we add support for the other case, then we'll
> have to add a property that states that while it's an i2c device, it
> shouldn't be accessed.
> 
> And adding such a property is a compatibility-breaking change.

Why do you say:
"current binding is for a I2C device that
shouldn't be accessed through I2C" ?

As a matter of fact, my debug code queries the device ID using
regmap_read() to make sure I set the correct I2C address.

It's not that the device "SHOULD NOT" be accessed.

It's just that the driver DOES NOT NEED TO access the device,
simply because the default settings work fine.

Regards

