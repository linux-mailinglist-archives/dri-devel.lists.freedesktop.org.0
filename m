Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 29BD3638A39
	for <lists+dri-devel@lfdr.de>; Fri, 25 Nov 2022 13:38:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E09EC10E769;
	Fri, 25 Nov 2022 12:37:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com
 [IPv6:2a00:1450:4864:20::42b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BF2C910E755
 for <dri-devel@lists.freedesktop.org>; Fri, 25 Nov 2022 12:37:00 +0000 (UTC)
Received: by mail-wr1-x42b.google.com with SMTP id g12so6548449wrs.10
 for <dri-devel@lists.freedesktop.org>; Fri, 25 Nov 2022 04:37:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=m6CoppLmCTxX9uttSJKGwFNEqGwRPNJKx/ekxUEKy2g=;
 b=QhbOYxb24tTuaJPbVyoyscVgvUQklvpSVDXsx9WjqI2r5xzEhHybpTSzd8awQZbxIV
 4D23eXP1EvTW49UIDC/e//hFc4Tap4xKpms/VtfLCYeU9rNO5O5D91EvbdYnr+6BfcFm
 xZrUzQ/ZnqmWeu/xSJZkJmgvJzp1MxzNbVyHC3MfLdcQFgIOZ2bPsMv/co/l0UTQfvJV
 KON9mzH2i4u/Wf7rBcFz41QcHqpgsWUoUGE4xHmx1yLFFo1jzIfWdnGGGdKN1G/Co7kr
 XqWcVxBatWu5jp4IYcFCKzprgcGywsq0ODeRAfKbAyuAKjMu9cK3FJMbk0JYbKpgHQXE
 Lkng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=m6CoppLmCTxX9uttSJKGwFNEqGwRPNJKx/ekxUEKy2g=;
 b=3r3rxapSqOJSOaSxNp+C3OPhPRhwOXsinpAmAAvQBpexFw9IJgjnV/vykTWb+6xxGJ
 FcxdrfifWsZtzjjmmuiLtdUEApEalpw5k3k25tIbtDmvsUe/PsoY8cfRf8gt/gAjtCsY
 9r8Fls3svBEsp04vVSjbAmIBxES76USART7FdvYz5Z54X0k6rwVjFJQcIWLSw5p0m9mH
 CtrxroZ0K0ojBw4mwIHJt6+5epH0VJVptMX4/nAjXrCz+Nvo4sbQcEHY9AX5ZUgl43hO
 8z1smL1WHf5MShT+9QQY5uDG/7f82Stqq4+3l2XOgpHi23Q/ZSyA6IqTekGVOM/p+xBt
 xhEw==
X-Gm-Message-State: ANoB5pmx6ZI07xvRZtBNnln962eSke1TmV57DPKAM3/yDu9RVYTEX3xZ
 FF7KLDtszHAdVihfMNOJ7CtOcw==
X-Google-Smtp-Source: AA0mqf55hAMSzFjdkZQ4JxF9PUCqhQHWHHpTkmkzfVRF9q8V26H+eq8i5T1OqxBEyWaUd0YhBfMTMA==
X-Received: by 2002:a5d:6e56:0:b0:241:d8e7:2b18 with SMTP id
 j22-20020a5d6e56000000b00241d8e72b18mr14541843wrz.388.1669379820342; 
 Fri, 25 Nov 2022 04:37:00 -0800 (PST)
Received: from sagittarius-a.chello.ie (188-141-3-169.dynamic.upc.ie.
 [188.141.3.169]) by smtp.gmail.com with ESMTPSA id
 k15-20020a5d6d4f000000b002366dd0e030sm3574111wri.68.2022.11.25.04.36.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 25 Nov 2022 04:36:59 -0800 (PST)
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
To: linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
 devicetree@vger.kernel.org
Subject: [PATCH v4 15/18] arm64: dts: qcom: sdm630: Add compat qcom,
 sdm630-dsi-ctrl
Date: Fri, 25 Nov 2022 12:36:35 +0000
Message-Id: <20221125123638.823261-16-bryan.odonoghue@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221125123638.823261-1-bryan.odonoghue@linaro.org>
References: <20221125123638.823261-1-bryan.odonoghue@linaro.org>
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

Add silicon specific compatible qcom,sdm630-dsi-ctrl to the
mdss-dsi-ctrl block. This allows us to differentiate the specific bindings
for sdm630 against the yaml documentation.

Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
 arch/arm64/boot/dts/qcom/sdm630.dtsi | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/sdm630.dtsi b/arch/arm64/boot/dts/qcom/sdm630.dtsi
index 0e7764f66b104..905ddb57318dd 100644
--- a/arch/arm64/boot/dts/qcom/sdm630.dtsi
+++ b/arch/arm64/boot/dts/qcom/sdm630.dtsi
@@ -1581,7 +1581,8 @@ opp-412500000 {
 			};
 
 			dsi0: dsi@c994000 {
-				compatible = "qcom,mdss-dsi-ctrl";
+				compatible = "qcom,sdm630-dsi-ctrl",
+					     "qcom,mdss-dsi-ctrl";
 				reg = <0x0c994000 0x400>;
 				reg-names = "dsi_ctrl";
 
-- 
2.38.1

