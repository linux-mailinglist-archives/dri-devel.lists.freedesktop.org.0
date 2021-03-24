Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C16C1347C27
	for <lists+dri-devel@lfdr.de>; Wed, 24 Mar 2021 16:20:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 34C046EC78;
	Wed, 24 Mar 2021 15:19:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com
 [IPv6:2a00:1450:4864:20::12d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F0B796EC81
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Mar 2021 15:19:25 +0000 (UTC)
Received: by mail-lf1-x12d.google.com with SMTP id b14so19284679lfv.8
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Mar 2021 08:19:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=d5gXnaS6/FhBtkbwF8y1QR9zxelWPPlPpq/TCaYVKkQ=;
 b=ahp+fVKPZwAYJOW7LBbtb9n9bOtkcZ8QEH92zF0ab5N9I6JC/bQAFlWBWCXj/7GxMY
 KXs1r/ByTAchuEe9IEHPZU0h+05/u29eJIiggZRbHuSnVAulRDX62LU5xFRFyLkUHNnL
 +oqsGuNEul9eDR/gWiAR/YPHklWTlVq1iwa2CIvvxNokMlgb3nskHwPfabCcQL1Fa1zL
 sd1p1G94PgZkt5kszyIIj2+jyLcg83O039DV/ojycQFbwB5EqIt01IgL78QLQHdVhxSf
 2Lf490CyWN4LD+V8qFbEMm+gB16bQgXbpaWuEWEJF3BPBq/7zpKxrFtkkUuUjrcOOnHD
 4MhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=d5gXnaS6/FhBtkbwF8y1QR9zxelWPPlPpq/TCaYVKkQ=;
 b=QauDb9T1Bg4jgHsDnyWqy5Y9K1jeAdbgTc4Sk+aYqGsNrfYRrccyfAzKMhP1kGpsUo
 e45l6MFYO6+sjP6ZYbV924jwCy4eaIiywgXUz7z/z/FZihBiK/PuegtlQi3KF+PTwjVg
 AvCKIpc4x3NIDaKzLZhOdgti4gwPWf9tx5fpjjJ8r2lFwdITjtZUEm9ZCA7W+Dy1uRVl
 laagMK7Bg4MnsZHduP3bFmO3ya6RxM9REr3PH0l4pvtyHw0IiiroxTNvpgnrfyaOy/xv
 HBfmZIgr0Y10q29J+3j3WWINKuj2DCKzCZ3ZYfasKe+T0G9QRfPCYPpR2OA29lY6oYXh
 HTVg==
X-Gm-Message-State: AOAM530q2Zc/4n2QvkhcNh1AQ+pE49o9E3o6yH/udCAirU1+MyoDevcn
 gOFQHDW+HBHOIecc+1r1xz6R/Q==
X-Google-Smtp-Source: ABdhPJx8XJ9coT+NGmhTsbhOuiSRspWWg3awMGtpNTVWXUtP3HYMg5dWhk1AsT5lXPxJa92lUn+ukw==
X-Received: by 2002:ac2:4ac4:: with SMTP id m4mr2215124lfp.404.1616599164364; 
 Wed, 24 Mar 2021 08:19:24 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
 by smtp.gmail.com with ESMTPSA id d22sm255199lfm.267.2021.03.24.08.19.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 24 Mar 2021 08:19:23 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Jonathan Marek <jonathan@marek.ca>,
 Michael Turquette <mturquette@baylibre.com>
Subject: [PATCH v2 13/28] arm64: dts: qcom: sc7180: assign DSI clock source
 parents
Date: Wed, 24 Mar 2021 18:18:31 +0300
Message-Id: <20210324151846.2774204-14-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210324151846.2774204-1-dmitry.baryshkov@linaro.org>
References: <20210324151846.2774204-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
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
Cc: Stephen Boyd <sboyd@kernel.org>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, David Airlie <airlied@linux.ie>,
 freedreno@lists.freedesktop.org, linux-clk@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Assign DSI clock source parents to DSI PHY clocks.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 arch/arm64/boot/dts/qcom/sc7180.dtsi | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sc7180.dtsi b/arch/arm64/boot/dts/qcom/sc7180.dtsi
index 22b832fc62e3..c16ddabb3a92 100644
--- a/arch/arm64/boot/dts/qcom/sc7180.dtsi
+++ b/arch/arm64/boot/dts/qcom/sc7180.dtsi
@@ -3076,6 +3076,9 @@ dsi0: dsi@ae94000 {
 					      "iface",
 					      "bus";
 
+				assigned-clocks = <&dispcc DISP_CC_MDSS_BYTE0_CLK_SRC>, <&dispcc DISP_CC_MDSS_PCLK0_CLK_SRC>;
+				assigned-clock-parents = <&dsi_phy 0>, <&dsi_phy 1>;
+
 				operating-points-v2 = <&dsi_opp_table>;
 				power-domains = <&rpmhpd SC7180_CX>;
 
-- 
2.30.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
