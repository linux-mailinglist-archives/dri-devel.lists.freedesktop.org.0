Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B40D4C6033
	for <lists+dri-devel@lfdr.de>; Mon, 28 Feb 2022 01:46:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 97C3C10E225;
	Mon, 28 Feb 2022 00:46:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5922210E21C
 for <dri-devel@lists.freedesktop.org>; Mon, 28 Feb 2022 00:46:43 +0000 (UTC)
Received: from tr.lan (ip-89-176-112-137.net.upcbroadband.cz [89.176.112.137])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 (Authenticated sender: marex@denx.de)
 by phobos.denx.de (Postfix) with ESMTPSA id CC234838FD;
 Mon, 28 Feb 2022 01:46:40 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
 s=phobos-20191101; t=1646009201;
 bh=6ucLCp5bAAtjqokyTODJTnHUYRUAgzR7q0kvgQ5ximw=;
 h=From:To:Cc:Subject:Date:From;
 b=VxOI2nWo6RO+XpJNkpXA/8dDuXYFPe8a9CVoW5v29k1JX5894Qjzc8mCZvrEZSUSF
 9++rfiltoJoTIlSOtjglQ6pc0ybpoVT+LiSFHwPUNwbS3TNiCwraH2KikvUVGSSsgP
 QT8ZQqqdZQI4ODKIQ1+UlicrQ3goBrb1HkiUcB15TFUfWmN/lKMY6cBVJF6hu2Mt6J
 xfxbNSa/yYqQ9p0B7GJHapiNYZyGTGxsvENgPgjoE44J34XnjqaEP76TKwVh+hxV19
 C2I3JADEQ9grgUEq5zslAKE6Lal868kAhW+KoKHGBArm//etAyQ61QUkErOMfPByNe
 dSTllAtl/znpA==
From: Marek Vasut <marex@denx.de>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 1/9] dt-bindings: mxsfb: Add compatible for i.MX8MP
Date: Mon, 28 Feb 2022 01:45:57 +0100
Message-Id: <20220228004605.367040-1-marex@denx.de>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Virus-Scanned: clamav-milter 0.103.5 at phobos.denx.de
X-Virus-Status: Clean
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
Cc: Marek Vasut <marex@denx.de>, devicetree@vger.kernel.org,
 Peng Fan <peng.fan@nxp.com>, Alexander Stein <alexander.stein@ew.tq-group.com>,
 Rob Herring <robh+dt@kernel.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Robby Cai <robby.cai@nxp.com>, Sam Ravnborg <sam@ravnborg.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add compatible string for i.MX8MP LCDIF variant. This is called LCDIFv3
and is completely different from the LCDIFv3 found in i.MX23 in that it
has a completely scrambled register layout compared to all previous LCDIF
variants. The new LCDIFv3 also supports 36bit address space. However,
except for the complete bit reshuffling, this is still LCDIF and it still
works like one.

Signed-off-by: Marek Vasut <marex@denx.de>
Cc: Alexander Stein <alexander.stein@ew.tq-group.com>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Lucas Stach <l.stach@pengutronix.de>
Cc: Peng Fan <peng.fan@nxp.com>
Cc: Rob Herring <robh+dt@kernel.org>
Cc: Robby Cai <robby.cai@nxp.com>
Cc: Sam Ravnborg <sam@ravnborg.org>
Cc: Stefan Agner <stefan@agner.ch>
Cc: devicetree@vger.kernel.org
---
 Documentation/devicetree/bindings/display/fsl,lcdif.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/display/fsl,lcdif.yaml b/Documentation/devicetree/bindings/display/fsl,lcdif.yaml
index 900a56cae80e6..9831ab53a053d 100644
--- a/Documentation/devicetree/bindings/display/fsl,lcdif.yaml
+++ b/Documentation/devicetree/bindings/display/fsl,lcdif.yaml
@@ -28,6 +28,7 @@ properties:
               - fsl,imx7d-lcdif
               - fsl,imx8mm-lcdif
               - fsl,imx8mn-lcdif
+              - fsl,imx8mp-lcdif
               - fsl,imx8mq-lcdif
           - const: fsl,imx6sx-lcdif
 
-- 
2.34.1

