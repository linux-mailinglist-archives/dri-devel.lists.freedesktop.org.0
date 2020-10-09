Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 631CD2886DF
	for <lists+dri-devel@lfdr.de>; Fri,  9 Oct 2020 12:28:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 856CC6ECB4;
	Fri,  9 Oct 2020 10:28:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x242.google.com (mail-lj1-x242.google.com
 [IPv6:2a00:1450:4864:20::242])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9051F6ECB4
 for <dri-devel@lists.freedesktop.org>; Fri,  9 Oct 2020 10:28:13 +0000 (UTC)
Received: by mail-lj1-x242.google.com with SMTP id f21so9096878ljh.7
 for <dri-devel@lists.freedesktop.org>; Fri, 09 Oct 2020 03:28:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:in-reply-to:references
 :mime-version; bh=r94ES55Njl3VlHnx9Iq9ROOriHZ0I5RWG9etocVzmes=;
 b=SswIlWyeMjfemLtd9JgLN/6jAMuBKxQzu2/vILPuzw4NbdL0uJT7oBzpi2Qi/Bosxl
 aXMXaZ4MF19S6L469+wMxhmaTuJ60hAhe2NPW2w6Rf9+MRbpSjKc7bJC+SWlRh8vPepd
 deelNdhnzdiUQZp4qlnpUV+nOQ+FG8dTgUlW9k1pz1xH49aY5PS2tCGFfvqWU6sGQXJc
 RLyYHvtaIE5C8uyj1KTWh5Q19cz1rIfvk59TFp1DSoM0V6V1ukchW93BNkVGA6ncRANI
 IA+HIFK3YAmOsOcz69C3MXVcIIMcwbr6aQzMA+FZfb7N4B76Ser5wsVXKutu7Dz7VBj0
 Quew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:mime-version;
 bh=r94ES55Njl3VlHnx9Iq9ROOriHZ0I5RWG9etocVzmes=;
 b=sWbaO9+tjDLLvlSw8OlCoJMC00vKbkU2QTgNXJ7RE+tH8SP2AItLhVyT/+4jHebNIx
 k0uCjxy7o05YoPqgbkbW24utiDZXjJTPvORpq3+ky+E9vKP6hmzQ2HWN+u7zT/Z8Jwt2
 33WZwcuZFyy+gPguCsXVpLTMbOPhUXhRyt4DXUCt2zt1n304yrT9H2h+ctwf+dqpilKZ
 9+ai+aD5qbXHL4L7gMCYgAtq8BG/SSsEJh1Qy72XbbpSVIhw7wA+LC0fNqI9KiNfP4pQ
 KTKS/Cvtxyr7R2tETfKsQjJsOJv/3OeUyNcAKMLZrY89qKusT949QuHGREfpPNaodLc5
 +eGg==
X-Gm-Message-State: AOAM531HdSSk8esHXFqBDmTRqy/RHAzZKSCJiVpHwNc7IPZmk0wV8Ruk
 VsTsO4Ctqh6bfVKS0qZtaGg=
X-Google-Smtp-Source: ABdhPJxnMxa0gOi3rgcaVdtYTTM+NDNBNG5bA0CWLCpDB47G9Rf3moeToaOcFXPoNY5Knw6g0hDSsQ==
X-Received: by 2002:a2e:22c1:: with SMTP id i184mr4709296lji.384.1602239291961; 
 Fri, 09 Oct 2020 03:28:11 -0700 (PDT)
Received: from eldfell ([194.136.85.206])
 by smtp.gmail.com with ESMTPSA id g184sm448682lfd.257.2020.10.09.03.28.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 09 Oct 2020 03:28:11 -0700 (PDT)
Date: Fri, 9 Oct 2020 13:28:02 +0300
From: Pekka Paalanen <ppaalanen@gmail.com>
To: Thomas Zimmermann <tzimmermann@suse.de>, Simon Ser <contact@emersion.fr>
Subject: Re: [PATCH] drm: document that user-space should avoid parsing EDIDs
Message-ID: <20201009132802.55076194@eldfell>
In-Reply-To: <eeaa5946-b77f-786e-1857-25ce708ba2e7@suse.de>
References: <izOAkOJk67APzk9XP_DhUGr5Nvo_KwmIXlGQhiL101xxttvMO3K1DUdEQryIFXe2EjG16XGuc_YPMlTimZjqePYR3dB0m4Xs4J8Isa3mBAI=@emersion.fr>
 <eeaa5946-b77f-786e-1857-25ce708ba2e7@suse.de>
X-Mailer: Claws Mail 3.17.3 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
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
Cc: Daniel Vetter <daniel.vetter@intel.com>, dri-devel@lists.freedesktop.org
Content-Type: multipart/mixed; boundary="===============0575292996=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--===============0575292996==
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/ftPDXU+k.T+sZgyw/de9vJV"; protocol="application/pgp-signature"

