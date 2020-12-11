Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C9DF2D7574
	for <lists+dri-devel@lfdr.de>; Fri, 11 Dec 2020 13:20:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0823E6EDC6;
	Fri, 11 Dec 2020 12:20:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x143.google.com (mail-lf1-x143.google.com
 [IPv6:2a00:1450:4864:20::143])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6B70B6EDC6;
 Fri, 11 Dec 2020 12:20:32 +0000 (UTC)
Received: by mail-lf1-x143.google.com with SMTP id w13so13034432lfd.5;
 Fri, 11 Dec 2020 04:20:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:in-reply-to:references
 :mime-version; bh=aN+eJU9kdQqnxT2tyGWW76jiJXyiAxGt1tBEBUeg2Wk=;
 b=eYEeRHlRCbsYpjeien1nKxZfzA/u7sRWPTX6hsOc2USVHENNWRycHM6GzgA6tA3uIM
 EqdKABfa0eb/alzcCQ7Kv53rKRl4nInvmCJ0c5ncOkD+34YSirHPAeQpcWnszfKm9EDC
 8P3+3hWPk+atS9VaqBsb/5gJ/iL4aLkTNpahOz2s6UJ3fYAzXu7hRnsDuOrSHy9G2EZG
 F/vqgS3ggLzMjJUrajHv56z13JZntsHPK6YLVOCCyPP47j/TVhO1a2C37y1+id+F0X2D
 3N/Zbs7k7QvmK96ZRt/e8b3Y9g3RklKP1Se4SKnWB7corXc1W+78mBw8GD2OfjCtYcRG
 l9Ow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:mime-version;
 bh=aN+eJU9kdQqnxT2tyGWW76jiJXyiAxGt1tBEBUeg2Wk=;
 b=UAAHNsgrYiKyfpDxMqXPIhV17Okd9fncaQEgj5uvQ0Tn/vxVFKKrhlHGRyfXsyHMen
 ytkoJIR5SwVPiZm1tcSpy+TuprSOijc1Hiea8kM9L3aI3Y599J7JKeaErm71MQcq7QGo
 YTWh+IlVbZhpIVLhE388flvH/1UEFBeFCXht2SUmhsJgm+9v/ewwN1En5MK71UALOX2w
 S4Cph91Jy9UcRZnToCmYnNu5GRV2hFX901SWWUQe9iZ/PVjHHYu3gb+759ClJ7jSXhRh
 X4w5ihCDG4TYZRSUDKEIUuLFPgS8A5gwATlPoNW7xGboHn9cHOnHlF/G9eDT3ORawCZV
 U8zQ==
X-Gm-Message-State: AOAM5312UHNgBMZ8ANaongcFbB2ECU7U9IYyZ00nKVM1omAzjHxgPn7L
 bclDS886mCMozEyJRccYp3M=
X-Google-Smtp-Source: ABdhPJysQbreFYHm+fLhwOuQL7R8nC+idHxFrIQUyya8kt9GjtqKGH9FemUF6WUKn7SudYI/4LiR3Q==
X-Received: by 2002:ac2:5442:: with SMTP id d2mr4705351lfn.154.1607689230833; 
 Fri, 11 Dec 2020 04:20:30 -0800 (PST)
Received: from eldfell ([194.136.85.206])
 by smtp.gmail.com with ESMTPSA id m20sm862465lfc.172.2020.12.11.04.20.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 11 Dec 2020 04:20:30 -0800 (PST)
