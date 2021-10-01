Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0648241F27E
	for <lists+dri-devel@lfdr.de>; Fri,  1 Oct 2021 18:50:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 580C56EE62;
	Fri,  1 Oct 2021 16:50:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com
 [IPv6:2a00:1450:4864:20::135])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BCA5C6EE64
 for <dri-devel@lists.freedesktop.org>; Fri,  1 Oct 2021 16:50:18 +0000 (UTC)
Received: by mail-lf1-x135.google.com with SMTP id x27so40712930lfa.9
 for <dri-devel@lists.freedesktop.org>; Fri, 01 Oct 2021 09:50:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Z/4G9vgAEk+347Zn9eb+ZAGOAkOwqhySgRQtqU2xH8A=;
 b=LHQTDyqMA4HpiTqHGSqD7z+pmM1cbi9k0rEeOMYnHVY8ya5KNnSAwVogIZCTJWYkbl
 HPoBQmBixW04wPiOZq38dZcOL98kS3o7kJGk2AxawJRdDiX+7KHCcWjQRuv5yRi5NBY0
 agPmY68EmkoYpTJ8w5Sf02kpJO2wjhCZZjIWy2X3+HZ47w1pctbUHmAe+BwCJdUc0TQm
 vu2rTaZS1tP310WamJ0Q4a5/gCznv8KHu4yaME6sC1u4ceGmR1rp823xIVxfhGIqvDIf
 32UynKpf/MCyV9ToGQU5BAN5QGVOyk5UjkiluFdo+dxdEMuAOxtKMSQcx6PNPQuIk/2K
 5eIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Z/4G9vgAEk+347Zn9eb+ZAGOAkOwqhySgRQtqU2xH8A=;
 b=KVNYU77grnWHa7r+KLXW9i3L6F63mhhEMoYtRwEAhTGK2euL7QI4xZeTy446kG0tJF
 mi5yNiVipp1syUHrX4/pidIf1RBA1EEEJmM58mfJhLAiRA53xgX/vnQeTCE4103T5opX
 lcloBuwYdKbSeFmlFiuW+ah5Q+yxhuS1WuuW4eqksMmUWVO0Wbwrun6exzDff5hZrg+e
 vEI1gVd/G8iqPoYepnoVGoqNPEW0g+rvFsa1eZEfsDpOdiRq5p7xoOdOditOpj5/q5rt
 mwsPZr2kPptqbNc5dU9p4N9AbByNEc15rbMzur7RXyIHaIHyvaGxXdwr7seZd8vJ3Hr4
 rOoA==
X-Gm-Message-State: AOAM530Z0GChlGheO5117RRllhpuZb0JYfP3vHFu4/5lBeyiUTUWJnwe
 1BBrD9MxmloI+Kf7iVFpV1unBQ==
X-Google-Smtp-Source: ABdhPJzkHZSNcqsjg13S+lAYsg5LtJPkpuOdkh2vYaxSFaqjldIgW17EDxKXWS6QZeYGnubmGFFJ6A==
X-Received: by 2002:a2e:5807:: with SMTP id m7mr13160180ljb.25.1633107016953; 
 Fri, 01 Oct 2021 09:50:16 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
 by smtp.gmail.com with ESMTPSA id n24sm787052lfq.294.2021.10.01.09.50.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 01 Oct 2021 09:50:16 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Bjorn Andersson <bjorn.andersson@linaro.org>,
 Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <abhinavk@codeaurora.org>
Cc: Jonathan Marek <jonathan@marek.ca>, Stephen Boyd <sboyd@kernel.org>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org
Subject: [PATCH 3/3] dt-bindings: display/msm: remove edp.txt
Date: Fri,  1 Oct 2021 19:50:11 +0300
Message-Id: <20211001165011.441945-4-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20211001165011.441945-1-dmitry.baryshkov@linaro.org>
References: <20211001165011.441945-1-dmitry.baryshkov@linaro.org>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

eDP driver is being removed, so drop bindings description.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 .../devicetree/bindings/display/msm/edp.txt   | 56 -------------------
 1 file changed, 56 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/display/msm/edp.txt

diff --git a/Documentation/devicetree/bindings/display/msm/edp.txt b/Documentation/devicetree/bindings/display/msm/edp.txt
deleted file mode 100644
index eff9daff418c..000000000000
--- a/Documentation/devicetree/bindings/display/msm/edp.txt
+++ /dev/null
@@ -1,56 +0,0 @@
-Qualcomm Technologies Inc. adreno/snapdragon eDP output
-
-Required properties:
-- compatible:
-  * "qcom,mdss-edp"
-- reg: Physical base address and length of the registers of controller and PLL
-- reg-names: The names of register regions. The following regions are required:
-  * "edp"
-  * "pll_base"
-- interrupts: The interrupt signal from the eDP block.
-- power-domains: Should be <&mmcc MDSS_GDSC>.
-- clocks: device clocks
-  See Documentation/devicetree/bindings/clock/clock-bindings.txt for details.
-- clock-names: the following clocks are required:
-  * "core"
-  * "iface"
-  * "mdp_core"
-  * "pixel"
-  * "link"
-- #clock-cells: The value should be 1.
-- vdda-supply: phandle to vdda regulator device node
-- lvl-vdd-supply: phandle to regulator device node which is used to supply power
-  to HPD receiving chip
-- panel-en-gpios: GPIO pin to supply power to panel.
-- panel-hpd-gpios: GPIO pin used for eDP hpd.
-
-
-Example:
-	mdss_edp: qcom,mdss_edp@fd923400 {
-			compatible = "qcom,mdss-edp";
-			reg-names =
-				"edp",
-				"pll_base";
-			reg =	<0xfd923400 0x700>,
-				<0xfd923a00 0xd4>;
-			interrupt-parent = <&mdss_mdp>;
-			interrupts = <12 0>;
-			power-domains = <&mmcc MDSS_GDSC>;
-			clock-names =
-				"core",
-				"pixel",
-				"iface",
-				"link",
-				"mdp_core";
-			clocks =
-				<&mmcc MDSS_EDPAUX_CLK>,
-				<&mmcc MDSS_EDPPIXEL_CLK>,
-				<&mmcc MDSS_AHB_CLK>,
-				<&mmcc MDSS_EDPLINK_CLK>,
-				<&mmcc MDSS_MDP_CLK>;
-			#clock-cells = <1>;
-			vdda-supply = <&pma8084_l12>;
-			lvl-vdd-supply = <&lvl_vreg>;
-			panel-en-gpios = <&tlmm 137 0>;
-			panel-hpd-gpios = <&tlmm 103 0>;
-	};
-- 
2.33.0

