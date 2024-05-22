Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 08ECA8CC5EE
	for <lists+dri-devel@lfdr.de>; Wed, 22 May 2024 19:58:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 40F2E10E0A3;
	Wed, 22 May 2024 17:58:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=treblig.org header.i=@treblig.org header.b="RO7l+xWm";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx.treblig.org (mx.treblig.org [46.235.229.95])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A0A2310E0A3;
 Wed, 22 May 2024 17:58:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=treblig.org
 ; s=bytemarkmx;
 h=MIME-Version:Message-ID:Date:Subject:From:Content-Type:From
 :Subject; bh=Wbd6zrA/kHzFGZUfOfAivCujWYrNUgCo+i5BpHmbrpQ=; b=RO7l+xWmNB/ayxPi
 tk47ep9m8n4rhaVvauBOexM6xSFIm69KE5wgl+cFv8EexhJykSUZ2o65t4QmBMStXkVtfGw3cI/b6
 q3HyvuFpOJqC7pZLLwkzAZPdo9NcRdibgbguQSRvnHQUkqwB69V6dmAQfPFqvbMQQKb1d3yysRM6Q
 4ePvQe7e/xSZvQ/sHHykf2guysjaAPFr5vsFa4v2sHbEUBcEHCsRBSwpPopXQcN0JGMCTu3DGDMkU
 QWR4+aMz589J5VxBA4pAn6qAW4DyaTCIZrlfmxTQR0NFhzY+oMUcsdYsUubXuTNLrWWufrAC6L9z0
 CkwDOnwnS/QyZwOt1g==;
Received: from localhost ([127.0.0.1] helo=dalek.home.treblig.org)
 by mx.treblig.org with esmtp (Exim 4.96)
 (envelope-from <linux@treblig.org>) id 1s9qEb-0025bK-2J;
 Wed, 22 May 2024 17:58:42 +0000
From: linux@treblig.org
To: matthew.d.roper@intel.com,
	lucas.demarchi@intel.com
Cc: maarten.lankhorst@linux.intel.com, airlied@gmail.com,
 intel-xe@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, "Dr. David Alan Gilbert" <linux@treblig.org>
Subject: [PATCH] drm/xe: remove unused struct 'xe_gt_desc'
Date: Wed, 22 May 2024 18:58:40 +0100
Message-ID: <20240522175840.382107-1-linux@treblig.org>
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

'xe_gt_desc' is unused since
commit 1e6c20be6c83 ("drm/xe: Drop extra_gts[] declarations and
XE_GT_TYPE_REMOTE").

Remove it.

Signed-off-by: Dr. David Alan Gilbert <linux@treblig.org>
---
 drivers/gpu/drm/xe/xe_pci.c | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
index f326dbb1cecd..2ca210480bd1 100644
--- a/drivers/gpu/drm/xe/xe_pci.c
+++ b/drivers/gpu/drm/xe/xe_pci.c
@@ -40,12 +40,6 @@ struct xe_subplatform_desc {
 	const u16 *pciidlist;
 };
 
-struct xe_gt_desc {
-	enum xe_gt_type type;
-	u32 mmio_adj_limit;
-	u32 mmio_adj_offset;
-};
-
 struct xe_device_desc {
 	/* Should only ever be set for platforms without GMD_ID */
 	const struct xe_graphics_desc *graphics;
-- 
2.45.1

