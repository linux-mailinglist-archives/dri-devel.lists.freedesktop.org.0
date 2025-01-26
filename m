Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 85354A1CCF5
	for <lists+dri-devel@lfdr.de>; Sun, 26 Jan 2025 17:41:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F178610E484;
	Sun, 26 Jan 2025 16:41:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="pee83AH9";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B96F110E483;
 Sun, 26 Jan 2025 16:41:42 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 735055C5F2E;
 Sun, 26 Jan 2025 16:41:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2B742C4CED3;
 Sun, 26 Jan 2025 16:41:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1737909701;
 bh=/7J4enhP8qcoFPo60PM5Nw959dOsZCztnFfcr76/Vgw=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=pee83AH90NNXLz7BP6WhQh9IjMp8jfwGZ9tojv7gTNjTmNKW8WrYWQUAOMUS0kr5a
 oJdi8GTMwp7KlcCzszEQObO/I6Bm/NAM41mNcUEaPT7MpzRJb6x2eJNmG5fQbYLP9x
 ekDBQPQP27IjqZ5PdkdkTO2qqQq6kY/nl7u20h7obwyDZXVz40qWKHblmdRGbrJAkk
 lkMMuHtjOyy1hYZ02sefxYoq4hZSFmWgNCN6T3XJwBqhDu3LX1NYsWt9ccRKgWrtpR
 nIw6OBtHZX2lY+rDaUjFHsaweAcXz9YdkIL7NJCYvxhCYnxXlyL7DmmcmxQ/RliNbG
 qpY/ENj0Sn0hg==
Date: Sun, 26 Jan 2025 17:41:35 +0100
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
Subject: Re: [PATCH v6 2/7] drm/msm/hdmi: program HDMI timings during
 atomic_pre_enable
Message-ID: <l3f3xg4fjycx4uo66sfdbtke3g6ubf2lrtocys53ymseoi3g6q@z3642rvjy2fe>
References: <20250124-bridge-hdmi-connector-v6-0-1592632327f7@linaro.org>
 <20250124-bridge-hdmi-connector-v6-2-1592632327f7@linaro.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha384;
 protocol="application/pgp-signature"; boundary="vuxkawwxcu5moozb"
Content-Disposition: inline
In-Reply-To: <20250124-bridge-hdmi-connector-v6-2-1592632327f7@linaro.org>
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


--vuxkawwxcu5moozb
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v6 2/7] drm/msm/hdmi: program HDMI timings during
 atomic_pre_enable
MIME-Version: 1.0

On Fri, Jan 24, 2025 at 11:47:42PM +0200, Dmitry Baryshkov wrote:
> The mode_set callback is deprecated, it doesn't get the
> drm_bridge_state, just mode-related argumetns. Also Abhinav pointed out
> that HDMI timings should be programmed after setting up HDMI PHY and
> PLL. Rework the code to program HDMI timings at the end of
> atomic_pre_enable().
>=20
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

Reviewed-by: Maxime Ripard <mripard@kernel.org>
Maxime

--vuxkawwxcu5moozb
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJUEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCZ5ZlvwAKCRAnX84Zoj2+
dlsVAX9kVIzgidPAipVZkVtP9jTc1dPSHDr7Gekx/pQTRZV2pmWARlzDGnktKhFm
XBHtBLYBgL/agrjjEvCy6zK7KP5WCZYRuOl7LA1TUlRoYCLBKrezW3Vv6aYQULGO
IC2jUvOD8A==
=hxco
-----END PGP SIGNATURE-----

--vuxkawwxcu5moozb--
