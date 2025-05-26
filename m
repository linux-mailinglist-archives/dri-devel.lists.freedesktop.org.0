Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 16F66AC3A1B
	for <lists+dri-devel@lfdr.de>; Mon, 26 May 2025 08:44:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A890210E054;
	Mon, 26 May 2025 06:44:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="n9i3RBdK";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E919F10E054
 for <dri-devel@lists.freedesktop.org>; Mon, 26 May 2025 06:44:09 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id DDAB9A4E049;
 Mon, 26 May 2025 06:44:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 164B8C4CEE7;
 Mon, 26 May 2025 06:44:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1748241847;
 bh=hVpxBRkHdn9LWbevrRY7cTwGyqnEoh9xSW6K+/UdL3I=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=n9i3RBdKOZouDq5Vu7nuEx+uNgKGM+jZIbRoIsaak74rop4f3tecnEhVEtq6V2QhA
 iNbRu18t+BuN3E+LjtqY7bBm+iuFN8Cjde4V/h5jklCDblgJHnucfOHoGEFu7pisfU
 lsRkGO4phNemm50WYWlkjIZLCsVg21rtkvUHxxF+TIQRw6a4Ih/+pNiikR8iVQvvFg
 4vEVRSQoE0XkSM7gQvI+QjIhGakYEXW7B0xpfFZMH7nt/4L+6TibNGyqbO1XukiBZN
 EYjLR+Br0HjWtGGO2VAQ+QEGFlQ8Kn17V+gf3Q9hGYgf+6Ky84UOcDRoQLXFgTJyI0
 6MdmKVF63Hn2g==
Date: Mon, 26 May 2025 08:44:04 +0200
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
Message-ID: <20250526-brawny-determined-lizard-aeef92@houat>
References: <20250425-hdmi-conn-yuv-v4-0-5e55e2aaa3fa@collabora.com>
 <20250425-hdmi-conn-yuv-v4-14-5e55e2aaa3fa@collabora.com>
 <20250519-sturdy-cyan-mouse-6bd0f1@houat>
 <7ce1a2d1-f4cb-4975-be24-b47e184ce1a8@collabora.com>
 <20250522-fearless-muskrat-of-ampleness-1ccd49@houat>
 <88e1fed3-47eb-4925-b11a-71557af9add5@collabora.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha384;
 protocol="application/pgp-signature"; boundary="zxkukyinj66w3cmw"
Content-Disposition: inline
In-Reply-To: <88e1fed3-47eb-4925-b11a-71557af9add5@collabora.com>
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


--zxkukyinj66w3cmw
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v4 14/23] drm/tests: hdmi: Add macro to support EDEADLK
 handling
MIME-Version: 1.0

On Thu, May 22, 2025 at 07:47:00PM +0300, Cristian Ciocaltea wrote:
> On 5/22/25 7:06 PM, Maxime Ripard wrote:
> > On Mon, May 19, 2025 at 01:35:46PM +0300, Cristian Ciocaltea wrote:
> >> On 5/19/25 10:22 AM, Maxime Ripard wrote:
> >>> Hi,
> >>>
> >>> On Fri, Apr 25, 2025 at 01:27:05PM +0300, Cristian Ciocaltea wrote:
> >>>> In preparation to improve error handling throughout all test cases,
> >>>> introduce a macro to check for EDEADLK and automate the restart of t=
he
> >>>> atomic sequence.
> >>>>
> >>>> Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
> >>>> ---
> >>>>  drivers/gpu/drm/tests/drm_hdmi_state_helper_test.c | 10 ++++++++++
> >>>>  1 file changed, 10 insertions(+)
> >>>>
> >>>> diff --git a/drivers/gpu/drm/tests/drm_hdmi_state_helper_test.c b/dr=
ivers/gpu/drm/tests/drm_hdmi_state_helper_test.c
> >>>> index c8969ee6518954ab4496d3a4398f428bf4104a36..c8bb131d63ea6d0c9e16=
6c8d9ba5e403118cd9f1 100644
> >>>> --- a/drivers/gpu/drm/tests/drm_hdmi_state_helper_test.c
> >>>> +++ b/drivers/gpu/drm/tests/drm_hdmi_state_helper_test.c
> >>>> @@ -224,6 +224,16 @@ drm_kunit_helper_connector_hdmi_init(struct kun=
it *test,
> >>>>  				test_edid_hdmi_1080p_rgb_max_200mhz);
> >>>>  }
> >>>> =20
> >>>> +#define drm_kunit_atomic_restart_on_deadlock(ret, state, ctx, start=
) do {	\
> >>>> +	if (ret =3D=3D -EDEADLK) {							\
> >>>> +		if (state)							\
> >>>> +			drm_atomic_state_clear(state);				\
> >>>> +		ret =3D drm_modeset_backoff(ctx);					\
> >>>> +		if (!ret)							\
> >>>> +			goto start;						\
> >>>> +	}									\
> >>>> +} while (0)
> >>>> +
> >>>
> >>> I'm not sure here either, for pretty much the same reason. As far as
> >>> locking goes, I really think we should prefer something explicit even=
 if
> >>> it means a bit more boilerplate.
> >>>
> >>> If you still want to push this forward though, this has nothing to do
> >>> with kunit so it should be made a common helper.=20
> >>
> >> Ack.
> >>
> >>> I do think it should be
> >>> done in a separate series though. Ever-expanding series are a nightma=
re,
> >>> both to contribute and to review :)
> >>
> >> Indeed, let me take this separately.
> >>
> >> If you agree, I'd prefer to drop EDEADLK handling from the new tests as
> >> well, to allow sorting this out for all in a consistent manner.
> >=20
> > We can't unfortunately. Most CI runners now run with WW_DEBUG that will
> > test for EDEADBLK handling.
>=20
> Ok, in that case I'll proceed with the explicit error handling for the
> new tests only.  And as soon as the series gets merged, I'll come up
> with a common helper and apply it for all tests.

Sounds like a good plan :)

Maxime

--zxkukyinj66w3cmw
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJUEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCaDQNrwAKCRAnX84Zoj2+
dkb6AX9DojgehpO2uMfUajX5D5kQjQI1O7fI/s2oGtaLk3c9NeB4WtyK6hWz4kpG
Mx0+6m8BgPJEwLrr2nXe501YcBIqai1vPQc2BJ26AlLTZR/PhfS405mfZVUnc2S0
098thcySYg==
=aDTM
-----END PGP SIGNATURE-----

--zxkukyinj66w3cmw--
