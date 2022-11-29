Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 67E1C63D147
	for <lists+dri-devel@lfdr.de>; Wed, 30 Nov 2022 10:00:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A61C110E42F;
	Wed, 30 Nov 2022 09:00:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x633.google.com (mail-ej1-x633.google.com
 [IPv6:2a00:1450:4864:20::633])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 263D010E0B0
 for <dri-devel@lists.freedesktop.org>; Tue, 29 Nov 2022 14:52:58 +0000 (UTC)
Received: by mail-ej1-x633.google.com with SMTP id ho10so34422196ejc.1
 for <dri-devel@lists.freedesktop.org>; Tue, 29 Nov 2022 06:52:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=sgu03ZmKhMg92dNEZeqTnZpruR7h3UbNf4JCU/GMJ5M=;
 b=m1K1WMeiK9whgKv9T8s1fwvL9qk1YJq82DRjLp5jRHR3xzYtrw/o0zFqH9QTf5SjPn
 vDd84zFIfhhe9FhV++7uPcqohSMLMCWO5xwVdipvy0seDPkzmL+kMeNBlvvvzAwBbuDn
 MmINXFswCMaPyTdGNeRNAkNI+fOIwGcchDcfYKhP/rj8hTz1GvhziiLa1+nLejR1TKqw
 ip3zfG3sZAT/bV7tMyDbkjvK4akWxYAKlc9Rtu/hIlA08pqCfJuwYzkZHvKEbJO217wU
 XxeyJqHSlJwkQapFDfkI91YdrCkY0kx7qJMzfC3bfG4C3+Bjt3bQYfAybGV6gOfVXf7e
 tIvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=sgu03ZmKhMg92dNEZeqTnZpruR7h3UbNf4JCU/GMJ5M=;
 b=4bcPXHiAYLZTM2tJTcsfgeaSwvT6tHj2mcwWUs4E5qN6/65stsg46wVfPVRp0MlrxS
 1eD54YQEy0tuk72gDneUqBw3qjpK6ZnPV7d1lYYjQ6WWmyXd9sGKsk5e2tLUYjuNWZ+4
 JGYeuGfWisoNAlF6ajN7MMdMdsaChHdfiXa7LnDp0Fi1mQVaksHBaHeMxQLAi4aBuKHY
 8EnkiJFTKmf5TI5BzkHSQzT3TuZpYsazPuycJj3ZgI8rr2xl8Q1Nmxhf4vd3SxKNGJBP
 k+6DbFMYbOGz9vka8ZyI3dS1n5cZzPJNKfpUBn9Wbm2+ugeRlK3f/n4pwcUR6Hh3aHtq
 buzA==
X-Gm-Message-State: ANoB5plll8cFBqPqsOjD2kLVyR4Twh2TK7J6wIBBcvgvb1oi1aE55adI
 CkU3FWw+Fo5+6WzeanMAIifgrSVIZYKgJaRscow=
X-Google-Smtp-Source: AA0mqf6Zf45FHwcBo8sUdx8beOxfb1Tb3kCDsFvGodrYUNCGDTGlS6NR1lDUId8w+QWnYyePdWOJ4DctGcf8JFZsLBc=
X-Received: by 2002:a17:906:9e23:b0:7c0:84e8:86a4 with SMTP id
 fp35-20020a1709069e2300b007c084e886a4mr3585499ejc.100.1669733576471; Tue, 29
 Nov 2022 06:52:56 -0800 (PST)
MIME-Version: 1.0
References: <20221013-rpi-dpi-improvements-v2-0-7691903fb9c8@cerno.tech>
 <20221013-rpi-dpi-improvements-v2-3-7691903fb9c8@cerno.tech>
 <Y4X9KY5ZqRUOGnJE@pendragon.ideasonboard.com>
In-Reply-To: <Y4X9KY5ZqRUOGnJE@pendragon.ideasonboard.com>
From: =?UTF-8?Q?J=C3=B6rg_Quinten?= <abugsworstnightmare@gmail.com>
Date: Tue, 29 Nov 2022 15:52:45 +0100
Message-ID: <CACfkkaMX8jVU1OJNCwYKWWHRuXpAXNauZ8OvZs6d1ty24K+8kA@mail.gmail.com>
Subject: Re: [PATCH v2 3/7] media: uapi: add MEDIA_BUS_FMT_BGR666_1X24_CPADHI
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Content-Type: multipart/alternative; boundary="000000000000b1f71505ee9d2445"
X-Mailman-Approved-At: Wed, 30 Nov 2022 08:58:34 +0000
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
Cc: Chris Morgan <macromorgan@hotmail.com>, Emma Anholt <emma@anholt.net>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 David Airlie <airlied@linux.ie>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Eric Anholt <eric@anholt.net>,
 Maxime Ripard <maxime@cerno.tech>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--000000000000b1f71505ee9d2445
