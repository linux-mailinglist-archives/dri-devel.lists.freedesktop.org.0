Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 54F6816A1DC
	for <lists+dri-devel@lfdr.de>; Mon, 24 Feb 2020 10:20:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 20ED289362;
	Mon, 24 Feb 2020 09:20:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-x741.google.com (mail-qk1-x741.google.com
 [IPv6:2607:f8b0:4864:20::741])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3383D6E05D
 for <dri-devel@lists.freedesktop.org>; Sun, 23 Feb 2020 13:46:54 +0000 (UTC)
Received: by mail-qk1-x741.google.com with SMTP id m9so1216433qke.4
 for <dri-devel@lists.freedesktop.org>; Sun, 23 Feb 2020 05:46:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=ArU+lGZMvOVDmABUiOLeV8ceRgccVuY5MMSzaTRRRuQ=;
 b=Zr4zJsqRpNBjrvPZbU3gZBRsHGBnPWkkU556BPadYsupE5qvhI5yb/FkrMrrFPIiWG
 /80pRhgJtHAWdGbUaL98hwATcvxnXoJOnLxJ2O6AcGgS7VTMAH55JKckLWqSZTANHC7R
 XX6Q4Y1eioNxBBA02Qh7O0gkb/XEwuax83zslBkN8C4mhQEDdFJBLkvwHopi9W4QghUj
 VR3gKN9dhP97TjxD82FyJtOaBXH3HngXWJj/1BwxwKjX2xw3gK5M1VjT5C6owHKefnyk
 2ifxBfIknkRXDi+mBqkaw5nmapIfjX1wQ00/CpX9+y0+2uoYsfjKHgBCfYu2jOOe2C2l
 +3uw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ArU+lGZMvOVDmABUiOLeV8ceRgccVuY5MMSzaTRRRuQ=;
 b=Y5TQy452+TgSqBa8bv2YIQjSRwB0LDOtEepSO+SvgNwCmLvIFsKRg3dGmmzkpD3YKi
 jspK1BImiHzeLAbUJMEgIMrwd+s+taYl/czSjM2IBL6nG3/JnCHpsCaCbOn/S27Ypw4l
 YPk1m/tR7GphrJFyS5OdxORmDbE/Wn/+SzS1o5pSIJK1NcWLRqqfR0MCpmVdMI6HjIvh
 O+sUe9us8FvmtvT3qadqQuwiyr/9qkCy4ncqmZCumTfPunghuHOn3YuzTpUO7dJiDVfe
 0iaTdtsQrwHokZIoY1YsyEsXAR9e51K5mah5AZeKIsGqnCAUQVlhJPHLF3Ze0Ted/KPF
 rGpw==
X-Gm-Message-State: APjAAAXRfbijS/hn4g2z4EOpYh/69BLse68HuUJo5vx8GdTmxNwpb1Iu
 0NMsQ+5+nVXpueAAz2rmFTjK9rQZdCdDl1N13Bo=
X-Google-Smtp-Source: APXvYqxe4uORfqDfGbQJUsn4ZHDF4LOS1kERSKrq7y6tJKq7MaCvrHeXv1TBlbq5i6RYsaOjTV5u6AgNePJpgwYOoLs=
X-Received: by 2002:a05:620a:20c1:: with SMTP id
 f1mr25676563qka.229.1582465613364; 
 Sun, 23 Feb 2020 05:46:53 -0800 (PST)
MIME-Version: 1.0
References: <1582271336-3708-1-git-send-email-kevin3.tang@gmail.com>
 <1582271336-3708-4-git-send-email-kevin3.tang@gmail.com>
 <20200221213921.GE3456@ravnborg.org>
In-Reply-To: <20200221213921.GE3456@ravnborg.org>
From: tang pengchuan <kevin3.tang@gmail.com>
Date: Sun, 23 Feb 2020 21:46:42 +0800
Message-ID: <CAFPSGXYkgHtMmiD6FzWQxuDgx7nWn9K=WaFNBpJUR6JwQQJdhw@mail.gmail.com>
Subject: Re: [PATCH RFC v3 3/6] dt-bindings: display: add Unisoc's dpu bindings
To: Sam Ravnborg <sam@ravnborg.org>
X-Mailman-Approved-At: Mon, 24 Feb 2020 09:20:26 +0000
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
Cc: mark.rutland@arm.com, Baolin Wang <baolin.wang@linaro.org>,
 David Airlie <airlied@linux.ie>, Chunyan Zhang <zhang.lyra@gmail.com>,
 "Linux-Kernel@Vger. Kernel. Org" <linux-kernel@vger.kernel.org>,
 ML dri-devel <dri-devel@lists.freedesktop.org>, robh+dt@kernel.org,
 Orson Zhai <orsonzhai@gmail.com>
