Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A3FFDD2CEA2
	for <lists+dri-devel@lfdr.de>; Fri, 16 Jan 2026 08:08:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F0D0210E7FB;
	Fri, 16 Jan 2026 07:08:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=mainlining.org header.i=@mainlining.org header.b="KBBSRn3q";
	dkim=permerror (0-bit key) header.d=mainlining.org header.i=@mainlining.org header.b="ODHuQBnX";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.mainlining.org (mail.mainlining.org [5.75.144.95])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 518E710E7FE
 for <dri-devel@lists.freedesktop.org>; Fri, 16 Jan 2026 07:08:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; s=202507r; d=mainlining.org;
 c=relaxed/relaxed; 
 h=To:Message-Id:Subject:Date:From; t=1768547282; bh=ZTd4KzpYo+iJMB9JniHWo34
 Z5P9kW3MY6d22A976Kv0=; b=KBBSRn3qmGHAYogcA1mB6ITMZvdrwjP9GbtpvAEwd15B2cL3KZ
 HYx3i1S+buWVZc8N+vaZMV9TqspSV1KIsH/pHpTY2EZCNb71oBMX19BgmfS8jFgchoKaokPqlqx
 qumQIWrBE+Yxvn/hcoMDKav6XekbuLettvhj7xoa3h93e4ka0jQVNG/2QCkGjcuVjMXST/DpDBs
 De0izlGKfIwiZeCBwcpd5Plb4hTS53n+vastxyaGhJaY4oBvn75J8E1QPvytU8szgQo8Zp0WfyD
 lzWOO6G6Xb5wPPt3xR6FDybCTQevJ0anJThihVuWKPQYuXXT5eg4ZB/F2hc+FeeDU8A==;
DKIM-Signature: v=1; a=ed25519-sha256; s=202507e; d=mainlining.org;
 c=relaxed/relaxed; 
 h=To:Message-Id:Subject:Date:From; t=1768547282; bh=ZTd4KzpYo+iJMB9JniHWo34
 Z5P9kW3MY6d22A976Kv0=; b=ODHuQBnXafGB78qG3yOqk7S42bPX6mJnkLzCI/7Du4T4taRfpV
 L3cC6p0u6MALYcV9Yc03GTQRZYHgdxdwFIBw==;
From: =?utf-8?q?Barnab=C3=A1s_Cz=C3=A9m=C3=A1n?=
 <barnabas.czeman@mainlining.org>
Date: Fri, 16 Jan 2026 08:07:38 +0100
Subject: [PATCH v3 6/7] arm64: dts: qcom: msm8937-xiaomi-land: correct wled
 ovp value
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260116-pmi8950-wled-v3-6-e6c93de84079@mainlining.org>
References: <20260116-pmi8950-wled-v3-0-e6c93de84079@mainlining.org>
In-Reply-To: <20260116-pmi8950-wled-v3-0-e6c93de84079@mainlining.org>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1768547276; l=883;
 i=barnabas.czeman@mainlining.org; s=20240730; h=from:subject:message-id;
 bh=sL1xJ/7VJyqA0vrIzRCtoN0OcaOJvQekAknEhb2LvJA=;
 b=mSJtzujcf4p0emnGtfp3CWhKGN3blU1UEUaFPzLIVSZjmJa22LweGJpEX/3J26IMCug0zq7Xm
 WNc+mQYaJGGA2kRP1IEg7n9ExgtDIOVHfoJpMzAYqp0nxg8BiY4tXck
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
