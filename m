Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BDA5590C7C
	for <lists+dri-devel@lfdr.de>; Fri, 12 Aug 2022 09:24:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1083B9493F;
	Fri, 12 Aug 2022 07:24:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bg5.exmail.qq.com (bg4.exmail.qq.com [43.154.221.58])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7D097B48EB
 for <dri-devel@lists.freedesktop.org>; Thu, 11 Aug 2022 15:52:02 +0000 (UTC)
X-QQ-mid: bizesmtp66t1660233114trxafeml
Received: from localhost.localdomain ( [110.188.55.240])
 by bizesmtp.qq.com (ESMTP) with 
 id ; Thu, 11 Aug 2022 23:51:48 +0800 (CST)
X-QQ-SSF: 0100000000200080H000B00A0000020
X-QQ-FEAT: Q4gfBD3K7t8iW+F0xuDf5mMaMd6N4pAHBcC2EIS+5calpQO2x1oVsk6bfAZ7T
 Y3M9N0LHD/A7CX2f15X93XNw2oLcl4+dZhLAAP2ybCUI9NNj3f4n/l+DdizVNlNpTHu3fBc
 mYUCafzJUS7gAynGqW+FCRy0nwYLdgUawc7a1z5SHfqX3sgG/fDy9x7OXv7/3FngzIvwk94
 yLKz4wG0hxRveyx09ui9CSvqw8GthCeIC2BCxpJnSmU1hgR4tJxg3SLGh88qtm4rH8CrhvA
 xjfUyAxRm3Xs6lXZtd/ELaxtSjw/Lsba+6g8vsUUz44xycfR4JbFviwEO2Jj1h5q/XGzNID
 hrfjjaYJDDQkXHPVSIwk02SSCkLuf06ub/BE/NiDLQMZ9i7anMhTCqA7ZH146aBjfmpmARo
X-QQ-GoodBg: 0
From: min tang <tangmin@cdjrlc.com>
To: airlied@linux.ie,
	daniel@ffwll.ch
Subject: [PATCH] drm/vmwgfx: Fix comment typo
Date: Thu, 11 Aug 2022 23:51:36 +0800
Message-Id: <20220811155136.13526-1-tangmin@cdjrlc.com>
X-Mailer: git-send-email 2.17.1
X-QQ-SENDSIZE: 520
Feedback-ID: bizesmtp:cdjrlc.com:qybglogicsvr:qybglogicsvr6
X-Mailman-Approved-At: Fri, 12 Aug 2022 07:21:22 +0000
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
Cc: min tang <tangmin@cdjrlc.com>, linux-graphics-maintainer@vmware.com,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The double `to' is duplicated in line 384, remove one,The double `to' is duplicated in line 412, remove one.

Signed-off-by: min tang <tangmin@cdjrlc.com>
---
 drivers/gpu/drm/vmwgfx/vmwgfx_execbuf.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_execbuf.c b/drivers/gpu/drm/vmwgfx/vmwgfx_execbuf.c
index d49de4905efa..82b9d33ecc84 100644
--- a/drivers/gpu/drm/vmwgfx/vmwgfx_execbuf.c
+++ b/drivers/gpu/drm/vmwgfx/vmwgfx_execbuf.c
@@ -381,7 +381,7 @@ static int vmw_execbuf_res_noctx_val_add(struct vmw_sw_context *sw_context,
 }
 
 /**
- * vmw_view_res_val_add - Add a view and the surface it's pointing to to the
+ * vmw_view_res_val_add - Add a view and the surface it's pointing to the
  * validation list
  *
  * @sw_context: The software context holding the validation list.
@@ -409,7 +409,7 @@ static int vmw_view_res_val_add(struct vmw_sw_context *sw_context,
 
 /**
  * vmw_view_id_val_add - Look up a view and add it and the surface it's pointing
- * to to the validation list.
+ * to the validation list.
  *
  * @sw_context: The software context holding the validation list.
  * @view_type: The view type to look up.
-- 
2.17.1

