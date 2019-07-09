Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BA4F642A1
	for <lists+dri-devel@lfdr.de>; Wed, 10 Jul 2019 09:25:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7819B89B30;
	Wed, 10 Jul 2019 07:25:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x541.google.com (mail-pg1-x541.google.com
 [IPv6:2607:f8b0:4864:20::541])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C41A289F6F
 for <dri-devel@lists.freedesktop.org>; Tue,  9 Jul 2019 17:48:27 +0000 (UTC)
Received: by mail-pg1-x541.google.com with SMTP id f25so9817633pgv.10
 for <dri-devel@lists.freedesktop.org>; Tue, 09 Jul 2019 10:48:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=oegfSUU15YjYRPsMpaH5BuZCzYXyvIois1RPPIydplk=;
 b=DrSwnnFKb5Bj4+PMgQL0PMR4t2jmGxdKG0vl/lNPLXfB+tyB/zcH90V6RAcRJ1t53J
 GP7ysaTcOjZ32I8kP+YaHImpTICvGFdgiO/N9qDLxeo9hvBiGfL3B4mTYHBV81N2D5Bg
 vMQMN2XIB+gCLJxcZVnrAWRWapd3rxZyIwarHOHpr5R6I4HsKPdyOR4kxjYUBvKZJvR+
 DzciewmuALiPTXBDxdBVuJhu6b6uc4IM0pOn0qcIDe/qTSKpmOLNnjM39F/YCmZGilZi
 0i1IOF+byYA8AJqk/PbdksMjVzA1sgZGQ0lxAqrq8H7X6AYopokuiizdB/TgyZ4j+8mz
 +exg==
X-Gm-Message-State: APjAAAXUIG+jEAPag+OFB9w3pOc11MtJk15+H6cusRjWMSh6Esdn7qIo
 NcbpPwk9LvvPVQOrPjVP9p/2R+S/mG1GV0zz8k8=
X-Google-Smtp-Source: APXvYqxnnEpqyG2yltmvpVPao75F7LG5CKlfnlLKZR6r1mNTLD9Rj29yoWG8EFHYXmcyMrobluwWIX0q2tr1nfG8gj8=
X-Received: by 2002:a17:90a:e397:: with SMTP id
 b23mr1392305pjz.117.1562694507166; 
 Tue, 09 Jul 2019 10:48:27 -0700 (PDT)
MIME-Version: 1.0
References: <1561940895-15837-1-git-send-email-bdodge09@gmail.com>
 <1561940895-15837-2-git-send-email-bdodge09@gmail.com>
 <f2cf7c51-4857-30bd-a096-b1ce5ff01bd5@ti.com>
In-Reply-To: <f2cf7c51-4857-30bd-a096-b1ce5ff01bd5@ti.com>
From: Brian Dodge <bdodge09@gmail.com>
Date: Tue, 9 Jul 2019 13:48:16 -0400
Message-ID: <CAFaGBPk4q5Cfy4q4KqGDb7KwU_Mi22Mzu88KVO+3G7OJztyABQ@mail.gmail.com>
Subject: Re: [PATCH 1/2] dt-bindings: backlight: fix vendor prefix for
 ArcticSand arcxcnn driver bindings
To: Dan Murphy <dmurphy@ti.com>
X-Mailman-Approved-At: Wed, 10 Jul 2019 07:25:19 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=oegfSUU15YjYRPsMpaH5BuZCzYXyvIois1RPPIydplk=;
 b=cspjmYR7nN6fF3U+uH5n2r09ZjSKpnZ8yLOmOg986J09TmzHt26ydIlQcStrfUJctQ
 D/hetafxIY66TvRKA1Ps8gPS9BJHa43nlFZ3STO2AJ48WcJ6YHV3oy5QxSozWDidnmJP
 EKW4OHFH1W2QTgS7XNl9ZF3tsAI8SDL3g6mts8xesUsl+qmLXt8XbK77tEsVqnzourE2
 GWPdfDrHZqPJSo4dG8pBxe9Ye4PMcXeAC58rf3X0PnCxorPtNW0sD0z2NRusEbT1kHKP
 5OyASuYkOcpzHE7wgEqpbg6xVN3o3f4PH7GcSDF6eqqvlfpeBJncLyIYVlSn3GfYpvWc
 rG5g==
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.23
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
Cc: devicetree@vger.kernel.org, Daniel Thompson <daniel.thompson@linaro.org>,
 jingoohan1@gmail.com, dri-devel@lists.freedesktop.org, robh+dt@kernel.org,
 jacek.anaszewski@gmail.com, Pavel Machek <pavel@ucw.cz>,
 Peter Bacon <pbacon@psemi.com>, Lee Jones <lee.jones@linaro.org>,
 linux-leds@vger.kernel.org
