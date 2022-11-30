Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A4A8263E147
	for <lists+dri-devel@lfdr.de>; Wed, 30 Nov 2022 21:10:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A4D9E10E4E1;
	Wed, 30 Nov 2022 20:10:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com
 [IPv6:2a00:1450:4864:20::134])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B573710E4D3;
 Wed, 30 Nov 2022 20:10:07 +0000 (UTC)
Received: by mail-lf1-x134.google.com with SMTP id s8so28649250lfc.8;
 Wed, 30 Nov 2022 12:10:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=4hbF3gZ7kPvhXmdkKwDqNUnpoPNqBtEugPC+3rCNF/M=;
 b=UfLONb8EyGAqcc9/JHngFeCMpe5K1TtJ2QUC+LzT+ytubcXUjVy5P5YG1mv3sl5XBA
 JYzxhEY4chT0YFVe1YlX4o5frzK/7O43CsCLnMHrSmP2LS/PiWr7JnpCmxTbXSTib3r8
 X9GoOZ5VRCQ1x1KaJXAu2QEFm6S1BQ30rZXbPmA8kU2P4dohvq1nlQ8N8OevstO4q2DU
 g2iUnMzsZdlcyHlcI8fPWRvAmNb9Rv8IH/4ega0IaGd9Gx4Z0yYpYSQC13tEAaWWTOkt
 crrXobk1bnqOtwrv0Lyw0T+e2JqvSqrCKYfEeoPDjRDaVtiS8TrQGxS0DA02YTelaNFF
 Diwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=4hbF3gZ7kPvhXmdkKwDqNUnpoPNqBtEugPC+3rCNF/M=;
 b=QLnakVrXrFkDNMzoZ6a1jWPb3m2RtSmyEy82ia3rDCtbybBrF/P2GbwqB2noACiouu
 GWAStBgxTN0fS615ih2XIE8GkhanTRzdkoqxN1lZ105QikVIIBt8oBBREeB7kpG6rtZq
 +EqMjrBYqfKrWcz0eXvvT/5GznDQY8a8O1b8waM/dPYRAuR6LZrHcs2P9AZMd9ohB/Kp
 aUaq5udlchrQZFkXPZt24P/9d8GzrvZj3UrEvrdvUiGU+ds6Zj2rhSMR19l05sXj5C7r
 tC9J16p+225QLOulCY/UX+3a7FPTZC6yN/4eY9XFja1Ui6vFONJle9DAn+iXuEXZM8Av
 lEUg==
X-Gm-Message-State: ANoB5ploYzCMc6L/bB3AxRdZYkUkmNzSPXCyuFG/91YO5ANWVcLK4KzG
 zb6cki2ItsxflJ5yi2WHi0M=
X-Google-Smtp-Source: AA0mqf4UT8S7EhO1mnlZSwwZpalSw7bUYoEnFAfBQs5kQ2jOZ9T8Zn1lX/HJJv/f953zpWAAhpBIxQ==
X-Received: by 2002:a05:6512:2a98:b0:4b1:4612:6d06 with SMTP id
 dt24-20020a0565122a9800b004b146126d06mr20173084lfb.683.1669839005450; 
 Wed, 30 Nov 2022 12:10:05 -0800 (PST)
Received: from localhost.localdomain (ccy110.neoplus.adsl.tpnet.pl.
 [83.30.148.110]) by smtp.gmail.com with ESMTPSA id
 a25-20020a056512201900b004b4e9580b1asm369754lfb.66.2022.11.30.12.10.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 30 Nov 2022 12:10:05 -0800 (PST)
From: Adam Skladowski <a39.skl@gmail.com>
To: 
Subject: [PATCH v2 04/12] arm64: dts: qcom: sm6115: Add TSENS node
Date: Wed, 30 Nov 2022 21:09:42 +0100
Message-Id: <20221130200950.144618-5-a39.skl@gmail.com>
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

Add nodes required for TSENS block using the common qcom,tsens-v2 binding.

Signed-off-by: Adam Skladowski <a39.skl@gmail.com>
Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
 arch/arm64/boot/dts/qcom/sm6115.dtsi | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm6115.dtsi b/arch/arm64/boot/dts/qcom/sm6115.dtsi
index 2a55087b103e..a2ac06f4693b 100644
--- a/arch/arm64/boot/dts/qcom/sm6115.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm6115.dtsi
@@ -523,6 +523,17 @@ spmi_bus: spmi@1c40000 {
 			#interrupt-cells = <4>;
 		};
 
+		tsens0: thermal-sensor@4410000 {
+			compatible = "qcom,sm6115-tsens", "qcom,tsens-v2";
+			reg = <0x04411000 0x1ff>, /* TM */
+			      <0x04410000 0x8>; /* SROT */
+			#qcom,sensors = <16>;
+			interrupts = <GIC_SPI 275 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 190 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "uplow", "critical";
+			#thermal-sensor-cells = <1>;
+		};
+
 		rpm_msg_ram: sram@45f0000 {
 			compatible = "qcom,rpm-msg-ram";
 			reg = <0x045f0000 0x7000>;
-- 
2.25.1

