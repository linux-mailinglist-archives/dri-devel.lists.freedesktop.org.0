Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D9986F9B10
	for <lists+dri-devel@lfdr.de>; Sun,  7 May 2023 21:07:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C85CD10E2C0;
	Sun,  7 May 2023 19:07:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com
 [IPv6:2a00:1450:4864:20::132])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 83A1D10E2C0
 for <dri-devel@lists.freedesktop.org>; Sun,  7 May 2023 19:07:40 +0000 (UTC)
Received: by mail-lf1-x132.google.com with SMTP id
 2adb3069b0e04-4f00d41df22so25277722e87.1
 for <dri-devel@lists.freedesktop.org>; Sun, 07 May 2023 12:07:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1683486458; x=1686078458;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Vi+qNNaZPyxsefGB1oajp1oVBPaOfr1xKPuapQZUe7c=;
 b=TJ2OW2h9+vAdfIimLLcFyqQpLgWeG13d7qrrf6/L4c9rdK2z/x9YfLYFal1s3weaPq
 Qas9IUxu4knuqOr+Qc8iqe7KXNJ3/Ui8jDwznA7k2fRx7LK7ycX3Ge/uor9R/QHsOTsj
 2tU+/KBSNHO0jehJGuAOFL5YKnqHNgTKtAxGHZreISsnHRozBPIBCYZ8Co+Xg8zlho69
 KX7JMZlYmp3+go6LLLSm/AANkOlRsok01w7Dm/NLi2WY0grLrEdqrwE77v97f3sLM15/
 hAj1RheSj8S5M8u+V1W7sjS4HS4KR8RBLpcCn1bZGsp9Amuw2+9V5pjodKvQ7ehDXshs
 nlCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683486458; x=1686078458;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Vi+qNNaZPyxsefGB1oajp1oVBPaOfr1xKPuapQZUe7c=;
 b=ESX2qFgTihvnZN1wuJMMvJn/QRrg5dHOow/tc2BBbyeb4GTF48hZygqRO43P8UeWaP
 +pNKNIc8nQF2Eaa5zlrIfKlvygKaqh6RuXs6ANrKYUKbbt1S/x69lmij+xYHorKyx0gK
 D5N+vaxThWxherrVZreuCX99/9l6OhrhL+AKMOTNlOO7KR7gskpxivRiyPpslvNEmxKC
 e+r4TpzDQ2IT6cCJZzI5p8UQ1sX2SlY0MPDLpiOT8fmwIGlP5+9GP+5zMZtZPy9mLwTQ
 sm/4maOaFNjBB1sRQWaAbjs7PTFHvduQOGONp94WKUJcCc+c+pGpux634a+nommFgQxu
 iuYQ==
X-Gm-Message-State: AC+VfDwruZz0RMXTf2tfdc+fSdKphdx3pu/ViHQR62jNXJC2VX9BbqY1
 zqpr4xiSKLJpgVLh7K/Ew73ugw==
X-Google-Smtp-Source: ACHHUZ54X56ZL4KurSonVDETk5lAq4ryk4zzE4ihXGauROlICUtkYX8683vKfjtxl1NB3mlT5ufddg==
X-Received: by 2002:a19:5507:0:b0:4d8:5de4:e3b4 with SMTP id
 n7-20020a195507000000b004d85de4e3b4mr2069054lfe.1.1683486457955; 
 Sun, 07 May 2023 12:07:37 -0700 (PDT)
Received: from lothlorien.lan (dzdqv0yyyyyyyyyyybm5y-3.rev.dnainternet.fi.
 [2001:14ba:a0db:1f00::ab2]) by smtp.gmail.com with ESMTPSA id
 f8-20020a19ae08000000b004f14ecc03f1sm755841lfc.100.2023.05.07.12.07.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 07 May 2023 12:07:37 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>, Rob Clark <robdclark@gmail.com>,
 Sean Paul <sean@poorly.run>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Subject: [PATCH 1/4] ARM: dts: qcom: msm8974: add ocmem clock to GPU
Date: Sun,  7 May 2023 22:07:32 +0300
Message-Id: <20230507190735.2333145-2-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230507190735.2333145-1-dmitry.baryshkov@linaro.org>
References: <20230507190735.2333145-1-dmitry.baryshkov@linaro.org>
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
Cc: devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Stephen Boyd <swboyd@chromium.org>,
 freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

To get GPU working with the OCMEM, the oxili_ocmemgx_clk clock should be
enabled. Pass it to the GPU to get it to work on apq8074/msm8974 boards.

Fixes: fe079442db63 ("ARM: dts: qcom: msm8974: add gpu support")
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 arch/arm/boot/dts/qcom-msm8974.dtsi | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/qcom-msm8974.dtsi b/arch/arm/boot/dts/qcom-msm8974.dtsi
index 834ad95515b1..fb661c1bd3d5 100644
--- a/arch/arm/boot/dts/qcom-msm8974.dtsi
+++ b/arch/arm/boot/dts/qcom-msm8974.dtsi
@@ -2104,8 +2104,9 @@ gpu: adreno@fdb00000 {
 
 			clocks = <&mmcc OXILI_GFX3D_CLK>,
 				 <&mmcc OXILICX_AHB_CLK>,
+				 <&mmcc OXILI_OCMEMGX_CLK>,
 				 <&mmcc OXILICX_AXI_CLK>;
-			clock-names = "core", "iface", "mem_iface";
+			clock-names = "core", "iface", "mem", "mem_iface";
 
 			sram = <&gmu_sram>;
 			power-domains = <&mmcc OXILICX_GDSC>;
-- 
2.39.2

