Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 44E287D0CFB
	for <lists+dri-devel@lfdr.de>; Fri, 20 Oct 2023 12:18:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C6BBD10E597;
	Fri, 20 Oct 2023 10:18:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x22a.google.com (mail-lj1-x22a.google.com
 [IPv6:2a00:1450:4864:20::22a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B10E710E593;
 Fri, 20 Oct 2023 10:18:05 +0000 (UTC)
Received: by mail-lj1-x22a.google.com with SMTP id
 38308e7fff4ca-2c50cd16f3bso8863601fa.2; 
 Fri, 20 Oct 2023 03:18:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1697797084; x=1698401884; darn=lists.freedesktop.org;
 h=mime-version:references:in-reply-to:message-id:subject:cc:to:from
 :date:from:to:cc:subject:date:message-id:reply-to;
 bh=AmJvmP3Ju2/BOfbHARIYHBe7d8HhmZ5yDYF0oaZNQic=;
 b=a+Rhh/sQTUjrZfF1hHCYPX5kX9QSBC3Rnz6Qk3o2OI0mHZRRO+szwpSuRiMj3WTe/7
 4DKjZCciduha7fJq3a6MCxhNYs8DALtIGeMncQ34bb9PD6JRaQB+tUHGyXBlPvmeAQrr
 cd9NvXq1Dc6LTrxLX9ZQCEelGzlCw8VRBhSzORuJ/f79n9sJ6HLYDMCYaMuk/ToJG8T9
 yKamkjmIg+VPFu61dDMGDDBDCO3yN6np4tfCiL8BVJ7X2VxVYHHl04iDUvI4p+ui0DFs
 /Dv1pLvuExoUN2rNo09kP/qZ/Bc5MpXw94408xnHX/CC6p7YVKN0eA4lAXrKhi2t7SB8
 F7QA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1697797084; x=1698401884;
 h=mime-version:references:in-reply-to:message-id:subject:cc:to:from
 :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=AmJvmP3Ju2/BOfbHARIYHBe7d8HhmZ5yDYF0oaZNQic=;
 b=dHFwxhDXMElXty3z6i3j1hmd4z/CfpPRYIO+NebYdFBp9HXoMcmtMTLN4h3Xm5uPKn
 YEs7lim6IFKjst06VJmnHamV2ujwpLZkIA2rz/BJkuQRcBfte0IKoPG8j6hKZR/0NyhH
 Tpiwbl7ogtJDMOxI1MH5xFPAMl8cMUZiKtVMu9Fu0bdGdL5LnQ5+Bs+aYZiKtq5MhVkL
 vkz8FSnI39otLT0ICL9VkCjYiqPIB45DsCAL/u9hAaaGvz0MINfiS6WyxeNtp41eJ7oA
 iCV3R3MuXiZgvOyk4MpImV3O9+c92bHbV55oIhR9iAYic2klUVbV8E7ic678VOzjOUVO
 XhYA==
X-Gm-Message-State: AOJu0Yz4t8B/ui+UiJpuvgnRR+Ch9iaohlQrDZrdSNeqxY1mdGZW/chh
 TGs/dFKLdsUQMtss+JhdzcU=
X-Google-Smtp-Source: AGHT+IF1I3tHyZPn2bU8qNlZuzOoOD7t/HDM9kPfx1Sq+4bRQ0A8R62nkbJqDNcaNH1MmUfMz9TsJw==
X-Received: by 2002:a2e:b6ce:0:b0:2c0:2b93:884c with SMTP id
 m14-20020a2eb6ce000000b002c02b93884cmr1146654ljo.29.1697797083059; 
 Fri, 20 Oct 2023 03:18:03 -0700 (PDT)
Received: from eldfell ([194.136.85.206]) by smtp.gmail.com with ESMTPSA id
 p13-20020a2ea4cd000000b002c01ff8442fsm305566ljm.130.2023.10.20.03.18.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 20 Oct 2023 03:18:02 -0700 (PDT)
Date: Fri, 20 Oct 2023 13:17:52 +0300
From: Pekka Paalanen <ppaalanen@gmail.com>
To: Harry Wentland <harry.wentland@amd.com>
Subject: Re: [RFC PATCH 01/10] drm/doc/rfc: Describe why prescriptive color
 pipeline is needed
Message-ID: <20231020131752.488932a0@eldfell>
In-Reply-To: <04754060-8f1c-4bf1-91bb-2e0305339b1c@amd.com>
References: <20230908150235.75918-1-harry.wentland@amd.com>
 <20230908150235.75918-2-harry.wentland@amd.com>
 <20230913142902.31a51b46@eldfell>
 <04754060-8f1c-4bf1-91bb-2e0305339b1c@amd.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/pA/t=1X01+zfjZzVPlsYZpu";
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

--Sig_/pA/t=1X01+zfjZzVPlsYZpu
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Thu, 19 Oct 2023 10:56:29 -0400
Harry Wentland <harry.wentland@amd.com> wrote:

> On 2023-09-13 07:29, Pekka Paalanen wrote:
> > On Fri, 8 Sep 2023 11:02:26 -0400
> > Harry Wentland <harry.wentland@amd.com> wrote:
> >  =20
> >> Signed-off-by: Harry Wentland <harry.wentland@amd.com>

...

> >> +COLOR_PIPELINE Plane Property
> >> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D
> >> +
> >> +Because we don't have existing KMS color properties in the pre-blendi=
ng
> >> +portion of display pipelines (i.e. on drm_planes) we are introducing
> >> +color pipelines here first. Eventually we'll want to use the same
> >> +concept for the post-blending portion, i.e. drm_crtcs. =20
> >=20
> > This paragraph might fit better in a cover letter.
> >  =20
> >> +
> >> +Color Pipelines are created by a driver and advertised via a new
> >> +COLOR_PIPELINE enum property on each plane. Values of the property
> >> +always include '0', which is the default and means all color processi=
ng
> >> +is disabled. Additional values will be the object IDs of the first
> >> +drm_colorop in a pipeline. A driver can create and advertise none, on=
e,
> >> +or more possible color pipelines. A DRM client will select a color
> >> +pipeline by setting the COLOR PIPELINE to the respective value.
> >> +
> >> +In the case where drivers have custom support for pre-blending color
> >> +processing those drivers shall reject atomic commits that are trying =
to
> >> +set both the custom color properties, as well as the COLOR_PIPELINE =
=20
> >=20
> > s/set/use/ because one of them could be carried-over state from
> > previous commits while not literally set in this one.
> >  =20
> >> +property.
> >> +
> >> +An example of a COLOR_PIPELINE property on a plane might look like th=
is::
> >> +
> >> +    Plane 10
> >> +    =E2=94=9C=E2=94=80 "type": immutable enum {Overlay, Primary, Curs=
or} =3D Primary
> >> +    =E2=94=9C=E2=94=80 =E2=80=A6
> >> +    =E2=94=94=E2=94=80 "color_pipeline": enum {0, 42, 52} =3D 0 =20
> >=20
> > Enum values are string names. I presume the intention here is that the
> > strings will never need to be parsed, and the uint64_t is always equal
> > to the string representation, right?
> >=20
> > That needs a statement here. It differs from all previous uses of
> > enums, and e.g. requires a little bit of new API in libweston's
> > DRM-backend to handle since it has its own enums referring to the
> > string names that get mapped to the uint64_t per owning KMS object.
> >  =20
>=20
> I'm currently putting the DRM object ID in the "value" and use the
> "name" as a descriptive name.

Would that string name be UAPI? I mean, if userspace hardcodes and
looks for that name, will that keep working? If it's descriptive then I
would assume not, but for every enum existing so far the string name is
UAPI.

> > struct drm_mode_property_enum {
> > 	__u64 value;
> > 	char name[DRM_PROP_NAME_LEN];
> > }; =20
>=20
> This works well in IGT and gives us a nice descriptive name for
> debugging, but I could consider changing this if it'd simplify
> people's lives.

It's nice if we can have a description string for each pipeline, but
according to KMS UAPI conventions so far, userspace would look for the
string name. I'm worried that could backfire to the kernel.

Or, maybe we do want to make the string UAPI and accept that some
userspace might look for it rather than an arrangement of colorops?

Matching colorop sequences is "hard". A developer looking at pipelines,
picking one, and hardcoding its name as a preferred choice would be too
easy. "Works for my cards." IOW, if there is a useful looking string
name, we can be sure that someone will depend on it.


Thanks,
pq

> >> +References
> >> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> >> +
> >> +1. https://lore.kernel.org/dri-devel/QMers3awXvNCQlyhWdTtsPwkp5ie9bze=
_hD5nAccFW7a_RXlWjYB7MoUW_8CKLT2bSQwIXVi5H6VULYIxCdgvryZoAoJnC5lZgyK1QWn488=
=3D@emersion.fr/
> >> \ No newline at end of file =20
> >  =20
>=20


--Sig_/pA/t=1X01+zfjZzVPlsYZpu
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEJQjwWQChkWOYOIONI1/ltBGqqqcFAmUyU9AACgkQI1/ltBGq
qqeIaRAAregoXo1oYMQaa4whPhvswmrqR8sGpedi1so9jjeOlhpA6oS5WaRdETqt
6nGBBcnUbIb2jwcNwKv3S6vtd8/R3gbneTKeosSWFH7qAbEHWtrWeXmaI1yVwjVx
9t+ZEa616zz2Zh3sIzLB+7uadDWEgSVquO/EmUFN28r4+yYtFDUsE11eZLqH0f0S
t7NcMJQdMnLPwtzZAaUPVGyVPhgv/rsHC60vB/juFgWa4TlDjWDww8lTZ7EbZVJv
sZ2Dhg9I6JDKTOh0u6hdpo4Ona7O7MGmnLRir30uOuCxWh79pyOLuBfJ2lQGzc1g
48FeGQG5wzDjwnF/ZavLvlb1Dde0z+fAMIfjuTZx1zhhHbyCuqvbm+TJL4yPJYrg
tnQydFEPzut8tvu28rvOop34BYZCNiaRdsG68Hc8TMUMXUBytsyU+rKNQoAC5iO3
PlBMeGV3D/X7rzL97H+mqL+GMf6kiFkq06gLW6FeEcUo9DIKRxGJCDZtUEuj2e2n
/xRitU3YfD5YwQM/fw/uldTWwyR+nIo2Qk2+rGsHgXNdulVC6/cAahw+q7ZyoTxq
s8nhAEC6WpxwqPLoXz89daQ0epN75pKIX5xfmkIullNbmVF8aLKMwkCkWIrKLcwp
6YaBzAscpH9rO0FjW9QAQ2Pun5DeykEM1Dl0Yo0yo0Ll2CqxEaE=
=QJUs
-----END PGP SIGNATURE-----

--Sig_/pA/t=1X01+zfjZzVPlsYZpu--
