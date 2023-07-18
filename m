Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 80845758861
	for <lists+dri-devel@lfdr.de>; Wed, 19 Jul 2023 00:25:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0EB4610E3D2;
	Tue, 18 Jul 2023 22:24:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AC3A710E3D2
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Jul 2023 22:24:56 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id B2C7960C73;
 Tue, 18 Jul 2023 22:24:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 87D90C433C9;
 Tue, 18 Jul 2023 22:24:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1689719095;
 bh=8oG1Eq2q5+HPYfFF4MQZLoFisNklIYLouYmVJXNXPi4=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=qj2fLOt10MObz5drcyVmP8JH3w71hIXR83x8ETYgz54p4eDwVgjyMf+vg7WDSZFHh
 OlXDrgxV6gf2U9zeUBovBfPtsqOWA3/hjvn3nTtdgPQgJ1QBvSlrgteJ4VmygWoYvX
 omY7rwoech9jo1yaDG7i4WGWrgP+S1NS04g7ddFDKx3lpEJ2gKbtO0gYgwMfc9+r3P
 NPgVHb+96woiCyYmVpuowMznnK3jOb/4oSQqvo9xikabiYSY4/lE24bK6RhbAyg0RW
 CGRCehuZV0Y+V13+r7lnAjaN0CksFSyNuhOSnXol3SArweILIKT4lEYTRMzxs8O76+
 NxVhVgC52jrJQ==
Received: (nullmailer pid 2111957 invoked by uid 1000);
 Tue, 18 Jul 2023 22:24:52 -0000
Date: Tue, 18 Jul 2023 16:24:52 -0600
From: Rob Herring <robh@kernel.org>
To: Liu Ying <victor.liu@nxp.com>
Subject: Re: [PATCH 8/9] dt-bindings: display: bridge: Document Freescale
 i.MX93 MIPI DSI
Message-ID: <168971909191.2111776.12496208121997931602.robh@kernel.org>
References: <20230717061831.1826878-1-victor.liu@nxp.com>
 <20230717061831.1826878-9-victor.liu@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230717061831.1826878-9-victor.liu@nxp.com>
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
Cc: devicetree@vger.kernel.org, conor+dt@kernel.org, rfoss@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, neil.armstrong@linaro.org,
 s.hauer@pengutronix.de, jonas@kwiboo.se, linux-imx@nxp.com,
 dri-devel@lists.freedesktop.org, andrzej.hajda@intel.com, robh+dt@kernel.org,
 jernej.skrabec@gmail.com, shawnguo@kernel.org, kernel@pengutronix.de,
 linux-arm-kernel@lists.infradead.org, Laurent.pinchart@ideasonboard.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On Mon, 17 Jul 2023 14:18:30 +0800, Liu Ying wrote:
> Freescale i.MX93 SoC embeds a Synopsys Designware MIPI DSI host
> controller and a Synopsys Designware MIPI DPHY.  Some configurations
> and extensions to them are controlled by i.MX93 media blk-ctrl.
> 
> Signed-off-by: Liu Ying <victor.liu@nxp.com>
> ---
>  .../display/bridge/fsl,imx93-mipi-dsi.yaml    | 115 ++++++++++++++++++
>  1 file changed, 115 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/display/bridge/fsl,imx93-mipi-dsi.yaml
> 

Reviewed-by: Rob Herring <robh@kernel.org>

