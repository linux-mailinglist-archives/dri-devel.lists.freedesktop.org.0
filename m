Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 497B24C9A27
	for <lists+dri-devel@lfdr.de>; Wed,  2 Mar 2022 01:52:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8580410E976;
	Wed,  2 Mar 2022 00:52:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x229.google.com (mail-lj1-x229.google.com
 [IPv6:2a00:1450:4864:20::229])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5A04710E93B
 for <dri-devel@lists.freedesktop.org>; Wed,  2 Mar 2022 00:52:15 +0000 (UTC)
Received: by mail-lj1-x229.google.com with SMTP id l12so90219ljh.12
 for <dri-devel@lists.freedesktop.org>; Tue, 01 Mar 2022 16:52:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=5dxVC0XYMtIkeKswxmMMqBeM9Azi7/GfbM0XxG5vLXE=;
 b=oEmqBkXAdaJ9rnJDQtmTdrV6zzeyI3SIDdlyVBZ4QLxJAkUw4VYGbn5hLe0c2y4m1l
 1i0hPWf5Us3QDEj8Wmu2DvR4cT0LcqhXE7NLRBSS5et5XaSCjpl0Sof4nZtburkGLa+w
 I/QrvAYTnr4A0E2gkFhQdlYSuvHXK1LAdkqnZrJtADJb1ZVsU2mRi/gP+T2oL6Jw1Sgf
 zF9cPkzMEpSD34t2STfywILF8DBgRD1GdlERGKgQveauH+uqiGKOUB3MbJwDxg2cx+GA
 QlP3l4jeP1S5bOq+1i1fnDX6Fk6DyoD6seumYqf1xQqYMs0EIPeImFgpX+0gwDqqjw3/
 seqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=5dxVC0XYMtIkeKswxmMMqBeM9Azi7/GfbM0XxG5vLXE=;
 b=s5YYKEQQz4fhghv9uSgokWdmyRzQJOmtrlRxukYBjlG7HuXndLtMwf4SdxfSFLlcS4
 stM+VlAlNjnmDvWVnq5fyp+Tf0qeiKOF3cfyULxIIKozGEvfryyi7B+FceKVmBn141l9
 tWEBWPwax68ZtLmVDq3gdRsZsRCpN/LqNcIs+Rc63my/2QsxMLwVAUAxKpCaEOSg0A8r
 LLcxaTizlmxXrJ0cqsEO7E4ZJyeEKt2irfa0+8ekkyiZH2JYHmHfxVGuEOJTtP7xskwf
 WCcJ4MBZZx+eZMLxqJj2s7VrofqD1lXW2q1EcvIBvsfhBfygofbCJmqvnwm5XFOyFzLf
 +1mQ==
X-Gm-Message-State: AOAM531yf4BZiZE1sffvXa5BOTKIZfShmFA7pKDPluzQpJCBR9k6mtC8
 fhkjDtuT9ETQRQ47LI6i92y3Gg==
X-Google-Smtp-Source: ABdhPJw1dajR6vcW+/GGOcsIoftUlKpFkCNvxRaWyG04WZEO0cJhVTEkXW+He7bQtZfg+1bUDlFVSA==
X-Received: by 2002:a05:651c:514:b0:246:8b8c:a97b with SMTP id
 o20-20020a05651c051400b002468b8ca97bmr8544838ljp.238.1646182333544; 
 Tue, 01 Mar 2022 16:52:13 -0800 (PST)
Received: from eriador.lan ([2001:470:dd84:abc0:5258:5528:7624:3edd])
 by smtp.gmail.com with ESMTPSA id
 n23-20020a19ef17000000b00445b8db3c42sm198171lfh.172.2022.03.01.16.52.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 01 Mar 2022 16:52:13 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Bjorn Andersson <bjorn.andersson@linaro.org>,
 Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Subject: [PATCH 2/5] arm64: dts: qcom: sdm630: Drop flags for mdss irqs
Date: Wed,  2 Mar 2022 03:52:07 +0300
Message-Id: <20220302005210.2267725-2-dmitry.baryshkov@linaro.org>
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
 arch/arm64/boot/dts/qcom/sdm630.dtsi | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sdm630.dtsi b/arch/arm64/boot/dts/qcom/sdm630.dtsi
index 240293592ef9..7f875bf9390a 100644
--- a/arch/arm64/boot/dts/qcom/sdm630.dtsi
+++ b/arch/arm64/boot/dts/qcom/sdm630.dtsi
@@ -1453,7 +1453,7 @@ mdp: mdp@c901000 {
 				reg-names = "mdp_phys";
 
 				interrupt-parent = <&mdss>;
-				interrupts = <0 IRQ_TYPE_LEVEL_HIGH>;
+				interrupts = <0>;
 
 				assigned-clocks = <&mmcc MDSS_MDP_CLK>,
 						  <&mmcc MDSS_VSYNC_CLK>;
@@ -1530,7 +1530,7 @@ dsi0: dsi@c994000 {
 				power-domains = <&rpmpd SDM660_VDDCX>;
 
 				interrupt-parent = <&mdss>;
-				interrupts = <4 IRQ_TYPE_LEVEL_HIGH>;
+				interrupts = <4>;
 
 				assigned-clocks = <&mmcc BYTE0_CLK_SRC>,
 						  <&mmcc PCLK0_CLK_SRC>;
-- 
2.34.1

