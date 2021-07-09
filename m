Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 14E823C2AB3
	for <lists+dri-devel@lfdr.de>; Fri,  9 Jul 2021 23:07:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 088EC6EA98;
	Fri,  9 Jul 2021 21:07:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x233.google.com (mail-lj1-x233.google.com
 [IPv6:2a00:1450:4864:20::233])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 69F626EA92
 for <dri-devel@lists.freedesktop.org>; Fri,  9 Jul 2021 21:07:37 +0000 (UTC)
Received: by mail-lj1-x233.google.com with SMTP id s18so10115566ljg.7
 for <dri-devel@lists.freedesktop.org>; Fri, 09 Jul 2021 14:07:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=layNZSd+FoZtOkJhwys8kJ/X4gIdfKOk3GqyJJHYn6Q=;
 b=coglC/wbvbN6RbZRMT1YmxXhRt7rGu2KEGgXeXccq1bOSGv7sKZhEvyF3nwZpXMxJU
 DglD/MxK6Zr+gOZq7u35l/xf1sBBu4/jYy6nW3rLT8o8vbl1LazqhpwtE1tC0SOCvZXz
 Iwhu61eqKVfhA/GjV+j5cNR+tegxNELzIZDYNC0PpySrCGaQbUyaXO0D00OOmrScBvz6
 gWMdt/pBoC3HZff87bW/r/YLz/iTYlPIvZyq5PRlG5zCPR6bIU+G9BY6ZkZzoXmc1/iy
 L+pm3A2m3Ybu6OF8XjLUdBvpaVet8J1iOD5Mf8W1mxqRp68Na1g6P4QaQ4HKA/TCYNyT
 MWPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=layNZSd+FoZtOkJhwys8kJ/X4gIdfKOk3GqyJJHYn6Q=;
 b=Tjc3c/wIcA+t8XQEn+5AI5Ire58km5O0a1V4lMzifNTke/rHSuozy7MqdEbsqrrexl
 cICeh6+Qa9vN72wnH4BeXMJhTRqcOCoF1PmrFrx15eO7f/s9A7ArToIrXAzZVEfyB8rB
 4Jh8dCQCI9v2Y1G7mluitA+E4nJzUioBG/aAS44LJFkmcDaOiDuDGYGAyQ8exGOL2Wy3
 Q9P0zfTTWTUs6Cwtd79qhszbXQSjLF76PqvL2apz8nUPaK/+LuIIS0Vw9ZiGQG9nVs7j
 r/vkw4ixfUV0YLkemU109gamDMZmF6Ufob0vh5seQIJFomqzxF6Fv3aAXEkYVPMtrq3v
 CMeg==
X-Gm-Message-State: AOAM532ZE2blK1sOOPP8GvDHza2qvs8858W/1X5rpF0f1u7fiZgV+3VT
 f18K61jRyUDhkf2cJAqM3Bc1SA==
X-Google-Smtp-Source: ABdhPJz7xuBU5NOJN1nd0AYqcPHRMXHSzVuZToBMwu3vNHnsDhmOJJCRsk4rOGschmV7VAheB8HVmA==
X-Received: by 2002:a2e:4a1a:: with SMTP id x26mr14643990lja.178.1625864855832; 
 Fri, 09 Jul 2021 14:07:35 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
 by smtp.gmail.com with ESMTPSA id n15sm590625lfh.70.2021.07.09.14.07.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 09 Jul 2021 14:07:35 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Andy Gross <agross@kernel.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <abhinavk@codeaurora.org>, Rob Herring <robh+dt@kernel.org>
Subject: [PATCH v2 4/8] arm64: dts: qcom: sdm845-mtp: assign DSI clock source
 parents
Date: Sat, 10 Jul 2021 00:07:25 +0300
Message-Id: <20210709210729.953114-5-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210709210729.953114-1-dmitry.baryshkov@linaro.org>
References: <20210709210729.953114-1-dmitry.baryshkov@linaro.org>
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
Cc: devicetree@vger.kernel.org, Jonathan Marek <jonathan@marek.ca>,
 Stephen Boyd <sboyd@kernel.org>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, David Airlie <airlied@linux.ie>,
 freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Assign DSI clock source parents to DSI PHY clocks.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Reviewed-by: Abhinav Kumar <abhinavk@codeaurora.org>
---
 arch/arm64/boot/dts/qcom/sdm845-mtp.dts | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sdm845-mtp.dts b/arch/arm64/boot/dts/qcom/sdm845-mtp.dts
index 1372fe8601f5..9e550e3ad678 100644
--- a/arch/arm64/boot/dts/qcom/sdm845-mtp.dts
+++ b/arch/arm64/boot/dts/qcom/sdm845-mtp.dts
@@ -413,6 +413,9 @@ &dsi1 {
 
 	qcom,dual-dsi-mode;
 
+	/* DSI1 is slave, so use DSI0 clocks */
+	assigned-clock-parents = <&dsi0_phy 0>, <&dsi0_phy 1>;
+
 	ports {
 		port@1 {
 			endpoint {
-- 
2.30.2

