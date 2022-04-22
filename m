Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 012E050BFD3
	for <lists+dri-devel@lfdr.de>; Fri, 22 Apr 2022 20:36:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E7C6A10E5AE;
	Fri, 22 Apr 2022 18:36:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oa1-x2b.google.com (mail-oa1-x2b.google.com
 [IPv6:2001:4860:4864:20::2b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 960C110E5AE
 for <dri-devel@lists.freedesktop.org>; Fri, 22 Apr 2022 18:36:25 +0000 (UTC)
Received: by mail-oa1-x2b.google.com with SMTP id
 586e51a60fabf-e67799d278so5677618fac.11
 for <dri-devel@lists.freedesktop.org>; Fri, 22 Apr 2022 11:36:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=LSNY6HVO8IFreVRhOftkxSgz6DO0IOlvH+QazxsX1ho=;
 b=Iba2vVvBxtXSgnDlhWMHnfn96Hw0popi3Q7X963rynCXrctVGtncOJ2BaTymYuw6aa
 ylEAMeGLE5LIVd+56qR62jkJWVbauhLxJCrY8KZQ6KU28EvNMuIkY1hNcGK5dNqsV6EG
 Ig1l8q5T2NYNaYWWuRzkA2vpuvCooQfyJAGDipH7rZ2nx1uVIODj4MWrQ1uwlc8wYCLa
 mW3lvlqVLo0/dK3reD3uqW9yijX8KXORlR7NGZPH8DQMCNj5Rc+yPRfTCcSo3V1clL0m
 ukYu2v+0t+19GjICJkQr3LUhN/oaY1Xptv4+hxNRXIQeMMwEBzFA/RybEE2V8EaQXvSg
 ZIpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=LSNY6HVO8IFreVRhOftkxSgz6DO0IOlvH+QazxsX1ho=;
 b=RP48y6ruiSHdnLFd4LA8oSrjzUxdpMn5vAnMaAnFBZt/R7ZJvhV2ZEu88VMWFNIdcJ
 mfFoB+9vW1CPBbYwC0+hci7vI8F3WTNgpK7g1IRpjeznCnSAzIlcFxfAQmBXgRIvUTJX
 syTOuiHPRJyxc1Fab5JNrq1kfx9naq3/hRlx3XvlSm4GKfmeKdIsWbLOr2BtRCHo/TFZ
 u8mQe7XiN9ko+ovWAMzE5mnac39TYyblZqH1bUBuIdsa5tc+nk5UHLfFeOjlp/LcvkWt
 35uyI3E6vXP8uOVBEQQSns1nUOqE/w9WOBAiIxHefTmYjgOer0MaJ4BLPu0Ac4Q8ro6t
 xw7w==
X-Gm-Message-State: AOAM5308++geBKQQxqc+h9XXzU+vBwboURYkHBkYXDWaYM1JErC5a1p0
 Z1J+qQwfHdDGV45Cd9nMUj21pZnA1tc=
X-Google-Smtp-Source: ABdhPJxoFP1/hipX77FqcQUyEAOSv1tW+vEbmuu6sWAEFvAKoa0D0HwsO6XZftkvjo/0jL+bQA2bkw==
X-Received: by 2002:a05:6870:f29a:b0:de:eaa4:233a with SMTP id
 u26-20020a056870f29a00b000deeaa4233amr2586448oap.137.1650652584580; 
 Fri, 22 Apr 2022 11:36:24 -0700 (PDT)
Received: from localhost.localdomain ([2804:14c:485:4b69:9f29:454f:1c77:1b6b])
 by smtp.gmail.com with ESMTPSA id
 h21-20020a056808015500b00323c43663e2sm1006651oie.32.2022.04.22.11.36.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 22 Apr 2022 11:36:24 -0700 (PDT)
From: Fabio Estevam <festevam@gmail.com>
To: sam@ravnborg.org
Subject: [PATCH v2 1/2] dt-bindings: display: simple: Add Startek
 KD070WVFPA043-C069A panel
Date: Fri, 22 Apr 2022 15:36:13 -0300
Message-Id: <20220422183614.1762470-1-festevam@gmail.com>
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
Cc: Fabio Estevam <festevam@denx.de>, devicetree@vger.kernel.org,
 robh+dt@kernel.org, hs@denx.de, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Fabio Estevam <festevam@denx.de>

Add Startek KD070WVFPA043-C069A 7" TFT LCD panel compatible string.

Signed-off-by: Fabio Estevam <festevam@denx.de>
Acked-by: Sam Ravnborg <sam@ravnborg.org>
---
Changes since v1:
- None. Only added Sam's ack.

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

