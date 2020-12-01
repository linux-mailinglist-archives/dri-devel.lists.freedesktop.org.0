Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E1072C9944
	for <lists+dri-devel@lfdr.de>; Tue,  1 Dec 2020 09:23:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3AC406E4CD;
	Tue,  1 Dec 2020 08:23:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x241.google.com (mail-lj1-x241.google.com
 [IPv6:2a00:1450:4864:20::241])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DB8596E4B5
 for <dri-devel@lists.freedesktop.org>; Tue,  1 Dec 2020 07:36:51 +0000 (UTC)
Received: by mail-lj1-x241.google.com with SMTP id y7so1262380lji.8
 for <dri-devel@lists.freedesktop.org>; Mon, 30 Nov 2020 23:36:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=cXglQpHm9MwIvRQAvsLvHQkyJUKjCvdKJgxGIAFmErw=;
 b=Fe3DuZVPxhKxX8nLhq+e19JjWU6yTVLW+iTLxUOG8hMjiYtZ5XCVo6hGPQeAxU8q3Q
 mljYFr3t6kyvrgAsiR5VUjG5BGBDdPwwRtG6HLAgZgiyCnFWuzsJVmv4lRsRm6RrdjxT
 nW0lb5XLX/5y8CGiS7esIofD0ITg5iETs72EAcjQRrUmpOesXiGcxHMa5jOrXn+FLU+m
 qjEna+PGsT85iTqDLGRuC/i7tES420dzlZZyyCeKzgheg0YxWG0vX6vQpPakn0N4Mt8o
 5/WMy33Mh8zH1OoO/zw6ZCwCBhjej2bQH2dUEn9qanTLuvxnQhcwLHIGCbF9s36NBQK0
 4t7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=cXglQpHm9MwIvRQAvsLvHQkyJUKjCvdKJgxGIAFmErw=;
 b=ClDre+IbECBxdgpLTfZid6zZ3txUVbBEz9dNfh96MBGSyBJx2dD9TUqDhlWVBqF+kG
 KXCuyYcjtnyQDiv3rqUSSxzaaothF9MJ71RxQhshd8lCbe3YgbHXoFNvIpclbGywbCw3
 pYAhGgF81WJyH/M5Hipu2aAsUgN5KAnkjlYHG3wPHMLraEKtAY4CuDlnhCt0fi4bT5S1
 PMILNqRbVlVdWvk3ZZeyleGlWswxrBbBWJPPbyoS6YyFJjEuTnIKKE1b3udyWAR04B+j
 n1fqkDVjFn4QPUfB0TBTJX5GDBRay1v7t2e/+wgBgNuPhbfTkUZQNY7In29HLP/d1xrF
 nsrg==
X-Gm-Message-State: AOAM533UBv9SgdXolffGMX0+HfEIL5hLaTgny+jXcaTqI3fJm8MswvLT
 y1yBf02GsZasx6Q6bLUzopRRG0f0QZZmldeTSg0=
X-Google-Smtp-Source: ABdhPJzBSYAppy63lxS9DAEtLl+luQIqPpCxDYsJ3UlF55qsLJ1fDkrqs125GJ0gYNE/TVAgaVb3B+ma9L2u0VLo/kk=
X-Received: by 2002:a2e:b5d9:: with SMTP id g25mr684875ljn.234.1606808210333; 
 Mon, 30 Nov 2020 23:36:50 -0800 (PST)
MIME-Version: 1.0
References: <1606746513-30909-1-git-send-email-kevin3.tang@gmail.com>
 <1606746513-30909-2-git-send-email-kevin3.tang@gmail.com>
 <CAL_Jsq+fC1TzygUopiwVtwBN8JtwmnGy=VMTEvkudSQUdXiMqg@mail.gmail.com>
In-Reply-To: <CAL_Jsq+fC1TzygUopiwVtwBN8JtwmnGy=VMTEvkudSQUdXiMqg@mail.gmail.com>
From: Kevin Tang <kevin3.tang@gmail.com>
Date: Tue, 1 Dec 2020 15:36:26 +0800
Message-ID: <CAFPSGXZLXh__GuXT2NPqF0jpO2DnMAhz+NtE721EZfMCSKLBjQ@mail.gmail.com>
Subject: Re: [PATCH 1/6] dt-bindings: display: add Unisoc's drm master bindings
To: Rob Herring <robh+dt@kernel.org>
X-Mailman-Approved-At: Tue, 01 Dec 2020 08:23:37 +0000
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
Content-Type: multipart/mixed; boundary="===============1307305068=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--===============1307305068==
Content-Type: multipart/alternative; boundary="00000000000099628405b5623056"

--00000000000099628405b5623056
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Rob

