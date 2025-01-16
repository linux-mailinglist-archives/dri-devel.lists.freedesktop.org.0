Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CE3EA13EA3
	for <lists+dri-devel@lfdr.de>; Thu, 16 Jan 2025 17:01:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 29AFE10E9BD;
	Thu, 16 Jan 2025 16:01:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="Lo485IKb";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7444510E9B8
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Jan 2025 16:01:08 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id A16D75C58C3;
 Thu, 16 Jan 2025 16:00:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 948C1C4CEE1;
 Thu, 16 Jan 2025 16:01:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1737043267;
 bh=K+O30vGF8jNEYQFXsYQnn3DPQMXPqVS7VsD/r8QKN1c=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Lo485IKbw+eOWH9CJfq3RxyLfSDwWzOIGOafK7LwYcIRglHUpSCfZvcnHDLvL+bQU
 Ctt7NMCC3MWl1glyldYnSoiMv4t2A5+v1ywa1rij0TAywGP9TW6PGyt6PFXQ1KjYov
 030Uiod4Z38mycvYsM+gwH9khJD3uis5jLoe2JBuYQc3vEyVuJHAGThUCZ5bKW/o24
 5IJfg2Ut+8i75uH4exc7cWhkyoLhA93mTkgg4eALg62ezEVdEFEowc8/nSq4zC6Q6p
 c1cnO0D58K2bcWaGGQc3Cwi7NzW1e6+c2NvnQRKad0cWfR0HCQYYR9cyzCXBY3J77k
 ceWOp3UOMzPjQ==
Date: Thu, 16 Jan 2025 17:01:03 +0100
From: Maxime Ripard <mripard@kernel.org>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: fnkl.kernel@gmail.com, Hector Martin <marcan@marcan.st>, 
 Sven Peter <sven@svenpeter.dev>, Alyssa Rosenzweig <alyssa@rosenzweig.io>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>,
 Jessica Zhang <quic_jesszhan@quicinc.com>, asahi@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Alyssa Ross <hi@alyssa.is>,
 Janne Grunau <j@jannau.net>
Subject: Re: [PATCH v4 2/5] drm: adp: Add Apple Display Pipe driver
Message-ID: <20250116-vivacious-congenial-nightingale-cb2f6d@houat>
References: <20250114-adpdrm-v4-0-e9b5260a39f1@gmail.com>
 <20250114-adpdrm-v4-2-e9b5260a39f1@gmail.com>
 <mu7qiybhj7tu5hauk7izfxqlookc3awpknhjk74zwpkbznei4m@kewap6vivzoa>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha384;
 protocol="application/pgp-signature"; boundary="rgvkyocpvfnurspd"
Content-Disposition: inline
In-Reply-To: <mu7qiybhj7tu5hauk7izfxqlookc3awpknhjk74zwpkbznei4m@kewap6vivzoa>
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


--rgvkyocpvfnurspd
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v4 2/5] drm: adp: Add Apple Display Pipe driver
MIME-Version: 1.0

Hi Dmitry,

On Wed, Jan 15, 2025 at 12:21:39PM +0200, Dmitry Baryshkov wrote:
> On Tue, Jan 14, 2025 at 10:38:53PM +0100, Sasha Finkelstein via B4 Relay =
wrote:
> > +static int adp_dsi_host_attach(struct mipi_dsi_host *host,
> > +			       struct mipi_dsi_device *dev)
> > +{
> > +	struct adp_mipi_drv_private *adp =3D mipi_to_adp(host);
> > +	struct drm_bridge *next;
> > +
> > +	next =3D devm_drm_of_get_bridge(adp->dsi.dev, adp->dsi.dev->of_node, =
1, 0);
>=20
> select DRM_PANEL_BRIDGE for this API to be available.
> Also there is an issue of lifetimes. The bridge will be destroyed only
> when MIPI driver is unbound, however the panel can be attached and
> detached several times.

Can you expand on that one a bit more? AFAIK, it's always been unsafe
and we don't have a good mitigation at the moment, so it's unclear to me
what change you want here.

Maxime

--rgvkyocpvfnurspd
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJUEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCZ4ktOAAKCRAnX84Zoj2+
diYEAX9X9nkT02sFf01ulFeGvCcG9S4zbIOBRhh3YUXpaH4JAbu+6x4S7Ioq+nx1
cybYy0ABf2QLNDKRv+5B3Kyk0nHtU/Qae+ucdanC6Nw7Qqf6R/77ktfolomf8Oc4
t/GdZdJufA==
=siI1
-----END PGP SIGNATURE-----

--rgvkyocpvfnurspd--
