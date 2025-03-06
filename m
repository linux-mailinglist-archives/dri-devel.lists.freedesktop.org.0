Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F333EA54F9E
	for <lists+dri-devel@lfdr.de>; Thu,  6 Mar 2025 16:52:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0F2C510E987;
	Thu,  6 Mar 2025 15:52:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=treblig.org header.i=@treblig.org header.b="Rbk7UeWE";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx.treblig.org (mx.treblig.org [46.235.229.95])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BA38310E987
 for <dri-devel@lists.freedesktop.org>; Thu,  6 Mar 2025 15:52:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=treblig.org
 ; s=bytemarkmx;
 h=MIME-Version:Message-ID:Date:Subject:From:Content-Type:From
 :Subject; bh=9deaax2qNgBgrAndbg2toLKuqQ/n/z1VciNkUn5kl7A=; b=Rbk7UeWELJPa/pXj
 lzliUr7RGi4pWDjSFVcdxjeCrzILf+KGlzAXIBcEUreVpe42/ajBlYQqhnq7UB2JnV0D7KD3fbK26
 E0Rd4feJAbSld9Ayj98xZ0qqDYF5afGXeFlWsFtyKD/cZrEvl115jElJsOTa4qAxrWFcoHr41eifP
 gL9+MTKn2bTmCw414BWMuZcV9KfYzWRmGs7Xqt3gAjIuc9/m/azA2rA2WaheC9dbs9YjOtYB9n20H
 q5bH1lF8fMtkkz0mofomwSS6tsrXBQQ6Dz/NNyRKe85meFI/YPYLcUkMJynnzSkjzFUpo67rxPu27
 2HtzUOlKcZgffh+i0Q==;
Received: from localhost ([127.0.0.1] helo=dalek.home.treblig.org)
 by mx.treblig.org with esmtp (Exim 4.96)
 (envelope-from <linux@treblig.org>) id 1tqDVs-0039Ld-1V;
 Thu, 06 Mar 2025 15:51:56 +0000
From: linux@treblig.org
To: patrik.r.jakobsson@gmail.com, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de
Cc: airlied@gmail.com, simona@ffwll.ch, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, "Dr. David Alan Gilbert" <linux@treblig.org>
Subject: [PATCH v2] drm/gma500: Remove unused mrst_clock_funcs
Date: Thu,  6 Mar 2025 15:51:55 +0000
Message-ID: <20250306155155.212599-1-linux@treblig.org>
X-Mailer: git-send-email 2.48.1
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

The mrst_clock_funcs const was added in 2013 by
commit ac6113ebb70d ("drm/gma500/mrst: Add SDVO clock calculation")
and commented as 'Not used yet'.

It's not been used since, so remove it.
The helper functions it points to are still used elsewhere.

Signed-off-by: Dr. David Alan Gilbert <linux@treblig.org>
---
v2
  commit message fixed to use correct struct name, and add
  note about the functions used still being used.

 drivers/gpu/drm/gma500/oaktrail_crtc.c | 7 -------
 1 file changed, 7 deletions(-)

diff --git a/drivers/gpu/drm/gma500/oaktrail_crtc.c b/drivers/gpu/drm/gma500/oaktrail_crtc.c
index de8ccfe9890f..ea9b41af0867 100644
--- a/drivers/gpu/drm/gma500/oaktrail_crtc.c
+++ b/drivers/gpu/drm/gma500/oaktrail_crtc.c
@@ -658,10 +658,3 @@ const struct drm_crtc_helper_funcs oaktrail_helper_funcs = {
 	.prepare = gma_crtc_prepare,
 	.commit = gma_crtc_commit,
 };
-
-/* Not used yet */
-const struct gma_clock_funcs mrst_clock_funcs = {
-	.clock = mrst_lvds_clock,
-	.limit = mrst_limit,
-	.pll_is_valid = gma_pll_is_valid,
-};
-- 
2.48.1

