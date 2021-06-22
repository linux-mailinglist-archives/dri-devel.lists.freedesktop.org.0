Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 259C93B0AE8
	for <lists+dri-devel@lfdr.de>; Tue, 22 Jun 2021 18:56:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 34DAD6E845;
	Tue, 22 Jun 2021 16:55:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com
 [IPv6:2a00:1450:4864:20::42c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 039496E822
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Jun 2021 16:55:34 +0000 (UTC)
Received: by mail-wr1-x42c.google.com with SMTP id e22so20935183wrc.1
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Jun 2021 09:55:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=JOUPUItnfv9eoWzULPlnmpftFBykYS+GwxysUnbtbjs=;
 b=IJnlQtw84nLq6UKrv07Fzv4RjJvDi0CvbSS5tQ1jkICmk1HEXUQ8MQ7tbttJy9yVRh
 a0lAjJhjQ4+XSwKKn8Fy55oRyJgMmuDVysw5+ONhWPovdIs0HXXHSjpalD2cyWa5YuE4
 a6QH4AKTi9XMmIspJaolIQ0Wf0/HVTKVwLDTw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=JOUPUItnfv9eoWzULPlnmpftFBykYS+GwxysUnbtbjs=;
 b=jTtzEUV9AMPSAAJ8WG0VttL1nMVKsgkyb1/e6REdSgDlyysAnob7TQSYIq+o5r0F+q
 kC/8OeCajQm2ut/2HrO2vt2qOmFyVtQWe62/2xQrSE4567aP/bCe/Kpq8yK6B3J6MxBu
 3z0hWTtM+Qtutuew7PVxXVbErngWT6lbLQQKd95yd0eAIu1H2Zw6wdUObyINy4jMM0yo
 JcyGJRv7Xg5NASGHiuCQDPYihIAeUWqaG66ZH2hRgt1cZdXo2OSY+IHyu6kNgq8B/Zu+
 KgpOaGkfqz+h1CFt7bxml9clAG3dXW2pjNoVaXN7cbVfd+0JNlPhdcPvhBKGS0U9bzlq
 Zl/Q==
X-Gm-Message-State: AOAM531m3I9IBfKZ03lHB2UnXPqHx0iHQhokMkrA8MK+OSE7AwTKfIP+
 fkgh6PwYaQ0V+DiujTMg7HQDcx7LfSFkQg==
X-Google-Smtp-Source: ABdhPJwk0x8sLZPq1PhkUnLJYNpHGFgOjr9HyaHc/WHHogSQMSIySsd7VhCEb6ndiCelRmwpEV1VPQ==
X-Received: by 2002:a05:6000:258:: with SMTP id
 m24mr5900659wrz.127.1624380932762; 
 Tue, 22 Jun 2021 09:55:32 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id l23sm3632342wmc.5.2021.06.22.09.55.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 22 Jun 2021 09:55:32 -0700 (PDT)
From: Daniel Vetter <daniel.vetter@ffwll.ch>
To: DRI Development <dri-devel@lists.freedesktop.org>
Subject: [PATCH 14/15] drm/gem: Tiny kernel clarification for
 drm_gem_fence_array_add
Date: Tue, 22 Jun 2021 18:55:10 +0200
Message-Id: <20210622165511.3169559-15-daniel.vetter@ffwll.ch>
X-Mailer: git-send-email 2.32.0.rc2
In-Reply-To: <20210622165511.3169559-1-daniel.vetter@ffwll.ch>
References: <20210622165511.3169559-1-daniel.vetter@ffwll.ch>
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
Cc: David Airlie <airlied@linux.ie>, Daniel Vetter <daniel.vetter@ffwll.ch>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Daniel Vetter <daniel.vetter@intel.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Spotted while trying to convert panfrost to these.

Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
Cc: "Christian König" <christian.koenig@amd.com>
Cc: Lucas Stach <l.stach@pengutronix.de>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Cc: Maxime Ripard <mripard@kernel.org>
Cc: Thomas Zimmermann <tzimmermann@suse.de>
Cc: David Airlie <airlied@linux.ie>
Cc: Daniel Vetter <daniel@ffwll.ch>
---
 drivers/gpu/drm/drm_gem.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/gpu/drm/drm_gem.c b/drivers/gpu/drm/drm_gem.c
index ba2e64ed8b47..68deb1de8235 100644
--- a/drivers/gpu/drm/drm_gem.c
+++ b/drivers/gpu/drm/drm_gem.c
@@ -1302,6 +1302,9 @@ EXPORT_SYMBOL(drm_gem_unlock_reservations);
  * @fence_array: array of dma_fence * for the job to block on.
  * @fence: the dma_fence to add to the list of dependencies.
  *
+ * This functions consumes the reference for @fence both on success and error
+ * cases.
+ *
  * Returns:
  * 0 on success, or an error on failing to expand the array.
  */
-- 
2.32.0.rc2

