Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7380C255E50
	for <lists+dri-devel@lfdr.de>; Fri, 28 Aug 2020 18:00:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 76D176E084;
	Fri, 28 Aug 2020 16:00:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x1041.google.com (mail-pj1-x1041.google.com
 [IPv6:2607:f8b0:4864:20::1041])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 037446E084
 for <dri-devel@lists.freedesktop.org>; Fri, 28 Aug 2020 15:59:59 +0000 (UTC)
Received: by mail-pj1-x1041.google.com with SMTP id s2so706739pjr.4
 for <dri-devel@lists.freedesktop.org>; Fri, 28 Aug 2020 08:59:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=rS6Br+S3B2XheGYnh0vsVMxPhFR00mObbIJ1yAl3WW8=;
 b=pxyn0T1rQJWMeU4dPTHRaoMstKXjPxs5eFykfQCEmBJG0HX4+frfFAJZLWBTkS9C+7
 Wsou5DP4u79qFPrcRSG+A9+VopSIJrhoP8tWdblawb2YXaRrtXmLq/XPEDEvBV6RIwDl
 a9rxGq5QOon/H8Wn3xz7W43DXn29/yGUeLWNU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=rS6Br+S3B2XheGYnh0vsVMxPhFR00mObbIJ1yAl3WW8=;
 b=GUZgVpP31yT2Yp1GXF/JUrU/0bcqgmZKiOFfjzKoX1M1g6EIKwkCumH2n5NK4fd/Wf
 BnvYwVo/m5jl3qhYyCB2FDDeVSb8SDlDmgv7CDWk4uR7wwZpVZIMvyMmeInmowi1slSQ
 yQWERMv+PxQas9yEraAG0StgldEL/LZKatb81//eY9UiYagk5GkrK1PX6U4TsIsIODLb
 c5fpS+I0sIMhK6rLk6IhwNC2dKS/j3+hVLHz1Hm0vFVXZlp0debZ+RYOUh5WtS/Bv/2K
 xvE7u2M9VlLCB4aO3UyEJCxLZ/vfvDr6XlOa5tRvA6sTCaMpIF7K61M/F8qftDFFn8zl
 jxmA==
X-Gm-Message-State: AOAM532rrwF0hzTOh2eakjgIDUSt48AWY6SOo+Yniij1NeDnD4pkI8q0
 1wC6SjD24cvOCVofjkVGxMLB5Q==
X-Google-Smtp-Source: ABdhPJy/5TUe5e235Wok9fR13sAFnytXVToEAA8QjrE88j1Aha6sZZLEHW5tP98Pju1tC68/jWdUEg==
X-Received: by 2002:a17:90a:2bce:: with SMTP id
 n14mr1921558pje.20.1598630398312; 
 Fri, 28 Aug 2020 08:59:58 -0700 (PDT)
Received: from localhost.localdomain ([2405:201:c809:c7d5:8ce8:955b:ae1b:d6ef])
 by smtp.gmail.com with ESMTPSA id x13sm2195691pfr.69.2020.08.28.08.59.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 28 Aug 2020 08:59:57 -0700 (PDT)
From: Jagan Teki <jagan@amarulasolutions.com>
To: Thierry Reding <thierry.reding@gmail.com>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>
Subject: [PATCH 1/2] dt-bindings: display: simple: Add AM-1280800N3TZQW-T00H
Date: Fri, 28 Aug 2020 21:29:37 +0530
Message-Id: <20200828155938.328982-1-jagan@amarulasolutions.com>
X-Mailer: git-send-email 2.25.1
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
 Rob Herring <robh+dt@kernel.org>, Jagan Teki <jagan@amarulasolutions.com>,
 Sam Ravnborg <sam@ravnborg.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add dt-bindings for 10.1" TFT LCD module from Ampire Co. Ltd.
as part of panel-simple.

Signed-off-by: Jagan Teki <jagan@amarulasolutions.com>
---
 .../devicetree/bindings/display/panel/panel-simple.yaml         | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/panel/panel-simple.yaml b/Documentation/devicetree/bindings/display/panel/panel-simple.yaml
index d6cca1479633..f629d04f7737 100644
--- a/Documentation/devicetree/bindings/display/panel/panel-simple.yaml
+++ b/Documentation/devicetree/bindings/display/panel/panel-simple.yaml
@@ -29,6 +29,8 @@ properties:
     # compatible must be listed in alphabetical order, ordered by compatible.
     # The description in the comment is mandatory for each compatible.
 
+        # Ampire AM-1280800N3TZQW-T00H 10.1" WQVGA TFT LCD panel
+      - ampire,am-1280800n3tzqw-t00h
         # Ampire AM-480272H3TMQW-T01H 4.3" WQVGA TFT LCD panel
       - ampire,am-480272h3tmqw-t01h
         # Ampire AM-800480R3TMQW-A1H 7.0" WVGA TFT LCD panel
-- 
2.25.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
