Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A5F3F7E9959
	for <lists+dri-devel@lfdr.de>; Mon, 13 Nov 2023 10:47:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 11FD810E330;
	Mon, 13 Nov 2023 09:47:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-4323.proton.ch (mail-4323.proton.ch [185.70.43.23])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 53D7710E32E;
 Mon, 13 Nov 2023 09:47:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=emersion.fr;
 s=protonmail2; t=1699868838; x=1700128038;
 bh=Jv3HMgEE4Gwun+QGpWgOt7T4wtyMLsGYWjC4ye0QvZo=;
 h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
 Message-ID:BIMI-Selector;
 b=C41kEeKDWUej2yun47dY7ptO4/lScs+lNGxeZmajXswRhbwJZ1HeqJEK41uXnolD6
 pJPZ+uRNqufJDETjE895v/w7Lg5O0F0tT23kRYoYzPJehaabRLS287Lha9+56My/Xd
 YM/im5uQ5VXX0pG4sW+SYEW35QbJYUrMU+7FhoLs/Z3HhFPXvfbErDGAQbbgSG/LJ2
 sd6UEmtyZrYvI0V3McdCx14efM9z19532ncdOBkinQGokGC3gPDCbx0qfsD5f6O833
 diytSyibxbv9Qo6nC3GbUbZqGm1dI/iMz+g27C8jaNGENdJ2VrRHSqDW8tIL/igNOf
 R9NLh5j4sdqtw==
Date: Mon, 13 Nov 2023 09:47:04 +0000
To: =?utf-8?Q?Michel_D=C3=A4nzer?= <michel.daenzer@mailbox.org>
From: Simon Ser <contact@emersion.fr>
Subject: Re: [PATCH v6 6/6] drm/doc: Define KMS atomic state set
Message-ID: <lpel36VSNcFmcpY-E0tWcyO88CxmVfIdAMNYkkyxRy8ELbvM5xEZS68zxsK3JncHlkjQnxdE8vbKsJT_RZSGRCkPSiTvbXZWqOER6ZtpL2A=@emersion.fr>
In-Reply-To: <438f2960-c49e-6485-5916-20d6e69ef7d4@mailbox.org>
References: <20230815185710.159779-1-andrealmeid@igalia.com>
 <aa424bf8-5652-4a44-9b93-bdc0a31d835a@igalia.com>
 <20231016175222.7a89e6ab@eldfell> <ZS1ST6XAUHilBg3d@intel.com>
 <8NqDNz1Y8H5I_WhNhOj0ERarBH7nJhGQAsDHbmSnwzoOFtXPBPILwxLlF8-vDPKR06Uknp1BDSt7-6gTmHls62k79ETajXDfPRsmIP-cZN0=@emersion.fr>
 <ZS55mXTSxpXKYbsd@intel.com>
 <mawSNnD1hQ6vCVrNVMAvuQESnTToKPXrtiHIXXdqC-mq_LkxWOizPCcXx_KiEASVX-Mbm0LgjfTYkMNOjSAKCldpkXHAd9MmRzbC8ECPsTs=@emersion.fr>
 <5_NYn1PEc-XUYiRf5fC9oQqTaJxoAuvHVvw1PVTume5m8_cbOyku2Q2XKdCm66g0WcMq_RL8oSp52AowBzX9WAEiVBgdmYtPeXI9SWnD6Ts=@emersion.fr>
 <438f2960-c49e-6485-5916-20d6e69ef7d4@mailbox.org>
Feedback-ID: 1358184:user:proton
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
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
 =?utf-8?Q?Andr=C3=A9_Almeida?= <andrealmeid@igalia.com>,
 =?utf-8?Q?=27Marek_Ol=C5=A1=C3=A1k=27?= <maraeo@gmail.com>,
 Randy Dunlap <rdunlap@infradead.org>, xaver.hugl@gmail.com,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Pekka Paalanen <ppaalanen@gmail.com>, amd-gfx@lists.freedesktop.org,
 kernel-dev@igalia.com, alexander.deucher@amd.com, joshua@froggi.es,
 wayland-devel@lists.freedesktop.org, hwentlan@amd.com,
 christian.koenig@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Monday, November 13th, 2023 at 10:41, Michel D=C3=A4nzer <michel.daenzer=