Date: Fri, 11 Dec 2020 14:20:19 +0200
From: Pekka Paalanen <ppaalanen@gmail.com>
To: Christian =?UTF-8?B?S8O2bmln?= <ckoenig.leichtzumerken@gmail.com>
Subject: Re: [PATCH v2 0/3] Experimental freesync video mode optimization
Message-ID: <20201211142019.19dae2aa@eldfell>
In-Reply-To: <53f5b48c-c2b5-ed66-0c0e-bba0b22dba03@gmail.com>
References: <20201210184823.285415-1-aurabindo.pillai@amd.com>
 <MC46k2jDYAeDTZaSlv6T5iIq5ibkh2yYwW3KZ-XLXLwoRByjkWsEr6-6eQM4iZqmkiLoleyh84S290ytAub0bK-esJje1OGKIEilcz_iikY=@emersion.fr>
 <0b7132b8-a890-b4f0-0a0c-260015fa0bbb@amd.com>
 <20201211115549.32ade81b@eldfell>
 <53f5b48c-c2b5-ed66-0c0e-bba0b22dba03@gmail.com>
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
Cc: stylon.wang@amd.com, thong.thai@amd.com,
 Shashank Sharma <shashank.sharma@amd.com>, amd-gfx@lists.freedesktop.org,
 nicholas.kazlauskas@amd.com, Aurabindo Pillai <aurabindo.pillai@amd.com>,
 DRI Development <dri-devel@lists.freedesktop.org>, wayne.lin@amd.com,
 alexander.deucher@amd.com, christian.koenig@amd.com
Content-Type: multipart/mixed; boundary="===============0242764459=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--===============0242764459==
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/1etLWcPkUcsFqMuruRxLddG"; protocol="application/pgp-signature"

--Sig_/1etLWcPkUcsFqMuruRxLddG
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Fri, 11 Dec 2020 11:28:36 +0100
Christian K=C3=B6nig <ckoenig.leichtzumerken@gmail.com> wrote:

> Am 11.12.20 um 10:55 schrieb Pekka Paalanen:
> > On Fri, 11 Dec 2020 09:56:07 +0530
> > Shashank Sharma <shashank.sharma@amd.com> wrote:
> > =20
> >> Hello Simon,
> >>
> >> Hope you are doing well,
> >>
> >> I was helping out Aurabindo and the team with the design, so I have
> >> taken the liberty of adding some comments on behalf of the team,
> >> Inline.
> >>
> >> On 11/12/20 3:31 am, Simon Ser wrote: =20
> >>> Hi,
> >>>
> >>> (CC dri-devel, Pekka and Martin who might be interested in this as
> >>> well.) =20
> > Thanks for the Cc! This is very interesting to me, and because it was
> > not Cc'd to dri-devel@ originally, I would have missed this otherwise.
> > =20
> >>> On Thursday, December 10th, 2020 at 7:48 PM, Aurabindo Pillai <aurabi=
ndo.pillai@amd.com> wrote:
> >>>    =20
> >>>> This patchset enables freesync video mode usecase where the userspace
> >>>> can request a freesync compatible video mode such that switching to =
this
> >>>> mode does not trigger blanking.
> >>>>
> >>>> This feature is guarded by a module parameter which is disabled by
> >>>> default. Enabling this paramters adds additional modes to the driver
> >>>> modelist, and also enables the optimization to skip modeset when usi=
ng
> >>>> one of these modes. =20
> >>> Thanks for working on this, it's an interesting feature! However I'd =
like to
> >>> take some time to think about the user-space API for this.
> >>>
> >>> As I understand it, some new synthetic modes are added, and user-spac=
e can
> >>> perform a test-only atomic *without* ALLOW_MODESET to figure out whet=
her it can
> >>> switch to a mode without blanking the screen. =20
> >> The implementation is in those lines, but a bit different. The idea
> >> is to:
> >>
> >> - check if the monitor supports VRR,
> >>
> >> - If it does, add some new modes which are in the VRR tolerance
> >> range, as new video modes in the list (with driver flag).
> >>
> >> - when you get modeset on any of these modes, skip the full modeset,
> >> and just adjust the front_porch timing
> >>
> >> so they are not test-only as such, for any user-space these modes
> >> will be as real as any other probed modes of the list. =20
> > But is it worth to allow a modeset to be glitch-free if the userspace
> > does not know they are glitch-free? I think if this is going in, it
> > would be really useful to give the guarantees to userspace explicitly,
> > and not leave this feature at an "accidentally no glitch sometimes"
> > level.
> >
> >
> > I have been expecting and hoping for the ability to change video mode
> > timings without a modeset ever since I learnt that VRR is about
> > front-porch adjustment, quite a while ago.
> >
> > This is how I envision userspace making use of it:
> >
> > Let us have a Wayland compositor, which uses fixed-frequency video
> > modes, because it wants predictable vblank cycles. IOW, it will not
> > enable VRR as such. =20
>=20
> Well in general please keep in mind that this is just a short term=20
> solution for X11 applications.

