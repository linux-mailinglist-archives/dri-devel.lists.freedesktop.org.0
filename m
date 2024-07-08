Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F10B392AA96
	for <lists+dri-devel@lfdr.de>; Mon,  8 Jul 2024 22:29:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5EC1210E411;
	Mon,  8 Jul 2024 20:29:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="G9/IqYjU";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com
 [209.85.167.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1FE1610E40C
 for <dri-devel@lists.freedesktop.org>; Mon,  8 Jul 2024 20:29:50 +0000 (UTC)
Received: by mail-lf1-f41.google.com with SMTP id
 2adb3069b0e04-52e98087e32so4852454e87.2
 for <dri-devel@lists.freedesktop.org>; Mon, 08 Jul 2024 13:29:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1720470588; x=1721075388; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=AkgxCYGsYLWMcE448YaZfJ9W44wnGwUPOMuZLYPWud8=;
 b=G9/IqYjUhhqdHHe2RlXF0VgPjBz12t8kKZT62ynuXVUXqikDjAd8p2Sl3GfWv47g+v
 By7uyAXKnRQhrQpL1qd+nVAmsq8WGszL0RtmRI0aY48lyGwudqk9JW9Ji33XK9SNin6S
 18HbrDcyA5ABiJ8Rl5NF8SE8wZNmaCOAgy18y4iEQ2VBAUxgJKWrAsWdRt1FqS4yAN/G
 0woWeCxW15vWbEckoQvkkGNte5hy5LEFTXjVxOZ9SyvhABcNo9hnphUyma7UJHq9pnEJ
 Ap/pxTrOR7D41BeiLcyxSFmJDMvUI4xyxb4lVIcTNpAcxANum7Cs5PBnDLT/JnCWDGs2
 07GA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1720470588; x=1721075388;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=AkgxCYGsYLWMcE448YaZfJ9W44wnGwUPOMuZLYPWud8=;
 b=vHaFx4r0IGLP0hLw3kEsBmJNuAKBGssAZQ8hkNLBtIMQzS6SqBQrW45ANFuGqrmJjB
 Sr5bQsrVIlz6bmy4XauLrMqWf+ePW6fWADux/jzpwHlR65zHxCnGXBMUmx2s/+AWRRb2
 8G1/I5fFKnQARKFvL7UK/PuD1VsclanLKBjt8OMPQ5Wjp9IMbFOkJVxXV4s7W3A0pjyF
 Q9bYNrDrTKrpfcijBDjtUg5ZtJP07c3gSmwxVLzDFJR6V5ojKL22dAwjH7/zt7UjSLwr
 8gGkRIUEmDzuvM4/I9bGp0ZLTmJ67LIJBFSWpfeNbqOh2lSDIN1Q/1fVwn8tErpf24gc
 UGVQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXcKeHt41X5F38nQ9wo5BBBqqJr2qq0KWDtsKeQV96QsIsnWD/JRe3dUHn94KVSyEEztQGQBuQUhT+GFdho0dGlDIOg075xXKJrYEJjqEyW
X-Gm-Message-State: AOJu0YzXnYmlEyl7dzxnEqyVSyBFXR8Aj2e7lWIflG1JIom/GTqTndbN
 JARaBjSC/ezCg+SDHzI1Jz2168o501ejKOdB2xEjzyYJzYYkdolq0FZ/RNSK7Zc=
X-Google-Smtp-Source: AGHT+IEBbhWBYOcaS6joBzDlzNMwaWeo83XO3feWz3mM89Vg7Fqlo+wJsWBRhc+Nes+lzZGSEHMrtA==
X-Received: by 2002:a05:6512:110e:b0:52d:b1e4:b337 with SMTP id
 2adb3069b0e04-52eb999165cmr306053e87.21.1720470588245; 
 Mon, 08 Jul 2024 13:29:48 -0700 (PDT)
Received: from eriador.lumag.spb.ru
 (dzdbxzyyyyyyyyyyybrhy-3.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-52eb90625ccsm58017e87.127.2024.07.08.13.29.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 08 Jul 2024 13:29:47 -0700 (PDT)
Date: Mon, 8 Jul 2024 23:29:46 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Maxime Ripard <mripard@kernel.org>
Cc: Marc Gonzalez <mgonzalez@freebox.fr>, 
 Conor Dooley <conor+dt@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Rob Herring <robh@kernel.org>, Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
 Daniel Vetter <daniel@ffwll.ch>, Liam Girdwood <lgirdwood@gmail.com>, 
 Mark Brown <broonie@kernel.org>, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, Arnaud Vrac <avrac@freebox.fr>, 
 Pierre-Hugues Husson <phhusson@freebox.fr>
Subject: Re: [PATCH v3 1/2] dt-bindings: display: bridge: add TI TDP158
Message-ID: <pp3rc5zob3xeghlatw4vnpzplc4yjpjadkea465zmhft55dyl5@3cpoc2zovftv>
References: <20240627-tdp158-v3-0-fb2fbc808346@freebox.fr>
 <20240627-tdp158-v3-1-fb2fbc808346@freebox.fr>
 <20240701-bug-of-great-honeydew-cfb6ef@houat>
 <e7bbbe4e-7deb-46c3-9cce-1922f9b6b3a2@freebox.fr>
 <20240708-ethereal-romantic-piculet-d4ae66@houat>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240708-ethereal-romantic-piculet-d4ae66@houat>
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

On Mon, Jul 08, 2024 at 04:59:23PM GMT, Maxime Ripard wrote:
> On Mon, Jul 01, 2024 at 05:36:18PM GMT, Marc Gonzalez wrote:
> > On 01/07/2024 15:50, Maxime Ripard wrote:
> > 
> > > On Thu, Jun 27, 2024 at 01:13:03PM GMT, Marc Gonzalez wrote:
> > >
> > >> TDP158 is an AC-coupled DVI / HDMI to TMDS level shifting Redriver.
> > >> It supports DVI 1.0, HDMI 1.4b and 2.0b.
> > >> It supports 4 TMDS channels, HPD, and a DDC interface.
> > >> It supports dual power supply rails (1.1V on VDD, 3.3V on VCC)
> > >> for power reduction. Several methods of power management are
> > >> implemented to reduce overall power consumption.
> > >> It supports fixed receiver EQ gain using I2C or pin strap to
> > >> compensate for different lengths input cable or board traces.
> > >>
> > >> Features
> > >>
> > >> - AC-coupled TMDS or DisplayPort dual-mode physical layer input
> > >> to HDMI 2.0b TMDS physical layer output supporting up to 6Gbps
> > >> data rate, compatible with HDMI 2.0b electrical parameters
> > >> - DisplayPort dual-mode standard version 1.1
> > >> - Programmable fixed receiver equalizer up to 15.5dB
> > >> - Global or independent high speed lane control, pre-emphasis
> > >> and transmit swing, and slew rate control
> > >> - I2C or pin strap programmable
> > >> - Configurable as a DisplayPort redriver through I2C
> > >> - Full lane swap on main lanes
> > >> - Low power consumption (200 mW at 6Gbps, 8 mW in shutdown)
> > >>
> > >> https://www.ti.com/lit/ds/symlink/tdp158.pdf
> > >>
> > >> Signed-off-by: Marc Gonzalez <mgonzalez@freebox.fr>
> > >> ---
> > >>  .../bindings/display/bridge/ti,tdp158.yaml         | 51 ++++++++++++++++++++++
> > >>  1 file changed, 51 insertions(+)
> > >>
> > >> diff --git a/Documentation/devicetree/bindings/display/bridge/ti,tdp158.yaml b/Documentation/devicetree/bindings/display/bridge/ti,tdp158.yaml
> > >> new file mode 100644
> > >> index 0000000000000..21c8585c3bb2d
> > >> --- /dev/null
> > >> +++ b/Documentation/devicetree/bindings/display/bridge/ti,tdp158.yaml
> > >> @@ -0,0 +1,51 @@
> > >> +# SPDX-License-Identifier: GPL-2.0-only
> > >> +%YAML 1.2
> > >> +---
> > >> +$id: http://devicetree.org/schemas/display/bridge/ti,tdp158.yaml#
> > >> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > >> +
> > >> +title: TI TDP158 HDMI to TMDS Redriver
> > >> +
> > >> +maintainers:
> > >> +  - Arnaud Vrac <avrac@freebox.fr>
> > >> +  - Pierre-Hugues Husson <phhusson@freebox.fr>
> > >> +
> > >> +properties:
> > >> +  compatible:
> > >> +    const: ti,tdp158
> > >> +
> > >> +  reg:
> > >> +    description: I2C address of the device
> > >> +
> > >> +  enable-gpios:
> > >> +    description: GPIO controlling bridge enable
> > >> +
> > >> +  vcc-supply:
> > >> +    description: Power supply 3.3V
> > >> +
> > >> +  vdd-supply:
> > >> +    description: Power supply 1.1V
> > >> +
> > >> +  ports:
> > >> +    $ref: /schemas/graph.yaml#/properties/ports
> > >> +
> > >> +    properties:
> > >> +      port@0:
> > >> +        $ref: /schemas/graph.yaml#/properties/port
> > >> +        description: Bridge input
> > >> +
> > >> +      port@1:
> > >> +        $ref: /schemas/graph.yaml#/properties/port
> > >> +        description: Bridge output
> > >> +
> > >> +    required:
> > >> +      - port@0
> > >> +      - port@1
> > > 
> > > The device supports DVI, HDMI or DP input, with various requirements and
> > > capabilities depending on the input. Your binding doesn't address that.
> > > 
> > > Similarly, it can do lane-swapping, so we should probably have a
> > > property to describe what mapping we want to use.
> > > 
> > > The i2c register access (and the whole behaviour of the device) is
> > > constrained on the I2C_EN pin status, and you can't read it from the
> > > device, so it's also something we need to have in the DT.
> > 
> > We are using the device in its default configuration.
> > (Power on via OE, then it works as expected)
> 
> I know, but that doesn't really matter for a binding.
> 
> > Can we leave any additional properties to be defined by whomever needs
> > them in the future?
> 
> If you can guarantee that doing so would be backward compatible, sure.
> But that means being able to answer those questions with a reasonable
> plan.

I think proposed bindings are generic enough to cover other possible
usecases in future.

-- 
With best wishes
Dmitry
