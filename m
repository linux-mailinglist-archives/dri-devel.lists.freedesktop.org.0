Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id F01887E668A
	for <lists+dri-devel@lfdr.de>; Thu,  9 Nov 2023 10:21:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C3F7410E1FC;
	Thu,  9 Nov 2023 09:21:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com
 [IPv6:2a00:1450:4864:20::12d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E4C9610E1FD;
 Thu,  9 Nov 2023 09:20:20 +0000 (UTC)
Received: by mail-lf1-x12d.google.com with SMTP id
 2adb3069b0e04-5079f9675c6so790655e87.2; 
 Thu, 09 Nov 2023 01:20:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1699521619; x=1700126419; darn=lists.freedesktop.org;
 h=mime-version:references:in-reply-to:message-id:subject:cc:to:from
 :date:from:to:cc:subject:date:message-id:reply-to;
 bh=rQMVolRx484syFOvfRidlRCiAKdtBaGKawnSmA/53bU=;
 b=D/8ObClEdffCzCgaXubqjSr7+Z83FHYGlkAtULKuMHF3Yy6qzFSfK+GNQ9DlUwnxjK
 AzR36nw2SX8FwlQXnoo0Y4AZq8hnMWvd5eamvN4DVpOHPGOPg2RzppxHy42IgcQE8Ojv
 Ygas9asw0S/paCGllDotrbMe2BYLYTzXxCdHhH6GArwoRqQaYUIO556OTXo10TppQIx/
 2fIwYwmElpZh5TFbuZfnROZP0pJ4cYCyeqSFLhG0BjN3MA1A5IbfBfk0WOP+JC4mhpwn
 y6qIReJIiFN15J1sFdGzJG+wOITkw6GWayiGZY5XsiD4xj/gAhLtQLMiRHrIPgoxUrTR
 ghKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1699521619; x=1700126419;
 h=mime-version:references:in-reply-to:message-id:subject:cc:to:from
 :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=rQMVolRx484syFOvfRidlRCiAKdtBaGKawnSmA/53bU=;
 b=aRitQsa1pqyxytsF5DO3Cl1DENkwbZEviJJ0UiB9zb84dKp2H/MbwuLkgvaQ7lA4/p
 7r5/5BWd+9yQZbhsKHdAv/zhNR3KeOh157dtEeVwxrkK9YW/NmgdfoD9V9MlNxuq1d9F
 5C15ze45GYXZlmKcsVkts7/IyMnQLSIUcs2jOFryuG6QK+20yzW3P9zhq/VC8qn1c6zp
 aBZhCMbuuiNg/6hOMyvLI8Gbh90+XY3TO6osbYZOjx/j0XO626E7A2MNmS34B4xTO3/t
 XWs8l7cP2NkT8SSrLZycztNeQpBAsNemSQHJ2Rq8I0kFfan/xI8MC3w5vJlA0+yWjeBR
 VNEQ==
X-Gm-Message-State: AOJu0Yw+DsIc1XEPCALgzvCQ+QIjV2fcj84vxwtKY/PPU2QqlrQhOP+F
 8dlBminTBi8DKlRL7ZQUaqc=
X-Google-Smtp-Source: AGHT+IG42xhlCw9mhFJGxEvvrRyG4pOF7rZKN0EAIbcg0fudGr5+LRwoSZGrkaqGIP6N4kXLRFjG5w==
X-Received: by 2002:ac2:4945:0:b0:507:9ff7:2ed4 with SMTP id
 o5-20020ac24945000000b005079ff72ed4mr864988lfi.43.1699521618689; 
 Thu, 09 Nov 2023 01:20:18 -0800 (PST)
Received: from eldfell ([194.136.85.206]) by smtp.gmail.com with ESMTPSA id
 bi36-20020a0565120ea400b00505713722b9sm997254lfb.38.2023.11.09.01.20.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 09 Nov 2023 01:20:17 -0800 (PST)
Date: Thu, 9 Nov 2023 11:20:05 +0200
From: Pekka Paalanen <ppaalanen@gmail.com>
To: Harry Wentland <harry.wentland@amd.com>
Subject: Re: [RFC PATCH 01/10] drm/doc/rfc: Describe why prescriptive color
 pipeline is needed
Message-ID: <20231109112005.7b55917e@eldfell>
In-Reply-To: <43a56f81-ed15-4f44-ba38-2896df405f84@amd.com>
References: <20230908150235.75918-1-harry.wentland@amd.com>
 <20230908150235.75918-2-harry.wentland@amd.com>
 <20231010161322.topz6zfealkxtwjj@mail.igalia.com>
 <c80abc42-3197-4476-b33d-88c795b2e55c@amd.com>
 <20231020133658.4cff9f42@eldfell>
 <bc7aa628-4d9b-4141-a001-535e67d173dd@amd.com>
 <20231107115543.7fa6e5f2@eldfell>
 <f013a0b7-eed9-4b2b-a6d0-4678c46bef84@amd.com>
 <20231108121601.163e58db@eldfell>
 <CA+hFU4zFz1NyDRzgaeaWVEw9GU-Lm9D=oDsOABnOpMsNHQfdzQ@mail.gmail.com>
 <6c574ff5-8890-4acd-a873-7cb2fb48ce7f@amd.com>
 <20231108181731.4fe6f5d3@eldfell>
 <43a56f81-ed15-4f44-ba38-2896df405f84@amd.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/un_6TI4K6NVIl=1w8F+RKax";
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
Cc: Sebastian Wick <sebastian.wick@redhat.com>,
 Shashank Sharma <shashank.sharma@amd.com>, Xaver Hugl <xaver.hugl@gmail.com>,
 dri-devel@lists.freedesktop.org, wayland-devel@lists.freedesktop.org,
 Melissa Wen <mwen@igalia.com>, Jonas =?UTF-8?B?w4VkYWhs?= <jadahl@redhat.com>,
 Uma Shankar <uma.shankar@intel.com>,
 Michel =?UTF-8?B?RMOkbnplcg==?= <mdaenzer@redhat.com>,
 Victoria Brekenfeld <victoria@system76.com>, Aleix Pol <aleixpol@kde.org>,
 Naseer Ahmed <quic_naseer@quicinc.com>,
 Christopher Braga <quic_cbraga@quicinc.com>, Joshua Ashton <joshua@froggi.es>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--Sig_/un_6TI4K6NVIl=1w8F+RKax
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Wed, 8 Nov 2023 11:27:35 -0500
Harry Wentland <harry.wentland@amd.com> wrote:

> On 2023-11-08 11:19, Pekka Paalanen wrote:
> > On Wed, 8 Nov 2023 09:31:17 -0500
> > Harry Wentland <harry.wentland@amd.com> wrote:
> >  =20
> >> On 2023-11-08 06:40, Sebastian Wick wrote: =20
> >>> On Wed, Nov 8, 2023 at 11:16=E2=80=AFAM Pekka Paalanen <ppaalanen@gma=
il.com> wrote:   =20

...

> >>>> An incremental UAPI development approach is fine by me, meaning that
> >>>> pipelines might not be complete at first, but I believe that requires
> >>>> telling userspace whether the driver developers consider the pipeline
> >>>> complete (no undescribed operations that would significantly change
> >>>> results from the expected results given the UAPI exposed pipeline).
> >>>>
> >>>> The prime example of what I would like to know is that if a FB
> >>>> contains PQ-encoded image and I use a color pipeline to scale that
> >>>> image up, will the interpolation happen before or after the non-line=
ar
> >>>> colorop that decodes PQ. That is a significant difference as pointed
> >>>> out by Joshua.
> >>>>   =20
> >>
> >> That's fair and I want to give that to you. My concern stems from
> >> the sentiment that I hear that any pipeline that doesn't explicitly
> >> advertise this is useless. I don't agree there. Let's not let perfect
> >> be the enemy of good. =20
> >=20
> > It's up to the use case. The policy of what is sufficient should reside
> > in userspace.
> >=20
> > What about matching compositor shader composition with KMS?
> >=20
> > Can we use that as a rough precision threshold? If userspace implements
> > the exact same color pipeline as the KMS UAPI describes, then that and
> > the KMS composited result should be indistinguishable in side-by-side
> > or alternating visual inspection on any monitor in isolation.
> >=20
> > Did this whole effort not start from wanting to off-load things to
> > display hardware but still maintain visual equivalence to software/GPU
> > composition?
> >  =20
>=20
> I agree with you and I want all that as well.
>=20
> All I'm saying is that every userspace won't have the same policy of
> what is sufficient. Just because Weston has a very high threshold
> doesn't mean we can't move forward with a workable solution for other
> userspace, as long as we don't do something that prevents us from
> doing the perfect solution eventually.
>=20
> And yes, I do want a solution that works for Weston and hear your
> comments on what that requires.

I totally agree.

How will that be reflected in the UAPI? If some pipelines are different
from others in correctness/strictness perspective, how will userspace
tell them apart?

Is the current proposal along the lines of: userspace creates a
software pipeline first, and if it cannot map all operations on it to
KMS color pipeline colorops, then the KMS pipeline is not sufficient?

The gist being, if the software pipeline is scaling the image for
example, then it must find a scaling colorop in the KMS pipeline if it
cares about the scaling correctness.

Another example is YUV pixel format on an FB that magically turns into
some kind of RGB when sampled, but there is no colorop to tell what
happens. I suppose userspace cannot assume that the lack of colorop
there means an identity YUV->RGB matrix either? How to model
that? I guess the already mentioned pixel format requirements on a
pipeline would help, making it impossible to use a pipeline without a
YUV->RGB colorop on a YUV FB unless the lack of colorop does indeed
mean an identity matrix.

The same with sub-sampled YUV which probably needs to always(?) be
expanded into fully sampled at the beginning of a pipeline? Chroma
siting.

This is in addition to the previously discussed userspace policy that
if a KMS color pipeline contains colorops the userspace does not
recognise, userspace probably should not pick that pipeline under any
conditions, because it might do something completely unexpected.

I think the above could work, but I feel it requires documenting several
examples like scaling that might not exist in the colorop definitions
at first. Otherwise particularly userspace developers might not come to
think of them, whether they care about those operations. I haven't read
the latest doc yet, so I'm not sure if it's already there.

There is still a gap though: what if the hardware does something
significant that is not modelled in the KMS pipeline with colorops? For
example, always using a hard-wired sRGB curve to decode before blending
and encode after blending. Or that cursor plane always uses the color
pipeline set on the primary plane. How to stop userspace from being
surprised?

Your comments sounded to me like you are letting go of the original
design goals. I'm happy to hear that's not the case. Even if you were,
that is a decision you can make since you are doing the work, and if I
knew you're doing that intentionally I would stop complaining.


Thanks,
pq

--Sig_/un_6TI4K6NVIl=1w8F+RKax
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEJQjwWQChkWOYOIONI1/ltBGqqqcFAmVMpEUACgkQI1/ltBGq
qqdDaA//RL0EeUsvatku4zfIJCTx3kZ8+4uQa4P0Hp6aiYIv1OyHNe3urNoeQnt2
LI2dMRLxcjsM7TZg8OKFsegiNjwNLupdCqwIBFKFKXOJtypYTwwcqV7IVan0GdBm
hhsX1QbFtIYSMf4d5BAxPZBWkLI1kC915FHp4hqQFPPJ+wj4FRKu2modVTvhjHlY
7J8/M4plinqHBH4da3yExCswbpOxf0GJ2ss+KhiztS1nD+F8/kHiq0qsz/4g6oKZ
xCyNxNk8fJawpB3tPzLsX9MwlG3+G7/3wMIxkogqZxSEJPLodhvcsQGOwqizcGnM
exWqT3Txjik3y6nhboWgSzgpFnck1L6Dq+mradTplTuGFOZPEahseVNp71yTnYZD
cHtRABbS0tp46cZIITjtlIZWoZZOhoxt90XFZiyeMmb68xP+ZaIepQuWpVdm+n19
EkrsV1XjFF4kYYGONxr47YIigEW9iFMxUNnM0MmpoVQam3bkImIIMdSLI9lheDgQ
vIcjqkVDqC2aOPdqk4iWcz6LhkHvSM0U6bf7IAkbuA9veDAp6tPjyhtZ0aGKHKaO
MMMoS9yzWSG6HEdhToET3NopvjC9PzGZH/UY2pXVURhL2EaJgoo2pnhNOG+X+w3L
RqhI/gqLQ6tteMNKXcLp9PuUuWsCm0iygrVDASPk0Rf27rYm8JE=
=YYuP
-----END PGP SIGNATURE-----

--Sig_/un_6TI4K6NVIl=1w8F+RKax--
