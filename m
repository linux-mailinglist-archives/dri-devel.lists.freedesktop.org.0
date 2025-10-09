Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 94FB3BC7705
	for <lists+dri-devel@lfdr.de>; Thu, 09 Oct 2025 07:35:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6576410E1F0;
	Thu,  9 Oct 2025 05:35:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="M1MzS/CU";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com
 [209.85.221.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E577710E1F0
 for <dri-devel@lists.freedesktop.org>; Thu,  9 Oct 2025 05:35:35 +0000 (UTC)
Received: by mail-wr1-f44.google.com with SMTP id
 ffacd0b85a97d-3f2cf786abeso470047f8f.3
 for <dri-devel@lists.freedesktop.org>; Wed, 08 Oct 2025 22:35:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1759988134; x=1760592934; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=wojdy8oISaReFb3V/aujCr+dYfQppmzTEbdq6Sq+uyc=;
 b=M1MzS/CU+hHlC4GERE6reHiIFBQezJyRrvOatFQkEvS0Lraz4HGW0ZZBuw6Pl0REZc
 +Sf4ocqevVkjgzKMPMgAUXSpXKb4NyCTjDaAb0InYxE5tYy1d7oq/AFUl3fvhfbpmf1r
 YWm3o8oDOUJcLfSc7O5XQcm7z27VhLO02r+dsIYBztvMM5ObcaLaoKB18mAaEpjV7qeo
 qo5UY4tODim42jv3C2q2yTDo3BiiKNItwKKNhC/h+ssncGy/iwrfQPwf8eKtbHBsVw6y
 X/c1Ea2HSuznkBXhoVOXGVPgCRacSqd5xOXhc1z1MiuXogVHHashM9b9w3um1GqV8hGq
 ILYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1759988134; x=1760592934;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=wojdy8oISaReFb3V/aujCr+dYfQppmzTEbdq6Sq+uyc=;
 b=VckgP8XUj4xAerbPhPiKnikL25PuxbSQttvFRjid1VUgd1elZorS0solAvfBo8l0SN
 QNXObEhOw4AZOaj0KLsMf2FYymSIj/3oQitScgNqbnuXOirc2yHmRdFdTdjGAVnFhQAr
 1f3AVPfQR56fbFFUXhzC8uiYBuTjlBRN+ZodJ4YaFQzTSZdPBPFPYlz42CXjXx0fMhXD
 ppxgq/ZM8kZHwF6khnnZyQ73jTIL0y6S+aHNngkJbwM1dgNn+1sLVtsWKJ71py8GjMzk
 Y1n3TARLfyS52zHnex7DHuorEFjLN9DGEstC5QdmKXpVzYQ25GMeuqVxFIiWp4JssTOM
 RrTA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUDqwF45g6g3f7FYj3C7fndMjtdP14HXdV2fvIeA6tXN+qVPGxTCILD3ZuvOZDjofiqow+htzY2ojs=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwsI6D1EgA981A7L3RMldg1Fpty1WPGp0ZCHN+f0DEI9NceJC7o
 PKsoDMtnqJqnCvXbh5RrrdY0tgllmpTAb8FJROEWrfTCjgsPKEsecumU2V0ASHWPmzGKFNIlgg2
 22+WXRBi8YACh28zRr1r8NUnP9xhzsEg=
X-Gm-Gg: ASbGncsyKj05PXVURRLhur1QGt16XxuH913j3DUqeUZyH6Fx8gzN9yZ93VmH4Mlwfy+
 wG4XaIxjSszOreP6PeaTWNUaWDHnmaoy4I5Dmg0FOpsjMBvkV10rRVuwYkVdcNaB70HD8NaaSIi
 2A67AwDzmtIiAu7NgTzLjPnVHfl/wtmnRnouCxvdJZgSTALgpSTHpupv7I+/QeL60i7frZNvPUc
 Dn1LcqJvoxlv+QgiEfgqA3e/b0O66vo6fH9PmCZWxQ=
X-Google-Smtp-Source: AGHT+IGSKa0WWY8sQb7NirdhuUY9zlBVWAF8olfr4D2aOoKgmjKIIKXTBxs4oAP40QHdR3v89s2ItSY5dd09ZKpNd5w=
X-Received: by 2002:a05:6000:186c:b0:3ed:e1d8:bd68 with SMTP id
 ffacd0b85a97d-42666ac6107mr3102943f8f.7.1759988134193; Wed, 08 Oct 2025
 22:35:34 -0700 (PDT)
MIME-Version: 1.0
References: <20251008073046.23231-1-clamor95@gmail.com>
 <20251008073046.23231-23-clamor95@gmail.com>
 <20251008-canopener-marsupial-a92355b656ef@spud>
 <20251008-broaden-antennae-02de66094ad3@spud>
In-Reply-To: <20251008-broaden-antennae-02de66094ad3@spud>
From: Svyatoslav Ryhel <clamor95@gmail.com>
Date: Thu, 9 Oct 2025 08:35:22 +0300
X-Gm-Features: AS18NWAoEWc39K5OD4GIBOR3Awt1LVDq6NQUxGEQwh6PoTXJKtyEajbgSJmBgBo
Message-ID: <CAPVz0n1NYL+t-KC1FwHYXuQ0C483ay3g8zP4SmBKVC2rh=x4Bg@mail.gmail.com>
Subject: Re: [PATCH v4 22/24] dt-bindings: display: tegra: document Tegra20
 and Tegra30 CSI
To: Conor Dooley <conor@kernel.org>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, 
 Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>, 
 Sowjanya Komatineni <skomatineni@nvidia.com>,
 Luca Ceresoli <luca.ceresoli@bootlin.com>, 
 Prashant Gaikwad <pgaikwad@nvidia.com>,
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Mikko Perttunen <mperttunen@nvidia.com>, 
 Linus Walleij <linus.walleij@linaro.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 =?UTF-8?Q?Jonas_Schw=C3=B6bel?= <jonasschwoebel@yahoo.de>, 
 Dmitry Osipenko <digetx@gmail.com>, Charan Pedumuru <charan.pedumuru@gmail.com>,
 Diogo Ivo <diogo.ivo@tecnico.ulisboa.pt>, Aaron Kling <webgeek1234@gmail.com>, 
 Arnd Bergmann <arnd@arndb.de>, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, 
 linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-media@vger.kernel.org, linux-clk@vger.kernel.org, 
 linux-gpio@vger.kernel.org, linux-staging@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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

=D1=87=D1=82, 9 =D0=B6=D0=BE=D0=B2=D1=82. 2025=E2=80=AF=D1=80. =D0=BE 00:22=
 Conor Dooley <conor@kernel.org> =D0=BF=D0=B8=D1=88=D0=B5:
>
> On Wed, Oct 08, 2025 at 10:21:06PM +0100, Conor Dooley wrote:
> > On Wed, Oct 08, 2025 at 10:30:44AM +0300, Svyatoslav Ryhel wrote:
> > > Document CSI HW block found in Tegra20 and Tegra30 SoC.
> > >
> > > The #nvidia,mipi-calibrate-cells is not an introduction of property, =
such
> > > property already exists in nvidia,tegra114-mipi.yaml and is used in
> > > multiple device trees. In case of Tegra30 and Tegra20 CSI block combi=
nes
> > > mipi calibration function and CSI function, in Tegra114+ mipi calibra=
tion
> > > got a dedicated hardware block which is already supported. This prope=
rty
> > > here is used to align with mipi-calibration logic used by Tegra114+.
> > >
> > > Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
> > > ---
> > >  .../display/tegra/nvidia,tegra20-csi.yaml     | 135 ++++++++++++++++=
++
> > >  1 file changed, 135 insertions(+)
> > >  create mode 100644 Documentation/devicetree/bindings/display/tegra/n=
vidia,tegra20-csi.yaml
> > >
> > > diff --git a/Documentation/devicetree/bindings/display/tegra/nvidia,t=
egra20-csi.yaml b/Documentation/devicetree/bindings/display/tegra/nvidia,te=
gra20-csi.yaml
> > > new file mode 100644
> > > index 000000000000..817b3097846b
> > > --- /dev/null
> > > +++ b/Documentation/devicetree/bindings/display/tegra/nvidia,tegra20-=
csi.yaml
> > > @@ -0,0 +1,135 @@
> > > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > > +%YAML 1.2
> > > +---
> > > +$id: http://devicetree.org/schemas/display/tegra/nvidia,tegra20-csi.=
yaml#
> > > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > > +
> > > +title: NVIDIA Tegra20 CSI controller
> > > +
> > > +maintainers:
> > > +  - Svyatoslav Ryhel <clamor95@gmail.com>
> > > +
> > > +properties:
> > > +  compatible:
> > > +    enum:
> > > +      - nvidia,tegra20-csi
> > > +      - nvidia,tegra30-csi
> > > +
> > > +  reg:
> > > +    maxItems: 1
> > > +
> > > +  clocks: true
> > > +  clock-names: true
> > > +
> > > +  avdd-dsi-csi-supply:
> > > +    description: DSI/CSI power supply. Must supply 1.2 V.
> > > +
> > > +  power-domains:
> > > +    maxItems: 1
> > > +
> > > +  "#nvidia,mipi-calibrate-cells":
> > > +    description:
> > > +      The number of cells in a MIPI calibration specifier. Should be=
 1.
> > > +      The single cell specifies an id of the pad that need to be
> > > +      calibrated for a given device. Valid pad ids for receiver woul=
d be
> > > +      0 for CSI-A; 1 for CSI-B; 2 for DSI-A and 3 for DSI-B.
> > > +    $ref: /schemas/types.yaml#/definitions/uint32
> > > +    const: 1
> > > +
> > > +  "#address-cells":
> > > +    const: 1
> > > +
> > > +  "#size-cells":
> > > +    const: 0
> > > +
> > > +patternProperties:
> > > +  "^channel@[0-1]$":
> > > +    type: object
> > > +    description: channel 0 represents CSI-A and 1 represents CSI-B
> > > +    additionalProperties: false
> > > +
> > > +    properties:
> > > +      reg:
> > > +        maximum: 1
> > > +
> > > +      nvidia,mipi-calibrate:
> > > +        description: Should contain a phandle and a specifier specif=
ying
> > > +          which pad is used by this CSI channel and needs to be cali=
brated.
> > > +        $ref: /schemas/types.yaml#/definitions/phandle-array
> > > +
> > > +      "#address-cells":
> > > +        const: 1
> > > +
> > > +      "#size-cells":
> > > +        const: 0
> > > +
> > > +      port@0:
> > > +        $ref: /schemas/graph.yaml#/$defs/port-base
> > > +        unevaluatedProperties: false
> > > +        description: port receiving the video stream from the sensor
> > > +
> > > +        properties:
> > > +          endpoint:
> > > +            $ref: /schemas/media/video-interfaces.yaml#
> > > +            unevaluatedProperties: false
> > > +
> > > +            required:
> > > +              - data-lanes
> > > +
> > > +      port@1:
> > > +        $ref: /schemas/graph.yaml#/properties/port
> > > +        description: port sending the video stream to the VI
> > > +
> > > +    required:
> > > +      - reg
> > > +      - "#address-cells"
> > > +      - "#size-cells"
> > > +      - port@0
> > > +      - port@1
> > > +
> > > +allOf:
> > > +  - if:
> > > +      properties:
> > > +        compatible:
> > > +          contains:
> > > +            enum:
> > > +              - nvidia,tegra20-csi
> > > +    then:
> > > +      properties:
> > > +        clocks:
> > > +          items:
> > > +            - description: module clock
> > > +
> > > +        clock-names: false
> > > +
> > > +  - if:
> > > +      properties:
> > > +        compatible:
> > > +          contains:
> > > +            enum:
> > > +              - nvidia,tegra30-csi
> > > +    then:
> > > +      properties:
> > > +        clocks:
> > > +          items:
> > > +            - description: module clock
> > > +            - description: PAD A clock
> > > +            - description: PAD B clock
> > > +
> > > +        clock-names:
> > > +          items:
> > > +            - const: csi
> > > +            - const: csia-pad
> > > +            - const: csib-pad
> >
> > This clocks section seems like it could get simpler. Since the clock
> > descriptions are shared, and tegra20 has no clock-names, you could just
> > move the detail of the properties out to where you have the ": true"
> > stuff (we prefer that properties are defined outside of if/then/else
> > blocks) and just restrict them here. For tegra20 that'd be
> >
> > if:
> >   properties:
> >     compatible:
> >       contains:
> >         enum:
> >           - nvidia,tegra20-csi
> > then:
> >   properties:
> >     clocks:
> >       maxItems: 1
> >
> >     clock-names: false
> >
> > (although it could easily be maxItems: 1 ?)
> > and for tegra30
> >
> > if:
> >   properties:
> >     compatible:
> >       contains:
> >         enum:
> >           - nvidia,tegra30-csi
> > then:
> >   properties:
> >     clocks:
> >       minItems: 3
> >
> >     clock-names:
> >       maxItems: 3
> >
> > Of course you'd then have to add minItems: 1 and maxItems: 3 to the
> > extracted definitions.

What do you mean by your last statement? Add minItems: 1 and maxItems:
3 like this?

This does to common properties
  clocks:
    minItems: 1
    maxItems: 3
    items:
      - description: module clock
      - description: PAD A clock
      - description: PAD B clock

  clock-names:
    minItems: 1
    maxItems: 3
    items:
      - const: csi
      - const: csia-pad
      - const: csib-pad

This goes to conditional
 if:
   properties:
     compatible:
       contains:
         enum:
           - nvidia,tegra20-csi
 then:
   properties:
     clocks:
       maxItems: 1

     clock-names: false

 if:
   properties:
     compatible:
       contains:
         enum:
           - nvidia,tegra30-csi
 then:
   properties:
     clocks:
       minItems: 3

     clock-names:
       maxItems: 3

>
> Oh, also: if you want clock-names to ever actually be usable, you have
> to require it. Otherwise a driver must be written to handle it not being
> there.
>

Yes, driver takes this into account and handles it.

> > > +additionalProperties: false
> > > +
> > > +required:
> > > +  - compatible
> > > +  - reg
> > > +  - clocks
> > > +  - power-domains
> > > +  - "#address-cells"
> > > +  - "#size-cells"
> > > +
> > > +# see nvidia,tegra20-vi.yaml for an example
> > > --
> > > 2.48.1
> > >
>
>
