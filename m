Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 692AB6768CA
	for <lists+dri-devel@lfdr.de>; Sat, 21 Jan 2023 21:08:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9D79410E3EB;
	Sat, 21 Jan 2023 20:08:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 22A4D10E3D1
 for <dri-devel@lists.freedesktop.org>; Sat, 21 Jan 2023 20:07:53 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 0119E60B87;
 Sat, 21 Jan 2023 20:07:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 73F98C43443;
 Sat, 21 Jan 2023 20:07:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1674331672;
 bh=Am++jBnQb/qAjv6YmiB/l4+dRuuZm7yhfXAmt0yuQqY=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
 b=k7Yjda+qF8462if83kpA981oZiueD3qDLiywzODCTiQyP/tWfuqvTb+OT0UAtDRWb
 UUldunXw0RaduJID7zV+5GuVrswgM1/2thvjW6OUL7zm76lrliEaExzizqfeNe9/LK
 my41NjsEtiytHSURVwLp+S2sx8hhry5RxyRkqor5qY0xiZ3nSmj1RlavLytKpeZH95
 SL37X9IC9waFnc+JnyJrIky9dUZpy4b7fRqSnsPxgXQi70+2kw2yLIFx24y1zvU10u
 yh2l8Pf3sAduka1l9rKFKZmeW7rf9SZHjgk2jEM92cBftKnun0TnA+YiZ3ulHRTsjh
 1BAK08gPHTDqA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by smtp.lore.kernel.org (Postfix) with ESMTP id 61B3FC38142;
 Sat, 21 Jan 2023 20:07:52 +0000 (UTC)
From: Sam Ravnborg via B4 Submission Endpoint
 <devnull+sam.ravnborg.org@kernel.org>
Date: Sat, 21 Jan 2023 21:08:21 +0100
Subject: [PATCH 43/86] drm/display: Direct include headers from
 drm_atomic_helper
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230113-drm-include-v1-v1-43-c5cf72d8a5a2@ravnborg.org>
References: <20230113-drm-include-v1-v1-0-c5cf72d8a5a2@ravnborg.org>
In-Reply-To: <20230113-drm-include-v1-v1-0-c5cf72d8a5a2@ravnborg.org>
To: dri-devel@lists.freedesktop.org
X-Mailer: b4 0.12.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1674331667; l=842;
 i=sam@ravnborg.org; s=20230107; h=from:subject:message-id;
 bh=MEqulk6o3jJKEhSZnxBXX1C+xGrIZAhbrbZmAmkdPKM=; =?utf-8?q?b=3Dy0niErqj+bnu?=
 =?utf-8?q?9HMF1iqV3AHhvJPDfNsbEl3i8FJFJ9La0qOXE2fg/t3eydrlhuT5FXG6v580ZXsM?=
 2ZYJipSLDL5JCqqT0v6t7flKUukClJgloJ4rJHMGF9gYNDZARejA
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
 drivers/gpu/drm/display/drm_dp_mst_topology.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/display/drm_dp_mst_topology.c b/drivers/gpu/drm/display/drm_dp_mst_topology.c
index 5861b0a6247b..6a8f1eb5fb80 100644
--- a/drivers/gpu/drm/display/drm_dp_mst_topology.c
+++ b/drivers/gpu/drm/display/drm_dp_mst_topology.c
@@ -41,6 +41,7 @@
 #include <drm/display/drm_dp_mst_helper.h>
 #include <drm/drm_atomic.h>
 #include <drm/drm_atomic_helper.h>
+#include <drm/drm_atomic_state_helper.h>
 #include <drm/drm_drv.h>
 #include <drm/drm_edid.h>
 #include <drm/drm_print.h>

-- 
2.34.1

