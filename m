Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 30A1C43CEBD
	for <lists+dri-devel@lfdr.de>; Wed, 27 Oct 2021 18:28:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A417A6E7D0;
	Wed, 27 Oct 2021 16:28:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-x72a.google.com (mail-qk1-x72a.google.com
 [IPv6:2607:f8b0:4864:20::72a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A37096E7D0
 for <dri-devel@lists.freedesktop.org>; Wed, 27 Oct 2021 16:28:14 +0000 (UTC)
Received: by mail-qk1-x72a.google.com with SMTP id bl14so2992491qkb.4
 for <dri-devel@lists.freedesktop.org>; Wed, 27 Oct 2021 09:28:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Kcaw11fIjDklEqqCtjykwfsrJvW1LW9AxQoWbgSjC4M=;
 b=Ua/sCb/y9VDGpUgeNnsC/TY1iozBS8HSs8sB4TzNnEPa+6427LOWQi6WL9uSP+9r0f
 KGOwJodnrSB2fiQhxLQFuuW8O4HKPNi3pVV1x8cV2XHk8wFzt0Z2GsjSi96dOsDPs1pd
 jAq2oO9A9mstmfyKZ9gWU7sZY5Lj5IMLSkyfA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Kcaw11fIjDklEqqCtjykwfsrJvW1LW9AxQoWbgSjC4M=;
 b=HbdHMQRC7lplEq3tPzWeex/xNxAhZyc9C1QgXyuE0lPbakOxF61atxCK7BIxXCFx59
 hHvAfaCX9tUN3fcTrVnn2nS0DhXyDUznVGHHFQMozqSblkRDdjExyalHdKM6SwvnmHWE
 pm0B9hzY863XerOKvxo2KCS18uLNRY+gSj1EpJho+ZFv2dZX+t3pyRBBZIWFSwM3Wl+8
 FVbb1Wnse6/Zsz4V/DK2Yib1FXQ7UhNOnac6gZMRp0vJYL0AkFsX69FYoVISSjyHkQU2
 ZL0ObOSKi9hLSW/QJxKto3Arfk+WncklBkz2Ia7kklGXgtN+EAr5lQf46ucJb/DeJYzc
 wREA==
X-Gm-Message-State: AOAM531EcxMfafhgMCmMEy6MAMxJlRBL+Rgn+/y6UBsG6WLKK2N8UqSn
 ZKSwVVIbTmzuHIE6kgK4DHs5yA==
X-Google-Smtp-Source: ABdhPJzvDL/hbW8x3WlZ9XGRkGRqMyNVExMy38ru/QmkZqYlZSlc0XaIiKT5o4RWmWJvhzMO0AsrYA==
X-Received: by 2002:a05:620a:1035:: with SMTP id
 a21mr8908441qkk.354.1635352093630; 
 Wed, 27 Oct 2021 09:28:13 -0700 (PDT)
Received: from markyacoub.nyc.corp.google.com
 ([2620:0:1003:314:121e:94ae:f1a6:940c])
 by smtp.gmail.com with ESMTPSA id i22sm311589qkn.80.2021.10.27.09.28.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 27 Oct 2021 09:28:13 -0700 (PDT)
From: Mark Yacoub <markyacoub@chromium.org>
To: 
Cc: seanpaul@chromium.org, Mark Yacoub <markyacoub@google.com>,
 Mark Yacoub <markyacoub@chromium.org>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, Matthias Brugger <matthias.bgg@gmail.com>,
 dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [PATCH] drm/mediatek: Set the default value of rotation to
 DRM_MODE_ROTATE_0
Date: Wed, 27 Oct 2021 12:27:51 -0400
Message-Id: <20211027162806.2014022-1-markyacoub@chromium.org>
X-Mailer: git-send-email 2.33.0.1079.g6e70778dc9-goog
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

From: Mark Yacoub <markyacoub@google.com>

At the reset hook, call __drm_atomic_helper_plane_reset which is
called at the initialization of the plane and sets the default value of
rotation on all planes to DRM_MODE_ROTATE_0 which is equal to 1.

Tested on Jacuzzi (MTK).
Resolves IGT@kms_properties@plane-properties-{legacy,atomic}

Signed-off-by: Mark Yacoub <markyacoub@chromium.org>
---
 drivers/gpu/drm/mediatek/mtk_drm_plane.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/mediatek/mtk_drm_plane.c b/drivers/gpu/drm/mediatek/mtk_drm_plane.c
index e6dcb34d30522..accd26481b9fb 100644
--- a/drivers/gpu/drm/mediatek/mtk_drm_plane.c
+++ b/drivers/gpu/drm/mediatek/mtk_drm_plane.c
@@ -44,9 +44,10 @@ static void mtk_plane_reset(struct drm_plane *plane)
 		state = kzalloc(sizeof(*state), GFP_KERNEL);
 		if (!state)
 			return;
-		plane->state = &state->base;
 	}
 
+	__drm_atomic_helper_plane_reset(plane, &state->base);
+
 	state->base.plane = plane;
 	state->pending.format = DRM_FORMAT_RGB565;
 }
-- 
2.33.0.1079.g6e70778dc9-goog

