Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DA7509B9C53
	for <lists+dri-devel@lfdr.de>; Sat,  2 Nov 2024 03:22:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4BADF10E226;
	Sat,  2 Nov 2024 02:22:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="QT6DUo/+";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com
 [209.85.210.177])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EFBF910E226;
 Sat,  2 Nov 2024 02:22:22 +0000 (UTC)
Received: by mail-pf1-f177.google.com with SMTP id
 d2e1a72fcca58-7206304f93aso2408316b3a.0; 
 Fri, 01 Nov 2024 19:22:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1730514142; x=1731118942; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=bXcmHSC56/ByVBCx/WoZJC+GVyQ+I9bFtyJEnrciFRM=;
 b=QT6DUo/+TtUPWNB6fZkDr38AHQ1kxanHfY3kXl2WTMrbl9Koar38KNY5tN2KJCLrpf
 1GXiW3+ENdPSFeFjSpLNPBTC4zoOZ4yuneQqta15WwpImwNhh0WShmdIKy/JpnAcnWPH
 wb/UnZX/VpSY2WIDH1RqmTE0S0yChN5ZK2y9CQzkQfg76HQXDY63eXAwU/acmSOj/w/a
 nhydqVHCIqKndWYdKrdfQ9SDp0X8NVBacF8fFGrdlFRvLlmHru4+bG1hBGsrvi3Ka1Fy
 NesIkUkKOP8pCHuEWEPkB3GW/BApPq8lHn9xHIhNZYXOqGQNFyUcAtszqQIXpTIJREkZ
 9tKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1730514142; x=1731118942;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=bXcmHSC56/ByVBCx/WoZJC+GVyQ+I9bFtyJEnrciFRM=;
 b=aE8dnU8ydbr8AoKeShN1Oz0hKLGLNCwtufACaX/uHqkh9B05AQ4s9T1Mx0vOeIErn1
 Q5UUs2zd9833qMn0nE/rl9AO74ur1qu4CgbCUviA+9lcEufD1rpFfU37NLWa6LqBfsZP
 QXkKs+ySn9oGugBztH7V5ytySf0mz//6XKREgDzA6EBaU7qPBSRw9GxvjgjtjBRVsb6i
 q1o+N4RHBB9SdfOurfsTYXm1/GNWDVc+4AwOJZh0CS3Qv38o/FolUJl7aw1oiccFG+bT
 bQD0Ya1OtM/zHFcMGg8qwC5bZDIfKd4qRSUe2Sb5kaNXJ0cqXNcQWHvT9k64ey0N+Sib
 2WTg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUZRMZ32oT5As1J/YFwbpPkD7KtH3xaJN/iHMljijUKF3g3WRrz7HKspJORIbz+Z0FAHBwBKczdfcw=@lists.freedesktop.org,
 AJvYcCWc0uPV6qYJy04vcmC2EOZu+z0jvFDp3RqACDb+bQkgbVWQiDyciLjMNsVceYmQvQapxW8WZRsScE8=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yy5Ixtcuvpxeq0xvYu5RAEDIJOVDvt88/911IOKtPah3daJ3wgY
 yHYTfaFKnmW3VVQQFEUxovIT/TltoPggg/JKGjFEVVSdeNrh+lxP
X-Google-Smtp-Source: AGHT+IEHigW4MYYWdNAxbx5bIv2fu2U6puZvygq0xmtIkT7iCcQH7EHK42vEZXwu43CanE6Fs3xNPw==
X-Received: by 2002:a05:6a00:1746:b0:71e:fb4:6c98 with SMTP id
 d2e1a72fcca58-720c99dca77mr8600897b3a.23.1730514142299; 
 Fri, 01 Nov 2024 19:22:22 -0700 (PDT)
Received: from gye-ThinkPad-T590.. ([59.16.200.168])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-720bc205582sm3363387b3a.88.2024.11.01.19.22.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 01 Nov 2024 19:22:22 -0700 (PDT)
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
Subject: [PATCH v4] drm/xe: Fix build error for XE_IOCTL_DBG macro
Date: Sat,  2 Nov 2024 11:22:03 +0900
Message-Id: <20241102022204.155039-1-gye976@gmail.com>
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
v4: There was a mistake in v3, send this again.

Signed-off-by: Gyeyoung Baek <gye976@gmail.com>
---
 drivers/gpu/drm/xe/xe_macros.h | 12 ++++++++----
 1 file changed, 8 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_macros.h b/drivers/gpu/drm/xe/xe_macros.h
index daf56c846d03..51ac8faa8975 100644
--- a/drivers/gpu/drm/xe/xe_macros.h
+++ b/drivers/gpu/drm/xe/xe_macros.h
@@ -10,9 +10,13 @@
 
 #define XE_WARN_ON WARN_ON
 
-#define XE_IOCTL_DBG(xe, cond) \
-	((cond) && (drm_dbg(&(xe)->drm, \
-			    "Ioctl argument check failed at %s:%d: %s", \
-			    __FILE__, __LINE__, #cond), 1))
+#define XE_IOCTL_DBG(xe, cond) ({					\
+	int cond__ = !!(cond);						\
+	if (cond__)                                           		\
+		drm_dbg(&(xe)->drm,                                    	\
+			"Ioctl argument check failed at %s:%d: %s",	\
+			__FILE__, __LINE__, #cond);                    	\
+	cond__;                                                        	\
+})
 
 #endif
-- 
2.34.1

