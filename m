Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 073D1654AE3
	for <lists+dri-devel@lfdr.de>; Fri, 23 Dec 2022 03:11:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8B56510E5FE;
	Fri, 23 Dec 2022 02:10:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com
 [IPv6:2a00:1450:4864:20::435])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5CAD410E59B
 for <dri-devel@lists.freedesktop.org>; Fri, 23 Dec 2022 02:10:43 +0000 (UTC)
Received: by mail-wr1-x435.google.com with SMTP id z10so3370465wrh.10
 for <dri-devel@lists.freedesktop.org>; Thu, 22 Dec 2022 18:10:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=iKsehGcz374PW4Oaqc03FTNTJ/WJN4Esos64GXOFLAY=;
 b=KqX6xba6VOUJRQxcYuFyEl5MN4OTC9/YLjFnYM0y/Ui0ySu7xqgoC9GSHDhuXm/mRw
 YEXsFzPYaHbqF7TKKNCqDhovflrGgVk/qeR0nHTI23mjSYE5vbCI8k/ZJjPlD7CogxNf
 d0vlgZXivD3fovR3fnB5nos+ppvWUrGbfCR0Q9SQsVN04rzVOl1HikdzB4CssH7x6x0N
 fv0X6DCJWEnZD6qLRglYHVlF57fM3t3XC6nkc15AixQVTYW/RJfdwNDY1asiYkCUzzYi
 6yp/nf7tKf8ZkxHNmbCV6eKShSKwNZJjtzFZIZFEh4e70AW+MqV6YXaO4RYY1ySY9YkG
 7bQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=iKsehGcz374PW4Oaqc03FTNTJ/WJN4Esos64GXOFLAY=;
 b=AUN2jyYJ7iFxLdmd6QhD2GETyDlCLWlhMGbCPLcmd1CjHcM4lA6ERXuA0AcjkJI1zK
 83q07tafpvJqHQl5bRWdUmgMt0MYrLPeylck0Y1KTpbqv67dYTdc3N+RZLIlgnwaAsMD
 tgmlfW+KVLSCXZfju9N8FU0d+5hGAnkky/+cDyTcKu5dnKEOnO/ao3+fKaCqA8AIp8ie
 14Q1+FyVt2xNI13/wuyxWMImPYFh966rPzI42+YGwKNr2Q0sdBc/rOVXPECCzJ7uxCZv
 T5VDrPVHopsPB1d00EdKQbG4EgBjhy4J1z9fTZDxDIybFOyMzm9cyf39wGQ6Wk7NJ213
 JG0Q==
X-Gm-Message-State: AFqh2koNei5EoCHjZFk5f4KkQhhxLUTpEu5e1TYkPSgNej/FT2D1QWpb
 w3kZlZZWf2TPn3pIZG4FuFSFWA==
X-Google-Smtp-Source: AMrXdXvWx56tSgEpdKCB2SaaRbSQnrH+JXmPG0KIWD3R7yqr3hjdlUPj3/q3h8C9oxFJyCPhFEawPA==
X-Received: by 2002:adf:de0b:0:b0:256:6553:5878 with SMTP id
 b11-20020adfde0b000000b0025665535878mr5547805wrm.58.1671761441333; 
 Thu, 22 Dec 2022 18:10:41 -0800 (PST)
Received: from sagittarius-a.chello.ie (188-141-3-169.dynamic.upc.ie.
 [188.141.3.169]) by smtp.gmail.com with ESMTPSA id
 j11-20020a5d452b000000b0022cc0a2cbecsm1849725wra.15.2022.12.22.18.10.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 22 Dec 2022 18:10:41 -0800 (PST)
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
To: linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
 devicetree@vger.kernel.org
Subject: [PATCH v6 12/18] arm64: dts: qcom: msm8996: Add compat qcom,
 msm8996-dsi-ctrl
Date: Fri, 23 Dec 2022 02:10:19 +0000
Message-Id: <20221223021025.1646636-13-bryan.odonoghue@linaro.org>
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

Add silicon specific compatible qcom,msm8996-dsi-ctrl to the
mdss-dsi-ctrl block. This allows us to differentiate the specific bindings
for msm8996 against the yaml documentation.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
 arch/arm64/boot/dts/qcom/msm8996.dtsi | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/msm8996.dtsi b/arch/arm64/boot/dts/qcom/msm8996.dtsi
index d31464204f696..c6d8371043a9a 100644
--- a/arch/arm64/boot/dts/qcom/msm8996.dtsi
+++ b/arch/arm64/boot/dts/qcom/msm8996.dtsi
@@ -989,7 +989,8 @@ mdp5_intf2_out: endpoint {
 			};
 
 			dsi0: dsi@994000 {
-				compatible = "qcom,mdss-dsi-ctrl";
+				compatible = "qcom,msm8996-dsi-ctrl",
+					     "qcom,mdss-dsi-ctrl";
 				reg = <0x00994000 0x400>;
 				reg-names = "dsi_ctrl";
 
@@ -1056,7 +1057,8 @@ dsi0_phy: phy@994400 {
 			};
 
 			dsi1: dsi@996000 {
-				compatible = "qcom,mdss-dsi-ctrl";
+				compatible = "qcom,msm8996-dsi-ctrl",
+					     "qcom,mdss-dsi-ctrl";
 				reg = <0x00996000 0x400>;
 				reg-names = "dsi_ctrl";
 
-- 
2.38.1