I guess someone should have mentioned that. :-)

Do we really want to add more Xorg-only features in the kernel?

It feels like "it's a short term solution for X11" could be almost used
as an excuse to avoid proper uAPI design process. However, with uAPI
there is no "short term". Once it's in, it's there for decades. So why
does it matter if you design it for Xorg foremost? Are others forbidden
to make use of it? Or do you deliberately want to design it so that
it's not generally useful and it will indeed end up being a short term
feature? Planned obsolescence from the start?

> For things like Wayland we probably want to approach this from a=20
> completely different vector.
>=20
> > When the Wayland compositor starts, it will choose *some* video mode
> > for an output. It may or may not be what a KMS driver calls "preferred
> > mode", because it depends on things like user preferences. The
> > compositor makes the initial modeset to this mode. =20
>=20
> I think the general idea we settled on is that we specify an earliest=20
> display time for each frame and give feedback to the application when a=20
> frame was actually displayed.

That is indeed something completely different, and feels like it would
be several years in the future, while the proposed scheme or the
min/max properties could be done fairly quickly. But I'm not in a hurry.

Setting the earliest display time for a flip does not fully cover what
video mode timing adjustment or min/max frame time or refresh rate
property would offer: prediction of when the next flip can happen.
Choosing display times requires knowing the possible display times, so
something more is needed. The min/max properties would fit in.

> This approach should also be able to handle multiple applications with=20
> different refresh rates. E.g. just think of a video playback with 25 and=
=20
> another one with 30 Hz in two windows when the max refresh rate is=20
> something like 120Hz.

But that's just an extension to what I already described and completely
possible with the proposed and the min/max approaches.


Thanks,
pq

--Sig_/1etLWcPkUcsFqMuruRxLddG
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEJQjwWQChkWOYOIONI1/ltBGqqqcFAl/TZAMACgkQI1/ltBGq
qqeuRg//VGMe7yVxCc95Igl3ZsaqyMlcbpaK8D4T1qNBaDzmgorCfvbFpTMVfZZ0
dmSmjhT4CYMWx4D4MNa9hUtubydGZ3EEyfbUi5vvC7YNs1MrdP/VcUk4HsKU6XY9
zUHiNEc6/CciWliJ8Llj/1r08zzRxsdJ7gsLZQ6poN6VPQBO4noK4wkcxgO1GIAZ
caT8SwRlKi77frO+H3eJ6jB6ACpiLwLzNoqvykfacvF/vle2n9p50y7t5cv0ZbQq
OG8IKB3DybzHlcgiP2tYZCmVuQWDkZ+urbxkMJWxlfXZ4zgM/6HipgC61sVorfmA
rvZqQft2ijyYKNawT/n3Z3E1PEWLJstQi1gXJrwTqE5pbTdbAwhKJx5vbO6lf7Zx
v+A678KS3wBbudFWOSMAkOWR7bPstAhPfQUJEkrLDNerS4CVtwoNFQnpga5tRYVf
Fz/ZyttpuhRA7JPjRre2tUNjslzBImhfB0FOsLFeQCQDItztT6BI2vb041/l2ZEN
hxtW4LeP1eoeYUg5qmZzdn8NT9hLO6UGXm8sOXMC2Opku92b6NZTk+XDaohrQMH+
x7vuAls9MArqytv83vcp4JyfkM7bOa9aAJUs3Ri+7CnLQOcOhldPOGQKyyfKvXzN
OOwOvjr8MgupgDlaSAjZXWGr9YJsIUYbFkoj+YxRnYvSDc9mZEY=
=W5CX
-----END PGP SIGNATURE-----

--Sig_/1etLWcPkUcsFqMuruRxLddG--

--===============0242764459==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============0242764459==--
