Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B0B2E7CB85D
	for <lists+dri-devel@lfdr.de>; Tue, 17 Oct 2023 04:19:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 760F510E24F;
	Tue, 17 Oct 2023 02:18:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-x733.google.com (mail-qk1-x733.google.com
 [IPv6:2607:f8b0:4864:20::733])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0E35510E0C2;
 Tue, 17 Oct 2023 02:18:50 +0000 (UTC)
Received: by mail-qk1-x733.google.com with SMTP id
 af79cd13be357-77575233636so367441085a.2; 
 Mon, 16 Oct 2023 19:18:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1697509129; x=1698113929; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=PIKmGdB/3utN+fo5YOdVXRGf1bdkoiZsUcVvijZ0k1o=;
 b=TmNjCAcA2AUAGLQ1N4smVE0Jw+TWKclSkUD4tBiIVzaBAkFjKIovw3MQ+ngU8BiLMT
 jtA5l4UBtxn/TQk2TTrsvSq+mFwzlvri6U5vxvK6wuNSsq21N2cUE/oiJ8R7ZcVNvub1
 rIySrrH0ZF75xLN0Gimg/Ejqv/iAW8tbhqiwvTMZv+7Ke8hsuUlHiJv1H7x+2BzkcP6b
 hreb8GverbiCCj6zWH+FG1kOe3XEpl3NC2ASHBYCKXbdvaEuuGiBsqoaD+qXgGHQ5ENi
 mSXBTx+4UstofULiSdv6voQyUO189s5ClG8j9TZw/6aw31I5WFexsWuXXl3Z2cblHXX/
 6tgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1697509129; x=1698113929;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=PIKmGdB/3utN+fo5YOdVXRGf1bdkoiZsUcVvijZ0k1o=;
 b=sS0Pemi7ppI7N8WZY9/GQPdwxYJ3TjRJJNT4nO9OswJ8XQM9ikPkBJOkJ61b7g8xyT
 bTN9vqttiKqwP39+UZ8WKm2GYV+Jpd96T+4ux52552KjXDkJIM5Klvkt2JQOEHB5Hbvh
 5DeQciTDN5RuDvhQ/aa2u9DRA59KlgPOEOVIjYXD255Uwz8iYCbO4ffCg1MqUn6tQjGq
 vNbc/77dcHBRakXvKhyOjnFFMEfushW5sHx9zvdZ7rnWbWlej5fqAYK1MxUVOeJmb1ta
 2zgWP8YLlXcotiQZqK0ejY9+aMohZadJAlk7D+rZn+WbYwUBaikVEIQ2DHH2FGorC4op
 UKew==
X-Gm-Message-State: AOJu0YzDWnF/N4B3yCGM3i7SS8aHfxK1RqqwiJ9IUG0/wcaj2dKR6/G4
 R38U3vS4FtPX6i9o/hIapKY=
X-Google-Smtp-Source: AGHT+IHpRD3a9ueahU+jRZLNE34fhI0ZI8veKo0aNfBNElwBxT6JyjTInXYGTu1Yvsw4H8hWRbm/jQ==
X-Received: by 2002:a05:620a:1aa1:b0:775:7f6e:1af7 with SMTP id
 bl33-20020a05620a1aa100b007757f6e1af7mr1170399qkb.24.1697509129074; 
 Mon, 16 Oct 2023 19:18:49 -0700 (PDT)
Received: from localhost ([2607:fea8:529e:7800::1d3d])
 by smtp.gmail.com with ESMTPSA id
 s4-20020a05620a080400b00775838e79f8sm245591qks.134.2023.10.16.19.18.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 16 Oct 2023 19:18:48 -0700 (PDT)
From: Richard Acayan <mailingradian@gmail.com>
To: Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Andy Gross <agross@kernel.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Kuogee Hsieh <quic_khsieh@quicinc.com>,
 Vinod Polimera <quic_vpolimer@quicinc.com>,
 Ryan McCann <quic_rmccann@quicinc.com>,
 Jessica Zhang <quic_jesszhan@quicinc.com>,
 Liu Shixin <liushixin2@huawei.com>,
 Krishna Manikandan <quic_mkrishn@quicinc.com>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org
Subject: [PATCH v4 2/6] dt-bindings: display/msm: sdm845-dpu: Describe SDM670
Date: Mon, 16 Oct 2023 22:18:09 -0400
Message-ID: <20231017021805.1083350-11-mailingradian@gmail.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231017021805.1083350-9-mailingradian@gmail.com>
References: <20231017021805.1083350-9-mailingradian@gmail.com>
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
Cc: Richard Acayan <mailingradian@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The SDM670 display controller has the same requirements as the SDM845
display controller, despite having distinct properties as described in
the catalog. Add the compatible for SDM670 to the SDM845 controller.

Acked-by: Rob Herring <robh@kernel.org>
Signed-off-by: Richard Acayan <mailingradian@gmail.com>
---
 .../devicetree/bindings/display/msm/qcom,sdm845-dpu.yaml      | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/display/msm/qcom,sdm845-dpu.yaml b/Documentation/devicetree/bindings/display/msm/qcom,sdm845-dpu.yaml
index b917064bdf33..dc11fd421a27 100644
--- a/Documentation/devicetree/bindings/display/msm/qcom,sdm845-dpu.yaml
+++ b/Documentation/devicetree/bindings/display/msm/qcom,sdm845-dpu.yaml
@@ -13,7 +13,9 @@ $ref: /schemas/display/msm/dpu-common.yaml#
 
 properties:
   compatible:
-    const: qcom,sdm845-dpu
+    enum:
+      - qcom,sdm670-dpu
+      - qcom,sdm845-dpu
 
   reg:
     items:
-- 
2.42.0

