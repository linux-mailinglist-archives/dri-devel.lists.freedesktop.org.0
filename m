Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CE3EA32B847
	for <lists+dri-devel@lfdr.de>; Wed,  3 Mar 2021 14:45:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 72D3F6E980;
	Wed,  3 Mar 2021 13:44:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com
 [IPv6:2a00:1450:4864:20::330])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 38A896E97D
 for <dri-devel@lists.freedesktop.org>; Wed,  3 Mar 2021 13:44:25 +0000 (UTC)
Received: by mail-wm1-x330.google.com with SMTP id o2so5884101wme.5
 for <dri-devel@lists.freedesktop.org>; Wed, 03 Mar 2021 05:44:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=7qqHnZY9azPURq/zESXDkivU/6fDs3hRcSOtRIxqVho=;
 b=KHHkfD9oMrDLgRGT9BRw5QflsrbtFF3LreHHXNdLoUenAu3jbytf104HvLb7XWSeoJ
 SVMtJgdIrBSIAa+e1T7fCS/BrqQEFmXq/pGqaG/qRCT4Q7/U4PKuGoQI5XV7TqfwzEM4
 xhqFTH8QfJVdSkAgfFRES9Kuu4EwWaNLUWnD4JVXYvZhaGYMWphzo2zxOg0xlAGIsy24
 nakblZCIrZoZjzEFp2tnyeLL/GC2ml/D70+t2ArnjLuPCHd8VaCfi0UwfN8mfFStkALw
 VoWDH1d7kIn49EJT0qO8PZSo/nMqEqbrR2n6UcOMgL/z3l1vgKv+qIydVp05R/0pkDB8
 QFjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=7qqHnZY9azPURq/zESXDkivU/6fDs3hRcSOtRIxqVho=;
 b=tGFw2cF5dbaSV5zkpW1NJTtyIZZRiTJelqKZBrnzr+n4SVxWObbmhSpsohZ7FgRnDR
 5eWDQnfDHn18hixMcxyOe0e3tW5/DTghUCtfhsHc5holwbVpJq4Qykm1Qz79FXV3ueOn
 C3lgKzuVYkqnTLNmdjm8p7KKXzkHEsZSSvHjhW2oP8xUGlOeNy1jCkvnldPG0/yAN4L0
 kXqzL7aFk9yWOEiRbT8Gw5XQuadFfcP0J9Ikg3KeyEeWmCsXpN1wYsSVGCMtI1+xZNMh
 5C6AYt/yLRk7Rf/g62EXrcjzbkg/nIUlTC3aOsFRUJgu6bMbwx6TOQki0rKbr9feBE4T
 KEpg==
X-Gm-Message-State: AOAM531QdkxQVdbIUgFwz4hfDlO/dp13vbmLb959Dd6dPkJXW6AMm9uI
 s3YquwywkahTCibIfasug9GXxw==
X-Google-Smtp-Source: ABdhPJz9votcon5DHgeLgHgLV3hpp3bV0kvfgrgW9O58tctnt1s1Gl+oDWKTuwCob4HsDlWt6cVzAg==
X-Received: by 2002:a1c:f20e:: with SMTP id s14mr9055056wmc.104.1614779063880; 
 Wed, 03 Mar 2021 05:44:23 -0800 (PST)
Received: from dell.default ([91.110.221.155])
 by smtp.gmail.com with ESMTPSA id w18sm6109524wrr.7.2021.03.03.05.44.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 Mar 2021 05:44:23 -0800 (PST)
From: Lee Jones <lee.jones@linaro.org>
To: lee.jones@linaro.org
Subject: [PATCH 47/53] drm/vmwgfx/vmwgfx_binding: Provide some missing param
 descriptions and remove others
