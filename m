Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B43E62043F
	for <lists+dri-devel@lfdr.de>; Tue,  8 Nov 2022 00:57:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1951E10E3F1;
	Mon,  7 Nov 2022 23:57:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com
 [IPv6:2a00:1450:4864:20::32c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C47B110E320
 for <dri-devel@lists.freedesktop.org>; Mon,  7 Nov 2022 23:57:03 +0000 (UTC)
Received: by mail-wm1-x32c.google.com with SMTP id p16so7819860wmc.3
 for <dri-devel@lists.freedesktop.org>; Mon, 07 Nov 2022 15:57:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=7/l0ZArM5aYLACoVmmcFP9wBttR3aaNtl9/MPOMSmmw=;
 b=Xe2BXEA8czrlM0BrgYSbdDgxtV/SeozvhiiL/+B3EhdSDp+vlE/fsBjKAgyWxcGAvj
 +o68P+10dkRhRQkepfpRIgGSUadpp4mj/mYrc6GKO5LVfQ/O3Atin5cu//D6POLSlZ9P
 +UXKxXZ83k41SO3o8mbdRW8K36fcE1monc8f4gDh6ajwVdM48/GjcygT8zgwZOzAhJ48
 LpvmGdyvY/9ydFj3Efce0NQx0xMnEefEcsa6xmSSUti55h64SoGPqEYT4yw4mDAjfDid
 vu8jaygzOS2uiHyJ+I5s4P2b9hOboupXMtLktDvpjJrbDNs/tPzVr7VREM5ySgBMwzKv
 mdkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=7/l0ZArM5aYLACoVmmcFP9wBttR3aaNtl9/MPOMSmmw=;
 b=3iDY6r9UDgCk45eI29wS6p66jc5vkhk/axN8AL+bUtUbMnLlso/bl0EEpSgHRlHqr4
 FWuTF5uHJ4ONtroMCcSJoELIsoa5tVmfyJrLfp0hCuLrk54JIQxfoAoa6Cps4fJubtNv
 /0f4m135Yc/fKleX/9oek4tEGLZp9vfTBvOqGjaZnUqzzBaHbDIWMdcDUMiG3stdBVxu
 5yFgMTmc9+VQYleow0sWdXQoR0+6srNEROGTZnftIZGG01aSNtmTeQ9qySX1Z+7FD+NS
 ZmG9Mzmc/oI8FRrcBjDdmhY1/60ucsGOQjqoclWCL50NwEVZudHGke0Sf60MI7kzhpjw
 lQNQ==
X-Gm-Message-State: ACrzQf0BqKsE16tvXpSTktjpT933DEz5iJuJC0U9mCKGUZN/vuaQvrxX
 HpoDCdVDM2LBtFQu3acoD1Gywg==
X-Google-Smtp-Source: AMsMyM4RsIxnEQQgvUP/I7yIWjJa3J7nqUYK5Wno5u2oQWHF/Fo/KzsU5pisEHMnS9Z91zGF3qYjwg==
X-Received: by 2002:a05:600c:6885:b0:3c4:de24:638 with SMTP id
 fn5-20020a05600c688500b003c4de240638mr45123390wmb.183.1667865421987; 
 Mon, 07 Nov 2022 15:57:01 -0800 (PST)
Received: from sagittarius-a.chello.ie (188-141-3-169.dynamic.upc.ie.
 [188.141.3.169]) by smtp.gmail.com with ESMTPSA id
 b18-20020a056000055200b00236545edc91sm8386161wrf.76.2022.11.07.15.57.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 07 Nov 2022 15:57:01 -0800 (PST)
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
To: robdclark@gmail.com, quic_abhinavk@quicinc.com,
 dmitry.baryshkov@linaro.org, krzysztof.kozlowski+dt@linaro.org,
 robh+dt@kernel.org, quic_mkrishn@quicinc.com, linux-arm-msm@vger.kernel.org
Subject: [PATCH v2 05/18] dt-bindings: msm: dsi-controller-main: Fix
 description of core clock
Date: Mon,  7 Nov 2022 23:56:41 +0000
Message-Id: <20221107235654.1769462-6-bryan.odonoghue@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221107235654.1769462-1-bryan.odonoghue@linaro.org>
References: <20221107235654.1769462-1-bryan.odonoghue@linaro.org>
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
Cc: Sean Paul <sean@poorly.run>, devicetree@vger.kernel.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

There's a typo in describing the core clock as an 'escape' clock. The
accurate description is 'core'.

Fixes: 4dbe55c97741 ("dt-bindings: msm: dsi: add yaml schemas for DSI bindings")
Cc: Rob Clark <robdclark@gmail.com>
Cc: Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Sean Paul <sean@poorly.run>
Cc: David Airlie <airlied@gmail.com>
Cc: Daniel Vetter <daniel@ffwll.ch>
Cc: Rob Herring <robh+dt@kernel.org>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc: linux-arm-msm@vger.kernel.org
Cc: dri-devel@lists.freedesktop.org
Cc: freedreno@lists.freedesktop.org
Cc: devicetree@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
 .../devicetree/bindings/display/msm/dsi-controller-main.yaml    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml b/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml
index cab38a20a54b0..a607ccd4a905a 100644
--- a/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml
+++ b/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml
@@ -32,7 +32,7 @@ properties:
       - description: Display byte clock
       - description: Display byte interface clock
       - description: Display pixel clock
-      - description: Display escape clock
+      - description: Display core clock
       - description: Display AHB clock
       - description: Display AXI clock
       - description: Core MultiMedia SubSystem clock
-- 
2.38.1