Content-Type: multipart/mixed; boundary="===============1080301405=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--===============1080301405==
Content-Type: multipart/alternative; boundary="000000000000c1027a059f3e7c2e"

--000000000000c1027a059f3e7c2e
Content-Type: text/plain; charset="UTF-8"

On Sat, Feb 22, 2020 at 5:39 AM Sam Ravnborg <sam@ravnborg.org> wrote:

> Hi Kevin.
>
> On Fri, Feb 21, 2020 at 03:48:53PM +0800, Kevin Tang wrote:
> > From: Kevin Tang <kevin.tang@unisoc.com>
> >
> > DPU (Display Processor Unit) is the Display Controller for the Unisoc
> SoCs
> > which transfers the image data from a video memory buffer to an internal
> > LCD interface.
> >
> > Cc: Orson Zhai <orsonzhai@gmail.com>
> > Cc: Baolin Wang <baolin.wang@linaro.org>
> > Cc: Chunyan Zhang <zhang.lyra@gmail.com>
> > Signed-off-by: Kevin Tang <kevin.tang@unisoc.com>
> > ---
> >  .../devicetree/bindings/display/sprd/dpu.yaml      | 85
> ++++++++++++++++++++++
> >  1 file changed, 85 insertions(+)
> >  create mode 100644
> Documentation/devicetree/bindings/display/sprd/dpu.yaml
> >
> > diff --git a/Documentation/devicetree/bindings/display/sprd/dpu.yaml
> b/Documentation/devicetree/bindings/display/sprd/dpu.yaml
> > new file mode 100644
> > index 0000000..7695d94
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/display/sprd/dpu.yaml
> > @@ -0,0 +1,85 @@
> > +# SPDX-License-Identifier: GPL-2.0
> > +%YAML 1.2
> > +---
> > +$id: http://devicetree.org/schemas/display/sprd/dpu.yaml#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: Unisoc SoC Display Processor Unit (DPU)
> > +
> > +maintainers:
> > +  - David Airlie <airlied@linux.ie>
> > +  - Daniel Vetter <daniel@ffwll.ch>
> > +  - Rob Herring <robh+dt@kernel.org>
> > +  - Mark Rutland <mark.rutland@arm.com>
> > +
> > +description: |
> > +  DPU (Display Processor Unit) is the Display Controller for the Unisoc
> SoCs
> > +  which transfers the image data from a video memory buffer to an
> internal
> > +  LCD interface.
> > +
> > +properties:
> > +  compatible:
> > +    const: sprd,sharkl3-dpu
> > +
> > +  reg:
> > +    maxItems: 1
> > +    description:
> > +      Physical base address and length of the DPU registers set
> > +
> > +  interrupts:
> > +    maxItems: 1
> > +    description:
> > +      The interrupt signal from DPU
> > +
> > +  clocks:
> > +    minItems: 2
> Should this be maxItems: 2?
> That would imply minItems: 2.
>
We need minItems: 2, one is for display controller, one is for dpi clock

>
>
> > +
> > +  clock-names:
> > +    items:
> > +      - const: clk_src_128m
> > +      - const: clk_src_384m
> > +
> > +  power-domains:
> > +    description: A phandle to DPU power domain node.
> > +
> > +  iommus:
> > +    description: A phandle to DPU iommu node.
> > +
> > +  port:
> > +    type: object
> > +    description:
> > +      A port node with endpoint definitions as defined in
> > +      Documentation/devicetree/bindings/media/video-interfaces.txt.
> > +      That port should be the output endpoint, usually output to
> > +      the associated DSI.
> > +
> > +required:
> > +  - compatible
> > +  - reg
> > +  - interrupts
> > +  - clocks
> > +  - clock-names
> > +  - port
> > +
> > +additionalProperties: false
> > +
> > +examples:
> > +  - |
> > +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> > +    #include <dt-bindings/clock/sprd,sc9860-clk.h>
> > +    dpu: dpu@0x63000000 {
> > +          compatible = "sprd,sharkl3-dpu";
> > +          reg = <0x0 0x63000000 0x0 0x1000>;
> > +          interrupts = <GIC_SPI 46 IRQ_TYPE_LEVEL_HIGH>;
> > +          clock-names = "clk_src_128m",
> > +                     "clk_src_384m";
> > +
> > +          clocks = <&pll CLK_TWPLL_128M>,
> > +                <&pll CLK_TWPLL_384M>;
> > +
> > +          dpu_port: port {
> > +                  dpu_out: endpoint {
> > +                          remote-endpoint = <&dsi_in>;
> > +                  };
> > +          };
> > +    };
> Did this example pass dt_binding_check with no warnings?
> I wonder how the reg property could avoid generating warnings as the
> upper node do not have #address_cells, #node_cells
>
Yes, pass dt_binding_check with no warnings
Because our display controller is under ahb bus or apb bus, parent node
have defined "address-cells" and "size-cells"
So subdev is omitted

