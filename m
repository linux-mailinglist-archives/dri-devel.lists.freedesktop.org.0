Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 77D2B91E444
	for <lists+dri-devel@lfdr.de>; Mon,  1 Jul 2024 17:36:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CC6A210E491;
	Mon,  1 Jul 2024 15:36:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=freebox-fr.20230601.gappssmtp.com header.i=@freebox-fr.20230601.gappssmtp.com header.b="t7I5bJwA";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f171.google.com (mail-lj1-f171.google.com
 [209.85.208.171])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BB2E410E479
 for <dri-devel@lists.freedesktop.org>; Mon,  1 Jul 2024 15:36:37 +0000 (UTC)
Received: by mail-lj1-f171.google.com with SMTP id
 38308e7fff4ca-2eabd22d3f4so31252781fa.1
 for <dri-devel@lists.freedesktop.org>; Mon, 01 Jul 2024 08:36:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=freebox-fr.20230601.gappssmtp.com; s=20230601; t=1719848196; x=1720452996;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=bvfSKmQBY9o32fhoQH9rUnJzU5eNp6hOXWuH3dxG8cI=;
 b=t7I5bJwAxsArSNPexFstsU8eLMSje3IChXT4WI9ggLxBWYdiZvnEq6OKpAVPncGX8G
 jQVpSyFKlHnnznT3Kw+i+Hb762q8RleObP3oRxwnGdsROU/WtrFO3EhpCGoRS3Ogvg8P
 tWpwB32N8uZ9RLut457uAaZ2ohVu/uUlOql8EDXWRHqLIkInobqYcjpljzhXU2pTODUT
 j5A7MekiT0H49oX5Re9BsJa5w8QKkLMAoA3oWINkjNZfX3WN+L6JVBN7ffMW4lFwU0Ie
 ZhihhGrGZ2XnUurQrrKpD59kXnC9ZpfYrg4kx+G2QTW4Leaq2YyzoAJEJKF9GIRHh199
 lbng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1719848196; x=1720452996;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=bvfSKmQBY9o32fhoQH9rUnJzU5eNp6hOXWuH3dxG8cI=;
 b=D/y8dgjwq/IbHKF5UM0CpUA/1qtTarVHlr3D46cLEGYho2R33eu3pIrjPQldo8by4o
 9FBEtf0zYAXBqniHR6E39WnVqi8iuBi0FuMrMhsThqQ2zsXqr6UPQVAPo5rrR8+XsGUp
 2eknHm9sMZPM9twsNOUf4NAkU8HBE8CvpYxRjAaoJK/2yTWLugHraEVt+Hseu40JemE7
 MBZZ+IUBwRTjuZaUO8FYUvbgZlmXFLapAcQ/2ba+0wQI4ZknRtZRQwODNivSAIvF8sm/
 Z52JjDkz3iHNnFVtXcihcUDXciIny+ViPf6vjSBgw/COrW8ch1Gt2yVZNSpXElO9ir2G
 Yd1Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCWC1gTyiiO+YTbjfyEjebkb2vIIEiOgDdhOnywwiR1T9f+FUrQgeowyJ7zWTMURjLztl5WF9/d4NM3MKJ2Iy3LCJkt87g4bYTVrPMxmMgNO
X-Gm-Message-State: AOJu0Yz3aupHx0iF8vWO0FDo/Vr9SIkh4rGvZIukK0hIa5zp8QjFX+Q0
 +HyjjT+BkiZL/CaYQaQExWunYR6lNHigCoojl+YwqDAvrycIdKRXmV7xj1qX1RE=
X-Google-Smtp-Source: AGHT+IEDSC4uaaLDJAS21ejjh/FE4t1bkWMHxfeTl3h0IkEGfg8lVFkE7MXRxv+Fq3Es3bKHHc6Kng==
X-Received: by 2002:a2e:7809:0:b0:2ec:5a0d:b2dd with SMTP id
 38308e7fff4ca-2ee5e6e0279mr37769401fa.39.1719848195577; 
 Mon, 01 Jul 2024 08:36:35 -0700 (PDT)
Received: from [192.168.108.81] (freebox.vlq16.iliad.fr. [213.36.7.13])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4256af5ba51sm156852355e9.12.2024.07.01.08.36.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 01 Jul 2024 08:36:35 -0700 (PDT)
Message-ID: <e7bbbe4e-7deb-46c3-9cce-1922f9b6b3a2@freebox.fr>
Date: Mon, 1 Jul 2024 17:36:18 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/2] dt-bindings: display: bridge: add TI TDP158
To: Maxime Ripard <mripard@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Rob Herring <robh@kernel.org>
Cc: Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 Arnaud Vrac <avrac@freebox.fr>, Pierre-Hugues Husson <phhusson@freebox.fr>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
References: <20240627-tdp158-v3-0-fb2fbc808346@freebox.fr>
 <20240627-tdp158-v3-1-fb2fbc808346@freebox.fr>
 <20240701-bug-of-great-honeydew-cfb6ef@houat>
