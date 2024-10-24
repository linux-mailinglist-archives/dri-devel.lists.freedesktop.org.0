Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 762969AEA17
	for <lists+dri-devel@lfdr.de>; Thu, 24 Oct 2024 17:14:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C52C710E967;
	Thu, 24 Oct 2024 15:14:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="UBBqpvgn";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 77A8510E969
 for <dri-devel@lists.freedesktop.org>; Thu, 24 Oct 2024 15:14:38 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 4373E5C3F5B;
 Thu, 24 Oct 2024 15:14:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 10AEFC4CEC7;
 Thu, 24 Oct 2024 15:14:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1729782877;
 bh=N0wI9OFBged5/7iffZvOk9Mo2r1WR2+eTGn77TckzCQ=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=UBBqpvgnq0/Gyxky+R05Qzs+OeZB6Z7fCii1KfwDU/Qbe8k7nIxnmR4nLOlK+oreC
 zeDepQiNOWnNz+uegudFwedT27+SprAE9xf4OexxUgYv8Il8Ls+0qsgm5W7aPlazvq
 XhTvCSFH2C9Dr8PVZkdu0K8LoZp6sJat6LKcDhxebk6JlQXK/78FcrvZSHRd6kVpdC
 1wo7po8j75ovC+hPE0BxcNth2mcSAoRhAFEK4UU6kX6N85YE74GVAojAvEAyC65QPe
 Cn5NRU78vVPdjfygVc6/MlyWdo4BkFciWJWEsNJFZpGzzIrw5Pm6j9sUtwMR2LO5gl
 OFTNdxDiP23vQ==
Date: Thu, 24 Oct 2024 17:14:35 +0200
From: Maxime Ripard <mripard@kernel.org>
To: Dave Stevenson <dave.stevenson@raspberrypi.com>
Cc: =?utf-8?B?TWHDrXJh?= Canal <mcanal@igalia.com>, 
 Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
 Florian Fainelli <florian.fainelli@broadcom.com>, 
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
 Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>,
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Javier Martinez Canillas <javierm@redhat.com>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 linux-rpi-kernel@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org
Subject: Re: [PATCH 01/37] drm/vc4: Limit max_bpc to 8 on Pi0-3
Message-ID: <20241024-elastic-courageous-wolf-9b9692@houat>
References: <20241023-drm-vc4-2712-support-v1-0-1cc2d5594907@raspberrypi.com>
 <20241023-drm-vc4-2712-support-v1-1-1cc2d5594907@raspberrypi.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha384;
 protocol="application/pgp-signature"; boundary="ilqx6g56qdz6ge6u"
Content-Disposition: inline
In-Reply-To: <20241023-drm-vc4-2712-support-v1-1-1cc2d5594907@raspberrypi.com>
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


--ilqx6g56qdz6ge6u
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH 01/37] drm/vc4: Limit max_bpc to 8 on Pi0-3
MIME-Version: 1.0

On Wed, Oct 23, 2024 at 05:49:58PM +0100, Dave Stevenson wrote:
> Pi 0-3 have no deep colour support and only 24bpp output,
> so max_bpc should remain as 8, and no HDR metadata property
> should be registered.
>=20
> Fixes: ba8c0faebbb0 ("drm/vc4: hdmi: Enable 10/12 bpc output")
> Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
> ---
>  drivers/gpu/drm/vc4/vc4_hdmi.c | 5 +++++
>  1 file changed, 5 insertions(+)
>=20
> diff --git a/drivers/gpu/drm/vc4/vc4_hdmi.c b/drivers/gpu/drm/vc4/vc4_hdm=
i.c
> index 62b82b1eeb36..6ebcc38be291 100644
> --- a/drivers/gpu/drm/vc4/vc4_hdmi.c
> +++ b/drivers/gpu/drm/vc4/vc4_hdmi.c
> @@ -640,6 +640,11 @@ static int vc4_hdmi_connector_init(struct drm_device=
 *dev,
>  	if (ret)
>  		return ret;
> =20
> +	if (vc4_hdmi->variant->supports_hdr)
> +		drm_connector_attach_max_bpc_property(connector, 8, 12);
> +	else
> +		drm_connector_attach_max_bpc_property(connector, 8, 8);
> +

Are you sure that one is needed?

https://elixir.bootlin.com/linux/v6.11.5/source/drivers/gpu/drm/vc4/vc4_hdm=
i.c#L594
should take care about all that already.

Maxime

--ilqx6g56qdz6ge6u
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJUEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCZxpkVgAKCRAnX84Zoj2+
dpYuAX4gdROrmsHWAAzitdr3V3i9R9MKM1Yf94Dzb9HOdZshoaT6nkdTbK04N2GS
BRjpxg8Bf2T4PNnDmxK/oGIdaqzLKcFGfcrvNfmHtgm1+2GHasLnWOExN5va/678
E03+pOebBQ==
=KqRv
-----END PGP SIGNATURE-----

--ilqx6g56qdz6ge6u--