>
>         Sam
>

--000000000000c1027a059f3e7c2e
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Sat, Feb 22, 2020 at 5:39 AM Sam R=
avnborg &lt;<a href=3D"mailto:sam@ravnborg.org">sam@ravnborg.org</a>&gt; wr=
ote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px=
 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">Hi Kevin.<b=
r>
<br>
On Fri, Feb 21, 2020 at 03:48:53PM +0800, Kevin Tang wrote:<br>
&gt; From: Kevin Tang &lt;<a href=3D"mailto:kevin.tang@unisoc.com" target=
=3D"_blank">kevin.tang@unisoc.com</a>&gt;<br>
&gt; <br>
&gt; DPU (Display Processor Unit) is the Display Controller for the Unisoc =
SoCs<br>
&gt; which transfers the image data from a video memory buffer to an intern=
al<br>
&gt; LCD interface.<br>
&gt; <br>
&gt; Cc: Orson Zhai &lt;<a href=3D"mailto:orsonzhai@gmail.com" target=3D"_b=
lank">orsonzhai@gmail.com</a>&gt;<br>
&gt; Cc: Baolin Wang &lt;<a href=3D"mailto:baolin.wang@linaro.org" target=
=3D"_blank">baolin.wang@linaro.org</a>&gt;<br>
&gt; Cc: Chunyan Zhang &lt;<a href=3D"mailto:zhang.lyra@gmail.com" target=
=3D"_blank">zhang.lyra@gmail.com</a>&gt;<br>
&gt; Signed-off-by: Kevin Tang &lt;<a href=3D"mailto:kevin.tang@unisoc.com"=
 target=3D"_blank">kevin.tang@unisoc.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 .../devicetree/bindings/display/sprd/dpu.yaml=C2=A0 =C2=A0 =C2=
=A0 | 85 ++++++++++++++++++++++<br>
&gt;=C2=A0 1 file changed, 85 insertions(+)<br>
&gt;=C2=A0 create mode 100644 Documentation/devicetree/bindings/display/spr=
d/dpu.yaml<br>
&gt; <br>
&gt; diff --git a/Documentation/devicetree/bindings/display/sprd/dpu.yaml b=
/Documentation/devicetree/bindings/display/sprd/dpu.yaml<br>
&gt; new file mode 100644<br>
&gt; index 0000000..7695d94<br>
&gt; --- /dev/null<br>
&gt; +++ b/Documentation/devicetree/bindings/display/sprd/dpu.yaml<br>
&gt; @@ -0,0 +1,85 @@<br>
&gt; +# SPDX-License-Identifier: GPL-2.0<br>
&gt; +%YAML 1.2<br>
&gt; +---<br>
&gt; +$id: <a href=3D"http://devicetree.org/schemas/display/sprd/dpu.yaml#"=
 rel=3D"noreferrer" target=3D"_blank">http://devicetree.org/schemas/display=
/sprd/dpu.yaml#</a><br>
&gt; +$schema: <a href=3D"http://devicetree.org/meta-schemas/core.yaml#" re=
l=3D"noreferrer" target=3D"_blank">http://devicetree.org/meta-schemas/core.=
yaml#</a><br>
&gt; +<br>
&gt; +title: Unisoc SoC Display Processor Unit (DPU)<br>
&gt; +<br>
&gt; +maintainers:<br>
&gt; +=C2=A0 - David Airlie &lt;<a href=3D"mailto:airlied@linux.ie" target=
=3D"_blank">airlied@linux.ie</a>&gt;<br>
&gt; +=C2=A0 - Daniel Vetter &lt;<a href=3D"mailto:daniel@ffwll.ch" target=
=3D"_blank">daniel@ffwll.ch</a>&gt;<br>
&gt; +=C2=A0 - Rob Herring &lt;<a href=3D"mailto:robh%2Bdt@kernel.org" targ=
et=3D"_blank">robh+dt@kernel.org</a>&gt;<br>
&gt; +=C2=A0 - Mark Rutland &lt;<a href=3D"mailto:mark.rutland@arm.com" tar=
get=3D"_blank">mark.rutland@arm.com</a>&gt;<br>
&gt; +<br>
&gt; +description: |<br>
&gt; +=C2=A0 DPU (Display Processor Unit) is the Display Controller for the=
 Unisoc SoCs<br>
