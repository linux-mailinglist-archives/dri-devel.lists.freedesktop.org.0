Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FE4932B836
	for <lists+dri-devel@lfdr.de>; Wed,  3 Mar 2021 14:44:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CC1C66E905;
	Wed,  3 Mar 2021 13:44:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com
 [IPv6:2a00:1450:4864:20::429])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5E20C6E905
 for <dri-devel@lists.freedesktop.org>; Wed,  3 Mar 2021 13:44:03 +0000 (UTC)
Received: by mail-wr1-x429.google.com with SMTP id d15so8498913wrv.5
 for <dri-devel@lists.freedesktop.org>; Wed, 03 Mar 2021 05:44:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=40rMkjxWXVqNvj5udKCXGKEGtGQzZwRj2q8fY5x7CYk=;
 b=gwL9DeMnKXuT9d0yT8cDU0ip7wM4OSKTBI33zHiN5YgYPTQKSZoL8U48t0HgUWgPsy
 B92nExhX6Y/6Fi+iwlWRIe/IfTCwMKNaURr1k9mdlklZZX6MdJM5ZPi3UgaZZVpOm66l
 vo+u1h7vsrL50rG6qMxSqy6U/HKLaF0xUyvN4YZXAGOLLV6zNCUUPNY5eYQkJ/zmCBXw
 d8qk0/sfFHzoh5SLVrKDrolCgP2iZhufccuQszm+wbti42BRfknoJAl1zxUsMgQDCDE6
 KLAJXM2tas5wfsHbvuLV4UOT5dVJT0KaRQXdma6pRJEieYc47vUKVnrweEPudfuH5kiy
 Pyzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=40rMkjxWXVqNvj5udKCXGKEGtGQzZwRj2q8fY5x7CYk=;
 b=FdfdImN4O1sBqsW1n+fp2sl6hF5pw+8g590uJYJM7wcq1+14SXeglDSjc+25mXOBUi
 yWpxkDH1d6T1+94itlCkBSWxYYB/+uXjc7PjGBQrfexfuKRVlcu1wKDgYVDUtL9fadeG
 W1bDLs6GrN34QvBgQ3ZriB7aShXGbIE7EWMYMIuksudbUzO4nNoqIGE0MxmXlqRD/5af
 IsL3SxAKstoPnHapiKOPrXXWec3pBUr1vkPCMKzDHB+yGQXD6OgfiMPYC/dgv+aRZhzt
 Dbx8zOkLgjgg4Fu9MYAhlKjAdvmhatJBITyQytrHayry5vhHaUhlBA31L4xiA1xt3rNf
 IDRQ==
X-Gm-Message-State: AOAM532Th5DDMRVZK2VJBfpQ3rHWb9EPZbAfVJ4/Uez1oTWrHOk1Dghb
 pXZq98cs7tQJOajynhHsFs/Wew==
X-Google-Smtp-Source: ABdhPJym3fR2N7g/JkPKr8nL4bDsjbrpbqQMqWMxXmv0FteJpKM96qHRu+NezUT8QspacHihZxOEoA==
X-Received: by 2002:adf:fec5:: with SMTP id q5mr16914657wrs.43.1614779042019; 
 Wed, 03 Mar 2021 05:44:02 -0800 (PST)
Received: from dell.default ([91.110.221.155])
 by smtp.gmail.com with ESMTPSA id w18sm6109524wrr.7.2021.03.03.05.44.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 Mar 2021 05:44:01 -0800 (PST)
From: Lee Jones <lee.jones@linaro.org>
To: lee.jones@linaro.org
Subject: [PATCH 28/53] drm/vmwgfx/vmwgfx_resource: Fix worthy function headers
 demote some others
