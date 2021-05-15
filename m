Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D0C43818FF
	for <lists+dri-devel@lfdr.de>; Sat, 15 May 2021 15:12:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A9F0A6E255;
	Sat, 15 May 2021 13:12:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x22f.google.com (mail-lj1-x22f.google.com
 [IPv6:2a00:1450:4864:20::22f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0F8796E255
 for <dri-devel@lists.freedesktop.org>; Sat, 15 May 2021 13:12:22 +0000 (UTC)
Received: by mail-lj1-x22f.google.com with SMTP id v5so1696888ljg.12
 for <dri-devel@lists.freedesktop.org>; Sat, 15 May 2021 06:12:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=A+eo1IuREtAfwJtXMuCkTNE64eCLQjhkQV6wBXbLi/8=;
 b=F9zQbhL6o6UNZTfh/8Y6OhIAjBxFrUTDRaR3caCzlEXoQjFGMP8vK3SZOmK72ONIDi
 N0B5fNZ5xft0xpsmJl9azKI+xki9rU4sO1koujkWPnKcQsna8HRrk5mqzDFjsbGtfvcG
 pYTjASIhwWSOOTngKjVHTV8KGrOvHasj+G463XNSPcrDoxlQ8kTo1W2snOaEqTf9v6cH
 0xghqLZLdFeDRwFbnmj/A/wtpGPCe9H+CIVD4E1g5ZaV3lrmtZ5aYVjwedFks1Y3DdVf
 bvJkXQrpU//UdUotbqClhT+ftW7CkXSGlIrBw5mAn8li8C+h+dQphdD8CCI+ztJGrNEa
 OBEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=A+eo1IuREtAfwJtXMuCkTNE64eCLQjhkQV6wBXbLi/8=;
 b=K85bpoCgki/ZbmbwXDpeYenFiQjaF+whBzaD1kvVX1S7PXtZ+hp6N47+IL+nGOCqwd
 yfjNb1smsM2cFsXnQde5y2W5VtuvAL3kIchAO9Hy1sdajvUM/c/sOe9xsC5d0k6zG2Hq
 LbTkFk6WUhv7IScuyWSWwfaFYj3RfVpJMHJ80eQ/P2/EoBjEZFE5fAmBl3lM5Mia6maj
 GucyCaZYXGfC9hc/sW0NYXDlP3i9avqSQUMntG3lttZ4hzzT+wRtVPEHrfAdQqdJJjUh
 94G++wjJVLf96Nt46W7aZCovGV43Ew6jAWtFUs+xVqkKPSX3EJVaEUITrtC2TptYtuBJ
 r7og==
X-Gm-Message-State: AOAM530vNYrIsSsvgQoy9cK5H4TtLvDVzx0ESBvG8PwSq01jzVXp+RSD
 g9VO0LQmgFf1iP6hVnt8N6rnQw==
X-Google-Smtp-Source: ABdhPJxTxPDWIM8XWIQpBdMA1KGw4O2/agYmUrbuKwulIa5QOEj6TMgAwhaBfg0cH69mIVl3pmvQtw==
X-Received: by 2002:a2e:8086:: with SMTP id i6mr32384059ljg.135.1621084340563; 
 Sat, 15 May 2021 06:12:20 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
 by smtp.gmail.com with ESMTPSA id m4sm2061865ljp.9.2021.05.15.06.12.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 15 May 2021 06:12:19 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Bjorn Andersson <bjorn.andersson@linaro.org>,
 Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <abhinavk@codeaurora.org>
Subject: [PATCH 1/8] arm64: dts: qcom: sc7180: assign DSI clock source parents
Date: Sat, 15 May 2021 16:12:10 +0300
Message-Id: <20210515131217.1540412-2-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210515131217.1540412-1-dmitry.baryshkov@linaro.org>
References: <20210515131217.1540412-1-dmitry.baryshkov@linaro.org>
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
Cc: Jonathan Marek <jonathan@marek.ca>, Stephen Boyd <sboyd@kernel.org>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 David Airlie <airlied@linux.ie>, freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Assign DSI clock source parents to DSI PHY clocks.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 arch/arm64/boot/dts/qcom/sc7180.dtsi | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sc7180.dtsi b/arch/arm64/boot/dts/qcom/sc7180.dtsi
index 1ea3344ab62c..4e8708cce1cc 100644
--- a/arch/arm64/boot/dts/qcom/sc7180.dtsi
+++ b/arch/arm64/boot/dts/qcom/sc7180.dtsi
@@ -3090,6 +3090,9 @@ dsi0: dsi@ae94000 {
 					      "iface",
 					      "bus";
 
+				assigned-clocks = <&dispcc DISP_CC_MDSS_BYTE0_CLK_SRC>, <&dispcc DISP_CC_MDSS_PCLK0_CLK_SRC>;
+				assigned-clock-parents = <&dsi_phy 0>, <&dsi_phy 1>;
+
 				operating-points-v2 = <&dsi_opp_table>;
 				power-domains = <&rpmhpd SC7180_CX>;
 
-- 
2.30.2

