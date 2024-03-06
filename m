Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 98CF98739B0
	for <lists+dri-devel@lfdr.de>; Wed,  6 Mar 2024 15:48:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 83493113252;
	Wed,  6 Mar 2024 14:48:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="lXBlgeae";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C24D0113252
 for <dri-devel@lists.freedesktop.org>; Wed,  6 Mar 2024 14:48:19 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 7F3DFCE1752;
 Wed,  6 Mar 2024 14:48:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 42FFAC433F1;
 Wed,  6 Mar 2024 14:48:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1709736495;
 bh=LKxAHNk2aLDWzzV1w2tW3dpSb8kzakIi8zhJRlDYp30=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=lXBlgeaeEd838cjSpXB5fqRMp0JDlOUS2RNQONh2ebnE3caajbq4gcz5fgrUUrSyU
 JDGeWAMG9Bd3x0Q0Zixif0b5VboyKVsI8uWeQeIvZPuadhN2GnG1MJasnaniRuvn/x
 A8RtYP6ecWpHi87rDDNV4VrS9FhOIwMilZU1k03FhdKOZ8eXDrbJ5AdHY5yCNPPldE
 hnxsilPlv7krDOXsoX6v5EEUo793kDnpUYR48kQKHhlrqJMcltGCEs5wkqN1KHlUnW
 6kw8Bsa/Ah24iuGlq+MLiZgTuYSE7GBNJ3pm6O0Th8G+8NfhuQFFsJ+5VZJxmLi0KX
 FslSnN+FajSng==
Date: Wed, 6 Mar 2024 15:48:13 +0100
From: Maxime Ripard <mripard@kernel.org>
To: Alexander Stein <alexander.stein@ew.tq-group.com>
Cc: Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, David Airlie <airlied@gmail.com>, 
 Daniel Vetter <daniel@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, 
 Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>, 
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, 
 Sandor Yu <Sandor.yu@nxp.com>, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-phy@lists.infradead.org,
 imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux@ew.tq-group.com, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Subject: Re: [PATCH v15 2/8] phy: Add HDMI configuration options
Message-ID: <20240306-inquisitive-funny-bull-017550@houat>
References: <20240306101625.795732-1-alexander.stein@ew.tq-group.com>
 <20240306101625.795732-3-alexander.stein@ew.tq-group.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="wazjs4qrv6r7qq5x"
Content-Disposition: inline
In-Reply-To: <20240306101625.795732-3-alexander.stein@ew.tq-group.com>
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


--wazjs4qrv6r7qq5x
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Alexander,

On Wed, Mar 06, 2024 at 11:16:19AM +0100, Alexander Stein wrote:
> From: Sandor Yu <Sandor.yu@nxp.com>
>=20
> Allow HDMI PHYs to be configured through the generic
> functions through a custom structure added to the generic union.
>=20
> The parameters added here are based on HDMI PHY
> implementation practices.  The current set of parameters
> should cover the potential users.
>=20
> Signed-off-by: Sandor Yu <Sandor.yu@nxp.com>
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> Acked-by: Vinod Koul <vkoul@kernel.org>
> ---
>  include/linux/phy/phy-hdmi.h | 24 ++++++++++++++++++++++++
>  include/linux/phy/phy.h      |  7 ++++++-
>  2 files changed, 30 insertions(+), 1 deletion(-)
>  create mode 100644 include/linux/phy/phy-hdmi.h
>=20
> diff --git a/include/linux/phy/phy-hdmi.h b/include/linux/phy/phy-hdmi.h
> new file mode 100644
> index 0000000000000..b7de88e9090f0
> --- /dev/null
> +++ b/include/linux/phy/phy-hdmi.h
> @@ -0,0 +1,24 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +/*
> + * Copyright 2022 NXP
> + */
> +
> +#ifndef __PHY_HDMI_H_
> +#define __PHY_HDMI_H_
> +
> +#include <linux/hdmi.h>
> +/**
> + * struct phy_configure_opts_hdmi - HDMI configuration set
> + * @pixel_clk_rate: Pixel clock of video modes in KHz.
> + * @bpc: Maximum bits per color channel.
> + * @color_space: Colorspace in enum hdmi_colorspace.
> + *
> + * This structure is used to represent the configuration state of a HDMI=
 phy.
> + */
> +struct phy_configure_opts_hdmi {
> +	unsigned int pixel_clk_rate;
> +	unsigned int bpc;
> +	enum hdmi_colorspace color_space;
> +};

Does the PHY actually care about the pixel clock rate, color space and
formats, or does it only care about the character rate?

Also, how would you handle pixel doubling?

Maxime

--wazjs4qrv6r7qq5x
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCZeiCLAAKCRDj7w1vZxhR
xSnUAP41rpokDnniw6MdmXTRycs0PMI6TgR/87jmxzdVFERWKgEA/uUZeHTkC2sD
5V8zpf6ghz8P69W2+uKQN5GBGohZ5Ag=
=ozbL
-----END PGP SIGNATURE-----

--wazjs4qrv6r7qq5x--
