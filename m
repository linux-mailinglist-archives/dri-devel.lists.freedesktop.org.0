Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CCA148BFC8
	for <lists+dri-devel@lfdr.de>; Wed, 12 Jan 2022 09:24:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F14E81127CC;
	Wed, 12 Jan 2022 08:24:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-x729.google.com (mail-qk1-x729.google.com
 [IPv6:2607:f8b0:4864:20::729])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5DF591127CC
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Jan 2022 08:24:30 +0000 (UTC)
Received: by mail-qk1-x729.google.com with SMTP id w27so1685668qkj.7
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Jan 2022 00:24:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=mDyDHXSTcP/fcz/Ik9my/MjZZmU+tdvjzX7IK6WOHyU=;
 b=MHRvZCNyGu0ty3Xw/vdKOR14gyy1jXuC34+QwC6mTBBrtbdx+e14gB3bx9RAl1JZag
 83nL5r0nKOB2mgEvpAo4blkkCddcNy0GqbrUpLwlTv2VdnBYYe7Ltndok0AcV1aNwX3U
 nJY1iV9rHpYc2dz0n/OBMO1IoIyp0VpOhUaYxETsixC/YA9y+JV+YvbEedBwimGq77ha
 dn0ANOT1EFBKYp/tLD7isna8qE2vN3EVnWpKdNBJsfdmme1yqdgh9ivstWiJX3klpcJU
 qmRSjktGRrE2jqD13y0pw8lfPSIAuCDqtm8sOl7Z7TC2gfWu/HI6km9H/NglYzmVNz49
 79BA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=mDyDHXSTcP/fcz/Ik9my/MjZZmU+tdvjzX7IK6WOHyU=;
 b=Dv/+KXmKBkMZ62I7swPhvk7ZDAgHonpxErRkBPMKUvUivyQQlX1XB/S5yM9Jdp7elR
 7Vc2jz6C7g7EkmRYTPsbko6U1FB/nM2x3AjA8nxRSEl5B+Hs6zVkwU6kthvM+EtSIYN6
 OmZMjoVVk29KUuXaXAVCl34VPoNB1yAW65gQ5ch/UCkLipfKrnRww8JbrwTO5adhypfT
 /L8XfX4IXK+rS4hyx958oGoPDYq7/3f9vjJBSGv5dSXSqHiBPW8uakygprfDmFl4Aq05
 FAM+ZBm6Rjy/GWHgpm+mkDop2ea6EVnkim5QKty9Xy7MACB0cxenGNiWoVtB4onRYGR9
 iV2A==
X-Gm-Message-State: AOAM530ZNHcthLYGMgdDH1JfhBi0RiPbNipmdCyapAZp1qCxP9ynLsUt
 +l0gpbf24IyGm4KLXWdKdsQ=
X-Google-Smtp-Source: ABdhPJzjJvX46JrQ96a1bwmjMBHsAyGa/toJgTZnywoNAX4sA5CUUyIkx12IMLkzklCoHTSq6PoOfQ==
X-Received: by 2002:a05:620a:10ac:: with SMTP id
 h12mr5443748qkk.467.1641975869522; 
 Wed, 12 Jan 2022 00:24:29 -0800 (PST)
Received: from localhost.localdomain ([193.203.214.57])
 by smtp.gmail.com with ESMTPSA id 8sm4902248qtz.86.2022.01.12.00.24.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 12 Jan 2022 00:24:29 -0800 (PST)
From: cgel.zte@gmail.com
X-Google-Original-From: chi.minghao@zte.com.cn
To: linux-graphics-maintainer@vmware.com
Subject: [PATCH] drm/vmwgfx: remove redundant ret variable
Date: Wed, 12 Jan 2022 08:24:22 +0000
Message-Id: <20220112082422.667488-1-chi.minghao@zte.com.cn>
X-Mailer: git-send-email 2.25.1
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
Cc: airlied@linux.ie, CGEL ZTE <cgel.zte@gmail.com>,
 Zeal Robot <zealci@zte.com.cn>, linux-kernel@vger.kernel.org,
 Minghao Chi <chi.minghao@zte.com.cn>, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Minghao Chi <chi.minghao@zte.com.cn>

Return value from vmw_gem_object_create_with_handle() directly instead
of taking this in another redundant variable.

Reported-by: Zeal Robot <zealci@zte.com.cn>
Signed-off-by: Minghao Chi <chi.minghao@zte.com.cn>
Signed-off-by: CGEL ZTE <cgel.zte@gmail.com>
---
 drivers/gpu/drm/vmwgfx/vmwgfx_bo.c | 6 +-----
 1 file changed, 1 insertion(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_bo.c b/drivers/gpu/drm/vmwgfx/vmwgfx_bo.c
index 31aecc46624b..91b03f1dbbf0 100644
--- a/drivers/gpu/drm/vmwgfx/vmwgfx_bo.c
+++ b/drivers/gpu/drm/vmwgfx/vmwgfx_bo.c
@@ -778,18 +778,14 @@ int vmw_dumb_create(struct drm_file *file_priv,
 {
 	struct vmw_private *dev_priv = vmw_priv(dev);
 	struct vmw_buffer_object *vbo;
-	int ret;
 
 	args->pitch = args->width * ((args->bpp + 7) / 8);
 	args->size = ALIGN(args->pitch * args->height, PAGE_SIZE);
 
-	ret = vmw_gem_object_create_with_handle(dev_priv, file_priv,
+	return vmw_gem_object_create_with_handle(dev_priv, file_priv,
 						args->size, &args->handle,
 						&vbo);
 
-	return ret;
-}
-
 /**
  * vmw_bo_swap_notify - swapout notify callback.
  *
-- 
2.25.1

