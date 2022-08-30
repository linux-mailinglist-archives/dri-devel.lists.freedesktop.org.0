Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4AC8B5A5DDF
	for <lists+dri-devel@lfdr.de>; Tue, 30 Aug 2022 10:16:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5B13010EBEA;
	Tue, 30 Aug 2022 08:16:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x243.google.com (mail-lj1-x243.google.com
 [IPv6:2a00:1450:4864:20::243])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 888CF10EBEA
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Aug 2022 08:16:39 +0000 (UTC)
Received: by mail-lj1-x243.google.com with SMTP id b26so3599943ljk.12
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Aug 2022 01:16:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:message-id:subject:cc:to:from
 :date:from:to:cc;
 bh=0qzycssWbmiQ3N2OHdMRDXzHlVbPETRKqrAbR//zkvc=;
 b=maJohn8U4GWlb2ccnNTsPjIV3yrklk0szgK8FAf0gApDS1aWcSI/CVS6PTNFlL2tCb
 MUudcAL7zQAc74/ZhDIL+Z+dHeG+TXqFYSPmiUbp28xY4kCMrvMr98XS2Yle+h2ozF0Y
 jKD8109N6l1ZMNKqRhgBRDx03AoZPDihMktEoU2M9WTnJU1ldSMDe6bJ3E/yoCFVGs8Z
 ISH54DBfi22aHk2aOqpBXOWwLrcZKZr+D2X9g0TTt82FhwicNHZ8djERdobwaktF8bGw
 tLJDXJZ2U1jQw8Qagyjz/Yvu7tTXwMNQosWH1sVdGqZ+w/K2OeEeuRFxm6NCTTiUN3dG
 3tiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=mime-version:references:in-reply-to:message-id:subject:cc:to:from
 :date:x-gm-message-state:from:to:cc;
 bh=0qzycssWbmiQ3N2OHdMRDXzHlVbPETRKqrAbR//zkvc=;
 b=TjF0ZFdF7g/a/G4uPMqf+EDWyRojvHiEZjkQwYKgl2FWHxjS7MFtkiq3IX9e+eED6P
 yNtb/F52YikzTybeGqLE+o8yyrNjBwBTtJF3ag+rf+yJhtnFrgYM6TVN37UXl6ZZL6yE
 OEcaKk996vP/JM9gAZhvL4GIvxTvu2KUsZsG9mYQP0xrlwHNr5La/KnA7MklGsUoy+mU
 yYGNg1Kj1R0qVT4UohLFufZB2H1YOuYvCb+APxIxik06Nv7eJQCVi8gdfWaDj2L89I5n
 SiiuOoT3iDCSVLuXfMXdVxguqLrBYn0Mq2YT6r8DFs1hr8WIvYkHxXDcqoJWr2LdLj0D
 n9VQ==
X-Gm-Message-State: ACgBeo0Nfe4i2h5GikRH4bj6MetQ+3UXFe4XTuH1QGY7Tpbbla5mJarC
 4JPeQSVmTGks7v06dl8t0sI=
X-Google-Smtp-Source: AA6agR4GMQZGpr8LySZzyY1WsuTkkzKQF4IKTG0NUpTamq/T4R+FpO1QKH4DyEsnr/R3dMpQGc11GQ==
X-Received: by 2002:a2e:bd0e:0:b0:267:fad4:7f72 with SMTP id
 n14-20020a2ebd0e000000b00267fad47f72mr114020ljq.130.1661847397569; 
 Tue, 30 Aug 2022 01:16:37 -0700 (PDT)
Received: from eldfell ([194.136.85.206]) by smtp.gmail.com with ESMTPSA id
 c11-20020a19654b000000b0049461118812sm129688lfj.285.2022.08.30.01.16.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 30 Aug 2022 01:16:37 -0700 (PDT)
