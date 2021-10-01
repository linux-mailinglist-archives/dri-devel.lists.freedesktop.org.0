Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6845041F42E
	for <lists+dri-devel@lfdr.de>; Fri,  1 Oct 2021 19:59:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B410B6EEB4;
	Fri,  1 Oct 2021 17:59:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x231.google.com (mail-oi1-x231.google.com
 [IPv6:2607:f8b0:4864:20::231])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 370486EEB8
 for <dri-devel@lists.freedesktop.org>; Fri,  1 Oct 2021 17:59:16 +0000 (UTC)
Received: by mail-oi1-x231.google.com with SMTP id y201so12421564oie.3
 for <dri-devel@lists.freedesktop.org>; Fri, 01 Oct 2021 10:59:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=nF6LW47fQKO3rk11qFL799VxY9yECSKjA1fHehWHHiY=;
 b=LfElaVRac/rd1pa8a5fX1rNze9VGWsDJnTwe0/38y7mY4Ift6Rv2p0/0MJRGrWKadO
 RI16GHNleNanYFQYIHBEVPz73wL0xknC6WgdjoR4Pmg8/yz9k5qNLI29iRn1mYCLqizx
 zmMzb4CpQ4D2Wcw4Yiraci0rPMYVNKkHVvF3RjUBElh9eCZcYZWa7uP9v31fcHe/6OwN
 0jeNLY4UahYzbGIeIJG22QvYF53997PNq8/+Ci/autUvIIHlJvDcnMy2Dz1yf1t/0Y4V
 9hrvQgfBCYp8j8YqkD5lUOS88Me/dIra4WhaQN0cIpGtpyTBCNnh6L5JGZRNRYahdRgF
 zMQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=nF6LW47fQKO3rk11qFL799VxY9yECSKjA1fHehWHHiY=;
 b=7pRTYTYaH65c9jdvVTjwyBs3s5QjTTGp6TdI6L54RZmqQoAim+bOhvACO/BJA0qaqq
 57cWu2+nUdxRQgyiyhjjrJ0gWCAKm3og7uluGue2JiPGwl9XEG5royM5TiiC5OlJelv8
 A7VHZ6ntElnaPFbjyZNEuAcGaI3UGdg9oh9MiqhW7bLDky8BDLZJWsVNlQtb1Zy7AyY0
 ZuOpKOuOpdkRy168+QMeFozuVR68KGuXmtpfwVlpamLD+WIw+oOroM9UQl/XZrlv0vqY
 SQmyQADl/ZmkBQzN2L2GCTYIqExhW4RFk2ExErs2aER33dFaw5kIqulbN7yPMjZWs4Ve
 uTRA==
X-Gm-Message-State: AOAM533c6t6MVjblthPRAGbK+TX0S6/amc7yT2sS1iByuApzIlVPeZgr
 rexz8S3h6cdiugjayeZwG/IIMg==
X-Google-Smtp-Source: ABdhPJyRflu6emTf1eQ8g5XBdIrtHKb6KHaDYwhSuzKDBHwh9NHvtDaXTcXoG03WprD/HYPocjp2nw==
X-Received: by 2002:a05:6808:b25:: with SMTP id
 t5mr4965587oij.58.1633111155560; 
 Fri, 01 Oct 2021 10:59:15 -0700 (PDT)
Received: from localhost.localdomain ([2600:1700:a0:3dc8:205:1bff:fec0:b9b3])
 by smtp.gmail.com with ESMTPSA id
 w2sm1284798oof.23.2021.10.01.10.59.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 01 Oct 2021 10:59:15 -0700 (PDT)
From: Bjorn Andersson <bjorn.andersson@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Abhinav Kumar <abhinavk@codeaurora.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Kalyan Thota <kalyan_t@codeaurora.org>,
 Kuogee Hsieh <khsieh@codeaurora.org>
Cc: Rob Herring <robh+dt@kernel.org>, Stephen Boyd <swboyd@chromium.org>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: [PATCH v3 4/5] dt-bindings: msm/dp: Add SC8180x compatibles
Date: Fri,  1 Oct 2021 11:00:57 -0700
Message-Id: <20211001180058.1021913-5-bjorn.andersson@linaro.org>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20211001180058.1021913-1-bjorn.andersson@linaro.org>
References: <20211001180058.1021913-1-bjorn.andersson@linaro.org>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The Qualcomm SC8180x has 2 DP controllers and 1 eDP controller, add
compatibles for these to the msm/dp binding.

Reviewed-by: Stephen Boyd <swboyd@chromium.org>
Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
---

Changes since v2:
- None

 .../devicetree/bindings/display/msm/dp-controller.yaml          | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/msm/dp-controller.yaml b/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
index 6bb424c21340..63e585f48789 100644
--- a/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
+++ b/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
@@ -17,6 +17,8 @@ properties:
   compatible:
     enum:
       - qcom,sc7180-dp
+      - qcom,sc8180x-dp
+      - qcom,sc8180x-edp
 
   reg:
     items:
-- 
2.29.2

