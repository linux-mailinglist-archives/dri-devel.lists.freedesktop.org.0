Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C52938739F
	for <lists+dri-devel@lfdr.de>; Tue, 18 May 2021 09:56:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DBFFC6E845;
	Tue, 18 May 2021 07:56:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com
 [IPv6:2a00:1450:4864:20::132])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A52D16E824;
 Tue, 18 May 2021 07:56:27 +0000 (UTC)
Received: by mail-lf1-x132.google.com with SMTP id v8so7758303lft.8;
 Tue, 18 May 2021 00:56:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:in-reply-to:references
 :mime-version; bh=O/RVTlN+qK7tpwMAHpfGm3EdGQUEbo1mlKVpytXKUzg=;
 b=WgFxOYnStWRxRJ8fKJ+sOrYoU/9ckq/nLhvQDySYbEArjDVB5BsOZuUyo0NiKBJmq1
 04E20/UPPaSquUN8Mf6+97n7+Z0Cv5TeVMYcZm8TKXL/59OZsYmQEkB0ygJYI2HodOMa
 HugVHAa9V0XKuiiZmFMmNlTaFl6wqsoBy6ux+m5hbz9gn1jZClMWW8rj8r7SN7yRyq1M
 bzh54G3kQdfRkdQoNBfBQcx9ChnWDIw6+RFADcgRzeXJTcX7yomfVYe7O76Mz7dWzF80
 tO0xwSI1aYQCiR7Xwnw3GLhv6TF1oIhToAVEHMqNkb9WRv5KrjGGkIMg6/DEhcNHW0pt
 9Cew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:mime-version;
 bh=O/RVTlN+qK7tpwMAHpfGm3EdGQUEbo1mlKVpytXKUzg=;
 b=IKJyBQ+qSLA8lZWpcjPXuHOhgTr/LZplYe+5InXDClVbiIVqGhTE7Fx510iftfc0/k
 WXgfalUGtjPBYgkD0ru8gzquNA93OUWoVDUjtwSLrbC9jmpqp6QrjSfpnruWtzMZJCw1
 XL4M1IB7ryM6WDrI421wHMJAfjPyMpjdYf2lmuB8ZAKqfOWqdJRJpkg/L8QwU3NTx/NE
 AzpEoO6f1EOoUrasuqMUg4V+47aqEw0qCiDzo3InQRK4yb+QYiCOjqPVDx7crMy/HDh0
 CvJwwWNiNpsWqwITCDY7d7VXvs6RyIkUmIJf5lY+exz5ewwfJU7LZ5h4PRUC3i2MfZ//
 /9LA==
X-Gm-Message-State: AOAM533FX2mcIRxFLbi1h4anRksDB+03w8nhNpq4SDeb20NjhMt4MzAK
 mZxq2JBGQI3xrg+dOBfhcf8=
X-Google-Smtp-Source: ABdhPJwK1BLmg4u695NsInrdxNGgFr/wf4Ok/rIUM1c5s/z+ccu8eJwqjzCd3AsPd987CmOXTY1bKg==
X-Received: by 2002:a05:6512:1083:: with SMTP id
 j3mr3280702lfg.645.1621324586007; 
 Tue, 18 May 2021 00:56:26 -0700 (PDT)
Received: from eldfell ([194.136.85.206])
 by smtp.gmail.com with ESMTPSA id p11sm293241lfu.51.2021.05.18.00.56.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 18 May 2021 00:56:25 -0700 (PDT)
Date: Tue, 18 May 2021 10:56:15 +0300
From: Pekka Paalanen <ppaalanen@gmail.com>
To: Vitaly Prosyak <vitaly.prosyak@amd.com>, Harry Wentland
 <harry.wentland@amd.com>
Subject: Re: [RFC PATCH 0/3] A drm_plane API to support HDR planes
Message-ID: <20210518105615.212b84e4@eldfell>
In-Reply-To: <b0834be8-9023-0fde-f15d-8c44f72e7702@amd.com>
References: <20210426173852.484368-1-harry.wentland@amd.com>
 <20210427175005.5b92badc@eldfell>
 <e51a3067-a0b3-16e4-5996-bd8527b7536b@amd.com>
 <20210517115726.4fc1c710@eldfell>
 <5f6abaaa45bb7f77110d9f87c9824e3f@sebastianwick.net>
 <b0834be8-9023-0fde-f15d-8c44f72e7702@amd.com>