Date: Tue, 30 Aug 2022 11:16:26 +0300
From: Pekka Paalanen <ppaalanen@gmail.com>
To: Simon Ser <contact@emersion.fr>
Subject: Re: drm: document uAPI page-flip flags
Message-ID: <20220830111626.77307042@eldfell>
In-Reply-To: <ASSNOUe9wtsXskZjVlf1X4pl53T7pVE0MfEzkQ_h4cX0tjnF7e3cxpwGpRNPudmIHoRuW4kz_v1AeTpXgouLpTYcI8q-lPTzc1YMLR8JiJM=@emersion.fr>
References: <20220824174459.441976-1-contact@emersion.fr>
 <20220826115355.668e13ca@eldfell>
 <ASSNOUe9wtsXskZjVlf1X4pl53T7pVE0MfEzkQ_h4cX0tjnF7e3cxpwGpRNPudmIHoRuW4kz_v1AeTpXgouLpTYcI8q-lPTzc1YMLR8JiJM=@emersion.fr>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/eYXaCK7ifaJY/7/v76u3=Y3";
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>,
 Sebastian Wick <sebastian.wick@redhat.com>, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--Sig_/eYXaCK7ifaJY/7/v76u3=Y3
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

On Mon, 29 Aug 2022 15:37:52 +0000
Simon Ser <contact@emersion.fr> wrote:

