Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B6ED1AB95A7
	for <lists+dri-devel@lfdr.de>; Fri, 16 May 2025 07:50:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8044810E104;
	Fri, 16 May 2025 05:50:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="dp/bTmqk";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com
 [209.85.216.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 82AAE10E054;
 Fri, 16 May 2025 01:23:44 +0000 (UTC)
Received: by mail-pj1-f42.google.com with SMTP id
 98e67ed59e1d1-30c1c4a8224so1320051a91.0; 
 Thu, 15 May 2025 18:23:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1747358624; x=1747963424; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=RABf2HYAiUJcvyUGs60HaCG9k0Cil314tRcPOU+eWQM=;
 b=dp/bTmqkJ29x9rmpXcKE020uTC6xqac9WlOAMuRfyHXjsUzc7gvbj7Oipzu45IN+mm
 vyUxkqbH6vLN2Nnxtd3QUIf4tG1wWJ4fIPo6a7A8EsKeIWyjXE+RJzPDXKsg4F2gEYYH
 silVHoon2sVnkT4P8MijlCRiD9MSouU42CckQvq5Xnk9BGCpB3uDnePpd0zP1OQ7ySrs
 J8yE1kx624+A1wTqE3tHoyS/multl2WKkJqWBxE3DkZ4Oet9HGYA3I08MdtOGslXnbi/
 ApzkWgwWE0bUYoJL9/Fa5bSDiV9SipBaH4eALLpgOKOHcJ0TvrLd/ry9vSYq2APJDnlh
 ALsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1747358624; x=1747963424;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=RABf2HYAiUJcvyUGs60HaCG9k0Cil314tRcPOU+eWQM=;
 b=TSYjJ79jSMsN8hEt6hjAERm235LvxjAV/l2jxyt5/jGrUV/KYXRjavdP6TTlMLxPfF
 HE5OMluWz5yxqijlfmhnQHdVvgJ9Y0ufvlQUKFsSDJc8kNKz4fywbIHneSbVhI5UJTjP
 ssQYOCZ8Uu+oFgEKHxUrnHKdy1Ck9UxINYsyaes0+3tMZ/dq4R5zfDcX0JPjYt+taXSb
 8zBdLUsq7ru//lxknvODoK4wQ972vsBRWmVGWjdVkvCKM4m8WMkk7MV+ZoMVjeUUWCdk
 s422fQkeyfKq3ek/f6DoxfLBIFn+20Fxx3MVbCMas7+w2hzxFYw5P2djVUB1nyw0Fn7p
 w77A==
X-Forwarded-Encrypted: i=1;
 AJvYcCU29Y9v0LjD0IObfRsI37zBI5JEyepBfemiw9Gu14jwUjxRqc2adgrhXOaQOfqWRQCFvrVrC7D6Bw4J@lists.freedesktop.org,
 AJvYcCWIM0UQh+2gAvLXk2UDN34HrHOVYJcmUTuSoonNye2HWGzA9GfRmiplECrcKeTgiAXL4TXxCGlU@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxoziTMyQoajKWDh79lzK0dfN8AY0nXItuepwHZjPfHrtB3jTQk
 2Ma6ev6AeYkIX3gAMKxfqWEgK72glrZ1oYP67D28iseJ3eN57/Sz2twmxUUp7vugITswutYOd0k
 tP7OzErMbKKrySJgCojcWzBEXZ+ydJ/8=
X-Gm-Gg: ASbGncs680L19jCQVif6WcE8y3g7HQ2lRF+QU9aaQnNLVBSUv5JJSWcmzcq9rOS7Ihn
 gbvS03VGj6JjRsnYnX5bV4cjuoMSRaowEb8oaCU+4EToAFZyViwXeZhlsKY+MCSPn4ffPzHiqeC
 8WPcvwTqUnr7rGIjsKxcO0Rum5iv8Y1NG7hPQNYspbfW3Go8+uQNCBpPBN9wa3jspVlQ==
X-Google-Smtp-Source: AGHT+IGR7paf7BjQb3wScAbnTJMOdm+L+6Jo/HoYF9TI8h8o0r13tGzqxRFJcB3lzVQc9bB5YzvN/9pQZ89xbX/dXpw=
X-Received: by 2002:a17:90b:2d47:b0:2f8:b2c:5ef3 with SMTP id
 98e67ed59e1d1-30e7d520bfemr1889874a91.14.1747358623962; Thu, 15 May 2025
 18:23:43 -0700 (PDT)
MIME-Version: 1.0
References: <20250514174306.82693-1-leonardodasigomes@gmail.com>
 <CADnq5_OEdpRvpfL9+aCQOfRGUW-vOGzXq3ts5buWXoOTxtHr6Q@mail.gmail.com>
In-Reply-To: <CADnq5_OEdpRvpfL9+aCQOfRGUW-vOGzXq3ts5buWXoOTxtHr6Q@mail.gmail.com>
From: Leonardo Gomes <leonardodasigomes@gmail.com>
Date: Thu, 15 May 2025 22:23:32 -0300
X-Gm-Features: AX0GCFs4w4xq-tFk-r_bnv1c--x5-ws9BGrSOte2ZKGV9q3Ghg8usGcJqzEzYqs
Message-ID: <CABtyycTNz7dmir5Ydc=VDiTUsLy0tryBgGmtWCJQZSauuaSJwg@mail.gmail.com>
Subject: Re: [PATCH 1/2 RESEND] drm/amd/display: Adjust get_value function
 with prefix to help in ftrace
To: Alex Deucher <alexdeucher@gmail.com>
Cc: harry.wentland@amd.com, sunpeng.li@amd.com, alexander.deucher@amd.com, 
 christian.koenig@amd.com, airlied@gmail.com, simona@ffwll.ch, 
 derick.william.moraes@gmail.com, amd-gfx@lists.freedesktop.org, 
 dri-devel@lists.freedesktop.org
Content-Type: multipart/alternative; boundary="000000000000139f09063536a28d"
X-Mailman-Approved-At: Fri, 16 May 2025 05:50:09 +0000
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

--000000000000139f09063536a28d
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Thanks for your reply Alex,

I just realize with your comment that
*drivers/gpu/drm/amd/display/dc/gpio/hw_gpio.c* import *dal_hw_gpio_get_val=
ue
*and *dal_hw_gpio_set_value*.
So to make those functions inside
*drivers/gpu/drm/amd/display/dc/gpio/hw_hpd.c*  more clear what do you
think to change them to *dal_hw_hpd_get_config* and *dal_hw_hpd_set_config*=
,
making clear that this is a function from the file hw_hpd?

Leonardo Gomes

Em qua., 14 de mai. de 2025 =C3=A0s 18:08, Alex Deucher <alexdeucher@gmail.=
com>
escreveu:

> On Wed, May 14, 2025 at 4:48=E2=80=AFPM Leonardo Gomes
> <leonardodasigomes@gmail.com> wrote:
> >
> > Adjust get_value function in hw_hpd.c file to have
> > prefix to help in ftrace, the name change from
> > 'get_value' to 'dal_hw_gpio_get_value'
>
> This won't compile.  dal_hw_gpio_get_value is already defined in
> drivers/gpu/drm/amd/display/dc/gpio/hw_gpio.c.
>
> Alex
>
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
> > index 3f13a744d07d..b11ed1089589 100644
> > --- a/drivers/gpu/drm/amd/display/dc/gpio/hw_hpd.c
> > +++ b/drivers/gpu/drm/amd/display/dc/gpio/hw_hpd.c
> > @@ -62,7 +62,7 @@ static void dal_hw_hpd_destroy(
> >         *ptr =3D NULL;
> >  }
> >
> > -static enum gpio_result get_value(
> > +static enum gpio_result dal_hw_gpio_get_value(
> >         const struct hw_gpio_pin *ptr,
> >         uint32_t *value)
> >  {
> > @@ -104,7 +104,7 @@ static enum gpio_result set_config(
> >  static const struct hw_gpio_pin_funcs funcs =3D {
> >         .destroy =3D dal_hw_hpd_destroy,
> >         .open =3D dal_hw_gpio_open,
> > -       .get_value =3D get_value,
> > +       .get_value =3D dal_hw_gpio_get_value,
> >         .set_value =3D dal_hw_gpio_set_value,
> >         .set_config =3D set_config,
> >         .change_mode =3D dal_hw_gpio_change_mode,
> > --
> > 2.43.0
> >
>

--000000000000139f09063536a28d
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Thanks for your reply Alex,<div><br></div><div>I just real=
ize with your comment that=C2=A0<i>drivers/gpu/drm/amd/display/dc/gpio/hw_g=
pio.c</i> import <i>dal_hw_gpio_get_value </i>and <i>dal_hw_gpio_set_value<=
/i>.</div><div>So to make those functions inside <i>drivers/gpu/drm/amd/dis=
play/dc/gpio/hw_hpd.c</i>=C2=A0 more clear what do you think to change them=
 to=C2=A0<i>dal_hw_<b>hpd</b>_get_config</i> and <i>dal_hw_<b>hpd</b>_set_c=
onfig</i>, making clear that this is a function from the file hw_hpd?</div>=
<div><br></div><div>Leonardo Gomes</div></div><br><div class=3D"gmail_quote=
 gmail_quote_container"><div dir=3D"ltr" class=3D"gmail_attr">Em qua., 14 d=
e mai. de 2025 =C3=A0s 18:08, Alex Deucher &lt;<a href=3D"mailto:alexdeuche=
r@gmail.com">alexdeucher@gmail.com</a>&gt; escreveu:<br></div><blockquote c=
lass=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px soli=
d rgb(204,204,204);padding-left:1ex">On Wed, May 14, 2025 at 4:48=E2=80=AFP=
M Leonardo Gomes<br>
&lt;<a href=3D"mailto:leonardodasigomes@gmail.com" target=3D"_blank">leonar=
dodasigomes@gmail.com</a>&gt; wrote:<br>
&gt;<br>
&gt; Adjust get_value function in hw_hpd.c file to have<br>
&gt; prefix to help in ftrace, the name change from<br>
&gt; &#39;get_value&#39; to &#39;dal_hw_gpio_get_value&#39;<br>
<br>
This won&#39;t compile.=C2=A0 dal_hw_gpio_get_value is already defined in<b=
r>
drivers/gpu/drm/amd/display/dc/gpio/hw_gpio.c.<br>
<br>
Alex<br>
<br>
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
&gt; index 3f13a744d07d..b11ed1089589 100644<br>
&gt; --- a/drivers/gpu/drm/amd/display/dc/gpio/hw_hpd.c<br>
&gt; +++ b/drivers/gpu/drm/amd/display/dc/gpio/hw_hpd.c<br>
&gt; @@ -62,7 +62,7 @@ static void dal_hw_hpd_destroy(<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0*ptr =3D NULL;<br>
&gt;=C2=A0 }<br>
&gt;<br>
&gt; -static enum gpio_result get_value(<br>
&gt; +static enum gpio_result dal_hw_gpio_get_value(<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0const struct hw_gpio_pin *ptr,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0uint32_t *value)<br>
&gt;=C2=A0 {<br>
&gt; @@ -104,7 +104,7 @@ static enum gpio_result set_config(<br>
&gt;=C2=A0 static const struct hw_gpio_pin_funcs funcs =3D {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0.destroy =3D dal_hw_hpd_destroy,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0.open =3D dal_hw_gpio_open,<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0.get_value =3D get_value,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0.get_value =3D dal_hw_gpio_get_value,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0.set_value =3D dal_hw_gpio_set_value,=
<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0.set_config =3D set_config,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0.change_mode =3D dal_hw_gpio_change_m=
ode,<br>
&gt; --<br>
&gt; 2.43.0<br>
&gt;<br>
</blockquote></div>

--000000000000139f09063536a28d--
