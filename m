Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 636BE6768C7
	for <lists+dri-devel@lfdr.de>; Sat, 21 Jan 2023 21:08:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0DB1F10E3DC;
	Sat, 21 Jan 2023 20:08:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8F79110E3D5
 for <dri-devel@lists.freedesktop.org>; Sat, 21 Jan 2023 20:07:52 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 10C9060B6F;
 Sat, 21 Jan 2023 20:07:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 19C51C433B3;
 Sat, 21 Jan 2023 20:07:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1674331671;
 bh=q2wQOziyUNHBQy9Ljr81H8sB15s9j1v/dEqFwgC26Og=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
 b=UbzrYqStw+UcZ2f1ekWdiRV9ulayaT3wyxT/foLRJGx1bkFw4deRcbBwFU3YFY7FA
 Y0Q5+UnxyLXYBP0lbzsQ1XoDvJAJVxHbXtrLLtYQ8YqVwcfEJ7Blp9I53gFlUHJF3n
 LmtpFysiQrm5p2UrB9K9FbVNpB17BaGkzHqSUDkfGOYP2bztIZgagm+9/o7SxoS0m4
 AwYvWYguPkigxzmCV/GNMICD8eezmFGFl3sSQtu+sriZRICw2Ix9+onuAYz9obGbBL
 LhfFnRcrP6MmICfdOvGqxiVoAFvxpcjt/Jq0H5YOiLsYa9sNAqgr6din+RovamyFfe
 /tZs4R8wxjjPw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by smtp.lore.kernel.org (Postfix) with ESMTP id 0ACDDC38142;
 Sat, 21 Jan 2023 20:07:51 +0000 (UTC)
From: Sam Ravnborg via B4 Submission Endpoint
 <devnull+sam.ravnborg.org@kernel.org>
Date: Sat, 21 Jan 2023 21:07:52 +0100
Subject: [PATCH 14/86] drm/vmwgfx: Direct include headers from drm_print
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230113-drm-include-v1-v1-14-c5cf72d8a5a2@ravnborg.org>
References: <20230113-drm-include-v1-v1-0-c5cf72d8a5a2@ravnborg.org>
In-Reply-To: <20230113-drm-include-v1-v1-0-c5cf72d8a5a2@ravnborg.org>
To: dri-devel@lists.freedesktop.org
X-Mailer: b4 0.12.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1674331666; l=647;
 i=sam@ravnborg.org; s=20230107; h=from:subject:message-id;
 bh=pGCJGMKCcfPSru5HtDt+nJLZrXi94OWp4HZserY8tVQ=; =?utf-8?q?b=3Dp+N36zNWdzWM?=
 =?utf-8?q?VB8n6oWFi0wXZBbfhQN/hlY1WEzd3S4Mzq7cQPN2y/C6GTdvZXLmKUozG2Ai4rLu?=
 LcFS9bc0AP2/P+l4dYOIlwC98qPWWVx0B0Vjb/ac1faXIjts7ySL
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
drm_print.h, because drm_print.h will be reduced to
include only the minimal set of headers.

Signed-off-by: Sam Ravnborg <sam@ravnborg.org>
---
 drivers/gpu/drm/vmwgfx/vmwgfx_gem.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_gem.c b/drivers/gpu/drm/vmwgfx/vmwgfx_gem.c
index ce609e7d758f..04b2dec75813 100644
--- a/drivers/gpu/drm/vmwgfx/vmwgfx_gem.c
+++ b/drivers/gpu/drm/vmwgfx/vmwgfx_gem.c
@@ -24,6 +24,8 @@
  *
  */
 
+#include <linux/debugfs.h>
+
 #include "vmwgfx_drv.h"
 
 #include "drm/drm_prime.h"

-- 
2.34.1

