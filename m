Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 02EC6AC4F09
	for <lists+dri-devel@lfdr.de>; Tue, 27 May 2025 14:59:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 57E4789C46;
	Tue, 27 May 2025 12:59:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="FKPWGlxT";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6268889C46
 for <dri-devel@lists.freedesktop.org>; Tue, 27 May 2025 12:59:33 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id BB95A61129;
 Tue, 27 May 2025 12:59:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1EEC5C4CEEE;
 Tue, 27 May 2025 12:59:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1748350767;
 bh=9Ww0db6YYHyp/NhPry29pwWlOzV8ujFiF8NVGaemUmk=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=FKPWGlxT6cuS6igM7uEoRalEaBD1RFDa4cz6bZYkvXHN3A/QmbdhxVRjvRc+UMkyh
 4ENZHQzsmee4tit64k6FzkqRkApd1ZuZGs1R5QL+usoTXpfunOkZ0X3Dh3+CFnTNBM
 XxJkamUzDQsGWV88r13JLdm366m7io/4xUsSxuvp6MgsFzjEFZPv/ru7a4P1tvsuNi
 1cn/D83aLVvjkexJ0goaTkdCOKHQtOMFK0MiroSLK76LvGLHPXX1m4HsamlMwbxaXH
 K04xvkS1sB0ueSdDiAMejq74639bK6vINCLFJqrESYFvrupfrjys2Z3tbz9S34mYsb
 pyq85D4RwdGFQ==
Date: Tue, 27 May 2025 14:59:24 +0200
From: Maxime Ripard <mripard@kernel.org>
To: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 Dmitry Baryshkov <lumag@kernel.org>, kernel@collabora.com, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 23/23] drm/tests: hdmi: Add test for unsupported
 RGB/YUV420 mode
Message-ID: <20250527-honest-curvy-stoat-7bfbb5@houat>
References: <20250425-hdmi-conn-yuv-v4-0-5e55e2aaa3fa@collabora.com>
 <20250425-hdmi-conn-yuv-v4-23-5e55e2aaa3fa@collabora.com>
 <20250519-classy-millipede-of-competence-4bb6ad@houat>
 <a37b4045-0d94-4148-bb1e-fc08104e6173@collabora.com>
 <20250522-mutant-emu-of-youth-ae70cd@houat>
 <2a8554af-5b5b-4402-a065-a3e765f9ca4f@collabora.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha384;
 protocol="application/pgp-signature"; boundary="iblid6pemcxau6bn"
Content-Disposition: inline
In-Reply-To: <2a8554af-5b5b-4402-a065-a3e765f9ca4f@collabora.com>
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


--iblid6pemcxau6bn
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v4 23/23] drm/tests: hdmi: Add test for unsupported
 RGB/YUV420 mode
MIME-Version: 1.0

