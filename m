Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E97991E27C
	for <lists+dri-devel@lfdr.de>; Mon,  1 Jul 2024 16:31:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 40DA810E47F;
	Mon,  1 Jul 2024 14:31:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=freebox-fr.20230601.gappssmtp.com header.i=@freebox-fr.20230601.gappssmtp.com header.b="HGE1DUow";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com
 [209.85.128.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CC4F310E46D
 for <dri-devel@lists.freedesktop.org>; Mon,  1 Jul 2024 14:31:14 +0000 (UTC)
Received: by mail-wm1-f49.google.com with SMTP id
 5b1f17b1804b1-42562fde108so22746235e9.0
 for <dri-devel@lists.freedesktop.org>; Mon, 01 Jul 2024 07:31:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=freebox-fr.20230601.gappssmtp.com; s=20230601; t=1719844273; x=1720449073;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=Id6HIAkhEJzVf6hGweWJ8Eidp8Rqbm4Blp5Z2wNFya4=;
 b=HGE1DUowT1cEDbcl2spe+D3ZnWUluU8PCOA/IOiSskGeluFWTbatUReJajKjhzEeCO
 aB38tqEzZn4MAp1hsMWT2uysPvOh4XJPo7oLj1V4kXkQTaLPUMwIXxkaZU82WkFMDJdM
 rU2CrZt4jUfFRPHngpn2zrzOLYtFAfu8UJh7eG7GUs6pyRzWgl05GMihoEmfAtF/+1Vn
 w5/ViTEhTL9zhQAHPptIXy9G0qy1peoY2slwDfdBRA3os+bXbDarkZtXntKTrcQWGbVM
 fVlPT/sZC/iTjDEFQva/Aokv9g7UCpM0JPtVQrwig7LuE98kcd3kNX/sLbdgZv//OUu8
 VsXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1719844273; x=1720449073;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Id6HIAkhEJzVf6hGweWJ8Eidp8Rqbm4Blp5Z2wNFya4=;
 b=l2A47UPGdhcPU5+5nF7ChgMl15zFWucTEAZwvOcePnJUCdfPN6nI9h9KN2BhhLAJ97
 lr5vzaYrb3hnFHFt29Tlr2/+cefJ61EvIp+iNorEgerQRGxweHXw1wcaLlp1TWupyAuM
 wBULnSdioQpSksDGKiv4ZunKx94wlT//Vzpj0xgiwgTqL5/ldhbraf/IIPCmz72VyOeU
 +8mHbk0GnTI6YJPcN8g3I2WWzCjcpbVreuvNyoJXt/ew70XDuC/nj5OkmhINB3cNGI1U
 U3piztfGGLN3rJAVXAjf1tp9m3OceDjaHr3kf+wQun2LDP4V4RO+2v+MFCgGaYkOYB99
 Lf6g==
X-Forwarded-Encrypted: i=1;
 AJvYcCW2vIPgjVd8Jw6Lu7YDT4EIOF6OGNjv+Ojp0N6JVYKHUQn42sbx7pSMNDAULX61Kk+OwaTDt+tAsL59amig5BUGbWrBZKXmfcxEm7UvDOHE
X-Gm-Message-State: AOJu0YySRp9RNoLhiMBXdwIq1/+KQ3shRT20XZASVMzJ4DNpR9Vt+O1R
 iq5pb00qOKYplYdYaWk2tM1Knvp/OW2AqwPXpuyMVm1AQsmQigyY9BacEq1veVU=
X-Google-Smtp-Source: AGHT+IEwysNTKVXojrsAp0MycW5SXYQ6LKem1wRsjQx63ku/RzCh0wT8flIX/YdnkMJuNXYL2gqroQ==
X-Received: by 2002:a05:600c:4589:b0:424:abef:e952 with SMTP id
 5b1f17b1804b1-4257a05fa08mr38100285e9.29.1719844272832; 
 Mon, 01 Jul 2024 07:31:12 -0700 (PDT)
Received: from [192.168.108.81] (freebox.vlq16.iliad.fr. [213.36.7.13])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3675a0d8ed0sm10223141f8f.28.2024.07.01.07.31.11
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 01 Jul 2024 07:31:12 -0700 (PDT)
Message-ID: <0028683d-efaf-478c-b226-cc60daaacda9@freebox.fr>
Date: Mon, 1 Jul 2024 16:31:11 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/2] dt-bindings: display: bridge: add TI TDP158
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Krzysztof Kozlowski <krzk@kernel.org>, Conor Dooley <conor@kernel.org>
Cc: Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 Arnaud Vrac <avrac@freebox.fr>, Pierre-Hugues Husson <phhusson@freebox.fr>
References: <20240627-tdp158-v3-0-fb2fbc808346@freebox.fr>
 <20240627-tdp158-v3-1-fb2fbc808346@freebox.fr>
 <20240627-display-quantum-48c2fa48ed1a@spud>
 <2fe0c2c0-2f67-4549-b62f-3b9db005d3f7@freebox.fr>
 <46d7c95f-20b0-4526-8583-1d8878afaa2f@kernel.org>
 <3wwp34miu2pibsylv3v2sjzyeso2ugslutm2zqnddlx4ipily2@bcrfetrjngft>
