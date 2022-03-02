Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 744DF4C9A2A
	for <lists+dri-devel@lfdr.de>; Wed,  2 Mar 2022 01:52:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BDC4D10E91A;
	Wed,  2 Mar 2022 00:52:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com
 [IPv6:2a00:1450:4864:20::12d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BF36910E853
 for <dri-devel@lists.freedesktop.org>; Wed,  2 Mar 2022 00:52:17 +0000 (UTC)
Received: by mail-lf1-x12d.google.com with SMTP id bu29so204354lfb.0
 for <dri-devel@lists.freedesktop.org>; Tue, 01 Mar 2022 16:52:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=W7xjJAoU4ptNKmChTRqSq+Gw3fZE/TkYmjx78F7vN8w=;
 b=SqcH/IEbxNgW8RlMnRkRygD6MkdViXJQvrlfxNoJUJCJR0ZdJj+CgIx6VxTEZ04HoP
 1xG8gwhfYcIwabk3J5QzmieP52ooJj48NvR8ong99VN35W2bysOjAzt3qjqHv7s3yql7
 VqoSZjS84zcg2owgSzOD/4JqTcFS3oCiD+Qv2DObxFYUb9x27J4KiYG0yoaKnTryPzX2
 o+NO6q8VE65DaFd40zPcauyUNqukTHRuO02t3ev/m0Z0g7VE+KJa+7UMOJbB9JpD2weW
 B/Wsx/FfaIoKmdm6Slfxo/mFjYegaE7EVDyyVzNuZnlhKOC7B23NipjkLmZGgywowxN+
 n7Vg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=W7xjJAoU4ptNKmChTRqSq+Gw3fZE/TkYmjx78F7vN8w=;
 b=U9M2Ey6nEQnmF0Xx6H+ouPxftR8ySrC06n4Igs9Ag4LMFyuBXsiZkQe+lgTN0YfhlA
 +kDNia7NpBS+7FNfAFMYBG/KzN8dVim7cxQKbgkQ6Clpdb6mT1ITkxKy3JRQHI/kij3/
 3d/lqxGzbrJLAIRtzj48nyqCIgT2E56d+EW8PtofuJkgOhDviDS9ZGxZuJS5RdJMT14F
 Dm6rCvjxt0QYpk5c84JYR1oXMaSv274OGba4IXyD+j61HCxVAQa/1nx9ZV+E53XqSWQk
 9JrTB3HQcxMzqq9Q6YMqML2dwjKE6Py/XmzLQbKKgdWfpll7B5djXGGigK91o3c2U+7C
 XNYw==
X-Gm-Message-State: AOAM533sAXLSuMTnVvnSyUOsd6Ye0LxOl45yBYJigRDODPsGrcAOgy+d
 P/1rFBzSdkBM+EdKV4xuhZ8Hxg==
X-Google-Smtp-Source: ABdhPJxEK0920YIHgw1rH58z3JYo6bDjeyqPPqzTPpGMsRoCZxGvGLI3sDe8vWPkrwdDoOkc6Nm5DA==
X-Received: by 2002:a05:6512:3f0d:b0:443:5f35:6360 with SMTP id
 y13-20020a0565123f0d00b004435f356360mr16505159lfa.661.1646182336144; 
 Tue, 01 Mar 2022 16:52:16 -0800 (PST)
Received: from eriador.lan ([2001:470:dd84:abc0:5258:5528:7624:3edd])
 by smtp.gmail.com with ESMTPSA id
 n23-20020a19ef17000000b00445b8db3c42sm198171lfh.172.2022.03.01.16.52.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 01 Mar 2022 16:52:15 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Bjorn Andersson <bjorn.andersson@linaro.org>,
 Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Subject: [PATCH 4/5] arm64: dts: qcom: sdm845: Drop flags for mdss irqs
Date: Wed,  2 Mar 2022 03:52:09 +0300
Message-Id: <20220302005210.2267725-4-dmitry.baryshkov@linaro.org>
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
 arch/arm64/boot/dts/qcom/sdm845.dtsi | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sdm845.dtsi b/arch/arm64/boot/dts/qcom/sdm845.dtsi
index 41f4e46e1f85..95e6a97c2170 100644
--- a/arch/arm64/boot/dts/qcom/sdm845.dtsi
+++ b/arch/arm64/boot/dts/qcom/sdm845.dtsi
@@ -4281,7 +4281,7 @@ mdss_mdp: mdp@ae01000 {
 				power-domains = <&rpmhpd SDM845_CX>;
 
 				interrupt-parent = <&mdss>;
-				interrupts = <0 IRQ_TYPE_LEVEL_HIGH>;
+				interrupts = <0>;
 
 				ports {
 					#address-cells = <1>;
@@ -4333,7 +4333,7 @@ dsi0: dsi@ae94000 {
 				reg-names = "dsi_ctrl";
 
 				interrupt-parent = <&mdss>;
-				interrupts = <4 IRQ_TYPE_LEVEL_HIGH>;
+				interrupts = <4>;
 
 				clocks = <&dispcc DISP_CC_MDSS_BYTE0_CLK>,
 					 <&dispcc DISP_CC_MDSS_BYTE0_INTF_CLK>,
@@ -4405,7 +4405,7 @@ dsi1: dsi@ae96000 {
 				reg-names = "dsi_ctrl";
 
 				interrupt-parent = <&mdss>;
-				interrupts = <5 IRQ_TYPE_LEVEL_HIGH>;
+				interrupts = <5>;
 
 				clocks = <&dispcc DISP_CC_MDSS_BYTE1_CLK>,
 					 <&dispcc DISP_CC_MDSS_BYTE1_INTF_CLK>,
-- 
2.34.1

