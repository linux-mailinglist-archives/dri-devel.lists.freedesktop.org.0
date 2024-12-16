Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F44E9F3CCB
	for <lists+dri-devel@lfdr.de>; Mon, 16 Dec 2024 22:29:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DFAE310E62B;
	Mon, 16 Dec 2024 21:29:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="KVTzzRkW";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x536.google.com (mail-ed1-x536.google.com
 [IPv6:2a00:1450:4864:20::536])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 326DA10E626;
 Mon, 16 Dec 2024 21:29:44 +0000 (UTC)
Received: by mail-ed1-x536.google.com with SMTP id
 4fb4d7f45d1cf-5d3da226a2aso507430a12.0; 
 Mon, 16 Dec 2024 13:29:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1734384583; x=1734989383; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=ui3ngXv6KtZvNASMuiLTgdCGRcx8WMeUEyA30kq8bow=;
 b=KVTzzRkWUast4ZWqC7FdeoCPE0KY4H39GYmdmELv+jWi7jB/kHBa6LrssaJADqGleb
 v9jgzXKb/wBlK/n78m0sU9uUz0iCUt90AS350oZKVbFL7Jhmv+UuRt96Hc6SN1BYvLn1
 nkbVPCMTxOtnjUqiiPFCghMEJRJAE6zxzYdIUA4e0Nd17//wllLNC0NMFyxSjmrt7hHq
 VsO+DTtASPRKrlbjzClf+jQPPhaQdm3IU/0myk5aXhb0A2H2YmN5noTqnuzjq4HyDTCo
 qMjMnWUjJ8zN4NMTAd+PzC4vHro4ymMFhG3arZnJWNpqeWZguAMxftvfg0e67kNFAEeY
 QDyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1734384583; x=1734989383;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=ui3ngXv6KtZvNASMuiLTgdCGRcx8WMeUEyA30kq8bow=;
 b=LivRqpsZJ4slLOm6nlrDv8LoYopaFl3Txi76lhcvfvy92KuKlYIikT54QWY8rKOxFT
 jqBiIFhHpcfqGq8daS07mxGbNsywx6TqIz3YQGH1KG4Tt3CUH9ohNybUy5iDUcsrz8Zs
 zaBuI812pV6rh+JydiJ4Ej0J+pJyUpn+RfH+J8PWZRz+HnkcIARM81SA3aPOPWbQ7FA5
 Z2x7ZsBAg0rRSG9pd3hPldBFp0jtl/cGDp3QrOZwZr4kUPmnCdPpY9uhMuCtG/b3ygh6
 sbJywutPHRTGnRmmOZRcFvooBivGLHV+gkkaQ2YP+bY6c4GSEs3XhfwuDrGPufC7UfJa
 royQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUdQQoVXfAvwZ9zO7Uwt00eRLps+NorWK46nu6tFgORm+E8flMbIzYiJdITfkHcR7AYbPSwJRQDfFg=@lists.freedesktop.org,
 AJvYcCWTzUanKjcxx7jmYSiZddpodSbKAPQbqme588cMVQoAgCRqNy7papW2hRI1BxOeaIa0V1RDnGXl@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwHUeqR71sc64I06GIhYXe8eAb49HmZzlBwFTK/2AwBW02rbxVZ
 PDCDXr3NfPq3LLnmkzccOPgM3T77u7Jq40eOX3W8heiIDFNBmNu2KWVtXUNAEYdmaglFk0Al7YJ
 EXNY7LEviUPlf6M0rNCuAancXAkA=
X-Gm-Gg: ASbGncsBUWajywn/jwCMmBNfjLL/5j1r96FlHRSNpPAIflVF1bdlhGx0gGYBNNuZj+H
 XO0xTHFobym/BWU7ruJJ+jcyjDv+kRm7se7gWnug=
X-Google-Smtp-Source: AGHT+IHpi0Y5sTs+I55N/j3Dr6fECI/Ik3UK1n899YR7bPozdDojKIkaFGpYHuRECX/K0bXur+jRDznjdUJFISyMtus=
X-Received: by 2002:a05:6402:5253:b0:5d0:e522:9731 with SMTP id
 4fb4d7f45d1cf-5d63c14db04mr4886490a12.0.1734384582393; Mon, 16 Dec 2024
 13:29:42 -0800 (PST)
