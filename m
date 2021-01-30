Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A6019309BAA
	for <lists+dri-devel@lfdr.de>; Sun, 31 Jan 2021 12:43:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 93F316E252;
	Sun, 31 Jan 2021 11:43:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-out.m-online.net (mail-out.m-online.net [212.18.0.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 443046E09A
 for <dri-devel@lists.freedesktop.org>; Sat, 30 Jan 2021 18:11:26 +0000 (UTC)
Received: from frontend01.mail.m-online.net (unknown [192.168.8.182])
 by mail-out.m-online.net (Postfix) with ESMTP id 4DSj2N5kYfz1rwvQ;
 Sat, 30 Jan 2021 19:11:24 +0100 (CET)
Received: from localhost (dynscan1.mnet-online.de [192.168.6.70])
 by mail.m-online.net (Postfix) with ESMTP id 4DSj2N51k8z1tYTX;
 Sat, 30 Jan 2021 19:11:24 +0100 (CET)
X-Virus-Scanned: amavisd-new at mnet-online.de
Received: from mail.mnet-online.de ([192.168.8.182])
 by localhost (dynscan1.mail.m-online.net [192.168.6.70]) (amavisd-new,
 port 10024)
 with ESMTP id sUOYUuGMZfK3; Sat, 30 Jan 2021 19:11:23 +0100 (CET)
X-Auth-Info: LF3ZcnJfo/XE34mVwL3j+qVuemhQJiadJ8PKoFJANn0=
Received: from tr.lan (ip-89-176-112-137.net.upcbroadband.cz [89.176.112.137])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mail.mnet-online.de (Postfix) with ESMTPSA;
 Sat, 30 Jan 2021 19:11:23 +0100 (CET)
From: Marek Vasut <marex@denx.de>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 2/3] dt-bindings: Add DT bindings for Displaytech DT050TFT-PTS
Date: Sat, 30 Jan 2021 19:11:13 +0100
Message-Id: <20210130181114.161515-2-marex@denx.de>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210130181114.161515-1-marex@denx.de>
References: <20210130181114.161515-1-marex@denx.de>
MIME-Version: 1.0
X-Mailman-Approved-At: Sun, 31 Jan 2021 11:43:06 +0000
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add DT bindings for Displaytech DT050TFT-PTS 5.0" (800x480)
color TFT LCD panel, connected over DPI.

Signed-off-by: Marek Vasut <marex@denx.de>
To: dri-devel@lists.freedesktop.org
Cc: Rob Herring <robh+dt@kernel.org>
Cc: Sam Ravnborg <sam@ravnborg.org>
Cc: devicetree@vger.kernel.org
---
 .../devicetree/bindings/display/panel/panel-simple.yaml         | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/panel/panel-simple.yaml b/Documentation/devicetree/bindings/display/panel/panel-simple.yaml
index edb53ab0d9eb..a341a30952f9 100644
--- a/Documentation/devicetree/bindings/display/panel/panel-simple.yaml
+++ b/Documentation/devicetree/bindings/display/panel/panel-simple.yaml
@@ -101,6 +101,8 @@ properties:
       - chunghwa,claa101wb03
         # DataImage, Inc. 7" WVGA (800x480) TFT LCD panel with 24-bit parallel interface.
       - dataimage,scf0700c48ggu18
+        # Displaytech Ltd. DT050TFT-PTS 5.0" 800 RGB x 480 TFT LCD panel
+      - displaytech,dt050tft-pts
         # DLC Display Co. DLC1010GIG 10.1" WXGA TFT LCD Panel
       - dlc,dlc1010gig
         # Emerging Display Technology Corp. 3.5" QVGA TFT LCD panel
-- 
2.29.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