Content-Type: multipart/mixed; boundary="===============1258962316=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--===============1258962316==
Content-Type: multipart/alternative; boundary="000000000000fe0146058d432abb"

--000000000000fe0146058d432abb
Content-Type: text/plain; charset="UTF-8"

FYI: please note that pSemi's legal department has informed me that they do
*not* want to keep the "ArcticSand" copyright notices and the single pSemi
line is appropriate.

On Mon, Jul 8, 2019 at 2:02 PM Dan Murphy <dmurphy@ti.com> wrote:

> Brian
>
> On 6/30/19 7:28 PM, Brian Dodge wrote:
> > The vendor-prefixes.txt file properly refers to ArcticSand
> > as arctic but the driver bindings improperly abbreviated the
> > prefix to arc. This was a mistake in the original patch. This
> > patch adds "arctic" and retains "arc" (deprecated) bindings
> >
> > Signed-off-by: Brian Dodge <bdodge09@gmail.com>
> > ---
> >   .../bindings/leds/backlight/arcxcnn_bl.txt         | 31
> +++++++++++++++-------
> >   1 file changed, 21 insertions(+), 10 deletions(-)
> >
> > diff --git
> a/Documentation/devicetree/bindings/leds/backlight/arcxcnn_bl.txt
> b/Documentation/devicetree/bindings/leds/backlight/arcxcnn_bl.txt
> > index 230abde..4d98394 100644
> > --- a/Documentation/devicetree/bindings/leds/backlight/arcxcnn_bl.txt
> > +++ b/Documentation/devicetree/bindings/leds/backlight/arcxcnn_bl.txt
> > @@ -1,8 +1,13 @@
> > -Binding for ArcticSand arc2c0608 LED driver
> > +Binding for ArcticSand arc family LED drivers
> >
> >   Required properties:
> > -- compatible:                should be "arc,arc2c0608"
> > -- reg:                       slave address
> > +- compatible: one of
> > +     "arctic,arc1c0608"
> > +     "arctic,arc2c0608"
> > +     "arctic,arc3c0845"
> > +     "arc,arc2c0608" (deprecated)
> > +
> > +- reg:               slave address
> >
> >   Optional properties:
> >   - default-brightness:       brightness value on boot, value from:
> 0-4095
> > @@ -11,19 +16,25 @@ Optional properties:
> >   - led-sources:              List of enabled channels from 0 to 5.
> >                       See
> Documentation/devicetree/bindings/leds/common.txt
> >
> > -- arc,led-config-0:  setting for register ILED_CONFIG_0
> > -- arc,led-config-1:  setting for register ILED_CONFIG_1
> > -- arc,dim-freq:              PWM mode frequence setting (bits [3:0]
> used)
> > -- arc,comp-config:   setting for register CONFIG_COMP
> > -- arc,filter-config: setting for register FILTER_CONFIG
> > -- arc,trim-config:   setting for register IMAXTUNE
> > +- arctic,led-config-0:       setting for register ILED_CONFIG_0
> > +- arctic,led-config-1:       setting for register ILED_CONFIG_1
> > +- arctic,dim-freq:   PWM mode frequence setting (bits [3:0] used)
> > +- arctic,comp-config:        setting for register CONFIG_COMP
> > +- arctic,filter-config:      setting for register FILTER_CONFIG
> > +- arctic,trim-config:        setting for register IMAXTUNE
> > +- arc,led-config-0:  setting for register ILED_CONFIG_0 (deprecated)
> > +- arc,led-config-1:  setting for register ILED_CONFIG_1 (deprecated)
> > +- arc,dim-freq:              PWM mode frequence setting (bits [3:0]
> used) (deprecated)
> > +- arc,comp-config:   setting for register CONFIG_COMP (deprecated)
> > +- arc,filter-config: setting for register FILTER_CONFIG (deprecated)
> > +- arc,trim-config:   setting for register IMAXTUNE (deprecated)
> >
> >   Note: Optional properties not specified will default to values in IC
> EPROM
> >
> >   Example:
> >
> >   arc2c0608@30 {
> > -     compatible = "arc,arc2c0608";
> > +     compatible = "arctic,arc2c0608";
> >       reg = <0x30>;
> >       default-brightness = <500>;
> >       label = "lcd-backlight";
>
>
> Reviewed-by: Dan Murphy <dmurphy@ti.com>
>
>

--000000000000fe0146058d432abb
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">FYI: please note that pSemi&#39;s legal department has inf=
ormed me that they do *not* want to keep the &quot;ArcticSand&quot; copyrig=
ht notices and the single pSemi line is appropriate.=C2=A0</div><br><div cl=
ass=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Mon, Jul 8, 20=
19 at 2:02 PM Dan Murphy &lt;<a href=3D"mailto:dmurphy@ti.com" target=3D"_b=
lank">dmurphy@ti.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quo=
te" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204=
);padding-left:1ex">Brian<br>
<br>
On 6/30/19 7:28 PM, Brian Dodge wrote:<br>
&gt; The vendor-prefixes.txt file properly refers to ArcticSand<br>
&gt; as arctic but the driver bindings improperly abbreviated the<br>
&gt; prefix to arc. This was a mistake in the original patch. This<br>
&gt; patch adds &quot;arctic&quot; and retains &quot;arc&quot; (deprecated)=
 bindings<br>
