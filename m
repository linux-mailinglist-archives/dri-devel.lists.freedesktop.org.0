Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A57A89B601D
	for <lists+dri-devel@lfdr.de>; Wed, 30 Oct 2024 11:30:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 079F910E777;
	Wed, 30 Oct 2024 10:30:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="iPBom++I";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E217110E777
 for <dri-devel@lists.freedesktop.org>; Wed, 30 Oct 2024 10:30:12 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id EA55A5C3178;
 Wed, 30 Oct 2024 10:29:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 27E7CC4CEE3;
 Wed, 30 Oct 2024 10:30:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1730284211;
 bh=fEyGQG5p+/Axzk94LPtg9MyYLs8WiA+7sDPOBdC8nuY=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=iPBom++Ip3zXbNr4S9qX5JpImsDxqHoTocohiCaoOx5wNTJbiARb4bC/qMG+xkcKl
 4bo9Z5yrvUKpiXeTjblCmlZFumY+okw/Vt7mCFA55EdghPH5Za2gM3Pd4VOqUoihoM
 RC1xYCQrttOvZlsb/YnO8yx8rwmJMkz4dkArPco2y1Naytv1uKPyxf+rLmFiNnWqL4
 hLvcUJg2ZZj271QMiXn3eMmS3Gk3eUI74tYuVqsgFHmT1D26eR4bwwRZoXeSi29m2C
 o24VUlOK0cedEcwP3X/B28lsMehPiZZsJvfrGYvPA5SwkdJ/67vIoYA0QMo/YjPKne
 u3uClG+jbjG3A==
Date: Wed, 30 Oct 2024 11:30:09 +0100
From: Maxime Ripard <mripard@kernel.org>
To: Liu Ying <victor.liu@nxp.com>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, imx@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, andrzej.hajda@intel.com,
 neil.armstrong@linaro.org, 
 rfoss@kernel.org, Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se, 
 jernej.skrabec@gmail.com, maarten.lankhorst@linux.intel.com,
 tzimmermann@suse.de, 
 airlied@gmail.com, simona@ffwll.ch, robh@kernel.org, krzk+dt@kernel.org, 
 conor+dt@kernel.org, quic_jesszhan@quicinc.com, mchehab@kernel.org, 
 shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de, 
 festevam@gmail.com, catalin.marinas@arm.com, will@kernel.org, 
 sakari.ailus@linux.intel.com, hverkuil@xs4all.nl,
 tomi.valkeinen@ideasonboard.com, 
 quic_bjorande@quicinc.com, geert+renesas@glider.be, dmitry.baryshkov@linaro.org,
 arnd@arndb.de, nfraprado@collabora.com, thierry.reding@gmail.com, 
 prabhakar.mahadev-lad.rj@bp.renesas.com, sam@ravnborg.org, marex@denx.de,
 biju.das.jz@bp.renesas.com
Subject: Re: [PATCH v4 03/13] drm/bridge: fsl-ldb: Use clk_round_rate() to
 validate "ldb" clock rate
Message-ID: <20241030-hypersonic-tremendous-tuatara-2bbeb0@houat>
References: <20241028023740.19732-1-victor.liu@nxp.com>
 <20241028023740.19732-4-victor.liu@nxp.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha384;
 protocol="application/pgp-signature"; boundary="jdfa4z4pqzuvoooj"
Content-Disposition: inline
In-Reply-To: <20241028023740.19732-4-victor.liu@nxp.com>
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


--jdfa4z4pqzuvoooj
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v4 03/13] drm/bridge: fsl-ldb: Use clk_round_rate() to
 validate "ldb" clock rate
MIME-Version: 1.0

On Mon, Oct 28, 2024 at 10:37:30AM +0800, Liu Ying wrote:
> Multiple display modes could be read from a display device's EDID.
> Use clk_round_rate() to validate the "ldb" clock rate for each mode
> in drm_bridge_funcs::mode_valid() to filter unsupported modes out.
>=20
> Also, since this driver doesn't directly reference pixel clock, use
> clk_round_rate() to validate the pixel clock rate against the "ldb"
> clock if the "ldb" clock and the pixel clock are sibling in clock
> tree.  This is not done in display controller driver because
> drm_crtc_helper_funcs::mode_valid() may not decide to do the
> validation or not if multiple encoders are connected to the CRTC,
> e.g., i.MX93 LCDIF may connect with MIPI DSI controller, LDB and
> parallel display output simultaneously.
>=20
> Signed-off-by: Liu Ying <victor.liu@nxp.com>
> ---
> Note that this patch depends on a patch in shawnguo/imx/fixes:
> https://patchwork.kernel.org/project/linux-arm-kernel/patch/2024101703114=
6.157996-1-marex@denx.de/

I still believe that the root cause of this issue is your clock tree and
driver setup, and since I've asked for explanations and didn't get any,
I don't really see how we can move forward here.

Maxime

--jdfa4z4pqzuvoooj
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJUEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCZyIKrAAKCRAnX84Zoj2+
dk5eAYDDyKjKmenLlLXrE7PF5+02MCRjxjyPZUPeFcxn9WqZwrqLx6hAeRNfTD1I
fBz39NEBgPedANzTVocrGaKTqjaLuKN1UWpfFGVqf9OjORjTtsRTq+Rg7VBMH8ER
7Vm4WtqjxQ==
=QcTM
-----END PGP SIGNATURE-----

--jdfa4z4pqzuvoooj--
