Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 28D507FDA17
	for <lists+dri-devel@lfdr.de>; Wed, 29 Nov 2023 15:44:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D3AD310E5F8;
	Wed, 29 Nov 2023 14:44:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x630.google.com (mail-ej1-x630.google.com
 [IPv6:2a00:1450:4864:20::630])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CF1B410E600
 for <dri-devel@lists.freedesktop.org>; Wed, 29 Nov 2023 14:44:29 +0000 (UTC)
Received: by mail-ej1-x630.google.com with SMTP id
 a640c23a62f3a-9fa45e75ed9so931824166b.1
 for <dri-devel@lists.freedesktop.org>; Wed, 29 Nov 2023 06:44:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1701269068; x=1701873868; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=3WME6ubitd3vxaAOMdHVezdwhed8qbighnDEBO169Ec=;
 b=BgToPNetsx8KF1G9GYHezR+jtgDPRPaZA3is+tg9Z15T/rHSwQuL6iV8LEYwkk7cxG
 /6wUD27LlE7hdwHd2uxhvPhQ2ddxM9DSot2mk5IMI1vamaEeiAoU6WWULilNKmglJSPz
 HrV4jBmTuwe6gI6bypU8ALjUExEusoTmoz7rzHdLjNTH/3vh0Xl0wowVPydYInbtiH/e
 bRcSW1Mugn93O92SqmgAAIZL6cdaJy7+kaTlAGSILNcYI0aypQUEw/Jp0AozNMNBNHTG
 2QwBGs1SO+SCUG+2GPtwQDDyeTNFkflKyg0JnBKA6ebKNsC3xIQBXx7rUsmoc6Fl5phd
 tE2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1701269068; x=1701873868;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=3WME6ubitd3vxaAOMdHVezdwhed8qbighnDEBO169Ec=;
 b=SIEDjnzKf/U8UYzL6+yRqbNMg0qxfpakCx3DBPc8uCgbM8hWKdktXjtUPq1NK6f4n3
 oDPrhEIdMRor7ZulpoknYRYexchLkKEG2/khwKnPQVA4Ja6obIrxewcpx6vAlF47HyvP
 QNCdDjlA6vHVruUG6C38avENRLjGDBlnMXxS4IifzaDpwZyD4A7aJoWrL479MIGV4HOl
 W6Rz7itScv9Z8/ZN1Zq34rYthSJllXH2tfU7+ozmDSeEBmREH4jjvsCDyh8GWluJZWtp
 lX/fJqPjtf8h5WeZpls8Sod1WPX5i1qJ34Sj0pOsjbwg1YjzWHfGHbxUhrIYpQEKrkCD
 8ZWA==
X-Gm-Message-State: AOJu0YzLezm16jA6b+cw0h89qrnoAjXk4Za8XC5HH4d9n7pw5ionJKki
 AFzsrHbTHquWpZXMIuYPl/Jkkg==
X-Google-Smtp-Source: AGHT+IH+RwsuXNKo7mRRSs5QfH4RQDMAsxgT6mJOUDi04ruodSJZaS3PyYqxW9aAR+nUNX0ZJcUxXA==
X-Received: by 2002:a17:906:fcce:b0:9f8:2b44:7b7f with SMTP id
 qx14-20020a170906fcce00b009f82b447b7fmr13038742ejb.70.1701269068288; 
 Wed, 29 Nov 2023 06:44:28 -0800 (PST)
Received: from [10.167.154.1]
 (178235187166.dynamic-4-waw-k-2-3-0.vectranet.pl. [178.235.187.166])
 by smtp.gmail.com with ESMTPSA id
 e27-20020a1709062c1b00b009fda627abd9sm7913738ejh.79.2023.11.29.06.44.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 29 Nov 2023 06:44:27 -0800 (PST)
From: Konrad Dybcio <konrad.dybcio@linaro.org>
Date: Wed, 29 Nov 2023 15:44:03 +0100
Subject: [PATCH v3 06/12] arm64: dts: qcom: sc7180: Add the missing MDSS
 icc path
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20231125-topic-rb1_feat-v3-6-4cbb567743bb@linaro.org>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1701269042; l=1145;
 i=konrad.dybcio@linaro.org; s=20230215; h=from:subject:message-id;
 bh=QxbVxThi6gj4JqQP8V9LpJsjR/myuVOnIJbwHX7amYU=;
 b=sYPUfm+T2CO9HyMoVEn+/8/AzljQnlW0jC9XeZnrz01woxrBDGuDswi+m+bEgPSkuiCtZLp8N
 BR3hZTS03LmDYMTViL/cCS/WJooBooB/al2zibrNvM1dONg09omgSvQ
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

MDSS, aside from the MDP-MEM path, also requires the CPU-DISP_CFG one.
Failing to provide it may result in register accesses failing and that's
never good.

Add the missing path.

Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
 arch/arm64/boot/dts/qcom/sc7180.dtsi | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sc7180.dtsi b/arch/arm64/boot/dts/qcom/sc7180.dtsi
index 11f353d416b4..9664e42faeb1 100644
--- a/arch/arm64/boot/dts/qcom/sc7180.dtsi
+++ b/arch/arm64/boot/dts/qcom/sc7180.dtsi
@@ -3100,8 +3100,12 @@ mdss: display-subsystem@ae00000 {
 			interrupt-controller;
 			#interrupt-cells = <1>;
 
-			interconnects = <&mmss_noc MASTER_MDP0 0 &mc_virt SLAVE_EBI1 0>;
-			interconnect-names = "mdp0-mem";
+			interconnects = <&mmss_noc MASTER_MDP0 QCOM_ICC_TAG_ALWAYS
+					 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>,
+					<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
+					 &config_noc SLAVE_DISPLAY_CFG QCOM_ICC_TAG_ALWAYS>;
+			interconnect-names = "mdp0-mem",
+					     "cpu-cfg";
 
 			iommus = <&apps_smmu 0x800 0x2>;
 

-- 
2.43.0

