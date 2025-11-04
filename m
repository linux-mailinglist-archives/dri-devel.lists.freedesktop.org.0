Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 15841C2EC59
	for <lists+dri-devel@lfdr.de>; Tue, 04 Nov 2025 02:34:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1DB9010E505;
	Tue,  4 Nov 2025 01:33:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="NlGdjSja";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0E11110E4FD;
 Tue,  4 Nov 2025 01:33:48 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 5C7FD444A6;
 Tue,  4 Nov 2025 01:33:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 1885EC116C6;
 Tue,  4 Nov 2025 01:33:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1762220027;
 bh=hfV6yFpSGRUXcLjVORiZFdp8dP2d/7/m9mfb2ai9LEA=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
 b=NlGdjSjaKS/K1bQzE2m0G9X8KFhTMAGBA+YcjiD+kgmE8HMXx8vgJEjak9ttNvqCu
 A+xizZMZSIrHoEwZIaWs5MarJM+8+3xOjUg1NUEaZxBVtqM/qVOI01D4n5bnThXaJa
 ECT9/3jZGg8zpPE4wc7NKs76iXNH3+LOe0jx8RaIeyuOyfUs20wenI+1HofPoXlgGh
 QKUk6snKlGIJ6wQPfDDO7aMc6QYqAEmTBDwHgdpD6ec7A9oY5kDg29KgUIvD8JR1zV
 w8u2fojp/qqlSWXmLYBhHAh99l1ya6NYiTnLFOCQ1bLcxPHLNdcnr9M+nga+cz5NmR
 5lLj7JKo/rZRA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by smtp.lore.kernel.org (Postfix) with ESMTP id 02F8FCCFA03;
 Tue,  4 Nov 2025 01:33:47 +0000 (UTC)
From: Xiangxu Yin via B4 Relay
 <devnull+xiangxu.yin.oss.qualcomm.com@kernel.org>
Date: Tue, 04 Nov 2025 09:33:24 +0800
Subject: [PATCH v7 2/4] dt-bindings: display: msm: sm6150-mdss: Fix example
 indentation and OPP values
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251104-add-displayport-support-to-qcs615-devicetree-v7-2-e51669170a6f@oss.qualcomm.com>
References: <20251104-add-displayport-support-to-qcs615-devicetree-v7-0-e51669170a6f@oss.qualcomm.com>
In-Reply-To: <20251104-add-displayport-support-to-qcs615-devicetree-v7-0-e51669170a6f@oss.qualcomm.com>
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
 Xiangxu Yin <xiangxu.yin@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1762220025; l=2608;
 i=xiangxu.yin@oss.qualcomm.com; s=20241125; h=from:subject:message-id;
 bh=hrYLkUwYAU8obwGE7SDVX+uxOItffNgzBGR1+RWmW7E=;
 b=oWGKTdUvdtg+8f4otWaQLlqYn98bUDSy5m0LJRmtRJSF6kBM6+9xElbMw5MdaQestwrMyEJXg
 H7UFBcw3fa5BtYc7VP9mCUW0PmZXX56VPo2jY53xHS4ULe/kabfpsFG
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

From: Xiangxu Yin <xiangxu.yin@oss.qualcomm.com>

Improve the binding example by fixing indentation and adding missing
blank lines for better readability. Also correct the OPP clock values
to match the actual SM6150 DTS configuration.

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
Signed-off-by: Xiangxu Yin <xiangxu.yin@oss.qualcomm.com>
---
 .../bindings/display/msm/qcom,sm6150-mdss.yaml     | 32 ++++++++++++----------
 1 file changed, 17 insertions(+), 15 deletions(-)

diff --git a/Documentation/devicetree/bindings/display/msm/qcom,sm6150-mdss.yaml b/Documentation/devicetree/bindings/display/msm/qcom,sm6150-mdss.yaml
index 98949deed9ae0a23148c5bc9877e6b7250a2f64a..46e9335f849fe8afd8c92ad68876fd741a81c281 100644
--- a/Documentation/devicetree/bindings/display/msm/qcom,sm6150-mdss.yaml
+++ b/Documentation/devicetree/bindings/display/msm/qcom,sm6150-mdss.yaml
@@ -138,35 +138,37 @@ examples:
                 #size-cells = <0>;
 
                 port@0 {
-                  reg = <0>;
-                  dpu_intf0_out: endpoint {
-                  };
+                    reg = <0>;
+
+                    dpu_intf0_out: endpoint {
+                    };
                 };
 
                 port@1 {
-                  reg = <1>;
-                  dpu_intf1_out: endpoint {
-                      remote-endpoint = <&mdss_dsi0_in>;
-                  };
+                    reg = <1>;
+
+                    dpu_intf1_out: endpoint {
+                        remote-endpoint = <&mdss_dsi0_in>;
+                    };
                 };
             };
 
             mdp_opp_table: opp-table {
                 compatible = "operating-points-v2";
 
-                opp-19200000 {
-                  opp-hz = /bits/ 64 <19200000>;
-                  required-opps = <&rpmhpd_opp_low_svs>;
+                opp-192000000 {
+                    opp-hz = /bits/ 64 <192000000>;
+                    required-opps = <&rpmhpd_opp_low_svs>;
                 };
 
-                opp-25600000 {
-                  opp-hz = /bits/ 64 <25600000>;
-                  required-opps = <&rpmhpd_opp_svs>;
+                opp-256000000 {
+                    opp-hz = /bits/ 64 <256000000>;
+                    required-opps = <&rpmhpd_opp_svs>;
                 };
 
                 opp-307200000 {
-                  opp-hz = /bits/ 64 <307200000>;
-                  required-opps = <&rpmhpd_opp_nom>;
+                    opp-hz = /bits/ 64 <307200000>;
+                    required-opps = <&rpmhpd_opp_nom>;
                 };
             };
         };

-- 
2.34.1


