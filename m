Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8599754CA95
	for <lists+dri-devel@lfdr.de>; Wed, 15 Jun 2022 15:59:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 718B810F74C;
	Wed, 15 Jun 2022 13:59:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com
 [IPv6:2a00:1450:4864:20::135])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B822910F53F
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Jun 2022 13:59:42 +0000 (UTC)
Received: by mail-lf1-x135.google.com with SMTP id be31so19055571lfb.10
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Jun 2022 06:59:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=hmuYPwQa1jhocO5psPDczMcPAlt9oeSQSumJCmiaYKg=;
 b=V0SMWQZDOrXALeVCBqwaWCFd8WspAVe46SWqzAh0uKYFL3AO2cwoYOo6q2NfimIbkm
 fy5YkUIoVpm8oYmkOZvm7OQ3ZEBjvcx90eP+IyjfnUfO29Xj6KSX8yILvA7s+xMCP17H
 XX7SQJyodlNgfTbVdAE99X8hWXTw3Z7mQW3xREz5H9qpPk1HgMyiIh+8eIhOTDRqbgv+
 0IliZuz1rzXjCjAgNEJZYfBxdbJue15Ch722prREzLoCHVX3f76cbmXvejgkTnuyAPo+
 F0IBJFgr/Lw8r/K29/fD6RUoSB/bB6WOsEU2zrWiNtI+VF2zEOdgahdhx/sj3wIklgqA
 yXNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=hmuYPwQa1jhocO5psPDczMcPAlt9oeSQSumJCmiaYKg=;
 b=LoybwbmTUvFAmegm0Ib6ttON2N0MxPVcqcDANaR4zIxHuZcbzA+bsjB2taEJH7/okU
 b1UkDuvuspRPziERaVuqo3S0RX6SnJmvT9CwpCPmasj+AnHnsKqYAxKhvNnnSLTeg6lr
 FnHWSdnxAZ5FwldmbmEfAZ8mcLJqzSo1o2QE0FQcXL5mJRFnrkuNYHvWjIP6x8nqpr6l
 +aHNBCTo1AukIbxCwwpLEBb89NRlpvOVxXyKIote0SqVDrGwAXQRkAZdO/F0XBCheIdM
 qjbeI9hej1TSCWKg+EE2oQ0s4uBYxRuRQ7Fu384nB5jOPpDi7buEZub/9Sjy2S1+8prQ
 3cdw==
X-Gm-Message-State: AJIora/R6BYnj+m9tByHSESxHurEIHqk5wsp/Cnhy4gHSMsli8nVX17M
 nFBKvB+T0kbcOSsml6uhb9ZpTw==
X-Google-Smtp-Source: AGRyM1vkiSlaaS7HgWsdKdlvAox15z9dfhdTJCVxZj4b6ETZ4bWDKdP/yXoUuylqR7yIVkSwvpR1bA==
X-Received: by 2002:a05:6512:3992:b0:47c:48fc:3c62 with SMTP id
 j18-20020a056512399200b0047c48fc3c62mr6374831lfu.102.1655301580930; 
 Wed, 15 Jun 2022 06:59:40 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125]) by smtp.gmail.com with ESMTPSA id
 z23-20020a2e8e97000000b0025530fa4edesm1694962ljk.49.2022.06.15.06.59.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 15 Jun 2022 06:59:40 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>
Subject: [PATCH 5/5] arm64: dts: qcom: add mdp_clk clock to the MDSS device
Date: Wed, 15 Jun 2022 16:59:35 +0300
Message-Id: <20220615135935.87381-5-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220615135935.87381-1-dmitry.baryshkov@linaro.org>
References: <20220615135935.87381-1-dmitry.baryshkov@linaro.org>
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
Cc: David Airlie <airlied@linux.ie>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Bjorn Andersson <bjorn.andersson@linaro.org>,
 Stephen Boyd <swboyd@chromium.org>, freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add MDP_CLK ("core") clock to the mdss device to allow MDSS driver to
access HW_REV/etc registers.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 arch/arm64/boot/dts/qcom/msm8996.dtsi | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/msm8996.dtsi b/arch/arm64/boot/dts/qcom/msm8996.dtsi
index f0f81c23c16f..3d8ecfe56fb3 100644
--- a/arch/arm64/boot/dts/qcom/msm8996.dtsi
+++ b/arch/arm64/boot/dts/qcom/msm8996.dtsi
@@ -773,8 +773,9 @@ mdss: mdss@900000 {
 			interrupt-controller;
 			#interrupt-cells = <1>;
 
-			clocks = <&mmcc MDSS_AHB_CLK>;
-			clock-names = "iface";
+			clocks = <&mmcc MDSS_AHB_CLK>,
+				 <&mmcc MDSS_MDP_CLK>;
+			clock-names = "iface", "core";
 
 			#address-cells = <1>;
 			#size-cells = <1>;
-- 
2.35.1

