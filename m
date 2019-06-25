Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 390D45642D
	for <lists+dri-devel@lfdr.de>; Wed, 26 Jun 2019 10:13:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ABC016E2E2;
	Wed, 26 Jun 2019 08:12:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x443.google.com (mail-pf1-x443.google.com
 [IPv6:2607:f8b0:4864:20::443])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 05B8089A60
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Jun 2019 11:44:19 +0000 (UTC)
Received: by mail-pf1-x443.google.com with SMTP id y15so4711082pfn.5
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Jun 2019 04:44:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=hT63YlbhCQmvL04eqFCPmgAaKUDVzUkax1uUULEYwCc=;
 b=m3OLi9DZX/zaqJ5Ytzv4WhWD9PRapzG8IM34FfL3tY6UjseYFL6gf8CbyuYIofjVGV
 DJnAfJFLYDYyDimyQLrZUruBbdtoL4NPlTeOjB7kyPTKnlOr1FApkxVavMPkXeLJUKoX
 D47xuntcHlI9ZJ+w6TLXMWU2LxPCI+yviFI/eVWVCiTVkFdtueA7BshR6Iwumu7j+n2N
 4xcfLKjgeikYjfbrS4/kOESlHLWh0wCEy/i1/gX44sjJBqDy93jVF6uMRjZI9qO/XQl8
 1/OUUqZeGalxIQ8KCTCqDKLv+on1ThmWbFIbHTWheeXr7zh62URyDgt5NkyMzoRX5E8y
 M5nQ==
X-Gm-Message-State: APjAAAUqgDVpl9rkzezLPK5EnTxG1cgzaXqaFznsxChDA5jxE3uZgj9E
 tNqGMwaMQMz+Cd/PsPybFJfrfsG93oAAaD+Azzg=
X-Google-Smtp-Source: APXvYqw27plyH8ldc4Y5dhA4KC/pz6zCB5yPsqMnf5gX/sFiFB640KAFjnpHgKglHfHVI10yhdHLMGiozcD48zMbtLU=
X-Received: by 2002:a63:c03:: with SMTP id b3mr27831750pgl.68.1561463058452;
 Tue, 25 Jun 2019 04:44:18 -0700 (PDT)
MIME-Version: 1.0
References: <1561435529-7835-1-git-send-email-bdodge09@gmail.com>
 <1561435529-7835-2-git-send-email-bdodge09@gmail.com>
 <20190625085534.xf2ullyju3ewbgik@holly.lan>
In-Reply-To: <20190625085534.xf2ullyju3ewbgik@holly.lan>
From: Brian Dodge <bdodge09@gmail.com>
Date: Tue, 25 Jun 2019 07:44:06 -0400
Message-ID: <CAFaGBPnH=75=wJRM4EX9MYR8MSehEa2_hBEOsqo-DZvD6c6f_A@mail.gmail.com>
Subject: Re: [PATCH 1/2] dt-bindings: backlight: fix vendor prefix for
 ArcticSand arcxcnn driver bindings
To: Daniel Thompson <daniel.thompson@linaro.org>
X-Mailman-Approved-At: Wed, 26 Jun 2019 08:12:13 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=hT63YlbhCQmvL04eqFCPmgAaKUDVzUkax1uUULEYwCc=;
 b=b46FZrDNKNNuPu9T9l1OclXAnZrCuraL3COaIOrCGqiGC17gZeXgqgJAAMMv3f9s1J
 A6/b1qkWJSr5/le8wDTboD5BuyQpK/zqXdHE+06Ual5tmkyFeDVItBtsJaLBYyHIS0Ia
 gmjORSS091R/Equw5V5jfMnVHBw5TpXJ5n0o9pdYxTyPx0BNgb1ayfnTBLlk0lCuEcYt
 FHZUB+vIbaF3Iss8p2bf7ef+lU33yXoTyjR8o9qfsM2cckxVdD4kd9DNzYk9YdlwM3BW
 kqluqxA1mJD4m+OiggjtKXVqZoGDDsdrcYwx9Q/AVZdQYyOWmSOuEiEBn3ZddMvtf+EO
 g1BQ==
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
Cc: devicetree@vger.kernel.org, jingoohan1@gmail.com,
 dri-devel@lists.freedesktop.org, robh+dt@kernel.org,
 jacek.anaszewski@gmail.com, Pavel Machek <pavel@ucw.cz>, pbacon@psemi.com,
 lee.jones@linaro.org, linux-leds@vger.kernel.org
