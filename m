Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B18A991AD16
	for <lists+dri-devel@lfdr.de>; Thu, 27 Jun 2024 18:46:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8267710E183;
	Thu, 27 Jun 2024 16:46:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=freebox-fr.20230601.gappssmtp.com header.i=@freebox-fr.20230601.gappssmtp.com header.b="y6D6L0bo";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com
 [209.85.221.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D969C10E183
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Jun 2024 16:46:00 +0000 (UTC)
Received: by mail-wr1-f46.google.com with SMTP id
 ffacd0b85a97d-36733f09305so946517f8f.3
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Jun 2024 09:46:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=freebox-fr.20230601.gappssmtp.com; s=20230601; t=1719506758; x=1720111558;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=RUlTgVjd1SWrlQFq5ZUdpN+bd1M6z2ww4u0olJxdHqw=;
 b=y6D6L0bogUCeLgPEaUGZO8W6nSOgFJHMo3IttSx5j6m4jDePkBCPfZ0iYZVDrGf6Zt
 6arIoQunBsmMtTuL0XSutM+1xS/Ww9eR2vHWiNQJikRcTHFZ0/ghu6G9UsMTiwIL1NKP
 c0tp5IhTs0BQzAtmOxgA1jZBYtcoCLl9T7VbEOISx5hM28v2DuTG+fhQrZ02X+qM7Y9C
 hjeXL89dwaUyqkdvqfpcQsRrPJeMV9C4Nj6OT1xGYW9+tLEptXlDCX8YLMuoffBEkZ8+
 gmJMrobV8ph4ca2Jp7zBwJ+UQkPbpe8zWMAutAO6ojM5h43LV+rajcx+RFepr0nd6gmg
 s7ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1719506758; x=1720111558;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=RUlTgVjd1SWrlQFq5ZUdpN+bd1M6z2ww4u0olJxdHqw=;
 b=LkeidqLg2ShZTF9ns2ak7Cd7YOfKtb2kHmFFJUw9Mqr7+n/EvbWOuIcsm529hzvs9Q
 KRmy9pZTlgwWvtjrtQJ5Cw/eWEKU/niq0eDW8emJ2yYMKdAqrJj5ePlF1VQPRKdocKez
 ROkcDy6xBd2cmC3mjqg5iEN0boyIxJO9kmESqzOe+KyroVWpr9xvHTUQgdFk72R9a7ud
 h2C/3ydX1F8LVaLJAW16y9f/WrpRMlLJZiCnkyZizHOlvKkM5IFqkCELPHWWf9FWeLnd
 3wZ8iJhNpvGJsoAbU2CU+zHUvx+g6+lMrtc/jYtUMqZrOQmVuuf4znNo+mi4lazWfFkj
 iRpA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWgl2JYguH/pr+3pPe087zpHzR8kLLOqkI+8G7ECvivIfTUGjVg2QSxgyQm3XiYYMu1miGCqLjXvzi/OuvpD9Oz9mWufJJpSW1Y6VOf2VxJ
X-Gm-Message-State: AOJu0Yz3J8jRU+8GnVXnKXRUSZ6krXXwutEwhI33glVqY+viiuGwhO+D
 teefM9bz+FzquFk6nGolOcAKS/XXROjnthHYEmwvy+7b32yR+pbwzdkaW60cZGQ=
X-Google-Smtp-Source: AGHT+IGIYRxdqaTOfk3Ahf8IGX/zJweg6pUTNHBb0iDQkXENMydzf+ntT71BoddaWEhyCxAUa1GbDA==
X-Received: by 2002:a05:6000:184f:b0:366:ee84:6a79 with SMTP id
 ffacd0b85a97d-366ee846c15mr12700480f8f.51.1719506758451; 
 Thu, 27 Jun 2024 09:45:58 -0700 (PDT)
Received: from [192.168.108.81] (freebox.vlq16.iliad.fr. [213.36.7.13])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3674369ecd3sm2401901f8f.104.2024.06.27.09.45.57
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 27 Jun 2024 09:45:58 -0700 (PDT)
Message-ID: <2fe0c2c0-2f67-4549-b62f-3b9db005d3f7@freebox.fr>
Date: Thu, 27 Jun 2024 18:45:57 +0200
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

Valid question.

As discussed in my brilliantly expanded commit message (:p)
the device can be configured in various ways, either through I2C registers
or by pin strap. We use the device in its default settings, so we don't
touch any I2C registers, thus I'm not sure the reg property is required.

>> +required:
>> +  - compatible
>> +  - vcc-supply
>> +  - vdd-supply
>> +  - ports


Regards

