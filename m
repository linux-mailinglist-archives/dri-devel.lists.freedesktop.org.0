Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AD2B23DEAB2
	for <lists+dri-devel@lfdr.de>; Tue,  3 Aug 2021 12:17:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7202F6E0BC;
	Tue,  3 Aug 2021 10:17:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x229.google.com (mail-lj1-x229.google.com
 [IPv6:2a00:1450:4864:20::229])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6FCB589FC9
 for <dri-devel@lists.freedesktop.org>; Tue,  3 Aug 2021 10:17:01 +0000 (UTC)
Received: by mail-lj1-x229.google.com with SMTP id l4so27538659ljq.4
 for <dri-devel@lists.freedesktop.org>; Tue, 03 Aug 2021 03:17:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=EzY4uoCv+IHNgvq1aFlTjsbb98p1R6pm524do6Rg7Dw=;
 b=zKuD44Y8knFt4SFxUsZhHdq31reBUbVixyx8BnM55P/lEKGiiUrvAd7hw0l/gNRpOk
 8pfy7ToeuKJjXqopbopo3RSzPMwpSreQfhnC2C0RIJIdjR5EYMzDh7kH8UMUQw+r3qWY
 s942ZYsn7CPwueeLHq4AUiKnH02RJGMfJYjsITZqLH8tHkwuofQDROwGyoVty0N1QhJU
 CYEiku8HPsQtiDmhtEGMrVx06u/ahM9qCp0pzNzFnN8tJgmc9FLN29f759fMKiR/moyh
 khN6m5GpEMb1903+SQW7p0v3o/zIdljNc+cjeSeSdA+7j2Jzo4kijMCBcDsHvEJZpxA3
 omEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=EzY4uoCv+IHNgvq1aFlTjsbb98p1R6pm524do6Rg7Dw=;
 b=ot3br6FOhHERFdGvSAjjyBfgaT5M2JrxuZuTbIlW/vO3O/tfksLmkqTyYg0MxQ3Hnp
 U0J62JD3eQDPkr+xj3mJ7Qd3pPdkiRmlYaQdpQzG76kzN9ke9yWikYvvvpEbARbk1+aw
 sZHMD+DNIylH8OOx6TGS9kTVl9DbvrH2V9TIqyIbdJ13FHA6MJdguco9l6DQ2hSUwZmO
 n0GD99+4+PYIFU2TZkp5Zn8pnGmVXNJTsNe/f49LZbY55QWifpZbk368YRfZGFvwmv0F
 c1u93UvU3BASpI13xzg5eLJ0W+v99H7TmEDRGtNEHxkZSTkvecirM//X3e3jZyhj1fiQ
 e25Q==
X-Gm-Message-State: AOAM531QmboOAIHyhEFS/7MFQ+1UOrovgtgoIbef1WorRb4qI8AEuPN3
 Q5ei4ZPyW14OZAPcTotYCuISvg==
X-Google-Smtp-Source: ABdhPJzoLLhhk/TOW3tky38gjSKL+rcpxKqBfbS4dbJr2TV0ixldLyx0VdWvXnLxGg9VxTWwq+LpeQ==
X-Received: by 2002:a2e:9885:: with SMTP id b5mr14686451ljj.25.1627985819704; 
 Tue, 03 Aug 2021 03:16:59 -0700 (PDT)
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
Subject: [PATCH v3 1/2] arm64: dts: sdm845: move bus clock to mdp node for
 sdm845 target
Date: Tue,  3 Aug 2021 13:16:56 +0300
Message-Id: <20210803101657.1072358-2-dmitry.baryshkov@linaro.org>
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
index 1796ae8372be..9e77a323b1cd 100644
--- a/arch/arm64/boot/dts/qcom/sdm845.dtsi
+++ b/arch/arm64/boot/dts/qcom/sdm845.dtsi
@@ -4148,9 +4148,8 @@ mdss: mdss@ae00000 {
 			power-domains = <&dispcc MDSS_GDSC>;
 
 			clocks = <&gcc GCC_DISP_AHB_CLK>,
-				 <&gcc GCC_DISP_AXI_CLK>,
 				 <&dispcc DISP_CC_MDSS_MDP_CLK>;
-			clock-names = "iface", "bus", "core";
+			clock-names = "iface", "core";
 
 			assigned-clocks = <&dispcc DISP_CC_MDSS_MDP_CLK>;
 			assigned-clock-rates = <300000000>;
@@ -4178,11 +4177,12 @@ mdss_mdp: mdp@ae01000 {
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