Rob Herring <robh+dt@kernel.org> =E4=BA=8E2020=E5=B9=B412=E6=9C=881=E6=97=
=A5=E5=91=A8=E4=BA=8C =E4=B8=8A=E5=8D=884:29=E5=86=99=E9=81=93=EF=BC=9A
>
> On Mon, Nov 30, 2020 at 7:28 AM Kevin Tang <kevin3.tang@gmail.com> wrote:
> >
> > From: Kevin Tang <kevin.tang@unisoc.com>
>
> Once again, DT patches must Cc the DT list if you want them reviewed.
Ok, i will add DT list to my Cc list.
>
> >
> > The Unisoc DRM master device is a virtual device needed to list all
> > DPU devices or other display interface nodes that comprise the
> > graphics subsystem
> >
> > Cc: Orson Zhai <orsonzhai@gmail.com>
> > Cc: Chunyan Zhang <zhang.lyra@gmail.com>
> > Signed-off-by: Kevin Tang <kevin.tang@unisoc.com>
> > ---
> >  .../display/sprd/sprd,display-subsystem.yaml       | 39
++++++++++++++++++++++
> >  1 file changed, 39 insertions(+)
> >  create mode 100644
Documentation/devicetree/bindings/display/sprd/sprd,display-subsystem.yaml
> >
> > diff --git
a/Documentation/devicetree/bindings/display/sprd/sprd,display-subsystem.yam=
l
b/Documentation/devicetree/bindings/display/sprd/sprd,display-subsystem.yam=
l
> > new file mode 100644
> > index 0000000..9487a39
> > --- /dev/null
> > +++
b/Documentation/devicetree/bindings/display/sprd/sprd,display-subsystem.yam=
l
> > @@ -0,0 +1,39 @@
> > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > +%YAML 1.2
> > +---
> > +$id:
http://devicetree.org/schemas/display/sprd/sprd,display-subsystem.yaml#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: Unisoc DRM master device
> > +
> > +maintainers:
> > +  - Kevin Tang <kevin.tang@unisoc.com>
> > +
> > +description: |
> > +  The Unisoc DRM master device is a virtual device needed to list all
> > +  DPU devices or other display interface nodes that comprise the
> > +  graphics subsystem.
> > +
> > +properties:
> > +  compatible:
> > +    const: sprd,display-subsystem
>
> As I said before, we try to avoid these virtual nodes. Make the DRM
> driver bind to the DPU node.
>
> The case where this might be needed is if you have h/w that's a
> mixture of shared and discrete blocks. I don't see anything here
> matching that.

This is how I understand this sentence: "h/w that's a mixture of shared and
discrete blocks"
We have multiple display controllers and corresponding physical interfaces,
typical dual-screen display scenario
E.g:
1. dpu0 and dpu1 both binding to DSI for dual mipi-dsi display;
2. dpu0 binding to DSI for primary display, and dpu1 binding to DP for
external display;

It looks like this:
dpu0------>MIPI-DSI------>DPHY/CPHY Combo------>Panel0
                        ^
    ----------------|
    |
dpu1------>DisplayPort------>PHY------>Panel1

For DTS like this:
display-subsystem {
compatible =3D "sprd,display-subsystem";
ports =3D <&dpu0_out>, <&dpu1_out>;
};

But this is our first time submitting code to the community, following the
suggestions of other reviewers, we only submitted a basic version. Other
virtual nodes and corresponding drivers will be submitted later.
>
> Rob

--00000000000099628405b5623056
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi Rob<br><br>Rob Herring &lt;<a href=3D"mailto:robh%2Bdt@=
kernel.org">robh+dt@kernel.org</a>&gt; =E4=BA=8E2020=E5=B9=B412=E6=9C=881=
=E6=97=A5=E5=91=A8=E4=BA=8C =E4=B8=8A=E5=8D=884:29=E5=86=99=E9=81=93=EF=BC=
=9A<br>&gt;<br>&gt; On Mon, Nov 30, 2020 at 7:28 AM Kevin Tang &lt;<a href=
=3D"mailto:kevin3.tang@gmail.com">kevin3.tang@gmail.com</a>&gt; wrote:<br>&=
gt; &gt;<br>&gt; &gt; From: Kevin Tang &lt;<a href=3D"mailto:kevin.tang@uni=
soc.com">kevin.tang@unisoc.com</a>&gt;<br>&gt;<br>&gt; Once again, DT patch=
es must Cc the DT list if you want them reviewed.<div>Ok, i will add DT lis=
t=C2=A0to my Cc list.</div><div>&gt;<br>&gt; &gt;<br>&gt; &gt; The Unisoc D=
RM master device is a virtual device needed to list all<br>&gt; &gt; DPU de=
vices or other display interface nodes that comprise the<br>&gt; &gt; graph=
ics subsystem<br>&gt; &gt;<br>&gt; &gt; Cc: Orson Zhai &lt;<a href=3D"mailt=
o:orsonzhai@gmail.com">orsonzhai@gmail.com</a>&gt;<br>&gt; &gt; Cc: Chunyan=
 Zhang &lt;<a href=3D"mailto:zhang.lyra@gmail.com">zhang.lyra@gmail.com</a>=
