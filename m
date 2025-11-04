Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 983F1C2EC41
	for <lists+dri-devel@lfdr.de>; Tue, 04 Nov 2025 02:34:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C24D610E502;
	Tue,  4 Nov 2025 01:33:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="gzkbed+2";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7DD0310E4FD;
 Tue,  4 Nov 2025 01:33:47 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 2886243910;
 Tue,  4 Nov 2025 01:33:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id E646CC4CEE7;
 Tue,  4 Nov 2025 01:33:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1762220027;
 bh=ZJ9B2/N6e28f7yAJcSHDnM45xVYlWBWvFBo0o9MsapA=;
 h=From:Subject:Date:To:Cc:Reply-To:From;
 b=gzkbed+2smBl+x5TUuI7wk+dj1JnE/B6qlL7H5Bx59AEDp5Qv7DAXVGJnw9euMLiU
 97mzUny+63T6VzIlV97uZOOR+608te0e4OkUYp1OCIkk8zjJqgN8+uvBm6bHRwSMyl
 q+1ml7euH5RlYvs1iRnSVq7sH6MRswoF+8M7LtWw7v2/RDMRAcOqv5+q2MmDew8kr5
 4O1RAtaROspN49/6OO5RV/m7tnmn+E9sEGVkswdKAPiQAXc+P/69P+zo4sVM1fw3N1
 /YDtdv1wId6lljOCMShTSTAgGjphpqQrPmRxvUgEEZOER5hcOeMiSRT/h9MyczjCuC
 XkJhUnpk3jLeA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by smtp.lore.kernel.org (Postfix) with ESMTP id D500CCCFA05;
 Tue,  4 Nov 2025 01:33:46 +0000 (UTC)
From: Xiangxu Yin via B4 Relay
 <devnull+xiangxu.yin.oss.qualcomm.com@kernel.org>
Subject: [PATCH v7 0/4] Add DisplayPort support to QCS615 devicetree
Date: Tue, 04 Nov 2025 09:33:22 +0800
Message-Id: <20251104-add-displayport-support-to-qcs615-devicetree-v7-0-e51669170a6f@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAOZXCWkC/6XS327CIBQG8FcxvR4GKAUxy+J7LLugcNhIrFSoz
 Yzx3Xeo+2Mye+F21R6afL8c+p2qDClArtaLU5VgDDnEHQ7qYVHZN7N7BRIczhWnvGGUCWKcIy7
 kfmuOfUwDyYd+eg6R7G2WrCEOYywMCYCANcZJrgz1psLIPoEP7xP3/ILzW8hDTMdJH1k5LZBgn
 NH7oJERSij3K2E0t0K0m/0h2LCzSxu7qlAj/4r/wx4jx3jGqXZeCScY3cScl/uD2WJ892PU/zF
 qNJQAq2VrVkyIGUNcG82dhkDDGG7blVAUtJsxmiuDszuNBg3NPfV164XUfsaQ18a9dyXRsKJmU
 qvGOQo3jPOlbwmwCTkMl9JVHeRsplavF48Fp5rJC94TG3dDitstpG/eR3zvkKflBzHinKTQtg7
 v/jf6VDp+Q+Bydr2S/7kffhtw7MiocDtnG3DGWGl5extqTQZSTsKwXugVr0tBqVYKdz9/AIhao
 dDZAwAA
X-Change-ID: 20251014-add-displayport-support-to-qcs615-devicetree-ecaad627a0fa
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
 Xiangxu Yin <xiangxu.yin@oss.qualcomm.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1762220024; l=4414;
 i=xiangxu.yin@oss.qualcomm.com; s=20241125; h=from:subject:message-id;
 bh=ZJ9B2/N6e28f7yAJcSHDnM45xVYlWBWvFBo0o9MsapA=;
 b=1no4OoRCeAj1XZEAM1Rf/AKayx7f4eoz+CzjLj60g+GbI/dH+aHjR9zSbO/CP55nKaksF1QaK
 9D3mi1VEeo0DTczx9zh2Z8qaDz3FqtGMaT12IeJUE9VY2Ej4TKYbA1Y
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

This series enables DisplayPort functionality on QCS615 platforms.
It introduces the required bindings, updates SM6150 dtsi for DP controller
and QMP USB3-DP PHY, and enables DP on the QCS615 Ride board with
connector and link configuration.

Depends-on:
https://lore.kernel.org/all/20250916-add-dp-controller-support-for-sm6150-v3-1-dd60ebbd101e@oss.qualcomm.com/
https://lore.kernel.org/all/20250926-add-displayport-support-for-qcs615-platform-v7-1-dc5edaac6c2b@oss.qualcomm.com/

