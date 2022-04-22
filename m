Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CF0B50B4EA
	for <lists+dri-devel@lfdr.de>; Fri, 22 Apr 2022 12:23:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 323F010E923;
	Fri, 22 Apr 2022 10:23:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from phobos.denx.de (phobos.denx.de
 [IPv6:2a01:238:438b:c500:173d:9f52:ddab:ee01])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9A67410EA80
 for <dri-devel@lists.freedesktop.org>; Fri, 22 Apr 2022 10:23:02 +0000 (UTC)
Received: from tr.lan (ip-86-49-12-201.net.upcbroadband.cz [86.49.12.201])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 (Authenticated sender: marex@denx.de)
 by phobos.denx.de (Postfix) with ESMTPSA id 2688C8186D;
 Fri, 22 Apr 2022 12:22:59 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
 s=phobos-20191101; t=1650622980;
 bh=Ny7NWkl8uriuaT0g2E4LEHXq8AExjh+FJOsGUX23860=;
 h=From:To:Cc:Subject:Date:From;
 b=PHV+gIhBRaQukKgIMOePySlBrYE8us88OiN0R7i4gV2/izlLPJAh4JCn0gzuXiI4F
 wYbaTtY2eXF3jZFqegjl6ldBTQCsenRwYYbRKVdq16DvX/PlN0bS3afP9A/NSxQgOO
 a5wZo45dUFC9RDcnYTj2yxRo+qPeYhktWzGp4lb9l+xeD668FwWomXkc/uQdL4i6E9
 2V6+lJzPxURn8JvSIg4tLbn23eGTwQGVYjxsUDhv/7AtYYED2NTisyXIgrjC3CRYJQ
 GXwW9mUrMiTQpQhXHnEEF+k5/bogoRFPfBkinjoH/Jih6czHJrlPGDNMZemYlu8igr
 kMbqDVKJrYOxA==
From: Marek Vasut <marex@denx.de>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v2 1/2] dt-bindings: display: simple: Add DataImage
 FG040346DSSWBG04 compatible string
Date: Fri, 22 Apr 2022 12:22:41 +0200
Message-Id: <20220422102242.18959-1-marex@denx.de>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Virus-Scanned: clamav-milter 0.103.5 at phobos.denx.de
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
 robert.foss@linaro.org, Rob Herring <robh+dt@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Sam Ravnborg <sam@ravnborg.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add DataImage FG040346DSSWBG04 4.3" 480x272 TFT LCD 24bit DPI panel
compatible string.

Acked-by: Thomas Zimmermann <tzimmermann@suse.de>
Signed-off-by: Marek Vasut <marex@denx.de>
Cc: Rob Herring <robh+dt@kernel.org>
Cc: Sam Ravnborg <sam@ravnborg.org>
Cc: Thomas Zimmermann <tzimmermann@suse.de>
Cc: devicetree@vger.kernel.org
To: dri-devel@lists.freedesktop.org
---
V2: Add AB from Thomas
---
 .../devicetree/bindings/display/panel/panel-simple.yaml         | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/panel/panel-simple.yaml b/Documentation/devicetree/bindings/display/panel/panel-simple.yaml
index 1eb9dd4f8f58..cfe7bb9f89de 100644
--- a/Documentation/devicetree/bindings/display/panel/panel-simple.yaml
+++ b/Documentation/devicetree/bindings/display/panel/panel-simple.yaml
@@ -105,6 +105,8 @@ properties:
       - chunghwa,claa101wb01
         # Chunghwa Picture Tubes Ltd. 10.1" WXGA TFT LCD panel
       - chunghwa,claa101wb03
+        # DataImage, Inc. 4.3" WQVGA (480x272) TFT LCD panel with 24-bit parallel interface.
+      - dataimage,fg040346dsswbg04
         # DataImage, Inc. 7" WVGA (800x480) TFT LCD panel with 24-bit parallel interface.
       - dataimage,scf0700c48ggu18
         # DLC Display Co. DLC1010GIG 10.1" WXGA TFT LCD Panel
-- 
2.35.1

