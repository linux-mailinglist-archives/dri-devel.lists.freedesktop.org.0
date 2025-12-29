Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CE4FCE82A9
	for <lists+dri-devel@lfdr.de>; Mon, 29 Dec 2025 21:47:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 411A710E6E8;
	Mon, 29 Dec 2025 20:47:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="PKdciKtm";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 09F2810E6E7;
 Mon, 29 Dec 2025 20:47:53 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 84119416E4;
 Mon, 29 Dec 2025 20:47:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 533E8C116D0;
 Mon, 29 Dec 2025 20:47:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1767041273;
 bh=xeDHdBw6Z9IxbUwL9tNS7SfoXiVCCTdRx9idJI1bq90=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
 b=PKdciKtmj4uQbRnMhACxml7papZkHbaGgjVtDBt2CAThENV7DTQr2GByWaxytTGU4
 o+3G/7xdLquym47UxHIQOcy3uKmOVp/Ex9K2dTL/RuFTzFZtuk6HiEApay4zd6NcPZ
 UdJvjMifew+kw9QRi/HLfejDtNNlX5AHWt7sm4YJ6ld3fi2nzKsgRYUGSpB6UetgQr
 mjSA/pvABG1/B0LEjdXNtW5q8IOsbV0HgzF2lK4pWwaR2rHVG2C7BUqPTpHOMhJ6u7
 fqGFlGNkFVE8AJ/AcvSOB0R88OYPxewrcIPGwgU3/R4YWyBBGyQTUfNZVHMCRUQ1wV
 KaW0mowdMlZGQ==
From: Konrad Dybcio <konradybcio@kernel.org>
Date: Mon, 29 Dec 2025 21:47:39 +0100
Subject: [PATCH RFT 1/3] dt-bindings: display/msm/gpu: Straighten out
 reg-names on A619L/610/702
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251229-topic-6115_2290_gpu_dbgc-v1-1-4a24d196389c@oss.qualcomm.com>
References: <20251229-topic-6115_2290_gpu_dbgc-v1-0-4a24d196389c@oss.qualcomm.com>
In-Reply-To: <20251229-topic-6115_2290_gpu_dbgc-v1-0-4a24d196389c@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Dmitry Baryshkov <lumag@kernel.org>, 
 Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>, 
 Akhil P Oommen <akhilpo@oss.qualcomm.com>, 
 Abhinav Kumar <abhinav.kumar@linux.dev>, 
 Jessica Zhang <jesszhan0024@gmail.com>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1767041261; l=923;
 i=konrad.dybcio@oss.qualcomm.com; s=20230215; h=from:subject:message-id;
 bh=tnz6B2TtaT2aU9yFmk2ctbrpYfclO0IOnelOYfpxa9s=;
 b=WQq3hghXXJlgk9eWpIuBFD3joeVYCl5qPq6M963a4PmIpB4GGAOW9QMGJGSSPqb2yGvncuO+G
 TpkspVYjyXcCyn0WfM35iI0IM+gFI3e7G7R1C8hEFfwMIjsaufeufx4
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

These GPUs have physically have the same regions as the base case
("main" + "cx_mem" + "cx_dbgc"). Remove the specific override.

Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/display/msm/gpu.yaml | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/Documentation/devicetree/bindings/display/msm/gpu.yaml b/Documentation/devicetree/bindings/display/msm/gpu.yaml
index 826aafdcc20b..ae8f76136fa2 100644
--- a/Documentation/devicetree/bindings/display/msm/gpu.yaml
+++ b/Documentation/devicetree/bindings/display/msm/gpu.yaml
@@ -378,12 +378,6 @@ allOf:
             - const: xo
               description: GPUCC clocksource clock
 
-        reg-names:
-          minItems: 1
-          items:
-            - const: kgsl_3d0_reg_memory
-            - const: cx_dbgc
-
       required:
         - clocks
         - clock-names

-- 
2.52.0

