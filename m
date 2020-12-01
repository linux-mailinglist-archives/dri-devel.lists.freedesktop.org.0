Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 38DE72CB6CE
	for <lists+dri-devel@lfdr.de>; Wed,  2 Dec 2020 09:21:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 699EB6EA38;
	Wed,  2 Dec 2020 08:20:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x144.google.com (mail-lf1-x144.google.com
 [IPv6:2a00:1450:4864:20::144])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5D0706E578
 for <dri-devel@lists.freedesktop.org>; Tue,  1 Dec 2020 13:56:46 +0000 (UTC)
Received: by mail-lf1-x144.google.com with SMTP id t6so4217548lfl.13
 for <dri-devel@lists.freedesktop.org>; Tue, 01 Dec 2020 05:56:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=2KvR6OJg5uBA6p5cNMRVwqZpG6XuQfN+LpQq11yonrk=;
 b=cLF5eVEz2xwriJwnfmC/PrHXgPaM/Te61TjXq+z1HAFBU3chxawoWaN54OeM/4Wsml
 j19mvESwdIAzWARPGMl2SJR+dc9rQerftf1+Sy7JN/jiGSw6o82s/pnzUgsmPDbrqDgI
 U+8pZrHMXQwuIJ3IZR2qnXkxLOrVculvtkls31JWZe7qh2+xCF4LUhEJEryjzqVggQm4
 9nU+YdwmDv3MG+lxkUGw9Kqiu/F2XHDmHq5RcJFnsa8y2wFu5HyIp99X6GhwQvt5l4b5
 hfR2KdiTFVaFyOf8vvT9K/lXsRXBQcc9adpWLk7wOXE3diZLOll414Mcf8s7qybQX3Q3
 AHMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=2KvR6OJg5uBA6p5cNMRVwqZpG6XuQfN+LpQq11yonrk=;
 b=cwjNNU/ao7txax/LNTXtZdrxBSnWqXi27inRXOoa3TA/oSxd4S6QM8h1y+4iCnSs+P
 y35aIMmQHSaN+pICJSu2TN75xxC3Vn9t4iPJGdDBTsXmhFl8mlWm3c6N+PXLurDtp3hA
 OTG4QReP69UQevOv9LPbLBI9+mgpaETpH3SwDQvWsmQLEO2/peX3vtRw1IQLmq1nTVrd
 mhIug88VgmE3DZXNeZ15tJZVodEcQxoOM6GjpVG/D1Z3m/OUTcxyhsPDARMXCdCps00r
 ePHZJU2LfjoFISK1uXEIigiTdLrItE15UK54g8CV+zo9eVf78SNsL9/5gifcMdNbFXZ2
 zMDA==
X-Gm-Message-State: AOAM530EBL6Vls50pnlaeSP4A43hCvCVEiYuVaP2acAkQizJbXPUbxht
 LvoMe8SCFUmUGnv1JCcUvzYBPz4g/yCIcWzF7Nw=
X-Google-Smtp-Source: ABdhPJwLxQT56nvK8cdItWajIDXoFhYAN7MULV9MKBKY11k54slCe4FgxAg4AaJ2OknGlsAFd96HgWMaZrzK4L5r/WQ=
X-Received: by 2002:ac2:5939:: with SMTP id v25mr1225295lfi.490.1606831004741; 
 Tue, 01 Dec 2020 05:56:44 -0800 (PST)
MIME-Version: 1.0
References: <1606746513-30909-1-git-send-email-kevin3.tang@gmail.com>
 <1606746513-30909-6-git-send-email-kevin3.tang@gmail.com>
 <CAL_JsqKZKZtOaduTEuu2dgD9sFf5YDvcSkQfBVA9Ssn4n_mDsg@mail.gmail.com>
