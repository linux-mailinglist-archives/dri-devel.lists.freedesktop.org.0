Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E782620444
	for <lists+dri-devel@lfdr.de>; Tue,  8 Nov 2022 00:57:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 41B9210E3FA;
	Mon,  7 Nov 2022 23:57:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com
 [IPv6:2a00:1450:4864:20::32d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 31D2810E320
 for <dri-devel@lists.freedesktop.org>; Mon,  7 Nov 2022 23:57:04 +0000 (UTC)
Received: by mail-wm1-x32d.google.com with SMTP id t4so7805967wmj.5
 for <dri-devel@lists.freedesktop.org>; Mon, 07 Nov 2022 15:57:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=gmRVXehGl7BjVeULyOgQDE3jzh0cHlXlniJb8HTQ51k=;
 b=b9oxJUNpC76hFseEBEJhcEq0HY8cJBySOrChqrDYugbyPtlpk+wLm6oq1kfH05gF6J
 d/R+goe9J1Zko2jsaYSD9fogNuZepgTLKm6sD+mjPwKefVv3S9PLVMNUBHzDAW7ZLUkc
 GF+8r0ug21/ffp0ijykY5l1qguDPv+Dw3ebR78F5nGX6z1UNC92e6QbEK5IOXR1d4EPN
 jtp4HA/RJ463sgCzYa2k667E8EvzZjVrMF2YBzbAY5wF5pK1IOQS38dlHUt85TciJJQb
 5ionRofZELysr4Mfq6x+De1yoCfXfKQMmSGQ06i/muFRmNxS4zKOuUPam3rFzvu69X9A
 /YJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=gmRVXehGl7BjVeULyOgQDE3jzh0cHlXlniJb8HTQ51k=;
 b=NDj4H9NoUXWDR5EmaEDJGhVbIOBaubWzoEb0YCgCPJl+nQUaAJcMq3lMdnFYPSxNWJ
 LqW38Vv6Sqz9VjvQ/FHslZ7Dk7zov/07OJdkyDyUayINxdi4qHuJPUXEYNGokSn9NWuv
 Trjdb1xP0KmhjSTBcc+jcxf1wrdU4SlrT+iOeQywfx+Sa1E/pV+3QrS4y8Lp5GSkSjc0
 GZte1qyXyhcAWdDhS9iXWHdZnoLI+wRpncE3drw7xcMwdGsk4JBv3dmIAnLr0hQEyK8B
 BDrZssyNXGxVcvR68zzp3lmKQ6Don+WnJIXTw46UsnsyK2Pepr7exm2SaJjtDg+zWE4q
 Y8FQ==
X-Gm-Message-State: ANoB5pmqK1ysskyog4R8iLh2RCBt1QNeuawLJZ2+Z1eOybjnXuQSKJ0f
 kCesNOmSa5t75YK5HjENGsaN+A==
X-Google-Smtp-Source: AA0mqf4HO3FJtOGQ+2GOf7xGG6RzopIwB5XDIIFs67J5E0Or1hcP24cv6MjDbyT9V6+Is5ZVcJRz5w==
X-Received: by 2002:a1c:4c14:0:b0:3cf:add8:3fe5 with SMTP id
 z20-20020a1c4c14000000b003cfadd83fe5mr4501746wmf.55.1667865423015; 
 Mon, 07 Nov 2022 15:57:03 -0800 (PST)
Received: from sagittarius-a.chello.ie (188-141-3-169.dynamic.upc.ie.
 [188.141.3.169]) by smtp.gmail.com with ESMTPSA id
 b18-20020a056000055200b00236545edc91sm8386161wrf.76.2022.11.07.15.57.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 07 Nov 2022 15:57:02 -0800 (PST)
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
To: robdclark@gmail.com, quic_abhinavk@quicinc.com,
 dmitry.baryshkov@linaro.org, krzysztof.kozlowski+dt@linaro.org,
 robh+dt@kernel.org, quic_mkrishn@quicinc.com, linux-arm-msm@vger.kernel.org
Subject: [PATCH v2 06/18] dt-bindings: msm: dsi-controller-main:
 Alphanumerically sort compatible enum
Date: Mon,  7 Nov 2022 23:56:42 +0000
Message-Id: <20221107235654.1769462-7-bryan.odonoghue@linaro.org>
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

Sort the order of the compatible strings alphanumerically.

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
index a607ccd4a905a..b35130a77b43e 100644
--- a/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml
+++ b/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml
@@ -15,8 +15,8 @@ allOf:
 properties:
   compatible:
     enum:
-      - qcom,mdss-dsi-ctrl
       - qcom,dsi-ctrl-6g-qcm2290
+      - qcom,mdss-dsi-ctrl
 
   reg:
     maxItems: 1
-- 
2.38.1

