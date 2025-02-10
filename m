Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C34DA2E7C2
	for <lists+dri-devel@lfdr.de>; Mon, 10 Feb 2025 10:32:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E6A3210E4D6;
	Mon, 10 Feb 2025 09:32:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="ILENKlOA";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com
 [209.85.128.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E865F10E4DF
 for <dri-devel@lists.freedesktop.org>; Mon, 10 Feb 2025 09:32:52 +0000 (UTC)
Received: by mail-wm1-f50.google.com with SMTP id
 5b1f17b1804b1-43690d4605dso27484705e9.0
 for <dri-devel@lists.freedesktop.org>; Mon, 10 Feb 2025 01:32:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1739179971; x=1739784771; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=ivOjMNAu6T20TyvE3uQMGt0H1lW20ezA1AZm+/b+uno=;
 b=ILENKlOAI+fhYRBkBTFVbNNbXwFyl26/CdVfV4vVggLxn4KGv2ZlqBWK3jJmAsXsVb
 e0eORqbuFLfAlQed0ENWkrqSn9Pmi0qCReq8qs0tY4GSWm8K1sr+EUDLAV4lYv7/Tbdj
 wVDyxJ+omvMk9pwd0TZXe3bCcux9zdJ3z/dI5sdkjl+fuTf8zRsrOA6qSL+XYTSUIHKo
 2dt74MJLA0HusLay82+mLddpuHOe29DQK3OLF9VcZMp86mIiqtxqd1NLmbm2ClCUqoCv
 HEIbAu4zMH9p98pIdP7nhtX0uZAXoQtBxfiNBjT2HLTWNxUQCWYzTbc3jL94JTndzyuW
 gWBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1739179971; x=1739784771;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ivOjMNAu6T20TyvE3uQMGt0H1lW20ezA1AZm+/b+uno=;
 b=xCBIZFas81JoP7FxaDEXrMxdw6GcM6DAKMhiYpAV+YSoyc6AIn5IuUjOQY/hquUkcy
 gjtF4fIS3+0nrOD+NhhiiOn1Z0+83qujjdtkiutlxF0sNPstUi5CVEYvQrmnWLxi0BxL
 KYq9knfpBDVJ34jkYEki6/Vm+063neN49pKsi3Vl6AVn+fTqLohV/FoxP7trHwLKLHIy
 I+p6NSilWx9lEXfFpwFldz8Gn/WyVrqUz22tFzf3WvYpH37juLDB1q/qWmOFpY2lYf/B
 VfNtoQvRswpApR4eL14pnk40ENSmv2z+0DvWhbAUcfNkCClachX5DRKIQz8Qm4RiTMt0
 f/og==
X-Forwarded-Encrypted: i=1;
 AJvYcCW4+8UXrHv4X9pva74GLsUZytnWJvJ2z/zTmVA/wdwyqG7i33o5C00a3JuMm+twDyBe0ItyrnADJ60=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyKxVJYfmGyIFGD7c4S4VfUBalSnM7LHYfl7eJeoWFkhtmnf4Wt
 qYU2EY1cTL/Jkmk7GHosdFScSEBGU+yD1De8Nu0+wAmnQ9wln1jDbIrYcMLT24LBjb72iiDU47u
 v
X-Gm-Gg: ASbGncuSzTYEP4WXsu7BId6PCfdAlgecS//G+qJTjquBTE8GtPbwhaOhlP7v8weM78a
 XuiusVNGsS8EBExCnSo5oUdt2UDPDBCrGRkLHa1cjvRHZMCZuXYsLuS0s7FSwbcNb1P47APvXu+
 fqNms//Fyu7z9ZqEg12MFAWP8UA/ei4pBL/CBQsZE65BQisWY6siU2yPycNhcQg2E6DmExzJ9LS
 fHHROK4fnOemB57uBp4+PW2PtpjxIdchjyytIgNNNu8xlzP7gu1d9JnoNi5Uol1xA7ZMawKwrKX
 cXagB+frPm95qNW7YjrW/zbsd5qOGcS3BEPX
X-Google-Smtp-Source: AGHT+IEXic0KGgdCNoDozQ+TrMOpmSNABTZomzw86A4Rq2MFbbxQTIHAqCCxV6B4m2nofvxVYz86XA==
X-Received: by 2002:a05:600c:a085:b0:439:4858:3c77 with SMTP id
 5b1f17b1804b1-43948583e32mr10166515e9.19.1739179971334; 
 Mon, 10 Feb 2025 01:32:51 -0800 (PST)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:8261:5fff:fe11:bdda])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4391da964e2sm141340895e9.4.2025.02.10.01.32.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 10 Feb 2025 01:32:50 -0800 (PST)