X-Mailer: Claws Mail 3.17.3 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/.now01zdmP_040aHYgZGSM4"; protocol="application/pgp-signature"
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
Cc: Deepak.Sharma@amd.com, Krunoslav.Kovac@amd.com, mcasas@google.com,
 Shashank.Sharma@amd.com, dri-devel@lists.freedesktop.org, Shirish.S@amd.com,
 Sebastian Wick <sebastian@sebastianwick.net>, hersenxs.wu@amd.com,
 amd-gfx@lists.freedesktop.org, laurentiu.palcu@oss.nxp.com,
 Bhawanpreet.Lakha@amd.com, Nicholas.Kazlauskas@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--Sig_/.now01zdmP_040aHYgZGSM4
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Mon, 17 May 2021 15:39:03 -0400
Vitaly Prosyak <vitaly.prosyak@amd.com> wrote:

> On 2021-05-17 12:48 p.m., Sebastian Wick wrote:
> > On 2021-05-17 10:57, Pekka Paalanen wrote: =20
> >> On Fri, 14 May 2021 17:05:11 -0400
> >> Harry Wentland <harry.wentland@amd.com> wrote:
> >> =20
> >>> On 2021-04-27 10:50 a.m., Pekka Paalanen wrote: =20
> >>> > On Mon, 26 Apr 2021 13:38:49 -0400
> >>> > Harry Wentland <harry.wentland@amd.com> wrote: =20
> >>
> >> ...
> >> =20
> >>> >> ## Mastering Luminances
> >>> >>
> >>> >> Now we are able to use the PQ 2084 EOTF to define the luminance of
> >>> >> pixels in absolute terms. Unfortunately we're again presented with
> >>> >> physical limitations of the display technologies on the market  =20
> >>> today. =20
> >>> >> Here are a few examples of luminance ranges of displays.
> >>> >>
> >>> >> | Display=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | Luminance range in nits |
> >>> >> | ------------------------ | ----------------------- |
> >>> >> | Typical PC display=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 0.3 - 2=
00 |
> >>> >> | Excellent LCD HDTV=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 0.3 - 4=
00 |
> >>> >> | HDR LCD w/ local dimming | 0.05 - 1,500 |
> >>> >>
> >>> >> Since no display can currently show the full 0.0005 to 10,000 nits
> >>> >> luminance range the display will need to tonemap the HDR content, =
 =20
> >>> i.e =20
> >>> >> to fit the content within a display's capabilities. To assist with
> >>> >> tonemapping HDR content is usually accompanied with a metadata that
> >>> >> describes (among other things) the minimum and maximum mastering
> >>> >> luminance, i.e. the maximum and minimum luminance of the display  =
=20
> >>> that =20
> >>> >> was used to master the HDR content.
> >>> >>
> >>> >> The HDR metadata is currently defined on the drm_connector via the
> >>> >> hdr_output_metadata blob property.
> >>> >>
> >>> >> It might be useful to define per-plane hdr metadata, as different
> >>> >> planes might have been mastered differently. =20
> >>> >
> >>> > I don't think this would directly help with the dynamic range  =20
> >>> blending =20
> >>> > problem. You still need to establish the mapping between the optical
> >>> > values from two different EOTFs and dynamic ranges. Or can you know
> >>> > which optical values match the mastering display maximum and minimum
> >>> > luminances for not-PQ?
> >>> > =20
> >>>
> >>> My understanding of this is probably best illustrated by this example:
> >>>
> >>> Assume HDR was mastered on a display with a maximum white level of 500
> >>> nits and played back on a display that supports a max white level of=
=20
> >>> 400
> >>> nits. If you know the mastering white level of 500 you know that=20
> >>> this is
> >>> the maximum value you need to compress down to 400 nits, allowing=20
> >>> you to
> >>> use the full extent of the 400 nits panel. =20
> >>
> >> Right, but in the kernel, where do you get these nits values from?
> >>
> >> hdr_output_metadata blob is infoframe data to the monitor. I think this
> >> should be independent of the metadata used for color transformations in
> >> the display pipeline before the monitor.
> >>
> >> EDID may tell us the monitor HDR metadata, but again what is used in
> >> the color transformations should be independent, because EDIDs lie,
> >> lighting environments change, and users have different preferences.
> >>
> >> What about black levels?
> >>
> >> Do you want to do black level adjustment?
> >>
> >> How exactly should the compression work?
> >>
> >> Where do you map the mid-tones?
> >>
> >> What if the end user wants something different? =20
> >
> > I suspect that this is not about tone mapping at all. The use cases
> > listed always have the display in PQ mode and just assume that no
> > content exceeds the PQ limitations. Then you can simply bring all
> > content to the color space with a matrix multiplication and then map the
> > linear light content somewhere into the PQ range. Tone mapping is
> > performed in the display only.

