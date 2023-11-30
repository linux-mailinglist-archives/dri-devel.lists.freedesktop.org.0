Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 57D5F7FEBB1
	for <lists+dri-devel@lfdr.de>; Thu, 30 Nov 2023 10:18:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BF52F10E140;
	Thu, 30 Nov 2023 09:18:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 11BCC10E140;
 Thu, 30 Nov 2023 09:18:33 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 7F191CE1FE7;
 Thu, 30 Nov 2023 09:18:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 30406C433C8;
 Thu, 30 Nov 2023 09:18:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1701335909;
 bh=p8D1GXpx9l8qPpfGSEiXAyr1IiaXic8z4jKqVceRF7I=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=r8y9Hm7N8rpgSxmjSHuCKgU8wHhkpVriV7kMUoiVSFSdRiTQ9x95QrSn3ttDM6ajR
 gwK0prCsKzQunaaOnehpBOz9QHpImxaJkvpjotMXTyBTi/tzNUg/BxwxcoPcAcMBpM
 VRVl57BqjrR7/gR3H4EWsHc75CA9iQknO0En+ikFiKHxxYkX3yHJQqk7IQTdXIfoEF
 lefNUHS5dFF8Y+/5+ts0G34SLlWH1a5EZjKGufo73W5nDnnXQNTCqJFezDBBnVnY2e
 j9hT8j1H6plQ5POFcXM/JSZ3EYUMVs/X8bF8bTN9T49W5TOPdLhrl0hDqSGS8Or0a2
 MTtFNYWBzKRYQ==
Date: Thu, 30 Nov 2023 10:18:26 +0100
From: Maxime Ripard <mripard@kernel.org>
To: Jani Nikula <jani.nikula@intel.com>
Subject: Re: [RFC] drm: enable W=1 warnings by default across the subsystem
Message-ID: <eba23oyf4i3j6sdyqljjtgaz27brz4dxfrbtoddestjxwp5lr5@qxfj2b6szigc>
References: <20231129181219.1237887-1-jani.nikula@intel.com>
 <72248f22-6337-487a-9979-a0d79e37a9ed@amd.com>
 <874jh362ta.fsf@intel.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="kkimro66j5g4luvh"
Content-Disposition: inline
In-Reply-To: <874jh362ta.fsf@intel.com>
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
 Abhinav Kumar <quic_abhinavk@quicinc.com>, dri-devel@lists.freedesktop.org,
 Nathan Chancellor <nathan@kernel.org>,
 Alex Deucher <alexander.deucher@amd.com>, Danilo Krummrich <dakr@redhat.com>,
 Hamza Mahfooz <hamza.mahfooz@amd.com>, Thomas Zimmermann <tzimmermann@suse.de>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Marijn Suijten <marijn.suijten@somainline.org>, Sean Paul <sean@poorly.run>,
 Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--kkimro66j5g4luvh
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Thu, Nov 30, 2023 at 10:52:17AM +0200, Jani Nikula wrote:
> On Wed, 29 Nov 2023, Hamza Mahfooz <hamza.mahfooz@amd.com> wrote:
> > Cc: Nathan Chancellor <nathan@kernel.org>
> >
> > On 11/29/23 13:12, Jani Nikula wrote:
> >> At least the i915 and amd drivers enable a bunch more compiler warnings
> >> than the kernel defaults.
> >>=20
> >> Extend the W=3D1 warnings to the entire drm subsystem by default. Use =
the
> >> copy-pasted warnings from scripts/Makefile.extrawarn with
> >> s/KBUILD_CFLAGS/subdir-ccflags-y/ to make it easier to compare and keep
> >> up with them in the future.
> >>=20
> >> This is similar to the approach currently used in i915.
> >>=20
> >> Some of the -Wextra warnings do need to be disabled, just like in
> >> Makefile.extrawarn, but take care to not disable them for W=3D2 or W=
=3D3
> >> builds, depending on the warning.
> >
> > I think this should go in after drm-misc-next has a clean build (for
> > COMPILE_TEST builds) with this patch applied. Otherwise, it will break a
> > lot of build configs.
>=20
> Oh, I'm absolutely not suggesting this should be merged before known
> warnings have been addressed one way or another. Either by fixing them
> or by disabling said warning in driver local Makefiles, depending on the
> case.

I'm all for it, but yeah, we need some easy way to opt-in/opt-out. Some
drivers are pretty much unmaintained now and are likely to never fix
those warnings.

Maxime

--kkimro66j5g4luvh
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCZWhTYgAKCRDj7w1vZxhR
xR1lAP4r5qbIZphWlaJXg8MBeam0E94KuZ0xhLcr5Rfbvkp6PAEAsDIToV9WXxM4
CUgbJNN3SLGTt1qnWAMytlRRWpzghQ8=
=hJW+
-----END PGP SIGNATURE-----

--kkimro66j5g4luvh--
