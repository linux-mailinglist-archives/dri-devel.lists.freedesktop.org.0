Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9485A9853D7
	for <lists+dri-devel@lfdr.de>; Wed, 25 Sep 2024 09:23:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1723110E220;
	Wed, 25 Sep 2024 07:23:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="upcxZK6c";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 62CD410E220;
 Wed, 25 Sep 2024 07:23:11 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 5D3DFA43C14;
 Wed, 25 Sep 2024 07:23:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C1327C4CEC3;
 Wed, 25 Sep 2024 07:23:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1727248990;
 bh=+MshezIUowXnhFogys8xJQLBrxENmFL5Y2dLYOhLzJU=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=upcxZK6cgfxo3wt/KjWFpciHZWnFtGjvzOWMqfmWALgvfAIeNqpETpb0kaVuFZeRe
 8idI676mrJR1AZmdTrVp7uQV7B/xgIO8DF3UlyMGthwM0FdZg4Ty25sS2LRc63tX1v
 rDo8tlIVQGkq5Zow2wjuVy8KTNOhT+cfOE1exG7pWUAkQq2ksUqNXOQROgn1n4wnMg
 LuyTXy99OTOmMv/x5DGITs5ifUAl/bZum1baVzyjKwW6Cru9c7UO298Rq5a3BlSFQ8
 8b83yM8JkAZGdiefoBzRcMHJgS2CvW6MSqL9mdHb5fRrxGp9RyXp+Ttoxh+rmSl4Cj
 y94S3zIClEgeg==
Date: Wed, 25 Sep 2024 09:23:07 +0200
From: Maxime Ripard <mripard@kernel.org>
To: Jessica Zhang <quic_jesszhan@quicinc.com>
Cc: Rob Clark <robdclark@gmail.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, quic_abhinavk@quicinc.com,
 Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>, quic_ebharadw@quicinc.com,
 linux-arm-msm@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Rob Clark <robdclark@chromium.org>,
 Ville =?utf-8?B?U3lyasOkbMOk?= <ville.syrjala@linux.intel.com>
Subject: Re: [PATCH v2 02/22] drm: Add valid clones check
Message-ID: <20240925-hasty-bald-caribou-eedbf5@houat>
References: <20240924-concurrent-wb-v2-0-7849f900e863@quicinc.com>
 <20240924-concurrent-wb-v2-2-7849f900e863@quicinc.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha384;
 protocol="application/pgp-signature"; boundary="tp2mdysvfttz7mch"
Content-Disposition: inline
In-Reply-To: <20240924-concurrent-wb-v2-2-7849f900e863@quicinc.com>
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


--tp2mdysvfttz7mch
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 24, 2024 at 03:59:18PM GMT, Jessica Zhang wrote:
> Check that all encoders attached to a given CRTC are valid
> possible_clones of each other.
>=20
> Signed-off-by: Jessica Zhang <quic_jesszhan@quicinc.com>
> ---
>  drivers/gpu/drm/drm_atomic_helper.c | 23 +++++++++++++++++++++++
>  1 file changed, 23 insertions(+)
>=20
> diff --git a/drivers/gpu/drm/drm_atomic_helper.c b/drivers/gpu/drm/drm_at=
omic_helper.c
> index 43cdf39019a4..cc4001804fdc 100644
> --- a/drivers/gpu/drm/drm_atomic_helper.c
> +++ b/drivers/gpu/drm/drm_atomic_helper.c
> @@ -574,6 +574,25 @@ mode_valid(struct drm_atomic_state *state)
>  	return 0;
>  }
> =20
> +static int drm_atomic_check_valid_clones(struct drm_atomic_state *state,
> +					 struct drm_crtc *crtc)
> +{
> +	struct drm_encoder *drm_enc;
> +	struct drm_crtc_state *crtc_state =3D drm_atomic_get_new_crtc_state(sta=
te,
> +									  crtc);
> +
> +	drm_for_each_encoder_mask(drm_enc, crtc->dev, crtc_state->encoder_mask)=
 {
> +		if ((crtc_state->encoder_mask & drm_enc->possible_clones) !=3D
> +		    crtc_state->encoder_mask) {
> +			DRM_DEBUG("crtc%d failed valid clone check for mask 0x%x\n",
> +				  crtc->base.id, crtc_state->encoder_mask);
> +			return -EINVAL;
> +		}
> +	}
> +
> +	return 0;
> +}
> +
>  /**
>   * drm_atomic_helper_check_modeset - validate state object for modeset c=
hanges
>   * @dev: DRM device
> @@ -745,6 +764,10 @@ drm_atomic_helper_check_modeset(struct drm_device *d=
ev,
>  		ret =3D drm_atomic_add_affected_planes(state, crtc);
>  		if (ret !=3D 0)
>  			return ret;
> +
> +		ret =3D drm_atomic_check_valid_clones(state, crtc);
> +		if (ret !=3D 0)
> +			return ret;
>  	}

Pretty much the same comment, we should have kunit tests for this.

Maxime

--tp2mdysvfttz7mch
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJUEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCZvO6WgAKCRAnX84Zoj2+
droGAYDSol3kgX7wkzSE1oluNc2+KTnfRFY6zafC8+pe813u+oXEix2JgVyztgXw
aPgARssBgIVCQkqjoD4G64sFreIbBdDVYhH6QcPY/DKdVoih5mbH1LB4c9jksnGD
3arX4CTVbg==
=pdXg
-----END PGP SIGNATURE-----

--tp2mdysvfttz7mch--
