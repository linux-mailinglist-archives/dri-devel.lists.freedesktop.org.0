Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 69DF42319E2
	for <lists+dri-devel@lfdr.de>; Wed, 29 Jul 2020 08:58:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3638F6E44E;
	Wed, 29 Jul 2020 06:58:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-out.m-online.net (mail-out.m-online.net [212.18.0.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 386866E179
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Jul 2020 20:12:54 +0000 (UTC)
Received: from frontend01.mail.m-online.net (unknown [192.168.8.182])
 by mail-out.m-online.net (Postfix) with ESMTP id 4BGSXM1547z1rt3q;
 Tue, 28 Jul 2020 22:12:51 +0200 (CEST)
Received: from localhost (dynscan1.mnet-online.de [192.168.6.70])
 by mail.m-online.net (Postfix) with ESMTP id 4BGSXM0fxCz1qrgD;
 Tue, 28 Jul 2020 22:12:51 +0200 (CEST)
X-Virus-Scanned: amavisd-new at mnet-online.de
Received: from mail.mnet-online.de ([192.168.8.182])
 by localhost (dynscan1.mail.m-online.net [192.168.6.70]) (amavisd-new,
 port 10024)
 with ESMTP id H4tW1MWQu4GS; Tue, 28 Jul 2020 22:12:50 +0200 (CEST)
X-Auth-Info: tZ2E7ayQc5xagHRixlNC0K9EAJ917YdEV+9ak5rVtf0=
Received: from desktop.lan (ip-86-49-101-166.net.upcbroadband.cz
 [86.49.101.166])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.mnet-online.de (Postfix) with ESMTPSA;
 Tue, 28 Jul 2020 22:12:50 +0200 (CEST)
From: Marek Vasut <marex@denx.de>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 2/3] dt-bindings: Add DT bindings for Chefree CH101OLHLWH-002
Date: Tue, 28 Jul 2020 22:12:41 +0200
Message-Id: <20200728201242.4336-2-marex@denx.de>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200728201242.4336-1-marex@denx.de>
References: <20200728201242.4336-1-marex@denx.de>
MIME-Version: 1.0
X-Mailman-Approved-At: Wed, 29 Jul 2020 06:58:35 +0000
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

Add DT bindings for Chefree CH101OLHLWH-002 10.1" 1280x800 LCD.
This panel is connected via LVDS.

Signed-off-by: Marek Vasut <marex@denx.de>
To: dri-devel@lists.freedesktop.org
Cc: Rob Herring <robh+dt@kernel.org>
Cc: Sam Ravnborg <sam@ravnborg.org>
Cc: devicetree@vger.kernel.org
---
 .../devicetree/bindings/display/panel/panel-simple.yaml         | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/panel/panel-simple.yaml b/Documentation/devicetree/bindings/display/panel/panel-simple.yaml
index 5a0af2b80aba..47247ace86ac 100644
--- a/Documentation/devicetree/bindings/display/panel/panel-simple.yaml
+++ b/Documentation/devicetree/bindings/display/panel/panel-simple.yaml
@@ -87,6 +87,8 @@ properties:
       - cdtech,s070swv29hg-dc44
         # CDTech(H.K.) Electronics Limited 7" 800x480 color TFT-LCD panel
       - cdtech,s070wv95-ct16
+        # Chefree CH101OLHLWH-002 10.1" (1280x800) color TFT LCD panel
+      - chefree,ch101olhlwh-002
         # Chunghwa Picture Tubes Ltd. 7" WXGA TFT LCD panel
       - chunghwa,claa070wp03xg
         # Chunghwa Picture Tubes Ltd. 10.1" WXGA TFT LCD panel
-- 
2.27.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
