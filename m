Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AFF54596967
	for <lists+dri-devel@lfdr.de>; Wed, 17 Aug 2022 08:21:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 79CFA10F3F1;
	Wed, 17 Aug 2022 06:21:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com
 [IPv6:2a00:1450:4864:20::134])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BCBF510F3EC
 for <dri-devel@lists.freedesktop.org>; Wed, 17 Aug 2022 06:21:05 +0000 (UTC)
Received: by mail-lf1-x134.google.com with SMTP id o2so17818945lfb.1
 for <dri-devel@lists.freedesktop.org>; Tue, 16 Aug 2022 23:21:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc;
 bh=Rog7VYeMn/H1upxCLx+q6vp1wAOAowOxeUWllio/J+g=;
 b=ohqj3a4wQTZovUqZLXp0xogsdNViPOwIVNpJWuEO+ZFnqPEjENqa8/y9Njr3Q//40U
 TNLlbTVOvUCNiQLwN2x/J1WIIKM8c/96PKMnq6zqFuJn2B44XdFT9zmFqCqHUreNQfOK
 McQNiprU/MPm74wZHTSbjB3t/1ywKvykUhHSGoJaO62amY2dNXItbRtIg8h7y/3YN4xS
 mUunFDU009YYzQH6r//SVQo/O7ksDseS+Ohlpyir5AxwLO3kV22tWB+LRfJ4k+oiXGyI
 qNw52OctYbcWor8BhTvaSezooXENy8Q/8VwNhULHMHAolZVmRSsnixriqIC3tlfBqOP3
 UgSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
 bh=Rog7VYeMn/H1upxCLx+q6vp1wAOAowOxeUWllio/J+g=;
 b=wmqJQylzqzE+Mt0/iFagy6IzI5ZlcF2ceuw+zyJ6s+cOIHcf1OuOZ7+JAJGtj2nd4Z
 v3kACF6H+KyryrJkl9gvyWD+HfXLayWOpX/wwB1UKAIniU9zPbKN8YbRF1Db0JDeDJd0
 2RdmJHzYT6gfmGdVRtsQwTT/yCiX5EDJIcuVqTWr5biG8a9aX9YpB3PIyagNbTmYxzLi
 FNrdaDRFoddTdKXmAyS9PkVo4rZ6ceTcIHn2UFylC2750x6uuhgxKIoXwCDqVWUlBytW
 sPVlqoF83jT1AQLy/HnRvVOYZi4hX6/qViI8ecGfZ/fACqkihEcpU8hh3Y+3S00zMzkR
 8oaQ==
X-Gm-Message-State: ACgBeo2uPY9xFSt2kxAwCza15sIRDNQiCI53fgSOP0xLi2itjD+ZDeT1
 rnNgkaKi9YY54vj1pZJCvIwsQw==
X-Google-Smtp-Source: AA6agR6BAB8xPf0LrOTlk1zGcSN5EKe1DwN3DW738X4J95hxDOhdrCqha1LTmLKF7/67PQFthUeckA==
X-Received: by 2002:a05:6512:13a4:b0:477:a28a:2280 with SMTP id
 p36-20020a05651213a400b00477a28a2280mr7695629lfa.689.1660717264108; 
 Tue, 16 Aug 2022 23:21:04 -0700 (PDT)
Received: from krzk-bin.. (d15l54h48cw7vbh-qr4-4.rev.dnainternet.fi.
 [2001:14bb:ae:539c:1b1c:14b7:109b:ed76])
 by smtp.gmail.com with ESMTPSA id
 u27-20020ac258db000000b0048b0062a14fsm1581002lfo.144.2022.08.16.23.21.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 16 Aug 2022 23:21:03 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Sean Paul <sean@poorly.run>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Del Regno <angelogioacchino.delregno@somainline.org>,
 Loic Poulain <loic.poulain@linaro.org>,
 Krishna Manikandan <quic_mkrishn@quicinc.com>,
 Jami Kettunen <jami.kettunen@somainline.org>,
 Stephen Boyd <swboyd@chromium.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH v2 1/5] dt-bindings: display/msm: dpu-msm8998: add missing DPU
 opp-table
Date: Wed, 17 Aug 2022 09:20:55 +0300
Message-Id: <20220817062059.18640-2-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220817062059.18640-1-krzysztof.kozlowski@linaro.org>
References: <20220817062059.18640-1-krzysztof.kozlowski@linaro.org>
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

The 'display-controller' child (DPU) of Display SubSystem (MDSS) uses
opp-table, so reference it which allows restricting DPU schema to fixed
list of properties.

Fixes: 6e986a8f1cf1 ("dt-bindings: display: msm: Add binding for msm8998 dpu")
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

---

Cc: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Rob Clark <robdclark@gmail.com>
Cc: Sean Paul <sean@poorly.run>
Cc: Abhinav Kumar <quic_abhinavk@quicinc.com>
---
 .../devicetree/bindings/display/msm/dpu-msm8998.yaml          | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/msm/dpu-msm8998.yaml b/Documentation/devicetree/bindings/display/msm/dpu-msm8998.yaml
index 2df64afb76e6..253665c693e6 100644
--- a/Documentation/devicetree/bindings/display/msm/dpu-msm8998.yaml
+++ b/Documentation/devicetree/bindings/display/msm/dpu-msm8998.yaml
@@ -62,6 +62,7 @@ patternProperties:
   "^display-controller@[0-9a-f]+$":
     type: object
     description: Node containing the properties of DPU.
+    additionalProperties: false
 
     properties:
       compatible:
@@ -105,6 +106,9 @@ patternProperties:
         maxItems: 1
 
       operating-points-v2: true
+      opp-table:
+        type: object
+
       ports:
         $ref: /schemas/graph.yaml#/properties/ports
         description: |
-- 
2.34.1

