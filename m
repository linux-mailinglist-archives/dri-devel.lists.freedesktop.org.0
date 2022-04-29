Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 206D0515191
	for <lists+dri-devel@lfdr.de>; Fri, 29 Apr 2022 19:21:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 01F7410ED35;
	Fri, 29 Apr 2022 17:21:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x32a.google.com (mail-ot1-x32a.google.com
 [IPv6:2607:f8b0:4864:20::32a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 62DA310ED35
 for <dri-devel@lists.freedesktop.org>; Fri, 29 Apr 2022 17:21:12 +0000 (UTC)
Received: by mail-ot1-x32a.google.com with SMTP id
 r14-20020a9d750e000000b00605446d683eso5540249otk.10
 for <dri-devel@lists.freedesktop.org>; Fri, 29 Apr 2022 10:21:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=N6WuL0jO9VRXWMbI6XwfJX7wIxCjCzycdaIb9uJ7Krk=;
 b=gRS8ekBWuJZBUcwbOgmCs3C6olZpWqyMCZ+RtTo/2awe7k8o9a+LRpHK99LS2bZOYE
 CATmNl/DStmt6V+iHuJgxp0JAevl1VYyGbZuYI0f+597zwSCRW0J+a2CwTuBSNa3m762
 mYJ4RnQ/jHf1dAUARHI5ocm1N5D/FE6MXP0cANsXhcfG9sPMkJ2EkXwB5c2QlqtylUxZ
 ig7zM/ruflHhNMJqCCBG3MV0bj1NljEDw0Avf0A0pmWQxH8Tf6Ad56jK6nUGgcFW+T8M
 aT8F/1GPQHXga5vGV4CHyEmaGW6U7l5yBtFJWE5adJO1HbtjoCWN7wHcfcCvWO11Lz40
 XrNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=N6WuL0jO9VRXWMbI6XwfJX7wIxCjCzycdaIb9uJ7Krk=;
 b=6gMkx+7ZQyluD8m4nV9iv36LPHb2WdiVGUsh//H6a681y+dYmaoP4FMpEUs4mTjY0K
 3zkNROjHv8PxWwW7Is9m+rD18vVMNXsx+0qdSsGTjCwhpfv+WX34sLv9hkP18/LfCrog
 jRy4BxvVHY8ZexxF1DzujebRAoexjfS4wNDWt9lXpWJiuO/hwp5ohKSzR26fJYiCFckT
 baG4Cuq+z5EjdBaYhAV2wganJdcOQ+l6dhxZr221FNRoiH55Ff/x6WZj4qjy7T2BYxw3
 rg1FOsxf6fsbu7dSiogj0EoW9k9cj+i2T/SseTvnmguCeCQ4LYuQMo4okTj7kszajCaO
 WPKA==
X-Gm-Message-State: AOAM530CkJt3/1yJVGDJsihZlIakyGXbA4XGLyyT/uhut1+pEkKacjRR
 3ICH6vL1w86yQssnVQ66bHA=
X-Google-Smtp-Source: ABdhPJzBepKukMC7YHbe1QL1xq3+7jHj3DoyVSlzMap4fweT9+Il8Ss53x5KM9h8z46JZOiWrUgQ6g==
X-Received: by 2002:a05:6830:2807:b0:605:5bd2:c02e with SMTP id
 w7-20020a056830280700b006055bd2c02emr154779otu.272.1651252871665; 
 Fri, 29 Apr 2022 10:21:11 -0700 (PDT)
Received: from localhost.localdomain ([2804:14c:485:4b69:5013:a749:adb3:2bea])
 by smtp.gmail.com with ESMTPSA id
 u3-20020a056870d58300b000e686d1389csm3509288oao.54.2022.04.29.10.21.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 29 Apr 2022 10:21:11 -0700 (PDT)
From: Fabio Estevam <festevam@gmail.com>
To: sam@ravnborg.org
Subject: [PATCH v3 1/2] dt-bindings: display: simple: Add Startek
 KD070WVFPA043-C069A panel
Date: Fri, 29 Apr 2022 14:20:55 -0300
Message-Id: <20220429172056.3499563-1-festevam@gmail.com>
X-Mailer: git-send-email 2.25.1
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
Cc: marex@denx.de, devicetree@vger.kernel.org, Fabio Estevam <festevam@denx.de>,
 dri-devel@lists.freedesktop.org, robh+dt@kernel.org, hs@denx.de
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Fabio Estevam <festevam@denx.de>

Add Startek KD070WVFPA043-C069A 7" TFT LCD panel compatible string.

Signed-off-by: Fabio Estevam <festevam@denx.de>
Acked-by: Sam Ravnborg <sam@ravnborg.org>
---
Changes since v2:
- None

 .../devicetree/bindings/display/panel/panel-simple.yaml         | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/panel/panel-simple.yaml b/Documentation/devicetree/bindings/display/panel/panel-simple.yaml
index 1eb9dd4f8f58..e190eef66872 100644
--- a/Documentation/devicetree/bindings/display/panel/panel-simple.yaml
+++ b/Documentation/devicetree/bindings/display/panel/panel-simple.yaml
@@ -294,6 +294,8 @@ properties:
       - starry,kr070pe2t
         # Starry 12.2" (1920x1200 pixels) TFT LCD panel
       - starry,kr122ea0sra
+        # Startek KD070WVFPA043-C069A 7" TFT LCD panel
+      - startek,kd070wvfpa
         # Team Source Display Technology TST043015CMHX 4.3" WQVGA TFT LCD panel
       - team-source-display,tst043015cmhx
         # Tianma Micro-electronics TM070JDHG30 7.0" WXGA TFT LCD panel
-- 
2.25.1

