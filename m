Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EBC553B7F2D
	for <lists+dri-devel@lfdr.de>; Wed, 30 Jun 2021 10:41:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BD0846E95F;
	Wed, 30 Jun 2021 08:41:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x242.google.com (mail-lj1-x242.google.com
 [IPv6:2a00:1450:4864:20::242])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C4EB56E0EC;
 Wed, 30 Jun 2021 08:41:38 +0000 (UTC)
Received: by mail-lj1-x242.google.com with SMTP id c11so2180152ljd.6;
 Wed, 30 Jun 2021 01:41:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:in-reply-to:references
 :mime-version; bh=Utd+KHsgCpC09PaarvdINj/RaB0PktYgXudSQXUyFn8=;
 b=GuYv6YFticc8azldffZ6ePW4EI5jTgqJxw2tFY8PhSRjMzVNrUlIwKt8LXWimpirtN
 8xt6D1F4aVn9HyKquYIKxHGyOwBMnWyOS5DFu6XOOpsc+I3aWdwgcHFgEOsxBJOlOwK7
 jjwo0ksGjQVpbNQ58stEyPKc+w7IoyFlT0fZPZOTEUSM92qikVSIUxiJFmzALHh5deJD
 /i4gEABuoEl+gfEMV8nrkxPGcglEsiZTy8Coaps5RxBJjJaOdVul8dJ981qyksT011SH
 V75g+/QwPRk+fesdqPt98jQ5ep7ewcSPSoBa52VCfylpXF8kb8WR/zC+FcRnrrxZKDMv
 uxHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:mime-version;
 bh=Utd+KHsgCpC09PaarvdINj/RaB0PktYgXudSQXUyFn8=;
 b=r0gSG7bjrv+pKjvliiN2f46ne415G1YVhH4M5NeRTmnMHjNmlWKKdRt/U8EKYz3K8z
 0XUt2PoZ1oppJlGZNF22pr7X7sX00sZgCDfhrcOrJbXDQp6JP+yAIgRjJWvLqIrRulFq
 WdLyK3Y460vGTMpO8kdpM/iuvjpxSzcPDbZuZ1udIAr2CgfGJOsRnq8i2BFGfwhedd1T
 +RFl7QXhSHY4tSn9SXULFiZ1LDwvWK+S3jthp0yQl8FV28UJLVpg8LzFohVOM2VSqtrq
 ri1bIs3heGdqNXVacb6t6l06fwxcQvNq7ljHZVvtxvmfmr1nDvvqEW9jmmftAqnYoIhN
 VCGg==
X-Gm-Message-State: AOAM531egois7V7Hsz13Sh416BBlSMNYKIP/xIfhU8NgP6G/lffjusz2
 HsbO+Bbi9wIk5ITdCOBmE/I=
X-Google-Smtp-Source: ABdhPJwMwwTwweeGYLKzaQ5DxXMwv1DJUPtIbNy+C44mil48CET5mB3NCGhFDsA2hoU+EbrQIDuLqw==
X-Received: by 2002:a2e:a22a:: with SMTP id i10mr6916389ljm.505.1625042497165; 
 Wed, 30 Jun 2021 01:41:37 -0700 (PDT)
Received: from eldfell ([194.136.85.206])
 by smtp.gmail.com with ESMTPSA id t24sm2144839ljj.97.2021.06.30.01.41.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 30 Jun 2021 01:41:36 -0700 (PDT)
Date: Wed, 30 Jun 2021 11:41:33 +0300
From: Pekka Paalanen <ppaalanen@gmail.com>
To: Werner Sembach <wse@tuxedocomputers.com>
Subject: Re: [PATCH v4 12/17] drm/uAPI: Add "preferred color format" drm
 property as setting for userspace
Message-ID: <20210630114133.47397e2f@eldfell>
In-Reply-To: <6d8716e0-e68a-e7b7-a341-a7471c413e9c@tuxedocomputers.com>
References: <20210618091116.14428-1-wse@tuxedocomputers.com>
 <20210618091116.14428-13-wse@tuxedocomputers.com>
 <20210622101516.6a53831c@eldfell>
 <jIDQ2rRRMWlhDDPf08Z8xZlEE8HTBx7fHsylFdK0joSSFVyES8D444Giyiji9zbIm7dU4QpbsXZLvIDTbGW0wEoUWKsMEI4evizn0UdGMvM=@emersion.fr>
 <20210629141712.21f00c38@eldfell>
 <6d8716e0-e68a-e7b7-a341-a7471c413e9c@tuxedocomputers.com>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/Tp8h1QbNa__rs7AOnEMkfQg";
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
Cc: sunpeng.li@amd.com, intel-gfx@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 airlied@linux.ie, amd-gfx@lists.freedesktop.org, tzimmermann@suse.de,
 rodrigo.vivi@intel.com, alexander.deucher@amd.com, christian.koenig@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--Sig_/Tp8h1QbNa__rs7AOnEMkfQg
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

On Tue, 29 Jun 2021 13:39:18 +0200
Werner Sembach <wse@tuxedocomputers.com> wrote:

