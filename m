Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C7070668E20
	for <lists+dri-devel@lfdr.de>; Fri, 13 Jan 2023 07:34:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1FA4D10E1DF;
	Fri, 13 Jan 2023 06:33:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com
 [IPv6:2a00:1450:4864:20::131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EBE3D10E1DF
 for <dri-devel@lists.freedesktop.org>; Fri, 13 Jan 2023 06:33:54 +0000 (UTC)
Received: by mail-lf1-x131.google.com with SMTP id g13so31743931lfv.7
 for <dri-devel@lists.freedesktop.org>; Thu, 12 Jan 2023 22:33:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=Wa02nRWtFw12u53LiQ798dfsib+GYGyK/C00nF2+qvE=;
 b=T07UQpP8Gs9ETe0tParaPAPTaxYEVcTkuA8b18m/IsuUnBU+vdT2hB9RXtbLpdZ72a
 7BvMG717cMaUSx2lrnaEV0x9iC8zlLr3WLzivX/QOYG1OCGFHLInae1sc63Sp+90sOD0
 6nD6YUoUkTAx6i19bR0W7EBWXusUWu7hGbo/aQuntDZ4P86Za0gkE1szkl/oE40AaXqi
 Mdnu9WDteGijUQOzHo5rWRzedvBlkDfmPMV1ogEj54lUG+Y5i4Yy9UI/CIsHtO1ILrcc
 DNL729z0eQ1YDDf2Yp8ILJvh34SZPUSmRrb6nw6+WFaVIxB1BssnX0PQbQ8HV63I+xfe
 U+Tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Wa02nRWtFw12u53LiQ798dfsib+GYGyK/C00nF2+qvE=;
 b=bNvLOuLg3FYMJyXvlnpJ/WxaulTpOC7Kxk8fp89byOgBvzT0JejYJfjVsBKEWqxUoZ
 qnwZY/HGD5iB7qvO17Np/xNgOCPWwHrf3i6esV+2Jveuf0UAHTr94/RX51hzMdMULY5g
 LfwHm89gVHTiP1hLgP1FfBCwZRWJ2q9Ogek4SNebaMCcDU5F4aIChVAIG0ABBBfiVX1R
 sy+9Blr9bF9VXY/ZAQj1yfIGZjigF7YrbYQ9WEfB1nfO+dKn9Exvm+Qm03XXZsZ3oqzg
 mrT4bfnuNzVHcdFSPy2e2NKdH2asm9OtTKdVVKL8PriBlGzA+ASrgnQsV3jvQcNXPbIr
 Mvsw==
X-Gm-Message-State: AFqh2kotSOmbe6aWBhrT5i1OmZMNhI2rrcQAl1k6/buSqaZ2yAC+fQvI
 kD/evE7ZIDUNyfSjiFIcFYX5hA==
X-Google-Smtp-Source: AMrXdXs81VzZPBwLRDFIgEm00wNsm7rdGNW6tKDKTFkJkk1FnbAfsBnHRkGR4bBJFScvGJyCG+8QSw==
X-Received: by 2002:ac2:5fcf:0:b0:4a4:68b7:d64b with SMTP id
 q15-20020ac25fcf000000b004a468b7d64bmr19275610lfg.50.1673591633228; 
 Thu, 12 Jan 2023 22:33:53 -0800 (PST)
Received: from eriador.lumag.spb.ru ([194.204.33.9])
 by smtp.gmail.com with ESMTPSA id
 f23-20020ac25337000000b004b55ddeb7e3sm3693524lfh.309.2023.01.12.22.33.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 12 Jan 2023 22:33:52 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>, Rob Clark <robdclark@gmail.com>,
 Sean Paul <sean@poorly.run>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Subject: [PATCH] dt-bindings: display/msm/dsi-phy: drop unused allOf clauses
Date: Fri, 13 Jan 2023 08:33:51 +0200
Message-Id: <20230113063351.24131-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.0
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
Cc: devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Stephen Boyd <swboyd@chromium.org>,
 freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 .../devicetree/bindings/display/msm/dsi-phy-10nm.yaml          | 3 +--
 .../devicetree/bindings/display/msm/dsi-phy-14nm.yaml          | 3 +--
 .../devicetree/bindings/display/msm/dsi-phy-20nm.yaml          | 3 +--
 .../devicetree/bindings/display/msm/dsi-phy-28nm.yaml          | 3 +--
 Documentation/devicetree/bindings/display/msm/dsi-phy-7nm.yaml | 3 +--
 5 files changed, 5 insertions(+), 10 deletions(-)

diff --git a/Documentation/devicetree/bindings/display/msm/dsi-phy-10nm.yaml b/Documentation/devicetree/bindings/display/msm/dsi-phy-10nm.yaml
index 3ec466c3ab38..71702151bafa 100644
--- a/Documentation/devicetree/bindings/display/msm/dsi-phy-10nm.yaml
+++ b/Documentation/devicetree/bindings/display/msm/dsi-phy-10nm.yaml
@@ -9,8 +9,7 @@ title: Qualcomm Display DSI 10nm PHY
 maintainers:
   - Krishna Manikandan <quic_mkrishn@quicinc.com>
 
-allOf:
-  - $ref: dsi-phy-common.yaml#
+$ref: dsi-phy-common.yaml#
 
 properties:
   compatible:
diff --git a/Documentation/devicetree/bindings/display/msm/dsi-phy-14nm.yaml b/Documentation/devicetree/bindings/display/msm/dsi-phy-14nm.yaml
index a43e11d3b00d..cc99946245c6 100644
--- a/Documentation/devicetree/bindings/display/msm/dsi-phy-14nm.yaml
+++ b/Documentation/devicetree/bindings/display/msm/dsi-phy-14nm.yaml
@@ -9,8 +9,7 @@ title: Qualcomm Display DSI 14nm PHY
 maintainers:
   - Krishna Manikandan <quic_mkrishn@quicinc.com>
 
-allOf:
-  - $ref: dsi-phy-common.yaml#
+$ref: dsi-phy-common.yaml#
 
 properties:
   compatible:
diff --git a/Documentation/devicetree/bindings/display/msm/dsi-phy-20nm.yaml b/Documentation/devicetree/bindings/display/msm/dsi-phy-20nm.yaml
index 9c1f9140c731..ae4df76835f7 100644
--- a/Documentation/devicetree/bindings/display/msm/dsi-phy-20nm.yaml
+++ b/Documentation/devicetree/bindings/display/msm/dsi-phy-20nm.yaml
@@ -9,8 +9,7 @@ title: Qualcomm Display DSI 20nm PHY
 maintainers:
   - Krishna Manikandan <quic_mkrishn@quicinc.com>
 
-allOf:
-  - $ref: dsi-phy-common.yaml#
+$ref: dsi-phy-common.yaml#
 
 properties:
   compatible:
diff --git a/Documentation/devicetree/bindings/display/msm/dsi-phy-28nm.yaml b/Documentation/devicetree/bindings/display/msm/dsi-phy-28nm.yaml
index cf4a338c4661..96c607d7196e 100644
--- a/Documentation/devicetree/bindings/display/msm/dsi-phy-28nm.yaml
+++ b/Documentation/devicetree/bindings/display/msm/dsi-phy-28nm.yaml
@@ -9,8 +9,7 @@ title: Qualcomm Display DSI 28nm PHY
 maintainers:
   - Krishna Manikandan <quic_mkrishn@quicinc.com>
 
-allOf:
-  - $ref: dsi-phy-common.yaml#
+$ref: dsi-phy-common.yaml#
 
 properties:
   compatible:
diff --git a/Documentation/devicetree/bindings/display/msm/dsi-phy-7nm.yaml b/Documentation/devicetree/bindings/display/msm/dsi-phy-7nm.yaml
index 78ab8c410ccd..53e2f005d3cf 100644
--- a/Documentation/devicetree/bindings/display/msm/dsi-phy-7nm.yaml
+++ b/Documentation/devicetree/bindings/display/msm/dsi-phy-7nm.yaml
@@ -9,8 +9,7 @@ title: Qualcomm Display DSI 7nm PHY
 maintainers:
   - Jonathan Marek <jonathan@marek.ca>
 
-allOf:
-  - $ref: dsi-phy-common.yaml#
+$ref: dsi-phy-common.yaml#
 
 properties:
   compatible:
-- 
2.39.0

