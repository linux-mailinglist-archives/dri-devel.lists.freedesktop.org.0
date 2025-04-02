Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B649FA79147
	for <lists+dri-devel@lfdr.de>; Wed,  2 Apr 2025 16:36:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 215D910E7D9;
	Wed,  2 Apr 2025 14:36:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="rtRxZi0E";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com
 [209.85.128.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9270310E7D5
 for <dri-devel@lists.freedesktop.org>; Wed,  2 Apr 2025 14:36:40 +0000 (UTC)
Received: by mail-wm1-f53.google.com with SMTP id
 5b1f17b1804b1-43ce70f9afbso70816375e9.0
 for <dri-devel@lists.freedesktop.org>; Wed, 02 Apr 2025 07:36:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1743604599; x=1744209399; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=Mh4boQsSW/1gwg5sSN4EStVan8aEzJn/qzxSEcSDKHI=;
 b=rtRxZi0E3AFtmXkK8M0zU082ri+ki4p6vZBWNrFGuE97XerI4VdP5mS77fXvWfYWs4
 5Ra4GZVEkrO3SAfOptHFD+OdIeVmZtYH6wgTs65hztl3A6DWAcFj24l6X4iYqy11T7sY
 ghKa/L5CHdHsuT9HuJOB2ttLSLBWn/uwGXpQDWe3UPsfuYN9NW/eBV58nl2H2HjyCtBT
 ys/Keq/MX5q1vX1xfCI929xNKOt0ZyIE4R9N09uZHP4mcH6Hpo+NNVc/+muM5zHQsyIf
 K+lkNFmsiZztSBESgZeMSxaundrAChEYrR2lAcIaMm1bIL+/XW5KZ7tqtjdj5qR5NgS8
 hiIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1743604599; x=1744209399;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Mh4boQsSW/1gwg5sSN4EStVan8aEzJn/qzxSEcSDKHI=;
 b=lkniBZrjlaBGCRKJH4wyTC+uJ1Sa1R+6KTvtthafH1E0A7dzwWHzs8rYdRmaPj3tYT
 Y6S2lTthxneHRHv392gqg2NVyE3FPcD8vdIB78h8FnZcKgnYb75pEXyA0HuBvI89nR/c
 HltBkMkSdzlCYZq1CsBDkqNlhq0bOWRgprpF3a+x53lqIySAimraCO4KDixzuSxyA+p8
 hgayVIYOPqZdnwgYwpaPa85PuYPwpbhaz5sK5wnHREhBW3wnTKXDUtw5abIjJ3YL3CC0
 j0s9AMlZruOAI95m4QuNaRTcYsggPXTvXYvPQt8ydW+fuuR8v3eSHw/m75n4SFO5545C
 MvFA==
X-Gm-Message-State: AOJu0YyhB1/4/IRiJICbdkB9KOCVruSvDrhnTrHPBNsWTX2V+i/7hyGc
 4R3467jCAGsiVQ4GRs/11PytdTXjz+IyZe7uyJlmA+RQzBTkAMu5NyAvCBe2V08=
X-Gm-Gg: ASbGncvP1aj/nOTOWZpCOh/jrlRg3OZZVMAtqWNvPeQnpgdUMAxkcqUpu+QaZMMYXaf
 XNE71dq+Da5FTHfEydDOZdzO1xVwFGjxRIhZZrW7s7qQohWMo/Atd/WPciQJQRcA99UKJs/NzFN
 yFdrJvOf7N/BpcIY7SG9bP0pv2ESZ/gF3lCrPsOAbJ5itgk/QbSanmXpGPpGh7P6cJOkIQbQ41F
 DpPKNqzDlsHq24l2bB8QbkPGe2MJxP2wqom3BMuuk8Cm2evO2TFHu78geljDW4+LWDx4kV1ZUZQ
 jobaU4Y2CSdP/+y1GE683ThuJftu0QHIt8S0u8g/Mphp/6FrMlfMdvHN
X-Google-Smtp-Source: AGHT+IFNQUUyB8A1bTf4Ij5qY/HCNx5j9z9iFYAzAYi1EJMrBAvFa5jrSvb56dJD7kXugebXVJZV8g==
X-Received: by 2002:a05:600c:3507:b0:43c:e70d:450c with SMTP id
 5b1f17b1804b1-43db62b7b59mr118985945e9.22.1743604599115; 
 Wed, 02 Apr 2025 07:36:39 -0700 (PDT)
Received: from localhost ([213.215.212.194])
 by smtp.gmail.com with UTF8SMTPSA id
 5b1f17b1804b1-43eb61b6469sm22404065e9.34.2025.04.02.07.36.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 02 Apr 2025 07:36:38 -0700 (PDT)
From: Christopher Obbard <christopher.obbard@linaro.org>
Date: Wed, 02 Apr 2025 15:36:33 +0100
Subject: [PATCH v5 2/3] arm64: dts: qcom: x1e78100-t14s: add hpd gpio to dp
 controller
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250402-wip-obbardc-qcom-t14s-oled-panel-v5-2-ff33f4d0020f@linaro.org>
References: <20250402-wip-obbardc-qcom-t14s-oled-panel-v5-0-ff33f4d0020f@linaro.org>
In-Reply-To: <20250402-wip-obbardc-qcom-t14s-oled-panel-v5-0-ff33f4d0020f@linaro.org>
To: Douglas Anderson <dianders@chromium.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Jessica Zhang <quic_jesszhan@quicinc.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, 
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, Johan Hovold <johan@kernel.org>, 
 Rui Miguel Silva <rui.silva@linaro.org>, Abel Vesa <abel.vesa@linaro.org>, 
 devicetree@vger.kernel.org, 
 Christopher Obbard <christopher.obbard@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=962;
 i=christopher.obbard@linaro.org; h=from:subject:message-id;
 bh=lYKcS/S64jaBbWA7VwCFB9G+w+RBu3krRD7r8H3WqDo=;
 b=owEBbQKS/ZANAwAKAWNNxPBocEb4AcsmYgBn7Ut0+zTamMU6afHjzWIHKk1AnyJXEH2d7oI3f
 zEreawG54KJAjMEAAEKAB0WIQTxi9yLbCX5CqI9UXRjTcTwaHBG+AUCZ+1LdAAKCRBjTcTwaHBG
 +L8UD/sFmaJoyYlFHncItTgKvQT+7iy/a24yOrWQrSW+Jzsa3s4pz+KcXTd/wyhPL+f1YDcWVln
 VvWRcMV6o1XdUqEOScDVN1iQIspnwC5hZZZriTHQjqSNA8XAHcteCpcBCyT1me4XTIDnk8e9cHa
 +j/qmFo24hpuxawRQVMolmGdO0/Zrtp+tIq2kiY4NiMiHyI4QWRNjKdQXEuN3v7+gb8oc4eR6G6
 j+vWangFowfOnVpgqOu0plaYGGfGcWS9FirjyncFkDdt/GrS14wURsQhoee+MqpHDO7ypas4jaV
 la+8O65p5PcjXoOojtEjs4cXbdXdxVSflTlFOVHOIsbGmUQeiiCTM1dGz5yyfwhYvwugvd1OPDf
 K41MaX9SyBJ7r4ks9WafACMsjhDXVpXkul2qNIo6EiUWq9vJjHVBn786BtTKWDZA3BgbSgR0ngo
 F+WLVw/xeEmykzvaEQEY0urze+apugdNN3qA4ach3mycH+5mRXfS4ZOneTOoCDGOayutHZYbGwi
 A8+BzbvsiWq2C9s0V23lN0WRey5KoTyBwO2If7KkqS6SB613tU8+y6b8DzlUWY9QnqVyKkVR02Y
 eUaORjv0UUw/KXCpclIhKgsmDHKdhzxTluaMJtdnOFByMdj5cYU6MtlDWLFiOtTSay9zQoOQbP3
 ayNgWCIzO0Hwslg==
X-Developer-Key: i=christopher.obbard@linaro.org; a=openpgp;
 fpr=F18BDC8B6C25F90AA23D5174634DC4F0687046F8
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

The eDP controller has an HPD GPIO. Describe it in the device tree
for the generic T14s model, as the HPD GPIO is used in both the
OLED and LCD models which inherit this device tree.

Signed-off-by: Christopher Obbard <christopher.obbard@linaro.org>
---
 arch/arm64/boot/dts/qcom/x1e78100-lenovo-thinkpad-t14s.dtsi | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/x1e78100-lenovo-thinkpad-t14s.dtsi b/arch/arm64/boot/dts/qcom/x1e78100-lenovo-thinkpad-t14s.dtsi
index 962fb050c55c4fd33f480a21a8c47a484d0c82b8..bbeb2e6f039957e443f0f6d16dc00fc62b012425 100644
--- a/arch/arm64/boot/dts/qcom/x1e78100-lenovo-thinkpad-t14s.dtsi
+++ b/arch/arm64/boot/dts/qcom/x1e78100-lenovo-thinkpad-t14s.dtsi
@@ -975,6 +975,9 @@ &mdss_dp3 {
 	compatible = "qcom,x1e80100-dp";
 	/delete-property/ #sound-dai-cells;
 
+	pinctrl-names = "default";
+	pinctrl-0 = <&edp_hpd_active>;
+
 	status = "okay";
 
 	aux-bus {

-- 
2.49.0

