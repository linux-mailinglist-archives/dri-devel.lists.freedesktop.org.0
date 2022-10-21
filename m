Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C4C94607296
	for <lists+dri-devel@lfdr.de>; Fri, 21 Oct 2022 10:40:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7949810E644;
	Fri, 21 Oct 2022 08:40:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com
 [IPv6:2a00:1450:4864:20::334])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3809310E644
 for <dri-devel@lists.freedesktop.org>; Fri, 21 Oct 2022 08:40:39 +0000 (UTC)
Received: by mail-wm1-x334.google.com with SMTP id t4so1697442wmj.5
 for <dri-devel@lists.freedesktop.org>; Fri, 21 Oct 2022 01:40:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=IuIo8QgEpxZytSZiMkYCyIw8CLrNCmcth/q5uc8EsFM=;
 b=UHxwHPQZYfeM6TtcZA0hz6s5eZl47HFNwIHZl2Q+0k/BynwTC1k0cxMLFTP99F/dt+
 S274d4Fska8oBvu0BR9cJBvtSr6/lx1nkjh+rDY+BVd6+psgDOARiFwa97qp86+IYf3O
 zkQF4rh7RUb7UsNGZmJUlwPZ78nQgWEaOtW5vuwVlcDVDX7A8z95CD9U7UQEqjggeOU0
 wdf9Ps8UqZlCzybEHiDHZkqIj6tYVh+uwjW7TiYz5hE4CkxcXFS8ewOuJb9/7Cd3fb0Y
 z2/f8+kXKBqxV7gX3V3DYfVj8BvIHixiaf1H0Vdp1Wxe2Wlc2vZmcAcZis01yOK0wFMM
 ay9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=IuIo8QgEpxZytSZiMkYCyIw8CLrNCmcth/q5uc8EsFM=;
 b=fjpOeaD+x3eeUGL0l8IssKM57UgUuxee/z5a0lvXT5A8MX93kQU6pupcRm2vvo6lBJ
 krm0pWMlTQSK1ZUvOR2O5PorPbLEvdmWdpMFGif0OVKU7isfzXwcoLNUCg6xIacDekuV
 Y5lt5dH0uWJozYKo5KZYH89mavsQFl5hlZwfOslGWxv6ybtETU2K9lXt3fDkxhi4ECkw
 AEg8+LhZTom/ptSmh5FO64XEVaNCZJq2yYnoF06LRtIgy9jDLprf3WRslMj3MUHfLeCm
 EVwKV4w9UnACgUbdf3cXhlG/qGamd/m4m97OsBeIPqo73r0J9zyhpHikP8xGwpXVkYpb
 sZVA==
X-Gm-Message-State: ACrzQf2lQrx5HTJwPVk9QGBDjotMWgEBt3xVrBKKb4t5SAVuf/pCSO0G
 ZTIMLlsfg9Ag70j9wZPIJR8zwCzKBUY+oebQ
X-Google-Smtp-Source: AMsMyM77h+/1qaABrXb0HXJ77rL95cQYqKYRk18PhHLY1AAMY6D0/AHxac0gzRA3fbvGbpseDDt34g==
X-Received: by 2002:a05:600c:3b11:b0:3c6:c02d:babb with SMTP id
 m17-20020a05600c3b1100b003c6c02dbabbmr32495826wms.69.1666341637633; 
 Fri, 21 Oct 2022 01:40:37 -0700 (PDT)
Received: from localhost (cpc154979-craw9-2-0-cust193.16-3.cable.virginm.net.
 [80.193.200.194]) by smtp.gmail.com with ESMTPSA id
 ay18-20020a5d6f12000000b0022e62529888sm5166607wrb.67.2022.10.21.01.40.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 21 Oct 2022 01:40:36 -0700 (PDT)
From: Colin Ian King <colin.i.king@gmail.com>
To: Emma Anholt <emma@anholt.net>, Maxime Ripard <mripard@kernel.org>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 dri-devel@lists.freedesktop.org
Subject: [PATCH] drm/vc4: Fix spelling mistake "mmaping" -> "mmapping"
Date: Fri, 21 Oct 2022 09:40:35 +0100
Message-Id: <20221021084035.65367-1-colin.i.king@gmail.com>
X-Mailer: git-send-email 2.37.3
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
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
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

There are a couple of spelling mistakes in DRM_DEBUG messages. Fix them.

Signed-off-by: Colin Ian King <colin.i.king@gmail.com>
---
 drivers/gpu/drm/vc4/vc4_bo.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/vc4/vc4_bo.c b/drivers/gpu/drm/vc4/vc4_bo.c
index 231add8b8e12..43d9b3a6a352 100644
--- a/drivers/gpu/drm/vc4/vc4_bo.c
+++ b/drivers/gpu/drm/vc4/vc4_bo.c
@@ -736,12 +736,12 @@ static int vc4_gem_object_mmap(struct drm_gem_object *obj, struct vm_area_struct
 	struct vc4_bo *bo = to_vc4_bo(obj);
 
 	if (bo->validated_shader && (vma->vm_flags & VM_WRITE)) {
-		DRM_DEBUG("mmaping of shader BOs for writing not allowed.\n");
+		DRM_DEBUG("mmapping of shader BOs for writing not allowed.\n");
 		return -EINVAL;
 	}
 
 	if (bo->madv != VC4_MADV_WILLNEED) {
-		DRM_DEBUG("mmaping of %s BO not allowed\n",
+		DRM_DEBUG("mmapping of %s BO not allowed\n",
 			  bo->madv == VC4_MADV_DONTNEED ?
 			  "purgeable" : "purged");
 		return -EINVAL;
-- 
2.37.3

