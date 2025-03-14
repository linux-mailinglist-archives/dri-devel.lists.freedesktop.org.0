Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B04F8A612B6
	for <lists+dri-devel@lfdr.de>; Fri, 14 Mar 2025 14:33:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0503C10E248;
	Fri, 14 Mar 2025 13:33:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="Zei2+2Hk";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 080C210E248
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Mar 2025 13:33:28 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 580BA5C432F;
 Fri, 14 Mar 2025 13:31:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 765A7C4CEE3;
 Fri, 14 Mar 2025 13:33:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1741959206;
 bh=TzrBpVAw1VKmzu6pv4k2GQwnqZGwYmMwuCHdplxJPRg=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Zei2+2HkjzhJfKHOvYnA2fw+OxujJh5gNitHtGm+0MrdkaAOOahSbW/7Pqis4HHzb
 QIGrFoM7srznMagkmdTQqQovTysDqeMvExzYTWK5LVo9uDToJ1k0TPuzSFaAeBc1Ju
 k4NnZqLu6Lhhycz3MBkT5YEg/FUE7swHrTnpuZqFRCy0WI7FTRmTwBHSOGtFpm+5xY
 BkR/IsFA0bOuct+2igAEJ8QCvN2DPkTxXI1pnyKqp3D6+V5LQeul9pFb8HimBlFOWX
 Etz1Zo0Cz9M2863Ow7e4/KQoUYC0rok5TzeOtrqEN7bwu7A5l2mF82f0eRoGc7m3jf
 shKyWwE6yTdDw==
Date: Fri, 14 Mar 2025 14:33:24 +0100
From: Maxime Ripard <mripard@kernel.org>
To: David Turner <david.turner@raspberrypi.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>, 
 =?utf-8?B?TWHDrXJh?= Canal <mcanal@igalia.com>,
 Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Stefan Wahren <wahrenst@gmx.net>
Subject: Re: [PATCH v3 1/2] drm/vc4: hdmi: Call HDMI hotplug helper on
 disconnect
Message-ID: <20250314-armored-tourmaline-lizard-cee8d8@houat>
References: <20250312-vc4_hotplug-v3-0-d75878677de8@raspberrypi.com>
 <20250312-vc4_hotplug-v3-1-d75878677de8@raspberrypi.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha384;
 protocol="application/pgp-signature"; boundary="a2t6chbdpyrhcav3"
Content-Disposition: inline
In-Reply-To: <20250312-vc4_hotplug-v3-1-d75878677de8@raspberrypi.com>
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


--a2t6chbdpyrhcav3
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v3 1/2] drm/vc4: hdmi: Call HDMI hotplug helper on
 disconnect
MIME-Version: 1.0

Hi,

On Wed, Mar 12, 2025 at 03:40:55PM +0000, David Turner wrote:
> From: Stefan Wahren <wahrenst@gmx.net>
>=20
> drm_atomic_helper_connector_hdmi_hotplug() must be called
> regardless of the connection status, otherwise the HDMI audio
> disconnect event won't be notified.  Also update the comment on
> drm_atomic_helper_connector_hdmi_hotplug() to explain that this is
> necessary.
>=20
> Fixes: 2ea9ec5d2c20 ("drm/vc4: hdmi: use drm_atomic_helper_connector_hdmi=
_hotplug()")
> Suggested-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> Signed-off-by: Stefan Wahren <wahrenst@gmx.net>
> Signed-off-by: David Turner <david.turner@raspberrypi.com>
> ---
>  drivers/gpu/drm/display/drm_hdmi_state_helper.c | 3 ++-
>  drivers/gpu/drm/vc4/vc4_hdmi.c                  | 4 ++--
>  2 files changed, 4 insertions(+), 3 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/display/drm_hdmi_state_helper.c b/drivers/gp=
u/drm/display/drm_hdmi_state_helper.c
> index c205f37da1e12b11c384670db83e43613e031340..d26d51902ba1a73175b23eec7=
1562a30ceda1082 100644
> --- a/drivers/gpu/drm/display/drm_hdmi_state_helper.c
> +++ b/drivers/gpu/drm/display/drm_hdmi_state_helper.c
> @@ -816,7 +816,8 @@ drm_atomic_helper_connector_hdmi_update(struct drm_co=
nnector *connector,
>   * @status: Connection status
>   *
>   * This function should be called as a part of the .detect() / .detect_c=
tx()
> - * callbacks, updating the HDMI-specific connector's data.
> + * callbacks, updating the HDMI-specific connector's data. It also needs=
 to be
> + * called for disconnects to notify audio users of the unplug.

This part should be in a separate patch.

I also think that it's wrong, it's not just about audio. It just needs
to be called as part of detect no matter what the status is. Audio is
one thing that it will possibly handle depending on the driver, but
EDIDs, CEC, etc. might also be dealt with. So I don't think it's right
to focus on audio there.

>   */
>  void drm_atomic_helper_connector_hdmi_hotplug(struct drm_connector *conn=
ector,
>  					      enum drm_connector_status status)
> diff --git a/drivers/gpu/drm/vc4/vc4_hdmi.c b/drivers/gpu/drm/vc4/vc4_hdm=
i.c
> index 37238a12baa58a06a5d6f40d1ab64abc7fac60d7..37a7d45695f236d3ab281d9a8=
676921fd434955c 100644
> --- a/drivers/gpu/drm/vc4/vc4_hdmi.c
> +++ b/drivers/gpu/drm/vc4/vc4_hdmi.c
> @@ -372,13 +372,13 @@ static void vc4_hdmi_handle_hotplug(struct vc4_hdmi=
 *vc4_hdmi,
>  	 * the lock for now.
>  	 */
> =20
> +	drm_atomic_helper_connector_hdmi_hotplug(connector, status);
> +
>  	if (status =3D=3D connector_status_disconnected) {
>  		cec_phys_addr_invalidate(vc4_hdmi->cec_adap);
>  		return;
>  	}
> =20
> -	drm_atomic_helper_connector_hdmi_hotplug(connector, status);
> -
>  	cec_s_phys_addr(vc4_hdmi->cec_adap,
>  			connector->display_info.source_physical_address, false);

For the vc4 part alone,
Reviewed-by: Maxime Ripard <mripard@kernel.org>

Maxime

--a2t6chbdpyrhcav3
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJUEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCZ9QwHwAKCRAnX84Zoj2+
do41AYC/hI5pihXWzgNG9op+aQwZGwcSGkjc3NyrrM7LaQWlcUNAMDXrbVY2Q991
k5V6i/kBewVp8EZoiEOfrBVU4jnYfbJOeFZLQfU9a27Z+mDSwOZ9BPxw5LpcFqE2
FF29cVnHWQ==
=QR0g
-----END PGP SIGNATURE-----

--a2t6chbdpyrhcav3--
