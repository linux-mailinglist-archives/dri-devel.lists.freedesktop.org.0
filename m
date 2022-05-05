Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A6E551C437
	for <lists+dri-devel@lfdr.de>; Thu,  5 May 2022 17:48:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8C7D010E7C6;
	Thu,  5 May 2022 15:48:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com
 [IPv6:2a00:1450:4864:20::42f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AE8D810E790
 for <dri-devel@lists.freedesktop.org>; Thu,  5 May 2022 15:48:11 +0000 (UTC)
Received: by mail-wr1-x42f.google.com with SMTP id t6so6672113wra.4
 for <dri-devel@lists.freedesktop.org>; Thu, 05 May 2022 08:48:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=duIpxtiykCSeezrgTxT8A8q7XE7qrwoHIpE3IVHNv34=;
 b=GMI0FjqJYk3Cx8Nnjj9PAr8HNET0bq+Oq1TTEgpIs6hZSXcCt0Rk+QTCSvV19L5dCM
 noY5hoXJuHmtJ9+fmDwtLu9VtXsxirjN4lno9rK3zOGPxqPFAyYRNd6VPUfqhk9P9e5r
 1HJQZvoEh1OMpk9bn2WBBfQOG5D6z5orJEqfNRvYEeVW6TUuldp+4T8ayqocGlwjb7d/
 ETt5ZFEqBxpa2xYhIYY2dJgT9ZLScb56ietYyvF+tsTydAP+J1zuiyjdXgkpuMKOiwBk
 oskPtPJbckidlC992DsU8jzou3ODmmBzOypCechi1lSyje4bCL/kMrugs+OmvI7NJLQS
 bCFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=duIpxtiykCSeezrgTxT8A8q7XE7qrwoHIpE3IVHNv34=;
 b=BhJaQX6Z+Fd5qKYzaIjrASDR7Xycql1nYodgJSRDBjC4SOyj/Ltta6wlrqkW3GBhdT
 yWiCl/XLaGpJzK/e2PSapETPyTCuvT5kdDjbNDMZP9HFUgg9picLZ+G7w+yrM6K8WPRG
 oc+5oZiyUBVWKm2FCl3gZbhScJhZHbDzH+n41J89RrFpRXuJVQnEe3V5zKaxx9Tki1au
 qDCjyxKdTjSE/H7rnOwSf0CWa1fh+0oAmXP79aXwtr1uIB3ZGRnphgNz7+qzNFOxov+3
 Ywrw4CBkPUcgXC6wREyFpvsJaQrl9HiXn70WE97MdqNa4kdUkHI6F2RCGKG7va7Jp+yh
 6Xyw==
X-Gm-Message-State: AOAM531Ifnr0T1Gcg0jhTTxqSQ8MiRyBZ2vz1DQori1wvm9LY9k8Nw7E
 TPbDaphX0rU9LEnLRhkkD05iXQ==
X-Google-Smtp-Source: ABdhPJyHr3Zn6CRC5oyGbEZHHp296FsMl3T6au8NoxhUoWUVnxzNOa/YN3KoPSLfW+hy6vfVaIf/8A==
X-Received: by 2002:adf:f50e:0:b0:20a:c54a:42b0 with SMTP id
 q14-20020adff50e000000b0020ac54a42b0mr21067440wro.511.1651765690220; 
 Thu, 05 May 2022 08:48:10 -0700 (PDT)
Received: from localhost.localdomain (xdsl-188-155-176-92.adslplus.ch.
 [188.155.176.92]) by smtp.gmail.com with ESMTPSA id
 c14-20020adffb0e000000b0020c6fa5a797sm1518956wrr.91.2022.05.05.08.48.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 05 May 2022 08:48:09 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Lee Jones <lee.jones@linaro.org>,
 Daniel Thompson <daniel.thompson@linaro.org>,
 Jingoo Han <jingoohan1@gmail.com>, Pavel Machek <pavel@ucw.cz>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Andy Gross <agross@kernel.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Kiran Gunda <kgunda@codeaurora.org>, dri-devel@lists.freedesktop.org,
 linux-leds@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
Subject: [PATCH 2/2] arm64: dts: qcom: correct SPMI WLED register range
 encoding
Date: Thu,  5 May 2022 17:47:02 +0200
Message-Id: <20220505154702.422108-2-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220505154702.422108-1-krzysztof.kozlowski@linaro.org>
References: <20220505154702.422108-1-krzysztof.kozlowski@linaro.org>
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
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On PM660L, PMI8994 and PMI8998, the WLED has two address spaces and with
size-cells=0, they should be encoded as two separate items.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 arch/arm64/boot/dts/qcom/pm660l.dtsi  | 2 +-
 arch/arm64/boot/dts/qcom/pmi8994.dtsi | 2 +-
 arch/arm64/boot/dts/qcom/pmi8998.dtsi | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/pm660l.dtsi b/arch/arm64/boot/dts/qcom/pm660l.dtsi
index cfef42353611..cf26432bb7ce 100644
--- a/arch/arm64/boot/dts/qcom/pm660l.dtsi
+++ b/arch/arm64/boot/dts/qcom/pm660l.dtsi
@@ -67,7 +67,7 @@ pmic@3 {
 
 		pm660l_wled: leds@d800 {
 			compatible = "qcom,pm660l-wled";
-			reg = <0xd800 0xd900>;
+			reg = <0xd800>, <0xd900>;
 			interrupts = <0x3 0xd8 0x1 IRQ_TYPE_EDGE_RISING>;
 			interrupt-names = "ovp";
 			label = "backlight";
diff --git a/arch/arm64/boot/dts/qcom/pmi8994.dtsi b/arch/arm64/boot/dts/qcom/pmi8994.dtsi
index 6e7c252568e6..81899fe17f2b 100644
--- a/arch/arm64/boot/dts/qcom/pmi8994.dtsi
+++ b/arch/arm64/boot/dts/qcom/pmi8994.dtsi
@@ -35,7 +35,7 @@ pmi8994_spmi_regulators: regulators {
 
 		pmi8994_wled: wled@d800 {
 			compatible = "qcom,pmi8994-wled";
-			reg = <0xd800 0xd900>;
+			reg = <0xd800>, <0xd900>;
 			interrupts = <3 0xd8 0x02 IRQ_TYPE_EDGE_RISING>;
 			interrupt-names = "short";
 			qcom,cabc;
diff --git a/arch/arm64/boot/dts/qcom/pmi8998.dtsi b/arch/arm64/boot/dts/qcom/pmi8998.dtsi
index 0fef5f113f05..ef29e80c442c 100644
--- a/arch/arm64/boot/dts/qcom/pmi8998.dtsi
+++ b/arch/arm64/boot/dts/qcom/pmi8998.dtsi
@@ -44,7 +44,7 @@ lab: lab {
 
 		pmi8998_wled: leds@d800 {
 			compatible = "qcom,pmi8998-wled";
-			reg = <0xd800 0xd900>;
+			reg = <0xd800>, <0xd900>;
 			interrupts = <0x3 0xd8 0x1 IRQ_TYPE_EDGE_RISING>,
 				     <0x3 0xd8 0x2 IRQ_TYPE_EDGE_RISING>;
 			interrupt-names = "ovp", "short";
-- 
2.32.0

