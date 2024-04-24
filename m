Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A52038B0E40
	for <lists+dri-devel@lfdr.de>; Wed, 24 Apr 2024 17:29:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7F47D113C1E;
	Wed, 24 Apr 2024 15:29:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="GYPoWxwf";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4E1A11136B3
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Apr 2024 15:29:32 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 9932961BDF;
 Wed, 24 Apr 2024 15:29:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 67AD8C4AF17;
 Wed, 24 Apr 2024 15:29:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1713972570;
 bh=MGDeJja2K+2Fy6iZ3UVl+kKOjkN4yNTXYCSocCHEyOQ=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
 b=GYPoWxwfjWjBIZqzfXah+R1y39jKPnpmgHVSmpHgQifk+qjwnYgCpBFPlPGt2nvTZ
 yOP8czmAe6Ekh9WqewODZb1M6L4f+kw5gmp0iyzj2H1AXA51HXvZEGiLGLPN2xtj4p
 h30KMOmlSSPNj9+OGxCkneF0aVrSbrCax2cuHfMlwbidwwoifu6NZeg9hUAP7eZhnA
 u8DHvPSf2/ahiIkwK+avKByRKRa+3sQwBiF9EaIrX+eqOfavFVtZ50VnIgHs3L9QM6
 2lqXRQCjM1YFG822lBgQ/IOoavFcEhLNNCTXp1HtMwPH65235fe1ExwnsCCQX5RqHU
 al3ziHloshvWg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by smtp.lore.kernel.org (Postfix) with ESMTP id 5E454C19F4F;
 Wed, 24 Apr 2024 15:29:30 +0000 (UTC)
From: Xilin Wu via B4 Relay <devnull+wuxilin123.gmail.com@kernel.org>
Date: Wed, 24 Apr 2024 23:29:10 +0800
Subject: [PATCH 05/10] arm64: dts: qcom: pmk8550: Add PWM controller
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240424-ayn-odin2-initial-v1-5-e0aa05c991fd@gmail.com>
References: <20240424-ayn-odin2-initial-v1-0-e0aa05c991fd@gmail.com>
In-Reply-To: <20240424-ayn-odin2-initial-v1-0-e0aa05c991fd@gmail.com>
To: =?utf-8?q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Junhao Xie <bigfoot@classfun.cn>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Jessica Zhang <quic_jesszhan@quicinc.com>, Sam Ravnborg <sam@ravnborg.org>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>, 
 Tengfei Fan <quic_tengfan@quicinc.com>, 
 Molly Sophia <mollysophia379@gmail.com>, Junhao Xie <bigfoot@classfun.cn>
Cc: linux-pwm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 linux-arm-msm@vger.kernel.org, Xilin Wu <wuxilin123@gmail.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1713972563; l=805;
 i=wuxilin123@gmail.com; s=20240424; h=from:subject:message-id;
 bh=UJJkbMFALeVJntjJ0F6Zy3BxeVdQ8NMCNMFJYC7Boyk=;
 b=CxOiSooLXVMHGp39j8/B3jelCeqziYdEj46802PdgC+psrDtPoDZNIW6D7J2ub0wVyd5OYEUV
 APrmVMQwclPD0ASCtCxD40Y4LrcBZeQAkA1iUSRraJ92DVQL/c3QGGk
X-Developer-Key: i=wuxilin123@gmail.com; a=ed25519;
 pk=vPnxeJnlD/PfEbyQPZzaay5ezxI/lMrke7qXy31lSM8=
X-Endpoint-Received: by B4 Relay for wuxilin123@gmail.com/20240424 with
 auth_id=157
X-Original-From: Xilin Wu <wuxilin123@gmail.com>
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
Reply-To: wuxilin123@gmail.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Xilin Wu <wuxilin123@gmail.com>

Add the PWM function to the pmk8550 dtsi, which is usually used
to control PWM backlight on platforms using this PMIC.

Signed-off-by: Xilin Wu <wuxilin123@gmail.com>
---
 arch/arm64/boot/dts/qcom/pmk8550.dtsi | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/pmk8550.dtsi b/arch/arm64/boot/dts/qcom/pmk8550.dtsi
index c7ac9b2eaacf..8d43fbb85263 100644
--- a/arch/arm64/boot/dts/qcom/pmk8550.dtsi
+++ b/arch/arm64/boot/dts/qcom/pmk8550.dtsi
@@ -73,5 +73,15 @@ pmk8550_gpios: gpio@8800 {
 			interrupt-controller;
 			#interrupt-cells = <2>;
 		};
+
+		pmk8550_pwm: pwm {
+			compatible = "qcom,pmk8550-pwm";
+
+			#address-cells = <1>;
+			#size-cells = <0>;
+			#pwm-cells = <2>;
+
+			status = "disabled";
+		};
 	};
 };

-- 
2.44.0


