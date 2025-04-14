Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 56DDFA88596
	for <lists+dri-devel@lfdr.de>; Mon, 14 Apr 2025 16:47:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8EED710E5FE;
	Mon, 14 Apr 2025 14:47:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="HmfJW8uS";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AB8CD10E60D
 for <dri-devel@lists.freedesktop.org>; Mon, 14 Apr 2025 14:47:24 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 927CF5C475F;
 Mon, 14 Apr 2025 14:45:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C6F25C4CEE2;
 Mon, 14 Apr 2025 14:47:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1744642040;
 bh=h9uPxkbu37JMl9K8mq07mcmONRcYkFkLq//paRKhktE=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=HmfJW8uSoQQz4BSrQG43jo8P7iD2mv7jRAtmfZm/OSsbqbCwEltK7CMOdqMWTC42r
 AZR+QUG4owaz0bvILc2U6Znpyu4FbIrxtiDmB18Pr5GePh91Reja47WLefjZkDIa2p
 dB8cUtN8sZjwTYsE/a2L8f65UMn2GAFgVwGl/WswCaOEPJ7xhA14fQ/eCTkLrPHE9b
 aS9r7Skx9E0eL7b1o22vnvlJt/hn+VBphHK2vkCArE60vBUTDuzQF/niL05qJ77bUy
 vae0H5OeOjHYwwzspU3zQIpEuhlevEUKsnYw1D7LT0VQtpOJXFtmGD9hz99JjB53hF
 S4yCj/HFNIFhA==
Date: Mon, 14 Apr 2025 16:47:17 +0200
From: Maxime Ripard <mripard@kernel.org>
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
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
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Dmitry Baryshkov <lumag@kernel.org>
Subject: Re: [PATCH v5 04/11] drm/connector: unregister CEC data
Message-ID: <20250414-hissing-auspicious-goldfish-78b9dc@houat>
References: <20250407-drm-hdmi-connector-cec-v5-0-04809b10d206@oss.qualcomm.com>
 <20250407-drm-hdmi-connector-cec-v5-4-04809b10d206@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="za6i6cutm7oj65z7"
Content-Disposition: inline
In-Reply-To: <20250407-drm-hdmi-connector-cec-v5-4-04809b10d206@oss.qualcomm.com>
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


--za6i6cutm7oj65z7
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v5 04/11] drm/connector: unregister CEC data
MIME-Version: 1.0

Hi,

On Mon, Apr 07, 2025 at 06:11:01PM +0300, Dmitry Baryshkov wrote:
> In order to make sure that CEC adapters or notifiers are unregistered
> and CEC-related data is properly destroyed make drm_connector_cleanup()
> call CEC's unregister() callback.
>=20
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---
>  drivers/gpu/drm/drm_connector.c | 9 +++++++++
>  1 file changed, 9 insertions(+)
>=20
> diff --git a/drivers/gpu/drm/drm_connector.c b/drivers/gpu/drm/drm_connec=
tor.c
> index ba08fbd973829e49ea977251c4f0fb6d96ade631..ae9c02ef9ab102db03c282468=
3ece37cfbcd3300 100644
> --- a/drivers/gpu/drm/drm_connector.c
> +++ b/drivers/gpu/drm/drm_connector.c
> @@ -743,6 +743,13 @@ void drm_connector_cec_phys_addr_set(struct drm_conn=
ector *connector)
>  }
>  EXPORT_SYMBOL(drm_connector_cec_phys_addr_set);
> =20
> +static void drm_connector_cec_unregister(struct drm_connector *connector)
> +{
> +	if (connector->cec.funcs &&
> +	    connector->cec.funcs->unregister)
> +		connector->cec.funcs->unregister(connector);
> +}
> +
>  /**
>   * drm_connector_cleanup - cleans up an initialised connector
>   * @connector: connector to cleanup
> @@ -763,6 +770,8 @@ void drm_connector_cleanup(struct drm_connector *conn=
ector)
> =20
>  	platform_device_unregister(connector->hdmi_audio.codec_pdev);
> =20
> +	drm_connector_cec_unregister(connector);
> +

Actually, since we know that the HDMI connector is drm-managed, why
can't we make the call to connector->cec.funcs->unregister a drm-managed
action registered by drm_connector_hdmi_cec_register?

Maxime

--za6i6cutm7oj65z7
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCZ/0f9AAKCRDj7w1vZxhR
xWeFAP9tC/rL1qz6F44OceHXYWDpiv2S2ByDvX23IObFZZIhpwD/UOyfKXhq8Wbq
8hT9g6wj33SL7RUyMDFRtQeZMspHTgY=
=Ha6M
-----END PGP SIGNATURE-----

--za6i6cutm7oj65z7--
