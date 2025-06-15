Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0065AADA3B2
	for <lists+dri-devel@lfdr.de>; Sun, 15 Jun 2025 22:44:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3746210E07A;
	Sun, 15 Jun 2025 20:44:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="eRJ6fTpF";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-f177.google.com (mail-yw1-f177.google.com
 [209.85.128.177])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 04DFC10E07A
 for <dri-devel@lists.freedesktop.org>; Sun, 15 Jun 2025 20:44:17 +0000 (UTC)
Received: by mail-yw1-f177.google.com with SMTP id
 00721157ae682-70e40e3f316so27273177b3.0
 for <dri-devel@lists.freedesktop.org>; Sun, 15 Jun 2025 13:44:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1750020256; x=1750625056; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=lHgtfG07kn1L2/mK1tjQeox1/bdpp/rMlCmk9Dyqin8=;
 b=eRJ6fTpFqg5vKDwmxYcbiQilFAn4G6KVAT9uTX9p9YULCudX5fmrWCc7P8s+ZQCdGF
 if2ELLVBYUZyJdZnwwSjF8YVoW7r6TyXEBEppsGkBqiBVHksgk+j4tfmwe6ESpOZW7Je
 OhdmwMfmTNxugDvJ4RjtXrCeVI9bXXZ2ZSq+PDNj2X6cc5AewgSU/quPlQxV93pIYnNR
 7Pr2EXcHQEEAAjMqeYZSAnretAZR+b/2dOcbYnyjq+/YuxtYbI5k06W6G6Mb11FHOJnK
 wYOt3BOogwKJCfmwx8yA0hUZ0xp68lc70LDMaOlU5HYYnmy6nNJjJXFFC1krHYAB7oKc
 vJtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1750020256; x=1750625056;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=lHgtfG07kn1L2/mK1tjQeox1/bdpp/rMlCmk9Dyqin8=;
 b=RpeRGk+s3EFlZZ0VqweKP2Hfoqgl7Xk9IZ2/O9e+WdA1AocckJ+TWeWKQpTlJ4baxo
 /hAdA079GLXPsYeZRdQWXd8EIv2krfrc2uhCLNGdnT/GVtjtk/0czrHr1V0l97O85zYQ
 9QOlyiVoxRsa7KJjJBnqe2B15Lcn+fhVwcG6AIvvdhFEkrmOPJcwN99Fwv7WpWbdo8ki
 vOW8WFX5B4PZHR9O6aU/w2DOAlpuKe0QMpefwyAW0G0DJhunRJPhhPaNlILS19HgxABE
 3XqtAIOB8xKx0IWJsxcWCzZRrIUgtiveiw/0SPHtkV1g1jZ40KzikW7Rz7v2VixxE6CZ
 vPCA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUKrS6W7IKX6iB6mo6apaFSL3hJKx4bcZmqEhuySO/JMehpGQ8C5fLW1QxbCFNawQS+lNcmxvqDvyU=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yx85AYFaUthXg7BsnMNuep+PwfMWM/tJCFk1qlUK8BOGGhVDO8w
 OfHcdPMt6wRaeUBqI7j9dluLbsZmtJ31IlT7sCs5pg6S1cZf638+KvZC4RrHTqiBZh3oFhMo2KT
 50Ysvr2uABCGH36q+iFG8abj7/P6kw7k=
X-Gm-Gg: ASbGncsdyVxhnz78iJ+SSMIR++h1Axd1WNLztvYCZNvxe2uMuN2lKsUDu5aUAF/mhOd
 nqhPE2YvTmbosH1MyjbB+1Lp2BwIB8Z2kerLG/+mezfo9xIhFdLBVHtvGhlC2xq7GFymnbAiFri
 SWdvL2W28VECnQ6cu4fkNhSlXkRZua+CxXL5t9+rirf05A+ArOVuF34Dc=
X-Google-Smtp-Source: AGHT+IEtdqfJv6hFQUMyRpyQvID8YThBWJw5yL7MonWvEdVoM8T83GHE8qZxTwaWJZW1oNWUIMVWlpuOl4BcUfL9/bg=
X-Received: by 2002:a05:690c:f07:b0:70c:9478:6090 with SMTP id
 00721157ae682-7117544ca4amr90393077b3.28.1750020255851; Sun, 15 Jun 2025
 13:44:15 -0700 (PDT)
MIME-Version: 1.0
References: <20250614051837.3544959-1-alexguo1023@gmail.com>
 <20250615093003.6e524fa9@pumpkin>
In-Reply-To: <20250615093003.6e524fa9@pumpkin>
From: Jin D <alexguo1023@gmail.com>
Date: Sun, 15 Jun 2025 16:43:58 -0400
X-Gm-Features: AX0GCFsH__qGjb2CAQIRD2ho9nsc9hYQHRyUD1yhot_JNp-ePWICpYWnhEuSTCE
Message-ID: <CAAi4Z-fDFw1gD2MbqucWRMN0DvKf5mk6B+GDD95x9o23G8iK6w@mail.gmail.com>
Subject: Re: [PATCH] fbdev: i740: Fix potential divide by zero
To: David Laight <david.laight.linux@gmail.com>
Cc: deller@gmx.de, linux-fbdev@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Content-Type: multipart/alternative; boundary="000000000000b327c70637a2570b"
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

--000000000000b327c70637a2570b
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

