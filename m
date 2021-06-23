Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CA58E3B1EE1
	for <lists+dri-devel@lfdr.de>; Wed, 23 Jun 2021 18:43:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 651226E94F;
	Wed, 23 Jun 2021 16:43:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-f44.google.com (mail-io1-f44.google.com
 [209.85.166.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 251CF6E94F
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Jun 2021 16:43:13 +0000 (UTC)
Received: by mail-io1-f44.google.com with SMTP id b14so4221906iow.13
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Jun 2021 09:43:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=fs5wqocEnsX9tgAffHRTk2LbXor5QUxIFTJtXjA5IEg=;
 b=RphOkh3YrpIeid9UH+pIioQVE+TradnkayelBF+IU/Hts+VrDVJkEV789Pi90w/5Po
 f+iMAq1TUYF8qEYG64pjJbSfSAH+h0I6tqRJYUA/pHh9qOyA0w/zChLrSHUrpENXMM5H
 8YgGJcNzHV8wa68UjO3Mz4Efof8seecyXXuO/bmFN8F+qR8NGqhKuaiE3DbvhQwCDfHQ
 YQtvIIq4WwPOImSKzUb7OOou0/BpM0l3351BAcCx2WH+ti2GIGJAN94hPCqVpCm+6HJi
 Hg745KyRtcqnljF312zK93T3Qqq6wzslnNI6VsD7ugvmOf8029xb1HM+ujXX72xySbV+
 zgbw==
X-Gm-Message-State: AOAM531ddWvK37QtMpFItR3mUzOXrJWcaNbDL3Hd7MGw4+XduyPWvQLK
 KOLNjcMrTRj5zOVeTtpLxQ==
X-Google-Smtp-Source: ABdhPJwtRJdQCc2iLaRjmdHa8/bwsCpCy5NB+RtOuhiI4r2uwcczqfYdMV7TjuZ1ybdpg0xrgpkHdQ==
X-Received: by 2002:a5d:9445:: with SMTP id x5mr407043ior.2.1624466592587;
 Wed, 23 Jun 2021 09:43:12 -0700 (PDT)
Received: from xps15.herring.priv ([64.188.179.248])
 by smtp.googlemail.com with ESMTPSA id z2sm150232iol.45.2021.06.23.09.43.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 23 Jun 2021 09:43:11 -0700 (PDT)
From: Rob Herring <robh@kernel.org>
To: devicetree@vger.kernel.org
Subject: [PATCH] dt-bindings: display: renesas,du: Fix 'ports' reference
Date: Wed, 23 Jun 2021 10:43:08 -0600
Message-Id: <20210623164308.2570164-1-robh@kernel.org>
X-Mailer: git-send-email 2.27.0
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
Cc: linux-renesas-soc@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
 linux-kernel@vger.kernel.org,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Fix the renesas,du binding 'ports' schema which is referencing the 'port'
schema instead of the 'ports' schema.

Fixes: 99d66127fad2 ("dt-bindings: display: renesas,du: Convert binding to YAML")
Cc: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Cc: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
Cc: dri-devel@lists.freedesktop.org
Cc: linux-renesas-soc@vger.kernel.org
Signed-off-by: Rob Herring <robh@kernel.org>
---
 Documentation/devicetree/bindings/display/renesas,du.yaml | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/display/renesas,du.yaml b/Documentation/devicetree/bindings/display/renesas,du.yaml
index 121596f106da..5f4345d43020 100644
--- a/Documentation/devicetree/bindings/display/renesas,du.yaml
+++ b/Documentation/devicetree/bindings/display/renesas,du.yaml
@@ -55,7 +55,7 @@ properties:
     maxItems: 1
 
   ports:
-    $ref: /schemas/graph.yaml#/properties/port
+    $ref: /schemas/graph.yaml#/properties/ports
     description: |
       The connections to the DU output video ports are modeled using the OF
       graph bindings specified in Documentation/devicetree/bindings/graph.txt.
-- 
2.27.0

