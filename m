Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 412B2A5775E
	for <lists+dri-devel@lfdr.de>; Sat,  8 Mar 2025 02:42:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 309B310EC5F;
	Sat,  8 Mar 2025 01:42:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="NrzYtW2Y";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 456F210EC5D;
 Sat,  8 Mar 2025 01:42:48 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id DE40A5C661E;
 Sat,  8 Mar 2025 01:40:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 18C5AC4CEE8;
 Sat,  8 Mar 2025 01:42:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1741398167;
 bh=8XBXBagKLZU02BZTCbyYSWDs7g51/WZF2wIxyboks8k=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
 b=NrzYtW2YaPgG88BSMLcj2ypezAXBFLlKiUIm3j9n4nZNT2JSwUB0pFcJZALq3YRYk
 FRYQIKB541q/XIuzayOlld5S/flpquYYAkBG4v0ZbT3XzmhfLQf/5kdXpfuiCOD0fH
 CURmXFjU+GqKlikhsGVlD6nbKzu5XnAO6YOhSkpKJfWILVmosp1nMeKrA23snOCrdq
 FjBAwtevWtQEzFXOshp2EX2EOukhOxpDIkHEWfxxWWYx6KJEsnini/mFJYKD18f5it
 SstIOMvnwV58CY47TGUnIN8sW7Ig0SPIVQp2EbqstAxTiV0oU2p3eYeXLrkdTKKZRs
 K/82V06EwmiYg==
From: Dmitry Baryshkov <lumag@kernel.org>
Date: Sat, 08 Mar 2025 03:42:21 +0200
Subject: [PATCH 03/10] dt-bindings: display/msm: dsi-phy-7nm: describe SAR2130P
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250308-sar2130p-display-v1-3-1d4c30f43822@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=872;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=ewz4mf+BJciAJgxQYRY8QHAfbvsLqEfizb9EYwvy3iU=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBny6B/8QvGT0I58bWL8/CWKhSUTHk77FvMas4u8
 Pymrw7zPEiJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZ8ugfwAKCRCLPIo+Aiko
 1b70B/41hJerK6Kc5l4OX8X+HjPetK3Vc9wlLVOOKKZ7VXzUWGn5JFUVW21/Cy+UkWwOmHoxrVm
 lvSzUWPl6BR4gxpcRUUUwIlvolsVbvtV5KknxRh7f6OTvNGst3POwq8idX2XCi6ZuYJx+GWWOTJ
 WdrUxGOUrSWJp8bEt4yVprFbcoAWiQWOWQml0WX7jt5z+w8j/31zlPDFUkhJNegEVvmPhi8+oHb
 +pCdC/JnvpyRDBbktIqHHQYh47ofyk0Jv8PtnA5lQKWTWovTjKtl9Bqu3wz4Heidxpzt5EtNmae
 3m5xjnoB9W58mv0kDjuf8N+sTLpYWWEOozhH+dkOjWHdZG64
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

Describe MIPI DSI PHY present on Qualcomm SAR2130P platform.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 Documentation/devicetree/bindings/display/msm/dsi-phy-7nm.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/display/msm/dsi-phy-7nm.yaml b/Documentation/devicetree/bindings/display/msm/dsi-phy-7nm.yaml
index 321470435e654f1d569fc54f6a810e3f70fb168c..f79be422b8892484216b407f7385789764c2de1b 100644
--- a/Documentation/devicetree/bindings/display/msm/dsi-phy-7nm.yaml
+++ b/Documentation/devicetree/bindings/display/msm/dsi-phy-7nm.yaml
@@ -17,6 +17,7 @@ properties:
     enum:
       - qcom,dsi-phy-7nm
       - qcom,dsi-phy-7nm-8150
+      - qcom,sar2130p-dsi-phy-5nm
       - qcom,sc7280-dsi-phy-7nm
       - qcom,sm6375-dsi-phy-7nm
       - qcom,sm8350-dsi-phy-5nm

-- 
2.39.5

