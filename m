Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BB6A7E98C0
	for <lists+dri-devel@lfdr.de>; Mon, 13 Nov 2023 10:18:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4CE0D10E305;
	Mon, 13 Nov 2023 09:18:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-4018.proton.ch (mail-4018.proton.ch [185.70.40.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A9AFB10E323
 for <dri-devel@lists.freedesktop.org>; Mon, 13 Nov 2023 09:18:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=emersion.fr;
 s=protonmail2; t=1699867130; x=1700126330;
 bh=VU3Btx3X1J18kU8FRZV64T6jpyvkk76C3q96fshTW9M=;
 h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
 Message-ID:BIMI-Selector;
 b=XnUcvUArSCQOnEtR/0UdpLNtbq3cDulWZ1WSRb6gDsCuL/IVyzMGnWm/j+BZB462N
 Awgu8OIsprWFFVx4xrQ3KdjsgmCicnCK1Dy5bgRaN45C4iPqVdxQl5yrWvqKGda3LL
 Nt6PJHKcmTLBVvpkGZt+UVNmVjDxUyj86d4AIgMjs/OSjEEdxv49qUZP2jiZK/HwIA
 kd2CSWA6TpXwECFlwkoo0GTjfSEuJ87b0bik3I3Gv+qgaJDlaI16sZQ7IGP3XFZPqb
 OpwzBvxE6xlzAmU7rWWX9qoSA76IRISyhE5IsHslGnb1q4oPrQSbyu6JMx4ZsYHagG
 hQKeymDlS49Qw==
Date: Mon, 13 Nov 2023 09:18:39 +0000
To: =?utf-8?Q?Ville_Syrj=C3=A4l=C3=A4?= <ville.syrjala@linux.intel.com>
From: Simon Ser <contact@emersion.fr>
Subject: Re: [PATCH v6 6/6] drm/doc: Define KMS atomic state set
Message-ID: <5_NYn1PEc-XUYiRf5fC9oQqTaJxoAuvHVvw1PVTume5m8_cbOyku2Q2XKdCm66g0WcMq_RL8oSp52AowBzX9WAEiVBgdmYtPeXI9SWnD6Ts=@emersion.fr>
In-Reply-To: <mawSNnD1hQ6vCVrNVMAvuQESnTToKPXrtiHIXXdqC-mq_LkxWOizPCcXx_KiEASVX-Mbm0LgjfTYkMNOjSAKCldpkXHAd9MmRzbC8ECPsTs=@emersion.fr>
References: <20230815185710.159779-1-andrealmeid@igalia.com>
 <b48bd1fc-fcb0-481b-8413-9210d44d709b@igalia.com>
 <20231016151856.74af9305@eldfell>
 <aa424bf8-5652-4a44-9b93-bdc0a31d835a@igalia.com>
 <20231016175222.7a89e6ab@eldfell> <ZS1ST6XAUHilBg3d@intel.com>
 <8NqDNz1Y8H5I_WhNhOj0ERarBH7nJhGQAsDHbmSnwzoOFtXPBPILwxLlF8-vDPKR06Uknp1BDSt7-6gTmHls62k79ETajXDfPRsmIP-cZN0=@emersion.fr>
 <ZS55mXTSxpXKYbsd@intel.com>
 <mawSNnD1hQ6vCVrNVMAvuQESnTToKPXrtiHIXXdqC-mq_LkxWOizPCcXx_KiEASVX-Mbm0LgjfTYkMNOjSAKCldpkXHAd9MmRzbC8ECPsTs=@emersion.fr>
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
 =?utf-8?Q?Michel_D=C3=A4nzer?= <michel.daenzer@mailbox.org>,
 Randy Dunlap <rdunlap@infradead.org>, xaver.hugl@gmail.com,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Pekka Paalanen <ppaalanen@gmail.com>, amd-gfx@lists.freedesktop.org,
 kernel-dev@igalia.com, alexander.deucher@amd.com,
 wayland-devel@lists.freedesktop.org, hwentlan@amd.com,
 christian.koenig@amd.com, joshua@froggi.es
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Monday, October 23rd, 2023 at 10:25, Simon Ser <contact@emersion.fr> wro=
te:

> > > > > > > > > > +An atomic commit with the flag DRM_MODE_PAGE_FLIP_ASYN=
C is allowed to
> > > > > > > > > > +effectively change only the FB_ID property on any plan=
es. No-operation changes
> > > > > > > > > > +are ignored as always. [...]
> > > > > > > > > > During the hackfest in Brno, it was mentioned that a co=
mmit which re-sets the same FB_ID could actually have an effect with VRR: I=
t could trigger scanout of the next frame before vertical blank has reached=
 its maximum duration. Some kind of mechanism is required for this in order=
 to allow user space to perform low frame rate compensation.
> > > > > > > >=20
> > > > > > > > Xaver tested this hypothesis in a flipping the same fb in a=
 VRR monitor
> > > > > > > > and it worked as expected, so this shouldn't be a concern.
> > > > > > > > Right, so it must have some effect. It cannot be simply ign=
ored like in
> > > > > > > > the proposed doc wording. Do we special-case re-setting the=
 same FB_ID
> > > > > > > > as "not a no-op" or "not ignored" or some other way?
> > > > > > > > There's an effect in the refresh rate, the image won't chan=
ge but it
> > > > > > > > will report that a flip had happened asynchronously so the =
reported
> > > > > > > > framerate will be increased. Maybe an additional wording co=
uld be like:
> > > > > >=20
> > > > > > Flipping to the same FB_ID will result in a immediate flip as i=
f it was
> > > > > > changing to a different one, with no effect on the image but ef=
fecting
> > > > > > the reported frame rate.
> > > > >=20
> > > > > Re-setting FB_ID to its current value is a special case regardles=
s of
> > > > > PAGE_FLIP_ASYNC, is it not?
> > > >=20
> > > > No. The rule has so far been that all side effects are observed
> > > > even if you flip to the same fb. And that is one of my annoyances
> > > > with this proposal. The rules will now be different for async flips
> > > > vs. everything else.
> > >=20
> > > Well with the patches the async page-flip case is exactly the same as
> > > the non-async page-flip case. In both cases, if a FB_ID is included i=
n
> > > an atomic commit then the side effects are triggered even if the prop=
erty
> > > value didn't change. The rules are the same for everything.
> >=20
> > I see it only checking if FB_ID changes or not. If it doesn't
> > change then the implication is that the side effects will in
> > fact be skipped as not all planes may even support async flips.
>=20
> Hm right. So the problem is that setting any prop =3D same value as
> previous one will result in a new page-flip for asynchronous page-flips,
> but will not result in any side-effect for asynchronous page-flips.
>=20
> Does it actually matter though? For async page-flips, I don't think this
> would result in any actual difference in behavior?

To sum this up, here is a matrix of behavior as seen by user-space:

- Sync atomic page-flip
  - Set FB_ID to different value: programs hw for page-flip, sends uevent
  - Set FB_ID to same value: same (important for VRR)
  - Set another plane prop to same value: same
  - Set another plane prop to different value: maybe rejected if modeset re=
quired
- Async atomic page-flip
  - Set FB_ID to different value: updates hw with new FB address, sends
    immediate uevent
  - Set FB_ID to same value: same (no-op for the hw)
  - Set another plane prop to same value: ignored, sends immediate uevent
    (special codepath)
  - Set another plane prop to different value: always rejected

To me sync and async look consistent.
