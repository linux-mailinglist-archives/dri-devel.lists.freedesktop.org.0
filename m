Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 45B61AC7884
	for <lists+dri-devel@lfdr.de>; Thu, 29 May 2025 08:00:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7FD1310E05B;
	Thu, 29 May 2025 06:00:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=norik.com header.i=@norik.com header.b="bYefAiqF";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 1372 seconds by postgrey-1.36 at gabe;
 Thu, 29 May 2025 06:00:46 UTC
Received: from cpanel.siel.si (cpanel.siel.si [46.19.9.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7933210E05B
 for <dri-devel@lists.freedesktop.org>; Thu, 29 May 2025 06:00:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=norik.com; 
 s=default;
 h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:
 Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:Content-Description:
 Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
 In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=vI79tRtRRtWjdv39D+S2xsWsuTbKWolYzosvzsaZYyM=; b=bYefAiqFosG6XhHVKrFu3dILRZ
 z/l2z2Q6cpQqWVyRRR8b859o9OHed4pmksRuSJxV9hC75+vQ8aUV5C+nUNGpyjEN0fdsgI2orpYBT
 yiu+p6LizDU/Cr2RkXyyHJtM5pKuN6TNhcu0EBB8uKc83K8yhfbPf17qycVMxD1U4SLdU9fO6SiDK
 lFasL3jlpIPA4cQSEI4V7SSKHPpCPSq8bt0E39Hmq3vgKfiy7eDthO2mU8uQTPlVC8VoJfAsNh/f5
 0snOJxsan+QAMIBoclKm5c5XuG7R3S0TgrePHviDi+aVLhAZzbtu6sqafw1H5kdOealitqt6q0CjG
 ztlgMZeA==;
Received: from [89.212.21.243] (port=57730 helo=and-HP-Z4..)
 by cpanel.siel.si with esmtpsa (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.96.2)
 (envelope-from <andrej.picej@norik.com>) id 1uKVxW-0031Qh-0j;
 Thu, 29 May 2025 07:37:41 +0200
From: Andrej Picej <andrej.picej@norik.com>
To: Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Marek Vasut <marex@denx.de>
Cc: Andrej Picej <andrej.picej@norik.com>, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH] dt-bindings: drm/bridge: ti-sn65dsi83: drop $ref to fix
 lvds-vod* warnings
Date: Thu, 29 May 2025 07:36:53 +0200
Message-Id: <20250529053654.1754926-1-andrej.picej@norik.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-AntiAbuse: This header was added to track abuse,
 please include it with any abuse report
X-AntiAbuse: Primary Hostname - cpanel.siel.si
X-AntiAbuse: Original Domain - lists.freedesktop.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - norik.com
X-Get-Message-Sender-Via: cpanel.siel.si: authenticated_id:
 andrej.picej@norik.com
X-Authenticated-Sender: cpanel.siel.si: andrej.picej@norik.com
X-Source: 
X-Source-Args: 
X-Source-Dir: 
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

The kernel test robot reported a warning related to the use of "$ref"
type definitions for custom endpoint properties
- "ti,lvds-vod-swing-clock-microvolt" and
- "ti,lvds-vod-swing-data-microvolt".

Using "$ref" with "uint32-array" is not correctly handled in this
context. Removing "$ref" and relying solely on "maxItems: 2" enforces
the intended requirement of specifying exactly two values, without
triggering a schema validation warning.

Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202505021937.efnQPPqx-lkp@intel.com/
Signed-off-by: Andrej Picej <andrej.picej@norik.com>
---
 .../devicetree/bindings/display/bridge/ti,sn65dsi83.yaml      | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/Documentation/devicetree/bindings/display/bridge/ti,sn65dsi83.yaml b/Documentation/devicetree/bindings/display/bridge/ti,sn65dsi83.yaml
index 9b5f3f3eab19..e69b6343a8eb 100644
--- a/Documentation/devicetree/bindings/display/bridge/ti,sn65dsi83.yaml
+++ b/Documentation/devicetree/bindings/display/bridge/ti,sn65dsi83.yaml
@@ -118,15 +118,11 @@ $defs:
           ti,lvds-vod-swing-clock-microvolt:
             description: LVDS diferential output voltage <min max> for clock
               lanes in microvolts.
-            $ref: /schemas/types.yaml#/definitions/uint32-array
-            minItems: 2
             maxItems: 2
 
           ti,lvds-vod-swing-data-microvolt:
             description: LVDS diferential output voltage <min max> for data
               lanes in microvolts.
-            $ref: /schemas/types.yaml#/definitions/uint32-array
-            minItems: 2
             maxItems: 2
 
 allOf:
-- 
2.34.1