Content-Type: multipart/mixed; boundary="===============1829269519=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--===============1829269519==
Content-Type: multipart/alternative; boundary="000000000000edd2ce058c2472a9"

--000000000000edd2ce058c2472a9
Content-Type: text/plain; charset="UTF-8"

I would like to deprecate the old prefix in the future after communicating
with all chip customers, which is why the old prefix is not documented in
the new bindings.


On Tue, Jun 25, 2019, 4:55 AM Daniel Thompson <daniel.thompson@linaro.org>
wrote:

> On Tue, Jun 25, 2019 at 12:05:28AM -0400, Brian Dodge wrote:
> >     The vendor-prefixes.txt file properly refers to ArcticSand
> >     as arctic but the driver bindings improperly abbreviated the
> >     prefix to arc. This was a mistake in the original patch
> >
> > Signed-off-by: Brian Dodge <bdodge09@gmail.com>
> > ---
> >  .../bindings/leds/backlight/arcxcnn_bl.txt         | 24
> +++++++++++++---------
> >  1 file changed, 14 insertions(+), 10 deletions(-)
> >
> > diff --git
> a/Documentation/devicetree/bindings/leds/backlight/arcxcnn_bl.txt
> b/Documentation/devicetree/bindings/leds/backlight/arcxcnn_bl.txt
> > index 230abde..9cf4c44 100644
> > --- a/Documentation/devicetree/bindings/leds/backlight/arcxcnn_bl.txt
> > +++ b/Documentation/devicetree/bindings/leds/backlight/arcxcnn_bl.txt
> > @@ -1,8 +1,12 @@
> > -Binding for ArcticSand arc2c0608 LED driver
> > +Binding for ArcticSand arc family LED drivers
> >
> >  Required properties:
> > -- compatible:                should be "arc,arc2c0608"
> > -- reg:                       slave address
> > +- compatible: one of
> > +     "arctic,arc1c0608"
> > +     "arctic,arc2c0608"
> > +     "arctic,arc3c0845"
>
> This is more a question for the DT folks than for Brian but...
>
> AFAICT this patch is fixing the binding for the ArcticSand devices to
> use the correct value from vendor-prefixes.yaml and has been previously
> discussed here:
> https://lkml.org/lkml/2018/9/25/726
>
> Currently this patch series just updates the DT bindings but the
> implementation also honours the old values (since there is a Chromebook
> in the wild that uses the current bindings).
>
> Hence I'm not clear whether the bindings should document the deprecated
> options too (e.g. make it easier to find the bindings doc with git grep
> and friends).
>
>
> Daniel.
>
>
> > +
> > +- reg:               slave address
> >
> >  Optional properties:
> >  - default-brightness:        brightness value on boot, value from:
> 0-4095
> > @@ -11,19 +15,19 @@ Optional properties:
> >  - led-sources:               List of enabled channels from 0 to 5.
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
> > +- arctic,dim-freq:           PWM mode frequence setting (bits [3:0]
> used)
> > +- arctic,comp-config:        setting for register CONFIG_COMP
> > +- arctic,filter-config:      setting for register FILTER_CONFIG
> > +- arctic,trim-config:        setting for register IMAXTUNE
> >
> >  Note: Optional properties not specified will default to values in IC
> EPROM
> >
> >  Example:
> >
> >  arc2c0608@30 {
> > -     compatible = "arc,arc2c0608";
> > +     compatible = "arctic,arc2c0608";
> >       reg = <0x30>;
> >       default-brightness = <500>;
> >       label = "lcd-backlight";
> > --
> > 2.7.4
> >
>

--000000000000edd2ce058c2472a9
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto">I would like to deprecate the old prefix in the future af=
ter communicating with all chip customers, which is why the old prefix is n=
ot documented in the new bindings.<div dir=3D"auto"><br></div></div><br><di=
v class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Tue, Jun 2=
5, 2019, 4:55 AM Daniel Thompson &lt;<a href=3D"mailto:daniel.thompson@lina=
ro.org" target=3D"_blank" rel=3D"noreferrer">daniel.thompson@linaro.org</a>=
&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 =
0 .8ex;border-left:1px #ccc solid;padding-left:1ex">On Tue, Jun 25, 2019 at=
 12:05:28AM -0400, Brian Dodge wrote:<br>
&gt;=C2=A0 =C2=A0 =C2=A0The vendor-prefixes.txt file properly refers to Arc=
ticSand<br>
&gt;=C2=A0 =C2=A0 =C2=A0as arctic but the driver bindings improperly abbrev=
iated the<br>
&gt;=C2=A0 =C2=A0 =C2=A0prefix to arc. This was a mistake in the original p=
atch<br>
&gt; <br>
&gt; Signed-off-by: Brian Dodge &lt;<a href=3D"mailto:bdodge09@gmail.com" r=
el=3D"noreferrer noreferrer" target=3D"_blank">bdodge09@gmail.com</a>&gt;<b=
r>
&gt; ---<br>
&gt;=C2=A0 .../bindings/leds/backlight/arcxcnn_bl.txt=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0| 24 +++++++++++++---------<br>
&gt;=C2=A0 1 file changed, 14 insertions(+), 10 deletions(-)<br>
&gt; <br>
&gt; diff --git a/Documentation/devicetree/bindings/leds/backlight/arcxcnn_=
bl.txt b/Documentation/devicetree/bindings/leds/backlight/arcxcnn_bl.txt<br=
>
&gt; index 230abde..9cf4c44 100644<br>
&gt; --- a/Documentation/devicetree/bindings/leds/backlight/arcxcnn_bl.txt<=
br>
&gt; +++ b/Documentation/devicetree/bindings/leds/backlight/arcxcnn_bl.txt<=
br>
&gt; @@ -1,8 +1,12 @@<br>
&gt; -Binding for ArcticSand arc2c0608 LED driver<br>
&gt; +Binding for ArcticSand arc family LED drivers<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 Required properties:<br>
&gt; -- compatible:=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
should be &quot;arc,arc2c0608&quot;<br>
&gt; -- reg:=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0slave address<br>
&gt; +- compatible: one of<br>
&gt; +=C2=A0 =C2=A0 =C2=A0&quot;arctic,arc1c0608&quot;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0&quot;arctic,arc2c0608&quot;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0&quot;arctic,arc3c0845&quot;<br>
<br>
This is more a question for the DT folks than for Brian but...<br>
<br>
AFAICT this patch is fixing the binding for the ArcticSand devices to<br>
use the correct value from vendor-prefixes.yaml and has been previously<br>
discussed here:<br>
<a href=3D"https://lkml.org/lkml/2018/9/25/726" rel=3D"noreferrer noreferre=
r noreferrer" target=3D"_blank">https://lkml.org/lkml/2018/9/25/726</a><br>
<br>
Currently this patch series just updates the DT bindings but the<br>
implementation also honours the old values (since there is a Chromebook<br>
in the wild that uses the current bindings).<br>
<br>
Hence I&#39;m not clear whether the bindings should document the deprecated=
<br>
options too (e.g. make it easier to find the bindings doc with git grep<br>
and friends).<br>
<br>
<br>
Daniel.<br>
<br>
<br>
&gt; +<br>
&gt; +- reg:=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0slave ad=
dress<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 Optional properties:<br>
&gt;=C2=A0 - default-brightness:=C2=A0 =C2=A0 =C2=A0 =C2=A0 brightness valu=
e on boot, value from: 0-4095<br>
&gt; @@ -11,19 +15,19 @@ Optional properties:<br>
&gt;=C2=A0 - led-sources:=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0List of enabled channels from 0 to 5.<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0See Documentation/devicetree/bindings/leds/common.txt<br>
&gt;=C2=A0 <br>
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
&gt; +- arctic,dim-freq:=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0PWM mode f=
requence setting (bits [3:0] used)<br>
&gt; +- arctic,comp-config:=C2=A0 =C2=A0 =C2=A0 =C2=A0 setting for register=
 CONFIG_COMP<br>
&gt; +- arctic,filter-config:=C2=A0 =C2=A0 =C2=A0 setting for register FILT=
ER_CONFIG<br>
&gt; +- arctic,trim-config:=C2=A0 =C2=A0 =C2=A0 =C2=A0 setting for register=
 IMAXTUNE<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 Note: Optional properties not specified will default to values i=
n IC EPROM<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 Example:<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 arc2c0608@30 {<br>
&gt; -=C2=A0 =C2=A0 =C2=A0compatible =3D &quot;arc,arc2c0608&quot;;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0compatible =3D &quot;arctic,arc2c0608&quot;;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0reg =3D &lt;0x30&gt;;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0default-brightness =3D &lt;500&gt;;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0label =3D &quot;lcd-backlight&quot;;<br>
&gt; -- <br>
&gt; 2.7.4<br>
&gt; <br>
</blockquote></div>

--000000000000edd2ce058c2472a9--

--===============1829269519==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============1829269519==--
