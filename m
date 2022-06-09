Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E372544BE0
	for <lists+dri-devel@lfdr.de>; Thu,  9 Jun 2022 14:24:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 72EF911BE9D;
	Thu,  9 Jun 2022 12:24:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com
 [IPv6:2a00:1450:4864:20::132])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DA5AD11BE87
 for <dri-devel@lists.freedesktop.org>; Thu,  9 Jun 2022 12:24:04 +0000 (UTC)
Received: by mail-lf1-x132.google.com with SMTP id a29so9210183lfk.2
 for <dri-devel@lists.freedesktop.org>; Thu, 09 Jun 2022 05:24:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=qs3Tgo9HxtYbegYMsCk59QI8qhrr1tyZgYEjx7n8Wk4=;
 b=SqHFt07SCMIijq4IN+FXHu5/qFgbby/8hR5MpdRzb3971Dzc5Ik0+eymmwAHuAUfKO
 bAHEZT56jczuI4+o8ngXAYtGIdC5S3n4KNKgXLP7Ag+ZXE8+iMnWijnXvtOFHEU0psMy
 Hq59zvmQyGPXhWq8Ub2EQNb5qNmFD2uKPser0sySf3l3gP01/pam1rFTv0T88dQ+ogw5
 H4cUgfvYE2vVZ5wZh4qnccUif5oK4xrGAO0vzW6X1RaflRK2VKniV90nUVn4VKz0l0YY
 HJa/3W3GQknLX/aL8SqjrLd/cejz90eLX29yUw0D6oLtBeHb85dbQh8ecosbzGd478ET
 UR+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=qs3Tgo9HxtYbegYMsCk59QI8qhrr1tyZgYEjx7n8Wk4=;
 b=ZTuydizbr6L1R540GvQVfNsbxFH0EvBV4P1oBk0QWy3t/vu2HbzUD8CoQZU4tP8VB9
 FcQU+XnMqr//S5M0Uii6Xdgx3Qipj41XJnJryDjCjYqXvYWPYbt4OyTQ1qep5E8RlNVB
 XF5Hkp/tq2Gai5J6FK6yyc1c+Qd1AELufgh58QZ5vq/bd1uI6J5epMbpKLMbbRUOgVig
 DIV9wohc7yXuSpF2T65qiYFRhAbe17g/sNBcbSPc2Q6hGo4Z9RPtIKWbLbK+w4GiAxGh
 2Sd3lG3j239D3ys7FJeTEYtRxF22IGioxFRzZ1YfhWZNX2G1LtI1bu1cEfNzwyhPNU/V
 8v1A==
X-Gm-Message-State: AOAM533qLYL81SLml+VMLsk5/kJ3Jgkx84t0vEOTka7UxZBXIsBJqG+n
 Y0A+Ydt36V3GXCsJXcZA5xMQiw==
X-Google-Smtp-Source: ABdhPJyvQuKGTYPc/8i9ydAXsIXFgspf1mz3WicEZf36eNYWiwrLcqCbebVPPaTSa0mxzJpI1Rzfaw==
X-Received: by 2002:a05:6512:234e:b0:479:3bb1:8d3c with SMTP id
 p14-20020a056512234e00b004793bb18d3cmr14715871lfu.478.1654777444407; 
 Thu, 09 Jun 2022 05:24:04 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125]) by smtp.gmail.com with ESMTPSA id
 f11-20020a056512360b00b0047daa133decsm32421lfs.166.2022.06.09.05.24.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 09 Jun 2022 05:24:03 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Andy Gross <agross@kernel.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Subject: [PATCH v3 14/14] arm64: dts: qcom: msm8996: drop phy-names from HDMI
 device node
Date: Thu,  9 Jun 2022 15:23:50 +0300
Message-Id: <20220609122350.3157529-15-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220609122350.3157529-1-dmitry.baryshkov@linaro.org>
References: <20220609122350.3157529-1-dmitry.baryshkov@linaro.org>
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
Cc: devicetree@vger.kernel.org, David Airlie <airlied@linux.ie>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Stephen Boyd <swboyd@chromium.org>, freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The HDMI driver doesn't use the phy-names to identify the PHY. Different
Qualcomm platforms have used different names for the PHY. So, we are
deprecating phy-names propertty of the HDMI device and dropping them
from existing DTs.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 arch/arm64/boot/dts/qcom/msm8996.dtsi | 1 -
 1 file changed, 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/msm8996.dtsi b/arch/arm64/boot/dts/qcom/msm8996.dtsi
index 9932186f7ceb..fa446889d25d 100644
--- a/arch/arm64/boot/dts/qcom/msm8996.dtsi
+++ b/arch/arm64/boot/dts/qcom/msm8996.dtsi
@@ -925,7 +925,6 @@ hdmi: hdmi-tx@9a0000 {
 					"extp";
 
 				phys = <&hdmi_phy>;
-				phy-names = "hdmi_phy";
 				#sound-dai-cells = <1>;
 
 				status = "disabled";
-- 
2.35.1