> Am 29.06.21 um 13:17 schrieb Pekka Paalanen:
> > On Tue, 29 Jun 2021 08:12:54 +0000
> > Simon Ser <contact@emersion.fr> wrote:
> > =20
> >> On Tuesday, June 22nd, 2021 at 09:15, Pekka Paalanen <ppaalanen@gmail.=
com> wrote:
> >> =20
> >>> yes, I think this makes sense, even if it is a property that one can't
> >>> tell for sure what it does before hand.
> >>>
> >>> Using a pair of properties, preference and active, to ask for somethi=
ng
> >>> and then check what actually worked is good for reducing the
> >>> combinatorial explosion caused by needing to "atomic TEST_ONLY commit"
> >>> test different KMS configurations. Userspace has a better chance of
> >>> finding a configuration that is possible.
> >>>
> >>> OTOH, this has the problem than in UI one cannot tell the user in
> >>> advance which options are truly possible. Given that KMS properties a=
re
> >>> rarely completely independent, and in this case known to depend on
> >>> several other KMS properties, I think it is good enough to know after
> >>> the fact.
> >>>
> >>> If a driver does not use what userspace prefers, there is no way to
> >>> understand why, or what else to change to make it happen. That problem
> >>> exists anyway, because TEST_ONLY commits do not give useful feedback
> >>> but only a yes/no.   =20
> >> By submitting incremental atomic reqs with TEST_ONLY (i.e. only changi=
ng one
> >> property at a time), user-space can discover which property makes the =
atomic
> >> commit fail. =20
> > That works if the properties are independent of each other. Color
> > range, color format, bpc and more may all be interconnected,
> > allowing only certain combinations to work.
> >
> > If all these properties have "auto" setting too, then it would be
> > possible to probe each property individually, but that still does not
> > tell which combinations are valid.
> >
> > If you probe towards a certain configuration by setting the properties
> > one by one, then depending on the order you pick the properties, you
> > may come to a different conclusion on which property breaks the
> > configuration. =20
>=20
> My mind crossed another point that must be considered: When plugin in
> a Monitor a list of possible Resolutions+Framerate combinations is
> created for xrandr and other userspace (I guess by atomic checks? but
> I don't know).

Hi,

I would not think so, but I hope to be corrected if I'm wrong.

My belief is that the driver collects a list of modes from EDID, some
standard modes, and maybe some other hardcoded modes, and then
validates each entry against all the known limitations like vertical
and horizontal frequency limits, discarding modes that do not fit.

Not all limitations are known during that phase, which is why KMS
property "link-status" exists. When userspace actually programs a mode
(not a TEST_ONLY commit), the link training may fail. The kernel prunes
the mode from the list and sets the link status property to signal
failure, and sends a hotplug uevent. Userspace needs to re-check the
mode list and try again.

That is a generic escape hatch for when TEST_ONLY commit succeeds, but
in reality the hardware cannot do it, you just cannot know until you
actually try for real. It causes end user visible flicker if it happens
on an already running connector, but since it usually happens when
turning a connector on to begin with, there is no flicker to be seen,
just a small delay in finding a mode that works.

> During this drm
> properties are already considered, which is no problem atm because as
> far as i can tell there is currently no drm property that would make
> a certain Resolutions+Framerate combination unreachable that would be
> possible with everything on default.

I would not expect KMS properties to be considered at all. It would
reject modes that are actually possible if the some KMS properties were
changed. So at least going forward, current KMS property values cannot
factor in.

> However for example forcing YCbCr420 encoding would limit the
> available resolutions (my screen for example only supports YCbCr420
> on 4k@60 and @50Hz and on no other resolution or frequency (native is
> 2560x1440@144Hz).
>=20
> So would a "force color format" that does not get resetted on
> repluging/reenabling a monitor break the output, for example, of an
> not updated xrandr, unaware of this new property?

Yes, not because the mode list would be missing the mode, but because
actually setting the mode would fail.

RandR in particular is problematic, because it does not actually
understand any KMS properties, it is merely a relay. So anything
that *uses* RandR protocol or xrandr command would also need to be
patched to understand the new properties.

The kernel automatically resetting *some* properties in *some*
occasions seems really fragile and complicated to me, which is why I'm
a lot more keen to see a "reset everything to sensible defaults"
generic mechanism added to KMS.


Thanks,
pq

--Sig_/Tp8h1QbNa__rs7AOnEMkfQg
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEJQjwWQChkWOYOIONI1/ltBGqqqcFAmDcLj0ACgkQI1/ltBGq
qqcTDA/+KOwdyUCxLR2F52H2WswPypUhnSRkLN2GGEcODKU3fzIHRHiZLkbs2kA6
KXLPMkiWJnC34xZvFyhZfnrzYW2pf3Z8ghXDV/JEcwKFDfKFtlYfWPT6bdctLtmC
jRy5h7GUUKm2btxfZy9Fd8Mr1Eew87A+2xpd36aifSvGydYy1sv80s1/pX+CXH6M
MlFjIryNpLR8UIiUVqm8E348EpVj6kdoekgVXsH0zOSwqZj9eWPZ7lh+uVfNL4VH
GWQyf//VFQRsSyWcYz5XkpzpHlGbjE4RduDrXr+QnHXFmbKva6ScZh/87lsFL4Gx
jV/JfgPX8rEp6NObnIurHPZduYHDKCOgLklHWa9oJMNBPc1MbSkeHV6bOkAPWw/z
tRDkOKX9L+j1eElMssDbyNuuIF7MwwupeQXYRb5b+N/Sy8wtdP3HRLlKcGZ/TQQk
WSt3PpSMTwcEx/q3iXDGl1Gn0o6IVf9jOteaCcYq70laNR9SpNAtPPDcX6lQcpeI
o/4+xyd/Zf6EjUonJ9F822vNHo/nytpdU1kET+m+D84NTxDmDDxulFMe8RTgpMOW
+PsSsJTxZNJTzv4vCfGMsfRTR20X/NaPyDv3DNMygvQOkg926E4BlVlFGrPqy00a
8cDItAdW+Vo8MorSquONB+dssJJQyIc4xelAL+r5DdOHi2n/ICA=
=eBOQ
-----END PGP SIGNATURE-----

--Sig_/Tp8h1QbNa__rs7AOnEMkfQg--
