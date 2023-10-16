Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B7047CA46C
	for <lists+dri-devel@lfdr.de>; Mon, 16 Oct 2023 11:42:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 323E210E17C;
	Mon, 16 Oct 2023 09:42:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4A37C10E177
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Oct 2023 09:42:16 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 9FA7C60ACE;
 Mon, 16 Oct 2023 09:42:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CB327C433C8;
 Mon, 16 Oct 2023 09:42:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1697449335;
 bh=1I7dIX7GqvLMEA2fUJIzQxzuYe7pwiH/zksIhIJbzKY=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=O46nt9Z5kLfZ/tmbUT2RnKqug8FypN/I1SAQ0LGt4hMHOz5FwMe6B32iPr2WVwpOe
 numa1CDNR/IKeSY1+1a2cKRhcPtyqNByqLDLMm1qX+3MzT12UE2Z6ZDJL4OTBFeuB9
 JCYW0FVo5nO+37tD5jogG3tWwZusWbpa9aejHSomcki3eOBOUA4fIdMujZKZNRroqu
 761J/wnGI1xSToYuWpHHx5zAAHOE8e9PbteLUiGIaKXBbDXK6lMHXYtuczhL8TL7vm
 vWKNM9T4X4xrusTsU3a8I2QSFwZ/yVmJ4G4uzL/Ry06SyFs/wqe7QLQQiiPuro3iEU
 WNn+p9kIPT9Hw==
From: Robert Foss <rfoss@kernel.org>
To: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, Liu Ying <victor.liu@nxp.com>
In-Reply-To: <20230821034008.3876938-1-victor.liu@nxp.com>
References: <20230821034008.3876938-1-victor.liu@nxp.com>
Subject: Re: [PATCH v3 RESEND 0/9] drm/bridge: imx: Add i.MX93 MIPI DSI support
Message-Id: <169744932839.577518.15289591083022609443.b4-ty@kernel.org>
Date: Mon, 16 Oct 2023 11:42:08 +0200
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.10.1
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
Cc: krzysztof.kozlowski+dt@linaro.org, alexander.stein@ew.tq-group.com,
 Laurent.pinchart@ideasonboard.com, andrzej.hajda@intel.com, zyw@rock-chips.com,
 sam@ravnborg.org, jonas@kwiboo.se, jernej.skrabec@gmail.com,
 jagan@amarulasolutions.com, linux-imx@nxp.com, conor+dt@kernel.org,
 kernel@pengutronix.de, raphael.gallais-pou@foss.st.com, s.hauer@pengutronix.de,
 robh+dt@kernel.org, neil.armstrong@linaro.org, yannick.fertre@foss.st.com,
 hjc@rock-chips.com, philippe.cornu@foss.st.com, shawnguo@kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, 21 Aug 2023 11:39:59 +0800, Liu Ying wrote:
> This series aims to add MIPI DSI support for Freescale i.MX93 SoC.
> 
> There is a Synopsys DesignWare MIPI DSI host controller and a Synopsys
> Designware MIPI DPHY embedded in i.MX93.  Some configurations and
> extensions to them are controlled by i.MX93 media blk-ctrl.
> 
> Add a DRM bridge for i.MX93 MIPI DSI by using existing DW MIPI DSI
> bridge helpers and implementing i.MX93 MIPI DSI specific extensions.
> 
> [...]

Applied, thanks!

[1/9] drm/bridge: synopsys: dw-mipi-dsi: Add dw_mipi_dsi_get_bridge() helper
      https://cgit.freedesktop.org/drm/drm-misc/commit/?id=ec20c510ee2d
[2/9] drm/bridge: synopsys: dw-mipi-dsi: Add input bus format negotiation support
      https://cgit.freedesktop.org/drm/drm-misc/commit/?id=0de852d4c23a
[3/9] drm/bridge: synopsys: dw-mipi-dsi: Force input bus flags
      https://cgit.freedesktop.org/drm/drm-misc/commit/?id=d5116fb29dc0
[4/9] drm/bridge: synopsys: dw-mipi-dsi: Add mode fixup support
      https://cgit.freedesktop.org/drm/drm-misc/commit/?id=5a67ec8c64ec
[5/9] drm/bridge: synopsys: dw-mipi-dsi: Use pixel clock rate to calculate lbcc
      https://cgit.freedesktop.org/drm/drm-misc/commit/?id=ac87d23694f4
[6/9] drm/bridge: synopsys: dw-mipi-dsi: Set minimum lane byte clock cycles for HSA and HBP
      https://cgit.freedesktop.org/drm/drm-misc/commit/?id=d22e9a6df2db
[7/9] drm/bridge: synopsys: dw-mipi-dsi: Disable HSTX and LPRX timeout check
      https://cgit.freedesktop.org/drm/drm-misc/commit/?id=743bf594a3b1
[8/9] dt-bindings: display: bridge: Document Freescale i.MX93 MIPI DSI
      https://cgit.freedesktop.org/drm/drm-misc/commit/?id=db95a55ccec7
[9/9] drm/bridge: imx: Add i.MX93 MIPI DSI support
      https://cgit.freedesktop.org/drm/drm-misc/commit/?id=ce62f8ea7e3f



Rob

