Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BE6A96768B7
	for <lists+dri-devel@lfdr.de>; Sat, 21 Jan 2023 21:08:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1C41610E3D8;
	Sat, 21 Jan 2023 20:08:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2DE6110E3E4
 for <dri-devel@lists.freedesktop.org>; Sat, 21 Jan 2023 20:07:53 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 09D4A60B8C;
 Sat, 21 Jan 2023 20:07:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 02153C433AC;
 Sat, 21 Jan 2023 20:07:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1674331672;
 bh=qFS6ry6BKHUaOFNHmZfowU2oatvf/Zvly70yTAUoUbg=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
 b=td4rgxyE0nYxg9xg/QDGge5SUct2RGWd8CiEgyPkMcmlPaWAGPZu+tm3hiNMrgLha
 c5JJ3Mx4u/l69SUgb/blFwcDErNfrdZF5qrtKxx+yq8xPVYrHujWbaZE266DEuuBAN
 Q8lqZOVfRJBPS4ueC9XQYhHtvSSPTQ+ZFfVnWTXF6yEYfbkcK/lAgy1V/2Y1OJwg7S
 BW6DZfBPjUAxrHG0ujO1ZQ98a7M36SsRoQAS0RtyfXV2zufYnEoFVRcDJEkcW64b2o
 RmxRHPU3NKEG2bjVS4LXAVWn1PuoGCX3eLO22+dm2/Oy0wYXFJX43A6SR23XlxY3i7
 BHSklrWOwhY2g==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by smtp.lore.kernel.org (Postfix) with ESMTP id E74D4C54E94;
 Sat, 21 Jan 2023 20:07:51 +0000 (UTC)
From: Sam Ravnborg via B4 Submission Endpoint
 <devnull+sam.ravnborg.org@kernel.org>
Date: Sat, 21 Jan 2023 21:08:11 +0100
Subject: [PATCH 33/86] drm/bridge: lontium: Direct include headers from
 drm_atomic_helper
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230113-drm-include-v1-v1-33-c5cf72d8a5a2@ravnborg.org>
References: <20230113-drm-include-v1-v1-0-c5cf72d8a5a2@ravnborg.org>
In-Reply-To: <20230113-drm-include-v1-v1-0-c5cf72d8a5a2@ravnborg.org>
To: dri-devel@lists.freedesktop.org
X-Mailer: b4 0.12.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1674331667; l=2604;
 i=sam@ravnborg.org; s=20230107; h=from:subject:message-id;
 bh=j+wFYPsfF5vAPul8xIOgfIfI54b4fN2UjdCzoGTHjbg=; =?utf-8?q?b=3DVWEtKk+0okHI?=
 =?utf-8?q?MWURDqGGpzqlQLse2xxQ1gM7yug6zalSUYr5Uyfr76n+e4sLcRqsjpPzfwYovsqd?=
 FvxATN9yCj/ldxwOpchiVG9HFQhYjzSZonpxw5d/C+45UW3LVtUp
X-Developer-Key: i=sam@ravnborg.org; a=ed25519;
 pk=R0+pqV7BRYOAeOIGkyOrSNke7arx5y3LkEuNi37YEyU=
X-Endpoint-Received: by B4 Submission Endpoint for sam@ravnborg.org/20230107
 with auth_id=22
X-Original-From: Sam Ravnborg <sam@ravnborg.org>
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
Reply-To: sam@ravnborg.org
Cc: Sam Ravnborg <sam@ravnborg.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Sam Ravnborg <sam@ravnborg.org>

Direct include the headers that otherwise comes indirect from
drm_atomic_helper, because drm_atomic_helper will be reduced to
include only the minimal set of headers.

Signed-off-by: Sam Ravnborg <sam@ravnborg.org>
---
 drivers/gpu/drm/bridge/lontium-lt8912b.c   | 2 ++
 drivers/gpu/drm/bridge/lontium-lt9211.c    | 1 +
 drivers/gpu/drm/bridge/lontium-lt9611.c    | 2 ++
 drivers/gpu/drm/bridge/lontium-lt9611uxc.c | 2 ++
 4 files changed, 7 insertions(+)

diff --git a/drivers/gpu/drm/bridge/lontium-lt8912b.c b/drivers/gpu/drm/bridge/lontium-lt8912b.c
index 2019a8167d69..3d0713e00fb7 100644
--- a/drivers/gpu/drm/bridge/lontium-lt8912b.c
+++ b/drivers/gpu/drm/bridge/lontium-lt8912b.c
@@ -12,8 +12,10 @@
 
 #include <drm/drm_probe_helper.h>
 #include <drm/drm_atomic_helper.h>
+#include <drm/drm_atomic_state_helper.h>
 #include <drm/drm_edid.h>
 #include <drm/drm_mipi_dsi.h>
+#include <drm/drm_modeset_helper_vtables.h>
 #include <drm/drm_of.h>
 
 #include <video/videomode.h>
diff --git a/drivers/gpu/drm/bridge/lontium-lt9211.c b/drivers/gpu/drm/bridge/lontium-lt9211.c
index 3e19fff6547a..ce365cff496c 100644
--- a/drivers/gpu/drm/bridge/lontium-lt9211.c
+++ b/drivers/gpu/drm/bridge/lontium-lt9211.c
@@ -22,6 +22,7 @@
 #include <linux/regulator/consumer.h>
 
 #include <drm/drm_atomic_helper.h>
+#include <drm/drm_atomic_state_helper.h>
 #include <drm/drm_bridge.h>
 #include <drm/drm_mipi_dsi.h>
 #include <drm/drm_of.h>
diff --git a/drivers/gpu/drm/bridge/lontium-lt9611.c b/drivers/gpu/drm/bridge/lontium-lt9611.c
index a25d21a7d5c1..68bb348f55a5 100644
--- a/drivers/gpu/drm/bridge/lontium-lt9611.c
+++ b/drivers/gpu/drm/bridge/lontium-lt9611.c
@@ -17,8 +17,10 @@
 #include <sound/hdmi-codec.h>
 
 #include <drm/drm_atomic_helper.h>
+#include <drm/drm_atomic_state_helper.h>
 #include <drm/drm_bridge.h>
 #include <drm/drm_mipi_dsi.h>
+#include <drm/drm_modeset_helper_vtables.h>
 #include <drm/drm_of.h>
 #include <drm/drm_print.h>
 #include <drm/drm_probe_helper.h>
diff --git a/drivers/gpu/drm/bridge/lontium-lt9611uxc.c b/drivers/gpu/drm/bridge/lontium-lt9611uxc.c
index 583daacf3705..b3fbf0e79c1f 100644
--- a/drivers/gpu/drm/bridge/lontium-lt9611uxc.c
+++ b/drivers/gpu/drm/bridge/lontium-lt9611uxc.c
@@ -20,8 +20,10 @@
 #include <sound/hdmi-codec.h>
 
 #include <drm/drm_atomic_helper.h>
+#include <drm/drm_atomic_state_helper.h>
 #include <drm/drm_bridge.h>
 #include <drm/drm_mipi_dsi.h>
+#include <drm/drm_modeset_helper_vtables.h>
 #include <drm/drm_print.h>
 #include <drm/drm_probe_helper.h>
 

-- 
2.34.1

