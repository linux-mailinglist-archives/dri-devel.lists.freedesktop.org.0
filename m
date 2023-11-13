Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8EE737E9A0B
	for <lists+dri-devel@lfdr.de>; Mon, 13 Nov 2023 11:18:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D9D5F10E34E;
	Mon, 13 Nov 2023 10:18:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-4018.proton.ch (mail-4018.proton.ch [185.70.40.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EF9B910E343;
 Mon, 13 Nov 2023 10:18:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=emersion.fr;
 s=protonmail2; t=1699870701; x=1700129901;
 bh=+/YfIW/pT4s5zdDMPUXLMu85WM0sSTZW2lyua24kskM=;
 h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
 Message-ID:BIMI-Selector;
 b=YP7BqHIktQ5yGf5dMgiouWVxsJ+oFkZlEHBmOpCGieOqEy2mzHI0Wsg1TDV1hr5EU
 qRpFNsWQ3kVufohHzAwtZ2I3SV/dAsfBm0dXhMLgFbkp7YLxsB6fiGgmTWeuAFEvi9
 wZBlt436yZpm7+gJS674fLMTiJJy/UjYAZTzkhMkelog012YNW4KQvV9Xt/6/aRNSG
 Jrl0Ugls5v52PFBb5JmU13tBXA0x0sHXV4cT88zie7mcz/+ujiR4s0sWRmMwALTUlv
 BpMphDEE2zGIBsts+bpbb+5j4roe+zBBUSH0PZIw4lPHzM1d3j8jCilA8EJCutp+3e
 6FGEtBBdTJHtg==
Date: Mon, 13 Nov 2023 10:18:10 +0000
To: Pekka Paalanen <ppaalanen@gmail.com>
From: Simon Ser <contact@emersion.fr>
Subject: Re: [PATCH v6 6/6] drm/doc: Define KMS atomic state set
Message-ID: <A9EI0AgwZxcdx6LCSZgcQdCbGgJYq0RK1__mATZ_tsLiZEXbYQ_akrfCv7CPOkyV7EPex0UoVgDpyYoBWHy_B_sMs-aanDXd8rZlzJpqtrA=@emersion.fr>
In-Reply-To: <20231113121508.16a75352@eldfell>
References: <20230815185710.159779-1-andrealmeid@igalia.com>
 <ZS1ST6XAUHilBg3d@intel.com>
 <8NqDNz1Y8H5I_WhNhOj0ERarBH7nJhGQAsDHbmSnwzoOFtXPBPILwxLlF8-vDPKR06Uknp1BDSt7-6gTmHls62k79ETajXDfPRsmIP-cZN0=@emersion.fr>
 <ZS55mXTSxpXKYbsd@intel.com>
 <mawSNnD1hQ6vCVrNVMAvuQESnTToKPXrtiHIXXdqC-mq_LkxWOizPCcXx_KiEASVX-Mbm0LgjfTYkMNOjSAKCldpkXHAd9MmRzbC8ECPsTs=@emersion.fr>
 <5_NYn1PEc-XUYiRf5fC9oQqTaJxoAuvHVvw1PVTume5m8_cbOyku2Q2XKdCm66g0WcMq_RL8oSp52AowBzX9WAEiVBgdmYtPeXI9SWnD6Ts=@emersion.fr>
 <20231113113804.6e2adfa8@eldfell>
 <ha7UwaZ0eilF_Hl6wWqJXJQ0oy9_rD1FKUNDwIlNxC-vT3InSP4bpTRwVnZG9QvzZBsX4W-p_vz5FfByoAXuGewyhVtwVd4KyRSMJ4G8cQ4=@emersion.fr>
 <20231113121508.16a75352@eldfell>
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
 amd-gfx@lists.freedesktop.org, kernel-dev@igalia.com,
 alexander.deucher@amd.com, joshua@froggi.es,
 wayland-devel@lists.freedesktop.org, hwentlan@amd.com,
 christian.koenig@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>






On Monday, November 13th, 2023 at 11:15, Pekka Paalanen <ppaalanen@gmail.co=
m> wrote:


>=20
>=20
> On Mon, 13 Nov 2023 09:44:15 +0000
> Simon Ser contact@emersion.fr wrote:
>=20
> > On Monday, November 13th, 2023 at 10:38, Pekka Paalanen ppaalanen@gmail=
.com wrote:
> >=20
> > > On Mon, 13 Nov 2023 09:18:39 +0000
> > > Simon Ser contact@emersion.fr wrote:
> > >=20
> > > > On Monday, October 23rd, 2023 at 10:25, Simon Ser contact@emersion.=
fr wrote:
> > > >=20
> > > > > > > > > > > > > > +An atomic commit with the flag DRM_MODE_PAGE_F=
LIP_ASYNC is allowed to
> > > > > > > > > > > > > > +effectively change only the FB_ID property on =
any planes. No-operation changes
> > > > > > > > > > > > > > +are ignored as always. [...]
> > > > > > > > > > > > > > During the hackfest in Brno, it was mentioned t=
hat a commit which re-sets the same FB_ID could actually have an effect wit=
h VRR: It could trigger scanout of the next frame before vertical blank has=
 reached its maximum duration. Some kind of mechanism is required for this =
in order to allow user space to perform low frame rate compensation.
> > > > > > > > > > > >=20
> > > > > > > > > > > > Xaver tested this hypothesis in a flipping the same=
 fb in a VRR monitor
> > > > > > > > > > > > and it worked as expected, so this shouldn't be a c=
oncern.
> > > > > > > > > > > > Right, so it must have some effect. It cannot be si=
mply ignored like in
> > > > > > > > > > > > the proposed doc wording. Do we special-case re-set=
ting the same FB_ID
> > > > > > > > > > > > as "not a no-op" or "not ignored" or some other way=
?
> > > > > > > > > > > > There's an effect in the refresh rate, the image wo=
n't change but it
> > > > > > > > > > > > will report that a flip had happened asynchronously=
 so the reported
> > > > > > > > > > > > framerate will be increased. Maybe an additional wo=
rding could be like:
> > > > > > > > > >=20
> > > > > > > > > > Flipping to the same FB_ID will result in a immediate f=
lip as if it was
> > > > > > > > > > changing to a different one, with no effect on the imag=
e but effecting
> > > > > > > > > > the reported frame rate.
> > > > > > > > >=20
> > > > > > > > > Re-setting FB_ID to its current value is a special case r=
egardless of
> > > > > > > > > PAGE_FLIP_ASYNC, is it not?
> > > > > > > >=20
> > > > > > > > No. The rule has so far been that all side effects are obse=
rved
> > > > > > > > even if you flip to the same fb. And that is one of my anno=
yances
> > > > > > > > with this proposal. The rules will now be different for asy=
nc flips
> > > > > > > > vs. everything else.
> > > > > > >=20
> > > > > > > Well with the patches the async page-flip case is exactly the=
 same as
> > > > > > > the non-async page-flip case. In both cases, if a FB_ID is in=
cluded in
> > > > > > > an atomic commit then the side effects are triggered even if =
the property
> > > > > > > value didn't change. The rules are the same for everything.
> > > > > >=20
> > > > > > I see it only checking if FB_ID changes or not. If it doesn't
> > > > > > change then the implication is that the side effects will in
> > > > > > fact be skipped as not all planes may even support async flips.
> > > > >=20
> > > > > Hm right. So the problem is that setting any prop =3D same value =
as
> > > > > previous one will result in a new page-flip for asynchronous page=
-flips,
> > > > > but will not result in any side-effect for asynchronous page-flip=
s.
> > > > >=20
> > > > > Does it actually matter though? For async page-flips, I don't thi=
nk this
> > > > > would result in any actual difference in behavior?
> > >=20
> > > Hi Simon,
> > >=20
> > > a fly-by question...
> > >=20
> > > > To sum this up, here is a matrix of behavior as seen by user-space:
> > > >=20
> > > > - Sync atomic page-flip
> > > > - Set FB_ID to different value: programs hw for page-flip, sends ue=
vent
> > > > - Set FB_ID to same value: same (important for VRR)
> > > > - Set another plane prop to same value: same
> > > > - Set another plane prop to different value: maybe rejected if mode=
set required
> > > > - Async atomic page-flip
> > > > - Set FB_ID to different value: updates hw with new FB address, sen=
ds
> > > > immediate uevent
> > > > - Set FB_ID to same value: same (no-op for the hw)
> > >=20
> > > It should not be a no-op for the hw, because the hw might be in the
> > > middle of a VRR front-porch waiting period, and the commit needs to e=
nd
> > > the waiting immediately rather than time out?
> >=20
> > I'm not sure
>=20
> Would people not want to use async commits to trigger new VRR scanout
> cycles without content updates?
>=20
> I seem to recall previous comments that switching between sync and
> async commit modes may take a moment (intel's one last sync flip), so
> using sync once in a while then using async otherwise is probably not a
> good idea.

Sorry, my line got cut off. I meant: "I'm not sure what you mean".

> > > > - Set another plane prop to same value: ignored, sends immediate ue=
vent
> > > > (special codepath)
> > >=20
> > > If the sync case says "same", then shouldn't this say "same" as well =
to
> > > be consistent?
> >=20
> > Okay, I think I chose my words badly. By "same" I meant "same as
> > previous item in the list".
> >=20
> > Here I tried to be more explicit and explain why it's the same behavior=
.
> > We have a special path in the kernel code that ignores the change, but
> > the effective result is that it doesn't differ from the sync case.
> >=20
> > Here's a fixed matrix where I don't use confusing words:
> >=20
> > - Sync atomic page-flip
> > - Set FB_ID to different value: programs hw for page-flip, sends uevent
> > - Set FB_ID to same value: programs hw for page-flip, sends uevent (imp=
ortant
> > for VRR)
> > - Set another plane prop to same value: programs hw for page-flip, send=
s
> > uevent
>=20
> Programming hw for page-flip probably triggers a new VRR scanout cycle,
> even if the FB address didn't change.
>=20
> > - Set another plane prop to different value: maybe rejected if modeset =
required
> > - Async atomic page-flip
> > - Set FB_ID to different value: updates hw with new FB address, sends
> > immediate uevent
> > - Set FB_ID to same value: updates hw with new FB address (no-op for th=
e hw),
> > sends immediate uevent
> > - Set another plane prop to same value: ignored, sends immediate uevent
> > (special codepath)
>=20
> Just like Michel points out: if this case has a special case ignoring
> the set, then this case will not trigger a new VRR scanout cycle like
> the corresponding sync case does.

Ignore the prop change, but still include the CRTC in the commit, so
everything is fine.
