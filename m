Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DBF0525876
	for <lists+dri-devel@lfdr.de>; Fri, 13 May 2022 01:37:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C6EE210EDCC;
	Thu, 12 May 2022 23:36:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x22f.google.com (mail-lj1-x22f.google.com
 [IPv6:2a00:1450:4864:20::22f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B5FEC10ED07
 for <dri-devel@lists.freedesktop.org>; Thu, 12 May 2022 23:36:50 +0000 (UTC)
Received: by mail-lj1-x22f.google.com with SMTP id b32so8391313ljf.1
 for <dri-devel@lists.freedesktop.org>; Thu, 12 May 2022 16:36:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ypxafSXytWa1pPBeHJ41K2y3Cfr7QvnghKr6SvtMtAA=;
 b=rb+K2Ft9N1JMCRJv/Fe8ZdGM+bFqgG4CoCqfPaOTV86HoSoCSD0HtIOdOL29ZeN7AX
 1toIgFoxbaykz8mICP5X07ZX0feYwCYm27XGrnYMwkqiqGXq98IscbcoaOmJGYFMWkoI
 tLmQfwhDIfPvRTAoL7pj8v/xPvqnpCwCtRzwrwZGkPddRe/c7yJOzkQSXs1HngiWMrPX
 GWSuX1DKs6q75MfOR/8tp+NuMGm94J6TS0y6VbVVN2g5bpqAgTu93+CQxAZfenE7PIqA
 gt6cxRh7s5jkSs9jdBtpcldP8Ba0vTn9F7SUDAhEzCzoWXeLU5glJSe626dbIv4HQY2t
 BBpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ypxafSXytWa1pPBeHJ41K2y3Cfr7QvnghKr6SvtMtAA=;
 b=klHZu5sfCjC4nzpZk0CmYq9kVMghu7VkZtFlkteHCO8Z13dMYjpABb0oK8bJJRj+Ev
 qbwW+mO7JhRpkcyr2cbK8w8CufTJXHdZVu77BanxXuICHQ/+dfviVQvN+IR6qINZsUqS
 2JmFBmRZXmMfohkgK0UpUxQdHEwQR9WEMsgCk6uD8kTmiHhcVYAAQC0HYeWzOYpFWOdL
 L2RbvfVMx7UzfMeTwuQG85T8Vvl1XeK44tVk1E9yq6Cs8+hox209KHk10/TK1QU9Q/Iv
 90VBPxFgz036+9ReZArzjDKTsW1luirqLOFtQXoZcMgqD+/vZFyGaJi1BfaphXwIU+Qm
 MTyg==
X-Gm-Message-State: AOAM532k74DqXfcAXYHP1cp/CpbBmXRk27dyZ5FzTKC5ZL7J3KfciyYu
 KHir+VDUfW+JRJAHh1wjlPpHZA==
X-Google-Smtp-Source: ABdhPJzs/lejBHVwZdlUtDVUyDCa3zyhz75J16AnGDl0WzUv/Phv/2qVG0LJKizWp9yKpxQ78CQQpw==
X-Received: by 2002:a2e:b8c4:0:b0:250:61c6:8363 with SMTP id
 s4-20020a2eb8c4000000b0025061c68363mr1468072ljp.334.1652398608989; 
 Thu, 12 May 2022 16:36:48 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125]) by smtp.gmail.com with ESMTPSA id
 p13-20020a19f00d000000b0047255d211c1sm127937lfc.240.2022.05.12.16.36.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 12 May 2022 16:36:48 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>
Subject: [PATCH v2 1/8] arm64: dts: qcom: sdm660: disable dsi1/dsi1_phy by
 default
Date: Fri, 13 May 2022 02:36:40 +0300
Message-Id: <20220512233647.2672813-2-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220512233647.2672813-1-dmitry.baryshkov@linaro.org>
References: <20220512233647.2672813-1-dmitry.baryshkov@linaro.org>
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
Cc: David Airlie <airlied@linux.ie>, linux-arm-msm@vger.kernel.org,
 Konrad Dybcio <konrad.dybcio@somainline.org>, dri-devel@lists.freedesktop.org,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 Stephen Boyd <swboyd@chromium.org>, freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Follow the typical practice and keep DSI1/DSI1 PHY disabled by default.
They should be enabled in the board DT files. No existing boards use
them at this moment.

Reviewed-by: Marijn Suijten <marijn.suijten@somainline.org>
Reviewed-by: Konrad Dybcio <konrad.dybcio@somainline.org>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 arch/arm64/boot/dts/qcom/sdm660.dtsi | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sdm660.dtsi b/arch/arm64/boot/dts/qcom/sdm660.dtsi
index eccf6fde16b4..023b0ac4118c 100644
--- a/arch/arm64/boot/dts/qcom/sdm660.dtsi
+++ b/arch/arm64/boot/dts/qcom/sdm660.dtsi
@@ -192,6 +192,8 @@ dsi1: dsi@c996000 {
 		phys = <&dsi1_phy>;
 		phy-names = "dsi";
 
+		status = "disabled";
+
 		ports {
 			#address-cells = <1>;
 			#size-cells = <0>;
@@ -225,6 +227,7 @@ dsi1_phy: dsi-phy@c996400 {
 
 		clocks = <&mmcc MDSS_AHB_CLK>, <&rpmcc RPM_SMD_XO_CLK_SRC>;
 		clock-names = "iface", "ref";
+		status = "disabled";
 	};
 };
 
-- 
2.35.1

