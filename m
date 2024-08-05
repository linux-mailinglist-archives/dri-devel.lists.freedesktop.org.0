Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 715AB947FF0
	for <lists+dri-devel@lfdr.de>; Mon,  5 Aug 2024 19:08:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ED62A10E261;
	Mon,  5 Aug 2024 17:08:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="KlcOk16v";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com
 [209.85.128.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2460810E25D
 for <dri-devel@lists.freedesktop.org>; Mon,  5 Aug 2024 17:08:20 +0000 (UTC)
Received: by mail-wm1-f53.google.com with SMTP id
 5b1f17b1804b1-428243f928fso71485095e9.0
 for <dri-devel@lists.freedesktop.org>; Mon, 05 Aug 2024 10:08:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1722877698; x=1723482498;
 darn=lists.freedesktop.org; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=a8qXi0AmLbuERLsyqttkRIlZ8eb7lceW7IwVCJnKdis=;
 b=KlcOk16vxh+0ph4FI/VXKJFSwAcdu1sWqzeN/YiTnjxRvch3bQJ0nl+ib1Psg8xUUQ
 rqWkiJ41mPYOWExwxGV3vnKoTYaSs/72h/2Xl06rwdLl8PKXjAmGluJrlVs+Cre4Mn1j
 FcVuHlaYT81gajUuhkUEDY3+R5+PjGj4a8+3OD1IwQ9eZgGHdd2hFUAWznOqNdXrWTly
 GuUSRjrFpavrG6ZWb0W8gTlR3iS1XneeCXk4nlRrNQ9AsYMqlruK0Ce59elc5BNRklZo
 nSHbdVSFHYGvshpjQ37s0nuqUSLBy2HvTICWobS53jwz2uTPqsDumtLErvJxqEYd1YMg
 lKGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1722877698; x=1723482498;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=a8qXi0AmLbuERLsyqttkRIlZ8eb7lceW7IwVCJnKdis=;
 b=XsFqpcsPrHoXF+/nD5QztqFH/E7gfmgn5sFXu0l2I/uuBQl+AfYTVpVPwnPleCHIWd
 IYfhcmriZgZAOCQFCjqlxKDDluH80hclNumSgF9k+Hb7zLmte55mkjKcoQDeRVRW9e4j
 /cGc2euXGVrF7v00iorjl3Cf3Fl1DEYgJEVBW04BkgeO4R3i47nWH2SDtrmMZAmT/8qp
 tfqc7Ujth+5tIyTr757Xh/ywScV3UNhZYLHEOwPY8957m2SK21Rl8XHTrxpHSXj+uDv3
 Nx8+/3Kq6CJIJeDRuQ2uBReUNZ0jvL3BLKGxb2qzp7eN9aAllhpjd4UbrFoIb5FmQnAy
 Wv1Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCUOtVKaxPpJY8YvPuQt3j7D9aMqmlsMnAMA5EXVcS+kh22MHpR2RKNEKnknYGhchhCbRWuLidPp+S5VZJaQuZOYW8TUxddVdw11xhdvU9vX
X-Gm-Message-State: AOJu0Yyl8aMh3YzPOAwifPRoxDLYTJBpHaMvsDmFZrhRzpt1nQIMZ8aQ
 18fYWHDeGW5vlL1ikZywqsY6Yec8q0ZTIhpACeDwPWc0q8HQHYhxpXllQw3jiV4=
X-Google-Smtp-Source: AGHT+IGNnjvxPKNqFTpGRneCXiQ9ZfANtwC8Yo0t9+UB+vvcrfHUe+s1PfoKYEVEU99MdqkHe0JlVw==
X-Received: by 2002:adf:e389:0:b0:367:9d4e:8861 with SMTP id
 ffacd0b85a97d-36bbc1c7d09mr9650450f8f.57.1722877698373; 
 Mon, 05 Aug 2024 10:08:18 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:1068:b792:523c:3f73])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-36bbcf1e97esm10356486f8f.37.2024.08.05.10.08.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 05 Aug 2024 10:08:17 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Mon, 05 Aug 2024 19:08:04 +0200
