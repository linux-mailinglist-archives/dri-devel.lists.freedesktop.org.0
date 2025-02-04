Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B6E37A271EB
	for <lists+dri-devel@lfdr.de>; Tue,  4 Feb 2025 13:40:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0A71B10E330;
	Tue,  4 Feb 2025 12:40:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="UWmgAvNQ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7964510E330
 for <dri-devel@lists.freedesktop.org>; Tue,  4 Feb 2025 12:40:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1738672815;
 bh=1PDp2WlZu6IqKiEMkFkB1f2lJPaUATGjxKu+MBdRSg4=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
 b=UWmgAvNQbIvH3JBPouUxdANztFGheO9xh3ifAxP8lUHuiKkkwRdpLeRIvWHhM09VL
 u2OiTsZEA+rQbYOyBspKg54VzPRWDxh9FnNhLs+XsnKo0RoMC3tqBtBpg6Y43vw12T
 KIkngbAWl+LANkE6GaCS6tehh9ovig8KyYHRhTF9XgPdg1NA9J9YbO1UE5UZop7RF1
 FtgS0HFrBLwoPz47NfgK4iPeTfL5lT3gGPCqmmhVlpGaI0JroFfUe1KJhJXM5ZA6UJ
 ESvNvS+wH99tDZ/2lloIGF2/cKqxE7UyNoce3ch7FgfGhXAxF17oEIBqt9S/WaWKQf
 ZfNieCMtXS3TA==
Received: from localhost (unknown [188.27.43.189])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits)
 server-digest SHA256) (No client certificate requested)
 (Authenticated sender: cristicc)
 by bali.collaboradmins.com (Postfix) with UTF8SMTPSA id E7C8517E0E48;
 Tue,  4 Feb 2025 13:40:14 +0100 (CET)
From: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
Date: Tue, 04 Feb 2025 14:40:04 +0200
Subject: [PATCH v3 1/5] dt-bindings: display: vop2: Add optional PLL clock
 properties
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250204-vop2-hdmi0-disp-modes-v3-1-d71c6a196e58@collabora.com>
References: <20250204-vop2-hdmi0-disp-modes-v3-0-d71c6a196e58@collabora.com>
In-Reply-To: <20250204-vop2-hdmi0-disp-modes-v3-0-d71c6a196e58@collabora.com>
To: Sandy Huang <hjc@rock-chips.com>, 
 =?utf-8?q?Heiko_St=C3=BCbner?= <heiko@sntech.de>, 
 Andy Yan <andy.yan@rock-chips.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: kernel@collabora.com, dri-devel@lists.freedesktop.org, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.2
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

On RK3588, HDMI PHY PLL can be used as an alternative and more accurate
pixel clock source for VOP2 video ports 0, 1 and 2.

Document the optional PLL clock properties corresponding to the two HDMI
PHYs available on the SoC.

Acked-by: Rob Herring (Arm) <robh@kernel.org>
Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
---
 Documentation/devicetree/bindings/display/rockchip/rockchip-vop2.yaml | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/rockchip/rockchip-vop2.yaml b/Documentation/devicetree/bindings/display/rockchip/rockchip-vop2.yaml
index 2531726af306bd388c00c3c0a1785b2c7367e2bd..46d956e63338e196361483a668fbf5597ebce24f 100644
--- a/Documentation/devicetree/bindings/display/rockchip/rockchip-vop2.yaml
+++ b/Documentation/devicetree/bindings/display/rockchip/rockchip-vop2.yaml
@@ -53,6 +53,8 @@ properties:
       - description: Pixel clock for video port 2.
       - description: Pixel clock for video port 3.
       - description: Peripheral(vop grf/dsi) clock.
+      - description: Alternative pixel clock provided by HDMI0 PHY PLL.
+      - description: Alternative pixel clock provided by HDMI1 PHY PLL.
 
   clock-names:
     minItems: 5
@@ -64,6 +66,8 @@ properties:
       - const: dclk_vp2
       - const: dclk_vp3
       - const: pclk_vop
+      - const: pll_hdmiphy0
+      - const: pll_hdmiphy1
 
   rockchip,grf:
     $ref: /schemas/types.yaml#/definitions/phandle

-- 
2.48.1

