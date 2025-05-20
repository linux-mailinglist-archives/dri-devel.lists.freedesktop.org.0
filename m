Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8551FABCC0D
	for <lists+dri-devel@lfdr.de>; Tue, 20 May 2025 02:48:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D223C10E07F;
	Tue, 20 May 2025 00:48:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="CdCqovUJ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com
 [209.85.216.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CCC7310E07F;
 Tue, 20 May 2025 00:48:27 +0000 (UTC)
Received: by mail-pj1-f52.google.com with SMTP id
 98e67ed59e1d1-30820167b47so4105714a91.0; 
 Mon, 19 May 2025 17:48:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1747702107; x=1748306907; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=BM7yjvXAI0P441dlqMWby1lrrwweE0fYcAI9fj/Q+LY=;
 b=CdCqovUJ0hN9Ypt1aDZSyrI8q7i/OZDNLZfRhY6xYGRE7LTNDCwbw359mmQE4G1lUa
 MayL4v4tYDwHTIcjmyFcYCPO+dak3SQyX8DiTy92nI0Pq1DrbfWXU5INcdzJPrfZMjrJ
 fL2sqPE9f8zWy4HnZHXxNrZqbo46LDiEss6PYxeN8CNyIRjOWxPe+hbA8gf/bqXvQpSp
 HvcdngzxfyKUPlYI67cnXYWW6Ukkp8j8Ys9+GwMjWlJgo2H22StOI9EfArHX4hVukOix
 eDR0JCbhD+JwhB5cluccZcf6YLopQkr9i1iXd8OcundKwhILSmUyLucAI5pfmfoquA6O
 x2ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1747702107; x=1748306907;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=BM7yjvXAI0P441dlqMWby1lrrwweE0fYcAI9fj/Q+LY=;
 b=EoL2BKh/eAJGU1VZ/dVGj7uN0XWT/PV/sUm0K7w3PeHuUWJ1eE3smB+PqAKBPjtBni
 +ABigvJdAMeE0m15mIWjF1mbXKBNo+xTRnjZ1gSQ4ByejcEpoN3T0nIribTIBLy558Ty
 6zkFC0i+0HAPssVaRQ9wRS46WSKhId4RY/5BHkSX9ZCCoMKOdoaiDqBhdMmqt4+JNvaj
 pvj7687Paxp+WPHXTrMLb9ltDWS8G+8irXvwMUlBGIemFs1AXmzFJmCJQLc3+oBtRAXE
 9jj6U62+p+tXooqDmYCOaVZhtnpVvmYfFc1YIVqF6U7diyWu3zIkzhXpkAbKQyHer9P0
 LL/g==
X-Forwarded-Encrypted: i=1;
 AJvYcCUktvXo84MJAjlw5L7IAl6APuWH+zUu3LJ6axARw0sHe5xGV0mLz4tufUuIOFik9fJytQtMQHWs3XHW@lists.freedesktop.org,
 AJvYcCW9FCaE3b/dgmhKBS+mTbrgatiC7agPExgQBTYcsMm+IKh55WU08ULudypYmvxSwkOM0J/KLMr7@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yyn256nTBRNTJZdPNSIY88FEDBSpQ/nkBo1xYoBkGclQwRMCyfd
 yk/fJN+vz7ekUEAyWG/qaUFaFAdy/JImEosS2Z9+VKP6WyEG5IAWaX2Hwreelks53zD5zu+f5Sn
 mHaf7WnYQOfttTdE1KfhgNy3YsOn6/ZQ=
X-Gm-Gg: ASbGncsCeNPOL2PKSInPlRt/4ywNOjdFQph77ylF4StWmQGtnxFHUfH0OYCQ6eCEVBP
 JJxzWzDUz+sR/yR+Q6rTwKagNMHfgo86Sf4+9g+THYWwPHPAZuSkrh9l0LzKxVAvkYZ6J/mmArh
 MXZDo7bDJ4i6BZV79OXEsYIQXguWo+rESzhtx68jYRpSNbJ3upeOcYgZhremD7oHNT
X-Google-Smtp-Source: AGHT+IFXWmoqxN896HwUs+zVGkpXD5mve6/Aa2i+4MMv0dbuRCVhbgjjMvof4hEeV9ZuHkTtS2IHZaxz/hq6WpujpHA=
X-Received: by 2002:a17:90b:2ecf:b0:30e:8fe1:f787 with SMTP id
 98e67ed59e1d1-30e8fe1f8bfmr12796477a91.5.1747702106996; Mon, 19 May 2025
 17:48:26 -0700 (PDT)
MIME-Version: 1.0
References: <20250517142114.140016-1-leonardodasigomes@gmail.com>
 <20250517142114.140016-2-leonardodasigomes@gmail.com>
 <CADnq5_ORUTzZZSwOKjswFZaSepUSxkBSnmJXPZ7z=jP7CUL59A@mail.gmail.com>
In-Reply-To: <CADnq5_ORUTzZZSwOKjswFZaSepUSxkBSnmJXPZ7z=jP7CUL59A@mail.gmail.com>
From: Leonardo Gomes <leonardodasigomes@gmail.com>
Date: Mon, 19 May 2025 21:48:16 -0300
X-Gm-Features: AX0GCFvQpJsPc7_ONGb9dTiNlRWe-Gttwihds2Zvrs77BUkaNxbUq7Biw_B_sgY
Message-ID: <CABtyycTrz3XZLcR-nneEQcVY=wyS-02unzAnjOW-sU+z-HsgfA@mail.gmail.com>
Subject: Re: [PATCH 2/2 RESEND] drm/amd/display: Adjust set_value function
 with prefix to help in ftrace
To: Alex Deucher <alexdeucher@gmail.com>
Cc: harry.wentland@amd.com, sunpeng.li@amd.com, alexander.deucher@amd.com, 
 christian.koenig@amd.com, airlied@gmail.com, simona@ffwll.ch, 
 derick.william.moraes@gmail.com, amd-gfx@lists.freedesktop.org, 
 dri-devel@lists.freedesktop.org
Content-Type: multipart/alternative; boundary="00000000000042c4710635869b32"
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--00000000000042c4710635869b32
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Glad it worked!

Leonardo Gomes

On Mon, 19 May 2025 at 11:44 Alex Deucher <alexdeucher@gmail.com> wrote:

> Applied the series.  Thanks!
>
> Alex
>
> On Sat, May 17, 2025 at 10:28=E2=80=AFAM Leonardo Gomes
> <leonardodasigomes@gmail.com> wrote:
> >
> > Adjust set_value function in hw_hpd.c file to have
> > prefix to help in ftrace, the name change from
> > 'set_value' to 'dal_hw_hpd_set_value'
> >
> > Signed-off-by: Leonardo da Silva Gomes <leonardodasigomes@gmail.com>
> > Co-developed-by: Derick Frias <derick.william.moraes@gmail.com>
> > Signed-off-by: Derick Frias <derick.william.moraes@gmail.com>
> > ---
> >  drivers/gpu/drm/amd/display/dc/gpio/hw_hpd.c | 4 ++--
> >  1 file changed, 2 insertions(+), 2 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/amd/display/dc/gpio/hw_hpd.c
> b/drivers/gpu/drm/amd/display/dc/gpio/hw_hpd.c
> > index 886dd05b012f..01ec451004f7 100644
> > --- a/drivers/gpu/drm/amd/display/dc/gpio/hw_hpd.c
> > +++ b/drivers/gpu/drm/amd/display/dc/gpio/hw_hpd.c
> > @@ -85,7 +85,7 @@ static enum gpio_result dal_hw_hpd_get_value(
> >         return dal_hw_gpio_get_value(ptr, value);
> >  }
> >
> > -static enum gpio_result set_config(
> > +static enum gpio_result dal_hw_hpd_set_config(
> >         struct hw_gpio_pin *ptr,
> >         const struct gpio_config_data *config_data)
> >  {
> > @@ -106,7 +106,7 @@ static const struct hw_gpio_pin_funcs funcs =3D {
> >         .open =3D dal_hw_gpio_open,
> >         .get_value =3D dal_hw_hpd_get_value,
> >         .set_value =3D dal_hw_gpio_set_value,
> > -       .set_config =3D set_config,
> > +       .set_config =3D dal_hw_hpd_set_config,
> >         .change_mode =3D dal_hw_gpio_change_mode,
> >         .close =3D dal_hw_gpio_close,
> >  };
> > --
> > 2.43.0
> >
>

--00000000000042c4710635869b32
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div>Glad it worked!</div><div dir=3D"auto"><br></div><div dir=3D"auto">Leo=
nardo Gomes</div><div><br><div class=3D"gmail_quote gmail_quote_container">=
<div dir=3D"ltr" class=3D"gmail_attr">On Mon, 19 May 2025 at 11:44 Alex Deu=
cher &lt;<a href=3D"mailto:alexdeucher@gmail.com">alexdeucher@gmail.com</a>=
&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 =
0 .8ex;border-left:1px #ccc solid;padding-left:1ex">Applied the series.=C2=
=A0 Thanks!<br>
<br>
Alex<br>
<br>
On Sat, May 17, 2025 at 10:28=E2=80=AFAM Leonardo Gomes<br>
&lt;<a href=3D"mailto:leonardodasigomes@gmail.com" target=3D"_blank">leonar=
dodasigomes@gmail.com</a>&gt; wrote:<br>
&gt;<br>
&gt; Adjust set_value function in hw_hpd.c file to have<br>
&gt; prefix to help in ftrace, the name change from<br>
&gt; &#39;set_value&#39; to &#39;dal_hw_hpd_set_value&#39;<br>
&gt;<br>
&gt; Signed-off-by: Leonardo da Silva Gomes &lt;<a href=3D"mailto:leonardod=
asigomes@gmail.com" target=3D"_blank">leonardodasigomes@gmail.com</a>&gt;<b=
r>
&gt; Co-developed-by: Derick Frias &lt;<a href=3D"mailto:derick.william.mor=
aes@gmail.com" target=3D"_blank">derick.william.moraes@gmail.com</a>&gt;<br=
>
&gt; Signed-off-by: Derick Frias &lt;<a href=3D"mailto:derick.william.morae=
s@gmail.com" target=3D"_blank">derick.william.moraes@gmail.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 drivers/gpu/drm/amd/display/dc/gpio/hw_hpd.c | 4 ++--<br>
&gt;=C2=A0 1 file changed, 2 insertions(+), 2 deletions(-)<br>
&gt;<br>
&gt; diff --git a/drivers/gpu/drm/amd/display/dc/gpio/hw_hpd.c b/drivers/gp=
u/drm/amd/display/dc/gpio/hw_hpd.c<br>
&gt; index 886dd05b012f..01ec451004f7 100644<br>
&gt; --- a/drivers/gpu/drm/amd/display/dc/gpio/hw_hpd.c<br>
&gt; +++ b/drivers/gpu/drm/amd/display/dc/gpio/hw_hpd.c<br>
&gt; @@ -85,7 +85,7 @@ static enum gpio_result dal_hw_hpd_get_value(<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return dal_hw_gpio_get_value(ptr, val=
ue);<br>
&gt;=C2=A0 }<br>
&gt;<br>
&gt; -static enum gpio_result set_config(<br>
&gt; +static enum gpio_result dal_hw_hpd_set_config(<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0struct hw_gpio_pin *ptr,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0const struct gpio_config_data *config=
_data)<br>
&gt;=C2=A0 {<br>
&gt; @@ -106,7 +106,7 @@ static const struct hw_gpio_pin_funcs funcs =3D {<=
br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0.open =3D dal_hw_gpio_open,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0.get_value =3D dal_hw_hpd_get_value,<=
br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0.set_value =3D dal_hw_gpio_set_value,=
<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0.set_config =3D set_config,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0.set_config =3D dal_hw_hpd_set_config,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0.change_mode =3D dal_hw_gpio_change_m=
ode,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0.close =3D dal_hw_gpio_close,<br>
&gt;=C2=A0 };<br>
&gt; --<br>
&gt; 2.43.0<br>
&gt;<br>
</blockquote></div></div>

--00000000000042c4710635869b32--
