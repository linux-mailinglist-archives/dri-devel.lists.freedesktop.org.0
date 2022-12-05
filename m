Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 51706642C9D
	for <lists+dri-devel@lfdr.de>; Mon,  5 Dec 2022 17:11:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9C33810E255;
	Mon,  5 Dec 2022 16:10:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-il1-x12c.google.com (mail-il1-x12c.google.com
 [IPv6:2607:f8b0:4864:20::12c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2F6D910E0B5;
 Mon,  5 Dec 2022 16:10:24 +0000 (UTC)
Received: by mail-il1-x12c.google.com with SMTP id q13so5287318ild.3;
 Mon, 05 Dec 2022 08:10:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=M9ZyX2rEEt8xF2wnMR144cVYnIHvQWhY/Asi+jCe8jQ=;
 b=BbF+/9gxLsIAvlzG5e99rniqZ8QtSEy3GUPRMo4iUlbF7n9TKdMzRkhwGZr0pZd83n
 BYSrKV8Z0spcFDmyZ5FkEKG78cH16hQo67px8xAk8O6oKXLKv1ko8/6J52VllQ/W4DM8
 pb84giAl7+/Am6D/aSKiqNwJGp/2XqSLKCiVmJNIM8GTRXqvc+mwZ5nRSYDp9HC4nOWV
 JvN8sK2Cb4S/uzfEx1kCXSOfMkuBWHLYSPDeGXEjJYS3iVhxhC9EVsKKcpIFRJk0lw8Z
 XNYraRQUc6f8ZuPEZWCWHcqDcihYp5aTyh3XOsSwLQrObF3DOFgig2vf83ntzXv4Skfw
 jPsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=M9ZyX2rEEt8xF2wnMR144cVYnIHvQWhY/Asi+jCe8jQ=;
 b=gssfs6I9ta2w0QfxmeWgb4GGGa5R027rUYnGG6munkbFZagepIudXtA2Ez7GvaPydR
 Ma+7at/7m7ipn5SogSIMpRcdZKnh3qr3esceHdNaiLZoAbvSMQ+nwVVdVgPAWgKKtvj8
 qJkyZuSNg/v3reqSxlBOT8ys+VilYGS7elWsZbVCynGsLhzxC+MNNorfBxdeQZ0S/v5R
 xDJ+AQqULBiSq3R16u8hjQQ+9qRj+fKQQD/p1U56z3GHXDYoy4cWhYtdrcKzVaUhaN+L
 Zgr0LPa2mCTODqZt6Kbfw17a8Dr5s+mUARAb0D1cvQdZksCgUoGllUkpoGt05eAcuLIj
 0Fiw==
X-Gm-Message-State: ANoB5pkb+5lDgfWnM5b/zmJS90834vcBb1Amk1cQBz7az2K2pVMeu6M+
 Nr8Rn13lJWJKXLFVOhrAkslv1jy7h5Q=
X-Google-Smtp-Source: AA0mqf7gyM+3GXVNt+XxI7afuxs5bxazGf+dEtxuz9uSFRi6e0cSSJYTYUXq+1dhcZil9FTD4PvjiA==
X-Received: by 2002:a05:6e02:1e05:b0:302:cc74:920c with SMTP id
 g5-20020a056e021e0500b00302cc74920cmr31013025ila.262.1670256623097; 
 Mon, 05 Dec 2022 08:10:23 -0800 (PST)
Received: from frodo.. (c-73-78-62-130.hsd1.co.comcast.net. [73.78.62.130])
 by smtp.googlemail.com with ESMTPSA id
 g19-20020a05660226d300b006bcd45fe42bsm6017753ioo.29.2022.12.05.08.10.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 05 Dec 2022 08:10:22 -0800 (PST)
From: Jim Cromie <jim.cromie@gmail.com>
To: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, intel-gvt-dev@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org
Subject: [PATCH 2/2] drm_print: fix stale macro-name in comment
Date: Mon,  5 Dec 2022 09:10:05 -0700
Message-Id: <20221205161005.222274-3-jim.cromie@gmail.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221205161005.222274-1-jim.cromie@gmail.com>
References: <20221205161005.222274-1-jim.cromie@gmail.com>
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
index a44fb7ef257f..e4c0c7e6d49d 100644
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
2.38.1