Subject: [PATCH v4 3/6] remoteproc: qcom_q6v5_pas: Add support for SA8775p
 ADSP, CDSP and GPDSP
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240805-topic-sa8775p-iot-remoteproc-v4-3-86affdc72c04@linaro.org>
References: <20240805-topic-sa8775p-iot-remoteproc-v4-0-86affdc72c04@linaro.org>
In-Reply-To: <20240805-topic-sa8775p-iot-remoteproc-v4-0-86affdc72c04@linaro.org>
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, 
 Amol Maheshwari <amahesh@qti.qualcomm.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>, 
 Jassi Brar <jassisinghbrar@gmail.com>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Mathieu Poirier <mathieu.poirier@linaro.org>, Arnd Bergmann <arnd@arndb.de>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-remoteproc@vger.kernel.org, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>, 
 Tengfei Fan <quic_tengfan@quicinc.com>, Ling Xu <quic_lxu5@quicinc.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=4033;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=sCnYyInCe8lgzoxKSYmHX0iIoLAhYHzdQ49FJhIALKQ=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBmsQb8Buyxua0eEvFkZkMIzdnMz5Hdp6nEJ2DwB
 TQQb8aCUh6JAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCZrEG/AAKCRARpy6gFHHX
 cjeJEACtfTt0lpBabZYmZj+a5tIm7JrdrtK1Rm0FcuGt8l/MfI5EAy8QPVzp2vngtIpB4BPmdEp
 v1BIurFWPFvSB2wPqlj4ioDBAAYWuBs4g7xWnq7Ud21k0pD873125dg9YyJV8kL5mM2krEk1q7x
 869EPEhufJW2HaxpDLDEhBGlrlABcQGU7FrhrrQY8bHtJmfSF8+Qq9FsOPZN92CgcGCKGOoYG78
 Bg89/vB1dM8LELe3m3cFwyQvADgoOJav4aqvB0cTc4ZcW8sTe2QX3FLfQkHle44W+VxydlTdedD
 +9EXmEM+Oi8Mx4NGUGawtGMnQ5Y5+LVRs0n1ZkgqyK14g/sLrDd3vLr/ovMhY1rHs7GF5zJtgcI
 h2X7/LU/dDuTJBP3Mt/X8mxOvbW23C/M8HZ7xeYzFcEDV594xClKii7Tg6OSjrs0AFcUtxMaVRO
 2dIMikWPYGuMEmLPlooZSc5d/DXA6SAeYJVhpPsJIE2ipSoc2IlDI+Pz/SAUdzICEvD4GWanVPh
 jbVmYxEvkHwqD1zJaFt8B+I4DYP0kn56+Kml6TL8hH82sDOtJwdVjqpkofnQBaKP7LHLnfJnAKZ
 +M/R00vUD8SsY9fGiXOwAYdpNBszbuXuqmzUPhGrln1rTlsLJEonXhY8PnMvqhdfWHOd6hLvaMT
 rJMPaE8ZHmL2Y5Q==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
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

From: Tengfei Fan <quic_tengfan@quicinc.com>

Add support for PIL loading on ADSP, CDSP0, CDSP1, GPDSP0 and GPDSP1 on
SA8775p SoCs.

Signed-off-by: Tengfei Fan <quic_tengfan@quicinc.com>
Co-developed-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/remoteproc/qcom_q6v5_pas.c | 92 ++++++++++++++++++++++++++++++++++++++
 1 file changed, 92 insertions(+)

diff --git a/drivers/remoteproc/qcom_q6v5_pas.c b/drivers/remoteproc/qcom_q6v5_pas.c
index 88e7b84f223c..1ec1accddde7 100644
--- a/drivers/remoteproc/qcom_q6v5_pas.c
+++ b/drivers/remoteproc/qcom_q6v5_pas.c
@@ -829,6 +829,23 @@ static const struct adsp_data adsp_resource_init = {
 	.ssctl_id = 0x14,
 };
 
