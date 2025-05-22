Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C210AC10B7
	for <lists+dri-devel@lfdr.de>; Thu, 22 May 2025 18:07:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B163910E169;
	Thu, 22 May 2025 16:07:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="PfBpLEXK";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5EEFC10E169
 for <dri-devel@lists.freedesktop.org>; Thu, 22 May 2025 16:07:00 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id AA486A4E999;
 Thu, 22 May 2025 16:06:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 07D01C4CEE4;
 Thu, 22 May 2025 16:06:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1747930016;
 bh=oHAfxtLr472fih4uM/Vr2ZVIojGMCSC2Y8rZRoTUvsc=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=PfBpLEXKaSTCYKDSU8zEeKgcKomCjcePLn+Z3u/QpAYXVrVamlLD4Hw//0SVn+jtr
 BQDqKjPorn2poTIJbcJ+nG4k2SaSKdg3aKc0ShH80DcZTYDc7E7LrIDgQVDgmaDUH7
 1ML2mSY6CsFme7Btw0/s6Bf526zihTIISeLz51fi7ewTSSWueBntt1bIqAMJLUTb+H
 11x5GouXcETVWUSIBl6xZOKxZKHaqBHPxJfM2UfAjFUAqHOIfVEzU3gnNjrQjzZUpa
 2CNsHCKmGDWME2/2i5k4NlOIzjq70Y31xUj5L9Zj+ICMKJ2RigkGaSK1jcfdd2+kuN
 91Yz/TWcnyyyg==
Date: Thu, 22 May 2025 18:06:53 +0200
From: Maxime Ripard <mripard@kernel.org>
To: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 Dmitry Baryshkov <lumag@kernel.org>, kernel@collabora.com, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 14/23] drm/tests: hdmi: Add macro to support EDEADLK
 handling
Message-ID: <20250522-fearless-muskrat-of-ampleness-1ccd49@houat>
References: <20250425-hdmi-conn-yuv-v4-0-5e55e2aaa3fa@collabora.com>
 <20250425-hdmi-conn-yuv-v4-14-5e55e2aaa3fa@collabora.com>
 <20250519-sturdy-cyan-mouse-6bd0f1@houat>
 <7ce1a2d1-f4cb-4975-be24-b47e184ce1a8@collabora.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha384;
 protocol="application/pgp-signature"; boundary="yiydieeqfbxg6yib"
Content-Disposition: inline
In-Reply-To: <7ce1a2d1-f4cb-4975-be24-b47e184ce1a8@collabora.com>
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


--yiydieeqfbxg6yib
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v4 14/23] drm/tests: hdmi: Add macro to support EDEADLK
 handling
MIME-Version: 1.0

On Mon, May 19, 2025 at 01:35:46PM +0300, Cristian Ciocaltea wrote:
> On 5/19/25 10:22 AM, Maxime Ripard wrote:
> > Hi,
> >=20
> > On Fri, Apr 25, 2025 at 01:27:05PM +0300, Cristian Ciocaltea wrote:
> >> In preparation to improve error handling throughout all test cases,
> >> introduce a macro to check for EDEADLK and automate the restart of the
> >> atomic sequence.
> >>
> >> Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
> >> ---
> >>  drivers/gpu/drm/tests/drm_hdmi_state_helper_test.c | 10 ++++++++++
> >>  1 file changed, 10 insertions(+)
> >>
> >> diff --git a/drivers/gpu/drm/tests/drm_hdmi_state_helper_test.c b/driv=
ers/gpu/drm/tests/drm_hdmi_state_helper_test.c
> >> index c8969ee6518954ab4496d3a4398f428bf4104a36..c8bb131d63ea6d0c9e166c=
8d9ba5e403118cd9f1 100644
> >> --- a/drivers/gpu/drm/tests/drm_hdmi_state_helper_test.c
> >> +++ b/drivers/gpu/drm/tests/drm_hdmi_state_helper_test.c
> >> @@ -224,6 +224,16 @@ drm_kunit_helper_connector_hdmi_init(struct kunit=
 *test,
> >>  				test_edid_hdmi_1080p_rgb_max_200mhz);
> >>  }
> >> =20
> >> +#define drm_kunit_atomic_restart_on_deadlock(ret, state, ctx, start) =
do {	\
> >> +	if (ret =3D=3D -EDEADLK) {							\
> >> +		if (state)							\
> >> +			drm_atomic_state_clear(state);				\
> >> +		ret =3D drm_modeset_backoff(ctx);					\
> >> +		if (!ret)							\
> >> +			goto start;						\
> >> +	}									\
> >> +} while (0)
> >> +
> >=20
> > I'm not sure here either, for pretty much the same reason. As far as
> > locking goes, I really think we should prefer something explicit even if
> > it means a bit more boilerplate.
> >=20
> > If you still want to push this forward though, this has nothing to do
> > with kunit so it should be made a common helper.=20
>=20
> Ack.
>=20
> > I do think it should be
> > done in a separate series though. Ever-expanding series are a nightmare,
> > both to contribute and to review :)
>=20
> Indeed, let me take this separately.
>=20
> If you agree, I'd prefer to drop EDEADLK handling from the new tests as
> well, to allow sorting this out for all in a consistent manner.

We can't unfortunately. Most CI runners now run with WW_DEBUG that will
test for EDEADBLK handling.

Maxime

--yiydieeqfbxg6yib
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJUEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCaC9LnQAKCRAnX84Zoj2+
dpMYAXwPIo/WlZh2Znxsf6x67Xtl607BrjMkiSQ7aGP9WlUu+xhuPDs91FHUKLZe
VS4wt08Bfjn43SZVO5jlm3sCrxcyDOuVU9l0bbsv/gKvu3/c78IATNUWg4o6QU9J
MjjGG82UyA==
=ZgmH
-----END PGP SIGNATURE-----

--yiydieeqfbxg6yib--