&gt;<br>
&gt; Signed-off-by: Brian Dodge &lt;<a href=3D"mailto:bdodge09@gmail.com" t=
arget=3D"_blank">bdodge09@gmail.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 =C2=A0.../bindings/leds/backlight/arcxcnn_bl.txt=C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0| 31 +++++++++++++++-------<br>
&gt;=C2=A0 =C2=A01 file changed, 21 insertions(+), 10 deletions(-)<br>
&gt;<br>
&gt; diff --git a/Documentation/devicetree/bindings/leds/backlight/arcxcnn_=
bl.txt b/Documentation/devicetree/bindings/leds/backlight/arcxcnn_bl.txt<br=
>
&gt; index 230abde..4d98394 100644<br>
&gt; --- a/Documentation/devicetree/bindings/leds/backlight/arcxcnn_bl.txt<=
br>
&gt; +++ b/Documentation/devicetree/bindings/leds/backlight/arcxcnn_bl.txt<=
br>
&gt; @@ -1,8 +1,13 @@<br>
&gt; -Binding for ArcticSand arc2c0608 LED driver<br>
&gt; +Binding for ArcticSand arc family LED drivers<br>
&gt;=C2=A0 =C2=A0<br>
&gt;=C2=A0 =C2=A0Required properties:<br>
&gt; -- compatible:=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
should be &quot;arc,arc2c0608&quot;<br>
&gt; -- reg:=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0slave address<br>
&gt; +- compatible: one of<br>
&gt; +=C2=A0 =C2=A0 =C2=A0&quot;arctic,arc1c0608&quot;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0&quot;arctic,arc2c0608&quot;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0&quot;arctic,arc3c0845&quot;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0&quot;arc,arc2c0608&quot; (deprecated)<br>
&gt; +<br>
&gt; +- reg:=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0slave ad=
dress<br>
&gt;=C2=A0 =C2=A0<br>
&gt;=C2=A0 =C2=A0Optional properties:<br>
&gt;=C2=A0 =C2=A0- default-brightness:=C2=A0 =C2=A0 =C2=A0 =C2=A0brightness=
 value on boot, value from: 0-4095<br>
