Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C21923DEAB1
	for <lists+dri-devel@lfdr.de>; Tue,  3 Aug 2021 12:17:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F1F1589FF6;
	Tue,  3 Aug 2021 10:17:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x22e.google.com (mail-lj1-x22e.google.com
 [IPv6:2a00:1450:4864:20::22e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1386289FEC
 for <dri-devel@lists.freedesktop.org>; Tue,  3 Aug 2021 10:17:02 +0000 (UTC)
Received: by mail-lj1-x22e.google.com with SMTP id b21so27488563ljo.13
 for <dri-devel@lists.freedesktop.org>; Tue, 03 Aug 2021 03:17:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=FsJoAIH4S+RjxCze2qp1zowJ52+FjRKDga6SkA/wG7k=;
 b=LI7tJOw368lOtxk+BRWyUom00ThyfKPx+XDNzofm7fmO6RGEQECfSzHmHJkQhjP24d
 aCA4+r11pGpT4HzFt/iwysrxYgYmkskZIsrCHVRxv2YM/z7IaSJJezhFbGBoKIZTyIIb
 HJ6OYSWmZERyJF/Gz52hs/U/jujxTpKLzmym8lzhcLWjqEQ2JpOLavGO4M3lmqpaDk30
 CJHTUlnUx3l4ORLkK6q29dAcnJUStsJq0DZETuAv66iOTPl3hzPnsnQCNLmla/ANP0YE
 KCPMzb8ffZVKYdM2Kg8cPWjZxs4MLdKLg2yUYtcIVEnuuxO9IMxvTsbrPTCRyKBkAiSs
 GaVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=FsJoAIH4S+RjxCze2qp1zowJ52+FjRKDga6SkA/wG7k=;
 b=VCPMePesIK7ESI6u+/BTgfCgGOHTnqcxsenttgu3dd134kJAAi7NhdTyyxH8snQFrY
 G86xEQWI4eALaOf4SVKnG94sAtcS6PrGE+qqmnfipRBwyRkOHvE7x/P5dDpFLUb3Pvw2
 UDB+IA2fQrOPANPH/ZHiBJaxeERgaGyUnF88FKf5WOMAlG47i7luQ7tS2e4IjdURUoGj
 7O/HZrkqltiPFDlwc/R0WKmI6pQ5+Qxk9mRrs1vn2skl07e2aXB371P6FTaLDRNWj5j3
 mRC+xaVS+fGR/yxrLVNfFOlCo2gZF5H5ePKTY8gFpEo8UQx+GmGIMilrRB276h/yBrHg
 nVww==
X-Gm-Message-State: AOAM533c5LIXE6FGMdqj3J2P8xHZUg+tV3SWFvqyZns+zLSlQ+5wuA8Z
 y0Xf+DqpfVGX1rqWxQr3TwevEA==
X-Google-Smtp-Source: ABdhPJxNM7ZUJetzR253G1UXvy6y72lz2k4bBgzksy15ogkhFwYreU7aQMtLkhNR98G65Co0Le8vUw==
X-Received: by 2002:a2e:7a18:: with SMTP id v24mr14045030ljc.420.1627985820391; 
 Tue, 03 Aug 2021 03:17:00 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
 by smtp.gmail.com with ESMTPSA id y10sm1056692ljj.10.2021.08.03.03.16.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 03 Aug 2021 03:16:59 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Andy Gross <agross@kernel.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Rob Clark <robdclark@gmail.com>, Abhinav Kumar <abhinavk@codeaurora.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org
Subject: [PATCH v3 2/2] arm64: dts: sm8250: remove bus clock from the mdss
 node for sm8250 target
Date: Tue,  3 Aug 2021 13:16:57 +0300
Message-Id: <20210803101657.1072358-3-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210803101657.1072358-1-dmitry.baryshkov@linaro.org>
References: <20210803101657.1072358-1-dmitry.baryshkov@linaro.org>
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

Remove the bus clock from the mdss device node, in order to facilitate
bus band width scaling on sm8250 target.

The parent device MDSS will not vote for bus bw, instead the vote will
be triggered by mdp device node. Since a minimum vote is required to
turn on bus clock, and since mdp device node already has the bus clock,
remove the clock from the mdss device.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 arch/arm64/boot/dts/qcom/sm8250.dtsi | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sm8250.dtsi b/arch/arm64/boot/dts/qcom/sm8250.dtsi
index 4798368b02ef..1df03c809d02 100644
--- a/arch/arm64/boot/dts/qcom/sm8250.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8250.dtsi
@@ -2470,10 +2470,9 @@ mdss: mdss@ae00000 {
 			power-domains = <&dispcc MDSS_GDSC>;
 
 			clocks = <&dispcc DISP_CC_MDSS_AHB_CLK>,
-				 <&gcc GCC_DISP_HF_AXI_CLK>,
 				 <&gcc GCC_DISP_SF_AXI_CLK>,
 				 <&dispcc DISP_CC_MDSS_MDP_CLK>;
-			clock-names = "iface", "bus", "nrt_bus", "core";
+			clock-names = "iface", "nrt_bus", "core";
 
 			assigned-clocks = <&dispcc DISP_CC_MDSS_MDP_CLK>;
 			assigned-clock-rates = <460000000>;
-- 
2.30.2

