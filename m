Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 476AE6768F9
	for <lists+dri-devel@lfdr.de>; Sat, 21 Jan 2023 21:10:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 158D410E428;
	Sat, 21 Jan 2023 20:10:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2D71010E404
 for <dri-devel@lists.freedesktop.org>; Sat, 21 Jan 2023 20:07:54 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 0B87B60BBB;
 Sat, 21 Jan 2023 20:07:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id D2492C433A4;
 Sat, 21 Jan 2023 20:07:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1674331673;
 bh=xQQ4beLUR3EPvUxGklTiYHkqgtbTQQ8SngjTfzgz5l8=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
 b=UyC5EJXMTHDIx/pBig8vFTPUrAysQtBFANtHOdII1LN8JnSqwYM8TD/2y1bjnZdlG
 zX09FuwkCqIvwRHrpFaB5BSLybF5C1vzHb1zT7Ro80D5UPjRIDH+E+BH7DAYpiMCN0
 jXhh3Ct19OZlTAiTOqD9N1P0CE6frQhOebhvgR7WLb8bVAAa8MnNala9QrZHLd8hY0
 Rrlm1/ZjxBNkWXGItyNikSOwOlXbMkubDyg0axTsgRGTDJ3qBKl/bXxY4I5rpihBN6
 jBOo0NHjYqk775TS5WTQWNH/MEbYxNcZ4YgBCBpilTgFz56IPsTmQ50975op7lbw5p
 ta5zaaUpVVzow==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by smtp.lore.kernel.org (Postfix) with ESMTP id C3D10C54E94;
 Sat, 21 Jan 2023 20:07:53 +0000 (UTC)
From: Sam Ravnborg via B4 Submission Endpoint
 <devnull+sam.ravnborg.org@kernel.org>
Date: Sat, 21 Jan 2023 21:08:56 +0100
Subject: [PATCH 78/86] drm/vboxvideo: Direct include headers from
 drm_atomic_helper
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230113-drm-include-v1-v1-78-c5cf72d8a5a2@ravnborg.org>
References: <20230113-drm-include-v1-v1-0-c5cf72d8a5a2@ravnborg.org>
In-Reply-To: <20230113-drm-include-v1-v1-0-c5cf72d8a5a2@ravnborg.org>
To: dri-devel@lists.freedesktop.org
X-Mailer: b4 0.12.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1674331667; l=1014;
 i=sam@ravnborg.org; s=20230107; h=from:subject:message-id;
 bh=LvL3Fq14m/g/I2ysp3B7xT/GHpATmChjvJGJO+CkVYg=; =?utf-8?q?b=3DTYtZgO4DT7tn?=
 =?utf-8?q?/cPzc02kHHrHknJeXEfLP0dywMsc5Fp7E+A7nxpLeDbkT0Xy3c4jX6S58tOFWAHc?=
 kShToXbJDlCg3sRU2lgxQ4+vQmvkONNgzASllpyFC8zng80k8onK
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
 drivers/gpu/drm/vboxvideo/vbox_mode.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpu/drm/vboxvideo/vbox_mode.c b/drivers/gpu/drm/vboxvideo/vbox_mode.c
index 341edd982cb3..4dfe8f1d19fa 100644
--- a/drivers/gpu/drm/vboxvideo/vbox_mode.c
+++ b/drivers/gpu/drm/vboxvideo/vbox_mode.c
@@ -15,12 +15,14 @@
 
 #include <drm/drm_atomic.h>
 #include <drm/drm_atomic_helper.h>
+#include <drm/drm_atomic_state_helper.h>
 #include <drm/drm_edid.h>
 #include <drm/drm_fb_helper.h>
 #include <drm/drm_fourcc.h>
 #include <drm/drm_framebuffer.h>
 #include <drm/drm_gem_atomic_helper.h>
 #include <drm/drm_gem_framebuffer_helper.h>
+#include <drm/drm_modeset_helper_vtables.h>
 #include <drm/drm_plane_helper.h>
 #include <drm/drm_probe_helper.h>
 

-- 
2.34.1

