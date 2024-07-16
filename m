Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2AAC4932483
	for <lists+dri-devel@lfdr.de>; Tue, 16 Jul 2024 13:00:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 72B9510E652;
	Tue, 16 Jul 2024 10:59:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="IEAysSQp";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-f173.google.com (mail-yw1-f173.google.com
 [209.85.128.173])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4506B10E652
 for <dri-devel@lists.freedesktop.org>; Tue, 16 Jul 2024 10:59:56 +0000 (UTC)
Received: by mail-yw1-f173.google.com with SMTP id
 00721157ae682-65f9708c50dso27040057b3.2
 for <dri-devel@lists.freedesktop.org>; Tue, 16 Jul 2024 03:59:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1721127595; x=1721732395; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=SCpp5TdLu9kk6eRwCAo7oBPRTqvgECiNvL6BaGoRicI=;
 b=IEAysSQpz7kltOY7K9+fCZmP5S0wHW07JCSkQPkw9C93fSnZVIYbwOTeySkj+R0dBZ
 rJqkKS6plrNm+i5cA89lW7MzXzqYkQIqm5ugNdvn9p+VA//YQxK40o60oKU+XWFTyeof
 MWPn/ABiRgTOYPtPkjb7SPwqo9U2rY/bHCAmRyMuXYLuX1LpuSL8daJDxJ7EygSFVSaa
 bB9Uio9Mb6RZ+gWJPO/DX71RGa5cn3AVUBEus371sN9gqQt/rX3Ad3+8zbf1Pv3z54CO
 pTghJEue9ELONshpu7+4FZPxEML7UUL714S7ajt0EDNPWOAJNZD77XkxGzhGcGZA+BaE
 wMHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1721127595; x=1721732395;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=SCpp5TdLu9kk6eRwCAo7oBPRTqvgECiNvL6BaGoRicI=;
 b=LZANC58bP921TOpamm6UDNPzfsQw6KU3TFZgEkezQeRlG6QGW4V/I3DWpVOo7nOXmM
 5IFQqTmsmcRAHsaCcyC29CqfWSFvoSMCOMLc0fyVmVQrDQ/XVhBcvR+DfRI5lg84OrnO
 etm/0zf7OHEmOPAqCZCH3WwkpHMPkw5qSrQgPDGe9otkzcmp8S2Z57Fy5ah8UPDZsLIc
 i1QSmzhS9ZpY/KoVxYzsM45WiYdK1I+dRCw68lKdjmfy8awhwL5eSr4OV3+fqS8SlcXm
 C/9+MgMUj9WkRjQkmKPBdCP3JAZsqtC2IjRMeMpWUwKcqJe4hMDDAZCeWL7FYHCj+bCi
 iZZw==
X-Forwarded-Encrypted: i=1;
 AJvYcCW0LYnP3g4EDvxT8bVXDXSEwSizRT7hptcG84K8C+kuSJtqtlgjZ6wQmi7Y+l/WOFbE6Mvde+JJyTdmZuFWnr5XnsRfiD0m8zQI+PeWct3N
X-Gm-Message-State: AOJu0Yz3HkDEyCtzLP0Ppq5j9FbUo62sgLO88L6LkEgUjLQBwS0slxfd
 Gh+R7KNQ1josfHz+1fv/pAChYMhnDChwRt3r8Hwu36EcT8Qe6UsSCsghyyPXOkw/i1R3l94puZe
 ERZu6txUXHJcKmBHaRCdaWLIj4Ieqj1tQu0pVxg==
X-Google-Smtp-Source: AGHT+IEAYszVmONd9WFRIl8XLspjDCopUYw6S6qPqmgIeZkQQTGphg+e0dz0ezSFN7crgqieY6cxct7ubknDXA63tu0=
X-Received: by 2002:a81:77c5:0:b0:643:aef1:fb9d with SMTP id
 00721157ae682-6637f0c9bd5mr20216307b3.4.1721127595205; Tue, 16 Jul 2024
 03:59:55 -0700 (PDT)
MIME-Version: 1.0
References: <20240627-tdp158-v3-0-fb2fbc808346@freebox.fr>
 <20240627-tdp158-v3-1-fb2fbc808346@freebox.fr>
 <20240701-bug-of-great-honeydew-cfb6ef@houat>
 <e7bbbe4e-7deb-46c3-9cce-1922f9b6b3a2@freebox.fr>
 <20240708-ethereal-romantic-piculet-d4ae66@houat>
 <pp3rc5zob3xeghlatw4vnpzplc4yjpjadkea465zmhft55dyl5@3cpoc2zovftv>
 <20240715-shiny-enigmatic-firefly-2a6dec@houat>
 <CAA8EJpoJ0132ZYGCO=8xQt8J4Z9w5jDON1H-VRCemFdyV-9nUw@mail.gmail.com>
 <20240716-exuberant-diligent-beagle-c43ffc@houat>
