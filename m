Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C3F5ABD9246
	for <lists+dri-devel@lfdr.de>; Tue, 14 Oct 2025 13:55:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B9BFE10E5C0;
	Tue, 14 Oct 2025 11:55:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="ac0wAHH2";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 95E2B10E5B8;
 Tue, 14 Oct 2025 11:55:12 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 415EE45C1B;
 Tue, 14 Oct 2025 11:55:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 0A51FC116C6;
 Tue, 14 Oct 2025 11:55:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1760442912;
 bh=5QysjArlLvVj9vb89PbOImCsPn/7ZhWrnV4+464hrmE=;
 h=From:Subject:Date:To:Cc:Reply-To:From;
 b=ac0wAHH2aFmFtmfTHPJZ6KesAwUtuRXczDE5adklRM2lyxGcHuqUcZW+UytrprKYc
 Sh6dCAR6olS5UnDjX1afigGkUxTA2MQZIlqXcOGH29FL8Rr3gPhc0Qjq3zDWhdl7CQ
 V9OwgbTjtYlX007qVigAP23lJaNX1lhUvz6SuNcoEvgJKsn5y8mxHQS1RqPkzLP9in
 Fb9Wba7CtyHA+iasVQHzfr46uKaK7z1w+cjR5QsPiAo7znJ757XsYswa9WUMMQRKnb
 MCCKfilHpynJyQq8LeucgqewJM0z5qrQkr6uTOA97BCdy3h3dLe8Cqwz5XOfdKqh/X
 dAhbEsYAF3TwA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by smtp.lore.kernel.org (Postfix) with ESMTP id E7816CCD18E;
 Tue, 14 Oct 2025 11:55:11 +0000 (UTC)
From: Xiangxu Yin via B4 Relay
 <devnull+xiangxu.yin.oss.qualcomm.com@kernel.org>
Subject: [PATCH v3 0/3] Add DisplayPort support to QCS615 devicetree
Date: Tue, 14 Oct 2025 19:54:53 +0800
Message-Id: <20251014-add-displayport-support-to-qcs615-devicetree-v3-0-74ec96ba8144@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIABI67mgC/53RQWrDMBAF0KsYrasgjW05DqXkHqULWRo3AttyJ
 MU0hNy9Y5uUlqbQdiVmFv8xXxcWMTiMbJddWMDJRecHGvKHjJmDHl6RO0szAwGlFLLg2lpuXRw
 7fR59SDyexuVNnh9NVLLklmIMpoDI0WhtFVRatJpR5BiwdW8L9/xC88HF5MN50Sc5b2eokCDF3
 6BJcsEFtNtC12CKotkfT864wWyM79lMTXCL/8cdE1C8BFHbtipsIcXex7g5nnRH8f1qXNf7ApI
 cXVqPZD3GqJcWd9njjIta5J/xD7j14SbTPtHY82lLblVX0ojSSlDwzX2aa72DSLUiIzd+SMF3H
 YYvVOxJEnzKueTWKoFNY6kY/LUA6scO755S0SnWlGi1NspAcx9qdEQ+b1zaZSU0ulI50KdaKvj
 6DinT/4yuAgAA
X-Change-ID: 20251014-add-displayport-support-to-qcs615-devicetree-ecaad627a0fa
To: Rob Clark <robin.clark@oss.qualcomm.com>, 
 Dmitry Baryshkov <lumag@kernel.org>, 
 Abhinav Kumar <abhinav.kumar@linux.dev>, 
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>, Sean Paul <sean@poorly.run>, 
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1760442909; l=3363;
 i=xiangxu.yin@oss.qualcomm.com; s=20241125; h=from:subject:message-id;
 bh=5QysjArlLvVj9vb89PbOImCsPn/7ZhWrnV4+464hrmE=;
 b=wbbBrLhaT6QyslhYkCjUI2mN5i8ELMJLggyOoZlHW8kIDq0z7x+VHPMBLQtOkF3LhDqjIGFUk
 k5yKtzyOoUIAnlTuFwIXhvfsSl9vlACtsWNgjq4gDcHFxWC6Nr/rTBv
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
https://lore.kernel.org/all/20250903-add-display-support-for-qcs615-platform-v8-1-7971c05d1262@oss.qualcomm.com/
https://lore.kernel.org/all/20250916-add-dp-controller-support-for-sm6150-v3-1-dd60ebbd101e@oss.qualcomm.com/
https://lore.kernel.org/all/20250926-add-displayport-support-for-qcs615-platform-v7-1-dc5edaac6c2b@oss.qualcomm.com/

Signed-off-by: Xiangxu Yin <xiangxu.yin@oss.qualcomm.com>
---
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
Xiangxu Yin (3):
      dt-bindings: display/msm: Add SM6150 DisplayPort controller
      arm64: dts: qcom: Add DisplayPort and QMP USB3DP PHY for SM6150
      arm64: dts: qcom: qcs615-ride: Enable DisplayPort

 .../bindings/display/msm/qcom,sm6150-mdss.yaml     |  11 ++
 arch/arm64/boot/dts/qcom/qcs615-ride.dts           |  30 ++++++
 arch/arm64/boot/dts/qcom/sm6150.dtsi               | 113 ++++++++++++++++++++-
 3 files changed, 152 insertions(+), 2 deletions(-)
---
base-commit: 52ba76324a9d7c39830c850999210a36ef023cde
change-id: 20251014-add-displayport-support-to-qcs615-devicetree-ecaad627a0fa
prerequisite-message-id: <20250903-add-display-support-for-qcs615-platform-v8-0-7971c05d1262@oss.qualcomm.com>
prerequisite-patch-id: 58be7053007469980bd7cc9fe315b66bbe021c31
prerequisite-patch-id: 3c2120117f72c64f69beff32c0239fbc7f808f36
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