In-Reply-To: <CAL_JsqKZKZtOaduTEuu2dgD9sFf5YDvcSkQfBVA9Ssn4n_mDsg@mail.gmail.com>
From: Kevin Tang <kevin3.tang@gmail.com>
Date: Tue, 1 Dec 2020 21:56:32 +0800
Message-ID: <CAFPSGXYwHyF7xEpc-OiVtpSOKiorRO=jGGftKArK-NeGDGMvdw@mail.gmail.com>
Subject: Re: [PATCH 5/6] dt-bindings: display: add Unisoc's mipi dsi&dphy
 bindings
To: Rob Herring <robh+dt@kernel.org>
X-Mailman-Approved-At: Wed, 02 Dec 2020 08:19:47 +0000
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
Cc: Mark Rutland <mark.rutland@arm.com>, David Airlie <airlied@linux.ie>,
 Lyra Zhang <zhang.lyra@gmail.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>, Orson Zhai <orsonzhai@gmail.com>,
 Sean Paul <sean@poorly.run>
Content-Type: multipart/mixed; boundary="===============1886721930=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--===============1886721930==
Content-Type: multipart/alternative; boundary="0000000000004075a305b5677f7b"

--0000000000004075a305b5677f7b
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Rob,

Rob Herring <robh+dt@kernel.org> =E4=BA=8E2020=E5=B9=B412=E6=9C=881=E6=97=
=A5=E5=91=A8=E4=BA=8C =E4=B8=8A=E5=8D=884:31=E5=86=99=E9=81=93=EF=BC=9A

