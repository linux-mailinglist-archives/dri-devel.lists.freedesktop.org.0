Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DF814ABB616
	for <lists+dri-devel@lfdr.de>; Mon, 19 May 2025 09:22:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 564CC10E171;
	Mon, 19 May 2025 07:22:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="NhufkVMz";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3FFA610E171
 for <dri-devel@lists.freedesktop.org>; Mon, 19 May 2025 07:22:37 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 6339761147;
 Mon, 19 May 2025 07:22:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 95DC7C4CEE4;
 Mon, 19 May 2025 07:22:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1747639356;
 bh=iG2zu/8gwjcJEossKts202i0rn38gtgdkMf4FgLTH6w=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=NhufkVMz/LAmcrM5WN7k+R8FOb/9INZiOMkQcub8BGzQLatCAV9wdm4Wp5K7doS69
 wrAFgXc/j+7iXBI4dVfcPZ6vouIzPNlbJ68ef/acJog53AdNhNUWyzlOaD2YYqMaod
 fbDrcoTxqVXvO1nQMAOBw5ym7X1ZQz3AmWgfx03Zv0QKZPaiJ1qvK2Bq0+C2mIJvrF
 0M/zs6vlu4Ca1oCykmMViL1pmpdFjjVDIMp7I17q+7TGRHX3AG2R/NcKxw+y2tn6I7
 B8t1H5YwId8aYIsBstY3IsSpDSmt4utmRAanIvMARBvDp7ESt39NIa9+fN6NXIwmm0
 LYIFbSS0bqzzg==
Date: Mon, 19 May 2025 09:22:32 +0200
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
Message-ID: <20250519-sturdy-cyan-mouse-6bd0f1@houat>
References: <20250425-hdmi-conn-yuv-v4-0-5e55e2aaa3fa@collabora.com>
 <20250425-hdmi-conn-yuv-v4-14-5e55e2aaa3fa@collabora.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha384;
 protocol="application/pgp-signature"; boundary="fg7l2vzngw5vx72e"
Content-Disposition: inline
In-Reply-To: <20250425-hdmi-conn-yuv-v4-14-5e55e2aaa3fa@collabora.com>
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


--fg7l2vzngw5vx72e
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v4 14/23] drm/tests: hdmi: Add macro to support EDEADLK
 handling
MIME-Version: 1.0

Hi,

On Fri, Apr 25, 2025 at 01:27:05PM +0300, Cristian Ciocaltea wrote:
> In preparation to improve error handling throughout all test cases,
> introduce a macro to check for EDEADLK and automate the restart of the
> atomic sequence.
>=20
> Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
> ---
>  drivers/gpu/drm/tests/drm_hdmi_state_helper_test.c | 10 ++++++++++
>  1 file changed, 10 insertions(+)
>=20
> diff --git a/drivers/gpu/drm/tests/drm_hdmi_state_helper_test.c b/drivers=
/gpu/drm/tests/drm_hdmi_state_helper_test.c
> index c8969ee6518954ab4496d3a4398f428bf4104a36..c8bb131d63ea6d0c9e166c8d9=
ba5e403118cd9f1 100644
> --- a/drivers/gpu/drm/tests/drm_hdmi_state_helper_test.c
> +++ b/drivers/gpu/drm/tests/drm_hdmi_state_helper_test.c
> @@ -224,6 +224,16 @@ drm_kunit_helper_connector_hdmi_init(struct kunit *t=
est,
>  				test_edid_hdmi_1080p_rgb_max_200mhz);
>  }
> =20
> +#define drm_kunit_atomic_restart_on_deadlock(ret, state, ctx, start) do =
{	\
> +	if (ret =3D=3D -EDEADLK) {							\
> +		if (state)							\
> +			drm_atomic_state_clear(state);				\
> +		ret =3D drm_modeset_backoff(ctx);					\
> +		if (!ret)							\
> +			goto start;						\
> +	}									\
> +} while (0)
> +

I'm not sure here either, for pretty much the same reason. As far as
locking goes, I really think we should prefer something explicit even if
it means a bit more boilerplate.

If you still want to push this forward though, this has nothing to do
with kunit so it should be made a common helper. I do think it should be
done in a separate series though. Ever-expanding series are a nightmare,
both to contribute and to review :)

Maxime

--fg7l2vzngw5vx72e
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJUEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCaCrcNAAKCRAnX84Zoj2+
dj9MAX9qfGQq296WzIqiz9klWhV3+6ue9kHaJets7hEX63eAUpq3tifBygp6/wB4
hvIoneABgKoxz41rKUDONkovSXhMDUP74r2zmJC3qvBOBi0O/b2b6LiZXWM6ebhp
lbqiM/yMVQ==
=k0qq
-----END PGP SIGNATURE-----

--fg7l2vzngw5vx72e--
