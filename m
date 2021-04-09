Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 228803597B8
	for <lists+dri-devel@lfdr.de>; Fri,  9 Apr 2021 10:24:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 32A546E4C5;
	Fri,  9 Apr 2021 08:24:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x22c.google.com (mail-lj1-x22c.google.com
 [IPv6:2a00:1450:4864:20::22c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 27A8E6E4C5
 for <dri-devel@lists.freedesktop.org>; Fri,  9 Apr 2021 08:24:00 +0000 (UTC)
Received: by mail-lj1-x22c.google.com with SMTP id 184so5449710ljf.9
 for <dri-devel@lists.freedesktop.org>; Fri, 09 Apr 2021 01:24:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=RuoQFcuQUvf6MXR6uH0UxHyDyPxl5IrOAXAxY1VDcxw=;
 b=hAz8Vii6Ghp4Wp5I4iPIDzsyLfxess2J444UIWVOYjL8jNrbRndHag3YC4w0aPFG6N
 YT9WKcvr8YvZ9NICidePzPX2CHQF3DsQBGBFp9BJeXjIhyETqHjjb6xv9xqyV8pAtyJd
 7HEdVkQ3Mpwvzeku7bRd5y8SHdgQcx5yonk0EjLocOTQtjesv5KBGhlxbAWxdh6EkgiS
 2BqQpXJ+qvk19MErp2+1pL277O/DK61Hm/yB0TRdwfhBSOOMxcxMuIr0XT2rUBxI8Te+
 iOw7x0tX7oskafi1GKn7RDT16GkNzqkt+Mv3f+BvLgslPGK9W0s4XXE2M6qcROzfHO32
 xxsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=RuoQFcuQUvf6MXR6uH0UxHyDyPxl5IrOAXAxY1VDcxw=;
 b=HZdZiYmNhVx2KtsIU8zu+pVh6uagaacCfEKOm1BO3dYscdHGbmE3MANLModIeRM4cF
 g+Jcb0Qc0LfRvwME5XZQHKHjnGzIwX9cSmeClEiwAUAhKpGrcfavX8COpjn8QzFCPeQj
 Ue2cBfTij60hZ6vA10tfWCoX4AAvlPdmhdkncTbA41lraYjYrQwKLDllT49RMMg/53nQ
 w2DLfjqQ9bPlld7j6Dk1KSRHxFi0jGhYEV/3T/xw4q9N0TGQZwGrxJiq11QAkPKnVNjC
 1cFMvPwoA+JjNK6pbxLyLvXM0f/QEB9SEVrju5OGYPGCzzbgXMHsPZJwVbrPpKnc2m1u
 iNvQ==
X-Gm-Message-State: AOAM532351XjUzbj+X3xoFEhSCF2NuTUPDzdToZIMYo4T/gAYoUUNELh
 qt8BW4T12pw0q0MY16XT7hf/B9xTii1+RJE7v7A=
X-Google-Smtp-Source: ABdhPJxu4gopv77ux8yaE1eutIQ8kcV5VBZhktC4/NVrsWD9Mgv1eCMChAEfR7O4YyPMTAvAHjiwZgdojOAQxdGERSw=
X-Received: by 2002:a2e:868b:: with SMTP id l11mr8827920lji.332.1617956638597; 
 Fri, 09 Apr 2021 01:23:58 -0700 (PDT)
MIME-Version: 1.0
References: <20210222132822.7830-1-kevin3.tang@gmail.com>
 <20210222132822.7830-6-kevin3.tang@gmail.com>
 <20210324111316.ggo5deacaoecu27q@gilmour>
 <CAFPSGXah3gKKHXhukRAPT=RjQZTnvDznG+619+8tah-hfFrUzA@mail.gmail.com>
 <20210407104653.l4xwfl3qshaimat3@gilmour>
In-Reply-To: <20210407104653.l4xwfl3qshaimat3@gilmour>
From: Kevin Tang <kevin3.tang@gmail.com>
Date: Fri, 9 Apr 2021 08:23:19 +0800
Message-ID: <CAFPSGXaQKeKMKC7MGXhxQErB_yh_eE8khk1hOrjHnuOH20Gg4Q@mail.gmail.com>
Subject: Re: [PATCH v4 5/6] dt-bindings: display: add Unisoc's mipi dsi
 controller bindings
To: Maxime Ripard <maxime@cerno.tech>
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
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org,
 David Airlie <airlied@linux.ie>, Chunyan Zhang <zhang.lyra@gmail.com>,
 "Linux-Kernel@Vger. Kernel. Org" <linux-kernel@vger.kernel.org>,
 ML dri-devel <dri-devel@lists.freedesktop.org>,
 Rob Herring <robh+dt@kernel.org>, Orson Zhai <orsonzhai@gmail.com>,
 Sean Paul <sean@poorly.run>
Content-Type: multipart/mixed; boundary="===============1005702974=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--===============1005702974==
Content-Type: multipart/alternative; boundary="000000000000b4a45e05bf85e271"

--000000000000b4a45e05bf85e271
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Maxime Ripard <maxime@cerno.tech> =E4=BA=8E2021=E5=B9=B44=E6=9C=887=E6=97=
=A5=E5=91=A8=E4=B8=89 =E4=B8=8B=E5=8D=886:46=E5=86=99=E9=81=93=EF=BC=9A

> On Wed, Mar 31, 2021 at 09:49:14AM +0800, Kevin Tang wrote:
> > Hi Maxime,
> >
> > Maxime Ripard <maxime@cerno.tech> =E4=BA=8E2021=E5=B9=B43=E6=9C=8824=E6=
=97=A5=E5=91=A8=E4=B8=89 =E4=B8=8B=E5=8D=887:13=E5=86=99=E9=81=93=EF=BC=9A
> >
> > > On Mon, Feb 22, 2021 at 09:28:21PM +0800, Kevin Tang wrote:
> > > > From: Kevin Tang <kevin.tang@unisoc.com>
> > > >
> > > > Adds MIPI DSI Controller
> > > > support for Unisoc's display subsystem.
> > > >
> > > > Cc: Orson Zhai <orsonzhai@gmail.com>
> > > > Cc: Chunyan Zhang <zhang.lyra@gmail.com>
> > > > Signed-off-by: Kevin Tang <kevin.tang@unisoc.com>
> > > > Reviewed-by: Rob Herring <robh@kernel.org>
> > > > ---
> > > >  .../display/sprd/sprd,sharkl3-dsi-host.yaml   | 102
> ++++++++++++++++++
> > > >  1 file changed, 102 insertions(+)
> > > >  create mode 100644
> > >
> Documentation/devicetree/bindings/display/sprd/sprd,sharkl3-dsi-host.yaml
> > > >
> > > > diff --git
> > >
> a/Documentation/devicetree/bindings/display/sprd/sprd,sharkl3-dsi-host.ya=
ml
> > >
> b/Documentation/devicetree/bindings/display/sprd/sprd,sharkl3-dsi-host.ya=
ml
> > > > new file mode 100644
> > > > index 000000000..d439f688f
> > > > --- /dev/null
> > > > +++
> > >
> b/Documentation/devicetree/bindings/display/sprd/sprd,sharkl3-dsi-host.ya=
ml
> > > > @@ -0,0 +1,102 @@
> > > > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > > > +%YAML 1.2
> > > > +---
> > > > +$id:
> > > http://devicetree.org/schemas/display/sprd/sprd,sharkl3-dsi-host.yaml=
#
> > > > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > > > +
> > > > +title: Unisoc MIPI DSI Controller
> > > > +
> > > > +maintainers:
> > > > +  - Kevin Tang <kevin.tang@unisoc.com>
> > > > +
> > > > +properties:
> > > > +  compatible:
> > > > +    const: sprd,sharkl3-dsi-host
> > > > +
> > > > +  reg:
> > > > +    maxItems: 1
> > > > +
> > > > +  interrupts:
> > > > +    maxItems: 2
> > > > +
> > > > +  clocks:
> > > > +    minItems: 1
> > > > +
> > > > +  clock-names:
> > > > +    items:
> > > > +      - const: clk_src_96m
> > > > +
> > > > +  power-domains:
> > > > +    maxItems: 1
> > > > +
> > > > +  ports:
> > > > +    type: object
> > > > +
> > > > +    properties:
> > > > +      "#address-cells":
> > > > +        const: 1
> > > > +
> > > > +      "#size-cells":
> > > > +        const: 0
> > > > +
> > > > +      port@0:
> > > > +        type: object
> > > > +        description:
> > > > +          A port node with endpoint definitions as defined in
> > > > +
> Documentation/devicetree/bindings/media/video-interfaces.txt.
> > > > +          That port should be the input endpoint, usually coming
> from
> > > > +          the associated DPU.
> > > > +      port@1:
> > > > +        type: object
> > > > +        description:
> > > > +          A port node with endpoint definitions as defined in
> > > > +
> Documentation/devicetree/bindings/media/video-interfaces.txt.
> > > > +          That port should be the output endpoint, usually output =
to
> > > > +          the associated panel.
> > >
> > > The DSI generic binding asks that peripherals that are controlled
> > > through a DCS be a subnode of the MIPI-DSI bus, not through a port
> > > endpoint.
> > >
> >  Our DSI controller don't support DCS now...
>
> I'm not sure I follow you, you mentionned in the patch 4 that you were
> testing for a device to be in command mode, how would that work without
> DCS support?
>
Sorry, I see DCS as DSC, pls ignore my previous comments.

dsi input node is display controller and dsi output node is panel,
I still don't understand what it has to do with dcs? and it seems that
other vendors also like this.

can you help provide some cases?

>
> Maxime
>

--000000000000b4a45e05bf85e271
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">Maxime Ripard &lt;maxime@cerno.tech&g=
t; =E4=BA=8E2021=E5=B9=B44=E6=9C=887=E6=97=A5=E5=91=A8=E4=B8=89 =E4=B8=8B=
=E5=8D=886:46=E5=86=99=E9=81=93=EF=BC=9A<br></div><blockquote class=3D"gmai=
l_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,20=
4,204);padding-left:1ex">On Wed, Mar 31, 2021 at 09:49:14AM +0800, Kevin Ta=
ng wrote:<br>
&gt; Hi Maxime,<br>
&gt; <br>
&gt; Maxime Ripard &lt;maxime@cerno.tech&gt; =E4=BA=8E2021=E5=B9=B43=E6=9C=
=8824=E6=97=A5=E5=91=A8=E4=B8=89 =E4=B8=8B=E5=8D=887:13=E5=86=99=E9=81=93=
=EF=BC=9A<br>
&gt; <br>
&gt; &gt; On Mon, Feb 22, 2021 at 09:28:21PM +0800, Kevin Tang wrote:<br>
&gt; &gt; &gt; From: Kevin Tang &lt;<a href=3D"mailto:kevin.tang@unisoc.com=
" target=3D"_blank">kevin.tang@unisoc.com</a>&gt;<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; Adds MIPI DSI Controller<br>
&gt; &gt; &gt; support for Unisoc&#39;s display subsystem.<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; Cc: Orson Zhai &lt;<a href=3D"mailto:orsonzhai@gmail.com" ta=
rget=3D"_blank">orsonzhai@gmail.com</a>&gt;<br>
&gt; &gt; &gt; Cc: Chunyan Zhang &lt;<a href=3D"mailto:zhang.lyra@gmail.com=
" target=3D"_blank">zhang.lyra@gmail.com</a>&gt;<br>
&gt; &gt; &gt; Signed-off-by: Kevin Tang &lt;<a href=3D"mailto:kevin.tang@u=
nisoc.com" target=3D"_blank">kevin.tang@unisoc.com</a>&gt;<br>
&gt; &gt; &gt; Reviewed-by: Rob Herring &lt;<a href=3D"mailto:robh@kernel.o=
rg" target=3D"_blank">robh@kernel.org</a>&gt;<br>
&gt; &gt; &gt; ---<br>
&gt; &gt; &gt;=C2=A0 .../display/sprd/sprd,sharkl3-dsi-host.yaml=C2=A0 =C2=
=A0| 102 ++++++++++++++++++<br>
&gt; &gt; &gt;=C2=A0 1 file changed, 102 insertions(+)<br>
&gt; &gt; &gt;=C2=A0 create mode 100644<br>
&gt; &gt; Documentation/devicetree/bindings/display/sprd/sprd,sharkl3-dsi-h=
ost.yaml<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; diff --git<br>
&gt; &gt; a/Documentation/devicetree/bindings/display/sprd/sprd,sharkl3-dsi=
-host.yaml<br>
&gt; &gt; b/Documentation/devicetree/bindings/display/sprd/sprd,sharkl3-dsi=
-host.yaml<br>
&gt; &gt; &gt; new file mode 100644<br>
&gt; &gt; &gt; index 000000000..d439f688f<br>
&gt; &gt; &gt; --- /dev/null<br>
&gt; &gt; &gt; +++<br>
&gt; &gt; b/Documentation/devicetree/bindings/display/sprd/sprd,sharkl3-dsi=
-host.yaml<br>
&gt; &gt; &gt; @@ -0,0 +1,102 @@<br>
&gt; &gt; &gt; +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)<b=
r>
&gt; &gt; &gt; +%YAML 1.2<br>
&gt; &gt; &gt; +---<br>
&gt; &gt; &gt; +$id:<br>
&gt; &gt; <a href=3D"http://devicetree.org/schemas/display/sprd/sprd,sharkl=
3-dsi-host.yaml#" rel=3D"noreferrer" target=3D"_blank">http://devicetree.or=
g/schemas/display/sprd/sprd,sharkl3-dsi-host.yaml#</a><br>
&gt; &gt; &gt; +$schema: <a href=3D"http://devicetree.org/meta-schemas/core=
.yaml#" rel=3D"noreferrer" target=3D"_blank">http://devicetree.org/meta-sch=
emas/core.yaml#</a><br>
&gt; &gt; &gt; +<br>
&gt; &gt; &gt; +title: Unisoc MIPI DSI Controller<br>
&gt; &gt; &gt; +<br>
&gt; &gt; &gt; +maintainers:<br>
&gt; &gt; &gt; +=C2=A0 - Kevin Tang &lt;<a href=3D"mailto:kevin.tang@unisoc=
.com" target=3D"_blank">kevin.tang@unisoc.com</a>&gt;<br>
&gt; &gt; &gt; +<br>
&gt; &gt; &gt; +properties:<br>
&gt; &gt; &gt; +=C2=A0 compatible:<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 const: sprd,sharkl3-dsi-host<br>
&gt; &gt; &gt; +<br>
&gt; &gt; &gt; +=C2=A0 reg:<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 maxItems: 1<br>
&gt; &gt; &gt; +<br>
&gt; &gt; &gt; +=C2=A0 interrupts:<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 maxItems: 2<br>
&gt; &gt; &gt; +<br>
&gt; &gt; &gt; +=C2=A0 clocks:<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 minItems: 1<br>
&gt; &gt; &gt; +<br>
&gt; &gt; &gt; +=C2=A0 clock-names:<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 items:<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 - const: clk_src_96m<br>
&gt; &gt; &gt; +<br>
&gt; &gt; &gt; +=C2=A0 power-domains:<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 maxItems: 1<br>
&gt; &gt; &gt; +<br>
&gt; &gt; &gt; +=C2=A0 ports:<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 type: object<br>
&gt; &gt; &gt; +<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 properties:<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 &quot;#address-cells&quot;:<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 const: 1<br>
&gt; &gt; &gt; +<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 &quot;#size-cells&quot;:<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 const: 0<br>
&gt; &gt; &gt; +<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 port@0:<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 type: object<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 description:<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 A port node with endpoin=
t definitions as defined in<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 Documentation/devicetree=
/bindings/media/video-interfaces.txt.<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 That port should be the =
input endpoint, usually coming from<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 the associated DPU.<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 port@1:<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 type: object<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 description:<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 A port node with endpoin=
t definitions as defined in<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 Documentation/devicetree=
/bindings/media/video-interfaces.txt.<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 That port should be the =
output endpoint, usually output to<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 the associated panel.<br=
>
&gt; &gt;<br>
&gt; &gt; The DSI generic binding asks that peripherals that are controlled=
<br>
&gt; &gt; through a DCS be a subnode of the MIPI-DSI bus, not through a por=
t<br>
&gt; &gt; endpoint.<br>
&gt; &gt;<br>
&gt;=C2=A0 Our DSI controller don&#39;t support DCS now...<br>
<br>
I&#39;m not sure I follow you, you mentionned in the patch 4 that you were<=
br>
testing for a device to be in command mode, how would that work without<br>
DCS support?<br></blockquote><div>Sorry, I see DCS as DSC, pls ignore my pr=
evious comments.</div><div><br></div><div>dsi input node is display control=
ler and dsi output node is panel,</div><div>I still don&#39;t understand wh=
at it has to do with dcs? and it seems that other vendors also like this.</=
div><div><br></div><div>can you help provide some cases?</div><blockquote c=
lass=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px soli=
d rgb(204,204,204);padding-left:1ex">
<br>
Maxime<br>
</blockquote></div></div>

--000000000000b4a45e05bf85e271--

--===============1005702974==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============1005702974==--
