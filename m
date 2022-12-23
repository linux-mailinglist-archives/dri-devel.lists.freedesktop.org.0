Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D55E5654AC6
	for <lists+dri-devel@lfdr.de>; Fri, 23 Dec 2022 03:10:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E09F510E5B9;
	Fri, 23 Dec 2022 02:10:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com
 [IPv6:2a00:1450:4864:20::436])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B94AF10E5B1
 for <dri-devel@lists.freedesktop.org>; Fri, 23 Dec 2022 02:10:39 +0000 (UTC)
Received: by mail-wr1-x436.google.com with SMTP id m14so3382523wrh.7
 for <dri-devel@lists.freedesktop.org>; Thu, 22 Dec 2022 18:10:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=qZdjxc2y9QTXw1oO8jfVxT9zUH2M6g93k1qq74sNBIo=;
 b=CiW1w0oCZHCXgJsT8R3B2c1vyZI4zlQfpLkGHE2GzyCyMWoTTOxCBRGtT+RmnlOR6O
 NZFGvyKwnMdqXPjvmKPeTVkSvMotx43T9psSkpa6BlKvbgd4GSTqs3Q+sbls5KdIhsOT
 tUv4Iv9JzeE5BV8pIy06G1N7tHJR/eEf8FbIuR2ZDeJHGrsTLZJ7/fIOj7gL+8zDGqP5
 aGBad1khwIkRzSAcbiJxy43+LycN1vS0AdkzbZFL7vr2tbMWNp3RIbMnSEBP0pCrvHXf
 z+J77eyPXzJdOu1IrZOTn+dlWJ8LvXqGfEZ9/AK3EuWqFymgn72svLnxMJfC33rGPSUE
 NcdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=qZdjxc2y9QTXw1oO8jfVxT9zUH2M6g93k1qq74sNBIo=;
 b=N1K3YQkDl+bvb1WFQq2QzHi/C8U94IKFe4Yj9sAjr9JuCjD4cAfyhjiz65ah9oGLd6
 fMjbnpz/icsKPZGbdjcsjNUywyUjI5XtadXVJbtXr54zx5XDPkNJKBU5/D/zW3IiZA90
 qtQEO6w6hx08yfMkLv5ySkYXP6t5UHi5L91bC8A1N9lgPM7Pevr1DZmYeLeayVi0ggNN
 pUotJDi6h57Qmj+DeFHBh8My0qOB8OUHLw5JmGBjCbO2EPSEcnc36cjb6DUMBXIgPvkx
 hLeNKqy5chNbeXZRQTUZ/Jbsuzh3B/Z4qwjc99hxmKVupU7kGXJYtmDj1plsqe+vy1Iv
 BUTg==
X-Gm-Message-State: AFqh2kqdvj170JwpfdUbqMKYQKTnyz0BsKzNpraz/2Im4NrN4baRNt3W
 Zv0/oy+RjqzZqNqYrl3inA8J2w==
X-Google-Smtp-Source: AMrXdXtwc9SVrhYtFVOUn5bx/CPe1cbdMJyu51vy4h6ZyOByTQzyyyc/SQ8PT6md8GTVTHTNTzlqAA==
X-Received: by 2002:adf:f74e:0:b0:22e:6227:34e4 with SMTP id
 z14-20020adff74e000000b0022e622734e4mr5078206wrp.0.1671761438317; 
 Thu, 22 Dec 2022 18:10:38 -0800 (PST)
Received: from sagittarius-a.chello.ie (188-141-3-169.dynamic.upc.ie.
 [188.141.3.169]) by smtp.gmail.com with ESMTPSA id
 j11-20020a5d452b000000b0022cc0a2cbecsm1849725wra.15.2022.12.22.18.10.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 22 Dec 2022 18:10:38 -0800 (PST)
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
To: linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
 devicetree@vger.kernel.org
Subject: [PATCH v6 09/18] ARM: dts: qcom: msm8974: Add compat qcom,
 msm8974-dsi-ctrl
Date: Fri, 23 Dec 2022 02:10:16 +0000
Message-Id: <20221223021025.1646636-10-bryan.odonoghue@linaro.org>
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

Add silicon specific compatible qcom,msm8974-dsi-ctrl to the
mdss-dsi-ctrl block. This allows us to differentiate the specific bindings
for msm8974 against the yaml documentation.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
 arch/arm/boot/dts/qcom-msm8974.dtsi | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/qcom-msm8974.dtsi b/arch/arm/boot/dts/qcom-msm8974.dtsi
index 8d216a3c08511..3ab3665b28aaa 100644
--- a/arch/arm/boot/dts/qcom-msm8974.dtsi
+++ b/arch/arm/boot/dts/qcom-msm8974.dtsi
@@ -1579,7 +1579,8 @@ mdp5_intf1_out: endpoint {
 			};
 
 			dsi0: dsi@fd922800 {
-				compatible = "qcom,mdss-dsi-ctrl";
+				compatible = "qcom,msm8974-dsi-ctrl",
+					     "qcom,mdss-dsi-ctrl";
 				reg = <0xfd922800 0x1f8>;
 				reg-names = "dsi_ctrl";
 
-- 
2.38.1