MIME-Version: 1.0
References: <CAAxE2A5BkF13bFt8_UnuiqPM8W-ZESgmKEjqqGfv=DGzSfJ7aQ@mail.gmail.com>
 <340ed70a-a576-43c6-86ff-9b58ed513c72@mailbox.org>
In-Reply-To: <340ed70a-a576-43c6-86ff-9b58ed513c72@mailbox.org>
From: =?UTF-8?B?TWFyZWsgT2zFocOhaw==?= <maraeo@gmail.com>
Date: Mon, 16 Dec 2024 16:29:06 -0500
Message-ID: <CAAxE2A4+6fMd+Ly_5UgAnLxWP3NTYyc=boCK_H7-_qsrgsE2eA@mail.gmail.com>
Subject: Re: [PATCH] drm/fourcc: add LINEAR modifiers with an exact pitch
 alignment
To: =?UTF-8?Q?Michel_D=C3=A4nzer?= <michel.daenzer@mailbox.org>
Cc: dri-devel <dri-devel@lists.freedesktop.org>, 
 amd-gfx mailing list <amd-gfx@lists.freedesktop.org>, 
 ML Mesa-dev <mesa-dev@lists.freedesktop.org>
Content-Type: multipart/alternative; boundary="000000000000f0089a062969e0b9"
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

--000000000000f0089a062969e0b9
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Dec 16, 2024 at 4:27=E2=80=AFAM Michel D=C3=A4nzer <michel.daenzer@=
mailbox.org>
wrote:

> On 2024-12-15 21:53, Marek Ol=C5=A1=C3=A1k wrote:
> > The comment explains the problem with DRM_FORMAT_MOD_LINEAR.
> >
> > Signed-off-by: Marek Ol=C5=A1=C3=A1k <marek.olsak@amd.com <mailto:
> marek.olsak@amd.com>>
> >
> > diff --git a/include/uapi/drm/drm_fourcc.h
> b/include/uapi/drm/drm_fourcc.h
> > index 78abd819fd62e..8ec4163429014 100644
> > --- a/include/uapi/drm/drm_fourcc.h
> > +++ b/include/uapi/drm/drm_fourcc.h
> > @@ -484,9 +484,27 @@ extern "C" {
> >   * modifier (e.g. not setting DRM_MODE_FB_MODIFIERS in the DRM_ADDFB2
> ioctl),
> >   * which tells the driver to also take driver-internal information int=
o
> account
> >   * and so might actually result in a tiled framebuffer.
> > + *
> > + * WARNING:
> > + * There are drivers out there that expose DRM_FORMAT_MOD_LINEAR, but
> only
> > + * support a certain pitch alignment and can't import images with this
> modifier
> > + * if the pitch alignment isn't exactly the one supported. They can
> however
> > + * allocate images with this modifier and other drivers can import the=
m
> only
> > + * if they support the same pitch alignment. Thus,
> DRM_FORMAT_MOD_LINEAR is
> > + * fundamentically incompatible across devices and is the only modifie=
r
> that
> > + * has a chance of not working. The PITCH_ALIGN modifiers should be us=
ed
> > + * instead.
> >   */
> >  #define DRM_FORMAT_MOD_LINEAR  fourcc_mod_code(NONE, 0)
> >
> > +/* Linear layout modifiers with an explicit pitch alignment in bytes.
> > + * Exposing this modifier requires that the pitch alignment is exactly
> > + * the number in the definition.
> > + */
> > +#define DRM_FORMAT_MOD_LINEAR_PITCH_ALIGN_64B fourcc_mod_code(NONE, 1)
>
> It's not clear what you mean by "requires that the pitch alignment is
> exactly the number in the definition", since a pitch which is aligned to
> 256 bytes is also aligned to 128 & 64 bytes. Do you mean the pitch must b=
e
> exactly the width rounded up to the next / smallest possible multiple of
> the specified number of bytes?
>

The pitch must be width*Bpp aligned to the number of bytes in the
definition.

Marek

--000000000000f0089a062969e0b9
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_quote gmail_quote_container"><div dir=
=3D"ltr" class=3D"gmail_attr">On Mon, Dec 16, 2024 at 4:27=E2=80=AFAM Miche=
l D=C3=A4nzer &lt;<a href=3D"mailto:michel.daenzer@mailbox.org">michel.daen=
zer@mailbox.org</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" s=
tyle=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);pad=
ding-left:1ex">On 2024-12-15 21:53, Marek Ol=C5=A1=C3=A1k wrote:<br>
&gt; The comment explains the problem with DRM_FORMAT_MOD_LINEAR.<br>
&gt; =C2=A0 =C2=A0<br>
&gt; Signed-off-by: Marek Ol=C5=A1=C3=A1k &lt;<a href=3D"mailto:marek.olsak=
@amd.com" target=3D"_blank">marek.olsak@amd.com</a> &lt;mailto:<a href=3D"m=
ailto:marek.olsak@amd.com" target=3D"_blank">marek.olsak@amd.com</a>&gt;&gt=
;<br>
&gt; <br>
&gt; diff --git a/include/uapi/drm/drm_fourcc.h b/include/uapi/drm/drm_four=
cc.h<br>
&gt; index 78abd819fd62e..8ec4163429014 100644<br>
&gt; --- a/include/uapi/drm/drm_fourcc.h<br>
&gt; +++ b/include/uapi/drm/drm_fourcc.h<br>
&gt; @@ -484,9 +484,27 @@ extern &quot;C&quot; {<br>
&gt; =C2=A0 * modifier (e.g. not setting DRM_MODE_FB_MODIFIERS in the DRM_A=
DDFB2 ioctl),<br>
&gt; =C2=A0 * which tells the driver to also take driver-internal informati=
on into account<br>
&gt; =C2=A0 * and so might actually result in a tiled framebuffer.<br>
&gt; + *<br>
&gt; + * WARNING:<br>
&gt; + * There are drivers out there that expose DRM_FORMAT_MOD_LINEAR, but=
 only<br>
&gt; + * support a certain pitch alignment and can&#39;t import images with=
 this modifier<br>
&gt; + * if the pitch alignment isn&#39;t exactly the one supported. They c=
an however<br>
&gt; + * allocate images with this modifier and other drivers can import th=
em only<br>
&gt; + * if they support the same pitch alignment. Thus, DRM_FORMAT_MOD_LIN=
EAR is<br>
&gt; + * fundamentically incompatible across devices and is the only modifi=
er that<br>
&gt; + * has a chance of not working. The PITCH_ALIGN modifiers should be u=
sed<br>
&gt; + * instead.<br>
&gt; =C2=A0 */<br>
&gt; =C2=A0#define DRM_FORMAT_MOD_LINEAR =C2=A0fourcc_mod_code(NONE, 0)<br>
&gt; =C2=A0<br>
&gt; +/* Linear layout modifiers with an explicit pitch alignment in bytes.=
<br>
&gt; + * Exposing this modifier requires that the pitch alignment is exactl=
y<br>
&gt; + * the number in the definition.<br>
&gt; + */<br>
&gt; +#define DRM_FORMAT_MOD_LINEAR_PITCH_ALIGN_64B fourcc_mod_code(NONE, 1=
)<br>
<br>
It&#39;s not clear what you mean by &quot;requires that the pitch alignment=
 is exactly the number in the definition&quot;, since a pitch which is alig=
ned to 256 bytes is also aligned to 128 &amp; 64 bytes. Do you mean the pit=
ch must be exactly the width rounded up to the next / smallest possible mul=
tiple of the specified number of bytes?<br></blockquote><div><br></div>The =
pitch must be width*Bpp aligned to the number of bytes in the definition.</=
div><div class=3D"gmail_quote gmail_quote_container"><br></div><div class=
=3D"gmail_quote gmail_quote_container">Marek<br></div></div>

--000000000000f0089a062969e0b9--