> On Mon, Nov 30, 2020 at 7:29 AM Kevin Tang <kevin3.tang@gmail.com> wrote:
> >
> > From: Kevin Tang <kevin.tang@unisoc.com>
> >
> > Adds MIPI DSI Master and MIPI DSI-PHY (D-PHY)
> > support for Unisoc's display subsystem.
> >
> > Cc: Orson Zhai <orsonzhai@gmail.com>
> > Cc: Chunyan Zhang <zhang.lyra@gmail.com>
> > Signed-off-by: Kevin Tang <kevin.tang@unisoc.com>
> > ---
> >  .../display/sprd/sprd,sharkl3-dsi-host.yaml        | 107
> +++++++++++++++++++++
> >  .../display/sprd/sprd,sharkl3-dsi-phy.yaml         |  84
> ++++++++++++++++
> >  2 files changed, 191 insertions(+)
> >  create mode 100644
> Documentation/devicetree/bindings/display/sprd/sprd,sharkl3-dsi-host.yaml
> >  create mode 100644
> Documentation/devicetree/bindings/display/sprd/sprd,sharkl3-dsi-phy.yaml
> >
> > diff --git
> a/Documentation/devicetree/bindings/display/sprd/sprd,sharkl3-dsi-host.ya=
ml
> b/Documentation/devicetree/bindings/display/sprd/sprd,sharkl3-dsi-host.ya=
ml
> > new file mode 100644
> > index 0000000..fe0e89d
> > --- /dev/null
> > +++
> b/Documentation/devicetree/bindings/display/sprd/sprd,sharkl3-dsi-host.ya=
ml
> > @@ -0,0 +1,107 @@
> > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > +%YAML 1.2
> > +---
> > +$id:
> http://devicetree.org/schemas/display/sprd/sprd,sharkl3-dsi-host.yaml#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: Unisoc MIPI DSI Controller
> > +
> > +maintainers:
> > +  - Kevin Tang <kevin.tang@unisoc.com>
> > +
> > +properties:
> > +  compatible:
> > +    const: sprd,sharkl3-dsi-host
> > +
> > +  reg:
> > +    maxItems: 1
> > +    description:
> > +      Physical base address and length of the registers set for the
> device.
> > +
> > +  interrupts:
> > +    maxItems: 2
> > +    description:
> > +      Should contain DSI interrupt.
> > +
> > +  clocks:
> > +    minItems: 1
> > +
> > +  clock-names:
> > +    items:
> > +      - const: clk_src_96m
> > +
> > +  power-domains:
> > +    maxItems: 1
> > +    description: A phandle to DSIM power domain node
> > +
> > +  ports:
> > +    type: object
> > +
> > +    properties:
> > +      "#address-cells":
> > +        const: 1
> > +
> > +      "#size-cells":
> > +        const: 0
> > +
> > +      port@0:
> > +        type: object
> > +        description:
> > +          A port node with endpoint definitions as defined in
> > +          Documentation/devicetree/bindings/media/video-interfaces.txt=
.
> > +          That port should be the input endpoint, usually coming from
> > +          the associated DPU.
> > +      port@1:
> > +        type: object
> > +        description:
> > +          A port node with endpoint definitions as defined in
> > +          Documentation/devicetree/bindings/media/video-interfaces.txt=
.
> > +          That port should be the output endpoint, usually output to
> > +          the associated DPHY.
> > +
> > +    required:
> > +      - "#address-cells"
> > +      - "#size-cells"
> > +      - port@0
> > +      - port@1
> > +
> > +    additionalProperties: false
> > +
> > +required:
> > +  - compatible
> > +  - reg
> > +  - interrupts
> > +  - clocks
> > +  - clock-names
> > +  - ports
> > +
> > +additionalProperties: false
> > +
> > +examples:
> > +  - |
> > +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> > +    #include <dt-bindings/clock/sprd,sc9860-clk.h>
> > +    dsi: dsi@63100000 {
> > +        compatible =3D "sprd,sharkl3-dsi-host";
> > +        reg =3D <0x63100000 0x1000>;
> > +        interrupts =3D <GIC_SPI 48 IRQ_TYPE_LEVEL_HIGH>,
> > +          <GIC_SPI 49 IRQ_TYPE_LEVEL_HIGH>;
> > +        clock-names =3D "clk_src_96m";
> > +        clocks =3D <&pll CLK_TWPLL_96M>;
> > +        ports {
> > +            #address-cells =3D <1>;
> > +            #size-cells =3D <0>;
> > +            port@0 {
> > +                reg =3D <0>;
> > +                dsi_in: endpoint {
> > +                    remote-endpoint =3D <&dpu_out>;
> > +                };
> > +            };
> > +            port@1 {
> > +                reg =3D <1>;
> > +                dsi_out: endpoint {
> > +                    remote-endpoint =3D <&dphy_in>;
> > +                };
> > +            };
> > +        };
> > +    };
> > diff --git
> a/Documentation/devicetree/bindings/display/sprd/sprd,sharkl3-dsi-phy.yam=
l
> b/Documentation/devicetree/bindings/display/sprd/sprd,sharkl3-dsi-phy.yam=
l
> > new file mode 100644
> > index 0000000..b4715d5
> > --- /dev/null
> > +++
> b/Documentation/devicetree/bindings/display/sprd/sprd,sharkl3-dsi-phy.yam=
l
> > @@ -0,0 +1,84 @@
> > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > +%YAML 1.2
> > +---
> > +$id:
> http://devicetree.org/schemas/display/sprd/sprd,sharkl3-dsi-phy.yaml#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: Unisoc MIPI DSI-PHY (D-PHY)
> > +
> > +maintainers:
> > +  - Kevin Tang <kevin.tang@unisoc.com>
> > +
> > +properties:
> > +  compatible:
> > +    const: sprd,sharkl3-dsi-phy
> > +
> > +  reg:
> > +    maxItems: 1
> > +    description:
> > +      Must be the dsi controller base address.
> > +
> > +  ports:
> > +    type: object
> > +
> > +    properties:
> > +      "#address-cells":
> > +        const: 1
> > +
> > +      "#size-cells":
> > +        const: 0
> > +
> > +      port@0:
> > +        type: object
> > +        description:
> > +          A port node with endpoint definitions as defined in
> > +          Documentation/devicetree/bindings/media/video-interfaces.txt=
.
> > +          That port should be the output endpoint, usually output to
> > +          the associated panel.
> > +      port@1:
>
> For PHYs, we use the PHY binding, not the graph binding. Please follow
> what practically every other DSI PHY does.
>
It seems that the dphy driver does not need to exist alone, so i remove
dphy and dsi graph binding, merge the dphy driver into the dsi driver.

