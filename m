Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2681CCAA6E0
	for <lists+dri-devel@lfdr.de>; Sat, 06 Dec 2025 14:34:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5076D10E138;
	Sat,  6 Dec 2025 13:34:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="YWI11iTk";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7350710E138
 for <dri-devel@lists.freedesktop.org>; Sat,  6 Dec 2025 13:34:44 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 8C35960151;
 Sat,  6 Dec 2025 13:34:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 0A7ADC113D0;
 Sat,  6 Dec 2025 13:34:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1765028083;
 bh=P6JIG7+hx3GfFzXJ3PaLVXgbb5QcMZmiNNwqLuWL2lE=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
 b=YWI11iTk1662lrlgI3+m/oF0fJJGm8s8rl1TK+lLiSUA8HxTLGsvLOgtngpaDnNEz
 8BGor78liJI80GP9zx8tuzFot2/SQmPiH/EP9s7ChElKxlybWNmAHwElsRg/txtR13
 XUiEZ8RT+CfULc2yDWeab3F9vUKkpFEwznNqbUrcGq6lfgMx0PbbGaBsKbcQylSGi3
 EmxISxYQCsBP3qe9PRPeAf8nSfRugux8vWXN5Jc0S0cvu0kkJ+JIrwZ1vAAWL18eT3
 ljV9I2/3QSnuI8Y6eNw94xyIhF7Hv4/9xXaOOqDftALOWuekjHaPfIaNzKsY2vxymh
 iiD1QfLsvE+EQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by smtp.lore.kernel.org (Postfix) with ESMTP id ED9D9D3B7D7;
 Sat,  6 Dec 2025 13:34:42 +0000 (UTC)
From: David Heidelberg via B4 Relay <devnull+david.ixit.cz@kernel.org>
Date: Sat, 06 Dec 2025 14:34:19 +0100
Subject: [PATCH v5 2/8] dt-bindings: panel: sw43408: adjust to reflect the
 DDIC and panel used
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251206-pixel-3-v5-2-dc99732e7d35@ixit.cz>
References: <20251206-pixel-3-v5-0-dc99732e7d35@ixit.cz>
In-Reply-To: <20251206-pixel-3-v5-0-dc99732e7d35@ixit.cz>
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
 b=owEBbQKS/ZANAwAIAWACP8TTSSByAcsmYgBpNDDwvDaR+m+QhyrgquOXDdM2avUtPyLdimLfW
 Ah8GO3lqxCJAjMEAAEIAB0WIQTXegnP7twrvVOnBHRgAj/E00kgcgUCaTQw8AAKCRBgAj/E00kg
 cvbID/0dhkZmu6IKOX/8vMpiK4EW/pxZfDdWH6Xl3GHgtOUlwVA7n7KVp8NCBvrKFzLw5DXb+eQ
 UgtZRmkMFLANxh8lT+JesNImudWnbE2YD+ugaz/qAnwnO1AfYdZNR+PZAzGnJlo+a24aJqj8e+x
 oczJr6qNI/BgtPEGfPXjWBDkyTZ2gMHeA7hdtbcDmBFMPs/krIj2OHesE2kMHsI1SXWinwJQDZx
 56YciqFiUea7HhcSJebXfpmk895bkbd+H7paXSb4y5J+VW+Z/d1/u4SR//StqHxqmdSJ7aUmApT
 49tnRHtHVoL1b32uBEDHXrm7MwJqH1pzrbU8TmDR3cFkW8fSyMTasyZ9DCkZModoSljgohFtB1K
 KMiUR+XgDMRPdBUEoZT+XvZXgfp1XuJODqo1Gr0iDoU5pj81iey5zs8k4DCKB/yDHJrfIsiY0y7
 oqNX7E4tiPocA953o6HsZEQ0VgPM4F8Jxg6rLqasniXnAouFHJOVlR6HPn6ItHkJo1wSM/giV96
 O805CINM5pmjJYB7Otrnri6tZ6AOXnt34l3x0t2f/x7CW7LeLnpSNz6zwhVDsi5qR7IA/9LaOhj
 qdNwyeqdg00IYowOEfdnyHBauwNalC49327BTqNLZxzMY0IRIbwMQTV/wo69RPC9pz8/+z48nsz
 nhema7e/ODkJ8eg==
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


