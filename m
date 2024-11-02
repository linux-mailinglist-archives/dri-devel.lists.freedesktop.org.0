Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C79339B9B9F
	for <lists+dri-devel@lfdr.de>; Sat,  2 Nov 2024 01:47:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D03E510E0FE;
	Sat,  2 Nov 2024 00:47:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="gDwMM43W";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com
 [209.85.214.174])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E912F10E0FE;
 Sat,  2 Nov 2024 00:47:35 +0000 (UTC)
Received: by mail-pl1-f174.google.com with SMTP id
 d9443c01a7336-20bb39d97d1so23596325ad.2; 
 Fri, 01 Nov 2024 17:47:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1730508455; x=1731113255; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=rKbz4vSUus6EYp9VxKs8/XhL54cjrUbDh/ERsiQ6PtM=;
 b=gDwMM43WJCKfCQGgExYl4UnpvVF7OjmgY5nSQx0fDttdDfwQySG+gVAxuUJtS3XQZP
 H1LvFWuVYqOAHl+J8Ggz0ZIq7QXiXatOJe44q0BIAQ50Kpp6n5/zjMg412I8LFZOdP7e
 Caj9ihvSt9a8qWuoAEeZwrlCe+DnOYFzK5WTSsCl+0qQ/4ytRt//FpZrFb6ArWyXCulU
 KK1El8Hj3jZ5nbijiKwepBIhFd7eeIvvnBL8wFxRmqJudgYYMcsNiiba8xfrA56at1r0
 A+9u0bKnvAzsYqORnFQZqSFXvOZTlLse9ts2IuBdhcGFcDMELYGEbdQ51StxG8eMz2Tb
 EE7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1730508455; x=1731113255;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=rKbz4vSUus6EYp9VxKs8/XhL54cjrUbDh/ERsiQ6PtM=;
 b=qRM7cCL60MjVaHOJspoUWMvF/79U1lGJWVIlGjfrmboZGUaP9wAOzM3Ci+ggvcKXif
 xf88e1LpmwLUpVEWijVTfzd7UTjIZooObZWxgzGCRF0fpq6x1m87ZdkCan0PrVV1d3r/
 5ARgX/ut47es7RmMje98ueZD+D9QpPfKaiOjE9Vqwp8gwNDaLfvSAzy2bQAYpEI6uwc/
 3MeogfPGG6r7S/G60Zhh0b+fjoidw/LA/sD7rMBVWjeygBxifZHEUEG/nnR044lZiO4N
 iGhP6/3sK96xfoveWOa2QJhMjV5s1Nyke4Ma0xp88bXjPFvN8q1WcW2Muzv9FB45H6pp
 0Y2w==
X-Forwarded-Encrypted: i=1;
 AJvYcCVSCgsZtAXczUW9nEBUM77ZYUSaCSjdO0oemEa9sAk1hzPdSOQOIZXrVC4KFUdjZZfIfkxmUIp5/f0=@lists.freedesktop.org,
 AJvYcCXAXzDdSTDcf7yYlTWxaJjQE8DdECpW7U4f16drF6GN2rL8BmfQT1mtDpdQeD6o68mqWh6erqfSBJ4=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwC/9CJotkdnWAkaC/Nt06V67t4DOQeueUUGjz0qNceAxd4LJeG
 9ci4UwX0FEYUfcsx+5BbRmZOBto3TDXF4so2r5hSsPti1jPnZhuo
X-Google-Smtp-Source: AGHT+IGfT+QrJhbzaGTno6I8tz8KNSs8v9qGiYh0kUt05lcdKhZ8kcN06zRDkuNtCztnf0KF3rr1yw==
X-Received: by 2002:a17:902:ce83:b0:20c:d578:d712 with SMTP id
 d9443c01a7336-210f770832bmr161707145ad.59.1730508455235; 
 Fri, 01 Nov 2024 17:47:35 -0700 (PDT)
Received: from gye-ThinkPad-T590.. ([59.16.200.168])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-2e92fa0f6edsm5642971a91.1.2024.11.01.17.47.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 01 Nov 2024 17:47:34 -0700 (PDT)
From: Gyeyoung Baek <gye976@gmail.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>,
 =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>
