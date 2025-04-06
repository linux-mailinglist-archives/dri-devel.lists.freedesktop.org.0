Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AE761A7D088
	for <lists+dri-devel@lfdr.de>; Sun,  6 Apr 2025 22:55:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A6A4B10E008;
	Sun,  6 Apr 2025 20:55:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=lucaweiss.eu header.i=@lucaweiss.eu header.b="fmXDOVdU";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ahti.lucaweiss.eu (ahti.lucaweiss.eu [128.199.32.197])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 06AA410E138
 for <dri-devel@lists.freedesktop.org>; Sun,  6 Apr 2025 20:55:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=lucaweiss.eu; s=s1;
 t=1743972926; bh=54KKEjad1+ij3E2hBLbA9dHHdBX4M8D7STWk9Y+wemo=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc;
 b=fmXDOVdULftlhuXvFyjVOcH93PJLsOdoXWXXqSUrjYfw0jq4btFgG9p+rnqYfSUOL
 GrJ4oSE0MzJGoiu46dQFsb1ppRRz4a+4iKyeqw2XErQMAJUNCfY2jMBTYPSzPTwlPK
 lVy2tOXek45Aw8gLOPsbEcrKSjeWIqKFc1fZ0L2A=
From: Luca Weiss <luca@lucaweiss.eu>
Date: Sun, 06 Apr 2025 22:55:03 +0200
Subject: [PATCH 1/2] dt-bindings: msm: qcom,mdss: Document interconnect paths
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250406-msm8953-interconnect-v1-1-a23e22e236e0@lucaweiss.eu>
References: <20250406-msm8953-interconnect-v1-0-a23e22e236e0@lucaweiss.eu>
In-Reply-To: <20250406-msm8953-interconnect-v1-0-a23e22e236e0@lucaweiss.eu>
To: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <lumag@kernel.org>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, 
 Vladimir Lypak <vladimir.lypak@gmail.com>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Luca Weiss <luca@lucaweiss.eu>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1338; i=luca@lucaweiss.eu;
 h=from:subject:message-id; bh=54KKEjad1+ij3E2hBLbA9dHHdBX4M8D7STWk9Y+wemo=;
 b=owEBbQKS/ZANAwAIAXLYQ7idTddWAcsmYgBn8uo7V02lvvdaDbCDg+UHeKAdIc/9YNmZNePsB
 XhoAvdHPOqJAjMEAAEIAB0WIQQ5utIvCCzakboVj/py2EO4nU3XVgUCZ/LqOwAKCRBy2EO4nU3X
 VmAtD/0S8EspPCGaoYWyHm+lUUgH6JsHtkmKH6Tkl4hRdjdIz4a4cdIpWXohWAlyZLs2Ap7pPRr
 WFHmeu5V8T1HYVf6qqGnRwDSdNRMpEH8LK3edVGMS8e2XB7tEoyWop5xdiAMftJo7njhiZpAA31
 F7uqog68pLdzfuXmkXw1wvkkPnQUe1O9idriGs0HMaGcfaivY2gh1M+KIz/hvwvQZH8H+HRQuYA
 LAkAojOfyFXleVs9OYu85eN8lAU4OUwIo5v+6kbpeOgvA87zi7C2SGZeBBakZm+txi25iylGdmt
 I5dd5zzKE9427bhaZxO7TY5oGuMZe9MPQf8EIBrMP7MiAn7lQGEDAdS/E0U9Co0jH85ORqyM3q8
 +AvOZ1rsegU6zq6YLM46FWnN0Oa+AI8pnmiC8Jux2VFqpskIMwjunC1ehqEjt7Y6oCCvFnDoPTt
 Auszh2sxE+zxKepaGN9xdHHtmEoSRIspCWksIWYPamFLhs/MWa/cOKJs9lbWIAZyhHkK2jgcUci
 ml+f+2afDXQlGNhKOlzqaOtHHT8g0mP6X07MZzV6K802//prn+EvX1J979DF3EIQptsII0EoWZe
 MYrPI0mJnFL6Kzgxj/H08g2EfEUZFqdbEn/MiKZFFo1YaLekOSpeGw7Ew/zEL89eZjBK04wlCvp
 o585n7rnV/pU1nw==
X-Developer-Key: i=luca@lucaweiss.eu; a=openpgp;
 fpr=BD04DA24C971B8D587B2B8D7FAF69CF6CD2D02CD
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

Document two interconnect paths found on the MDSS on MSM8953.

Signed-off-by: Luca Weiss <luca@lucaweiss.eu>
---
There's also some interconnect paths defined in the mdp5 schema, both
drivers accept it. Newer mdss schemas seem to prefer mdp0-mem + cpu-cfg
in the mdss schema instead of in the dpu subnode. Since there's no
cpu-cfg defined with mdp5, I've added these paths here.
---
 Documentation/devicetree/bindings/display/msm/qcom,mdss.yaml | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/msm/qcom,mdss.yaml b/Documentation/devicetree/bindings/display/msm/qcom,mdss.yaml
index 7c6462caa4428bc284619275e61ddacc26d0c06e..db9c43b20e2a705bcaae4a9e0e11ce13be853b78 100644
--- a/Documentation/devicetree/bindings/display/msm/qcom,mdss.yaml
+++ b/Documentation/devicetree/bindings/display/msm/qcom,mdss.yaml
@@ -84,6 +84,18 @@ properties:
     items:
       - description: MDSS_CORE reset
 
+  interconnects:
+    minItems: 1
+    items:
+      - description: Interconnect path from mdp0 (or a single mdp) port to the data bus
+      - description: Interconnect path from CPU to the reg bus
+
+  interconnect-names:
+    minItems: 1
+    items:
+      - const: mdp0-mem
+      - const: cpu-cfg
+
 required:
   - compatible
   - reg

-- 
2.49.0

