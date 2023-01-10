Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 32B0A6638E0
	for <lists+dri-devel@lfdr.de>; Tue, 10 Jan 2023 06:54:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4C42910E53B;
	Tue, 10 Jan 2023 05:54:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com
 [IPv6:2a00:1450:4864:20::12a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9D9E610E0DD
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Jan 2023 05:54:37 +0000 (UTC)
Received: by mail-lf1-x12a.google.com with SMTP id bu8so16650658lfb.4
 for <dri-devel@lists.freedesktop.org>; Mon, 09 Jan 2023 21:54:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Od8NVQ7rke1dy63OziSV7bOj514f4mT68wZay8pjM14=;
 b=m9+Jas64suajSpQIRMpvHPgkRtW3P40QRWR282M9A9M4wfKPwWPJ8ps3lPb2JoQGS6
 URMcpxEUG2Kqi4AuWvyOabzm5Ul5bLxH1gIzoAkhZFi2KTEmlX4ZKnf5qVCYyEIvyCqe
 N5zxAv/9J/WXJg24kYZ5EsNJAbhrszKuNaHhiuuP5x92bgcPQWfY5Did38KOPuw9Wf/s
 odLQAzv0x+6FmJCujeYKr025VwYN+fhiA1c2ZIQfVvr3kglplY9kHv53wvUuJ2fKJ0/3
 5xsppfp0PQ8PFn3Z/9KtWb6ElP+GuGDV9f4ThF1yG95owl8nx0YalAeCH2+MFTpgIVlU
 ospQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Od8NVQ7rke1dy63OziSV7bOj514f4mT68wZay8pjM14=;
 b=mVQMDAa4m9kH+t3k2N0r+K2uanUGNuxO+yCEcthOcHFDMT4BTrPnNnKgl0Q94bbafj
 mFt1jus/zloRIMYJz8bfD9USnbr9cBYXpB8Hd8I83kfS03cLoRbVfNzJ/uAdrN8z5+NB
 zEoOzhcLJiioYVCpCc6iETMKoUN9GlLxIfCb/i4RjA120gNozu68VOT64Lv/xS6sNYgp
 71gAQzvvDHR/8U4nF4Lx7uNuNruFp56qXF7eDCQHL5UBfBayWGFZvmRZRBroanU8nF8j
 zdjRLZQs62e44eVkKrEQHwEA3d6GG0Zeye4ARfi8neek+W4AF/r5eBI2hS4Kc5g9xmdL
 B8Xg==
X-Gm-Message-State: AFqh2kpO5dC+BxIpQ55j0d8NlOAZ5SXuLcmpgABvWs9JUCYy9PXSz0Qe
 QZIvC1VJuFvzNYuJ8XgVjSrIPg==
X-Google-Smtp-Source: AMrXdXtx4QrfwKdfzPS+27ZFVMOsjqDyn1MfQ+bdDV1TXDnoK7sgDn2jLTxkjowQdtjCufmdFwngNQ==
X-Received: by 2002:a05:6512:3b07:b0:4ab:f3f1:8299 with SMTP id
 f7-20020a0565123b0700b004abf3f18299mr20609955lfv.6.1673330075781; 
 Mon, 09 Jan 2023 21:54:35 -0800 (PST)
Received: from eriador.lan (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi.
 [2001:14ba:a085:4d00::8a5]) by smtp.gmail.com with ESMTPSA id
 h37-20020a0565123ca500b004b52aea5ff8sm1987227lfv.30.2023.01.09.21.54.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 09 Jan 2023 21:54:35 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>, Rob Clark <robdclark@gmail.com>,
 Sean Paul <sean@poorly.run>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Subject: [PATCH 2/3] arm64: dts: qcom: sm8150: Add compat qcom, sm8150-dsi-ctrl
Date: Tue, 10 Jan 2023 07:54:32 +0200
Message-Id: <20230110055433.734188-2-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230110055433.734188-1-dmitry.baryshkov@linaro.org>
References: <20230110055433.734188-1-dmitry.baryshkov@linaro.org>
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
Cc: devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Stephen Boyd <swboyd@chromium.org>,
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>, freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add silicon specific compatible qcom,sm8150-dsi-ctrl to the
mdss-dsi-ctrl block. This allows us to differentiate the specific bindings
for sm8150 against the yaml documentation.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 arch/arm64/boot/dts/qcom/sm8150.dtsi | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sm8150.dtsi b/arch/arm64/boot/dts/qcom/sm8150.dtsi
index 99750987c9d6..2c59ebe3320d 100644
--- a/arch/arm64/boot/dts/qcom/sm8150.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8150.dtsi
@@ -3690,7 +3690,7 @@ opp-460000000 {
 			};
 
 			mdss_dsi0: dsi@ae94000 {
-				compatible = "qcom,mdss-dsi-ctrl";
+				compatible = "qcom,sm8150-dsi-ctrl", "qcom,mdss-dsi-ctrl";
 				reg = <0 0x0ae94000 0 0x400>;
 				reg-names = "dsi_ctrl";
 
@@ -3783,7 +3783,7 @@ mdss_dsi0_phy: phy@ae94400 {
 			};
 
 			mdss_dsi1: dsi@ae96000 {
-				compatible = "qcom,mdss-dsi-ctrl";
+				compatible = "qcom,sm8150-dsi-ctrl", "qcom,mdss-dsi-ctrl";
 				reg = <0 0x0ae96000 0 0x400>;
 				reg-names = "dsi_ctrl";
 
-- 
2.39.0

