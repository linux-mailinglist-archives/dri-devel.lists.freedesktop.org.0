Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 616AAA82A22
	for <lists+dri-devel@lfdr.de>; Wed,  9 Apr 2025 17:25:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AFEAF10E217;
	Wed,  9 Apr 2025 15:25:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="CVipaGgY";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8A7CC10E217
 for <dri-devel@lists.freedesktop.org>; Wed,  9 Apr 2025 15:25:02 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 138CDA49A33;
 Wed,  9 Apr 2025 15:19:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 06874C4CEE2;
 Wed,  9 Apr 2025 15:25:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1744212301;
 bh=f/FO5GTKMU9ObZYbBYCNeNcnVE8l9ubyQfnRoLVD0eI=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=CVipaGgYSuP3YLyMIS1uw8IOrgvs4BJzGrD0hGMndXXMk8C0I/EsKhLo843Q4AmEk
 MpZceQ8tMOZVbOOxUtDqsO0xhnrkug7ffUkh+iaXVKBqu8JI7dkFKQ7kK0U6cyNGi3
 HFephaMOofyA8oSvl6U2LQvtkGh5eqAeop/lOGC8exmQO2JG5JDuLtGmBEwwl8wowk
 WfSHxkFRTpKU03NdfcN3/ctv+F6KGUPPkhwr+FZ8uynC9vyYTb9sGDyek8DHJp3M4F
 mMLd84CIoj/PPjaa0MPHNYsL1voUQi/oLBkTJwtb+bP3WLZBM9x98Vx+ecCjeT1CMN
 gPAdL3PAkofcw==
Date: Wed, 9 Apr 2025 17:24:58 +0200
From: Maxime Ripard <mripard@kernel.org>
To: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
 kernel@collabora.com, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 11/15] drm/tests: hdmi: Drop unused
 drm_kunit_helper_connector_hdmi_init_funcs()
Message-ID: <20250409-refreshing-overjoyed-frigatebird-d3ee47@houat>
References: <20250326-hdmi-conn-yuv-v3-0-294d3ebbb4b2@collabora.com>
 <20250326-hdmi-conn-yuv-v3-11-294d3ebbb4b2@collabora.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="5hwuap5phutbkzyf"
Content-Disposition: inline
In-Reply-To: <20250326-hdmi-conn-yuv-v3-11-294d3ebbb4b2@collabora.com>
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


--5hwuap5phutbkzyf
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v3 11/15] drm/tests: hdmi: Drop unused
 drm_kunit_helper_connector_hdmi_init_funcs()
MIME-Version: 1.0

On Wed, Mar 26, 2025 at 12:20:00PM +0200, Cristian Ciocaltea wrote:
> After updating the code to make use of the new EDID setup helpers,
> drm_kunit_helper_connector_hdmi_init_funcs() became unused, hence drop
> it.
>=20
> Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
> ---
>  drivers/gpu/drm/tests/drm_hdmi_state_helper_test.c | 3 ---
>  1 file changed, 3 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/tests/drm_hdmi_state_helper_test.c b/drivers=
/gpu/drm/tests/drm_hdmi_state_helper_test.c
> index 7b2aaee5009ce58e6edf2649e2182c43ba834523..1e32694041277a541f0f8941d=
9c35e8ca9264599 100644
> --- a/drivers/gpu/drm/tests/drm_hdmi_state_helper_test.c
> +++ b/drivers/gpu/drm/tests/drm_hdmi_state_helper_test.c
> @@ -207,9 +207,6 @@ connector_hdmi_init_with_edid_funcs(struct kunit *tes=
t,
>  	return priv;
>  }
> =20
> -#define drm_kunit_helper_connector_hdmi_init_funcs(test, formats, max_bp=
c, funcs)		\
> -	connector_hdmi_init_with_edid_funcs(test, formats, max_bpc, funcs, NULL=
, 0)
> -

Oh, so there's still one we don't need.

I really don't like that back and forth. I think we can avoid it by doing s=
omething like:

- Create a common __connector_hdmi_init function out of drm_kunit_helper_co=
nnector_hdmi_init.

- Add an EDID parameter to that common function. The API of drm_kunit_helpe=
r_connector_hdmi_init and
  drm_kunit_helper_connector_hdmi_init_funcs doesn't need to change at that=
 point.

- Create a _with_edid_funcs macro. Note that only that one needs to be a ma=
cro.

- Convert the users to _with_edid_funcs, and drop drm_kunit_helper_connecto=
r_hdmi_init_funcs.

Maxime

--5hwuap5phutbkzyf
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCZ/aRSgAKCRDj7w1vZxhR
xZCTAP0QLHIE3823ulZrDW349IaFaVrYXqOkwW/ts+jszLhuBAEAq0TJoEtq0/va
rNDfSOaaVYviZr9aJwERGRHhKHliPgc=
=kjv7
-----END PGP SIGNATURE-----

--5hwuap5phutbkzyf--
