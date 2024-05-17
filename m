Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 987788C8E7C
	for <lists+dri-devel@lfdr.de>; Sat, 18 May 2024 01:29:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A8BB710E181;
	Fri, 17 May 2024 23:29:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=treblig.org header.i=@treblig.org header.b="IAFN0GXD";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx.treblig.org (mx.treblig.org [46.235.229.95])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 18C3C10E181
 for <dri-devel@lists.freedesktop.org>; Fri, 17 May 2024 23:29:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=treblig.org
 ; s=bytemarkmx;
 h=MIME-Version:Message-ID:Date:Subject:From:Content-Type:From
 :Subject; bh=ILMEqfh6mvs3M8j1PQ8qkskmAIghR6blibOu6WSgkI8=; b=IAFN0GXDM37GpEc8
 QPOxKd6lWlXkBNOtBnJ7FyvQBhOcrNP7svoLSWggCSXmfjwvEml53oLsbc8tJbUBjrVvRT6rNgWhW
 Z1iBzrTxITvbKsTeKQglKAnWkx132s8noF87SkyjJIuA6EDvSrvsymQUg0JRLdxVxEJqtazTn4Mgl
 7GFwsX0SInTFlEA2T/wqtJM8V5Jdx27uCoRIErcbveSh+9P5J1sj7p5CUmmkxNS0jIU34ggGdSQC8
 b+hSZCT3R8+6FfYKf7mduxsr9EONaVeGa39dq4nNYN5FiXG1/cdDGZ3d33ND/pjoBDVQx3whT4Hoo
 hOaMfqKaYCmgcSEMyg==;
Received: from localhost ([127.0.0.1] helo=dalek.home.treblig.org)
 by mx.treblig.org with esmtp (Exim 4.96)
 (envelope-from <linux@treblig.org>) id 1s870g-001TlX-1J;
 Fri, 17 May 2024 23:29:10 +0000
From: linux@treblig.org
To: zack.rusin@broadcom.com, bcm-kernel-feedback-list@broadcom.com,
 maarten.lankhorst@linux.intel.com
Cc: daniel@ffwll.ch, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, "Dr. David Alan Gilbert" <linux@treblig.org>
Subject: [PATCH 3/6] drm/vmwgfx: remove unused struct 'vmw_stdu_dma'
Date: Sat, 18 May 2024 00:28:58 +0100
Message-ID: <20240517232858.230860-1-linux@treblig.org>
X-Mailer: git-send-email 2.45.1
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

From: "Dr. David Alan Gilbert" <linux@treblig.org>

'vmw_stdu_dma' is unused since
commit 39985eea5a6d ("drm/vmwgfx: Abstract placement selection")
Remove it.

Signed-off-by: Dr. David Alan Gilbert <linux@treblig.org>
---
 drivers/gpu/drm/vmwgfx/vmwgfx_stdu.c | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_stdu.c b/drivers/gpu/drm/vmwgfx/vmwgfx_stdu.c
index 2041c4d48daa..50022e9e3519 100644
--- a/drivers/gpu/drm/vmwgfx/vmwgfx_stdu.c
+++ b/drivers/gpu/drm/vmwgfx/vmwgfx_stdu.c
@@ -85,11 +85,6 @@ struct vmw_stdu_update {
 	SVGA3dCmdUpdateGBScreenTarget body;
 };
 
-struct vmw_stdu_dma {
-	SVGA3dCmdHeader     header;
-	SVGA3dCmdSurfaceDMA body;
-};
-
 struct vmw_stdu_surface_copy {
 	SVGA3dCmdHeader      header;
 	SVGA3dCmdSurfaceCopy body;
-- 
2.45.1

