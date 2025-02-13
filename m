Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 66F6BA349C5
	for <lists+dri-devel@lfdr.de>; Thu, 13 Feb 2025 17:28:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6610D10E2B8;
	Thu, 13 Feb 2025 16:28:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="ZCJfubaa";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com
 [209.85.221.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A263D10EB26
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Feb 2025 16:28:06 +0000 (UTC)
Received: by mail-wr1-f49.google.com with SMTP id
 ffacd0b85a97d-38f22fe8762so563054f8f.2
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Feb 2025 08:28:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1739464085; x=1740068885; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=3gMAdHe9nCOW/Day5SH2O4Yeg0Jtw2UhdUPrNQzwgmM=;
 b=ZCJfubaaD39KXo8r7SPeA2umahWtZCFpsddpZRaolLeh5sIehuhI7MkauLxl5R7bC/
 FDGmWTVyyJNHl+PJ2PxoNO0aIzoRfATJ7AyzQhsROJ6bkp8OW/s2XCemqH+TENCnbif/
 9MNegXMMayOzWd611CNJ+/EJaP/2aYjETW8fOIi3dqRAHZIKPxEpulvSOdX2L4jiy1zp
 ceYylRhNoZXtfvmp+qDvWxoM9OuHTggXK+MCUYtjUvGocuLSu+Xveq4oXdlb+BJhUlpc
 GlYi/48+J/Ab21SWUo7HoIlSXGXZifS71/PKxEoItuIrpOUv9ABR0MGboo6zEIR9Vpa4
 O0bQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1739464085; x=1740068885;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=3gMAdHe9nCOW/Day5SH2O4Yeg0Jtw2UhdUPrNQzwgmM=;
 b=UCp/999PpwJ27Wp1dPm41yKhPqcd1uCjBn6L6/rS3Vpoy0ijBZpnp4Nsco6Nx/ViE/
 Uq6mR2Lh/CaFhEEbSigShFNXbSKsYC3Xticvb04h15TOlUxBBl1x1l6heRo36SNYjuAm
 j7J2jb4PHfq70CWRKlY1SFJHTJjqtpl7quQXNejx6OUh4HWrDKOMaWAGQba2Xooar4JJ
 Sf86/JkCsgxLpZN+JnVMYw3jNxzV6qwKBRewLOmw+tidp+BjjRpV9nJdr4OjdeEJWAp5
 Dc0b+IIrOgzlCxfLPf3dDYvRt6AnSrTqKej932+BsTc2Wxh6oQrD4VP0kqnmFr4my+8P
 amWA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVN3aiTLnOUB+oLZpuWHd/ifwn9g1CmeWxUqx0tsrk5pnSJPf+nMQWyDGlGvHGG/Ymisuo02J4BqEA=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwxzVdW5dU+7LQAb5Zf6OfHST2qnyJeDwxylxY+xWcaFRmp+Fhq
 KwZER+U3KBhoREdXdUrM+VTOj6pmTFc7NIHSwqcEqSRLrQeqXIGOFnqB7PZj7JCWIN4curlYWSm
 E
X-Gm-Gg: ASbGncvXAAHFZAKqxh3Ce/qFJeab+it9z5pn7J0vBDHGIv2552fyTH7sAHY/+A2mLpN
 R1Qa6mKsk/5389tZIqzAwKMfNZFPEg2JwFhSVqJJLYU/ZS+MGAY7W8i3jt8lLmbyBJyAodaTy6y
 vnXQj3hI7japhdEXGODqzQwfLzZjt6OWfvCH03wKa3vCP2tD06TDUkSC7vXnN86oA8edL5iUniK
 mXjdzd1M4UbcmaxD5uQZl1IrKapHDyNM/oK2wyutNxdHcETUkkgNuctPpBp7vt8XhgQm+1/aOc7
 HONbN2zaQC672r752aNpf1qh17fDsqS/4zE5
X-Google-Smtp-Source: AGHT+IFN783jsD0vQkyJDEQHVJ4b5BYNJDAUaJFST4P5psjOInvt96maC/O+1aofJniD9funT8GdTg==
X-Received: by 2002:a5d:514e:0:b0:38d:c771:1a21 with SMTP id
 ffacd0b85a97d-38dea6047abmr6092021f8f.50.1739464085106; 
 Thu, 13 Feb 2025 08:28:05 -0800 (PST)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:8261:5fff:fe11:bdda])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-38f258b412esm2274382f8f.1.2025.02.13.08.28.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 13 Feb 2025 08:28:04 -0800 (PST)