>       bpp =3D var->bits_per_pixel;
> +     if (!var->pixclock){
> +             dev_err(info->device, "pixclock must not be zero\n");
> +             return -EINVAL;
> +     }
>       switch (bpp) {
>       case 1 ... 8:
>               bpp =3D 8;

The value used in the switch condition is var->bits_per_pixel. I can not
find a deterministic relationship between var->bits_per_pixel and
var->pixclock.

On Sun, Jun 15, 2025 at 4:30=E2=80=AFAM David Laight <david.laight.linux@gm=
ail.com>
wrote:

> On Sat, 14 Jun 2025 01:18:37 -0400
> Alex Guo <alexguo1023@gmail.com> wrote:
>
> > Variable var->pixclock can be set by user. In case it equals to
> > zero, divide by zero would occur in 4 switch branches in
> > i740fb_decode_var.
> > Similar crashes have happened in other fbdev drivers. We fix this
> > by checking whether 'pixclock' is zero.
>
> Doesn't it already hit the 'default' clause of the switch statement?
>
>         David
>
> >
> > Similar commit: commit 16844e58704 ("video: fbdev: tridentfb:
> > Error out if 'pixclock' equals zero")
> >
> > Signed-off-by: Alex Guo <alexguo1023@gmail.com>
> > ---
> >  drivers/video/fbdev/i740fb.c | 4 ++++
> >  1 file changed, 4 insertions(+)
> >
> > diff --git a/drivers/video/fbdev/i740fb.c b/drivers/video/fbdev/i740fb.=
c
> > index 9b74dae71472..861e9e397b4e 100644
> > --- a/drivers/video/fbdev/i740fb.c
> > +++ b/drivers/video/fbdev/i740fb.c
> > @@ -419,6 +419,10 @@ static int i740fb_decode_var(const struct
> fb_var_screeninfo *var,
> >
> >
> >       bpp =3D var->bits_per_pixel;
> > +     if (!var->pixclock){
> > +             dev_err(info->device, "pixclock must not be zero\n");
> > +             return -EINVAL;
> > +     }
> >       switch (bpp) {
> >       case 1 ... 8:
> >               bpp =3D 8;
>
>

--000000000000b327c70637a2570b
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0bpp =3D var-&gt;bits_p=
er_pixel;<br>&gt; +=C2=A0 =C2=A0 =C2=A0if (!var-&gt;pixclock){<br>&gt; +=C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0dev_err(info-&gt;device, &quot=
;pixclock must not be zero\n&quot;);<br>&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0return -EINVAL;<br>&gt; +=C2=A0 =C2=A0 =C2=A0}<br>&gt;=
=C2=A0 =C2=A0 =C2=A0 =C2=A0switch (bpp) {<br>&gt;=C2=A0 =C2=A0 =C2=A0 =C2=
=A0case 1 ... 8:<br>&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0bpp =3D 8;</div><div><br></div><div>The value used in the switch cond=
ition is var-&gt;bits_per_pixel. I can not find a deterministic relationshi=
p between var-&gt;bits_per_pixel and var-&gt;pixclock.</div><br><div class=
=3D"gmail_quote gmail_quote_container"><div dir=3D"ltr" class=3D"gmail_attr=
">On Sun, Jun 15, 2025 at 4:30=E2=80=AFAM David Laight &lt;<a href=3D"mailt=
o:david.laight.linux@gmail.com">david.laight.linux@gmail.com</a>&gt; wrote:=
<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8=
ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">On Sat, 14 Jun =
2025 01:18:37 -0400<br>
Alex Guo &lt;<a href=3D"mailto:alexguo1023@gmail.com" target=3D"_blank">ale=
xguo1023@gmail.com</a>&gt; wrote:<br>
<br>
&gt; Variable var-&gt;pixclock can be set by user. In case it equals to<br>
&gt; zero, divide by zero would occur in 4 switch branches in<br>
&gt; i740fb_decode_var.<br>
&gt; Similar crashes have happened in other fbdev drivers. We fix this<br>
&gt; by checking whether &#39;pixclock&#39; is zero.<br>
<br>
Doesn&#39;t it already hit the &#39;default&#39; clause of the switch state=
ment?<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 David<br>
<br>
&gt; <br>
&gt; Similar commit: commit 16844e58704 (&quot;video: fbdev: tridentfb:<br>
&gt; Error out if &#39;pixclock&#39; equals zero&quot;)<br>
&gt; <br>
&gt; Signed-off-by: Alex Guo &lt;<a href=3D"mailto:alexguo1023@gmail.com" t=
arget=3D"_blank">alexguo1023@gmail.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 drivers/video/fbdev/i740fb.c | 4 ++++<br>
&gt;=C2=A0 1 file changed, 4 insertions(+)<br>
&gt; <br>
&gt; diff --git a/drivers/video/fbdev/i740fb.c b/drivers/video/fbdev/i740fb=
.c<br>
&gt; index 9b74dae71472..861e9e397b4e 100644<br>
&gt; --- a/drivers/video/fbdev/i740fb.c<br>
&gt; +++ b/drivers/video/fbdev/i740fb.c<br>
&gt; @@ -419,6 +419,10 @@ static int i740fb_decode_var(const struct fb_var_=
screeninfo *var,<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 <br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0bpp =3D var-&gt;bits_per_pixel;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0if (!var-&gt;pixclock){<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0dev_err(info-&gt;devi=
ce, &quot;pixclock must not be zero\n&quot;);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return -EINVAL;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0}<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0switch (bpp) {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0case 1 ... 8:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0bpp =3D 8;<br>
<br>
</blockquote></div></div>

--000000000000b327c70637a2570b--
