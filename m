Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BAAF7A20E1B
	for <lists+dri-devel@lfdr.de>; Tue, 28 Jan 2025 17:11:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 84A5510E697;
	Tue, 28 Jan 2025 16:11:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="RANdIDe3";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7EF7A10E697
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Jan 2025 16:11:20 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id D4EB05C5FEE;
 Tue, 28 Jan 2025 16:10:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 450ADC4CED3;
 Tue, 28 Jan 2025 16:11:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1738080679;
 bh=Dl3EbFp9MLEqhEcYKXKPVkXOzG4c/kjzwMdW6LWrDgY=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=RANdIDe3P2GGey3NgEDcGK2jItfw0PBMN4rLMzYcw2oSTvLQ1pkdEpze4/ycFl0wH
 G1JofnZMR7nCHlyWuvgiT4JcvMu1OSP97lwhi0QLbt53nihXR1Z4VlAFZ5zdP/QHI8
 0bJm1vskiEjhdL9KrwGfjWPPSRE5zmKGPOPeC+hJrI6Y5J6PI6EUs4cXEzaCHCOHIL
 ZsfYLaiGgfcAqEjsxS+S/+hJWJ5mpIONCZuuTxXzQfhUCwcyCLZfU6FE7g4htSUmRC
 tRToZUOSn3qt7ddDJvDSrS7yndLwZkTS5jFPDW/DolksCEtutTl2/FzRNttHGizwQ9
 ESrkyFm2grpMQ==
Date: Tue, 28 Jan 2025 17:11:16 +0100
From: Maxime Ripard <mripard@kernel.org>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>, 
 =?utf-8?B?TWHDrXJh?= Canal <mcanal@igalia.com>,
 Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>, 
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 09/10] drm/bridge: allow limiting I2S formats
Message-ID: <bd2eou4qqxwqn3bypvpvkcrw56m555jwlnlni277phds7vfklh@aacywioenkkq>
References: <20250126-drm-hdmi-connector-cec-v3-0-5b5b2d4956da@linaro.org>
 <20250126-drm-hdmi-connector-cec-v3-9-5b5b2d4956da@linaro.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha384;
 protocol="application/pgp-signature"; boundary="mhv6ggy3bi5tlxiz"
Content-Disposition: inline
In-Reply-To: <20250126-drm-hdmi-connector-cec-v3-9-5b5b2d4956da@linaro.org>
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


--mhv6ggy3bi5tlxiz
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v3 09/10] drm/bridge: allow limiting I2S formats
MIME-Version: 1.0

On Sun, Jan 26, 2025 at 03:29:14PM +0200, Dmitry Baryshkov wrote:
> diff --git a/include/drm/drm_bridge.h b/include/drm/drm_bridge.h
> index b55e80a57758e8b652eac0cd01cb245a04e221f5..d16af5fe90cb48f6671e798d9=
dee61a359c9233f 100644
> --- a/include/drm/drm_bridge.h
> +++ b/include/drm/drm_bridge.h
> @@ -920,6 +920,11 @@ struct drm_bridge {
>  	 */
>  	int hdmi_audio_max_i2s_playback_channels;
> =20
> +	/**
> +	 * @hdmi_audio_i2s_formats: supported I2S formats, optional
> +	 */
> +	u64 hdmi_audio_i2s_formats;
> +

We should document what the default value is if it's optional.

Once fixed:
Reviewed-by: Maxime Ripard <mripard@kernel.org>

Maxime

--mhv6ggy3bi5tlxiz
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJUEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCZ5kBpAAKCRAnX84Zoj2+
dqf1AX9RySXk4O1da3o9WNITKNVHrSH+dt6qaYjDBI6HJKFulux3PHDLqRAtG7Ig
UP2XruIBgPPiLow+svsD9tj6T6t1Pl475ik4K6WkxfHSSVAs5DpTH29elOMQqG73
8oA+fo/ZPQ==
=SMAr
-----END PGP SIGNATURE-----

--mhv6ggy3bi5tlxiz--
