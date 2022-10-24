Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 13A7860B22A
	for <lists+dri-devel@lfdr.de>; Mon, 24 Oct 2022 18:43:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B41F310E518;
	Mon, 24 Oct 2022 16:42:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com
 [IPv6:2a00:1450:4864:20::134])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0BD2310E47B
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Oct 2022 16:42:31 +0000 (UTC)
Received: by mail-lf1-x134.google.com with SMTP id o12so17663110lfq.9
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Oct 2022 09:42:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=+VYxtSYA5OyiLl7gExkakIULMtqhutc086nOHC83lPk=;
 b=HFFQDxotzuNiu8RiJP4Gcbz0q1l3BTViLA2nQ4jWsD6PzrLWlbdmHhKCZ//WmWiOCN
 9supODfnHHTbGImqBByUJbUnzmOpyig+fzdr0XdxJ3fW7ISUTo0SWg51VQ3e8ws6XhWv
 bs02XtACIMdv6EvIJyqbz2Bvqknxy2GRm2xNn4wyJTIA54wMmmxagIPogQ9WzJ6eKnAv
 bOoZsLA3D1sPxRlZwqAh6BLn3Tb6pDpdS07MS1Btn5Iy/fiYGtaLdwJ5osBZQgdOOFS4
 Z4HBSRdAQwgSP6VErV+SnV9X9WARsaqaSasbfv6G6hVGXF4y6RsprKHlDlK8Mrpjhz3T
 7hpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=+VYxtSYA5OyiLl7gExkakIULMtqhutc086nOHC83lPk=;
 b=p8T4EvqY7U65bfHL5xx5e/hhQWvpgFqFfnYcJ1xiixdTShh9ij/1Ewyl2XIfQFZGkY
 44uLxa7s+J4O3g2puxYX75AM53ix24eJwVA35EoGKwKWkZbUALI73pA9rw9cPuNvTFeI
 qwaV9IwN14ySlrzBi9PDFrzzPXf//bzOiokqcWA5Ap3lKAOrvbZwoAbqeypITKK2lOXw
 e6iwXNp1EpuXO221eYFWaKP9UPJ4YM1LyzlWBIMRe3O97gVm0T/ubcemKiUQC1FwLWze
 GV9JaWV+QqNdsaPS92AeNLhgEtj1kDz2assfozKLYndXKbrz3ElRs3F0HB7xjBS0vuZr
 hRrA==
X-Gm-Message-State: ACrzQf3VPodb3zG6G/lXEsOG31Kl86dNuiCGs8bvTXpGsYE8uEGeNIJ7
 8yTdTtUTsqkCsHJYUQKheS/pmQ==
X-Google-Smtp-Source: AMsMyM5BRHjEkq3n83PTrgXkm0oWcI0sJAz9goPedeo+9H/tq8jRiCugAs+CHvVPNaKZcLOutCrqtg==
X-Received: by 2002:a05:6512:31d3:b0:4a2:5c39:d446 with SMTP id
 j19-20020a05651231d300b004a25c39d446mr13147231lfe.591.1666629749244; 
 Mon, 24 Oct 2022 09:42:29 -0700 (PDT)
Received: from eriador.unikie.fi ([192.130.178.91])
 by smtp.gmail.com with ESMTPSA id
 k14-20020ac2456e000000b004948378080csm4593978lfm.290.2022.10.24.09.42.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 24 Oct 2022 09:42:28 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@somainline.org>,
 Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Subject: [PATCH v9 03/12] dt-bindings: display/msm: add interconnects property
 to qcom, mdss-smd845
Date: Mon, 24 Oct 2022 19:42:16 +0300
Message-Id: <20221024164225.3236654-4-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20221024164225.3236654-1-dmitry.baryshkov@linaro.org>
References: <20221024164225.3236654-1-dmitry.baryshkov@linaro.org>
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
Cc: devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Stephen Boyd <swboyd@chromium.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add interconnects required for the SDM845 MDSS device tree node. This
change was made in the commit c8c61c09e38b ("arm64: dts: qcom: sdm845:
Add interconnects property for display"), but was not reflected in the
schema.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 .../devicetree/bindings/display/msm/dpu-sdm845.yaml    | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/msm/dpu-sdm845.yaml b/Documentation/devicetree/bindings/display/msm/dpu-sdm845.yaml
index 3cb2ae336996..a87deea8e9bc 100644
--- a/Documentation/devicetree/bindings/display/msm/dpu-sdm845.yaml
+++ b/Documentation/devicetree/bindings/display/msm/dpu-sdm845.yaml
@@ -57,6 +57,16 @@ properties:
 
   ranges: true
 
+  interconnects:
+    items:
+      - description: Interconnect path from mdp0 port to the data bus
+      - description: Interconnect path from mdp1 port to the data bus
+
+  interconnect-names:
+    items:
+      - const: mdp0-mem
+      - const: mdp1-mem
+
   resets:
     items:
       - description: MDSS_CORE reset
-- 
2.35.1

