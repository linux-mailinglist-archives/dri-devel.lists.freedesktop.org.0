Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 69BAED00EAC
	for <lists+dri-devel@lfdr.de>; Thu, 08 Jan 2026 04:45:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C769A10E671;
	Thu,  8 Jan 2026 03:45:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=mainlining.org header.i=@mainlining.org header.b="kOVvML5l";
	dkim=permerror (0-bit key) header.d=mainlining.org header.i=@mainlining.org header.b="5hoHm3Yn";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.mainlining.org (mail.mainlining.org [5.75.144.95])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CADC710E671
 for <dri-devel@lists.freedesktop.org>; Thu,  8 Jan 2026 03:45:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; s=202507r; d=mainlining.org;
 c=relaxed/relaxed; 
 h=To:Message-Id:Subject:Date:From; t=1767843808; bh=ZTd4KzpYo+iJMB9JniHWo34
 Z5P9kW3MY6d22A976Kv0=; b=kOVvML5lFohsUI8D6FwPX2Dy/4EmoVyvktLHoiZQ1ymPsk8yti
 1xi4PX87/ucegUy3DqhaQRQlbfwejso2wx37FUj7Hs3ZIFdSxF6W4nfx3hBcjIBiyHjAcO8qVha
 jyQ7lYbZUM+66RNdYiKR6m7BsSRh4OErzfjZkqIBt5ycOVZYD4AUQIdZXSuLuEWMyQoTLQzj8uC
 rRrbGxszuxAWrzci7zQbB2zZHD+vHiD4bGANKRIorxSJ8S4t9Uzj805oKFtw7tLaei72+1uuZ6h
 gCoSEdfx1LpInnQnTq3KJQi5dFCopdzc6csqRWytj/uGEotuXyuHxzlDlwejn8hCnQQ==;
DKIM-Signature: v=1; a=ed25519-sha256; s=202507e; d=mainlining.org;
 c=relaxed/relaxed; 
 h=To:Message-Id:Subject:Date:From; t=1767843808; bh=ZTd4KzpYo+iJMB9JniHWo34
 Z5P9kW3MY6d22A976Kv0=; b=5hoHm3YnX+K4EzJu/75c/xk/SFyZvF75Ckip4jNc2Xur13Ji7k
 CNQY+9Nv467Fkqrld2Pk7UZMLeyaigRxmKCg==;
From: =?utf-8?q?Barnab=C3=A1s_Cz=C3=A9m=C3=A1n?=
 <barnabas.czeman@mainlining.org>
Date: Thu, 08 Jan 2026 04:43:24 +0100
Subject: [PATCH v2 6/7] arm64: dts: qcom: msm8937-xiaomi-land: correct wled
 ovp value
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260108-pmi8950-wled-v2-6-8687f23147d7@mainlining.org>
References: <20260108-pmi8950-wled-v2-0-8687f23147d7@mainlining.org>
In-Reply-To: <20260108-pmi8950-wled-v2-0-8687f23147d7@mainlining.org>
To: Lee Jones <lee@kernel.org>, Daniel Thompson <danielt@kernel.org>, 
 Jingoo Han <jingoohan1@gmail.com>, Pavel Machek <pavel@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
 Kiran Gunda <quic_kgunda@quicinc.com>, Helge Deller <deller@gmx.de>, 
 Luca Weiss <luca@lucaweiss.eu>, Konrad Dybcio <konradybcio@kernel.org>, 
 Eugene Lepshy <fekz115@gmail.com>, Gianluca Boiano <morf3089@gmail.com>, 
 Alejandro Tafalla <atafalla@dnyon.com>
Cc: dri-devel@lists.freedesktop.org, linux-leds@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Daniel Thompson <daniel.thompson@linaro.org>, linux-arm-msm@vger.kernel.org, 
 linux-fbdev@vger.kernel.org, Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, 
 =?utf-8?q?Barnab=C3=A1s_Cz=C3=A9m=C3=A1n?= <barnabas.czeman@mainlining.org>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1767843800; l=883;
 i=barnabas.czeman@mainlining.org; s=20240730; h=from:subject:message-id;
 bh=sL1xJ/7VJyqA0vrIzRCtoN0OcaOJvQekAknEhb2LvJA=;
 b=OCZfcW3st9m2Z+QSVfDFmb7XpMqLumaNG7TxNMHoMYX2wMMPJreY/7uhRPTsi8N20ufJz15XB
 hA9A7/eLpWIAbzP6gBpZaIbc+AkJHzfnI6c8AXs10MS6z91SXSIKngQ
X-Developer-Key: i=barnabas.czeman@mainlining.org; a=ed25519;
 pk=TWUSIGgwW/Sn4xnX25nw+lszj1AT/A3bzkahn7EhOFc=
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

PMI8950 doesn't actually support setting an OVP threshold value of
29.6 V. The closest allowed value is 29.5 V. Set that instead.

Fixes: 2144f6d57d8e ("arm64: dts: qcom: Add Xiaomi Redmi 3S")
Signed-off-by: Barnabás Czémán <barnabas.czeman@mainlining.org>
---
 arch/arm64/boot/dts/qcom/msm8937-xiaomi-land.dts | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/msm8937-xiaomi-land.dts b/arch/arm64/boot/dts/qcom/msm8937-xiaomi-land.dts
index 91837ff940f1..4f301e7c6517 100644
--- a/arch/arm64/boot/dts/qcom/msm8937-xiaomi-land.dts
+++ b/arch/arm64/boot/dts/qcom/msm8937-xiaomi-land.dts
@@ -178,7 +178,7 @@ &pmi8950_wled {
 	qcom,num-strings = <2>;
 	qcom,external-pfet;
 	qcom,current-limit-microamp = <20000>;
-	qcom,ovp-millivolt = <29600>;
+	qcom,ovp-millivolt = <29500>;
 
 	status = "okay";
 };

-- 
2.52.0
