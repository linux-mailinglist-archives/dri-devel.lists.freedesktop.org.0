Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C7D71D22EC
	for <lists+dri-devel@lfdr.de>; Thu, 14 May 2020 01:21:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3663789388;
	Wed, 13 May 2020 23:21:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B37B389388
 for <dri-devel@lists.freedesktop.org>; Wed, 13 May 2020 23:21:38 +0000 (UTC)
Received: from pendragon.bb.dnainternet.fi (81-175-216-236.bb.dnainternet.fi
 [81.175.216.236])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id E1EFB304;
 Thu, 14 May 2020 01:21:36 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1589412097;
 bh=nSYfl51exhXTHIawrSl7iIpoBoDAweq1HgMxwdwidWk=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=PSZjTaptSGDslymBNifH+MVUaTO8e3TIaLX3HXy5RZd9IKKce6AwWDaniaDBb3qo3
 llLoQs4RYU1t8QEKcilFbnN7mE9mvUynm9K59dO7HGZZPuIRI9CMocfbmZPRevA9H5
 i5SIUTmIorQqZwTF3zetzR3hFm2nYkueGXTAO6m8=
From: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 5/4] dt-bindings: display: bridge: thc63lvd1024: Document
 dual-output mode
Date: Thu, 14 May 2020 02:21:27 +0300
Message-Id: <20200513232127.21798-1-laurent.pinchart+renesas@ideasonboard.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200406111543.GC4757@pendragon.ideasonboard.com>
References: <20200406111543.GC4757@pendragon.ideasonboard.com>
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
Cc: linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org,
 Jacopo Mondi <jacopo@jmondi.org>, Rob Herring <robh+dt@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The DT binding support both dual-input and dual-output mode, but only
dual-input is documented. Document dual-output mode.

Suggested-by: Jacopo Mondi <jacopo+renesas@jmondi.org>
Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
---
 .../display/bridge/thine,thc63lvd1024.yaml       | 16 +++++++++++-----
 1 file changed, 11 insertions(+), 5 deletions(-)

diff --git a/Documentation/devicetree/bindings/display/bridge/thine,thc63lvd1024.yaml b/Documentation/devicetree/bindings/display/bridge/thine,thc63lvd1024.yaml
index 469ac4a34273..fedd3460d6f6 100644
--- a/Documentation/devicetree/bindings/display/bridge/thine,thc63lvd1024.yaml
+++ b/Documentation/devicetree/bindings/display/bridge/thine,thc63lvd1024.yaml
@@ -30,11 +30,17 @@ properties:
       This device has four video ports. Their connections are modeled using the
       OF graph bindings specified in Documentation/devicetree/bindings/graph.txt.
 
-      The device can operate in single-link mode or dual-link mode. In
-      single-link mode, all pixels are received on port@0, and port@1 shall not
-      contain any endpoint. In dual-link mode, even-numbered pixels are
-      received on port@0 and odd-numbered pixels on port@1, and both port@0 and
-      port@1 shall contain endpoints.
+      The device can operate in single or dual input and output modes.
+
+      When operating in single input mode, all pixels are received on port@0,
+      and port@1 shall not contain any endpoint. In dual input mode,
+      even-numbered pixels are received on port@0 and odd-numbered pixels on
+      port@1, and both port@0 and port@1 shall contain endpoints.
+
+      When operating in single output mode all pixels are output from the first
+      CMOS/TTL port and port@3 shall not contain any endpoint. In dual output
+      mode pixels are output from both CMOS/TTL ports and both port@2 and
+      port@3 shall contain endpoints.
 
     properties:
       '#address-cells':
-- 
Regards,

Laurent Pinchart

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
