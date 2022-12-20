Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A18B6520DC
	for <lists+dri-devel@lfdr.de>; Tue, 20 Dec 2022 13:39:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5B51010E3E8;
	Tue, 20 Dec 2022 12:37:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com
 [IPv6:2a00:1450:4864:20::436])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EF58510E3B0
 for <dri-devel@lists.freedesktop.org>; Tue, 20 Dec 2022 12:36:59 +0000 (UTC)
Received: by mail-wr1-x436.google.com with SMTP id z10so1024722wrh.10
 for <dri-devel@lists.freedesktop.org>; Tue, 20 Dec 2022 04:36:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=kKVEXvGef5P9tA5LLEzuk1hrh35Tg71vyheIdv7ZSrI=;
 b=corPTYl/tlJj9NEIuUOL2PfV0ebOWXVFNh4B9E36y5XxcsLpsoK5RRnwwrhYnQ27Tn
 xVrtSdmaRoXb6xXFalMvEJdcBPlhyYBzcgxL2Bun/z7b6korMgOi0ydi4LDoBgF0VrlR
 KCQaYEka1k+LjKsJSFjfEbUQbLFd4EfUbxp8ZLrzYilpf7CpqX+rz92a/8k2ia5B2flW
 RXANYu/YFDmcasaiD1eigN+2+bTPy5/gHMn8vZNNYDiCMOKep8RlHD41GWQ3sYpguX11
 zrkpOkehZUpIaHpr2Z0tMV1QBd9HbcHlLmXlmfenrShszX3FzzITummW8O/aY1feIScS
 /pBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=kKVEXvGef5P9tA5LLEzuk1hrh35Tg71vyheIdv7ZSrI=;
 b=cIKEMxD5pUNVqmdi7Otm2kHLBpKkrte+rLOMURa4CaN2PRowKH2rtaE+hqtEG9OlIR
 IEzTsvvd28TtBelC/SZCQdWTeUpPThG+1T2RYowaj0Qz+jkE3QlJRZaNqwF9J3+6epVO
 Ox2/OBaXujZBzwnWC9lAP9laooqsjauHhwuD+B+gchIuLmGGKO0r5cVv2TXcfFLbO7hO
 tHKWCwKP6kxBb2JXomMWa872/9aF0vtR2r3UuOzO0lFmnUv8WZhpq9343hCDE7fKk9YA
 gnnB9g/DC/f0lOZ4cdwAYOvayzeFk0BJAxshEntUdp5X5PDESEfID15wAmIiUH3Mp/xO
 kNKw==
X-Gm-Message-State: ANoB5pmZF73ZmXTHxwzpPHYyj9oLzyJNMYBhs6s35a7IxptlXFQSW7dz
 Xke4ozyf8hsuRxPNHFcYjxrGxw==
X-Google-Smtp-Source: AA0mqf7zfD7dMeMe/X8AXuK4TXSuvR8MUh+RMZMzmqRSP7U0a2/nS/5R18XyXiqUvuFD3ps5poFWnQ==
X-Received: by 2002:adf:edc6:0:b0:242:43d1:6d8a with SMTP id
 v6-20020adfedc6000000b0024243d16d8amr35238084wro.59.1671539819547; 
 Tue, 20 Dec 2022 04:36:59 -0800 (PST)
Received: from sagittarius-a.chello.ie (188-141-3-169.dynamic.upc.ie.
 [188.141.3.169]) by smtp.gmail.com with ESMTPSA id
 da13-20020a056000408d00b00242257f2672sm12641208wrb.77.2022.12.20.04.36.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 20 Dec 2022 04:36:59 -0800 (PST)
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
To: linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
 devicetree@vger.kernel.org
Subject: [PATCH v5 19/21] arm64: dts: qcom: sdm660: Add compat qcom,
 sdm660-dsi-ctrl
Date: Tue, 20 Dec 2022 12:36:32 +0000
Message-Id: <20221220123634.382970-20-bryan.odonoghue@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221220123634.382970-1-bryan.odonoghue@linaro.org>
References: <20221220123634.382970-1-bryan.odonoghue@linaro.org>
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
index d52123cb5cd31..e8a15b9cee18f 100644
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

