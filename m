Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E03BF4C9A2C
	for <lists+dri-devel@lfdr.de>; Wed,  2 Mar 2022 01:52:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8EBE210E911;
	Wed,  2 Mar 2022 00:52:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com
 [IPv6:2a00:1450:4864:20::134])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8167310E974
 for <dri-devel@lists.freedesktop.org>; Wed,  2 Mar 2022 00:52:16 +0000 (UTC)
Received: by mail-lf1-x134.google.com with SMTP id j7so90820lfu.6
 for <dri-devel@lists.freedesktop.org>; Tue, 01 Mar 2022 16:52:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=cuV5T+xDXxoIpuuof4RZMLElzWdFxHlFrB9qxP2rO7U=;
 b=yCR0+2MguovBLCP54GnVfDr/RPj7egrBpX99xfCWVR/brkxDIkuq9T0kxxgtmB49MW
 8FAqcA7tb0WpbMP6h6/4p00NdPQy/VFlRQhCls4v7YwX5OJygRMRgFcJwGDvqaafKxJx
 dfnYXQLRs4vP8YVNrL7ovXjUiyQc8DpsgDibi+YULzll0rI6BdM/VFc4L8+tldKigLCO
 hyn2gWOdDJiuWYsntq7BG0Ymgd7PKqbRIbwCvkpWIbJUeXbaaznWb7PGNnYFVj6CSVOD
 Vrj+W3QgYmnVpUgPp137OzycqhdiZzRSJC1Ky6CFTWpRJKElPVfQer7RyLLPL+EO6Viq
 Ohcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=cuV5T+xDXxoIpuuof4RZMLElzWdFxHlFrB9qxP2rO7U=;
 b=fUS61qlxSI/L/iZ94EzYMXoWNcS/iNVpBbr52YBMqkNiSNvaPlTdRydvAWPwrs0Eml
 bM90I+/85I+I5CtLdx97/2E/tEShDvAL+lIKbwFkx8Qr/vlhvvZqC+E/0C+EF5kR3Z07
 ztWO5CKVG9cRi8ZX+lZ6lrN6dW3neDczr9a2WnleEpikEHH34irlLQXHHZ8nbOSP+VHE
 oj27k4gInnj5Gosaynr09NlMV9xy6fw/EWw1jCdI0IRLpGKLN9yXfsWMNSZk9pRlbEEj
 AP5Iikcc1kacCepzhMSocWARFXiH+rESdRXxVFvVVfm4H3wZ/EzvsfaxqCu4JJlrY21h
 VmVg==
X-Gm-Message-State: AOAM5315FT1Omuzrt+GAi1gRxudTdAQCziW8eJe7d71YUlHg0AjqbOd+
 uKUV6sDuAPHj1qNNqNQzYBVcww==
X-Google-Smtp-Source: ABdhPJwaZ6Tmh1tkbRTMhxj9QmyVBiA/Fq03uK+R7t0pt6RoZngYZHLL6ODNa/NxuEMZddW8yUQukQ==
X-Received: by 2002:ac2:4c34:0:b0:445:6ce3:ed6d with SMTP id
 u20-20020ac24c34000000b004456ce3ed6dmr16622964lfq.29.1646182334833; 
 Tue, 01 Mar 2022 16:52:14 -0800 (PST)
Received: from eriador.lan ([2001:470:dd84:abc0:5258:5528:7624:3edd])
 by smtp.gmail.com with ESMTPSA id
 n23-20020a19ef17000000b00445b8db3c42sm198171lfh.172.2022.03.01.16.52.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 01 Mar 2022 16:52:14 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Bjorn Andersson <bjorn.andersson@linaro.org>,
 Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Subject: [PATCH 3/5] arm64: dts: qcom: sdm660: Drop flags for mdss irqs
Date: Wed,  2 Mar 2022 03:52:08 +0300
Message-Id: <20220302005210.2267725-3-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220302005210.2267725-1-dmitry.baryshkov@linaro.org>
References: <20220302005210.2267725-1-dmitry.baryshkov@linaro.org>
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

The number of interrupt cells for the mdss interrupt controller is 1,
meaning there should only be one cell for the interrupt number, not two.
Drop the second cell containing (unused) irq flags.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 arch/arm64/boot/dts/qcom/sdm660.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/sdm660.dtsi b/arch/arm64/boot/dts/qcom/sdm660.dtsi
index eccf6fde16b4..1d748c5305f4 100644
--- a/arch/arm64/boot/dts/qcom/sdm660.dtsi
+++ b/arch/arm64/boot/dts/qcom/sdm660.dtsi
@@ -163,7 +163,7 @@ dsi1: dsi@c996000 {
 		power-domains = <&rpmpd SDM660_VDDCX>;
 
 		interrupt-parent = <&mdss>;
-		interrupts = <5 IRQ_TYPE_LEVEL_HIGH>;
+		interrupts = <5>;
 
 		assigned-clocks = <&mmcc BYTE1_CLK_SRC>,
 					<&mmcc PCLK1_CLK_SRC>;
-- 
2.34.1

