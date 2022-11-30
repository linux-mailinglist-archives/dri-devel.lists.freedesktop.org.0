Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 311C763E145
	for <lists+dri-devel@lfdr.de>; Wed, 30 Nov 2022 21:10:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4659D10E4DE;
	Wed, 30 Nov 2022 20:10:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x22d.google.com (mail-lj1-x22d.google.com
 [IPv6:2a00:1450:4864:20::22d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3F46810E4D6;
 Wed, 30 Nov 2022 20:10:12 +0000 (UTC)
Received: by mail-lj1-x22d.google.com with SMTP id z4so22180881ljq.6;
 Wed, 30 Nov 2022 12:10:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=xiwkmaUk+kjHEaXyaNwbQEqrPkyA7kZAaaBGjnhG2Z8=;
 b=oWRD1+WUXaaxMS5Mg/1rdrbTt8T2V+mdEPBWLT3DExbd71SkO5nzdxGM3PGNxuLF8i
 9n9+7oEnRsw3840Vw2qEDBHGOfiL6vG94R3YhmB2IcEesj6Of7wcSR0AqOplJy7ON7tp
 Zwh/f6efCKHmGMqxaWYRnWoEaIgA6v36Cpc2j5mgoP7Z4C+to6ZYLQNoZVfTZudO1M9M
 kesLWt97H9oeOH8sngOs02k49FZ9fTGzT91FWBC8Lk1hij2gnJZAg3Q88vN2y/IE5Fcr
 hOLH7YADsyu8aOAYNBRq8/roA1a2oLmcG5G6hwf+HIo2l7QVMJMo8zW1qQrntVPR5a6o
 V5vQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=xiwkmaUk+kjHEaXyaNwbQEqrPkyA7kZAaaBGjnhG2Z8=;
 b=UlEob4i9wIKj9eS7WRTlThmhhhH74ZsYv1SfYqaFiq8IOyGb2gk4DfjaaIVlh8tDew
 p+G/OzKTzw6lKjOnGEA84ieDee0Jk0MjhZHNbLWo4B1Gc1nsT8ntAaErYSaY4lX4duD0
 IIOh5cPCWoUVoK2n04bvkh4/hFvb5qI8gtMX/g/kaMJVKigyCACXzefzmWYORwVKorhk
 FvJLi+Hfp+IlQwbkjqXL6Qqg9bMaYhpDIwc+H+43zTQQFfsU5QsuG463uCqDm+7Uyggw
 OK777kxWt8tjWWiXbr/x7dRiXLepdAWAhCy3PAzruCf3pVbiDWpSM/xg/FBQDc9GqVZr
 R3cQ==
X-Gm-Message-State: ANoB5pmCvok9dKQgVeME5cCCqrupUTOtVzY9+W8XbZyk1+zqrRfcvV28
 aVbrGogMK+RyTxMqwaksV8xKIe53ssg=
X-Google-Smtp-Source: AA0mqf7H8jFJmIp9vGhj3Np3GgraaEdLHNj5o6/9BuD0+raVoHuCn9Fl71toHFP3Ere3LMIP9RxUNA==
X-Received: by 2002:a05:651c:198f:b0:277:6a5:109b with SMTP id
 bx15-20020a05651c198f00b0027706a5109bmr16196943ljb.42.1669839009907; 
 Wed, 30 Nov 2022 12:10:09 -0800 (PST)
Received: from localhost.localdomain (ccy110.neoplus.adsl.tpnet.pl.
 [83.30.148.110]) by smtp.gmail.com with ESMTPSA id
 a25-20020a056512201900b004b4e9580b1asm369754lfb.66.2022.11.30.12.10.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 30 Nov 2022 12:10:09 -0800 (PST)
From: Adam Skladowski <a39.skl@gmail.com>
To: 
Subject: [PATCH v2 06/12] arm64: dts: qcom: sm6115: Add rpm-stats node
Date: Wed, 30 Nov 2022 21:09:44 +0100
Message-Id: <20221130200950.144618-7-a39.skl@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221130200950.144618-1-a39.skl@gmail.com>
References: <20221130200950.144618-1-a39.skl@gmail.com>
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
Cc: "Rafael J. Wysocki" <rafael@kernel.org>, Amit Kucheria <amitk@kernel.org>,
 dri-devel@lists.freedesktop.org,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 phone-devel@vger.kernel.org, Daniel Lezcano <daniel.lezcano@linaro.org>,
 Andy Gross <agross@kernel.org>, Zhang Rui <rui.zhang@intel.com>,
 devicetree@vger.kernel.org, Thara Gopinath <thara.gopinath@gmail.com>,
 linux-pm@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 Adam Skladowski <a39.skl@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Rob Herring <robh+dt@kernel.org>, ~postmarketos/upstreaming@lists.sr.ht,
 Sean Paul <sean@poorly.run>, Loic Poulain <loic.poulain@linaro.org>,
 Bjorn Andersson <andersson@kernel.org>, linux-kernel@vger.kernel.org,
 Konrad Dybcio <konrad.dybcio@linaro.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add rpm stats node.

Signed-off-by: Adam Skladowski <a39.skl@gmail.com>
Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
 arch/arm64/boot/dts/qcom/sm6115.dtsi | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm6115.dtsi b/arch/arm64/boot/dts/qcom/sm6115.dtsi
index 6f4c36f3da40..d0928f19965f 100644
--- a/arch/arm64/boot/dts/qcom/sm6115.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm6115.dtsi
@@ -546,6 +546,11 @@ rpm_msg_ram: sram@45f0000 {
 			reg = <0x045f0000 0x7000>;
 		};
 
+		sram@4690000 {
+			compatible = "qcom,rpm-stats";
+			reg = <0x04690000 0x10000>;
+		};
+
 		sdhc_1: mmc@4744000 {
 			compatible = "qcom,sm6115-sdhci", "qcom,sdhci-msm-v5";
 			reg = <0x04744000 0x1000>, <0x04745000 0x1000>, <0x04748000 0x8000>;
-- 
2.25.1

