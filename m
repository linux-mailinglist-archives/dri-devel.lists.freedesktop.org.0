Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3671945FC4F
	for <lists+dri-devel@lfdr.de>; Sat, 27 Nov 2021 04:19:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 618576EE00;
	Sat, 27 Nov 2021 03:19:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 480376EE00
 for <dri-devel@lists.freedesktop.org>; Sat, 27 Nov 2021 03:19:30 +0000 (UTC)
Received: from tr.lan (ip-89-176-112-137.net.upcbroadband.cz [89.176.112.137])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 (Authenticated sender: marex@denx.de)
 by phobos.denx.de (Postfix) with ESMTPSA id C928780F9C;
 Sat, 27 Nov 2021 04:19:27 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
 s=phobos-20191101; t=1637983168;
 bh=pGyO8fpSDuDUsNsNVCHjWVp0mRM9yNyV7jFc3G0YZwg=;
 h=From:To:Cc:Subject:Date:From;
 b=zu8h176qRblJCDjyUi7D/+/vHwivmYHA7V1/sSZaD+x7AYdBA5TwknIINzmaETuBj
 6cf8h3x6RLI5oTUqy5h305m7U7oLKlhu+NMrj4zdPxwHKwSHiHqL8X/gXXjZQ75leh
 2bYt0vsRvVc/CI0mTr9okYGPGqWOyVvlvjfLeMZScCBrJ7aSm8j6gdIzxdXBZcdR4m
 4AV/68hs7odV0+ED52h+E9eeIYhoURyLDjDkOSyIp/AD6PyjiN3q7Mhre3bkEdibEY
 kVFYYU8tt/jlNHY5rfz9Sor5I68rK6TdYpUGE/8SHyGKOrvACN4E4FaELX0iv4Hs8L
 H8SFa8YTKDdbg==
From: Marek Vasut <marex@denx.de>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 1/3] dt-bindings: Add Team Source Display Technology vendor
 prefix
Date: Sat, 27 Nov 2021 04:19:07 +0100
Message-Id: <20211127031909.283383-1-marex@denx.de>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Virus-Scanned: clamav-milter 0.103.2 at phobos.denx.de
X-Virus-Status: Clean
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
Cc: Marek Vasut <marex@denx.de>, devicetree@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>, Sam Ravnborg <sam@ravnborg.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add vendor prefix for Team Source Display Technology Co., Ltd.

Signed-off-by: Marek Vasut <marex@denx.de>
Cc: Rob Herring <robh+dt@kernel.org>
Cc: Sam Ravnborg <sam@ravnborg.org>
Cc: devicetree@vger.kernel.org
To: dri-devel@lists.freedesktop.org
---
NOTE: All the documentation abbreviates the company name as TSD,
      but that vendor prefix is already taken.
---
 Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/vendor-prefixes.yaml b/Documentation/devicetree/bindings/vendor-prefixes.yaml
index 84cd16fe9380..95435428f1f1 100644
--- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
+++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
@@ -1240,6 +1240,8 @@ patternProperties:
     description: Truly Semiconductors Limited
   "^visionox,.*":
     description: Visionox
+  "^team-source-display,.*":
+    description: Shenzhen Team Source Display Technology Co., Ltd. (TSD)
   "^tsd,.*":
     description: Theobroma Systems Design und Consulting GmbH
   "^tyan,.*":
-- 
2.33.0

