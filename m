Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C99EECEA4D6
	for <lists+dri-devel@lfdr.de>; Tue, 30 Dec 2025 18:20:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B62E810E544;
	Tue, 30 Dec 2025 17:20:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id 96FFD10E544
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Dec 2025 17:20:52 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 50D331424;
 Tue, 30 Dec 2025 09:20:45 -0800 (PST)
Received: from 010265703453.localdomain (usa-sjc-mx-foss1.foss.arm.com
 [172.31.20.19])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 188953F63F;
 Tue, 30 Dec 2025 09:20:49 -0800 (PST)
From: Robin Murphy <robin.murphy@arm.com>
To: heiko@sntech.de, neil.armstrong@linaro.org, dianders@chromium.org,
 thierry.reding@gmail.com, sam@ravnborg.org
Cc: jesszhan0024@gmail.com, dri-devel@lists.freedesktop.org,
 linux-rockchip@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 devicetree@vger.kernel.org
Subject: [PATCH 1/4] dt-bindings: display: panel: Move FriendlyElec HD702E to
 eDP
Date: Tue, 30 Dec 2025 17:20:31 +0000
Message-Id: <80a68e706e869aadbdea228b207a5df52bbfd7b2.1767111807.git.robin.murphy@arm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1767111804.git.robin.murphy@arm.com>
References: <cover.1767111804.git.robin.murphy@arm.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The "E" alludes to the fact that FriendlyElec's HD702E is actually an
eDP panel - move its compatible to the appropriate binding doc.

Cc: <devicetree@vger.kernel.org>
Signed-off-by: Robin Murphy <robin.murphy@arm.com>
---
 .../devicetree/bindings/display/panel/panel-edp-legacy.yaml     | 2 ++
 .../devicetree/bindings/display/panel/panel-simple.yaml         | 2 --
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/display/panel/panel-edp-legacy.yaml b/Documentation/devicetree/bindings/display/panel/panel-edp-legacy.yaml
index b308047c1edf..afe7dc54ebf4 100644
--- a/Documentation/devicetree/bindings/display/panel/panel-edp-legacy.yaml
+++ b/Documentation/devicetree/bindings/display/panel/panel-edp-legacy.yaml
@@ -44,6 +44,8 @@ properties:
       - boe,nv133fhm-n62
         # BOE NV140FHM-N49 14.0" FHD a-Si FT panel
       - boe,nv140fhmn49
+        # FriendlyELEC HD702E 800x1280 LCD panel
+      - friendlyarm,hd702e
         # Innolux Corporation 11.6" WXGA (1366x768) TFT LCD panel
       - innolux,n116bca-ea1
         # Innolux Corporation 11.6" WXGA (1366x768) TFT LCD panel
diff --git a/Documentation/devicetree/bindings/display/panel/panel-simple.yaml b/Documentation/devicetree/bindings/display/panel/panel-simple.yaml
index 24e277b19094..a01cf025aad1 100644
--- a/Documentation/devicetree/bindings/display/panel/panel-simple.yaml
+++ b/Documentation/devicetree/bindings/display/panel/panel-simple.yaml
@@ -144,8 +144,6 @@ properties:
       - foxlink,fl500wvr00-a0t
         # Frida FRD350H54004 3.5" QVGA TFT LCD panel
       - frida,frd350h54004
-        # FriendlyELEC HD702E 800x1280 LCD panel
-      - friendlyarm,hd702e
         # GiantPlus GPG48273QS5 4.3" (480x272) WQVGA TFT LCD panel
       - giantplus,gpg48273qs5
         # GiantPlus GPM940B0 3.0" QVGA TFT LCD panel
-- 
2.34.1

