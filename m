Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A8C57A042AD
	for <lists+dri-devel@lfdr.de>; Tue,  7 Jan 2025 15:36:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B92AB10E709;
	Tue,  7 Jan 2025 14:36:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="kclJhn6P";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CCBCD10E70E
 for <dri-devel@lists.freedesktop.org>; Tue,  7 Jan 2025 14:36:24 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 306A55C5CDD;
 Tue,  7 Jan 2025 14:35:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7C5DCC4CED6;
 Tue,  7 Jan 2025 14:36:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1736260584;
 bh=HfbVqJKTKgN1/Qpw9GM+tOCW/HTXwBp81ojc7ahZNa4=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=kclJhn6P1fDYIzYqiPEATDBcxgwwAIokG+sKk7VzKvZycqutOVDLwN7l4jMEj9uGZ
 VyCJsjIU92bfSr946zTm8eeQv+G3tJl50oMYIaC+nnTO5sUlNIkAttNx8mdssYgkkA
 iTL0H6GlMULyQ/tWFxsQsL4by58ie+rWEb98LdufpTwfUWR9URVUyT7OAsGmXxaK68
 GLQozz4KXL8/ACcVqZHoJx/yQ9WGDCAT8B3VyRqeSfAJs6UU7nLt81pDwM8WDqCImm
 cP+LkstiGB7XexZqQeinuYCWfh/NdYnLhjhMFQWAwsS5HfYorUlTk+OsOOJ/5khTmY
 GEvjncDpirgDg==
Date: Tue, 7 Jan 2025 15:36:20 +0100
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
Subject: Re: [PATCH RFC/RFT 5/9] drm/vc4: hdmi: drop separate CEC
 unregistration
Message-ID: <20250107-outstanding-tangerine-jackdaw-1e2438@houat>
References: <20241225-drm-hdmi-connector-cec-v1-0-b80380c67221@linaro.org>
 <20241225-drm-hdmi-connector-cec-v1-5-b80380c67221@linaro.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha384;
 protocol="application/pgp-signature"; boundary="udnybnaehqtxciqq"
Content-Disposition: inline
In-Reply-To: <20241225-drm-hdmi-connector-cec-v1-5-b80380c67221@linaro.org>
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


--udnybnaehqtxciqq
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH RFC/RFT 5/9] drm/vc4: hdmi: drop separate CEC
 unregistration
MIME-Version: 1.0

On Wed, Dec 25, 2024 at 01:10:13AM +0200, Dmitry Baryshkov wrote:
> CEC adapter functions are protected by drm_dev_enter() / _exit(), so it
> is safe to keep CEC registered until DRM device is being torn down. Drop
> custom CEC unsregistration code and rely on the DRM core to unregister
> CEC adapter.
>=20
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>  drivers/gpu/drm/vc4/vc4_hdmi.c | 53 ++++++------------------------------=
------
>  1 file changed, 7 insertions(+), 46 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/vc4/vc4_hdmi.c b/drivers/gpu/drm/vc4/vc4_hdm=
i.c
> index 3086c2ad3bb2e8fafdc1f37ba985aa5785d49f9a..7b39000369e50f5368384575a=
a81919df5a7133c 100644
> --- a/drivers/gpu/drm/vc4/vc4_hdmi.c
> +++ b/drivers/gpu/drm/vc4/vc4_hdmi.c
> @@ -2752,13 +2752,6 @@ static const struct cec_adap_ops vc4_hdmi_cec_adap=
_ops =3D {
>  	.adap_transmit =3D vc4_hdmi_cec_adap_transmit,
>  };
> =20
> -static void vc4_hdmi_cec_release(void *ptr)
> -{
> -	struct drm_connector *connector =3D ptr;
> -
> -	drm_connector_cec_unregister(connector);
> -}
> -
>  static int vc4_hdmi_cec_init(struct drm_connector *connector)
>  {
>  	struct vc4_hdmi *vc4_hdmi =3D connector_to_vc4_hdmi(connector);
> @@ -2796,51 +2789,19 @@ static int vc4_hdmi_cec_register(struct vc4_hdmi =
*vc4_hdmi)
>  {
>  	struct platform_device *pdev =3D vc4_hdmi->pdev;
>  	struct device *dev =3D &pdev->dev;
> -	int ret;
> =20
>  	if (!of_property_present(dev->of_node, "interrupts")) {
>  		dev_warn(dev, "'interrupts' DT property is missing, no CEC\n");
>  		return 0;
>  	}
> =20
> -	ret =3D drm_connector_hdmi_cec_adapter_register(&vc4_hdmi->connector,
> -						      &vc4_hdmi_cec_adap_ops,
> -						      vc4_hdmi->variant->card_name,
> -						      1,
> -						      vc4_hdmi_cec_init,
> -						      NULL,
> -						      &pdev->dev);
> -	if (ret < 0)
> -		return ret;
> -
> -	/*
> -	 * NOTE: Strictly speaking, we should probably use a DRM-managed
> -	 * registration there to avoid removing the CEC adapter by the
> -	 * time the DRM driver doesn't have any user anymore.
> -	 *
> -	 * However, the CEC framework already cleans up the CEC adapter
> -	 * only when the last user has closed its file descriptor, so we
> -	 * don't need to handle it in DRM.
> -	 *
> -	 * By the time the device-managed hook is executed, we will give
> -	 * up our reference to the CEC adapter and therefore don't
> -	 * really care when it's actually freed.
> -	 *
> -	 * There's still a problematic sequence: if we unregister our
> -	 * CEC adapter, but the userspace keeps a handle on the CEC
> -	 * adapter but not the DRM device for some reason. In such a
> -	 * case, our vc4_hdmi structure will be freed, but the
> -	 * cec_adapter structure will have a dangling pointer to what
> -	 * used to be our HDMI controller. If we get a CEC call at that
> -	 * moment, we could end up with a use-after-free. Fortunately,
> -	 * the CEC framework already handles this too, by calling
> -	 * cec_is_registered() in cec_ioctl() and cec_poll().
> -	 */

I'd really like to keep that comment, somewhere.

Maxime

--udnybnaehqtxciqq
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJUEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCZ3075AAKCRAnX84Zoj2+
dsKfAYDr4aYjyjBzDc8lwY0Gs0nvOcOaPAh+ctBgypcQXzW2vlIZD61otpp55S66
Y5eRptkBgJ5/jIDgCwe42l6bqTuPfMpPHkyGsNRfBO4V83ImSdZ2nNLalzxpiKEo
Kn2M/hrvhg==
=Mcki
-----END PGP SIGNATURE-----

--udnybnaehqtxciqq--
