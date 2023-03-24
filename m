Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 017FB6C7B5B
	for <lists+dri-devel@lfdr.de>; Fri, 24 Mar 2023 10:29:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CA4B410EBB5;
	Fri, 24 Mar 2023 09:28:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com
 [IPv6:2a00:1450:4864:20::42f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 783C710EBAC
 for <dri-devel@lists.freedesktop.org>; Fri, 24 Mar 2023 09:28:54 +0000 (UTC)
Received: by mail-wr1-x42f.google.com with SMTP id o7so1057630wrg.5
 for <dri-devel@lists.freedesktop.org>; Fri, 24 Mar 2023 02:28:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1679650134;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=G1ntWqPvbl8kGAf5jmOavKVWVNA9yjNdYOTT1NeTQto=;
 b=dMTb6gr1isL4ipIYJvx95bwe4tCkL/ZqlaFP1ZfdIDa2+jhvUYgjctubziv9PWUHQM
 QDECGJL5Vc1eIBa7fB1PCK5xOS0oinwg9FLumubAqCCYMQlN2hfx3cxf9dS5U1Ho8Ltv
 Z1hbt12e424IMDNXLD/4vHM9YUqFKtroqx/BIgqL036R0KOuWhgg7kJormSF10RuS5nc
 zSAbkLO9BJfL2jPZhbAxiaZulRapmDeR+bzu5cyPfSVh7IBS41xWpy/wa8e7rBF6jEZb
 GojHPE/KN4l8uKVQeRq8/GX/vf2zpLVzG/E+UcmTk5Htko+CLiNATFv8iH5PC+QI2Etx
 9trQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679650134;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=G1ntWqPvbl8kGAf5jmOavKVWVNA9yjNdYOTT1NeTQto=;
 b=xANVCM3csS+3BUBRutqFE835nzQBqIFSPwmQOpVcb/SOdgbPob9Q2QpNj0HgWa7WBp
 wowPFDTqhchHQdIeg2DkwcBbFrWJklx2SZ6YGDmRQ14CmUqvobSHzX//GdZE5eQRwcIb
 Isgd1YA4hbIgNZe2k6kRCYdRlGkre8dty3lNnaRFk+FgxgMcidX9uJ1Cb3WgSlyehJ7c
 H2v78bpdKtJuRrbxRu5mQMjwpBHSBULn+Z14adYrTQXYU5LXvfVffKrlz/ZQbQJy5+nt
 DRPh8r7P84cfVHGBL9sxE0e0WUXIVZV2guZZdLHblfH9ZApf10KZlIoJ9iGurtSbnFjF
 Ceig==
X-Gm-Message-State: AAQBX9cTRe14HMdw/ZLB9hUvvx9nvzJV6TIHMjOcXrA2wXAOwUdSBac7
 6LZFWZWYPUdoxAjq5m4MinepHQ==
X-Google-Smtp-Source: AKy350Y6IKD0M0ELlHzawvspKtRuzZByYiL1aaAivca8f7Uw9pUugHmlK5tLkfVOzSHjpHvXZki7lA==
X-Received: by 2002:a5d:5586:0:b0:2ce:b7a1:c1a9 with SMTP id
 i6-20020a5d5586000000b002ceb7a1c1a9mr1443129wrv.2.1679650133993; 
 Fri, 24 Mar 2023 02:28:53 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:52eb:f6ff:feb3:451a])
 by smtp.gmail.com with ESMTPSA id
 v14-20020adfe28e000000b002c5a790e959sm18029980wri.19.2023.03.24.02.28.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 24 Mar 2023 02:28:53 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
Date: Fri, 24 Mar 2023 10:28:49 +0100
Subject: [PATCH v2 4/4] arm64: dts: qcom: sm8450: fix pcie1 gpios
 properties name
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230323-topic-sm8450-upstream-dt-bindings-fixes-v2-4-0ca1bea1a843@linaro.org>
References: <20230323-topic-sm8450-upstream-dt-bindings-fixes-v2-0-0ca1bea1a843@linaro.org>
In-Reply-To: <20230323-topic-sm8450-upstream-dt-bindings-fixes-v2-0-0ca1bea1a843@linaro.org>
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>
X-Mailer: b4 0.12.1
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
Cc: devicetree@vger.kernel.org, Neil Armstrong <neil.armstrong@linaro.org>,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add the final "s" to the pgio properties and fix the invalid "enable"
name to the correct "wake", checked against the HDK8450 schematics.

Fixes: bc6588bc25fb ("arm64: dts: qcom: sm8450: add PCIe1 root device")
Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 arch/arm64/boot/dts/qcom/sm8450.dtsi | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sm8450.dtsi b/arch/arm64/boot/dts/qcom/sm8450.dtsi
index bcb51e612261..398661498920 100644
--- a/arch/arm64/boot/dts/qcom/sm8450.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8450.dtsi
@@ -1908,8 +1908,8 @@ pcie1: pci@1c08000 {
 			phys = <&pcie1_lane>;
 			phy-names = "pciephy";
 
-			perst-gpio = <&tlmm 97 GPIO_ACTIVE_LOW>;
-			enable-gpio = <&tlmm 99 GPIO_ACTIVE_HIGH>;
+			perst-gpios = <&tlmm 97 GPIO_ACTIVE_LOW>;
+			wake-gpios = <&tlmm 99 GPIO_ACTIVE_HIGH>;
 
 			pinctrl-names = "default";
 			pinctrl-0 = <&pcie1_default_state>;

-- 
2.34.1

