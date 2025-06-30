Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4437CAED813
	for <lists+dri-devel@lfdr.de>; Mon, 30 Jun 2025 11:01:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D349810E3D4;
	Mon, 30 Jun 2025 09:01:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="mRk9d5AU";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com
 [209.85.128.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E6A4910E3D2
 for <dri-devel@lists.freedesktop.org>; Mon, 30 Jun 2025 09:01:04 +0000 (UTC)
Received: by mail-wm1-f54.google.com with SMTP id
 5b1f17b1804b1-45348bff79fso18593615e9.2
 for <dri-devel@lists.freedesktop.org>; Mon, 30 Jun 2025 02:01:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1751274063; x=1751878863; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=8D5fEs3W/3OgFaAso4SEPNW3BjgOw64cDQiPdn3KhyI=;
 b=mRk9d5AUApkqKWm0C7mqqKU9eUvm+156CSyChcNA3DezcL6roBkVzKwIz/pzuGTaV2
 qpSh6lZ0VzR7LlVXjPF3ten4q0xzbPTmqv8zDQhj/LxIpHFb0OawuUb3jH6Fb0/tR8An
 8oxYtRr48hzho9jY1JP9v7p/v+UoKXeFs2g8I4eoPBQ72ykzsJ407K3DFpn+Rhsnhkx+
 UUMghxUKpwQvaUXRr6vp8nHoK0kll5fsVf8FuCfYI182CL8FDFn58RkGd9qwf8iEtzIs
 fkaHN/fivdNNhxnMm+BjDdhjiuZwjqVdHVYRk64OI4NY0dAbvtZoqLrtw4qPjmvsyJjX
 Bycw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1751274063; x=1751878863;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=8D5fEs3W/3OgFaAso4SEPNW3BjgOw64cDQiPdn3KhyI=;
 b=XMePVrhn6WkhpjquoBSzT97YNduUJmLh5ju0VmWO+OsJmo3wH/6Ob+TpEizQL6GDLi
 j9sAp6s7ne6eMt+VTY2CY5vzllruWJPCn4F74RTrXtbg3kb+aBFgYUQQXsOhgWyTjwYM
 hWP2r1exEJ/uq9iiXT/LtPMMiC0QvZlkNy/bMJQ7LEDLCR/1bwsURspzejLEVuuSZOKk
 PUstnqBuzM22x0uUKnns1aIdBZvBRMbl2AYQFpJCISe3Yh94uAJJkzvBuKXUyZeQOgv+
 RYnCAAMQboKPLYpv3wBsTj3Gazi2nKrZ1byY7uBX3NhbR1rwlZiQ+rT6LRr1P749I/NN
 rMzw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUH9e8Orjas8jez2ntvcU+xYhVsHZY/ApKqDRvJgKE5TQ38lYIb8rNJcLwJ5Rtn37gsR/voGFKSlQk=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxspYXh69yfdGcL6KlWMqzuVUMZGPq4DnkwDCMWYd+U8jFn6JV9
 U5WclyfeV0fS+csjYv8dCdKn0va7pZR2H4SvtPlO8IhQTiTyibUBDFwQ
X-Gm-Gg: ASbGnctzsL8shYTmsVgkdD4u81OqeU1T4BuS9p+FU2J64evIOoSfx0lMZJZgi8Cle69
 Ozmss2obk+CtK0urHX7TEnQqwUEztMR0tTdJaY0HCDHB6RUcgVfVvqNB9eTB+z2zjzysXxsKiHv
 vX880qFo7t81vz11ZkPgVqS3D1+w2obC8Yto4cxzSMyGKKfUZ/YYMR6Gr13O108pitSaddgzoIk
 uiEpZCS4FYpu+PlVJHywdwJRzHlqksmgyzF5XjU4Hly3RykTqYvB6d/+oAseEXTaifgYJWxOm1N
 kEEswHNEmzEXiaxjudvDbGaLkUf5iaMDqi8A3dmlv04aqVd0u45Wtc3ZdQM=
X-Google-Smtp-Source: AGHT+IHzmHSs+NRUkRNMpZU3xwBsMXuAdiecH+Fh3OOHUPJW3ttnLedY0OMvYKUuBgt2yaOFrdVgng==
X-Received: by 2002:a05:600c:4fd6:b0:43c:f63c:babb with SMTP id
 5b1f17b1804b1-4538ee4f9c5mr110923885e9.1.1751274062747; 
 Mon, 30 Jun 2025 02:01:02 -0700 (PDT)
Received: from fedora ([94.73.34.56]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3a88c80b516sm9588408f8f.41.2025.06.30.02.01.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 30 Jun 2025 02:01:02 -0700 (PDT)
From: =?UTF-8?q?Jos=C3=A9=20Exp=C3=B3sito?= <jose.exposito89@gmail.com>
To: maarten.lankhorst@linux.intel.com
Cc: mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com,
 simona@ffwll.ch, lumag@kernel.org, cristian.ciocaltea@collabora.com,
 gcarlos@disroot.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org,
 =?UTF-8?q?Jos=C3=A9=20Exp=C3=B3sito?= <jose.exposito89@gmail.com>
Subject: [PATCH 1/2] drm/tests: Fix endian warning
Date: Mon, 30 Jun 2025 11:00:53 +0200
Message-ID: <20250630090054.353246-1-jose.exposito89@gmail.com>
X-Mailer: git-send-email 2.50.0
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

When compiling with sparse enabled, this warning is thrown:

  warning: incorrect type in argument 2 (different base types)
     expected restricted __le32 const [usertype] *buf
     got unsigned int [usertype] *[assigned] buf

Add a cast to fix it.

Fixes: 453114319699 ("drm/format-helper: Add KUnit tests for drm_fb_xrgb8888_to_xrgb2101010()")
Signed-off-by: José Expósito <jose.exposito89@gmail.com>
---
 drivers/gpu/drm/tests/drm_format_helper_test.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/tests/drm_format_helper_test.c b/drivers/gpu/drm/tests/drm_format_helper_test.c
index 7299fa8971ce..86829e1cb7f0 100644
--- a/drivers/gpu/drm/tests/drm_format_helper_test.c
+++ b/drivers/gpu/drm/tests/drm_format_helper_test.c
@@ -1033,7 +1033,7 @@ static void drm_test_fb_xrgb8888_to_xrgb2101010(struct kunit *test)
 		NULL : &result->dst_pitch;
 
 	drm_fb_xrgb8888_to_xrgb2101010(&dst, dst_pitch, &src, &fb, &params->clip, &fmtcnv_state);
-	buf = le32buf_to_cpu(test, buf, dst_size / sizeof(u32));
+	buf = le32buf_to_cpu(test, (__force const __le32 *)buf, dst_size / sizeof(u32));
 	KUNIT_EXPECT_MEMEQ(test, buf, result->expected, dst_size);
 
 	buf = dst.vaddr; /* restore original value of buf */
-- 
2.50.0

