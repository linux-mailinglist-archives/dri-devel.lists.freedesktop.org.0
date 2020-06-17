Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F24B41FD2FB
	for <lists+dri-devel@lfdr.de>; Wed, 17 Jun 2020 18:59:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DBEE86E121;
	Wed, 17 Jun 2020 16:59:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from youngberry.canonical.com (youngberry.canonical.com
 [91.189.89.112])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A1EF86E121
 for <dri-devel@lists.freedesktop.org>; Wed, 17 Jun 2020 16:59:12 +0000 (UTC)
Received: from mail-lj1-f199.google.com ([209.85.208.199])
 by youngberry.canonical.com with esmtps
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.86_2)
 (envelope-from <cyrus.lien@canonical.com>) id 1jlbP5-0000Nv-DL
 for dri-devel@lists.freedesktop.org; Wed, 17 Jun 2020 16:59:11 +0000
Received: by mail-lj1-f199.google.com with SMTP id b26so429930ljo.20
 for <dri-devel@lists.freedesktop.org>; Wed, 17 Jun 2020 09:59:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=tb22JGZbdNbkuWGpkJ+2WdDm/qM5T6I4TvdCwbapF6c=;
 b=tOKw3r/k7FuNiOTD+Hanjij5zX0ceIl77LZfRoWvEXvFMojVRCWjvJ7nbfw6coOsAT
 2iakyPhvOMEjCTTEr6JIZ2Zr8AqRRor8VgARMaeNQJLSxbUeeU6pJEFOGi7S+I6cz1rt
 eROGP7H2pCFKf4CPMqPAAuhawgpwRIXmFmlM/wY1AVIYhs7OKtEpvtONx9IxZjKdnZpR
 +/xMNi5BDuDVgxBi5zS3TBn62jZK5NVSfuE5tM/4U0aToy1e1CJtWwCTUrDtGuFS9T2s
 08Ak7mVyawI8trx5TnMFw7vTaOAFC0N0uBCEu3PwBXt5jEqS4Y+AYoULhW+Bzuq72BO8
 LE2A==
X-Gm-Message-State: AOAM531bMG4Fx921IREyNlYQPP9kE2iMKRpP/6mxaaW/2hg+FBGYt6YJ
 ibur20l56fpPQnwuWtw8+Tpcg28Q21YEaBUnHCkNFOSTOQ/0kDMJfiv22xR3x5qv30+ZVF+qD30
 bDULkC7ufgJtB7CokxRGAw1gEt++kRXhOOwYC2vx5bpYs6nW7KY3PV7Ms+vDz0g==
X-Received: by 2002:a19:8407:: with SMTP id g7mr5192639lfd.61.1592413150215;
 Wed, 17 Jun 2020 09:59:10 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJykfs9WepYpOFCz4nkljqcqGpz0gkcgNGOeHld2Fw+fBP7wkih1VoHhB8FAWhtDdHHP93Bv1OUlUcw9n0IzJRg=
X-Received: by 2002:a19:8407:: with SMTP id g7mr5192617lfd.61.1592413149856;
 Wed, 17 Jun 2020 09:59:09 -0700 (PDT)
MIME-Version: 1.0
References: <20200608195704.29841-1-cyrus.lien@canonical.com>
 <20200609145745.GO6112@intel.com>
In-Reply-To: <20200609145745.GO6112@intel.com>
From: Cyrus Lien <cyrus.lien@canonical.com>
Date: Thu, 18 Jun 2020 00:58:33 +0800
Message-ID: <CAC513mV1B1O90RCbiUGN9Z_4jCHRmcTVjH+R0GffYtG=YwjD5A@mail.gmail.com>
Subject: Re: [PATCH] drm/edid: add support for min horizontal rate equal to
 max horizontal rate
