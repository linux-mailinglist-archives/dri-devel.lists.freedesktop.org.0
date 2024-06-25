Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1EDA0916B8B
	for <lists+dri-devel@lfdr.de>; Tue, 25 Jun 2024 17:02:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0059D10E6AB;
	Tue, 25 Jun 2024 15:02:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="hNubxXsR";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9CB8810E6A6;
 Tue, 25 Jun 2024 15:02:08 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 5DA4DCE1B7F;
 Tue, 25 Jun 2024 15:02:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 02B1EC32782;
 Tue, 25 Jun 2024 15:02:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1719327725;
 bh=INcxNrZ3BKjPhQAlptK0WjFeAG+V7+PP8PzXSvOmrp4=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=hNubxXsR8135P9Ti0UdT/F7+tHikXwxB3dgj8F7oClalIBZxZyLnO11IlQ1PwQNOR
 Z0eV03pVqnEhU14faRurBffY8m9Kqcmhn6JOc5A+d8n8BNVWDEgu4iEtciTh82YOxZ
 X1xVIuqr//E4wTzFGd2LMBmTzp0UEs/bduOaSEt/CdYCvu324Qiq+gr6/HsshRvSHy
 wpJsfK4zNHHMXVPR9i5qTgJQ8911iRmmYbfT1vHzwYbJvYhvEjUHt9QU2RmtYou8MS
 8LsrtOK70CTxUaVoI3Z9PmHQcv9wKWB9tbP/QfoZPDtzNRaVm5kFUpxKoKKnQylYe9
 WCHbD46uaz83g==
Date: Tue, 25 Jun 2024 17:02:02 +0200
From: Maxime Ripard <mripard@kernel.org>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
 Daniel Vetter <daniel@ffwll.ch>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>, 
 Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/2] drm/bridge-connector: reset the HDMI connector
 state
Message-ID: <20240625-feathered-loon-of-health-ec7e6d@houat>
References: <20240623-drm-bridge-connector-fix-hdmi-reset-v2-0-8590d44912ce@linaro.org>
 <20240623-drm-bridge-connector-fix-hdmi-reset-v2-1-8590d44912ce@linaro.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="eciqjr2zrynuoq6o"
Content-Disposition: inline
In-Reply-To: <20240623-drm-bridge-connector-fix-hdmi-reset-v2-1-8590d44912ce@linaro.org>
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


--eciqjr2zrynuoq6o
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Sun, Jun 23, 2024 at 08:40:12AM GMT, Dmitry Baryshkov wrote:
> On HDMI connectors which use drm_bridge_connector and DRM_BRIDGE_OP_HDMI
> IGT chokes on the max_bpc property in several kms_properties tests due
> to the the drm_bridge_connector failing to reset HDMI-related
> properties.
>=20
> Call __drm_atomic_helper_connector_hdmi_reset() if there is a
> the drm_bridge_connector has bridge_hdmi.
>=20
> Note, the __drm_atomic_helper_connector_hdmi_reset() is moved to
> drm_atomic_state_helper.c because drm_bridge_connector.c can not depend
> on DRM_DISPLAY_HDMI_STATE_HELPER. At the same time it is impossible to
> call this function from HDMI bridges, there is is no function that
> corresponds to the drm_connector_funcs::reset().

Why can't it depend on DRM_DISPLAY_HDMI_STATE_HELPER?

Maxime

--eciqjr2zrynuoq6o
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCZnrb6QAKCRDj7w1vZxhR
xaDaAQDbirOcRJFXYMvi3AKNZOjDVfThaLfVJff4sukVoq4dDwD/VNP5qyY7y2ZR
HY41NMoYCoKnWRZsHLDLNdlbLAKdwgk=
=/z+8
-----END PGP SIGNATURE-----

--eciqjr2zrynuoq6o--