+static const struct adsp_data sa8775p_adsp_resource = {
+	.crash_reason_smem = 423,
+	.firmware_name = "adsp.mbn",
+	.pas_id = 1,
+	.minidump_id = 5,
+	.auto_boot = true,
+	.proxy_pd_names = (char*[]){
+		"lcx",
+		"lmx",
+		NULL
+	},
+	.load_state = "adsp",
+	.ssr_name = "lpass",
+	.sysmon_name = "adsp",
+	.ssctl_id = 0x14,
+};
+
 static const struct adsp_data sdm845_adsp_resource_init = {
 	.crash_reason_smem = 423,
 	.firmware_name = "adsp.mdt",
@@ -942,6 +959,42 @@ static const struct adsp_data cdsp_resource_init = {
 	.ssctl_id = 0x17,
 };
 
+static const struct adsp_data sa8775p_cdsp0_resource = {
+	.crash_reason_smem = 601,
+	.firmware_name = "cdsp0.mbn",
+	.pas_id = 18,
+	.minidump_id = 7,
+	.auto_boot = true,
+	.proxy_pd_names = (char*[]){
+		"cx",
+		"mxc",
+		"nsp",
+		NULL
+	},
+	.load_state = "cdsp",
+	.ssr_name = "cdsp",
+	.sysmon_name = "cdsp",
+	.ssctl_id = 0x17,
+};
+
+static const struct adsp_data sa8775p_cdsp1_resource = {
+	.crash_reason_smem = 633,
+	.firmware_name = "cdsp1.mbn",
+	.pas_id = 30,
+	.minidump_id = 20,
+	.auto_boot = true,
+	.proxy_pd_names = (char*[]){
+		"cx",
+		"mxc",
+		"nsp",
+		NULL
+	},
+	.load_state = "nsp",
+	.ssr_name = "cdsp1",
+	.sysmon_name = "cdsp1",
+	.ssctl_id = 0x20,
+};
+
 static const struct adsp_data sdm845_cdsp_resource_init = {
 	.crash_reason_smem = 601,
 	.firmware_name = "cdsp.mdt",
@@ -1083,6 +1136,40 @@ static const struct adsp_data sm8350_cdsp_resource = {
 	.ssctl_id = 0x17,
 };
 
+static const struct adsp_data sa8775p_gpdsp0_resource = {
+	.crash_reason_smem = 640,
+	.firmware_name = "gpdsp0.mbn",
+	.pas_id = 39,
+	.minidump_id = 21,
+	.auto_boot = true,
+	.proxy_pd_names = (char*[]){
+		"cx",
+		"mxc",
+		NULL
+	},
+	.load_state = "gpdsp0",
+	.ssr_name = "gpdsp0",
+	.sysmon_name = "gpdsp0",
+	.ssctl_id = 0x21,
+};
+
+static const struct adsp_data sa8775p_gpdsp1_resource = {
+	.crash_reason_smem = 641,
+	.firmware_name = "gpdsp1.mbn",
+	.pas_id = 40,
+	.minidump_id = 22,
+	.auto_boot = true,
+	.proxy_pd_names = (char*[]){
+		"cx",
+		"mxc",
+		NULL
+	},
+	.load_state = "gpdsp1",
+	.ssr_name = "gpdsp1",
+	.sysmon_name = "gpdsp1",
+	.ssctl_id = 0x22,
+};
+
 static const struct adsp_data mpss_resource_init = {
 	.crash_reason_smem = 421,
 	.firmware_name = "modem.mdt",
@@ -1329,6 +1416,11 @@ static const struct of_device_id adsp_of_match[] = {
 	{ .compatible = "qcom,qcs404-adsp-pas", .data = &adsp_resource_init },
 	{ .compatible = "qcom,qcs404-cdsp-pas", .data = &cdsp_resource_init },
 	{ .compatible = "qcom,qcs404-wcss-pas", .data = &wcss_resource_init },
+	{ .compatible = "qcom,sa8775p-adsp-pas", .data = &sa8775p_adsp_resource},
+	{ .compatible = "qcom,sa8775p-cdsp0-pas", .data = &sa8775p_cdsp0_resource},
+	{ .compatible = "qcom,sa8775p-cdsp1-pas", .data = &sa8775p_cdsp1_resource},
+	{ .compatible = "qcom,sa8775p-gpdsp0-pas", .data = &sa8775p_gpdsp0_resource},
+	{ .compatible = "qcom,sa8775p-gpdsp1-pas", .data = &sa8775p_gpdsp1_resource},
 	{ .compatible = "qcom,sc7180-adsp-pas", .data = &sm8250_adsp_resource},
 	{ .compatible = "qcom,sc7180-mpss-pas", .data = &mpss_resource_init},
 	{ .compatible = "qcom,sc7280-adsp-pas", .data = &sm8350_adsp_resource},

-- 
2.43.0