--Sig_/ftPDXU+k.T+sZgyw/de9vJV
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Fri, 9 Oct 2020 11:48:44 +0200
Thomas Zimmermann <tzimmermann@suse.de> wrote:

> Hi
>=20
> Am 09.10.20 um 11:24 schrieb Simon Ser:
> > User-space should avoid parsing EDIDs for metadata already exposed via
> > other KMS interfaces and properties. For instance, user-space should not
> > try to extract a list of modes from the EDID: the kernel might mutate
> > the mode list (because of link capabilities or quirks for instance).
> >=20
> > Other metadata not exposed by KMS can be parsed by user-space. This
> > includes for instance monitor identification (make/model/serial) and
> > supported color-spaces.
> >=20
> > Signed-off-by: Simon Ser <contact@emersion.fr>
> > Suggested-by: Daniel Vetter <daniel.vetter@intel.com>
> > Cc: Daniel Vetter <daniel.vetter@intel.com>

Reviewed-by: Pekka Paalanen <pekka.paalanen@collabora.com>

> > Cc: Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.com>
> > ---
> >  drivers/gpu/drm/drm_connector.c | 4 ++++
> >  1 file changed, 4 insertions(+)
> >=20
> > diff --git a/drivers/gpu/drm/drm_connector.c b/drivers/gpu/drm/drm_conn=
ector.c
> > index 717c4e7271b0..00e58fd2d292 100644
> > --- a/drivers/gpu/drm/drm_connector.c
> > +++ b/drivers/gpu/drm/drm_connector.c
> > @@ -960,6 +960,10 @@ static const struct drm_prop_enum_list dp_colorspa=
ces[] =3D {
> >   * 	drm_connector_update_edid_property(), usually after having parsed
> >   * 	the EDID using drm_add_edid_modes(). Userspace cannot change this
> >   * 	property.
> > + *
> > + * 	User-space should not parse the EDID to obtain information exposed=
 via
> > + * 	other KMS properties. For instance, user-space should not try to p=
arse
> > + * 	mode lists from the EDID. =20
>=20
> Acked-by: Thomas Zimmermann <tzimmermann@suse.de>
>=20
> But this makes me wonder why the kernel exposes raw EDID in the first
> place. Wouldn't it be better to expose meaningful fields (display model,
> vendor, etc) instead?

There are many EDID bits of information that the kernel has no use
for. EDID specifications and extensions also continually evolve.

If the kernel set out to expose all information EDID may encode, what
should the UAPI look like? How do you keep the UAPI maintainable and
extendable?

Why should the kernel parse information it has no use for itself at
all? For example: RGB and white-point chromaticities, or maximum HDR
luminance.

That seems quite a lot of continuous work for a benefit I'm not sure I
see when compared to just handing the EDID blob to userspace and let
userspace parse the things the kernel does not expose already.

What we do need is a userspace EDID parsing library. This was discussed
in #dri-devel IRC today as well.


Thanks,
pq

--Sig_/ftPDXU+k.T+sZgyw/de9vJV
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEJQjwWQChkWOYOIONI1/ltBGqqqcFAl+AOzIACgkQI1/ltBGq
qqcdXRAAh2nJSZ6l3k75BB3MDUj6q8VuFpc0c8jUZztxRTFFiMniBMIUam130uQG
kL18vQSF74YSpWJHS6jupwi4fAJfI2RK7W6Lzt+M15OmXOybKhyKAj3Xf+LSkf+D
Ui0OHNneWckUTbxzaAgbNsp+wGCkNz1rMlUZe6RW/oG7ZyLqBJHJt+/rOBFnYAgL
yS3MO59UwOxuCTfzwhP/w2bI3HvBWeY98H77FBTJjibIrr8lii5vn8zO4MmbFAPM
I8w9MqVN0thfDeOXFFpps9FnLQODk9rzbufsztouD5Sw+rKJ3HHn7bj9gugJQnJS
enNUe0uqfo7GdTAtmr0rCUFwa8zxpWaCyDJDs297wpQ6ENNMRVfDBbRNlK6l7MEF
kN5bryOtwnI7JUG/ej7hAybl831C+ietBmLk0+DN5iHTXpe/Tz9T6Gd9BRyO9Pyu
nxEkPDPiFfWnJHZdKgQBeLw2gm7RB//GhaLyLy3gauS31u6C5syBiJPPWh+UmEUH
GbLcN9cnL+4GWJqsV6BZte9Cr1TSwmmU/7Jlm88Y26vN7ZLqqTTLXcw90MRrRAOF
89TebofHX7Jb+0egHvU/pxCmNwzvxFnwoJzZf8ZvcbrlCX6vfvlZVHxhTf7jAbT/
MsE4F/YpDYgI9BWv1vFGA7ZxnFdSl/gJaZRdGmq2r6EQCnzKlIA=
=x5K9
-----END PGP SIGNATURE-----

--Sig_/ftPDXU+k.T+sZgyw/de9vJV--

--===============0575292996==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============0575292996==--
