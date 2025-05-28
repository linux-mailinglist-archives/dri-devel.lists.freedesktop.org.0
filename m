Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B71DAC656B
	for <lists+dri-devel@lfdr.de>; Wed, 28 May 2025 11:13:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8548910E1EA;
	Wed, 28 May 2025 09:13:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; secure) header.d=ffwll.ch header.i=@ffwll.ch header.b="IPRcxd4J";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com
 [209.85.128.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B28C110E5BB
 for <dri-devel@lists.freedesktop.org>; Wed, 28 May 2025 09:13:28 +0000 (UTC)
Received: by mail-wm1-f54.google.com with SMTP id
 5b1f17b1804b1-441d1ed82faso33287795e9.0
 for <dri-devel@lists.freedesktop.org>; Wed, 28 May 2025 02:13:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google; t=1748423607; x=1749028407; darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=kLZ/YSPoybEfYw1P5LcqsYEkJQEqmsFR2BBBagOvSLo=;
 b=IPRcxd4JUTcoRTZ1JHVAgVv+J7x0kVyuSD29tkFPj9duGMmvhQbVdm4fwgP8REhxLl
 PLZ26+UY7n0B3xaCwGyxX1xp9c2f4KvyVgWn+OqgAawv42XCJagSVp7C+uN+W1RLIEFe
 gE4O2VBrFJpOiI5WTzbWyvpb53DSFYl1Hg0/Y=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1748423607; x=1749028407;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=kLZ/YSPoybEfYw1P5LcqsYEkJQEqmsFR2BBBagOvSLo=;
 b=iWYOJWCbG1N8vDWbPTJSVrT1/PDWCQOWS22jSp420RapnzPnyiZTbwWm1MFSPEigNF
 DYvwvJ7j1rYV2GfogrfswIW+MfHxUvFRpigwuVLlqdXAtGSPVg92p/M5P5wln8bnJCBN
 K0Z1udiht0hr/KWqWAzvlS1drTpUXTfUOg7ZZhkoCi+slKUeczuo4r3lo1+PlopTNvUB
 jqzRCzb/lLnTDmknzrFcNAnDyVZoNnG7j/vL7d+wQUz+UOUOMUhMaKU1n39aNIDPMHYj
 6xde3V6w9jZ8rZekfSXMkFkuZJ6z49+K4Hrxfvv7gQAoSjRShrxIkjB5AOSQIHz6lAKU
 vKCA==
X-Gm-Message-State: AOJu0YxwabIrdT9dZHm2mQ9IrWBusvTIlMP80lPqVvR+iRL5suFu4XlQ
 On8bQkTv42jKttYWvvxJkKH8OhnDkUGlLwgDjlumOkFLxFsBey5298vBTDr8bCFYSVsjEqPF23r
 YAz3v
X-Gm-Gg: ASbGnct3sHRdQXO5pO5+ujnxkJMLgK7C1m9yTRPd0CXcRfuSqfgTMF/r0IIs3qxDiR+
 yWMujiLR0mzcvJnKK+73hv6Ls9mPqin7D0/ImrfvlJ/zYldI7MnBbvqtWwWiKBG1NISgJFcC6WP
 9fcI8xVgbXFJ7k9+UucYxMzHXblhK0P9R2yBVm830RquOxB20oLzuBREFCxd05YUDQG6a66TO+U
 6glbRajqxAjqa/RPpSU+j8PeueH3B0XJ1tH4Js4SHl6q6sYBEnnHMUXBtYN+oAmZCiUDQXAQlPJ
 R9bnTsMl7KjTRQwnbIcTYbZekSKsvuaIz6emCEc+HbwkeQae5E5SoOJ1Qyz/qIfVAtVsdgcSjA=
 =
X-Google-Smtp-Source: AGHT+IHVEnlCoO1/3KjO2AKownXUpMzy9lc6iIRM8h98mau5CMTI4daFFodb//eOr4nOV6TsvIJeyw==
X-Received: by 2002:a05:6000:2309:b0:3a3:6991:dcbb with SMTP id
 ffacd0b85a97d-3a4cb46149amr13224512f8f.12.1748423607241; 
 Wed, 28 May 2025 02:13:27 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:5485:d4b2:c087:b497])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4500e1d85b5sm14811715e9.32.2025.05.28.02.13.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 28 May 2025 02:13:26 -0700 (PDT)
From: Simona Vetter <simona.vetter@ffwll.ch>
To: DRI Development <dri-devel@lists.freedesktop.org>
Cc: intel-xe@lists.freedesktop.org, Simona Vetter <simona.vetter@ffwll.ch>,
 Daniel Vetter <daniel.vetter@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
Subject: [PATCH 8/8] drm/xe: Add comments about drm_file.object_idr issues
Date: Wed, 28 May 2025 11:13:06 +0200
Message-ID: <20250528091307.1894940-9-simona.vetter@ffwll.ch>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250528091307.1894940-1-simona.vetter@ffwll.ch>
References: <20250528091307.1894940-1-simona.vetter@ffwll.ch>
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

idr_for_each_entry() is fine, but will prematurely terminate on
transient NULL entries. It should be switched over to idr_for_each,
which allows you to handle this explicitly.

Note that transient NULL pointers in drm_file.object_idr have been a
thing since f6cd7daecff5 ("drm: Release driver references to handle
before making it available again"), this is a really old issue.

Since it's just a premature loop terminate the impact should be fairly
benign, at least for any debugfs or fdinfo code.

On top of that this code also drops the drm_file.table_lock lock while
iterating, which can mess up the iterator state. And that's actually
bad.

Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
Signed-off-by: Simona Vetter <simona.vetter@ffwll.ch>
Cc: Lucas De Marchi <lucas.demarchi@intel.com>
Cc: "Thomas Hellström" <thomas.hellstrom@linux.intel.com>
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Cc: intel-xe@lists.freedesktop.org
---
 drivers/gpu/drm/xe/xe_drm_client.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_drm_client.c b/drivers/gpu/drm/xe/xe_drm_client.c
index 31f688e953d7..2542f265a221 100644
--- a/drivers/gpu/drm/xe/xe_drm_client.c
+++ b/drivers/gpu/drm/xe/xe_drm_client.c
@@ -205,6 +205,7 @@ static void show_meminfo(struct drm_printer *p, struct drm_file *file)
 
 	/* Public objects. */
 	spin_lock(&file->table_lock);
+	/* FIXME: Use idr_for_each to handle transient NULL pointers */
 	idr_for_each_entry(&file->object_idr, obj, id) {
 		struct xe_bo *bo = gem_to_xe_bo(obj);
 
@@ -213,6 +214,8 @@ static void show_meminfo(struct drm_printer *p, struct drm_file *file)
 			xe_bo_unlock(bo);
 		} else {
 			xe_bo_get(bo);
+			/* FIXME: dropping the lock can mess the idr iterator
+			 * state up */
 			spin_unlock(&file->table_lock);
 
 			xe_bo_lock(bo, false);
-- 
2.49.0

