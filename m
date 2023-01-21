Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A3EAB6768ED
	for <lists+dri-devel@lfdr.de>; Sat, 21 Jan 2023 21:10:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5BF5710E424;
	Sat, 21 Jan 2023 20:10:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5AC6310E407
 for <dri-devel@lists.freedesktop.org>; Sat, 21 Jan 2023 20:07:54 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 3908D60BBF;
 Sat, 21 Jan 2023 20:07:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 0BC2DC433EF;
 Sat, 21 Jan 2023 20:07:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1674331674;
 bh=/P1vGXrnU+7DsNR+oHbCTbT5icZFUVPHMGtC9vIjdfc=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
 b=lzS0ICXFkztnF9hh4gZgKi8SIgatDMOpCD9R4+aLrzxhZPJvxNyJNykK2B3qboRSc
 CU9imYTyA4bsWXdXCOkgtTr2ResqeBxu9ECud/tHcbEawlJ9jQEGa6rltsTWuglnAx
 os3eIfXyP0PWtZ+HjLYJY/ktRp0mp8rwvezMhSmlK40uRL7yaxtWOAaoEeY1nn4aGR
 MMxGCdTNe0Eqi2zpMxy7wK6hI5aeFgWLDTTLiAA49WnyItaGmpwJwPJOm/wreGrGN2
 LiNxBn3wfQaDDugMZI7KnntLir1aoc1eQr72yYExaR4Y2wUyvO13vBJgwuVadM9PtK
 Vt8jiqmvo1YCw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by smtp.lore.kernel.org (Postfix) with ESMTP id F303DC54EED;
 Sat, 21 Jan 2023 20:07:53 +0000 (UTC)
From: Sam Ravnborg via B4 Submission Endpoint
 <devnull+sam.ravnborg.org@kernel.org>
Date: Sat, 21 Jan 2023 21:09:00 +0100
Subject: [PATCH 82/86] drm/vmwgfx: Direct include headers from
 drm_atomic_helper
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230113-drm-include-v1-v1-82-c5cf72d8a5a2@ravnborg.org>
References: <20230113-drm-include-v1-v1-0-c5cf72d8a5a2@ravnborg.org>
In-Reply-To: <20230113-drm-include-v1-v1-0-c5cf72d8a5a2@ravnborg.org>
To: dri-devel@lists.freedesktop.org
X-Mailer: b4 0.12.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1674331667; l=2250;
 i=sam@ravnborg.org; s=20230107; h=from:subject:message-id;
 bh=Ez5EH/KMTAfR3wuQKViNSibyI9t30T8GEUvVu44d/y4=; =?utf-8?q?b=3Dvheu/iCNwFQl?=
 =?utf-8?q?+1SiaqfmC2iPzCFoxTciEwHTLpmqN0Ys5hySN5D5tgV/EkLiZo/9KMqMypQm1U5a?=
 O4SUERgYC6yP1xZ7/bYaL6COgZY3sxKx47wGCpVDqsGOZyZvYc9N
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
 drivers/gpu/drm/vmwgfx/vmwgfx_kms.c  | 2 ++
 drivers/gpu/drm/vmwgfx/vmwgfx_ldu.c  | 1 +
 drivers/gpu/drm/vmwgfx/vmwgfx_scrn.c | 1 +
 drivers/gpu/drm/vmwgfx/vmwgfx_stdu.c | 1 +
 4 files changed, 5 insertions(+)

diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_kms.c b/drivers/gpu/drm/vmwgfx/vmwgfx_kms.c
index 257f090071f1..ee0cc8cea3e1 100644
--- a/drivers/gpu/drm/vmwgfx/vmwgfx_kms.c
+++ b/drivers/gpu/drm/vmwgfx/vmwgfx_kms.c
@@ -30,8 +30,10 @@
 
 #include <drm/drm_atomic.h>
 #include <drm/drm_atomic_helper.h>
+#include <drm/drm_atomic_state_helper.h>
 #include <drm/drm_damage_helper.h>
 #include <drm/drm_fourcc.h>
+#include <drm/drm_modeset_helper.h>
 #include <drm/drm_rect.h>
 #include <drm/drm_sysfs.h>
 
diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_ldu.c b/drivers/gpu/drm/vmwgfx/vmwgfx_ldu.c
index a56e5d0ca3c6..862c0cf4c3c8 100644
--- a/drivers/gpu/drm/vmwgfx/vmwgfx_ldu.c
+++ b/drivers/gpu/drm/vmwgfx/vmwgfx_ldu.c
@@ -28,6 +28,7 @@
 #include <drm/drm_atomic.h>
 #include <drm/drm_atomic_helper.h>
 #include <drm/drm_fourcc.h>
+#include <drm/drm_modeset_helper_vtables.h>
 
 #include "vmwgfx_kms.h"
 
diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_scrn.c b/drivers/gpu/drm/vmwgfx/vmwgfx_scrn.c
index e1f36a09c59c..644541d18d29 100644
--- a/drivers/gpu/drm/vmwgfx/vmwgfx_scrn.c
+++ b/drivers/gpu/drm/vmwgfx/vmwgfx_scrn.c
@@ -29,6 +29,7 @@
 #include <drm/drm_atomic_helper.h>
 #include <drm/drm_damage_helper.h>
 #include <drm/drm_fourcc.h>
+#include <drm/drm_modeset_helper_vtables.h>
 
 #include "vmwgfx_kms.h"
 
diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_stdu.c b/drivers/gpu/drm/vmwgfx/vmwgfx_stdu.c
index 0090abe89254..be301629b09a 100644
--- a/drivers/gpu/drm/vmwgfx/vmwgfx_stdu.c
+++ b/drivers/gpu/drm/vmwgfx/vmwgfx_stdu.c
@@ -29,6 +29,7 @@
 #include <drm/drm_atomic_helper.h>
 #include <drm/drm_damage_helper.h>
 #include <drm/drm_fourcc.h>
+#include <drm/drm_modeset_helper_vtables.h>
 
 #include "vmwgfx_kms.h"
 #include "vmw_surface_cache.h"

-- 
2.34.1