Content-Type: text/plain; charset="UTF-8"

Hi Laurent,

looks like linux/Documentation/userspace-api/media/v4l/subdev-formats.rst
doesn't correlate at all to the arrangement and numbering in
linux/include/uapi/linux/media-bus-format.h .

Which sources do you want me to check?

Looking at https://github.com/raspberrypi/linux/tree/rpi-6.1.y btw.

Rgds
Joerg




Am Di., 29. Nov. 2022 um 13:38 Uhr schrieb Laurent Pinchart <
laurent.pinchart@ideasonboard.com>:

> Hi Maxime and Joerg,
>
> Thank you for the patch.
>
> On Thu, Oct 20, 2022 at 10:30:47AM +0200, Maxime Ripard wrote:
> > From: Joerg Quinten <aBUGSworstnightmare@gmail.com>
> >
> > Add the BGR666 format MEDIA_BUS_FMT_BGR666_1X24_CPADHI supported by the
> > RaspberryPi.
> >
> > Signed-off-by: Joerg Quinten <aBUGSworstnightmare@gmail.com>
> > Signed-off-by: Maxime Ripard <maxime@cerno.tech>
> > ---
> >  .../userspace-api/media/v4l/subdev-formats.rst     | 37
> ++++++++++++++++++++++
> >  include/uapi/linux/media-bus-format.h              |  3 +-
> >  2 files changed, 39 insertions(+), 1 deletion(-)
> >
> > diff --git a/Documentation/userspace-api/media/v4l/subdev-formats.rst
> b/Documentation/userspace-api/media/v4l/subdev-formats.rst
> > index 68f8d7d37984..604a30e2f890 100644
> > --- a/Documentation/userspace-api/media/v4l/subdev-formats.rst
> > +++ b/Documentation/userspace-api/media/v4l/subdev-formats.rst
> > @@ -1023,6 +1023,43 @@ The following tables list existing packed RGB
> formats.
> >        - g\ :sub:`2`
> >        - g\ :sub:`1`
> >        - g\ :sub:`0`
> > +    * .. _MEDIA-BUS-FMT-BGR666-1X24_CPADHI:
>
> I would move this just below MEDIA_BUS_FMT_RGB565_1X24_CPADHI. Actually,
> could you check 1/7 and 2/7 to make sure the formats are sorted in the
> documentation in the same order as in the header ?
>
> > +
> > +      - MEDIA_BUS_FMT_BGR666_1X24_CPADHI
> > +      - 0x1024
> > +      -
> > +      -
> > +      -
> > +      -
> > +      -
> > +      -
> > +      -
> > +      -
> > +      -
> > +      - 0
> > +      - 0
> > +      - b\ :sub:`5`
> > +      - b\ :sub:`4`
> > +      - b\ :sub:`3`
> > +      - b\ :sub:`2`
> > +      - b\ :sub:`1`
> > +      - b\ :sub:`0`
> > +      - 0
> > +      - 0
> > +      - g\ :sub:`5`
> > +      - g\ :sub:`4`
> > +      - g\ :sub:`3`
> > +      - g\ :sub:`2`
> > +      - g\ :sub:`1`
> > +      - g\ :sub:`0`
> > +      - 0
> > +      - 0
> > +      - r\ :sub:`5`
> > +      - r\ :sub:`4`
> > +      - r\ :sub:`3`
> > +      - r\ :sub:`2`
> > +      - r\ :sub:`1`
> > +      - r\ :sub:`0`
> >      * .. _MEDIA-BUS-FMT-RGB565-1X24_CPADHI:
> >
> >        - MEDIA_BUS_FMT_RGB565_1X24_CPADHI
> > diff --git a/include/uapi/linux/media-bus-format.h
> b/include/uapi/linux/media-bus-format.h
> > index 2ee0b38c0a71..d4228d038b54 100644
> > --- a/include/uapi/linux/media-bus-format.h
> > +++ b/include/uapi/linux/media-bus-format.h
> > @@ -34,7 +34,7 @@
> >
> >  #define MEDIA_BUS_FMT_FIXED                  0x0001
> >
> > -/* RGB - next is     0x1024 */
> > +/* RGB - next is     0x1025 */
> >  #define MEDIA_BUS_FMT_RGB444_1X12            0x1016
> >  #define MEDIA_BUS_FMT_RGB444_2X8_PADHI_BE    0x1001
> >  #define MEDIA_BUS_FMT_RGB444_2X8_PADHI_LE    0x1002
> > @@ -49,6 +49,7 @@
> >  #define MEDIA_BUS_FMT_BGR666_1X18            0x1023
> >  #define MEDIA_BUS_FMT_RGB666_1X18            0x1009
> >  #define MEDIA_BUS_FMT_RBG888_1X24            0x100e
> > +#define MEDIA_BUS_FMT_BGR666_1X24_CPADHI     0x1024
> >  #define MEDIA_BUS_FMT_RGB666_1X24_CPADHI     0x1015
> >  #define MEDIA_BUS_FMT_RGB666_1X7X3_SPWG              0x1010
> >  #define MEDIA_BUS_FMT_BGR888_1X24            0x1013
> >
>
> --
> Regards,
>
> Laurent Pinchart
>

