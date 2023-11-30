Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 482897FEC80
	for <lists+dri-devel@lfdr.de>; Thu, 30 Nov 2023 11:07:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7720A10E6DD;
	Thu, 30 Nov 2023 10:07:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 692E710E6D2;
 Thu, 30 Nov 2023 10:06:58 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by ams.source.kernel.org (Postfix) with ESMTP id F1F87B842AF;
 Thu, 30 Nov 2023 10:06:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 04515C433C8;
 Thu, 30 Nov 2023 10:06:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1701338816;
 bh=GqVhB6Ga/yPMnfrjB9iHw/UqfCoHiZzrRR7jvkGXzUo=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=sXUwBd4bnphyzv73uwUBVd15m1ceTPjF/onJ5HQD5GcfSi6lndyBuHghCYZCm9HGp
 zAE9cNnhUAvFrfHW3GyIzNzQDVKvhwAXN8uajtjI3COZ/d/Wz7NIpyHf0BrEOivryt
 jNRIpa9/ZBd19A5h2DoaJL9pPKmrFHVwjvT0ZhfNn+gilpIwsqFQw19lwsQyG6tPyp
 J1unB6Mi9qFMXQMg4KqE62NJKfXnVjVF8QwxKQL2KAzyukn4ZifA6x0aZFadp/ARg5
 ShonGjGP7YmcGnT1F3xV9TWMP366ANTZ4XqeWZKcUsQll/w1pa3sEuiZ+yLizFwi7c
 SPXpyOu0dcoTg==
Date: Thu, 30 Nov 2023 11:06:53 +0100
From: Maxime Ripard <mripard@kernel.org>
To: Jani Nikula <jani.nikula@intel.com>
Subject: Re: [RFC] drm: enable W=1 warnings by default across the subsystem
Message-ID: <goc5tlbszvqy6kcduzllylsscvtolknhgbfpes43xvfve5ia6s@dpsgpa42poth>
References: <20231129181219.1237887-1-jani.nikula@intel.com>
 <72248f22-6337-487a-9979-a0d79e37a9ed@amd.com>
 <874jh362ta.fsf@intel.com>
 <eba23oyf4i3j6sdyqljjtgaz27brz4dxfrbtoddestjxwp5lr5@qxfj2b6szigc>
 <87zfyva8qg.fsf@minerva.mail-host-address-is-not-set>
 <87y1ef4lrb.fsf@intel.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="l5v43uaob62lojdr"
Content-Disposition: inline
In-Reply-To: <87y1ef4lrb.fsf@intel.com>
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
Cc: Pan@freedesktop.org, Karol Herbst <kherbst@redhat.com>,
 intel-gfx@lists.freedesktop.org, Xinhui <Xinhui.Pan@amd.com>,
 Javier Martinez Canillas <javierm@redhat.com>, dri-devel@lists.freedesktop.org,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Nathan Chancellor <nathan@kernel.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Danilo Krummrich <dakr@redhat.com>, Hamza Mahfooz <hamza.mahfooz@amd.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Alex Deucher <alexander.deucher@amd.com>,
 Marijn Suijten <marijn.suijten@somainline.org>, Sean Paul <sean@poorly.run>,
 Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--l5v43uaob62lojdr
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 30, 2023 at 11:46:00AM +0200, Jani Nikula wrote:
> On Thu, 30 Nov 2023, Javier Martinez Canillas <javierm@redhat.com> wrote:
> > Maxime Ripard <mripard@kernel.org> writes:
> >
> >> Hi,
> >>
> >> On Thu, Nov 30, 2023 at 10:52:17AM +0200, Jani Nikula wrote:
> >>> On Wed, 29 Nov 2023, Hamza Mahfooz <hamza.mahfooz@amd.com> wrote:
> >>> > Cc: Nathan Chancellor <nathan@kernel.org>
> >>> >
> >>> > On 11/29/23 13:12, Jani Nikula wrote:
> >>> >> At least the i915 and amd drivers enable a bunch more compiler war=
nings
> >>> >> than the kernel defaults.
> >>> >>=20
> >>> >> Extend the W=3D1 warnings to the entire drm subsystem by default. =
Use the
> >>> >> copy-pasted warnings from scripts/Makefile.extrawarn with
> >>> >> s/KBUILD_CFLAGS/subdir-ccflags-y/ to make it easier to compare and=
 keep
> >>> >> up with them in the future.
> >>> >>=20
> >>> >> This is similar to the approach currently used in i915.
> >>> >>=20
> >>> >> Some of the -Wextra warnings do need to be disabled, just like in
> >>> >> Makefile.extrawarn, but take care to not disable them for W=3D2 or=
 W=3D3
> >>> >> builds, depending on the warning.
> >>> >
> >>> > I think this should go in after drm-misc-next has a clean build (for
> >>> > COMPILE_TEST builds) with this patch applied. Otherwise, it will br=
eak a
> >>> > lot of build configs.
> >>>=20
> >>> Oh, I'm absolutely not suggesting this should be merged before known
> >>> warnings have been addressed one way or another. Either by fixing them
> >>> or by disabling said warning in driver local Makefiles, depending on =
the
> >>> case.
> >>
> >> I'm all for it, but yeah, we need some easy way to opt-in/opt-out. Some
> >> drivers are pretty much unmaintained now and are likely to never fix
> >> those warnings.
>=20
> Then I'd go for enabling in drm level and disabling individual warnings
> in the driver Makefile level if they won't get fixed.
>=20
> > Maybe add a Kconfig symbol for it instead of making unconditional?
> >
> > Something like:
> >
> > +# Unconditionally enable W=3D1 warnings locally
> > +# --- begin copy-paste W=3D1 warnings from scripts/Makefile.extrawarn
> > +subdir-ccflags-$(CONFIG_DRM_EXTRA_CHECKS)  +=3D -Wextra -Wunused -Wno-=
unused-parameter
> > ...
>=20
> Then we'll have a ping pong of people not using W=3D1 or
> CONFIG_DRM_EXTRA_CHECKS introducing warnings, and people using them
> fixing the warnings...
>=20
> I really do think making it unconditional is the only way.

Yeah, I agree.

Plus, if we need to have an extra Kconfig option, it's pretty equivalent
to using W=3D1

Maxime

--l5v43uaob62lojdr
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCZWhevQAKCRDj7w1vZxhR
xa0vAQD6fJNa4FE8kEV07V3ldJ9iCAtokfo8ej0NeGXCLUFJIAEApdLSDmZuQduU
n1Ee05SRKejcP0ZEVbBiT8pmIpDGjA8=
=I3xF
-----END PGP SIGNATURE-----

--l5v43uaob62lojdr--
