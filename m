Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DAB1E947FF5
	for <lists+dri-devel@lfdr.de>; Mon,  5 Aug 2024 19:08:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AAAC910E256;
	Mon,  5 Aug 2024 17:08:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="K2buEz9i";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com
 [209.85.128.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B099E10E257
 for <dri-devel@lists.freedesktop.org>; Mon,  5 Aug 2024 17:08:23 +0000 (UTC)
Received: by mail-wm1-f42.google.com with SMTP id
 5b1f17b1804b1-4280bbdad3dso72949685e9.0
 for <dri-devel@lists.freedesktop.org>; Mon, 05 Aug 2024 10:08:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1722877702; x=1723482502;
 darn=lists.freedesktop.org; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=K3QCvU8x9eSdTnUH/pY66ZSSnVDaNlbO0nUbs5TfmmE=;
 b=K2buEz9ifGAIBeZgd7VhGwYTQYJ9TU/+qctsaB7UtxVLH1jXsOenZy0+iIQ3KicWrl
 Sa3YWcE8JSdCBQJ7uJcrCV32avwlwVEUnNxsmuXicIJOZbCZ2SReGUVmhFCmOQBrwtKf
 /WuI21IOkc8iVh7TCYOBgJfx5DyOnSBqpzXnQjhIIcFrtPoA6O+Bki5rDxq7N4c4CmDu
 2UVKcRAj/KLTKkJVp6Lq9BpK/kTls7TErZ500xlWv4UTe7Jb1Uaackm/zVQXLy3iowh6
 bGj5r1+DXxjqhHWzGeZMH/ggxUKvYLR/BOctowbXWifLWK6Ku+FgBZCyxKPz8HfRqbQM
 2r3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1722877702; x=1723482502;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=K3QCvU8x9eSdTnUH/pY66ZSSnVDaNlbO0nUbs5TfmmE=;
 b=Jq2lxM9maLWjWAwepuI2NFf4+SOHptFskk+NZ74ADZzQZshRzipHWqv8yk0OkLgHT4
 bcU/DYPz+7auNkxFT1fV2Mv6V/8XpuznHfW9FlQ3mOOioRXpQr1LnOf+qIa+xPQEEoaa
 ARkQJlpaO4FvJS6eNDgttdcm0uG25ovPysOmqAWIcJl3NoBzGPPhqxEKcMAWkQ2re1sz
 RzEcR+j3GnlxVVeZ6A0UMC0RktNzo5nvIHs4+I2JnBT2tQbVKQiba/62PKnDSa24VBTO
 F9RESqT2amLwK5fkdrIWwNRXp4RAAvG56MzJdmq56pm/QVEpZdmhqnpqLx9rP3GrJdjH
 1S4Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCX5Tw0c6V+bYUvZwbCwpdcEp/3AMs4rFY9KxMWuYM9MeEBMPQt9rih8KL0Rmrv/+hGG57NjplEvlg0UP40j1xZ0EuaAw1cp1vP81T2JDI0W
X-Gm-Message-State: AOJu0Yy1oBGctLULsbqny2msIHXrwe1jioDdon35aAv3apQYJp1wyvoa
 n39ggM37ExHi5oH2GXPLKw9TzmcMRtj54JpJZVzaRzKbBrNiZKgW5SA+q4R5v4E=
X-Google-Smtp-Source: AGHT+IFinL2kt0ZW+r82mUcGc1zlJrmSNwuXUXZfjbMwG1TtcCy8HFpn3h38ghrGnzazOEgNcLxCiw==
X-Received: by 2002:adf:eb12:0:b0:368:31c7:19d3 with SMTP id
 ffacd0b85a97d-36bbc0c2750mr7750290f8f.9.1722877701966; 
 Mon, 05 Aug 2024 10:08:21 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:1068:b792:523c:3f73])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-36bbcf1e97esm10356486f8f.37.2024.08.05.10.08.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 05 Aug 2024 10:08:21 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Mon, 05 Aug 2024 19:08:07 +0200
