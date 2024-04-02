Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 336D98949A3
	for <lists+dri-devel@lfdr.de>; Tue,  2 Apr 2024 04:52:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2BC1210F820;
	Tue,  2 Apr 2024 02:51:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="vzyzVWAx";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com
 [209.85.167.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B812210F81B
 for <dri-devel@lists.freedesktop.org>; Tue,  2 Apr 2024 02:51:49 +0000 (UTC)
Received: by mail-lf1-f41.google.com with SMTP id
 2adb3069b0e04-513e6777af4so7607811e87.2
 for <dri-devel@lists.freedesktop.org>; Mon, 01 Apr 2024 19:51:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1712026308; x=1712631108; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=bQopQsz++KyAxMIyytKdPL33zkWupusjZ2yKHzV+hFA=;
 b=vzyzVWAxv8QkD70QrbEF/dnZDsZwyHTqO81Z24ilrgksxygG/jBSNGKW/SyA7ZBiGC
 7a0AcNvZCxlLDMe/Q+cuBcsCwMvfQp1blqsiQ3tXJEbmdgYwCIqVbyLHgwmvguNGmilG
 oUkQ724fplD0MNwciVKTo45CQPLVgBi4YTLirOmsco33sv2TB6KkXYL2vDq/0rGvakSy
 C/0EvPxDEUstHbf6Q7W+F9/828/e9MUqaWuXdCoTwUTajxPOSrpSRCV9xNV0BrMrw/ce
 C9QI7kbZbmRnkZS6RzbthLbaec2LA9FPCwr5LpTzPB6DGdsz8sMbPlY/wayoCjQYts4J
 4ibQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1712026308; x=1712631108;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=bQopQsz++KyAxMIyytKdPL33zkWupusjZ2yKHzV+hFA=;
 b=mzKqav4GnHq0WxCRA19xdYUjVaJD9jbHTCSE2oLfbr9p02KnxNxncGGKl1CdRtO9JN
 5NQbc9B7Mpz6q02LO7hD62ZDhVf/P5ELsSkh9biLHXKHqURKFtpFQuWWWAEQdv39GkO4
 G4UVhi+a79t0mKqM4xrJY18MKTkOnWLNzOpibZyT2/ZsgRn15MCUKzQYT2Aglf84CdY7
 rS012p5hPUo3ngu3Xp4s1sYLWavy2m0WvvBHFAL0+GQw+PX/50Ee3+E6Vkq3BYz3Uq6B
 OiVy/0aFy6Bk/dlM1EP6jHSZB8ZmvNQ6ZSUzrtziZlRSnqG4lE0iiH3cxc9amdrLYnUT
 CfUg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWrg9xHYOZDYrLJ+5rcwYHse55qGXMD/2KjKMYcXVuERG82jwDLGBmuCtjXXmgO1NNwjT8hd+c4dvWqKQpujyUWazAmvEOEGPCm7VcHoe57
X-Gm-Message-State: AOJu0Yzf2h6mpBtTXrE+LHwehtjI2SNFzg2tJCuo52fpvVgumktwM8Bc
 FCMGnolBr5HuMtMzNFw5p6OfWZeMTlgtRy3Ib8nlQRz+Y7L7o1dVVHKsCtdZYfI=
X-Google-Smtp-Source: AGHT+IGrSyyN+7Ji7Z1kG2TLT9cUTAWr+kwdCNpmHMNaX/aEpYnUKXTWqSsOc7w0mjIyo3IzfenuEg==
X-Received: by 2002:ac2:4e11:0:b0:516:9792:773c with SMTP id
 e17-20020ac24e11000000b005169792773cmr271696lfr.48.1712026308078; 
 Mon, 01 Apr 2024 19:51:48 -0700 (PDT)
Received: from umbar.lan ([192.130.178.91]) by smtp.gmail.com with ESMTPSA id
 h26-20020ac24dba000000b00516a1e2a6fcsm738824lfe.256.2024.04.01.19.51.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 01 Apr 2024 19:51:47 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Tue, 02 Apr 2024 05:51:46 +0300
Subject: [PATCH v2 4/4] arm64: dts: qcom: sc8180x: add dp_p1 register
 blocks to DP nodes
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240402-fd-fix-schema-v2-4-39bf90051d83@linaro.org>
References: <20240402-fd-fix-schema-v2-0-39bf90051d83@linaro.org>
In-Reply-To: <20240402-fd-fix-schema-v2-0-39bf90051d83@linaro.org>
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>, Vinod Koul <vkoul@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1307;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=M5PDgsfLVIKABExlt6TlS2fGlnl3XAgxVoXclxwHIH8=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBmC3LAtIcMeYCV8wdzx41rVNpZHdO6Hqdb9Acke
 KlEy0hPopqJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZgtywAAKCRCLPIo+Aiko
 1ZjECACMIjKtBuev/aHDLstjDyCFgvFtLOdcuFsNWnXJkiuqfXtkj2iXnBViZTI1iuu3SxTOj/N
 /QhUrXojOtplpkT8oJ9Z4JuviS+ecli1R4spJ6s5TIYoyRKmwhyfuTKQHGxwrKmNj/ifrevPDIm
 LDH+Wn9RJltc1pHf29C75SWF8mRhn56piYYrecCbg/mNH+ofXXAmiqTiLzrhVwlKol9I1UGtVtz
 0Q7U9r7R7Uhl73FePEmAEcTXytYDJT+qsjMAOFt75+6Fom3V/tDslWrf18yZDG5utyDVkjI0zmu
 gBUKRHzEsCRMJc+KXVbw+JLa0ZjIiGjCuPHbWzXmty5qcb0t
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

DisplayPort nodes must declare the dp_p1 register space in addition to
dp_p0. Add corresponding resource to DisplayPort DT nodes.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 arch/arm64/boot/dts/qcom/sc8180x.dtsi | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sc8180x.dtsi b/arch/arm64/boot/dts/qcom/sc8180x.dtsi
index 6d74867d3b61..019104bd70fb 100644
--- a/arch/arm64/boot/dts/qcom/sc8180x.dtsi
+++ b/arch/arm64/boot/dts/qcom/sc8180x.dtsi
@@ -3029,7 +3029,8 @@ mdss_dp0: displayport-controller@ae90000 {
 				reg = <0 0xae90000 0 0x200>,
 				      <0 0xae90200 0 0x200>,
 				      <0 0xae90400 0 0x600>,
-				      <0 0xae90a00 0 0x400>;
+				      <0 0xae90a00 0 0x400>,
+				      <0 0xae91000 0 0x400>;
 				interrupt-parent = <&mdss>;
 				interrupts = <12>;
 				clocks = <&dispcc DISP_CC_MDSS_AHB_CLK>,
@@ -3105,7 +3106,8 @@ mdss_dp1: displayport-controller@ae98000 {
 				reg = <0 0xae98000 0 0x200>,
 				      <0 0xae98200 0 0x200>,
 				      <0 0xae98400 0 0x600>,
-				      <0 0xae98a00 0 0x400>;
+				      <0 0xae98a00 0 0x400>,
+				      <0 0xae99000 0 0x400>;
 				interrupt-parent = <&mdss>;
 				interrupts = <13>;
 				clocks = <&dispcc DISP_CC_MDSS_AHB_CLK>,

-- 
2.39.2