&gt; +=C2=A0 which transfers the image data from a video memory buffer to a=
n internal<br>
&gt; +=C2=A0 LCD interface.<br>
&gt; +<br>
&gt; +properties:<br>
&gt; +=C2=A0 compatible:<br>
&gt; +=C2=A0 =C2=A0 const: sprd,sharkl3-dpu<br>
&gt; +<br>
&gt; +=C2=A0 reg:<br>
&gt; +=C2=A0 =C2=A0 maxItems: 1<br>
&gt; +=C2=A0 =C2=A0 description:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 Physical base address and length of the DPU regi=
sters set<br>
&gt; +<br>
&gt; +=C2=A0 interrupts:<br>
&gt; +=C2=A0 =C2=A0 maxItems: 1<br>
&gt; +=C2=A0 =C2=A0 description:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 The interrupt signal from DPU<br>
&gt; +<br>
&gt; +=C2=A0 clocks:<br>
&gt; +=C2=A0 =C2=A0 minItems: 2<br>
Should this be maxItems: 2?<br>
That would imply minItems: 2.<br></blockquote><div>We need minItems: 2, one=
 is for display controller, one is for dpi clock</div><blockquote class=3D"=
gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(20=
4,204,204);padding-left:1ex">
<br>
<br>
&gt; +<br>
&gt; +=C2=A0 clock-names:<br>
&gt; +=C2=A0 =C2=A0 items:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 - const: clk_src_128m<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 - const: clk_src_384m<br>
&gt; +<br>
&gt; +=C2=A0 power-domains:<br>
&gt; +=C2=A0 =C2=A0 description: A phandle to DPU power domain node.<br>
&gt; +<br>
&gt; +=C2=A0 iommus:<br>
&gt; +=C2=A0 =C2=A0 description: A phandle to DPU iommu node.<br>
&gt; +<br>
&gt; +=C2=A0 port:<br>
&gt; +=C2=A0 =C2=A0 type: object<br>
&gt; +=C2=A0 =C2=A0 description:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 A port node with endpoint definitions as defined=
 in<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 Documentation/devicetree/bindings/media/video-in=
terfaces.txt.<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 That port should be the output endpoint, usually=
 output to<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 the associated DSI.<br>
&gt; +<br>
&gt; +required:<br>
&gt; +=C2=A0 - compatible<br>
&gt; +=C2=A0 - reg<br>
&gt; +=C2=A0 - interrupts<br>
&gt; +=C2=A0 - clocks<br>
&gt; +=C2=A0 - clock-names<br>
&gt; +=C2=A0 - port<br>
&gt; +<br>
&gt; +additionalProperties: false<br>
&gt; +<br>
&gt; +examples:<br>
&gt; +=C2=A0 - |<br>
&gt; +=C2=A0 =C2=A0 #include &lt;dt-bindings/interrupt-controller/arm-gic.h=
&gt;<br>
&gt; +=C2=A0 =C2=A0 #include &lt;dt-bindings/clock/sprd,sc9860-clk.h&gt;<br=
>
&gt; +=C2=A0 =C2=A0 dpu: dpu@0x63000000 {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 compatible =3D &quot;sprd,sharkl3-=
dpu&quot;;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 reg =3D &lt;0x0 0x63000000 0x0 0x1=
000&gt;;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 interrupts =3D &lt;GIC_SPI 46 IRQ_=
TYPE_LEVEL_HIGH&gt;;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 clock-names =3D &quot;clk_src_128m=
&quot;,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0&quot;clk_src_384m&quot;;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 clocks =3D &lt;&amp;pll CLK_TWPLL_=
128M&gt;,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &lt;&amp;pll =
CLK_TWPLL_384M&gt;;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 dpu_port: port {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 dpu_ou=
t: endpoint {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 remote-endpoint =3D &lt;&amp;dsi_in&gt;;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 };<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 };<br>
&gt; +=C2=A0 =C2=A0 };<br>
Did this example pass dt_binding_check with no warnings?<br>
I wonder how the reg property could avoid generating warnings as the<br>
upper node do not have #address_cells, #node_cells<br></blockquote><div>Yes=
, pass dt_binding_check with no warnings

</div><div>Because our display controller is under ahb bus or apb bus, pare=
nt node have defined &quot;<span style=3D"color:rgb(0,0,0)">address-cells</=
span>&quot; and &quot;<span style=3D"color:rgb(0,0,0)">size-cells</span>&qu=
ot;</div><div>So subdev is omitted</div><blockquote class=3D"gmail_quote" s=
tyle=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);pad=
ding-left:1ex">
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 Sam<br>
</blockquote></div></div>

--000000000000c1027a059f3e7c2e--

--===============1080301405==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============1080301405==--
