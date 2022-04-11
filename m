Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 562384FBB0C
	for <lists+dri-devel@lfdr.de>; Mon, 11 Apr 2022 13:34:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7AB7210E32E;
	Mon, 11 Apr 2022 11:34:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com
 [IPv6:2a00:1450:4864:20::12e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E77DE10E166;
 Mon, 11 Apr 2022 11:34:21 +0000 (UTC)
Received: by mail-lf1-x12e.google.com with SMTP id b21so26079574lfb.5;
 Mon, 11 Apr 2022 04:34:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=date:from:to:cc:subject:message-id:in-reply-to:references
 :mime-version; bh=Bj/qJtBKGlrrssMwvWVXetuKsOALuQMofW3+z6KVKIM=;
 b=TZUte3j4T1YWP/LHzKMtebyKdGsE3s9zwEhocZvdDm3vHd+f0ZYqHvw6UWSUgEk8wq
 nL7jpbX2saAlunaSdG9ZzJwIWAYNZlnL1FeYfjVIiPsz4rsQDKFB6kLsKFAtuKOZvlXP
 f0oQmu9ZLOwU3iS33zwdYRF3d5YwbPilRpmDRFWholb0oRj+42yfUZ27WOazW6ko2YBx
 H52aogAKJLqFb5UPykTtLREPVdC56ItsgDH+Q8mq/bMvc8bHuApUcmJ+IifQpLtiMVRy
 SLReEUlD5/mgkHo57TSQmXSoXReeoie8NCm36HHb0BM6y7nRhbbM/1oMX/8xfUxchGA8
 PeRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:mime-version;
 bh=Bj/qJtBKGlrrssMwvWVXetuKsOALuQMofW3+z6KVKIM=;
 b=mUj5X2mpzf/1jj17CZ0T1XVtM0MWbZ5uESKs5u3mY3hC+AFeJnnx9ldlNU0yPUj+Hu
 53AgEqS+Y9AA9NhL8/FagfFmQaCw2ZEVdMdbQlyaOZyny4d0SvmByrua3+Zm7vO6YTd3
 7c/ct1EKWTep5bfltWTHWBnf2SuhVEjhdGYQ/ZKCFlQ86cTjb0DeSMknJ6VVk1AVxFCL
 +ofrKq1qYCUA++lqbRXZBX3/qQhHAdh4mpqz7xlNGzjsTMCfdnBkadhY0Mq6zMhXCCoi
 BjNil1nPiaftsIoBGcjjHWsLSJaG8Poch4kaHDfLZiyFxROGxfV82sW25o+XXmabNppw
 ggOw==
X-Gm-Message-State: AOAM530R8vaOtNRwH6xId0JKfDxQE1LUxTh9CX0ATKOdBvho0AzskYMv
 tT1G9wevPbFxKgEAkFqPoIg=
X-Google-Smtp-Source: ABdhPJw6R/gFQ4QGBtyjveZAGPhcOpE3FA3V3G0Ny7i47U1U7JDEP+glo0pt+iFCXLLVjlZEZmCSAg==
X-Received: by 2002:a05:6512:1151:b0:44a:6d05:8d2d with SMTP id
 m17-20020a056512115100b0044a6d058d2dmr21643018lfg.442.1649676860176; 
 Mon, 11 Apr 2022 04:34:20 -0700 (PDT)
Received: from eldfell ([194.136.85.206]) by smtp.gmail.com with ESMTPSA id
 q12-20020a196e4c000000b0046ba44bec79sm420526lfk.133.2022.04.11.04.34.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 11 Apr 2022 04:34:19 -0700 (PDT)
Date: Mon, 11 Apr 2022 14:34:16 +0300
From: Pekka Paalanen <ppaalanen@gmail.com>
To: Hans de Goede <hdegoede@redhat.com>
Subject: Re: [RFC] drm/kms: control display brightness through drm_connector
 properties
Message-ID: <20220411143416.04a65b5d@eldfell>
In-Reply-To: <a42f03bf-bf85-b08e-fa4f-e36a226922bc@redhat.com>
References: <0d188965-d809-81b5-74ce-7d30c49fee2d@redhat.com>
 <dP36CeeNjDVKgcJzbBAdkNM0HzB3N5Uzd6cgBcmrb5mA6xzWs9AKMmRdMKG2y6c1geMhZ1i8hONKQmxYYHN-ZhRLGT_TXz5IhtqnJSWBD9Q=@emersion.fr>
 <0e1cffc1-e8b6-dc58-56ff-53f911f33e60@redhat.com>
 <CADnq5_OGtERRYUPLskgjVD4eLbb2PxKdzcr+xmR2mRMAK73Log@mail.gmail.com>
 <Yk/tOG+iga/wj/Gt@phenom.ffwll.local>
 <CADnq5_NT=pSZwvMN_0_S4duk-StRxh0JcsraJo+erPDkq+GyJg@mail.gmail.com>
 <4a3cf9b6-1e08-c08c-bebd-ec2ca648059c@redhat.com>
 <CADnq5_M2zLedFmAS+udyg1zRavv-aCm1hRY+t=qW7wD33JEALg@mail.gmail.com>
 <a42f03bf-bf85-b08e-fa4f-e36a226922bc@redhat.com>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/6zBsQwNPcDayn6niPJ_fz6p";
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
 Martin Roukala <martin.roukala@mupuf.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 wayland <wayland-devel@lists.freedesktop.org>,
 Christoph Grenz <christophg+lkml@grenz-bonn.de>,
 Yusuf Khan <yusisamerican@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--Sig_/6zBsQwNPcDayn6niPJ_fz6p
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

On Mon, 11 Apr 2022 12:18:30 +0200
Hans de Goede <hdegoede@redhat.com> wrote:

> Hi,
>=20
> On 4/8/22 17:11, Alex Deucher wrote:
> > On Fri, Apr 8, 2022 at 10:56 AM Hans de Goede <hdegoede@redhat.com> wro=
te: =20
> >>

...

> > So set it to a level we can guarantee can call it 0.  If we have the
> > flag we are just punting on the problem in my opinion. =20
>=20
> Right this an impossible problem to solve so the intent is indeed
> to punt this to userspace, which IMHO is the best thing we can do
> here.  The idea behind the "bl_brightness_0_is_min_brightness:
> ro, boolean" property is to provide a hint to userspace to help
> userspace deal with this (and if userspace ends up using e.g.
> systemd's hwdb for this to avoid unnecessary entries in hwdb).
>=20
> >  The kernel
> > driver would seem to have a better idea what is a valid minimum than
> > some arbitrary userspace application. =20
>=20
> If the kernel driver knows the valid minimum then it can make 0
> actually be that valid minimum as you suggest and it can set the
> hint flag to let userspace know this. OTOH there are many cases
> where the kernel's guess is just as bad as userspace's guess and
> there are too many laptops where this is the case to quirk
> ourselves out of this situation.
>=20
> > Plus then if we need a
> > workaround for what is the minimum valid brightness, we can fix it one
> > place rather than letting every application try and fix it. =20
>=20
> I wish we could solve this in the kernel, but at least on
> laptops with Intel integrated gfx many vendors don't bother
> to put a non 0 value in the minimum duty-cycle field of the
> VBT, so there really is no good way to solve this.
>=20
> If the userspace folks ever want to do a database for this,
> I would expect them to do something with hwdb + udev which
> can then be shared between the different desktop-environments.

Hi Hans,

assuming that it is impossible to reach a reasonable user experience by
having a quirk database in the kernel in order to offer a consistent
definition of bl_brightness=3D0, then should you not be recommending a
userspace hwdb solution with full steam, rather than adding a hint in
the kernel that might be just enough to have no-one ever bother
investing in a proper solution?

Re-reading your "bl_brightness_0_is_min_brightness" definition, it
seems to be specified as exposing a certain condition in the system.
When it is true, you imply that userspace can safely use value 0 as min
brightness, but that is assuming the hint is correct. How likely
is the hint incorrect? If the hint can be incorrect, does this hint
actually give anything to userspace, or would userspace still choose to
be safer than sorry and ignore the hint by assuming the worst?

Is this situation much different to the quirk database libinput needs
to work beautifully out of the box?

Should desktop environments offer a couple more "advanced
configuration" knobs for the lowest safe brightness value and the
value-to-perceived brightness mapping to calibrate the familiar
brightness slider? E.g. something like "click this button as soon as
you see it on the display" for finding the lowest usable brightness,
with defaults coming from a database.

If the situation is as grim as you say, I would propose to drop
"bl_brightness_0_is_min_brightness" (and
"bl_brightness_control_method"), and document the dangers of using too
low brightness values. Maybe also start looking for a project that
would be appropriate for hosting such a database, just to point people
to cooperate in a single place rather than each DE coming up with their
own.


Thanks,
pq

--Sig_/6zBsQwNPcDayn6niPJ_fz6p
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEJQjwWQChkWOYOIONI1/ltBGqqqcFAmJUEjgACgkQI1/ltBGq
qqcZzA//bbL+njFyctr6Ar5aLHI+V4sUE6lY4WXgp/K0RHWZNxAxaLAsMX8StKr2
kOUL5bKSpIIGtQP6sYFJRD6r/XcfdEjjzLDlh9JcMrjktWO1VQ5rLR2LZSgkjtqt
9fJgX4JGdBnfZyHWGyClOUxIkmc8ZJ+tMWo0OfxBxkIQ+mS0QtDQaSheXZotzvCT
yx2bEpWUNB6bmH+kB/PcTToHw4IxlCy0rNPSaxF3JgGGmNtAzqBwv1/8ABrE+s6h
69mFzSyQq2wT/Q2J55eOuJswp3iGRS28WUTqqY/hcEBzFHHVV5S4VmTo4vWHqczV
Xtij3+2LmMAqSogCdBBL2iix7HF2pzKKZeZl+pYOPgJA98M8jjjC6Mds7OGEZCdh
R8Lh7mcQX/QIndJbHF8CK83ktY3MeDeVObl6cM4h5bqx3j6X4RRV+epeH4xmWFwB
TyRXDtDcIDhmFc/mKV/wfp+ouO2M++t17QNsMX4fQ0g/bCxz5au1YFTVEQbRE4cS
fAGj/NBI8eG97lxb5o+vN0RKIAyJkIGn1qfq4p6hH025r34zmsyhS9aFF2QZPdwT
TJfu1kFBPqz4aoA6U0eO8nc2U1HtPdZR7/CGADg/u5jdZ5vGt7IqklY6geekzKZr
TuMEK1BB2qPT6jloZOf5VXtahWdw8LSljxzVRVGUTyagIdN99LY=
=NhT6
-----END PGP SIGNATURE-----

--Sig_/6zBsQwNPcDayn6niPJ_fz6p--