Subject: [PATCH v4 6/6] arm64: dts: qcom: sa8775p-ride: enable remoteprocs
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240805-topic-sa8775p-iot-remoteproc-v4-6-86affdc72c04@linaro.org>
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
 Tengfei Fan <quic_tengfan@quicinc.com>, Ling Xu <quic_lxu5@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1239;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=mHSCGz1vQWW9mhrvbgAo4snXP+mGs+r8C/sTB3mqlCc=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBmsQb8KeckY1dBX4cBouclIxBCjT5mjB6g1lWPt
 ijm97Csy/mJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCZrEG/AAKCRARpy6gFHHX
 cl7XEADbpwFoWvffOqD2lveInv/RW+caWonCTr0Cctqwo8NtqJ5oSZOXrHYmXwGGmlktFlTqTB8
 1QXUJ4OBrOiKiYbh/25dxZ/hx1VN8aBshOkw7mXTuHp9thMTngy7IWThFHE+C7NrRjy6I7J3pE2
 525cuvUz6guQ9p9s6GISyaqvaWIR/fQwOkHUwRmtMS44jOXh88f3YDAbcYreKHrisrGtnxwQcug
 rHrDGPJJe5Unv9X7oKhuq115PcAR4pjHqPUCbelXVcQOSnkLdTpJg7rEOsCqqd2xqyb3r7Uopc7
 pTvnYqQ/U8CvZPeta1tCdj7d0gtmj9Zf/+12wjqnkpEm0bgILHTffWMKE1QsQyl/A4IRIkTNh0R
 nmccBR1HRCSZ1kzDeisHzTdNL32A9jn8tnWR335aAr+1VCZUru4fjZQeAQkyfUUm3sjqsuzb/Y7
 aBdQdyLjdL0bcDxk10BokTLbjjokyHdUDGIZn2Ctk4XivyqT40eza8QXcTdeP6dZoGc8CiBTIS+
 wqdM6JC7DPnDkWNqScYd1o7t7IhyAbtPO+xNcG21pa70cnMzJvFO3dib2ucJi9JBEaq1fE/YwVq
 R7sjAgQc4qMUhF0GEIQkfs5EIBvm9yMG2LO0YYLy9aY5KBowG/xPK4939aRzo6hHCJT3S128gzs
 6ELaNRmQ0PCvelg==
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

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Enable all remoteproc nodes on the sa8775p-ride board and point to the
appropriate firmware files.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 arch/arm64/boot/dts/qcom/sa8775p-ride.dtsi | 25 +++++++++++++++++++++++++
 1 file changed, 25 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sa8775p-ride.dtsi b/arch/arm64/boot/dts/qcom/sa8775p-ride.dtsi
index 2a6170623ea9..0c1b21def4b6 100644
--- a/arch/arm64/boot/dts/qcom/sa8775p-ride.dtsi
+++ b/arch/arm64/boot/dts/qcom/sa8775p-ride.dtsi
@@ -702,6 +702,31 @@ &pcie1_phy {
 	status = "okay";
 };
 
+&remoteproc_adsp {
+	firmware-name = "qcom/sa8775p/adsp.mbn";
+	status = "okay";
+};
+
+&remoteproc_cdsp0 {
+	firmware-name = "qcom/sa8775p/cdsp0.mbn";
+	status = "okay";
+};
+
+&remoteproc_cdsp1 {
+	firmware-name = "qcom/sa8775p/cdsp1.mbn";
+	status = "okay";
+};
+
+&remoteproc_gpdsp0 {
+	firmware-name = "qcom/sa8775p/gpdsp0.mbn";
+	status = "okay";
+};
+
+&remoteproc_gpdsp1 {
+	firmware-name = "qcom/sa8775p/gpdsp1.mbn";
+	status = "okay";
+};
+
 &uart10 {
 	compatible = "qcom,geni-debug-uart";
 	pinctrl-0 = <&qup_uart10_default>;

-- 
2.43.0

