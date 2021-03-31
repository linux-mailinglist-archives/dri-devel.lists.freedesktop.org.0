Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D47834FD6B
	for <lists+dri-devel@lfdr.de>; Wed, 31 Mar 2021 11:49:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 11B3B6EA30;
	Wed, 31 Mar 2021 09:49:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com
 [IPv6:2a00:1450:4864:20::132])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 289EE6EA30
 for <dri-devel@lists.freedesktop.org>; Wed, 31 Mar 2021 09:49:49 +0000 (UTC)
Received: by mail-lf1-x132.google.com with SMTP id o10so28209195lfb.9
 for <dri-devel@lists.freedesktop.org>; Wed, 31 Mar 2021 02:49:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=xz8F3ho9BWna4Dzog2QLcH6GO5/kEds6uS4Jk2gxK6c=;
 b=kBWxM8sd39h31xcYmwn1I7FAQ/bfkDliN6bhsNNJ4oz6fQlSRVgyI1jeHwG2/Uqi2P
 dSBgfTs/AzFOc8XVJHBJmIQcJ5m3bwmpoHopumnPjZaJvtjJpdhoiuUKQS8YvyPJBioT
 6e48BkAo75daNTPMVzw7igaM84FmhcxCKwWtCv1yQVfuPISTxwd03c/nmnfuGfpIR6EW
 6zPLybM8DbLD4jVf82Vk+irU3y6IYfkUxElg2qvwNptQ6gVGGmHFawqCJQnTZGqSFSMd
 houmI8UYGUHoDCfHKf226oXkvFWWl8Ef+I8kyDpbFgGywbl83JOH3Fxtrq2sTWgakSrf
 NiYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=xz8F3ho9BWna4Dzog2QLcH6GO5/kEds6uS4Jk2gxK6c=;
 b=JXoBs/muUXmp0KSr98EStZCeL9q1Ix6hgbHb6GZ1as5gTA7CUZaaEvz6FWxDmTAQzh
 bHkydTbI3KEUpawlD3gtTzcu0nwYz0X69PXnG8k0KshW5X8tbhjbdJHfPN9cYwvWwkjl
 bilcmm+GVgCRkYbk0jFFIgtNA2ct5ojYr2nizEv98RJ8WzqGc1SaAyTV+JDlpoiD3MOI
 d4h58A11PqCCoSHpL4Mo2rAu2zsCYGHVGbvFTDHdVxEN7Trt//faKCE9KfFHnno10zfL
 2ptnfTaRiPIddNmy9xCHDAcyrTQdU7AL1xmcRHna7duNEwuXtqD8rQdL2dz8VtWgDRlH
 Z/Vg==
X-Gm-Message-State: AOAM531lZKh+x2M412AEx3ewBUiey6gz5+tPqDN7mCtmbWbFJKwUBr+g
 2Qrw/VgvnM19UTMM6MK7zTfQjanyHA8LBryxIxg=
X-Google-Smtp-Source: ABdhPJxkAH3WKl6kG+DRS0mVYJMFPkUTbU/OApepG96IKQ5C0MuLj9dKQav9XFdlkzmZ/CNyyNaQ43xrB3fRi2qY6xY=
X-Received: by 2002:a05:6512:3ca0:: with SMTP id
 h32mr1806455lfv.184.1617184187619; 
 Wed, 31 Mar 2021 02:49:47 -0700 (PDT)
MIME-Version: 1.0
References: <20210222132822.7830-1-kevin3.tang@gmail.com>
 <20210222132822.7830-6-kevin3.tang@gmail.com>
 <20210324111316.ggo5deacaoecu27q@gilmour>
In-Reply-To: <20210324111316.ggo5deacaoecu27q@gilmour>
From: Kevin Tang <kevin3.tang@gmail.com>
Date: Wed, 31 Mar 2021 09:49:14 +0800
Message-ID: <CAFPSGXah3gKKHXhukRAPT=RjQZTnvDznG+619+8tah-hfFrUzA@mail.gmail.com>
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
Content-Type: multipart/mixed; boundary="===============0136954987=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--===============0136954987==
Content-Type: multipart/alternative; boundary="0000000000000a1e1d05bed209cb"

--0000000000000a1e1d05bed209cb
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Maxime,

Maxime Ripard <maxime@cerno.tech> =E4=BA=8E2021=E5=B9=B43=E6=9C=8824=E6=97=
=A5=E5=91=A8=E4=B8=89 =E4=B8=8B=E5=8D=887:13=E5=86=99=E9=81=93=EF=BC=9A

