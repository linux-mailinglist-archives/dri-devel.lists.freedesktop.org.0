Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DFFCABAAAD
	for <lists+dri-devel@lfdr.de>; Sat, 17 May 2025 16:24:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D1AAB10E18F;
	Sat, 17 May 2025 14:24:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="EuDAOxH6";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com
 [209.85.214.174])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A0A4C10E05D;
 Sat, 17 May 2025 14:24:36 +0000 (UTC)
Received: by mail-pl1-f174.google.com with SMTP id
 d9443c01a7336-231bf5851b7so22358615ad.0; 
 Sat, 17 May 2025 07:24:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1747491876; x=1748096676; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=RyN54yu+4eZmPFXQlkm/F9Rt9k9KQTZs1dMWtDoUYX0=;
 b=EuDAOxH6aeszBrG21FT6X9vqbwDcq3iEaz6l9X0bfRZtck5z/ssMHv6S7j99Vt3+8c
 3NDeA3e/rSVBqwWCu2P4EUnDL/JP8pAaEvmjrLZSwxUiaj5nvC2HaqcgBvSJ4lHNSvOh
 9OmvkXbhGI3SN9znmtcsVGKg7zomj9MdQonC4cSHulaIzAMZm9j+BxSOSGCzUcFCBKj7
 x4pk8oKbI5drG0C1Sv2c5Kt4lkvIrXgU+viwclCRtArxQzL61P8ee4YE+73fivp6Pu3d
 yFPFEfjpoMZSS8sFu9POSgwAmohnzXF/4Ggmt9OUq9jp42rcLw4amxsMLQCfF2daUeCW
 QHNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1747491876; x=1748096676;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=RyN54yu+4eZmPFXQlkm/F9Rt9k9KQTZs1dMWtDoUYX0=;
 b=sqRKUsQbxGSMcpPZxfbXIGfJmt6i4xV72lU3fS7Edpqbt02jRiJEU4HsLKF1fc18lh
 8emoF6saDnVURt7pqLvp2qfSyFNHKyW42OsD/RzfptPufnK17rwz8PSkL3mV+aoV2njj
 mr1rCJ5C1a9VZLJqF78zr6lpzSEkz6ioYYBLLZs75gnRg15v52ySg3g4mXfe8yOG7o2G
 c+L0Dflk6kfd2j+/e7Nsq5mIKKA0djyDl977DItWobOftZUdj28UsZF419vo28AjoO3G
 8T3qXPxE6SIozU0O6hQ2+wl1BLBl5MvcmzO6C+GpG7Kmws15qkD4SbZ9VsMngsEtkRQS
 7BTg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUMImboCHtnCzIiE8ka0qUTvI+kELnfqK3pkJD64TW8R/PgL5oDFWfCgO+vqUJNIhS8+Yi8UBDP@lists.freedesktop.org,
 AJvYcCWQheIjL0ekdBSJU8iGjk9Di0pfpkypFGeJjdhiITAew3/KMSWfZ5PBH5z+SfHwrWGGW6nGsp762IxF@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxESfS6ZU0ArLha/HHGtCYwxX5jb9VsTBP6qTIw9A2e2DJ0GEmv
 hFf6SKpCFWKdOokmsB8aQQnvQuZLrKqY9vTmcQKvTpL/h3zxmSG3mV6qapKUXzWewv9yRg2+2G7
 SFIeJFPv7js8YL1joHce2sDnrHfXNFxOcqJOdk3szrw==
X-Gm-Gg: ASbGncsWTnRraqLV1kXD8CsHG7U/bWLr43viJUuXBbATYKLZqBQuz2NvF5NZrq5CVPQ
 +8r8PWMlIBEu4DigrftbMvD5D0IAT66JxOLMcqFPugyQsDTroZAh8QifBJt2R0lUwGLYgrGgZW4
 G+KRgk4FgYBDrk2qYSxdv1P95UvO/oHyRUIZ/kT0Jkm8UJ3AgYibCvSNhD+gPtrfkl9g==
