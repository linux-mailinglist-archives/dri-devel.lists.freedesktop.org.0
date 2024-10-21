Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 60B0F9A68A6
	for <lists+dri-devel@lfdr.de>; Mon, 21 Oct 2024 14:38:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E610B10E4CD;
	Mon, 21 Oct 2024 12:38:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="VonpcpMg";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1C7CB10E4CD
 for <dri-devel@lists.freedesktop.org>; Mon, 21 Oct 2024 12:38:21 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 780585C38F4;
 Mon, 21 Oct 2024 12:38:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1895AC4CEE4;
 Mon, 21 Oct 2024 12:38:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1729514299;
 bh=2J+07wvQjZOgFJnkevC6f3EOi3G04Q/DuL8EMvWJL1s=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=VonpcpMgNhRcVhIrW/Yx7oUPWvjjtoRpomAzGY7xssSXrU1AMS/fG0d6xRgCoSk0s
 pSMGZSDmw2fpLFYf3NUYwqgLahSP9iY4mMJ5B3RvBAxOiM11+mVEy6uLNrNlPndVsF
 xXjDlZlTQuIATZdfdiPIdr/+cmsLOzmUPgdw94bhw1N0BGKXcpDXEGuaNeXV4GWYIp
 g8SoDJut/USi3Zi+Qk0MGUV0UoK31Nz+wW06batq5cAIkzH0QnQg4sVHGy7rEtjvPd
 WsEaqjGpSupDFJSQJtgWHNBYnzeHqGdpXZOGw76LSoEyZFN/JEoRLLprjKjZXn1D1h
 hRPjF9uEwfAjg==
Date: Mon, 21 Oct 2024 14:38:16 +0200
From: Maxime Ripard <mripard@kernel.org>
To: Liu Ying <victor.liu@nxp.com>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, imx@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, andrzej.hajda@intel.com,
 neil.armstrong@linaro.org, 
 rfoss@kernel.org, Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se, 
 jernej.skrabec@gmail.com, airlied@gmail.com, simona@ffwll.ch, 
 maarten.lankhorst@linux.intel.com, tzimmermann@suse.de, robh@kernel.org,
 krzk+dt@kernel.org, 
 conor+dt@kernel.org, quic_jesszhan@quicinc.com, mchehab@kernel.org, 
 shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de, 
 festevam@gmail.com, catalin.marinas@arm.com, will@kernel.org, 
 sakari.ailus@linux.intel.com, hverkuil@xs4all.nl,
 tomi.valkeinen@ideasonboard.com, 
 quic_bjorande@quicinc.com, geert+renesas@glider.be, dmitry.baryshkov@linaro.org,
 arnd@arndb.de, nfraprado@collabora.com, thierry.reding@gmail.com, 
 prabhakar.mahadev-lad.rj@bp.renesas.com, sam@ravnborg.org, marex@denx.de,
 biju.das.jz@bp.renesas.com
Subject: Re: [PATCH v3 12/15] drm/bridge: Add ITE IT6263 LVDS to HDMI converter
Message-ID: <20241021-thick-cockle-of-popularity-c5e28c@houat>
References: <20241021064446.263619-1-victor.liu@nxp.com>
 <20241021064446.263619-13-victor.liu@nxp.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha384;
 protocol="application/pgp-signature"; boundary="kmrz3bsduvk5ir7q"
Content-Disposition: inline
In-Reply-To: <20241021064446.263619-13-victor.liu@nxp.com>
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


--kmrz3bsduvk5ir7q
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Subject: Re: [PATCH v3 12/15] drm/bridge: Add ITE IT6263 LVDS to HDMI
 converter
MIME-Version: 1.0

On Mon, Oct 21, 2024 at 02:44:43PM +0800, Liu Ying wrote:
> +static int it6263_bridge_atomic_check(struct drm_bridge *bridge,
> +				      struct drm_bridge_state *bridge_state,
> +				      struct drm_crtc_state *crtc_state,
> +				      struct drm_connector_state *conn_state)
> +{
> +	struct drm_display_mode *mode = &crtc_state->adjusted_mode;
> +	int ret;
> +
> +	ret = drm_atomic_helper_connector_hdmi_check(conn_state->connector,
> +						     conn_state->state);
> +	if (ret)
> +		return ret;
> +
> +	return mode->clock > MAX_PIXEL_CLOCK_KHZ ? -EINVAL : 0;

drm_atomic_helper_connector_hdmi_check will already make that check, so
it's redundant.

Once fixed
Acked-by: Maxime Ripard <mripard@kernel.org>

Maxime

--kmrz3bsduvk5ir7q
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJUEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCZxZLLwAKCRAnX84Zoj2+
dtH1AYDoumgWufeRw1BkoGW9C53DdxLpldr4/TQiGq7uSIf8bhYZzvs8c3r3m56h
+Kq5KswBfiUhEIWcIVbwOObPeX6/Pg7dtPWXJxzBOlLR3QjbpksXkTsjQ2FUPqoW
4HbKb64I9A==
=sEdL
-----END PGP SIGNATURE-----

--kmrz3bsduvk5ir7q--
