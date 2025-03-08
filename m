Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0823AA5775A
	for <lists+dri-devel@lfdr.de>; Sat,  8 Mar 2025 02:42:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9253510EC46;
	Sat,  8 Mar 2025 01:42:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="pmsl+QWu";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7C74F10E36B;
 Sat,  8 Mar 2025 01:42:40 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 7A7905C661F;
 Sat,  8 Mar 2025 01:40:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A75FFC4CEED;
 Sat,  8 Mar 2025 01:42:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1741398155;
 bh=5hWJtl0bbFBeYtO0tEd4eEDLjlvjsXOMVv/w4vcQqSs=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
 b=pmsl+QWuYcfHXCLMH9ZyF/fZKnctpG011XtInd86CbOmleTeoGexB/I/uNZfBfVOi
 uCedBF3+K36az7pZ2k8kxkqd6rZ+zT5iLvyvhH7Y6MObbhJasz6t+NAwXh/OkbM6rq
 0+3l8E7zMZwx2H3MkW+xWPTU3Zb52TJVQSjm0Th7WIW6pkabRCHqIzfPNnbS8gAGsx
 sj2e5r5tJGI1AIkeithbErEE8ugz+qZ9Cn1ea5S+yg+Mm51jSn3oojPVK0O7sMW+cj
 3xiTRRSXxkxg4b2kxtv+bvNuGNGbB/ha9cF6Wd/3iRZ1OSX+vL4poJ5RKvMFXVOb5A
 k6lyjszMaG16Q==
From: Dmitry Baryshkov <lumag@kernel.org>
Date: Sat, 08 Mar 2025 03:42:19 +0200
Subject: [PATCH 01/10] dt-bindings: display/msm: dp-controller: describe
 SAR2130P
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250308-sar2130p-display-v1-1-1d4c30f43822@linaro.org>
References: <20250308-sar2130p-display-v1-0-1d4c30f43822@linaro.org>
In-Reply-To: <20250308-sar2130p-display-v1-0-1d4c30f43822@linaro.org>
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <lumag@kernel.org>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Kuogee Hsieh <quic_khsieh@quicinc.com>, 
 Krishna Manikandan <quic_mkrishn@quicinc.com>, 
 Jonathan Marek <jonathan@marek.ca>, Bjorn Andersson <andersson@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Will Deacon <will@kernel.org>, 
 Robin Murphy <robin.murphy@arm.com>, Joerg Roedel <joro@8bytes.org>, 
 Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, iommu@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=883;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=ACdmjYmshapneuIqWrn19zGGrSmaveZcBX5lcfEgHW8=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBny6B+bI8+Wn/W3nwtSqCnoIReC3di5Id0PJg4f
 sU5YOYJqvqJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZ8ugfgAKCRCLPIo+Aiko
 1TXwCAChR5vuCAEudmiTE+lhAXH7j22cWADUqnSu1Z0cDDyBH67GZhFTX/Zh61+onFk0hMYw4M3
 +tJYPJ1giq8/Y8E/8EGS+3UTQ8op8Qx6SH8PRHz69gn2GvKuGoHUBfu80Lczpf+Hp5nWJaKNo89
 8sO27klWACmew8HJtlT4HUvHXloT4nEYRDVnMUI59tJIAeupKYxcrG80d7cOT/s6Nc96gslew4R
 5jsSwR/HCSp2ZRHKFwZvBZYAa3h7e7yaizcuJZISWm99YaaPlmNqGEvIc1jB42ryovl3pc9Y98B
 wZ7O8AdcP5So2QW236a+ZwiV2oTeGmS0UZxMg3quRJjqYKlX
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
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

From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

Describe DisplayPort controller present on Qualcomm SAR2130P platform.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 Documentation/devicetree/bindings/display/msm/dp-controller.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/display/msm/dp-controller.yaml b/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
index e00b88332f2fed2fc33f6d72c5cc3d827cd7594e..246bbb509bea18bed32e3a442d0926a24498c960 100644
--- a/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
+++ b/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
@@ -31,6 +31,7 @@ properties:
           - qcom,sm8650-dp
       - items:
           - enum:
+              - qcom,sar2130p-dp
               - qcom,sm6350-dp
               - qcom,sm8150-dp
               - qcom,sm8250-dp

-- 
2.39.5

