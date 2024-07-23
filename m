Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 29FEA93A3A8
	for <lists+dri-devel@lfdr.de>; Tue, 23 Jul 2024 17:17:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5175010E0D4;
	Tue, 23 Jul 2024 15:17:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=freebox-fr.20230601.gappssmtp.com header.i=@freebox-fr.20230601.gappssmtp.com header.b="qzc63A7T";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com
 [209.85.128.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 547B110E0D4
 for <dri-devel@lists.freedesktop.org>; Tue, 23 Jul 2024 15:17:15 +0000 (UTC)
Received: by mail-wm1-f54.google.com with SMTP id
 5b1f17b1804b1-426717a2d12so29113585e9.0
 for <dri-devel@lists.freedesktop.org>; Tue, 23 Jul 2024 08:17:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=freebox-fr.20230601.gappssmtp.com; s=20230601; t=1721747833; x=1722352633;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=uea7fpwFzsLB/1iqowl2rAELpCia/ExDlWK7awEvfuY=;
 b=qzc63A7T+LNdc7VPBWhXy8dymVBM+2rsTL+w3P2zdcPuH4W0HoSPHJWZN0ZuWEVsB/
 me/BtdjCqDEt2j2ZHO4T6hIwe9qAaMKFKiAH5ujNlvEByxtMrZOjxAhvRqJeoKVOaXdw
 SLXz/sqJxoMLQJtkaTa/mGg7ZdkSTgWy2XbRI6eyVyLSJxhekAcUqv2AZY1VoqKvHaJJ
 tOs7THbb2vmC0Y93XdHvyQDAz3MsZ+UCEWKWgpUA3ZpSCZ63rlFVlRLzgAEIcAIYdI/T
 Qtnczx9D6RhsVbEmeZBLnwfH8f10l5K3itx82MERhhxj28cHcHJmNCqT75P8+LvXsh5N
 5DFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1721747833; x=1722352633;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=uea7fpwFzsLB/1iqowl2rAELpCia/ExDlWK7awEvfuY=;
 b=QyZJf/7AlXKWxsnMEL5OTFQj4+WikqnXgs8LXYJN4iu7MQU6VPyrCC9Hqt92qIGSVB
 XnQLSjIS3mbl6b5pY5zOCKE6gAEiinH4BVIKHXDtwg1+Gh6s2ntPwyVYbgi1Yy2gruAn
 2fh4y0ddTd+R/QuV5EOR2LZ6icO26Q1c5tgvjSwPPbMTr2/vp8Szj2baNb55eCWNGT+b
 YYEn4NpSzp/7QGuYm6Ttr+ZEcEYIDxCnoLB1JO+9nbMNBZDD2lHaa40qpwr2VVlWP448
 aLKU6OzVdHuTE+yVNsNuqwSMd+9rmPYbdSZKLlKRs6tJJ3ebynCio9mszfexvhfJSl0d
 LR5Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCV9JFb6b5BlLu1XUYAmxZqiHfTgYa9dKtf9WolxDYZ7Xp08GKqHho8/xKR75k+7XbwPBSGO8Jl26UilCX0MkU/X6/sE3LxGNjACUmSQntQj
X-Gm-Message-State: AOJu0YwSbYatEYC36KEblCFXcR4sjm9Iyj3hwVtCvVY6kX6G6NqpDN2k
 mrVnEel8FWhQNT0vDOWPGgZHPEAZvlsY1wME+GHpPRpLFYcDB+pwpqe0A6qDfY4=
X-Google-Smtp-Source: AGHT+IH9roU7SNg3lKjUnvzKa5IVDcJhlS9aYo3/Vqu5EDsOfZaYrMKcTKOzd1KQB0CGXudZUT579g==
X-Received: by 2002:a05:600c:5122:b0:426:618a:a092 with SMTP id
 5b1f17b1804b1-427ef3a873emr17950635e9.13.1721747833567; 
 Tue, 23 Jul 2024 08:17:13 -0700 (PDT)
Received: from [192.168.108.81] (freebox.vlq16.iliad.fr. [213.36.7.13])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-427d2a5c3d4sm204304085e9.17.2024.07.23.08.17.12
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 23 Jul 2024 08:17:13 -0700 (PDT)
Message-ID: <e9d53545-80fc-46d2-83a1-79842a729688@freebox.fr>
Date: Tue, 23 Jul 2024 17:17:12 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/2] dt-bindings: display: bridge: add TI TDP158
To: Conor Dooley <conor@kernel.org>
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
 Arnaud Vrac <avrac@freebox.fr>, Pierre-Hugues Husson <phhusson@freebox.fr>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
References: <20240627-tdp158-v3-0-fb2fbc808346@freebox.fr>
 <20240627-tdp158-v3-1-fb2fbc808346@freebox.fr>
 <20240627-display-quantum-48c2fa48ed1a@spud>
Content-Language: en-US
From: Marc Gonzalez <mgonzalez@freebox.fr>
In-Reply-To: <20240627-display-quantum-48c2fa48ed1a@spud>
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

On 27/06/2024 18:25, Conor Dooley wrote:

> On Thu, Jun 27, 2024 at 01:13:03PM +0200, Marc Gonzalez wrote:
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
> 
> Is reg not required? How do you communicate with the device if the i2c
> bus is not connected? Is the enable GPIO enough to operate it in some
> situations?
> 
> Otherwise this looks good to me, but given Maxime commented about the
> complexity of the device, I'm probably out of my depth!

Hello Conor,

A cycle has been detected:
Above, you defer to Maxime.
Yet later, he wrote:
"DT maintainers have required that reg is always present"


I propose we NOT mark the "reg" property as required.
(Thus, keep the binding as proposed in v3.)

Rationale:

- The device can be statically configured by pin straps,
in which case it is NOT connected to an I2C bus.

- Even if the device IS connected to an I2C bus,
no I2C accesses are required if the default configuration
meets the ODM's needs.

Is that OK with you? Can I get your Amen?

Regards

