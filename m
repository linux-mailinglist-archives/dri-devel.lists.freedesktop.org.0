Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 764ECCFDFD0
	for <lists+dri-devel@lfdr.de>; Wed, 07 Jan 2026 14:38:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DBF1210E5D3;
	Wed,  7 Jan 2026 13:38:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=mainlining.org header.i=@mainlining.org header.b="cESJymPw";
	dkim=permerror (0-bit key) header.d=mainlining.org header.i=@mainlining.org header.b="M3xRcU+/";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.mainlining.org (mail.mainlining.org [5.75.144.95])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C14CB10E5D3
 for <dri-devel@lists.freedesktop.org>; Wed,  7 Jan 2026 13:38:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; s=202507r; d=mainlining.org;
 c=relaxed/relaxed; 
 h=To:Message-Id:Subject:Date:From; t=1767792676; bh=NaV9lkfW0P2ymvt3pfufEgA
 rA63fyFY5MEhTkcp5K4c=; b=cESJymPwOR+2Mv8GRlSeadGUcX2U4ONV4rpPNagQGav5PqBbA/
 fCHPZf7MHFlNHa32YV9ZFu9w5ms+OiKVFBUgngBJO+MsLlka2ZojOO/qRwddgKb0QzYj4Ylv89u
 3vlWFMDOB9my0gJHsLazJTv3MjC1aJST8F0o3a7cIt6vz8OsxNJO+05vbAxAScZTKEgj9prX+4n
 MpIHsuGJufucurvb9TJogXvXtHNki3HtIilPTmN4qZcYQeqmAlXS/JP1dh/3RMaUiY14oMRJ8Dk
 N/2SMoaJtya2gp9GwXhVYoUjgGgGhe/jvgL+C4pZXJqxiuCzqXhPOGUo+yPFqJn2kQA==;
DKIM-Signature: v=1; a=ed25519-sha256; s=202507e; d=mainlining.org;
 c=relaxed/relaxed; 
 h=To:Message-Id:Subject:Date:From; t=1767792676; bh=NaV9lkfW0P2ymvt3pfufEgA
 rA63fyFY5MEhTkcp5K4c=; b=M3xRcU+/JuoAkiLaMgtDEclpQDbfkj1uUnm43LZDaJDOFXTpQq
 K4NqulYw2Es/0zArd58hh7e+I1f69hjo41Bg==;
From: =?utf-8?q?Barnab=C3=A1s_Cz=C3=A9m=C3=A1n?=
 <barnabas.czeman@mainlining.org>
Date: Wed, 07 Jan 2026 14:31:08 +0100
Subject: [PATCH 4/5] arm64: dts: qcom: msm8937-xiaomi-land: correct wled
 ovp value
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260107-pmi8950-wled-v1-4-5e52f5caa39c@mainlining.org>
References: <20260107-pmi8950-wled-v1-0-5e52f5caa39c@mainlining.org>
In-Reply-To: <20260107-pmi8950-wled-v1-0-5e52f5caa39c@mainlining.org>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1767792671; l=796;
 i=barnabas.czeman@mainlining.org; s=20240730; h=from:subject:message-id;
 bh=VW78Ujo+EwXFe0PRiUbzn+cyI2HRhNJC2s0rKR3xSr8=;
 b=1H0UZG2Y3jbizp1sxueNLBEqJXnjaCUpBpDkRM9hjtfaY+tThnhRLUozfPE2fzyJ2fe43cDag
 NswQXXNV87bDi5bE50GI6/zcQ47DQUE1k8CTocRl9dmnUzTuKt4XFR9
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

Correct wled ovp value from 29600 to 29500.

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
