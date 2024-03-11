Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C80E87841D
	for <lists+dri-devel@lfdr.de>; Mon, 11 Mar 2024 16:46:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E002C112B37;
	Mon, 11 Mar 2024 15:46:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="AWh83vEh";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 68E1B112B25;
 Mon, 11 Mar 2024 15:46:16 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id CF7AB60EDC;
 Mon, 11 Mar 2024 15:46:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 01E1AC433F1;
 Mon, 11 Mar 2024 15:46:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1710171975;
 bh=mhssB7lUZCuilumeGYEV+p2GuGFqIB/fiRUqdStbvd4=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=AWh83vEhZO5pOUkik7cbnVy40m95xq6qYDx3yZgV3GJib0b1oqRMR528qg9aKSIe9
 3koTaRoZkh+6zRPL7Sl5VfFMDpO40w+HKjG0n7FFm9ZCIvoJ7L9OTNblJyGWNSdiIT
 xpsrkxOHOMTigH42lDmZ3M4ZPhN74Ts6a2hL/a0XelrIPTP3nMeu7QYepTnXiy4Q1s
 CRPMWEP4Zehm90rwxHcsN2d1iXWjxnkuIQHjYKQXgxa+DuPkcmw3Tuft+0cq2tpBPp
 Y1GLa5bGTfyrR8fUVagjCVDbNsOGthATeEojqcz0QbRyjSoOcYNFksBwGCRFr/kvZp
 he3XDQeOT8Pzw==
Date: Mon, 11 Mar 2024 16:46:12 +0100
From: Maxime Ripard <mripard@kernel.org>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
 Daniel Vetter <daniel@ffwll.ch>, Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, dri-devel@lists.freedesktop.org,
 linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org
Subject: Re: [PATCH RFC v2 5/5] drm/msm/hdmi: make use of the
 drm_connector_hdmi framework
Message-ID: <20240311-divergent-friendly-python-2c7d5d@houat>
References: <20240309-bridge-hdmi-connector-v2-0-1380bea3ee70@linaro.org>
 <20240309-bridge-hdmi-connector-v2-5-1380bea3ee70@linaro.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="6uwovjrbotqevls7"
Content-Disposition: inline
In-Reply-To: <20240309-bridge-hdmi-connector-v2-5-1380bea3ee70@linaro.org>
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


--6uwovjrbotqevls7
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Sat, Mar 09, 2024 at 12:31:32PM +0200, Dmitry Baryshkov wrote:
> Setup the HDMI connector on the MSM HDMI outputs. Make use of
> atomic_check hook and of the provided Infoframe infrastructure.
>=20
> Note: for now only AVI Infoframes are enabled. Audio Infoframes are
> currenly handled separately. This will be fixed for the final version.
>=20
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

I had a look at the driver, and it looks like mode_set and mode_valid
could use the connector_state tmds_char_rate instead of pixclock and
drm_connector_hdmi_compute_mode_clock respectively instead of
calculating it by themselves.

We can probably remove hdmi->pixclock entirely if we manage to pass the
connector state to msm_hdmi_power_on.

And that's unrelated to this series, but we can also remove
hdmi->hdmi_mode for drm_display_info.is_hdmi.

Maxime

--6uwovjrbotqevls7
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCZe8nRAAKCRDj7w1vZxhR
xUbBAQCmwNtJw7PxMpMlX8Jf+1cEg3kX9FAzPXVZFO/8BbylUAD/apYGzmrcXY0X
SzTnma21Ua2e016qvVcB2nGCID6VjQU=
=lm3E
-----END PGP SIGNATURE-----

--6uwovjrbotqevls7--
