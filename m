Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A25E48E66A
	for <lists+dri-devel@lfdr.de>; Fri, 14 Jan 2022 09:27:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2913710EA15;
	Fri, 14 Jan 2022 08:27:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x531.google.com (mail-ed1-x531.google.com
 [IPv6:2a00:1450:4864:20::531])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E6C5410E645
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Jan 2022 11:22:55 +0000 (UTC)
Received: by mail-ed1-x531.google.com with SMTP id b13so22026050edn.0
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Jan 2022 03:22:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=j+f1tp8JKjBzyOeXfa1e8UsnS4W6l10jdKKjjMsDrA0=;
 b=XczFUj0yeI9ZwEG7NYMF75FkxMXgsOjuYniCJ146AqDaVXgGWX7OxkyuT/cJ+RKby6
 7PzLGtJP2GMYxn/8zJO/+HzJMkACZqP3DLNZ4Z46Hixv6DpwBmx6sIRdNL9ZBqJTTN8e
 1kzG9UpMjqIbI4b3nfXYglRUj3OzBL84rtJotwrc4ZZRd17Q0fk2V2k4UHYfTuzv+Vn6
 D1f1kZ8td3pRnJX3xN1cIfYB/tmmGZ1j5NuRgrAZyvLyqavT5lajesoMXJYxDa5jkSDV
 M+kKJNbWFXplhfIU7buozwzSZniOGIF7c8QZGb4TCf0eLLba4AYRk3uvpIAI6JxJHSAa
 Guwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=j+f1tp8JKjBzyOeXfa1e8UsnS4W6l10jdKKjjMsDrA0=;
 b=q8L0jHEUa7sgC5x/R4ReJPYoQ0wurQ47G+wVuZ/2XeJyyF5kB79DPAxaOUhAxUQvjQ
 mYOS88vWzP1BdWEN7ADU5LrvmOhts3Vl6WuuRd0kXY1x4+z1yU2nB1mjWftM9F+mrCQB
 QmUupvdgAAuSh8QMtf1JG6o9W5U39fYYU3HU5k5Kr+J9PKJMgKgPVVADciA87L4GWve4
 QydV6mlHpLfr3TaIzfwIgpC2lLmu+4bVGvrx5Smc9FzC2sV0QLrENWJd0H0oCaNAz5bM
 uOYqUspIERc/dkK2IoggyJoBganiofH4OuFxPWv1HtYL53EUYZZpj3zHIl9UKzW5f1SR
 9RxQ==
X-Gm-Message-State: AOAM532cezS6o4bWWtSq1z17GXiWxJTmi6RdBW1ixdm/o1Kbwra9pefw
 C3Lpmy7ZoIcdaif+cCUbaSEVj6wc9QWKFyXbF0Q=
X-Google-Smtp-Source: ABdhPJy5QykYbqx1wSFtfh1K0MjjAMx5zRseE6RPS3HQa7EbF3uRjYkC5x4hgmsOAwUS8a5HlpXmF5jZ6vaijFy07yw=
X-Received: by 2002:a17:906:8695:: with SMTP id
 g21mr3085083ejx.654.1642072974475; 
 Thu, 13 Jan 2022 03:22:54 -0800 (PST)
MIME-Version: 1.0
References: <20220111034051.28913-1-lzmlzmhh@gmail.com>
 <CAG3jFyuZQko8gj6NXnHQ2GoFNfHSYDwkgmb3Wi+upDZFZpPM4Q@mail.gmail.com>
In-Reply-To: <CAG3jFyuZQko8gj6NXnHQ2GoFNfHSYDwkgmb3Wi+upDZFZpPM4Q@mail.gmail.com>
From: Zhiming Liu <lzmlzmhh@gmail.com>
Date: Thu, 13 Jan 2022 19:22:43 +0800
Message-ID: <CAGH8jLcP8T8Yr4-X2QbTRRQtO7WnoLiNi925XNgbhDucq=1mDA@mail.gmail.com>
Subject: Re: [PATCH] Remove extra device acquisition method of i2c client in
 lt9611 driver
