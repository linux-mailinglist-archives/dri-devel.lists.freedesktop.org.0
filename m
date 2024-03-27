Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 83D4388D758
	for <lists+dri-devel@lfdr.de>; Wed, 27 Mar 2024 08:35:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A5A9110F624;
	Wed, 27 Mar 2024 07:35:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="a/htAbI+";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8E12710EF91;
 Wed, 27 Mar 2024 07:35:21 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 63CA261454;
 Wed, 27 Mar 2024 07:35:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6B3B9C433C7;
 Wed, 27 Mar 2024 07:35:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1711524920;
 bh=UAnVQGoAPsJj0RTqwPv7GtRQmnVPP2+uQrat1icIzbA=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=a/htAbI+I9fi192jRanzq4ewTfJ71ORvjAZMdlVaJHl+ZdjybyU0gLpnJ7XZvVsnV
 IQUjDedjbFoXa/OXJd33V43rqqzBhkQLMGxjLI1fdGuq/St2cXZ501YV1nNN83gCNx
 DsFmt60c+GP+d76744vkr5x2B7Abmg/KNbGgjvo7lCPA7P8ZTG4VP3pmCBtbkayaw5
 020ZryIHuCXqJwZrZ1ELopjWASpPV/mEBxUwgJ98SunLBGjnexZNnLz2Wm3BZ8bsST
 +EjhU+9PByDHMC4+Ubbzr5lN5L196BZ3ZJ5h7BH0pzEFJ8Yg3jQHDAiXS6Av7pplMI
 1Bspmjlr0OKxw==
Date: Wed, 27 Mar 2024 08:34:59 +0100
From: Maxime Ripard <mripard@kernel.org>
To: Nathan Chancellor <nathan@kernel.org>
Cc: Jani Nikula <jani.nikula@intel.com>, dri-devel@lists.freedesktop.org, 
 intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>,
 Alex Deucher <alexander.deucher@amd.com>, 
 Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>, "Pan,
 Xinhui" <Xinhui.Pan@amd.com>, 
 Karol Herbst <kherbst@redhat.com>, Lyude Paul <lyude@redhat.com>, 
 Danilo Krummrich <dakr@redhat.com>, Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
 Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>, 
 Hamza Mahfooz <hamza.mahfooz@amd.com>,
 Javier Martinez Canillas <javierm@redhat.com>, 
 Sui Jingfeng <sui.jingfeng@linux.dev>, linux-kbuild@vger.kernel.org,
 llvm@lists.linux.dev
Subject: Re: [RESEND v3 2/2] drm: Add CONFIG_DRM_WERROR
Message-ID: <20240327-cherubic-steel-tiger-e1c36a@houat>
References: <cover.1709629403.git.jani.nikula@intel.com>
 <afe5ed943414f7ec3044c1547503b9941686a867.1709629403.git.jani.nikula@intel.com>
 <20240326225650.GA2784736@dev-arch.thelio-3990X>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha384;
 protocol="application/pgp-signature"; boundary="mgxbjg53disbplak"
Content-Disposition: inline
In-Reply-To: <20240326225650.GA2784736@dev-arch.thelio-3990X>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--mgxbjg53disbplak
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Tue, Mar 26, 2024 at 03:56:50PM -0700, Nathan Chancellor wrote:
> On Tue, Mar 05, 2024 at 11:07:36AM +0200, Jani Nikula wrote:
> > Add kconfig to enable -Werror subsystem wide. This is useful for
> > development and CI to keep the subsystem warning free, while avoiding
> > issues outside of the subsystem that kernel wide CONFIG_WERROR=3Dy might
> > hit.
> >=20
> > v2: Don't depend on COMPILE_TEST
> >=20
> > Reviewed-by: Hamza Mahfooz <hamza.mahfooz@amd.com> # v1
> > Signed-off-by: Jani Nikula <jani.nikula@intel.com>
> > ---
> >  drivers/gpu/drm/Kconfig  | 13 +++++++++++++
> >  drivers/gpu/drm/Makefile |  3 +++
> >  2 files changed, 16 insertions(+)
> >=20
> > diff --git a/drivers/gpu/drm/Kconfig b/drivers/gpu/drm/Kconfig
> > index 6e853acf15da..c08e18108c2a 100644
> > --- a/drivers/gpu/drm/Kconfig
> > +++ b/drivers/gpu/drm/Kconfig
> > @@ -416,3 +416,16 @@ config DRM_LIB_RANDOM
> >  config DRM_PRIVACY_SCREEN
> >  	bool
> >  	default n
> > +
> > +config DRM_WERROR
> > +	bool "Compile the drm subsystem with warnings as errors"
> > +	depends on EXPERT
> > +	default n
> > +	help
> > +	  A kernel build should not cause any compiler warnings, and this
> > +	  enables the '-Werror' flag to enforce that rule in the drm subsyste=
m.
> > +
> > +	  The drm subsystem enables more warnings than the kernel default, so
> > +	  this config option is disabled by default.
> > +
> > +	  If in doubt, say N.
>=20
> While I understand the desire for an easy switch that maintainers and
> developers can use to ensure that their changes are warning free for the
> drm subsystem specifically, I think subsystem specific configuration
> options like this are actively detrimental to developers and continuous
> integration systems that build test the entire kernel. For example, we
> turned off CONFIG_WERROR for our Hexagon builds because of warnings that
> appear with -Wextra that are legitimate but require treewide changes to
> resolve in a manner sufficient for Linus:
>=20
> https://github.com/ClangBuiltLinux/linux/issues/1285
> https://lore.kernel.org/all/CAHk-=3Dwg80je=3DK7madF4e7WrRNp37e3qh6y10Svhd=
c7O8SZ_-8g@mail.gmail.com/
> https://lore.kernel.org/all/20230522105049.1467313-1-schnelle@linux.ibm.c=
om/
>=20
> But now, due to CONFIG_DRM_WERROR getting enabled by all{mod,yes}config
> and -Wextra being unconditionally enabled for DRM, those warnings hard
> break the build despite CONFIG_WERROR=3Dn...

Would making DRM_WERROR depends on WERROR address your concerns?

Maxime

--mgxbjg53disbplak
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJUEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCZgPMGgAKCRAnX84Zoj2+
dm2VAYD0C0iPhwCfV3xv4SSkbtN9nFs9jV4NjQQ6zTlBlc6/yhRfoG3Qx7oPSDSw
PlDu5QgBf2FY0fdhs/iLrFuZMb+2LXNQ+6O2O7LckkP0xVDonEHOndNRemaf021C
WrRpUZAUdg==
=2uXh
-----END PGP SIGNATURE-----

--mgxbjg53disbplak--
