Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DB6448E66F
	for <lists+dri-devel@lfdr.de>; Fri, 14 Jan 2022 09:27:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8E60D10EA1A;
	Fri, 14 Jan 2022 08:27:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x532.google.com (mail-ed1-x532.google.com
 [IPv6:2a00:1450:4864:20::532])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 00E1F10E14E
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Jan 2022 11:21:53 +0000 (UTC)
Received: by mail-ed1-x532.google.com with SMTP id 30so21874131edv.3
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Jan 2022 03:21:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=ioVrE87VI/Xn8AVwF8UdkbTQ90DPCABm7fc0YEK7t9E=;
 b=F7WK+5g2ddWurAzzFqacPeDviPoNdZndpI5IWamnMRp464XncyR5FdYjvoNiLBCOe+
 y37XO4W5g/qU8KY/ZOwhXdQSxYqLhHHTpjGVER76bMXTsnuhJ+7nSH6rP0/XMSNSTUc7
 J8AJpGU89/wQnoYVxJXq36AYh+UrhFeEM/vfhszOKx1Qln6slhdfRcNLMEZYsx3hJxJY
 VEEppLlI24VQeHU2K4wBQ+5wMJsoybTEKF19WEe0X6c1X9+mgAUkHdxTSoiELI1I18by
 xBBJlVscDYH6wcMj90VMtnrqBqquCJvouvHBVeJc+nTx6MfzQDBfEGNkq/43ToKzqKyY
 y1pQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ioVrE87VI/Xn8AVwF8UdkbTQ90DPCABm7fc0YEK7t9E=;
 b=tXh+EVRVATCI3HZa815UscLXkHgI5yOw7mhLq/SYZVuMLRUa1IPB+vzy62J0L7f8HB
 4t1WYi5LFSn6TjKHeStdE9W4xhzIaFX0n+HoRustF78xDn5Mg+HGjTixVA8bpychkflK
 F7A+P/ufhjYvHje8al2CsxnMdoD2FPWzR7RHwf9W1yfmwO1yxV+fCpqGem/3S8F8ux9j
 nYlctm8NBp6N4m7yZdpEeyOntHfwLprnrvnOX745gI9Df9TIEZL18qRtVXs5cbkKwrq6
 GSSYkD/oro4nD2PFaUg27FIv0ZGvyz6AzJ5WAdxCB2nrOW1xIIh4Xacdv6xF89oXPQ+X
 oSbA==
X-Gm-Message-State: AOAM5316dgwdAW50LuSH9M/SNMhxa0LHjIQzstLgIZmkEDrlMtITkfHl
 mqgD4MzwMALGoHw+Nmeopzi/3ewz5R5aa26YpzI=
X-Google-Smtp-Source: ABdhPJyNYBM3o9efYDkqLdwOS5aO6EOCQttI7gvuwFD0+r+hKkoDFkfZszdNESQWwI9mFacZkKNOab2V+DkbaoAaSIk=
X-Received: by 2002:a05:6402:348b:: with SMTP id
 v11mr3740214edc.309.1642072912502; 
 Thu, 13 Jan 2022 03:21:52 -0800 (PST)
MIME-Version: 1.0
References: <20220111034051.28913-1-lzmlzmhh@gmail.com>
 <CAG3jFyuZQko8gj6NXnHQ2GoFNfHSYDwkgmb3Wi+upDZFZpPM4Q@mail.gmail.com>
In-Reply-To: <CAG3jFyuZQko8gj6NXnHQ2GoFNfHSYDwkgmb3Wi+upDZFZpPM4Q@mail.gmail.com>
From: Zhiming Liu <lzmlzmhh@gmail.com>
Date: Thu, 13 Jan 2022 19:21:41 +0800
Message-ID: <CAGH8jLdxpG1T_SHWw893detNE-9u1+d9NC7veD9Vv8hwtFHMgw@mail.gmail.com>
Subject: Re: [PATCH] Remove extra device acquisition method of i2c client in
 lt9611 driver
To: Robert Foss <robert.foss@linaro.org>
Content-Type: multipart/alternative; boundary="000000000000a5201405d574e406"
X-Mailman-Approved-At: Fri, 14 Jan 2022 08:27:12 +0000
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
Cc: jonas@kwiboo.se, airlied@linux.ie, dri-devel@lists.freedesktop.org,
 narmstrong@baylibre.com, linux-kernel@vger.kernel.org,
 jernej.skrabec@gmail.com, a.hajda@samsung.com,
 laurent.pinchart@ideasonboard.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--000000000000a5201405d574e406
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hello Robert,

I am new to linux kernel development, thank you very much for your patient
reply.I will attach V2 of patch in the next email.

Best regards
Zhiming Liu

Robert Foss <robert.foss@linaro.org> =E4=BA=8E2022=E5=B9=B41=E6=9C=8813=E6=
=97=A5=E5=91=A8=E5=9B=9B 18:14=E5=86=99=E9=81=93=EF=BC=9A

