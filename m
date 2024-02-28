Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A7CC286B325
	for <lists+dri-devel@lfdr.de>; Wed, 28 Feb 2024 16:29:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A409110E1AE;
	Wed, 28 Feb 2024 15:29:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="H3twjr27";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 75BAB10E097
 for <dri-devel@lists.freedesktop.org>; Wed, 28 Feb 2024 15:29:41 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 99C5ACE1B70;
 Wed, 28 Feb 2024 15:29:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5403CC433F1;
 Wed, 28 Feb 2024 15:29:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1709134176;
 bh=lRf/rIbATsUTI1YkCvuC+3znuOvvZIuYq5dyiYZsoXA=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=H3twjr27b1HacuKRDSNxpv4YwUtDnjvSa7PX91jk2W+KLQn/tKQeVrFP5cBBaFMKY
 yfqR4EQNDiRuQsYvGU5EAuabsTfXLPkmKGxgd2RgeU1Obd+WbHAuowDK8sGTrok57w
 oPBzz2RYsBcaPd8y8BjPwKKkrWUhttL4CuV99jxSUsHJLzOALFQZYjM4Pt9y7MKt15
 7der0X817Nodjt8yQR9gYxYm/kbUIlm0HjwIhXVLcNrP/NFrzfGKHtFRlxSizYWGp5
 RbSXTVrB77BXGBg3NfiFWf3nHoi4D37BJC1kh2TzDhJthU6Urv0W5yhbZkTCH1S73e
 Q9PP4zay7kgtA==
Date: Wed, 28 Feb 2024 16:29:33 +0100
From: Maxime Ripard <mripard@kernel.org>
To: Anatoliy Klymenko <anatoliy.klymenko@amd.com>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Michal Simek <michal.simek@amd.com>, Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Jonas Karlman <jonas@kwiboo.se>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, dri-devel@lists.freedesktop.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 4/4] drm/atomic-helper: Add select_output_bus_format
 callback
Message-ID: <20240228-nifty-flashy-shrew-905edc@houat>
References: <20240226-dp-live-fmt-v1-0-b78c3f69c9d8@amd.com>
 <20240226-dp-live-fmt-v1-4-b78c3f69c9d8@amd.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="cidk5nrah5kgputl"
Content-Disposition: inline
In-Reply-To: <20240226-dp-live-fmt-v1-4-b78c3f69c9d8@amd.com>
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


--cidk5nrah5kgputl
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Mon, Feb 26, 2024 at 08:44:45PM -0800, Anatoliy Klymenko wrote:
> Add select_output_bus_format to CRTC atomic helpers callbacks. This
> callback Will allow CRTC to participate in media bus format negotiation
> over connected DRM bridge chain and impose CRTC-specific restrictions.
> A good example is CRTC implemented as FPGA soft IP. This kind of CRTC will
> most certainly support a single output media bus format, as supporting
> multiple runtime options consumes extra FPGA resources. A variety of
> options for FPGA are usually achieved by synthesizing IP with different
> parameters.
>=20
> Incorporate select_output_bus_format callback into the format negotiation
> stage to fix the input bus format of the first DRM bridge in the chain.
>=20
> Signed-off-by: Anatoliy Klymenko <anatoliy.klymenko@amd.com>
> ---
>  drivers/gpu/drm/drm_bridge.c             | 19 +++++++++++++++++--
>  include/drm/drm_modeset_helper_vtables.h | 31 ++++++++++++++++++++++++++=
+++++
>  2 files changed, 48 insertions(+), 2 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/drm_bridge.c b/drivers/gpu/drm/drm_bridge.c
> index 521a71c61b16..453ae3d174b4 100644
> --- a/drivers/gpu/drm/drm_bridge.c
> +++ b/drivers/gpu/drm/drm_bridge.c
> @@ -32,6 +32,7 @@
>  #include <drm/drm_edid.h>
>  #include <drm/drm_encoder.h>
>  #include <drm/drm_file.h>
> +#include <drm/drm_modeset_helper_vtables.h>
>  #include <drm/drm_of.h>
>  #include <drm/drm_print.h>
> =20
> @@ -879,7 +880,8 @@ static int select_bus_fmt_recursive(struct drm_bridge=
 *first_bridge,
>  	unsigned int i, num_in_bus_fmts =3D 0;
>  	struct drm_bridge_state *cur_state;
>  	struct drm_bridge *prev_bridge;
> -	u32 *in_bus_fmts;
> +	struct drm_crtc *crtc =3D crtc_state->crtc;
> +	u32 *in_bus_fmts, in_fmt;
>  	int ret;
> =20
>  	prev_bridge =3D drm_bridge_get_prev_bridge(cur_bridge);
> @@ -933,7 +935,20 @@ static int select_bus_fmt_recursive(struct drm_bridg=
e *first_bridge,
>  		return -ENOMEM;
> =20
>  	if (first_bridge =3D=3D cur_bridge) {
> -		cur_state->input_bus_cfg.format =3D in_bus_fmts[0];
> +		in_fmt =3D in_bus_fmts[0];
> +		if (crtc->helper_private &&
> +		    crtc->helper_private->select_output_bus_format) {
> +			in_fmt =3D crtc->helper_private->select_output_bus_format(
> +							crtc,
> +							crtc->state,
> +							in_bus_fmts,
> +							num_in_bus_fmts);
> +			if (!in_fmt) {
> +				kfree(in_bus_fmts);
> +				return -ENOTSUPP;
> +			}
> +		}
> +		cur_state->input_bus_cfg.format =3D in_fmt;

I don't think we should start poking at the CRTC internals, but we
should rather provide a helper here.

>  		cur_state->output_bus_cfg.format =3D out_bus_fmt;
>  		kfree(in_bus_fmts);
>  		return 0;
> diff --git a/include/drm/drm_modeset_helper_vtables.h b/include/drm/drm_m=
odeset_helper_vtables.h
> index 881b03e4dc28..7c21ae1fe3ad 100644
> --- a/include/drm/drm_modeset_helper_vtables.h
> +++ b/include/drm/drm_modeset_helper_vtables.h
> @@ -489,6 +489,37 @@ struct drm_crtc_helper_funcs {
>  				     bool in_vblank_irq, int *vpos, int *hpos,
>  				     ktime_t *stime, ktime_t *etime,
>  				     const struct drm_display_mode *mode);
> +
> +	/**
> +	 * @select_output_bus_format
> +	 *
> +	 * Called by the first connected DRM bridge to negotiate input media
> +	 * bus format. CRTC is expected to pick preferable media formats from
> +	 * the list supported by the DRM bridge chain.

There's nothing restricting it to bridges here. Please rephrase this to
remove the bridge mention. The user is typically going to be the
encoder, and bridges are just an automagic implementation of an encoder.

And generally speaking, I'd really like to have an implementation
available before merging this.

Maxime

--cidk5nrah5kgputl
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCZd9RXQAKCRDj7w1vZxhR
xabiAPwMUBllLVjJ2R8GSARBjyjpbidi/etMNmmjB31GnUsLCQD9GXcs+YhUV+XC
WZuXsHmZaEgjQI0Yn+ELSS5uW/RRqgg=
=PnFN
-----END PGP SIGNATURE-----

--cidk5nrah5kgputl--
