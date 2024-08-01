Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 49CE8944A0E
	for <lists+dri-devel@lfdr.de>; Thu,  1 Aug 2024 13:08:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5F66110E90E;
	Thu,  1 Aug 2024 11:08:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="QxpMNuyz";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-f52.google.com (mail-ot1-f52.google.com
 [209.85.210.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 397BE10E8EE
 for <dri-devel@lists.freedesktop.org>; Thu,  1 Aug 2024 10:23:44 +0000 (UTC)
Received: by mail-ot1-f52.google.com with SMTP id
 46e09a7af769-70949118d26so4113967a34.0
 for <dri-devel@lists.freedesktop.org>; Thu, 01 Aug 2024 03:23:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1722507823; x=1723112623; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=7Xy+YnBW0pTnJouWOqXyQ4NXMUNDJSPyAsk2GdSuKUs=;
 b=QxpMNuyzLaQQKAQR2naQyts9snnGON6A+fKwDqo1Z5FBPZK35ChXUrSbPGWK82RadM
 /MwvwSCvZPqNZGNaJZ10VIbrNxDecSTiOSv1+oVwl2CM2+jYNCISCSN5j7CpKijgprRY
 CJaIEDTjvc9hKns2nXun/G+tTgyT1oCr2QRDMvZePt4r1OJGLU6wR8VvEWXQTYoDn4AT
 q7hbeiJwaqON26hlkX8ehlPyHhfZV4qBiqX27l+EiubGlbpVpl3SqKq0UGZyfdiP6rcY
 kJ0fayLZQZJTu7pQL4N2b57/hVJDu6MmJF+OQPZK7xRFTUfb6XJwj1s087AJwApqtUrP
 BJMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1722507823; x=1723112623;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=7Xy+YnBW0pTnJouWOqXyQ4NXMUNDJSPyAsk2GdSuKUs=;
 b=n6fBUB5K8Ujjtyl1m+8Jqcl7O2jzrgq2f28L7wZqYsCCAuwzfqO7SwY4O3kEKfqzXY
 oTDDX1rtNjWzVWwQQrzQRC/JEnkW2qr35iL1YKLA+FmxdoOhWHuQq0NwXNQVlozs2hG0
 m7qj//bDWyIV6LGTQ7mu6+j7HojTp33nVllDDafU6FTh04AINgUv928d/sxuXzRFW2yW
 cY1z7i/t8Bj9CbgCKzFxMCuS+eQhpxCOTMtEzFQ8HQaeU4+fbRKbGSgvO3Mw8EDZ0agv
 Ntz5wV8svd6dsJmjydfis4iRBGvFFOmdVuUrF7b7Fcc8BMUyPPf5u2FfZ7emZArSeGbC
 /K6w==
X-Forwarded-Encrypted: i=1;
 AJvYcCWTW2UcAjOAFg0D3cr+INaHFbWeO33g0W1dAug2YuSU9rzzlx6LkIXhXhtJhbjJUqgGJKXKg2uxP+8bb143R+aKLqg5aEX2WQkG9pRDnxfC
X-Gm-Message-State: AOJu0YzeAYi+wzMHKh7ikMMoxJGM+JwrQuRftwOSohM/2i4i/TElVrwp
 /J6LCOaSYSqLiQuoyKC2a6qfImqf+fB/bvJjy0pH+ciUXljzECro
X-Google-Smtp-Source: AGHT+IGIxxlyoDeUzX/z3mgluxeTtIsYQBu/I+K7lGL6G4vz4LFvH0ndqW0M6bE//iHQUiAIGFmFMA==
X-Received: by 2002:a05:6830:699a:b0:709:4936:d8fd with SMTP id
 46e09a7af769-7096b882b33mr1996037a34.29.1722507823183; 
 Thu, 01 Aug 2024 03:23:43 -0700 (PDT)
Received: from localhost.localdomain
 ([2401:4900:1cb4:cece:78f6:191b:3e2f:ac7d])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-70ead8a105bsm11186351b3a.194.2024.08.01.03.23.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 01 Aug 2024 03:23:42 -0700 (PDT)
From: abid-sayyad <sayyad.abid16@gmail.com>
To: airlied@gmail.com
Cc: daniel@ffwll.ch, maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 tzimmermann@suse.de, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, abid-sayyad <sayyad.abid16@gmail.com>
Subject: [PATCH] drm: Add documentation for struct drm_pane_size_hint
Date: Thu,  1 Aug 2024 15:52:39 +0530
Message-Id: <20240801102239.572718-1-sayyad.abid16@gmail.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Thu, 01 Aug 2024 11:08:17 +0000
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

Fixed warning for the following:
./include/uapi/drm/drm_mode.h:869: warning: Function parameter or struct member
				'width' not described in 'drm_plane_size_hint'
./include/uapi/drm/drm_mode.h:869: warning: Function parameter or struct member
				'height' not described in 'drm_plane_size_hint'

Signed-off-by: abid-sayyad <sayyad.abid16@gmail.com>
---
 include/uapi/drm/drm_mode.h | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/include/uapi/drm/drm_mode.h b/include/uapi/drm/drm_mode.h
index d390011b89b4..b581d384d4b5 100644
--- a/include/uapi/drm/drm_mode.h
+++ b/include/uapi/drm/drm_mode.h
@@ -864,7 +864,13 @@ struct drm_color_lut {
  * array of struct drm_plane_size_hint.
  */
 struct drm_plane_size_hint {
+	/**
+	 * @width : width of the plane in pixels.
+	 */
 	__u16 width;
+	/**
+	 * @height : height of the plane in pixels.
+	 */
 	__u16 height;
 };
 
-- 
2.39.2

