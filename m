Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CB03931891
	for <lists+dri-devel@lfdr.de>; Mon, 15 Jul 2024 18:38:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 30CBF10E1D2;
	Mon, 15 Jul 2024 16:38:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="Z+rJs4RD";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-f177.google.com (mail-yw1-f177.google.com
 [209.85.128.177])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2038910E1D2
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Jul 2024 16:38:46 +0000 (UTC)
Received: by mail-yw1-f177.google.com with SMTP id
 00721157ae682-65f880c56b1so21124327b3.3
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Jul 2024 09:38:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1721061525; x=1721666325; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=MMh3CmRk7eNTy43aYCP1b5/BKtC9brxonzF2hzhXLNQ=;
 b=Z+rJs4RDFtmVMHweh5n+OQTmbTRtABAgh+Ycug4rci3P1GgCFMJXhiwXi6V9nFz/cF
 pmvVQ3sSgizZTLPkmLfgE11HGTL7eUGeGgMVJj3sOukTNOWcGvch8zlCezziIjkkIw88
 7UHYs1+cNjdCBWgdsKQIfOoKmYCwEuhs01TGZErY6ACc4VZYaOnNhX4AXLPh65Y+RG1s
 j2xwbfrEdjsUZxMiasWN3OQTggp0GlR4gQ9kFtE+uK0VmYqf2RixaQGZP/XrGo67TzVI
 ZAwdhR9s8JDM/KJVgf8bjgDb8VyD7Zupdmc9+usgh0NN+LXtOokYgvgswwqtmbfit3Rb
 uifg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1721061525; x=1721666325;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=MMh3CmRk7eNTy43aYCP1b5/BKtC9brxonzF2hzhXLNQ=;
 b=gvwoF3Ff2BqWVR4/uQ9AyCoVMFK3NaOzpzrC41sdyk4luF8BpTxrwCkKwddEIvMtJb
 JYk2vAFzNF58W3rFSJmgR9d4f0JI/mNG634AxhpkERKj7ehKPakP08Bm8uPVvJ2WCjpa
 LbawsweoCgV8mC5P/F7y3WdNsb9Yy7HcwSc46BQR8eDsEVBIVvWar1FsRh3AkOuXY4ah
 OsSmZFVuGN0KuB7WIdvA7PxpGm3d10L0a41rmYM/pPGtDH7rdAd3JJ4zwjcO4DBo86so
 ozJqVcV7B5jGqG3iR9X0bqP8qvQiVdjtxF6kcoH1Y5u4Qle87woYMH5r6Md0AsO1/U5q
 6LNA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXDiXDf0cdea3mUkmvyC8Lg7/tBFrlF8cMBmGd29K8MnLSvljpeVXIvhAaOz1ja+PMMHQ8XP5mXAyRZ5c9QdIo97Q0rOFwK7KzzJyLf8740
X-Gm-Message-State: AOJu0YxKzHxLUI0ghZMlCMXbeX32YLg4kV/BGRqvo/lCblgSM9mMUYDv
 arEFFr26nfNFOpbjcTjXhVm7+7dAhLOoxgyvPqww5YTqoW7NgsL214HkuaNej3wC8j4Nv6h1XYV
 eBeHOTvkYXx+ghCLnb+9xQ/BGPIjvDhsxZx10wA==
X-Google-Smtp-Source: AGHT+IExykdLXYD9KCVCHw+nB8pZix6KO0eWJ2+RNg1Z2PRZxAdF/RdKNfFefS9K6D2jDSOTCSoQkkP0691aK8Kjnm0=
X-Received: by 2002:a0d:fc86:0:b0:65f:86a2:b4c5 with SMTP id
 00721157ae682-66355c4366emr123487b3.31.1721061525047; Mon, 15 Jul 2024
 09:38:45 -0700 (PDT)
MIME-Version: 1.0
References: <20240627-tdp158-v3-0-fb2fbc808346@freebox.fr>
 <20240627-tdp158-v3-1-fb2fbc808346@freebox.fr>
 <20240701-bug-of-great-honeydew-cfb6ef@houat>
 <e7bbbe4e-7deb-46c3-9cce-1922f9b6b3a2@freebox.fr>
 <20240708-ethereal-romantic-piculet-d4ae66@houat>
 <pp3rc5zob3xeghlatw4vnpzplc4yjpjadkea465zmhft55dyl5@3cpoc2zovftv>
 <20240715-shiny-enigmatic-firefly-2a6dec@houat>
In-Reply-To: <20240715-shiny-enigmatic-firefly-2a6dec@houat>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Mon, 15 Jul 2024 19:38:34 +0300
Message-ID: <CAA8EJpoJ0132ZYGCO=8xQt8J4Z9w5jDON1H-VRCemFdyV-9nUw@mail.gmail.com>
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

