Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 28C46794372
	for <lists+dri-devel@lfdr.de>; Wed,  6 Sep 2023 21:02:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 63E2110E70D;
	Wed,  6 Sep 2023 19:02:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-xd2b.google.com (mail-io1-xd2b.google.com
 [IPv6:2607:f8b0:4864:20::d2b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ADDB810E064;
 Wed,  6 Sep 2023 19:02:31 +0000 (UTC)
Received: by mail-io1-xd2b.google.com with SMTP id
 ca18e2360f4ac-7927611c54bso4351039f.2; 
 Wed, 06 Sep 2023 12:02:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1694026951; x=1694631751; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=WS96irfNC14gdmDiFClarh9DIKJfgD77OErS65jXzQY=;
 b=olM0Eazh76MoJPGntnFvf531vRaxVkT7JjC2HtkTpFOZKxs03YTliC8lQWYwX6BU6O
 vK3FoCPiKi6px/EPlZwLXXivEvdeVZjl1sNVwOpbadY+CB6T/ahEvrc88/9111D91nQ6
 ULUvZr1OuWFR5QMWtN9xw89PKzK/Fqv0caXayNOgaGW74/10TJKA5jAzkJ7Oy2mpBhJf
 EaJ0jKs6YhO+zWs+FslkbYQUKHAkZ3pEfyIDbbb0y3aFNjoPrdxpoOLe/IHrFkp5RJJp
 1Ljg5/FBE0tjt2fm/f7xxBUPalhbi1Sfosn+hdTidyq4Xi0HLBMn91Dgc22puy/QrsKH
 cl1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1694026951; x=1694631751;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=WS96irfNC14gdmDiFClarh9DIKJfgD77OErS65jXzQY=;
 b=DzvjEq92SW8JpPrwudy6RpFc8fWGRJzsjTHTPFC9bEqAhkTB4+DNS3nntf616dp85g
 3vpgX39DnmosAAZhjKitjY2DwMZlaHHTpY9IPr/A7H29Dz52K6moIS5a6Qhh+B8wlNoK
 IMHpEvs5N4/2+0Jp46PR8dZFII+oyUh/Kz9mN1mBVn3re8++b3AZ9lEe5uhLe5g+G1US
 oJlVaABaZvwCz7SLBo5a8+W1t+JgHcHm+QhFvMlSezOLD9Nuc4K8KEFGteCf59AVDosx
 Mi6Lqgo0XDX/NRPuTS/xJ4ByBwqcgkpAybtbm4mkcRAICVahm/h3G+NLuRo+tgkZ5ou1
 1Tww==
X-Gm-Message-State: AOJu0YwzbhVU7mDYFgMiHucnZ70DtcDbxFqG7cXV03VB2eJ2zH9atdji
 Thw3CYVtbs22Cxqsz2mbZao=
X-Google-Smtp-Source: AGHT+IEm+/duIejOs4uEx0V1ECGyB/EMXsZAKUYZsERs5kQRkhUOS9SyRyr5dfsXrmwu8JiEQjVuXQ==
X-Received: by 2002:a6b:5c0c:0:b0:787:230f:55b1 with SMTP id
 z12-20020a6b5c0c000000b00787230f55b1mr18474144ioh.2.1694026950925; 
 Wed, 06 Sep 2023 12:02:30 -0700 (PDT)
Received: from frodo.. (c-73-78-62-130.hsd1.co.comcast.net. [73.78.62.130])
 by smtp.googlemail.com with ESMTPSA id
 w11-20020a5d844b000000b0076ffebfc9fasm5152306ior.47.2023.09.06.12.02.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 06 Sep 2023 12:02:30 -0700 (PDT)
From: Jim Cromie <jim.cromie@gmail.com>
To: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, intel-gvt-dev@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org
Subject: [PATCH v3 1/5] drm/connector: add trailing newlines to drm_dbg msgs
Date: Wed,  6 Sep 2023 13:02:19 -0600
Message-ID: <20230906190224.583577-2-jim.cromie@gmail.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230906190224.583577-1-jim.cromie@gmail.com>
References: <20230906190224.583577-1-jim.cromie@gmail.com>
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
Cc: Thomas Zimmermann <tzimmermann@suse.de>, jani.nikula@intel.com,
 daniel.vetter@ffwll.ch, Maxime Ripard <mripard@kernel.org>,
 seanpaul@chromium.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

By at least strong convention, a print-buffer's trailing newline says
"message complete, send it".  The exception (no TNL, followed by a call
to pr_cont) proves the general rule.

Most DRM.debug calls already comport with this: 207 DRM_DEV_DEBUG,
1288 drm_dbg.  Clean up the remainders, in maintainer sized chunks.

No functional changes.

Signed-off-by: Jim Cromie <jim.cromie@gmail.com>
---
 drivers/gpu/drm/drm_connector.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/drm_connector.c b/drivers/gpu/drm/drm_connector.c
index f28725736237..14020585bdc0 100644
--- a/drivers/gpu/drm/drm_connector.c
+++ b/drivers/gpu/drm/drm_connector.c
@@ -2925,7 +2925,9 @@ int drm_mode_getconnector(struct drm_device *dev, void *data,
 						     dev->mode_config.max_width,
 						     dev->mode_config.max_height);
 		else
-			drm_dbg_kms(dev, "User-space requested a forced probe on [CONNECTOR:%d:%s] but is not the DRM master, demoting to read-only probe",
+			drm_dbg_kms(dev,
+				    "User-space requested a forced probe on [CONNECTOR:%d:%s] "
+				    "but is not the DRM master, demoting to read-only probe\n",
 				    connector->base.id, connector->name);
 	}
 
-- 
2.41.0

