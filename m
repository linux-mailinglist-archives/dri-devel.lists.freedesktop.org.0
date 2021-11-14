Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 98A4644FB74
	for <lists+dri-devel@lfdr.de>; Sun, 14 Nov 2021 21:07:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 65B7089E32;
	Sun, 14 Nov 2021 20:07:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x22d.google.com (mail-lj1-x22d.google.com
 [IPv6:2a00:1450:4864:20::22d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4B0CE89E32
 for <dri-devel@lists.freedesktop.org>; Sun, 14 Nov 2021 20:07:44 +0000 (UTC)
Received: by mail-lj1-x22d.google.com with SMTP id t11so30832920ljh.6
 for <dri-devel@lists.freedesktop.org>; Sun, 14 Nov 2021 12:07:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=XpgIfSS+RMObgLYbwSybA25conQ/tCzGIbJEqeoL6Oo=;
 b=RtBUNRlgubtcgBLuCmKNmb6TsQ1nE2Y4S2lFCwr+wGhTLZYVml1Dzi/wX0UvHjG8yo
 VaG9HqBAuUOQ+0QG4q0vVWzWzPmjqID6xOdhxhEFGu/umpzpRiQFovLWyS0dZz62SLSy
 5fd5nY8gg+5weAZ8zGtt1sqT4MLRwCZ2sQOEWcSJxM8JsgpvxDnn4PV7+lcbsrztRc82
 nJNRx85jgPCveYDOSrsebXUxW8P4tXR+OLM4M3SPMgYiULUX4a7s3ztIbMZoB2xz/l0j
 6UWKmrym8TBWsv04vC6MvRZhbIkCCJ2HgGytsCptiLHXz+n8WH/dVxosjVbWzLve/4d7
 1LxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=XpgIfSS+RMObgLYbwSybA25conQ/tCzGIbJEqeoL6Oo=;
 b=7flVbJsvtOegJgWdkW3CL7mnObq8nwyRUwOamyDn2gXewKLlumLo8E60qwTTTZErta
 rro0mghyjlLtTkK0Q+XNsC5YOm09xzKaIvC9SciKBITUFjAN5KNwk8dnoznIffd3dd1T
 SGvn3k2X+Iet6GA8bLKDeFNuHRjs3biMl3pfuxm0CHPCGHlZ9kqVeC2Pm++J4qrEMuwz
 TPXdf9LNApW7n2gDUI7OeA6QEyCp4vufWpSaTITXJg/V9tgP50bZCE2hAf3mOUFt4a7T
 Y/Er6vNL+xHz+UAAbzDAkpDbQjTuF4I1mjSsVJRbTBiCiodPsREl2aqSCbhDSKL2Zj8r
 mO2g==
X-Gm-Message-State: AOAM530czITYdXDkzsPwAp4h2HYpEWx/h8se2FNMYqyMaI0JSA9rEe/B
 gpHVL57s/X8Nyxdrui9U2SXmgzoL6G0=
X-Google-Smtp-Source: ABdhPJwk5a8XUw/2bm1F0b0gxOiSzOZ2k6gDKu70LNL3EoxZrFn/R6f+EsiQ84Y5hT1mJXaXTTqTgQ==
X-Received: by 2002:a2e:9702:: with SMTP id r2mr33446069lji.482.1636920462712; 
 Sun, 14 Nov 2021 12:07:42 -0800 (PST)
Received: from localhost.localdomain (46-138-46-211.dynamic.spd-mgts.ru.
 [46.138.46.211])
 by smtp.gmail.com with ESMTPSA id d30sm1204644lfv.58.2021.11.14.12.07.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 14 Nov 2021 12:07:42 -0800 (PST)
From: Dmitry Osipenko <digetx@gmail.com>
To: Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>,
 Rob Herring <robh+dt@kernel.org>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, Anton Bambura <jenneron@protonmail.com>
Subject: [PATCH v1 1/2] dt-bindings: sharp,
 lq101r1sx01: Add compatible for LQ101R1SX03
Date: Sun, 14 Nov 2021 23:07:16 +0300
Message-Id: <20211114200717.28986-2-digetx@gmail.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211114200717.28986-1-digetx@gmail.com>
References: <20211114200717.28986-1-digetx@gmail.com>
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
Cc: linux-tegra@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Anton Bambura <jenneron@protonmail.com>

LQ101R1SX03 is compatible with LQ101R1SX01, document it.

Signed-off-by: Anton Bambura <jenneron@protonmail.com>
---
 .../devicetree/bindings/display/panel/sharp,lq101r1sx01.yaml  | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/display/panel/sharp,lq101r1sx01.yaml b/Documentation/devicetree/bindings/display/panel/sharp,lq101r1sx01.yaml
index a679d3647dbd..f7514eb9ebda 100644
--- a/Documentation/devicetree/bindings/display/panel/sharp,lq101r1sx01.yaml
+++ b/Documentation/devicetree/bindings/display/panel/sharp,lq101r1sx01.yaml
@@ -30,7 +30,9 @@ allOf:
 
 properties:
   compatible:
-    const: sharp,lq101r1sx01
+    enum:
+      - sharp,lq101r1sx01
+      - sharp,lq101r1sx03
 
   reg: true
   power-supply: true
-- 
2.33.1

