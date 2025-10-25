Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 297BEC0967B
	for <lists+dri-devel@lfdr.de>; Sat, 25 Oct 2025 18:24:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 48A3B10E313;
	Sat, 25 Oct 2025 16:24:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="ndwyeTnJ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F02CB10E313;
 Sat, 25 Oct 2025 16:24:52 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 523D5602AD;
 Sat, 25 Oct 2025 16:24:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CAB44C4CEFB;
 Sat, 25 Oct 2025 16:24:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1761409492;
 bh=bwtiFccQsOoGsrSvgCkYaSrdPPeWEvE9ONY3v48TobM=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=ndwyeTnJ+pK6cdGLOWutBQnHfcHi1vlkVysMHl1TjwsPUwHrRpsiqK4SET0ncxMIU
 Qho80/iPHxQ3mSK/pmig4VYIvY2Xbh1xHpTq+Bze5NK3q4J0jZcpZO27w65fCnnhQm
 Guoyuzf/HW5426HtOu9yA3kSz8Oax0AFisYiCqWv+kidF7lTL/oEnGOV0IemPGwQb4
 GYFBOWZOzcsXXUXS3p2cu4aj4yCrlzI4YvMGnDqvcod9VN1zyUZIReL3nNEJjYxs62
 zywUAwKtiMklAgd1apw/RGQPs0k/x33T/kzvfiPwwt1Ah/53lA09qRZg5KB+7pEdyV
 Gu2e8EPPSghDg==
From: Sasha Levin <sashal@kernel.org>
To: patches@lists.linux.dev,
	stable@vger.kernel.org
Cc: Jie Zhang <quic_jiezh@quicinc.com>,
 Akhil P Oommen <quic_akhilpo@quicinc.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Rob Clark <robin.clark@oss.qualcomm.com>, Sasha Levin <sashal@kernel.org>,
 lumag@kernel.org, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org
Subject: [PATCH AUTOSEL 6.17] dt-bindings: display/msm/gmu: Update Adreno 623
 bindings
Date: Sat, 25 Oct 2025 11:59:40 -0400
Message-ID: <20251025160905.3857885-349-sashal@kernel.org>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251025160905.3857885-1-sashal@kernel.org>
References: <20251025160905.3857885-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.17.5
Content-Type: text/plain; charset=UTF-8
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

From: Jie Zhang <quic_jiezh@quicinc.com>

[ Upstream commit c2cc1e60c1afff4f23c22561b57a5d5157dde20d ]

Update Adreno 623's dt-binding to remove smmu_clk which is not required
for this GMU.

Signed-off-by: Jie Zhang <quic_jiezh@quicinc.com>
Signed-off-by: Akhil P Oommen <quic_akhilpo@quicinc.com>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Patchwork: https://patchwork.freedesktop.org/patch/672455/
Signed-off-by: Rob Clark <robin.clark@oss.qualcomm.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---

LLM Generated explanations, may be completely bogus:

YES

- What it fixes
  - Corrects the GMU binding for Adreno 623 by removing an erroneous
    “SMMU vote clock” requirement. Adreno 623 does not need (and DTS
    does not provide) an `smmu_vote` clock, so the prior schema forced a
    mismatch and dtbs_check failures/warnings.
  - Aligns the binding with in-tree DTS for Adreno 623 (e.g., QCS8300),
    which defines only GMU, CX, AXI, MEMNOC, AHB, and HUB clocks.

- Specific code changes
  - Adds a dedicated schema branch for `qcom,adreno-gmu-623.0` with
    explicit registers and six clocks, notably without an SMMU vote
    clock:
    - Introduces the 623-specific conditional:
      Documentation/devicetree/bindings/display/msm/gmu.yaml:121
    - 623 clocks list (no smmu_vote):
      Documentation/devicetree/bindings/display/msm/gmu.yaml:139
    - 623 clock-names: `gmu`, `cxo`, `axi`, `memnoc`, `ahb`, `hub`:
      Documentation/devicetree/bindings/display/msm/gmu.yaml:147
  - Keeps SMMU vote clock only for other variants (635/660/663):
    - Block for 635/660/663 explicitly lists “GPU SMMU vote clock” and
      `smmu_vote`:
      Documentation/devicetree/bindings/display/msm/gmu.yaml:176 and
      Documentation/devicetree/bindings/display/msm/gmu.yaml:185
  - This separation removes the incorrect inheritance of `smmu_vote` by
    623 which previously happened when 623 was grouped with 635/660/663.

- Evidence DTS already matches this (demonstrating the prior schema was
  wrong)
  - QCS8300 GMU node uses six clocks (no `smmu_vote`): `gmu`, `cxo`,
    `axi`, `memnoc`, `ahb`, `hub`:
    arch/arm64/boot/dts/qcom/qcs8300.dtsi:4366

- Stable backport assessment
  - Bug relevance: Yes — fixes dt-binding schema forcing an invalid
    clock requirement, leading to dtbs_check issues for users building
    DTs for Adreno 623 platforms.
  - Size/scope: Small, contained to a single YAML schema file; no
    driver/runtime changes.
  - Risk/regression: Minimal. It only relaxes a wrong requirement for
    623. Out-of-tree DTS that mistakenly provided `smmu_vote` for 623
    would fail schema validation after this (those DTS are incorrect),
    but kernel functionality is unaffected.
  - No architectural churn, no features, and no cross-subsystem impact.

Given it corrects a real schema bug affecting validation of in-tree DTS
for Adreno 623, is small and low risk, and doesn’t alter runtime
behavior, this is a good candidate for stable backport.

 .../devicetree/bindings/display/msm/gmu.yaml  | 34 +++++++++++++++++++
 1 file changed, 34 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/msm/gmu.yaml b/Documentation/devicetree/bindings/display/msm/gmu.yaml
index 4392aa7a4ffe2..afc1879357440 100644
--- a/Documentation/devicetree/bindings/display/msm/gmu.yaml
+++ b/Documentation/devicetree/bindings/display/msm/gmu.yaml
@@ -124,6 +124,40 @@ allOf:
           contains:
             enum:
               - qcom,adreno-gmu-623.0
+    then:
+      properties:
+        reg:
+          items:
+            - description: Core GMU registers
+            - description: Resource controller registers
+            - description: GMU PDC registers
+        reg-names:
+          items:
+            - const: gmu
+            - const: rscc
+            - const: gmu_pdc
+        clocks:
+          items:
+            - description: GMU clock
+            - description: GPU CX clock
+            - description: GPU AXI clock
+            - description: GPU MEMNOC clock
+            - description: GPU AHB clock
+            - description: GPU HUB CX clock
+        clock-names:
+          items:
+            - const: gmu
+            - const: cxo
+            - const: axi
+            - const: memnoc
+            - const: ahb
+            - const: hub
+
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
               - qcom,adreno-gmu-635.0
               - qcom,adreno-gmu-660.1
               - qcom,adreno-gmu-663.0
-- 
2.51.0

