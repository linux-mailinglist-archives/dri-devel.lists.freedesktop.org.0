Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CC333C8709D
	for <lists+dri-devel@lfdr.de>; Tue, 25 Nov 2025 21:29:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D1FEF10E463;
	Tue, 25 Nov 2025 20:29:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="ALARG1TR";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DEE8189823
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Nov 2025 20:29:40 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 821C344469;
 Tue, 25 Nov 2025 20:29:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 41E64C16AAE;
 Tue, 25 Nov 2025 20:29:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1764102580;
 bh=57iFOlJjHz5ySUzY0KG71UVGjXVyk+k7qQ/D/GZ+w9Q=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
 b=ALARG1TRG9czMdZsHKmrdix52spMY3jRCtJCl9fpJXTHJKJZSy/gq6zrj093l+MHa
 l37xc8CrqtegACZ+2XUcdJlEbm42Al3xl/C39ZJUXrMVH5LKGX8342lHGoSKV2eagQ
 LB8ElAeQnXfbt6hr+r2eJcTG1Stl9tLW0QUiqGLN/KBF4CASytoHKjRwr4Qaaxuufi
 UCsT7njIF4onVazOoli4CgU5y5pWXSDfhcRgV1W9r/CjfRES7lRTsQ+btnvhY5Y2e2
 a63vy2gLc7xMG9+z2uqR9aAZUB8ZVIY1Q0QTJ09vNlTeC+k73QO9P6mJy4qspJ3997
 GVRORdNh3uljQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by smtp.lore.kernel.org (Postfix) with ESMTP id 2BB8ED0EE25;
 Tue, 25 Nov 2025 20:29:40 +0000 (UTC)
From: David Heidelberg via B4 Relay <devnull+david.ixit.cz@kernel.org>
Date: Tue, 25 Nov 2025 21:29:37 +0100
Subject: [PATCH v4 2/8] dt-bindings: panel: sw43408: adjust to reflect the
 DDIC and panel used
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251125-pixel-3-v4-2-3b706f8dcc96@ixit.cz>
References: <20251125-pixel-3-v4-0-3b706f8dcc96@ixit.cz>
In-Reply-To: <20251125-pixel-3-v4-0-3b706f8dcc96@ixit.cz>
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
 Dmitry Baryshkov <lumag@kernel.org>, Vinod Koul <vkoul@kernel.org>
Cc: phodina@protonmail.com, linux-arm-msm@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 phone-devel@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 David Heidelberg <david@ixit.cz>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1875; i=david@ixit.cz;
 h=from:subject:message-id;
 bh=NUtDhdxgm27JmLpy0LMIV+8SFYDHd5eqrKtd8gdhaI0=;
 b=owEBbQKS/ZANAwAIAWACP8TTSSByAcsmYgBpJhGxa2kozTUZUMHAbh33k98FWegntz/YxT2q8
 RDgtZMm88WJAjMEAAEIAB0WIQTXegnP7twrvVOnBHRgAj/E00kgcgUCaSYRsQAKCRBgAj/E00kg
 cql0EACzbJ7MRU5M/6U505fHRfvpRGxyfS9ImojQvXzjptKh6eHWy8N6ojZ50qxeoUMEE+XK6TE
 FEQYLma4Rj0pmaIJmwuI/J9+LuJ+wROdCMyG4f1GK2PZJwivSO5n+YdJX0XEbh9pm/NrAQ4xtIt
 YZNW5SIOGwG3jsw8Wo6jMPdHzmDv0qqtuku91wtwPAPSRtBgZK6tANumSRPKsVG7BJ8IMyYPP62
 m+Lc2DskktcooHk6y8gTAJs00BLLziJWCSw+RnLx2dj892Nor1S4I9+qoUKV5iKl4YCVMTLwqry
 awR9Ch1fIIZo54cIq2PhsDIYsY6cUzpVocf6rA/RZ4LYRuyAVJncxE0BEP9xW6mMqVk3V9UArfx
 8qZBgQwKRNLOzOMEtHE3n0X0eWuKEkSVXdG0PaC8fBa3mDLc0umYtIlLxcKktVp0kCiHofBX6hl
 F/9J+POci51fxUaSCtmVroAIITkzzuFBDMY+2mpavahYndEoIQPe13/uj/SJoHM//M8b52X6RJE
 +wRmELkKGZrHujsaBJxe32+ado4rW8qA7tOwtjIek+pm6ib5sTnlcRZAp7cDyHREUnx2Bi49VkI
 LQRG/cIetrMjrSXVRURsISnMTnL0LauA8GWAJorF4saXLUFEumaOJDKK7yfDYHJPZAqc0yYAYYd
 41r+0fSUKOs+x0w==
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


