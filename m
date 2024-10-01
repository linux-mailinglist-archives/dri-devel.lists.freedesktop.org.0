Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E43498B4A2
	for <lists+dri-devel@lfdr.de>; Tue,  1 Oct 2024 08:42:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BC6F810E1E4;
	Tue,  1 Oct 2024 06:42:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="KhOmqNeG";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D185310E118;
 Tue,  1 Oct 2024 06:42:05 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id BF0A75C541D;
 Tue,  1 Oct 2024 06:42:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 6B1B0C4CEC6;
 Tue,  1 Oct 2024 06:42:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1727764924;
 bh=RFBfeiQ3kImiTf9iCh1nA3uLTEXECoQ/rL+Pil+RxJ4=;
 h=From:Subject:Date:To:Cc:Reply-To:From;
 b=KhOmqNeGbIgspQXtvwN5PzW3TXgAKYmIvJjuiO1q7FF0QH1Z54WFynZjWWYedttCM
 sh23yol9tc2T+NienYPUTr4/CuvdnUn7OXhLkC2g9ykIm/ez6jHAAd51uVl/5fNGjO
 nBTN9YpRKWLS9G6hPl8XQPTWWdyiJ8xROB9cnQkjqdGbF01JRMmW+vgeBe+kWrDOep
 DxulkHZZMPG/hO4PKcIOo/S+viS1MK+ul01GBa7NMjhPCM/Xk+syE+tvUI9X8SVYWL
 6YLuRZa4FaVpmKJvaqJ8u6s5WjAS4TyWfasNPa3wdvoam8+INGmHSJ0HoZxUG632mJ
 OeyGGkvM6wt3A==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by smtp.lore.kernel.org (Postfix) with ESMTP id 5D417CEB2E8;
 Tue,  1 Oct 2024 06:42:04 +0000 (UTC)
From: Mahadevan via B4 Relay <devnull+quic_mahap.quicinc.com@kernel.org>
Subject: [PATCH v3 0/5] Display enablement changes for Qualcomm SA8775P
 platform
Date: Tue, 01 Oct 2024 12:11:35 +0530
Message-Id: <20241001-patchv3_1-v3-0-d23284f45977@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAJ+Z+2YC/03Myw6CMBCF4Vchs7ZkpgUEV76HMaSOg50FFwsSE
 8K7W125O19y8m8wS1SZ4ZRtEGXVWcchwR0y4OCHhxi9J4NFW2Dj0Ex+4bC6lkyFyDemsmikhvS
 fonT6/rUu1+Qujr1ZQhT/V7AVEZI75tYiUlkbMs+Xctv74Kfzd+rAOY897PsH/jV1np0AAAA=
X-Change-ID: 20240930-patchv3_1-600cbc1549e8
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Mahadevan <quic_mahap@quicinc.com>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>
Cc: Kalyan Thota <quic_kalyant@quicinc.com>, 
 Jayaprakash Madisetty <quic_jmadiset@quicinc.com>, 
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1727764922; l=2620;
 i=quic_mahap@quicinc.com; s=20241001; h=from:subject:message-id;
 bh=RFBfeiQ3kImiTf9iCh1nA3uLTEXECoQ/rL+Pil+RxJ4=;
 b=fKnZ5k6CWZ0PFBIPrYz4dqhEIPGH3wp8wZeAzyc0OGoAcdqef6TraNEIwSEfmKZwkFpmqMHzs
 MZnQg9eND9eA7Bvp+uMIHt3HyFMvYwGE+Vz7VullWX2aU/kiEqTfgtx
X-Developer-Key: i=quic_mahap@quicinc.com; a=ed25519;
 pk=Xc9CA438o9mZKp4uZ8vZMclALnJ8XtlKn/n3Y42mMBI=
X-Endpoint-Received: by B4 Relay for quic_mahap@quicinc.com/20241001 with
 auth_id=236
X-Original-From: Mahadevan <quic_mahap@quicinc.com>
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
Reply-To: quic_mahap@quicinc.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This series introduces support to enable the Mobile Display Subsystem (MDSS)
and Display Processing Unit (DPU) for the Qualcomm SA8775P target. It
includes the addition of the hardware catalog, compatible string,
relevant device tree changes, and their YAML bindings.

---
In this series PATCH 5: "arm64: dts: qcom: sa8775p: add display dt nodes for MDSS0 and DPU"
depends on the clock enablement change:
https://lore.kernel.org/all/20240816-sa8775p-mm-v3-v1-0-77d53c3c0cef@quicinc.com/

---

[v3]
-Edited copyright for catalog changes. [Dmitry]
-Fix dt_binding_check tool errors(update reg address as address-cells and
 size-cells of root node one and maintain the same for child nodes of mdss,
 added additionalProperties in schema).
 [Rob, Bjorn, Krzysztof]
-Add QCOM_ICC_TAG_ACTIVE_ONLY interconnect path tag to mdp0-mem and mdp1-mem
 path in devicetree. [Dmitry]
-Update commit subject and message for DT change. [Dmitry]
-Remove interconnect path tags from dt bindings. (ref sm8450-mdss yaml)

[v2]
- Updated cover letter subject and message. [Dmitry]
- Use fake DISPCC nodes to avoid clock dependencies in dt-bindings. [Dmitry]
- Update bindings by fixing dt_binding_check tool errors (update includes in example),
  adding proper spacing and indentation in the binding example, droping unused labels,
  droping status disable, adding reset node. [Dmitry, Rob, Krzysztof]
- Reorder compatible string of MDSS and DPU based on alphabetical order.[Dmitry]
- add reg_bus_bw in msm_mdss_data. [Dmitry]
- Fix indentation in the devicetree. [Dmitry]

--
2.34.1

---
Mahadevan (5):
      dt-bindings: display/msm: Document MDSS on SA8775P
      dt-bindings: display/msm: Document the DPU for SA8775P
      drm/msm: mdss: Add SA8775P support
      drm/msm/dpu: Add SA8775P support
      arm64: dts: qcom: sa8775p: add display dt nodes for MDSS0 and DPU

 .../bindings/display/msm/qcom,sa8775p-dpu.yaml     | 122 ++++++
 .../bindings/display/msm/qcom,sa8775p-mdss.yaml    | 241 ++++++++++
 arch/arm64/boot/dts/qcom/sa8775p.dtsi              |  89 ++++
 .../drm/msm/disp/dpu1/catalog/dpu_8_4_sa8775p.h    | 485 +++++++++++++++++++++
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c     |   1 +
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h     |   1 +
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c            |   1 +
 drivers/gpu/drm/msm/msm_mdss.c                     |  11 +
 8 files changed, 951 insertions(+)
---
base-commit: e390603cfa79c860ed35e073f5fe77805b067a8e
change-id: 20240930-patchv3_1-600cbc1549e8

Best regards,
-- 
Mahadevan <quic_mahap@quicinc.com>


