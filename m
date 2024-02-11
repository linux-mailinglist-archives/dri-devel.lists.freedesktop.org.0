Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 38F0F8508C9
	for <lists+dri-devel@lfdr.de>; Sun, 11 Feb 2024 12:18:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D6A3510E619;
	Sun, 11 Feb 2024 11:18:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=atomide.com header.i=@atomide.com header.b="iAy0mQFZ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail5.25mail.st (mail5.25mail.st [74.50.62.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 57ACE10E619
 for <dri-devel@lists.freedesktop.org>; Sun, 11 Feb 2024 11:17:54 +0000 (UTC)
Received: from localhost (91-158-86-216.elisa-laajakaista.fi [91.158.86.216])
 by mail5.25mail.st (Postfix) with ESMTPSA id 53B2A60449;
 Sun, 11 Feb 2024 11:17:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=atomide.com;
 s=25mailst; t=1707650269;
 bh=yLjzK2gCGri+6ByZOSHWlqR7H2KPerqu58kNzMoTX80=;
 h=From:To:Cc:Subject:Date:From;
 b=iAy0mQFZ79f2OywUzrTveFxXrEurHGo5sc2Z/rx6j5yD+S/I1mK7W108bakKQZURg
 ucNnFccSQ4njMbW6C84Ip79Gw0dMRZpXlJ9+7U9/WYji8N1PfFeH2/pU3QtQt9VPsy
 kO7L8cf7nrBY/iB4ZkyqvUqxjTBXfJZRk4gxju/P309N55qdDigi+akcaKm0AYwA+a
 0vajas+yYfZUx7HLa+XlwCJmczq9nH05bklXyEYqzux4+0Su3WdsGxWKI2/jxiWBwG
 XZB4xAjWXZt07s5uwUzHp+5cFf+6kPy/CWQCUaIXPvee1Cmj19/Bqrkjd40mQThy+E
 oEfNgw4BkNBoA==
From: Tony Lindgren <tony@atomide.com>
To: Neil Armstrong <neil.armstrong@linaro.org>,
 Jessica Zhang <quic_jesszhan@quicinc.com>, Sam Ravnborg <sam@ravnborg.org>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Thierry Reding <thierry.reding@gmail.com>
Cc: Conor Dooley <conor.dooley@microchip.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org
Subject: [PATCH v2 1/2] dt-bindings: display: simple: Add boe,
 bp082wx1-100 8.2" panel
Date: Sun, 11 Feb 2024 13:16:58 +0200
Message-ID: <20240211111703.7567-1-tony@atomide.com>
X-Mailer: git-send-email 2.43.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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

This panel is found on Motorola mapphone tablets mz607 to mz609.

Acked-by: Conor Dooley <conor.dooley@microchip.com>
Signed-off-by: Tony Lindgren <tony@atomide.com>
---

No changes since v1

---
 .../devicetree/bindings/display/panel/panel-simple.yaml         | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/panel/panel-simple.yaml b/Documentation/devicetree/bindings/display/panel/panel-simple.yaml
--- a/Documentation/devicetree/bindings/display/panel/panel-simple.yaml
+++ b/Documentation/devicetree/bindings/display/panel/panel-simple.yaml
@@ -73,6 +73,8 @@ properties:
       - auo,t215hvn01
         # Shanghai AVIC Optoelectronics 7" 1024x600 color TFT-LCD panel
       - avic,tm070ddh03
+        # BOE BP082WX1-100 8.2" WXGA (1280x800) LVDS panel
+      - boe,bp082wx1-100
         # BOE BP101WX1-100 10.1" WXGA (1280x800) LVDS panel
       - boe,bp101wx1-100
         # BOE EV121WXM-N10-1850 12.1" WXGA (1280x800) TFT LCD panel
-- 
2.43.1