--000000000000b1f71505ee9d2445
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi Laurent,<div><br></div><div>looks like=C2=A0linux/Docum=
entation/userspace-api/media/v4l/subdev-formats.rst doesn&#39;t correlate a=
t all to the arrangement and numbering in linux/include/uapi/linux/media-bu=
s-format.h .</div><div><br></div><div>Which sources do you want me to check=
?</div><div><br></div><div>Looking at=C2=A0<a href=3D"https://github.com/ra=
spberrypi/linux/tree/rpi-6.1.y">https://github.com/raspberrypi/linux/tree/r=
pi-6.1.y</a> btw.</div><div><br></div><div>Rgds</div><div>Joerg</div><div><=
br></div><div><br></div><div><br></div></div><br><div class=3D"gmail_quote"=
><div dir=3D"ltr" class=3D"gmail_attr">Am Di., 29. Nov. 2022 um 13:38=C2=A0=
Uhr schrieb Laurent Pinchart &lt;<a href=3D"mailto:laurent.pinchart@ideason=
board.com" target=3D"_blank">laurent.pinchart@ideasonboard.com</a>&gt;:<br>=
</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;b=
order-left-width:1px;border-left-style:solid;border-left-color:rgb(204,204,=
204);padding-left:1ex">Hi Maxime and Joerg,<br>
<br>
Thank you for the patch.<br>
<br>
On Thu, Oct 20, 2022 at 10:30:47AM +0200, Maxime Ripard wrote:<br>
&gt; From: Joerg Quinten &lt;<a href=3D"mailto:aBUGSworstnightmare@gmail.co=
m" target=3D"_blank">aBUGSworstnightmare@gmail.com</a>&gt;<br>
&gt; <br>
&gt; Add the BGR666 format MEDIA_BUS_FMT_BGR666_1X24_CPADHI supported by th=
e<br>
&gt; RaspberryPi.<br>
&gt; <br>
&gt; Signed-off-by: Joerg Quinten &lt;<a href=3D"mailto:aBUGSworstnightmare=
@gmail.com" target=3D"_blank">aBUGSworstnightmare@gmail.com</a>&gt;<br>
&gt; Signed-off-by: Maxime Ripard &lt;maxime@cerno.tech&gt;<br>
&gt; ---<br>
&gt;=C2=A0 .../userspace-api/media/v4l/subdev-formats.rst=C2=A0 =C2=A0 =C2=
=A0| 37 ++++++++++++++++++++++<br>
&gt;=C2=A0 include/uapi/linux/media-bus-format.h=C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 3 +-<br>
&gt;=C2=A0 2 files changed, 39 insertions(+), 1 deletion(-)<br>
&gt; <br>
&gt; diff --git a/Documentation/userspace-api/media/v4l/subdev-formats.rst =
b/Documentation/userspace-api/media/v4l/subdev-formats.rst<br>
&gt; index 68f8d7d37984..604a30e2f890 100644<br>
&gt; --- a/Documentation/userspace-api/media/v4l/subdev-formats.rst<br>
&gt; +++ b/Documentation/userspace-api/media/v4l/subdev-formats.rst<br>
&gt; @@ -1023,6 +1023,43 @@ The following tables list existing packed RGB f=
ormats.<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 - g\ :sub:`2`<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 - g\ :sub:`1`<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 - g\ :sub:`0`<br>
&gt; +=C2=A0 =C2=A0 * .. _MEDIA-BUS-FMT-BGR666-1X24_CPADHI:<br>
<br>
I would move this just below MEDIA_BUS_FMT_RGB565_1X24_CPADHI. Actually,<br=
>
could you check 1/7 and 2/7 to make sure the formats are sorted in the<br>
documentation in the same order as in the header ?<br>
<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 - MEDIA_BUS_FMT_BGR666_1X24_CPADHI<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 - 0x1024<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 -<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 -<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 -<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 -<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 -<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 -<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 -<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 -<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 -<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 - 0<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 - 0<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 - b\ :sub:`5`<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 - b\ :sub:`4`<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 - b\ :sub:`3`<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 - b\ :sub:`2`<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 - b\ :sub:`1`<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 - b\ :sub:`0`<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 - 0<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 - 0<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 - g\ :sub:`5`<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 - g\ :sub:`4`<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 - g\ :sub:`3`<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 - g\ :sub:`2`<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 - g\ :sub:`1`<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 - g\ :sub:`0`<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 - 0<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 - 0<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 - r\ :sub:`5`<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 - r\ :sub:`4`<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 - r\ :sub:`3`<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 - r\ :sub:`2`<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 - r\ :sub:`1`<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 - r\ :sub:`0`<br>
&gt;=C2=A0 =C2=A0 =C2=A0 * .. _MEDIA-BUS-FMT-RGB565-1X24_CPADHI:<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 - MEDIA_BUS_FMT_RGB565_1X24_CPADHI<br>
&gt; diff --git a/include/uapi/linux/media-bus-format.h b/include/uapi/linu=
x/media-bus-format.h<br>
&gt; index 2ee0b38c0a71..d4228d038b54 100644<br>
&gt; --- a/include/uapi/linux/media-bus-format.h<br>
&gt; +++ b/include/uapi/linux/media-bus-format.h<br>
&gt; @@ -34,7 +34,7 @@<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 #define MEDIA_BUS_FMT_FIXED=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 0x0001<br>
&gt;=C2=A0 <br>
&gt; -/* RGB - next is=C2=A0 =C2=A0 =C2=A00x1024 */<br>
&gt; +/* RGB - next is=C2=A0 =C2=A0 =C2=A00x1025 */<br>
&gt;=C2=A0 #define MEDIA_BUS_FMT_RGB444_1X12=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 0x1016<br>
&gt;=C2=A0 #define MEDIA_BUS_FMT_RGB444_2X8_PADHI_BE=C2=A0 =C2=A0 0x1001<br=
>
&gt;=C2=A0 #define MEDIA_BUS_FMT_RGB444_2X8_PADHI_LE=C2=A0 =C2=A0 0x1002<br=
>
&gt; @@ -49,6 +49,7 @@<br>
&gt;=C2=A0 #define MEDIA_BUS_FMT_BGR666_1X18=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 0x1023<br>
&gt;=C2=A0 #define MEDIA_BUS_FMT_RGB666_1X18=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 0x1009<br>
&gt;=C2=A0 #define MEDIA_BUS_FMT_RBG888_1X24=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 0x100e<br>
&gt; +#define MEDIA_BUS_FMT_BGR666_1X24_CPADHI=C2=A0 =C2=A0 =C2=A00x1024<br=
>
&gt;=C2=A0 #define MEDIA_BUS_FMT_RGB666_1X24_CPADHI=C2=A0 =C2=A0 =C2=A00x10=
15<br>
&gt;=C2=A0 #define MEDIA_BUS_FMT_RGB666_1X7X3_SPWG=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 0x1010<br>
&gt;=C2=A0 #define MEDIA_BUS_FMT_BGR888_1X24=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 0x1013<br>
&gt; <br>
<br>
-- <br>
Regards,<br>
<br>
Laurent Pinchart<br>
</blockquote></div>

--000000000000b1f71505ee9d2445--
