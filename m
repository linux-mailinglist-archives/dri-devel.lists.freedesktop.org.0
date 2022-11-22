Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EAB78634B3D
	for <lists+dri-devel@lfdr.de>; Wed, 23 Nov 2022 00:37:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8833B10E4AE;
	Tue, 22 Nov 2022 23:37:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x230.google.com (mail-lj1-x230.google.com
 [IPv6:2a00:1450:4864:20::230])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A0F2810E49A
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Nov 2022 23:37:04 +0000 (UTC)
Received: by mail-lj1-x230.google.com with SMTP id h12so19618836ljg.9
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Nov 2022 15:37:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=/kArATDXyd0v10YSpzBFZj7xDn7196LQ8mvJQOtKXJc=;
 b=DdGctuyybWE7Q0hGSsNO/mzjqftRZGwcyHbOP64Bo62pNJ02747bjFH+ixj9A4hmYN
 t9aMdf7cICumuX8AVvrIESiqHeoWosu9R+9fKWO98P/Rt8edjdF56iN0Hxj8RgflwBO9
 d05LZhQY1KOPcMNwpH7JwlclcigBIvpDHGghDaJxMzY12Qa98ymV2YsIi/52Kg+OeNyQ
 RBZheWF4HiKtntUiVSUINYGNIA97jqzNhq2E4paNEqC48ujoslmNelRlAknCqGU46Ymd
 b23sF0gkDyz8HRcJ+8n/Mf/Kj3EPVXR96CUbfqst/RM703Df7y1QpRwBD36xt6xfyY9j
 y60g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=/kArATDXyd0v10YSpzBFZj7xDn7196LQ8mvJQOtKXJc=;
 b=x3UdGNqO/2ssrOxGEQsIZfHtd4eUenWVaOi/IUbqn+9wKPGPeCQXt7VOtZHL3Krf/H
 nhUOJ5OG17MgZKQNppiCcpxi78XG6wi59vrruD8UhG7wPvtN2KvtBX455JyelSVRg6ms
 KRuL1cHd+yeMsrW1i64b8yaEMWs7DshnRbM9Xe8Df4YheNmNccP67ReM+MGdWEpYdTwn
 8dwJD/CpF9pBFMbo5cV/9pi3E6h4YZB/DHKDZ/9GYRlrftns5je+tL7WtAWfAfLdqrIA
 C/5ijzF8yey+RXkhQgTFnK3mRexfEjaD8XqazSyQeE9xuFiljkUWupTQb1tDBnR3EnYa
 EtGw==
X-Gm-Message-State: ANoB5pmKHaW/JHqPV67oIrjq1dMkEB1jHBe6XDAE1mDUmxjCYPaJVa9j
 dw6nLySp8wOvJscDwwucz4F2bw==
X-Google-Smtp-Source: AA0mqf4B6xZl3zEIx+pTp2bO6JbfguaAicxjLecA9B1vl7PGNv1MTBTvSOsjPGIipSp9nPPCxiTAhw==
X-Received: by 2002:a05:651c:2004:b0:277:9e5:6cc4 with SMTP id
 s4-20020a05651c200400b0027709e56cc4mr8742268ljo.137.1669160222608; 
 Tue, 22 Nov 2022 15:37:02 -0800 (PST)
Received: from eriador.lumag.spb.ru
 (dzpbkzhtyyyyyyyyyyyyt-3.rev.dnainternet.fi. [2001:14ba:a302:8a1a::1])
 by smtp.gmail.com with ESMTPSA id
 h3-20020ac250c3000000b00492c463526dsm2666454lfm.186.2022.11.22.15.37.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 22 Nov 2022 15:37:02 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@somainline.org>,
 Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Subject: [PATCH v2 3/5] arm64: dts: qcom: sm8450-hdk: enable display hardware
Date: Wed, 23 Nov 2022 01:36:57 +0200
Message-Id: <20221122233659.3308175-4-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20221122233659.3308175-1-dmitry.baryshkov@linaro.org>
References: <20221122233659.3308175-1-dmitry.baryshkov@linaro.org>
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
 freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Enable MDSS/DPU/DSI0 on SM8450-HDK device. Note, there is no panel
configuration (yet).

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 arch/arm64/boot/dts/qcom/sm8450-hdk.dts | 22 ++++++++++++++++++++++
 1 file changed, 22 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm8450-hdk.dts b/arch/arm64/boot/dts/qcom/sm8450-hdk.dts
index 2dd4f8c8f931..75b7aecb7d8e 100644
--- a/arch/arm64/boot/dts/qcom/sm8450-hdk.dts
+++ b/arch/arm64/boot/dts/qcom/sm8450-hdk.dts
@@ -349,6 +349,28 @@ vreg_l7e_2p8: ldo7 {
 	};
 };
 
+&dispcc {
+	status = "okay";
+};
+
+&mdss {
+	status = "okay";
+};
+
+&mdss_dsi0 {
+	vdda-supply = <&vreg_l6b_1p2>;
+	status = "okay";
+};
+
+&mdss_dsi0_phy {
+	vdds-supply = <&vreg_l5b_0p88>;
+	status = "okay";
+};
+
+&mdss_mdp {
+	status = "okay";
+};
+
 &pcie0 {
 	status = "okay";
 	max-link-speed = <2>;
-- 
2.35.1

