Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B97B47F12ED
	for <lists+dri-devel@lfdr.de>; Mon, 20 Nov 2023 13:13:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 58B5210E3B2;
	Mon, 20 Nov 2023 12:13:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x52f.google.com (mail-ed1-x52f.google.com
 [IPv6:2a00:1450:4864:20::52f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 40AEC10E3AC
 for <dri-devel@lists.freedesktop.org>; Mon, 20 Nov 2023 12:13:10 +0000 (UTC)
Received: by mail-ed1-x52f.google.com with SMTP id
 4fb4d7f45d1cf-5401bab7525so6170564a12.2
 for <dri-devel@lists.freedesktop.org>; Mon, 20 Nov 2023 04:13:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1700482388; x=1701087188; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=y4obJbFuX32a51CPgRwasEGqIWFeGs2SFetYjrfd9IY=;
 b=lxbAjQfw6UgfmOhqcK56Fql1vlSg9Ygz1ld6Nzo8GeIAIsLcMVlXqQDYl6VeDP8FA/
 qvwE1q74oSeL8o3TxEpbbVT1S5m0UaYHunH/+nu9+Zvq4OHkL1Ma+nFYTe+lID240066
 gpJ4mm2f12GuPboqZ+1yCH1Gx4mIO7IGai0OvlnNw3F93pe+IGQZve70kuxbxe+umyyI
 clVWDvP+mja82twubt/TWWBUF9Y6LV9rL9q+aQW/VY6UTyVhFmvBLg33W7WpjtM7snXh
 t+5YbbFDMCyeI6XmngVx+hboDIzARb8FxHK9GCt6mTLiEVBAV+FmcNtj1AS1Rt5UKXlZ
 ilqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1700482388; x=1701087188;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=y4obJbFuX32a51CPgRwasEGqIWFeGs2SFetYjrfd9IY=;
 b=bjVMbijOdHOik8XXcp1ZMA2ERKJo4aJqGDsemHFTKq225PnA5ROaWW8V1NPhOxniT0
 AaJsO8JdHW0loWGUV2MuwLmzyiQntgLN3dCGFZ71jnnFdi85/+7MLJ8dwJZiWiFZ5UWC
 pu282r1B83WWL+5z72v4cuNU3S42jwzVcErUg6EQ0CyNK4Hsaa/A5+j9JCucjOXvG5w4
 DrRAw56jOp74sjej0+fzRWcP7TAWr3VSMl636p773foxQki6cRlnd868tyh92LB048LZ
 e7mAyMkhbDuWwqSkLDECvoGBljwaSxZiPQ8ABvbGewrowwgXgN4UMK1uI85boRt+jC8N
 MPgw==
X-Gm-Message-State: AOJu0YyCICOmUCpe9XaaXvngDg9eTvodhG0x86umgTU9jNwj4Q5sWeE4
 JtTYL9f8Pw0sprrEAW9Qw0J6Ww==
X-Google-Smtp-Source: AGHT+IHvqKMeMD59wsOARYBHIOOtmh9DOb0vYqoILiQ4tuG247ufeLMp7wMGy+ZaKH140knr325lBg==
X-Received: by 2002:a50:d7d4:0:b0:53f:2128:ff4f with SMTP id
 m20-20020a50d7d4000000b0053f2128ff4fmr4619581edj.17.1700482388356; 
 Mon, 20 Nov 2023 04:13:08 -0800 (PST)
Received: from [10.167.154.1]
 (178235187204.dynamic-4-waw-k-2-3-0.vectranet.pl. [178.235.187.204])
 by smtp.gmail.com with ESMTPSA id
 i22-20020aa7c716000000b00548ac80f90csm1324584edq.40.2023.11.20.04.13.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 20 Nov 2023 04:13:08 -0800 (PST)
From: Konrad Dybcio <konrad.dybcio@linaro.org>
Date: Mon, 20 Nov 2023 13:12:52 +0100
Subject: [PATCH v2 1/4] arm64: dts: qcom: sc7280: Add ZAP shader support
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230926-topic-a643-v2-1-06fa3d899c0a@linaro.org>
References: <20230926-topic-a643-v2-0-06fa3d899c0a@linaro.org>
In-Reply-To: <20230926-topic-a643-v2-0-06fa3d899c0a@linaro.org>
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 cros-qcom-dts-watchers@chromium.org, Andy Gross <agross@kernel.org>, 
 Bjorn Andersson <andersson@kernel.org>, Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, Stephen Boyd <swboyd@chromium.org>, 
 Akhil P Oommen <quic_akhilpo@quicinc.com>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1700482383; l=1670;
 i=konrad.dybcio@linaro.org; s=20230215; h=from:subject:message-id;
 bh=FO3D/4Lb+LmHq1IGkCnu/dhJPyd8/ht4WBGb18ODAj4=;
 b=GDIoeoFFvlB60e66DCtoCtdYcFDJbtJgGMbZGN5KrIZ1iWjzao4lxLmmp21pEUKM97CcEFTle
 lF26xtdb/VUC4IGtZsC0gvQrUiKc+np3MWMmV6N9bzHMdNmiX96otsu
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
Cc: Rob Clark <robdclark@chromium.org>, devicetree@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Luca Weiss <luca.weiss@fairphone.com>,
 Konrad Dybcio <konrad.dybcio@linaro.org>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Non-Chrome SC7280-family platforms ship a ZAP shader with the Adreno GPU.
Describe that and make sure it doesn't interfere with Chrome devices.

Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
 arch/arm64/boot/dts/qcom/sc7280-chrome-common.dtsi | 2 ++
 arch/arm64/boot/dts/qcom/sc7280.dtsi               | 9 +++++++++
 2 files changed, 11 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sc7280-chrome-common.dtsi b/arch/arm64/boot/dts/qcom/sc7280-chrome-common.dtsi
index 5d462ae14ba1..88fc67c3646e 100644
--- a/arch/arm64/boot/dts/qcom/sc7280-chrome-common.dtsi
+++ b/arch/arm64/boot/dts/qcom/sc7280-chrome-common.dtsi
@@ -17,6 +17,8 @@
  * required by the setup for Chrome boards.
  */
 
+/delete-node/ &gpu_zap_mem;
+/delete-node/ &gpu_zap_shader;
 /delete-node/ &hyp_mem;
 /delete-node/ &xbl_mem;
 /delete-node/ &reserved_xbl_uefi_log;
diff --git a/arch/arm64/boot/dts/qcom/sc7280.dtsi b/arch/arm64/boot/dts/qcom/sc7280.dtsi
index 04bf85b0399a..58563f8fdc16 100644
--- a/arch/arm64/boot/dts/qcom/sc7280.dtsi
+++ b/arch/arm64/boot/dts/qcom/sc7280.dtsi
@@ -152,6 +152,11 @@ ipa_fw_mem: memory@8b700000 {
 			no-map;
 		};
 
+		gpu_zap_mem: zap@8b71a000 {
+			reg = <0 0x8b71a000 0 0x2000>;
+			no-map;
+		};
+
 		rmtfs_mem: memory@9c900000 {
 			compatible = "qcom,rmtfs-mem";
 			reg = <0x0 0x9c900000 0x0 0x280000>;
@@ -2613,6 +2618,10 @@ gpu: gpu@3d00000 {
 			nvmem-cells = <&gpu_speed_bin>;
 			nvmem-cell-names = "speed_bin";
 
+			gpu_zap_shader: zap-shader {
+				memory-region = <&gpu_zap_mem>;
+			};
+
 			gpu_opp_table: opp-table {
 				compatible = "operating-points-v2";
 

-- 
2.42.1