&gt;<br>&gt; &gt; Signed-off-by: Kevin Tang &lt;<a href=3D"mailto:kevin.tan=
g@unisoc.com">kevin.tang@unisoc.com</a>&gt;<br>&gt; &gt; ---<br>&gt; &gt; =
=C2=A0.../display/sprd/sprd,display-subsystem.yaml =C2=A0 =C2=A0 =C2=A0 | 3=
9 ++++++++++++++++++++++<br>&gt; &gt; =C2=A01 file changed, 39 insertions(+=
)<br>&gt; &gt; =C2=A0create mode 100644 Documentation/devicetree/bindings/d=
isplay/sprd/sprd,display-subsystem.yaml<br>&gt; &gt;<br>&gt; &gt; diff --gi=
t a/Documentation/devicetree/bindings/display/sprd/sprd,display-subsystem.y=
aml b/Documentation/devicetree/bindings/display/sprd/sprd,display-subsystem=
.yaml<br>&gt; &gt; new file mode 100644<br>&gt; &gt; index 0000000..9487a39=
<br>&gt; &gt; --- /dev/null<br>&gt; &gt; +++ b/Documentation/devicetree/bin=
dings/display/sprd/sprd,display-subsystem.yaml<br>&gt; &gt; @@ -0,0 +1,39 @=
@<br>&gt; &gt; +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)<b=
r>&gt; &gt; +%YAML 1.2<br>&gt; &gt; +---<br>&gt; &gt; +$id: <a href=3D"http=
://devicetree.org/schemas/display/sprd/sprd,display-subsystem.yaml#">http:/=
/devicetree.org/schemas/display/sprd/sprd,display-subsystem.yaml#</a><br>&g=
t; &gt; +$schema: <a href=3D"http://devicetree.org/meta-schemas/core.yaml#"=
>http://devicetree.org/meta-schemas/core.yaml#</a><br>&gt; &gt; +<br>&gt; &=
gt; +title: Unisoc DRM master device<br>&gt; &gt; +<br>&gt; &gt; +maintaine=
rs:<br>&gt; &gt; + =C2=A0- Kevin Tang &lt;<a href=3D"mailto:kevin.tang@unis=
oc.com">kevin.tang@unisoc.com</a>&gt;<br>&gt; &gt; +<br>&gt; &gt; +descript=
ion: |<br>&gt; &gt; + =C2=A0The Unisoc DRM master device is a virtual devic=
e needed to list all<br>&gt; &gt; + =C2=A0DPU devices or other display inte=
rface nodes that comprise the<br>&gt; &gt; + =C2=A0graphics subsystem.<br>&=
gt; &gt; +<br>&gt; &gt; +properties:<br>&gt; &gt; + =C2=A0compatible:<br>&g=
t; &gt; + =C2=A0 =C2=A0const: sprd,display-subsystem<br>&gt;<br>&gt; As I s=
aid before, we try to avoid these virtual nodes. Make the DRM<br>&gt; drive=
r bind to the DPU node.<br>&gt;<br>&gt; The case where this might be needed=
 is if you have h/w that&#39;s a<br>&gt; mixture of shared and discrete blo=
cks. I don&#39;t see anything here<br>&gt; matching that.<br><br>This is ho=
w I understand this sentence: &quot;h/w that&#39;s a mixture of shared and =
discrete blocks&quot;<br>We have multiple display controllers and correspon=
ding physical interfaces, typical dual-screen display scenario<div>E.g:</di=
v><div>1. dpu0 and dpu1 both binding to DSI for dual mipi-dsi display;</div=
><div>2. dpu0 binding to DSI for primary display, and dpu1 binding to DP fo=
r external display;<br></div><div><br>It looks like this:<br>dpu0------&gt;=
MIPI-DSI------&gt;DPHY/CPHY Combo------&gt;Panel0<br>=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ^<br>=C2=A0 =
=C2=A0 ----------------|<br>=C2=A0 =C2=A0 |<br>dpu1------&gt;DisplayPort---=
---&gt;PHY------&gt;Panel1<br><br>For DTS like this:<br>display-subsystem {=
<br>compatible =3D &quot;sprd,display-subsystem&quot;;<br>ports =3D &lt;&am=
p;dpu0_out&gt;, &lt;&amp;dpu1_out&gt;;<br>};<br><br>But this is our first t=
ime submitting code to the community, following the suggestions of other re=
viewers, we only submitted a basic version. Other virtual nodes and corresp=
onding drivers will be submitted later.<div><div>&gt;<br></div><div>&gt; Ro=
b</div></div></div></div></div>

--00000000000099628405b5623056--

--===============1307305068==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============1307305068==--
