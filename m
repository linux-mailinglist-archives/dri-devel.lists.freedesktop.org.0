Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 24A9A62043C
	for <lists+dri-devel@lfdr.de>; Tue,  8 Nov 2022 00:57:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2A43E10E3F0;
	Mon,  7 Nov 2022 23:57:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com
 [IPv6:2a00:1450:4864:20::334])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AD37410E1F2
 for <dri-devel@lists.freedesktop.org>; Mon,  7 Nov 2022 23:57:02 +0000 (UTC)
Received: by mail-wm1-x334.google.com with SMTP id
 p13-20020a05600c468d00b003cf8859ed1bso8106762wmo.1
 for <dri-devel@lists.freedesktop.org>; Mon, 07 Nov 2022 15:57:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=qAGk+nNjornIMJdpYZzX61c9uY3N5rhRbOvAyl/cRcI=;
 b=LKioUSDnQg6JaddBnL63Lvmeo9cXsgp+4PaRCdFRfMnp/G4E2SBh+Qr+90ot0vORsd
 cBm8vJ85nbF0KcTfTBQBZxui99mITeSt+MZzajkr5y51i31J0bYbzHwD1sWa3A1eD7Yt
 CyjEpBu1c2iLGLA2hxgZmTGlThJWCRZwFA3DDM/OCbrIjbpoujOWDjtv6RETaymWOvWc
 86cxoz4lQfZI6CvxvXy8bkHiJtwubeU0934p5lAVNhvUy7WgAKCLP2Jp5K1QnSsQtU3V
 Ddxm6ZleedqzdeXbYDXx8LbNnahwT6OJ+avsNARdNePDPwuD7Ng3x5KSt84TBIRT0pZP
 WYQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=qAGk+nNjornIMJdpYZzX61c9uY3N5rhRbOvAyl/cRcI=;
 b=GMTaMJu+yHR1bdwYCXSFCp4+huH7bCDLLiSDWW4xIPPxobsmKbOIiv5Zbu1Qd/LMQq
 xKt1qQotPrNv7KtCO1sV67cq9wkKrWoomnaKobCAYmM5/kQKKV48B+0yjM+4zEpd10ji
 1j/hTM5pFyNVGLyGITSKbJBRhJD7Yl2NmA6b1FICZhdz4V1Bk491sn/Mr4wY2UfA2nq1
 WpPL76RcStgvPVCiy9rM9y39ck1uBHBlfHGns5bqc3lwtSvo/XVBwyNR/CLykI4eZIUK
 zeLnFDHBnrtClQ3aXAxEnTO7X032oXBnbzKLB8+rPXsmfoQj4+I09QPTqsRRYiL1ou8h
 3rjw==
X-Gm-Message-State: ACrzQf06PEklLH7xSDZFCMetswxzYMQESURXzmsL1ufJysyf8w2xG7L2
 UTivzJpM++JUGmzE4a4Gj6tcYg==
X-Google-Smtp-Source: AMsMyM5502aGtya1hfA844I0triX6tm96lgDwjECnjdG0GR1QyLeZz1LBUlYaM1trZYKftrwY96Ldw==
X-Received: by 2002:a1c:35c9:0:b0:3c3:d9a:385f with SMTP id
 c192-20020a1c35c9000000b003c30d9a385fmr34399577wma.139.1667865420946; 
 Mon, 07 Nov 2022 15:57:00 -0800 (PST)
Received: from sagittarius-a.chello.ie (188-141-3-169.dynamic.upc.ie.
 [188.141.3.169]) by smtp.gmail.com with ESMTPSA id
 b18-20020a056000055200b00236545edc91sm8386161wrf.76.2022.11.07.15.56.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 07 Nov 2022 15:57:00 -0800 (PST)
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
To: robdclark@gmail.com, quic_abhinavk@quicinc.com,
 dmitry.baryshkov@linaro.org, krzysztof.kozlowski+dt@linaro.org,
 robh+dt@kernel.org, quic_mkrishn@quicinc.com, linux-arm-msm@vger.kernel.org
Subject: [PATCH v2 04/18] dt-bindings: msm: dsi-controller-main: Fix clock
 declarations
Date: Mon,  7 Nov 2022 23:56:40 +0000
Message-Id: <20221107235654.1769462-5-bryan.odonoghue@linaro.org>
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

When converting from .txt to .yaml dt-binding descriptions we appear to
have missed some of the previous detail on the number and names of
permissible clocks.

Fixes: 4dbe55c97741 ("dt-bindings: msm: dsi: add yaml schemas for DSI bindings")
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
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
 .../bindings/display/msm/dsi-controller-main.yaml         | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml b/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml
index 0f7747e55b9be..cab38a20a54b0 100644
--- a/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml
+++ b/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml
@@ -35,6 +35,10 @@ properties:
       - description: Display escape clock
       - description: Display AHB clock
       - description: Display AXI clock
+      - description: Core MultiMedia SubSystem clock
+      - description: MDP Core clock
+      - description: MNOC clock
+    minItems: 6
 
   clock-names:
     items:
@@ -44,6 +48,10 @@ properties:
       - const: core
       - const: iface
       - const: bus
+      - const: core_mmss
+      - const: mdp_core
+      - const: mnoc
+    minItems: 6
 
   phys:
     maxItems: 1
-- 
2.38.1