The use cases do use the word "desktop" though. Harry, could you expand
on this, are you seeking a design that is good for generic desktop
compositors too, or one that is more tailored to "embedded" video
player systems taking the most advantage of (potentially
fixed-function) hardware?

What matrix would one choose? Which render intent would it
correspond to?

If you need to adapt different dynamic ranges into the blending dynamic
range, would a simple linear transformation really be enough?

> > From a generic wayland compositor point of view this is uninteresting.
> > =20
> It a compositor's decision to provide or not the metadata property to=20
> the kernel. The metadata can be available from one or multiple clients=20
> or most likely not available at all.
>=20
> Compositors may put a display in HDR10 ( when PQ 2084 INV EOTF and TM=20
> occurs in display ) or NATIVE mode and do not attach any metadata to the=
=20
> connector and do TM in compositor.
>=20
> It is all about user preference or compositor design, or a combination=20
> of both options.

Indeed. The thing here is that you cannot just add KMS UAPI, you also
need to have the FOSS userspace to go with it. So you need to have your
audience defined, userspace patches written and reviewed and agreed
to be a good idea. I'm afraid this particular UAPI design would be
difficult to justify with Weston. Maybe Kodi is a better audience?

But then again, one also needs to consider whether it is enough for a
new UAPI to satisfy only part of the possible audience and then need
yet another new UAPI to satisfy the rest. Adding new UAPI requires
defining the interactions with all existing UAPI as well.

Maybe we do need several different UAPIs for the "same" things if the
hardware designs are too different to cater with just one.


Thanks,
pq

--Sig_/.now01zdmP_040aHYgZGSM4
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEJQjwWQChkWOYOIONI1/ltBGqqqcFAmCjcx8ACgkQI1/ltBGq
qqd9fA//dc1drgTTe0jWyWpwjLpki/FKh8C0jXqWppTfod6fitm9BoRAR/vzJpES
fDngdjH/RvlE+2Jm6MH6C7lxsio0xodJxzPTYDvnFcsWxqWzobI+uEl5unTvdDL0
SmHXEAZ6JAakgaTKOGL7osvJhYfS5BYoGmc3qv/UJwRSjInkN/+jUPvou411MwAd
se97ypCIcZZ0yy0DqoTDZbgjCdvdwWXZDwqvzmi3zFImhQxxYK2eY187l070nZ3b
pZqvVNXb1ZbH/hcPG5Wyb8JLuWIuwycGrKZtaBzN945UUJcz0GqacGLuJJcu4Gjd
l+UMvg7O1kyL6JK9WzsIohPTUCjFBJ8TVM+5jYmTj1ffDE58Q91rbIKrU/nqx5Vi
0E8NYsjrNy++O29tvlvOizSfUksK6DNROn1bFvqoCGDXXQdznA6iHWCwZx48g8qW
0nnuzb9LFKlZVLb79z4bMAPxz8AO1MiLoVQAGF7KwkjpR48u8hFIx0oRYb46cP6o
euaW/b20vJM5fqw5ZZ4kshMzQ/Tup533faqXpAqi1EDwPdE0hx5VIOGdzOwFFog5
qsmT0SE7G+y0OxMwCrGomDDcMNE/R2yr7hupK2gHpIBi3esSYxGCxRiXivp0Zq85
e1iNioisynsAFw7U6kjLDRCooUcdMgcW7jKNo7r9L1I3Ny8CHvg=
=V7zw
-----END PGP SIGNATURE-----

--Sig_/.now01zdmP_040aHYgZGSM4--
