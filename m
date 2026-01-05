Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E6D44CF4A3F
	for <lists+dri-devel@lfdr.de>; Mon, 05 Jan 2026 17:20:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E589D10E498;
	Mon,  5 Jan 2026 16:20:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="SjyOu1jv";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9A1D310E4A2
 for <dri-devel@lists.freedesktop.org>; Mon,  5 Jan 2026 16:20:55 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id A2AB460148
 for <dri-devel@lists.freedesktop.org>; Mon,  5 Jan 2026 16:20:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4A77CC2BCB1
 for <dri-devel@lists.freedesktop.org>; Mon,  5 Jan 2026 16:20:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1767630054;
 bh=NukNRG8cCLvj5Dx0ePjiHo3AWT0zmoJjI8U969/fmiI=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=SjyOu1jvthRV9iPD3okrpQgPnFncuaPsY1hr9SnI7Ch8xzMwhiy7mIEVFPJD2mrw2
 uEtJLmwp2RjVVjGQ2xLywBbbYJEcPMn/6IxEgVJozoCgKMW1o8M7SqohH7I69Laz6x
 EIJHsD1Z8u60ko9N95OJ1FX7eUJ3iTfG4HTUjIi2t0BhJgt/kGYuXS477RtkuzHPOX
 IRpt5z+YnVeWjNkQ/taYoJk2Pu80ryyp1sgf33b68rMmTLzG+1mK0DXg6gr1SaDjsH
 Qwaiz39WyH6ICAfK+NR1WFMpQ7kuxFOhaSWAE0hAYonS+3ahB59o1ttbbQZcZx0Pdw
 MFJ58bG+f1XTA==
Received: by mail-ed1-f48.google.com with SMTP id
 4fb4d7f45d1cf-64d4d8b3ad7so85320a12.2
 for <dri-devel@lists.freedesktop.org>; Mon, 05 Jan 2026 08:20:54 -0800 (PST)
X-Forwarded-Encrypted: i=1;
 AJvYcCXO6LoIiXkahLMG9OPuN+oXzQ6xIkS7vHBv0AxJC249R6U9e5m0u+RvvPbjgBz4f+WYQkP86k8avAY=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzqjnOWLt6TT/fKFP3vmYoPGc8I/LvUf2c4tr4B2L5iVgJEUgMz
 21x11yYds/PUSkR0ICB+FIOlGl9Z3/Xo5LfS3kReIfJLtu5NdkEAVLhpxwnNuke+7s1MjN+VRkm
 n25k1PxmWE6OzCgrfT5s1wIwkZ02emQ==
X-Google-Smtp-Source: AGHT+IFDcsB9cGrXZS17et5spTanzSuiDv2eXGriYKQ2r+jnoBl/BbFbMkXpScUjSnJR1b4zlgjELg50ZXxfiQwZwR0=
X-Received: by 2002:a17:907:97cf:b0:b84:206f:c0e1 with SMTP id
 a640c23a62f3a-b8426a743d0mr38798366b.18.1767630052751; Mon, 05 Jan 2026
 08:20:52 -0800 (PST)
MIME-Version: 1.0
References: <20251224161205.1132149-1-zhengxingda@iscas.ac.cn>
 <20251224161205.1132149-3-zhengxingda@iscas.ac.cn>
 <20260105154656.GA2585570-robh@kernel.org>
 <a838dc0f8bd39c6d9da95f5fd137eba8c131c58a.camel@icenowy.me>
In-Reply-To: <a838dc0f8bd39c6d9da95f5fd137eba8c131c58a.camel@icenowy.me>
From: Rob Herring <robh@kernel.org>
Date: Mon, 5 Jan 2026 10:20:40 -0600
X-Gmail-Original-Message-ID: <CAL_JsqKC6FaJZubvxQaX-uQBhWFNs2EHuTG8JK1FJaD1tPOaSw@mail.gmail.com>
X-Gm-Features: AQt7F2o9BFJZ8sc5_YNuKcdmxDzwwUg67C6I3vE6DTXNMYGUxygNfRHDV7MRa8k
Message-ID: <CAL_JsqKC6FaJZubvxQaX-uQBhWFNs2EHuTG8JK1FJaD1tPOaSw@mail.gmail.com>
Subject: Re: [PATCH v4 2/9] dt-bindings: display: add verisilicon,dc
To: Icenowy Zheng <uwu@icenowy.me>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
 Drew Fustini <fustini@kernel.org>, Guo Ren <guoren@kernel.org>,
 Fu Wei <wefu@redhat.com>, 
 Philipp Zabel <p.zabel@pengutronix.de>, Heiko Stuebner <heiko@sntech.de>, 
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Michal Wilczynski <m.wilczynski@samsung.com>, Han Gao <rabenda.cn@gmail.com>, 
 Yao Zi <ziyao@disroot.org>, dri-devel@lists.freedesktop.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-riscv@lists.infradead.org
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

