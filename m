Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7328B562CB0
	for <lists+dri-devel@lfdr.de>; Fri,  1 Jul 2022 09:33:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6787110F36E;
	Fri,  1 Jul 2022 07:33:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com
 [IPv6:2a00:1450:4864:20::430])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8133911A2AA
 for <dri-devel@lists.freedesktop.org>; Thu, 30 Jun 2022 12:08:53 +0000 (UTC)
Received: by mail-wr1-x430.google.com with SMTP id cl1so3265299wrb.4
 for <dri-devel@lists.freedesktop.org>; Thu, 30 Jun 2022 05:08:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=qw+FrcK8UL5qu8ONac/uqXSaLs1ISOMfbcLfGwuhXDE=;
 b=dZ4HRsYHTwt8haiFE3hGMawaqkoZU0n2a/IY+4Dmx89wDrrt7nP7KDIL4r6uGM9cuh
 sMEq7Tfc7a0iV0aJuz+6KIfBdRnkdni+bvpWA65weJj6/cwSy+smead6Gmi0opV8AN6e
 IUprbZAmIoqAP18YpDWpZovQWRkdFy5Z1bcX+OZPbrMNpjf3mtg7lSY+khiiYQoK0wT7
 5jt+Xdzo7KE1a//RW6cd6q4pcit38/G6JVXHgEfDEJIAyB8u1QTHgx0veDqw5wvbYdy/
 qt0L2KkT9YIWNL1DRbEM0j0BMONiU9rd+jzGkJ3me6KdUhb9lrGVwHVzMCqiRl2iT/+R
 M7Ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=qw+FrcK8UL5qu8ONac/uqXSaLs1ISOMfbcLfGwuhXDE=;
 b=WXZQC9yogIgtrwlLADrySlTBpaoGD3HwPmCufFHUsc1YDiCTAQiRDMtSS8x1ad80UZ
 N8tyYj7v+INSt00qy6So1KDn/0Uf278iI9Y5+5OetGlIEag0+tKYYywNRJ+vkcOtcGgt
 4dlqMaKR8SiErKwXm34wDJ1Yjg//D/ZSmTTKYcZKb7S9xMywE49alVS7HRrfHzMW3m0u
 Xmz0PGFrLWhc8y9H4JSHlXRAhg2Kev9Z8VYEHxzVfCyAQ/KZobgcVe21BkninVA7DCBi
 7y/DA7q0epBc+Itm8D/RukGtAnB3sqnRnUNMosOyPoBoxzxmigmnetj7QAGAtTL/jLdT
 7KjQ==
X-Gm-Message-State: AJIora8oqp2Ljn8jj9WamC0APIV/aE4igRqalgl/+dWwHNSzJ7EGcS4y
 fJbekTPYmTdBx2zwP/hK0ewulQ==
X-Google-Smtp-Source: AGRyM1vw/qWPMCqZcAMlORKxceCBDPBznemmed3RSo+O4t9zNeHUWYv2GFQMWw3MrhWnPp2h/OzJog==
X-Received: by 2002:a05:6000:1705:b0:21b:bcff:39d3 with SMTP id
 n5-20020a056000170500b0021bbcff39d3mr8141430wrc.502.1656590931841; 
 Thu, 30 Jun 2022 05:08:51 -0700 (PDT)
Received: from sagittarius-a.chello.ie (188-141-3-169.dynamic.upc.ie.
 [188.141.3.169]) by smtp.gmail.com with ESMTPSA id
 m1-20020a7bcb81000000b003a05621dc53sm6286532wmi.29.2022.06.30.05.08.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 30 Jun 2022 05:08:51 -0700 (PDT)
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
To: robdclark@gmail.com, quic_abhinavk@quicinc.com,
 dmitry.baryshkov@linaro.org, sean@poorly.run, airlied@linux.ie,
 daniel@ffwll.ch, robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org
Subject: [PATCH 3/7] dt-bindings: msm: dsi: Fix power-domains constraint
Date: Thu, 30 Jun 2022 13:08:41 +0100
Message-Id: <20220630120845.3356144-4-bryan.odonoghue@linaro.org>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220630120845.3356144-1-bryan.odonoghue@linaro.org>
References: <20220630120845.3356144-1-bryan.odonoghue@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Fri, 01 Jul 2022 07:33:24 +0000
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
 dri-devel@lists.freedesktop.org, bjorn.andersson@linaro.org,
 quic_mkrishn@quicinc.com, bryan.odonoghue@linaro.org, swboyd@chromium.org,
 freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The existing msm8916.dtsi does not depend on nor require power-domains.
Drop from the list of required.

Fixes: 4dbe55c97741 ("dt-bindings: msm: dsi: add yaml schemas for DSI bindings")
Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
 .../devicetree/bindings/display/msm/dsi-controller-main.yaml     | 1 -
 1 file changed, 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml b/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml
index 101adec8d9152..91324f0828448 100644
--- a/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml
+++ b/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml
@@ -136,7 +136,6 @@ required:
   - phy-names
   - assigned-clocks
   - assigned-clock-parents
-  - power-domains
   - ports
 
 additionalProperties: false
-- 
2.36.1

