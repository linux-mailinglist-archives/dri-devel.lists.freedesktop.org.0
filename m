Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BA68A647EB
	for <lists+dri-devel@lfdr.de>; Mon, 17 Mar 2025 10:45:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 511CA10E0DE;
	Mon, 17 Mar 2025 09:45:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="Vc5R1QmP";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 908F910E05F;
 Mon, 17 Mar 2025 09:45:28 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id E11CDA4899B;
 Mon, 17 Mar 2025 09:39:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E9377C4CEF0;
 Mon, 17 Mar 2025 09:45:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1742204719;
 bh=IDfEO9ixbAv5kWVNwF8BvMXACU0glZwpuOKgM/NINyM=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Vc5R1QmPHOTrhSdJtjbXjn3Q/pVsWLlIO/2wjHWiT71fsu3wrrUDlsbP/CPZXw+mc
 xysGjRvhtSwfdQA7HGJt+RsKNKcxEBhM6/R8SmwI47z5/kKsgxaSoneE4b6337Kx/S
 q29zb4BgGaWy9Qun1/SXXBOv4DEQWAk0xS038Xs+ce/2+w3rg3YTC20kityrcogz6z
 YP6/VILT5UbbeNCTguFiYnXZ2Tpaqa/ZbTBIEViVGHFSJqOudQTjAM6x9yYNcJPurG
 VLYLFVMq+ZIaNNcvvUNSE6050QM1p9nJenFIgDe2tf1Qp4VUnagqewQiw3BvpA4WHx
 uGNkNd+wpqZVA==
Date: Mon, 17 Mar 2025 10:45:16 +0100
From: Maxime Ripard <mripard@kernel.org>
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>, 
 David Airlie <airlied@gmail.com>, Dmitry Baryshkov <lumag@kernel.org>, 
 Hermes Wu <Hermes.wu@ite.com.tw>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Jonas Karlman <jonas@kwiboo.se>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Marijn Suijten <marijn.suijten@somainline.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Rob Clark <robdclark@gmail.com>,
 Robert Foss <rfoss@kernel.org>, 
 Sean Paul <sean@poorly.run>, Simona Vetter <simona@ffwll.ch>, 
 Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH v6 2/4] drm/bridge: add function interface for
 DisplayPort audio implementation
Message-ID: <20250317-dancing-loyal-malkoha-ad5a36@houat>
References: <20250314-dp-hdmi-audio-v6-2-dbd228fa73d7@oss.qualcomm.com>
 <d5b8a7fa506ed3026c19b383edf160d6@kernel.org>
 <otidtln4pjb47azr7zhllxkqmwocdnbdiay6xcg6psphz3436i@fn5hxgaflgv6>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha384;
 protocol="application/pgp-signature"; boundary="ixvl3eaawni5mk5e"
Content-Disposition: inline
In-Reply-To: <otidtln4pjb47azr7zhllxkqmwocdnbdiay6xcg6psphz3436i@fn5hxgaflgv6>
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


--ixvl3eaawni5mk5e
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v6 2/4] drm/bridge: add function interface for
 DisplayPort audio implementation
MIME-Version: 1.0

On Fri, Mar 14, 2025 at 08:55:05PM +0200, Dmitry Baryshkov wrote:
> On Fri, Mar 14, 2025 at 05:54:14PM +0000, Maxime Ripard wrote:
> > On Fri, 14 Mar 2025 11:36:49 +0200, Dmitry Baryshkov wrote:
> > > It is common for the DisplayPort bridges to implement audio support. =
In
> > > preparation to providing a generic framework for DP audio, add
> > > corresponding interface to struct drm_bridge. As suggested by Maxime
> > > for now this is mostly c&p of the corresponding HDMI audio API.
> > >=20
> > >=20
> > > [ ... ]
> >=20
> > Reviewed-by: Maxime Ripard <mripard@kernel.org>
>=20
> You've sent two r-b's for patch 2. Is there a chance that one of those
> was for patch 3?

Did I? Sorry, it was indeed meant for patch 3

Maxime

--ixvl3eaawni5mk5e
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJUEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCZ9fvJwAKCRAnX84Zoj2+
dnNVAYDhZWYDGXn7oAB0Fo0Lf64zRQfKXIpnqEHJYJiwjUC3bU8WN/EHUFxqFVpX
epcnHMkBf1TqVVJjt8AS9ICP0MFlT1pGgiaFWa2B8bah6LI77fyFdkT67q5xD9JQ
oz5+buRd4w==
=mQjr
-----END PGP SIGNATURE-----

--ixvl3eaawni5mk5e--