&gt; @@ -11,19 +16,25 @@ Optional properties:<br>
&gt;=C2=A0 =C2=A0- led-sources:=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 List of enabled channels from 0 to 5.<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0See Documentation/devicetree/bindings/leds/common.txt<br>
&gt;=C2=A0 =C2=A0<br>
&gt; -- arc,led-config-0:=C2=A0 setting for register ILED_CONFIG_0<br>
&gt; -- arc,led-config-1:=C2=A0 setting for register ILED_CONFIG_1<br>
&gt; -- arc,dim-freq:=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 PWM m=
ode frequence setting (bits [3:0] used)<br>
&gt; -- arc,comp-config:=C2=A0 =C2=A0setting for register CONFIG_COMP<br>
&gt; -- arc,filter-config: setting for register FILTER_CONFIG<br>
&gt; -- arc,trim-config:=C2=A0 =C2=A0setting for register IMAXTUNE<br>
&gt; +- arctic,led-config-0:=C2=A0 =C2=A0 =C2=A0 =C2=A0setting for register=
 ILED_CONFIG_0<br>
&gt; +- arctic,led-config-1:=C2=A0 =C2=A0 =C2=A0 =C2=A0setting for register=
 ILED_CONFIG_1<br>
&gt; +- arctic,dim-freq:=C2=A0 =C2=A0PWM mode frequence setting (bits [3:0]=
 used)<br>
&gt; +- arctic,comp-config:=C2=A0 =C2=A0 =C2=A0 =C2=A0 setting for register=
 CONFIG_COMP<br>
&gt; +- arctic,filter-config:=C2=A0 =C2=A0 =C2=A0 setting for register FILT=
ER_CONFIG<br>
&gt; +- arctic,trim-config:=C2=A0 =C2=A0 =C2=A0 =C2=A0 setting for register=
 IMAXTUNE<br>
&gt; +- arc,led-config-0:=C2=A0 setting for register ILED_CONFIG_0 (depreca=
ted)<br>
&gt; +- arc,led-config-1:=C2=A0 setting for register ILED_CONFIG_1 (depreca=
ted)<br>
&gt; +- arc,dim-freq:=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 PWM m=
ode frequence setting (bits [3:0] used) (deprecated)<br>
&gt; +- arc,comp-config:=C2=A0 =C2=A0setting for register CONFIG_COMP (depr=
ecated)<br>
&gt; +- arc,filter-config: setting for register FILTER_CONFIG (deprecated)<=
br>
&gt; +- arc,trim-config:=C2=A0 =C2=A0setting for register IMAXTUNE (depreca=
ted)<br>
&gt;=C2=A0 =C2=A0<br>
&gt;=C2=A0 =C2=A0Note: Optional properties not specified will default to va=
lues in IC EPROM<br>
&gt;=C2=A0 =C2=A0<br>
&gt;=C2=A0 =C2=A0Example:<br>
&gt;=C2=A0 =C2=A0<br>
&gt;=C2=A0 =C2=A0arc2c0608@30 {<br>
&gt; -=C2=A0 =C2=A0 =C2=A0compatible =3D &quot;arc,arc2c0608&quot;;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0compatible =3D &quot;arctic,arc2c0608&quot;;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0reg =3D &lt;0x30&gt;;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0default-brightness =3D &lt;500&gt;;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0label =3D &quot;lcd-backlight&quot;;<br>
<br>
<br>
Reviewed-by: Dan Murphy &lt;<a href=3D"mailto:dmurphy@ti.com" target=3D"_bl=
ank">dmurphy@ti.com</a>&gt;<br>
<br>
</blockquote></div>

--000000000000fe0146058d432abb--

--===============1258962316==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============1258962316==--
