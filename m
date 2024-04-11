Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F38E8A1017
	for <lists+dri-devel@lfdr.de>; Thu, 11 Apr 2024 12:31:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0703410EFDD;
	Thu, 11 Apr 2024 10:31:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="aYml3aJN";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A84E710EFDC
 for <dri-devel@lists.freedesktop.org>; Thu, 11 Apr 2024 10:30:57 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id C177362041;
 Thu, 11 Apr 2024 10:30:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 13D5FC43390;
 Thu, 11 Apr 2024 10:30:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1712831456;
 bh=AznrDmZsB01ocltvXnm1LMBuraj9Gty6MlWKyV2qe8g=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=aYml3aJNEbxonNDgTK0TDYwQMlM/xhJvY94R2FQ2wk+XJQUsl9G6y77zmqzPaQhpp
 c6GmlzXDx8fkZ8UK2zxXTlmMFfDJrbr+xx1TfUl701I3Blc51DQ62jyuFtgsuK5xBk
 PnnuJBQyI9/Wz/3JFqQppancrkVBfm9VlY7j2jnI=
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: stable@vger.kernel.org
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, patches@lists.linux.dev,
 VMware Graphics <linux-graphics-maintainer@vmware.com>,
 Roland Scheidegger <sroland@vmware.com>, Zack Rusin <zackr@vmware.com>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 dri-devel@lists.freedesktop.org, Lee Jones <lee.jones@linaro.org>,
 Sasha Levin <sashal@kernel.org>
Subject: [PATCH 5.10 015/294] drm/vmwgfx/vmwgfx_cmdbuf_res: Remove unused
 variable ret
Date: Thu, 11 Apr 2024 11:52:58 +0200
Message-ID: <20240411095436.093960798@linuxfoundation.org>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240411095435.633465671@linuxfoundation.org>
References: <20240411095435.633465671@linuxfoundation.org>
User-Agent: quilt/0.67
X-stable: review
X-Patchwork-Hint: ignore
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

5.10-stable review patch.  If anyone has any objections, please let me know.

------------------

From: Lee Jones <lee.jones@linaro.org>

[ Upstream commit 43ebfe61c3928573a5ef8d80c2f5300aa5c904c0 ]

Fixes the following W=1 kernel build warning(s):

 drivers/gpu/drm/vmwgfx/vmwgfx_cmdbuf_res.c: In function ‘vmw_cmdbuf_res_revert’:
 drivers/gpu/drm/vmwgfx/vmwgfx_cmdbuf_res.c:162:6: warning: variable ‘ret’ set but not used [-Wunused-but-set-variable]

Cc: VMware Graphics <linux-graphics-maintainer@vmware.com>
Cc: Roland Scheidegger <sroland@vmware.com>
Cc: Zack Rusin <zackr@vmware.com>
Cc: David Airlie <airlied@linux.ie>
Cc: Daniel Vetter <daniel@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org
Signed-off-by: Lee Jones <lee.jones@linaro.org>
Signed-off-by: Zack Rusin <zackr@vmware.com>
Link: https://patchwork.freedesktop.org/patch/msgid/20210115181313.3431493-40-lee.jones@linaro.org
Stable-dep-of: 517621b70600 ("drm/vmwgfx: Fix possible null pointer derefence with invalid contexts")
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/gpu/drm/vmwgfx/vmwgfx_cmdbuf_res.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_cmdbuf_res.c b/drivers/gpu/drm/vmwgfx/vmwgfx_cmdbuf_res.c
index 44d858ce4ce7f..47b92d0c898a7 100644
--- a/drivers/gpu/drm/vmwgfx/vmwgfx_cmdbuf_res.c
+++ b/drivers/gpu/drm/vmwgfx/vmwgfx_cmdbuf_res.c
@@ -160,7 +160,6 @@ void vmw_cmdbuf_res_commit(struct list_head *list)
 void vmw_cmdbuf_res_revert(struct list_head *list)
 {
 	struct vmw_cmdbuf_res *entry, *next;
-	int ret;
 
 	list_for_each_entry_safe(entry, next, list, head) {
 		switch (entry->state) {
@@ -168,8 +167,7 @@ void vmw_cmdbuf_res_revert(struct list_head *list)
 			vmw_cmdbuf_res_free(entry->man, entry);
 			break;
 		case VMW_CMDBUF_RES_DEL:
-			ret = drm_ht_insert_item(&entry->man->resources,
-						 &entry->hash);
+			drm_ht_insert_item(&entry->man->resources, &entry->hash);
 			list_del(&entry->head);
 			list_add_tail(&entry->head, &entry->man->list);
 			entry->state = VMW_CMDBUF_RES_COMMITTED;
-- 
2.43.0



