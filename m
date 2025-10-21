Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 64C30BF47D2
	for <lists+dri-devel@lfdr.de>; Tue, 21 Oct 2025 05:18:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5F57110E569;
	Tue, 21 Oct 2025 03:18:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="D8BRnaHa";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B63CC10E2BB;
 Tue, 21 Oct 2025 03:18:29 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id D1D1062261;
 Tue, 21 Oct 2025 03:18:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 38962C116C6;
 Tue, 21 Oct 2025 03:18:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1761016708;
 bh=AyEoq06UmSlAoFte/+Fwyk+I/YJMnS1FByQY6PQGBqg=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
 b=D8BRnaHaH+/q/pVRlRN7V97YFBuefPqbn7INDy2cL14G44VWDhQ+YApWSxyEnRT4T
 HWlMoEcr7B8LktOk6/Xyz7AHdglt66m9twZy9/8GfbkqtTvN6YJdH2+tTnPCQicYmO
 X9r+5oPGxnHnJ/r/Psq8zmY+yx7wijP+md+yHi3HhZEvXYLcVIzHqBtWpOk8JE7Jox
 xp5X7WsetecCWG5o3G3fXBJJRpBUarLpzHfxumrssLf173vsWnZSfopwhe2GrgeV9B
 ujNMq5Ol0yTCQI0RMRUst5AGsI57ulcAtg7NrGKXUoiexxjFmjtA8Lpc5pjxdARGem
 1hXgXIQTFFd6Q==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by smtp.lore.kernel.org (Postfix) with ESMTP id 2004CCCD19F;
 Tue, 21 Oct 2025 03:18:28 +0000 (UTC)
From: Xiangxu Yin via B4 Relay
 <devnull+xiangxu.yin.oss.qualcomm.com@kernel.org>
Date: Tue, 21 Oct 2025 11:18:07 +0800
Subject: [PATCH v5 1/3] dt-bindings: display/msm: Add SM6150 DisplayPort
 controller
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251021-add-displayport-support-to-qcs615-devicetree-v5-1-92f0f3bf469f@oss.qualcomm.com>
References: <20251021-add-displayport-support-to-qcs615-devicetree-v5-0-92f0f3bf469f@oss.qualcomm.com>
In-Reply-To: <20251021-add-displayport-support-to-qcs615-devicetree-v5-0-92f0f3bf469f@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>, 
 Dmitry Baryshkov <lumag@kernel.org>, 
 Abhinav Kumar <abhinav.kumar@linux.dev>, 
 Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, fange.zhang@oss.qualcomm.com, 
 yongxing.mou@oss.qualcomm.com, li.liu@oss.qualcomm.com, 
 Xiangxu Yin <xiangxu.yin@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1761016706; l=1749;
 i=xiangxu.yin@oss.qualcomm.com; s=20241125; h=from:subject:message-id;
 bh=5q4VY4AxMxoxRYlMMxkanyBrW8rzVGP+XpBRBHIdMhQ=;
 b=4CsjSrgWE1wTojAbdjr4MvVEb6BBxDpTLB8JsHssBzFCZJqkKMD6a06nWD70SO7oydhKtQ5Cn
 506q5Cpx7EfB6G5HFfDpaR1nE5svQZUY7kPX5dS+uZIQAtzxkrrZ3N7
X-Developer-Key: i=xiangxu.yin@oss.qualcomm.com; a=ed25519;
 pk=F1TwipJzpywfbt3n/RPi4l/A4AVF+QC89XzCHgZYaOc=
X-Endpoint-Received: by B4 Relay for xiangxu.yin@oss.qualcomm.com/20241125
 with auth_id=542
X-Original-From: Xiangxu Yin <xiangxu.yin@oss.qualcomm.com>
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
Reply-To: xiangxu.yin@oss.qualcomm.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Xiangxu Yin <xiangxu.yin@oss.qualcomm.com>

SM6150 uses the same DisplayPort controller as SM8150, which is already
compatible with SM8350. Add the SM6150-specific compatible string and
update the binding example accordingly.

Signed-off-by: Xiangxu Yin <xiangxu.yin@oss.qualcomm.com>
---
 .../devicetree/bindings/display/msm/qcom,sm6150-mdss.yaml   | 13 ++++++++++++-
 1 file changed, 12 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/display/msm/qcom,sm6150-mdss.yaml b/Documentation/devicetree/bindings/display/msm/qcom,sm6150-mdss.yaml
index 9ac24f99d3ada1c197c9654dc9babebccae972ed..89852af70de97a9025079107b838de578778c049 100644
--- a/Documentation/devicetree/bindings/display/msm/qcom,sm6150-mdss.yaml
+++ b/Documentation/devicetree/bindings/display/msm/qcom,sm6150-mdss.yaml
@@ -51,6 +51,16 @@ patternProperties:
       compatible:
         const: qcom,sm6150-dpu
 
+  "^displayport-controller@[0-9a-f]+$":
+    type: object
+    additionalProperties: true
+    properties:
+      compatible:
+        items:
+          - const: qcom,sm6150-dp
+          - const: qcom,sm8150-dp
+          - const: qcom,sm8350-dp
+
   "^dsi@[0-9a-f]+$":
     type: object
     additionalProperties: true
@@ -132,13 +142,14 @@ examples:
                 port@0 {
                   reg = <0>;
                   dpu_intf0_out: endpoint {
+                    remote-endpoint = <&mdss_dp0_in>;
                   };
                 };
 
                 port@1 {
                   reg = <1>;
                   dpu_intf1_out: endpoint {
-                      remote-endpoint = <&mdss_dsi0_in>;
+                    remote-endpoint = <&mdss_dsi0_in>;
                   };
                 };
             };

-- 
2.34.1


