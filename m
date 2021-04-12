Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2573035C467
	for <lists+dri-devel@lfdr.de>; Mon, 12 Apr 2021 12:53:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4F1E189F92;
	Mon, 12 Apr 2021 10:53:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x62c.google.com (mail-ej1-x62c.google.com
 [IPv6:2a00:1450:4864:20::62c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8003489F92
 for <dri-devel@lists.freedesktop.org>; Mon, 12 Apr 2021 10:53:16 +0000 (UTC)
Received: by mail-ej1-x62c.google.com with SMTP id v6so18229591ejo.6
 for <dri-devel@lists.freedesktop.org>; Mon, 12 Apr 2021 03:53:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=49JeyaReyjd8GfvCyaVKkL8+AueTjgTUZSBAlKbchY0=;
 b=GIPyjTEX5TptfP7Krf/8sXk+lMMak+/9pG+SPE/m8FYh+j7Zzi6Etxe19Q90QiXpYQ
 VOGnyA9GIEqWqmTtElzW9sdXv4tsZ7NaZMczEHBaIbYMzoRerf6EZoAuXivYVouhHSKH
 HClRsAoMdgC60J+YSoQLNoEbSXmAX7LTkyOfxI2xEwrmSyKRdgubL5HJ6+ilPpHdqbrj
 lRtoaxUjVboxRKyMQcIypC2ixG8b9pMgi5f/CKFjcSA6mvGjRYMmqJsbViV9StGnwk4v
 0yvMhp41ZCtHirotYJtPLQnN62Fu8RYETUThY4sp31TN6/sn/dcTunxtZlTtzlpebfYB
 JQ7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=49JeyaReyjd8GfvCyaVKkL8+AueTjgTUZSBAlKbchY0=;
 b=HoZvt6lHeNDrAD3v2GZlJiJ/rVCvrLZsITPyc8F4oG17Kq5ASlBhpN8TRo/CxeGSd4
 5aFOqe0cdaLtwVWlule/PXeZMdMfJYufDDdYS0bfC1wzVb2OTlxXDbOQATVhyfjbNt3q
 aY2XgCo4bXGUw0fJ5tTAfAwYwDjoqB7PuyrUaBk1d7grBwaP0jCZIRp7+JsX2GEvTZvC
 kachvkb/xqoOl6s32dzCLiFiehQ9kJ47jtbRZ+ThPKdkeUJkYRxSIqFzomvv/rWZMM5x
 OD76wxluqrMkusDgXF3pNTyvwhA6zwzIa1W+/t3JOm7uumhwNOQQZS4zBLy1gmmyMVb5
 6RyQ==
X-Gm-Message-State: AOAM532tx6PMCUfoSmmGHizhOEo6mpq8HJ3V6jwaGzZVu8MBhyYMD01u
 w9E8Z/0K0/1+Ji06iQ+lhneqeQk5Isu/M/Zs
X-Google-Smtp-Source: ABdhPJz//Ch5ifBjxn/iXOE7w+hPvuCzhxknckfEmD3e8RUgtlhye8HHgnB1W7T2ZzdyYw2+A9LVxg==
X-Received: by 2002:a17:906:94d2:: with SMTP id
 d18mr19180579ejy.531.1618224794946; 
 Mon, 12 Apr 2021 03:53:14 -0700 (PDT)
Received: from linux.local (host-95-237-55-30.retail.telecomitalia.it.
 [95.237.55.30])
 by smtp.gmail.com with ESMTPSA id gb22sm5416452ejc.78.2021.04.12.03.53.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 12 Apr 2021 03:53:14 -0700 (PDT)
From: "Fabio M. De Francesco" <fmdefrancesco@gmail.com>
To: dri-devel@lists.freedesktop.org, outreachy-kernel@googlegroups.com,
 Daniel Vetter <daniel.vetter@ffwll.ch>,
 Melissa Wen <melissa.srw@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@linux.ie>
Subject: [PATCH] gpu: drm: Replace bare "unsigned" with "unsigned int"
Date: Mon, 12 Apr 2021 12:53:09 +0200
Message-Id: <20210412105309.27156-1-fmdefrancesco@gmail.com>
X-Mailer: git-send-email 2.31.1
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
Cc: "Fabio M. De Francesco" <fmdefrancesco@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Replaced the type "unsigned" with "unsigned int" because it is
preferred. Issue detected by checkpatch.pl.

Signed-off-by: Fabio M. De Francesco <fmdefrancesco@gmail.com>
---
 drivers/gpu/drm/drm_atomic.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/drm_atomic.c b/drivers/gpu/drm/drm_atomic.c
index 5b4547e0f775..46dceb51c90f 100644
--- a/drivers/gpu/drm/drm_atomic.c
+++ b/drivers/gpu/drm/drm_atomic.c
@@ -1302,8 +1302,8 @@ int drm_atomic_check_only(struct drm_atomic_state *state)
 	struct drm_crtc_state *new_crtc_state;
 	struct drm_connector *conn;
 	struct drm_connector_state *conn_state;
-	unsigned requested_crtc = 0;
-	unsigned affected_crtc = 0;
+	unsigned int requested_crtc = 0;
+	unsigned int affected_crtc = 0;
 	int i, ret = 0;
 
 	DRM_DEBUG_ATOMIC("checking %p\n", state);
-- 
2.31.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