Cc: Gyeyoung Baek <gye976@gmail.com>, intel-xe@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: [PATCH v3] drm/xe: Fix build error for XE_IOCTL_DBG macro
Date: Sat,  2 Nov 2024 09:47:22 +0900
Message-Id: <20241102004722.124772-1-gye976@gmail.com>
X-Mailer: git-send-email 2.34.1
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

if CONFIG_DRM_USE_DYNAMIC_DEBUG is set,
'drm_dbg' function is replaced with '__dynamic_func_call_cls',
which is replaced with a do while statement.
so in the previous code, there are the following build errors.

include/linux/dynamic_debug.h:221:58: error: expected expression before ‘do’
  221 | #define __dynamic_func_call_cls(id, cls, fmt, func, ...) do {   \
      |                                                          ^~
include/linux/dynamic_debug.h:248:9: note: in expansion of macro ‘__dynamic_func_call_cls’
  248 |         __dynamic_func_call_cls(__UNIQUE_ID(ddebug), cls, fmt, func, ##__VA_ARGS__)
      |         ^~~~~~~~~~~~~~~~~~~~~~~
include/drm/drm_print.h:425:9: note: in expansion of macro ‘_dynamic_func_call_cls’
  425 |         _dynamic_func_call_cls(cat, fmt, __drm_dev_dbg,         \
      |         ^~~~~~~~~~~~~~~~~~~~~~
include/drm/drm_print.h:504:9: note: in expansion of macro ‘drm_dev_dbg’
  504 |         drm_dev_dbg((drm) ? (drm)->dev : NULL, DRM_UT_DRIVER, fmt, ##__VA_ARGS__)
      |         ^~~~~~~~~~~
include/drm/drm_print.h:522:33: note: in expansion of macro ‘drm_dbg_driver’
  522 | #define drm_dbg(drm, fmt, ...)  drm_dbg_driver(drm, fmt, ##__VA_ARGS__)
      |                                 ^~~~~~~~~~~~~~
drivers/gpu/drm/xe/xe_macros.h:14:21: note: in expansion of macro ‘drm_dbg’
   14 |         ((cond) && (drm_dbg(&(xe)->drm, \
      |                     ^~~~~~~
drivers/gpu/drm/xe/xe_bo.c:2029:13: note: in expansion of macro ‘XE_IOCTL_DBG’
 2029 |         if (XE_IOCTL_DBG(xe, !gem_obj))

the problem is that,
XE_IOCTL_DBG uses this function for conditional expr.

so I fix the expr to be compatible with the do while statement,
by referring to "https://gcc.gnu.org/onlinedocs/gcc/Statement-Exprs.html".

v2: I modified this to print when only cond is true.
v3: Modify to evaluate cond only once.

Signed-off-by: Gyeyoung Baek <gye976@gmail.com>
---
 drivers/gpu/drm/xe/xe_macros.h | 14 ++++++++------
 1 file changed, 8 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_macros.h b/drivers/gpu/drm/xe/xe_macros.h
index daf56c846d03..b956acbe4000 100644
--- a/drivers/gpu/drm/xe/xe_macros.h
+++ b/drivers/gpu/drm/xe/xe_macros.h
@@ -10,9 +10,11 @@
 
 #define XE_WARN_ON WARN_ON
 
-#define XE_IOCTL_DBG(xe, cond) \
-	((cond) && (drm_dbg(&(xe)->drm, \
-			    "Ioctl argument check failed at %s:%d: %s", \
-			    __FILE__, __LINE__, #cond), 1))
-
-#endif
+#define XE_IOCTL_DBG(xe, cond) ({					\
+	int cond__ = !!(cond);						\
+	if (cond__)                                           		\
+		drm_dbg(&(xe)->drm,                                    	\
+			"Ioctl argument check failed at %s:%d: %s",	\
+			__FILE__, __LINE__, #cond);                    	\
+	cond__;                                                        	\
+})
-- 
2.34.1

