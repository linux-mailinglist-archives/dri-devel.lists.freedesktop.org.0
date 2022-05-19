Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D905F52DA42
	for <lists+dri-devel@lfdr.de>; Thu, 19 May 2022 18:30:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C01AA10F1F7;
	Thu, 19 May 2022 16:29:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x236.google.com (mail-oi1-x236.google.com
 [IPv6:2607:f8b0:4864:20::236])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 77BF710F1F7
 for <dri-devel@lists.freedesktop.org>; Thu, 19 May 2022 16:29:56 +0000 (UTC)
Received: by mail-oi1-x236.google.com with SMTP id n24so7038961oie.12
 for <dri-devel@lists.freedesktop.org>; Thu, 19 May 2022 09:29:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=AX9/X1WhGwP2sW6zC/gqprghPkVPPG9iN/vljmKSmiY=;
 b=nLnb8w0IzSBYnMFzS1IhicdSlHzUYxbCMFGJqvuo3m0qXA3QcbrkQSeM7hM/8rK4jx
 mOx0UMUO9KnSM6hNGlqxJASOqn1tgaXLJ7vbQK8PwHUEUZLZmkjoaCM0UFTwjf78AcEf
 kfyiz35sSW2yKYyJSx++g+0D/1OZ2DuGobKmGDEx/tMPpqwO89kffjyvEcMxC1jc46ME
 T4qySg2xC1Y6M7+0dvElqsgGg9ZAJoJbG3Sbcinz0FaBx36RjsfPrPJN3aWjyFzJ0bJc
 cIOYzng97MKpxDSJAKHga30m357aP2nrP/NuGO6V0nNFVI+4WpT7OGJmBzAyXn/cWUfq
 3uGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=AX9/X1WhGwP2sW6zC/gqprghPkVPPG9iN/vljmKSmiY=;
 b=bxXOWPZ/o0k1mHPoObOnFmPakWSkOc7MbzIrxIQJAaWhVcsT7mdgousiae/1ncHjj+
 HLaxW3TLmphByomK4/VcgunUYi2G4nmMsY451eQickYyK/FAOHoK+vVQOVRhJJKnEIQ5
 /b65TABzOSIcndPvX09DjJTlkTVmN/GG3yzuK9a+uFQxhX/XzN6k063i5fM+d5CsTF+V
 bTSYgCPvzYWQYZBNU62ScnWgwv/hXgJjmppoTKmZPtvH2lJ3y5C+XuGvArJeN8Tc+QtO
 y4VqOCGjMo2AdGf0LkcXxxpkGkau5ysAqZ/lCH77l3eEF6VLJyoZy0nAba780jj8F+Sp
 hbEQ==
X-Gm-Message-State: AOAM530sGLDNTJRrLjtsxWjNQdh+E+5kC1aXFPUyilwBaCKirzgLuLzL
 //gWEBCfKUDa+6IIAsBfXtuoup0Pjrr9mg==
X-Google-Smtp-Source: ABdhPJwc6e4QT4kM6B3yl+F2WyUKXDcuVoQUxVTEAxOVOcdgzYKTKKLYDQK8HOqGTWd10+5x83QWrg==
X-Received: by 2002:a05:6808:bcf:b0:329:867:a994 with SMTP id
 o15-20020a0568080bcf00b003290867a994mr2791869oik.249.1652977794485; 
 Thu, 19 May 2022 09:29:54 -0700 (PDT)
Received: from wintermute.localdomain (cpe-76-183-134-35.tx.res.rr.com.
 [76.183.134.35]) by smtp.gmail.com with ESMTPSA id
 n4-20020a056870844400b000e92295f8acsm36562oak.2.2022.05.19.09.29.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 19 May 2022 09:29:54 -0700 (PDT)
From: Chris Morgan <macroalpha82@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [RESEND 4/6 v2] dt-bindings: display: simple: add Geekworm MZP280
 Panel
Date: Thu, 19 May 2022 11:29:33 -0500
Message-Id: <20220519162935.1585-5-macroalpha82@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220519162935.1585-1-macroalpha82@gmail.com>
References: <20220519162935.1585-1-macroalpha82@gmail.com>
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
Cc: devicetree@vger.kernel.org, krzysztof.kozlowski+dt@linaro.org,
 emma@anholt.net, airlied@linux.ie, Chris Morgan <macromorgan@hotmail.com>,
 robh+dt@kernel.org, thierry.reding@gmail.com, mchehab@kernel.org,
 sam@ravnborg.org, linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Chris Morgan <macromorgan@hotmail.com>

The Geekworm MZP280 panel is a 480x640 (portrait) panel with a
capacitive touch interface and a 40 pin header meant to interface
directly with the Raspberry Pi. The screen is 2.8 inches diagonally,
and there appear to be at least 4 distinct versions all with the same
panel timings.

Timings were derived from drivers posted on the github located here:
https://github.com/tianyoujian/MZDPI/tree/master/vga

Additional details about this panel family can be found here:
https://wiki.geekworm.com/2.8_inch_Touch_Screen_for_Pi_zero

Signed-off-by: Chris Morgan <macromorgan@hotmail.com>
---
 .../devicetree/bindings/display/panel/panel-simple.yaml         | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/panel/panel-simple.yaml b/Documentation/devicetree/bindings/display/panel/panel-simple.yaml
index 62f5f050c..3d03d8276 100644
--- a/Documentation/devicetree/bindings/display/panel/panel-simple.yaml
+++ b/Documentation/devicetree/bindings/display/panel/panel-simple.yaml
@@ -148,6 +148,8 @@ properties:
       - frida,frd350h54004
         # FriendlyELEC HD702E 800x1280 LCD panel
       - friendlyarm,hd702e
+        # Geekworm MZP280 2.8" 480x640 LCD panel with capacitive touch
+      - geekworm,mzp280
         # GiantPlus GPG48273QS5 4.3" (480x272) WQVGA TFT LCD panel
       - giantplus,gpg48273qs5
         # GiantPlus GPM940B0 3.0" QVGA TFT LCD panel
-- 
2.25.1

