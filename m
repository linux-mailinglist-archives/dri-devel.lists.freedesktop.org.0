Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DD62B5A2858
	for <lists+dri-devel@lfdr.de>; Fri, 26 Aug 2022 15:17:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CA46410E8DE;
	Fri, 26 Aug 2022 13:17:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-4022.proton.ch (mail-4022.proton.ch [185.70.40.22])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7CECC10E8DE
 for <dri-devel@lists.freedesktop.org>; Fri, 26 Aug 2022 13:17:20 +0000 (UTC)
Date: Fri, 26 Aug 2022 13:17:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=emersion.fr;
 s=protonmail3; t=1661519838; x=1661779038;
 bh=cxlu/hZzgiASlpGST0w756EXdFhJUl1swc0+0Fh+0ks=;
 h=Date:To:From:Cc:Reply-To:Subject:Message-ID:In-Reply-To:
 References:Feedback-ID:From:To:Cc:Date:Subject:Reply-To:
 Feedback-ID:Message-ID;
 b=kNr2IOXIwBbpaiTzlAKjBdtNoass4WBOx6vD0kk427r5UFwbrJn2HypIQoiTvjBiR
 yQ9EFfkp6fP2hPcaUz/CEK6jQFBbczUliMYfR74SmpapUjNxL22Tk9gH2sJf9ZhxHa
 OHOrYk4NlKlZD627bZyC6sBCSW3P5huWwoeFS5cRITJdg0GllcWKj3MdIr8ZUtEFS8
 bGNU2ngM6IdBjHAMUfZSqUo9mLLDHREXva9sqkXwJbj7rUsYKxVhOQtsIhkVdtYM7S
 OqF5oKPbPMlipCMbGUALTwn0MAO/BcQGKoUxJqwbG2ad1pf7HkY3PjIYou048nBaGR
 7AWlMIBn2IrZg==
To: Sebastian Wick <sebastian.wick@redhat.com>
From: Simon Ser <contact@emersion.fr>
Subject: Re: drm: document uAPI page-flip flags
Message-ID: <dymn9p8A58W2u-z1I-PocnedBBSIeGHgcWLmUGTuPbL94siIRNuDF_zixDYCS6xaIuneOmVgs8Kk4kTg0foC7ud1p0_OsyHR2uzeDtbT8sM=@emersion.fr>
In-Reply-To: <CA+hFU4yjumfFPR-ke_6BCP95Xdw3COZrrTf24h4PH3-ko2UvaA@mail.gmail.com>
References: <20220824174459.441976-1-contact@emersion.fr>
 <20220826115355.668e13ca@eldfell>
 <CA+hFU4zUi42eKGbJfeB3caKXnZ_xQ5dQ_bu83EFVLM-S9SqkwQ@mail.gmail.com>
 <1mpWeZzQLcq5D99K0SJS_TB1xrG-YDLYDYcMwRpelbtZCA_PY3TSWwZKQnOBbtyiguz3bxbnDUq2PH5qbzz1Kt-xMoh4sLzzK2IbJQIRKTg=@emersion.fr>
 <CA+hFU4yjumfFPR-ke_6BCP95Xdw3COZrrTf24h4PH3-ko2UvaA@mail.gmail.com>
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
Reply-To: Simon Ser <contact@emersion.fr>
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>,
 Pekka Paalanen <ppaalanen@gmail.com>, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Friday, August 26th, 2022 at 15:10, Sebastian Wick <sebastian.wick@redha=
t.com> wrote:

> On Fri, Aug 26, 2022 at 2:17 PM Simon Ser contact@emersion.fr wrote:
>=20
> > On Friday, August 26th, 2022 at 11:49, Sebastian Wick sebastian.wick@re=
dhat.com wrote:
> >=20
> > > > > +/*
> > > > > + * DRM_MODE_ATOMIC_ALLOW_MODESET
> > > > > + *
> > > > > + * Allow the update to result in visible artifacts such as a bla=
ck screen.
> > > >=20
> > > > Maybe add:
> > > >=20
> > > > ...temporary or transient visible artifacts while the update is
> > > > being applied. Applying the update may also take significantly
> > > > more time than a page flip. The visual artifacts will not
> > > > appear after the update is completed.
> > > >=20
> > > > This flag must be set when the KMS update might cause visible
> > > > artifacts. Without this flag such KMS update will return EINVAL
> > > > error. What kind of updates may cause visible artifacts depends
> > > > on the driver and the hardware. Userspace that needs to know
> > > > beforehand if an update might cause visible artifacts can use
> > > > DRM_MODE_ATOMIC_TEST_ONLY without DRM_MODE_ATOMIC_ALLOW_MODESET
> > > > to see if it fails.
> > > >=20
> > > > Visual artifacts are guaranteed to not appear when this flag is
> > > > not set.
> > >=20
> > > That doesn't seem to be true, though. For example setting
> > > HDR_OUTPUT_METADATA for example does result in visual artifacts on my
> > > display no matter if the flag is specified or not because the
> > > artifacts are not the result of a mode set but of the display reactin=
g
> > > to some AVI InfoFrame.
> >=20
> > One would need to read the HDMI spec to see if there's anything in
> > there about artifacts on AVI InfoFrame change, then figure out whether
> > this is a bug in the physical screen itself or whether the kernel
> > driver should require ALLOW_MODESET when updating the HDR metadata.
>=20
> I'm not even sure if that's the right thing to do. ALLOW_MODESET isn't
> really about if a commit can lead to visual artifacts but about
> keeping the existing links alive (someone with more knowledge on this
> subject probably has a better description for this). An async commit
> can also introduce visual artifacts for example and there are probably
> more cases.

That's certainly not the intent of ALLOW_MODESET.

See the kernel docs for atomic_check:

> This callback also needs to correctly fill out the drm_crtc_state in
> this update to make sure that drm_atomic_crtc_needs_modeset() reflects
> the nature of the possible update and returns true if and only if the
> update cannot be applied without tearing within one vblank on that
> CRTC. The core uses that information to reject updates which require
> a full modeset (i.e. blanking the screen, or at least pausing updates
> for a substantial amount of time) if userspace has disallowed that in
> its request.

I'm sure Daniel Vetter can confirm this as well.