X-Google-Smtp-Source: AGHT+IGT4GPCJWdJXDl6+yZgWrJ0LJqyH+PWDQzzymc57FXF+qCCdn5jGLFHy+6pmAD2rbtKyUefOa011fwdLq49evM=
X-Received: by 2002:a17:903:2bcb:b0:215:b75f:a1cb with SMTP id
 d9443c01a7336-231d43d99bamr92758275ad.9.1747491875965; Sat, 17 May 2025
 07:24:35 -0700 (PDT)
MIME-Version: 1.0
References: <20250514174306.82693-1-leonardodasigomes@gmail.com>
 <CADnq5_OEdpRvpfL9+aCQOfRGUW-vOGzXq3ts5buWXoOTxtHr6Q@mail.gmail.com>
 <CABtyycTNz7dmir5Ydc=VDiTUsLy0tryBgGmtWCJQZSauuaSJwg@mail.gmail.com>
 <CADnq5_P7m_a2CToL5JAkDSZDvUgx1LWGaS158CLMBr8xyGtVkw@mail.gmail.com>
In-Reply-To: <CADnq5_P7m_a2CToL5JAkDSZDvUgx1LWGaS158CLMBr8xyGtVkw@mail.gmail.com>
From: Leonardo Gomes <leonardodasigomes@gmail.com>
Date: Sat, 17 May 2025 11:24:24 -0300
X-Gm-Features: AX0GCFvJD7wbWoEZTBeLCX6ttDEdCVVXx53o8wpIST6mUpWnitjJhFUFRuNEHqY
Message-ID: <CABtyycR-Etym4gggPEhUYNoTPNNjZJhMAavV29dJ5T8TKaGTwg@mail.gmail.com>
Subject: Re: [PATCH 1/2 RESEND] drm/amd/display: Adjust get_value function
 with prefix to help in ftrace
To: Alex Deucher <alexdeucher@gmail.com>
Cc: harry.wentland@amd.com, sunpeng.li@amd.com, alexander.deucher@amd.com, 
 christian.koenig@amd.com, airlied@gmail.com, simona@ffwll.ch, 
 derick.william.moraes@gmail.com, amd-gfx@lists.freedesktop.org, 
 dri-devel@lists.freedesktop.org
Content-Type: multipart/alternative; boundary="00000000000083ccea063555a859"
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

--00000000000083ccea063555a859
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Good morning Alex,

