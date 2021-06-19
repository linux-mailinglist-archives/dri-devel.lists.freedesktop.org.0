Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 425AF3AD987
	for <lists+dri-devel@lfdr.de>; Sat, 19 Jun 2021 12:41:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 40FED6EAC5;
	Sat, 19 Jun 2021 10:41:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from alexa-out.qualcomm.com (alexa-out.qualcomm.com [129.46.98.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 320C26EABB;
 Sat, 19 Jun 2021 10:41:21 +0000 (UTC)
Received: from ironmsg-lv-alpha.qualcomm.com ([10.47.202.13])
 by alexa-out.qualcomm.com with ESMTP; 19 Jun 2021 03:41:21 -0700
X-QCInternal: smtphost
Received: from ironmsg01-blr.qualcomm.com ([10.86.208.130])
 by ironmsg-lv-alpha.qualcomm.com with ESMTP/TLS/AES256-SHA;
 19 Jun 2021 03:41:19 -0700
X-QCInternal: smtphost
Received: from rajeevny-linux.qualcomm.com ([10.204.66.121])
 by ironmsg01-blr.qualcomm.com with ESMTP; 19 Jun 2021 16:10:38 +0530
Received: by rajeevny-linux.qualcomm.com (Postfix, from userid 2363605)
 id 0D85B21508; Sat, 19 Jun 2021 16:10:37 +0530 (IST)
From: Rajeev Nandan <rajeevny@codeaurora.org>
To: dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org
Subject: [v7 4/5] dt-bindings: display: simple: Add Samsung ATNA33XC20
Date: Sat, 19 Jun 2021 16:10:29 +0530
Message-Id: <1624099230-20899-5-git-send-email-rajeevny@codeaurora.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1624099230-20899-1-git-send-email-rajeevny@codeaurora.org>
References: <1624099230-20899-1-git-send-email-rajeevny@codeaurora.org>
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
Cc: daniel.thompson@linaro.org, Rajeev Nandan <rajeevny@codeaurora.org>,
 mkrishn@codeaurora.org, jani.nikula@intel.com, linux-kernel@vger.kernel.org,
 abhinavk@codeaurora.org, dianders@chromium.org, a.hajda@samsung.com,
 robdclark@gmail.com, thierry.reding@gmail.com, seanpaul@chromium.org,
 laurent.pinchart@ideasonboard.com, kalyan_t@codeaurora.org,
 hoegsberg@chromium.org, sam@ravnborg.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add Samsung 13.3" FHD eDP AMOLED panel.

Signed-off-by: Rajeev Nandan <rajeevny@codeaurora.org>
Reviewed-by: Douglas Anderson <dianders@chromium.org>
Acked-by: Rob Herring <robh@kernel.org>
---

(no changes since v4)

Changes in v4:
- New

 Documentation/devicetree/bindings/display/panel/panel-simple.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/panel/panel-simple.yaml b/Documentation/devicetree/bindings/display/panel/panel-simple.yaml
index 4a0a5e1..f5acfd6 100644
--- a/Documentation/devicetree/bindings/display/panel/panel-simple.yaml
+++ b/Documentation/devicetree/bindings/display/panel/panel-simple.yaml
@@ -242,6 +242,8 @@ properties:
       - rocktech,rk101ii01d-ct
         # Rocktech Display Ltd. RK070ER9427 800(RGB)x480 TFT LCD panel
       - rocktech,rk070er9427
+        # Samsung 13.3" FHD (1920x1080 pixels) eDP AMOLED panel
+      - samsung,atna33xc20
         # Samsung 12.2" (2560x1600 pixels) TFT LCD panel
       - samsung,lsn122dl01-c01
         # Samsung Electronics 10.1" WSVGA TFT LCD panel
-- 
2.7.4

