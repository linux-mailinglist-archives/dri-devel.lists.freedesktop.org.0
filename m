Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id F0EB95A112A
	for <lists+dri-devel@lfdr.de>; Thu, 25 Aug 2022 14:54:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 94BF710E19F;
	Thu, 25 Aug 2022 12:54:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x230.google.com (mail-lj1-x230.google.com
 [IPv6:2a00:1450:4864:20::230])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8996C10E1BA
 for <dri-devel@lists.freedesktop.org>; Thu, 25 Aug 2022 12:54:15 +0000 (UTC)
Received: by mail-lj1-x230.google.com with SMTP id k22so4662870ljg.2
 for <dri-devel@lists.freedesktop.org>; Thu, 25 Aug 2022 05:54:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc;
 bh=D/ccOsbml4jzjSuaN6Ect5+wP3SbE22HAifCrGPULww=;
 b=FVWi5xKPF5jzZCW1H9revypI8JzpEg8PzHlOM4EejMA8fJV0y53TPDVzqVtdLiXN+f
 IC4X4qKTdFy3Ctj8t8tvs9stoC47gcEMdprPtqvNgvV5JVoNNHfZxndYNEhqXkXXFA60
 KRm3q3Zs94o6/bU/GLtNxrpgiv3uTtkzQI0B1/2d+CkxZruVYvhYxmlGr5YiJFsCnZsw
 u2EKWnORW0KcimWVcask0+FYGYwHiGWmrHDBXDvM+AkayGQgfcMzSaIg8ZlMw98hTHHC
 TlFDjz9VTTaFpyI0mTQBKZU6NWUQ4VAnDDsln+XNN+SVI5oOff4vjXL7h2CGTYl/8a10
 uPjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
 bh=D/ccOsbml4jzjSuaN6Ect5+wP3SbE22HAifCrGPULww=;
 b=o8JphhK6Ri8CyP3wfLvkvrzQzbDmEyg9LNaoyJwnuxkA1q/cYB4Ej7V/uWcC0c6g4C
 f/do6sX/zKZKRoZOZbfyfvqYAAM3S46wUn1mltyInemEWeNtBRb+ABhtHT6v15RZfgzw
 qsA483JRPkV0d/k/kvtcBkgYQEjz3+RSd3YU9VYIf9Scpg+eLy/OdEGYAvD9swy1RG2I
 HmQJislhNxHNBDzApUpSmaeVxAfRrDbIKgigX1B1n/nw2QzcQwwkusEhdMyJxNfbNZEb
 QVkotFz/b+he93BtqVNR3aw4rpT5/4WHz6WRicS8Yf+wcNArKuw7YUVFmHN/U6qISLnJ
 Ouqw==
X-Gm-Message-State: ACgBeo1/c9E5jYaju9e9cgR8d1w/OVttOMGXD+8o+DpKqdRCUqrN3rkd
 /rCnbMTzGjQxC+lah1hYHFvoEg==
X-Google-Smtp-Source: AA6agR5kjCthwco3jfPkTHcbllpiDHBj4Vg74du9SANxf9zhAAh/e85DVBU/WRdGZ5i9gCiEB3383g==
X-Received: by 2002:a05:651c:19a7:b0:261:d7af:5d4f with SMTP id
 bx39-20020a05651c19a700b00261d7af5d4fmr1125100ljb.51.1661432053808; 
 Thu, 25 Aug 2022 05:54:13 -0700 (PDT)
Received: from krzk-bin.starman.ee (82.131.98.15.cable.starman.ee.
 [82.131.98.15]) by smtp.gmail.com with ESMTPSA id
 z14-20020a056512370e00b00492e3a8366esm494304lfr.9.2022.08.25.05.54.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 25 Aug 2022 05:54:13 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Lee Jones <lee@kernel.org>, Daniel Thompson <daniel.thompson@linaro.org>,
 Jingoo Han <jingoohan1@gmail.com>, Pavel Machek <pavel@ucw.cz>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Andy Gross <agross@kernel.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Konrad Dybcio <konrad.dybcio@somainline.org>,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Kiran Gunda <kgunda@codeaurora.org>, dri-devel@lists.freedesktop.org,
 linux-leds@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
Subject: [PATCH RESEND - dt 1/2] dt-bindings: nvmem: qfprom: add IPQ8064 and
 SDM630 compatibles
Date: Thu, 25 Aug 2022 15:54:09 +0300
Message-Id: <20220825125410.232377-2-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220825125410.232377-1-krzysztof.kozlowski@linaro.org>
References: <20220825125410.232377-1-krzysztof.kozlowski@linaro.org>
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
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Document compatibles for QFPROM used on IPQ8064 and SDM630.  They are
compatible with generic QFPROM fallback.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 Documentation/devicetree/bindings/nvmem/qcom,qfprom.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/nvmem/qcom,qfprom.yaml b/Documentation/devicetree/bindings/nvmem/qcom,qfprom.yaml
index dede8892ee01..b4163086a5be 100644
--- a/Documentation/devicetree/bindings/nvmem/qcom,qfprom.yaml
+++ b/Documentation/devicetree/bindings/nvmem/qcom,qfprom.yaml
@@ -18,6 +18,7 @@ properties:
       - enum:
           - qcom,apq8064-qfprom
           - qcom,apq8084-qfprom
+          - qcom,ipq8064-qfprom
           - qcom,msm8974-qfprom
           - qcom,msm8916-qfprom
           - qcom,msm8996-qfprom
@@ -25,6 +26,7 @@ properties:
           - qcom,qcs404-qfprom
           - qcom,sc7180-qfprom
           - qcom,sc7280-qfprom
+          - qcom,sdm630-qfprom
           - qcom,sdm845-qfprom
       - const: qcom,qfprom
 
-- 
2.34.1

