Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 85C646622BC
	for <lists+dri-devel@lfdr.de>; Mon,  9 Jan 2023 11:15:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AB86F10E3B6;
	Mon,  9 Jan 2023 10:15:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com
 [IPv6:2a00:1450:4864:20::333])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A8F1810E3B6
 for <dri-devel@lists.freedesktop.org>; Mon,  9 Jan 2023 10:15:21 +0000 (UTC)
Received: by mail-wm1-x333.google.com with SMTP id m3so5895683wmq.0
 for <dri-devel@lists.freedesktop.org>; Mon, 09 Jan 2023 02:15:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:from:to:cc:subject:date:message-id:reply-to;
 bh=4X9ptXPPVtfy0d+4kH7PXP7h+o/YSJv0SiTZkEY95UI=;
 b=Hun6DtcORuqU1dp/qUo6ouuwn1Nw6PwTlzr3ZHxcoKSxF6JCsHPnxArXayJbsEG5jj
 gm90120sSHzXTvvX3wq3Y22/70cZWoTVP73BzfgGqqZgsbruh19jS6SvFob1SZippyEk
 XXXZaXvI99CfMeGZDBRtFeA/nZhE5q+is+GHp4oVMkEF7gezJ+7j9DGkbGJA4asLOzI0
 PAmOrNP0N6g+rlpfJFJWuuGbtxbC12jghdAU3LqfWAXfRGLJ6gZrKbYVFduQTHOE+oIZ
 iYhLYwTDy8SOBrjtZqAmJ/EoXcHIOYp/hJatF5Tl5hR+RbozW/vqWVsth6qbQW5lL5Ad
 pUmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=4X9ptXPPVtfy0d+4kH7PXP7h+o/YSJv0SiTZkEY95UI=;
 b=tFh0ZdiP9R0jHtRUjeuOlzblsRzlBATLbmMDl7CMQUZnczczIgH8r9s1hP1lmsGD9J
 7lksirg5MMGM9jJ64rCOqMTx0AAm196tuuIZPQT5Cq0Xg5N1wbqy0nrBVEOrC98bG+Pl
 QOt+aMDB+U02m7zrXEC/N4LzVMP8rqFSgUP/3tnztoK3oKqlSC8szCj5bTY6bkCBuz6u
 1MUme3IiFtsKNBytR81MR2n8B50w0aUuam9yMtqdsIdqqrMHJ8FeB1/yK69HRyD/Ge9e
 aJi5ItLFQ4jZZ/ncg7BdUVm04zdRYlGJ+mN/ml3DkJVd3O1PD6uY2BTjeelvI1WY/L/4
 Iviw==
X-Gm-Message-State: AFqh2kqOr7cOocchkN303tF/ZJX3fmosv3a3ghVelolGDKJC/dLsKo05
 /NVim465RYRJ2ocisnDlS9pKqA==
X-Google-Smtp-Source: AMrXdXs8pPhran1wNxc2adpsMssgjydn8bHgYgu+Y0FTUcmGPXP+PLaaPuhxXLTI8zzHVVAYXDLyyA==
X-Received: by 2002:a05:600c:1e24:b0:3d0:8643:caf1 with SMTP id
 ay36-20020a05600c1e2400b003d08643caf1mr46607392wmb.16.1673259320109; 
 Mon, 09 Jan 2023 02:15:20 -0800 (PST)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:52eb:f6ff:feb3:451a])
 by smtp.gmail.com with ESMTPSA id
 h10-20020a05600c2caa00b003cfd58409desm15815376wmc.13.2023.01.09.02.15.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 09 Jan 2023 02:15:19 -0800 (PST)
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: [PATCH v3 0/7] drm/msm: add support for SM8550
Date: Mon, 09 Jan 2023 11:15:17 +0100
Message-Id: <20230103-topic-sm8550-upstream-mdss-dsi-v3-0-660c3bcb127f@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIADXpu2MC/5XOzW6DMBAE4FeJfO5W/pGB9NT3qHow6yWsBDbyE
 tQo4t1jcsstPc4cvpm7EipMor5Od1VoY+GcanAfJ4VjSBcCjjUrq63TRjtY88IIMnfea7gushYK
 M8xRBKIwOI+hC0jB27OqSB+EoC8h4ViZdJ2mWi6FBv57rv781jyyrLncnic2c7Rv720GNJwRY0u
 NtwPG74lTKPkzl4s67M3+z7PV69rBoGli2zj/4u37/gCS34FpMgEAAA==
