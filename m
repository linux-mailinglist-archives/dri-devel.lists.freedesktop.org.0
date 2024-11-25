Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 125479D89DB
	for <lists+dri-devel@lfdr.de>; Mon, 25 Nov 2024 17:01:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7D45D10E692;
	Mon, 25 Nov 2024 16:01:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="BTXAXBwj";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6B23310E692
 for <dri-devel@lists.freedesktop.org>; Mon, 25 Nov 2024 16:01:00 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id F0D335C59CB;
 Mon, 25 Nov 2024 16:00:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CE3F0C4CECE;
 Mon, 25 Nov 2024 16:00:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1732550459;
 bh=e8G0lW8ogmFnCkbf2xG8A2bDIU0/6g5brVU3VCxn4pI=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=BTXAXBwjhY/HJi/6PiReBk/XD60n4+dRiLQDWeRuAyfeiuKnNmqheHpR0ZSmbzgZ7
 YxKNbpxOYg9NSgQF7keI83FZKEzB2vI5gJ1TQKHU3TI7Yjh7otMEEFLAOGf7KjBFv3
 /TB4P+rbIPEoDj/F/E9FH2/SFgWnIolBMdF6kCyl5S7eKQ3499lALGhJAqIbp3K+PX
 7idtOc4jU0njV8sdmH+10anm/HP18wjyhafgbp1Pg5IfoaIeFfDDN7fYhdUbuRuRV7
 gmQXVBNZwc7DHgPtrBVs2esgTF4A+4zaaJZ+2gRgKTHlbXQCc59U/8MXdJNmxuGvVT
 PXfMDBruc0IXQ==
Date: Mon, 25 Nov 2024 17:00:56 +0100
From: Maxime Ripard <mripard@kernel.org>
To: Sean Nyekjaer <sean@geanix.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, Chen-Yu Tsai <wens@csie.org>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>,
 Yannick Fertre <yannick.fertre@foss.st.com>,
 Raphael Gallais-Pou <raphael.gallais-pou@foss.st.com>, 
 Philippe Cornu <philippe.cornu@foss.st.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
 linux-stm32@st-md-mailman.stormreply.com
Subject: Re: [PATCH v2 1/3] drm/modes: introduce drm_mode_validate_mode()
 helper function
Message-ID: <20241125-gleaming-anteater-of-perfection-42bd2b@houat>
References: <20241125-dsi-relax-v2-0-9113419f4a40@geanix.com>
 <20241125-dsi-relax-v2-1-9113419f4a40@geanix.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha384;
 protocol="application/pgp-signature"; boundary="7iaeslrnyclrukm7"
Content-Disposition: inline
In-Reply-To: <20241125-dsi-relax-v2-1-9113419f4a40@geanix.com>
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


--7iaeslrnyclrukm7
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v2 1/3] drm/modes: introduce drm_mode_validate_mode()
 helper function
MIME-Version: 1.0

Hi Sean,

On Mon, Nov 25, 2024 at 02:49:26PM +0100, Sean Nyekjaer wrote:
> Check if the required pixel clock is in within .5% range of the
> desired pixel clock.
> This will match the requirement for HDMI where a .5% tolerance is allowed.
>=20
> Signed-off-by: Sean Nyekjaer <sean@geanix.com>
> ---
>  drivers/gpu/drm/drm_modes.c | 34 ++++++++++++++++++++++++++++++++++
>  include/drm/drm_modes.h     |  2 ++
>  2 files changed, 36 insertions(+)
>=20
> diff --git a/drivers/gpu/drm/drm_modes.c b/drivers/gpu/drm/drm_modes.c
> index 6ba167a3346134072d100af0adbbe9b49e970769..4068b904759bf80502efde6e4=
d977b297f5d5359 100644
> --- a/drivers/gpu/drm/drm_modes.c
> +++ b/drivers/gpu/drm/drm_modes.c
> @@ -1623,6 +1623,40 @@ bool drm_mode_equal_no_clocks_no_stereo(const stru=
ct drm_display_mode *mode1,
>  }
>  EXPORT_SYMBOL(drm_mode_equal_no_clocks_no_stereo);
> =20
> +/**
> + * drm_mode_validate_mode
> + * @mode: mode to check
> + * @rounded_rate: output pixel clock
> + *
> + * VESA DMT defines a tolerance of 0.5% on the pixel clock, while the
> + * CVT spec reuses that tolerance in its examples, so it looks to be a
> + * good default tolerance for the EDID-based modes. Define it to 5 per
> + * mille to avoid floating point operations.
> + *
> + * Returns:
> + * The mode status
> + */
> +enum drm_mode_status drm_mode_validate_mode(const struct drm_display_mod=
e *mode,
> +					    unsigned long long rounded_rate)
> +{
> +	enum drm_mode_status status;
> +	unsigned long long rate =3D mode->clock * 1000;
> +	unsigned long long lowest, highest;
> +
> +	lowest =3D rate * (1000 - 5);
> +	do_div(lowest, 1000);
> +	if (rounded_rate < lowest)
> +		return MODE_CLOCK_LOW;
> +
> +	highest =3D rate * (1000 + 5);
> +	do_div(highest, 1000);
> +	if (rounded_rate > highest)
> +		return MODE_CLOCK_HIGH;
> +
> +	return MODE_OK;
> +}
> +EXPORT_SYMBOL(drm_mode_validate_mode);

Thanks a lot for doing that!

I wonder about the naming though (and prototype). I doesn't really
validates a mode, but rather makes sure that a given rate is a good
approximation of a pixel clock. So maybe something like
drm_mode_check_pixel_clock?

We probably need some kunit tests here too.

Maxime

--7iaeslrnyclrukm7
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJUEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCZ0SfMwAKCRAnX84Zoj2+
dp/LAX9KInEW+AE031WPvNsZu9uS0+xLFqEfIThuSCuXbnCM2H3Nz9ARAE+st+tg
1gd7pvABgIRkWDpLPaiGD3xvUJX3GM3Ebv50pWcCZHCWEhySv4P6zkew6y8w3RWs
hqB4Vy/oAA==
=kJ1A
-----END PGP SIGNATURE-----

--7iaeslrnyclrukm7--
