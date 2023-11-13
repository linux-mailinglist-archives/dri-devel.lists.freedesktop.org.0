Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 21A6A7E992C
	for <lists+dri-devel@lfdr.de>; Mon, 13 Nov 2023 10:38:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A4BF810E323;
	Mon, 13 Nov 2023 09:38:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com
 [IPv6:2a00:1450:4864:20::12c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 006E610E0A6;
 Mon, 13 Nov 2023 09:38:34 +0000 (UTC)
Received: by mail-lf1-x12c.google.com with SMTP id
 2adb3069b0e04-507bd644a96so5998862e87.3; 
 Mon, 13 Nov 2023 01:38:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1699868313; x=1700473113; darn=lists.freedesktop.org;
 h=mime-version:references:in-reply-to:message-id:subject:cc:to:from
 :date:from:to:cc:subject:date:message-id:reply-to;
 bh=u4GAfL3E4HUTpY92YExMRS9RHX1culHMb0UDNJ1Cc3o=;
 b=S2fNJNgXr8QcWhBh5pR3qYgRNaPMPtxdG9qX9NkdU9uaNmR0q8H5VfFumymCyIGOf/
 8agsV1PNeTtJjM0wM2cdr32+yFMRZKbOLAxf7pp0+JhfCZlCGm16dKZrFsKj/ulV7JEd
 BwuyJizRZ7188WLbZHTbTWL3v9L5VuF6G2bDiHlKz0C2yeNajp2/kNbzZtRqp+A8Doby
 dNEaZAjLmcFZDuCB54exBztGkjkf+YyvcvX/VlWEAgC4vA0AO5I7f2PBftnJzqix2RI5
 trJ5PIkq7b/vbsHXyfS6BjqMyXDEFcRpZfhdl/TuZfyZ5mkJA5u4MZb5qcQQ69WeNHQy
 8/ZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1699868313; x=1700473113;
 h=mime-version:references:in-reply-to:message-id:subject:cc:to:from
 :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=u4GAfL3E4HUTpY92YExMRS9RHX1culHMb0UDNJ1Cc3o=;
 b=KFY9h8evAKuU7C5WfghURPmwHf56GSi4HJDvdEMz7NQ7PIXvh+1lpncKwNkBA4QsLO
 2gW/4efn+c8Q9jRRtRNawGEVg/2ZVyDtxQUtukwWoDVsQwl457FrmugTYRBT41CtswD5
 d6z9pxwkFZUedB86onqxrUaga8PxpINyvEL3NxfvAlVFvxTmfqHp5tu5hX3qr4XJ+pBZ
 dI29N9UHGWwQOpqUTmxmb0KUXXs9r27kjXWgt21eWR0LK+aju2BNv8BFLWeXn7ViQLxA
 UH3Qs7OHBmrIxMA019WESYRACde8PMEe+rzCFgdFOJpDreHTZsBr9841PEJ21y3y09VR
 aWKQ==
X-Gm-Message-State: AOJu0YzFCnqj7rZK6jIk9WQuZy5L69bVc5Y31xwvQD4PIoGQbZzsN6ME
 V2kgdxeq8Xm2Xs1y2W7KJbI=
X-Google-Smtp-Source: AGHT+IGTVQXwu/oxPOPEJo+kGT7TEn7KIaMoWjRXIl0WPiTFon1Hv3jTSzFM34VyY5FZ1/WOF8yksg==
X-Received: by 2002:ac2:5451:0:b0:509:7915:a1d6 with SMTP id
 d17-20020ac25451000000b005097915a1d6mr3827345lfn.58.1699868312605; 
 Mon, 13 Nov 2023 01:38:32 -0800 (PST)
Received: from eldfell ([194.136.85.206]) by smtp.gmail.com with ESMTPSA id
 n1-20020a195501000000b0050420b0a642sm920066lfe.91.2023.11.13.01.38.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 13 Nov 2023 01:38:32 -0800 (PST)
Date: Mon, 13 Nov 2023 11:38:04 +0200
From: Pekka Paalanen <ppaalanen@gmail.com>
To: Simon Ser <contact@emersion.fr>
Subject: Re: [PATCH v6 6/6] drm/doc: Define KMS atomic state set
Message-ID: <20231113113804.6e2adfa8@eldfell>
In-Reply-To: <5_NYn1PEc-XUYiRf5fC9oQqTaJxoAuvHVvw1PVTume5m8_cbOyku2Q2XKdCm66g0WcMq_RL8oSp52AowBzX9WAEiVBgdmYtPeXI9SWnD6Ts=@emersion.fr>
References: <20230815185710.159779-1-andrealmeid@igalia.com>
 <b48bd1fc-fcb0-481b-8413-9210d44d709b@igalia.com>
 <20231016151856.74af9305@eldfell>
 <aa424bf8-5652-4a44-9b93-bdc0a31d835a@igalia.com>
 <20231016175222.7a89e6ab@eldfell> <ZS1ST6XAUHilBg3d@intel.com>
 <8NqDNz1Y8H5I_WhNhOj0ERarBH7nJhGQAsDHbmSnwzoOFtXPBPILwxLlF8-vDPKR06Uknp1BDSt7-6gTmHls62k79ETajXDfPRsmIP-cZN0=@emersion.fr>
 <ZS55mXTSxpXKYbsd@intel.com>
 <mawSNnD1hQ6vCVrNVMAvuQESnTToKPXrtiHIXXdqC-mq_LkxWOizPCcXx_KiEASVX-Mbm0LgjfTYkMNOjSAKCldpkXHAd9MmRzbC8ECPsTs=@emersion.fr>
 <5_NYn1PEc-XUYiRf5fC9oQqTaJxoAuvHVvw1PVTume5m8_cbOyku2Q2XKdCm66g0WcMq_RL8oSp52AowBzX9WAEiVBgdmYtPeXI9SWnD6Ts=@emersion.fr>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/a.PgNTejH/fXsqDwgPnh_Aa";
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
Cc: pierre-eric.pelloux-prayer@amd.com,
 =?UTF-8?B?QW5kcsOp?= Almeida <andrealmeid@igalia.com>,
 'Marek =?UTF-8?B?T2w=?= =?UTF-8?B?xaHDoWsn?= <maraeo@gmail.com>,
 Michel =?UTF-8?B?RMOkbnplcg==?= <michel.daenzer@mailbox.org>,
 Randy Dunlap <rdunlap@infradead.org>, xaver.hugl@gmail.com,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 amd-gfx@lists.freedesktop.org, kernel-dev@igalia.com,
 alexander.deucher@amd.com, joshua@froggi.es,
 wayland-devel@lists.freedesktop.org, hwentlan@amd.com,
 christian.koenig@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--Sig_/a.PgNTejH/fXsqDwgPnh_Aa
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

On Mon, 13 Nov 2023 09:18:39 +0000
Simon Ser <contact@emersion.fr> wrote:

> On Monday, October 23rd, 2023 at 10:25, Simon Ser <contact@emersion.fr> w=
rote:
>=20
> > > > > > > > > > > +An atomic commit with the flag DRM_MODE_PAGE_FLIP_AS=
YNC is allowed to
> > > > > > > > > > > +effectively change only the FB_ID property on any pl=
anes. No-operation changes
> > > > > > > > > > > +are ignored as always. [...]
> > > > > > > > > > > During the hackfest in Brno, it was mentioned that a =
commit which re-sets the same FB_ID could actually have an effect with VRR:=
 It could trigger scanout of the next frame before vertical blank has reach=
ed its maximum duration. Some kind of mechanism is required for this in ord=
er to allow user space to perform low frame rate compensation. =20
> > > > > > > > >=20
> > > > > > > > > Xaver tested this hypothesis in a flipping the same fb in=
 a VRR monitor
> > > > > > > > > and it worked as expected, so this shouldn't be a concern.
> > > > > > > > > Right, so it must have some effect. It cannot be simply i=
gnored like in
> > > > > > > > > the proposed doc wording. Do we special-case re-setting t=
he same FB_ID
> > > > > > > > > as "not a no-op" or "not ignored" or some other way?
> > > > > > > > > There's an effect in the refresh rate, the image won't ch=
ange but it
> > > > > > > > > will report that a flip had happened asynchronously so th=
e reported
> > > > > > > > > framerate will be increased. Maybe an additional wording =
could be like: =20
> > > > > > >=20
> > > > > > > Flipping to the same FB_ID will result in a immediate flip as=
 if it was
> > > > > > > changing to a different one, with no effect on the image but =
effecting
> > > > > > > the reported frame rate. =20
> > > > > >=20
> > > > > > Re-setting FB_ID to its current value is a special case regardl=
ess of
> > > > > > PAGE_FLIP_ASYNC, is it not? =20
> > > > >=20
> > > > > No. The rule has so far been that all side effects are observed
> > > > > even if you flip to the same fb. And that is one of my annoyances
> > > > > with this proposal. The rules will now be different for async fli=
ps
> > > > > vs. everything else. =20
> > > >=20
> > > > Well with the patches the async page-flip case is exactly the same =
as
> > > > the non-async page-flip case. In both cases, if a FB_ID is included=
 in
> > > > an atomic commit then the side effects are triggered even if the pr=
operty
> > > > value didn't change. The rules are the same for everything. =20
> > >=20
> > > I see it only checking if FB_ID changes or not. If it doesn't
> > > change then the implication is that the side effects will in
> > > fact be skipped as not all planes may even support async flips. =20
> >=20
> > Hm right. So the problem is that setting any prop =3D same value as
> > previous one will result in a new page-flip for asynchronous page-flips,
> > but will not result in any side-effect for asynchronous page-flips.
> >=20
> > Does it actually matter though? For async page-flips, I don't think this
> > would result in any actual difference in behavior? =20

Hi Simon,

a fly-by question...

> To sum this up, here is a matrix of behavior as seen by user-space:
>=20
> - Sync atomic page-flip
>   - Set FB_ID to different value: programs hw for page-flip, sends uevent
>   - Set FB_ID to same value: same (important for VRR)
>   - Set another plane prop to same value: same
>   - Set another plane prop to different value: maybe rejected if modeset =
required
> - Async atomic page-flip
>   - Set FB_ID to different value: updates hw with new FB address, sends
>     immediate uevent
>   - Set FB_ID to same value: same (no-op for the hw)

It should not be a no-op for the hw, because the hw might be in the
middle of a VRR front-porch waiting period, and the commit needs to end
the waiting immediately rather than time out?

>   - Set another plane prop to same value: ignored, sends immediate uevent
>     (special codepath)

If the sync case says "same", then shouldn't this say "same" as well to
be consistent?

>   - Set another plane prop to different value: always rejected
>=20
> To me sync and async look consistent.


Thanks,
pq

--Sig_/a.PgNTejH/fXsqDwgPnh_Aa
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEJQjwWQChkWOYOIONI1/ltBGqqqcFAmVR7nwACgkQI1/ltBGq
qqfDKw//cUuX/ORa9YBFrof2nHF+AtEkgIBc6Bf2ezWX5+on3/3weRM7TepcaINJ
tWn6dfsTCzk+gwSXNzOAb1zWZA98Y8uJPgRbXgVj8b1IU+yYzHXPYpXSnjlDQ7pr
IwRVLEFjhhjC0zLBytdbKyGz80ijK1AkHv+HL3oaoq2E3BEwhpI5qil128slemCi
EMe4OMmHknzv4j1TdXPfRD70lpYNEt6oLbttpXbUq/vNutoZ+/T5Moq4cZupEcv1
5F7SJZNKQtp/UK2GZ7WP/IhJ9Kc7xr+7FTINn9jB7o/WQRxAkeW574YLh//gsBjC
Ba+/BBkHFLIjct54pTc/HDgebotyNorOV89JYPWkME4eaR5xCVZfB52vO8PIvzWg
hadUIPRp8vXgNq59yDlJvTy2UBV8GVzN1ygYjFTXjkKYYFuLBvvjoIwIlycuwGh6
TfTfPrVobl0rBytWrWTU6wfFxmmoPF8hXc+yV1irsZp75+pWVI3rbpIvfI/sYrBz
8jUyAlAt2Mw2uHu41Qm4iReVIXHwNEU7EUdGAnTVssq1o6O39lh6zeEx4iC2FALd
0xdlCHeV/S5meBuGAmUdlYGpUPKHSXtD9ey5lVxylLxU1oFkaPXg2UtSC0KJ98WT
btwui63it7McODKumvE+TjV+WAqk2dRfIHt0R4ojZMhB08WwRlk=
=cgmP
-----END PGP SIGNATURE-----

--Sig_/a.PgNTejH/fXsqDwgPnh_Aa--