To: =?UTF-8?B?VmlsbGUgU3lyasOkbMOk?= <ville.syrjala@linux.intel.com>
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
Cc: Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@linux.ie>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Content-Type: multipart/mixed; boundary="===============1027979789=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--===============1027979789==
Content-Type: multipart/alternative; boundary="0000000000002216bb05a84a9441"

--0000000000002216bb05a84a9441
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 9, 2020 at 10:58 PM Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linu=
x.intel.com>
wrote:

> On Tue, Jun 09, 2020 at 03:57:04AM +0800, Cyrus Lien wrote:
> > According to EDID spec, table 3.26, byte #6 and #8, which said "Minimum
> > rate value shall be less than or equal to maximum rate value". The
> minimum
> > horizontal/vertical rate value is able to be equal to maximum horizonta=
l/
> > veritcal rate value.
>
> How does that justifiy ignoring the min value?
>
> Indeed, this patch does not make sense.
Setting minimum horizontal rate equal to maximum horizontal rate is a
request come from AMD Windows graphic driver for support freesync (I'm not
sure if linux AMD driver also require it).
The problem is mode_in_hsync_range always return false except the mode's
hsync exactly equal to hmax and hmin.

Add print in mode_in_hsync_range():
[drm] mode_in_hsync_range 1920x1200: hsync: 94, hmax: 110, hmix:110
[drm] mode_in_hsync_range 1920x1200: hsync: 107, hmax: 110, hmix:110
[drm] mode_in_hsync_range 1920x1200: hsync: 152, hmax: 110, hmix:110
[drm] mode_in_hsync_range 1920x1440: hsync: 90, hmax: 110, hmix:110
[drm] mode_in_hsync_range 1920x1440: hsync: 113, hmax: 110, hmix:110
[drm] mode_in_hsync_range 1920x1440: hsync: 183, hmax: 110, hmix:110

Is it available to get or calculate the hmax, hmix value from other fields
in EDID ?
Would you please provide some advice or directions to solve this problem ?
Thank you and appreciated the help.

edid-decode (hex):

00 ff ff ff ff ff ff 00 06 af 9b 32 00 00 00 00
00 1e 01 04 b5 26 15 78 03 1f 95 a5 53 35 b5 26
0f 50 54 00 00 00 01 01 01 01 01 01 01 01 01 01
01 01 01 01 01 01 70 d0 00 a0 f0 70 3e 80 30 20
35 00 7d d6 10 00 00 1a 00 00 00 fd 00 32 5a 6e
6e 17 01 11 01 e0 60 20 50 3c 00 00 00 fe 00 34
34 54 52 4e 15 42 31 37 33 5a 41 4e 00 00 00 00
00 05 81 01 28 00 12 00 00 0b 01 0a 20 20 01 af

00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00

----------------

EDID version: 1.4
Manufacturer: AUO Model 12955 Serial Number 0
Made in year 2020
Digital display
10 bits per primary color channel
DisplayPort interface
Maximum image size: 38 cm x 21 cm
Gamma: 2.20
Supported color formats: RGB 4:4:4
First detailed timing includes the native pixel format and preferred
refresh rate
Display is continuous frequency
Color Characteristics
  Red:   0.6445, 0.3251
  Green: 0.2099, 0.7099
  Blue:  0.1503, 0.0595
  White: 0.3134, 0.3291
Established Timings I & II: none
Standard Timings: none
Detailed mode: Clock 533.600 MHz, 381 mm x 214 mm
               3840 3888 3920 4000 ( 48  32  80)
               2160 2163 2168 2222 (  3   5  54)
               +hsync -vsync
               VertFreq: 60.036 Hz, HorFreq: 133.400 kHz
Display Range Limits
  Monitor ranges (Bare Limits): 50-90 Hz V, 110-110 kHz H, max dotclock 230