From: Neil Armstrong <neil.armstrong@linaro.org>
Date: Mon, 10 Feb 2025 10:32:41 +0100
Subject: [PATCH v3 3/4] arm64: dts: qcom: sm8550: add missing cpu-cfg
 interconnect path in the mdss node
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250210-topic-sm8x50-mdss-interconnect-bindings-fix-v3-3-54c96a9d2b7f@linaro.org>
References: <20250210-topic-sm8x50-mdss-interconnect-bindings-fix-v3-0-54c96a9d2b7f@linaro.org>
In-Reply-To: <20250210-topic-sm8x50-mdss-interconnect-bindings-fix-v3-0-54c96a9d2b7f@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1111;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=0VhCEsAiA8uPe5Ksn8CTqXiIWWrYseP1TtWKONRb3So=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBnqce9a+PuxOtQdQqE+HfNwM8HRtkEQ+iNfewus0Px
 3gA067GJAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCZ6nHvQAKCRB33NvayMhJ0f3YEA
 C2IR91za74T7rkm4X8WnFczjhLLGe/bDhH30O+tHMJHPZpHuNcgPxVCrVu5HDVnA+CoonOlsLyMmGR
 Jp3vHkZo8Vhst8fR8w6WDqfNKkmBxG/qCqVHKWpyWCF0CbHhwY0hOxz55IWOVQUT4ysS9SFVEZ7fqb
 6qOCD0/1bJrOjqKLQgDT92ohfhYkxKqknDCHq3qKRanNpOB2Ac/ncqEEEEGBx6Mt/UEkPSt54sA6Cp
 JrdcNKEBa/AGTZUJXFt4bveCuEqJ3uKbxgNWY7hcIyWMiPPKvKu5lsgIkTa+elFRYzyu8yNytBryP0
 bhYS+2jbgZs4MqhwkcjFdQ0Jvl4Mnq9NP2NdefuI4oDfbe6oXmUogwG5uq9BLAFbRdo9YGgn53SdsW
 KBA17FGE/w6eDcSrCP6jdGgwiMmHhUJg1wptXok7dOLRMw+2kFWW63qVLRBEEZI69q+8egTr7Hb7Xl
 IX1NcKup1NFo4rkH9c5FNx4AJQENpUVt/m8LHrVfTbJVAcNw3DeKttBS3wabq7dl+3a4RjacS/jOLV
 lD/n+YAZde0XUW1b7QUQqRdezBxoUf52BN+DqRBP9oq6/KS4zZyzYRn/rHYjxT5gcVdWJusxDpkrru
 NiyknZLeyksBYnWG5NyKIlo0o+uHRIYePklQrUZ/6gKWaMxw1MZtEAZB6f5g==
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
Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 arch/arm64/boot/dts/qcom/sm8550.dtsi | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sm8550.dtsi b/arch/arm64/boot/dts/qcom/sm8550.dtsi
index eac8de4005d82f246bc50f64f09515631d895c99..702b55296b18ff2f8ea62a3391b7de2804aa9f65 100644
--- a/arch/arm64/boot/dts/qcom/sm8550.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8550.dtsi
@@ -3020,8 +3020,9 @@ mdss: display-subsystem@ae00000 {
 
 			power-domains = <&dispcc MDSS_GDSC>;
 
-			interconnects = <&mmss_noc MASTER_MDP 0 &mc_virt SLAVE_EBI1 0>;
-			interconnect-names = "mdp0-mem";
+			interconnects = <&mmss_noc MASTER_MDP 0 &mc_virt SLAVE_EBI1 0>,
+					<&gem_noc MASTER_APPSS_PROC 0 &config_noc SLAVE_DISPLAY_CFG 0>;
+			interconnect-names = "mdp0-mem", "cpu-cfg";
 
 			iommus = <&apps_smmu 0x1c00 0x2>;
 

-- 
2.34.1

