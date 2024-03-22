Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A004886990
	for <lists+dri-devel@lfdr.de>; Fri, 22 Mar 2024 10:44:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AFC2610E4D7;
	Fri, 22 Mar 2024 09:44:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="fFOMEHjq";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4558810E4D7
 for <dri-devel@lists.freedesktop.org>; Fri, 22 Mar 2024 09:44:48 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 8B4F261403;
 Fri, 22 Mar 2024 09:44:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B5231C433C7;
 Fri, 22 Mar 2024 09:44:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1711100683;
 bh=OZqpPoXf8aJkADsczKIGarXC5e1A9XxkW7dY7qOHVMA=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=fFOMEHjq54SRHxeKXjaSwOAZiHZy1xazKROl3fzTVMwCy37ptelwATh3bQJhVFt8S
 VXHm6L3eP+NlzF3AVZ4SN2F+UbUQ9PRtVf30kIi0TVuzTai9QCAZWrTDk9x+tP6Kt/
 DDvt6u3Vo2Wk9aDWCvbekfveX+io31HME0FBWdjDRJxKghyestGVFmDuIl2pkysgzQ
 5wst5bO6ogoyvM+RYK6KBUzw+RRXFryVHUtKgJ2JrssN3wc7rDAW2EJBP1uZaazgD0
 itLs5cjY9aeGCqjOLxraqgGThcR9cPhiCPV2RxNukKfqv3wAClgERfFsKHBwKW77cv
 AZiI3rJrTq/lg==
Date: Fri, 22 Mar 2024 10:44:40 +0100
From: Maxime Ripard <mripard@kernel.org>
To: Anatoliy Klymenko <anatoliy.klymenko@amd.com>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Michal Simek <michal.simek@amd.com>, Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Jonas Karlman <jonas@kwiboo.se>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, 
 dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 linux-media@vger.kernel.org
Subject: Re: [PATCH v3 7/9] drm/atomic-helper: Add select_output_bus_format
 callback
Message-ID: <20240322-passionate-lyrebird-of-trust-819718@houat>
References: <20240321-dp-live-fmt-v3-0-d5090d796b7e@amd.com>
 <20240321-dp-live-fmt-v3-7-d5090d796b7e@amd.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="ycce5r5gilwxfcpp"
Content-Disposition: inline
In-Reply-To: <20240321-dp-live-fmt-v3-7-d5090d796b7e@amd.com>
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


--ycce5r5gilwxfcpp
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Mar 21, 2024 at 01:43:45PM -0700, Anatoliy Klymenko wrote:
> diff --git a/drivers/gpu/drm/drm_crtc_helper.c b/drivers/gpu/drm/drm_crtc_helper.c
> index 2dafc39a27cb..f2e12a3c4e5f 100644
> --- a/drivers/gpu/drm/drm_crtc_helper.c
> +++ b/drivers/gpu/drm/drm_crtc_helper.c
> @@ -1055,3 +1055,39 @@ int drm_helper_force_disable_all(struct drm_device *dev)
>  	return ret;
>  }
>  EXPORT_SYMBOL(drm_helper_force_disable_all);
> +
> +/**
> + * drm_helper_crtc_select_output_bus_format - Select output media bus format
> + * @crtc: The CRTC to query
> + * @crtc_state: The new CRTC state
> + * @supported_fmts: List of media bus format options to pick from
> + * @num_supported_fmts: Number of media bus formats in @supported_fmts list
> + *
> + * Encoder drivers may call this helper to give the connected CRTC a chance to
> + * select compatible or preffered media bus format to use over the CRTC encoder
> + * link. Encoders should provide list of supported input MEDIA_BUS_FMT_* for
> + * CRTC to pick from. CRTC driver is expected to select preferred media bus
> + * format from the list and, once enabled, generate the signal accordingly.
> + *
> + * Returns:
> + * Selected preferred media bus format or 0 if CRTC does not support any from
> + * @supported_fmts list.
> + */
> +u32 drm_helper_crtc_select_output_bus_format(struct drm_crtc *crtc,
> +					     struct drm_crtc_state *crtc_state,
> +					     const u32 *supported_fmts,
> +					     unsigned int num_supported_fmts)
> +{
> +	if (!crtc || !supported_fmts || !num_supported_fmts)
> +		return 0;
> +
> +	if (!crtc->helper_private ||
> +	    !crtc->helper_private->select_output_bus_format)
> +		return supported_fmts[0];
> +
> +	return crtc->helper_private->select_output_bus_format(crtc,
> +							crtc_state,
> +							supported_fmts,
> +							num_supported_fmts);
> +}

Again, the output of that selection must be found in the CRTC state,
otherwise CRTCs have no way to know which have been selected.

Maxime

--ycce5r5gilwxfcpp
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCZf1TBwAKCRDj7w1vZxhR
xZGhAPsFZUpxcGfjLfAI6mcBYPDnCRhbOkvpKYaxj2+CXYWFeQD/W04VlpRLf4Fw
17ZdokR9h0XPytwkCVdQft75epzqgQY=
=VFYJ
-----END PGP SIGNATURE-----

--ycce5r5gilwxfcpp--
