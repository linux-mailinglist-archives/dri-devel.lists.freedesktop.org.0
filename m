Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AFEF157C282
	for <lists+dri-devel@lfdr.de>; Thu, 21 Jul 2022 05:03:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A29188B285;
	Thu, 21 Jul 2022 03:03:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3E5AC8B285
 for <dri-devel@lists.freedesktop.org>; Thu, 21 Jul 2022 03:03:39 +0000 (UTC)
Received: from tr.lan (ip-86-49-12-201.bb.vodafone.cz [86.49.12.201])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 (Authenticated sender: marex@denx.de)
 by phobos.denx.de (Postfix) with ESMTPSA id 742F980586;
 Thu, 21 Jul 2022 05:03:36 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
 s=phobos-20191101; t=1658372617;
 bh=j4euMDYmhB1Pbeh1qWoeSQHhIKqUyV4weVqOQqim+QM=;
 h=From:To:Cc:Subject:Date:From;
 b=J+wUQ0APP35VQoFNxzpBGoMF783G49rDR/CuJ0eLSdr4eCr3ctKVEv3DA4gXboXML
 4RRXi8NcIKIV3oD7uScuMrZNGQ+C0r5S3stuHMW04DS0pE1a2/Zts4koYnoyzhVbkY
 JRRdcYOGIWp1D2AYgkmfDW89S2Lb0nyfIXNcwKqXio5Zleov3X+F5IIF+JAUUHJdgM
 utZX5WS4CG7R+hhxhpSt2obhJXahajSefrIFguCQgSMo2oMrnzE9MQ28TGBZPpUOUO
 nlAXSuGsgNGtAX1v3Cr5mKvzNTYyu+GHQhy51RK9i/sb6lBSkTZP79O2FAw6ykZ/tp
 7tg3bqXIkKSBQ==
From: Marek Vasut <marex@denx.de>
To: devicetree@vger.kernel.org
Subject: [PATCH] dt-bindings: vendor-prefixes: add Densitron
Date: Thu, 21 Jul 2022 05:03:27 +0200
Message-Id: <20220721030327.210950-1-marex@denx.de>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Virus-Scanned: clamav-milter 0.103.6 at phobos.denx.de
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
Cc: Marek Vasut <marex@denx.de>, robert.foss@linaro.org,
 =?UTF-8?q?Guido=20G=C3=BCnther?= <agx@sigxcpu.org>,
 dri-devel@lists.freedesktop.org, Rob Herring <robh+dt@kernel.org>,
 Thierry Reding <thierry.reding@gmail.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Sam Ravnborg <sam@ravnborg.org>, Jagan Teki <jagan@amarulasolutions.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Densitron is a manufacturer of LCD panels.
https://www.densitron.com

Signed-off-by: Marek Vasut <marex@denx.de>
Cc: Guido Günther <agx@sigxcpu.org>
Cc: Jagan Teki <jagan@amarulasolutions.com>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Linus Walleij <linus.walleij@linaro.org>
Cc: Rob Herring <robh+dt@kernel.org>
Cc: Sam Ravnborg <sam@ravnborg.org>
Cc: Thierry Reding <thierry.reding@gmail.com>
---
 Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/vendor-prefixes.yaml b/Documentation/devicetree/bindings/vendor-prefixes.yaml
index 88859dd4040ee..6277240536b44 100644
--- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
+++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
@@ -312,6 +312,8 @@ patternProperties:
     description: Dell Inc.
   "^delta,.*":
     description: Delta Electronics, Inc.
+  "^densitron,.*":
+    description: Densitron Technologies Ltd
   "^denx,.*":
     description: Denx Software Engineering
   "^devantech,.*":
-- 
2.35.1

