Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AC20667BD05
	for <lists+dri-devel@lfdr.de>; Wed, 25 Jan 2023 21:38:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2C63810E898;
	Wed, 25 Jan 2023 20:38:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-il1-x134.google.com (mail-il1-x134.google.com
 [IPv6:2607:f8b0:4864:20::134])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F350610E897;
 Wed, 25 Jan 2023 20:38:12 +0000 (UTC)
Received: by mail-il1-x134.google.com with SMTP id f8so12644ilj.5;
 Wed, 25 Jan 2023 12:38:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=dbXnJe4SwHWreda4y6VYBVk5VMF1Xs4ho+xFcctOhbY=;
 b=mR33HGxaM6bUMu7S35LzQkGJTcQjq0lvhxxT2aG81KmMjpbT2xjVYoeIWCg0dQuevQ
 r/KgAsntbni/1hh9esQVBplBflw/8FF/NJeLCTzNOoO6Sex1+b4bwyL8heJMrKQygZ5q
 S2XiyVnYPuv1PlOI4mwdT0EVUqgW34IgL2xBZXj+xvBcfJFwk9QG+7pQ34vZwGlYBe2g
 4Mpz5a4okYGtB1oE9FgILiZF081RaiZzmd4DihhnYgNFwIaZ8N3D4LCVywlVovrs7RGK
 HIy99zte576mcRau4jL+XZj90LgrOlGWXNJRVnPjEbmfyDNGcf2YWsq4W0zkW77aWftw
 sQDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=dbXnJe4SwHWreda4y6VYBVk5VMF1Xs4ho+xFcctOhbY=;
 b=rUw3eCQ3hSBQXvtUjFHRNaOntp8T5KqccHNZra9ZVmET0vFVVyxzzb8IJc++RWfne+
 vvDnQiIicTmTgpPfsgG9olofozbR7aDZOHGsZbGk6O0CaJeQC4NhjgHrgL/maNhEx6c4
 mlG93q+Dnqt4UyAPV7VP68Ah+MimYBS5UeVzAaejl3Z5iCdI8eIc5xej2eGLrnk78jvs
 OOoQezZ0D0ppf+grElURdwwyNTZYtBJnR4Ayip8Vst3cBAgk/WIoiNMscKDjarkzXgJD
 B5BhtTuRqGhUo6zUX7YbhjZe25cXo4u3w3ZTAoiyQhaGjgpQ/8wbGT6BtJs0oyEwqbI2
 YwJQ==
X-Gm-Message-State: AO0yUKWI/SHOwfdF5WRoNnCrXg6PLuuZ5TY3yVWl5kdt55gIEhzO+/nM
 P/A67ybsDw/KsX7hBxzwuho=
X-Google-Smtp-Source: AK7set9ABQ8erawx9YyTx46zZ4uRp27C6Q7K2v1b/MHVNahl9s9L/HEYA3KWWdjqBuga/NGYLb5emg==
X-Received: by 2002:a05:6e02:1c82:b0:30f:8aed:d4c9 with SMTP id
 w2-20020a056e021c8200b0030f8aedd4c9mr7650141ill.19.1674679092225; 
 Wed, 25 Jan 2023 12:38:12 -0800 (PST)
Received: from frodo.. (c-73-78-62-130.hsd1.co.comcast.net. [73.78.62.130])
 by smtp.googlemail.com with ESMTPSA id
 y11-20020a056e02128b00b00310a599fd43sm665104ilq.46.2023.01.25.12.38.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 25 Jan 2023 12:38:11 -0800 (PST)
From: Jim Cromie <jim.cromie@gmail.com>
To: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, intel-gvt-dev@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org
Subject: [PATCH v3 14/19] drm_print: fix stale macro-name in comment
Date: Wed, 25 Jan 2023 13:37:38 -0700
Message-Id: <20230125203743.564009-15-jim.cromie@gmail.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230125203743.564009-1-jim.cromie@gmail.com>
References: <20230125203743.564009-1-jim.cromie@gmail.com>
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
Cc: jani.nikula@intel.com, daniel.vetter@ffwll.ch, seanpaul@chromium.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Cited commit uses stale macro name, fix this, and explain better.

When DRM_USE_DYNAMIC_DEBUG=y, DYNDBG_CLASSMAP_DEFINE() maps DRM_UT_*
onto BITs in drm.debug.  This still uses enum drm_debug_category, but
it is somewhat indirect, with the ordered set of DRM_UT_* enum-vals.
This requires that the macro args: DRM_UT_* list must be kept in sync
and in order.

Fixes: f158936b60a7 ("drm: POC drm on dyndbg - use in core, 2 helpers, 3 drivers.")
Signed-off-by: Jim Cromie <jim.cromie@gmail.com>
---
. emphasize ABI non-change despite enum val change - Jani Nikula
. reorder to back of patchset to follow API name changes.
---
 include/drm/drm_print.h | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/include/drm/drm_print.h b/include/drm/drm_print.h
index 6a27e8f26770..7695ba31b3a4 100644
--- a/include/drm/drm_print.h
+++ b/include/drm/drm_print.h
@@ -276,7 +276,10 @@ static inline struct drm_printer drm_err_printer(const char *prefix)
  *
  */
 enum drm_debug_category {
-	/* These names must match those in DYNAMIC_DEBUG_CLASSBITS */
+	/*
+	 * Keep DYNDBG_CLASSMAP_DEFINE args in sync with changes here,
+	 * the enum-values define BIT()s in drm.debug, so are ABI.
+	 */
 	/**
 	 * @DRM_UT_CORE: Used in the generic drm code: drm_ioctl.c, drm_mm.c,
 	 * drm_memory.c, ...
-- 
2.39.1

