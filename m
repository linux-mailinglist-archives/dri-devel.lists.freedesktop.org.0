Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C2989D00E67
	for <lists+dri-devel@lfdr.de>; Thu, 08 Jan 2026 04:43:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3AF2010E66F;
	Thu,  8 Jan 2026 03:43:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=mainlining.org header.i=@mainlining.org header.b="gkM4pLlW";
	dkim=permerror (0-bit key) header.d=mainlining.org header.i=@mainlining.org header.b="AyHSfQbj";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.mainlining.org (mail.mainlining.org [5.75.144.95])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2C03310E66F
 for <dri-devel@lists.freedesktop.org>; Thu,  8 Jan 2026 03:43:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; s=202507r; d=mainlining.org;
 c=relaxed/relaxed; 
 h=To:Message-Id:Subject:Date:From; t=1767843809; bh=Qq6InsqVKyZMyL8BBK8OAsI
 lvW+EJdyNiC2eOxhaapI=; b=gkM4pLlWmlWVpHt/4MGEfpOLqUB7JkVLgMVc06lobHNIhbm0Q4
 6xz7QYtJEVrn5tsl+D1zMJCIm2N/chGZ4xwmFIuyqrwdvpao8aCbU+vVXBIimISilD96trHgBR4
 TbPtiELNOn9J1yBN8NFdM4jSizcpxvUbwcg/awSHpTJia3MphYd/wB8vJqq0OKRDIvIHh1Z8Q2M
 IuPuJVUZkczDQi1KiyHVHp9AgfbAyJohqZLvguXgx43wLFa1gDDf+rOp5+SQGoojtdqBbivRneQ
 PmAPbAeiC8iMzFO0VMm5LH/ATXR2lAwZLpXp7lfVVrEVeGq3NGqJfQ4GL+pWR26XsFQ==;
DKIM-Signature: v=1; a=ed25519-sha256; s=202507e; d=mainlining.org;
 c=relaxed/relaxed; 
 h=To:Message-Id:Subject:Date:From; t=1767843809; bh=Qq6InsqVKyZMyL8BBK8OAsI
 lvW+EJdyNiC2eOxhaapI=; b=AyHSfQbj7Y3aa8eg93TAFTfzvVE/KAQqg/0oT50nwCTuSWqJ3z
 H4/nXbDSFZDpESNfbCQaVPDOBhRKUzGi+kBg==;
From: =?utf-8?q?Barnab=C3=A1s_Cz=C3=A9m=C3=A1n?=
 <barnabas.czeman@mainlining.org>
Date: Thu, 08 Jan 2026 04:43:25 +0100
Subject: [PATCH v2 7/7] arm64: dts: qcom: msm8953-xiaomi-daisy: fix backlight
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260108-pmi8950-wled-v2-7-8687f23147d7@mainlining.org>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1767843800; l=1000;
 i=barnabas.czeman@mainlining.org; s=20240730; h=from:subject:message-id;
 bh=zbsGn2Qvn3aara0EHz4uPK0rPp25zn+kle3Iajn6Cwc=;
 b=ejAlox52kJS1BSLPruIeS6ipIU4sjxQtcDRCwdLtTEhMvlyOi5AWZJcBvCT03GDUnUT6lhsTP
 Ses+zax/KG3BprxVSDzEhBAHJSrhlphMhnEynzP7BLaPCJGka2IfC9L
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

The backlight on this device is connected via 3 strings. Currently,
the DT claims only two are present, which results in visible stripes
on the display (since every third backlight string remains unconfigured).

Fix the number of strings to avoid that.

Fixes: 38d779c26395 ("arm64: dts: qcom: msm8953: Add device tree for Xiaomi Mi A2 Lite")
Signed-off-by: Barnabás Czémán <barnabas.czeman@mainlining.org>
---
 arch/arm64/boot/dts/qcom/msm8953-xiaomi-daisy.dts | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/msm8953-xiaomi-daisy.dts b/arch/arm64/boot/dts/qcom/msm8953-xiaomi-daisy.dts
index ddd7af616794..59f873a06e4d 100644
--- a/arch/arm64/boot/dts/qcom/msm8953-xiaomi-daisy.dts
+++ b/arch/arm64/boot/dts/qcom/msm8953-xiaomi-daisy.dts
@@ -157,7 +157,7 @@ &pm8953_resin {
 
 &pmi8950_wled {
 	qcom,current-limit-microamp = <20000>;
-	qcom,num-strings = <2>;
+	qcom,num-strings = <3>;
 
 	status = "okay";
 };

-- 
2.52.0
