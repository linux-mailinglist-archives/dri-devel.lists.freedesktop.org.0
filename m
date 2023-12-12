Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CA6D80F531
	for <lists+dri-devel@lfdr.de>; Tue, 12 Dec 2023 19:04:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9672810E67D;
	Tue, 12 Dec 2023 18:04:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 602 seconds by postgrey-1.36 at gabe;
 Tue, 12 Dec 2023 18:04:10 UTC
Received: from ixit.cz (ip-89-177-23-149.bb.vodafone.cz [89.177.23.149])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 02D0510E67D
 for <dri-devel@lists.freedesktop.org>; Tue, 12 Dec 2023 18:04:09 +0000 (UTC)
Received: from newone.lan (unknown [10.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by ixit.cz (Postfix) with ESMTPSA id C9286161C8C;
 Tue, 12 Dec 2023 18:54:04 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ixit.cz; s=dkim;
 t=1702403644;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=iYhjaphvNqnVlAhFqF/LeOGnoaEb4owq0uizq77WO/M=;
 b=PhgIWhx1iic7CBvWOiUxB1wZrHR/riTOrlhttDm5W5gTNc40IFERi5rD4zQgx06fSVbTHu
 y9+aclW/TYEVVU0MH+kzqzGbbE7x/il+ZlAoqtBgE4LmurUlJmR0tyF0EJ+0YAxLzAFv2U
 R7fphozYP9OlKz7HRC+vqikIxbDEJN4=
From: David Heidelberg <david@ixit.cz>
To: Neil Armstrong <neil.armstrong@linaro.org>,
 Jessica Zhang <quic_jesszhan@quicinc.com>, Sam Ravnborg <sam@ravnborg.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Thierry Reding <thierry.reding@gmail.com>
Subject: [PATCH] dt-bindings: panel-simple-dsi: move LG 5" HD TFT LCD panel
 into DSI yaml
Date: Tue, 12 Dec 2023 18:53:25 +0100
Message-ID: <20231212175356.72062-1-david@ixit.cz>
X-Mailer: git-send-email 2.43.0
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
Cc: devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
 David Heidelberg <david@ixit.cz>, linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Originally was in the panel-simple, but belongs to panel-simple-dsi.

See arch/arm/boot/dts/nvidia/tegra114-roth.dts for more details.

Fixes:
```
arch/arm/boot/dts/tegra114-roth.dt.yaml: panel@0: 'reg' does not match any of the regexes: 'pinctrl-[0-9]+'
        From schema: Documentation/devicetree/bindings/display/panel/panel-simple.yaml
```

Signed-off-by: David Heidelberg <david@ixit.cz>
---
 .../devicetree/bindings/display/panel/panel-simple-dsi.yaml     | 2 ++
 .../devicetree/bindings/display/panel/panel-simple.yaml         | 2 --
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/display/panel/panel-simple-dsi.yaml b/Documentation/devicetree/bindings/display/panel/panel-simple-dsi.yaml
index 73674baea75d..f9160d7bac3c 100644
--- a/Documentation/devicetree/bindings/display/panel/panel-simple-dsi.yaml
+++ b/Documentation/devicetree/bindings/display/panel/panel-simple-dsi.yaml
@@ -42,6 +42,8 @@ properties:
       - lg,acx467akm-7
         # LG Corporation 7" WXGA TFT LCD panel
       - lg,ld070wx3-sl01
+        # LG Corporation 5" HD TFT LCD panel
+      - lg,lh500wx1-sd03
         # One Stop Displays OSD101T2587-53TS 10.1" 1920x1200 panel
       - osddisplays,osd101t2587-53ts
         # Panasonic 10" WUXGA TFT LCD panel
diff --git a/Documentation/devicetree/bindings/display/panel/panel-simple.yaml b/Documentation/devicetree/bindings/display/panel/panel-simple.yaml
index 2021aa82871a..634a10c6f2dd 100644
--- a/Documentation/devicetree/bindings/display/panel/panel-simple.yaml
+++ b/Documentation/devicetree/bindings/display/panel/panel-simple.yaml
@@ -212,8 +212,6 @@ properties:
       - lemaker,bl035-rgb-002
         # LG 7" (800x480 pixels) TFT LCD panel
       - lg,lb070wv8
-        # LG Corporation 5" HD TFT LCD panel
-      - lg,lh500wx1-sd03
         # LG LP079QX1-SP0V 7.9" (1536x2048 pixels) TFT LCD panel
       - lg,lp079qx1-sp0v
         # LG 9.7" (2048x1536 pixels) TFT LCD panel
-- 
2.43.0