> On Mon, Feb 22, 2021 at 09:28:21PM +0800, Kevin Tang wrote:
> > From: Kevin Tang <kevin.tang@unisoc.com>
> >
> > Adds MIPI DSI Controller
> > support for Unisoc's display subsystem.
> >
> > Cc: Orson Zhai <orsonzhai@gmail.com>
> > Cc: Chunyan Zhang <zhang.lyra@gmail.com>
> > Signed-off-by: Kevin Tang <kevin.tang@unisoc.com>
> > Reviewed-by: Rob Herring <robh@kernel.org>
> > ---
> >  .../display/sprd/sprd,sharkl3-dsi-host.yaml   | 102 ++++++++++++++++++
> >  1 file changed, 102 insertions(+)
> >  create mode 100644
> Documentation/devicetree/bindings/display/sprd/sprd,sharkl3-dsi-host.yaml
> >
> > diff --git
> a/Documentation/devicetree/bindings/display/sprd/sprd,sharkl3-dsi-host.ya=
ml
> b/Documentation/devicetree/bindings/display/sprd/sprd,sharkl3-dsi-host.ya=
ml
> > new file mode 100644
> > index 000000000..d439f688f
> > --- /dev/null
> > +++
> b/Documentation/devicetree/bindings/display/sprd/sprd,sharkl3-dsi-host.ya=
ml
> > @@ -0,0 +1,102 @@
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
> > +
> > +  interrupts:
> > +    maxItems: 2
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
> > +          the associated panel.
>
> The DSI generic binding asks that peripherals that are controlled
> through a DCS be a subnode of the MIPI-DSI bus, not through a port
> endpoint.
>
 Our DSI controller don't support DCS now...

>
> Maxime
>

--0000000000000a1e1d05bed209cb
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">Hi Maxime,</div><br><div class=3D"gmail_q=
uote"><div dir=3D"ltr" class=3D"gmail_attr">Maxime Ripard &lt;maxime@cerno.=
tech&gt; =E4=BA=8E2021=E5=B9=B43=E6=9C=8824=E6=97=A5=E5=91=A8=E4=B8=89 =E4=
=B8=8B=E5=8D=887:13=E5=86=99=E9=81=93=EF=BC=9A<br></div><blockquote class=
=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rg=
b(204,204,204);padding-left:1ex">On Mon, Feb 22, 2021 at 09:28:21PM +0800, =
Kevin Tang wrote:<br>
&gt; From: Kevin Tang &lt;<a href=3D"mailto:kevin.tang@unisoc.com" target=
=3D"_blank">kevin.tang@unisoc.com</a>&gt;<br>
&gt; <br>
&gt; Adds MIPI DSI Controller<br>
&gt; support for Unisoc&#39;s display subsystem.<br>
&gt; <br>
&gt; Cc: Orson Zhai &lt;<a href=3D"mailto:orsonzhai@gmail.com" target=3D"_b=
lank">orsonzhai@gmail.com</a>&gt;<br>
&gt; Cc: Chunyan Zhang &lt;<a href=3D"mailto:zhang.lyra@gmail.com" target=
=3D"_blank">zhang.lyra@gmail.com</a>&gt;<br>
&gt; Signed-off-by: Kevin Tang &lt;<a href=3D"mailto:kevin.tang@unisoc.com"=
 target=3D"_blank">kevin.tang@unisoc.com</a>&gt;<br>
&gt; Reviewed-by: Rob Herring &lt;<a href=3D"mailto:robh@kernel.org" target=
=3D"_blank">robh@kernel.org</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 .../display/sprd/sprd,sharkl3-dsi-host.yaml=C2=A0 =C2=A0| 102 ++=
++++++++++++++++<br>
&gt;=C2=A0 1 file changed, 102 insertions(+)<br>
&gt;=C2=A0 create mode 100644 Documentation/devicetree/bindings/display/spr=
d/sprd,sharkl3-dsi-host.yaml<br>
&gt; <br>
&gt; diff --git a/Documentation/devicetree/bindings/display/sprd/sprd,shark=
l3-dsi-host.yaml b/Documentation/devicetree/bindings/display/sprd/sprd,shar=
kl3-dsi-host.yaml<br>
&gt; new file mode 100644<br>
&gt; index 000000000..d439f688f<br>
&gt; --- /dev/null<br>
&gt; +++ b/Documentation/devicetree/bindings/display/sprd/sprd,sharkl3-dsi-=
host.yaml<br>
&gt; @@ -0,0 +1,102 @@<br>
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
&gt; +<br>
&gt; +=C2=A0 interrupts:<br>
&gt; +=C2=A0 =C2=A0 maxItems: 2<br>
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
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 the associated panel.<br>
<br>
The DSI generic binding asks that peripherals that are controlled<br>
through a DCS be a subnode of the MIPI-DSI bus, not through a port<br>
endpoint.<br></blockquote><div>=C2=A0Our DSI controller don&#39;t support D=
CS now...</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0p=
x 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
<br>
Maxime<br>
</blockquote></div></div>

--0000000000000a1e1d05bed209cb--

--===============0136954987==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============0136954987==--
