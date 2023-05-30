Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 669EC716C38
	for <lists+dri-devel@lfdr.de>; Tue, 30 May 2023 20:24:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 32FB510E3EA;
	Tue, 30 May 2023 18:24:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.z3ntu.xyz (mail.z3ntu.xyz [128.199.32.197])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2E4C110E3E4;
 Tue, 30 May 2023 18:24:28 +0000 (UTC)
Received: from [192.168.122.1] (84-115-214-73.cable.dynamic.surfer.at
 [84.115.214.73])
 by mail.z3ntu.xyz (Postfix) with ESMTPSA id 986E0CC497;
 Tue, 30 May 2023 18:24:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=z3ntu.xyz; s=z3ntu;
 t=1685471065; bh=wH9D4QPu75zLcE21916ThcXWPvIYfoofjYZww0iPay0=;
 h=From:Subject:Date:To:Cc;
 b=UfhTFpGGrFz0rDkLgLfhBRwN9BTbJ195AZL/rh+sFEYwC9Gmd8TRsbMrGBmvClNBj
 ySCdArhD2GfpCfubgnMsP1Phs6QK6Mj3L+j81sDQXj/oAF4cOuww2QccUE/bWAxTZi
 GPsfbVjPUpqrRQleRyWlRrI2wdS9Wgw6+iUAxyPE=
From: Luca Weiss <luca@z3ntu.xyz>
Subject: [PATCH v2 0/7] Display support for MSM8226
Date: Tue, 30 May 2023 20:24:10 +0200
Message-Id: <20230308-msm8226-mdp-v2-0-e005b769ee28@z3ntu.xyz>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAEo/dmQC/22OOw6DMBBEr4K2ziKzDoakyj0iCoNNcGFDbIL4i
 LvHUKRK+UbzNLNB0N7oAPdkA68nE0zvItAlgaaT7qXRqMhAjDjjrEQbbEkk0KoBxZVnulSiIMk
 gGrUMGmsvXdMdzrvp7a8vUkqXozR43Zr5nHxWkTsTxt4v54MpO9L/Y1OGDEVxaznPFVd5/Vi5G
 z/pvKxQ7fv+BVxoBrzLAAAA
To: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Krishna Manikandan <quic_mkrishn@quicinc.com>, 
 Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1957; i=luca@z3ntu.xyz;
 h=from:subject:message-id; bh=wH9D4QPu75zLcE21916ThcXWPvIYfoofjYZww0iPay0=;
 b=owEBbQKS/ZANAwAIAXLYQ7idTddWAcsmYgBkdj9RSo2hMiSUGEnXG8SKEOHwLGh7+gRawCWDe
 WUsIQ5MblyJAjMEAAEIAB0WIQQ5utIvCCzakboVj/py2EO4nU3XVgUCZHY/UQAKCRBy2EO4nU3X
 VkpoEACK9lwWOEnEdpUTdtUi4EIpjnarDW1DYk8eHzNNUG6sNR9Bb1YXUO+RXD/NGLw1nm3rzjA
 whoMeTD3RyFqciJZF1MEId568OW6NyP2DBXqnBcP4pww39V2zLPql8e9egiNrx6hcjTeuzD2oTj
 3Zv6JuhkBftaE4d2lBrEPebm0W/DI3FGo0KGhpXVnYth+/TCEv/ws4Ni7v61VJPS1cMnUc8/YLZ
 Xwsteogk8ZfKFtOcw2uvodiEWQYRwGOmjP+8lAEFzyyt8cDwT/YLM81jL/LMLUVQAsM4q0qu/j/
 IRRkevY2JWc/19YJsjcPYdFkMBxXuek5lSTAo1a0m2YNvvFCVwGwLUBtkxkrSH34Xs5MEdEB0DV
 t49bPQBqucuXiIHFcUTX547C8wW2VOTKJ6jBbxDoApa/wGDAtpK/5Wfo+0ZNk+0kaYgzBYgsfil
 7y6+wEU7eqPYLcVViG909t2aG8ddLZslJlsiiuAjYSqSPBqBA05uZy9IWD29+FoQobunldUgSiI
 Q4cM4SkUEecwkp3Lco8aM2Lxu2DHwI+z7X7McECdHiCqnssIX6hegPRzX5uAvFXqJvjVxvOHWK8
 DZTIgjh66dT2Gj8dou9ljft2J3NGsGrHz2Z4OYDfQNjz6k0mQxoxJAYRCa0lWBMFzPJc3C7aSXp
 bKOnbhxEDGQIizA==
X-Developer-Key: i=luca@z3ntu.xyz; a=openpgp;
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
Cc: devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Luca Weiss <luca@z3ntu.xyz>, Conor Dooley <conor.dooley@microchip.com>,
 freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This series adds the required configs for MDP5 and DSI blocks that are
needed for MDSS on MSM8226. Finally we can add the new nodes into the
dts.

Tested on apq8026-lg-lenok and msm8926-htc-memul.

Signed-off-by: Luca Weiss <luca@z3ntu.xyz>
---
Changes in v2:
- In dsi-phy-28nm.yaml fix the order of the compatibles 1/7 (Conor)
- Remove leftover debugging comments from 6/7 (Konrad)
- Rewrap some clock-names lines and move status property last in 7/7
  (Konrad)
- Pick up tags
- Link to v1: https://lore.kernel.org/r/20230308-msm8226-mdp-v1-0-679f335d3d5b@z3ntu.xyz

---
Luca Weiss (7):
      dt-bindings: msm: dsi-phy-28nm: Document msm8226 compatible
      dt-bindings: display/msm: dsi-controller-main: Add msm8226 compatible
      dt-bindings: display/msm: qcom,mdp5: Add msm8226 compatible
      drm/msm/mdp5: Add MDP5 configuration for MSM8226
      drm/msm/dsi: Add configuration for MSM8226
      drm/msm/dsi: Add phy configuration for MSM8226
      ARM: dts: qcom: msm8226: Add mdss nodes

 .../bindings/display/msm/dsi-controller-main.yaml  |   2 +
 .../bindings/display/msm/dsi-phy-28nm.yaml         |   3 +-
 .../devicetree/bindings/display/msm/qcom,mdp5.yaml |   1 +
 .../devicetree/bindings/display/msm/qcom,mdss.yaml |   1 +
 arch/arm/boot/dts/qcom-msm8226.dtsi                | 127 +++++++++++++++++++++
 drivers/gpu/drm/msm/disp/mdp5/mdp5_cfg.c           |  82 +++++++++++++
 drivers/gpu/drm/msm/dsi/dsi_cfg.c                  |   2 +
 drivers/gpu/drm/msm/dsi/dsi_cfg.h                  |   1 +
 drivers/gpu/drm/msm/dsi/phy/dsi_phy.c              |   2 +
 drivers/gpu/drm/msm/dsi/phy/dsi_phy.h              |   3 +-
 drivers/gpu/drm/msm/dsi/phy/dsi_phy_28nm.c         |  97 ++++++++++++++++
 11 files changed, 319 insertions(+), 2 deletions(-)
---
base-commit: e5c87df1b3ab5220362ec48f907cc62ba8928b01
change-id: 20230308-msm8226-mdp-6431e8d672a0

Best regards,
-- 
Luca Weiss <luca@z3ntu.xyz>

