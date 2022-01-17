Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 17EE1491198
	for <lists+dri-devel@lfdr.de>; Mon, 17 Jan 2022 23:08:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 48BDA10FF98;
	Mon, 17 Jan 2022 22:07:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x530.google.com (mail-ed1-x530.google.com
 [IPv6:2a00:1450:4864:20::530])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5A9F810E49F
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Jan 2022 15:44:44 +0000 (UTC)
Received: by mail-ed1-x530.google.com with SMTP id k15so67213893edk.13
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Jan 2022 07:44:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Fjii+N01pGz2rIZoAfvQ3iKvZKfNUAYpVKCZcDyc4UI=;
 b=cK96ZDcnYJ4y9Lnpc0Ziq+CCDpJbhsMFKF2EFyZawYzpPUNNejtUHcKwxnsN9DUyL9
 YGUBl9S8hC4ZZxaROiR6uCQUNHCpK9mp+Smp3HTz36KYdrDgZ8XjHdyZGqqn63SSRETU
 6+bRsSFL71Pz0q8cqTc3TTigQuv020GRvvwCdn/k1aWG+R4HvXstbLhVGlDijZQp9rif
 1LGgyUUaWSyHOmnMPl5e26IwgqpVYYIAcJzj0t/Qea5lCWuWWRcXKyk/JnDa/crzsm6+
 P8bKMYy4GT2jkLzhS9dVqFI3ffHssKvLbUd+SeE1H11kkKUI9b4fYJLBUa8QjKdbtK9e
 xTQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Fjii+N01pGz2rIZoAfvQ3iKvZKfNUAYpVKCZcDyc4UI=;
 b=Sstcu3j8fIOgNnspHA9Uh6tQyzq4hpxZNmzvs1UC2CaxL/NQk7jRXIwEFWAsWPv3AW
 RIMmJhO4OQLfvRJm4zJ4/shaZ+UX2r75uEf/6FKMTT1HlyMEhDusFcVwIBUjrLvTgxuH
 uaC5zQ5Lasf2T8eWubwxt5lcO9EeTfnaQZTfeCz/JRwl8Q+jjU5yiwaw3vze4271R+Nz
 3NOzDx72s/YL9g2zizEUlYsHT2KB5fY5YJ5nc8+KCu3ZDUFlQFNW3YbpQ5r3Htnz2qRj
 CwuTbERO6k6l07VjK91csqYEGvZOUOjfl3F/mzyPP8YgKrVkYw1aubOYCtWw11oMp+e3
 Sv8g==
X-Gm-Message-State: AOAM531DPbDXaRq8MESNa+vQquSJZjD5Py3WN88oolMdxVcM3slK2WE7
 1ACARvc4hAmPnnRGTDSuJWIKfijOsw8H/0TMoFI=
X-Google-Smtp-Source: ABdhPJw9IIckY1QSwaJMHuFQNP/SWGAD3ZYOovgxjxIaJpMapF31mj6ozUnolM1oU7U5UzNSe/gfmif505bmzt0nDRI=
X-Received: by 2002:a17:906:8053:: with SMTP id
 x19mr12059752ejw.485.1642434282824; 
 Mon, 17 Jan 2022 07:44:42 -0800 (PST)
MIME-Version: 1.0
References: <20220113125201.22544-1-lzmlzmhh@gmail.com>
 <CAG3jFyuZK8BLLicm8BLCGgdZaZ4O6x1W0VY4mn4JvJLDGDxpgw@mail.gmail.com>
In-Reply-To: <CAG3jFyuZK8BLLicm8BLCGgdZaZ4O6x1W0VY4mn4JvJLDGDxpgw@mail.gmail.com>
From: Zhiming Liu <lzmlzmhh@gmail.com>
Date: Mon, 17 Jan 2022 23:44:31 +0800
Message-ID: <CAGH8jLcYntQQ-jzPnCFKbsVBamcuPLkNTPpA2KU0MOXV8a2_ow@mail.gmail.com>
Subject: Re: [PATCH v2] Remove extra device acquisition method of i2c client
 in lt9611 driver
To: Robert Foss <robert.foss@linaro.org>
Content-Type: multipart/alternative; boundary="000000000000fec46305d5c90794"
X-Mailman-Approved-At: Mon, 17 Jan 2022 22:07:45 +0000
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
Cc: jernej.skrabec@gmail.com, jonas@kwiboo.se, narmstrong@baylibre.com,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 laurent.pinchart@ideasonboard.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--000000000000fec46305d5c90794
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Robert,

Sure, i have sent the v3 of this patch.
So thankful for your guidance!

Best Regards
Zhiming

Robert Foss <robert.foss@linaro.org> =E4=BA=8E2022=E5=B9=B41=E6=9C=8817=E6=
=97=A5=E5=91=A8=E4=B8=80 23:23=E5=86=99=E9=81=93=EF=BC=9A

