Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2ED99B3DA9C
	for <lists+dri-devel@lfdr.de>; Mon,  1 Sep 2025 09:03:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ECCEC10E37D;
	Mon,  1 Sep 2025 07:03:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="fLw8Qh1w";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com
 [209.85.221.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DFD0210E02B
 for <dri-devel@lists.freedesktop.org>; Sun, 31 Aug 2025 19:50:35 +0000 (UTC)
Received: by mail-wr1-f41.google.com with SMTP id
 ffacd0b85a97d-3ce4ed7a73fso1793688f8f.1
 for <dri-devel@lists.freedesktop.org>; Sun, 31 Aug 2025 12:50:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1756669834; x=1757274634; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=nBh+IsCBL92vWqrVuEHjY1sB3Kv+/80tU+UoBNfYnVQ=;
 b=fLw8Qh1wVP2z60kdDQJW4FXdFSfG2TXpZppUu4m2etrzt+0VOgF11nkk5tjHEMBj4P
 5L0BtDfhLBfT7GpmtS8TN8mh9rvn260ZlYeh7CXX2Yg207z9SQVFA60ppxFiI4GcQ2XZ
 pN5tIRwhYUODctcUeUtxfnkMjE3o6cdH7gAifKmEjgqG/7b5tBahX5v3mDmg+IumkTqx
 2eKWi5WaQJoDXse79xs1KPWNoQoQh8B5s97SN2+TjJGRbkLY/laHWbak8jofD5EGDst8
 Hh0cvGLcVXBPxjlaHW7LafLnoeYEJ43EZ1HaEm3n+9ZSlYSm44/GaPZDMGhRzyKDu23n
 vIpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1756669834; x=1757274634;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=nBh+IsCBL92vWqrVuEHjY1sB3Kv+/80tU+UoBNfYnVQ=;
 b=vrG7OLVJp7q0jvCN4d3gS8nDizP7YxYRUdZs7yAznax8ZAvRgrxsUD1IXBIEFcMKkc
 ikzuNnjgx+LWEvXv6dlOaCT/0A+ARRnTfyEOst3ooQtnYNUEnV57nDY6dPejAWm5bZWs
 WxpC8yl+F6McfCCMfSqE18T1qOpY1wzx6sZSZqMXoMVkJwkaA3XeGZe3u2ByWJGre0Cn
 2JvI+aJEOOLrdCAgWBxlNI0XjneSWHjwY3hhWcnJhCn6gj27jO3WOIJonyU2M4kHL274
 f7O8MT4s7chUcIXwWk9iqJ86g6+6lw61vVwNUQ1a9hMa0YfZzxuG1/U8hyJj7LW1MmRq
 V3/A==
X-Gm-Message-State: AOJu0Yxsx/r0uFtCfvsewRB9J4698fSMyFp33bShgUhRncgUMXbRZddr
 S47LY+YNQtEjzPrLTlx36783iB8ADIpBVWpKNUQlVrD9QesCgVNRdygP
X-Gm-Gg: ASbGncvhX/YLeILAgDBuDtH4ktd1RaHFfHA+VIerCJvyYdmC5IZrJZyr+rhcxDXGeHD
 YusHCopg6zvjYWFl+/TAcKdxxzS9sV9Pd8f/FizhQiZ31JRbGqG/sVOk+jeR3ECwUFtmATeYnJI
 sK6emFdWXqOyiU6AlPuDbWjq9NODm6Hqf3aaylEbSNzWkzhL7DjjaeYYk1ahO/M59bd8X+3UpaB
 n4IQ+PgkG7KL8yCo2nvemlMO0YVLIS4j9wIInYkWuasuN4HdfZlWx3bxnSYTkphB0yxWEt9KSNm
 Zc/goGDSkjzzSZDR2cyl8hMPmWk8W5/Jw4QKgowWtj9U/4VeSjdU7s74BhUCCBVfKwKfYy8xBye
 9aeujozP2/1gZa1vQ0ohzhmHjMc1RJL5FahTUTcz1wJdLur06N7qGRg==
X-Google-Smtp-Source: AGHT+IHx/YvcKoYEJXAEUUtX3eR6wAG3GYII2ll5a0+ectmFZ16V6CaoamGchWsUr5/tzs4pkS/9cQ==
X-Received: by 2002:a5d:5f90:0:b0:3d0:d6e6:5d76 with SMTP id
 ffacd0b85a97d-3d1e05b8ddcmr4095247f8f.55.1756669833830; 
 Sun, 31 Aug 2025 12:50:33 -0700 (PDT)
Received: from simo-Alienware-Area-51m-R2.. ([41.250.61.131])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3cf276d204asm12232674f8f.24.2025.08.31.12.50.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 31 Aug 2025 12:50:33 -0700 (PDT)
From: Mohammed GUERMOUD <mohammed.guermoud@gmail.com>
To: Danilo Krummrich <dakr@kernel.org>,
 Matthew Brost <matthew.brost@intel.com>,
 =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Alice Ryhl <aliceryhl@google.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Mohammed GUERMOUD <mohammed.guermoud@gmail.com>
Subject: [PATCH] drm/gpuvm: add missing blank line after declaration
Date: Sun, 31 Aug 2025 20:50:03 +0100
Message-ID: <20250831195003.370338-1-mohammed.guermoud@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Mon, 01 Sep 2025 07:02:45 +0000
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

The checkpatch.pl script reported a "Missing a blank line after
declarations" warning.

Add the required blank line to adhere to the Linux kernel coding style
and improve readability.

Signed-off-by: Mohammed GUERMOUD <mohammed.guermoud@gmail.com>
---
 drivers/gpu/drm/drm_gpuvm.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/drm_gpuvm.c b/drivers/gpu/drm/drm_gpuvm.c
index db9b089ef62c..522349cd414d 100644
--- a/drivers/gpu/drm/drm_gpuvm.c
+++ b/drivers/gpu/drm/drm_gpuvm.c
@@ -2485,6 +2485,7 @@ drm_gpuvm_sm_map_exec_lock(struct drm_gpuvm *gpuvm,
 {
 	if (req_obj) {
 		int ret = drm_exec_prepare_obj(exec, req_obj, num_fences);
+
 		if (ret)
 			return ret;
 	}
-- 
2.43.0

