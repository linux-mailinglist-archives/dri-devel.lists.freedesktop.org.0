Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F4CF675F41
	for <lists+dri-devel@lfdr.de>; Fri, 20 Jan 2023 22:01:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4F21D10E3A5;
	Fri, 20 Jan 2023 21:01:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x533.google.com (mail-ed1-x533.google.com
 [IPv6:2a00:1450:4864:20::533])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 10DDE10E3A6
 for <dri-devel@lists.freedesktop.org>; Fri, 20 Jan 2023 21:01:17 +0000 (UTC)
Received: by mail-ed1-x533.google.com with SMTP id w14so8194608edi.5
 for <dri-devel@lists.freedesktop.org>; Fri, 20 Jan 2023 13:01:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=5vdvlTIe2SoUdgzeTBXtkOHkXv6c2FDuAp1y22eD7Ng=;
 b=rhSCbwWbjcUJKlgvQOopMWTQNS4FyCSdDOWhsdPizT6q+UQu4iVeyAmPOW5WKRQJgT
 +Nz4dkQwNjkwv6zsd0mbsgyNLAqj00cjWXRd69Cp5ucpmXVs1bV/fVM8wGV4BvO04Je8
 YeNmEXt7GOD9+3EqM/LVf1SyCiMqIlaBhijJ3nmrRCEMxwo0pX950AGQbeZq06vsaiGP
 IZ3hvWDZW/EI2BbE1Tl+kXiI2M//dNGYiYPsZjYiRFunyCT1lgNapZ0DFehZcWGvCW9X
 WYhAvM5EiJsEx0eKK9GRR3X7pu8e8HBGpq+oqpJe4fsIhXAYmvNxCkD0LYMDZngfwGsX
 tg0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=5vdvlTIe2SoUdgzeTBXtkOHkXv6c2FDuAp1y22eD7Ng=;
 b=vydW1zboaWe/ey3zC49gE6KW6ArdsnbKeMm0Go6bjYR9PDYp89O2RdPz3PQAiH3oPg
 1VG+Bmt7jp+G9VElS9+bNpQ6eAVWmhwt/k7Bb/+wxuWmRE4z8DcVI054wVqGGSFBv14g
 3/fzDRvhhcR86/kqKcHrNT28yyws57ONgrZCb2PDVbmSlvRCWbOjtrLkKj7cfFipVCzu
 dnRx1u5NjCmWwaxnVo1/JzgO9ZXx5txTukpznKyxkdQEcVJuTYLcrZaUBJnh1PkLVLxz
 rfUg3ngRBrA+zJHxdRUY89nJhsEHswfGlc9KaxrlFeotXOIYSbIgjGRupMUnfoumvRCi
 /c0w==
X-Gm-Message-State: AFqh2kqrxyJgWhQTwKfLinEvAIFuWhSY13vPzZnxNvlka0Lc1djd13Rm
 emC6cA6KaVaD6E7xZ6FDL0LcsQ==
X-Google-Smtp-Source: AMrXdXuA4bZe2r10Fa2xb6v7gUYLSpFAEboZqxVdFXr3Y8zk2kJnKU4qwAoDJTd+CPD8UbAuF6ivag==
X-Received: by 2002:a05:6402:1946:b0:48b:c8de:9d20 with SMTP id
 f6-20020a056402194600b0048bc8de9d20mr17986061edz.32.1674248475600; 
 Fri, 20 Jan 2023 13:01:15 -0800 (PST)
Received: from localhost.localdomain (abyk37.neoplus.adsl.tpnet.pl.
 [83.9.30.37]) by smtp.gmail.com with ESMTPSA id
 g22-20020a170906595600b0087221268e49sm6581229ejr.186.2023.01.20.13.01.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 20 Jan 2023 13:01:15 -0800 (PST)
From: Konrad Dybcio <konrad.dybcio@linaro.org>
To: linux-arm-msm@vger.kernel.org, andersson@kernel.org, agross@kernel.org,
 krzysztof.kozlowski@linaro.org
Subject: [PATCH 2/8] arm64: dts: qcom: sm8350: Add missing #address/size-cells
 to DSIn
Date: Fri, 20 Jan 2023 22:00:54 +0100
Message-Id: <20230120210101.2146852-2-konrad.dybcio@linaro.org>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230120210101.2146852-1-konrad.dybcio@linaro.org>
References: <20230120210101.2146852-1-konrad.dybcio@linaro.org>
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
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
 Loic Poulain <loic.poulain@linaro.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 devicetree@vger.kernel.org, freedreno@lists.freedesktop.org,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, dri-devel@lists.freedesktop.org,
 Douglas Anderson <dianders@chromium.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>, Rob Herring <robh+dt@kernel.org>,
 Rajeev Nandan <quic_rajeevny@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, marijn.suijten@somainline.org,
 Stephen Boyd <swboyd@chromium.org>, Sean Paul <sean@poorly.run>,
 linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Panels/DRM bridges definitely don't need 64bits of address space and
are usually not 32-bit wide. Set address-cells to 1 and size-cells to
0.

Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
 arch/arm64/boot/dts/qcom/sm8350.dtsi | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm8350.dtsi b/arch/arm64/boot/dts/qcom/sm8350.dtsi
index dc84dbed81bb..c0ba67747c24 100644
--- a/arch/arm64/boot/dts/qcom/sm8350.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8350.dtsi
@@ -2989,6 +2989,9 @@ mdss_dsi0: dsi@ae94000 {
 
 				phys = <&mdss_dsi0_phy>;
 
+				#address-cells = <1>;
+				#size-cells = <0>;
+
 				status = "disabled";
 
 				dsi0_opp_table: opp-table {
@@ -3084,6 +3087,9 @@ mdss_dsi1: dsi@ae96000 {
 
 				phys = <&mdss_dsi1_phy>;
 
+				#address-cells = <1>;
+				#size-cells = <0>;
+
 				status = "disabled";
 
 				dsi1_opp_table: opp-table {
-- 
2.39.1