> Hey Zhiming,
>
> Again, I think the code is good, but let's fix some small stuff with
> the patch submission and then I'll happily apply this.
>
> On Thu, 13 Jan 2022 at 13:52, Zhiming Liu <lzmlzmhh@gmail.com> wrote:
> >
> > Signed-off-by: Zhiming Liu <lzmlzmhh@gmail.com>
>
> The tags like Signed-off-by come after the body of the commit message.
>
> >
> > bridge : drm : Remove extra device acquisition method of i2c client in
> lt9611 driver.
>
> This line has to come first, since it is the title of the commit message.
>
> >
> > We have get the device of i2c client in probe function.So we should
> > remove extra device acquisition method of i2c client.
>
> ^^^ this is the body of the commit message.
>
> Put the tags like Signed-off-by here.
>
> > ---
> >  drivers/gpu/drm/bridge/lontium-lt9611.c    | 4 ++--
> >  drivers/gpu/drm/bridge/lontium-lt9611uxc.c | 4 ++--
> >  2 files changed, 4 insertions(+), 4 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/bridge/lontium-lt9611.c
> b/drivers/gpu/drm/bridge/lontium-lt9611.c
> > index dafb1b47c15f..feb128a4557d 100644
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
> > @@ -1100,7 +1100,7 @@ static int lt9611_probe(struct i2c_client *client=
,
> >                 return PTR_ERR(lt9611->regmap);
> >         }
> >
> > -       ret =3D lt9611_parse_dt(&client->dev, lt9611);
> > +       ret =3D lt9611_parse_dt(dev, lt9611);
> >         if (ret) {
> >                 dev_err(dev, "failed to parse device tree\n");
> >                 return ret;
> > diff --git a/drivers/gpu/drm/bridge/lontium-lt9611uxc.c
> b/drivers/gpu/drm/bridge/lontium-lt9611uxc.c
> > index 33f9716da0ee..3d62e6bf6892 100644
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
> > @@ -870,7 +870,7 @@ static int lt9611uxc_probe(struct i2c_client *clien=
t,
> >                 return PTR_ERR(lt9611uxc->regmap);
> >         }
> >
> > -       ret =3D lt9611uxc_parse_dt(&client->dev, lt9611uxc);
> > +       ret =3D lt9611uxc_parse_dt(dev, lt9611uxc);
> >         if (ret) {
> >                 dev_err(dev, "failed to parse device tree\n");
> >                 return ret;
> > --
> > 2.25.1
> >
>

--000000000000fec46305d5c90794
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi Robert,<div><br><div>Sure, i have sent the v3 of this p=
atch.</div><div>So thankful for your guidance!</div><div><br></div><div>Bes=
t Regards</div><div>Zhiming</div></div></div><br><div class=3D"gmail_quote"=
><div dir=3D"ltr" class=3D"gmail_attr">Robert Foss &lt;<a href=3D"mailto:ro=
bert.foss@linaro.org">robert.foss@linaro.org</a>&gt; =E4=BA=8E2022=E5=B9=B4=
1=E6=9C=8817=E6=97=A5=E5=91=A8=E4=B8=80 23:23=E5=86=99=E9=81=93=EF=BC=9A<br=
></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;=
border-left:1px solid rgb(204,204,204);padding-left:1ex">Hey Zhiming,<br>
<br>
Again, I think the code is good, but let&#39;s fix some small stuff with<br=
>
the patch submission and then I&#39;ll happily apply this.<br>
<br>
On Thu, 13 Jan 2022 at 13:52, Zhiming Liu &lt;<a href=3D"mailto:lzmlzmhh@gm=
ail.com" target=3D"_blank">lzmlzmhh@gmail.com</a>&gt; wrote:<br>
&gt;<br>
&gt; Signed-off-by: Zhiming Liu &lt;<a href=3D"mailto:lzmlzmhh@gmail.com" t=
arget=3D"_blank">lzmlzmhh@gmail.com</a>&gt;<br>
<br>
The tags like Signed-off-by come after the body of the commit message.<br>
<br>
&gt;<br>
&gt; bridge : drm : Remove extra device acquisition method of i2c client in=
 lt9611 driver.<br>
<br>
This line has to come first, since it is the title of the commit message.<b=
r>
<br>
&gt;<br>
&gt; We have get the device of i2c client in probe function.So we should<br=
>
&gt; remove extra device acquisition method of i2c client.<br>
<br>
^^^ this is the body of the commit message.<br>
<br>
Put the tags like Signed-off-by here.<br>
<br>
&gt; ---<br>
&gt;=C2=A0 drivers/gpu/drm/bridge/lontium-lt9611.c=C2=A0 =C2=A0 | 4 ++--<br=
>
&gt;=C2=A0 drivers/gpu/drm/bridge/lontium-lt9611uxc.c | 4 ++--<br>
&gt;=C2=A0 2 files changed, 4 insertions(+), 4 deletions(-)<br>
&gt;<br>
&gt; diff --git a/drivers/gpu/drm/bridge/lontium-lt9611.c b/drivers/gpu/drm=
/bridge/lontium-lt9611.c<br>
&gt; index dafb1b47c15f..feb128a4557d 100644<br>
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
&gt; @@ -1100,7 +1100,7 @@ static int lt9611_probe(struct i2c_client *clien=
t,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return PT=
R_ERR(lt9611-&gt;regmap);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt;<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0ret =3D lt9611_parse_dt(&amp;client-&gt;de=
v, lt9611);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0ret =3D lt9611_parse_dt(dev, lt9611);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (ret) {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0dev_err(d=
ev, &quot;failed to parse device tree\n&quot;);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return re=
t;<br>
&gt; diff --git a/drivers/gpu/drm/bridge/lontium-lt9611uxc.c b/drivers/gpu/=
drm/bridge/lontium-lt9611uxc.c<br>
&gt; index 33f9716da0ee..3d62e6bf6892 100644<br>
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
&gt; @@ -870,7 +870,7 @@ static int lt9611uxc_probe(struct i2c_client *clie=
nt,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return PT=
R_ERR(lt9611uxc-&gt;regmap);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt;<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0ret =3D lt9611uxc_parse_dt(&amp;client-&gt=
;dev, lt9611uxc);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0ret =3D lt9611uxc_parse_dt(dev, lt9611uxc)=
;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (ret) {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0dev_err(d=
ev, &quot;failed to parse device tree\n&quot;);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return re=
t;<br>
&gt; --<br>
&gt; 2.25.1<br>
&gt;<br>
</blockquote></div>

--000000000000fec46305d5c90794--
