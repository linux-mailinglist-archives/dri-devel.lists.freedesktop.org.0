Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 93A8D71474F
	for <lists+dri-devel@lfdr.de>; Mon, 29 May 2023 11:45:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CB6A310E26D;
	Mon, 29 May 2023 09:45:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.z3ntu.xyz (mail.z3ntu.xyz [128.199.32.197])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D632210E26D;
 Mon, 29 May 2023 09:45:29 +0000 (UTC)
Received: from [192.168.122.1] (217-149-172-244.nat.highway.telekom.at
 [217.149.172.244])
 by mail.z3ntu.xyz (Postfix) with ESMTPSA id A710FCE0B8;
 Mon, 29 May 2023 09:44:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=z3ntu.xyz; s=z3ntu;
 t=1685353498; bh=xfFewTURLYXohNneh+r7JbkPyl7CvAO3LVrq35X+H5Y=;
 h=From:Subject:Date:To:Cc;
 b=RXv/muN6ZaeRXkoapvQZ0XRkTCoQR8oyG/WoR9LVQW1xDXPU3M/PL9iIWS/UbgqGM
 c5ORjhWFoSUcEGHuc7x50cwydcByJn8rxMtla3oTXEoheuvt/ISVdaBvoC8om4qmLz
 63QDZrcOukJsneGw9ijSNtCUW5By2YdrDRL8XDq4=
From: Luca Weiss <luca@z3ntu.xyz>
Subject: [PATCH 0/7] Display support for MSM8226
Date: Mon, 29 May 2023 11:43:57 +0200
Message-Id: <20230308-msm8226-mdp-v1-0-679f335d3d5b@z3ntu.xyz>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAN1zdGQC/z2NQQrCMBAAv1L27JZ0IzH4FfGQJqvdQ9KahaKU/
 t3Ug8eBGWYD5SqscO02qLyKylwaDKcO4hTKk1FSYyBD1ljjMWv2RA5zWtCd7cA+uQsFA60YgzK
 ONZQ4Hc0rzvnvu576zyEtlR/y/i1v933/AqQansKCAAAA
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1621; i=luca@z3ntu.xyz;
 h=from:subject:message-id; bh=xfFewTURLYXohNneh+r7JbkPyl7CvAO3LVrq35X+H5Y=;
 b=owEBbQKS/ZANAwAIAXLYQ7idTddWAcsmYgBkdHQQ99YD1eAaNUZbHifhL72ezovVQpKIhnABG
 zm291t9wrWJAjMEAAEIAB0WIQQ5utIvCCzakboVj/py2EO4nU3XVgUCZHR0EAAKCRBy2EO4nU3X
 VjknD/4gDTK+++IVnAznUGjqtJE0MvfHd8ClzzCOq9kc20IajNM4rTsRuz87nllUhXxvq+wH1ou
 t82i65mRlSW+MbkyhLbWm881v+dQJFLI5ynQoIxM+3r8v65vDzp/UTVnsVsuiClm8XJbBbi84zD
 1pnb1W81aOtBj1l2qpxaWjOQ584Vl7Kckd99vNgFmf9yuMLsxKd18obhfV5LjCnYf6Iw2ZEvjer
 L9ERepIebFVIcHJyRf7QRNDytpgHWLQ9sDydfxKUKS8oW4gu0w7pIqGO0ipkjwCAu2qIZpj1F8F
 HWyKQljwA184mDQ8FbHulJPH7XkM1/lEjkxJdTTY+9Xcy50h9YA1Rx8M0sWmQo1JiB9gHmkcm6v
 hW1JtTsIfU6OCX5YF6n6g3DbjD7gQPdL/prafZl78evmKXeytNMYHJU5zGXgFy8Lh1Ja/7z3BrB
 58v9nLLJucuvMKtetC/I0/CZWhnkt0FVw4pBWW+agE2hOprKgssl87LaIblwbRtEC8gVZz5K3qQ
 WkehbzYJ9FIFA6mfMGqNpyBx3pIRkq6FG6EFVIwSfxesMe3Py1JFplJl5mdjjZW0wm25K2lFK5W
 l+dfFcybb8QVHgkbIs6pAZaI50NyHFGhhY9zRmUeIGcHljG7dQ9DSnA67uaFrzsh4Zr33LqCyCh
 mFE1iNIaUNpNa1w==
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
 Luca Weiss <luca@z3ntu.xyz>, freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This series adds the required configs for MDP5 and DSI blocks that are
needed for MDSS on MSM8226. Finally we can add the new nodes into the
dts.

Tested on apq8026-lg-lenok and msm8926-htc-memul.

Signed-off-by: Luca Weiss <luca@z3ntu.xyz>
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
 .../bindings/display/msm/dsi-phy-28nm.yaml         |   1 +
 .../devicetree/bindings/display/msm/qcom,mdp5.yaml |   1 +
 .../devicetree/bindings/display/msm/qcom,mdss.yaml |   1 +
 arch/arm/boot/dts/qcom-msm8226.dtsi                | 118 +++++++++++++++++++++
 drivers/gpu/drm/msm/disp/mdp5/mdp5_cfg.c           |  82 ++++++++++++++
 drivers/gpu/drm/msm/dsi/dsi_cfg.c                  |   2 +
 drivers/gpu/drm/msm/dsi/dsi_cfg.h                  |   1 +
 drivers/gpu/drm/msm/dsi/phy/dsi_phy.c              |   2 +
 drivers/gpu/drm/msm/dsi/phy/dsi_phy.h              |   3 +-
 drivers/gpu/drm/msm/dsi/phy/dsi_phy_28nm.c         |  97 +++++++++++++++++
 11 files changed, 309 insertions(+), 1 deletion(-)
---
base-commit: e5c87df1b3ab5220362ec48f907cc62ba8928b01
change-id: 20230308-msm8226-mdp-6431e8d672a0

Best regards,
-- 
Luca Weiss <luca@z3ntu.xyz>

