Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4086959C9EF
	for <lists+dri-devel@lfdr.de>; Mon, 22 Aug 2022 22:20:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 92D7CA1AC5;
	Mon, 22 Aug 2022 20:19:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com
 [IPv6:2a00:1450:4864:20::132])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8FD5DA1A3B
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Aug 2022 20:18:19 +0000 (UTC)
Received: by mail-lf1-x132.google.com with SMTP id bq23so7802660lfb.7
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Aug 2022 13:18:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc;
 bh=DmWp0uy89TPiPu8UitGlfJ4fqSkdwaIvyUKOGTjMH64=;
 b=diQQRnW5oE9AmhIDlJ0Nw8s6hWb+cFdj3Tt8HZDW5k96YffvkWQLmaZTEFdx+G8GfY
 AyiAwkCXe4wFhAsh64rRMvbIloWlkZQTKll0YMkiX9B7GktWIBG3EYeEaBx9pBN/mp6d
 kT3W3s/WMslOtpD+XmZZhIU5H6HF1YVzgiCRx1r5gtnzhuKgWCJeDbmmO+7OtuACRMke
 6exidYsgpl/KVejEHT6/8RicuBkomi0S+DEq5J9UMTJZCV1TlqlKGf9MFz4ulUr44baV
 LwNmwjAUVx2Qty2U9WZ+LjoQlibHQDl1qUfureS9349VnkyVrRS33nPsOF4QCJ/TbyCb
 A7MA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
 bh=DmWp0uy89TPiPu8UitGlfJ4fqSkdwaIvyUKOGTjMH64=;
 b=jU+YaPvrqjKtxJ48FbnCpywRetiCiuyo+/hrGPGwbBP9RyBmTQEmUc8hvzCNvUndCa
 3PSJVXmhbyIjUT7bM+ylONkaLmd/hxjdom/rWSiGXX3hDM4c1daqmMGme1EjyZsasTV0
 35mzUjkUfEvviXlUbpGAnKJvl5T/mv9t9mhDHwcUSH53QqIoH3exT2qqBHTd+1xgWPYS
 7ny7q2esqA7BteUD6SQaKM0Rs+BYlc3E0NZAd/bV2Iv0V7iF+xdN8Kym9TyGk2VZFRMB
 oKbDXz1vI0k+a7RTh6FXmRGjQB+c9OPBYIveNx2LtsC5+cWzMe3MU8j5zmcMcL0Sa3wU
 RTLw==
X-Gm-Message-State: ACgBeo2Edg2pfZPu6u1ComAEHeGQ8+t24GlYVt/uJfVxOrLnX+CzBHsf
 qAB2vFaT8PbChqqX1rrcYenyqQ==
X-Google-Smtp-Source: AA6agR5hHY+fHNqo/gdZ/EZ8YGOmmPyul82vutyOnOKxJAy7wMl2zDQ+NeqSduUJQeETIrW4SSX09w==
X-Received: by 2002:a05:6512:114a:b0:492:84b9:b376 with SMTP id
 m10-20020a056512114a00b0049284b9b376mr7693639lfg.450.1661199499063; 
 Mon, 22 Aug 2022 13:18:19 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125]) by smtp.gmail.com with ESMTPSA id
 h16-20020a2e5310000000b0025e5cd1620fsm2000429ljb.57.2022.08.22.13.18.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 22 Aug 2022 13:18:18 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Andy Gross <agross@kernel.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Konrad Dybcio <konrad.dybcio@somainline.org>,
 Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Subject: [PATCH v3 9/9] dt-bindings: display/msm/dpu-common: add opp-table
 property
Date: Mon, 22 Aug 2022 23:18:08 +0300
Message-Id: <20220822201808.347783-10-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220822201808.347783-1-dmitry.baryshkov@linaro.org>
References: <20220822201808.347783-1-dmitry.baryshkov@linaro.org>
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

The display controller node can contain the opp-table describing its
frequencies and OPP levels. Allow specifying the opp-table in the DPU
devices.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 Documentation/devicetree/bindings/display/msm/dpu-common.yaml | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/msm/dpu-common.yaml b/Documentation/devicetree/bindings/display/msm/dpu-common.yaml
index 14eda883e149..42e1616a5670 100644
--- a/Documentation/devicetree/bindings/display/msm/dpu-common.yaml
+++ b/Documentation/devicetree/bindings/display/msm/dpu-common.yaml
@@ -22,6 +22,9 @@ properties:
 
   operating-points-v2: true
 
+  opp-table:
+    type: object
+
   ports:
     $ref: /schemas/graph.yaml#/properties/ports
     description: |
-- 
2.35.1

