Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C96F8A5545C
	for <lists+dri-devel@lfdr.de>; Thu,  6 Mar 2025 19:12:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1998010EA61;
	Thu,  6 Mar 2025 18:12:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="AQzhI+M5";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1EDED10EA31;
 Thu,  6 Mar 2025 18:12:37 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 8E7A6A4503C;
 Thu,  6 Mar 2025 18:07:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 33BE6C4CEE4;
 Thu,  6 Mar 2025 18:12:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1741284755;
 bh=gRo67tFQcr4vb97c8Nupegt6m+vVrt+An3MgKLqwNlk=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
 b=AQzhI+M5ZotJi4AZVgcAos/Oeos50cpJN7v4krzTr091/TAj9sGCNNr2rDl6Rypi1
 DK5FfZQDcsiyFLCtxFT+DnfgQTv+GLn60adqR+NJmnGKec/+rRuBEZZd6Ku1UZemOc
 LpN+Yj8bjBmFNMyU8pYo57LAWGXRoylGUVh1ge3PTPslfpPPC9ijvuchrWNdEdI/BJ
 UMaX4gilY0tc0bnpfWeVh4goJuTEZt9zy98oy8wrlNc+zfesflyB6ziQB8We2MMqiL
 C4eO7YsfLoBLUEQPnjYqS4VXlN2IOJYlEk/vv7hm7MzBi2hSbwRF8RVCLhU06JIIvG
 cg7wrlQWo+JFg==
From: Konrad Dybcio <konradybcio@kernel.org>
Date: Thu, 06 Mar 2025 19:11:19 +0100
Subject: [PATCH 07/11] arm64: dts: qcom: qcs615: Rename AOSS_QMP to
 power-management
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250306-topic-dt_bindings_fixups-v1-7-0c84aceb0ef9@oss.qualcomm.com>
References: <20250306-topic-dt_bindings_fixups-v1-0-0c84aceb0ef9@oss.qualcomm.com>
In-Reply-To: <20250306-topic-dt_bindings_fixups-v1-0-0c84aceb0ef9@oss.qualcomm.com>
To: Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>, 
 Robin Murphy <robin.murphy@arm.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
 Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Robert Foss <rfoss@kernel.org>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Wesley Cheng <quic_wcheng@quicinc.com>, 
 Christian Marangi <ansuelsmth@gmail.com>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Rohit Agarwal <quic_rohiagar@quicinc.com>, 
 Kyle Deng <quic_chunkaid@quicinc.com>, Vinod Koul <vkoul@kernel.org>
Cc: Marijn Suijten <marijn.suijten@somainline.org>, 
 linux-arm-msm@vger.kernel.org, iommu@lists.linux.dev, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
 linux-usb@vger.kernel.org, Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1741284679; l=1113;
 i=konrad.dybcio@oss.qualcomm.com; s=20230215; h=from:subject:message-id;
 bh=WzhgHrmGQhCfNwyFl7GmR9YV1NXKGT8ge18Bk4pSTdw=;
 b=sU+AYKabyRg8NDC95sNhp7ha/RYzVtAyZKmbU+faSzR11uPdZ0hDCO5nuGDnr6/fc7bWXwcrD
 XA36r7Xt7RZCaZNNoLoizZiVz1Pe51JOLuw3J3KvLFK9OPpjXZgfpId
X-Developer-Key: i=konrad.dybcio@oss.qualcomm.com; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=
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

From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

The node is currently named power-controller, which requires the device
underneath is a power domain provider. Rename it to align with other
SoCs and resolve this sort of warnings:

power-controller@c300000: '#power-domain-cells' is a required property

Fixes: 0775021783b5 ("arm64: dts: qcom: qcs615: add AOSS_QMP node")
Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/qcs615.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/qcs615.dtsi b/arch/arm64/boot/dts/qcom/qcs615.dtsi
index ec427bb84ec8e88cc0f4b756adb4582897943b4f..dd7a25fb4763181c6fde3d4110ae629cc8903fb3 100644
--- a/arch/arm64/boot/dts/qcom/qcs615.dtsi
+++ b/arch/arm64/boot/dts/qcom/qcs615.dtsi
@@ -3203,7 +3203,7 @@ pdc: interrupt-controller@b220000 {
 			interrupt-controller;
 		};
 
-		aoss_qmp: power-controller@c300000 {
+		aoss_qmp: power-management@c300000 {
 			compatible = "qcom,qcs615-aoss-qmp", "qcom,aoss-qmp";
 			reg = <0x0 0x0c300000 0x0 0x400>;
 			interrupts = <GIC_SPI 389 IRQ_TYPE_EDGE_RISING>;

-- 
2.48.1

