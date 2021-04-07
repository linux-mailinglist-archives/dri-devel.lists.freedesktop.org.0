Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 43B0A356FAA
	for <lists+dri-devel@lfdr.de>; Wed,  7 Apr 2021 17:02:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6CF8A6E935;
	Wed,  7 Apr 2021 15:02:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com
 [IPv6:2a00:1450:4864:20::129])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 66FE86E93A
 for <dri-devel@lists.freedesktop.org>; Wed,  7 Apr 2021 15:02:05 +0000 (UTC)
Received: by mail-lf1-x129.google.com with SMTP id d13so29040454lfg.7
 for <dri-devel@lists.freedesktop.org>; Wed, 07 Apr 2021 08:02:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=oQHU6JVtwNTebM12E9MrwsK4Nn8euAbOyGr3erk+v5o=;
 b=XUUM4YOyI1XzFTGGfqTr9vUu2wDf+IMIjn6pjjjgMzpX7PDK4Zq26m/d1d94d981UQ
 ySU/lmOMxGiOIE1uZH8UWJUAxdqu9jVNiyUx799SPCDeBb63ksU89PEJDMKOLmkb7E59
 R9jqdvu1fcEye4vX3FrmoHuSwIHdpLbM/EJYBLfu4INCMTkbYOKYRDTXisY7xeuQYrvX
 w5U+uGA27sW847fg1SqpjEDgFZ7cCZ7ddrp9AXpNX1CpWRqyzjL5E8tgMGFrfAynwGBt
 wueqrtt2eDP/eq49yWXpDzqCfgnvNitu7dtzoQ2OLyinW652jiFgZZNz4nWmyf5+qwU8
 c1ow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=oQHU6JVtwNTebM12E9MrwsK4Nn8euAbOyGr3erk+v5o=;
 b=MFWLXZUcVLA3GtyK3aS6Hb2mHxqzaKtIXfDv1LHtP9FbTUBCdDmaz4TGQzn2BkYsoX
 n+rOb+9JfYC61cjAsqce9sB8DNpvrrgNIOMoCA8guj0Aeo7/A/ttBm/oCVM8qsXK2Inf
 cnOtOj12bglG10sbcHvtrH+tXWQMTFfgvNe3ue+3apKD7dmh+Qbub+da1/6VY3wbe/so
 KVu2w1T+8WMDXEeeMA2J/FU6VBzpjGnYay+PmFg/Uj3RK2LybBlzvBseTWEJ6i6l37hB
 LkaMQmZatM22Oh2C9u6KcqfXa5T8VjBT1Oqkf/33FmFa3VJy1NnjWla1TC4E207AsmNU
 fV/Q==
X-Gm-Message-State: AOAM533yWhqWrfHqZ0lGTWQNjPhjz8b15QQzalH1Rrlv1jz1Sxo+o1yy
 Q5u4GLPa7xS4/Z0jx/CK4uJb5Q==
X-Google-Smtp-Source: ABdhPJzwai1Ce3UJfMgUpbo47kQ3ESVbnzMTEChFlScgebRxFPt4GLqvV8oJ8ymGDEQrsU/DBfv12Q==
X-Received: by 2002:a05:6512:21a:: with SMTP id
 a26mr2880860lfo.507.1617807723775; 
 Wed, 07 Apr 2021 08:02:03 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
 by smtp.gmail.com with ESMTPSA id o11sm2552142ljg.42.2021.04.07.08.02.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 07 Apr 2021 08:02:03 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Andy Gross <agross@kernel.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Rob Herring <robh+dt@kernel.org>
Subject: [PATCH v2 3/4] arm64: dts: sdm845: move bus clock to mdp node for
 sdm845 target
Date: Wed,  7 Apr 2021 18:01:56 +0300
Message-Id: <20210407150157.801210-4-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210407150157.801210-1-dmitry.baryshkov@linaro.org>
References: <20210407150157.801210-1-dmitry.baryshkov@linaro.org>
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
Cc: devicetree@vger.kernel.org, Jonathan Marek <jonathan@marek.ca>,
 David Airlie <airlied@linux.ie>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Move the bus clock to mdp device node,in order to facilitate bus band
width scaling on sdm845 target.

The parent device MDSS will not vote for bus bw, instead the vote will
be triggered by mdp device node. Since a minimum vote is required to
turn on bus clock, move the clock node to mdp device from where the
votes are requested.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 arch/arm64/boot/dts/qcom/sdm845.dtsi | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sdm845.dtsi b/arch/arm64/boot/dts/qcom/sdm845.dtsi
index 7395ef20b90e..55704804c2ca 100644
--- a/arch/arm64/boot/dts/qcom/sdm845.dtsi
+++ b/arch/arm64/boot/dts/qcom/sdm845.dtsi
@@ -4136,9 +4136,8 @@ mdss: mdss@ae00000 {
 			power-domains = <&dispcc MDSS_GDSC>;
 
 			clocks = <&gcc GCC_DISP_AHB_CLK>,
-				 <&gcc GCC_DISP_AXI_CLK>,
 				 <&dispcc DISP_CC_MDSS_MDP_CLK>;
-			clock-names = "iface", "bus", "core";
+			clock-names = "iface", "core";
 
 			assigned-clocks = <&dispcc DISP_CC_MDSS_MDP_CLK>;
 			assigned-clock-rates = <300000000>;
@@ -4166,11 +4165,12 @@ mdss_mdp: mdp@ae01000 {
 				      <0 0x0aeb0000 0 0x2008>;
 				reg-names = "mdp", "vbif";
 
-				clocks = <&dispcc DISP_CC_MDSS_AHB_CLK>,
+				clocks = <&gcc GCC_DISP_AXI_CLK>,
+					 <&dispcc DISP_CC_MDSS_AHB_CLK>,
 					 <&dispcc DISP_CC_MDSS_AXI_CLK>,
 					 <&dispcc DISP_CC_MDSS_MDP_CLK>,
 					 <&dispcc DISP_CC_MDSS_VSYNC_CLK>;
-				clock-names = "iface", "bus", "core", "vsync";
+				clock-names = "gcc-bus", "iface", "bus", "core", "vsync";
 
 				assigned-clocks = <&dispcc DISP_CC_MDSS_MDP_CLK>,
 						  <&dispcc DISP_CC_MDSS_VSYNC_CLK>;
-- 
2.30.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
