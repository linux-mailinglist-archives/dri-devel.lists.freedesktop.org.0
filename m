Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 40F802F8376
	for <lists+dri-devel@lfdr.de>; Fri, 15 Jan 2021 19:14:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 72F7B6E49D;
	Fri, 15 Jan 2021 18:14:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com
 [IPv6:2a00:1450:4864:20::431])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 259D46E499
 for <dri-devel@lists.freedesktop.org>; Fri, 15 Jan 2021 18:14:00 +0000 (UTC)
Received: by mail-wr1-x431.google.com with SMTP id 6so2905327wri.3
 for <dri-devel@lists.freedesktop.org>; Fri, 15 Jan 2021 10:14:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Clem9oGlYEGrbDU0lDjY42b02EcBqg1/k29GPavGgpg=;
 b=w7kJiKffb+UC6FN4MbUl3hcif4Ao5PrzLRGEJBPBjkUCSG9AJgdTwQm0TtB3bhU4eC
 2E5zcBTxMAM9x7bVsuwBM4gxxzPdYkRkC9mJ7Yyl0LUZpwSFrevFqHUQ11rXy7O1CcjA
 huRymOZyg36Fs7ojzhz66e0zhryoc5NCBAj+WSUBIsDLS4H2oemqmnZC3w+C/RYBvLdV
 SYf6iz35K1ReS5FwE6GOuzYP0ISGJsazo9iwFUl/U0MJn9GPMmHZaK8HrTQbRNTbvaG1
 do7wy1cbFdwiVT2Zns7YE2MWRne9n7I9qENsTVzKjBYzZL++G+XG6qXkQ6oykegTYwjj
 eQ9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Clem9oGlYEGrbDU0lDjY42b02EcBqg1/k29GPavGgpg=;
 b=h0pyJ49NYWcPtOkw9+3mGcZnmk08TTHLDzDxPlysjT0lcXJ0+KdA/K6v8gnNEh7kcq
 5hVzn0gDamNlPY+H9bK3QlQTJ6dOI+6OoD+RErzvp7xuHwcxoXFila3N3aSyly8CatMx
 gF1vf+dOcAIeSz+NZvrbqjugTtffd26pRyhFPdFNjvow5BeWr1vlCcM1xviHUgLuNsGx
 SbTzbmLLqYZb/PrPDt1a1d0bamhw9+DdLWpnyoXUlwUxJa9GYMI22FL65uevLqLUaP5U
 CC2QwQ07FdSxhygpuAmyGPAJV/3ZxZi7zTH8f3pjEdHqzMVgQNxxwbRnmiRyQ9fRAST4
 g2hA==
X-Gm-Message-State: AOAM533iXnzqezvAV6gCrBwFyiSnnwPd4/QnOP8m2GZDUog9QmaAuDpo
 rQaYfNX8tsEUz/V2r64a7kS3hg==
X-Google-Smtp-Source: ABdhPJyv/fDErsavQlK/fWf8PXQiUArsAlsCjCiC/JaSrC/YrLefouSMJ01A21nPnYQKjJDUWtgXCg==
X-Received: by 2002:adf:d187:: with SMTP id v7mr73152wrc.50.1610734438759;
 Fri, 15 Jan 2021 10:13:58 -0800 (PST)
Received: from dell.default ([91.110.221.158])
 by smtp.gmail.com with ESMTPSA id j2sm16123484wrh.78.2021.01.15.10.13.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 15 Jan 2021 10:13:58 -0800 (PST)
From: Lee Jones <lee.jones@linaro.org>
To: lee.jones@linaro.org
Subject: [PATCH 27/40] drm/vmwgfx/vmwgfx_bo: Remove superfluous param
 description and supply another
Date: Fri, 15 Jan 2021 18:13:00 +0000
Message-Id: <20210115181313.3431493-28-lee.jones@linaro.org>
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

Fixes the following W=1 kernel build warning(s):

 drivers/gpu/drm/vmwgfx/vmwgfx_bo.c:142: warning: Excess function parameter 'pin' description in 'vmw_bo_pin_in_vram_or_gmr'
 drivers/gpu/drm/vmwgfx/vmwgfx_bo.c:647: warning: Function parameter or member 'p_base' not described in 'vmw_user_bo_alloc'

Cc: VMware Graphics <linux-graphics-maintainer@vmware.com>
Cc: Roland Scheidegger <sroland@vmware.com>
Cc: David Airlie <airlied@linux.ie>
Cc: Daniel Vetter <daniel@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org
Signed-off-by: Lee Jones <lee.jones@linaro.org>
---
 drivers/gpu/drm/vmwgfx/vmwgfx_bo.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_bo.c b/drivers/gpu/drm/vmwgfx/vmwgfx_bo.c
index 63dbc44eebe0b..ab0844b47d4d7 100644
--- a/drivers/gpu/drm/vmwgfx/vmwgfx_bo.c
+++ b/drivers/gpu/drm/vmwgfx/vmwgfx_bo.c
@@ -131,7 +131,6 @@ int vmw_bo_pin_in_placement(struct vmw_private *dev_priv,
  *
  * @dev_priv:  Driver private.
  * @buf:  DMA buffer to move.
- * @pin:  Pin buffer if true.
  * @interruptible:  Use interruptible wait.
  * Return: Zero on success, Negative error code on failure. In particular
  * -ERESTARTSYS if interrupted by a signal
@@ -635,6 +634,7 @@ static void vmw_user_bo_ref_obj_release(struct ttm_base_object *base,
  * @handle: Pointer to where the handle value should be assigned.
  * @p_vbo: Pointer to where the refcounted struct vmw_buffer_object pointer
  * should be assigned.
+ * @p_base: The TTM base object pointer about to be allocated.
  * Return: Zero on success, negative error code on error.
  */
 int vmw_user_bo_alloc(struct vmw_private *dev_priv,
-- 
2.25.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
