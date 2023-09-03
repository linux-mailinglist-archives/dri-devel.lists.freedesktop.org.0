Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 89EC9790D8A
	for <lists+dri-devel@lfdr.de>; Sun,  3 Sep 2023 20:46:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6D01D10E1D8;
	Sun,  3 Sep 2023 18:46:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-il1-x130.google.com (mail-il1-x130.google.com
 [IPv6:2607:f8b0:4864:20::130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AA30A10E1A1;
 Sun,  3 Sep 2023 18:46:22 +0000 (UTC)
Received: by mail-il1-x130.google.com with SMTP id
 e9e14a558f8ab-34df008b0cbso3303145ab.1; 
 Sun, 03 Sep 2023 11:46:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1693766782; x=1694371582; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=9+vShd9z6JIlJdMcVT9ozEMb7ECMtYhQaxypaqn+ojI=;
 b=gsG7vqqREloVFGLQnEO9qOBUm3hP/oMcF+m2BCq68YPNrflltw3N+FN1LMoJOvlgQe
 2VlGc7IfBWyUjeEACWGHqYuy3d9TvY5UJtKFfNNyrytreyC7n0CWo45J9B9A3tpoh4J8
 TizawBiB6p/1Ypwl+D7Oeix8ePXy1HEvaAPLgF8jpkmKjUx7tgPf/DxqgM0qRrXxbrEK
 1amYyM5QzHRoyGWW0GDgeouyx/uC368Gu42qvJCrhmTMLS1sqi7rSXcG5pk5jPpWHKXY
 rT02ZjicRDoNpo2rTM8S2/KKQroWk+M58cpdVo9X6C6bfDcSWxHWEKho9DoenBDuh0hb
 bjTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1693766782; x=1694371582;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=9+vShd9z6JIlJdMcVT9ozEMb7ECMtYhQaxypaqn+ojI=;
 b=MW9IveanG2u26KxmtZCnmblLyAXe8iUHheIvnTjj3xuQhzJa/cVAtfQbADZLUVuM0j
 cuxiKlmQb9pVAvOwFkQsB3dXRLUnJG2VMV3OtWdjV2ErhEM0V9VO+bmtH+CDOUBX+tgX
 +JLJ6JqccG6ozLWkzPrTuz3nshQQRjmIhAG/Nmo9b4L55VvT67JiyHRoDkBDTk97PtTc
 nCBKhnN5UN+8CPGXthqfSqWcBsIfXvAaIqjuAd8BcsuF/gIuKOLUjQ8dyzmOfIvqEpl1
 gmHCBfatMLanUmlPS17LtjVrnIF1f57wyfjoCKLd9r4p+lSk+oYiJCY7G1CfhxoHcScZ
 EEvQ==
X-Gm-Message-State: AOJu0YyFJgJrUbMUn6VnBQhZRQG5y/UBxI8LUQcH90CkTn0+0Glyo0xK
 jj/AI44cV8WL/xqvcZAfWdk=
X-Google-Smtp-Source: AGHT+IGqOoyhaY6/BLxjGQwr9jgSrLCBNKR3l+qSBXjy+8E6+buexCVqqyAEqMiNiyX8+oyGCVjU2Q==
X-Received: by 2002:a05:6e02:e12:b0:349:9993:f223 with SMTP id
 a18-20020a056e020e1200b003499993f223mr8706895ilk.23.1693766781766; 
 Sun, 03 Sep 2023 11:46:21 -0700 (PDT)
Received: from frodo.. (c-73-78-62-130.hsd1.co.comcast.net. [73.78.62.130])
 by smtp.googlemail.com with ESMTPSA id
 u9-20020a02cb89000000b0042b37dda71asm2519968jap.136.2023.09.03.11.46.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 03 Sep 2023 11:46:21 -0700 (PDT)
From: Jim Cromie <jim.cromie@gmail.com>
To: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, intel-gvt-dev@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org
Subject: [PATCH v2 6/6] drm: use correct ccflags-y syntax
Date: Sun,  3 Sep 2023 12:46:03 -0600
Message-ID: <20230903184607.272198-7-jim.cromie@gmail.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230903184607.272198-1-jim.cromie@gmail.com>
References: <20230903184607.272198-1-jim.cromie@gmail.com>
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
Cc: Thomas Zimmermann <tzimmermann@suse.de>, jani.nikula@intel.com,
 daniel.vetter@ffwll.ch, Maxime Ripard <mripard@kernel.org>,
 seanpaul@chromium.org, Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Incorrect CFLAGS- usage failed to add -DDYNAMIC_DEBUG_MODULE,
which broke builds with:

CONFIG_DRM_USE_DYNAMIC_DEBUG=Y
CONFIG_DYNAMIC_DEBUG_CORE=Y, but CONFIG_DYNAMIC_DEBUG=N

Also add subdir-ccflags so that all drivers pick up the addition.

Fixes: 84ec67288c10 ("drm_print: wrap drm_*_dbg in dyndbg descriptor factory macro")
Signed-off-by: Jim Cromie <jim.cromie@gmail.com>
---
 drivers/gpu/drm/Makefile | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/Makefile b/drivers/gpu/drm/Makefile
index 7a09a89b493b..013cde886326 100644
--- a/drivers/gpu/drm/Makefile
+++ b/drivers/gpu/drm/Makefile
@@ -3,7 +3,8 @@
 # Makefile for the drm device driver.  This driver provides support for the
 # Direct Rendering Infrastructure (DRI) in XFree86 4.1.0 and higher.
 
-CFLAGS-$(CONFIG_DRM_USE_DYNAMIC_DEBUG)	+= -DDYNAMIC_DEBUG_MODULE
+ccflags-$(CONFIG_DRM_USE_DYNAMIC_DEBUG)		+= -DDYNAMIC_DEBUG_MODULE
+subdir-ccflags-$(CONFIG_DRM_USE_DYNAMIC_DEBUG)	+= -DDYNAMIC_DEBUG_MODULE
 
 drm-y := \
 	drm_aperture.o \
-- 
2.41.0