>
> Rob
>

--0000000000004075a305b5677f7b
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Hi Rob,<br></div><br><div class=3D"gmail_quote"><div =
dir=3D"ltr" class=3D"gmail_attr">Rob Herring &lt;<a href=3D"mailto:robh%2Bd=
t@kernel.org">robh+dt@kernel.org</a>&gt; =E4=BA=8E2020=E5=B9=B412=E6=9C=881=
=E6=97=A5=E5=91=A8=E4=BA=8C =E4=B8=8A=E5=8D=884:31=E5=86=99=E9=81=93=EF=BC=
=9A<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px =
0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">On Mon, Nov =
30, 2020 at 7:29 AM Kevin Tang &lt;<a href=3D"mailto:kevin3.tang@gmail.com"=
 target=3D"_blank">kevin3.tang@gmail.com</a>&gt; wrote:<br>
&gt;<br>
&gt; From: Kevin Tang &lt;<a href=3D"mailto:kevin.tang@unisoc.com" target=
=3D"_blank">kevin.tang@unisoc.com</a>&gt;<br>
&gt;<br>
&gt; Adds MIPI DSI Master and MIPI DSI-PHY (D-PHY)<br>
&gt; support for Unisoc&#39;s display subsystem.<br>
&gt;<br>
&gt; Cc: Orson Zhai &lt;<a href=3D"mailto:orsonzhai@gmail.com" target=3D"_b=
lank">orsonzhai@gmail.com</a>&gt;<br>
&gt; Cc: Chunyan Zhang &lt;<a href=3D"mailto:zhang.lyra@gmail.com" target=
=3D"_blank">zhang.lyra@gmail.com</a>&gt;<br>
&gt; Signed-off-by: Kevin Tang &lt;<a href=3D"mailto:kevin.tang@unisoc.com"=
 target=3D"_blank">kevin.tang@unisoc.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 .../display/sprd/sprd,sharkl3-dsi-host.yaml=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 | 107 +++++++++++++++++++++<br>
