Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A889A63C9CA
	for <lists+dri-devel@lfdr.de>; Tue, 29 Nov 2022 21:47:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A7A2110E3EE;
	Tue, 29 Nov 2022 20:47:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x235.google.com (mail-lj1-x235.google.com
 [IPv6:2a00:1450:4864:20::235])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E19A810E393;
 Tue, 29 Nov 2022 20:47:04 +0000 (UTC)
Received: by mail-lj1-x235.google.com with SMTP id z4so18663277ljq.6;
 Tue, 29 Nov 2022 12:47:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=4V4btdZ021QBWvTUZ+qLEZ0zz7lZW+zNWyf+w01hNLo=;
 b=EgnIx1O2QIPIuC0LwlxMAf68zqiD0+BC32rDwGwQc7QHDUyP5aiXahCnfEN5jMqlDF
 VIvG7rLtwo0+oXpoz2eIGYdAMQT6dAeGzyYfYTUqiIulQttebwhBtMWug/a20Mlja7Kk
 yzFzN8TnqOvkBRMnUnn1sYDbYNCip53wPfQvGyG5aAGAzeawp439DxlYeEbSevLDBXF+
 uOxvxshIeN/0bMv5hhLXyV3xP9iDE+TWm7hEh5eji1F9gGpitRGjdPNjbvle2bZFziGR
 elMaY0PyZWbVc+q/wxOIRWIbZDGjh0ZfDCRdGbZ9lv3y8V7MC5PeNBRP739eiUEy6IbW
 jHLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=4V4btdZ021QBWvTUZ+qLEZ0zz7lZW+zNWyf+w01hNLo=;
 b=jdfFbQ1nKSEWqa39Np3VmnR6qrqTb3FMXhZk6M1GtbrnvupG4NSfW1geChHdDvLomt
 J0S4/ZQDbxgO9H0i6hTYTmJy/El8hcrvdTtLAOcjBVGN1/ap+3skEldJDG6zwsxbxtOa
 xyq2BbP6P2Sa2azJIs11bUaJ+QJfJhFmQeUp1sIYPxZn9eFuXUZRO/PdQMaiQos0lcrd
 BSIoLEYT1cHroZ/EqP0u/o4kHH5tsMGb5+hBi7/6RuIRpEkHrOSzbiLasOorxcR9boKB
 HN7jtsTJ8dBzzUEYpGdKWR/XnV4O8nCzocMUuqER9nr9Eidy7MLd41z9kfgn0fvA0AYL
 F4Iw==
X-Gm-Message-State: ANoB5pmNtVMSJCUbUlEodtYBIlZ6VUeqU+q4zdJwcXyJQJ4bLoo1QcuU
 zjrbrHjkgjWojDpD+WQ1rLE=
X-Google-Smtp-Source: AA0mqf7eNNhkr2pDGEbrk1tEPverJ+Gcl1qRU601XnJDNyP+wBq3uZ21nEQAFL+J2MakL9tZLwE8xQ==
X-Received: by 2002:a05:651c:b99:b0:277:c41:d44b with SMTP id
 bg25-20020a05651c0b9900b002770c41d44bmr13480690ljb.326.1669754823149; 
 Tue, 29 Nov 2022 12:47:03 -0800 (PST)
Received: from localhost.localdomain (ccy110.neoplus.adsl.tpnet.pl.
 [83.30.148.110]) by smtp.gmail.com with ESMTPSA id
 o11-20020ac24e8b000000b004ae24368195sm2325620lfr.233.2022.11.29.12.47.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 29 Nov 2022 12:47:02 -0800 (PST)
From: Adam Skladowski <a39.skl@gmail.com>
To: 
Subject: [PATCH 05/12] arm64: dts: qcom: sm6115: Add PRNG node
Date: Tue, 29 Nov 2022 21:46:09 +0100
Message-Id: <20221129204616.47006-6-a39.skl@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221129204616.47006-1-a39.skl@gmail.com>
References: <20221129204616.47006-1-a39.skl@gmail.com>
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

Add a node for the PRNG to enable hw-accelerated pseudo-random number
generation.

Signed-off-by: Adam Skladowski <a39.skl@gmail.com>
---
 arch/arm64/boot/dts/qcom/sm6115.dtsi | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm6115.dtsi b/arch/arm64/boot/dts/qcom/sm6115.dtsi
index decbf7ca8a03..04620c272227 100644
--- a/arch/arm64/boot/dts/qcom/sm6115.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm6115.dtsi
@@ -497,6 +497,13 @@ qusb2_hstx_trim: hstx-trim@25b {
 			};
 		};
 
+		rng: rng@1b53000 {
+			compatible = "qcom,prng-ee";
+			reg = <0x01b53000 0x1000>;
+			clocks = <&gcc GCC_PRNG_AHB_CLK>;
+			clock-names = "core";
+		};
+
 		spmi_bus: spmi@1c40000 {
 			compatible = "qcom,spmi-pmic-arb";
 			reg = <0x01c40000 0x1100>,
-- 
2.25.1

