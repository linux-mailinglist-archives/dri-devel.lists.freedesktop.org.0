Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 79D2D8C7AF8
	for <lists+dri-devel@lfdr.de>; Thu, 16 May 2024 19:17:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 832CB10E27C;
	Thu, 16 May 2024 17:17:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="c1xnjiai";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1762810E27C
 for <dri-devel@lists.freedesktop.org>; Thu, 16 May 2024 17:17:22 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 1CC0F60011;
 Thu, 16 May 2024 17:17:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 03657C113CC;
 Thu, 16 May 2024 17:17:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1715879841;
 bh=+9ep4E4ALUttjO+CaTJIyTPPObIWtAgLKOaiG62P4/8=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=c1xnjiaifHePS54zD9X1TOburYd+uayOwa3V9rdZnqe4IlCC/fRIN2fSq5fNZGo5K
 2PPS/WxsS0fdyQsDyO/VCL5ocrZa9V9JWpcQ8D1xtfD35U7E6E3usPd7PEjkss+/Jw
 kaoziU9PAglsmwY8h4hvNjveHBgjXHG+6nRp21HIedq8pOphTbAoWJeKWaDY45phio
 oMWFkWb6piAx0WiLSR0+UspJXq7CS7OJynyqyKcQ5YOWGbwKJkm05dxlfWVgUc7vtm
 uLectBhQ3N9H7GXGqzNK0U03i8jrehd1S5JytEm+aplNZuxRX7K8uMDTU1OdozQ6Th
 P5MMi7eOn1o3Q==
Date: Thu, 16 May 2024 18:17:14 +0100
From: Conor Dooley <conor@kernel.org>
To: Marek Vasut <marex@denx.de>
Cc: devicetree@vger.kernel.org, Andrzej Hajda <andrzej.hajda@intel.com>,
 Conor Dooley <conor+dt@kernel.org>, Daniel Vetter <daniel@ffwll.ch>,
 David Airlie <airlied@gmail.com>, Fabio Estevam <festevam@gmail.com>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, Jonas Karlman <jonas@kwiboo.se>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Liu Ying <victor.liu@nxp.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 Rob Herring <robh@kernel.org>, Robert Foss <rfoss@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>, Shawn Guo <shawnguo@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 dri-devel@lists.freedesktop.org, imx@lists.linux.dev,
 kernel@dh-electronics.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v2] dt-bindings: display: synopsys,dw-hdmi: Document
 ddc-i2c-bus in core
Message-ID: <20240516-dill-exception-7ef1e9a1a473@spud>
References: <20240515062753.111746-1-marex@denx.de>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="UCTs9d82BIhevYEn"
Content-Disposition: inline
In-Reply-To: <20240515062753.111746-1-marex@denx.de>
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


--UCTs9d82BIhevYEn
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, May 15, 2024 at 08:27:44AM +0200, Marek Vasut wrote:
> The DW HDMI driver core is responsible for parsing the 'ddc-i2c-bus' property,
> move the property description into the DW HDMI common DT schema too, so this
> property can be used on all devices integrating the DW HDMI core.

Acked-by: Conor Dooley <conor.dooley@microchip.com>

Cheers,
Conor.

--UCTs9d82BIhevYEn
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZkY/mgAKCRB4tDGHoIJi
0jqhAP94jDx5vzCpjUTTo0IRSUg26A+svmD+AneDo1hxbXA/0gD/USEdNBXvLbFg
vXMTT2mMN3OlKcJk/qWTUKJe6EV/DA4=
=/C2a
-----END PGP SIGNATURE-----

--UCTs9d82BIhevYEn--
