Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 89BBCBD87D9
	for <lists+dri-devel@lfdr.de>; Tue, 14 Oct 2025 11:42:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E29A010E58B;
	Tue, 14 Oct 2025 09:42:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="bUh7GGlf";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0085010E1F5;
 Tue, 14 Oct 2025 09:42:27 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id C151948BF9;
 Tue, 14 Oct 2025 09:42:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 8FEDBC113D0;
 Tue, 14 Oct 2025 09:42:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1760434947;
 bh=3vsViLjDOPyapy+WokuHpqSNPBuplnGz6KFteCnagIY=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
 b=bUh7GGlfZ17p+Kq1YbU5fOnibf99kqiu2JlDEDKMQqxymXsKtZkJB4qFzhVLRmZlR
 LtpBwWraXebkstlQM/nR84QC/w5fqNI+iBaP+t91YDS/OYzp1/PzbIcfnDUUq7SD3e
 MTA3VuuMqxjgzJwM4963Av9cYHNISyogcCw6296zDqJ/OLYbHwEWTcQohyRGCsWpHa
 86DbHSSiM7H0L1orUz8/he1UreZSvAvhDNFMxo5S34CgtggzQYHym5BJ81bv+wNCBU
 vSbWvEtGReClpcLut6KGnoZmjrs67blW2F4KjBgtnKnAOLtYu7pcBk5HNCEpwDYlC/
 /pgdKy7G649Kw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by smtp.lore.kernel.org (Postfix) with ESMTP id 7BB25CCD184;
 Tue, 14 Oct 2025 09:42:27 +0000 (UTC)
From: Xiangxu Yin via B4 Relay
 <devnull+xiangxu.yin.oss.qualcomm.com@kernel.org>
Date: Tue, 14 Oct 2025 17:42:10 +0800
Subject: [PATCH v2 1/3] dt-bindings: display/msm: Add SM6150 DisplayPort
 controller
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251014-add-displayport-support-to-qcs615-devicetree-v2-1-1209df74d410@oss.qualcomm.com>
References: <20251014-add-displayport-support-to-qcs615-devicetree-v2-0-1209df74d410@oss.qualcomm.com>
In-Reply-To: <20251014-add-displayport-support-to-qcs615-devicetree-v2-0-1209df74d410@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1760434945; l=1330;
 i=xiangxu.yin@oss.qualcomm.com; s=20241125; h=from:subject:message-id;
 bh=pd0jI9Dkdm+Hpa42+VfaO85gcD6oUV4iAuhBm2NnzVg=;
 b=lnMjfaYw369vUsnd+dbLjva1gpyTXOX7x5OFH9Bf7zEF1A5UwDY93zxCpfJh3bc1mpBo9nmYU
 eo1cYeAb9BQAVtUxgXjGiN8+UFKXlgAsTT1ePqEQrbf9ElcK/9aLEad
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

Describe the DisplayPort controller for Qualcomm SM6150 SoC.

Signed-off-by: Xiangxu Yin <xiangxu.yin@oss.qualcomm.com>
---
 .../devicetree/bindings/display/msm/qcom,sm6150-mdss.yaml     | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/msm/qcom,sm6150-mdss.yaml b/Documentation/devicetree/bindings/display/msm/qcom,sm6150-mdss.yaml
index 9ac24f99d3ada1c197c9654dc9babebccae972ed..935eca23ce6b30b81b3ad778e5fcacc817a230c3 100644
--- a/Documentation/devicetree/bindings/display/msm/qcom,sm6150-mdss.yaml
+++ b/Documentation/devicetree/bindings/display/msm/qcom,sm6150-mdss.yaml
@@ -51,6 +51,16 @@ patternProperties:
       compatible:
         const: qcom,sm6150-dpu
 
+  "^displayport-controller@[0-9a-f]+$":
+    type: object
+    additionalProperties: true
+    properties:
+      compatible:
+        items:
+          - const: qcom,sm6150-dp
+          - const: qcom,sm8150-dp
+          - const: qcom,sm8350-dp
+
   "^dsi@[0-9a-f]+$":
     type: object
     additionalProperties: true
@@ -132,6 +142,7 @@ examples:
                 port@0 {
                   reg = <0>;
                   dpu_intf0_out: endpoint {
+                      remote-endpoint = <&mdss_dp0_in>;
                   };
                 };
 

-- 
2.34.1


