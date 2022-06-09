Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 40743544BE3
	for <lists+dri-devel@lfdr.de>; Thu,  9 Jun 2022 14:24:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 45E2111BE91;
	Thu,  9 Jun 2022 12:24:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com
 [IPv6:2a00:1450:4864:20::136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CE89311BE5D
 for <dri-devel@lists.freedesktop.org>; Thu,  9 Jun 2022 12:24:03 +0000 (UTC)
Received: by mail-lf1-x136.google.com with SMTP id a2so31594860lfg.5
 for <dri-devel@lists.freedesktop.org>; Thu, 09 Jun 2022 05:24:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=SUn1WOp+JZSnlJIDDrxH+O9fgRsQXrcw9L2S+Zca6OM=;
 b=EtrvkCBe0NgzfUAPrPX2jYHqaxd/nG9HcYiVXsFU+ROL/t8759M9ti0tkbthJGhTpQ
 HLie4OUOUEFIAcYrpJkr/uIWCtaS5fAFy5r8kYfNsx7HeHi2PIoa0c5sa4nSrXc9PthH
 KP5FvRtOq+0Is+pyI4ZLIqxActQUQ3VAh8RzP3oYkFYmhPkicqRkpAKYqBNBM9paCEAZ
 UeGXRs/kZFFVf02ZI6fDc5QOoagK030Y3J5D7U+M4siq/10TKQahS63WQQ0dk+s0eYqX
 xKocU+YtXkTBMux7h14v/cjRX13BKBP8dJ7fR5V6ZdX/yoUxt5cm2OIud1h786P/UPMY
 3CdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=SUn1WOp+JZSnlJIDDrxH+O9fgRsQXrcw9L2S+Zca6OM=;
 b=UW1xPsdeemlOaF8E56kd8oZrThqXhjqqg+0QoQA3taAoRhbMMku6b6PUXHJBpZC1NS
 zPoYWkR9bXqjXAwtkEs7ZufkFef/djQyLqGqs6tHAbb4Np/3Hy4IPzLWGm3p/jWclH5D
 juPjPRlIFfF/4RHIQ7FoVHlh+/nBWbPilDncS+Lluwk9osKn++ZDwYnQlbdGIZwD/PT2
 ++9WWQxcT4VRh8T9GZv5O5doxAv9E2uks90DqRP3hUud6yhVIE/mopjIPv1iL9b5aUdW
 Rlb9xPctbLwlVWj8IU8qDpAyoxVERpD9C7UZr51KJMIS/Cmbgp/64nFY2aXsa70CCZf9
 ptYg==
X-Gm-Message-State: AOAM532yPKuCNHYIltrfFoBwkEibX0hsVKDsAWi/ofHFVZnCGlWWWsyd
 ILUfeqIx7YGtP1E6gzJCHBKDUw==
X-Google-Smtp-Source: ABdhPJwCXoEf6TkZjW0q7EHMhRCvA2o+dBUu8Cm/IqQaJmBV3E7VjgKjZV1hohNlh5iKc8A/ZUwXZA==
X-Received: by 2002:a05:6512:130c:b0:477:e2ea:396e with SMTP id
 x12-20020a056512130c00b00477e2ea396emr68244331lfu.489.1654777443367; 
 Thu, 09 Jun 2022 05:24:03 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125]) by smtp.gmail.com with ESMTPSA id
 f11-20020a056512360b00b0047daa133decsm32421lfs.166.2022.06.09.05.24.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 09 Jun 2022 05:24:03 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Andy Gross <agross@kernel.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Subject: [PATCH v3 13/14] ARM: dts: qcom: apq8064: drop phy-names from HDMI
 device node
Date: Thu,  9 Jun 2022 15:23:49 +0300
Message-Id: <20220609122350.3157529-14-dmitry.baryshkov@linaro.org>
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
 arch/arm/boot/dts/qcom-apq8064.dtsi | 1 -
 1 file changed, 1 deletion(-)

diff --git a/arch/arm/boot/dts/qcom-apq8064.dtsi b/arch/arm/boot/dts/qcom-apq8064.dtsi
index 34c0ba7fa358..391ad85559bd 100644
--- a/arch/arm/boot/dts/qcom-apq8064.dtsi
+++ b/arch/arm/boot/dts/qcom-apq8064.dtsi
@@ -1420,7 +1420,6 @@ hdmi: hdmi-tx@4a00000 {
 				      "slave_iface";
 
 			phys = <&hdmi_phy>;
-			phy-names = "hdmi-phy";
 
 			ports {
 				#address-cells = <1>;
-- 
2.35.1

