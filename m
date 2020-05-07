Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 48F6B1CA672
	for <lists+dri-devel@lfdr.de>; Fri,  8 May 2020 10:47:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 769C06EA9F;
	Fri,  8 May 2020 08:47:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-xd43.google.com (mail-io1-xd43.google.com
 [IPv6:2607:f8b0:4864:20::d43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ACE156E12A
 for <dri-devel@lists.freedesktop.org>; Thu,  7 May 2020 12:29:28 +0000 (UTC)
Received: by mail-io1-xd43.google.com with SMTP id f3so718293ioj.1
 for <dri-devel@lists.freedesktop.org>; Thu, 07 May 2020 05:29:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=KKAqwDXJJKqMiF/yYBDk97GTDn2w207sar2RIjugUw4=;
 b=Vr+Ok3bN976HGKUTGWeQ36LwoNHmU00yXuYOtLuYNpZaCPdQgQtupnHbsqyrEJXHTJ
 IM1VJ+zgYBUqBcSnvhY/cgPVJtpnya7boXLqqQ88STAFTD2LuVbUneXzz4qUspBG88gm
 vshdGgD1+tvBEnlMlWwreKbAs7jhCdJzAHJXqt9JwK2GDOhuZI7NiYQUJkS9uXX6mRnY
 rOVb9MVOAZnh9WE71awYyOuEUGZSix5838T3zFBh9N8JPMcw6U795XdnsHEnhsLqPwcr
 FeeHdD58pApdW3LHEDtgNhN43zdDTdi+0KC5jMQrzzTI0Wsu3K58O4f9miDSK4KFrVaa
 /bBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=KKAqwDXJJKqMiF/yYBDk97GTDn2w207sar2RIjugUw4=;
 b=lE3ebTa+v8tDpkZCfmgYHoTPSw4hUHHItFRop0pdk6zzNOYXXcwh3shR/se8dODqNK
 pdXnmMQSI1ctIQfHcn+s1DxmD/XfmPgKXq/+l9TURGBwiJGxVXFdTG8LRzI18sLg1lf/
 o7po+OAHZTaXh5WQV+y8GYFQHMlPCJFo4r6uu7Mdc5TR4HCqzbB2w5+IgEyQJVZHzrkm
 nSC4hf0sCa5VOBUjXKKrS30W7148DuYeyQVwdEqxtUgOAVmULjgfHvBH/xMyMtaYSvbJ
 y0jjFz3FKyrL69d4bmoCaLubUmiM6BfKYUtWpV5iaEEXw6C2hdm3vTkERLxMUEkfTUBq
 pvWA==
X-Gm-Message-State: AGi0PubhoZqv4QRNPq5KOhiO34+9UusodudmC+j5aK0yw8PMkAB4l7Kv
 LTt3RsIT31hXcSzGeWjzOm62JoWJSLERy5xOt44=
X-Google-Smtp-Source: APiQypK6QWIdojOiP7s8xqL8vEDc3zkGbnnIUSWTBZFih6Iwrn5meoSJE2t7w2/Zm+TghFtkWq1s9yLVzdivv3xcy0k=
X-Received: by 2002:a02:b88e:: with SMTP id p14mr13107966jam.36.1588854567978; 
 Thu, 07 May 2020 05:29:27 -0700 (PDT)
MIME-Version: 1.0
References: <20200505160329.2976059-1-emil.l.velikov@gmail.com>
 <20200505160329.2976059-3-emil.l.velikov@gmail.com>
In-Reply-To: <20200505160329.2976059-3-emil.l.velikov@gmail.com>
From: Vinay Simha B N <simhavcs@gmail.com>
Date: Thu, 7 May 2020 17:59:16 +0530
Message-ID: <CAGWqDJ4rAmwMzb6Q61Ou9ZLNA2M-i-JhOSokVUkHYHa_-ZxCTw@mail.gmail.com>
Subject: Re: [PATCH 3/3] drm/mipi: use dcs write for
 mipi_dsi_dcs_set_tear_scanline
To: Emil Velikov <emil.l.velikov@gmail.com>
X-Mailman-Approved-At: Fri, 08 May 2020 08:47:23 +0000
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
Cc: Jani Nikula <jani.nikula@intel.com>, Robert Chiras <robert.chiras@nxp.com>,
 Thierry Reding <treding@nvidia.com>, dri-devel@lists.freedesktop.org
Content-Type: multipart/mixed; boundary="===============0712547524=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--===============0712547524==
Content-Type: multipart/alternative; boundary="0000000000001fcb2605a50e081d"

--0000000000001fcb2605a50e081d
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Emil,

Reply inline

On Tue, 5 May 2020 at 9:35 PM, Emil Velikov <emil.l.velikov@gmail.com>
wrote:

> From: Emil Velikov <emil.velikov@collabora.com>
>
> The helper uses the MIPI_DCS_SET_TEAR_SCANLINE, although it's currently
> using the generic write. This does not look right.
>
> Perhaps some platforms don't distinguish between the two writers?
>
> Cc: Robert Chiras <robert.chiras@nxp.com>
> Cc: Vinay Simha BN <simhavcs@gmail.com>
> Cc: Jani Nikula <jani.nikula@intel.com>
> Cc: Thierry Reding <treding@nvidia.com>
> Fixes: e83950816367 ("drm/dsi: Implement set tear scanline")
> Signed-off-by: Emil Velikov <emil.velikov@collabora.com>
> ---
> Robert, can you please test this against the only user - the Raydium
> RM67191 panel driver that you introduced.
>
> Thanks
>
> Vinay, can you confirm if this is a genuine typo or there's something
> really subtle happening.

this has been tested on nexus 7 with jdi panel. I did not understand what
is the typo here?
We need to use DC=E2=80=99s write instead of generic write?

>
> ---
>  drivers/gpu/drm/drm_mipi_dsi.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/gpu/drm/drm_mipi_dsi.c
> b/drivers/gpu/drm/drm_mipi_dsi.c
> index b96d5b4629d7..07102d8da58f 100644
> --- a/drivers/gpu/drm/drm_mipi_dsi.c
> +++ b/drivers/gpu/drm/drm_mipi_dsi.c
> @@ -1082,11 +1082,11 @@ EXPORT_SYMBOL(mipi_dsi_dcs_set_pixel_format);
>   */
>  int mipi_dsi_dcs_set_tear_scanline(struct mipi_dsi_device *dsi, u16
> scanline)
>  {
> -       u8 payload[3] =3D { MIPI_DCS_SET_TEAR_SCANLINE, scanline >> 8,
> -                         scanline & 0xff };
> +       u8 payload[2] =3D { scanline >> 8, scanline & 0xff };
>         ssize_t err;
>
> -       err =3D mipi_dsi_generic_write(dsi, payload, sizeof(payload));
> +       err =3D mipi_dsi_dcs_write(dsi, MIPI_DCS_SET_TEAR_SCANLINE, paylo=
ad,
> +                                sizeof(payload));
>         if (err < 0)
>                 return err;
>
> --
> 2.25.1
>
> --
regards,
vinaysimha

--0000000000001fcb2605a50e081d
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div><div dir=3D"auto">Emil,</div></div><div dir=3D"auto"><br></div><div di=
r=3D"auto">Reply inline</div><div><br><div class=3D"gmail_quote"><div dir=
=3D"ltr" class=3D"gmail_attr">On Tue, 5 May 2020 at 9:35 PM, Emil Velikov &=
lt;<a href=3D"mailto:emil.l.velikov@gmail.com">emil.l.velikov@gmail.com</a>=
&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 =
0 .8ex;border-left:1px #ccc solid;padding-left:1ex">From: Emil Velikov &lt;=
<a href=3D"mailto:emil.velikov@collabora.com" target=3D"_blank">emil.veliko=
v@collabora.com</a>&gt;<br>
<br>
The helper uses the MIPI_DCS_SET_TEAR_SCANLINE, although it&#39;s currently=
<br>
using the generic write. This does not look right.<br>
<br>
Perhaps some platforms don&#39;t distinguish between the two writers?<br>
<br>
Cc: Robert Chiras &lt;<a href=3D"mailto:robert.chiras@nxp.com" target=3D"_b=
lank">robert.chiras@nxp.com</a>&gt;<br>
Cc: Vinay Simha BN &lt;<a href=3D"mailto:simhavcs@gmail.com" target=3D"_bla=
nk">simhavcs@gmail.com</a>&gt;<br>
Cc: Jani Nikula &lt;<a href=3D"mailto:jani.nikula@intel.com" target=3D"_bla=
nk">jani.nikula@intel.com</a>&gt;<br>
Cc: Thierry Reding &lt;<a href=3D"mailto:treding@nvidia.com" target=3D"_bla=
nk">treding@nvidia.com</a>&gt;<br>
Fixes: e83950816367 (&quot;drm/dsi: Implement set tear scanline&quot;)<br>
Signed-off-by: Emil Velikov &lt;<a href=3D"mailto:emil.velikov@collabora.co=
m" target=3D"_blank">emil.velikov@collabora.com</a>&gt;<br>
---<br>
Robert, can you please test this against the only user - the Raydium<br>
RM67191 panel driver that you introduced.<br>
<br>
Thanks<br>
<br>
Vinay, can you confirm if this is a genuine typo or there&#39;s something<b=
r>
really subtle happening.</blockquote><div dir=3D"auto">this has been tested=
 on nexus 7 with jdi panel. I did not understand what is the typo here?</di=
v><div dir=3D"auto">We need to use DC=E2=80=99s write instead of generic wr=
ite?</div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;bord=
er-left:1px #ccc solid;padding-left:1ex"><br>
---<br>
=C2=A0drivers/gpu/drm/drm_mipi_dsi.c | 6 +++---<br>
=C2=A01 file changed, 3 insertions(+), 3 deletions(-)<br>
<br>
diff --git a/drivers/gpu/drm/drm_mipi_dsi.c b/drivers/gpu/drm/drm_mipi_dsi.=
c<br>
index b96d5b4629d7..07102d8da58f 100644<br>
--- a/drivers/gpu/drm/drm_mipi_dsi.c<br>
+++ b/drivers/gpu/drm/drm_mipi_dsi.c<br>
@@ -1082,11 +1082,11 @@ EXPORT_SYMBOL(mipi_dsi_dcs_set_pixel_format);<br>
=C2=A0 */<br>
=C2=A0int mipi_dsi_dcs_set_tear_scanline(struct mipi_dsi_device *dsi, u16 s=
canline)<br>
=C2=A0{<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0u8 payload[3] =3D { MIPI_DCS_SET_TEAR_SCANLINE,=
 scanline &gt;&gt; 8,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0scanline &amp; 0xff };<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0u8 payload[2] =3D { scanline &gt;&gt; 8, scanli=
ne &amp; 0xff };<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 ssize_t err;<br>
<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0err =3D mipi_dsi_generic_write(dsi, payload, si=
zeof(payload));<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0err =3D mipi_dsi_dcs_write(dsi, MIPI_DCS_SET_TE=
AR_SCANLINE, payload,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 sizeof(payload));<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (err &lt; 0)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return err;<br>
<br>
-- <br>
2.25.1<br>
<br>
</blockquote></div></div>-- <br><div dir=3D"ltr" class=3D"gmail_signature" =
data-smartmail=3D"gmail_signature">regards,<br>vinaysimha</div>

--0000000000001fcb2605a50e081d--

--===============0712547524==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============0712547524==--
