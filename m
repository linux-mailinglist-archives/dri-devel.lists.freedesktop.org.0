Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C76AB90202F
	for <lists+dri-devel@lfdr.de>; Mon, 10 Jun 2024 13:16:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 039BA10E1BD;
	Mon, 10 Jun 2024 11:16:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="iASAedck";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D72B010E19D
 for <dri-devel@lists.freedesktop.org>; Mon, 10 Jun 2024 11:16:04 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 164C7608C3;
 Mon, 10 Jun 2024 11:16:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 695E9C2BBFC;
 Mon, 10 Jun 2024 11:16:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1718018163;
 bh=fKofkVqicJXO8g4gRRHdfGJS/c3KvZCVbqux20NP1Yo=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=iASAedckElu+/1+qSXxRlNmnxI5AhwNyZl3IfonQUz4kB5eXXIQZTWqI3yjPcFLIa
 OYGVIC/swCS3PJmRCxiyzNikYx5QceXQLgQZcWKg6oSHTXWJGyzQ7EAEylT0PqkYBd
 AMVoX+qmErl3K1WDYHIVtAyxPztkx/Kj30nJgi0IEzUxHnLlnf4i7kTBrd9VgLCfbq
 3QwBAQ3JKedoM8PTQgJx39piJqK40eNJLdVnYtrr/dQb3tS96dWdMxnRldVVDSypPE
 8bD/oKDv2y/Sb2OP4D/685oJTKH7NDrTwL+FTAa6zmIQUOhKR/wj7IpBmNhiJ1Hc/O
 Vq/CoYtiM8pHA==
Date: Mon, 10 Jun 2024 13:16:01 +0200
From: Maxime Ripard <mripard@kernel.org>
To: dri-devel@lists.freedesktop.org
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>,
 Jani Nikula <jani.nikula@linux.intel.com>
Subject: Re: [PATCH] drm/connector: hdmi: Fix kerneldoc warnings
Message-ID: <20240610-qualified-mahogany-swift-0e83dc@houat>
References: <20240610111200.428224-1-mripard@kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="5enaukeudt3suf5p"
Content-Disposition: inline
In-Reply-To: <20240610111200.428224-1-mripard@kernel.org>
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


--5enaukeudt3suf5p
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Mon, Jun 10, 2024 at 01:12:00PM GMT, Maxime Ripard wrote:
> It looks like the documentation for the HDMI-related fields recently
> added to both the drm_connector and drm_connector_state structures
> trigger some warnings because of their use of anonymous structures:
>=20
>   $ scripts/kernel-doc -none include/drm/drm_connector.h
>   include/drm/drm_connector.h:1138: warning: Excess struct member 'broadc=
ast_rgb' description in 'drm_connector_state'
>   include/drm/drm_connector.h:1138: warning: Excess struct member 'infofr=
ames' description in 'drm_connector_state'
>   include/drm/drm_connector.h:1138: warning: Excess struct member 'avi' d=
escription in 'drm_connector_state'
>   include/drm/drm_connector.h:1138: warning: Excess struct member 'hdr_dr=
m' description in 'drm_connector_state'
>   include/drm/drm_connector.h:1138: warning: Excess struct member 'spd' d=
escription in 'drm_connector_state'
>   include/drm/drm_connector.h:1138: warning: Excess struct member 'vendor=
' description in 'drm_connector_state'
>   include/drm/drm_connector.h:1138: warning: Excess struct member 'is_lim=
ited_range' description in 'drm_connector_state'
>   include/drm/drm_connector.h:1138: warning: Excess struct member 'output=
_bpc' description in 'drm_connector_state'
>   include/drm/drm_connector.h:1138: warning: Excess struct member 'output=
_format' description in 'drm_connector_state'
>   include/drm/drm_connector.h:1138: warning: Excess struct member 'tmds_c=
har_rate' description in 'drm_connector_state'
>   include/drm/drm_connector.h:2112: warning: Excess struct member 'vendor=
' description in 'drm_connector'
>   include/drm/drm_connector.h:2112: warning: Excess struct member 'produc=
t' description in 'drm_connector'
>   include/drm/drm_connector.h:2112: warning: Excess struct member 'suppor=
ted_formats' description in 'drm_connector'
>   include/drm/drm_connector.h:2112: warning: Excess struct member 'infofr=
ames' description in 'drm_connector'
>   include/drm/drm_connector.h:2112: warning: Excess struct member 'lock' =
description in 'drm_connector'
>   include/drm/drm_connector.h:2112: warning: Excess struct member 'audio'=
 description in 'drm_connector'