> CC Ville for the ASYNC bits, see below.
>=20
> On Friday, August 26th, 2022 at 10:53, Pekka Paalanen <ppaalanen@gmail.co=
m> wrote:
>=20
> > > +/**
> > > + * DRM_MODE_PAGE_FLIP_EVENT
> > > + *
> > > + * Request that the kernel sends back a vblank event (see
> > > + * struct drm_event_vblank) when the page-flip is done. =20
> >=20
> > ...with type =3D DRM_EVENT_FLIP_COMPLETE?
> >=20
> > This was a bit new to me, because libdrm abstracts vblank and pageflip
> > events into different APIs. =20
>=20
> Indeed.
>=20
> Maybe should clarify what "done" means here? Would "when the page-flip ha=
s been
> displayed on-screen" be correct?

Good idea, but definition is not quite that AFAIU. I would understand
"displayed" as "turned into light" or at least fully sent to the cable,
when we are talking at this level of detail.

Hence, "has been displayed" is not it because the flip-done event is
emitted before the new FB contents have been scanned out. That scanout
cycle is only starting when the flip is done. The flip timestamp should
correspond to the time when the first real pixel of the new FB hits the
monitor cable.

A flip is done, when it is guaranteed that the next (or on-going, in
case of tearing) scanout cycle will use the new FB, IOW the hardware
programming has been done I believe.

If the flip is sync'd to vblank, the timestamp is as above, but the
actual event might be emitted somewhat before or after the instant of
the timestamp. Some drivers can predict the timestamp so can send the
event early, others don't.

If the flip is tearing, then I'm not sure what the timestamp is or when
the event is emitted.

> > > + */
> > >  #define DRM_MODE_PAGE_FLIP_EVENT 0x01
> > > +/**
> > > + * DRM_MODE_PAGE_FLIP_ASYNC
> > > + *
> > > + * Request that the page-flip is performed as soon as possible, ie. =
with no
> > > + * delay due to waiting for vblank. This may cause tearing to be vis=
ible on
> > > + * the screen. =20
> >=20
> > Btw. does the kernel fail the flip if the driver does not support async?
> > Or does it silently fall back to sync flip?
> > Asking for both legacy and atomic APIs. =20
>=20
> Atomic doesn't support this yet, so it's pretty much TBD (see Ville's rep=
ly [1]).

So atomic commit ioctl will fail with EINVAL because userspace is
giving it an unrecognized flag?

[1] is interesting. Apparently the atomic async flag will only be a
hint, "make it tear if possible". That seems fine to me.

>=20
> For legacy, it seems like drivers do what they want. AFAIU, i915 will rej=
ect
> (see intel_async_flip_check_uapi etc), and amdgpu will silently fall back=
 to
> vsync (see the `acrtc_state->update_type =3D=3D UPDATE_TYPE_FAST` check in
> amdgpu_dm_commit_planes).
>=20
> Maybe one of the drivers is wrong here and should be fixed?
>=20
> [1]: https://lore.kernel.org/dri-devel/YwiB%2FxQf6Z6ScU+Z@intel.com/
>=20
> > > +/**
> > > + * DRM_MODE_ATOMIC_NONBLOCK
> > > + *
> > > + * Do not block while applying the atomic commit. =20
> >=20
> > Maybe add something like:
> >=20
> > 	The atomic commit ioctl returns immediately instead of waiting
> > 	for the changes to be applied in hardware. =20
>=20
> Good idea. Also added:
>=20
>     Note, the driver will still check that the update can be applied befo=
re
>     retuning.

Nice.

> > > + */
> > >  #define DRM_MODE_ATOMIC_NONBLOCK  0x0200
> > > +/**
> > > + * DRM_MODE_ATOMIC_ALLOW_MODESET
> > > + *
> > > + * Allow the update to result in visible artifacts such as a black s=
creen. =20
> >=20
> > Maybe add:
> >=20
> > 	...temporary or transient visible artifacts while the update is
> > 	being applied. Applying the update may also take significantly
> > 	more time than a page flip. The visual artifacts will not
> > 	appear after the update is completed.
> >=20
> > 	This flag must be set when the KMS update might cause visible
> > 	artifacts. Without this flag such KMS update will return EINVAL
> > 	error. What kind of updates may cause visible artifacts depends
> > 	on the driver and the hardware. Userspace that needs to know
> > 	beforehand if an update might cause visible artifacts can use
> > 	DRM_MODE_ATOMIC_TEST_ONLY without DRM_MODE_ATOMIC_ALLOW_MODESET
> > 	to see if it fails.
> >=20
> > 	Visual artifacts are guaranteed to not appear when this flag is
> > 	not set.
> >=20
> > That "artifacts will not appear after the update is completed" is a bit
> > awkward, because when this commit completes and triggers the completion
> > event (if requested), the visual artifacts might still be on screen, but
> > as soon as the scanout cycle that just started finishes, all artifacts
> > are gone for good. Isn't that how it works?
> >=20
> > Or does the kernel wait with the completion event until a good picture
> > has been fully scanned out at least once? I'd expect not. =20
>=20
> That generally looks like a good description to me, and AFAIK is how thin=
gs
> work indeed.

Yeah, but swick has a good point: should we be talking about literal
visual artifacts or do we only guarantee that the video signal on the
cable is uninterrupted?

HDR_OUTPUT_METADATA is the prime example where that matters. It is
infoframe data, which means changing it will never cause any
interruption in the video signal. However, changing certain fields (and
not with other fields) in the infoframe is likely to cause the monitor
to glitch or blank for a moment.


Thanks,
pq

--Sig_/eYXaCK7ifaJY/7/v76u3=Y3
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEJQjwWQChkWOYOIONI1/ltBGqqqcFAmMNx1oACgkQI1/ltBGq
qqcmgQ/+INvlC4I5XWQW4gYqZ0/V4hLHSbur4JULFYmcjoCFsSH1KwDoANrhbiuF
cvmYXQPas8592aiQGxxuwCXbJ5OvodQtVPoO37FojmZIWJpHftOO2vtPsnlDOIco
5/bVTTDHW4UbmBPOySKfp48v/H4CuFV9OpNlVj9+wji/z4278scEHu4hQH2qYQYl
dkocpEAujZ6kfBIwkyLQqBYNiTCulQ1s4dUN96ItMBxxYlpaujcczbDZvcXE4gm5
rZV4hkZdWfhc3tggYu/lPzXeHX1EP7kDjQfsXNlMGunhDdsaOW/WAbegcCABD/sS
ZqDTk2L0v+Y8k7n9yrQ7oGcwvcUJM1a6INacj4EVqxBeGZjZPgWj983mn3JrPIrJ
6vcm8ei8YVceb+nvAnD/dIzYFCaADHxeHrelVxWkEumJxHWXoRaSThg9/Mjy7yvp
fmmvgy3Y7HZU1/O6i3HCDOzNi/1wnta+nunTj+bHNC0+YL2rSi/EXBTyXkwRv1Y6
A6sCaBcPpyKsebyiChur9jmqSeKEb2B0BqoW9fR4wmqrt5y4WfI7NCfwyHlJ7fmy
X4QvLeVZ3iLmtk5NwXGRX61v+pIsoxVKRFBUHOXQK15Gv/Z+pHkRQiJ0jkjIbm70
aodLSv419RsFAoM+cg2y/5h9OD7STrbVbXfgp1CZ79mCL+4LQEo=
=QBHs
-----END PGP SIGNATURE-----

--Sig_/eYXaCK7ifaJY/7/v76u3=Y3--