I just resend the patch with the name I`ve been suggesting, please let me
know if you have any recommendation.
And thanks again for your reply =F0=9F=98=84

Leonardo Gomes

Em sex., 16 de mai. de 2025 =C3=A0s 13:56, Alex Deucher <alexdeucher@gmail.=
com>
escreveu:

> On Thu, May 15, 2025 at 9:23=E2=80=AFPM Leonardo Gomes
> <leonardodasigomes@gmail.com> wrote:
> >
> > Thanks for your reply Alex,
> >
> > I just realize with your comment that
> drivers/gpu/drm/amd/display/dc/gpio/hw_gpio.c import dal_hw_gpio_get_valu=
e
> and dal_hw_gpio_set_value.
> > So to make those functions inside
> drivers/gpu/drm/amd/display/dc/gpio/hw_hpd.c  more clear what do you thin=
k
> to change them to dal_hw_hpd_get_config and dal_hw_hpd_set_config, making
> clear that this is a function from the file hw_hpd?
> >
>
> Right.  It needs a different name to avoid the conflict with the other
> function.
>
> Alex
>
> > Leonardo Gomes
> >
> > Em qua., 14 de mai. de 2025 =C3=A0s 18:08, Alex Deucher <
> alexdeucher@gmail.com> escreveu:
> >>
> >> On Wed, May 14, 2025 at 4:48=E2=80=AFPM Leonardo Gomes
> >> <leonardodasigomes@gmail.com> wrote:
> >> >
> >> > Adjust get_value function in hw_hpd.c file to have
> >> > prefix to help in ftrace, the name change from
> >> > 'get_value' to 'dal_hw_gpio_get_value'
> >>
> >> This won't compile.  dal_hw_gpio_get_value is already defined in
> >> drivers/gpu/drm/amd/display/dc/gpio/hw_gpio.c.
> >>
> >> Alex
> >>
> >> >
> >> > Signed-off-by: Leonardo da Silva Gomes <leonardodasigomes@gmail.com>
> >> > Co-developed-by: Derick Frias <derick.william.moraes@gmail.com>
> >> > Signed-off-by: Derick Frias <derick.william.moraes@gmail.com>
> >> > ---
> >> >  drivers/gpu/drm/amd/display/dc/gpio/hw_hpd.c | 4 ++--
> >> >  1 file changed, 2 insertions(+), 2 deletions(-)
> >> >
> >> > diff --git a/drivers/gpu/drm/amd/display/dc/gpio/hw_hpd.c
> b/drivers/gpu/drm/amd/display/dc/gpio/hw_hpd.c
> >> > index 3f13a744d07d..b11ed1089589 100644
> >> > --- a/drivers/gpu/drm/amd/display/dc/gpio/hw_hpd.c
> >> > +++ b/drivers/gpu/drm/amd/display/dc/gpio/hw_hpd.c
> >> > @@ -62,7 +62,7 @@ static void dal_hw_hpd_destroy(
> >> >         *ptr =3D NULL;
> >> >  }
> >> >
> >> > -static enum gpio_result get_value(
> >> > +static enum gpio_result dal_hw_gpio_get_value(
> >> >         const struct hw_gpio_pin *ptr,
> >> >         uint32_t *value)
> >> >  {
> >> > @@ -104,7 +104,7 @@ static enum gpio_result set_config(
> >> >  static const struct hw_gpio_pin_funcs funcs =3D {
> >> >         .destroy =3D dal_hw_hpd_destroy,
> >> >         .open =3D dal_hw_gpio_open,
> >> > -       .get_value =3D get_value,
> >> > +       .get_value =3D dal_hw_gpio_get_value,
> >> >         .set_value =3D dal_hw_gpio_set_value,
> >> >         .set_config =3D set_config,
> >> >         .change_mode =3D dal_hw_gpio_change_mode,
> >> > --
> >> > 2.43.0
> >> >
>

--00000000000083ccea063555a859
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Good morning Alex,<br><br>I just resend the patch with the=
 name I`ve been suggesting, please let me know if you have any recommendati=
on.=C2=A0<div>And thanks again for your reply=C2=A0=F0=9F=98=84<br><br></di=
v><div>Leonardo Gomes<br></div></div><br><div class=3D"gmail_quote gmail_qu=
ote_container"><div dir=3D"ltr" class=3D"gmail_attr">Em sex., 16 de mai. de=
 2025 =C3=A0s 13:56, Alex Deucher &lt;<a href=3D"mailto:alexdeucher@gmail.c=
om">alexdeucher@gmail.com</a>&gt; escreveu:<br></div><blockquote class=3D"g=
mail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204=
,204,204);padding-left:1ex">On Thu, May 15, 2025 at 9:23=E2=80=AFPM Leonard=
o Gomes<br>
&lt;<a href=3D"mailto:leonardodasigomes@gmail.com" target=3D"_blank">leonar=
dodasigomes@gmail.com</a>&gt; wrote:<br>
&gt;<br>
&gt; Thanks for your reply Alex,<br>
&gt;<br>
&gt; I just realize with your comment that drivers/gpu/drm/amd/display/dc/g=
pio/hw_gpio.c import dal_hw_gpio_get_value and dal_hw_gpio_set_value.<br>
&gt; So to make those functions inside drivers/gpu/drm/amd/display/dc/gpio/=
hw_hpd.c=C2=A0 more clear what do you think to change them to dal_hw_hpd_ge=
t_config and dal_hw_hpd_set_config, making clear that this is a function fr=
om the file hw_hpd?<br>
&gt;<br>
<br>
Right.=C2=A0 It needs a different name to avoid the conflict with the other=
 function.<br>