To: Robert Foss <robert.foss@linaro.org>
Content-Type: multipart/alternative; boundary="00000000000056c42c05d574e8f8"
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

--00000000000056c42c05d574e8f8
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

From 10b677e995ab1f32df79896dbdb7cda779d3f798 Mon Sep 17 00:00:00 2001
From: Zhiming Liu <lzmlzmhh@gmail.com>
Date: Thu, 13 Jan 2022 19:09:37 +0800
Subject: [PATCH v2] Signed-off-by: Zhiming Liu <lzmlzmhh@gmail.com>

bridge : drm : Remove extra device acquisition method of i2c client in
lt9611 driver.

We have get the device of i2c client in probe function.So we should
remove extra device acquisition method of i2c client in lt9611 driver.
---
 drivers/gpu/drm/bridge/lontium-lt9611.c    | 4 ++--
 drivers/gpu/drm/bridge/lontium-lt9611uxc.c | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/bridge/lontium-lt9611.c
b/drivers/gpu/drm/bridge/lontium-lt9611.c
index dafb1b47c15f..feb128a4557d 100644
--- a/drivers/gpu/drm/bridge/lontium-lt9611.c
+++ b/drivers/gpu/drm/bridge/lontium-lt9611.c
@@ -1090,7 +1090,7 @@ static int lt9611_probe(struct i2c_client *client,
  if (!lt9611)
  return -ENOMEM;

- lt9611->dev =3D &client->dev;
+ lt9611->dev =3D dev;
  lt9611->client =3D client;
  lt9611->sleep =3D false;

@@ -1100,7 +1100,7 @@ static int lt9611_probe(struct i2c_client *client,
  return PTR_ERR(lt9611->regmap);
  }

- ret =3D lt9611_parse_dt(&client->dev, lt9611);
+ ret =3D lt9611_parse_dt(dev, lt9611);
  if (ret) {
  dev_err(dev, "failed to parse device tree\n");
  return ret;
diff --git a/drivers/gpu/drm/bridge/lontium-lt9611uxc.c
b/drivers/gpu/drm/bridge/lontium-lt9611uxc.c
index 33f9716da0ee..3d62e6bf6892 100644
--- a/drivers/gpu/drm/bridge/lontium-lt9611uxc.c
+++ b/drivers/gpu/drm/bridge/lontium-lt9611uxc.c
@@ -860,7 +860,7 @@ static int lt9611uxc_probe(struct i2c_client *client,
  if (!lt9611uxc)
  return -ENOMEM;

- lt9611uxc->dev =3D &client->dev;
+ lt9611uxc->dev =3D dev;
  lt9611uxc->client =3D client;
  mutex_init(&lt9611uxc->ocm_lock);

@@ -870,7 +870,7 @@ static int lt9611uxc_probe(struct i2c_client *client,
  return PTR_ERR(lt9611uxc->regmap);
  }

- ret =3D lt9611uxc_parse_dt(&client->dev, lt9611uxc);
+ ret =3D lt9611uxc_parse_dt(dev, lt9611uxc);
  if (ret) {
  dev_err(dev, "failed to parse device tree\n");
  return ret;
--=20
2.25.1

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

--00000000000056c42c05d574e8f8
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">From 10b677e995ab1f32df79896dbdb7cda779d3f798 Mon Sep 17 0=
0:00:00 2001<br>From: Zhiming Liu &lt;<a href=3D"mailto:lzmlzmhh@gmail.com"=
>lzmlzmhh@gmail.com</a>&gt;<br>Date: Thu, 13 Jan 2022 19:09:37 +0800<br>Sub=
ject: [PATCH v2] Signed-off-by: Zhiming Liu &lt;<a href=3D"mailto:lzmlzmhh@=
gmail.com">lzmlzmhh@gmail.com</a>&gt;<br><br>bridge : drm : Remove extra de=
vice acquisition method of i2c client in lt9611 driver.<br><br>We have get =
the device of i2c client in probe function.So we should<br>remove extra dev=
ice acquisition method of i2c client in lt9611 driver.<br>---<br>=C2=A0driv=
ers/gpu/drm/bridge/lontium-lt9611.c =C2=A0 =C2=A0| 4 ++--<br>=C2=A0drivers/=
gpu/drm/bridge/lontium-lt9611uxc.c | 4 ++--<br>=C2=A02 files changed, 4 ins=
ertions(+), 4 deletions(-)<br><br>diff --git a/drivers/gpu/drm/bridge/lonti=
um-lt9611.c b/drivers/gpu/drm/bridge/lontium-lt9611.c<br>index dafb1b47c15f=
..feb128a4557d 100644<br>--- a/drivers/gpu/drm/bridge/lontium-lt9611.c<br>+=
++ b/drivers/gpu/drm/bridge/lontium-lt9611.c<br>@@ -1090,7 +1090,7 @@ stati=
c int lt9611_probe(struct i2c_client *client,<br>=C2=A0	if (!lt9611)<br>=C2=
=A0		return -ENOMEM;<br>=C2=A0<br>-	lt9611-&gt;dev =3D &amp;client-&gt;dev;=
<br>+	lt9611-&gt;dev =3D dev;<br>=C2=A0	lt9611-&gt;client =3D client;<br>=
=C2=A0	lt9611-&gt;sleep =3D false;<br>=C2=A0<br>@@ -1100,7 +1100,7 @@ stati=
c int lt9611_probe(struct i2c_client *client,<br>=C2=A0		return PTR_ERR(lt9=
611-&gt;regmap);<br>=C2=A0	}<br>=C2=A0<br>-	ret =3D lt9611_parse_dt(&amp;cl=
ient-&gt;dev, lt9611);<br>+	ret =3D lt9611_parse_dt(dev, lt9611);<br>=C2=A0=
	if (ret) {<br>=C2=A0		dev_err(dev, &quot;failed to parse device tree\n&quo=
t;);<br>=C2=A0		return ret;<br>diff --git a/drivers/gpu/drm/bridge/lontium-=
lt9611uxc.c b/drivers/gpu/drm/bridge/lontium-lt9611uxc.c<br>index 33f9716da=
0ee..3d62e6bf6892 100644<br>--- a/drivers/gpu/drm/bridge/lontium-lt9611uxc.=
c<br>+++ b/drivers/gpu/drm/bridge/lontium-lt9611uxc.c<br>@@ -860,7 +860,7 @=
@ static int lt9611uxc_probe(struct i2c_client *client,<br>=C2=A0	if (!lt96=
11uxc)<br>=C2=A0		return -ENOMEM;<br>=C2=A0<br>-	lt9611uxc-&gt;dev =3D &amp=
;client-&gt;dev;<br>+	lt9611uxc-&gt;dev =3D dev;<br>=C2=A0	lt9611uxc-&gt;cl=
ient =3D client;<br>=C2=A0	mutex_init(&amp;lt9611uxc-&gt;ocm_lock);<br>=C2=
=A0<br>@@ -870,7 +870,7 @@ static int lt9611uxc_probe(struct i2c_client *cl=
ient,<br>=C2=A0		return PTR_ERR(lt9611uxc-&gt;regmap);<br>=C2=A0	}<br>=C2=
=A0<br>-	ret =3D lt9611uxc_parse_dt(&amp;client-&gt;dev, lt9611uxc);<br>+	r=
et =3D lt9611uxc_parse_dt(dev, lt9611uxc);<br>=C2=A0	if (ret) {<br>=C2=A0		=
dev_err(dev, &quot;failed to parse device tree\n&quot;);<br>=C2=A0		return =
ret;<br>-- <br>2.25.1<br></div><br><div class=3D"gmail_quote"><div dir=3D"l=
tr" class=3D"gmail_attr">Robert Foss &lt;<a href=3D"mailto:robert.foss@lina=
ro.org">robert.foss@linaro.org</a>&gt; =E4=BA=8E2022=E5=B9=B41=E6=9C=8813=
=E6=97=A5=E5=91=A8=E5=9B=9B 18:14=E5=86=99=E9=81=93=EF=BC=9A<br></div><bloc=
kquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:=
1px solid rgb(204,204,204);padding-left:1ex">Hello,<br>
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

--00000000000056c42c05d574e8f8--
