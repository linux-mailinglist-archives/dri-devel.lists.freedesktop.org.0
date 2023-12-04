Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D374803BDB
	for <lists+dri-devel@lfdr.de>; Mon,  4 Dec 2023 18:41:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B9DD610E3C5;
	Mon,  4 Dec 2023 17:41:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x636.google.com (mail-ej1-x636.google.com
 [IPv6:2a00:1450:4864:20::636])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A21AD10E3AA
 for <dri-devel@lists.freedesktop.org>; Mon,  4 Dec 2023 17:40:30 +0000 (UTC)
Received: by mail-ej1-x636.google.com with SMTP id
 a640c23a62f3a-a195a1474easo462464466b.2
 for <dri-devel@lists.freedesktop.org>; Mon, 04 Dec 2023 09:40:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1701711629; x=1702316429; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:content-language:references
 :cc:to:subject:from:user-agent:mime-version:date:message-id:from:to
 :cc:subject:date:message-id:reply-to;
 bh=lBX76/WyazZCOF7hTYHm6kdCEbLg+NpPINR6F7BEsKQ=;
 b=Lo4IJqKhbGrYCrjfGlK1ahoyRBN+5qxHyxKXKGm/uOlK4RcPoZtiVTZIwrz/tjxQnv
 TG9ZT0z54S88ZSUWYSOYFshthdaAvJzs2MfXFbHQFaphXZirwZtsYrqUXMo5wR7fDZ+j
 sDy/utwrRX8T7ROIQcEdVHQqOtVzgiJ118Gjn3Kz1kQWUqQSP/6tz4Maw1lok07CQGfG
 GMhzHD2Uljr/3AWg4U9QkDgZB2LMMGtPzfg0tBjSTjT446v27pEAmw3pYevUR90qf8q0
 bHGA14MKX4FxKabg12V4T1Qc8Ry20n2tHczkUlKHeOvP5B/uipjBw9+HQF35o4m77xa8
 vlyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1701711629; x=1702316429;
 h=content-transfer-encoding:in-reply-to:content-language:references
 :cc:to:subject:from:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=lBX76/WyazZCOF7hTYHm6kdCEbLg+NpPINR6F7BEsKQ=;
 b=cr3QCsjE37x+xWKXp5x99aikoax0bwxg4VoE5hfVG6dJ2Lw7KQXxeyfrLrAcdnr7fV
 EMLTmdl9MlQI1AAlEi9vGatUQ8olGXpTNSH+4QEIrRTP1fI24zCcME6ivIRkh4FIyaDh
 a9hR6pmb/fz7BOn53li0doKjrws4KzM0J50CoTGlaGX5FTTMeu4WQmioCZq8aITaENVU
 KfMH55C7RAsdNE7H8aXbwYCUpyfrcFUZsOinfx+kMOfVizFZIkHaleI+nbOaUvZWN+78
 9QD6QhaTlTUIpHAa821QgwDuvm0nojg662ArY8nIyjjHNDG6oEewHSZwr1vIz9ezpSjs
 3TWA==
X-Gm-Message-State: AOJu0YwuRsv38RDqCkuxGZ88tQUZ0owFt4HFrFUszl+XK+cjkvzcL1y0
 f6hZguSE2ZP29S76P3P4eMI=
X-Google-Smtp-Source: AGHT+IHMH9uic5dLSCR8Pr0qU32sTrkd1wr2Qfk2m+Ql0J7xa4OYX+U0HMiwUojUtUW7pGG2yw6/9g==
X-Received: by 2002:a17:906:3f1e:b0:a16:3da0:dd36 with SMTP id
 c30-20020a1709063f1e00b00a163da0dd36mr1108363ejj.48.1701711628992; 
 Mon, 04 Dec 2023 09:40:28 -0800 (PST)
Received: from [192.168.2.1] (81-204-249-205.fixed.kpn.net. [81.204.249.205])
 by smtp.gmail.com with ESMTPSA id
 bs5-20020a170906d1c500b00a0bf09c9483sm5512149ejb.35.2023.12.04.09.40.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 04 Dec 2023 09:40:28 -0800 (PST)
Message-ID: <9a2afac1-ed5c-382d-02b0-b2f5f1af3abb@gmail.com>
Date: Mon, 4 Dec 2023 18:40:27 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
From: Johan Jonker <jbx6244@gmail.com>
Subject: [PATCH v1 2/3] ARM: dts: rockchip: rk3036: fix hdmi ports node
To: heiko@sntech.de, hjc@rock-chips.com
References: <49c6afec-022f-02de-99a0-d409b64da198@gmail.com>
Content-Language: en-US
In-Reply-To: <49c6afec-022f-02de-99a0-d409b64da198@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
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
Cc: devicetree@vger.kernel.org, conor+dt@kernel.org, tzimmermann@suse.de,
 krzysztof.kozlowski+dt@linaro.org, linux-kernel@vger.kernel.org,
 mripard@kernel.org, linux-rockchip@lists.infradead.org, robh+dt@kernel.org,
 dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Fix hdmi ports node so that it matches the
rockchip,inno-hdmi.yaml binding.

Signed-off-by: Johan Jonker <jbx6244@gmail.com>
---
 arch/arm/boot/dts/rockchip/rk3036.dtsi | 14 +++++++++++---
 1 file changed, 11 insertions(+), 3 deletions(-)

diff --git a/arch/arm/boot/dts/rockchip/rk3036.dtsi b/arch/arm/boot/dts/rockchip/rk3036.dtsi
index 8aa2e0864fed..2b00109bea6a 100644
--- a/arch/arm/boot/dts/rockchip/rk3036.dtsi
+++ b/arch/arm/boot/dts/rockchip/rk3036.dtsi
@@ -405,12 +405,20 @@ hdmi: hdmi@20034000 {
 		pinctrl-0 = <&hdmi_ctl>;
 		status = "disabled";

-		hdmi_in: port {
+		ports {
 			#address-cells = <1>;
 			#size-cells = <0>;
-			hdmi_in_vop: endpoint@0 {
+
+			hdmi_in: port@0 {
 				reg = <0>;
-				remote-endpoint = <&vop_out_hdmi>;
+
+				hdmi_in_vop: endpoint {
+					remote-endpoint = <&vop_out_hdmi>;
+				};
+			};
+
+			hdmi_out: port@1 {
+				reg = <1>;
 			};
 		};
 	};
--
2.39.2

