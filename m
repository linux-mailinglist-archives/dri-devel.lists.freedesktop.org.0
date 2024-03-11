Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A36718783F8
	for <lists+dri-devel@lfdr.de>; Mon, 11 Mar 2024 16:38:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 07C0D10EB64;
	Mon, 11 Mar 2024 15:38:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="DpZsuNBV";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 18F5D10EB64;
 Mon, 11 Mar 2024 15:38:18 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 32DB5CE1142;
 Mon, 11 Mar 2024 15:38:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ED03DC433F1;
 Mon, 11 Mar 2024 15:38:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1710171495;
 bh=l8qq6wUuYhli1TsejzCL26/yitH72h4PpTLNMVrhoUQ=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=DpZsuNBVQlikV302rjM/FPdiyYLgF6+V2S51GDh8xpNk6+552pmSse69VA1oOa6Y8
 wWgglFfU9mIJ3EvuBeqYFx302K12g+7xYQsUHkE7pm0wWr5jdCJfufJ9gddqNNY1qP
 wRSDHgflHTi4pR4md5Dk7LqGfvryDPgzsCOi9pYKZqO0DL0jfQhPFVuBXMze96P6s0
 WGKFwDSKKAcLlUeayWlnzP2xaAsyRV2Hci9vUrmOdAL6imloIz41WWYgexX7/Wcgkr
 MIbfSgL0HNDCLd8qn2MTdV+13NykA3gQ1LHzzUzriDFrXSDuam6bbvTfH137qmSV6K
 7I4gyUWWYS1Rg==
Date: Mon, 11 Mar 2024 16:38:12 +0100
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
Subject: Re: [PATCH RFC v2 2/5] drm/connector: hdmi: add
 drm_connector_hdmi_init
Message-ID: <20240311-important-whippet-of-force-f112a6@houat>
References: <20240309-bridge-hdmi-connector-v2-0-1380bea3ee70@linaro.org>
 <20240309-bridge-hdmi-connector-v2-2-1380bea3ee70@linaro.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="iym5gqunsc3erwmp"
Content-Disposition: inline
In-Reply-To: <20240309-bridge-hdmi-connector-v2-2-1380bea3ee70@linaro.org>
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


--iym5gqunsc3erwmp
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Sat, Mar 09, 2024 at 12:31:29PM +0200, Dmitry Baryshkov wrote:
> To support connectors which do all the management on their own (like
> drm_bridge_connector), add drm_connector_hdmi_init() in addition to
> drmm_connector_hdmi_init().
>=20
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

That's only slightly relevante, but I think it could be occasion to
switch to drmm_connector_init for drm_bridge_connector too.

It's something we want to migrate to anyway, so it would be nice to do
it as part of this series so we don't need the extra init function.

Maxime

--iym5gqunsc3erwmp
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCZe8lZAAKCRDj7w1vZxhR
xSoWAP4sI2aJ30w/BG40q0QaQlyXiXxlfaLReirBQUMGCgX38wEA6qS6KIWeZ19f
aP+ORaD1cIcYnnabKg/WShgn8z6DngE=
=hOCy
-----END PGP SIGNATURE-----

--iym5gqunsc3erwmp--
