Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CA09A76A257
	for <lists+dri-devel@lfdr.de>; Mon, 31 Jul 2023 23:03:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ED5C410E2F9;
	Mon, 31 Jul 2023 21:03:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A076D10E2F0
 for <dri-devel@lists.freedesktop.org>; Mon, 31 Jul 2023 21:03:16 +0000 (UTC)
Received: from tr.lan (ip-86-49-120-218.bb.vodafone.cz [86.49.120.218])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 (Authenticated sender: marex@denx.de)
 by phobos.denx.de (Postfix) with ESMTPSA id 5558B865F4;
 Mon, 31 Jul 2023 23:03:14 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
 s=phobos-20191101; t=1690837394;
 bh=qm7MkE8bn7FEul6dKUD+pfTfZfV2jBAobBeBK3Yq6Fg=;
 h=From:To:Cc:Subject:Date:From;
 b=JRzr5ygoyxXPm46AiDyJqkRlNmh7zFtxH64UKwLvf+cOIl9SF6YG0PG404KkrLo8q
 /oR8RCFjL5q3V9nByGjO1a+nCfXABiUitZk68zutrQ5PF4fZ8VJq4p/MuFuUwg7657
 LPaZqTOdNg9eanZGJ9tRpkDwiSUuMZ0M/oy2LP0xToLq5kkmlLizWaxpUZK0un9/O2
 qEGPqK9BOZnXNcJ0jDwAH0kxmlmz4zhJw81XjBheEsIMLp+IwMBX014fwUXohjHfGh
 B2igC+OqvBKX9KIILuGugC5sAYSxIYyHRXAfOmAmfC/4im5B6s26bJEVZu7zx5FGN/
 +PO2xogLdR4PA==
From: Marek Vasut <marex@denx.de>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 1/2] dt-bindings: display: simple: Add Innolux G156HCE-L01
 panel
Date: Mon, 31 Jul 2023 23:02:57 +0200
Message-Id: <20230731210258.256152-1-marex@denx.de>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Virus-Scanned: clamav-milter 0.103.8 at phobos.denx.de
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
Cc: Marek Vasut <marex@denx.de>, Neil Armstrong <neil.armstrong@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org,
 Sam Ravnborg <sam@ravnborg.org>, Rob Herring <robh+dt@kernel.org>,
 Thierry Reding <thierry.reding@gmail.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add entry for Innolux G156HCE-L01 15.6" 1920x1080 24bpp
dual-link LVDS TFT panel. Documentation is available at [1].

[1] https://www.distec.de/fileadmin/pdf/produkte/TFT-Displays/Innolux/G156HCE-L01_Rev.C3_Datasheet.pdf

Signed-off-by: Marek Vasut <marex@denx.de>
---
Cc: Conor Dooley <conor+dt@kernel.org>
Cc: Daniel Vetter <daniel@ffwll.ch>
Cc: David Airlie <airlied@gmail.com>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc: Neil Armstrong <neil.armstrong@linaro.org>
Cc: Rob Herring <robh+dt@kernel.org>
Cc: Sam Ravnborg <sam@ravnborg.org>
Cc: Thierry Reding <thierry.reding@gmail.com>
Cc: devicetree@vger.kernel.org
Cc: dri-devel@lists.freedesktop.org
---
 .../devicetree/bindings/display/panel/panel-simple.yaml         | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/panel/panel-simple.yaml b/Documentation/devicetree/bindings/display/panel/panel-simple.yaml
index 1751ad56b158c..25b4589d4a581 100644
--- a/Documentation/devicetree/bindings/display/panel/panel-simple.yaml
+++ b/Documentation/devicetree/bindings/display/panel/panel-simple.yaml
@@ -192,6 +192,8 @@ properties:
       - innolux,n116bge
         # InnoLux 13.3" FHD (1920x1080) eDP TFT LCD panel
       - innolux,n125hce-gn1
+        # InnoLux 15.6" FHD (1920x1080) TFT LCD panel
+      - innolux,g156hce-l01
         # InnoLux 15.6" WXGA TFT LCD panel
       - innolux,n156bge-l21
         # Innolux P120ZDG-BF1 12.02 inch eDP 2K display panel
-- 
2.40.1

