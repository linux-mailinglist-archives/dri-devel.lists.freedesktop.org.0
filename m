Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C5196398CFE
	for <lists+dri-devel@lfdr.de>; Wed,  2 Jun 2021 16:33:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AB4FD6ECD0;
	Wed,  2 Jun 2021 14:33:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com
 [IPv6:2a00:1450:4864:20::32f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 12C336ECCD
 for <dri-devel@lists.freedesktop.org>; Wed,  2 Jun 2021 14:33:34 +0000 (UTC)
Received: by mail-wm1-x32f.google.com with SMTP id
 h12-20020a05600c350cb029019fae7a26cdso1788733wmq.5
 for <dri-devel@lists.freedesktop.org>; Wed, 02 Jun 2021 07:33:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=JvuBm7KpIXmVjvwi2OsKGMdogxy/zdINv8FqDSEvNYM=;
 b=nH1tswbv/dRTxAbMVL2oQ+YkAIasGdidijupRDL7c3sCfVwK+oNtIhOPL0xok9gzVW
 t5+ceR05rXZ7uMo2uFij6BvFfqXaDmi0JMWGswWKDBNIILG5hLPYn20T6fCzdxolvyPX
 +XTqGQ5X5YYinYoN2/mYvDaKDcYXM0/IDw799rIPSAk/3ROkjHPygpnIc7Z8qekh7XqF
 ANhYI2NCG0tckEoHP506uUWeO9SDw2dESxg+EJ8Be80RUywMFpYsHwunvITnn9pQm8V5
 0tiSbn6+yxv5bdePKcmjb5leSF3Dh/kD4YgCPLWnT+gapDJbriqm67BYzq1bujgpWvBm
 NwKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=JvuBm7KpIXmVjvwi2OsKGMdogxy/zdINv8FqDSEvNYM=;
 b=VGCUOZaXxmW6Dv2yqNEjPOBh94is/Z6ccYSzXZ6gDI8yDtM5D0JnoXXLG0HnQW6080
 rmHC50fCcEujvMK5T/H+ZhyqOrl62EJlOLcs1cgOD6bbIKM+6Dj+U8nIa7fgTbY9Jgvy
 mL9CS1velXFISrAPCJM2A/rOZ2xu4mfXU3GgFQhs6vtjV556FXD7/gTEChM97Q7seGVa
 IlqSTsF80EdLW71XT4FK+E0l9ZdTITzZUYUJteWbQ0oZmqHtdCnxMQb+eo6UXhZppNTV
 RzbNrsLdty9X4IbhhicmoPIF2yco3AwrrOimEy8PL6l47JZVBLbbyF+c7PCBKwfr+H8f
 3KWg==
X-Gm-Message-State: AOAM531dDervbHUVahvGlN1oQObW2LcHSeJYRMdth9IWA081WpHO0U8Q
 MiSCMDqY4FTVFKb76PjBJ++fZQ==
X-Google-Smtp-Source: ABdhPJyUgla3FFfynuCl+ad/SpJvdCBqRlxX5f3USSzH6/SPYgduUsfipkbdGBvQZ5pWNouc43kgzw==
X-Received: by 2002:a1c:41c5:: with SMTP id o188mr5498913wma.60.1622644412785; 
 Wed, 02 Jun 2021 07:33:32 -0700 (PDT)
Received: from dell.default ([91.110.221.214])
 by smtp.gmail.com with ESMTPSA id o11sm132315wrq.93.2021.06.02.07.33.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 02 Jun 2021 07:33:32 -0700 (PDT)
From: Lee Jones <lee.jones@linaro.org>
To: lee.jones@linaro.org
Subject: [RESEND 22/26] drm/vgem/vgem_drv: Standard comment blocks should not
 use kernel-doc format
Date: Wed,  2 Jun 2021 15:32:56 +0100
Message-Id: <20210602143300.2330146-23-lee.jones@linaro.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210602143300.2330146-1-lee.jones@linaro.org>
References: <20210602143300.2330146-1-lee.jones@linaro.org>
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
Cc: Ben Widawsky <ben@bwidawsk.net>, David Airlie <airlied@linux.ie>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linaro-mm-sig@lists.linaro.org,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Fixes the following W=1 kernel build warning(s):

 drivers/gpu/drm/vgem/vgem_drv.c:47: warning: expecting prototype for This is vgem, a (non-hardware(). Prototype was for DRIVER_NAME() instead

Cc: David Airlie <airlied@linux.ie>
Cc: Daniel Vetter <daniel@ffwll.ch>
Cc: Sumit Semwal <sumit.semwal@linaro.org>
Cc: "Christian König" <christian.koenig@amd.com>
Cc: Adam Jackson <ajax@redhat.com>
Cc: Ben Widawsky <ben@bwidawsk.net>
Cc: dri-devel@lists.freedesktop.org
Cc: linux-media@vger.kernel.org
Cc: linaro-mm-sig@lists.linaro.org
Signed-off-by: Lee Jones <lee.jones@linaro.org>
---
 drivers/gpu/drm/vgem/vgem_drv.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/vgem/vgem_drv.c b/drivers/gpu/drm/vgem/vgem_drv.c
index a0e75f1d5d016..bf38a7e319d14 100644
--- a/drivers/gpu/drm/vgem/vgem_drv.c
+++ b/drivers/gpu/drm/vgem/vgem_drv.c
@@ -25,7 +25,7 @@
  *	Ben Widawsky <ben@bwidawsk.net>
  */
 
-/**
+/*
  * This is vgem, a (non-hardware-backed) GEM service.  This is used by Mesa's
  * software renderer and the X server for efficient buffer sharing.
  */
-- 
2.31.1

