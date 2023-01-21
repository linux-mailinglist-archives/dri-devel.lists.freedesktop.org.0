Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C62656768DD
	for <lists+dri-devel@lfdr.de>; Sat, 21 Jan 2023 21:10:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3B97310E402;
	Sat, 21 Jan 2023 20:10:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C91F610E3F4
 for <dri-devel@lists.freedesktop.org>; Sat, 21 Jan 2023 20:07:53 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id A279760BA6;
 Sat, 21 Jan 2023 20:07:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 7668CC4339C;
 Sat, 21 Jan 2023 20:07:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1674331673;
 bh=j+tVCLTpUGZtNmuf/JQAFlvqfjvYc/t73ILlTRZu2jc=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
 b=L5wsliciws/kff3QPW4vy78JDgDuDBj7L891E0vSbMmJQ185CjwgZtFj+NZcBOW89
 JvdTNQT8Sw3T4nXci6mqdQI8+6yhiNAelQmZxEcxNmNK7rcCg9Y2VHlBqrE4w8n804
 t/H0o0fh0HNvjw9c3qIQqMFCjkd/4UBBqz2xWWHsT+VxwHMR7A9JZaxXIaVezI2x9w
 1FtXq5zdU4sj0Q4p4jgRALJqBM4SZsWlzqRQzv7iItiiqbg6R3MSGfNbC5t3d8posp
 XtMgbLbUS8eTFg1HFMGTopV/CAPvzhgtHasw1179aUKiwcj+2e1HmRDlRm9RRXAOBU
 /J5ZS8T1uqZmA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by smtp.lore.kernel.org (Postfix) with ESMTP id 69251C54EE1;
 Sat, 21 Jan 2023 20:07:53 +0000 (UTC)
From: Sam Ravnborg via B4 Submission Endpoint
 <devnull+sam.ravnborg.org@kernel.org>
Date: Sat, 21 Jan 2023 21:08:45 +0100
Subject: [PATCH 67/86] drm/solomon: Direct include headers from
 drm_atomic_helper
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230113-drm-include-v1-v1-67-c5cf72d8a5a2@ravnborg.org>
References: <20230113-drm-include-v1-v1-0-c5cf72d8a5a2@ravnborg.org>
In-Reply-To: <20230113-drm-include-v1-v1-0-c5cf72d8a5a2@ravnborg.org>
To: dri-devel@lists.freedesktop.org
X-Mailer: b4 0.12.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1674331667; l=990;
 i=sam@ravnborg.org; s=20230107; h=from:subject:message-id;
 bh=ENU9aqEW0h7UxzOvAs1tPQlJAsfml5Cn03bTKN7ZIjU=; =?utf-8?q?b=3DRXFc/6HY/5PE?=
 =?utf-8?q?k+25RmbvmagLeNHVRe7qpoiTOs7T3C/g3QFRCuyKokpBt75yvbUeonqY9V6GkXnC?=
 4HXS+rtFA0E9E5jW65Yy7p+4HileoHThr+lhEyBY680uMtKphdYv
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
 drivers/gpu/drm/solomon/ssd130x.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpu/drm/solomon/ssd130x.c b/drivers/gpu/drm/solomon/ssd130x.c
index c3bf3a18302e..be097de66c84 100644
--- a/drivers/gpu/drm/solomon/ssd130x.c
+++ b/drivers/gpu/drm/solomon/ssd130x.c
@@ -20,6 +20,7 @@
 
 #include <drm/drm_atomic.h>
 #include <drm/drm_atomic_helper.h>
+#include <drm/drm_atomic_state_helper.h>
 #include <drm/drm_crtc_helper.h>
 #include <drm/drm_damage_helper.h>
 #include <drm/drm_edid.h>
@@ -31,6 +32,7 @@
 #include <drm/drm_gem_shmem_helper.h>
 #include <drm/drm_managed.h>
 #include <drm/drm_modes.h>
+#include <drm/drm_modeset_helper_vtables.h>
 #include <drm/drm_rect.h>
 #include <drm/drm_probe_helper.h>
 

-- 
2.34.1