>=20
> Create some intermediate structures instead of anonymous ones to silence
> the warnings.
>=20
> Reported-by: Jani Nikula <jani.nikula@linux.intel.com>
> Suggested-by: Jani Nikula <jani.nikula@linux.intel.com>
> Fixes: 54cb39e2293b ("drm/connector: hdmi: Create an HDMI sub-state")
> Fixes: 948f01d5e559 ("drm/connector: hdmi: Add support for output format")
> Signed-off-by: Maxime Ripard <mripard@kernel.org>
> ---
>  include/drm/drm_connector.h | 207 +++++++++++++++++++-----------------
>  1 file changed, 109 insertions(+), 98 deletions(-)
>=20
> diff --git a/include/drm/drm_connector.h b/include/drm/drm_connector.h
> index e04a8a0d1bbd..1afee2939b71 100644
> --- a/include/drm/drm_connector.h
> +++ b/include/drm/drm_connector.h
> @@ -927,10 +927,72 @@ struct drm_connector_hdmi_infoframe {
>  	 * @set: Is the content of @data valid?
>  	 */
>  	bool set;
>  };
> =20
> +/*
> + * struct drm_connector_hdmi_state - HDMI state container
> + */
> +struct drm_connector_hdmi_state {
> +	/**
> +	 * @broadcast_rgb: Connector property to pass the
> +	 * Broadcast RGB selection value.
> +	 */
> +	enum drm_hdmi_broadcast_rgb broadcast_rgb;
> +
> +	/**
> +	 * @infoframes: HDMI Infoframes matching that state
> +	 */
> +	struct {
> +		/**
> +		 * @avi: AVI Infoframes structure matching our
> +		 * state.
> +		 */
> +		struct drm_connector_hdmi_infoframe avi;
> +
> +		/**
> +		 * @hdr_drm: DRM (Dynamic Range and Mastering)
> +		 * Infoframes structure matching our state.
> +		 */
> +		struct drm_connector_hdmi_infoframe hdr_drm;
> +
> +		/**
> +		 * @spd: SPD Infoframes structure matching our
> +		 * state.
> +		 */
> +		struct drm_connector_hdmi_infoframe spd;
> +
> +		/**
> +		 * @vendor: HDMI Vendor Infoframes structure
> +		 * matching our state.
> +		 */
> +		struct drm_connector_hdmi_infoframe hdmi;
> +	} infoframes;
> +
> +	/**
> +	 * @is_limited_range: Is the output supposed to use a limited
> +	 * RGB Quantization Range or not?
> +	 */
> +	bool is_limited_range;
> +
> +	/**
> +	 * @output_bpc: Bits per color channel to output.
> +	 */
> +	unsigned int output_bpc;
> +
> +	/**
> +	 * @output_format: Pixel format to output in.
> +	 */
> +	enum hdmi_colorspace output_format;
> +
> +	/**
> +	 * @tmds_char_rate: TMDS Character Rate, in Hz.
> +	 */
> +	unsigned long long tmds_char_rate;
> +
> +}

FTR, there's a missing ; here

Maxime

--5enaukeudt3suf5p
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCZmbgcAAKCRDj7w1vZxhR
xXEMAQCPu0KuKj0sOZcYEewSsV0sUFcyV/EGbeYnQSKcTS8WyQEA+35Uo4ZoNA/4
7QVfh5JyycF52v/2RFEUvtOQ+YXLJQQ=
=y34D
-----END PGP SIGNATURE-----

--5enaukeudt3suf5p--
