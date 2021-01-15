Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 538DC2F8382
	for <lists+dri-devel@lfdr.de>; Fri, 15 Jan 2021 19:14:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 47AD86E4AD;
	Fri, 15 Jan 2021 18:14:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com
 [IPv6:2a00:1450:4864:20::42d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DEC6E6E49C
 for <dri-devel@lists.freedesktop.org>; Fri, 15 Jan 2021 18:14:09 +0000 (UTC)
Received: by mail-wr1-x42d.google.com with SMTP id q18so10221671wrn.1
 for <dri-devel@lists.freedesktop.org>; Fri, 15 Jan 2021 10:14:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=rAHTpQV67+yi8IQrXKtmnaLMIm66ZFnUBK29ghZYvfc=;
 b=Nhj14BJzABYIFqNisKEiHe7Xysxmd1ToE7+1Z1jwpfJT2WG2FjxKeE1v5ohYi1M+u2
 PwptNNWwEs2UT1csoXAAnC8d+x+92BeB9CpbKasePwnJu7qcmvY6/3Dwp0fPi7p0C2/m
 0wfu9hHvHgb3mY7ErQ5OX3aBEj80z8N0W1o5wrVgIbIhWRIF2UARd+crx/VxL2myuKKV
 CaeJK6h4Wb0OScZBmCHbxBE5exHnFWRlXf+KIt/E+T3lOB9y+7mof02reoPT6TAMmOfM
 cmcD3b2dpRs5adKgFBRo3x4OfAnRy5275lq9GH6pLyego75IXwUDd0X5LOJ70l6D8X0N
 gI4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=rAHTpQV67+yi8IQrXKtmnaLMIm66ZFnUBK29ghZYvfc=;
 b=iDWfO+TZNpcGEcG7TNgB71usM3LVURK8mGNnMLGkVUDyoHf8rxePPuzh1t1ESaeZts
 NO64FP+o90r5VUUK3EmYFUPqi6o+9gZL8aKc+yX9yosl5pIGmPezA/3o+UIJKQJs+9Y3
 StG9xBJ1A0aTcs0csBLOyK4fDCVRpuFVYMw2Skk8EfhZ4IPHNqTO6SZnLPjdrzHOSpdj
 ViEk8czPF0wBKkeRV6kocFbJvtI4HJQdb0tG5ekOmkb4xOoGjKH/rMtpWkdH+HL5jPah
 YAcXU4tcJbcauNTPEUn0UTYETR5KYSBB1lXuuN+y+n5HPzysXUu3ux6PciT0aRsFEpwt
 PNoA==
X-Gm-Message-State: AOAM530cr+uU3gEMsVMxmHGyIFEtTdMUhhZYt0xpCnsA/YTa+eGNsYj+
 j0FVNdhimrQOXXHnJsP0Mgtrqg==
X-Google-Smtp-Source: ABdhPJya07h3DVptEeRHtjRpX4ZhUhiKUWJNJfS7SRBdQy1whh2AMhi6JfbWr5rUIdQF/chrtL/tsg==
X-Received: by 2002:adf:92c2:: with SMTP id 60mr14645619wrn.266.1610734448617; 
 Fri, 15 Jan 2021 10:14:08 -0800 (PST)
Received: from dell.default ([91.110.221.158])
 by smtp.gmail.com with ESMTPSA id j2sm16123484wrh.78.2021.01.15.10.14.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 15 Jan 2021 10:14:07 -0800 (PST)
From: Lee Jones <lee.jones@linaro.org>
To: lee.jones@linaro.org
Subject: [PATCH 35/40] drm/vmwgfx/vmwgfx_cmdbuf_res: Rename param description
 and remove another
Date: Fri, 15 Jan 2021 18:13:08 +0000
Message-Id: <20210115181313.3431493-36-lee.jones@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210115181313.3431493-1-lee.jones@linaro.org>
References: <20210115181313.3431493-1-lee.jones@linaro.org>
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
2.25.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
