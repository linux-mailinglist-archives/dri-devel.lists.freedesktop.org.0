Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C7344C41AD
	for <lists+dri-devel@lfdr.de>; Fri, 25 Feb 2022 10:43:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 352C710E3FE;
	Fri, 25 Feb 2022 09:43:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com
 [IPv6:2a00:1450:4864:20::12a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E14EB10E3FE
 for <dri-devel@lists.freedesktop.org>; Fri, 25 Feb 2022 09:43:50 +0000 (UTC)
Received: by mail-lf1-x12a.google.com with SMTP id g39so8375185lfv.10
 for <dri-devel@lists.freedesktop.org>; Fri, 25 Feb 2022 01:43:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=date:from:to:cc:subject:message-id:in-reply-to:references
 :mime-version; bh=HEcH488vI7oS7M8JM84dDwbSHSl/vjHIp7IjwgPSIiA=;
 b=PWNowI3ltwhgH2fSEYR84GIfDgOMT0DQIs3n2Ns+Z5bR2464VsyHL8YF0lscXVlTa6
 ZIxIC17wIF60gYhtK72Y61/4a1i7fCNye7D+RzCXPsDyCXP0/p9hsV40KSS8iitK4BF5
 0irBzvsGw7+K+DcM9AP0NpZAtTkTSUPgzvCy6rMgzkLBlV5eQD52DJuwKQCh8j1f/p+J
 051w5F5UfjYnUmq0aT5P6ugAnLGlJ8cJibHvIH0hTPtX/gQ74uwxPxFldcSI8uPxDMf6
 2HifZ78z3b09MyY08koYEMGtYIPWlZ/2A0ryZtEVXKbK8TiZ6sOdHRQbXecQ99u3jRLs
 8M/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:mime-version;
 bh=HEcH488vI7oS7M8JM84dDwbSHSl/vjHIp7IjwgPSIiA=;
 b=0JesaLep2SQnsLJJqOYKEqfdIzFijJc+fUNIBfq0ku8PRde5uPFoJ29zwDligXlbfV
 Re8WeWy8DcIkAmHS/FvQW2bbEo2baJ2xUCFp3sYaH3/wP/wFYEpzsL59UD2dTZ3s3qly
 TcamGH8hLkY513aSxwieMNxlJK+Be8ANet0DO0jOOLe5UO5bnKwhgF6jnRCSSXNc6F5/
 1fEAIYSl73XaGLKwhhXEEQ8ZTrPFETA+qLxsEEjcWLyE22ZSmqdaHzTX9d2fphymdG7G
 VA43f6EsvPj7cGKAsQLAqf9wc4aA8g9t63geFUztoT/9efHO4PjBNLMOrY/3F9Q7dySM
 3KJQ==
X-Gm-Message-State: AOAM530gAh1QQLyIJDWbdjbrjOLj1lKyRpx7G7qxoLnRuFzTWPGtUYZ9
 7p7b8cAIxmxNuA7wAOlLOe4=
X-Google-Smtp-Source: ABdhPJwAiy/V3ua3Poldi1D/a96Ea0jDG4a6WsQrZ18/xON84uH050BK7g17CpsF9Q8jJ14WN/gFpA==
X-Received: by 2002:ac2:5397:0:b0:42a:9411:384b with SMTP id
 g23-20020ac25397000000b0042a9411384bmr4533282lfh.266.1645782228983; 
 Fri, 25 Feb 2022 01:43:48 -0800 (PST)
Received: from eldfell ([194.136.85.206]) by smtp.gmail.com with ESMTPSA id
 4-20020ac24824000000b00443afc86517sm153732lft.152.2022.02.25.01.43.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 25 Feb 2022 01:43:48 -0800 (PST)
Date: Fri, 25 Feb 2022 11:43:45 +0200
From: Pekka Paalanen <ppaalanen@gmail.com>
To: Igor Torrente <igormtorrente@gmail.com>
Subject: Re: [PATCH v4 9/9] drm: vkms: Add support to the RGB565 format
Message-ID: <20220225114345.0cbe4432@eldfell>
In-Reply-To: <CAOA8r4G5aMSv9o508B9icdNuaKF4-9zU9KsTW1nG1wCZ6nKfbA@mail.gmail.com>
References: <20220121213831.47229-1-igormtorrente@gmail.com>
 <20220121213831.47229-10-igormtorrente@gmail.com>
 <20220210115039.588996bd@eldfell>
 <CAOA8r4G5aMSv9o508B9icdNuaKF4-9zU9KsTW1nG1wCZ6nKfbA@mail.gmail.com>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/XnLpS6BEHIgNx7wDFe4ff.T";
 protocol="application/pgp-signature"; micalg=pgp-sha256
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
Cc: hamohammed.sa@gmail.com, Thomas Zimmermann <tzimmermann@suse.de>,
 rodrigosiqueiramelo@gmail.com, airlied@linux.ie,
 dri-devel@lists.freedesktop.org, melissa.srw@gmail.com,
 ~lkcamp/patches@lists.sr.ht
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--Sig_/XnLpS6BEHIgNx7wDFe4ff.T
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

On Thu, 24 Feb 2022 22:03:42 -0300
Igor Torrente <igormtorrente@gmail.com> wrote:

> Hi Pekka,
>=20
> On Thu, Feb 10, 2022 at 6:50 AM Pekka Paalanen <ppaalanen@gmail.com> wrot=
e:
>=20
> > On Fri, 21 Jan 2022 18:38:31 -0300
> > Igor Torrente <igormtorrente@gmail.com> wrote:
> > =20
> > > Adds this common format to vkms.
> > >
> > > This commit also adds new helper macros to deal with fixed-point
> > > arithmetic.
> > >
> > > It was done to improve the precision of the conversion to ARGB16161616
> > > since the "conversion ratio" is not an integer.
> > >
> > > Signed-off-by: Igor Torrente <igormtorrente@gmail.com>
> > > ---
> > > V3: Adapt the handlers to the new format introduced in patch 7 V3.
> > > ---
> > >  drivers/gpu/drm/vkms/vkms_formats.c   | 74 +++++++++++++++++++++++++=
++
> > >  drivers/gpu/drm/vkms/vkms_formats.h   |  6 +++
> > >  drivers/gpu/drm/vkms/vkms_plane.c     |  6 ++-
> > >  drivers/gpu/drm/vkms/vkms_writeback.c |  3 +-
> > >  4 files changed, 86 insertions(+), 3 deletions(-)
> > >
> > > diff --git a/drivers/gpu/drm/vkms/vkms_formats.c =20
> > b/drivers/gpu/drm/vkms/vkms_formats.c =20
> > > index 661da39d1276..dc612882dd8c 100644
> > > --- a/drivers/gpu/drm/vkms/vkms_formats.c
> > > +++ b/drivers/gpu/drm/vkms/vkms_formats.c
> > > @@ -11,6 +11,8 @@ format_transform_func get_fmt_transform_function(u3=
2 =20
> > format) =20
> > >               return &get_ARGB16161616;
> > >       else if (format =3D=3D DRM_FORMAT_XRGB16161616)
> > >               return &XRGB16161616_to_ARGB16161616;
> > > +     else if (format =3D=3D DRM_FORMAT_RGB565)
> > > +             return &RGB565_to_ARGB16161616;
> > >       else
> > >               return &XRGB8888_to_ARGB16161616;
> > >  }
> > > @@ -23,6 +25,8 @@ format_transform_func =20
> > get_wb_fmt_transform_function(u32 format) =20
> > >               return &convert_to_ARGB16161616;
> > >       else if (format =3D=3D DRM_FORMAT_XRGB16161616)
> > >               return &convert_to_XRGB16161616;
> > > +     else if (format =3D=3D DRM_FORMAT_RGB565)
> > > +             return &convert_to_RGB565;
> > >       else
> > >               return &convert_to_XRGB8888;
> > >  }
> > > @@ -33,6 +37,26 @@ static int pixel_offset(struct vkms_frame_info =20
> > *frame_info, int x, int y) =20
> > >                                 + (x * frame_info->cpp);
> > >  }
> > >
> > > +/*
> > > + * FP stands for _Fixed Point_ and **not** _Float Point_ =20
> >
> > Is it common in the kernel that FP always means fixed-point?
> > =20
>=20
> I cannot say for sure, but I don't think so. I put it for people like me
> that goes automatically to Floating-Point because never worked with
> fixed-point before.

Indeed, so do not use "FP" at all as an abbreviation, please. Use a
name or abbreviation that does not need a comment to prevent easy
misunderstandings.


Thanks,
pq

--Sig_/XnLpS6BEHIgNx7wDFe4ff.T
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEJQjwWQChkWOYOIONI1/ltBGqqqcFAmIYpNEACgkQI1/ltBGq
qqdyGA//bSSe2U8qtTZDA4JPsylgjjgiGu7Bm1yfz3vAu38N3CljCjnHlNmRo1JT
XdKPYFFeiwQthc7+VAcxepSHElOg+TViPZ7FTlwxsuU3jU8ULxs+sE0WdSeLne19
kFj4JNpwojna/vEDPuLyMu0iHWVIpuu8qrXOTHA4lkad2Oun7f216yOkXiGEUtyQ
h6Q3tzvXXBEMCpAmZx9OthnI0nK8gWvEsBOTYnRQVW0WceGm/YQ6nTS51FvBGREb
qHRq5kvH0+3//z9eQqVI36R2mcH+SMvPyboigAwhk/zcBc0t33XD8gCospGL2AKo
Tmt2TEqACbBNcMWZjlMdNLXmksDkX+VgKgiPWivJwUS9NuW4rJVZ3bZWUQ2oxgZo
rznVpw0sUtTca+IHWumkelaj7n8AI6fi+Mpb65uEKHmm7UgUbNnosbx9L1tINfbm
ihsnAUY15YTAlx+cd5HasH0AoKLqahqkLcnbRSyvr9VHp1obR7p2wwUldMY0aE8M
5oUUFrSWypqpYsAb1Ilnzmy8VoMJ3uMvIKDxDTgnUdlfd1ZAglad9LqayE0hVKZz
QRz5fk2bPTKCGjwS/KIjE5BTQcU31v3u5x5a8aFP1TzS3podAMwj7LL7mGX1YYK0
iWw4eh7RZyvpqJtK/6V6ATutVpxBWEVBL+LzXZcvfJM/xJ0bToU=
=kibH
-----END PGP SIGNATURE-----

--Sig_/XnLpS6BEHIgNx7wDFe4ff.T--
