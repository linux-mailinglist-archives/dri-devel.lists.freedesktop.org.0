Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FAD09B2038
	for <lists+dri-devel@lfdr.de>; Sun, 27 Oct 2024 21:13:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4194110E0FF;
	Sun, 27 Oct 2024 20:12:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="K3nzAmxr";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com
 [209.85.216.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 155AB10E041;
 Sun, 27 Oct 2024 04:58:39 +0000 (UTC)
Received: by mail-pj1-f52.google.com with SMTP id
 98e67ed59e1d1-2e56750bb0dso2346023a91.0; 
 Sat, 26 Oct 2024 21:58:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1730005118; x=1730609918; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=rGcsHrcwLS5rbJAr8cWgtD+JmSxKpAfNabdsn2Sm574=;
 b=K3nzAmxrWyFGfTGxNN7J3ompVfLrz2SKtQkq8TiD9wpc7G3lecTFHYGUpldoWLz02s
 py2Tlff/Hb7aKdsMkT3JcDf8CaDhGv+F7WJbsSrikouls4uqltgsMkcGcaZnfzJwRp6+
 KN3iCN2AUFeqiwKQTSu2a2JnT7hWkZeLG93z4fSqjbvCbtHig9dOHED8QJbeMjbFx6/y
 p5+d9sBh/cr2nITC+EBI6hSk3tOSixQIUT7BRSbbGdjQHhGkGIvd4HIsNxllyd2vkmTW
 G+3UfGglNlwSrpqANAa4jbhAneHwlOEZMgRQiMnY3KX7iBO6xAi7wlxCFk6QGbpAM2/J
 si1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1730005118; x=1730609918;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=rGcsHrcwLS5rbJAr8cWgtD+JmSxKpAfNabdsn2Sm574=;
 b=Vc5kDaigzZJBJ7xy5LCnC/rgE5nN2Adlfk1EQrVAMOTG5jsXFyPncgdDhxSDGdk3Ih
 XgbxwgkI7da7b2ax30AYsGWAMJ5uT6+Eem9XaE61S9IcZonRCUs0bvK39s0vaMLIMZMA
 5fUNKuxu0Apui0s3gMsemIYghvrfYEk9B8u+PQJvfnFJ0wOhOICLDuNj2U8GpUPCqp/Z
 gMHvJh/Im5lRadmQLd/bu1Ty+sH/YPkv8oUgY/Et9OX/WOwJPpFp7smopXGrh/zaTf1U
 cL6cj4vr4xqYwln2Ct1QCvPfu27FxSK76KvpZyKOq0oeb0/IGuoOE7fz5P4dWyGZEYYg
 lCcQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCV/7CqWBbFrZr8zxBNP1q8RFb3vQVNRvfmRWuxMBMWQuVxPMSrdSEZWkjLf/7C2OLL+e9IEN/YMmhk=@lists.freedesktop.org,
 AJvYcCVHBb4pOr55Dqv5sb3K+Zul1Vmh99s6dMG5HHnvvJZeQ9TgpGil5vdMbpYKUH82fnZ3NsRakeTG4jw=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwpkFAkXX8+vhsi3MtRZBj8LCoJaySNxFhAFD37sgrPjDRhRG4G
 6g4hJUekG2+NbBHwZtLiZs7TSzr7nPzsXU1Xl7OBt+Mn67hhOPkU
X-Google-Smtp-Source: AGHT+IHseJFxwF1uwMouwoVCFWM1YHzALcbP58rShHb5pBCj+o0tfLLl2KH1C/uR4GdJ9JZhP1kl9g==
X-Received: by 2002:a17:90a:ca0f:b0:2e2:cd22:b083 with SMTP id
 98e67ed59e1d1-2e8f0d4dfbcmr5359887a91.0.1730005118430; 
 Sat, 26 Oct 2024 21:58:38 -0700 (PDT)
Received: from gye-ThinkPad-T590.. ([39.120.225.141])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-2e8e3771e64sm4338817a91.50.2024.10.26.21.58.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 26 Oct 2024 21:58:38 -0700 (PDT)
From: Gyeyoung Baek <gye976@gmail.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>,
 Oded Gabbay <ogabbay@kernel.org>,
 =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>
Cc: Gyeyoung Baek <gye976@gmail.com>, intel-xe@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: [PATCH] drm/xe: Fix build error for XE_IOCTL_DBG macro
Date: Sun, 27 Oct 2024 13:57:52 +0900
Message-Id: <20241027045752.10530-1-gye976@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Sun, 27 Oct 2024 20:12:56 +0000
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

In the previous code, there is build error.
if CONFIG_DRM_USE_DYNAMIC_DEBUG is set,
'drm_dbg' function is replaced with '__dynamic_func_call_cls',
which is replaced with a do while statement.

The problem is that,
XE_IOCTL_DBG uses this function for conditional expression.

so I fix the expression to be compatible with the do while statement,
by referring to "https://gcc.gnu.org/onlinedocs/gcc/Statement-Exprs.html".

Signed-off-by: Gyeyoung Baek <gye976@gmail.com>
---
 drivers/gpu/drm/xe/xe_macros.h | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_macros.h b/drivers/gpu/drm/xe/xe_macros.h
index daf56c846d03..58a9d1e33502 100644
--- a/drivers/gpu/drm/xe/xe_macros.h
+++ b/drivers/gpu/drm/xe/xe_macros.h
@@ -11,8 +11,8 @@
 #define XE_WARN_ON WARN_ON
 
 #define XE_IOCTL_DBG(xe, cond) \
-	((cond) && (drm_dbg(&(xe)->drm, \
-			    "Ioctl argument check failed at %s:%d: %s", \
-			    __FILE__, __LINE__, #cond), 1))
+	({drm_dbg(&(xe)->drm, \
+		"Ioctl argument check failed at %s:%d: %s", \
+		__FILE__, __LINE__, #cond); (cond); })
 
 #endif
-- 
2.34.1

