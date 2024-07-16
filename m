Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2776B93314D
	for <lists+dri-devel@lfdr.de>; Tue, 16 Jul 2024 21:02:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 53B1210E873;
	Tue, 16 Jul 2024 19:02:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="ceUxbTXJ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-f52.google.com (mail-io1-f52.google.com
 [209.85.166.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CDBBB10E82A;
 Tue, 16 Jul 2024 18:59:05 +0000 (UTC)
Received: by mail-io1-f52.google.com with SMTP id
 ca18e2360f4ac-8046f65536dso6071739f.1; 
 Tue, 16 Jul 2024 11:59:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1721156345; x=1721761145; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=y6blOBSVnowRsDepJzeTCLiu7QXKUuExri+0RrzbqrM=;
 b=ceUxbTXJeWK8qSxp7MttHauEyrx1z86KkAtXzTNBis/6aI/jpSlKYUjl6hbVvZpIAz
 oQGz+LgGMFnIfStolHVYMiaNV+p5lQ2VId/jxIMmj5mzrYH0BKvEn7D9bHpLgP2WZDas
 fOL1H7s4HbwbcGb9C1IYk6Cn1EjmsqVlEhRCo5cNTgOPrZo15M7IWfNLA6cRJk3HBmgk
 mlS3CjBAdFrwnPv93kNepQt0E7bk/Wij2kcT1uKBhp0wyI7J7lyTSmGYSUv7kdpOHRRZ
 elbJn0l90QpWjb5PWqxivDfKoaF2U+W0nETH7nRLnb29HgjqaTKn0BdWAYkxj6lmd8xN
 FDMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1721156345; x=1721761145;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=y6blOBSVnowRsDepJzeTCLiu7QXKUuExri+0RrzbqrM=;
 b=XQtbUxb9BKsoQ7xuR2MuVuAvBtv35mTgeV6rJx7U8JCEmsC0fgN0Ar83NWbS9tnyjV
 3NrqC6o0fy4ctDGR2bp/X+K6xFsGCWLlEebo+qj32NQlTqSAV+QcP1BKeNa/x3QotKLq
 rpcaWufN0r6G6cgYn7dwDIL/sTGI2B4uLmx4T8WCoOPmSUuTSJ2zCG+bI8Qi4RPmzFEc
 Ibkbvs8toZoQrlOV3cmu5DHI9Mp+Bb+AZXg6pz1/OiWeq3qd4qwH7ZBnAh9sZiWMwNJK
 XOKweOjnzWg2AlMezsqCetNcykB9pupxYChQMQFkfueQDc85+jiVi0h5sni3qq5PlNXj
 NwOg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXRVhOffbeh892Args+u+fdLliudKLFWvyypBxbAs0Z0InqATeKwRVeXuL+3BIDYzrfWiiXZAzToPDiCYOj/zlxJXXyv19FbMTTimBkPThMyYJmsms/z6oaqQo8zEGCVHv0niUJ2t6vDuNtIL/7kWJS4NJbSC25JV6iFmOsTXwbbw9uDcI/6s+PH27gzARe/hpIny6l1BjAFmg+JTE3NjxxcOCKfQCUBVDaajnogB8qvOilwiU=
X-Gm-Message-State: AOJu0YzSVFxrR0w2zTkIxop/mTaBxl9EWbI2/IUhuvkg6jj6COTGaQGu
 kl8yyO6P2N0a2CPEXgtcON8obfsFgXax6SxT1nm+5pqXiPH/lshB
X-Google-Smtp-Source: AGHT+IHupF215B8HUHSFyCfq+EhhBdI8n2Uwkool8jFM4Uueq2pJrHXQgCTgI0PTVZNLug7iKTYbjA==
X-Received: by 2002:a05:6602:14c5:b0:803:85ba:3cf9 with SMTP id
 ca18e2360f4ac-816c38c0218mr44418339f.10.1721156345102; 
 Tue, 16 Jul 2024 11:59:05 -0700 (PDT)
Received: from frodo.. (c-73-78-62-130.hsd1.co.comcast.net. [73.78.62.130])
 by smtp.googlemail.com with ESMTPSA id
 8926c6da1cb9f-4c210f23f1csm75301173.102.2024.07.16.11.59.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 16 Jul 2024 11:59:04 -0700 (PDT)
From: Jim Cromie <jim.cromie@gmail.com>
To: linux-kernel@vger.kernel.org, jbaron@akamai.com,
 gregkh@linuxfoundation.org, daniel.vetter@ffwll.ch,
 tvrtko.ursulin@linux.intel.com, jani.nikula@intel.com,
 ville.syrjala@linux.intel.com
Cc: ukaszb@chromium.org, linux@rasmusvillemoes.dk, joe@perches.com,
 mcgrof@kernel.org, seanpaul@chromium.org, robdclark@gmail.com,
 groeck@google.com, yanivt@google.com, bleung@google.com,
 linux-doc@vger.kernel.org, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, intel-gvt-dev@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, kernelnewbies@kernelnewbies.org,
 Jim Cromie <jim.cromie@gmail.com>
Subject: [PATCH v9-resend 31/54] drm-dyndbg: adapt DRM to invoke
 DYNDBG_CLASSMAP_PARAM
Date: Tue, 16 Jul 2024 12:57:43 -0600
Message-ID: <20240716185806.1572048-32-jim.cromie@gmail.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240716185806.1572048-1-jim.cromie@gmail.com>
References: <20240716185806.1572048-1-jim.cromie@gmail.com>
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

Invoke DYNDBG_CLASSMAP_PARAM to hook drm.debug (__drm_debug) to the
DRM_UT_* classmap, replacing the ad-hoc wiring previously doing it.

Signed-off-by: Jim Cromie <jim.cromie@gmail.com>
---
 drivers/gpu/drm/drm_print.c | 8 ++------
 include/drm/drm_print.h     | 6 ++++--
 2 files changed, 6 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/drm_print.c b/drivers/gpu/drm/drm_print.c
index 41f167082042..c7455f2076b4 100644
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
index b467ee67a281..aa3708c7b6d8 100644
--- a/include/drm/drm_print.h
+++ b/include/drm/drm_print.h
@@ -141,11 +141,13 @@ enum drm_debug_category {
 };
 
 #ifdef CONFIG_DRM_USE_DYNAMIC_DEBUG
-#define DRM_CLASSMAP_DEFINE(...) DYNDBG_CLASSMAP_DEFINE(__VA_ARGS__)
-#define DRM_CLASSMAP_USE(name)   DYNDBG_CLASSMAP_USE(name)
+#define DRM_CLASSMAP_DEFINE(...)    DYNDBG_CLASSMAP_DEFINE(__VA_ARGS__)
+#define DRM_CLASSMAP_USE(name)      DYNDBG_CLASSMAP_USE(name)
+#define DRM_CLASSMAP_PARAM_REF(...) DYNDBG_CLASSMAP_PARAM_REF(__VA_ARGS__)
 #else
 #define DRM_CLASSMAP_DEFINE(...)
 #define DRM_CLASSMAP_USE(name)
+#define DRM_CLASSMAP_PARAM_REF(...)
 #endif
 
 static inline bool drm_debug_enabled_raw(enum drm_debug_category category)
-- 
2.45.2

