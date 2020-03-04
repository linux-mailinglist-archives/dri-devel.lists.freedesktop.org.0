Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AA2AD17A0F1
	for <lists+dri-devel@lfdr.de>; Thu,  5 Mar 2020 09:15:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 11CBB6EB89;
	Thu,  5 Mar 2020 08:14:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-x844.google.com (mail-qt1-x844.google.com
 [IPv6:2607:f8b0:4864:20::844])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9877A89BF5
 for <dri-devel@lists.freedesktop.org>; Wed,  4 Mar 2020 10:01:13 +0000 (UTC)
Received: by mail-qt1-x844.google.com with SMTP id 59so900942qtb.1
 for <dri-devel@lists.freedesktop.org>; Wed, 04 Mar 2020 02:01:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=8DsdSZ64K0LPAMg8xgYOvioBKCRjLiHvdT1IfS9y3K8=;
 b=J81u/LYbLOC+HafupZZpwyve3T32z6YQErz64fwo8exGwB3v2sHOGkJhyEYWdeLIEk
 YMoPNpQzOQFu1ndbaYEMl7W5hOrr6giu4MKLdAFfYDfcZCE1cwWIerTXWlqCOEjhxLTl
 5crpA+YA0BHlAMyNz+rP2mxysIxQacFLGoLbEZTVT7ugCbOSztHE7B/LLlu98UmVgOdr
 S8FrnXGDvtAh1ETChnZnkleX0ST+dwJbp2fp7l88vZ9O5DW3zQxN55valB2PGU3ooaCr
 sMcybDcplb0G3TvXeo3a1nXdZrrp1p6muqPEOvipNCAEG9B2PmknS/NUkL9AZ6KgmuNG
 KIyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=8DsdSZ64K0LPAMg8xgYOvioBKCRjLiHvdT1IfS9y3K8=;
 b=CrlClrVAZ8dLzWHydNr6lWU8fBjExYXJTSiX2MpL18bR8ZKxdlWTV7KXRowElI0vmB
 BwHos6q0Ah2CDsKSOlxqbKF58fh91nZlvPE09rch1UY8IkaMx9qMY4Da12pqscrg+4vL
 EYWSbZKiDSMJ0bBtH73B8Pn+c9lCL0hjAqDmghaWZEB0+HuD2yvMQNKFGlE+AV1i68uH
 8WJEVjdYtnUEIW7eCux7STWZIwPKyzmFwQuC7R7yclECMB3Ibv1j6y/d4SXraMSA323+
 IVdTC3rAeOSyssz7PrwFfFSLjB/saEaFRiYKJ9RxEnyNGydLUcHHuc4BkXEccEmJMEZV
 poFw==
X-Gm-Message-State: ANhLgQ2j6eetECRjem/OnPAtCMTYuKGVZ5CbGbIE6yFOWvaYdZZB11ht
 ODwmLJhBTWOgl7qnhIh8Cfb3h9IDRilSIwRG2oU=
X-Google-Smtp-Source: ADFU+vuNWKgMDbs1LEgSp+TwDWYB1DWHj7hzGPRwnzpRr/e/pVs3NGawVS5+pmeXJ6OsBvUr/EgyeJjyvaBzAo7A12s=
X-Received: by 2002:ac8:4994:: with SMTP id f20mr1694359qtq.2.1583316071803;
 Wed, 04 Mar 2020 02:01:11 -0800 (PST)
MIME-Version: 1.0
References: <1582710377-15489-1-git-send-email-kevin3.tang@gmail.com>
 <1582710377-15489-2-git-send-email-kevin3.tang@gmail.com>
 <CAL_JsqL08g0TaNob7gcKgTx5OXgwBEfKy6f5AK73xuYhMRMNkw@mail.gmail.com>
In-Reply-To: <CAL_JsqL08g0TaNob7gcKgTx5OXgwBEfKy6f5AK73xuYhMRMNkw@mail.gmail.com>
From: tang pengchuan <kevin3.tang@gmail.com>
Date: Wed, 4 Mar 2020 18:01:00 +0800
Message-ID: <CAFPSGXa6j5T68y85LPnq1LvWMnajXNt29h_S1nG4HQujDsWsrQ@mail.gmail.com>
Subject: Re: [PATCH RFC v4 1/6] dt-bindings: display: add Unisoc's drm master
 bindings
To: Rob Herring <robh+dt@kernel.org>
X-Mailman-Approved-At: Thu, 05 Mar 2020 08:14:30 +0000
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
Cc: Mark Rutland <mark.rutland@arm.com>, Baolin Wang <baolin.wang@linaro.org>,
 David Airlie <airlied@linux.ie>, Lyra Zhang <zhang.lyra@gmail.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>, Orson Zhai <orsonzhai@gmail.com>,
 Sean Paul <sean@poorly.run>
