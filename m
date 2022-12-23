Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C1C39654AEA
	for <lists+dri-devel@lfdr.de>; Fri, 23 Dec 2022 03:11:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CDF8510E604;
	Fri, 23 Dec 2022 02:11:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com
 [IPv6:2a00:1450:4864:20::32e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D24CA10E5F1
 for <dri-devel@lists.freedesktop.org>; Fri, 23 Dec 2022 02:10:45 +0000 (UTC)
Received: by mail-wm1-x32e.google.com with SMTP id ja17so2750768wmb.3
 for <dri-devel@lists.freedesktop.org>; Thu, 22 Dec 2022 18:10:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=kKVEXvGef5P9tA5LLEzuk1hrh35Tg71vyheIdv7ZSrI=;
 b=tl9KeKXDtyZBmFoIjWWO4pU3vMAb7NzRUyBRhgrOfWOeeapmVdeGHdRrX7fZUdSHxR
 Og7tG5CagfAi4OKn0z43uFPbk6gmaY+S30lkzrm2jEEK1ccCB0g+ArgufKid7kwlPPsm
 08FX5IFJztnPbA1plV90Xu5PjEKOOtOhC9LKM1fyxOtCgFzaMnvKEtS3GAKzJ0tlt2Oy
 AaJMeLuEOnGx3cK5EXdFUx0EOKICI5IW6u/Lut0XVpgj5fAR7/cs7FR1oI9v5AGsiO5q
 WCKoxug+HlqYguv6UG9gaMIsxyFlvy1jaTJoXc9htdmfhnFhDeUoochJzSbxAfPlRH+W
 Lxuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=kKVEXvGef5P9tA5LLEzuk1hrh35Tg71vyheIdv7ZSrI=;
 b=e0uKUGFbVhbZBvY5nEbeN+GQ+lkRwioF72T6UYlGEtBjHo8Z2EQ+3MhfUCeZRy+SYq
 Ik3pttgBt8J/mixjjyylQX+2SERwWPAnBBXe2O076CXRGdBirZsjinqzGqdJpUKejsLr
 MzDyhDz0P6rVOFtIf9u8+y6UQPxwggCfNJuboaemCfyyYLkD8DrB0Rh+Zu1xIQVvvihU
 GjRXorQd+bKpWdfv9UFwRr6+G6Ys8MlxqEcbJAq/JGHb/V3qLrP3CoJPEZjCvi2u5w2N
 0ESyJ6VbMrJhL8Z0qPWOO64NVBgXIU00h56fY2uuA5UvLFbwdUrV/TY+LAKb81KK8Bg4
 0Xmw==
X-Gm-Message-State: AFqh2kqRPgM20AxGp1v1lOzHB1JQkXpyB2476L5YKkV9umMrGgzZUMKZ
 KEQw4PI+aZ+/VL6GXdOhqfJGKQ==
X-Google-Smtp-Source: AMrXdXtapK6lO/YsS+pE/BacOLARlYbBOVA7De78mBLUQGZr++WDdon0BQAcfGSQFfr8EKqD06kL4g==
X-Received: by 2002:a7b:ce8e:0:b0:3d7:1b84:e377 with SMTP id
 q14-20020a7bce8e000000b003d71b84e377mr5787454wmj.27.1671761445427; 
 Thu, 22 Dec 2022 18:10:45 -0800 (PST)
Received: from sagittarius-a.chello.ie (188-141-3-169.dynamic.upc.ie.
 [188.141.3.169]) by smtp.gmail.com with ESMTPSA id
 j11-20020a5d452b000000b0022cc0a2cbecsm1849725wra.15.2022.12.22.18.10.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 22 Dec 2022 18:10:45 -0800 (PST)
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
To: linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
 devicetree@vger.kernel.org
Subject: [PATCH v6 16/18] arm64: dts: qcom: sdm660: Add compat qcom,
 sdm660-dsi-ctrl
Date: Fri, 23 Dec 2022 02:10:23 +0000
Message-Id: <20221223021025.1646636-17-bryan.odonoghue@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221223021025.1646636-1-bryan.odonoghue@linaro.org>
References: <20221223021025.1646636-1-bryan.odonoghue@linaro.org>
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

