Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4256C6317F
	for <lists+dri-devel@lfdr.de>; Tue,  9 Jul 2019 09:03:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1838189B70;
	Tue,  9 Jul 2019 07:02:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x641.google.com (mail-pl1-x641.google.com
 [IPv6:2607:f8b0:4864:20::641])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3C6406E034
 for <dri-devel@lists.freedesktop.org>; Mon,  8 Jul 2019 19:05:27 +0000 (UTC)
Received: by mail-pl1-x641.google.com with SMTP id w24so8742384plp.2
 for <dri-devel@lists.freedesktop.org>; Mon, 08 Jul 2019 12:05:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=hR90V4Jsh4ieCzCq+1X8VPcEOb3UElWstzM66fwb0t4=;
 b=q/B0bpdJfWbtPOOS7/LJYWodBsRsa1GcOhHYXHpfAWfD7u+PnjgJFgHrUMAMUxd7YK
 Z8tfVrjgeY/nNqt+rAxl9S9H3ek9BnU6Exj/gfOH6Q9PCbLuHKNVd6x9uwPbaJfiRuq5
 mhY2FhncnuA0cv0LNTfrPjhse5XeV9NqajTBInWZ3hF6DeUOs0JpYlG6kmNj3ODMfKq4
 LxKtJTWCkFq3dKlRFtN78/i36Zxg0lCjAw1c5niWtx7EvgyCLrU/BBncszHDoCg/yWGz
 eaXcTZeG1tELJd7oZg1XphxXCXuTz+UAXF/Jec1SWF4b6uIdxRIhOpnV2Cgqs80Uph0a
 Hpug==
X-Gm-Message-State: APjAAAX7p8mk0/1/EIETWONWnKDtXxf0L3Lkan4CGfS6fQfGNPLh9qv9
 i4J+l8tICtEo8ocB5JZdsQbuAs1qSTpnFTkkNBk=
X-Google-Smtp-Source: APXvYqzrEaQniY0mpNDmUgpDjFX19r4Umqg1IJDUJcX6wPpDscs+YEiDvEx030znB1oBWcMtTlQoeZH26tzT2KuII8s=
X-Received: by 2002:a17:902:6b0c:: with SMTP id
 o12mr26136367plk.113.1562612726632; 
 Mon, 08 Jul 2019 12:05:26 -0700 (PDT)
MIME-Version: 1.0
References: <1561940895-15837-1-git-send-email-bdodge09@gmail.com>
 <1561940895-15837-3-git-send-email-bdodge09@gmail.com>
 <c7b8da82-e492-db1e-5a02-e4a36df6a6f2@ti.com>
In-Reply-To: <c7b8da82-e492-db1e-5a02-e4a36df6a6f2@ti.com>
From: Brian Dodge <bdodge09@gmail.com>
Date: Mon, 8 Jul 2019 15:05:14 -0400
Message-ID: <CAFaGBPmGr=CLZa3Dec9dR9Z_9R0QLNKQv9J=hpdRaLTE_o79aA@mail.gmail.com>
Subject: Re: [PATCH 2/2] backlight: arcxcnn: add "arctic" vendor prefix
To: Dan Murphy <dmurphy@ti.com>
X-Mailman-Approved-At: Tue, 09 Jul 2019 07:01:45 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=hR90V4Jsh4ieCzCq+1X8VPcEOb3UElWstzM66fwb0t4=;
 b=a6DRMpnNkgnQlC80lScW22kylud7ANJMrwQB4EoLoacb1w1bLLsDVLtLx8D4w7qlPh
 oSkZoF5SUO5Pw4te3IejPhhpTEJ1cq571jGIitu+JEgJaaZS0UUgQ5N/AVw30LwPnihX
 /uNdd4WUhBHnMoPHrdqyAlUUAmXYT5LIImYjPSAvJXnBkZ+dqpuFKXhu07lBCOg56qRd
 ywWJnHTvR2lIidQBcmkU+gcbMimQC9nt3O7eRn+nrF1pOwgxzSJYDlg6mqoKlZvlBKWx
 Pi7vbOyHb1rqIGkzHdHJZszIQcPbpvO8Dmat8WWB5LIiKqq5PytxnBjgvfLztnI04J+c
 jHRQ==
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
 jacek.anaszewski@gmail.com, Pavel Machek <pavel@ucw.cz>, pbacon@psemi.com,
 lee.jones@linaro.org, linux-leds@vger.kernel.org