In-Reply-To: <20240716-exuberant-diligent-beagle-c43ffc@houat>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Tue, 16 Jul 2024 13:59:43 +0300
Message-ID: <CAA8EJppwWN8vBPv0cE0Fmt5rtP60RS4qgB5n6_CfuaQdLLpGDw@mail.gmail.com>
Subject: Re: [PATCH v3 1/2] dt-bindings: display: bridge: add TI TDP158
To: Maxime Ripard <mripard@kernel.org>
Cc: Marc Gonzalez <mgonzalez@freebox.fr>, Conor Dooley <conor+dt@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Rob Herring <robh@kernel.org>, 
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Liam Girdwood <lgirdwood@gmail.com>, 
 Mark Brown <broonie@kernel.org>, dri-devel@lists.freedesktop.org, 
 devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 Arnaud Vrac <avrac@freebox.fr>, Pierre-Hugues Husson <phhusson@freebox.fr>
Content-Type: text/plain; charset="UTF-8"
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

On Tue, 16 Jul 2024 at 12:24, Maxime Ripard <mripard@kernel.org> wrote:
>
> Hi,
>
> On Mon, Jul 15, 2024 at 07:38:34PM GMT, Dmitry Baryshkov wrote:
> > On Mon, 15 Jul 2024 at 17:42, Maxime Ripard <mripard@kernel.org> wrote:
> > >
> > > On Mon, Jul 08, 2024 at 11:29:46PM GMT, Dmitry Baryshkov wrote:
> > > > On Mon, Jul 08, 2024 at 04:59:23PM GMT, Maxime Ripard wrote:
> > > > > On Mon, Jul 01, 2024 at 05:36:18PM GMT, Marc Gonzalez wrote:
> > > > > > On 01/07/2024 15:50, Maxime Ripard wrote:
> > > > > >
> > > > > > > On Thu, Jun 27, 2024 at 01:13:03PM GMT, Marc Gonzalez wrote:
> > > > > > >
> > > > > > >> TDP158 is an AC-coupled DVI / HDMI to TMDS level shifting Redriver.
> > > > > > >> It supports DVI 1.0, HDMI 1.4b and 2.0b.
> > > > > > >> It supports 4 TMDS channels, HPD, and a DDC interface.
> > > > > > >> It supports dual power supply rails (1.1V on VDD, 3.3V on VCC)
> > > > > > >> for power reduction. Several methods of power management are
> > > > > > >> implemented to reduce overall power consumption.
> > > > > > >> It supports fixed receiver EQ gain using I2C or pin strap to
> > > > > > >> compensate for different lengths input cable or board traces.
> > > > > > >>
> > > > > > >> Features
> > > > > > >>
> > > > > > >> - AC-coupled TMDS or DisplayPort dual-mode physical layer input
> > > > > > >> to HDMI 2.0b TMDS physical layer output supporting up to 6Gbps
> > > > > > >> data rate, compatible with HDMI 2.0b electrical parameters
> > > > > > >> - DisplayPort dual-mode standard version 1.1
> > > > > > >> - Programmable fixed receiver equalizer up to 15.5dB
> > > > > > >> - Global or independent high speed lane control, pre-emphasis
> > > > > > >> and transmit swing, and slew rate control
> > > > > > >> - I2C or pin strap programmable
> > > > > > >> - Configurable as a DisplayPort redriver through I2C
> > > > > > >> - Full lane swap on main lanes
> > > > > > >> - Low power consumption (200 mW at 6Gbps, 8 mW in shutdown)
> > > > > > >>
> > > > > > >> https://www.ti.com/lit/ds/symlink/tdp158.pdf
> > > > > > >>
> > > > > > >> Signed-off-by: Marc Gonzalez <mgonzalez@freebox.fr>
> > > > > > >> ---
> > > > > > >>  .../bindings/display/bridge/ti,tdp158.yaml         | 51 ++++++++++++++++++++++
> > > > > > >>  1 file changed, 51 insertions(+)
> > > > > > >>
> > > > > > >> diff --git a/Documentation/devicetree/bindings/display/bridge/ti,tdp158.yaml b/Documentation/devicetree/bindings/display/bridge/ti,tdp158.yaml
> > > > > > >> new file mode 100644
> > > > > > >> index 0000000000000..21c8585c3bb2d
> > > > > > >> --- /dev/null
> > > > > > >> +++ b/Documentation/devicetree/bindings/display/bridge/ti,tdp158.yaml
> > > > > > >> @@ -0,0 +1,51 @@
> > > > > > >> +# SPDX-License-Identifier: GPL-2.0-only
> > > > > > >> +%YAML 1.2
> > > > > > >> +---
> > > > > > >> +$id: http://devicetree.org/schemas/display/bridge/ti,tdp158.yaml#
> > > > > > >> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > > > > > >> +
> > > > > > >> +title: TI TDP158 HDMI to TMDS Redriver
> > > > > > >> +
> > > > > > >> +maintainers:
> > > > > > >> +  - Arnaud Vrac <avrac@freebox.fr>
> > > > > > >> +  - Pierre-Hugues Husson <phhusson@freebox.fr>
> > > > > > >> +
> > > > > > >> +properties:
> > > > > > >> +  compatible:
> > > > > > >> +    const: ti,tdp158
> > > > > > >> +
> > > > > > >> +  reg:
> > > > > > >> +    description: I2C address of the device
> > > > > > >> +
> > > > > > >> +  enable-gpios:
> > > > > > >> +    description: GPIO controlling bridge enable
> > > > > > >> +
> > > > > > >> +  vcc-supply:
> > > > > > >> +    description: Power supply 3.3V
> > > > > > >> +
> > > > > > >> +  vdd-supply:
> > > > > > >> +    description: Power supply 1.1V
> > > > > > >> +
> > > > > > >> +  ports:
> > > > > > >> +    $ref: /schemas/graph.yaml#/properties/ports
> > > > > > >> +
> > > > > > >> +    properties:
> > > > > > >> +      port@0:
> > > > > > >> +        $ref: /schemas/graph.yaml#/properties/port
> > > > > > >> +        description: Bridge input
> > > > > > >> +
> > > > > > >> +      port@1:
> > > > > > >> +        $ref: /schemas/graph.yaml#/properties/port
> > > > > > >> +        description: Bridge output
> > > > > > >> +
> > > > > > >> +    required:
> > > > > > >> +      - port@0
> > > > > > >> +      - port@1
> > > > > > >
> > > > > > > The device supports DVI, HDMI or DP input, with various requirements and
> > > > > > > capabilities depending on the input. Your binding doesn't address that.
> > > > > > >
> > > > > > > Similarly, it can do lane-swapping, so we should probably have a
> > > > > > > property to describe what mapping we want to use.
> > > > > > >
> > > > > > > The i2c register access (and the whole behaviour of the device) is
> > > > > > > constrained on the I2C_EN pin status, and you can't read it from the
> > > > > > > device, so it's also something we need to have in the DT.
> > > > > >
> > > > > > We are using the device in its default configuration.
> > > > > > (Power on via OE, then it works as expected)
> > > > >
> > > > > I know, but that doesn't really matter for a binding.
> > > > >
> > > > > > Can we leave any additional properties to be defined by whomever needs
> > > > > > them in the future?
> > > > >
> > > > > If you can guarantee that doing so would be backward compatible, sure.
> > > > > But that means being able to answer those questions with a reasonable
> > > > > plan.
> > > >
> > > > I think proposed bindings are generic enough to cover other possible
> > > > usecases in future.
> > >
> > > I don't think it is. The current binding is for a I2C device that
> > > shouldn't be accessed through I2C.
> > >
> > > It's working for now because the driver doesn't do any access, so it's
> > > all great, but as soon as we add support for the other case, then we'll
> > > have to add a property that states that while it's an i2c device, it
> > > shouldn't be accessed.
> > >
> > > And adding such a property is a compatibility-breaking change.
> >
> > Please correct me if I'm wrong. We have following usecases.
> >
> > 1. I2C_EN pulled low. TI158 is in the pin strap mode, it is not
> > connected to the I2C bus. A0, A1, SDA and SCL pins are used for
> > strapping the settings.
> >     board DT file should describe the bridge as a platform device
> > sitting directly under the root node.
>
> DT maintainers have required that reg is always present in the other
> sub-thread.

If I2C_EN is pulled low, there is no reg, as there is no i2c bus
whatsoever. I2C pins are repurposed as pin straps, An pins are
repurposed as pin straps.

I think DT maintainers wanted reg for the 2.a. case - in other words
the bridge is present on the I2C bus, but it is not being programmed.

>
> > 2. I2C_EN pulled high. TI158 is in the I2C mode. It is connected to
> > the I2C bus, A0/A1 pins set the I2C bus address. The device is
> > controlled over the I2C bus
> >
> > 2.a. The same as 2, but the device is not controlled at all, default
> > settings are fine.
> >
> > The driver covers usecase 2.a. The bindings allow extending the driver
> > to the usecase 2 (e.g. via optional properties which specify
> > bord-specific settings)
> >
> > The usecase 1 is a completely separate topic, it requires a different
> > schema file, specifying no i2c address, only voltages supplies and
> > enable-gpios.
>
> I could have mis-unnderstood, but my understanding was that they were
> running it with I2C_EN tied low.

That was my initial assumption, but I think Arnoud pointed out that
the bridge is connected to I2C, just not controlled as defaults are
sane.

> Of course, that's one of the thing that is completely missing from the
> commit log, so who knows.

Or from the cover letter :-(

-- 
With best wishes
Dmitry
