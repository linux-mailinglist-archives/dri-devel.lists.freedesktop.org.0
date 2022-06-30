Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6987D562CB9
	for <lists+dri-devel@lfdr.de>; Fri,  1 Jul 2022 09:33:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3C2ED10F95F;
	Fri,  1 Jul 2022 07:33:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com
 [IPv6:2a00:1450:4864:20::436])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 24CF8892E0
 for <dri-devel@lists.freedesktop.org>; Thu, 30 Jun 2022 12:08:52 +0000 (UTC)
Received: by mail-wr1-x436.google.com with SMTP id b26so14597698wrc.2
 for <dri-devel@lists.freedesktop.org>; Thu, 30 Jun 2022 05:08:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ep1P6XTEaNexZkYvrMILNzV0+nB7s8j8xxQKFiKCkDY=;
 b=S4AfW7peDmO0EaxFy5FO+eirXPDcekVZNcBYSKJovu4k6tn8S5q5i6LIEJCm1MqJTi
 kAPHski5fwgglMwM15fGoISZgEhnpQv2KWG+MUWwYq+6Y4wxnOaGlEZzsihmznkRofnY
 H2hv/iuskUHAdzB0vpWeCVL7SPPS/1XFA1A2DJQ2ozAyt7ZwbDwkWmPwTAEaD9H8Uyvw
 baf1CZBzY16C2nLwo/kuHVJvSuS+43jHLtsl6QCv8wATbaaFLuTprc2GwMiwuJVhT4Qh
 ialNz9wDnepcTnPQUugR4wtbw1Y56m3+d9VX+XmcNeSXkXSuOLobf1etTS579hldonbt
 P/cQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ep1P6XTEaNexZkYvrMILNzV0+nB7s8j8xxQKFiKCkDY=;
 b=LD8HmHe4rQBiGyQezNJRRBrOSqM227Zz2Ukw1oAHqFDkpYD/ys0ujCAa+bhA/hJ/ZY
 E6obelb2FoXe2pL7F9aBWDdx9o4cGCMhJC4SioLKdYZsLZXMDqP+L1F61FS3TFZIeL0R
 3Fmr3hKX4C8e6P/08wA0jniQo0lzRqoYO8rrrLlkv9Zia7lid8/QWVnlzoSstpT9hPNK
 I6yIrlymQ4SSbJ+xDZ1oiMaz1Fnb/xXosScVHYkFTMSrxzM0ga4+oJEKCOn64RmHG0Nm
 rDdpZFExtuh9xZafXmXq+ryfD/O1ud+CkApg/NYLuh3OzB6GmQCJdHUuJhkUarwxtH5S
 Gp5w==
X-Gm-Message-State: AJIora8DxHKJCoe/z5+pF2XQwBCit/uYUFPBC50HQX5E2xyAtsq9QEBt
 GcigD/QVZKAf3hh0/gif/KCjBw==
X-Google-Smtp-Source: AGRyM1vDMAgZbp7JXmzOGvCCpcaX+CS9YGuecoWNWTHwFWjrmB4Ec+v67bqswhRJqQqPUfhb0pkp8Q==
X-Received: by 2002:a05:6000:1147:b0:21b:93db:701a with SMTP id
 d7-20020a056000114700b0021b93db701amr7868034wrx.447.1656590930621; 
 Thu, 30 Jun 2022 05:08:50 -0700 (PDT)
Received: from sagittarius-a.chello.ie (188-141-3-169.dynamic.upc.ie.
 [188.141.3.169]) by smtp.gmail.com with ESMTPSA id
 m1-20020a7bcb81000000b003a05621dc53sm6286532wmi.29.2022.06.30.05.08.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 30 Jun 2022 05:08:50 -0700 (PDT)
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
To: robdclark@gmail.com, quic_abhinavk@quicinc.com,
 dmitry.baryshkov@linaro.org, sean@poorly.run, airlied@linux.ie,
 daniel@ffwll.ch, robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org
Subject: [PATCH 2/7] dt-bindings: msm: dsi: Fix operating-points-v2 constraint
Date: Thu, 30 Jun 2022 13:08:40 +0100
Message-Id: <20220630120845.3356144-3-bryan.odonoghue@linaro.org>
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

The existing msm8916.dtsi does not depend on nor require operating points.

Fixes: 4dbe55c97741 ("dt-bindings: msm: dsi: add yaml schemas for DSI bindings")
Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
 .../devicetree/bindings/display/msm/dsi-controller-main.yaml     | 1 -
 1 file changed, 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml b/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml
index 717a5d255ffe4..101adec8d9152 100644
--- a/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml
+++ b/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml
@@ -137,7 +137,6 @@ required:
   - assigned-clocks
   - assigned-clock-parents
   - power-domains
-  - operating-points-v2
   - ports
 
 additionalProperties: false
-- 
2.36.1