Content-Language: en-US
From: Marc Gonzalez <mgonzalez@freebox.fr>
In-Reply-To: <20240701-bug-of-great-honeydew-cfb6ef@houat>
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

On 01/07/2024 15:50, Maxime Ripard wrote:

> On Thu, Jun 27, 2024 at 01:13:03PM GMT, Marc Gonzalez wrote:
>
>> TDP158 is an AC-coupled DVI / HDMI to TMDS level shifting Redriver.
>> It supports DVI 1.0, HDMI 1.4b and 2.0b.
>> It supports 4 TMDS channels, HPD, and a DDC interface.
>> It supports dual power supply rails (1.1V on VDD, 3.3V on VCC)
>> for power reduction. Several methods of power management are
>> implemented to reduce overall power consumption.
>> It supports fixed receiver EQ gain using I2C or pin strap to
>> compensate for different lengths input cable or board traces.
>>
>> Features
>>
>> - AC-coupled TMDS or DisplayPort dual-mode physical layer input
>> to HDMI 2.0b TMDS physical layer output supporting up to 6Gbps
>> data rate, compatible with HDMI 2.0b electrical parameters
>> - DisplayPort dual-mode standard version 1.1
>> - Programmable fixed receiver equalizer up to 15.5dB
>> - Global or independent high speed lane control, pre-emphasis
>> and transmit swing, and slew rate control
>> - I2C or pin strap programmable
>> - Configurable as a DisplayPort redriver through I2C
>> - Full lane swap on main lanes
>> - Low power consumption (200 mW at 6Gbps, 8 mW in shutdown)
>>
>> https://www.ti.com/lit/ds/symlink/tdp158.pdf
>>
>> Signed-off-by: Marc Gonzalez <mgonzalez@freebox.fr>
>> ---
>>  .../bindings/display/bridge/ti,tdp158.yaml         | 51 ++++++++++++++++++++++
>>  1 file changed, 51 insertions(+)
>>
>> diff --git a/Documentation/devicetree/bindings/display/bridge/ti,tdp158.yaml b/Documentation/devicetree/bindings/display/bridge/ti,tdp158.yaml
>> new file mode 100644
>> index 0000000000000..21c8585c3bb2d
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/display/bridge/ti,tdp158.yaml
>> @@ -0,0 +1,51 @@
>> +# SPDX-License-Identifier: GPL-2.0-only
>> +%YAML 1.2
>> +---
>> +$id: http://devicetree.org/schemas/display/bridge/ti,tdp158.yaml#
>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>> +
>> +title: TI TDP158 HDMI to TMDS Redriver
>> +
>> +maintainers:
>> +  - Arnaud Vrac <avrac@freebox.fr>
>> +  - Pierre-Hugues Husson <phhusson@freebox.fr>
>> +
>> +properties:
>> +  compatible:
>> +    const: ti,tdp158
>> +
>> +  reg:
>> +    description: I2C address of the device
>> +
>> +  enable-gpios:
>> +    description: GPIO controlling bridge enable
>> +
>> +  vcc-supply:
>> +    description: Power supply 3.3V
>> +
>> +  vdd-supply:
>> +    description: Power supply 1.1V
>> +
>> +  ports:
>> +    $ref: /schemas/graph.yaml#/properties/ports
>> +
>> +    properties:
>> +      port@0:
>> +        $ref: /schemas/graph.yaml#/properties/port
>> +        description: Bridge input
>> +
>> +      port@1:
>> +        $ref: /schemas/graph.yaml#/properties/port
>> +        description: Bridge output
>> +
>> +    required:
>> +      - port@0
>> +      - port@1
> 
> The device supports DVI, HDMI or DP input, with various requirements and
> capabilities depending on the input. Your binding doesn't address that.
> 
> Similarly, it can do lane-swapping, so we should probably have a
> property to describe what mapping we want to use.
> 
> The i2c register access (and the whole behaviour of the device) is
> constrained on the I2C_EN pin status, and you can't read it from the
> device, so it's also something we need to have in the DT.

We are using the device in its default configuration.
(Power on via OE, then it works as expected)

Can we leave any additional properties to be defined
by whomever needs them in the future?

Regards

