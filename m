Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 83EF2A04D5D
	for <lists+dri-devel@lfdr.de>; Wed,  8 Jan 2025 00:21:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3CFA310E041;
	Tue,  7 Jan 2025 23:21:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="sUgylO24";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AC15110E041
 for <dri-devel@lists.freedesktop.org>; Tue,  7 Jan 2025 23:21:18 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id D0FF55C576C;
 Tue,  7 Jan 2025 23:20:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 61F12C4CED6;
 Tue,  7 Jan 2025 23:21:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1736292077;
 bh=Kilm1ZAdWzy3rPEDUVkX5c9b+aYHLITqsZsNfgNyC2Q=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=sUgylO24DAttxYL26qZXve5hvrgsTvvOnKU7yq7oY/O13PXLgH2yaUT8j3dzbDI4F
 G9gnqx8F2ap2hpu7iaASyaqHOfJli9UmxBevnHSF7UXBo7Bqje8zyZzfoNad0rvDYK
 vctghzjYXEqQ6+9kIBAuHDSzFRUEXsjZP0JkDg0Y3iyXzdr47eYgDJZl8innUNJuU+
 Bs1ibYZaqkYXENoWmYZnZVM0qE0RP3h0HMurlFB65jj78ZeB2qN0Ewezg7o0W1sTRR
 FZ36XWzWe1sJeV5wOs0+d6l8bAnqoQBa1Xeo3tBY8iJRyz6zCy7HUDFNEaPVtGoBOM
 wehUeO4yRC1Jw==
Date: Tue, 7 Jan 2025 17:21:16 -0600
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Alexander Stein <alexander.stein@ew.tq-group.com>
Cc: imx@lists.linux.dev, Simona Vetter <simona@ffwll.ch>,
 Maxime Ripard <mripard@kernel.org>, Inki Dae <inki.dae@samsung.com>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Marek Szyprowski <m.szyprowski@samsung.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 devicetree@vger.kernel.org, Jonas Karlman <jonas@kwiboo.se>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Shawn Guo <shawnguo@kernel.org>, Robert Foss <rfoss@kernel.org>,
 Fabio Estevam <festevam@gmail.com>, dri-devel@lists.freedesktop.org,
 Thomas Zimmermann <tzimmermann@suse.de>, linux-kernel@vger.kernel.org,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Sascha Hauer <s.hauer@pengutronix.de>, David Airlie <airlied@gmail.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Jagan Teki <jagan@amarulasolutions.com>,
 linux-arm-kernel@lists.infradead.org, Conor Dooley <conor+dt@kernel.org>,
 Pengutronix Kernel Team <kernel@pengutronix.de>
Subject: Re: [PATCH 2/2] dt-bindings: samsung,mipi-dsim: Add imx7d specific
 compatible
Message-ID: <173629198495.2036683.9877314471091548361.robh@kernel.org>
References: <20250107094943.518474-1-alexander.stein@ew.tq-group.com>
 <20250107094943.518474-3-alexander.stein@ew.tq-group.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250107094943.518474-3-alexander.stein@ew.tq-group.com>
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


On Tue, 07 Jan 2025 10:49:42 +0100, Alexander Stein wrote:
> This add a imx7(d) specific compatible which is compatible to imx8mm.
> This silences the dtbs_check warning:
> arch/arm/boot/dts/nxp/imx/imx7s-mba7.dtb: dsi@30760000: compatible: 'oneOf' conditional failed, one must be fixed:
>  ['fsl,imx7d-mipi-dsim', 'fsl,imx8mm-mipi-dsim'] is too long
> 
> Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
> ---
>  .../devicetree/bindings/display/bridge/samsung,mipi-dsim.yaml | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 

Fabio is clearly confused, and I prefer this patch over his. As 
it is probably past the drm-misc cutoff, I applied it to DT tree.
 
Thanks,
Rob

