Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8110132B83B
	for <lists+dri-devel@lfdr.de>; Wed,  3 Mar 2021 14:44:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4202F6E94B;
	Wed,  3 Mar 2021 13:44:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com
 [IPv6:2a00:1450:4864:20::335])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B3A196E906
 for <dri-devel@lists.freedesktop.org>; Wed,  3 Mar 2021 13:44:11 +0000 (UTC)
Received: by mail-wm1-x335.google.com with SMTP id
 w203-20020a1c49d40000b029010c706d0642so2883759wma.0
 for <dri-devel@lists.freedesktop.org>; Wed, 03 Mar 2021 05:44:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ZfWPfWVAydp9c1JpExjEII7q1h7jeahnMQCqr/L+ySU=;
 b=saVDJ26t7oNKFUQwsL+FnoC2ZeIneC/6VVDLmxgPYUX1pI0oKfXk4WX6kmwcoLuznA
 RPNORFIetrA5fZ3XUOUmrTO49N/yLveaGeuNP/ZHO9hauUsb6wgXkxyJqiy5Y0eNJMCv
 SSbRJc3XSDmr9jQNPV3/aoZrr/oa6DvZJIiUxGj4gUlgv7/T48AWqh14qPdYZ8PQifmm
 Y9F58Q4TA1bVdvipYTzEZO8yx7iTtg2Yxwz2DZmFe+dLpVM/sVtdwhL5p6d1nKmyCP9F
 KSBBamRx9CwXZk+2h2/jK/4ybKIjSaYXgnAA17ObttEc6CjoRrAP4AVktpguf5AyiKaZ
 N6HA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ZfWPfWVAydp9c1JpExjEII7q1h7jeahnMQCqr/L+ySU=;
 b=iaKcEGvRXWTWPW7J/TaUfxvub+aiBONJN+ZmCziX2+kXHHerB7Z+iJMjnT7YBQrZXV
 xldrgX8uEFV2Tf0bphl2tupafOWB/Be+XhywCxrMPhMgorAIXUkq6vYXCds7r1WPDubq
 IuPZOxXox8t0N3wrAQ2r4MsvFA+zH01q0QeSG6YKD1tB+JmwGnjOU3aR1zNLXfkXXA2+
 fhSjE14TwocxcEel4gUxDSKX79OHHgK6rDQQ6AimT4bfqXPEsRCO/8Pu2NK1V0KnX6Yi
 c+zeO3NkK6IcQ4vTGNf+HOGYnTY3FrF5aUnIDbMXqJRpbQUtRKjqGhkzTqWuPtIXcpL/
 V6EQ==
X-Gm-Message-State: AOAM533hVhFHxVO1rZ7XjfDdPKv3O2leeH9bO5WgH+9CEsDiS6br/jRg
 rtU9zzC0V9yqg8ckt8ylN10iww==
X-Google-Smtp-Source: ABdhPJzKqaRFAfr31zi+5FIk/MARWWGNhTdr0Nx16XjCRm4v+emDYuXZ8xw9OmJ7u4fIu8FyrYWlqw==
X-Received: by 2002:a1c:4e12:: with SMTP id g18mr8570012wmh.56.1614779050376; 
 Wed, 03 Mar 2021 05:44:10 -0800 (PST)
Received: from dell.default ([91.110.221.155])
 by smtp.gmail.com with ESMTPSA id w18sm6109524wrr.7.2021.03.03.05.44.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 Mar 2021 05:44:09 -0800 (PST)
From: Lee Jones <lee.jones@linaro.org>
To: lee.jones@linaro.org
Subject: [PATCH 35/53] drm/vmwgfx/vmwgfx_bo: Remove superfluous param
 description and supply another
Date: Wed,  3 Mar 2021 13:43:01 +0000
Message-Id: <20210303134319.3160762-36-lee.jones@linaro.org>
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

 drivers/gpu/drm/vmwgfx/vmwgfx_bo.c:142: warning: Excess function parameter 'pin' description in 'vmw_bo_pin_in_vram_or_gmr'
 drivers/gpu/drm/vmwgfx/vmwgfx_bo.c:647: warning: Function parameter or member 'p_base' not described in 'vmw_user_bo_alloc'

Cc: VMware Graphics <linux-graphics-maintainer@vmware.com>
Cc: Roland Scheidegger <sroland@vmware.com>
Cc: David Airlie <airlied@linux.ie>
Cc: Daniel Vetter <daniel@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org
Signed-off-by: Lee Jones <lee.jones@linaro.org>
Signed-off-by: Zack Rusin <zackr@vmware.com>
Link: https://patchwork.freedesktop.org/patch/msgid/20210115181313.3431493-28-lee.jones@linaro.org
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
2.27.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
