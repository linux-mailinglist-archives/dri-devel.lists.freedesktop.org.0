Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6AF81645136
	for <lists+dri-devel@lfdr.de>; Wed,  7 Dec 2022 02:28:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5515E10E16C;
	Wed,  7 Dec 2022 01:28:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x236.google.com (mail-lj1-x236.google.com
 [IPv6:2a00:1450:4864:20::236])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 112FC10E168
 for <dri-devel@lists.freedesktop.org>; Wed,  7 Dec 2022 01:28:09 +0000 (UTC)
Received: by mail-lj1-x236.google.com with SMTP id q7so19220629ljp.9
 for <dri-devel@lists.freedesktop.org>; Tue, 06 Dec 2022 17:28:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=PEqiDsYEiDO00tgdMLKsNoJpUA3u2krxNv3MdZBB8lA=;
 b=G0uDtaqnpjqEiACkFVKZCraxVRQrMk/rZm1nfwlPs65OWyuoBrobv5X/u/hlQUcucR
 j1g8gl6WpIXhT533NK7lthLs9X30KPV7sS/KUYXuTY3pa17NWjE1zS6e2BOOcHkpu/h6
 CMB/PI9fnhhtMlRKbTnpRrbLJOLLZBIBODRdgDdilBGIOFSJjdoPNQBpkkX7Wqat3SvD
 G6jy5aRrxzgJN8/4Kayb1Z9NkE1eT1UkQmc5NYihcXC+l6ufcy+5XwzK/treWeb8YeHm
 RloHHMxkwTzQzuA0SxyYqPRT+xEtJmrsIosHh76rS7y8BqKVAfm6X6lyzuo/81s12M56
 qAug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=PEqiDsYEiDO00tgdMLKsNoJpUA3u2krxNv3MdZBB8lA=;
 b=ffuVTyIwphiV0LrYfHEUMaF3FWhiBAu7e5Wrp922LbSUn9mUuLkULbADSXUIXszjUo
 A/RWdO+CsEvQr1RxYethURTcxLeHPa68ThI6S2yro265+mVgb1T55hUDltS2mmvPFXwc
 1RNJGZhXZZqdrkEl//vsAXizswEJNsRyPwc3tUisLycBkLdKS/ixtwnk8CcQmsoGk6m0
 2lQHEjIYn0S9pU69mKmmZD3GnHUynCFwrEoiUw0TKSEgPy15OnTRRS7Efg5//x2cIIfi
 cSzqF9ck5HVdVyb2WrzS3JrKcZFtrIhSSl57J1/VpM2i4CJXQao8OAG6Xgu4su45szXl
 GfeA==
X-Gm-Message-State: ANoB5plfAo7wgD3rgW9bABQ+Y9/TkMQD9TqQ4K1J9ea2qITWVBElTHu8
 aFy2Gzke9vmWqO4KGpODJjVftg==
X-Google-Smtp-Source: AA0mqf7c0uKsntHOJltlxGrMcnxIVrv8u68i5Na5JvQUurmk+KeB+JFW3mi912o36YvbVgzny3MvxQ==
X-Received: by 2002:a05:651c:904:b0:277:210:41d1 with SMTP id
 e4-20020a05651c090400b00277021041d1mr22583401ljq.507.1670376487040; 
 Tue, 06 Dec 2022 17:28:07 -0800 (PST)
Received: from eriador.lan (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi.
 [2001:14ba:a085:4d00::8a5]) by smtp.gmail.com with ESMTPSA id
 n26-20020a05651203fa00b004b5626ef9f4sm1461157lfq.262.2022.12.06.17.28.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 06 Dec 2022 17:28:06 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>, Rob Clark <robdclark@gmail.com>,
 Sean Paul <sean@poorly.run>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Subject: [PATCH v4 3/5] arm64: dts: qcom: sm8450-hdk: enable display hardware
Date: Wed,  7 Dec 2022 03:28:01 +0200
Message-Id: <20221207012803.114959-4-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20221207012803.114959-1-dmitry.baryshkov@linaro.org>
References: <20221207012803.114959-1-dmitry.baryshkov@linaro.org>
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

Enable MDSS/DPU/DSI0 on SM8450-HDK device.

Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>
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

