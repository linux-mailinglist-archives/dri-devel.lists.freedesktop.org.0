Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0AC292D767D
	for <lists+dri-devel@lfdr.de>; Fri, 11 Dec 2020 14:28:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CED0A6EDEC;
	Fri, 11 Dec 2020 13:28:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x141.google.com (mail-lf1-x141.google.com
 [IPv6:2a00:1450:4864:20::141])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1A4286EDE9;
 Fri, 11 Dec 2020 13:28:00 +0000 (UTC)
Received: by mail-lf1-x141.google.com with SMTP id w13so13301024lfd.5;
 Fri, 11 Dec 2020 05:28:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:in-reply-to:references
 :mime-version; bh=TDrM5kPlm7Ranw4xscXKLzASimCuU5Obgc5qTx1zHFg=;
 b=PQOYv46u2FfmBC1HwcOqA7PwYmc8ALwgakmymEfyEtXr+uNjHl4W+Hyee6Lew+UCFr
 AFtcoz9hEte47hfGZoaM5YE270mkpVRdAp5G4xW1SRh971gEgiMBjKbpdmjRVVDyKhyc
 laUHeDmc56pKnSN0JGYvwDCd7smZKCTrged/+C9xE219a6ZCdMxuC3ia7+UPvAC2pDrV
 7NLHc76HNpiRMelIo4GfpgHkWaYAdVKm2nrV3vSZQgDeF/M2fAbf3SgLEd0vKrR/Y7fx
 8tp58txGiEppr6nIO9m286RKX8nVXrd9glrz4upfTl2VJPoVIHAiaoISOPICBTgeQ95p
 59EQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:mime-version;
 bh=TDrM5kPlm7Ranw4xscXKLzASimCuU5Obgc5qTx1zHFg=;
 b=OUhyzCREcy2dY0/cQP3HCcSIA1N9lj+S26UBvvDs184bKZ13OozBzEK6Ks9Dwpe4XQ
 eNa6B8HwUSxXfhic3ywr4F2Ej8Yyor+6B07cimvU4NJYxUy84c7mSMJoOmni204Z/jQi
 7JqBd8wHc4LLqaSwfr1eMkSH767SNLusj7wzyOk6h69C3QAmvARqXipdkiJh5wo5fySg
 6P94Z32LVfz2C0xgVzWkHDfkZxqX1m6W/PKTXWuADVA6/SpDFgbJQb9VLBTRVuH5xACQ
 Ngo9NBzh85gsqccPKBNwmp7+6b5E3NmkoB1pBj7l/48SFQKGUihjyOjSUE9vbJ1h04CU
 PkIQ==
X-Gm-Message-State: AOAM531VZ6IkiD88tYf/6ox51kC3p4Y7ZyuDie7ZAfpLaM2HTReQmKnI
 mv75wQWm0rnQCfWjWdxWvL0=
X-Google-Smtp-Source: ABdhPJzz0bvxMXS2dI+dcSV+Y8CcekYo+nljRiCnrjWh0IwfpT/JPabhf866eQZWHSMaijarpU6XAg==
X-Received: by 2002:a19:cc52:: with SMTP id c79mr4323897lfg.490.1607693278548; 
 Fri, 11 Dec 2020 05:27:58 -0800 (PST)
Received: from eldfell ([194.136.85.206])
 by smtp.gmail.com with ESMTPSA id q15sm83079ljh.136.2020.12.11.05.27.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 11 Dec 2020 05:27:58 -0800 (PST)
