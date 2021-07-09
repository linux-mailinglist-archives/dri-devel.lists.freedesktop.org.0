Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 346113C28DF
	for <lists+dri-devel@lfdr.de>; Fri,  9 Jul 2021 20:10:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EE5F16E941;
	Fri,  9 Jul 2021 18:10:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x1034.google.com (mail-pj1-x1034.google.com
 [IPv6:2607:f8b0:4864:20::1034])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9268E6E941
 for <dri-devel@lists.freedesktop.org>; Fri,  9 Jul 2021 18:10:03 +0000 (UTC)
Received: by mail-pj1-x1034.google.com with SMTP id
 x21-20020a17090aa395b029016e25313bfcso6520677pjp.2
 for <dri-devel@lists.freedesktop.org>; Fri, 09 Jul 2021 11:10:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=OS58rij80ElucW0PY66L5D8ExybPJH/1VgMC6duZHlU=;
 b=go5RVxO2kU2+etrFfSYo+VyLT/24peH+yKtEuAV1pK4ASOt71ljZc69/msO+AOs6i7
 fOyDdnkdLvrsk3LrtdRRlWFx3uTOD0xyo/L732NKQTseg8H7fmz5D82oLFNtGQIfcnK4
 JhjVMtJB2lp2IQnICyNIWd4Dug0zI5FsholSkTe+T90w6bO02wObP/MQXq5GOKxqxP0J
 K8YFOnkIZXZBItWwjYw+Li6GoBsR5yyMOggOOBa3Ick9gTbzVAsGG7w8+3CaMnZryQWr
 PnSgP8cfXhax6lyhulFiDfQV4rOYiAnKeXt/+7Y8BMyIfZeJBvxxivt8hIthzRutqZ5t
 FsEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=OS58rij80ElucW0PY66L5D8ExybPJH/1VgMC6duZHlU=;
 b=KytAVycEGyWtd1v9STdFiSi3pyGGSFwsge75yrxOjJvygdwlLAw50O6Og9feblXhlW
 j1YjqXEPJzKJDxWqzvJ37mORfwi2kCH740ZnfxXXAzv9WiaK8+haqCCM2CvWwqmsw7ip
 2oTrz/H9Kqdim5uzxdKC5efjIWc6w7lrMteDKTjP2YlViVwdHtx4sJfTCi2cJDNMEEzb
 4moswu2Kke8l6OfMyMVXvlqoJdnu42hjkwIrxVpKT9V/6j/Cpo5a05JWmq+Av6/7eb18
 FWrCiruzmSX+BUWhgxC5AO0D8wLhXoTZ8O2OE+ktorlOwaTYIPYWbyShi/tO84u7e8SZ
 0M6A==
X-Gm-Message-State: AOAM533KTya77erVk0hqdk9KA2xNIrDJx0rOq4MbGazibIKjii8SEv0V
 ri3LMZJzQRT0LMOvsxe5lDE=
X-Google-Smtp-Source: ABdhPJyEQMTdU+dbkSplr0x7yUpZrsCTQPP9k0UdRh8tLZ+tNWCO0MuXx7Hu1OoAykafDNxJuPcFXw==
X-Received: by 2002:a17:90a:b00a:: with SMTP id
 x10mr176749pjq.77.1625854203158; 
 Fri, 09 Jul 2021 11:10:03 -0700 (PDT)
Received: from tong-desktop.local ([2601:647:4200:13::844])
 by smtp.googlemail.com with ESMTPSA id b65sm7003737pfa.32.2021.07.09.11.10.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 09 Jul 2021 11:10:02 -0700 (PDT)
From: Tong Zhang <ztong0001@gmail.com>
To: VMware Graphics <linux-graphics-maintainer@vmware.com>,
 Roland Scheidegger <sroland@vmware.com>, Zack Rusin <zackr@vmware.com>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: [PATCH v1] fix vmwgfx compilation error due to a missing include
Date: Fri,  9 Jul 2021 11:09:43 -0700
Message-Id: <20210709180944.2533114-1-ztong0001@gmail.com>
X-Mailer: git-send-email 2.25.1
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
Cc: Tong Zhang <ztong0001@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This patch fixes vmwgfx driver compilation error due to a missing include

drivers/gpu/drm/vmwgfx/vmwgfx_drv.c: In function ‘vmw_vram_manager_init’:
drivers/gpu/drm/vmwgfx/vmwgfx_drv.c:678:8: error: implicit declaration of function ‘ttm_range_man_init’ [-Werror=implicit-function-declaration]
  678 |  ret = ttm_range_man_init(&dev_priv->bdev, TTM_PL_VRAM, false,
      |        ^~~~~~~~~~~~~~~~~~
drivers/gpu/drm/vmwgfx/vmwgfx_drv.c: In function ‘vmw_vram_manager_fini’:
drivers/gpu/drm/vmwgfx/vmwgfx_drv.c:690:2: error: implicit declaration of function ‘ttm_range_man_fini’ [-Werror=implicit-function-declaration]
  690 |  ttm_range_man_fini(&dev_priv->bdev, TTM_PL_VRAM);
      |  ^~~~~~~~~~~~~~~~~~
cc1: some warnings being treated as errors

Signed-off-by: Tong Zhang <ztong0001@gmail.com>
---
 drivers/gpu/drm/vmwgfx/vmwgfx_drv.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_drv.c b/drivers/gpu/drm/vmwgfx/vmwgfx_drv.c
index 6f5ea00973e0..6eb93aa2f311 100644
--- a/drivers/gpu/drm/vmwgfx/vmwgfx_drv.c
+++ b/drivers/gpu/drm/vmwgfx/vmwgfx_drv.c
@@ -37,6 +37,7 @@
 #include <drm/drm_sysfs.h>
 #include <drm/ttm/ttm_bo_driver.h>
 #include <drm/ttm/ttm_placement.h>
+#include <drm/ttm/ttm_range_manager.h>
 #include <generated/utsrelease.h>
 
 #include "ttm_object.h"
-- 
2.25.1

