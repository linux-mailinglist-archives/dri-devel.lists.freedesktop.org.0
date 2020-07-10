Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9050F21C054
	for <lists+dri-devel@lfdr.de>; Sat, 11 Jul 2020 01:02:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B37096ED8E;
	Fri, 10 Jul 2020 23:02:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x1042.google.com (mail-pj1-x1042.google.com
 [IPv6:2607:f8b0:4864:20::1042])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CBF476ED75
 for <dri-devel@lists.freedesktop.org>; Fri, 10 Jul 2020 23:02:48 +0000 (UTC)
Received: by mail-pj1-x1042.google.com with SMTP id t15so3227064pjq.5
 for <dri-devel@lists.freedesktop.org>; Fri, 10 Jul 2020 16:02:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Kf4bs78mZD6VPb7hGbMzwU1SDkoaJXih+VvUUu+oT8M=;
 b=SfhM9LjMFbCFHtzRBA4SYqf4zywNRWj3h+ZgZB00uTROQfzpfdrl4ryysqaf4tBwmn
 FN5/X0Iaz/Jv0JelCgSiqQCksM1Mtpd61VVkSa5kJaEzio+e8kAzYsbBZWtOdJnGC0IZ
 LJKsybrd4RMtUZ3XEr2Cn+AYmRcozOtq4sOtg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Kf4bs78mZD6VPb7hGbMzwU1SDkoaJXih+VvUUu+oT8M=;
 b=n9XKhI6XMRVSvpKQDIcsQSDc7i122htk0ST+/qVqaOe7zOsawCBAIiJ+V1e4pnCP8B
 MCTJmthFWPPIR5w7Z3WUAXvXPYSTQ2qAkrHHq1WM5aN9BJfqz+ZNxiaOVmO2LtJ3VbEn
 nRra292rHpXA1MYpRX2TZCxETWcHwdLcoQ2iMbCDtZtqH0spzXUBWeXQEMiHr/JcASiY
 qgKE6whtmzFure9FPQR01TB2RZpZWN1ZaxoRfmGQCC0W2pz5sFNX6nZ9dgsJk1O4gIn+
 cdVOn8x6Dpp8AC+nxl32eijJU09pzZ2LxVEu3q6QyaGa1k1GnO2lDuGkm+TjikRGQZlc
 Wo8g==
X-Gm-Message-State: AOAM532er+kIb1mJAgpQb+WJ1En4iUDUAblbJWbHP2BxHdA9yCmy61j4
 Jp8YHjAPz5SUbeG1yVIq1w2fXw==
X-Google-Smtp-Source: ABdhPJzXgkBIOOjHFIe0B/r5cwGP2/G1OFIlhiURScaD7ul10GXJnds6PU6GdJAicb/gntGJ5m6eTA==
X-Received: by 2002:a17:90a:e7cd:: with SMTP id
 kb13mr7950555pjb.138.1594422168452; 
 Fri, 10 Jul 2020 16:02:48 -0700 (PDT)
Received: from tictac2.mtv.corp.google.com
 ([2620:15c:202:1:42b0:34ff:fe3d:58e6])
 by smtp.gmail.com with ESMTPSA id my9sm7266836pjb.44.2020.07.10.16.02.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 10 Jul 2020 16:02:47 -0700 (PDT)
From: Douglas Anderson <dianders@chromium.org>
To: Rob Herring <robh+dt@kernel.org>, Rob Clark <robdclark@gmail.com>,
 Sean Paul <sean@poorly.run>, Andy Gross <agross@kernel.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>
Subject: [PATCH 3/9] dt-bindings: msm/mdp5: Add simple-bus to dpu bindings
Date: Fri, 10 Jul 2020 16:02:18 -0700
Message-Id: <20200710160131.3.I823f3420d7c25300a58819ff03560ca4d41e53f6@changeid>
X-Mailer: git-send-email 2.27.0.383.g050319c2ae-goog
In-Reply-To: <20200710230224.2265647-1-dianders@chromium.org>
References: <20200710230224.2265647-1-dianders@chromium.org>
MIME-Version: 1.0
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
Cc: devicetree@vger.kernel.org, David Airlie <airlied@linux.ie>,
 linux-arm-msm@vger.kernel.org, Douglas Anderson <dianders@chromium.org>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 freedreno@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is just like the patch ("dt-bindings: msm/disp: Add simple-bus to
dpu bindings") but for the mdp5 bindings.

Signed-off-by: Douglas Anderson <dianders@chromium.org>
---

 Documentation/devicetree/bindings/display/msm/mdp5.txt | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/display/msm/mdp5.txt b/Documentation/devicetree/bindings/display/msm/mdp5.txt
index 43d11279c925..bb57b07b7546 100644
--- a/Documentation/devicetree/bindings/display/msm/mdp5.txt
+++ b/Documentation/devicetree/bindings/display/msm/mdp5.txt
@@ -9,7 +9,7 @@ controller found in SoCs like MSM8974, APQ8084, MSM8916, MSM8994 and MSM8996.
 MDSS:
 Required properties:
 - compatible:
-  * "qcom,mdss" - MDSS
+  * "qcom,mdss", "simple-bus" - MDSS
 - reg: Physical base address and length of the controller's registers.
 - reg-names: The names of register regions. The following regions are required:
   * "mdss_phys"
-- 
2.27.0.383.g050319c2ae-goog

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
