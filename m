Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A9D94C9A2D
	for <lists+dri-devel@lfdr.de>; Wed,  2 Mar 2022 01:52:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2D6F110E8FB;
	Wed,  2 Mar 2022 00:52:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x236.google.com (mail-lj1-x236.google.com
 [IPv6:2a00:1450:4864:20::236])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2164C10E93B
 for <dri-devel@lists.freedesktop.org>; Wed,  2 Mar 2022 00:52:19 +0000 (UTC)
Received: by mail-lj1-x236.google.com with SMTP id v28so125122ljv.9
 for <dri-devel@lists.freedesktop.org>; Tue, 01 Mar 2022 16:52:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=mdO1kFafRmQB1ylhJ2FjgGW8EzDUwR+K8t4/Xs4kq9Q=;
 b=Fxtmo3aMycl7xk+Lul0LSWm5TG/mfwTVTqYPa+KjBqw5rC0QwR7Ao0sUfevGtF5LD4
 k64tX8Oo4Lji0Neh2ivP2XcbTNozVjQZ02oR1Nq42hy8yNDHgzFbvVup1KAMGd/AUj4z
 J5bd2yGF/yd/cXGRy8M0E6h1bI/X2QcQUDBFaSpPSmogfHEwn3hhkFEkxYGOVvU0fhVW
 uEVLgFXq+9blz33lpJTojXDydraVexwlMs0VZ/Ra4aQG66KwSwbME0Ze4wWQuv4GjwkD
 SnEsJAQw7eFWZc2JRZ+m931di+scS7Ohj+zfIR4887/m6dwmD/D6YZCL7mvTovY+c/w7
 +zNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=mdO1kFafRmQB1ylhJ2FjgGW8EzDUwR+K8t4/Xs4kq9Q=;
 b=OHc5WcqP4biglP1Tvx33DUWQVNFe+FAfJSYFU/zgVcUa1y/kMqmBoieEvaHklvyWrf
 kRGWa9iH0k18l3mKT2ud6beQ/ZuHJcIBePB0ZecBj+3qh/eTaKnAHX3c6V9JilELch8C
 0qN3pzqvwEbphqPphkCgWRCqa6S8lBdidKKjf69Rtsc66plPQ74z0QUflAN2zSk9e8Tk
 IdIFh0Mrk0lzgeNKbWSvtiefk55Th7Rz3cDNpQe0d1aAuScZuNPDnPFO/3woGK6fOxjo
 6ftj7MDl/2EbT+xAWbTJFiqqbQqDw482hJh5jZzcxrjELMEFJ0e5oNKoAvlfGA/UQlvW
 seCQ==
X-Gm-Message-State: AOAM531CT2L1lcs+mS436ntEhzIn9qnc54m6iZ2UGWkX33Wvrh/VDsZN
 6Es5FTKNFkKH3IYAbuFKRdkbfw==
X-Google-Smtp-Source: ABdhPJxpIAoiAGbopIhIpyPpAucdmEDZ21agCkEkSvjzXqvdU+rcmpCfmeynxX6N0Hks9plHTf6bhQ==
X-Received: by 2002:a05:651c:1209:b0:22e:353c:76c0 with SMTP id
 i9-20020a05651c120900b0022e353c76c0mr18589141lja.139.1646182337477; 
 Tue, 01 Mar 2022 16:52:17 -0800 (PST)
Received: from eriador.lan ([2001:470:dd84:abc0:5258:5528:7624:3edd])
 by smtp.gmail.com with ESMTPSA id
 n23-20020a19ef17000000b00445b8db3c42sm198171lfh.172.2022.03.01.16.52.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 01 Mar 2022 16:52:17 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Bjorn Andersson <bjorn.andersson@linaro.org>,
 Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Subject: [PATCH 5/5] arm64: dts: qcom: sm8250: Drop flags for mdss irqs
Date: Wed,  2 Mar 2022 03:52:10 +0300
Message-Id: <20220302005210.2267725-5-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220302005210.2267725-1-dmitry.baryshkov@linaro.org>
References: <20220302005210.2267725-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
Cc: devicetree@vger.kernel.org, David Airlie <airlied@linux.ie>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Stephen Boyd <swboyd@chromium.org>, freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The number of interrupt cells for the mdss interrupt controller is 1,
meaning there should only be one cell for the interrupt number, not two.
Drop the second cell containing (unused) irq flags.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 arch/arm64/boot/dts/qcom/sm8250.dtsi | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sm8250.dtsi b/arch/arm64/boot/dts/qcom/sm8250.dtsi
index fdaf303ba047..956848068871 100644
--- a/arch/arm64/boot/dts/qcom/sm8250.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8250.dtsi
@@ -3200,7 +3200,7 @@ mdss_mdp: mdp@ae01000 {
 				power-domains = <&rpmhpd SM8250_MMCX>;
 
 				interrupt-parent = <&mdss>;
-				interrupts = <0 IRQ_TYPE_LEVEL_HIGH>;
+				interrupts = <0>;
 
 				ports {
 					#address-cells = <1>;
@@ -3252,7 +3252,7 @@ dsi0: dsi@ae94000 {
 				reg-names = "dsi_ctrl";
 
 				interrupt-parent = <&mdss>;
-				interrupts = <4 IRQ_TYPE_LEVEL_HIGH>;
+				interrupts = <4>;
 
 				clocks = <&dispcc DISP_CC_MDSS_BYTE0_CLK>,
 					 <&dispcc DISP_CC_MDSS_BYTE0_INTF_CLK>,
@@ -3325,7 +3325,7 @@ dsi1: dsi@ae96000 {
 				reg-names = "dsi_ctrl";
 
 				interrupt-parent = <&mdss>;
-				interrupts = <5 IRQ_TYPE_LEVEL_HIGH>;
+				interrupts = <5>;
 
 				clocks = <&dispcc DISP_CC_MDSS_BYTE1_CLK>,
 					 <&dispcc DISP_CC_MDSS_BYTE1_INTF_CLK>,
-- 
2.34.1

