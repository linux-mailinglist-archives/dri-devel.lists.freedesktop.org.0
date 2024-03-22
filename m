Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EC0A0886A54
	for <lists+dri-devel@lfdr.de>; Fri, 22 Mar 2024 11:31:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D58A010F6D0;
	Fri, 22 Mar 2024 10:31:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="pebyrOqZ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5C4A710F55E
 for <dri-devel@lists.freedesktop.org>; Fri, 22 Mar 2024 10:31:10 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id AA44C6120C;
 Fri, 22 Mar 2024 10:31:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0D14AC433F1;
 Fri, 22 Mar 2024 10:31:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1711103469;
 bh=UUEqLZY926OzvcyM4AzY60Au8Cf9w6FnpcBoTROOC0k=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=pebyrOqZ/kkpqhT9lPzfQtwwYMJZXvaiMu1gMatvg2tgMHJx9IioiiVWvx6uypQmY
 G/+r7pU9Jgs3J0a7YPe+2veMpKADZtPs21Zw/oM9KFcS6Dcsgs/7ttzl3fMUxNa8Pr
 dO8CrMuq+3EZ8rX1bSbqZlMQJwziz0ZsoPM8awtnIUckF0VzJVI9/BgUGId1UxPm88
 gZ+Y9bPzhqklJGCKQ+I+JqI1RTFiwE9WRYQvFkqi6h7gaSgzxPQG2JqiPslpfJvebj
 DF69NSp5qjQsF1r5o0lmY15dZuZGOCb8c5XIrewVUOfZA+1A5oWDhfnhAuYEYw1DOL
 u81rcgOIJaHGg==
Date: Fri, 22 Mar 2024 11:31:06 +0100
From: Maxime Ripard <mripard@kernel.org>
To: Sui Jingfeng <sui.jingfeng@linux.dev>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
 Daniel Vetter <daniel@ffwll.ch>, Jonathan Corbet <corbet@lwn.net>, 
 Sandy Huang <hjc@rock-chips.com>,
 Heiko =?utf-8?Q?St=C3=BCbner?= <heiko@sntech.de>, 
 Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, Hans Verkuil <hverkuil@xs4all.nl>, 
 Sebastian Wick <sebastian.wick@redhat.com>,
 Ville =?utf-8?B?U3lyasOkbMOk?= <ville.syrjala@linux.intel.com>, 
 dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org,
 linux-doc@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
 linux-rockchip@lists.infradead.org, linux-sunxi@lists.linux.dev
Subject: Re: [v10,20/27] drm/connector: hdmi: Add Infoframes generation
Message-ID: <20240322-loose-resourceful-bullmastiff-92cfaf@houat>
References: <20240321-kms-hdmi-connector-state-v10-20-e6c178361898@kernel.org>
 <07125064-2a78-4515-bb48-655f2aec140f@linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="5rd3vuyyvq3awglq"
Content-Disposition: inline
In-Reply-To: <07125064-2a78-4515-bb48-655f2aec140f@linux.dev>
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


--5rd3vuyyvq3awglq
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Fri, Mar 22, 2024 at 05:53:07AM +0800, Sui Jingfeng wrote:
> Hi,
>=20
>=20
> On 2024/3/21 23:29, Maxime Ripard wrote:
> > Infoframes in KMS is usually handled by a bunch of low-level helpers
> > that require quite some boilerplate for drivers. This leads to
> > discrepancies with how drivers generate them, and which are actually
> > sent.
> >=20
> > Now that we have everything needed to generate them in the HDMI
> > connector state, we can generate them in our common logic so that
> > drivers can simply reuse what we precomputed.
> >=20
> > Signed-off-by: Maxime Ripard <mripard@kernel.org>
> > ---
> >   drivers/gpu/drm/Kconfig                            |   1 +
> >   drivers/gpu/drm/drm_atomic_state_helper.c          | 338 ++++++++++++=
+++++++++
> >   drivers/gpu/drm/drm_connector.c                    |  14 +
> >   .../gpu/drm/tests/drm_atomic_state_helper_test.c   |   1 +
> >   drivers/gpu/drm/tests/drm_connector_test.c         |  12 +
> >   include/drm/drm_atomic_state_helper.h              |   8 +
> >   include/drm/drm_connector.h                        | 109 +++++++
> >   7 files changed, 483 insertions(+)
> >=20
> > diff --git a/drivers/gpu/drm/Kconfig b/drivers/gpu/drm/Kconfig
> > index 16029435b750..3d3193c7aa5f 100644
> > --- a/drivers/gpu/drm/Kconfig
> > +++ b/drivers/gpu/drm/Kconfig
> > @@ -97,10 +97,11 @@ config DRM_KUNIT_TEST
> >   	  If in doubt, say "N".
> >   config DRM_KMS_HELPER
> >   	tristate
> >   	depends on DRM
> > +	select DRM_DISPLAY_HDMI_HELPER
>=20
> Should we select DRM_DISPLAY_HELPER here? Otherwise there will have
> some compile error emerged with default config.

Which default config are you talking about? This compiles fine with all
drm-misc defconfig, x86 defconfig and allmodconfig.

Maxime

--5rd3vuyyvq3awglq
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCZf1d6QAKCRDj7w1vZxhR
xfhQAQCu0NBIAdBH+cxZxEu6wIBjCqIn1oD+nTHDxOSsluuItwEA9Oy60mNpP4Om
Xu9L4CIP02hqE9XIyC9VujJM0cW/LQA=
=XSYZ
-----END PGP SIGNATURE-----

--5rd3vuyyvq3awglq--
