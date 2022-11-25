Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3672E638A42
	for <lists+dri-devel@lfdr.de>; Fri, 25 Nov 2022 13:38:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6042F10E74A;
	Fri, 25 Nov 2022 12:37:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com
 [IPv6:2a00:1450:4864:20::32a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 133A510E756
 for <dri-devel@lists.freedesktop.org>; Fri, 25 Nov 2022 12:36:57 +0000 (UTC)
Received: by mail-wm1-x32a.google.com with SMTP id
 c65-20020a1c3544000000b003cfffd00fc0so6121205wma.1
 for <dri-devel@lists.freedesktop.org>; Fri, 25 Nov 2022 04:36:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=m7afU0zY2iy3fcGz+GawNZWOfW2OGctpWqTEihbQc8o=;
 b=RtfCLuTjMOeEDfRS48uKivIdq58YtbVd6zFyIyPNRNT8PGIH0gITEYukf/jWJNGTNc
 KPEsrwq6GE/Cm5tlna11JjJ4pS+W56jS03C2RCdCvkzTIQWF8Q8V9lF2UHYXxfnBNSni
 P+en2LB13pE+PZeqPmBIH2Z7PJ1F3+W5pD8V6oedNSPOYuHZTy/EKSULOZtUsBqzilxX
 I46MszbXaU02kyT2GLc8vBBFr0OTmbtfEuWaXoQcelq6K93pDuS+n3mbHXejdoZYgcge
 7L6WUFknD4r6YWwKV+acOzAS/i38hYNKM+oVijhVA54yLRxkK1JL8WRF8UHOQ/A69Eqy
 ferA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=m7afU0zY2iy3fcGz+GawNZWOfW2OGctpWqTEihbQc8o=;
 b=Z1c51wr4P177F4E5FHHhMhVXYBNXVSz4U2mU+Kf9HfWrNVTZSXj6G2lbLU0bO1mdDB
 MkK8cCayeML9k3aMkGj9+6YQaPxemsNXbENGolVUok4yYgh4EPA4GXWQBqEHMy4TH9ko
 e547jKPbEAj3Y7DK2CHbKPinU3kNO4z4DHFOvMTlzNFkmnH0vNRUOPUbEY0+P/4teghY
 va07DlE1aJCaYe0ApKolw5o2BwoHE0mXSdSQI/mnUMfQbhIU85pPxYu/+SXkZuA+tE99
 kNfO8qE9j1iXZ0EBFIuaArfKbyallQDjehf/aeERXUHQnf6TjUPgJRGxC+qDsj3AIuWq
 YyEw==
X-Gm-Message-State: ANoB5pnAcndb0u39VpGLzmmswlZdSdMgOZXBGTe0aGzgzaeVIh6XfA4w
 HYQpCEiPP5yXNLqZ1s/M3fonMQ==
X-Google-Smtp-Source: AA0mqf4zbOnZG7Lcv6nwc1RMCswiHsVB+h3CFBFo7Ogg96m69jqkj5cPX3nRzaNd0SrYH+9uusDcXg==
X-Received: by 2002:a7b:c3d2:0:b0:3d0:475f:d390 with SMTP id
 t18-20020a7bc3d2000000b003d0475fd390mr1852235wmj.149.1669379815380; 
 Fri, 25 Nov 2022 04:36:55 -0800 (PST)
Received: from sagittarius-a.chello.ie (188-141-3-169.dynamic.upc.ie.
 [188.141.3.169]) by smtp.gmail.com with ESMTPSA id
 k15-20020a5d6d4f000000b002366dd0e030sm3574111wri.68.2022.11.25.04.36.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 25 Nov 2022 04:36:54 -0800 (PST)
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
To: linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
 devicetree@vger.kernel.org
Subject: [PATCH v4 11/18] arm64: dts: qcom: msm8916: Add compat qcom,
 msm8916-dsi-ctrl
Date: Fri, 25 Nov 2022 12:36:31 +0000
Message-Id: <20221125123638.823261-12-bryan.odonoghue@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221125123638.823261-1-bryan.odonoghue@linaro.org>
References: <20221125123638.823261-1-bryan.odonoghue@linaro.org>
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
Cc: dri-devel@lists.freedesktop.org, krzysztof.kozlowski+dt@linaro.org,
 sean@poorly.run, andersson@kernel.org, konrad.dybcio@somainline.org,
 quic_abhinavk@quicinc.com, david@ixit.cz, dianders@chromium.org,
 robh+dt@kernel.org, agross@kernel.org, dmitry.baryshkov@linaro.org,
 bryan.odonoghue@linaro.org, swboyd@chromium.org, linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add silicon specific compatible qcom,msm8916-dsi-ctrl to the
mdss-dsi-ctrl block. This allows us to differentiate the specific bindings
for msm8916 against the yaml documentation.

Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
 arch/arm64/boot/dts/qcom/msm8916.dtsi | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/msm8916.dtsi b/arch/arm64/boot/dts/qcom/msm8916.dtsi
index c1d8a1b388d27..20e72038cadfe 100644
--- a/arch/arm64/boot/dts/qcom/msm8916.dtsi
+++ b/arch/arm64/boot/dts/qcom/msm8916.dtsi
@@ -1021,7 +1021,8 @@ mdp5_intf1_out: endpoint {
 			};
 
 			dsi0: dsi@1a98000 {
-				compatible = "qcom,mdss-dsi-ctrl";
+				compatible = "qcom,msm8916-dsi-ctrl",
+					     "qcom,mdss-dsi-ctrl";
 				reg = <0x01a98000 0x25c>;
 				reg-names = "dsi_ctrl";
 
-- 
2.38.1