@mailbox.org> wrote:

> On 11/13/23 10:18, Simon Ser wrote:
>=20
> > On Monday, October 23rd, 2023 at 10:25, Simon Ser contact@emersion.fr w=
rote:
> >=20
> > > > > > > > > > > > +An atomic commit with the flag DRM_MODE_PAGE_FLIP_=
ASYNC is allowed to
> > > > > > > > > > > > +effectively change only the FB_ID property on any =
planes. No-operation changes
> > > > > > > > > > > > +are ignored as always. [...]
> > > > > > > > > > > > During the hackfest in Brno, it was mentioned that =
a commit which re-sets the same FB_ID could actually have an effect with VR=
R: It could trigger scanout of the next frame before vertical blank has rea=
ched its maximum duration. Some kind of mechanism is required for this in o=
rder to allow user space to perform low frame rate compensation.
> > > > > > > > > >=20
> > > > > > > > > > Xaver tested this hypothesis in a flipping the same fb =
in a VRR monitor
> > > > > > > > > > and it worked as expected, so this shouldn't be a conce=
rn.
> > > > > > > > > > Right, so it must have some effect. It cannot be simply=
 ignored like in
> > > > > > > > > > the proposed doc wording. Do we special-case re-setting=
 the same FB_ID
> > > > > > > > > > as "not a no-op" or "not ignored" or some other way?
> > > > > > > > > > There's an effect in the refresh rate, the image won't =
change but it
> > > > > > > > > > will report that a flip had happened asynchronously so =
the reported
> > > > > > > > > > framerate will be increased. Maybe an additional wordin=
g could be like:
> > > > > > > >=20
> > > > > > > > Flipping to the same FB_ID will result in a immediate flip =
as if it was
> > > > > > > > changing to a different one, with no effect on the image bu=
t effecting
> > > > > > > > the reported frame rate.
> > > > > > >=20
> > > > > > > Re-setting FB_ID to its current value is a special case regar=
dless of
> > > > > > > PAGE_FLIP_ASYNC, is it not?
> > > > > >=20
> > > > > > No. The rule has so far been that all side effects are observed
> > > > > > even if you flip to the same fb. And that is one of my annoyanc=
es
> > > > > > with this proposal. The rules will now be different for async f=
lips
> > > > > > vs. everything else.
> > > > >=20
> > > > > Well with the patches the async page-flip case is exactly the sam=
e as
> > > > > the non-async page-flip case. In both cases, if a FB_ID is includ=
ed in
> > > > > an atomic commit then the side effects are triggered even if the =
property
> > > > > value didn't change. The rules are the same for everything.
> > > >=20
> > > > I see it only checking if FB_ID changes or not. If it doesn't
> > > > change then the implication is that the side effects will in
> > > > fact be skipped as not all planes may even support async flips.
> > >=20
> > > Hm right. So the problem is that setting any prop =3D same value as
> > > previous one will result in a new page-flip for asynchronous page-fli=
ps,
> > > but will not result in any side-effect for asynchronous page-flips.
> > >=20
> > > Does it actually matter though? For async page-flips, I don't think t=
his
> > > would result in any actual difference in behavior?
> >=20
> > To sum this up, here is a matrix of behavior as seen by user-space:
> >=20
> > - Sync atomic page-flip
> > - Set FB_ID to different value: programs hw for page-flip, sends uevent
> > - Set FB_ID to same value: same (important for VRR)
> > - Set another plane prop to same value: same
>=20
> A page flip is programmed even if FB_ID isn't touched?

I believe so. Set CRTC_X on a plane to the same value as before, and the
CRTC gets implicitly included in the atomic commit?

> > - Set another plane prop to different value: maybe rejected if modeset =
required
> > - Async atomic page-flip
> > - Set FB_ID to different value: updates hw with new FB address, sends
> > immediate uevent
> > - Set FB_ID to same value: same (no-op for the hw)
>=20
> No-op implies it doesn't trigger scanning out a frame with VRR, if
> scanout is currently in vertical blank. Is that the case? If so, async
> flips can't reliably trigger scanning out a frame with VRR.

By no-op I mean that the hw is programmed for an immediate async flip
with the same buffer addr as the previous one. So this doesn't actually
change anything.