On Mon, Jan 5, 2026 at 10:13=E2=80=AFAM Icenowy Zheng <uwu@icenowy.me> wrot=
e:
>
> =E5=9C=A8 2026-01-05=E6=98=9F=E6=9C=9F=E4=B8=80=E7=9A=84 09:46 -0600=EF=
=BC=8CRob Herring=E5=86=99=E9=81=93=EF=BC=9A
> > On Thu, Dec 25, 2025 at 12:11:58AM +0800, Icenowy Zheng wrote:
> > > From: Icenowy Zheng <uwu@icenowy.me>
> > >
> > > Verisilicon has a series of display controllers prefixed with DC
> > > and
> > > with self-identification facility like their GC series GPUs.
> > >
> > > Add a device tree binding for it.
> > >
> > > Depends on the specific DC model, it can have either one or two
> > > display
> > > outputs, and each display output could be set to DPI signal or "DP"
> > > signal (which seems to be some plain parallel bus to HDMI
> > > controllers).
> > >
> > > Signed-off-by: Icenowy Zheng <uwu@icenowy.me>
> > > Signed-off-by: Icenowy Zheng <zhengxingda@iscas.ac.cn>
> > > ---
> > > Changes in v4:
> > > - Added a comment for "verisilicon,dc" that says the ID/revision is
> > >   discoverable via registers.
> > > - Removed clock minItems constraint w/o specific compatible
> > > strings.
> > >
> > > Changes in v3:
> > > - Added SoC-specific compatible string, and arm the binding with
> > > clock /
> > >   port checking for the specific SoC (with a 2-output DC).
> > >
> > > Changes in v2:
> > > - Fixed misspelt "versilicon" in title.
> > > - Moved minItems in clock properties to be earlier than items.
> > > - Re-aligned multi-line clocks and resets in example.
> > >
> > >  .../bindings/display/verisilicon,dc.yaml      | 144
> > > ++++++++++++++++++
> > >  1 file changed, 144 insertions(+)
> > >  create mode 100644
> > > Documentation/devicetree/bindings/display/verisilicon,dc.yaml
> > >
> > > diff --git
> > > a/Documentation/devicetree/bindings/display/verisilicon,dc.yaml
> > > b/Documentation/devicetree/bindings/display/verisilicon,dc.yaml
> > > new file mode 100644
> > > index 0000000000000..fe64cc1466690
> > > --- /dev/null
> > > +++ b/Documentation/devicetree/bindings/display/verisilicon,dc.yaml
> > > @@ -0,0 +1,144 @@
> > > +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> > > +%YAML 1.2
> > > +---
> > > +$id: http://devicetree.org/schemas/display/verisilicon,dc.yaml#
> > > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > > +
> > > +title: Verisilicon DC-series display controllers
> > > +
> > > +maintainers:
> > > +  - Icenowy Zheng <uwu@icenowy.me>
> > > +
> > > +properties:
> > > +  $nodename:
> > > +    pattern: "^display@[0-9a-f]+$"
> > > +
> > > +  compatible:
> > > +    items:
> > > +      - enum:
> > > +          - thead,th1520-dc8200
> > > +      - const: verisilicon,dc # DC IPs have discoverable
> > > ID/revision registers
> > > +
> > > +  reg:
> > > +    maxItems: 1
> > > +
> > > +  interrupts:
> > > +    maxItems: 1
> > > +
> > > +  clocks:
> > > +    items:
> > > +      - description: DC Core clock
> > > +      - description: DMA AXI bus clock
> > > +      - description: Configuration AHB bus clock
> > > +      - description: Pixel clock of output 0
> > > +      - description: Pixel clock of output 1
> > > +
> > > +  clock-names:
> > > +    items:
> > > +      - const: core
> > > +      - const: axi
> > > +      - const: ahb
> > > +      - const: pix0
> > > +      - const: pix1
> > > +
> > > +  resets:
> > > +    items:
> > > +      - description: DC Core reset
> > > +      - description: DMA AXI bus reset
> > > +      - description: Configuration AHB bus reset
> > > +
> > > +  reset-names:
> > > +    items:
> > > +      - const: core
> > > +      - const: axi
> > > +      - const: ahb
> > > +
> > > +  ports:
> > > +    $ref: /schemas/graph.yaml#/properties/ports
> > > +
> > > +    properties:
> > > +      port@0:
> > > +        $ref: /schemas/graph.yaml#/properties/port
> > > +        description: The first output channel , endpoint 0 should
> > > be
> >
> > No space before comma. Or perhaps should be a period instead.
>
> Well I don't know why I inserted such a space, will remove it.
>
> >
> >
> > > +          used for DPI format output and endpoint 1 should be used
> > > +          for DP format output.
> > > +
> > > +      port@1:
> > > +        $ref: /schemas/graph.yaml#/properties/port
> > > +        description: The second output channel if the DC variant
> > > +          supports. Follow the same endpoint addressing rule with
> > > +          the first port.
> > > +
> > > +    required:
> > > +      - port@0
> > > +
> > > +required:
> > > +  - compatible
> > > +  - reg
> > > +  - interrupts
> > > +  - clocks
> > > +  - clock-names
> > > +  - ports
> > > +
> > > +allOf:
> > > +  - if:
> > > +      properties:
> > > +        compatible:
> > > +          contains:
> > > +            const: thead,th1520-dc8200
> > > +    then:
> > > +      properties:
> > > +        clocks:
> > > +          minItems: 5
> >
> > That's already implicitly the min. Perhaps you wanted 'minItems: 4'
> > on
> > the clocks and clock-names definitions for versions with only 1
> > output?
>
> Previously I specified minItems: 4 in the general part, however this
> does not play well when some of core/axi/ahb clocks are not present.

I don't understand. That would only make pix1 optional. There of
course is no way we can check that 'clocks' entries are pointing to
the correct clocks.

> > > +        ports:
> > > +          required:
> > > +            - port@0
> > > +            - port@1
> >
> > It is valid to omit these if the output is present, but unused.
>
> Well this sounds reasonable, although my driver does not play well if
> only a port@1 is defined w/o port@0 .

Sounds like your driver should be fixed.

> Considering the previous two snippets, should I just remove this if
> part?

I would, yes.

Rob
