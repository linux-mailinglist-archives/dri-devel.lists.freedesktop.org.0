Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B972CBBBD6
	for <lists+dri-devel@lfdr.de>; Sun, 14 Dec 2025 15:51:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C364D10E4A5;
	Sun, 14 Dec 2025 14:51:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="R2SSz347";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2A08410E4A1
 for <dri-devel@lists.freedesktop.org>; Sun, 14 Dec 2025 14:51:25 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 6039744459;
 Sun, 14 Dec 2025 14:51:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id EA4F1C4AF0F;
 Sun, 14 Dec 2025 14:51:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1765723885;
 bh=P6JIG7+hx3GfFzXJ3PaLVXgbb5QcMZmiNNwqLuWL2lE=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
 b=R2SSz347OxKTzAPx8zyj0MJF7Yw5gBKJnmGcmEFVinAbkIO82uGMqcNOBcF3XWuyb
 7rzTGr6T2lnrtAQQXmbKnw9NnWGr8X0Q237O1jVR0js7vizxjhheYjYII5l9bRCmWr
 grO2cWC8EpLin6OVnGcuFmayoMA+XGp+TaArr3jk/tnboILzl36TOS6VlzVrzZzZAn
 irDWz2egUZvGTpGO/61tIATiFwGAGR/YcBF822/PnkthBPjuk0NT0wzN3lWQdDnVAd
 AxZRL1cRkIsFh0PUOqM9YbJJB//zHskhBx9xIcPyUMS10iDzbBoa108PreLSxAadr8
 XV481Fw6+WYQw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by smtp.lore.kernel.org (Postfix) with ESMTP id E0F7AD59D99;
 Sun, 14 Dec 2025 14:51:24 +0000 (UTC)
From: David Heidelberg via B4 Relay <devnull+david.ixit.cz@kernel.org>
Date: Sun, 14 Dec 2025 15:51:18 +0100
Subject: [PATCH v7 2/8] dt-bindings: panel: sw43408: adjust to reflect the
 DDIC and panel used
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251214-pixel-3-v7-2-b1c0cf6f224d@ixit.cz>
References: <20251214-pixel-3-v7-0-b1c0cf6f224d@ixit.cz>
In-Reply-To: <20251214-pixel-3-v7-0-b1c0cf6f224d@ixit.cz>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Sumit Semwal <sumit.semwal@linaro.org>, 
 Casey Connolly <casey.connolly@linaro.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Jessica Zhang <jesszhan0024@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 Dmitry Baryshkov <lumag@kernel.org>, Vinod Koul <vkoul@kernel.org>, 
 Petr Hodina <phodina@protonmail.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, phone-devel@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, David Heidelberg <david@ixit.cz>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1948; i=david@ixit.cz;
 h=from:subject:message-id;
 bh=YFbMU07Wu5FnvTw9LCEYZ4TnpCBRf84TLv0leteBovM=;
 b=owEBbQKS/ZANAwAIAWACP8TTSSByAcsmYgBpPs7pHn9J6iCqBCdtD8yewwLBpfudJ4RJP++xB
 59hQduA39+JAjMEAAEIAB0WIQTXegnP7twrvVOnBHRgAj/E00kgcgUCaT7O6QAKCRBgAj/E00kg
 cpZKD/9PH8dDTDkpIg9K/Ku80OQ7/JGvd1yAdL5NrW/VSu14lqUowYNik7JbHpgMx+uiRZZ1Y+e
 N+tTwgRxJxGM9p6AnScv7K+p4SHh+YJJ2BHjJJCCi0HCFLXItb9J1MPmwSz1LgYC7xd6v70HPZ1
 adtBFognWX6FiP1Cp2xUpga6yT/ufLzNAiv601rPL2ykPuQsJobI2vPiEnxRzYVohVuJ9OB4lJ/
 Wi9hcyxXKejNhRS6C5YaX8U1upG2YV8m3PPbtaD4aR1Rj5sQL7FFVnAjBqxCqsECPD6QrSZFt18
 Ij8rilGiXR0FjyGAW+s9jnXJoC6D5UtkkkJ90vXGd9VH+MEzUu7UvFT5KhADt5LUdKUu4Z1T8SI
 Tarz4xtvsBen2X40SotwdygUaOAUqpMID58qFAGJP8WOzBBvXYd9cgpqdcxL1e1lGTCqQw3tAE4
 MYEEjUr/ZJo16wvuTHrXB5Jxhre9Z0C8J/q7Agw2VcoHNfVpKF3mMjtMzb3hQa3LHHFvR5fnQU8
 DDcliAJ6dZ5msma+z/G8nibryNVpz+yd0sxYXBU2Qvg9z6bQ5M48lOOBfv4OzMh9yFPdWJfeVJG
 QCpu3aD4Y2tlyaV8Rw6EEaZNF7qe7+MV13TEcb3TXJjINUCDGJmA58Pw/gFYPTLafHejpeNUJ3B
 gUBckHN587ZOliQ==
X-Developer-Key: i=david@ixit.cz; a=openpgp;
 fpr=D77A09CFEEDC2BBD53A7047460023FC4D3492072
X-Endpoint-Received: by B4 Relay for david@ixit.cz/default with auth_id=355
X-Original-From: David Heidelberg <david@ixit.cz>
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
Reply-To: david@ixit.cz
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: David Heidelberg <david@ixit.cz>

Add compatible for used LG panel.
SW43408 is not panel, but DDIC. The panel itself is the
LG LH546WF1-ED01, so introduce combined compatible for it.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: David Heidelberg <david@ixit.cz>
---
 .../devicetree/bindings/display/panel/lg,sw43408.yaml       | 13 +++++++++----
 1 file changed, 9 insertions(+), 4 deletions(-)

diff --git a/Documentation/devicetree/bindings/display/panel/lg,sw43408.yaml b/Documentation/devicetree/bindings/display/panel/lg,sw43408.yaml
index 2219d3d4ac43b..f641efaeb8b36 100644
--- a/Documentation/devicetree/bindings/display/panel/lg,sw43408.yaml
+++ b/Documentation/devicetree/bindings/display/panel/lg,sw43408.yaml
@@ -4,14 +4,16 @@
 $id: http://devicetree.org/schemas/display/panel/lg,sw43408.yaml#
 $schema: http://devicetree.org/meta-schemas/core.yaml#
 
-title: LG SW43408 1080x2160 DSI panel
+title: LG SW43408 AMOLED DDIC
 
 maintainers:
   - Casey Connolly <casey.connolly@linaro.org>
 
 description:
-  This panel is used on the Pixel 3, it is a 60hz OLED panel which
-  required DSC (Display Stream Compression) and has rounded corners.
+  The SW43408 is display driver IC with connected panel.
+
+  LG LH546WF1-ED01 panel is used on the Pixel 3, it is a 60hz OLED panel
+  which required DSC (Display Stream Compression) and has rounded corners.
 
 allOf:
   - $ref: panel-common.yaml#
@@ -19,6 +21,9 @@ allOf:
 properties:
   compatible:
     items:
+      - enum:
+            # LG 5.46 inch, 1080x2160 pixels, 18:9 ratio
+          - lg,sw43408-lh546wf1-ed01
       - const: lg,sw43408
 
   reg:
@@ -46,7 +51,7 @@ examples:
         #size-cells = <0>;
 
         panel@0 {
-            compatible = "lg,sw43408";
+            compatible = "lg,sw43408-lh546wf1-ed01", "lg,sw43408";
             reg = <0>;
 
             vddi-supply = <&vreg_l14a_1p88>;

-- 
2.51.0


