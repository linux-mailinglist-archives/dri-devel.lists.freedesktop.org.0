Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 924CC5A5E55
	for <lists+dri-devel@lfdr.de>; Tue, 30 Aug 2022 10:40:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9405C10ECAF;
	Tue, 30 Aug 2022 08:40:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x22d.google.com (mail-lj1-x22d.google.com
 [IPv6:2a00:1450:4864:20::22d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1240610ECA6;
 Tue, 30 Aug 2022 08:40:16 +0000 (UTC)
Received: by mail-lj1-x22d.google.com with SMTP id y10so7430776ljq.0;
 Tue, 30 Aug 2022 01:40:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:message-id:subject:cc:to:from
 :date:from:to:cc;
 bh=53K5QNXi7Vr+V9/tC5zC5CUCbxi6boeT+InrCKzG8aA=;
 b=bqUl2l9A8P5Rk+/gHByfBAdV4yEN0iuHt8maAQ9gD5CeoE6r7pdlJFTuaL3/Cl72CK
 QU7ePoqCorxCLsnCJ2r6jBNRq/l+Ft+yungwVqkol0FROc4MPcnWDyJW0TWLPur2TFzl
 jSKEwOhVdXvxdQhpObiU2c6ycCPbFdQiBe1lYx/3kLiaorowvF8wRX2fgLL2flBQqDbf
 lkVuCsRLoWQqpRoO9ZJYzr/tBgHw/34C5n/BkTOGBfK/l5PCM0WeUiSm4AXPD8B3ScTQ
 yAObrjKS+6YFM9PVo+PLDLrzARILyOumNQBqbk0pe0EwaF/c8gUuItfiwY8bCf2LAQpB
 VFHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=mime-version:references:in-reply-to:message-id:subject:cc:to:from
 :date:x-gm-message-state:from:to:cc;
 bh=53K5QNXi7Vr+V9/tC5zC5CUCbxi6boeT+InrCKzG8aA=;
 b=2xVuai4RxkaYt/8DHE7JkSfSognQ3l4TQD5RYO9kZkj55geB7LEyJ2jTqmmpgbUEZY
 y0BuG+bTWPgu5CqyTMMjMtsT1HLIYq/HPpMSpgOD8Is0/8d9qhooM3hYF90cJRGzOAie
 LdEA0B38RLVoVPx5c75giiwk/F1tYf5p6OJSfC8PBXZrOgNHcfWWscuYpiSwoza55SeE
 aslyZ87cwWjPNtyGZlmptW0TABwU7jDXJgCOoet9QJPffS1CabmRbrnAMhiyeE0sdsfx
 p/v5VeJSpbT5V4v/OCDHQXcfG04pBtqgpMyB5pTfCp1AMHgXpXfD3qg8tXVGMt95jV39
 wW+Q==
X-Gm-Message-State: ACgBeo1glSXiGFYQy1mP6lOWpr57Nj8Kv8DZlrkfPeObk0zx5K4a7aJm
 P/eN9WtLAFBsJ4d0j57h/Hc=
X-Google-Smtp-Source: AA6agR4+47zmjbgGoPRXG1PMPUvxDR6OJ0HNCWUa31p8oj2zhpCBhMDwwwhQuPYpS9wIaE7/t7oUzQ==
X-Received: by 2002:a2e:8856:0:b0:268:1810:63b4 with SMTP id
 z22-20020a2e8856000000b00268181063b4mr5968ljj.453.1661848814200; 
 Tue, 30 Aug 2022 01:40:14 -0700 (PDT)
Received: from eldfell ([194.136.85.206]) by smtp.gmail.com with ESMTPSA id
 r10-20020a19da0a000000b00494663cf5f5sm909488lfg.289.2022.08.30.01.40.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 30 Aug 2022 01:40:13 -0700 (PDT)
Date: Tue, 30 Aug 2022 11:40:10 +0300
From: Pekka Paalanen <ppaalanen@gmail.com>
To: Ville =?UTF-8?B?U3lyasOkbMOk?= <ville.syrjala@linux.intel.com>
Subject: Re: [PATCH 3/4] drm: introduce DRM_CAP_ATOMIC_ASYNC_PAGE_FLIP
Message-ID: <20220830114010.3ea02874@eldfell>
In-Reply-To: <Yw3FdhzAst1RRPxy@intel.com>
References: <20220824150834.427572-1-contact@emersion.fr>
 <20220824150834.427572-4-contact@emersion.fr>
 <YwiB/xQf6Z6ScU+Z@intel.com>
 <mCt6wEhtsKHH_vfQEi0RwUQspNiKfFez4v8ZWlMW-sqZ5xaiUqMpRCF7na84A2nOLw5MA59fQ6IWddLCAg76XwWagCYMthzTLKLPQ9m0MfI=@emersion.fr>
 <Yw3FdhzAst1RRPxy@intel.com>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/H./gmGhNN9fil9F2tVCXWsb";
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
Cc: amd-gfx@lists.freedesktop.org, mwen@igalia.com,
 dri-devel@lists.freedesktop.org, daniel.vetter@ffwll.ch,
 alexander.deucher@amd.com, hwentlan@amd.com, nicholas.kazlauskas@amd.com,
 joshua@froggi.es
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--Sig_/H./gmGhNN9fil9F2tVCXWsb
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Tue, 30 Aug 2022 11:08:22 +0300
Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.com> wrote:

> On Mon, Aug 29, 2022 at 04:01:44PM +0000, Simon Ser wrote:
> > On Friday, August 26th, 2022 at 10:19, Ville Syrj=C3=A4l=C3=A4 <ville.s=
yrjala@linux.intel.com> wrote:
> >  =20
> > > On Wed, Aug 24, 2022 at 03:08:55PM +0000, Simon Ser wrote: =20
> > > > This new kernel capability indicates whether async page-flips are
> > > > supported via the atomic uAPI. DRM clients can use it to check
> > > > for support before feeding DRM_MODE_PAGE_FLIP_ASYNC to the kernel. =
=20
> > >=20
> > > I think we'd need to clarify the semantics of the async flag
> > > for atomic commits.
> > >=20
> > > Eg. on Intel hw only pure page flips are possible async, if you do
> > > anything else (change plane size/pos/scaling/etc.) you will need
> > > to do a sync update. Technically not even all page flips (from the
> > > uapi POV) might be possible as the exact scanout source address
> > > is specified via two registers, only one of which can be update
> > > async. So technically the two framebuffers might be laid out
> > > just slightly differently which could prevent an async flip.
> > > Also only some subset of planes actually support async flips. =20
> >=20
> > Also IIRC some format modifiers don't support async flip at all (CCS)? =
=20
>=20
> Yeah, that too. Also planar YUV formats aren't allowed.
>=20
> >  =20
> > > And on hw where multiple planes support it on the same crtc, only one
> > > plane can do it at a time. Well, more accurately we can only select
> > > one plane at a time to give us the "flip done" interrupt. I guess
> > > if the user wants to async flip multiple planes at the same time
> > > we could do them serially as opposed to in parallel to make sure
> > > all the flips actually happened before we signal completion of the
> > > entire commit. Async flips of multiple planes probably won't
> > > happen atomically anyway so doing them serially seems fine.
> > >=20
> > > ATM in i915 we probably don't have sufficient state checks in
> > > place to catch all the restrictions, and instead in part we rely
> > > on the limited scope of the legacy async flip ioctl to make sure
> > > the operation doesn't attempt something the hw can't do. =20
> >=20
> > Yeah, that makes sense.
> >=20
> > In the documentation patch discussion [1], it appears it's not clear wh=
at
> > drivers should do when async flip isn't possible with the legacy uAPI.
> >=20
> > For the atomic uAPI, we need to pick on of these two approaches:
> >=20
> > 1. Let the kernel fall back to a sync flip if async isn't possible. This
> >    simplifies user-space, but then user-space has no reliable way to fi=
gure out
> >    what really happened (sync or async?). That could be fixed with a new
> >    read-only CRTC prop indicating whether the last flip was async or no=
t.
> >    However, maybe someone will come up in the future with user-space wh=
ich
> >    needs to only apply an update if async flip is possible, in which ca=
se this
> >    approach falls short.

There is the pageflip completion timestamp in the DRM event. If
userspace knows the phase and period of the scanout cycle, the
completion timestamp should tell quite reliably if the update was
tearing.

For the phase, one can query KMS for the last vblank timestamp. This
should work also for VRR I assume.

For the period, fixed-frequency video mode has it straight. VRR gives
only a range or a minimum period.

> > 2. Make the kernel return EINVAL if async flip isn't possible. This add=
s more
> >    complexity to user-space, but enables a more reliable and determinis=
tic
> >    uAPI. This is also more consistent with the rest of the existing ato=
mic
> >    uAPI. =20
>=20
> The current behaviour is somewhat a combination of the two. We return
> an error if async flip is not possible at all given the current state.
>=20
> When async flip is possible we return success, but may still internally
> fall back to a sync flip for the first flip. That is required on some
> borked hardware that can't switch from sync flips to async flips without
> doing an extra sync flip. Also on some other hardware we intentionally
> fall back to a sync flip for the first async flip, so that we can
> reprogram some display FIFO stuff (aimed to make the subsequent async
> flips faster).

Oh, so userspace should expect to run async for long periods of time,
and not use async this frame, sync next, then async again depending on
per-frame timings.

That seems important to note.

It's almost like the async flag should be a KMS property instead of a
commit ioctl flag.

> > Note, current user-space would only need to opportunistically enable as=
ync
> > flip. IOW, I think that for current user-space plans "async if possible,
> > otherwise sync" is good enough. That behavior maps well to the Vulkan p=
resent
> > modes as well (which says that "this mode *may* result in visible teari=
ng", but
> > doesn't guarantee it). =20
>=20
> The current behaviour is to fall back to a blit if the async
> flip fails. So you still get the same effective behaviour, just
> not as efficient. I think that's a reasonable way to handle it.

That's purely an Xorg thing, right?

Should Wayland compositors implement the same thing is a good question.

> > Another possible shortcoming of the proposed new uAPI here is that user=
-space
> > cannot submit a single atomic commit which updates multiple CRTCs, and
> > individually select which CRTC does an async flip. This could be fixed =
with

I would think that you can just do per-CRTC atomic commits in that
case. You would do per-CRTC atomic commits anyway when the vblanks do
not coincide. I expect tearing updates to have unpredictable latency,
especially if they can silently fall back to sync flips, so doing
multi-CRTC async flips is not useful.

> > a "ASYNC_FLIP" CRTC prop which the kernel always resets to 0 on commit.=
 I'm not
> > sure we want/need to cross that bridge right now, it would be easy enou=
gh to
> > add as a second step if some user-space would benefit from it. =20
>=20
> Technically it should really be per-plane since that is what does
> the flip. But I have a feeling that allowing a mix of async and
> sync in the same commit is just going to make everything more
> complicated without really helping anything (async flips won't
> happen atomically anyway with anything else).
>=20
> One (crazy?) idea I had for the atomic api is that we could even
> reject most of the properties already on the uapi level before anyone
> gets to examine the final state. Ie. as soon as the atomic ioctl sees
> eg. a gamma LUT property change it would just immediately return
> an error if async flip is also requested.

I agree with these two paragraphs.

What about limiting async flag to atomic commits that update only a
single KMS plane (regardless of how many planes are active)? Maybe that
would be a good first step?

>=20
> >=20
> > What do you think?
> >=20
> > [1]: https://lore.kernel.org/dri-devel/ASSNOUe9wtsXskZjVlf1X4pl53T7pVE0=
MfEzkQ_h4cX0tjnF7e3cxpwGpRNPudmIHoRuW4kz_v1AeTpXgouLpTYcI8q-lPTzc1YMLR8JiJM=
=3D@emersion.fr/ =20
>=20

Thanks,
pq

--Sig_/H./gmGhNN9fil9F2tVCXWsb
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEJQjwWQChkWOYOIONI1/ltBGqqqcFAmMNzOoACgkQI1/ltBGq
qqdG+hAApwLZmxPtt77TLjxhpTCzA4m601O68EH/FwacPJTPLorzeIo3T2KumSHR
1UO31DQFXU8eZ3aG4cQ00WWpKd53+b7Er88gwuihCSJHVbN8pYqUUHsRM6iyaKRi
0NGVGstULfOWRgogjgFvtCRPzZV6kap8fUS1tXJc1i/bWskmR1zPbgq1G7IvvB0Z
5ra4TTXANZ8tQveIdUN11tbmutcnun/GkE0mDtaKWMRjAczsp/QqJmyIk5W9RkdV
vptquZhUwIz7N37NrrswxzFps3VlDGTmcLBgH8x8Qmay4NtMnG5ur4ikcU4WCPZC
NL1MDCa0UZ5w0Ai3WFXp5HjahgmX839pVd/ew5amvsgagaBtb68RF70jy32isp5f
xsniO2oQeFwferGVzg3rq8HTgFx3vmhZi9JzJrXcM8+2wwhvS3RwGpXoFMIE27ko
tVJCpIIiABdSS8xnWAAmmjKxIPZ2gonkMtJ7QXmuliPLBNyW9BzVuuJEHlT4xlvy
cnpL9ilh23WV9ngSsogTo1AbjiWzVJ2ty3c3w3A7AAhwmPyv2gTJuS21ty2tt0IE
BIWqzdBnanF5/d9KbfSZ/QXMpLJ/Rbeb/lPWtge68LeIfN0FkkSY5k6eazFMw3sX
aJ1oHQsk+bwanI3r37EucdcNfg5olX0XRMMh29S1r9oTluCASMc=
=URq4
-----END PGP SIGNATURE-----

--Sig_/H./gmGhNN9fil9F2tVCXWsb--
