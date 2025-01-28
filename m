Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 49BFDA20E2F
	for <lists+dri-devel@lfdr.de>; Tue, 28 Jan 2025 17:15:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A586810E6A1;
	Tue, 28 Jan 2025 16:15:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="HkHq0lxL";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 636B810E6A1
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Jan 2025 16:15:00 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id BA2785C607F;
 Tue, 28 Jan 2025 16:14:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EBB0AC4CEE3;
 Tue, 28 Jan 2025 16:14:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1738080899;
 bh=+RYCuJBTfGX4QA28PDt0r07txLkGzA2mZuZY/PZkZFE=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=HkHq0lxL1L7ttRkpLFqb/xXW6PMIJvtvAXnzrna2PgH0vvnBqZWGq3PfEY80CdoCf
 x3pv5NIZIUONFlsUstC4ZMvweonfA9IwmN9HOtGAHIApOWxu9Q5jAssJC/gwSkTzr6
 hmh42ejhEqtBzTBFaugBIP3lsxJGnQT20LyHf3zJO/h3hE0Ge8cJxJCFVfkgkjquf6
 ApCk1FqAM8pqy145xE/WXCpHgjWBVDpD6CwfauPWkZKSib07Z6/EJyqIENmFyLwNyr
 DA6z2nmpsGsv9H2LDI8MPQEBbV/SoOJlPSUVqiGhgwBH4ymErv5ItMomVSE4vsY34J
 PKqgeRY5JzlXQ==
Date: Tue, 28 Jan 2025 17:14:56 +0100
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
Subject: Re: [PATCH v3 05/10] drm/display: bridge-connector: hook in CEC
 notifier support
Message-ID: <jesawkrivnr2seor37i324zxzntt7zqvlwfdg37shfykl2e3q2@strwurvshn22>
References: <20250126-drm-hdmi-connector-cec-v3-0-5b5b2d4956da@linaro.org>
 <20250126-drm-hdmi-connector-cec-v3-5-5b5b2d4956da@linaro.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha384;
 protocol="application/pgp-signature"; boundary="buhslvzjxvjetd22"
Content-Disposition: inline
In-Reply-To: <20250126-drm-hdmi-connector-cec-v3-5-5b5b2d4956da@linaro.org>
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


--buhslvzjxvjetd22
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v3 05/10] drm/display: bridge-connector: hook in CEC
 notifier support
MIME-Version: 1.0

On Sun, Jan 26, 2025 at 03:29:10PM +0200, Dmitry Baryshkov wrote:
> Allow HDMI DRM bridges to create CEC notifier. Physical address is
> handled automatically by drm_atomic_helper_connector_hdmi_hotplug()
> being called from .detect() path.
>=20
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>  drivers/gpu/drm/bridge/lontium-lt9611.c        |  2 +-
>  drivers/gpu/drm/display/Kconfig                |  1 +
>  drivers/gpu/drm/display/drm_bridge_connector.c | 11 ++++++++++-
>  include/drm/drm_bridge.h                       |  9 +++++++--
>  4 files changed, 19 insertions(+), 4 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/bridge/lontium-lt9611.c b/drivers/gpu/drm/br=
idge/lontium-lt9611.c
> index 0df2c68e45897f2f2eed10a56dd670582526180b..158a4966ac00657074b11e93d=
c9bcab41c16db18 100644
> --- a/drivers/gpu/drm/bridge/lontium-lt9611.c
> +++ b/drivers/gpu/drm/bridge/lontium-lt9611.c
> @@ -1252,7 +1252,7 @@ static int lt9611_probe(struct i2c_client *client)
>  	lt9611->bridge.type =3D DRM_MODE_CONNECTOR_HDMIA;
>  	lt9611->bridge.vendor =3D "Lontium";
>  	lt9611->bridge.product =3D "LT9611";
> -	lt9611->bridge.hdmi_audio_dev =3D dev;
> +	lt9611->bridge.hdmi_dev =3D dev;
>  	lt9611->bridge.hdmi_audio_max_i2s_playback_channels =3D 8;
>  	lt9611->bridge.hdmi_audio_dai_port =3D 2;

This looks unrleated?

Maxime

--buhslvzjxvjetd22
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJUEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCZ5kCfwAKCRAnX84Zoj2+
dl/zAX9eSr2bpe8RHnqR1tMzm4UzuwOQbtu2RPy3zzlz+15qe+5/urNdT6lQjcWb
god2eOIBgKRPYUAcMsWeRxw6DkznecCUGNUC6dF2bdiU8H8pTkHhyMI69COVBxFS
JR9coc70Iw==
=Ao2v
-----END PGP SIGNATURE-----

--buhslvzjxvjetd22--
