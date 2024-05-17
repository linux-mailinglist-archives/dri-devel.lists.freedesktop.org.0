Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BA8F8C8E8A
	for <lists+dri-devel@lfdr.de>; Sat, 18 May 2024 01:36:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3C34210E1F0;
	Fri, 17 May 2024 23:36:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=treblig.org header.i=@treblig.org header.b="IZyO9295";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx.treblig.org (mx.treblig.org [46.235.229.95])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3158410E1F0
 for <dri-devel@lists.freedesktop.org>; Fri, 17 May 2024 23:36:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=treblig.org
 ; s=bytemarkmx;
 h=MIME-Version:Message-ID:Date:Subject:From:Content-Type:From
 :Subject; bh=Q0VyvDtbmcL1dq3FHqWs/cX5D8LXTUaBhnMmbxFsZGQ=; b=IZyO9295QgLrX89a
 LkBO3bbxouDubvSE81EJbpSQ5eWvpbci6iHZro92ANhX5cJozO6QbHKsfh6spD0R3BqSQzTz218XT
 CKG4+FNUvQF47qUiU5LhLxWrmb7BMbS3NnqCtfkg2563YSzunj64b4Xv2ogeR/9t+7WYW9Rj4QBAu
 qkdvhV0mXaJd/VDIcCTpzSJ2lLCBKdhqbvqNtFoflfKBZoZPGumu8upf+q+Tjs74wokE5SzFKYc2Y
 AT7gVm9SORrPbYlIejog1BfPgLut4zI818ZRw7pLgBC39phnXSrxSAOJr/DtJ800BzO3mtuqyqROB
 06pHCpou+Fz+vf6gtA==;
Received: from localhost ([127.0.0.1] helo=dalek.home.treblig.org)
 by mx.treblig.org with esmtp (Exim 4.96)
 (envelope-from <linux@treblig.org>) id 1s877F-001TpV-0n;
 Fri, 17 May 2024 23:35:57 +0000
From: linux@treblig.org
To: alexander.deucher@amd.com,
	christian.koenig@amd.com
Cc: airlied@gmail.com, daniel@ffwll.ch, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, "Dr. David Alan Gilbert" <linux@treblig.org>
Subject: [PATCH 3/3] drm/amd/display: remove unused struct 'dc_reg_sequence'
Date: Sat, 18 May 2024 00:35:48 +0100
Message-ID: <20240517233548.231120-4-linux@treblig.org>
X-Mailer: git-send-email 2.45.1
In-Reply-To: <20240517233548.231120-1-linux@treblig.org>
References: <20240517233548.231120-1-linux@treblig.org>
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

'dc_reg_sequence' was added in
commit 44788bbc309b ("drm/amd/display: refactor reg_update")

but isn't actually used.

Remove it.

Signed-off-by: Dr. David Alan Gilbert <linux@treblig.org>
---
 drivers/gpu/drm/amd/display/dc/dc_helper.c | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/dc/dc_helper.c b/drivers/gpu/drm/amd/display/dc/dc_helper.c
index 8f9a67825615..b81419c95222 100644
--- a/drivers/gpu/drm/amd/display/dc/dc_helper.c
+++ b/drivers/gpu/drm/amd/display/dc/dc_helper.c
@@ -91,11 +91,6 @@ struct dc_reg_value_masks {
 	uint32_t mask;
 };
 
-struct dc_reg_sequence {
-	uint32_t addr;
-	struct dc_reg_value_masks value_masks;
-};
-
 static inline void set_reg_field_value_masks(
 	struct dc_reg_value_masks *field_value_mask,
 	uint32_t value,
-- 
2.45.1

