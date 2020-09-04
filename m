Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6503E25E154
	for <lists+dri-devel@lfdr.de>; Fri,  4 Sep 2020 20:09:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 443B66E088;
	Fri,  4 Sep 2020 18:08:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x442.google.com (mail-pf1-x442.google.com
 [IPv6:2607:f8b0:4864:20::442])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2DC846E088
 for <dri-devel@lists.freedesktop.org>; Fri,  4 Sep 2020 18:08:58 +0000 (UTC)
Received: by mail-pf1-x442.google.com with SMTP id u128so5032377pfb.6
 for <dri-devel@lists.freedesktop.org>; Fri, 04 Sep 2020 11:08:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=VR8GNVs/4QhnhespfyktUk1pNIw2OaOAjoA98mpiYlI=;
 b=XEjxaSkJBRR+Nw65OrveDE7+DhOIyYNNraHHcuxii2UG8l+JWdFCrP2biFNSD8SJLt
 iPpvc/c18znjeUqOgilXudlTLABnQxCGUa233Zz7pHeEFnFh/Ygh4hEFUPEM3OK82AlB
 GtyNiZFiOZX6nfJJ0FnGEnxtA1aACnAzqAeUY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=VR8GNVs/4QhnhespfyktUk1pNIw2OaOAjoA98mpiYlI=;
 b=NrlSpqtzScZtS3yVzx+3wUEdOMOYRz2I3pZYRCMtZ06kLLLtlfD+RLj60xZrDkgfEJ
 zJNQOme49IMYXp82vJ5IH/m0cx8ExYdlFR69jh9Vo20+ArdP8pUwIdh5Uv8NYg0FtsVP
 PH6+jNParoo2Hz/jWW2YPY0tO8NjV1Ckhf1KDbuvWETz/dYMc0pG9dpRl1PJ7uskNkhI
 OO6HFo/uYWX6iXI3JSBG3fAPmhiUwrby4vFkZ+tpdiqiLT3rtSyNHQfkX6kxH0qF1hiL
 ZF5PzC+62XJJ1QNKoXoaRbjKbIkM4xqf5/9UUXsV0vnduKNX3DYJwmzr+Ogw6T4Q1vLj
 Z48w==
X-Gm-Message-State: AOAM533uflxtU/mHoVOTZjHkFrp1DBjy+tvQn2hmf3d9Tf+4vYt85XS/
 J7YeLeED2U5BxiMtVJivtl392A==
X-Google-Smtp-Source: ABdhPJxCodZ5I7hCe8TfVPMYqQ+obWSOHN+ol2zsrB4TMir8vNQYBz2HIJbl5PnGjUbOhMTC7eVnSQ==
X-Received: by 2002:a63:5c1a:: with SMTP id q26mr8341714pgb.223.1599242937733; 
 Fri, 04 Sep 2020 11:08:57 -0700 (PDT)
Received: from localhost.localdomain ([2405:201:c809:c7d5:b9ea:24bf:6b2b:1eee])
 by smtp.gmail.com with ESMTPSA id 131sm7448281pfy.5.2020.09.04.11.08.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 04 Sep 2020 11:08:57 -0700 (PDT)
From: Jagan Teki <jagan@amarulasolutions.com>
To: Thierry Reding <thierry.reding@gmail.com>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, Rob Herring <robh+dt@kernel.org>
Subject: [PATCH 2/3] dt-bindings: display: simple: Add YTC700TLAG-05-201C
Date: Fri,  4 Sep 2020 23:38:20 +0530
Message-Id: <20200904180821.302194-2-jagan@amarulasolutions.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200904180821.302194-1-jagan@amarulasolutions.com>
References: <20200904180821.302194-1-jagan@amarulasolutions.com>
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
Cc: devicetree@vger.kernel.org, linux-amarula@amarulasolutions.com,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Jagan Teki <jagan@amarulasolutions.com>, Sam Ravnborg <sam@ravnborg.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add dt-bindings for YTC700TLAG-05-201C 7" TFT LCD panel from
Yes Optoelectronics Co.,Ltd.

Signed-off-by: Jagan Teki <jagan@amarulasolutions.com>
---
 .../devicetree/bindings/display/panel/panel-simple.yaml         | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/panel/panel-simple.yaml b/Documentation/devicetree/bindings/display/panel/panel-simple.yaml
index f629d04f7737..3e12b32897e0 100644
--- a/Documentation/devicetree/bindings/display/panel/panel-simple.yaml
+++ b/Documentation/devicetree/bindings/display/panel/panel-simple.yaml
@@ -268,6 +268,8 @@ properties:
       - vxt,vl050-8048nt-c01
         # Winstar Display Corporation 3.5" QVGA (320x240) TFT LCD panel
       - winstar,wf35ltiacd
+        # Yes Optoelectronics YTC700TLAG-05-201C 7" TFT LCD panel
+      - yes-optoelectronics,ytc700tlag-05-201c
 
   backlight: true
   enable-gpios: true
-- 
2.25.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