&gt;=C2=A0 .../display/sprd/sprd,sharkl3-dsi-phy.yaml=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0|=C2=A0 84 ++++++++++++++++<br>
&gt;=C2=A0 2 files changed, 191 insertions(+)<br>
&gt;=C2=A0 create mode 100644 Documentation/devicetree/bindings/display/spr=
d/sprd,sharkl3-dsi-host.yaml<br>
&gt;=C2=A0 create mode 100644 Documentation/devicetree/bindings/display/spr=
d/sprd,sharkl3-dsi-phy.yaml<br>
&gt;<br>
&gt; diff --git a/Documentation/devicetree/bindings/display/sprd/sprd,shark=
l3-dsi-host.yaml b/Documentation/devicetree/bindings/display/sprd/sprd,shar=
kl3-dsi-host.yaml<br>
&gt; new file mode 100644<br>
&gt; index 0000000..fe0e89d<br>
&gt; --- /dev/null<br>
&gt; +++ b/Documentation/devicetree/bindings/display/sprd/sprd,sharkl3-dsi-=
host.yaml<br>
&gt; @@ -0,0 +1,107 @@<br>
&gt; +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)<br>
&gt; +%YAML 1.2<br>
&gt; +---<br>
&gt; +$id: <a href=3D"http://devicetree.org/schemas/display/sprd/sprd,shark=
l3-dsi-host.yaml#" rel=3D"noreferrer" target=3D"_blank">http://devicetree.o=
rg/schemas/display/sprd/sprd,sharkl3-dsi-host.yaml#</a><br>
&gt; +$schema: <a href=3D"http://devicetree.org/meta-schemas/core.yaml#" re=
l=3D"noreferrer" target=3D"_blank">http://devicetree.org/meta-schemas/core.=
yaml#</a><br>
&gt; +<br>
&gt; +title: Unisoc MIPI DSI Controller<br>
&gt; +<br>
&gt; +maintainers:<br>
&gt; +=C2=A0 - Kevin Tang &lt;<a href=3D"mailto:kevin.tang@unisoc.com" targ=
et=3D"_blank">kevin.tang@unisoc.com</a>&gt;<br>
&gt; +<br>
&gt; +properties:<br>
&gt; +=C2=A0 compatible:<br>
&gt; +=C2=A0 =C2=A0 const: sprd,sharkl3-dsi-host<br>
&gt; +<br>
&gt; +=C2=A0 reg:<br>
&gt; +=C2=A0 =C2=A0 maxItems: 1<br>
&gt; +=C2=A0 =C2=A0 description:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 Physical base address and length of the register=
s set for the device.<br>
&gt; +<br>
&gt; +=C2=A0 interrupts:<br>
&gt; +=C2=A0 =C2=A0 maxItems: 2<br>
&gt; +=C2=A0 =C2=A0 description:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 Should contain DSI interrupt.<br>
&gt; +<br>
&gt; +=C2=A0 clocks:<br>
&gt; +=C2=A0 =C2=A0 minItems: 1<br>
&gt; +<br>
&gt; +=C2=A0 clock-names:<br>
&gt; +=C2=A0 =C2=A0 items:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 - const: clk_src_96m<br>
&gt; +<br>
&gt; +=C2=A0 power-domains:<br>
&gt; +=C2=A0 =C2=A0 maxItems: 1<br>
&gt; +=C2=A0 =C2=A0 description: A phandle to DSIM power domain node<br>
&gt; +<br>
&gt; +=C2=A0 ports:<br>
&gt; +=C2=A0 =C2=A0 type: object<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 properties:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 &quot;#address-cells&quot;:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 const: 1<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 &quot;#size-cells&quot;:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 const: 0<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 port@0:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 type: object<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 description:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 A port node with endpoint definiti=
ons as defined in<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 Documentation/devicetree/bindings/=
media/video-interfaces.txt.<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 That port should be the input endp=
oint, usually coming from<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 the associated DPU.<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 port@1:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 type: object<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 description:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 A port node with endpoint definiti=
ons as defined in<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 Documentation/devicetree/bindings/=
media/video-interfaces.txt.<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 That port should be the output end=
point, usually output to<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 the associated DPHY.<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 required:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 - &quot;#address-cells&quot;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 - &quot;#size-cells&quot;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 - port@0<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 - port@1<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 additionalProperties: false<br>
&gt; +<br>
&gt; +required:<br>
&gt; +=C2=A0 - compatible<br>
&gt; +=C2=A0 - reg<br>
&gt; +=C2=A0 - interrupts<br>
&gt; +=C2=A0 - clocks<br>
&gt; +=C2=A0 - clock-names<br>
&gt; +=C2=A0 - ports<br>
&gt; +<br>
&gt; +additionalProperties: false<br>
&gt; +<br>
&gt; +examples:<br>
&gt; +=C2=A0 - |<br>
&gt; +=C2=A0 =C2=A0 #include &lt;dt-bindings/interrupt-controller/arm-gic.h=
&gt;<br>
&gt; +=C2=A0 =C2=A0 #include &lt;dt-bindings/clock/sprd,sc9860-clk.h&gt;<br=
>
&gt; +=C2=A0 =C2=A0 dsi: dsi@63100000 {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 compatible =3D &quot;sprd,sharkl3-dsi-hos=
t&quot;;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 reg =3D &lt;0x63100000 0x1000&gt;;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 interrupts =3D &lt;GIC_SPI 48 IRQ_TYPE_LE=
VEL_HIGH&gt;,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &lt;GIC_SPI 49 IRQ_TYPE_LEVEL_HIGH=
&gt;;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 clock-names =3D &quot;clk_src_96m&quot;;<=
br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 clocks =3D &lt;&amp;pll CLK_TWPLL_96M&gt;=
;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 ports {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 #address-cells =3D &lt;1&gt=
;;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 #size-cells =3D &lt;0&gt;;<=
br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 port@0 {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 reg =3D &lt;0=
&gt;;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 dsi_in: endpo=
int {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 remote-endpoint =3D &lt;&amp;dpu_out&gt;;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 };<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 };<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 port@1 {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 reg =3D &lt;1=
&gt;;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 dsi_out: endp=
oint {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 remote-endpoint =3D &lt;&amp;dphy_in&gt;;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 };<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 };<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 };<br>
&gt; +=C2=A0 =C2=A0 };<br>
&gt; diff --git a/Documentation/devicetree/bindings/display/sprd/sprd,shark=
l3-dsi-phy.yaml b/Documentation/devicetree/bindings/display/sprd/sprd,shark=
l3-dsi-phy.yaml<br>
&gt; new file mode 100644<br>
&gt; index 0000000..b4715d5<br>
&gt; --- /dev/null<br>
&gt; +++ b/Documentation/devicetree/bindings/display/sprd/sprd,sharkl3-dsi-=
phy.yaml<br>
&gt; @@ -0,0 +1,84 @@<br>
&gt; +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)<br>
&gt; +%YAML 1.2<br>
&gt; +---<br>
&gt; +$id: <a href=3D"http://devicetree.org/schemas/display/sprd/sprd,shark=
l3-dsi-phy.yaml#" rel=3D"noreferrer" target=3D"_blank">http://devicetree.or=
g/schemas/display/sprd/sprd,sharkl3-dsi-phy.yaml#</a><br>
&gt; +$schema: <a href=3D"http://devicetree.org/meta-schemas/core.yaml#" re=
l=3D"noreferrer" target=3D"_blank">http://devicetree.org/meta-schemas/core.=
yaml#</a><br>
&gt; +<br>
&gt; +title: Unisoc MIPI DSI-PHY (D-PHY)<br>
&gt; +<br>
&gt; +maintainers:<br>
&gt; +=C2=A0 - Kevin Tang &lt;<a href=3D"mailto:kevin.tang@unisoc.com" targ=
et=3D"_blank">kevin.tang@unisoc.com</a>&gt;<br>
&gt; +<br>
&gt; +properties:<br>
&gt; +=C2=A0 compatible:<br>
&gt; +=C2=A0 =C2=A0 const: sprd,sharkl3-dsi-phy<br>
&gt; +<br>
&gt; +=C2=A0 reg:<br>
&gt; +=C2=A0 =C2=A0 maxItems: 1<br>
&gt; +=C2=A0 =C2=A0 description:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 Must be the dsi controller base address.<br>
&gt; +<br>
&gt; +=C2=A0 ports:<br>
&gt; +=C2=A0 =C2=A0 type: object<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 properties:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 &quot;#address-cells&quot;:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 const: 1<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 &quot;#size-cells&quot;:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 const: 0<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 port@0:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 type: object<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 description:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 A port node with endpoint definiti=
ons as defined in<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 Documentation/devicetree/bindings/=
media/video-interfaces.txt.<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 That port should be the output end=
point, usually output to<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 the associated panel.<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 port@1:<br>
<br>
For PHYs, we use the PHY binding, not the graph binding. Please follow<br>
what practically every other DSI PHY does.<br></blockquote><div><span class=
=3D"gmail-VIiyi" lang=3D"en"><span class=3D"gmail-JLqJ4b gmail-ChMk0b"><spa=
n>It seems that the dphy driver does not need to exist alone</span></span><=
/span>, so i remove dphy and dsi graph binding, merge the dphy driver into =
the dsi driver.</div><blockquote class=3D"gmail_quote" style=3D"margin:0px =
0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
<br>
Rob<br>
</blockquote></div></div>

--0000000000004075a305b5677f7b--

--===============1886721930==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============1886721930==--
