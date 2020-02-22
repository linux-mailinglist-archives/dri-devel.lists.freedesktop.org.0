Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3705216A1D9
	for <lists+dri-devel@lfdr.de>; Mon, 24 Feb 2020 10:20:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E500489B69;
	Mon, 24 Feb 2020 09:20:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-x841.google.com (mail-qt1-x841.google.com
 [IPv6:2607:f8b0:4864:20::841])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 550D36E8C8
 for <dri-devel@lists.freedesktop.org>; Sat, 22 Feb 2020 12:41:12 +0000 (UTC)
Received: by mail-qt1-x841.google.com with SMTP id l16so3353098qtq.1
 for <dri-devel@lists.freedesktop.org>; Sat, 22 Feb 2020 04:41:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=LfVGbSZX1cYql6VjwayRyKYHfU7QEsNGx571ZmfYNHk=;
 b=qM86bba5xfS8Ukqo9ZTNjBLUdgNQtdibqanhjc4uxxEmyIj8vFNMUHfFJL6NtgrInb
 QeRIwrKtRasrgNQnnn7NkmXwsYTF/pUhZOKOmAap1OsYgNvu1tc9Sk6AGjUMiDzXvulO
 tNXTTGVtd6IPgVmNhleY6i8mWrABwtKUm7YCwH0Y5aZf7ML2iOsIwqfm4bG7NYAm08ZD
 PRBt9ks9tQo1XD810rHM9BQUeGYHZrZoAkU1qmrhz/I+nGzJ3ox7eAYNDpWtNvwZfk1+
 mzn8pL4GFVJ+tIwekChte194cNQLEx9hixgvTCeg7mio+pwKGyQ5CAwG1ktbPm2Rm+L2
 ojAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=LfVGbSZX1cYql6VjwayRyKYHfU7QEsNGx571ZmfYNHk=;
 b=THaq5t47gxfpUin/DHWYZCUWq+dXv+9JMtLvlJwnlHDe4PzjfzPbpKzM8FLJ/SxPrY
 pj+jVdO5nsFkg2uSPEKzRlpb/lM2qcJS93MxCt7Mc2UQ7JEwxA3v9dZPXX2O5njcuil0
 zyoDLNCK7NA9h7ExhcUF1CLnk/WG7u2rN4uHEapi1UbkAwTsB8V0sWtgGIuEQjobmbqi
 fYxCinO4m6Q3+u0Ag/0Y8fmwSQFK5mkj5zNO1g+vP4Zx6dSZB/+3ZpFjsoexlWpp9cUK
 JveYZXRxrnD+KmaeI45BjkgokI/iNn8kOG4qd/efIYJUsMmOtEUaXorWvxJxiWRqUWSK
 GY5A==
X-Gm-Message-State: APjAAAU+SJHYB88JdxRy7uK0DZfeQ3rVRzrjvmVtr+h9zWCuDTmyVGkd
 UTL2+1u4nlRQ5reuccIrGSS14QznFeV841V68VM=
X-Google-Smtp-Source: APXvYqyGwk4d6m3aRnnP783dBmli+Tjj1h73Tmhd8vD7rW5O9Kr1vSA9gZr6345F4aNp20zJvogT8KxMbHmGt86doZA=
X-Received: by 2002:ac8:7b9b:: with SMTP id p27mr37721575qtu.2.1582375271509; 
 Sat, 22 Feb 2020 04:41:11 -0800 (PST)
MIME-Version: 1.0
References: <1582271336-3708-1-git-send-email-kevin3.tang@gmail.com>
 <1582271336-3708-2-git-send-email-kevin3.tang@gmail.com>
 <20200221212118.GC3456@ravnborg.org>
In-Reply-To: <20200221212118.GC3456@ravnborg.org>
From: tang pengchuan <kevin3.tang@gmail.com>
Date: Sat, 22 Feb 2020 20:40:59 +0800
Message-ID: <CAFPSGXZsC2zPz6sWseydjWkvYbanQBt3-1D9zeV-AsHUp2_Pbg@mail.gmail.com>
Subject: Re: [PATCH RFC v3 1/6] dt-bindings: display: add Unisoc's drm master
 bindings
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
Content-Type: multipart/mixed; boundary="===============0737629579=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--===============0737629579==
Content-Type: multipart/alternative; boundary="000000000000f5b2b4059f29734d"

--000000000000f5b2b4059f29734d
Content-Type: text/plain; charset="UTF-8"

Hi Sam,
Thank you for your email

On Sat, Feb 22, 2020 at 5:21 AM Sam Ravnborg <sam@ravnborg.org> wrote:

> Hi Kevin.
>
> On Fri, Feb 21, 2020 at 03:48:51PM +0800, Kevin Tang wrote:
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
> >  .../devicetree/bindings/display/sprd/drm.yaml      | 38
> ++++++++++++++++++++++
> >  1 file changed, 38 insertions(+)
> >  create mode 100644
> Documentation/devicetree/bindings/display/sprd/drm.yaml
> >
> > diff --git a/Documentation/devicetree/bindings/display/sprd/drm.yaml
> b/Documentation/devicetree/bindings/display/sprd/drm.yaml
> > new file mode 100644
> > index 0000000..1614ca6
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/display/sprd/drm.yaml
> > @@ -0,0 +1,38 @@
> > +# SPDX-License-Identifier: GPL-2.0
> > +%YAML 1.2
> > +---
> > +$id: http://devicetree.org/schemas/display/sprd/drm.yaml#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: Unisoc DRM master device
> > +
> > +maintainers:
> > +  - David Airlie <airlied@linux.ie>
> > +  - Daniel Vetter <daniel@ffwll.ch>
> > +  - Rob Herring <robh+dt@kernel.org>
> > +  - Mark Rutland <mark.rutland@arm.com>
>
> Rob is king of a super-maintainer.
> He should not be listed unless he has special
> relations to sprd.
> David + Daniel - likewise. Unless they are closely related to sprd drop
> them.
>
Thanks for your reminder, i will do it.

