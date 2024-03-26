Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9EAFF88CDBD
	for <lists+dri-devel@lfdr.de>; Tue, 26 Mar 2024 21:03:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 021AC10F267;
	Tue, 26 Mar 2024 20:03:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="VXLqGZPG";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com
 [209.85.167.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 09B3510F259
 for <dri-devel@lists.freedesktop.org>; Tue, 26 Mar 2024 20:03:01 +0000 (UTC)
Received: by mail-lf1-f47.google.com with SMTP id
 2adb3069b0e04-515a81928faso3518348e87.1
 for <dri-devel@lists.freedesktop.org>; Tue, 26 Mar 2024 13:03:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1711483379; x=1712088179; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=YOfJ3g/to7EyTLgt+Fv+Z4h7uzKPNiClRQu90BLeUVg=;
 b=VXLqGZPG2wIR5rp9e+U3IXfyDrpm9T9pJSyGqR0W9CjFWY0BAJ76VV8S6iaAAqtFW3
 8wCGOVl8hwGasXwvIiecm7YMeqx6jXeuh88bkkBzdK4cURhuizB8dKS15pl78jd/qbay
 o2nDqJnZkVMkVU/CY9SUuNnUzJAUWgb/O3wLKGTCl1fjdRItvcHMdlzyBiXCp5Naw19a
 344NU4IZ1uNY9+65MUWpsTomX3vwOlhdT7Y20wXQFvS+vemp9gKrtb4b0MQ1IzVQYmvK
 ySLIJah4mGZLOW+VptDFCmuTVEsUdxe+kIKwH4JUtI7HXTZD93AkAwkX7VLtucCarEVT
 ZwSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1711483379; x=1712088179;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=YOfJ3g/to7EyTLgt+Fv+Z4h7uzKPNiClRQu90BLeUVg=;
 b=wR8tHAPm7AansJFvBe8mNHRFPiVm86ocnSpz93eRYXO+0gs8utFULz+D1WqcXMMS2b
 81D5vduY8Mljefy8LOvauRh3MtaLEP1jKQC2AVwK2T7HmvMWpgBIFPF4mh9qP8MedOWI
 CwsVeh1d5M23hYTDpw3kPjMCnI5vD3viR5+4VmQ7hmNHiHTVZ4AkzoYj/CQLRgj3mj+V
 PtlEfl+ir21nQUUvAr9BGzP0MwibNK9dQWiU1EsRJySVAoM7HFKCcYnku1yAOeg1Tbpo
 qts/dbnvO+H6PM9WY/hi8u65WdjxDPi6mQIbhJMdbMgu/vFS4L+UE5yxA5k8+3vhPXKD
 XmvQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVVyV3nX9KXBft3ffjw4kKfbZLBYpjFOUFuWeEM0j3/sHYqZS2clbppFcUWEztWwjO45C42mgJl9zcB/yLGfHLyVEGd1sx624mNRRM/IXuT
X-Gm-Message-State: AOJu0YwOvanNJXVCXgvFY1GnGFfzohtX8pPwe70ACzI8JFRE0nblpkVc
 b7sOG14KDfJFhgAkK7VfJQsN6z35mY1xDLtMigcKfrU4QT8xWAepIVHAMY4xaBAjagZiRWNzuUi
 s
X-Google-Smtp-Source: AGHT+IG6Rdj55PbJdCjYR5CCyMtdrzEoKEwkbUNTq+un+AW0OwlrDJTZm5V2qwPgir9to1xCsoeCwg==
X-Received: by 2002:ac2:5ece:0:b0:513:df00:8ab5 with SMTP id
 d14-20020ac25ece000000b00513df008ab5mr1630271lfq.27.1711483378883; 
 Tue, 26 Mar 2024 13:02:58 -0700 (PDT)
Received: from umbar.lan ([192.130.178.91]) by smtp.gmail.com with ESMTPSA id
 a21-20020ac25e75000000b00515a7984acbsm1279408lfr.94.2024.03.26.13.02.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 26 Mar 2024 13:02:58 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Tue, 26 Mar 2024 22:02:55 +0200
Subject: [PATCH 2/4] arm64: dts: qcom: sc8180x: drop legacy property
 #stream-id-cells
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240326-fd-fix-schema-v1-2-4475d6d6d633@linaro.org>
References: <20240326-fd-fix-schema-v1-0-4475d6d6d633@linaro.org>
In-Reply-To: <20240326-fd-fix-schema-v1-0-4475d6d6d633@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=807;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=mipBzLhXme/edDDsNRRaHmAV/zjI88iNQMd61g5M1kU=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBmAynwFhh1lFYNnond85T2qTb0Mep8Q73XymkXQ
 gV4iWTJAcmJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZgMp8AAKCRCLPIo+Aiko
 1c1EB/4h0zbDexyWBuye/7gFeqTI7lC4DyOCh8JX4d99zRLI5FyIZZmeYbOnM3At10e4qla2bRr
 BjiltyGGkqqifqM2h0TMlP6nytjAfhbroyTK9ZjybLQjGT9IZwxJ7AwgDMBPSeQ6HH6lBr6UIdO
 5ORkv3Hk0EsJkloEAOltynaRpbKsFiyI1Km/HUO7LCm6oPLY0HgtxIKLUgmgrADJPtBWl1pVVm1
 zTce9RX46VDTtwkGb0wrRVhtlxyym6KS7D+YtiIypcau+WoaEYmkuGN2NkBSHhQLZLJ/tXQ1GAc
 +h21wEYiNjMwj7iI1erW/1utMC8uXNfDl6cqzSdIgoXmPLOz
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

The property #stream-id-cells is legacy, it is not documented as valid
for the GPU. Drop it now.

Fixes: 494dec9b6f54 ("arm64: dts: qcom: sc8180x: Add display and gpu nodes")
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 arch/arm64/boot/dts/qcom/sc8180x.dtsi | 1 -
 1 file changed, 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/sc8180x.dtsi b/arch/arm64/boot/dts/qcom/sc8180x.dtsi
index 32afc78d5b76..99462b42cfc5 100644
--- a/arch/arm64/boot/dts/qcom/sc8180x.dtsi
+++ b/arch/arm64/boot/dts/qcom/sc8180x.dtsi
@@ -2225,7 +2225,6 @@ tcsr_mutex: hwlock@1f40000 {
 
 		gpu: gpu@2c00000 {
 			compatible = "qcom,adreno-680.1", "qcom,adreno";
-			#stream-id-cells = <16>;
 
 			reg = <0 0x02c00000 0 0x40000>;
 			reg-names = "kgsl_3d0_reg_memory";

-- 
2.39.2