On Thu, May 22, 2025 at 08:37:31PM +0300, Cristian Ciocaltea wrote:
> Hi Maxime,
>=20
> On 5/22/25 7:16 PM, Maxime Ripard wrote:
> > Hi,
> >=20
> > On Mon, May 19, 2025 at 01:55:10PM +0300, Cristian Ciocaltea wrote:
> >> On 5/19/25 11:42 AM, Maxime Ripard wrote:
> >>> Hi,
> >>>
> >>> On Fri, Apr 25, 2025 at 01:27:14PM +0300, Cristian Ciocaltea wrote:
> >>>> Provide a test to verify that if both driver and screen support RGB =
and
> >>>> YUV420 formats, drm_atomic_helper_connector_hdmi_check() cannot succ=
eed
> >>>> when trying to set a mode unsupported by the display.
> >>>>
> >>>> Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
> >>>> ---
> >>>>  drivers/gpu/drm/tests/drm_hdmi_state_helper_test.c | 66 +++++++++++=
+++++++++++
> >>>>  1 file changed, 66 insertions(+)
> >>>>
> >>>> diff --git a/drivers/gpu/drm/tests/drm_hdmi_state_helper_test.c b/dr=
ivers/gpu/drm/tests/drm_hdmi_state_helper_test.c
> >>>> index d79084cfb516b69c4244098c0767d604ad02f2c3..6337a1c52b86810c638f=
446c4995e7ee63dbc084 100644
> >>>> --- a/drivers/gpu/drm/tests/drm_hdmi_state_helper_test.c
> >>>> +++ b/drivers/gpu/drm/tests/drm_hdmi_state_helper_test.c
> >>>> @@ -1622,6 +1622,71 @@ static void drm_test_check_driver_unsupported=
_fallback_yuv420(struct kunit *test
> >>>>  	drm_modeset_acquire_fini(&ctx);
> >>>>  }
> >>>> =20
> >>>> +/*
> >>>> + * Test that if a driver and screen supports RGB and YUV420 formats=
, but the
> >>>> + * chosen mode cannot be supported by the screen, we end up with un=
successful
> >>>> + * fallback attempts.
> >>>> + */
> >>>> +static void drm_test_check_display_unsupported_fallback_rgb_yuv420(=
struct kunit *test)
> >>>> +{
> >>>> +	struct drm_atomic_helper_connector_hdmi_priv *priv;
> >>>> +	struct drm_modeset_acquire_ctx ctx;
> >>>> +	struct drm_crtc_state *crtc_state;
> >>>> +	struct drm_atomic_state *state;
> >>>> +	struct drm_display_info *info;
> >>>> +	struct drm_display_mode *preferred, *unsupported_mode;
> >>>> +	struct drm_connector *conn;
> >>>> +	struct drm_device *drm;
> >>>> +	struct drm_crtc *crtc;
> >>>> +	int ret;
> >>>> +
> >>>> +	priv =3D drm_kunit_helper_connector_hdmi_init_with_edid_funcs(test,
> >>>> +				BIT(HDMI_COLORSPACE_RGB) |
> >>>> +				BIT(HDMI_COLORSPACE_YUV420),
> >>>> +				10,
> >>>> +				&dummy_connector_hdmi_funcs,
> >>>> +				test_edid_hdmi_4k_rgb_yuv420_dc_max_340mhz);
> >>>> +	KUNIT_ASSERT_NOT_NULL(test, priv);
> >>>> +
> >>>> +	drm =3D &priv->drm;
> >>>> +	crtc =3D priv->crtc;
> >>>> +	conn =3D &priv->connector;
> >>>> +	info =3D &conn->display_info;
> >>>> +	KUNIT_ASSERT_TRUE(test, info->is_hdmi);
> >>>> +	KUNIT_ASSERT_TRUE(test, conn->ycbcr_420_allowed);
> >>>> +
> >>>> +	preferred =3D find_preferred_mode(conn);
> >>>> +	KUNIT_ASSERT_NOT_NULL(test, preferred);
> >>>> +
> >>>> +	unsupported_mode =3D drm_kunit_display_mode_from_cea_vic(test, drm=
, 96);
> >>>> +	KUNIT_ASSERT_NOT_NULL(test, unsupported_mode);
> >>>
> >>> I'm not sure what this one is supposed to test. If the mode is
> >>> unsupported by the screen, it will be for both YUV and RGB, right? So
> >>> what are we testing here?
> >>
> >> That would be the case suggested at [1]:
> >>
> >> "We still need to do the same with a driver that supports both, but the
> >> monitor doesn't."
> >>
> >> Should we drop it?
> >=20
> > Ah, I see. I meant that we should normally end up with YUV420 (so mode
> > is supported by the monitor, but the resolution is too high for RGB and
> > we should pick YUV instead), but the monitor doesn't support it and thus
> > we fail.
>=20
> If I get it right, to verify this scenario we'd need a new test EDID
> that basically advertises an RGB mode which is not actually supported by
> the screen, i.e. the mode requires a TMDS rate which exceeds the maximum
> supported by the display for any of the available color depths.
>=20
> But that's not something we should encounter in practice, is it?  I mean
> the EDID would be wrong, as it doesn't match the hardware capabilities.
>=20
> Regardless, assuming this is solely for the purpose of testing the
> framework, I will try to come up with a test case.  The only problem
> is generating the EDID - which is a really annoying process, as I've
> already mentioned a while ago [1]. =20
>=20
> Hence I'm wondering if we could move on without it for the moment (I'll
> get back to it ASAP).

Oh, right, you're correct, I think we don't need to care, and we can
just skip that patch.

Maxime

--iblid6pemcxau6bn
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJUEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCaDW3LAAKCRAnX84Zoj2+
dqojAYCbE94V0C1OuOEgjlSeHmoyAdA7fdfONLrA6JKa1i/aoB6oLTcxV/b55EHj
R0XPXS0BgL+k4MlIQ34em4iGGDnys4MyDWjSR/qCdxMxLBM+r592ysm1h54Pz9cZ
yNoqvYtY5A==
=PJLM
-----END PGP SIGNATURE-----

--iblid6pemcxau6bn--