>
> > +
> > +description: |
> > +  The Unisoc DRM master device is a virtual device needed to list all
> > +  DPU devices or other display interface nodes that comprise the
> > +  graphics subsystem.
>
> I wonder why you name it "Unisoc" when all other places references sprd.
>
About vendor name, orson has already helped explain it, thanks you.

>
>
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
> So you want to force the driver to support ports - and no panel
> referenced directly?
>
> The ports is related to our display controller, not panel.
Panel driver is registered as mipi dsi device, so we put it in encoder(dsi)
node.

> > +
> > +examples:
> > +  - |
> > +    display-subsystem {
> > +        compatible = "sprd,display-subsystem";
> > +        ports = <&dpu_out>;
> > +    };
> > \ No newline at end of file
> Please fix.
>
Ok, i will fix it.

>
>         Sam
>

--000000000000f5b2b4059f29734d
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Hi Sam,</div><div>Thank you for your email</div><br><=
div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Sat, Feb=
 22, 2020 at 5:21 AM Sam Ravnborg &lt;<a href=3D"mailto:sam@ravnborg.org">s=
am@ravnborg.org</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" s=
tyle=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);pad=
ding-left:1ex">Hi Kevin.<br>
<br>
On Fri, Feb 21, 2020 at 03:48:51PM +0800, Kevin Tang wrote:<br>
&gt; From: Kevin Tang &lt;<a href=3D"mailto:kevin.tang@unisoc.com" target=
=3D"_blank">kevin.tang@unisoc.com</a>&gt;<br>
&gt; <br>
&gt; The Unisoc DRM master device is a virtual device needed to list all<br=
>
&gt; DPU devices or other display interface nodes that comprise the<br>
&gt; graphics subsystem<br>
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
&gt;=C2=A0 .../devicetree/bindings/display/sprd/drm.yaml=C2=A0 =C2=A0 =C2=
=A0 | 38 ++++++++++++++++++++++<br>
&gt;=C2=A0 1 file changed, 38 insertions(+)<br>
&gt;=C2=A0 create mode 100644 Documentation/devicetree/bindings/display/spr=
d/drm.yaml<br>
&gt; <br>
&gt; diff --git a/Documentation/devicetree/bindings/display/sprd/drm.yaml b=
/Documentation/devicetree/bindings/display/sprd/drm.yaml<br>
&gt; new file mode 100644<br>
&gt; index 0000000..1614ca6<br>
&gt; --- /dev/null<br>
&gt; +++ b/Documentation/devicetree/bindings/display/sprd/drm.yaml<br>
&gt; @@ -0,0 +1,38 @@<br>
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
&gt; +=C2=A0 - David Airlie &lt;<a href=3D"mailto:airlied@linux.ie" target=
=3D"_blank">airlied@linux.ie</a>&gt;<br>
&gt; +=C2=A0 - Daniel Vetter &lt;<a href=3D"mailto:daniel@ffwll.ch" target=
=3D"_blank">daniel@ffwll.ch</a>&gt;<br>
&gt; +=C2=A0 - Rob Herring &lt;<a href=3D"mailto:robh%2Bdt@kernel.org" targ=
et=3D"_blank">robh+dt@kernel.org</a>&gt;<br>
&gt; +=C2=A0 - Mark Rutland &lt;<a href=3D"mailto:mark.rutland@arm.com" tar=
get=3D"_blank">mark.rutland@arm.com</a>&gt;<br>
<br>
Rob is king of a super-maintainer.<br>
He should not be listed unless he has special<br>
relations to sprd.<br>
David + Daniel - likewise. Unless they are closely related to sprd drop<br>
them.<br></blockquote><div>Thanks for your reminder, i will do it.</div><bl=
ockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-lef=
t:1px solid rgb(204,204,204);padding-left:1ex">
<br>
&gt; +<br>
&gt; +description: |<br>
&gt; +=C2=A0 The Unisoc DRM master device is a virtual device needed to lis=
t all<br>
&gt; +=C2=A0 DPU devices or other display interface nodes that comprise the=
<br>
&gt; +=C2=A0 graphics subsystem.<br>
<br>
I wonder why you name it &quot;Unisoc&quot; when all other places reference=
s sprd.<br></blockquote><div>About vendor name, orson has already helped ex=
plain it,=C2=A0thanks you.</div><blockquote class=3D"gmail_quote" style=3D"=
margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-lef=
t:1ex">
<br>
<br>
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
So you want to force the driver to support ports - and no panel<br>
referenced directly?<br>
<br></blockquote><div>The ports is related to our display controller, not p=
anel.=C2=A0</div><div>Panel driver is registered as mipi dsi device, so we =
put it in encoder(dsi) node.</div><blockquote class=3D"gmail_quote" style=
=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding=
-left:1ex">
&gt; +<br>
&gt; +examples:<br>
&gt; +=C2=A0 - |<br>
&gt; +=C2=A0 =C2=A0 display-subsystem {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 compatible =3D &quot;sprd,display-subsyst=
em&quot;;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 ports =3D &lt;&amp;dpu_out&gt;;<br>
&gt; +=C2=A0 =C2=A0 };<br>
&gt; \ No newline at end of file<br>
Please fix.<br></blockquote><div>Ok, i will fix it.=C2=A0</div><blockquote =
class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px sol=
id rgb(204,204,204);padding-left:1ex">
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 Sam<br>
</blockquote></div></div>

--000000000000f5b2b4059f29734d--

--===============0737629579==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============0737629579==--
