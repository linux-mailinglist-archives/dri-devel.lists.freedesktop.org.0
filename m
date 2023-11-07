Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 487327E37F8
	for <lists+dri-devel@lfdr.de>; Tue,  7 Nov 2023 10:38:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D7C0F10E4F8;
	Tue,  7 Nov 2023 09:38:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com
 [IPv6:2a00:1450:4864:20::12d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AA7A210E4F8;
 Tue,  7 Nov 2023 09:38:48 +0000 (UTC)
Received: by mail-lf1-x12d.google.com with SMTP id
 2adb3069b0e04-50797cf5b69so7132156e87.2; 
 Tue, 07 Nov 2023 01:38:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1699349927; x=1699954727; darn=lists.freedesktop.org;
 h=mime-version:references:in-reply-to:message-id:subject:cc:to:from
 :date:from:to:cc:subject:date:message-id:reply-to;
 bh=/K5pzRlXXfbxcPSGLE7pYoCCDi3B1t3FvoM1zXHkgvs=;
 b=ADoniatHUQ5V5ooWQwL6Xves4zjGhcgyu4FieX+asvzNe73ERZgRNNRSt3uDibJy3x
 r9RZV1AfyAx+RGZdrxv8ylztPYZ8JKLaSBm8gqy6lcWu+Yl95gyjW05SXRKMCZdija3B
 UV0f7kFv//70C3GiIsCmnom4+ZghAQ1W9KYjlH7XS0yLEsM13vB1TakjyMWsqXauJ5F8
 Fngk/19kjFRo3MlDKWPqZ165K8QTWqFrWjY1G2YHOeXZg28j993kw6EtOt5kp+0iyrhP
 WKrAdG+/MerYbe0zTyLAS32aFK9+YwBI6QEJq1Kkyay3Zjj+Y5/8OJcvF3C1i6hKv5JL
 SK6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1699349927; x=1699954727;
 h=mime-version:references:in-reply-to:message-id:subject:cc:to:from
 :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=/K5pzRlXXfbxcPSGLE7pYoCCDi3B1t3FvoM1zXHkgvs=;
 b=L/vXvEjHApPL7blx5IJYXOlLizDv7ujGXy4+vkhBmU9LfQXeyfm0Zh1DaP39KzhYRp
 Y6wo0whe2YjR3BnCsftQAjRX8yXtqnGKrbwJBsBX3Y/DpH8ekHAt/9PbV8cgVgYXwjo5
 7ZuHluRw6x/Rv8we4e87fkdfzymVkiD0tLBzcAXchgU7CkwKiW4Y0PprdHsTf4WQRwQC
 TMOK0yCl5DWVBk2MeKyhSyhjzUZfUPwG0G3NxtMETeLApxfYsK7w/mRW3e0XRYSq/sCE
 7Me/DZGIVwQMVOm9jrXkQ891BghpvkRJbIcihu7J4JoFIKM939vggTbwlm03mu9oYW82
 Nj4g==
X-Gm-Message-State: AOJu0YzfH0i3+u0FOAuHp6YYBr9z1y3Tcjf47PX10yyHyvvWNHMxnLBF
 n6To+lzaqtS2HpskFc9Dv9o=
X-Google-Smtp-Source: AGHT+IEVT+8JyEu5tzOyNGy/iRUnwSr4K3ZwvadGXKlCGggVTSqxPoz46KPdyrVBiLZbbj5azoxlrw==
X-Received: by 2002:a05:6512:483:b0:509:4709:2104 with SMTP id
 v3-20020a056512048300b0050947092104mr11469181lfq.67.1699349926253; 
 Tue, 07 Nov 2023 01:38:46 -0800 (PST)
Received: from eldfell ([194.136.85.206]) by smtp.gmail.com with ESMTPSA id
 u10-20020ac248aa000000b004fe1f1c0ee4sm292300lfg.82.2023.11.07.01.38.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Nov 2023 01:38:45 -0800 (PST)
Date: Tue, 7 Nov 2023 11:38:32 +0200
From: Pekka Paalanen <ppaalanen@gmail.com>
To: Harry Wentland <harry.wentland@amd.com>
Subject: Re: [RFC PATCH 01/10] drm/doc/rfc: Describe why prescriptive color
 pipeline is needed
Message-ID: <20231107113832.79f38104@eldfell>
In-Reply-To: <62d31e98-39e6-4c57-9495-d2cf169a6ab4@amd.com>
References: <20230908150235.75918-1-harry.wentland@amd.com>
 <20230908150235.75918-2-harry.wentland@amd.com>
 <20230913142902.31a51b46@eldfell>
 <04754060-8f1c-4bf1-91bb-2e0305339b1c@amd.com>
 <20231020131752.488932a0@eldfell>
 <62d31e98-39e6-4c57-9495-d2cf169a6ab4@amd.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/Uv0QocgLWCu0nkO01tulCoz";
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
Cc: Shashank Sharma <shashank.sharma@amd.com>,
 Sebastian Wick <sebastian.wick@redhat.com>, dri-devel@lists.freedesktop.org,
 Xaver Hugl <xaver.hugl@gmail.com>, Melissa Wen <mwen@igalia.com>,
 Michel =?UTF-8?B?RMOkbnplcg==?= <mdaenzer@redhat.com>,
 Jonas =?UTF-8?B?w4VkYWhs?= <jadahl@redhat.com>,
 Victoria Brekenfeld <victoria@system76.com>, Aleix Pol <aleixpol@kde.org>,
 Naseer Ahmed <quic_naseer@quicinc.com>, wayland-devel@lists.freedesktop.org,
 Christopher Braga <quic_cbraga@quicinc.com>,
 Uma Shankar <uma.shankar@intel.com>, Joshua Ashton <joshua@froggi.es>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--Sig_/Uv0QocgLWCu0nkO01tulCoz
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Mon, 6 Nov 2023 11:24:50 -0500
Harry Wentland <harry.wentland@amd.com> wrote:

> On 2023-10-20 06:17, Pekka Paalanen wrote:
> > On Thu, 19 Oct 2023 10:56:29 -0400
> > Harry Wentland <harry.wentland@amd.com> wrote:
> >  =20
> >> On 2023-09-13 07:29, Pekka Paalanen wrote: =20
> >>> On Fri, 8 Sep 2023 11:02:26 -0400
> >>> Harry Wentland <harry.wentland@amd.com> wrote:
> >>>    =20
> >>>> Signed-off-by: Harry Wentland <harry.wentland@amd.com> =20
> >=20
> > ...
> >  =20
> >>>> +COLOR_PIPELINE Plane Property
> >>>> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D
> >>>> +
> >>>> +Because we don't have existing KMS color properties in the pre-blen=
ding
> >>>> +portion of display pipelines (i.e. on drm_planes) we are introducing
> >>>> +color pipelines here first. Eventually we'll want to use the same
> >>>> +concept for the post-blending portion, i.e. drm_crtcs.   =20
> >>>
> >>> This paragraph might fit better in a cover letter.
> >>>    =20
> >>>> +
> >>>> +Color Pipelines are created by a driver and advertised via a new
> >>>> +COLOR_PIPELINE enum property on each plane. Values of the property
> >>>> +always include '0', which is the default and means all color proces=
sing
> >>>> +is disabled. Additional values will be the object IDs of the first
> >>>> +drm_colorop in a pipeline. A driver can create and advertise none, =
one,
> >>>> +or more possible color pipelines. A DRM client will select a color
> >>>> +pipeline by setting the COLOR PIPELINE to the respective value.
> >>>> +
> >>>> +In the case where drivers have custom support for pre-blending color
> >>>> +processing those drivers shall reject atomic commits that are tryin=
g to
> >>>> +set both the custom color properties, as well as the COLOR_PIPELINE=
   =20
> >>>
> >>> s/set/use/ because one of them could be carried-over state from
> >>> previous commits while not literally set in this one.
> >>>    =20
> >>>> +property.
> >>>> +
> >>>> +An example of a COLOR_PIPELINE property on a plane might look like =
this::
> >>>> +
> >>>> +    Plane 10
> >>>> +    =E2=94=9C=E2=94=80 "type": immutable enum {Overlay, Primary, Cu=
rsor} =3D Primary
> >>>> +    =E2=94=9C=E2=94=80 =E2=80=A6
> >>>> +    =E2=94=94=E2=94=80 "color_pipeline": enum {0, 42, 52} =3D 0   =
=20
> >>>
> >>> Enum values are string names. I presume the intention here is that the
> >>> strings will never need to be parsed, and the uint64_t is always equal
> >>> to the string representation, right?
> >>>
> >>> That needs a statement here. It differs from all previous uses of
> >>> enums, and e.g. requires a little bit of new API in libweston's
> >>> DRM-backend to handle since it has its own enums referring to the
> >>> string names that get mapped to the uint64_t per owning KMS object.
> >>>    =20
> >>
> >> I'm currently putting the DRM object ID in the "value" and use the
> >> "name" as a descriptive name. =20
> >=20
> > Would that string name be UAPI? I mean, if userspace hardcodes and
> > looks for that name, will that keep working? If it's descriptive then I
> > would assume not, but for every enum existing so far the string name is
> > UAPI.
> >  =20
>=20
> Yes, it's UAPI, as that's how userspace will set the property. The value
> is still important to be able to find out which is the first colorop in
> the pipeline.

Userspace will hardcode string names, look up the KMS uint64_t
corresponding to it, and then use the uint64_t to program KMS.

But for color pipeline objects, the initial idea was that we expect
userspace to look through all available pipelines and see if any of
them can express what userspace wants. This does not need the string
name to be UAPI per se.

Of course, it is easier if userspace can be hardcoded for a specific
color pipeline, so all that matching and searching is avoided, but as a
driver developer, do you want that?

Or maybe the practical end result is the same regardless, because if a
driver removes a pipeline on specific hardware and userspace cannot
find another, that would be a kernel regression anyway.

Then again, if userspace doesn't do the matching and searching, it'll
likely struggle to work on different hardware. Driver developers would
get requests to expose this and that specific pipeline. Is that an ok
prospect?


Thanks,
pq


> >>> struct drm_mode_property_enum {
> >>> 	__u64 value;
> >>> 	char name[DRM_PROP_NAME_LEN];
> >>> };   =20
> >>
> >> This works well in IGT and gives us a nice descriptive name for
> >> debugging, but I could consider changing this if it'd simplify
> >> people's lives. =20
> >=20
> > It's nice if we can have a description string for each pipeline, but
> > according to KMS UAPI conventions so far, userspace would look for the
> > string name. I'm worried that could backfire to the kernel.
> >=20
> > Or, maybe we do want to make the string UAPI and accept that some
> > userspace might look for it rather than an arrangement of colorops?
> >=20
> > Matching colorop sequences is "hard". A developer looking at pipelines,
> > picking one, and hardcoding its name as a preferred choice would be too
> > easy. "Works for my cards." IOW, if there is a useful looking string
> > name, we can be sure that someone will depend on it.
> >=20
> >=20
> > Thanks,
> > pq
> >  =20
> >>>> +References
> >>>> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> >>>> +
> >>>> +1. https://lore.kernel.org/dri-devel/QMers3awXvNCQlyhWdTtsPwkp5ie9b=
ze_hD5nAccFW7a_RXlWjYB7MoUW_8CKLT2bSQwIXVi5H6VULYIxCdgvryZoAoJnC5lZgyK1QWn4=
88=3D@emersion.fr/
> >>>> \ No newline at end of file   =20
> >>>    =20
> >> =20
> >  =20
>=20


--Sig_/Uv0QocgLWCu0nkO01tulCoz
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEJQjwWQChkWOYOIONI1/ltBGqqqcFAmVKBZgACgkQI1/ltBGq
qqfc6w/7BWstLssPr487G2RX+U3QHqeJq7Wvqrl0Dinay06MTxk72Cz+ARDlhfrz
mUq1x1sK5+SHMe23hGavQ+KwRImQ7BRVNgKcjwieFt1EGA4W2mCUle1L86yjZkAb
1/ZEJMXzwT6j1fAIZlUcl+tg3iBlchiRqzzMIgA8a9wPsV+K5RvMHh8nJu6BXttw
3zEFyYpM0KLt8jzxC5cjhkiGNH7Of15fyMiQU4B2yPh3F/Sa5D1iQNXYH6ZF8aXa
zdStQuX8NV1vYDdcGLT610V40mA5VBoSx/XMhgD214UMxCqR38CUBkH/zYg1yDll
/HcaMrwVjWJRoPyEP0aPaaZcejfV8Qq3+UEwiNJ4SC2UNuhjEtTzDe+9VOXtHyqV
znf7WgosObeX2xb93P4aO3OZP1oiTPLzhanpkbOv/2o9aSSIOoH66UMMJV0zKjcU
30/xhuuP6ORhC6ryTSXFrifNstziOjXswTfr74tsgrCTC70MC61ED8u448YnL+RE
B8r39MPhAufa9PqU7ulJlL48LknD3vFWzU7Pbj4xIlRKQgVyBc3mfx+rbiZzHht1
UPkslyezTs+dqGdkrKp5ILg0jJfSvKIXgwy5uanuRxZBAW60xDBrTXNU32FPfjqx
I9wSesKmSQ0qQliVqR6FdIApCLahyePFUwxFH7EQOyGxf/jEKnE=
=ctCd
-----END PGP SIGNATURE-----

--Sig_/Uv0QocgLWCu0nkO01tulCoz--