Content-Language: en-US
From: Marc Gonzalez <mgonzalez@freebox.fr>
In-Reply-To: <3wwp34miu2pibsylv3v2sjzyeso2ugslutm2zqnddlx4ipily2@bcrfetrjngft>
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

On 28/06/2024 09:49, Dmitry Baryshkov wrote:
> On Fri, Jun 28, 2024 at 09:36:57AM GMT, Krzysztof Kozlowski wrote:
>> On 27/06/2024 18:45, Marc Gonzalez wrote:
>>> On 27/06/2024 18:25, Conor Dooley wrote:
>>>> On Thu, Jun 27, 2024 at 01:13:03PM +0200, Marc Gonzalez wrote:
>>>>
>>>>> TDP158 is an AC-coupled DVI / HDMI to TMDS level shifting Redriver.
>>>>> It supports DVI 1.0, HDMI 1.4b and 2.0b.
>>>>> It supports 4 TMDS channels, HPD, and a DDC interface.
>>>>> It supports dual power supply rails (1.1V on VDD, 3.3V on VCC)
>>>>> for power reduction. Several methods of power management are
>>>>> implemented to reduce overall power consumption.
>>>>> It supports fixed receiver EQ gain using I2C or pin strap to
>>>>> compensate for different lengths input cable or board traces.
>>>>>
>>>>> Features
>>>>>
>>>>> - AC-coupled TMDS or DisplayPort dual-mode physical layer input
>>>>> to HDMI 2.0b TMDS physical layer output supporting up to 6Gbps
>>>>> data rate, compatible with HDMI 2.0b electrical parameters
>>>>> - DisplayPort dual-mode standard version 1.1
>>>>> - Programmable fixed receiver equalizer up to 15.5dB
>>>>> - Global or independent high speed lane control, pre-emphasis
>>>>> and transmit swing, and slew rate control
>>>>> - I2C or pin strap programmable
>>>>> - Configurable as a DisplayPort redriver through I2C
>>>>> - Full lane swap on main lanes
>>>>> - Low power consumption (200 mW at 6Gbps, 8 mW in shutdown)
>>>>>
>>>>> https://www.ti.com/lit/ds/symlink/tdp158.pdf
>>>>>
>>>>> Signed-off-by: Marc Gonzalez <mgonzalez@freebox.fr>
>>>>> ---
>>>>>  .../bindings/display/bridge/ti,tdp158.yaml         | 51 ++++++++++++++++++++++
>>>>>  1 file changed, 51 insertions(+)
>>>>>
>>>>> diff --git a/Documentation/devicetree/bindings/display/bridge/ti,tdp158.yaml b/Documentation/devicetree/bindings/display/bridge/ti,tdp158.yaml
>>>>> new file mode 100644
>>>>> index 0000000000000..21c8585c3bb2d
>>>>> --- /dev/null
>>>>> +++ b/Documentation/devicetree/bindings/display/bridge/ti,tdp158.yaml
>>>>> @@ -0,0 +1,51 @@
>>>>> +# SPDX-License-Identifier: GPL-2.0-only
>>>>> +%YAML 1.2
>>>>> +---
>>>>> +$id: http://devicetree.org/schemas/display/bridge/ti,tdp158.yaml#
>>>>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>>>>> +
>>>>> +title: TI TDP158 HDMI to TMDS Redriver
>>>>> +
>>>>> +maintainers:
>>>>> +  - Arnaud Vrac <avrac@freebox.fr>
>>>>> +  - Pierre-Hugues Husson <phhusson@freebox.fr>
>>>>> +
>>>>> +properties:
>>>>> +  compatible:
>>>>> +    const: ti,tdp158
>>>>> +
>>>>> +  reg:
>>>>> +    description: I2C address of the device
>>>>
>>>> Is reg not required? How do you communicate with the device if the i2c
>>>> bus is not connected? Is the enable GPIO enough to operate it in some
>>>> situations?
>>>>
>>>> Otherwise this looks good to me, but given Maxime commented about the
>>>> complexity of the device, I'm probably out of my depth!
>>>
>>> Valid question.
>>>
>>> As discussed in my brilliantly expanded commit message (:p)
>>> the device can be configured in various ways, either through I2C registers
>>> or by pin strap. We use the device in its default settings, so we don't
>>> touch any I2C registers, thus I'm not sure the reg property is required.
>>
>> But then how would it be represented in the DT? Where / under which parent?
>>
>> If this is supposed to be always in I2C bus in DT, then you always need
>> reg. If you could place it in other place, then your reasoning is valid
>> - reg is optional.
> 
> As far as I understood, the device is connected to I2C bus, it just
> doesn't need to be programmed. So I'd conclude that reg is required.

Just to be clear (and as far as I understand),
the TDP158 can be configured via 2 different methods:
- dynamically at run-time, through I2C registers (requires an I2C bus)
- statically at layout-time through pin straps (no I2C bus required)

On our board, the TDP158 is connected to blsp2_i2c1.

So, in my understanding, the "reg" property would be required
for the first method, but is not applicable for the second method.

I don't feel strongly about the issue, so I can mark the "reg"
property as required if it makes more sense.

Regards