Signed-off-by: Xiangxu Yin <xiangxu.yin@oss.qualcomm.com>
---
Changes in v7:
- Update schema to validate SM6150 DP node using `compatible: contains` [Rob]
- Refine commit message for clarity and guideline compliance [Dmitry]
- Fix subject prefix and drop redundant SoC suffix in title [Bjorn]
- Rebase dtsi changes on latest talos.dtsi for alignment
- Link to v6: https://lore.kernel.org/r/20251024-add-displayport-support-to-qcs615-devicetree-v6-0-c4316975dd0e@oss.qualcomm.com

Changes in v6:
- Removed useless remote-endpoint addition from previous version. [Dmitry]
- Fix indentation and blank lines in dt-binding example.
- Fix OPP values to correct clock rates in dt-binding example.
- Fix blank lines between the last property and the following subnode [Konrad]
- Link to v5: https://lore.kernel.org/r/20251021-add-displayport-support-to-qcs615-devicetree-v5-0-92f0f3bf469f@oss.qualcomm.com

Changes in v5:
- Update commit message and fix example indentation in binding
- Update order in dtsi includes [Krzysztof]
- Link to v4: https://lore.kernel.org/r/20251015-add-displayport-support-to-qcs615-devicetree-v4-0-aa2cb8470e9d@oss.qualcomm.com

Changes in v4:
- Update commit message to reflect data-lanes changes.
- Link to v3: https://lore.kernel.org/r/20251014-add-displayport-support-to-qcs615-devicetree-v3-0-74ec96ba8144@oss.qualcomm.com

Changes in v3:
- Move data-lanes from board DTS to SoC DTS [Dmitry]
- Add missing assigned-clock PIXEL1_CLK_SRC [Dmitry]
- Update subject prefix to qcom: qcs615-ride: for DTS patch [Konrad]
- Link to v2: https://lore.kernel.org/r/20251014-add-displayport-support-to-qcs615-devicetree-v2-0-1209df74d410@oss.qualcomm.com

Changes in v2:
- Update register padding and ordering [Dmitry]
- Rebase the series on the latest driver
- Link to v1: https://lore.kernel.org/all/20241210-add-displayport-support-to-qcs615-devicetree-v1-0-02f84a92c44b@quicinc.com/

---
Xiangxu Yin (4):
      dt-bindings: display: msm: sm6150-mdss: Add DisplayPort controller
      dt-bindings: display: msm: sm6150-mdss: Fix example indentation and OPP values
      arm64: dts: qcom: talos: Add DisplayPort and QMP USB3-DP PHY
      arm64: dts: qcom: qcs615-ride: Enable DisplayPort

 .../bindings/display/msm/qcom,sm6150-mdss.yaml     |  40 ++++---
 arch/arm64/boot/dts/qcom/qcs615-ride.dts           |  30 ++++++
 arch/arm64/boot/dts/qcom/talos.dtsi                | 115 ++++++++++++++++++++-
 3 files changed, 168 insertions(+), 17 deletions(-)
---
base-commit: 9823120909776bbca58a3c55ef1f27d49283c1f3
change-id: 20251014-add-displayport-support-to-qcs615-devicetree-ecaad627a0fa
prerequisite-message-id: <20250916-add-dp-controller-support-for-sm6150-v3-1-dd60ebbd101e@oss.qualcomm.com>
prerequisite-patch-id: eb07ea58347e77ee18fb6dade040affb0ab68954
prerequisite-message-id: <20250926-add-displayport-support-for-qcs615-platform-v7-0-dc5edaac6c2b@oss.qualcomm.com>
prerequisite-patch-id: 8c6c905df7ee55a92a4e52362c8fa7cd9742de04
prerequisite-patch-id: 0dba0fafd032bbd6cd117175f61efd1e56ae9228
prerequisite-patch-id: d954b18774cfc0cfdb23de09aab3c56cefb8e1ea
prerequisite-patch-id: 13f2d2efbcee6337001b5f8519a6da9a41d05276
prerequisite-patch-id: 3a7144645ede23ccc7d54420e5a32e5bfa3bb776
prerequisite-patch-id: b3ea55e92953c1526eaf7c5c21d939a5f8502711
prerequisite-patch-id: 977189ef7cecbe7237175a8ef611fffb814193b0
prerequisite-patch-id: 3a12c1b4f00eb1d074e51d586f2dae3a44de0613
prerequisite-patch-id: 7f80e93057c1fd088ac6b4b0652cdfe2ea221cd5
prerequisite-patch-id: 8b29d292717782982e4450a509f4428fe6e895f2
prerequisite-patch-id: 621c3ba6bcf5b5782a5264faed72fdadfd47c630
prerequisite-patch-id: 9c63f2c5bb39527e3031b2d168e3c9419441e8df
prerequisite-patch-id: 364f6a7d8f4e1bc79a8f236b8d5a2425ffd225fe
prerequisite-patch-id: eb09ea48625b5c0d39ffb37babe7d8c32a4b3122

Best regards,
-- 
Xiangxu Yin <xiangxu.yin@oss.qualcomm.com>


