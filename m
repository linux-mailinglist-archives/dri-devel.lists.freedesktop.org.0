Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 61FDF34CF95
	for <lists+dri-devel@lfdr.de>; Mon, 29 Mar 2021 14:01:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BFD716E418;
	Mon, 29 Mar 2021 12:01:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com
 [IPv6:2a00:1450:4864:20::129])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A6E946E400
 for <dri-devel@lists.freedesktop.org>; Mon, 29 Mar 2021 12:01:01 +0000 (UTC)
Received: by mail-lf1-x129.google.com with SMTP id a198so18010959lfd.7
 for <dri-devel@lists.freedesktop.org>; Mon, 29 Mar 2021 05:01:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=+8Q0oXrMBUUF8CE7R5pzSgMMnLMfJKLpBWJdMeU+Kvg=;
 b=ybO0/FULhnEnk5jpC9ukACgruWaHDTR/3rHmAizO7AhGugRK389MP30cORWXKeUYi2
 1hjj515agYgf3pHDPu5B8WSDZS2741SndfQqIPO7yb/7Yr3n/iEUNTTj7jz6K1SpFafp
 O+TVpO80XRUt0ocfidTLtI1DU/3kHfmplHnUs3EgGvj6jbGaLEkCkHUJaHZq1LtJX6ST
 NTz1yXSg1dnBakqhCIptoXiDM3e0be58I/2TndMFTjwSoEJhtEDBzVeQ6aEx7kPOoiqB
 L2/7yNLa/OBMgCANrB/pz2xMpits59r2h6DtiZlCsbOedAovb6MtYpEPuyHTMwMQioYI
 wKNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=+8Q0oXrMBUUF8CE7R5pzSgMMnLMfJKLpBWJdMeU+Kvg=;
 b=eiCbNymH06W6uX4xTkLnLmB+y9EgYDs6Bs+u8fPw2LyoL3UJS0Z2++9wAhun8b80Sp
 o4+unHRsr7423RzZwwVmOCFixqN3SwRtMYin5J60sf63n9CNNG0GAkL3nzpqX5d0hmp/
 ZcX6QfbNqEokAAlRf6HzPgTG6jVlV56qN5MsQLCP34Tjs9Mr8rxOFdODxiQ0kfzxQZoc
 UJnXRdyrc0neq34HR0/83l2uuR1OL4eQjrLYvdovkapx93PdPEuH95cwaoSdGZndWEU8
 iYyxkSIm0nx4qKp5I/9w778KlJ6/kYmc4ZwW6lIQ2kTLBvFJIDYdnJAW1Hc2NMWlfZ6N
 t/lA==
X-Gm-Message-State: AOAM533XAm2QKiYvO+kXrmwptp9+s9cDQX2OaaEosoOyeKcp8fK1fHSy
 leNM2z8b0Y+0XeOljPE34LxpH7NWWTEF8w==
X-Google-Smtp-Source: ABdhPJxWupiJN7PDS7xB8mTiJz/syDuiuIqkK2JJW59ERweoBfkxm+NI/T7VPNHg+minbdRReJDZHw==
X-Received: by 2002:a19:520b:: with SMTP id m11mr15874260lfb.42.1617019260144; 
 Mon, 29 Mar 2021 05:01:00 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
 by smtp.gmail.com with ESMTPSA id d8sm2415240ljc.129.2021.03.29.05.00.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 29 Mar 2021 05:00:59 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Andy Gross <agross@kernel.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Rob Herring <robh+dt@kernel.org>
Subject: [PATCH v4 2/4] dt-bindings: msm/disp: add compatibles for
 sm8150/sm8250 display
Date: Mon, 29 Mar 2021 15:00:49 +0300
Message-Id: <20210329120051.3401567-3-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210329120051.3401567-1-dmitry.baryshkov@linaro.org>
References: <20210329120051.3401567-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
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
 David Airlie <airlied@linux.ie>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Jonathan Marek <jonathan@marek.ca>

The driver already has support for sm8150/sm8250, but the compatibles were
never added.

Signed-off-by: Jonathan Marek <jonathan@marek.ca>
Acked-by: Rob Herring <robh@kernel.org>
[DB: split dt-bindings into separate patch]
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 Documentation/devicetree/bindings/display/msm/dpu.txt | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/display/msm/dpu.txt b/Documentation/devicetree/bindings/display/msm/dpu.txt
index 551ae26f60da..5763f43200a0 100644
--- a/Documentation/devicetree/bindings/display/msm/dpu.txt
+++ b/Documentation/devicetree/bindings/display/msm/dpu.txt
@@ -8,7 +8,7 @@ The DPU display controller is found in SDM845 SoC.
 
 MDSS:
 Required properties:
-- compatible:  "qcom,sdm845-mdss", "qcom,sc7180-mdss"
+- compatible:  "qcom,sdm845-mdss", "qcom,sc7180-mdss", "qcom,sm8150-mdss", "qcom,sm8250-mdss"
 - reg: physical base address and length of contoller's registers.
 - reg-names: register region names. The following region is required:
   * "mdss"
@@ -41,7 +41,7 @@ Optional properties:
 
 MDP:
 Required properties:
-- compatible: "qcom,sdm845-dpu", "qcom,sc7180-dpu"
+- compatible: "qcom,sdm845-dpu", "qcom,sc7180-dpu", "qcom,sm8150-dpu", "qcom,sm8250-dpu"
 - reg: physical base address and length of controller's registers.
 - reg-names : register region names. The following region is required:
   * "mdp"
-- 
2.30.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