Date: Wed,  3 Mar 2021 13:42:54 +0000
Message-Id: <20210303134319.3160762-29-lee.jones@linaro.org>
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

 drivers/gpu/drm/vmwgfx/vmwgfx_resource.c:215: warning: Excess function parameter 'obj_type' description in 'vmw_resource_init'
 drivers/gpu/drm/vmwgfx/vmwgfx_resource.c:303: warning: Excess function parameter 'p_res' description in 'vmw_user_resource_noref_lookup_handle'
 drivers/gpu/drm/vmwgfx/vmwgfx_resource.c:328: warning: Function parameter or member 'dev_priv' not described in 'vmw_user_lookup_handle'
 drivers/gpu/drm/vmwgfx/vmwgfx_resource.c:328: warning: Function parameter or member 'tfile' not described in 'vmw_user_lookup_handle'
 drivers/gpu/drm/vmwgfx/vmwgfx_resource.c:328: warning: Function parameter or member 'handle' not described in 'vmw_user_lookup_handle'
 drivers/gpu/drm/vmwgfx/vmwgfx_resource.c:328: warning: Function parameter or member 'out_surf' not described in 'vmw_user_lookup_handle'
 drivers/gpu/drm/vmwgfx/vmwgfx_resource.c:328: warning: Function parameter or member 'out_buf' not described in 'vmw_user_lookup_handle'
 drivers/gpu/drm/vmwgfx/vmwgfx_resource.c:398: warning: Function parameter or member 'dirtying' not described in 'vmw_resource_do_validate'
 drivers/gpu/drm/vmwgfx/vmwgfx_resource.c:601: warning: Function parameter or member 'interruptible' not described in 'vmw_resource_reserve'
 drivers/gpu/drm/vmwgfx/vmwgfx_resource.c:601: warning: Function parameter or member 'no_backup' not described in 'vmw_resource_reserve'
 drivers/gpu/drm/vmwgfx/vmwgfx_resource.c:987: warning: Function parameter or member 'interruptible' not described in 'vmw_resource_pin'

Cc: VMware Graphics <linux-graphics-maintainer@vmware.com>
Cc: Roland Scheidegger <sroland@vmware.com>
Cc: David Airlie <airlied@linux.ie>
Cc: Daniel Vetter <daniel@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org
Signed-off-by: Lee Jones <lee.jones@linaro.org>
Signed-off-by: Zack Rusin <zackr@vmware.com>
Link: https://patchwork.freedesktop.org/patch/msgid/20210115181313.3431493-11-lee.jones@linaro.org
---
 drivers/gpu/drm/vmwgfx/vmwgfx_resource.c | 10 ++++------
 1 file changed, 4 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_resource.c b/drivers/gpu/drm/vmwgfx/vmwgfx_resource.c
index d1e7b9608145b..c4df51a2a9262 100644
--- a/drivers/gpu/drm/vmwgfx/vmwgfx_resource.c
+++ b/drivers/gpu/drm/vmwgfx/vmwgfx_resource.c
@@ -202,7 +202,6 @@ int vmw_resource_alloc_id(struct vmw_resource *res)
  *
  * @dev_priv:       Pointer to a device private struct.
  * @res:            The struct vmw_resource to initialize.
- * @obj_type:       Resource object type.
  * @delay_id:       Boolean whether to defer device id allocation until
  *                  the first validation.
  * @res_free:       Resource destructor.
@@ -288,8 +287,6 @@ int vmw_user_resource_lookup_handle(struct vmw_private *dev_priv,
  * @tfile:        Pointer to a struct ttm_object_file identifying the caller
  * @handle:       The TTM user-space handle
  * @converter:    Pointer to an object describing the resource type
- * @p_res:        On successful return the location pointed to will contain
- *                a pointer to a refcounted struct vmw_resource.
  *
  * If the handle can't be found or is associated with an incorrect resource
  * type, -EINVAL will be returned.
@@ -315,7 +312,7 @@ vmw_user_resource_noref_lookup_handle(struct vmw_private *dev_priv,
 	return converter->base_obj_to_res(base);
 }
 
-/**
+/*
  * Helper function that looks either a surface or bo.
  *
  * The pointer this pointed at by out_surf and out_buf needs to be null.
@@ -388,6 +385,7 @@ static int vmw_resource_buf_alloc(struct vmw_resource *res,
  * @res:            The resource to make visible to the device.
  * @val_buf:        Information about a buffer possibly
  *                  containing backup data if a bind operation is needed.
+ * @dirtying:       Transfer dirty regions.
  *
  * On hardware resource shortage, this function returns -EBUSY and
  * should be retried once resources have been freed up.
@@ -586,7 +584,7 @@ vmw_resource_check_buffer(struct ww_acquire_ctx *ticket,
 	return ret;
 }
 
-/**
+/*
  * vmw_resource_reserve - Reserve a resource for command submission
  *
  * @res:            The resource to reserve.
@@ -973,7 +971,7 @@ void vmw_resource_evict_all(struct vmw_private *dev_priv)
 	mutex_unlock(&dev_priv->cmdbuf_mutex);
 }
 
-/**
+/*
  * vmw_resource_pin - Add a pin reference on a resource
  *
  * @res: The resource to add a pin reference on
-- 
2.27.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
