Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 43C54847C32
	for <lists+dri-devel@lfdr.de>; Fri,  2 Feb 2024 23:23:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3758010E8E0;
	Fri,  2 Feb 2024 22:23:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="pZcZF5FC";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C8CFB10E0C0;
 Fri,  2 Feb 2024 22:23:50 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id D0C9D628C1;
 Fri,  2 Feb 2024 22:23:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 55A36C433F1;
 Fri,  2 Feb 2024 22:23:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1706912626;
 bh=i6HTJL8JbdO5UqIMmgRXK3anSEPC7g7b+u7MrObSAV8=;
 h=From:To:Cc:Subject:Date:From;
 b=pZcZF5FCtJ5ITHsbrc3oU/pZ0o6uEqFEBROR5ZSS91loikQQ9by3Xuq3vvw/Dx0Qk
 dIBlokjekYfIQNlM+9iY/XUdDf14tQ/7EvM2IeH3Vuj/p5hhcvMDCX/B9SVOwoijOe
 XdQGQwWbj9DV+27iULWTVMGn5/a67cOwrOcaer1G3s2Ah4yzfrAHxZPwHdaWxB5liW
 AyJm9looJMfG51bpg1nO6Dwl+eWbyRDNKA4MA4c2PG6VGTOFYCRN6xxODl6Dx/hUWY
 rEAUasy0h+CiOrUQCAokDSPGsa29MMC9EHH37jq9mcT4tRZs9NvLD7bcZfV3OK7mYd
 d2zBYRv1d47Ug==
From: Rob Herring <robh@kernel.org>
To: Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH] dt-bindings: display: msm: sm8650-mdss: Add missing explicit
 "additionalProperties"
Date: Fri,  2 Feb 2024 16:23:37 -0600
Message-ID: <20240202222338.1652333-1-robh@kernel.org>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

In order to check schemas for missing additionalProperties or
unevaluatedProperties, cases allowing extra properties must be explicit.

Signed-off-by: Rob Herring <robh@kernel.org>
---
 .../devicetree/bindings/display/msm/qcom,sm8650-mdss.yaml     | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/msm/qcom,sm8650-mdss.yaml b/Documentation/devicetree/bindings/display/msm/qcom,sm8650-mdss.yaml
index bd11119dc93d..24cece1e888b 100644
--- a/Documentation/devicetree/bindings/display/msm/qcom,sm8650-mdss.yaml
+++ b/Documentation/devicetree/bindings/display/msm/qcom,sm8650-mdss.yaml
@@ -37,18 +37,21 @@ properties:
 patternProperties:
   "^display-controller@[0-9a-f]+$":
     type: object
+    additionalProperties: true
     properties:
       compatible:
         const: qcom,sm8650-dpu
 
   "^displayport-controller@[0-9a-f]+$":
     type: object
+    additionalProperties: true
     properties:
       compatible:
         const: qcom,sm8650-dp
 
   "^dsi@[0-9a-f]+$":
     type: object
+    additionalProperties: true
     properties:
       compatible:
         items:
@@ -57,6 +60,7 @@ patternProperties:
 
   "^phy@[0-9a-f]+$":
     type: object
+    additionalProperties: true
     properties:
       compatible:
         const: qcom,sm8650-dsi-phy-4nm
-- 
2.43.0