Content-Type: multipart/mixed; boundary="===============0372464003=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--===============0372464003==
Content-Type: multipart/alternative; boundary="0000000000007e1664058d302010"

--0000000000007e1664058d302010
Content-Type: text/plain; charset="UTF-8"

Thanks. pSemi purchased ArcticSand a few years ago so they are the same
legal entity. I will ask them if they want to retain the original copyright
notice

On Mon, Jul 8, 2019, 2:05 PM Dan Murphy <dmurphy@ti.com> wrote:

> Brian
>
> On 6/30/19 7:28 PM, Brian Dodge wrote:
> > The original patch adding this driver and DT bindings improperly
> > used "arc" as the vendor-prefix. This adds "arctic" which is the
> > proper prefix and retains "arc" to allow existing users of the
> > "arc" prefix to update to new kernels. There is at least one
> > (Samsung Chromebook Plus)
> >
> > Signed-off-by: Brian Dodge <bdodge09@gmail.com>
> > Acked-by: Daniel Thompson <daniel.thompson@linaro.org>
> > ---
> >   drivers/video/backlight/arcxcnn_bl.c | 41
> +++++++++++++++++++++++++++---------
> >   1 file changed, 31 insertions(+), 10 deletions(-)
> >
> > diff --git a/drivers/video/backlight/arcxcnn_bl.c
> b/drivers/video/backlight/arcxcnn_bl.c
> > index 7b1c0a0..a419554 100644
> > --- a/drivers/video/backlight/arcxcnn_bl.c
> > +++ b/drivers/video/backlight/arcxcnn_bl.c
> > @@ -1,9 +1,9 @@
> >   // SPDX-License-Identifier: GPL-2.0-only
> >   /*
> > - * Backlight driver for ArcticSand ARC_X_C_0N_0N Devices
> > + * Backlight driver for pSemi (formerly ArcticSand) ARC_X_C_0N_0N
> Devices
> >    *
> > - * Copyright 2016 ArcticSand, Inc.
> > - * Author : Brian Dodge <bdodge@arcticsand.com>
>
> I know you are the original author from ArcticSand but did pSemi
> actually own the copyright in 2016?
>
> I don't think this is a big issue just wondering if we should retain the
> ArcticSand copyright as well.
>
> Probably a question for your legal department.
>
> Otherwise
>
> Reviewed-by: Dan Murphy <dmurphy@ti.com>
>
> > + * Copyright 2016-2019  pSemi, Inc.
> > + * Author : Brian Dodge <bdodge@psemi.com>
> >    */
> >
> >   #include <linux/backlight.h>
> > @@ -191,27 +191,46 @@ static void arcxcnn_parse_dt(struct arcxcnn *lp)
> >       if (ret == 0)
> >               lp->pdata->initial_brightness = prog_val;
> >
> > -     ret = of_property_read_u32(node, "arc,led-config-0", &prog_val);
> > +     ret = of_property_read_u32(node, "arctic,led-config-0", &prog_val);
> > +     if (ret)
> > +             ret = of_property_read_u32(node, "arc,led-config-0",
> &prog_val);
> > +
> >       if (ret == 0)
> >               lp->pdata->led_config_0 = (u8)prog_val;
> >
> > -     ret = of_property_read_u32(node, "arc,led-config-1", &prog_val);
> > +     ret = of_property_read_u32(node, "arctic,led-config-1", &prog_val);
> > +     if (ret)
> > +             ret = of_property_read_u32(node, "arc,led-config-1",
> &prog_val);
> > +
> >       if (ret == 0)
> >               lp->pdata->led_config_1 = (u8)prog_val;
> >
> > -     ret = of_property_read_u32(node, "arc,dim-freq", &prog_val);
> > +     ret = of_property_read_u32(node, "arctic,dim-freq", &prog_val);
> > +     if (ret)
> > +             ret = of_property_read_u32(node, "arc,dim-freq",
> &prog_val);
> > +
> >       if (ret == 0)
> >               lp->pdata->dim_freq = (u8)prog_val;
> >
> > -     ret = of_property_read_u32(node, "arc,comp-config", &prog_val);
> > +     ret = of_property_read_u32(node, "arctic,comp-config", &prog_val);
> > +     if (ret)
> > +             ret = of_property_read_u32(node, "arc,comp-config",
> &prog_val);
> > +
> >       if (ret == 0)
> >               lp->pdata->comp_config = (u8)prog_val;
> >
> > -     ret = of_property_read_u32(node, "arc,filter-config", &prog_val);
> > +     ret = of_property_read_u32(node, "arctic,filter-config",
> &prog_val);
> > +     if (ret)
> > +             ret = of_property_read_u32(node,
> > +                             "arc,filter-config", &prog_val);
> > +
> >       if (ret == 0)
> >               lp->pdata->filter_config = (u8)prog_val;
> >
> > -     ret = of_property_read_u32(node, "arc,trim-config", &prog_val);
> > +     ret = of_property_read_u32(node, "arctic,trim-config", &prog_val);
> > +     if (ret)
> > +             ret = of_property_read_u32(node, "arc,trim-config",
> &prog_val);
> > +
> >       if (ret == 0)
> >               lp->pdata->trim_config = (u8)prog_val;
> >
> > @@ -381,6 +400,8 @@ static int arcxcnn_remove(struct i2c_client *cl)
> >   }
> >
> >   static const struct of_device_id arcxcnn_dt_ids[] = {
> > +     { .compatible = "arctic,arc2c0608" },
> > +     /* here to remain compatible with an older binding, do not use */
> >       { .compatible = "arc,arc2c0608" },
> >       { }
> >   };
> > @@ -404,5 +425,5 @@ static struct i2c_driver arcxcnn_driver = {
> >   module_i2c_driver(arcxcnn_driver);
> >
> >   MODULE_LICENSE("GPL v2");
> > -MODULE_AUTHOR("Brian Dodge <bdodge@arcticsand.com>");
> > +MODULE_AUTHOR("Brian Dodge <bdodge@psemi.com>");
> >   MODULE_DESCRIPTION("ARCXCNN Backlight driver");
>

--0000000000007e1664058d302010
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto">Thanks. pSemi purchased ArcticSand a few=C2=A0years ago s=
o they are the same legal entity. I will ask them if they want to retain th=
e original copyright notice</div><br><div class=3D"gmail_quote"><div dir=3D=
"ltr" class=3D"gmail_attr">On Mon, Jul 8, 2019, 2:05 PM Dan Murphy &lt;<a h=
ref=3D"mailto:dmurphy@ti.com">dmurphy@ti.com</a>&gt; wrote:<br></div><block=
quote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc=
 solid;padding-left:1ex">Brian<br>
<br>
On 6/30/19 7:28 PM, Brian Dodge wrote:<br>
&gt; The original patch adding this driver and DT bindings improperly<br>
&gt; used &quot;arc&quot; as the vendor-prefix. This adds &quot;arctic&quot=
; which is the<br>
&gt; proper prefix and retains &quot;arc&quot; to allow existing users of t=
he<br>
&gt; &quot;arc&quot; prefix to update to new kernels. There is at least one=
<br>
&gt; (Samsung Chromebook Plus)<br>
&gt;<br>
&gt; Signed-off-by: Brian Dodge &lt;<a href=3D"mailto:bdodge09@gmail.com" t=
arget=3D"_blank" rel=3D"noreferrer">bdodge09@gmail.com</a>&gt;<br>
&gt; Acked-by: Daniel Thompson &lt;<a href=3D"mailto:daniel.thompson@linaro=
.org" target=3D"_blank" rel=3D"noreferrer">daniel.thompson@linaro.org</a>&g=
t;<br>
&gt; ---<br>
&gt;=C2=A0 =C2=A0drivers/video/backlight/arcxcnn_bl.c | 41 ++++++++++++++++=
+++++++++++---------<br>
&gt;=C2=A0 =C2=A01 file changed, 31 insertions(+), 10 deletions(-)<br>
&gt;<br>
&gt; diff --git a/drivers/video/backlight/arcxcnn_bl.c b/drivers/video/back=
light/arcxcnn_bl.c<br>
&gt; index 7b1c0a0..a419554 100644<br>
&gt; --- a/drivers/video/backlight/arcxcnn_bl.c<br>
&gt; +++ b/drivers/video/backlight/arcxcnn_bl.c<br>
&gt; @@ -1,9 +1,9 @@<br>
&gt;=C2=A0 =C2=A0// SPDX-License-Identifier: GPL-2.0-only<br>
&gt;=C2=A0 =C2=A0/*<br>
&gt; - * Backlight driver for ArcticSand ARC_X_C_0N_0N Devices<br>
&gt; + * Backlight driver for pSemi (formerly ArcticSand) ARC_X_C_0N_0N Dev=
ices<br>
&gt;=C2=A0 =C2=A0 *<br>
&gt; - * Copyright 2016 ArcticSand, Inc.<br>
&gt; - * Author : Brian Dodge &lt;<a href=3D"mailto:bdodge@arcticsand.com" =
target=3D"_blank" rel=3D"noreferrer">bdodge@arcticsand.com</a>&gt;<br>
<br>
I know you are the original author from ArcticSand but did pSemi <br>
actually own the copyright in 2016?<br>
<br>
I don&#39;t think this is a big issue just wondering if we should retain th=
e <br>
ArcticSand copyright as well.<br>
<br>
Probably a question for your legal department.<br>
<br>
Otherwise<br>
<br>
Reviewed-by: Dan Murphy &lt;<a href=3D"mailto:dmurphy@ti.com" target=3D"_bl=
ank" rel=3D"noreferrer">dmurphy@ti.com</a>&gt;<br>
<br>
&gt; + * Copyright 2016-2019=C2=A0 pSemi, Inc.<br>
&gt; + * Author : Brian Dodge &lt;<a href=3D"mailto:bdodge@psemi.com" targe=
t=3D"_blank" rel=3D"noreferrer">bdodge@psemi.com</a>&gt;<br>
&gt;=C2=A0 =C2=A0 */<br>
&gt;=C2=A0 =C2=A0<br>
&gt;=C2=A0 =C2=A0#include &lt;linux/backlight.h&gt;<br>
&gt; @@ -191,27 +191,46 @@ static void arcxcnn_parse_dt(struct arcxcnn *lp)=
<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0if (ret =3D=3D 0)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0lp-&gt;pdata-&gt=
;initial_brightness =3D prog_val;<br>
&gt;=C2=A0 =C2=A0<br>
&gt; -=C2=A0 =C2=A0 =C2=A0ret =3D of_property_read_u32(node, &quot;arc,led-=
config-0&quot;, &amp;prog_val);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0ret =3D of_property_read_u32(node, &quot;arctic,l=
ed-config-0&quot;, &amp;prog_val);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0if (ret)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ret =3D of_property_r=
ead_u32(node, &quot;arc,led-config-0&quot;, &amp;prog_val);<br>
&gt; +<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0if (ret =3D=3D 0)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0lp-&gt;pdata-&gt=
;led_config_0 =3D (u8)prog_val;<br>
&gt;=C2=A0 =C2=A0<br>
&gt; -=C2=A0 =C2=A0 =C2=A0ret =3D of_property_read_u32(node, &quot;arc,led-=
config-1&quot;, &amp;prog_val);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0ret =3D of_property_read_u32(node, &quot;arctic,l=
ed-config-1&quot;, &amp;prog_val);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0if (ret)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ret =3D of_property_r=
ead_u32(node, &quot;arc,led-config-1&quot;, &amp;prog_val);<br>
&gt; +<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0if (ret =3D=3D 0)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0lp-&gt;pdata-&gt=
;led_config_1 =3D (u8)prog_val;<br>
&gt;=C2=A0 =C2=A0<br>
&gt; -=C2=A0 =C2=A0 =C2=A0ret =3D of_property_read_u32(node, &quot;arc,dim-=
freq&quot;, &amp;prog_val);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0ret =3D of_property_read_u32(node, &quot;arctic,d=
im-freq&quot;, &amp;prog_val);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0if (ret)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ret =3D of_property_r=
ead_u32(node, &quot;arc,dim-freq&quot;, &amp;prog_val);<br>
&gt; +<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0if (ret =3D=3D 0)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0lp-&gt;pdata-&gt=
;dim_freq =3D (u8)prog_val;<br>
&gt;=C2=A0 =C2=A0<br>
&gt; -=C2=A0 =C2=A0 =C2=A0ret =3D of_property_read_u32(node, &quot;arc,comp=
-config&quot;, &amp;prog_val);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0ret =3D of_property_read_u32(node, &quot;arctic,c=
omp-config&quot;, &amp;prog_val);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0if (ret)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ret =3D of_property_r=
ead_u32(node, &quot;arc,comp-config&quot;, &amp;prog_val);<br>
&gt; +<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0if (ret =3D=3D 0)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0lp-&gt;pdata-&gt=
;comp_config =3D (u8)prog_val;<br>
&gt;=C2=A0 =C2=A0<br>
&gt; -=C2=A0 =C2=A0 =C2=A0ret =3D of_property_read_u32(node, &quot;arc,filt=
er-config&quot;, &amp;prog_val);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0ret =3D of_property_read_u32(node, &quot;arctic,f=
ilter-config&quot;, &amp;prog_val);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0if (ret)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ret =3D of_property_r=
ead_u32(node,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;arc,filter-config&quot;, &amp;prog=
_val);<br>
&gt; +<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0if (ret =3D=3D 0)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0lp-&gt;pdata-&gt=
;filter_config =3D (u8)prog_val;<br>
&gt;=C2=A0 =C2=A0<br>
&gt; -=C2=A0 =C2=A0 =C2=A0ret =3D of_property_read_u32(node, &quot;arc,trim=
-config&quot;, &amp;prog_val);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0ret =3D of_property_read_u32(node, &quot;arctic,t=
rim-config&quot;, &amp;prog_val);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0if (ret)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ret =3D of_property_r=
ead_u32(node, &quot;arc,trim-config&quot;, &amp;prog_val);<br>
&gt; +<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0if (ret =3D=3D 0)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0lp-&gt;pdata-&gt=
;trim_config =3D (u8)prog_val;<br>
&gt;=C2=A0 =C2=A0<br>
&gt; @@ -381,6 +400,8 @@ static int arcxcnn_remove(struct i2c_client *cl)<b=
r>
&gt;=C2=A0 =C2=A0}<br>
&gt;=C2=A0 =C2=A0<br>
&gt;=C2=A0 =C2=A0static const struct of_device_id arcxcnn_dt_ids[] =3D {<br=
>
&gt; +=C2=A0 =C2=A0 =C2=A0{ .compatible =3D &quot;arctic,arc2c0608&quot; },=
<br>
&gt; +=C2=A0 =C2=A0 =C2=A0/* here to remain compatible with an older bindin=
g, do not use */<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0{ .compatible =3D &quot;arc,arc2c0608&quot; =
},<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0{ }<br>
&gt;=C2=A0 =C2=A0};<br>
&gt; @@ -404,5 +425,5 @@ static struct i2c_driver arcxcnn_driver =3D {<br>
&gt;=C2=A0 =C2=A0module_i2c_driver(arcxcnn_driver);<br>
&gt;=C2=A0 =C2=A0<br>
&gt;=C2=A0 =C2=A0MODULE_LICENSE(&quot;GPL v2&quot;);<br>
&gt; -MODULE_AUTHOR(&quot;Brian Dodge &lt;<a href=3D"mailto:bdodge@arcticsa=
nd.com" target=3D"_blank" rel=3D"noreferrer">bdodge@arcticsand.com</a>&gt;&=
quot;);<br>
&gt; +MODULE_AUTHOR(&quot;Brian Dodge &lt;<a href=3D"mailto:bdodge@psemi.co=
m" target=3D"_blank" rel=3D"noreferrer">bdodge@psemi.com</a>&gt;&quot;);<br=
>
&gt;=C2=A0 =C2=A0MODULE_DESCRIPTION(&quot;ARCXCNN Backlight driver&quot;);<=
br>
</blockquote></div>

--0000000000007e1664058d302010--

--===============0372464003==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============0372464003==--