Date: Fri, 11 Dec 2020 15:27:54 +0200
From: Pekka Paalanen <ppaalanen@gmail.com>
To: Christian =?UTF-8?B?S8O2bmln?= <christian.koenig@amd.com>
Subject: Re: [PATCH v2 0/3] Experimental freesync video mode optimization
Message-ID: <20201211152754.48297d5c@eldfell>
In-Reply-To: <c262b694-fb5d-accd-2582-4adb967ea890@amd.com>
References: <20201210184823.285415-1-aurabindo.pillai@amd.com>
 <MC46k2jDYAeDTZaSlv6T5iIq5ibkh2yYwW3KZ-XLXLwoRByjkWsEr6-6eQM4iZqmkiLoleyh84S290ytAub0bK-esJje1OGKIEilcz_iikY=@emersion.fr>
 <0b7132b8-a890-b4f0-0a0c-260015fa0bbb@amd.com>
 <20201211115549.32ade81b@eldfell>
 <53f5b48c-c2b5-ed66-0c0e-bba0b22dba03@gmail.com>
 <20201211142019.19dae2aa@eldfell>
 <c262b694-fb5d-accd-2582-4adb967ea890@amd.com>
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
 Christian =?UTF-8?B?S8O2bmln?= <ckoenig.leichtzumerken@gmail.com>,
 Shashank Sharma <shashank.sharma@amd.com>, amd-gfx@lists.freedesktop.org,
 Aurabindo Pillai <aurabindo.pillai@amd.com>,
 DRI Development <dri-devel@lists.freedesktop.org>, alexander.deucher@amd.com,
 wayne.lin@amd.com, nicholas.kazlauskas@amd.com
Content-Type: multipart/mixed; boundary="===============1594052206=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--===============1594052206==
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/=Kwbv0YQf.ATWobqsOqhbo3"; protocol="application/pgp-signature"

--Sig_/=Kwbv0YQf.ATWobqsOqhbo3
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Mon, 14 Dec 2020 21:57:25 +0100
Christian K=C3=B6nig <christian.koenig@amd.com> wrote:

> Am 11.12.20 um 13:20 schrieb Pekka Paalanen:
> > On Fri, 11 Dec 2020 11:28:36 +0100
> > Christian K=C3=B6nig <ckoenig.leichtzumerken@gmail.com> wrote:
> > =20
> >> Am 11.12.20 um 10:55 schrieb Pekka Paalanen: =20
> >>> On Fri, 11 Dec 2020 09:56:07 +0530
> >>> Shashank Sharma <shashank.sharma@amd.com> wrote:
> >>>    =20
> >>>> Hello Simon,
> >>>>
> >>>> Hope you are doing well,
> >>>>
> >>>> I was helping out Aurabindo and the team with the design, so I have
> >>>> taken the liberty of adding some comments on behalf of the team,
> >>>> Inline.
> >>>>
> >>>> On 11/12/20 3:31 am, Simon Ser wrote: =20
> >>>>> Hi,
> >>>>>
> >>>>> (CC dri-devel, Pekka and Martin who might be interested in this as
> >>>>> well.) =20
> >>> Thanks for the Cc! This is very interesting to me, and because it was
> >>> not Cc'd to dri-devel@ originally, I would have missed this otherwise.
> >>>    =20
> >>>>> On Thursday, December 10th, 2020 at 7:48 PM, Aurabindo Pillai <aura=
bindo.pillai@amd.com> wrote:
> >>>>>       =20
> >>>>>> This patchset enables freesync video mode usecase where the usersp=
ace
> >>>>>> can request a freesync compatible video mode such that switching t=
o this
> >>>>>> mode does not trigger blanking.
> >>>>>>
> >>>>>> This feature is guarded by a module parameter which is disabled by
> >>>>>> default. Enabling this paramters adds additional modes to the driv=
er
> >>>>>> modelist, and also enables the optimization to skip modeset when u=
sing
> >>>>>> one of these modes. =20
> >>>>> Thanks for working on this, it's an interesting feature! However I'=
d like to
> >>>>> take some time to think about the user-space API for this.
> >>>>>
> >>>>> As I understand it, some new synthetic modes are added, and user-sp=
ace can
> >>>>> perform a test-only atomic *without* ALLOW_MODESET to figure out wh=
ether it can
> >>>>> switch to a mode without blanking the screen. =20
> >>>> The implementation is in those lines, but a bit different. The idea
> >>>> is to:
> >>>>
> >>>> - check if the monitor supports VRR,
> >>>>
> >>>> - If it does, add some new modes which are in the VRR tolerance
> >>>> range, as new video modes in the list (with driver flag).
> >>>>
> >>>> - when you get modeset on any of these modes, skip the full modeset,
> >>>> and just adjust the front_porch timing
> >>>>
> >>>> so they are not test-only as such, for any user-space these modes
> >>>> will be as real as any other probed modes of the list. =20
> >>> But is it worth to allow a modeset to be glitch-free if the userspace
> >>> does not know they are glitch-free? I think if this is going in, it
> >>> would be really useful to give the guarantees to userspace explicitly,
> >>> and not leave this feature at an "accidentally no glitch sometimes"
> >>> level.
> >>>
> >>>
> >>> I have been expecting and hoping for the ability to change video mode
> >>> timings without a modeset ever since I learnt that VRR is about
> >>> front-porch adjustment, quite a while ago.
> >>>
> >>> This is how I envision userspace making use of it:
> >>>
> >>> Let us have a Wayland compositor, which uses fixed-frequency video
> >>> modes, because it wants predictable vblank cycles. IOW, it will not
> >>> enable VRR as such. =20
> >> Well in general please keep in mind that this is just a short term
> >> solution for X11 applications. =20
> > I guess someone should have mentioned that. :-)
> >
> > Do we really want to add more Xorg-only features in the kernel? =20
>=20
> Well, my preferred solution was to add the mode in userspace instead :)
>=20
> > It feels like "it's a short term solution for X11" could be almost used
> > as an excuse to avoid proper uAPI design process. However, with uAPI
> > there is no "short term". Once it's in, it's there for decades. So why
> > does it matter if you design it for Xorg foremost? Are others forbidden
> > to make use of it? Or do you deliberately want to design it so that
> > it's not generally useful and it will indeed end up being a short term
> > feature? Planned obsolescence from the start? =20
>=20
> Yes exactly. We need something which works for now and can be removed=20
> again later on when we have a better solution. Adding some extra modes=20
> is not considered UAPI since both displays and drivers are doing this=20
> for a couple of different purposes already.
>=20
> Another main reason is that this approach works with existing media=20
> players like mpv and kodi without changing them because we do pretty=20
> much the same thing in the kernel which TVs do in their EDID.
>=20
> E.g. when starting to play a video kodi will automatically try to switch=
=20
> to a mode which has the same fps as the video.

