Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B04FC4123F
	for <lists+dri-devel@lfdr.de>; Fri, 07 Nov 2025 18:47:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5431910EB2D;
	Fri,  7 Nov 2025 17:47:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="Ggrlbcpe";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7BCDE10EB2D
 for <dri-devel@lists.freedesktop.org>; Fri,  7 Nov 2025 17:47:21 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id B321961913;
 Fri,  7 Nov 2025 17:47:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 64B71C4CEF7;
 Fri,  7 Nov 2025 17:47:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1762537640;
 bh=Jg+/cSmWZ3S0pISvENcp84Pxt0oIzICkqotwu2cofT4=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=GgrlbcpeNMyuSBzVJ/24KfJakT1KJ5Rk75Ti6+p+3gxKmupwC9NqmAszXV3M+OlLk
 K0gOAHVOF9/FRq/f+M33yLVDGpP+SXUcC48KqI5OPCAFY5ygZahRT28Sn6r5kG/tI4
 51JhTBK50mO01g/+AgXzqfbeiJGrUyQ+KTBoWIy6W1TPXZ7O/CDYCfGlGeJUPEL+6F
 1S5dlvzkmxaLLaTE0ARraLJO0D3xo77z5OxRRViI3yz3z8xzc1ZFcqtUj4lH7fqB+B
 A50s21Br7ar3hlAIEN3xMo//nOVBKvIo7L77VzHtjm1hzf9SrJr2753heWG3R5Z6zU
 H03pYVM5nd92w==
Date: Fri, 7 Nov 2025 17:47:13 +0000
From: Conor Dooley <conor@kernel.org>
To: Josua Mayer <josua@solid-run.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Dmitry Torokhov <dmitry.torokhov@gmail.com>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
 Thierry Reding <thierry.reding@gmail.com>,
 Jon Nettleton <jon@solid-run.com>,
 Mikhail Anikin <mikhail.anikin@solid-run.com>,
 Yazan Shhady <yazan.shhady@solid-run.com>,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-input@vger.kernel.org,
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v2 03/11] dt-bindings: panel: lvds: add Winstar
 WF70A8SYJHLNGA
Message-ID: <20251107-cubbyhole-certified-2de627004084@spud>
References: <20251107-imx8mp-hb-iiot-v2-0-d8233ded999e@solid-run.com>
 <20251107-imx8mp-hb-iiot-v2-3-d8233ded999e@solid-run.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="9f64Ubgv4dqrvjxG"
Content-Disposition: inline
In-Reply-To: <20251107-imx8mp-hb-iiot-v2-3-d8233ded999e@solid-run.com>
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


--9f64Ubgv4dqrvjxG
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Acked-by: Conor Dooley <conor.dooley@microchip.com>
pw-bot: not-applicable

--9f64Ubgv4dqrvjxG
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaQ4woQAKCRB4tDGHoIJi
0lYNAP982+xPMTBA8hmMHUV0GMWimASaZ/P0l9HC8fXdcwGPNAD7BF9R7aUisARG
9v0SFmVQrHfXao9nLlNa46MCEI3asgU=
=tZOE
-----END PGP SIGNATURE-----

--9f64Ubgv4dqrvjxG--