MHz
Alphanumeric Data String: 44TRN
Manufacturer-Specified Display Descriptor (0x00): 00 00 00 05 81 01 28 00
12 00 00 0b 01 0a 20 20  ......(.......
Has 1 extension block
Checksum: 0xaf

----------------

>
> > This change check if h/v-sync excess maximum horizontal/vertical rate i=
f
> > hmin equal to hmax or vmin equal to vmax.
> >
> > Signed-off-by: Cyrus Lien <cyrus.lien@canonical.com>
> > ---
> >  drivers/gpu/drm/drm_edid.c | 6 ++++++
> >  1 file changed, 6 insertions(+)
> >
> > diff --git a/drivers/gpu/drm/drm_edid.c b/drivers/gpu/drm/drm_edid.c
> > index fed653f13c26..23878320eabd 100644
> > --- a/drivers/gpu/drm/drm_edid.c
> > +++ b/drivers/gpu/drm/drm_edid.c
> > @@ -2674,6 +2674,9 @@ mode_in_hsync_range(const struct drm_display_mode
> *mode,
> >           hmax +=3D ((t[4] & 0x08) ? 255 : 0);
> >       hsync =3D drm_mode_hsync(mode);
> >
> > +     if (hmax =3D=3D hmin)
> > +             return (hsync <=3D hmax);
> > +
> >       return (hsync <=3D hmax && hsync >=3D hmin);
> >  }
> >
> > @@ -2691,6 +2694,9 @@ mode_in_vsync_range(const struct drm_display_mode
> *mode,
> >           vmax +=3D ((t[4] & 0x02) ? 255 : 0);
> >       vsync =3D drm_mode_vrefresh(mode);
> >
> > +     if (vmax =3D=3D vmin)
> > +             return (vsync <=3D vmax);
> > +
> >       return (vsync <=3D vmax && vsync >=3D vmin);
> >  }
> >
> > --
> > 2.25.1
> >
> > _______________________________________________
> > dri-devel mailing list
> > dri-devel@lists.freedesktop.org
> > https://lists.freedesktop.org/mailman/listinfo/dri-devel
>
> --
> Ville Syrj=C3=A4l=C3=A4
> Intel
>

--0000000000002216bb05a84a9441
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_default" style=3D"fon=
t-size:small"><br></div></div><br><div class=3D"gmail_quote"><div dir=3D"lt=
r" class=3D"gmail_attr">On Tue, Jun 9, 2020 at 10:58 PM Ville Syrj=C3=A4l=
=C3=A4 &lt;<a href=3D"mailto:ville.syrjala@linux.intel.com">ville.syrjala@l=
inux.intel.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" st=
yle=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padd=
ing-left:1ex">On Tue, Jun 09, 2020 at 03:57:04AM +0800, Cyrus Lien wrote:<b=
r>
&gt; According to EDID spec, table 3.26, byte #6 and #8, which said &quot;M=
inimum<br>
&gt; rate value shall be less than or equal to maximum rate value&quot;. Th=
e minimum<br>
&gt; horizontal/vertical rate value is able to be equal to maximum horizont=
al/<br>
&gt; veritcal rate value.<br>
<br>
How does that justifiy ignoring the min value?<br>
<br></blockquote><div><span class=3D"gmail_default" style=3D"font-size:smal=
l">Indeed, this patch does not make sense.</span></div><div><span class=3D"=
gmail_default" style=3D"font-size:small">Setting</span>=C2=A0<span class=3D=
"gmail_default" style=3D"font-size:small">minimum horizontal rate equal to =
maximum horizontal rate is a request come from AMD Windows graphic driver f=
or support freesync (I&#39;m not sure if linux AMD driver also require it).=
 </span></div><div><span class=3D"gmail_default" style=3D"font-size:small">=
The problem is mode_in_hsync_range always return false except the mode&#39;=
s hsync exactly equal to hmax and hmin.</span></div><div><span class=3D"gma=
il_default" style=3D"font-size:small"><br></span></div><div><span class=3D"=
gmail_default" style=3D"font-size:small">Add print in mode_in_hsync_range()=
:</span></div><div><span class=3D"gmail_default" style=3D"font-size:small">=
[drm] mode_in_hsync_range 1920x1200: hsync: 94, hmax: 110, hmix:110<br>[drm=
] mode_in_hsync_range 1920x1200: hsync: 107, hmax: 110, hmix:110<br>[drm] m=
ode_in_hsync_range 1920x1200: hsync: 152, hmax: 110, hmix:110<br>[drm] mode=
_in_hsync_range 1920x1440: hsync: 90, hmax: 110, hmix:110<br>[drm] mode_in_=
hsync_range 1920x1440: hsync: 113, hmax: 110, hmix:110<br>[drm] mode_in_hsy=
nc_range 1920x1440: hsync: 183, hmax: 110, hmix:110</span></div><div><span =
class=3D"gmail_default" style=3D"font-size:small"><br></span></div><div><sp=
an class=3D"gmail_default" style=3D"font-size:small">Is it available to get=
 or calculate the hmax, hmix value from other fields in EDID ?</span></div>=
<div><span class=3D"gmail_default" style=3D"font-size:small">Would you plea=
se provide some advice or directions to solve this problem ?=C2=A0 Thank yo=
u and appreciated the help.</span></div><div><span class=3D"gmail_default" =
style=3D"font-size:small"><br></span></div><div><span class=3D"gmail_defaul=
t" style=3D"font-size:small">edid-decode (hex):<br><br>00 ff ff ff ff ff ff=
 00 06 af 9b 32 00 00 00 00 <br>00 1e 01 04 b5 26 15 78 03 1f 95 a5 53 35 b=
5 26 <br>0f 50 54 00 00 00 01 01 01 01 01 01 01 01 01 01 <br>01 01 01 01 01=
 01 70 d0 00 a0 f0 70 3e 80 30 20 <br>35 00 7d d6 10 00 00 1a 00 00 00 fd 0=
0 32 5a 6e <br>6e 17 01 11 01 e0 60 20 50 3c 00 00 00 fe 00 34 <br>34 54 52=
 4e 15 42 31 37 33 5a 41 4e 00 00 00 00 <br>00 05 81 01 28 00 12 00 00 0b 0=
1 0a 20 20 01 af <br><br>00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 <b=
r>00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 <br>00 00 00 00 00 00 00 =
00 00 00 00 00 00 00 00 00 <br>00 00 00 00 00 00 00 00 00 00 00 00 00 00 00=
 00 <br>00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 <br>00 00 00 00 00 =
00 00 00 00 00 00 00 00 00 00 00 <br>00 00 00 00 00 00 00 00 00 00 00 00 00=
 00 00 00 <br>00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 <br><br>-----=
-----------<br><br>EDID version: 1.4<br>Manufacturer: AUO Model 12955 Seria=
l Number 0<br>Made in year 2020<br>Digital display<br>10 bits per primary c=
olor channel<br>DisplayPort interface<br>Maximum image size: 38 cm x 21 cm<=
br>Gamma: 2.20<br>Supported color formats: RGB 4:4:4<br>First detailed timi=
ng includes the native pixel format and preferred refresh rate<br>Display i=
s continuous frequency<br>Color Characteristics<br>=C2=A0 Red: =C2=A0 0.644=
5, 0.3251<br>=C2=A0 Green: 0.2099, 0.7099<br>=C2=A0 Blue: =C2=A00.1503, 0.0=
595<br>=C2=A0 White: 0.3134, 0.3291<br>Established Timings I &amp; II: none=
<br>Standard Timings: none<br>Detailed mode: Clock 533.600 MHz, 381 mm x 21=
4 mm<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A03840 3888 39=
20 4000 ( 48 =C2=A032 =C2=A080)<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A02160 2163 2168 2222 ( =C2=A03 =C2=A0 5 =C2=A054)<br>=C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0+hsync -vsync<br>=C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0VertFreq: 60.036 Hz, HorFre=
q: 133.400 kHz<br>Display Range Limits<br>=C2=A0 Monitor ranges (Bare Limit=
s): 50-90 Hz V, 110-110 kHz H, max dotclock 230 MHz<br>Alphanumeric Data St=
ring: 44TRN<br>Manufacturer-Specified Display Descriptor (0x00): 00 00 00 0=
5 81 01 28 00 12 00 00 0b 01 0a 20 20 =C2=A0......(....... =C2=A0<br>Has 1 =
extension block<br>Checksum: 0xaf<br><br>----------------<br></span></div><=
div><span class=3D"gmail_default" style=3D"font-size:small"><br></span></di=
v><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;borde=
r-left:1px solid rgb(204,204,204);padding-left:1ex">
&gt; <br>
&gt; This change check if h/v-sync excess maximum horizontal/vertical rate =
if<br>
&gt; hmin equal to hmax or vmin equal to vmax.<br>
&gt; <br>
&gt; Signed-off-by: Cyrus Lien &lt;<a href=3D"mailto:cyrus.lien@canonical.c=
om" target=3D"_blank">cyrus.lien@canonical.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 drivers/gpu/drm/drm_edid.c | 6 ++++++<br>
&gt;=C2=A0 1 file changed, 6 insertions(+)<br>
&gt; <br>
&gt; diff --git a/drivers/gpu/drm/drm_edid.c b/drivers/gpu/drm/drm_edid.c<b=
r>
&gt; index fed653f13c26..23878320eabd 100644<br>
&gt; --- a/drivers/gpu/drm/drm_edid.c<br>
&gt; +++ b/drivers/gpu/drm/drm_edid.c<br>
&gt; @@ -2674,6 +2674,9 @@ mode_in_hsync_range(const struct drm_display_mod=
e *mode,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0hmax +=3D ((t[4] &amp; 0x08) ?=
 255 : 0);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0hsync =3D drm_mode_hsync(mode);<br>
&gt;=C2=A0 <br>
&gt; +=C2=A0 =C2=A0 =C2=A0if (hmax =3D=3D hmin)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return (hsync &lt;=3D=
 hmax);<br>
&gt; +<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0return (hsync &lt;=3D hmax &amp;&amp; hsync =
&gt;=3D hmin);<br>
&gt;=C2=A0 }<br>
&gt;=C2=A0 <br>
&gt; @@ -2691,6 +2694,9 @@ mode_in_vsync_range(const struct drm_display_mod=
e *mode,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0vmax +=3D ((t[4] &amp; 0x02) ?=
 255 : 0);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0vsync =3D drm_mode_vrefresh(mode);<br>
&gt;=C2=A0 <br>
&gt; +=C2=A0 =C2=A0 =C2=A0if (vmax =3D=3D vmin)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return (vsync &lt;=3D=
 vmax);<br>
&gt; +<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0return (vsync &lt;=3D vmax &amp;&amp; vsync =
&gt;=3D vmin);<br>
&gt;=C2=A0 }<br>
&gt;=C2=A0 <br>
&gt; -- <br>
&gt; 2.25.1<br>
&gt; <br>
&gt; _______________________________________________<br>
&gt; dri-devel mailing list<br>
&gt; <a href=3D"mailto:dri-devel@lists.freedesktop.org" target=3D"_blank">d=
ri-devel@lists.freedesktop.org</a><br>
&gt; <a href=3D"https://lists.freedesktop.org/mailman/listinfo/dri-devel" r=
el=3D"noreferrer" target=3D"_blank">https://lists.freedesktop.org/mailman/l=
istinfo/dri-devel</a><br>
<br>
-- <br>
Ville Syrj=C3=A4l=C3=A4<br>
Intel<br>
</blockquote></div></div>

--0000000000002216bb05a84a9441--

--===============1027979789==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============1027979789==--
