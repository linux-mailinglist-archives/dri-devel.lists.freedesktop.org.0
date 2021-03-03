Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BCDD32B83F
	for <lists+dri-devel@lfdr.de>; Wed,  3 Mar 2021 14:44:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8D15A6E976;
	Wed,  3 Mar 2021 13:44:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com
 [IPv6:2a00:1450:4864:20::42f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E240A6E947
 for <dri-devel@lists.freedesktop.org>; Wed,  3 Mar 2021 13:44:15 +0000 (UTC)
Received: by mail-wr1-x42f.google.com with SMTP id u14so23750259wri.3
 for <dri-devel@lists.freedesktop.org>; Wed, 03 Mar 2021 05:44:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=oU+Wuk0/TjV8ruLVEbq6ixpjRneTtMF4qHY1z5Ned04=;
 b=q18eepXedncQkYrl7klqtSmyDsv1da3LROy3QdvrfbU4mhiYOow55NlC78cGMJgA4C
 +GqgDuboY2FgIAY9TSeBbzjPOkPhkKsh7+7UNDRyjUdgXfmDz9dnTN5wQfjwzcnDO+IP
 qEZJCDueuZ/8dUhqZuD3xLnZu0EtraaFy4HzVGdD+QsUgs89Lf8rJMxMG5Gt/5CSBmxv
 jhUsJhSCPxYAjbSqDfO8IaS2rxC5grdYGZUqLkV0/R7Th3+rmSYHFfLutzrfLU4Xclp+
 5j2th56OokJ5gqK0uC3EidXW/5JfJ+FoK7bL268Je2dRQZy9qy0mxxOCaJHt4o0sRu1r
 eU0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=oU+Wuk0/TjV8ruLVEbq6ixpjRneTtMF4qHY1z5Ned04=;
 b=FMBxlMs5RxYqPiHjJeK7RwXJGSSWxpSpFrL/mNpx9ha4Uk5dSoBhd+GVE0ypsaI2jQ
 lzwve4Wl5uBIN1wsNxaHqRZaOoriM1i91SdynwQzsSGww1t8DFpD1cLjPyauqpJdSOX4
 +CAZbXM3AT94lelsWWzfK7prmBBYQYfE/Wu8JR26m4oXoWBdGqkinBXqJhBL8vzdPc53
 5ReEdNC3c8CCmhreg3fTSsRH3woJiUOci3Bp3dcFLIp3deRfadQrlNcxZ0WDRCK2Luvn
 efyIqiMTfSPCB2MDChvCp0YuSQkx3f5t3p0lW2gWXZCgIxrLM6cNvIchcXCtb8jxCRuj
 v0sA==
X-Gm-Message-State: AOAM5321DQW8GNuTLW9oqiTsM4XgAvO8O/v8WdqGWU9wj8jFa6WuPpAl
 k4wD9fuXXmD7lB36ijbPuYjIQGMOn1gggw==
X-Google-Smtp-Source: ABdhPJxAWbIB9dzrj4kD6cvlizaCG/C3XcFqBAgW0/W0ST4tthKwcOPqZQAVqX04CamVOPFrRTadFg==
X-Received: by 2002:adf:fecc:: with SMTP id q12mr27041197wrs.317.1614779054571; 
 Wed, 03 Mar 2021 05:44:14 -0800 (PST)
Received: from dell.default ([91.110.221.155])
 by smtp.gmail.com with ESMTPSA id w18sm6109524wrr.7.2021.03.03.05.44.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 Mar 2021 05:44:14 -0800 (PST)
From: Lee Jones <lee.jones@linaro.org>
To: lee.jones@linaro.org
Subject: [PATCH 39/53] drm/vmwgfx/vmwgfx_cmdbuf_res: Rename param description
 and remove another
Date: Wed,  3 Mar 2021 13:43:05 +0000
Message-Id: <20210303134319.3160762-40-lee.jones@linaro.org>
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

Also fix a small formatting issue.

Fixes the following W=1 kernel build warning(s):

 drivers/gpu/drm/vmwgfx/vmwgfx_cmdbuf_res.c:83: warning: Function parameter or member 'res_type' not described in 'vmw_cmdbuf_res_lookup'
 drivers/gpu/drm/vmwgfx/vmwgfx_cmdbuf_res.c:83: warning: Excess function parameter 'resource_type' description in 'vmw_cmdbuf_res_lookup'
 drivers/gpu/drm/vmwgfx/vmwgfx_cmdbuf_res.c:161: warning: Excess function parameter 'man' description in 'vmw_cmdbuf_res_revert'
 drivers/gpu/drm/vmwgfx/vmwgfx_cmdbuf_res.c:330: warning: Cannot understand  *

Cc: VMware Graphics <linux-graphics-maintainer@vmware.com>
Cc: Roland Scheidegger <sroland@vmware.com>
Cc: David Airlie <airlied@linux.ie>
Cc: Daniel Vetter <daniel@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org
Signed-off-by: Lee Jones <lee.jones@linaro.org>
Signed-off-by: Zack Rusin <zackr@vmware.com>
Link: https://patchwork.freedesktop.org/patch/msgid/20210115181313.3431493-36-lee.jones@linaro.org
---
 drivers/gpu/drm/vmwgfx/vmwgfx_cmdbuf_res.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_cmdbuf_res.c b/drivers/gpu/drm/vmwgfx/vmwgfx_cmdbuf_res.c
index 44d858ce4ce7f..92509fbf2fd1d 100644
--- a/drivers/gpu/drm/vmwgfx/vmwgfx_cmdbuf_res.c
+++ b/drivers/gpu/drm/vmwgfx/vmwgfx_cmdbuf_res.c
@@ -69,7 +69,7 @@ struct vmw_cmdbuf_res_manager {
  * vmw_cmdbuf_res_lookup - Look up a command buffer resource
  *
  * @man: Pointer to the command buffer resource manager
- * @resource_type: The resource type, that combined with the user key
+ * @res_type: The resource type, that combined with the user key
  * identifies the resource.
  * @user_key: The user key.
  *
@@ -148,7 +148,6 @@ void vmw_cmdbuf_res_commit(struct list_head *list)
 /**
  * vmw_cmdbuf_res_revert - Revert a list of command buffer resource actions
  *
- * @man: Pointer to the command buffer resource manager
  * @list: Caller's list of command buffer resource action
  *
  * This function reverts a list of command buffer resource
@@ -327,7 +326,6 @@ void vmw_cmdbuf_res_man_destroy(struct vmw_cmdbuf_res_manager *man)
 }
 
 /**
- *
  * vmw_cmdbuf_res_man_size - Return the size of a command buffer managed
  * resource manager
  *
-- 
2.27.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
