Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EC95CA6ADCA
	for <lists+dri-devel@lfdr.de>; Thu, 20 Mar 2025 19:54:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EB78510E6D1;
	Thu, 20 Mar 2025 18:54:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="mulBmyaM";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-f41.google.com (mail-io1-f41.google.com
 [209.85.166.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4AD0C10E6A4;
 Thu, 20 Mar 2025 18:53:47 +0000 (UTC)
Received: by mail-io1-f41.google.com with SMTP id
 ca18e2360f4ac-85d9a87660fso112647339f.1; 
 Thu, 20 Mar 2025 11:53:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1742496826; x=1743101626; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=CgDI/aHiLK+dNOZ45pw21AxG10xFqv/7yudaH0jzRkU=;
 b=mulBmyaMJY7/zr5Xvjx6E2SwXa8vhOCXr9WE4y54vx11k53Gdewqr/xGs8M0nWEDDN
 lhszGxpIFTsFrAgK6vzXoEaEGl4BufOGNjLhNyaMAlgP1sUGLzTV9v0zGk5lHz0nnzbs
 DWyicCPZ+1Pm6sdwAuVUa00cXnN0cfXpUyNZS3EcEhMobpJu3IE8tv/GFs9K7kbRmwiM
 V9HmOVtO8h0aHNUXwWy4OiL9XbT/7Hf2glaoaubKGDz0U6DWCsFujnW1eYEzyb5vkQf0
 jkiwrVPW03eK9iV3cJuFpYGO4E55iActSaVSB06XkweKEXbkM4IG5lh84lPGc1WAGtT9
 9x0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1742496826; x=1743101626;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=CgDI/aHiLK+dNOZ45pw21AxG10xFqv/7yudaH0jzRkU=;
 b=nayb0wGA5E6isMo/He9xZ+LH4mtYXjD+Hj+ommrSYFUvfEM5Lk5Jb7vQNNneHXvTNI
 ox/rpcIG1DBaw16plkIf8pY1wFGmECVAYO3puKVu820yEIFZT9dqoBN5qj1GVKeOd0N/
 a++5xzrvS6R7Cuftc9nS77Cr9X0Mqvp/wY92bTWjKk2H9IX96HVAGYFJ8LA4/1c3lb/v
 4WQftoLpTo1ms3cMkNRaT3mfuHNKupyLR6OQUeNgEecksegYOqxEoc0odQ99rkrpj3Yw
 ctY5zL2pMxPpJNdRn32BjVjgqOAdqWivPcFu8CtMhM28AlglMKN/vQHNr2aVjqBL/ORY
 jFBQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCU3N5GhO/2LtvIQ4XO4bg+PZAi38sZ40Gd8LRUACY9MxOJWDMT77guNaoxL8tm6HrdHAdW4Yp0i0XUo@lists.freedesktop.org,
 AJvYcCU8z3QcB+VtLzS4QblbZ9as05gz0mukE7g2NET78m1uumWeujWFVtewhkBm30jegCEMglnmwCcR@lists.freedesktop.org,
 AJvYcCWDiDj0elmUYxoTCdv56E89udMmAzSwzKZptpbUYYRcmBlfdlOaTH9017collPV/6Zm3b1PqEWPl//VYZ/q4g==@lists.freedesktop.org,
 AJvYcCWUmIDG7ONW/SDzuiPVq6r6A0L0p4V+Cw8P9qYIOVBkQZRw+9x4PytNIw1+jFVI1gIEhR+BlD54MFF8@lists.freedesktop.org,
 AJvYcCWsE+zuYdwXsteo1ijdtwu88XfHTlUyXGzaKjWSq9iqbn7RZQyqyxIBcNI26tDCpLAoHd7KKT7jAtthwY/YDhzHKA==@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yy6SPfs41TfQKKBAX7QLsTdc4c2BUGna6vrE2YOb1z9yoB+tgkx
 TUZQHegDT+9PAdHhbfDHJIkHSCHHlR4+kuoZQaPKA/6mahDnE43rPxxTiP01
X-Gm-Gg: ASbGnctx+0QfSWlHGRrrZu3XUY7DDYU1Z2+upTX/YY9qY2AE77Ygj0yad9N0u4hIT70
 dAEvbmE0Jl9c5no+bFaUqtGiJbs7kj/GZPkHSwEp71X6SyMYkbJbs5mcLpeIgBT89FtsHXz7+SL
 vHYYq0XQWTuW1jfW23L1/g68l5ogMb3YuJRLnyEyxlubm71UVtMMiNIY9qPaDNB7JlDRnpSxi3r
 q4zX2hdN8mKX5JYAnxE6zt3+TloJGpfBkpsnTTM9rI3aHSUw55AIz1Tu6muQcAhxxDSBa3eFYNr
 5KaCvbM85jFYBj1SgW0VGK60rBTWnt7W6gp5LxtGQZenwhLbHmPmPkiDLB4oVJVM61Bcfwp59q2
 nsA==
X-Google-Smtp-Source: AGHT+IH3per7MoX6CWSL0WNqymKLyYhHLAin9x57NXxWEpGpz2bnHtHQVSAlR4WrR+FYtRpO9rivXg==
X-Received: by 2002:a05:6602:399a:b0:85b:58b0:7abd with SMTP id
 ca18e2360f4ac-85e2ca35536mr54055539f.1.1742496826529; 
 Thu, 20 Mar 2025 11:53:46 -0700 (PDT)
Received: from gandalf.. (c-67-165-245-5.hsd1.co.comcast.net. [67.165.245.5])
 by smtp.googlemail.com with ESMTPSA id
 ca18e2360f4ac-85e2bc273e7sm7078039f.17.2025.03.20.11.53.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 20 Mar 2025 11:53:45 -0700 (PDT)
From: Jim Cromie <jim.cromie@gmail.com>
To: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, intel-gvt-dev@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, intel-gfx-trybot@lists.freedesktop.org
Cc: jbaron@akamai.com, gregkh@linuxfoundation.org, ukaszb@chromium.org,
 louis.chauvet@bootlin.com, daniel.vetter@ffwll.ch,
 tvrtko.ursulin@linux.intel.com, jani.nikula@intel.com,
 ville.syrjala@linux.intel.com, Jim Cromie <jim.cromie@gmail.com>
Subject: [PATCH v2 37/59] drm-dyndbg: adapt DRM to invoke
 DYNAMIC_DEBUG_CLASSMAP_PARAM
Date: Thu, 20 Mar 2025 12:52:15 -0600
Message-ID: <20250320185238.447458-38-jim.cromie@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250320185238.447458-1-jim.cromie@gmail.com>
References: <20250320185238.447458-1-jim.cromie@gmail.com>
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

Invoke DYNAMIC_DEBUG_CLASSMAP_PARAM to hook drm.debug (__drm_debug) to the
DRM_UT_* classmap, replacing the ad-hoc wiring previously doing it.

Add DRM_CLASSMAP_* adapter macros to selectively use
DYNAMIC_DEBUG_CLASSMAP_* when DRM_USE_DYNAMIC_DEBUG=y is configured.

Signed-off-by: Jim Cromie <jim.cromie@gmail.com>
---
 drivers/gpu/drm/drm_print.c | 8 ++------
 include/drm/drm_print.h     | 4 ++++
 2 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/drm_print.c b/drivers/gpu/drm/drm_print.c
index a3b70d104afa..46d53fe30204 100644
--- a/drivers/gpu/drm/drm_print.c
+++ b/drivers/gpu/drm/drm_print.c
@@ -69,12 +69,8 @@ DRM_CLASSMAP_DEFINE(drm_debug_classes, DD_CLASS_TYPE_DISJOINT_BITS,
 		    "DRM_UT_DP",
 		    "DRM_UT_DRMRES");
 
-static struct ddebug_class_param drm_debug_bitmap = {
-	.bits = &__drm_debug,
-	.flags = "p",
-	.map = &drm_debug_classes,
-};
-module_param_cb(debug, &param_ops_dyndbg_classes, &drm_debug_bitmap, 0600);
+DRM_CLASSMAP_PARAM_REF(debug, __drm_debug, drm_debug_classes, p);
+
 #endif
 
 void __drm_puts_coredump(struct drm_printer *p, const char *str)
diff --git a/include/drm/drm_print.h b/include/drm/drm_print.h
index e86ebb716b4c..8758449491b8 100644
--- a/include/drm/drm_print.h
+++ b/include/drm/drm_print.h
@@ -144,9 +144,13 @@ enum drm_debug_category {
 #ifdef CONFIG_DRM_USE_DYNAMIC_DEBUG
 #define DRM_CLASSMAP_DEFINE(...)    DYNAMIC_DEBUG_CLASSMAP_DEFINE(__VA_ARGS__)
 #define DRM_CLASSMAP_USE(name)      DYNAMIC_DEBUG_CLASSMAP_USE(name)
+#define DRM_CLASSMAP_PARAM_REF(...) DYNAMIC_DEBUG_CLASSMAP_PARAM_REF(__VA_ARGS__)
+#define DRM_CLASSMAP_PARAM(...)     DYNAMIC_DEBUG_CLASSMAP_PARAM(__VA_ARGS__)
 #else
 #define DRM_CLASSMAP_DEFINE(...)
 #define DRM_CLASSMAP_USE(name)
+#define DRM_CLASSMAP_PARAM_REF(...)
+#define DRM_CLASSMAP_PARAM(...)
 #endif
 
 static inline bool drm_debug_enabled_raw(enum drm_debug_category category)
-- 
2.49.0

