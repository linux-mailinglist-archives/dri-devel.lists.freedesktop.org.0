Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A9167D2C9A
	for <lists+dri-devel@lfdr.de>; Mon, 23 Oct 2023 10:25:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D107210E177;
	Mon, 23 Oct 2023 08:25:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-4018.proton.ch (mail-4018.proton.ch [185.70.40.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DAFA410E177
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Oct 2023 08:25:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=emersion.fr;
 s=protonmail2; t=1698049518; x=1698308718;
 bh=5C4xzomIPUB3F6LUpYDB1uyVy2mFW1+PY+09w03fokY=;
 h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
 Message-ID:BIMI-Selector;
 b=GHB1SwM5EhGM8CJxyKNGL1lpj5lfH8j7sZzuu52vV7+yc2Ixfg81Btjjf0jnzlPgU
 B0V7f8lDGgGTHw2jkNpoOCg1yDdxHwYGfPLyc93v4zY2Dc6ImmRzdRzWnpqk15uIfO
 WPhdYo8/iRmUXaJMxrUsdsATO1TksGPnYpCAZmmFJAGokSohAF0lR6fA/A4pQvkFvu
 hkVOIWszievGk2goEHlmNGK4JhpQuDNgw/GM9OBcbO0/PeHJ90I65pmI0h8QnTa+Zy
 kpD6qEWOfOhKEUZTT+crGtL4WjB4wgWCjVcaJoNJ3AkroHi1WdEI7Vo+Jxo45wu+AN
 oePdIKMiNqvpA==
Date: Mon, 23 Oct 2023 08:25:14 +0000
To: =?utf-8?Q?Ville_Syrj=C3=A4l=C3=A4?= <ville.syrjala@linux.intel.com>
From: Simon Ser <contact@emersion.fr>
Subject: Re: [PATCH v6 6/6] drm/doc: Define KMS atomic state set
Message-ID: <mawSNnD1hQ6vCVrNVMAvuQESnTToKPXrtiHIXXdqC-mq_LkxWOizPCcXx_KiEASVX-Mbm0LgjfTYkMNOjSAKCldpkXHAd9MmRzbC8ECPsTs=@emersion.fr>
In-Reply-To: <ZS55mXTSxpXKYbsd@intel.com>
References: <20230815185710.159779-1-andrealmeid@igalia.com>
 <20230815185710.159779-7-andrealmeid@igalia.com>
 <1b23576d-1649-ff5c-6273-b54729ea46d8@mailbox.org>
 <b48bd1fc-fcb0-481b-8413-9210d44d709b@igalia.com>
 <20231016151856.74af9305@eldfell>
 <aa424bf8-5652-4a44-9b93-bdc0a31d835a@igalia.com>
 <20231016175222.7a89e6ab@eldfell> <ZS1ST6XAUHilBg3d@intel.com>
 <8NqDNz1Y8H5I_WhNhOj0ERarBH7nJhGQAsDHbmSnwzoOFtXPBPILwxLlF8-vDPKR06Uknp1BDSt7-6gTmHls62k79ETajXDfPRsmIP-cZN0=@emersion.fr>
 <ZS55mXTSxpXKYbsd@intel.com>
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

On Tuesday, October 17th, 2023 at 14:10, Ville Syrj=C3=A4l=C3=A4 <ville.syr=
jala@linux.intel.com> wrote:

> On Mon, Oct 16, 2023 at 10:00:51PM +0000, Simon Ser wrote:
>=20
> > On Monday, October 16th, 2023 at 17:10, Ville Syrj=C3=A4l=C3=A4 ville.s=
yrjala@linux.intel.com wrote:
> >=20
> > > On Mon, Oct 16, 2023 at 05:52:22PM +0300, Pekka Paalanen wrote:
> > >=20
> > > > On Mon, 16 Oct 2023 15:42:16 +0200
> > > > Andr=C3=A9 Almeida andrealmeid@igalia.com wrote:
> > > >=20
> > > > > Hi Pekka,
> > > > >=20
> > > > > On 10/16/23 14:18, Pekka Paalanen wrote:
> > > > >=20
> > > > > > On Mon, 16 Oct 2023 12:52:32 +0200
> > > > > > Andr=C3=A9 Almeida andrealmeid@igalia.com wrote:
> > > > > >=20
> > > > > > > Hi Michel,
> > > > > > >=20
> > > > > > > On 8/17/23 12:37, Michel D=C3=A4nzer wrote:
> > > > > > >=20
> > > > > > > > On 8/15/23 20:57, Andr=C3=A9 Almeida wrote:
> > > > > > > >=20
> > > > > > > > > From: Pekka Paalanen pekka.paalanen@collabora.com
> > > > > > > > >=20
> > > > > > > > > Specify how the atomic state is maintained between usersp=
ace and
> > > > > > > > > kernel, plus the special case for async flips.
> > > > > > > > >=20
> > > > > > > > > Signed-off-by: Pekka Paalanen pekka.paalanen@collabora.co=
m
> > > > > > > > > Signed-off-by: Andr=C3=A9 Almeida andrealmeid@igalia.com
> > > > > > > > > [...]
> > > > > > > >=20
> > > > > > > > > +An atomic commit with the flag DRM_MODE_PAGE_FLIP_ASYNC =
is allowed to
> > > > > > > > > +effectively change only the FB_ID property on any planes=
. No-operation changes
> > > > > > > > > +are ignored as always. [...]
> > > > > > > > > During the hackfest in Brno, it was mentioned that a comm=
it which re-sets the same FB_ID could actually have an effect with VRR: It =
could trigger scanout of the next frame before vertical blank has reached i=
ts maximum duration. Some kind of mechanism is required for this in order t=
o allow user space to perform low frame rate compensation.
> > > > > > >=20
> > > > > > > Xaver tested this hypothesis in a flipping the same fb in a V=
RR monitor
> > > > > > > and it worked as expected, so this shouldn't be a concern.
> > > > > > > Right, so it must have some effect. It cannot be simply ignor=
ed like in
> > > > > > > the proposed doc wording. Do we special-case re-setting the s=
ame FB_ID
> > > > > > > as "not a no-op" or "not ignored" or some other way?
> > > > > > > There's an effect in the refresh rate, the image won't change=
 but it
> > > > > > > will report that a flip had happened asynchronously so the re=
ported
> > > > > > > framerate will be increased. Maybe an additional wording coul=
d be like:
> > > > >=20
> > > > > Flipping to the same FB_ID will result in a immediate flip as if =
it was
> > > > > changing to a different one, with no effect on the image but effe=
cting
> > > > > the reported frame rate.
> > > >=20
> > > > Re-setting FB_ID to its current value is a special case regardless =
of
> > > > PAGE_FLIP_ASYNC, is it not?
> > >=20
> > > No. The rule has so far been that all side effects are observed
> > > even if you flip to the same fb. And that is one of my annoyances
> > > with this proposal. The rules will now be different for async flips
> > > vs. everything else.
> >=20
> > Well with the patches the async page-flip case is exactly the same as
> > the non-async page-flip case. In both cases, if a FB_ID is included in
> > an atomic commit then the side effects are triggered even if the proper=
ty
> > value didn't change. The rules are the same for everything.
>=20
> I see it only checking if FB_ID changes or not. If it doesn't
> change then the implication is that the side effects will in
> fact be skipped as not all planes may even support async flips.

Hm right. So the problem is that setting any prop =3D same value as
previous one will result in a new page-flip for asynchronous page-flips,
but will not result in any side-effect for asynchronous page-flips.

Does it actually matter though? For async page-flips, I don't think this
would result in any actual difference in behavior?
