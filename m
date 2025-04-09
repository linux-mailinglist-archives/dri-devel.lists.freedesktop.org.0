Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 39410A82977
	for <lists+dri-devel@lfdr.de>; Wed,  9 Apr 2025 17:09:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7A1FB10E927;
	Wed,  9 Apr 2025 15:09:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="mbU5Wsu6";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DE63910E927
 for <dri-devel@lists.freedesktop.org>; Wed,  9 Apr 2025 15:09:18 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 40C9161127;
 Wed,  9 Apr 2025 15:09:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6278AC4CEE2;
 Wed,  9 Apr 2025 15:09:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1744211357;
 bh=3yHLgwmuJxnQxVrhxLsI0chQp6YRSOz9/k/MffD4a1k=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=mbU5Wsu67OxBL+VkmN5Nf5GS7Tb1VYfLB3ZkPR23cnlWlvR52n1w8Ok2Sjj6erkYv
 X+MvCFcvEO6q3Ir9+IvP1vzIXmf4UGzqAKfB7CwOL26+qd+eSE7ZUDrl2GGWnla13D
 WCPu26JgFzjEPQz2dG5byWEA1vKZCrYZ5UmioeTHSLxsVejSVxIhtnZ08vjY7lGqbW
 uZTM4ig6Hv1m7nbOVRer5iFjAMLXLHCJYQTjzYHrV+qMGX3fpRkeJN8X/7Tj7gDx95
 WoFjLqlAqB8QNL+JbfAIGFh92HbqaZwe9m/zd7Fqp5kd77+bDxiGeT02yvs5bdxmdS
 xBqaM+OVl2PBQ==
Date: Wed, 9 Apr 2025 17:09:15 +0200
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
Subject: Re: [PATCH v3 07/15] drm/connector: hdmi: Use YUV420 output format
 as an RGB fallback
Message-ID: <20250409-magnificent-skunk-of-art-689cf4@houat>
References: <20250326-hdmi-conn-yuv-v3-0-294d3ebbb4b2@collabora.com>
 <20250326-hdmi-conn-yuv-v3-7-294d3ebbb4b2@collabora.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="vguyqmhtxx72bryx"
Content-Disposition: inline
In-Reply-To: <20250326-hdmi-conn-yuv-v3-7-294d3ebbb4b2@collabora.com>
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


--vguyqmhtxx72bryx
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v3 07/15] drm/connector: hdmi: Use YUV420 output format
 as an RGB fallback
MIME-Version: 1.0

On Wed, Mar 26, 2025 at 12:19:56PM +0200, Cristian Ciocaltea wrote:
> Try to make use of YUV420 when computing the best output format and
> RGB cannot be supported for any of the available color depths.
>=20
> Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
> ---
>  drivers/gpu/drm/display/drm_hdmi_state_helper.c | 10 ++++++++++
>  1 file changed, 10 insertions(+)
>=20
> diff --git a/drivers/gpu/drm/display/drm_hdmi_state_helper.c b/drivers/gp=
u/drm/display/drm_hdmi_state_helper.c
> index 6de0abb15ecb36fd4eb98725e2a3835e5e0db134..3859600c6af4a79f30858adfc=
9f9a710dfe561a5 100644
> --- a/drivers/gpu/drm/display/drm_hdmi_state_helper.c
> +++ b/drivers/gpu/drm/display/drm_hdmi_state_helper.c
> @@ -650,7 +650,17 @@ hdmi_compute_config(const struct drm_connector *conn=
ector,
> =20
>  	ret =3D hdmi_compute_format_bpc(connector, conn_state, mode, max_bpc,
>  				      HDMI_COLORSPACE_RGB);
> +	if (!ret)
> +		return 0;
> =20
> +	if (!connector->ycbcr_420_allowed) {
> +		drm_dbg_kms(connector->dev,
> +			    "YUV420 output format not allowed for connector.\n");
> +		return -EINVAL;
> +	}
> +
> +	ret =3D hdmi_compute_format_bpc(connector, conn_state, mode, max_bpc,
> +				      HDMI_COLORSPACE_YUV420);
>  	return ret;

I think I'd prefer to log a debug message there and return 0 if it
succeeds, something like

ret =3D hdmi_compute_format_bpc(..)
if (ret) {
   drm_dbg("YUV420 doesn't work").
   return ret;
}

return 0;

--vguyqmhtxx72bryx
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCZ/aNmgAKCRDj7w1vZxhR
xa7uAP9LX91dccVXaMubXB/KLOCOPWvra/2aAntMaTo7x913yQD5AUiRnB9E+hha
elKFvmiQQvxGhCU4UnbSYq/iHzl38QI=
=kXGJ
-----END PGP SIGNATURE-----

--vguyqmhtxx72bryx--
