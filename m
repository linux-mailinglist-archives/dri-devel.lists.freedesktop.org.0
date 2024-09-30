Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F25E989B16
	for <lists+dri-devel@lfdr.de>; Mon, 30 Sep 2024 09:11:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1FDED10E3A4;
	Mon, 30 Sep 2024 07:11:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="Z8mrf0qD";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4F69010E3A4
 for <dri-devel@lists.freedesktop.org>; Mon, 30 Sep 2024 07:11:33 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 634AA5C0452;
 Mon, 30 Sep 2024 07:11:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A55D8C4CEC7;
 Mon, 30 Sep 2024 07:11:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1727680292;
 bh=5gE0eQKarbBdG/N8GRdrx4HzsypjvkZF3NLxrW3tOmg=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Z8mrf0qDpI6U0qWT5Xfe9bVz8sdg1jtc/JHj+pPmNUuhDqlnsLLtTJTgyqPHihJFC
 m/YXnawC2F0f6Rp9PaYScRfFB6ZBPFnPyhZFgLCgCBBzLSNf1oVxvTlwbGqYzYEFyX
 yLIhJfOGQUw++9vAnxYz2B9PcsSCwNG+0wLABCKOxv3G7oFMvCOdDELAR2whw9nmik
 NDHX1y2Hhi4s017dEkutuu2uEouiNpZq+XKrp//ue5WZTnrHfJ6M1fIF4ICpd7OVLV
 GyfO1PZIlVLJfAwSUgJ1C7c9TlCsb3Iuji62zY81d2ZRHIRM4m7VwLpr+N5otLUOgH
 aF9qtK+q1eEBw==
Date: Mon, 30 Sep 2024 09:11:29 +0200
From: Maxime Ripard <mripard@kernel.org>
To: Liu Ying <victor.liu@nxp.com>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, imx@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, 
 andrzej.hajda@intel.com, neil.armstrong@linaro.org, rfoss@kernel.org, 
 Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se, jernej.skrabec@gmail.com, 
 maarten.lankhorst@linux.intel.com, tzimmermann@suse.de, airlied@gmail.com,
 simona@ffwll.ch, 
 robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, shawnguo@kernel.org, 
 s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com, 
 catalin.marinas@arm.com, will@kernel.org, quic_bjorande@quicinc.com, 
 geert+renesas@glider.be, dmitry.baryshkov@linaro.org, arnd@arndb.de, 
 nfraprado@collabora.com, o.rempel@pengutronix.de, y.moog@phytec.de
Subject: Re: [PATCH 6/8] drm/bridge: Add ITE IT6263 LVDS to HDMI converter
Message-ID: <y4ala34bejzmw5wt3vw5ncoxdzpzda2cwi7bdzve5bn4udmr3b@eiguckpaui6d>
References: <20240930052903.168881-1-victor.liu@nxp.com>
 <20240930052903.168881-7-victor.liu@nxp.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha384;
 protocol="application/pgp-signature"; boundary="4pawbxwfkwm2rvaf"
Content-Disposition: inline
In-Reply-To: <20240930052903.168881-7-victor.liu@nxp.com>
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


--4pawbxwfkwm2rvaf
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Mon, Sep 30, 2024 at 01:29:01PM GMT, Liu Ying wrote:
> Add basic HDMI video output support. Currently, only RGB888 output
> pixel format is supported.  At the LVDS input side, the driver
> supports single LVDS link and dual LVDS links with "jeida-24" LVDS
> mapping.
>=20
> Product link:
> https://www.ite.com.tw/en/product/cate1/IT6263
>=20
> Signed-off-by: Liu Ying <victor.liu@nxp.com>

Generally speaking, you need to use the new HDMI bridge infrastructure.
There's a lot of required things you're not dealing with here (such as
infoframes)

Also, you should add a MAINTAINERS entry

Maxime

--4pawbxwfkwm2rvaf
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJUEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCZvpPIQAKCRAnX84Zoj2+
dqvYAX9I87/HqBwOqoEON9kE2R3ppakKzN3DPMpFyFZKLJIZTnQ8dLGTfO+tDhvd
QKRxnf8Bf31b3DAkdSxRy3s14jonZ+JPFhY1hLAPEkg6Ra3YPDeKIHMJ5NMPiUz6
/mTkSjEfPw==
=AjJ2
-----END PGP SIGNATURE-----

--4pawbxwfkwm2rvaf--
