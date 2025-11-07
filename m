Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 66F32C4124E
	for <lists+dri-devel@lfdr.de>; Fri, 07 Nov 2025 18:48:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8CBE510EB25;
	Fri,  7 Nov 2025 17:48:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="LbBrPZTH";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 185FE10EB25
 for <dri-devel@lists.freedesktop.org>; Fri,  7 Nov 2025 17:48:42 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id B45B64385E;
 Fri,  7 Nov 2025 17:48:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0C145C113D0;
 Fri,  7 Nov 2025 17:48:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1762537721;
 bh=tvD9gG0Rr9652jF+dmwkHloaVheVup3vGLAOVr0Cclw=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=LbBrPZTHP9790hXjz8W5gFMTY6U6EZ9xMudqw8cNp2fuc9XcIsvaJlR9Fn121/pFT
 ejvHsi9TvMhq0roGgWGdDfZAmWYSlWFkPNnCceH6F++LlzWYTD7XJDyGYYoqJZyunZ
 PK11xIlA/yLpWFsVbwKA7wcI3xyNcEeglB5idacnS7T3fe6ruSNiU2oBQO8LX/CAJx
 IAtDRtXU8qwuVZQCJGgEAgo4uH5yYQOqolvMsuvN7WsosjWLWpH2Ko4jOE4Xnz+FqL
 aFkj+iaaEf9qo4xSb8lufcme6AN4mstXJ/ZS6x3gu8fkBrJ/LUtVqlrGMH/VgoWAId
 m0Hl8nQayiW2w==
Date: Fri, 7 Nov 2025 17:48:33 +0000
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
Subject: Re: [PATCH v2 02/11] dt-bindings: display: panel: ronbo,rb070d30:
 panel-common ref
Message-ID: <20251107-cornbread-juggling-2e7e69bcac10@spud>
References: <20251107-imx8mp-hb-iiot-v2-0-d8233ded999e@solid-run.com>
 <20251107-imx8mp-hb-iiot-v2-2-d8233ded999e@solid-run.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="E1JSShyRa8hSS1cg"
Content-Disposition: inline
In-Reply-To: <20251107-imx8mp-hb-iiot-v2-2-d8233ded999e@solid-run.com>
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


--E1JSShyRa8hSS1cg
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 07, 2025 at 12:46:09PM +0100, Josua Mayer wrote:
> Add missing ref on panel-common.yaml for this dsi panel so that common
> properties can be shared.
>=20
> Drop reset-gpios and backlight as they are already in panel-common.
>=20
> Switch from additionalProperties to unevaluatedProperties so that common
> panel properties are available without repeating them in this binding.
>=20
> Notably panel-common defines the "port" property for linking panels to a
> source - which was missing from this panel. Mark it as required.
>=20
> Signed-off-by: Josua Mayer <josua@solid-run.com>

Acked-by: Conor Dooley <conor.dooley@microchip.com>
pw-bot: not-applicable

--E1JSShyRa8hSS1cg
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaQ4w8QAKCRB4tDGHoIJi
0lf8AP9B3ouklPfp54vvg9I3TJdfddEIiCt1NbmFTMHP0V8FsgEAlb/T0FlPIhwK
pozK27QDQ5mObhibwyqfrqzCa6WnmA4=
=sj27
-----END PGP SIGNATURE-----

--E1JSShyRa8hSS1cg--