To: Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Jonathan Marek <jonathan@marek.ca>
X-Mailer: b4 0.11.1
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
Cc: Neil Armstrong <neil.armstrong@linaro.org>, devicetree@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This adds support for the MDSS/DPU/DSI on the Qualcomm SM8550 platform.

This patchset is based on the SM8450 display support serie at [1].

In order to work, the following patchsets are required:
- PM8550 LDO fix at [2]
- DISPCC driver at [3]

+ the DT changes.

[1] https://lore.kernel.org/all/20221207012231.112059-1-dmitry.baryshkov@linaro.org/
[2] https://lore.kernel.org/all/20230102-topic-sm8550-upstream-fixes-reg-l11b-nldo-v1-1-d97def246338@linaro.org/
[3] https://lore.kernel.org/all/20230103-topic-sm8550-upstream-dispcc-v2-0-786ddd8785a2@linaro.org

To: Rob Clark <robdclark@gmail.com>
To: Abhinav Kumar <quic_abhinavk@quicinc.com>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Sean Paul <sean@poorly.run>
To: David Airlie <airlied@gmail.com>
To: Daniel Vetter <daniel@ffwll.ch>
To: Rob Herring <robh+dt@kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
To: Jonathan Marek <jonathan@marek.ca>
Cc: linux-arm-msm@vger.kernel.org
Cc: dri-devel@lists.freedesktop.org
Cc: freedreno@lists.freedesktop.org
Cc: devicetree@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>

---
Changes in v3:
- Patch 1,2,3: Added Acked-by/Reviewed-by
- Patch 6: Fixed compatible to qcom,sm8550-dsi-phy-4nm
- Link to v2: https://lore.kernel.org/r/20230103-topic-sm8550-upstream-mdss-dsi-v2-0-87f1c16d7635@linaro.org

Changes in v2:
- Rebased on msm-next-lumag & msm-next-lumag-dpu
- Fixed cover letter title to SM8550
- Patch 1: renamed compatible to qcom,sm8550-dsi-phy-4nm 
- Patch 2: split in 2 patches, switch to renamed qcom,sm8550-dsi-phy-4nm
- Patch 3: switch CTL to use CTL_SC7280_MASK, Added Reviewed-by
- Patch 4: Added Reviewed-by
- Patch 5: fixed V5.2 quirk order
- Patch 6: Added Reviewed-by
- Link to v1: https://lore.kernel.org/r/20230103-topic-sm8550-upstream-mdss-dsi-v1-0-9ccd7e652fcd@linaro.org

---
Neil Armstrong (7):
      dt-bindings: display/msm: document the SM8550 DSI PHY
      dt-bindings: display/msm: document DPU on SM8550
      dt-bindings: display/msm: document MDSS on SM8550
      drm/msm/dpu: add support for SM8550
      drm/msm: mdss: add support for SM8550
      drm/msm/dsi: add support for DSI-PHY on SM8550
      drm/msm/dsi: add support for DSI 2.7.0

 .../bindings/display/msm/dsi-phy-7nm.yaml          |   1 +
 .../bindings/display/msm/qcom,sm8550-dpu.yaml      | 134 +++++++++
 .../bindings/display/msm/qcom,sm8550-mdss.yaml     | 331 +++++++++++++++++++++
 drivers/gpu/drm/msm/Kconfig                        |   4 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c     | 197 ++++++++++++
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h     |   1 +
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h        |   2 +
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c            |   1 +
 drivers/gpu/drm/msm/dsi/dsi_cfg.c                  |  16 +
 drivers/gpu/drm/msm/dsi/dsi_cfg.h                  |   1 +
 drivers/gpu/drm/msm/dsi/phy/dsi_phy.c              |   2 +
 drivers/gpu/drm/msm/dsi/phy/dsi_phy.h              |   1 +
 drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c          |  88 +++++-
 drivers/gpu/drm/msm/msm_mdss.c                     |   2 +
 14 files changed, 765 insertions(+), 16 deletions(-)
---
base-commit: 58372c69004c06773cbe74a05f2c1a4a8b23db9c
change-id: 20230103-topic-sm8550-upstream-mdss-dsi-35ca8acea529

Best regards,
-- 
Neil Armstrong <neil.armstrong@linaro.org>
