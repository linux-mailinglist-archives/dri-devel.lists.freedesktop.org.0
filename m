Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B561931F579
	for <lists+dri-devel@lfdr.de>; Fri, 19 Feb 2021 08:55:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1C0ED6EAAD;
	Fri, 19 Feb 2021 07:54:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtpcmd0986.aruba.it (smtpcmd0986.aruba.it [62.149.156.86])
 by gabe.freedesktop.org (Postfix) with ESMTP id 6DB526E88C
 for <dri-devel@lists.freedesktop.org>; Thu, 18 Feb 2021 22:55:24 +0000 (UTC)
Received: from ubuntu.localdomain ([146.241.168.111])
 by Aruba Outgoing Smtp  with ESMTPSA
 id CsCZl9zcdJFRNCsCglTfOe; Thu, 18 Feb 2021 23:55:23 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=aruba.it; s=a1;
 t=1613688923; bh=4RILZ40zQCJA+aPK72uj+t+tdFhB0RpH/VA+E4Qfrr0=;
 h=From:To:Subject:Date:MIME-Version;
 b=aY2tdmQJL7oGIanZPWCAl/A+TX7OuBAJuNJ6y4DwfGStOXHWFm3HKjJdlQEef/bY+
 9F5nfpyQRix511UZqHp8buV/HgI8uhc8qUwrg3ztHbcxNXckIWokq1fgUI4CQNKb6D
 wLzuVHVqdtxOyA+Ph/KzsN3QBysmsrqhEPU9QAvBr4K17EQb+WSMzWLhvnTMIOLqXa
 0za55YN2rzWDtlQQcnkjM7GH3+f05+b7pvTz7Vm5L/MJngM+f6jB5uSRvwRbdf7tgi
 yzeY/enMhYdgK7bKOqXISzO4fxhatFmemXP1HO200qk5a19t+3OHruz1oJU2zNUfgA
 Ohj/sqmIHL13w==
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: 
Subject: [PATCH 1/9] dt-bindings: Add Jenson Display vendor prefix
Date: Thu, 18 Feb 2021 23:54:49 +0100
Message-Id: <20210218225458.823773-2-giulio.benetti@benettiengineering.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210218225458.823773-1-giulio.benetti@benettiengineering.com>
References: <20210218225458.823773-1-giulio.benetti@benettiengineering.com>
MIME-Version: 1.0
X-CMAE-Envelope: MS4wfC2U4PGhLWAIQ1qqYukHnom7XUkbku/KDlsrt0y8j/za5fhiuSVmeYTp3eJ9ouFut3Bb/IxUqkuFaSgekIJhpROdEcUKkafajJTvUb3ikKDRU3zEurrO
 7l19AH/HYFqI5zzyQNGU3F4qp9pJ8MT4Q3QOX7MFaBBPkvWJVJWG+pgag5/HepkXaey9/CikcgG6xPPgJ+tbsy8RtbF1eb+/IjF4PuKdXz9RipOmKgcqgDZI
 dPxxuc9GkJGYUDf7UrfKLba4ODCS4wmpgxDZv+hG9Ix69j8p/5aCYuqOJbLkDk6tkFqfRRqUpy/kr0KDAYzTBnxmRl/UwqdPvstCfBCeRFIjhoal3kmFwT4q
 djy6uLLB+rA7X4Pi/0uF2C4DCD0vQV17IRpBzcd0nAJJSa/7ReVjj7SJ3JJk2Rqcw1jvlBNvgEuv5uXJpGnoDWZCzmbtFKHQeP/v9T7JSVMXq1GQ3XNduQwA
 6i+Po1RREWXzCd1p/iBOqEq/Y6I7aofIstbvNCUUpoCkn3PUY0dmEN29uSnqwyHfZCUH7TpnxXFRoGm+/jJmSPoDELAE443iEBv7F6iuz+5nMaypyuvlA5+k
 lzhj2ELC+DKSZ9X7sUIXty5ZuMhlXrcEe7PcM5x0lfboQDzfRZSeq8O5T2ADpXM239lk4/trS8d2DZjIskFOGj4D+pB3AC846orDhjcQx94ENP7pXhpNX8ZS
 i7pwycQRZh8P16VCxawx1RXsZnRIR6ejblmgDboVqxkp6Pc7CVUvfJAG2ZssXISD6+FnE0ibnujfbtNH0xwqvBfKOZlmC7+RjnPgnn1uG3rJwgrCyabV8A==
X-Mailman-Approved-At: Fri, 19 Feb 2021 07:54:58 +0000
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
Cc: devicetree@vger.kernel.org,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
 Arnd Bergmann <arnd@arndb.de>, David Airlie <airlied@linux.ie>,
 Shawn Guo <shawnguo@kernel.org>, dri-devel@lists.freedesktop.org,
 Daniel Palmer <daniel@0x0f.com>, linux-kernel@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>, Lubomir Rintel <lkundrak@v3.sk>,
 Thierry Reding <thierry.reding@gmail.com>,
 Krzysztof Kozlowski <krzk@kernel.org>, allen <allen.chen@ite.com.tw>,
 Max Merchel <Max.Merchel@tq-group.com>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>, Sam Ravnborg <sam@ravnborg.org>,
 Giulio Benetti <giulio.benetti@micronovasrl.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Giulio Benetti <giulio.benetti@micronovasrl.com>

Update Documentation/devicetree/bindings/vendor-prefixes.yaml to
include "jenson" as a vendor prefix for "Jenson Display".
Company website: http://www.jensondisplay.com/

Signed-off-by: Giulio Benetti <giulio.benetti@micronovasrl.com>
Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
---
 Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/vendor-prefixes.yaml b/Documentation/devicetree/bindings/vendor-prefixes.yaml
index 041ae90b0d8f..6fe66df86477 100644
--- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
+++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
@@ -547,6 +547,8 @@ patternProperties:
     description: Japan Display Inc.
   "^jedec,.*":
     description: JEDEC Solid State Technology Association
+  "^jenson,.*":
+    description: Jenson Display
   "^jesurun,.*":
     description: Shenzhen Jesurun Electronics Business Dept.
   "^jianda,.*":
-- 
2.25.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