> Hello,
>
> Thanks for submitting this cleanup patch.
>
> On Tue, 11 Jan 2022 at 04:41, lzmlzm <lzmlzmhh@gmail.com> wrote:
> >
>
> A commit message is necessary for all changes, no matter how trivial.
>
> > Signed-off-by: lzmlzm <lzmlzmhh@gmail.com>
>
> Is your name listed correctly above? For the 'Signed-off-by' tag to be
> meaningful, a real name needs to be supplied.
>
> > ---
> >  drivers/gpu/drm/bridge/lontium-lt9611.c    | 2 +-
> >  drivers/gpu/drm/bridge/lontium-lt9611uxc.c | 2 +-
> >  2 files changed, 2 insertions(+), 2 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/bridge/lontium-lt9611.c
> b/drivers/gpu/drm/bridge/lontium-lt9611.c
> > index dafb1b47c15f..e0feb4fd9780 100644
> > --- a/drivers/gpu/drm/bridge/lontium-lt9611.c
> > +++ b/drivers/gpu/drm/bridge/lontium-lt9611.c
> > @@ -1090,7 +1090,7 @@ static int lt9611_probe(struct i2c_client *client=
,
> >         if (!lt9611)
> >                 return -ENOMEM;
> >
> > -       lt9611->dev =3D &client->dev;
> > +       lt9611->dev =3D dev;
> >         lt9611->client =3D client;
> >         lt9611->sleep =3D false;
> >
> > diff --git a/drivers/gpu/drm/bridge/lontium-lt9611uxc.c
> b/drivers/gpu/drm/bridge/lontium-lt9611uxc.c
> > index 33f9716da0ee..e50e42312e82 100644
> > --- a/drivers/gpu/drm/bridge/lontium-lt9611uxc.c
> > +++ b/drivers/gpu/drm/bridge/lontium-lt9611uxc.c
> > @@ -860,7 +860,7 @@ static int lt9611uxc_probe(struct i2c_client *clien=
t,
> >         if (!lt9611uxc)
> >                 return -ENOMEM;
> >
> > -       lt9611uxc->dev =3D &client->dev;
> > +       lt9611uxc->dev =3D dev;
> >         lt9611uxc->client =3D client;
> >         mutex_init(&lt9611uxc->ocm_lock);
> >
> > --
>
> With these two issues fixed, please submit a v2 of this patch.
>
>
> Rob.
>

--000000000000a5201405d574e406
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hello Robert,<div><br></div><div>I am new to linux kernel =
development, thank you very much for your patient reply.I will attach V2 of=
 patch in the next email.</div><div><br></div><div>Best regards</div><div>Z=
himing Liu</div></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=
=3D"gmail_attr">Robert Foss &lt;<a href=3D"mailto:robert.foss@linaro.org">r=
obert.foss@linaro.org</a>&gt; =E4=BA=8E2022=E5=B9=B41=E6=9C=8813=E6=97=A5=
=E5=91=A8=E5=9B=9B 18:14=E5=86=99=E9=81=93=EF=BC=9A<br></div><blockquote cl=
ass=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid=
 rgb(204,204,204);padding-left:1ex">Hello,<br>
<br>
Thanks for submitting this cleanup patch.<br>
<br>
On Tue, 11 Jan 2022 at 04:41, lzmlzm &lt;<a href=3D"mailto:lzmlzmhh@gmail.c=
om" target=3D"_blank">lzmlzmhh@gmail.com</a>&gt; wrote:<br>
&gt;<br>
<br>
A commit message is necessary for all changes, no matter how trivial.<br>
<br>
&gt; Signed-off-by: lzmlzm &lt;<a href=3D"mailto:lzmlzmhh@gmail.com" target=
=3D"_blank">lzmlzmhh@gmail.com</a>&gt;<br>
<br>
Is your name listed correctly above? For the &#39;Signed-off-by&#39; tag to=
 be<br>
meaningful, a real name needs to be supplied.<br>
<br>
&gt; ---<br>
&gt;=C2=A0 drivers/gpu/drm/bridge/lontium-lt9611.c=C2=A0 =C2=A0 | 2 +-<br>
&gt;=C2=A0 drivers/gpu/drm/bridge/lontium-lt9611uxc.c | 2 +-<br>
&gt;=C2=A0 2 files changed, 2 insertions(+), 2 deletions(-)<br>
&gt;<br>
&gt; diff --git a/drivers/gpu/drm/bridge/lontium-lt9611.c b/drivers/gpu/drm=
/bridge/lontium-lt9611.c<br>
&gt; index dafb1b47c15f..e0feb4fd9780 100644<br>
&gt; --- a/drivers/gpu/drm/bridge/lontium-lt9611.c<br>
&gt; +++ b/drivers/gpu/drm/bridge/lontium-lt9611.c<br>
&gt; @@ -1090,7 +1090,7 @@ static int lt9611_probe(struct i2c_client *clien=
t,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (!lt9611)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return -E=
NOMEM;<br>
&gt;<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0lt9611-&gt;dev =3D &amp;client-&gt;dev;<br=
>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0lt9611-&gt;dev =3D dev;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0lt9611-&gt;client =3D client;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0lt9611-&gt;sleep =3D false;<br>
&gt;<br>
&gt; diff --git a/drivers/gpu/drm/bridge/lontium-lt9611uxc.c b/drivers/gpu/=
drm/bridge/lontium-lt9611uxc.c<br>
&gt; index 33f9716da0ee..e50e42312e82 100644<br>
&gt; --- a/drivers/gpu/drm/bridge/lontium-lt9611uxc.c<br>
&gt; +++ b/drivers/gpu/drm/bridge/lontium-lt9611uxc.c<br>
&gt; @@ -860,7 +860,7 @@ static int lt9611uxc_probe(struct i2c_client *clie=
nt,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (!lt9611uxc)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return -E=
NOMEM;<br>
&gt;<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0lt9611uxc-&gt;dev =3D &amp;client-&gt;dev;=
<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0lt9611uxc-&gt;dev =3D dev;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0lt9611uxc-&gt;client =3D client;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0mutex_init(&amp;lt9611uxc-&gt;ocm_loc=
k);<br>
&gt;<br>
&gt; --<br>
<br>
With these two issues fixed, please submit a v2 of this patch.<br>
<br>
<br>
Rob.<br>
</blockquote></div>

--000000000000a5201405d574e406--
