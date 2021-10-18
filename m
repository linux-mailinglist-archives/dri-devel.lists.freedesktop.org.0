Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id F0A9F4329E5
	for <lists+dri-devel@lfdr.de>; Tue, 19 Oct 2021 00:52:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2D3ED6EA7A;
	Mon, 18 Oct 2021 22:52:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-x730.google.com (mail-qk1-x730.google.com
 [IPv6:2607:f8b0:4864:20::730])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4D10B6EA7A
 for <dri-devel@lists.freedesktop.org>; Mon, 18 Oct 2021 22:52:29 +0000 (UTC)
Received: by mail-qk1-x730.google.com with SMTP id b15so7635725qkl.10
 for <dri-devel@lists.freedesktop.org>; Mon, 18 Oct 2021 15:52:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=pTwNmZooOeOdog1xCjDMl0qLSkOmdnMEB9kSUbzvyVs=;
 b=Zoz+Q0vYszO7sH0Yrp65kSLPqwo9JHflXpR1b4XuZ/vsyU0myPO4VQf50U4wXXRJQS
 9or1TigHVAFAa7/Lv3SyVKSb7xsf/mp6BbFAhVKCk0R+8c9UHC/ZSaBlsydVgIPPr4Ix
 g7dP4ttnHIJ+rqRPC+LRDGPFcDrfLTB5xmBLga8vf4V0OLZW5r40cNDNyi/L4Dsr97OO
 QzrTQ6PlsxXEmUZqlqujKZdR6oUaeJYqjEL+nk3GnoRWTsIekFc1WSRVsRAVDTMAyk8G
 9qEaxl1FbP4eomidgZq689KCZS6e1T6XwCtjzdgZr1ZSDXaa1+ZioeptCnP8B/WSUVkM
 pk2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=pTwNmZooOeOdog1xCjDMl0qLSkOmdnMEB9kSUbzvyVs=;
 b=Nd370njoO+MMtubRcCOnPvqjYASNXxudXex/imrIvT4YFZFwqVhopwRLEWoDWDtYL1
 0fZ+F2KrdAMDsycJlkg611BTEIYxHwizkApODBaMn8fswpMlc0OAtwWAmGInuMn7CcSp
 LjUKZoftP/OnBtHjm4bO62uTHme+1Ojfvh+DECT9s4mLpO6xamySolK6rhkrytA9Yl1g
 OxouHREd4ikCIJiMqh5zFCtouIHJOwB4johAQyJAXP9oEr4Mzoh0fIo1uvc8WnyRyW/6
 7d2Po3u3HzaovJj1Mb/4TH5vzsoz0iQgzXWAna+T62/pWH0I06ZA1af4uVxJp+22vdcF
 y0lA==
X-Gm-Message-State: AOAM533Ofp3DYlhXxdM3RbdKmTt+h/XA0hjc2VnClLeE6peQq7khpT9O
 2+z7FZlt1HBB6KczoBsW/E8=
X-Google-Smtp-Source: ABdhPJxtsDkfoWenXcOFnFkU/MqbHgiaIl+m8yn79DSvhrEDh5pY6S6ubzzvj5Q24dWaIrwe3bmIWg==
X-Received: by 2002:a37:a050:: with SMTP id j77mr25074253qke.337.1634597548350; 
 Mon, 18 Oct 2021 15:52:28 -0700 (PDT)
Received: from localhost.localdomain ([67.8.38.84])
 by smtp.gmail.com with ESMTPSA id o130sm6951089qke.123.2021.10.18.15.52.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 18 Oct 2021 15:52:28 -0700 (PDT)
From: Julian Braha <julianbraha@gmail.com>
To: sam@ravnborg.org, thierry.reding@gmail.com, airlied@linux.ie,
 daniel@ffwll.ch, robh+dt@kernel.org
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org
Subject: [PATCH v2] dt-bindings: panel-simple-dsi: add Tianma TL057FVXP01
Date: Mon, 18 Oct 2021 18:52:21 -0400
Message-Id: <20211018225221.25330-1-julianbraha@gmail.com>
X-Mailer: git-send-email 2.30.2
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

Adds the bindings for the Tianma TL057FVXP01 DSI panel,
found on the Motorola Moto G6.

v2:
Fixed accidental whitespace deletion.

Signed-off-by: Julian Braha <julianbraha@gmail.com>
---
 .../devicetree/bindings/display/panel/panel-simple-dsi.yaml     | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/panel/panel-simple-dsi.yaml b/Documentation/devicetree/bindings/display/panel/panel-simple-dsi.yaml
index fbd71669248f..92a702d141e1 100644
--- a/Documentation/devicetree/bindings/display/panel/panel-simple-dsi.yaml
+++ b/Documentation/devicetree/bindings/display/panel/panel-simple-dsi.yaml
@@ -55,6 +55,8 @@ properties:
       - samsung,sofef00
         # Shangai Top Display Optoelectronics 7" TL070WSH30 1024x600 TFT LCD panel
       - tdo,tl070wsh30
+        # Tianma Micro-electronics TL057FVXP01 5.7" 2160x1080 LCD panel
+      - tianma,tl057fvxp01
 
   reg:
     maxItems: 1
-- 
2.30.2

