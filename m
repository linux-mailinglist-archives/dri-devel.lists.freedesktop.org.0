Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DD759D1B08
	for <lists+dri-devel@lfdr.de>; Mon, 18 Nov 2024 23:20:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D794A10E293;
	Mon, 18 Nov 2024 22:20:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="QjNW0kOX";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com
 [209.85.218.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B27F710E293
 for <dri-devel@lists.freedesktop.org>; Mon, 18 Nov 2024 22:20:02 +0000 (UTC)
Received: by mail-ej1-f44.google.com with SMTP id
 a640c23a62f3a-aa2099efdc3so880517966b.1
 for <dri-devel@lists.freedesktop.org>; Mon, 18 Nov 2024 14:20:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1731968401; x=1732573201; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=jYtGEYKooR3k70+jqsHoRxERDWbVZz+C79qNhsZlccU=;
 b=QjNW0kOXajAh+0yECMOUdRarjCM7p4aWZM8CDpmYEpPsjGgJPtNgTN6iL6fUAfrRLk
 6XPvupUNHdPbuhPu4yWDwniCkgoFXEBGJZCFjPMm1rwveksf/nanVDi/fMlIVYZ3Znyr
 9TZYwz7JdIojzueqo7JUti7nTN1ULsCmcgQseFyZlvEHMqevWlRNGd1xWuHtVdVlnLwg
 bgvSnKvfRmX06HcDLwEqXPSbtfMHcf2y0VXcN/uRdYpzgjIefANuO6Z9hAYx/8RB0xYA
 tTuhObfJKA74NLiVuPC4KA1eFvGIPslBoE5HOOyart8F1HOse+1DDLqVBjW9ECmsiSCK
 iTPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1731968401; x=1732573201;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=jYtGEYKooR3k70+jqsHoRxERDWbVZz+C79qNhsZlccU=;
 b=MW4z3m4Ph/e6iBCceY+ZnlpYVpHzpqtYdswtu5TU97B1/FmC0xWWSN7aeTaAWENxbW
 Gn1194G/jmZXJKJlD8D+tqllC7NjEhFaZd0gP35nBlXHb4FprNeJI+f0KoRyyFT3gyFA
 5LOYx5CEh4au1GmrNazAMMUCkBb4U89alyFMyQ9aTJqLdB3yYKTryzv4brAzYUmq1EZY
 hxIMf4mm+xqECeWnH/UbLigforBbEmWYA11WNiHb1opxO1SKhEqE68il84skqv1MBRYn
 ZbXq2eCjMzjFANjMPeynYPu5PUIRaKXfDbMH+65eqM3LeSbP8wUAkl/0lNZw6bBOmncR
 20LA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXxLCKO07aqVGlXZhNOzwwYvk0kWLAuEIxLIyzw/ZvWu2i8dpOPoko75n1jv2RxTuq9fi53AI8LOpM=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwneaZ8x7KV/6AIlUez6q945R4OHB79P32ckyXwIGURbWrfBb/8
 0w60Ww48KAocJO7lTJQFIIwT4NwdyslNK4MLRbOStU0yFJUDst97
X-Google-Smtp-Source: AGHT+IHzyzhLjxv2Vl4C59o5aYbPpYinJKFAwD2oK6Fnp2vAcv4hP5NceZ2ycS6tUBogOMQIR7kSbg==
X-Received: by 2002:a17:907:1c04:b0:a9a:e0b8:5bac with SMTP id
 a640c23a62f3a-aa4c7ed4dfdmr63138766b.23.1731968400653; 
 Mon, 18 Nov 2024 14:20:00 -0800 (PST)
Received: from localhost.localdomain (62-178-82-42.cable.dynamic.surfer.at.
 [62.178.82.42]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-aa20df26c84sm584323966b.35.2024.11.18.14.19.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 18 Nov 2024 14:19:59 -0800 (PST)
From: Christian Gmeiner <christian.gmeiner@gmail.com>
To: Melissa Wen <mwen@igalia.com>,
 =?UTF-8?q?Ma=C3=ADra=20Canal?= <mcanal@igalia.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>,
 "Juan A. Suarez Romero" <jasuarez@igalia.com>
Cc: kernel-dev@igalia.com, Christian Gmeiner <cgmeiner@igalia.com>,
 stable@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH] drm/v3d: Stop active perfmon if it is being destroyed
Date: Mon, 18 Nov 2024 23:19:47 +0100
Message-ID: <20241118221948.1758130-1-christian.gmeiner@gmail.com>
X-Mailer: git-send-email 2.47.0
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

From: Christian Gmeiner <cgmeiner@igalia.com>

If the active performance monitor (v3d->active_perfmon) is being
destroyed, stop it first. Currently, the active perfmon is not
stopped during destruction, leaving the v3d->active_perfmon pointer
stale. This can lead to undefined behavior and instability.

This patch ensures that the active perfmon is stopped before being
destroyed, aligning with the behavior introduced in commit
7d1fd3638ee3 ("drm/v3d: Stop the active perfmon before being destroyed").

Cc: stable@vger.kernel.org # v5.15+
Fixes: 26a4dc29b74a ("drm/v3d: Expose performance counters to userspace")
Signed-off-by: Christian Gmeiner <cgmeiner@igalia.com>
---
 drivers/gpu/drm/v3d/v3d_perfmon.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/gpu/drm/v3d/v3d_perfmon.c b/drivers/gpu/drm/v3d/v3d_perfmon.c
index 00cd081d7873..909288d43f2f 100644
--- a/drivers/gpu/drm/v3d/v3d_perfmon.c
+++ b/drivers/gpu/drm/v3d/v3d_perfmon.c
@@ -383,6 +383,7 @@ int v3d_perfmon_destroy_ioctl(struct drm_device *dev, void *data,
 {
 	struct v3d_file_priv *v3d_priv = file_priv->driver_priv;
 	struct drm_v3d_perfmon_destroy *req = data;
+	struct v3d_dev *v3d = v3d_priv->v3d;
 	struct v3d_perfmon *perfmon;
 
 	mutex_lock(&v3d_priv->perfmon.lock);
@@ -392,6 +393,10 @@ int v3d_perfmon_destroy_ioctl(struct drm_device *dev, void *data,
 	if (!perfmon)
 		return -EINVAL;
 
+	/* If the active perfmon is being destroyed, stop it first */
+	if (perfmon == v3d->active_perfmon)
+		v3d_perfmon_stop(v3d, perfmon, false);
+
 	v3d_perfmon_put(perfmon);
 
 	return 0;
-- 
2.47.0