From: Neil Armstrong <neil.armstrong@linaro.org>
Date: Thu, 13 Feb 2025 17:27:58 +0100
Subject: [PATCH v4 3/4] arm64: dts: qcom: sm8550: add missing cpu-cfg
 interconnect path in the mdss node
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250213-topic-sm8x50-mdss-interconnect-bindings-fix-v4-3-3fa0bc42dd38@linaro.org>
References: <20250213-topic-sm8x50-mdss-interconnect-bindings-fix-v4-0-3fa0bc42dd38@linaro.org>
In-Reply-To: <20250213-topic-sm8x50-mdss-interconnect-bindings-fix-v4-0-3fa0bc42dd38@linaro.org>
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1250;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=B+nNvYhySNexLKydqT7QpvKu738di2JmZvO+HTQoLr8=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBnrh2QZVA90nkLoZwErzoHAU28/LMQBUONhlSRd8mm
 +v9RaryJAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCZ64dkAAKCRB33NvayMhJ0STcD/
 0VPlaHGL4tFkrxQcs22SwBCAgnmP5Gz/6xQZ2K+9Op90he/hQGUDx8o0iUnBMgtYHmoQUuWFynRzP6
 b4LJEbEdID3qff7+XGtOTKMoOIScpX6Ms7puODsLDyUe7uy/140wZ+jfH4p0UUOMaKyHZL1voUD8os
 fryMG37r66Da9Ks7u3JTI7jBNZT1jZC84/XN2T/qn7QVqBlCQabfuYIp4eNp+L9dsvVNZIQgO4UYFb
 uAVMeTqc5MmI9PTUNhFBHrsf+rCl/4U0JwmRBpmUA1jE4KEaELb71SpJLcxCv6D9yjXdBQnVw2SCNr
 Wtcts6oSJaD7jUE52JSwk680GaCtZbAabuPBGa4o5PGV80X04dPfUwe7nypRudYC0QBcPUN/HpGL9g
 W6E9FdgA7oHYMh2lv6OpzwqP+Qp2V1DIpmp9AgYeApwAGfEMqi/4z5/B37YymORg0MhTJh9Ur0Mi8i
 ozMbHBR9ysNH316HeD4bxeYYj+Z5ucqdPWYTidrqONzNutQxnr4qh7rgqRzu1hhkAPbjSswOg0NJ//
 JXeO/EP5HlYRQE+BSorlRBevO+L3QDcDC5gzshdDrwMLZRWI/5VndDG/Vtxi5rjfE/rm4z9DyUAwNd
 k3iRf9VhXTSCjtOTFtteqD1FebR1E1l16cuaZhgIciLFImeCg7RsJRmDdVIA==
X-Developer-Key: i=neil.armstrong@linaro.org; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE
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

The bindings requires the mdp0-mem and the cpu-cfg interconnect path,
add the missing cpu-cfg path to fix the dtbs check error.

Fixes: b8591df49cde ("arm64: dts: qcom: sm8550: correct MDSS interconnects")
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 arch/arm64/boot/dts/qcom/sm8550.dtsi | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sm8550.dtsi b/arch/arm64/boot/dts/qcom/sm8550.dtsi
index d02d80d731b9a8746655af6da236307760a8f662..18bcb4ac6bd8433a0f10f4826f4c6958444c080f 100644
--- a/arch/arm64/boot/dts/qcom/sm8550.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8550.dtsi
@@ -3355,8 +3355,10 @@ mdss: display-subsystem@ae00000 {
 			power-domains = <&dispcc MDSS_GDSC>;
 
 			interconnects = <&mmss_noc MASTER_MDP QCOM_ICC_TAG_ALWAYS
-					 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
-			interconnect-names = "mdp0-mem";
+					 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>,
+					<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ACTIVE_ONLY
+					 &config_noc SLAVE_DISPLAY_CFG QCOM_ICC_TAG_ACTIVE_ONLY>;
+			interconnect-names = "mdp0-mem", "cpu-cfg";
 
 			iommus = <&apps_smmu 0x1c00 0x2>;
 

-- 
2.34.1