Content-Type: multipart/mixed; boundary="===============0401147032=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--===============0401147032==
Content-Type: multipart/alternative; boundary="00000000000006f28005a0048072"

--00000000000006f28005a0048072
Content-Type: text/plain; charset="UTF-8"

On Fri, Feb 28, 2020 at 12:50 AM Rob Herring <robh+dt@kernel.org> wrote:

> On Wed, Feb 26, 2020 at 3:46 AM Kevin Tang <kevin3.tang@gmail.com> wrote:
> >
> > From: Kevin Tang <kevin.tang@unisoc.com>
> >
> > The Unisoc DRM master device is a virtual device needed to list all
> > DPU devices or other display interface nodes that comprise the
> > graphics subsystem
> >
> > Cc: Orson Zhai <orsonzhai@gmail.com>
> > Cc: Baolin Wang <baolin.wang@linaro.org>
> > Cc: Chunyan Zhang <zhang.lyra@gmail.com>
> > Signed-off-by: Kevin Tang <kevin.tang@unisoc.com>
> > ---
> >  .../devicetree/bindings/display/sprd/drm.yaml      | 36
> ++++++++++++++++++++++
> >  1 file changed, 36 insertions(+)
> >  create mode 100644
> Documentation/devicetree/bindings/display/sprd/drm.yaml
> >
> > diff --git a/Documentation/devicetree/bindings/display/sprd/drm.yaml
> b/Documentation/devicetree/bindings/display/sprd/drm.yaml
> > new file mode 100644
> > index 0000000..b5792c0
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/display/sprd/drm.yaml
> > @@ -0,0 +1,36 @@
> > +# SPDX-License-Identifier: GPL-2.0
> > +%YAML 1.2
> > +---
> > +$id: http://devicetree.org/schemas/display/sprd/drm.yaml#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: Unisoc DRM master device
> > +
> > +maintainers:
> > +  - Mark Rutland <mark.rutland@arm.com>
> > +
> > +description: |
> > +  The Unisoc DRM master device is a virtual device needed to list all
> > +  DPU devices or other display interface nodes that comprise the
> > +  graphics subsystem.
> > +
> > +properties:
> > +  compatible:
> > +    const: sprd,display-subsystem
> > +
> > +  ports:
> > +    description:
> > +      Should contain a list of phandles pointing to display interface
> port
> > +      of DPU devices.
> > +
> > +required:
> > +  - compatible
> > +  - ports
> > +
> > +examples:
> > +  - |
> > +    display-subsystem {
> > +        compatible = "sprd,display-subsystem";
> > +        ports = <&dpu_out>;
>
> We try to avoid these virtual nodes and bind with actual h/w nodes.
> Can you have more than one DPU and if so does it need to be a single
> DRM driver instance?
>
I don't really understand what you mean, so reply as I understand...
"dpu_out" node is the real h/w node, defined on dpu.yaml
Yeah, we will be have multi DPU

>
> Rob
>

--00000000000006f28005a0048072
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Fri, Feb 28, 2020 at 12:50 AM Rob =
Herring &lt;<a href=3D"mailto:robh%2Bdt@kernel.org">robh+dt@kernel.org</a>&=
gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0=
px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">On We=
d, Feb 26, 2020 at 3:46 AM Kevin Tang &lt;<a href=3D"mailto:kevin3.tang@gma=
il.com" target=3D"_blank">kevin3.tang@gmail.com</a>&gt; wrote:<br>
&gt;<br>
&gt; From: Kevin Tang &lt;<a href=3D"mailto:kevin.tang@unisoc.com" target=
=3D"_blank">kevin.tang@unisoc.com</a>&gt;<br>
&gt;<br>
&gt; The Unisoc DRM master device is a virtual device needed to list all<br=
>
&gt; DPU devices or other display interface nodes that comprise the<br>
&gt; graphics subsystem<br>
&gt;<br>
&gt; Cc: Orson Zhai &lt;<a href=3D"mailto:orsonzhai@gmail.com" target=3D"_b=
lank">orsonzhai@gmail.com</a>&gt;<br>
&gt; Cc: Baolin Wang &lt;<a href=3D"mailto:baolin.wang@linaro.org" target=
=3D"_blank">baolin.wang@linaro.org</a>&gt;<br>
&gt; Cc: Chunyan Zhang &lt;<a href=3D"mailto:zhang.lyra@gmail.com" target=
=3D"_blank">zhang.lyra@gmail.com</a>&gt;<br>
&gt; Signed-off-by: Kevin Tang &lt;<a href=3D"mailto:kevin.tang@unisoc.com"=
 target=3D"_blank">kevin.tang@unisoc.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 .../devicetree/bindings/display/sprd/drm.yaml=C2=A0 =C2=A0 =C2=
=A0 | 36 ++++++++++++++++++++++<br>
&gt;=C2=A0 1 file changed, 36 insertions(+)<br>
&gt;=C2=A0 create mode 100644 Documentation/devicetree/bindings/display/spr=
d/drm.yaml<br>
&gt;<br>
&gt; diff --git a/Documentation/devicetree/bindings/display/sprd/drm.yaml b=
/Documentation/devicetree/bindings/display/sprd/drm.yaml<br>
&gt; new file mode 100644<br>
&gt; index 0000000..b5792c0<br>
&gt; --- /dev/null<br>
&gt; +++ b/Documentation/devicetree/bindings/display/sprd/drm.yaml<br>
&gt; @@ -0,0 +1,36 @@<br>
&gt; +# SPDX-License-Identifier: GPL-2.0<br>
&gt; +%YAML 1.2<br>
&gt; +---<br>
&gt; +$id: <a href=3D"http://devicetree.org/schemas/display/sprd/drm.yaml#"=
 rel=3D"noreferrer" target=3D"_blank">http://devicetree.org/schemas/display=
/sprd/drm.yaml#</a><br>
&gt; +$schema: <a href=3D"http://devicetree.org/meta-schemas/core.yaml#" re=
l=3D"noreferrer" target=3D"_blank">http://devicetree.org/meta-schemas/core.=
yaml#</a><br>
&gt; +<br>
&gt; +title: Unisoc DRM master device<br>
&gt; +<br>
&gt; +maintainers:<br>
&gt; +=C2=A0 - Mark Rutland &lt;<a href=3D"mailto:mark.rutland@arm.com" tar=
get=3D"_blank">mark.rutland@arm.com</a>&gt;<br>
&gt; +<br>
&gt; +description: |<br>
&gt; +=C2=A0 The Unisoc DRM master device is a virtual device needed to lis=
t all<br>
&gt; +=C2=A0 DPU devices or other display interface nodes that comprise the=
<br>
&gt; +=C2=A0 graphics subsystem.<br>
&gt; +<br>
&gt; +properties:<br>
&gt; +=C2=A0 compatible:<br>
&gt; +=C2=A0 =C2=A0 const: sprd,display-subsystem<br>
&gt; +<br>
&gt; +=C2=A0 ports:<br>
&gt; +=C2=A0 =C2=A0 description:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 Should contain a list of phandles pointing to di=
splay interface port<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 of DPU devices.<br>
&gt; +<br>
&gt; +required:<br>
&gt; +=C2=A0 - compatible<br>
&gt; +=C2=A0 - ports<br>
&gt; +<br>
&gt; +examples:<br>
&gt; +=C2=A0 - |<br>
&gt; +=C2=A0 =C2=A0 display-subsystem {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 compatible =3D &quot;sprd,display-subsyst=
em&quot;;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 ports =3D &lt;&amp;dpu_out&gt;;<br>
<br>
We try to avoid these virtual nodes and bind with actual h/w nodes.<br>
Can you have more than one DPU and if so does it need to be a single<br>
DRM driver instance?<br></blockquote><div><span class=3D"gmail-tlid-transla=
tion gmail-translation" lang=3D"en"><span title=3D"" class=3D"gmail-">I don=
&#39;t really understand what you mean, <span class=3D"gmail-tlid-translati=
on gmail-translation" lang=3D"en"><span title=3D"" class=3D"gmail-">so repl=
y as I understand...<br></span></span></span></span></div><div><span class=
=3D"gmail-tlid-translation gmail-translation" lang=3D"en"><span title=3D"" =
class=3D"gmail-">&quot;dpu_out&quot; node <span class=3D"gmail-tlid-transla=
tion gmail-translation" lang=3D"en"><span title=3D"" class=3D"gmail-">is th=
e real h/w node, defined on dpu.yaml</span></span></span></span></div><div>=
<span class=3D"gmail-tlid-translation gmail-translation" lang=3D"en"><span =
title=3D"" class=3D"gmail-"><span class=3D"gmail-tlid-translation gmail-tra=
nslation" lang=3D"en"><span title=3D"" class=3D"gmail-">Yeah, we will be ha=
ve multi DPU<br></span></span></span></span> </div><blockquote class=3D"gma=
il_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,2=
04,204);padding-left:1ex">
<br>
Rob<br>
</blockquote></div></div>

--00000000000006f28005a0048072--

--===============0401147032==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============0401147032==--