Date: Wed,  3 Mar 2021 13:43:13 +0000
Message-Id: <20210303134319.3160762-48-lee.jones@linaro.org>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210303134319.3160762-1-lee.jones@linaro.org>
References: <20210303134319.3160762-1-lee.jones@linaro.org>
MIME-Version: 1.0
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
Cc: David Airlie <airlied@linux.ie>, Roland Scheidegger <sroland@vmware.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 VMware Graphics <linux-graphics-maintainer@vmware.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Fixes the following W=1 kernel build warning(s):

 drivers/gpu/drm/vmwgfx/vmwgfx_binding.c:340: warning: Function parameter or member 'shader_slot' not described in 'vmw_binding_add'
 drivers/gpu/drm/vmwgfx/vmwgfx_binding.c:340: warning: Function parameter or member 'slot' not described in 'vmw_binding_add'
 drivers/gpu/drm/vmwgfx/vmwgfx_binding.c:376: warning: Function parameter or member 'from' not described in 'vmw_binding_transfer'
 drivers/gpu/drm/vmwgfx/vmwgfx_binding.c:498: warning: Function parameter or member 'to' not described in 'vmw_binding_state_commit'
 drivers/gpu/drm/vmwgfx/vmwgfx_binding.c:498: warning: Excess function parameter 'ctx' description in 'vmw_binding_state_commit'
 drivers/gpu/drm/vmwgfx/vmwgfx_binding.c:498: warning: Excess function parameter 'scrubbed' description in 'vmw_binding_state_commit'
 drivers/gpu/drm/vmwgfx/vmwgfx_binding.c:520: warning: Function parameter or member 'cbs' not described in 'vmw_binding_rebind_all'
 drivers/gpu/drm/vmwgfx/vmwgfx_binding.c:520: warning: Excess function parameter 'ctx' description in 'vmw_binding_rebind_all'
 drivers/gpu/drm/vmwgfx/vmwgfx_binding.c:795: warning: Function parameter or member 'shader_slot' not described in 'vmw_emit_set_sr'

Cc: VMware Graphics <linux-graphics-maintainer@vmware.com>
Cc: Roland Scheidegger <sroland@vmware.com>
Cc: Zack Rusin <zackr@vmware.com>
Cc: David Airlie <airlied@linux.ie>
Cc: Daniel Vetter <daniel@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org
Signed-off-by: Lee Jones <lee.jones@linaro.org>
Signed-off-by: Zack Rusin <zackr@vmware.com>
Link: https://patchwork.freedesktop.org/patch/msgid/20210115181601.3432599-5-lee.jones@linaro.org
---
 drivers/gpu/drm/vmwgfx/vmwgfx_binding.c | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_binding.c b/drivers/gpu/drm/vmwgfx/vmwgfx_binding.c
index 180f6dbc9460d..81f525a82b77f 100644
--- a/drivers/gpu/drm/vmwgfx/vmwgfx_binding.c
+++ b/drivers/gpu/drm/vmwgfx/vmwgfx_binding.c
@@ -330,6 +330,8 @@ static void vmw_binding_drop(struct vmw_ctx_bindinfo *bi)
  *
  * @cbs: Pointer to the context binding state tracker.
  * @bi: Information about the binding to track.
+ * @shader_slot: The shader slot of the binding.
+ * @slot: The slot of the binding.
  *
  * Starts tracking the binding in the context binding
  * state structure @cbs.
@@ -367,6 +369,7 @@ void vmw_binding_add_uav_index(struct vmw_ctx_binding_state *cbs, uint32 slot,
  * vmw_binding_transfer: Transfer a context binding tracking entry.
  *
  * @cbs: Pointer to the persistent context binding state tracker.
+ * @from: Staged binding info built during execbuf
  * @bi: Information about the binding to track.
  *
  */
@@ -484,9 +487,8 @@ void vmw_binding_res_list_scrub(struct list_head *head)
 /**
  * vmw_binding_state_commit - Commit staged binding info
  *
- * @ctx: Pointer to context to commit the staged binding info to.
+ * @to:   Staged binding info area to copy into to.
  * @from: Staged binding info built during execbuf.
- * @scrubbed: Transfer only scrubbed bindings.
  *
  * Transfers binding info from a temporary structure
  * (typically used by execbuf) to the persistent
@@ -511,7 +513,7 @@ void vmw_binding_state_commit(struct vmw_ctx_binding_state *to,
 /**
  * vmw_binding_rebind_all - Rebind all scrubbed bindings of a context
  *
- * @ctx: The context resource
+ * @cbs: Pointer to the context binding state tracker.
  *
  * Walks through the context binding list and rebinds all scrubbed
  * resources.
@@ -789,6 +791,7 @@ static void vmw_collect_dirty_view_ids(struct vmw_ctx_binding_state *cbs,
  * vmw_binding_emit_set_sr - Issue delayed DX shader resource binding commands
  *
  * @cbs: Pointer to the context's struct vmw_ctx_binding_state
+ * @shader_slot: The shader slot of the binding.
  */
 static int vmw_emit_set_sr(struct vmw_ctx_binding_state *cbs,
 			   int shader_slot)
-- 
2.27.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
