Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5938167EBA7
	for <lists+dri-devel@lfdr.de>; Fri, 27 Jan 2023 17:54:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9369010E9AD;
	Fri, 27 Jan 2023 16:54:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x62c.google.com (mail-pl1-x62c.google.com
 [IPv6:2607:f8b0:4864:20::62c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 84D3610E9AD
 for <dri-devel@lists.freedesktop.org>; Fri, 27 Jan 2023 16:54:05 +0000 (UTC)
Received: by mail-pl1-x62c.google.com with SMTP id 5so5613213plo.3
 for <dri-devel@lists.freedesktop.org>; Fri, 27 Jan 2023 08:54:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=tJHn8+pSpwglQ2ylL3huswEVRt2vpqL4jH6sVFjg9vY=;
 b=kk0OOlr625FNfEaHBDqd0XDNDVjNqpiWEqLLgn/fC4Qrqb/VCsyTTtUlWSa9r/z5N0
 jUo+S93D/xHrJiiUw5OlfRmg2Qb7eYqSrvqF+6vwqjzOjLXFxlR0y26v5ruRu8D9qPOu
 AX97MQTJX3KX6JSnXTdwDgUxmp0ZPLguoQhSfCCouy1ha2VZdluDW4CoH7BK6EBpSus9
 t9cmqkChU3WN8hsU2hwy2v4rJ2JQaKPeY8TuARXnsE+qEu3TVKRh6WvpwhN+4eMaTrrD
 lZ6CyRcSEedX/rbGSxU02JgoCn20QKcs4fqzC5ZSSYeVL9CLzuQyPTD7dEtLUDPNkYu6
 HZcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=tJHn8+pSpwglQ2ylL3huswEVRt2vpqL4jH6sVFjg9vY=;
 b=FXnTHWaVhY+9kpMdaN232L/naJkuMt2i/2e43Tt/bWt2GbRkGyDxBJ0C2GTwolyVnu
 0tQPzWpw2ps4UqYOZJAMAVPTOGk9LbW92O1jmGFeUP1SxcjAYiZGQklSUHAoeskZL7O8
 TaVDcXQz7Q90CmBAOPj1/+l0cZyE1hDNtel9ALKHEmiUggp1oJFe6XKorXWm7/XKwh7C
 xBVqVr9bDBiX4rf667ci50SKHriornK+9KQipC0L29TYVaOx9DLykCWHdcJv/Fw89eew
 UBsuzgfNmevQTEK0+omhTB/tvbHC2E/A81IuiWbDspiYalGye7hX5Aua8k1LX0hDNxgr
 8FRg==
X-Gm-Message-State: AFqh2krhLQqrXGMQk37RTuFJzc/0T4OQhJ+T5pc+aELzpzoVs+x5FeVF
 edXCAgEmhd/Pq0c290nrGUnqI+/jLlg=
X-Google-Smtp-Source: AMrXdXvbJYAaCNdJ8tWPyVy0sutAAlq8id5Jor0UBuLb4ou1Ou/KYQMgNdG31Nv8a6j0csqDu9fGGQ==
X-Received: by 2002:a17:903:2349:b0:195:e373:4c60 with SMTP id
 c9-20020a170903234900b00195e3734c60mr35905710plh.40.1674838444754; 
 Fri, 27 Jan 2023 08:54:04 -0800 (PST)
Received: from localhost ([2a00:79e1:abd:4a00:2703:3c72:eb1a:cffd])
 by smtp.gmail.com with ESMTPSA id
 q16-20020a170902edd000b00196503dba7bsm1904267plk.293.2023.01.27.08.54.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 27 Jan 2023 08:54:04 -0800 (PST)
From: Rob Clark <robdclark@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH] drm/mediatek: Remove unused GEM DMA header include
Date: Fri, 27 Jan 2023 08:54:09 -0800
Message-Id: <20230127165409.3512501-1-robdclark@gmail.com>
X-Mailer: git-send-email 2.38.1
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
Cc: Rob Clark <robdclark@chromium.org>, Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Doug Anderson <dianders@chromium.org>,
 open list <linux-kernel@vger.kernel.org>,
 "moderated list:DRM DRIVERS FOR MEDIATEK" <linux-mediatek@lists.infradead.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 "moderated list:ARM/Mediatek SoC support"
 <linux-arm-kernel@lists.infradead.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Rob Clark <robdclark@chromium.org>

No longer needed since the removal of dependency on DMA helper.

Fixes: 2ea8aec56bf1 ("drm/mediatek: Remove dependency on GEM DMA helper")
Signed-off-by: Rob Clark <robdclark@chromium.org>
---
 drivers/gpu/drm/mediatek/mtk_drm_drv.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/mediatek/mtk_drm_drv.c b/drivers/gpu/drm/mediatek/mtk_drm_drv.c
index cd5b18ef7951..7e2fad8e8444 100644
--- a/drivers/gpu/drm/mediatek/mtk_drm_drv.c
+++ b/drivers/gpu/drm/mediatek/mtk_drm_drv.c
@@ -20,8 +20,8 @@
 #include <drm/drm_fbdev_generic.h>
 #include <drm/drm_fourcc.h>
 #include <drm/drm_gem.h>
-#include <drm/drm_gem_dma_helper.h>
 #include <drm/drm_gem_framebuffer_helper.h>
+#include <drm/drm_ioctl.h>
 #include <drm/drm_of.h>
 #include <drm/drm_probe_helper.h>
 #include <drm/drm_vblank.h>
-- 
2.38.1

