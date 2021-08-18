Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C3C0F3F03DC
	for <lists+dri-devel@lfdr.de>; Wed, 18 Aug 2021 14:41:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 269426E598;
	Wed, 18 Aug 2021 12:41:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com
 [IPv6:2a00:1450:4864:20::331])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0F42E89113
 for <dri-devel@lists.freedesktop.org>; Wed, 18 Aug 2021 12:41:23 +0000 (UTC)
Received: by mail-wm1-x331.google.com with SMTP id u15so1553240wmj.1
 for <dri-devel@lists.freedesktop.org>; Wed, 18 Aug 2021 05:41:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=7PolFHl4BCa4E4HG380dOZoCiWwe/gYoL591bvSVGBo=;
 b=c1GxZdd+2+kkeJZ4syYgj51Zg98RTZjLY/Z4IwPBEdIzTt49XtuWKeCb1bcCrVU4oN
 Izk9NWmOwP7kkaXp/2Mn53YkQfR/7fHJVcp92ZTDesjLkyO/DRCwZPWJ/yByOLYJPR1+
 zm3svX0pIC64LD+lGZ/dry6ECz8aimrYj58KwAVIIrG/NcA68jPJnvyNefOs93CZBhJV
 XRtCybrx9SAedtP7wZC98ZPPZw/S3G7fWok4s3NPfPyIVxnVtcL1R8XkAMXU6YiC+k1r
 Cng2mo0cabsYhxGtZHOCTmTKdD8C4WsukMjHHdCZOaziFfCFM3uJVRmet9G6TQB/MB6H
 FsZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=7PolFHl4BCa4E4HG380dOZoCiWwe/gYoL591bvSVGBo=;
 b=N326c8IOe99xn1wj5zG8ilXlDGQDtbozSCOD9lns6Ca0yESh6uruhEE0gqlX40SoFc
 lOCTat0e4ACeA5FljjbYyOvSWzG9IxuV4sB5wrWgY3vQabM3RrAZ46uYLFPrd8CsEeaG
 mWSrGcyuwfPPW+FcVo6LGDZH9ZDU4OwsyMpIRZ/3nyP//A8d+Se0UH6CXZIn/M6zpkPB
 4I7rluDnB6hqGVLlQOM0CULrd/TLL0prWOzOYsD0/5BXp62adY2NuoUwmvyBRBIavFN/
 kGGlFcr7LDuWuxKwSZGEQiyfe1DXgDxP7kcvi6RDars9dypJzXZ2c/YqH4Wm3L2G0tF+
 ee1w==
X-Gm-Message-State: AOAM530lLW/B17KHG4ywo3Dxrj3HqYjmyfxiHNise5TIGrb7CvDQ6m2+
 Ui4XS03z+wrqudIAbquzPf8=
X-Google-Smtp-Source: ABdhPJyQ1VzwCaTRFpydCdrpCWhltvqmLieDWRpbd4w6l19jVmVkcZ/Q2gsXj0wLcwh21T24m+Fr8A==
X-Received: by 2002:a1c:1dc4:: with SMTP id d187mr8462745wmd.1.1629290481835; 
 Wed, 18 Aug 2021 05:41:21 -0700 (PDT)
Received: from localhost.localdomain (arl-84-90-178-246.netvisao.pt.
 [84.90.178.246])
 by smtp.gmail.com with ESMTPSA id a11sm5720454wrq.6.2021.08.18.05.41.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 18 Aug 2021 05:41:21 -0700 (PDT)
From: Lukas Bulwahn <lukas.bulwahn@gmail.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, dri-devel@lists.freedesktop.org
Cc: Sandy Huang <hjc@rock-chips.com>,
 =?UTF-8?q?Heiko=20St=C3=BCbner?= <heiko@sntech.de>,
 Emma Anholt <emma@anholt.net>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 Arnd Bergmann <arnd@arndb.de>, Tomi Valkeinen <tomi.valkeinen@ti.com>,
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org,
 kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org,
 Lukas Bulwahn <lukas.bulwahn@gmail.com>
Subject: [PATCH 2/5] drm: amdgpu: remove obsolete reference to config CHASH
Date: Wed, 18 Aug 2021 14:41:11 +0200
Message-Id: <20210818124114.28545-3-lukas.bulwahn@gmail.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210818124114.28545-1-lukas.bulwahn@gmail.com>
References: <20210818124114.28545-1-lukas.bulwahn@gmail.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Commit 04ed8459f334 ("drm/amdgpu: remove chash") removes the chash
architecture and its corresponding config CHASH.

There is still a reference to CHASH in the config DRM_AMDGPU in
./drivers/gpu/drm/Kconfig.

Remove this obsolete reference to config CHASH.

Signed-off-by: Lukas Bulwahn <lukas.bulwahn@gmail.com>
---
 drivers/gpu/drm/Kconfig | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/gpu/drm/Kconfig b/drivers/gpu/drm/Kconfig
index f3bc90baca61..8fc40317f2b7 100644
--- a/drivers/gpu/drm/Kconfig
+++ b/drivers/gpu/drm/Kconfig
@@ -257,7 +257,6 @@ config DRM_AMDGPU
 	select HWMON
 	select BACKLIGHT_CLASS_DEVICE
 	select INTERVAL_TREE
-	select CHASH
 	help
 	  Choose this option if you have a recent AMD Radeon graphics card.
 
-- 
2.26.2

