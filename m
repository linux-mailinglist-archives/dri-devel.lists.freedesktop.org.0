Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D9306620424
	for <lists+dri-devel@lfdr.de>; Tue,  8 Nov 2022 00:57:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 268EF10E3E6;
	Mon,  7 Nov 2022 23:57:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com
 [IPv6:2a00:1450:4864:20::432])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3EA3110E1F2
 for <dri-devel@lists.freedesktop.org>; Mon,  7 Nov 2022 23:56:59 +0000 (UTC)
Received: by mail-wr1-x432.google.com with SMTP id z14so18517386wrn.7
 for <dri-devel@lists.freedesktop.org>; Mon, 07 Nov 2022 15:56:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=pgeozmPZqS6JXtBUtzz0XCzNbXeI8NLd/9teAZZ3ZoU=;
 b=Kr118oU3tWMRM9OSMDTcbOgWvtcP8ZX+qbTofQqOopNwYkeh3XrjPqa6V6VvNQvFvT
 buMppsTMAE9msYo92KDfPVh4w5Q5AkJkHxjoo21UDk4HoO7m0d+X3pqvW+c9s27zN6ji
 eAigHkl7x8GNbTxMKA3UOLEG7iPFPB5grRdVTKEncCeZQ4X7dPzTrZgrBEm0vuImwSdf
 GynTlyZRoiHPwRx0Z62w3A3uNl1VwtLVYX2fPCBpcT5fsD8hh1uopYrAGpCFro0X4IpW
 qvF8BiG7AS+gO99UC3oUTN0mzWxrLTASTXcJ5NIw9J/z7pW88w5/W7GxGgtLNFgJgOGz
 AwPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=pgeozmPZqS6JXtBUtzz0XCzNbXeI8NLd/9teAZZ3ZoU=;
 b=UVtiB1gumV73iXll6J3Lkn4dFHgqBak0tCjXjxreS/iBLb4Y9likQLYl+EKLgN9NMN
 8cxJyUIQtmDe58lrQUytDsS2L7b4uZIY01xUe83CO+KR2Ir9vFvBeullUcLF/skIMcvb
 vWqx0Kzc/RhRO/KQe22Zzbr2Sa3T+jU6XAMnwhhVLp46yXup+qfnPyldB87EbOVKgTfH
 mJRZZd/oPu6L/7Or3uqlIxrk/QZF0E8SfhC5h56f3WjQ0YES5yCIGsnQC/cOX/Grp/tC
 774KYGsmNlL2rBOmxHkla5auffm/w6ioUpPHfG8SE0Wk7MnGSwb22QlKwQfD9o3qHW6Z
 DzPQ==
X-Gm-Message-State: ACrzQf03x9Jb9K31VtcASixjlfEP1VCStpBZ8uKKZAT1gpIC3JyPv3Kd
 LXjgWe0WDKUitfavDtov29muMg==
X-Google-Smtp-Source: AMsMyM6a2iAeeRzZq19eqEqkJIwF+xt4p4o6N4GE+PRqYk+U2IE/mi3aZrpaVlpQnpPKNsKNm05xHQ==
X-Received: by 2002:adf:e44f:0:b0:236:59a3:c5a8 with SMTP id
 t15-20020adfe44f000000b0023659a3c5a8mr34097585wrm.396.1667865417559; 
 Mon, 07 Nov 2022 15:56:57 -0800 (PST)
Received: from sagittarius-a.chello.ie (188-141-3-169.dynamic.upc.ie.
 [188.141.3.169]) by smtp.gmail.com with ESMTPSA id
 b18-20020a056000055200b00236545edc91sm8386161wrf.76.2022.11.07.15.56.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 07 Nov 2022 15:56:57 -0800 (PST)
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
To: robdclark@gmail.com, quic_abhinavk@quicinc.com,
 dmitry.baryshkov@linaro.org, krzysztof.kozlowski+dt@linaro.org,
 robh+dt@kernel.org, quic_mkrishn@quicinc.com, linux-arm-msm@vger.kernel.org
Subject: [PATCH v2 01/18] dt-bindings: msm: dsi-controller-main: Fix
 operating-points-v2 constraint
Date: Mon,  7 Nov 2022 23:56:37 +0000
Message-Id: <20221107235654.1769462-2-bryan.odonoghue@linaro.org>
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
Cc: freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>, Sean Paul <sean@poorly.run>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The existing msm8916.dtsi does not depend on nor require operating points.

Fixes: 4dbe55c97741 ("dt-bindings: msm: dsi: add yaml schemas for DSI bindings")
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
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
 .../devicetree/bindings/display/msm/dsi-controller-main.yaml     | 1 -
 1 file changed, 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml b/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml
index 7782bff89afc7..27ebfd5ffb22f 100644
--- a/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml
+++ b/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml
@@ -135,7 +135,6 @@ required:
   - assigned-clocks
   - assigned-clock-parents
   - power-domains
-  - operating-points-v2
   - ports
 
 additionalProperties: false
-- 
2.38.1

