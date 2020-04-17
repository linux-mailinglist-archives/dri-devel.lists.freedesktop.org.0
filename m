Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9AE571AD67B
	for <lists+dri-devel@lfdr.de>; Fri, 17 Apr 2020 08:53:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C619C6E347;
	Fri, 17 Apr 2020 06:53:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com
 [IPv6:2a00:1450:4864:20::441])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F12DE6E347
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Apr 2020 06:53:37 +0000 (UTC)
Received: by mail-wr1-x441.google.com with SMTP id d27so1786684wra.1
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Apr 2020 23:53:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=K/0zoHrBlMR3DZlg98Em/9230jK4Ec4IG04PFP4xQ44=;
 b=BE2nEUk+WZiH1EJpZ9tC2vWtZqW87Kk/w06Raq2RF+GmPOtYQJXVFKix2TS3F8ygwD
 PwAxRr5bWf3KrV02zm6qOLjEaHPd4Hd+QYfiYalZRMWcr5HyNyR5sBDwrln1CLPiXnJv
 T+KQ7HNH3mU/e9lTYIc4Bv76cBy84puEFS7U8h5sZXk5N6PexuqCe/3gAP0nUzIrwXDJ
 fRssq44e1gUef/eVcsj24F77JR8C432FuwuI+vkZs8ADEkwb16ZodJB0eBRT983dK0ud
 pGUEv4MOsKX8KmrL19wnaqgi5v2TtlvpFHYHabVudUTiMOgcF/1SzSUvIBKdcGTSiuz4
 4UKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=K/0zoHrBlMR3DZlg98Em/9230jK4Ec4IG04PFP4xQ44=;
 b=sBS4yaXRuCocwJQJqmXt9mrLkGvuTLp129jgv5h+mkOb4Gdeb2Yxbq6X33r/L1Agx3
 CadppkFTpAnyUJMIkdrL7bnG0V8BCKF5EWXKo6CAHjGi2iYguHSsWIRmGZ34qIl4y5Wh
 mxohMkHLb6byM/v3KnF9o31W5LaDLyHacFeWmf7CSilnPLym7G/2eP8STNaj8QfCokWi
 bfBdzYX1/WVLvk4hOuQ0+s/6P5KaALuqhzUgolIkbqj7SUXkqwu7RYe7I6Az0RMlAFxs
 ViHGx+mjoP4IxmdocJJSESWOq5s3RQMgGAsWRikaitTAEDFryUsTgIck4Kl0CrmwmBme
 Xt7A==
X-Gm-Message-State: AGi0Pub5pytcwifXuhVkNSZJN16gIJW+gkY1rxguObS+Mrky2AAjhroc
 uXfv9abbZkR6WRHJI30TwwE=
X-Google-Smtp-Source: APiQypIl5Ir0ioY2kZc0ZIdoCByjDBHyG6eBTWsNyaJmVZYmdVnIvz3yrByACmf7pUwLWKne+1AZ6Q==
X-Received: by 2002:a5d:54d0:: with SMTP id x16mr2157112wrv.86.1587106416571; 
 Thu, 16 Apr 2020 23:53:36 -0700 (PDT)
Received: from localhost (pD9E51D62.dip0.t-ipconnect.de. [217.229.29.98])
 by smtp.gmail.com with ESMTPSA id o18sm4236593wrp.23.2020.04.16.23.53.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 16 Apr 2020 23:53:35 -0700 (PDT)
From: Thierry Reding <thierry.reding@gmail.com>
To: Sam Ravnborg <sam@ravnborg.org>,
	Rob Herring <robh+dt@kernel.org>
Subject: [PATCH] dt-bindings: panel: Document some missing compatible strings
Date: Fri, 17 Apr 2020 08:53:28 +0200
Message-Id: <20200417065328.1578603-1-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.24.1
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
Cc: devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Thierry Reding <treding@nvidia.com>

Add missing compatible strings for the Panasonic and Chunghwa panels
found on NVIDIA Dalmore and Cardhu boards.

Signed-off-by: Thierry Reding <treding@nvidia.com>
---
 .../devicetree/bindings/display/panel/panel-simple-dsi.yaml     | 2 ++
 .../devicetree/bindings/display/panel/panel-simple.yaml         | 2 ++
 2 files changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/panel/panel-simple-dsi.yaml b/Documentation/devicetree/bindings/display/panel/panel-simple-dsi.yaml
index b2e8742fd6af..88ac75333a5e 100644
--- a/Documentation/devicetree/bindings/display/panel/panel-simple-dsi.yaml
+++ b/Documentation/devicetree/bindings/display/panel/panel-simple-dsi.yaml
@@ -29,6 +29,8 @@ properties:
       # compatible must be listed in alphabetical order, ordered by compatible.
       # The description in the comment is mandatory for each compatible.
 
+        # Panasonic 10" WUXGA TFT LCD panel
+      - panasonic,vvx10f004b00
         # Panasonic 10" WUXGA TFT LCD panel
       - panasonic,vvx10f034n00
 
diff --git a/Documentation/devicetree/bindings/display/panel/panel-simple.yaml b/Documentation/devicetree/bindings/display/panel/panel-simple.yaml
index 393ffc6acbba..6c21650664e2 100644
--- a/Documentation/devicetree/bindings/display/panel/panel-simple.yaml
+++ b/Documentation/devicetree/bindings/display/panel/panel-simple.yaml
@@ -82,6 +82,8 @@ properties:
         # Chunghwa Picture Tubes Ltd. 10.1" WXGA TFT LCD panel
       - chunghwa,claa101wa01a
         # Chunghwa Picture Tubes Ltd. 10.1" WXGA TFT LCD panel
+      - chunghwa,claa101wb01
+        # Chunghwa Picture Tubes Ltd. 10.1" WXGA TFT LCD panel
       - chunghwa,claa101wb03
         # DataImage, Inc. 7" WVGA (800x480) TFT LCD panel with 24-bit parallel interface.
       - dataimage,scf0700c48ggu18
-- 
2.24.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
