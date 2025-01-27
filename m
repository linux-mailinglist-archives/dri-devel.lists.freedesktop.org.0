Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A3FEA1D41C
	for <lists+dri-devel@lfdr.de>; Mon, 27 Jan 2025 11:11:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8CC7F10E21E;
	Mon, 27 Jan 2025 10:10:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="BC4HhShF";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0416110E21E;
 Mon, 27 Jan 2025 10:10:57 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 9402C5C542F;
 Mon, 27 Jan 2025 10:10:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C56E1C4CED2;
 Mon, 27 Jan 2025 10:10:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1737972656;
 bh=agJ5S9bl4wmfQrtA3be1QnJSpq5ngoYn66pkWUpjpJQ=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=BC4HhShF/g4jinRM39EfKcfX2tpvQMIDAHkehNMh8IRLiE/IrlvVjLJSTG3uu5STj
 buToOX0r344ZkiusdUPDg7CqlFcqcX/aEBOEUSuhIIPj615drPE0+nyRUNHV/1KTnE
 hIVQFbOg/sj6wOxuLIzOb217pwGuy0aC9YCpn/3kr6qfNqWU/fdWcLhTonukjBP98e
 j0LFW02vGqhqgx73YbSWDDV1yRcRH3N5pH5Y+3IugGyqBCwG4G3zBy30VlTh1VDPj0
 bNFndaaZmKO0W5H3eo2MTd488YSDPVqO3AmBXFlN5YVF+Xui/R6QY0FV5ocXNXZfPt
 Hf1deZfAjMgQg==
Date: Mon, 27 Jan 2025 11:10:52 +0100
From: Maxime Ripard <mripard@kernel.org>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
 Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>, 
 Simona Vetter <simona@ffwll.ch>, Simona Vetter <simona.vetter@ffwll.ch>, 
 dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v6 7/7] drm/msm/hdmi: use DRM HDMI Audio framework
Message-ID: <jsm3rtju3r3nxb5wlar4wkvychcdf6lniluw4c3bxkaijfftpy@nsn5v37s3cmp>
References: <20250124-bridge-hdmi-connector-v6-0-1592632327f7@linaro.org>
 <20250124-bridge-hdmi-connector-v6-7-1592632327f7@linaro.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha384;
 protocol="application/pgp-signature"; boundary="v43khfyyztducgj6"
Content-Disposition: inline
In-Reply-To: <20250124-bridge-hdmi-connector-v6-7-1592632327f7@linaro.org>
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


--v43khfyyztducgj6
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v6 7/7] drm/msm/hdmi: use DRM HDMI Audio framework
MIME-Version: 1.0

On Fri, Jan 24, 2025 at 11:47:47PM +0200, Dmitry Baryshkov wrote:
> In order to simplify the driver even further and to remove the
> boilerplate code, rewrite the audio interface to use the DRM HDMI Audio
> framework.
>=20
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

Reviewed-by: Maxime Ripard <mripard@kernel.org>

Maxime

--v43khfyyztducgj6
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJUEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCZ5dbpgAKCRAnX84Zoj2+
dhXYAX45o3735N1/kaKk5NCn2pqj0fKc+7jUoqxD+0dXoZX6+i7NcPgf322fOtRP
Ryy7+ggBf1jmuPDnSIkMIXnLg8ynUROzvy2AN0pISH0RpENCAQiivb5wdF7RYkhV
Mik42nMxew==
=lIVh
-----END PGP SIGNATURE-----

--v43khfyyztducgj6--
