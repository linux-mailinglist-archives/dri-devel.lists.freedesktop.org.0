Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 506EB638A08
	for <lists+dri-devel@lfdr.de>; Fri, 25 Nov 2022 13:37:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3E0DF10E755;
	Fri, 25 Nov 2022 12:37:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com
 [IPv6:2a00:1450:4864:20::434])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E6AF110E752
 for <dri-devel@lists.freedesktop.org>; Fri, 25 Nov 2022 12:37:01 +0000 (UTC)
Received: by mail-wr1-x434.google.com with SMTP id x17so6574089wrn.6
 for <dri-devel@lists.freedesktop.org>; Fri, 25 Nov 2022 04:37:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=hrZRxDUkNBpr7/CO3VUWuIRRJhqQxCbIa8B1ayhBv+4=;
 b=HewUI0q3JiGBKkRoIELpg8nbjCjuH8cpAkd53x1g6nujXHUTGpJlWiJsaGeMS0QI+o
 WN1tIeREr9cv1rsh2JOJAMu1fd3B5eI0P6OIFHLSxUXf1+HOUSszUn8urAD8AoSbzeWf
 pStkO5vDtE6A+IDMosKbktRuds3zBw1w9tgahaXy0Ghs9BxdkOttNyj+S6Kp6sTwXsyD
 ZkRJw8r4cS2Ne93lfFvbpue5MPWBQdQfsikW5SoMLU0BJwpJ1hqMEKskR7DqdEojolQs
 dQvF/fYZBLbm9ZD1MRI1kfvEbUFgZHfCXikICSfbd2IrAZdylqymO6YeDMZ54zsxpjQA
 RoLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=hrZRxDUkNBpr7/CO3VUWuIRRJhqQxCbIa8B1ayhBv+4=;
 b=Tz8p65Z1dmrL2RynHNWY+YvhsdezEGv2bNJNe1QwOTfTjSCHOAi9cStFXtV7mVaOzX
 WtLcxsqonVAQJ7YbeMudIotmVR/6i3/mw1vZniZtquYupuhNPlmDun/HDosvVA/31oFA
 eRXk0x4xWXaBC7QNLefWlIwsTzDg4mjoWw5W87tdtnLIoYsz8ZMoEIAgUqs+JgjECkFI
 +6ozm9b5+ifvr33qc3TEUI6V7xaDyPMqnchmzVt9/VBG8elGV7tbHtUsJ5gFBs4wrkU+
 gbNZki/71TPL7vD4MdLoKZMqXHo83hApSSgW9Mqdo9XsbXCgGaDMX6j8O3pVj2bDhsrp
 MNMQ==
X-Gm-Message-State: ANoB5plt4LMchnbalLn1czs0vaUdhdDW92XjHYMhP7rZf1NMDQEs0CsL
 9v9KFxkDSi/mUNLTQa7c70ueXg==
X-Google-Smtp-Source: AA0mqf6uYcqHm6pJSFDYrGlH5uVpN8pnpSEtO4Xpcd119fJlRZqAf2omUuW/V37TYfnf9GTgSRw5sg==
X-Received: by 2002:a05:6000:114b:b0:241:d199:1a04 with SMTP id
 d11-20020a056000114b00b00241d1991a04mr15971719wrx.227.1669379821520; 
 Fri, 25 Nov 2022 04:37:01 -0800 (PST)
Received: from sagittarius-a.chello.ie (188-141-3-169.dynamic.upc.ie.
 [188.141.3.169]) by smtp.gmail.com with ESMTPSA id
 k15-20020a5d6d4f000000b002366dd0e030sm3574111wri.68.2022.11.25.04.37.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 25 Nov 2022 04:37:01 -0800 (PST)
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
To: linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
 devicetree@vger.kernel.org
Subject: [PATCH v4 16/18] arm64: dts: qcom: sdm660: Add compat qcom,
 sdm660-dsi-ctrl
Date: Fri, 25 Nov 2022 12:36:36 +0000
Message-Id: <20221125123638.823261-17-bryan.odonoghue@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221125123638.823261-1-bryan.odonoghue@linaro.org>
References: <20221125123638.823261-1-bryan.odonoghue@linaro.org>
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
Cc: dri-devel@lists.freedesktop.org, krzysztof.kozlowski+dt@linaro.org,
 sean@poorly.run, andersson@kernel.org, konrad.dybcio@somainline.org,
 quic_abhinavk@quicinc.com, david@ixit.cz, dianders@chromium.org,
 robh+dt@kernel.org, agross@kernel.org, dmitry.baryshkov@linaro.org,
 bryan.odonoghue@linaro.org, swboyd@chromium.org, linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add silicon specific compatible qcom,sdm660-dsi-ctrl to the
mdss-dsi-ctrl block. This allows us to differentiate the specific bindings
for sdm660 against the yaml documentation.

Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
 arch/arm64/boot/dts/qcom/sdm660.dtsi | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/sdm660.dtsi b/arch/arm64/boot/dts/qcom/sdm660.dtsi
index 10bf1c45cf6ec..f8ec728e67f3d 100644
--- a/arch/arm64/boot/dts/qcom/sdm660.dtsi
+++ b/arch/arm64/boot/dts/qcom/sdm660.dtsi
@@ -154,7 +154,8 @@ mdp5_intf2_out: endpoint {
 
 &mdss {
 	dsi1: dsi@c996000 {
-		compatible = "qcom,mdss-dsi-ctrl";
+		compatible = "qcom,sdm660-dsi-ctrl",
+			     "qcom,mdss-dsi-ctrl";
 		reg = <0x0c996000 0x400>;
 		reg-names = "dsi_ctrl";
 
-- 
2.38.1

