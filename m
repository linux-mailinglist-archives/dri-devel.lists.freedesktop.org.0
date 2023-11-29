Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 420597FDA2E
	for <lists+dri-devel@lfdr.de>; Wed, 29 Nov 2023 15:45:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 97A6310E576;
	Wed, 29 Nov 2023 14:45:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com
 [IPv6:2a00:1450:4864:20::131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EA91B10E605
 for <dri-devel@lists.freedesktop.org>; Wed, 29 Nov 2023 14:44:50 +0000 (UTC)
Received: by mail-lf1-x131.google.com with SMTP id
 2adb3069b0e04-50abbb23122so8934515e87.3
 for <dri-devel@lists.freedesktop.org>; Wed, 29 Nov 2023 06:44:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1701269089; x=1701873889; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=x8Ud0RYAeHgIKaviw6GV2Mnmt4ajtcz1/Tj2KEhmPX4=;
 b=LR61LaJQneB/bvGZbZ13ImD1RN8gYLDi3PRTUIMIincjdJCCSp+FYJEv00xSjXXXhd
 7gyqwxfznl9Tek/nvjGeG2lIRt6TXFfCs5fSLQLrFaYvgXGenhqTINENjsRcid6JaaR7
 Fy9rNnOQ1x4IIyhuGWo3zILE8YFS5k/7vWu+vold9nQKks3oguWz/AXN/A25sp5tdJsV
 3Bunc2oBtzmKL7SSwiwpokd1XgbYbAGGVYd9kXP41ls83ltDlwiuFEnX4PZ7oqg8QzgA
 EGujeudoFwNG0vwBFosWYFyMPclPq8jAr2JzwC9j0a88YuJpTAlVYX1hzOoJ2qwAo50I
 Z8vA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1701269089; x=1701873889;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=x8Ud0RYAeHgIKaviw6GV2Mnmt4ajtcz1/Tj2KEhmPX4=;
 b=dOKPnPGXmK8LgC4r9/WinarfvOju/vaVm/IlWtuOzq4pb79mirsVbSps9eY8CweBkl
 Gngn27ke9sqUQ4CcgORYa9eiuJk0xSPj10t+UgMFTekJ2mV0uOQXmtkL6mZ1Dk05P6tQ
 db7/M+jgznsYlfdroVeodi+9wWKTaUxOC9uhwzoMhYRw2A2cCVJMkuyPcF44Grbybp80
 S296xWb1qyYGw9H/xXRaAgrLmx4idZSV2Qa3v22R/cnRCpfPttOy3IUVYt+vX4KwkwKF
 zPZzyKvdObuOKakoFPqkcX45X0wG0zMXuzy4J/Au3J6+VkeRnHmVAijZ3XD5OoqqA31I
 KE+w==
X-Gm-Message-State: AOJu0Yw6CtO5E4Y1zeiaLT0T8RMhijwrQj+Xjf1yC/CxOFlf19NT/e67
 njCS+ldpe1Ja4tkpofCB2OwR/g==
X-Google-Smtp-Source: AGHT+IEucXvhP6CZlLyjmhm2eErpw/rjkI+AVAy2NrjVrl9sMS9FNrRYfvXWv/KyNqVzhsUfV8Y3cw==
X-Received: by 2002:a05:6512:11eb:b0:50a:a6b4:de4f with SMTP id
 p11-20020a05651211eb00b0050aa6b4de4fmr10377057lfs.36.1701269089155; 
 Wed, 29 Nov 2023 06:44:49 -0800 (PST)
Received: from [10.167.154.1]
 (178235187166.dynamic-4-waw-k-2-3-0.vectranet.pl. [178.235.187.166])
 by smtp.gmail.com with ESMTPSA id
 e27-20020a1709062c1b00b009fda627abd9sm7913738ejh.79.2023.11.29.06.44.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 29 Nov 2023 06:44:48 -0800 (PST)
From: Konrad Dybcio <konrad.dybcio@linaro.org>
Date: Wed, 29 Nov 2023 15:44:09 +0100
Subject: [PATCH v3 12/12] arm64: dts: qcom: qrb2210-rb1: add wifi variant
 property
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20231125-topic-rb1_feat-v3-12-4cbb567743bb@linaro.org>
References: <20231125-topic-rb1_feat-v3-0-4cbb567743bb@linaro.org>
In-Reply-To: <20231125-topic-rb1_feat-v3-0-4cbb567743bb@linaro.org>
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, Loic Poulain <loic.poulain@linaro.org>, 
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
 Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
 Georgi Djakov <djakov@kernel.org>, Will Deacon <will@kernel.org>, 
 Robin Murphy <robin.murphy@arm.com>, Joerg Roedel <joro@8bytes.org>, 
 Krishna Manikandan <quic_mkrishn@quicinc.com>, 
 Robert Marko <robimarko@gmail.com>, Das Srinagesh <quic_gurus@quicinc.com>, 
 cros-qcom-dts-watchers@chromium.org
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1701269042; l=1902;
 i=konrad.dybcio@linaro.org; s=20230215; h=from:subject:message-id;
 bh=1sgurZzJDT6Mn40jAYTNDegr3ChD6TId8sRBg0GBQe8=;
 b=cvzdQPMDO1F9MJyUcHFhovdEgAZaKe0knG3gwp2ASXtsecxDnq1fzPtkf1NxnntN9lGnvr+4o
 HRe4f+YzatxCdTcA3W9nOqNu8vqMZKGisf58bgSH/Wc7Zvb5uMJJ/lr
X-Developer-Key: i=konrad.dybcio@linaro.org; a=ed25519;
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
Cc: devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Konrad Dybcio <konrad.dybcio@linaro.org>,
 iommu@lists.linux.dev, Marijn Suijten <marijn.suijten@somainline.org>,
 freedreno@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

The RB1 platform doesn't have board-specific board-id programmed, it uses
generic 0xff. Thus add the property with the 'variant' of the
calibration data.

Note: the driver will check for the calibration data for the following
IDs, so existing board-2.bin files will continue to work.

- 'bus=snoc,qmi-board-id=ff,qmi-chip-id=120,variant=Thundercomm_RB1'
- 'bus=snoc,qmi-board-id=ff,qmi-chip-id=120'
- 'bus=snoc,qmi-board-id=ff'

For the reference, the board is identified by the driver in the
following way:

ath10k_snoc c800000.wifi: qmi chip_id 0x120 chip_family 0x4007 board_id 0xff soc_id 0x40670000
ath10k_snoc c800000.wifi: qmi fw_version 0x337302d3 fw_build_timestamp 2023-01-06 01:50 fw_build_id QC_IMAGE_VERSION_STRING=WLAN.HL.3.3.7.c2-00723-QCAHLSWMTPLZ-1
ath10k_snoc c800000.wifi: wcn3990 hw1.0 target 0x00000008 chip_id 0x00000000 sub 0000:0000
ath10k_snoc c800000.wifi: kconfig debug 0 debugfs 0 tracing 0 dfs 0 testmode 0
ath10k_snoc c800000.wifi: firmware ver  api 5 features wowlan,mgmt-tx-by-reference,non-bmi crc32 b3d4b790
ath10k_snoc c800000.wifi: htt-ver 3.114 wmi-op 4 htt-op 3 cal file max-sta 32 raw 0 hwcrypto 1

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>
Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
 arch/arm64/boot/dts/qcom/qrb2210-rb1.dts | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/qcom/qrb2210-rb1.dts b/arch/arm64/boot/dts/qcom/qrb2210-rb1.dts
index ac597eb3fe9d..bd7bcf803654 100644
--- a/arch/arm64/boot/dts/qcom/qrb2210-rb1.dts
+++ b/arch/arm64/boot/dts/qcom/qrb2210-rb1.dts
@@ -535,6 +535,7 @@ &wifi {
 	vdd-1.8-xo-supply = <&pm2250_l13>;
 	vdd-1.3-rfa-supply = <&pm2250_l10>;
 	vdd-3.3-ch0-supply = <&pm2250_l22>;
+	qcom,ath10k-calibration-variant = "Thundercomm_RB1";
 	status = "okay";
 };
 

-- 
2.43.0

