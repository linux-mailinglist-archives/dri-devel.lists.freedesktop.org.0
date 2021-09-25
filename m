Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DEC2418197
	for <lists+dri-devel@lfdr.de>; Sat, 25 Sep 2021 13:25:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7BF326E3EC;
	Sat, 25 Sep 2021 11:25:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x535.google.com (mail-ed1-x535.google.com
 [IPv6:2a00:1450:4864:20::535])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CC7B16E3E3
 for <dri-devel@lists.freedesktop.org>; Sat, 25 Sep 2021 10:31:59 +0000 (UTC)
Received: by mail-ed1-x535.google.com with SMTP id bx4so46518157edb.4
 for <dri-devel@lists.freedesktop.org>; Sat, 25 Sep 2021 03:31:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=YeH5vkzIpa6TeE8Tz3mSyGZU/tR0+zS/g4jLCGFfdvY=;
 b=USmlh/DZPVWtlxSSuUkmPMHHOwRs9Xv9zziDWV2tjKDDSy1mtSHsSwcMeY6RODpGw/
 bEe6jw9DJEKZKnaYrQ4vLeEoJii6k7oStRkTA/BzA+d/5g5uQXxSZTL6/lAKffMTqwEA
 QOdQVyQlrFmot5aAw3JrYFfnf3d7N9S4IG8n4qrybJKnBDJwbMaooHTa9+FdTGmtUgVh
 ENySnXeG7vOlgTOaLlevLTYvomd5ouIWeE4uXwMU22pr2w7kIds6XU7Zcvdeor1fAbJV
 GA0Et9j6BwOdRfWdrW0pVEpnfjWMVuSWka5gvCly19gLgxdWwZU5JL/+wtrKWaoIL8Ic
 uxXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=YeH5vkzIpa6TeE8Tz3mSyGZU/tR0+zS/g4jLCGFfdvY=;
 b=DJ0voi8GmgBlKHMFQmQ5XAMcn9uemfauQcs6FfAs2G8h/b+EBNk+IgPU9hOnYB0rJu
 FCOwcZgpQKJ0PUUW2appBvuS3K2QKKSWJ47xOH3auRvqhJIvOpQOKCiuFxpyOn/Y3iX8
 mVIdyRaUEc4KKGMzYFOqqylGtmrba6MeCS0qXjDXHkqW+i4692XURCnkjsQtNZt8307B
 0nuyCGqdRe7QL23DeSU/T47wKiHF/RexaIVX6vhgVFMHH09AiHGGFgDuW+47LH8zLp+V
 5lbPwJsRYe2inRNeL7paI05uBk7T9/jzUpC/NDSGqu7dqO1J7MqmA48Eqsb7dLilFkQP
 xUKw==
X-Gm-Message-State: AOAM5314SRP3Tio+kasswrZj7HtdGX4QLhH1qylQdQsr8z7HvS7jP05y
 eqdfW4ddCwXqBUVs8pAnDRY=
X-Google-Smtp-Source: ABdhPJzlNASQZT2iU0BZikQkFfvD82LU7XQPQMGqTq6pq/QLz3B4QtN9njOy5nJ9iqrZmXuGfG4w3w==
X-Received: by 2002:aa7:c905:: with SMTP id b5mr10801924edt.380.1632565918123; 
 Sat, 25 Sep 2021 03:31:58 -0700 (PDT)
Received: from localhost.localdomain (net-93-144-178-230.cust.vodafonedsl.it.
 [93.144.178.230])
 by smtp.googlemail.com with ESMTPSA id m15sm6203750ejx.73.2021.09.25.03.31.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 25 Sep 2021 03:31:57 -0700 (PDT)
From: Raffaele Tranquillini <raffaele.tranquillini@gmail.com>
To: thierry.reding@gmail.com, sam@ravnborg.org, airlied@linux.ie,
 daniel@ffwll.ch
Cc: y.oudjana@protonmail.com, ~postmarketos/upstreaming@lists.sr.ht,
 phone-devel@vger.kernel.org,
 Raffaele Tranquillini <raffaele.tranquillini@gmail.com>,
 Rob Herring <robh+dt@kernel.org>, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH 2/2] dt-bindings: panel-simple-dsi: add JDI R63452 panel
 bindings
Date: Sat, 25 Sep 2021 12:31:33 +0200
Message-Id: <20210925103135.518443-1-raffaele.tranquillini@gmail.com>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Sat, 25 Sep 2021 11:25:43 +0000
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

This add the bindings for the JDI FHD_R63452 1080x1920 5.2" LCD DSI
 panel used on the Xiaomi Mi 5 smartphone.

Signed-off-by: Raffaele Tranquillini <raffaele.tranquillini@gmail.com>
---
 .../devicetree/bindings/display/panel/panel-simple-dsi.yaml     | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/panel/panel-simple-dsi.yaml b/Documentation/devicetree/bindings/display/panel/panel-simple-dsi.yaml
index fbd71669248f..2c00813f5d20 100644
--- a/Documentation/devicetree/bindings/display/panel/panel-simple-dsi.yaml
+++ b/Documentation/devicetree/bindings/display/panel/panel-simple-dsi.yaml
@@ -35,6 +35,8 @@ properties:
       - boe,tv080wum-nl0
         # Innolux P079ZCA 7.85" 768x1024 TFT LCD panel
       - innolux,p079zca
+        # JDI FHD_R63452 1080x1920 5.2" IPS LCD Panel
+      - jdi,fhd-r63452
         # Khadas TS050 5" 1080x1920 LCD panel
       - khadas,ts050
         # Kingdisplay KD097D04 9.7" 1536x2048 TFT LCD panel
-- 
2.32.0