<br>
Alex<br>
<br>
&gt; Leonardo Gomes<br>
&gt;<br>
&gt; Em qua., 14 de mai. de 2025 =C3=A0s 18:08, Alex Deucher &lt;<a href=3D=
"mailto:alexdeucher@gmail.com" target=3D"_blank">alexdeucher@gmail.com</a>&=
gt; escreveu:<br>
&gt;&gt;<br>
&gt;&gt; On Wed, May 14, 2025 at 4:48=E2=80=AFPM Leonardo Gomes<br>
&gt;&gt; &lt;<a href=3D"mailto:leonardodasigomes@gmail.com" target=3D"_blan=
k">leonardodasigomes@gmail.com</a>&gt; wrote:<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; Adjust get_value function in hw_hpd.c file to have<br>
&gt;&gt; &gt; prefix to help in ftrace, the name change from<br>
&gt;&gt; &gt; &#39;get_value&#39; to &#39;dal_hw_gpio_get_value&#39;<br>
&gt;&gt;<br>
&gt;&gt; This won&#39;t compile.=C2=A0 dal_hw_gpio_get_value is already def=
ined in<br>
&gt;&gt; drivers/gpu/drm/amd/display/dc/gpio/hw_gpio.c.<br>
&gt;&gt;<br>
&gt;&gt; Alex<br>
&gt;&gt;<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; Signed-off-by: Leonardo da Silva Gomes &lt;<a href=3D"mailto:=
leonardodasigomes@gmail.com" target=3D"_blank">leonardodasigomes@gmail.com<=
/a>&gt;<br>
&gt;&gt; &gt; Co-developed-by: Derick Frias &lt;<a href=3D"mailto:derick.wi=
lliam.moraes@gmail.com" target=3D"_blank">derick.william.moraes@gmail.com</=
a>&gt;<br>
&gt;&gt; &gt; Signed-off-by: Derick Frias &lt;<a href=3D"mailto:derick.will=
iam.moraes@gmail.com" target=3D"_blank">derick.william.moraes@gmail.com</a>=
&gt;<br>
&gt;&gt; &gt; ---<br>
&gt;&gt; &gt;=C2=A0 drivers/gpu/drm/amd/display/dc/gpio/hw_hpd.c | 4 ++--<b=
r>
&gt;&gt; &gt;=C2=A0 1 file changed, 2 insertions(+), 2 deletions(-)<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; diff --git a/drivers/gpu/drm/amd/display/dc/gpio/hw_hpd.c b/d=
rivers/gpu/drm/amd/display/dc/gpio/hw_hpd.c<br>
&gt;&gt; &gt; index 3f13a744d07d..b11ed1089589 100644<br>
&gt;&gt; &gt; --- a/drivers/gpu/drm/amd/display/dc/gpio/hw_hpd.c<br>
&gt;&gt; &gt; +++ b/drivers/gpu/drm/amd/display/dc/gpio/hw_hpd.c<br>
&gt;&gt; &gt; @@ -62,7 +62,7 @@ static void dal_hw_hpd_destroy(<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0*ptr =3D NULL;<br>
&gt;&gt; &gt;=C2=A0 }<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; -static enum gpio_result get_value(<br>
&gt;&gt; &gt; +static enum gpio_result dal_hw_gpio_get_value(<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0const struct hw_gpio_pin *pt=
r,<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0uint32_t *value)<br>
&gt;&gt; &gt;=C2=A0 {<br>
&gt;&gt; &gt; @@ -104,7 +104,7 @@ static enum gpio_result set_config(<br>
&gt;&gt; &gt;=C2=A0 static const struct hw_gpio_pin_funcs funcs =3D {<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0.destroy =3D dal_hw_hpd_dest=
roy,<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0.open =3D dal_hw_gpio_open,<=
br>
&gt;&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0.get_value =3D get_value,<br>
&gt;&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0.get_value =3D dal_hw_gpio_get_va=
lue,<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0.set_value =3D dal_hw_gpio_s=
et_value,<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0.set_config =3D set_config,<=
br>
&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0.change_mode =3D dal_hw_gpio=
_change_mode,<br>
&gt;&gt; &gt; --<br>
&gt;&gt; &gt; 2.43.0<br>
&gt;&gt; &gt;<br>
</blockquote></div>

--00000000000083ccea063555a859--
