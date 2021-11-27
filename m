Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FBF445FC51
	for <lists+dri-devel@lfdr.de>; Sat, 27 Nov 2021 04:19:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 91C956EE01;
	Sat, 27 Nov 2021 03:19:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DC6416EE03
 for <dri-devel@lists.freedesktop.org>; Sat, 27 Nov 2021 03:19:32 +0000 (UTC)
Received: from tr.lan (ip-89-176-112-137.net.upcbroadband.cz [89.176.112.137])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 (Authenticated sender: marex@denx.de)
 by phobos.denx.de (Postfix) with ESMTPSA id 3F6BA80FCC;
 Sat, 27 Nov 2021 04:19:31 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
 s=phobos-20191101; t=1637983171;
 bh=QmRq/Q8OoErOecghg2rU09Wug4kA3wt60hBDJep3zTs=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=zrREr/JUNJqW6EhZ46S1xduFjY25by1klug+Or394pZ6tLLQAWZXCzrE3LTpijgcX
 duZ8tvmkLD4yOuPmXoz5S7N4PFzNzKGZgR/5XftGPdUMqD1LfO8paP4Z7KwbK+uiMp
 49Utog2sCcuW6U0khYuJlKT8GgaXitgCTZKrJzyxqX/01np1EqAfrkez9ZiT3ZsTy5
 X4vTkVQJgurTUgClUS0tBT6dUiVKX1XeWON9aEpw2X/bUPWShtR1c9PsAFjxRZRox7
 BQCslHrieV9qFVSY55/VPnrpeUnqAtuwlzVz7ZVp7vECswGMXW/ZdVHkz+Q9ndAiOC
 lOg4OvrELiDuw==
From: Marek Vasut <marex@denx.de>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 2/3] dt-bindings: display: simple: Add Team Source Display
 TST043015CMHX panel
Date: Sat, 27 Nov 2021 04:19:08 +0100
Message-Id: <20211127031909.283383-2-marex@denx.de>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20211127031909.283383-1-marex@denx.de>
References: <20211127031909.283383-1-marex@denx.de>
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

Add Team Source Display TST043015CMHX 4.3" 480x272 DPI panel
compatible string.

Signed-off-by: Marek Vasut <marex@denx.de>
Cc: Rob Herring <robh+dt@kernel.org>
Cc: Sam Ravnborg <sam@ravnborg.org>
Cc: devicetree@vger.kernel.org
To: dri-devel@lists.freedesktop.org
---
 .../devicetree/bindings/display/panel/panel-simple.yaml         | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/panel/panel-simple.yaml b/Documentation/devicetree/bindings/display/panel/panel-simple.yaml
index f3c9395d23b6..62f5f050c1bc 100644
--- a/Documentation/devicetree/bindings/display/panel/panel-simple.yaml
+++ b/Documentation/devicetree/bindings/display/panel/panel-simple.yaml
@@ -290,6 +290,8 @@ properties:
       - starry,kr070pe2t
         # Starry 12.2" (1920x1200 pixels) TFT LCD panel
       - starry,kr122ea0sra
+        # Team Source Display Technology TST043015CMHX 4.3" WQVGA TFT LCD panel
+      - team-source-display,tst043015cmhx
         # Tianma Micro-electronics TM070JDHG30 7.0" WXGA TFT LCD panel
       - tianma,tm070jdhg30
         # Tianma Micro-electronics TM070JVHG33 7.0" WXGA TFT LCD panel
-- 
2.33.0