On Mon, 15 Jul 2024 at 17:42, Maxime Ripard <mripard@kernel.org> wrote:
>
> On Mon, Jul 08, 2024 at 11:29:46PM GMT, Dmitry Baryshkov wrote:
> > On Mon, Jul 08, 2024 at 04:59:23PM GMT, Maxime Ripard wrote:
> > > On Mon, Jul 01, 2024 at 05:36:18PM GMT, Marc Gonzalez wrote:
> > > > On 01/07/2024 15:50, Maxime Ripard wrote:
> > > >
> > > > > On Thu, Jun 27, 2024 at 01:13:03PM GMT, Marc Gonzalez wrote:
> > > > >
> > > > >> TDP158 is an AC-coupled DVI / HDMI to TMDS level shifting Redriver.
> > > > >> It supports DVI 1.0, HDMI 1.4b and 2.0b.
> > > > >> It supports 4 TMDS channels, HPD, and a DDC interface.
> > > > >> It supports dual power supply rails (1.1V on VDD, 3.3V on VCC)
> > > > >> for power reduction. Several methods of power management are
> > > > >> implemented to reduce overall power consumption.
> > > > >> It supports fixed receiver EQ gain using I2C or pin strap to
> > > > >> compensate for different lengths input cable or board traces.
> > > > >>
> > > > >> Features
> > > > >>
> > > > >> - AC-coupled TMDS or DisplayPort dual-mode physical layer input
> > > > >> to HDMI 2.0b TMDS physical layer output supporting up to 6Gbps
> > > > >> data rate, compatible with HDMI 2.0b electrical parameters
> > > > >> - DisplayPort dual-mode standard version 1.1
> > > > >> - Programmable fixed receiver equalizer up to 15.5dB
> > > > >> - Global or independent high speed lane control, pre-emphasis
> > > > >> and transmit swing, and slew rate control
> > > > >> - I2C or pin strap programmable
> > > > >> - Configurable as a DisplayPort redriver through I2C
> > > > >> - Full lane swap on main lanes
> > > > >> - Low power consumption (200 mW at 6Gbps, 8 mW in shutdown)
> > > > >>
> > > > >> https://www.ti.com/lit/ds/symlink/tdp158.pdf
> > > > >>
> > > > >> Signed-off-by: Marc Gonzalez <mgonzalez@freebox.fr>
> > > > >> ---
> > > > >>  .../bindings/display/bridge/ti,tdp158.yaml         | 51 ++++++++++++++++++++++
> > > > >>  1 file changed, 51 insertions(+)
> > > > >>
> > > > >> diff --git a/Documentation/devicetree/bindings/display/bridge/ti,tdp158.yaml b/Documentation/devicetree/bindings/display/bridge/ti,tdp158.yaml
> > > > >> new file mode 100644
> > > > >> index 0000000000000..21c8585c3bb2d
> > > > >> --- /dev/null
> > > > >> +++ b/Documentation/devicetree/bindings/display/bridge/ti,tdp158.yaml
> > > > >> @@ -0,0 +1,51 @@
> > > > >> +# SPDX-License-Identifier: GPL-2.0-only
> > > > >> +%YAML 1.2
> > > > >> +---
> > > > >> +$id: http://devicetree.org/schemas/display/bridge/ti,tdp158.yaml#
> > > > >> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > > > >> +
> > > > >> +title: TI TDP158 HDMI to TMDS Redriver
> > > > >> +
> > > > >> +maintainers:
> > > > >> +  - Arnaud Vrac <avrac@freebox.fr>
> > > > >> +  - Pierre-Hugues Husson <phhusson@freebox.fr>
> > > > >> +
> > > > >> +properties:
> > > > >> +  compatible:
> > > > >> +    const: ti,tdp158
> > > > >> +
> > > > >> +  reg:
> > > > >> +    description: I2C address of the device
> > > > >> +
> > > > >> +  enable-gpios:
> > > > >> +    description: GPIO controlling bridge enable
> > > > >> +
> > > > >> +  vcc-supply:
> > > > >> +    description: Power supply 3.3V
> > > > >> +
> > > > >> +  vdd-supply:
> > > > >> +    description: Power supply 1.1V
> > > > >> +
> > > > >> +  ports:
> > > > >> +    $ref: /schemas/graph.yaml#/properties/ports
> > > > >> +
> > > > >> +    properties:
> > > > >> +      port@0:
> > > > >> +        $ref: /schemas/graph.yaml#/properties/port
> > > > >> +        description: Bridge input
> > > > >> +
> > > > >> +      port@1:
> > > > >> +        $ref: /schemas/graph.yaml#/properties/port
> > > > >> +        description: Bridge output
> > > > >> +
> > > > >> +    required:
> > > > >> +      - port@0
> > > > >> +      - port@1
> > > > >
> > > > > The device supports DVI, HDMI or DP input, with various requirements and
> > > > > capabilities depending on the input. Your binding doesn't address that.
> > > > >
> > > > > Similarly, it can do lane-swapping, so we should probably have a
> > > > > property to describe what mapping we want to use.
> > > > >
> > > > > The i2c register access (and the whole behaviour of the device) is
> > > > > constrained on the I2C_EN pin status, and you can't read it from the
> > > > > device, so it's also something we need to have in the DT.
> > > >
> > > > We are using the device in its default configuration.
> > > > (Power on via OE, then it works as expected)
> > >
> > > I know, but that doesn't really matter for a binding.
> > >
> > > > Can we leave any additional properties to be defined by whomever needs
> > > > them in the future?
> > >
> > > If you can guarantee that doing so would be backward compatible, sure.
> > > But that means being able to answer those questions with a reasonable
> > > plan.
> >
> > I think proposed bindings are generic enough to cover other possible
> > usecases in future.
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

Please correct me if I'm wrong. We have following usecases.

1. I2C_EN pulled low. TI158 is in the pin strap mode, it is not
connected to the I2C bus. A0, A1, SDA and SCL pins are used for
strapping the settings.
    board DT file should describe the bridge as a platform device
sitting directly under the root node.

2. I2C_EN pulled high. TI158 is in the I2C mode. It is connected to
the I2C bus, A0/A1 pins set the I2C bus address. The device is
controlled over the I2C bus

2.a. The same as 2, but the device is not controlled at all, default
settings are fine.

The driver covers usecase 2.a. The bindings allow extending the driver
to the usecase 2 (e.g. via optional properties which specify
bord-specific settings)

The usecase 1 is a completely separate topic, it requires a different
schema file, specifying no i2c address, only voltages supplies and
enable-gpios.



--
With best wishes
Dmitry