Aha! That is very valuable information to put this proposal into
perspective. I'll leave you to it, then. :-)


Thanks,
pq

--Sig_/=Kwbv0YQf.ATWobqsOqhbo3
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEJQjwWQChkWOYOIONI1/ltBGqqqcFAl/Tc9oACgkQI1/ltBGq
qqfWEQ/9E9iMeIp4EXYHD5mHJYT6MO1lHrCWlKkvcV04XqnrVHlYEzZAh1IMCYPU
LvZXsRyBXF/IABh840J4vtBTcqrUxRNUq6RAuus51y3/5N5QYcTyJcG4wrUSkSq9
GkdinlLXB0XJfx2PrpGvfcAg3Ye297XFnfuSRakQ2038knk57e7twkN3ckSMD0TQ
D7NTnfNuNaGJZ70CeoJXIxzJ6vuUYM6SY/mnlhEJ6tgSzCt3laIF5Qk80GdigDXi
2SXflZtidug1IrH+EJvu34QE+M2b94zha9d0dUL75vpAUgETjVcpf2Ki7S2kkcDq
gyOIqdXg7vqoDxh18ew1C03anHctaMvC7w+nYzeOP3aLU1UdArryx6OGpxm79VR6
1qUbZHz+wLF16O+uzfAxNFKb+CyCLKulxK0ACqRb3ny5BxmH3LXBVHJi01FgEt9t
Jm9Mh1hfJVZJVQyFi8aLLzz1mKRX8KToeeKApXFyKmM6sLcMm9ZZAx9/rtsQcqLg
FAkzjUiZzouhrcTX4U6Uw1syAkKo5EmXV60Xhd1dwHNPO/U7KiTsWP57/PJDrcWg
E7E9kLVeiOzgnRtvgZ64VSurWlFyqN1bJRsWi9+mPqaKCZIlhS8D5bHFCI7MHzqM
eWymRtFkVkOv+ibTgke0GaBjrPMMUcunhqXrpqNQkOgL84x7VU4=
=/sMt
-----END PGP SIGNATURE-----

--Sig_/=Kwbv0YQf.ATWobqsOqhbo3--

--===============1594052206==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============1594052206==--
