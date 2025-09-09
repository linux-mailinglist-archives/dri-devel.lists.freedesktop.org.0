Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 21604B502D3
	for <lists+dri-devel@lfdr.de>; Tue,  9 Sep 2025 18:39:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2BE2310E071;
	Tue,  9 Sep 2025 16:39:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="OYT3iIMU";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com
 [209.85.221.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7D71E10E071
 for <dri-devel@lists.freedesktop.org>; Tue,  9 Sep 2025 16:39:15 +0000 (UTC)
Received: by mail-wr1-f52.google.com with SMTP id
 ffacd0b85a97d-3c6abcfd142so2944371f8f.2
 for <dri-devel@lists.freedesktop.org>; Tue, 09 Sep 2025 09:39:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1757435954; x=1758040754; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=KxhOPZTQq7sqGJRVTULQC/P4pZE3c3LY5+Q2+xI6GjA=;
 b=OYT3iIMUpyyVepkpHgLJeYBk0jrO/UrpaIYbk4JK99Xtj+vHK67YD2Qynyf89ROtuH
 Yw2CLo73JxlrkE/0UjrPo5DnCANgF5BjNYt0aQi2t4W6afjudgHoEOvp7wbyyvSDLnCJ
 jHhUGUYGCKTy1+I1aGNA6Er2X9bfnElyYA0lanP6ozX12rKp0WF5JrbSs2x9cGCHCLu3
 WlAa/cCfhUIFzCGxVQalpV/rEny3aNtCoMNGdsdMyKEiftKR6Q6lUaNyqunkf4rBzM/r
 H6z+kEUSsE3ZGioAWF2HoEp97Ug8D6dPvFs5/un8THkMvcZ1tXoBbNzBUKqXCA72ZVlu
 TZEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1757435954; x=1758040754;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=KxhOPZTQq7sqGJRVTULQC/P4pZE3c3LY5+Q2+xI6GjA=;
 b=CuovO4oMxMNQ5No9kPRiH5751OJSJouFlI1QW0640zC0EyxOQ+AMM4Mm2nmAzN9Hy6
 rFQfaxblXWgUvYYY8p1boibPuUOgB0pgO94Q6KUIwDW0TfiokFI42fewQMxlkQkUQJd2
 P7DA4PWSNCJh/EB4kHO0+ipHK8vKRCercKlNaEAPecQmKX4akwJmrRNja3q5WuIO/m9x
 ijSE5lA+2I8vQakz7kLJUVRUPRbcadyWp6FDX7OwoIpT5UrC3t/Wgf/neTyeF0iWmCWu
 5ZPXPzISal9rPljBbfRVPHFhcKcnzKsUU8zEm+pV/krgI4DSwxIiLMxB2BQ9TRoHeqlC
 sJlg==
X-Forwarded-Encrypted: i=1;
 AJvYcCX8IIzxwqJfj6QYk+VC2/GV7gjdYi4quGyR6KysSpH9dCY2xjuAHUpDuiVwBnRfSDkO1KkwKO4cZjU=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yw+jm0V7Lha2smNAuzHZRfCOROTWy23hMNp14P6jBVMvttTzdUz
 uVjwuvfTaLVbDKTjAeh8ZYjvAY0ek4VJNmeNMIbi/FYKA1dpeAI811OrgexrK3R5zT3WFOvK3bu
 yvriibiTJrFkFwK7UNGJuaA60/xYMiwU=
X-Gm-Gg: ASbGnctMHvZ3uDKaqH3LoVJrm8FPw9XD/AP+kBIIOu+WXrEWcIFMXLIaMz5O2FKkndk
 N2sPBvXjRckUjFB5WDVlzMo4nCabflrdZphWa4GA5S9Up3LUh8GiPyNkWlvB4O/ub+PXytj61/G
 p0D/OBallROw0TO5VFqeJLf9nS8+ny6WhrriGr8mPax24yPbeFA/l5oaKZiQ0JDVBIRkucB8cSA
 TbN+g0Q6nCpcU/LhXc=
X-Google-Smtp-Source: AGHT+IE719pON7bjW3h7Pxo6Zwv7j4wO6C6yHv1+0gkBov4ncj4aRc8dSsBEqve/XMqO38b0jRKxjfPeR4SSiGc+93Y=
X-Received: by 2002:a05:6000:2007:b0:3e4:957d:d00 with SMTP id
 ffacd0b85a97d-3e646256c26mr9490870f8f.58.1757435953630; Tue, 09 Sep 2025
 09:39:13 -0700 (PDT)
MIME-Version: 1.0
References: <20250906135345.241229-1-clamor95@gmail.com>
 <20250906135345.241229-22-clamor95@gmail.com>
 <20250909162600.GA3311232-robh@kernel.org>
In-Reply-To: <20250909162600.GA3311232-robh@kernel.org>
From: Svyatoslav Ryhel <clamor95@gmail.com>
Date: Tue, 9 Sep 2025 19:39:02 +0300
X-Gm-Features: AS18NWAimCnhRNNI0ZxJa9Ij71gTHj2WzcPOMYpvIbqR0Xml1RRy19Xe-mETbJU
Message-ID: <CAPVz0n2Hafvnk4BBXfhWLWCfTg336DLOr=xN9vKBGc2xEWYrMw@mail.gmail.com>
Subject: Re: [PATCH v2 21/23] dt-bindings: display: tegra: document Tegra20
 and Tegra30 CSI
To: Rob Herring <robh@kernel.org>
Cc: Thierry Reding <thierry.reding@gmail.com>,
 Thierry Reding <treding@nvidia.com>, 
 Mikko Perttunen <mperttunen@nvidia.com>, Jonathan Hunter <jonathanh@nvidia.com>,
 Sowjanya Komatineni <skomatineni@nvidia.com>,
 Luca Ceresoli <luca.ceresoli@bootlin.com>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Prashant Gaikwad <pgaikwad@nvidia.com>, 
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Dmitry Osipenko <digetx@gmail.com>,
 =?UTF-8?Q?Jonas_Schw=C3=B6bel?= <jonasschwoebel@yahoo.de>, 
 Charan Pedumuru <charan.pedumuru@gmail.com>, dri-devel@lists.freedesktop.org, 
 devicetree@vger.kernel.org, linux-tegra@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, 
 linux-clk@vger.kernel.org, linux-staging@lists.linux.dev
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

=D0=B2=D1=82, 9 =D0=B2=D0=B5=D1=80. 2025=E2=80=AF=D1=80. =D0=BE 19:26 Rob H=
erring <robh@kernel.org> =D0=BF=D0=B8=D1=88=D0=B5:
>
> On Sat, Sep 06, 2025 at 04:53:42PM +0300, Svyatoslav Ryhel wrote:
> > Document CSI HW block found in Tegra20 and Tegra30 SoC.
> >
> > Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
> > ---
> >  .../display/tegra/nvidia,tegra20-csi.yaml     | 104 ++++++++++++++++
> >  .../display/tegra/nvidia,tegra30-csi.yaml     | 115 ++++++++++++++++++
> >  2 files changed, 219 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/display/tegra/nvi=
dia,tegra20-csi.yaml
> >  create mode 100644 Documentation/devicetree/bindings/display/tegra/nvi=
dia,tegra30-csi.yaml
> >
> > diff --git a/Documentation/devicetree/bindings/display/tegra/nvidia,teg=
ra20-csi.yaml b/Documentation/devicetree/bindings/display/tegra/nvidia,tegr=
a20-csi.yaml
> > new file mode 100644
> > index 000000000000..1a2858a5893c
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/display/tegra/nvidia,tegra20-cs=
i.yaml
> > @@ -0,0 +1,104 @@
> > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > +%YAML 1.2
> > +---
> > +$id: http://devicetree.org/schemas/display/tegra/nvidia,tegra20-csi.ya=
ml#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: NVIDIA Tegra20 CSI controller
> > +
> > +maintainers:
> > +  - Svyatoslav Ryhel <clamor95@gmail.com>
> > +
> > +properties:
> > +  compatible:
> > +    enum:
> > +      - nvidia,tegra20-csi
> > +
> > +  reg:
> > +    maxItems: 1
> > +
> > +  clocks:
> > +    maxItems: 1
> > +
> > +  avdd-dsi-csi-supply:
> > +    description: DSI/CSI power supply. Must supply 1.2 V.
> > +
> > +  power-domains:
> > +    maxItems: 1
> > +
> > +  "#nvidia,mipi-calibrate-cells":
> > +    description: The number of cells in a MIPI calibration specifier.
> > +      Should be 1. The single cell specifies an id of the pads that
> > +      need to be calibrated for a given device.
> > +    $ref: /schemas/types.yaml#/definitions/uint32
> > +    const: 1
>
> This property goes in the provider. Is the parent node the provider? You
> don't really need any of it if it's all one block.
>

Yes parent node is provides and channel is one of receivers, other one
is DSI node.

> > +
> > +  "#address-cells":
> > +    const: 1
> > +
> > +  "#size-cells":
> > +    const: 0
> > +
> > +patternProperties:
> > +  "^channel@[0-1]$":
> > +    type: object
> > +    description: channel 0 represents CSI-A and 1 represents CSI-B
> > +    additionalProperties: false
> > +
> > +    properties:
> > +      reg:
> > +        maxItems: 1
>
> Instead:
>
> maximum: 1
>
>
> > +
> > +      nvidia,mipi-calibrate:
> > +        description: Should contain a phandle and a specifier specifyi=
ng
> > +          which pads are used by this DSI output and need to be
> > +          calibrated. 0 is for CSI-A, 1 is for CSI-B, 2 is for DSI.
> > +        $ref: /schemas/types.yaml#/definitions/phandle-array
>
> Is DSI applicable here?
>

It is because CSI is calibration provider. I can move it up into
#nvidia,mipi-calibrate-cells which may be more appropriate place.

> > +
> > +      "#address-cells":
> > +        const: 1
> > +
> > +      "#size-cells":
> > +        const: 0
> > +
> > +      port@0:
> > +        $ref: /schemas/graph.yaml#/$defs/port-base
> > +        unevaluatedProperties: false
> > +        description: port receiving the video stream from the sensor
> > +
> > +        properties:
> > +          endpoint:
> > +            $ref: /schemas/media/video-interfaces.yaml#
> > +            unevaluatedProperties: false
> > +
> > +            properties:
> > +              data-lanes: true
>
> Drop. No need unless you have some constraints like number of lanes?
>
> > +
> > +            required:
> > +              - data-lanes
> > +
> > +        required:
> > +          - endpoint
>
> Drop.
>
> > +
> > +      port@1:
> > +        $ref: /schemas/graph.yaml#/properties/port
> > +        description: port sending the video stream to the VI
> > +
> > +    required:
> > +      - reg
> > +      - "#address-cells"
> > +      - "#size-cells"
> > +      - port@0
> > +      - port@1
> > +
> > +additionalProperties: false
> > +
> > +required:
> > +  - compatible
> > +  - reg
> > +  - clocks
> > +  - power-domains
> > +  - "#address-cells"
> > +  - "#size-cells"
> > +
> > +# see nvidia,tegra20-vi.yaml for an example
> > diff --git a/Documentation/devicetree/bindings/display/tegra/nvidia,teg=
ra30-csi.yaml b/Documentation/devicetree/bindings/display/tegra/nvidia,tegr=
a30-csi.yaml
> > new file mode 100644
> > index 000000000000..ea5ebd2f3c65
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/display/tegra/nvidia,tegra30-cs=
i.yaml
> > @@ -0,0 +1,115 @@
> > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > +%YAML 1.2
> > +---
> > +$id: http://devicetree.org/schemas/display/tegra/nvidia,tegra30-csi.ya=
ml#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: NVIDIA Tegra30 CSI controller
> > +
> > +maintainers:
> > +  - Svyatoslav Ryhel <clamor95@gmail.com>
> > +
> > +properties:
> > +  compatible:
> > +    enum:
> > +      - nvidia,tegra30-csi
> > +
> > +  reg:
> > +    maxItems: 1
> > +
> > +  clocks:
> > +    items:
> > +      - description: module clock
> > +      - description: PAD A clock
> > +      - description: PAD B clock
> > +
> > +  clock-names:
> > +    items:
> > +      - const: csi
> > +      - const: csia-pad
> > +      - const: csib-pad
>
> Looks like clocks are the only difference? I think these 2 schemas can
> be merged.
>
> > +
> > +  avdd-dsi-csi-supply:
> > +    description: DSI/CSI power supply. Must supply 1.2 V.
> > +
> > +  power-domains:
> > +    maxItems: 1
> > +
> > +  "#nvidia,mipi-calibrate-cells":
> > +    description: The number of cells in a MIPI calibration specifier.
> > +      Should be 1. The single cell specifies an id of the pads that
> > +      need to be calibrated for a given device.
> > +    $ref: /schemas/types.yaml#/definitions/uint32
> > +    const: 1
> > +
> > +  "#address-cells":
> > +    const: 1
> > +
> > +  "#size-cells":
> > +    const: 0
> > +
> > +patternProperties:
> > +  "^channel@[0-1]$":
> > +    type: object
> > +    description: channel 0 represents CSI-A and 1 represents CSI-B
> > +    additionalProperties: false
> > +
> > +    properties:
> > +      reg:
> > +        maxItems: 1
> > +
> > +      nvidia,mipi-calibrate:
> > +        description: Should contain a phandle and a specifier specifyi=
ng
> > +          which pads are used by this DSI output and need to be
> > +          calibrated. 0 is for CSI-A, 1 is for CSI-B, 2 is for DSI-A a=
nd
> > +          3 is for DSI-B
> > +        $ref: /schemas/types.yaml#/definitions/phandle-array
> > +
> > +      "#address-cells":
> > +        const: 1
> > +
> > +      "#size-cells":
> > +        const: 0
> > +
> > +      port@0:
> > +        $ref: /schemas/graph.yaml#/$defs/port-base
> > +        unevaluatedProperties: false
> > +        description: port receiving the video stream from the sensor
> > +
> > +        properties:
> > +          endpoint:
> > +            $ref: /schemas/media/video-interfaces.yaml#
> > +            unevaluatedProperties: false
> > +
> > +            properties:
> > +              data-lanes: true
> > +
> > +            required:
> > +              - data-lanes
> > +
> > +        required:
> > +          - endpoint
> > +
> > +      port@1:
> > +        $ref: /schemas/graph.yaml#/properties/port
> > +        description: port sending the video stream to the VI
> > +
> > +    required:
> > +      - reg
> > +      - "#address-cells"
> > +      - "#size-cells"
> > +      - port@0
> > +      - port@1
> > +
> > +additionalProperties: false
> > +
> > +required:
> > +  - compatible
> > +  - reg
> > +  - clocks
> > +  - clock-names
> > +  - power-domains
> > +  - "#address-cells"
> > +  - "#size-cells"
> > +
> > +# see nvidia,tegra20-vi.yaml for an example
> > --
> > 2.48.1
> >

Every comment which was not answered will be applied, thank you
