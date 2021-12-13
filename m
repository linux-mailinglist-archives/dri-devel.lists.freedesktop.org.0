Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D171473142
	for <lists+dri-devel@lfdr.de>; Mon, 13 Dec 2021 17:08:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 69E1710E343;
	Mon, 13 Dec 2021 16:08:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-x72c.google.com (mail-qk1-x72c.google.com
 [IPv6:2607:f8b0:4864:20::72c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 49C6010E343
 for <dri-devel@lists.freedesktop.org>; Mon, 13 Dec 2021 16:07:59 +0000 (UTC)
Received: by mail-qk1-x72c.google.com with SMTP id p4so14300778qkm.7
 for <dri-devel@lists.freedesktop.org>; Mon, 13 Dec 2021 08:07:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=5VPAU6dvYOzvsB1kyIfMQv3U9XrNMQlDiY7WbCBmBes=;
 b=aqwHs4+TE4DLSYVktWLA8eauGvZ1M5mb9cmFWB9dGS9HT8aI1sizuWcY2hhiH7yN1Z
 XBwpxbiE3gKBaxK02sOgWhToQa1yxkGCGb/WDUCYGP+Ps0LA4n9syrEqUWRfEUJxFyIM
 e17dClHwtHeJwNhWM6uak6lwCn+LwuB3upWF0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=5VPAU6dvYOzvsB1kyIfMQv3U9XrNMQlDiY7WbCBmBes=;
 b=7/VRsVon5EnQyczlD5Syw4yQ9Dq+1hXvDgD0r95k1iogNd6zJVb7wP/p80RS8CMEI/
 sP8KOP1fXrcb2bWY8351OLxz607a/C9J1yuNwKngdH7Kng4lGaVVljEUGmoURGds9TH7
 QFeEUSZor35o9kH+qO6cXV0FYp76m9S08u523quxxjeysSIEVoNzxqqgkd0pJ8c32OMD
 7scEUqx5VbCiuTydjp8f3fJp3me8Vad8b4vXFFWCh9m3NkXu8A7249JKVLFusz86JwbA
 S8STqn6SdlA21Q9QDeS+0foUl9JGYnoprScrcmlIzE9WzJQzciOa27Pt0mP9LU24rhXM
 lkCw==
X-Gm-Message-State: AOAM532b9h4mTvFYJf12vLjzUHDYelT2Kh0POeX04kLZRIIuvueZ+mT5
 8eVBfctmj4+8UO/VC3JoynF/PQ==
X-Google-Smtp-Source: ABdhPJwVk+NpCyiYqBuxb8qXr1TTL8u2eezR/uX5Vhpcpw+L1CidoZGT5Lo5wmw1ZpnAXNALFjKJ1Q==
X-Received: by 2002:a37:a411:: with SMTP id n17mr33513759qke.722.1639411678428; 
 Mon, 13 Dec 2021 08:07:58 -0800 (PST)
Received: from markyacoub.nyc.corp.google.com
 ([2620:0:1003:314:435a:1eff:4bc4:107d])
 by smtp.gmail.com with ESMTPSA id d23sm6054390qkl.70.2021.12.13.08.07.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 13 Dec 2021 08:07:57 -0800 (PST)
From: Mark Yacoub <markyacoub@chromium.org>
To: linux-mediatek@lists.infradead.org
Subject: [PATCH v2] drm/mediatek: Set the default value of rotation to
 DRM_MODE_ROTATE_0
Date: Mon, 13 Dec 2021 11:07:22 -0500
Message-Id: <20211213160742.744333-1-markyacoub@chromium.org>
X-Mailer: git-send-email 2.34.1.173.g76aa8bc2d0-goog
In-Reply-To: <20211027162806.2014022-1-markyacoub@chromium.org>
References: <20211027162806.2014022-1-markyacoub@chromium.org>
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
Cc: chunkuang.hu@kernel.org, David Airlie <airlied@linux.ie>,
 jason-jh.lin@mediatek.com, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, tzungbi@google.com, seanpaul@chromium.org,
 Mark Yacoub <markyacoub@chromium.org>, matthias.bgg@gmail.com,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

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
2.34.1.173.g76aa8bc2d0-goog

