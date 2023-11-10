Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 897567E75EE
	for <lists+dri-devel@lfdr.de>; Fri, 10 Nov 2023 01:27:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2F5AE10E39C;
	Fri, 10 Nov 2023 00:27:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-x72d.google.com (mail-qk1-x72d.google.com
 [IPv6:2607:f8b0:4864:20::72d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D6DF110E390
 for <dri-devel@lists.freedesktop.org>; Fri, 10 Nov 2023 00:27:19 +0000 (UTC)
Received: by mail-qk1-x72d.google.com with SMTP id
 af79cd13be357-778a20df8c3so96910885a.3
 for <dri-devel@lists.freedesktop.org>; Thu, 09 Nov 2023 16:27:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1699576038; x=1700180838; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=Eg3voEWuZGsTjvvpkk/ETmpl9G+VTaJQXPOBSXohJq8=;
 b=gpQDzP8cQuEO0Cjdhgdz6ojDzbvmQ1J9UzYkzJ9bbarJy1FbE6luh2O2O2CJAHWj1K
 OH8tg4xoq7p6aBNfri8Ni3RlBXBb21hB1CLqYdPYZSNDjELhiKrpaqj9OT/B0lBacdYw
 DXJWjvp+rUW7NUiD9z2G5V2NeQPjYI6xekR4aXVLXHo2bb/MX0BsuzGrcUfNb9q1iCSm
 f9mI9mMi/L6qYTDzx68MVNmskNXPLUvQe6pTM4BCd1WXoDAqEr0yJzwwSAMewExoQJZ/
 dZWJs6Ce2oS2LTEEo6jbPANI50C2PhIa35wq7YhkdK0osXW00vGT195Jybx9r0PN0ypv
 6ePw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1699576038; x=1700180838;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Eg3voEWuZGsTjvvpkk/ETmpl9G+VTaJQXPOBSXohJq8=;
 b=dp02GGbXqfJGuB0v3BiKbWjK4RKu+RQiwBU+YeQqpl4/EMpYwwrROwEZU9fuDcxgNl
 yixXzIAVZLDHBJCQf/AScHa74x2lYzGFGNwru3qGzZUwifY9c4YEMUd9DfD6Exdf/kL0
 vpZE+Ur/Y1RzGy465d8FsSZs1p24vcd0ec6/kyxp4drQSqRhe5lBxUf0hQHuBKEjxhDQ
 SXW7pvEtUVCvb6UtQ4fo7FOVgCqCUOC9C5Zt8ESj3nTVt4h7zE+GDlQcNBcXqgq0mnQ4
 rwchTNZhWDUvMzrGDFZ5hWD9Kg/2O4QhYOAI51jF/hSBF6XDWCmm2MPXx/67OOZtrBI1
 KOsg==
X-Gm-Message-State: AOJu0Yx0XgOcw/Yo1YSrKBQ9PH6V0Q2qOYomudXEhYhHJwETfG9jtQ3z
 VYeY9h2OErokcGqkNLAkfOqACfjCvrAGqxzrD4w=
X-Google-Smtp-Source: AGHT+IF31C585MJBHEGg7/u3g7HymoJwMQw423md7IcYSsMpHlzdL0FvPPYx9cKLEc6WgNm1X4o44g==
X-Received: by 2002:a05:620a:8907:b0:774:139a:e442 with SMTP id
 ql7-20020a05620a890700b00774139ae442mr7005940qkn.76.1699576038594; 
 Thu, 09 Nov 2023 16:27:18 -0800 (PST)
Received: from localhost.localdomain ([76.65.20.140])
 by smtp.gmail.com with ESMTPSA id
 z20-20020ae9c114000000b0076cb3690ae7sm313454qki.68.2023.11.09.16.27.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 09 Nov 2023 16:27:18 -0800 (PST)
From: Luben Tuikov <ltuikov89@gmail.com>
To: Direct Rendering Infrastructure - Development
 <dri-devel@lists.freedesktop.org>, Danilo Krummrich <dakr@redhat.com>
Subject: [PATCH] drm/sched: Define pr_fmt() for DRM using pr_*()
Date: Thu,  9 Nov 2023 19:27:00 -0500
Message-ID: <20231110002659.113208-2-ltuikov89@gmail.com>
X-Mailer: git-send-email 2.42.1
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
Cc: Luben Tuikov <ltuikov89@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Define pr_fmt() as "[drm] " for DRM code using pr_*() facilities, especially
when no devices are available. This makes it easier to browse kernel logs.

Signed-off-by: Luben Tuikov <ltuikov89@gmail.com>
---
 include/drm/drm_print.h | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/include/drm/drm_print.h b/include/drm/drm_print.h
index a93a387f8a1a15..e8fe60d0eb8783 100644
--- a/include/drm/drm_print.h
+++ b/include/drm/drm_print.h
@@ -26,6 +26,20 @@
 #ifndef DRM_PRINT_H_
 #define DRM_PRINT_H_
 
+/* Define this before including linux/printk.h, so that the format
+ * string in pr_*() macros is correctly set for DRM. If a file wants
+ * to define this to something else, it should do so before including
+ * this header file.
+ *
+ * It is encouraged code using pr_err() to prefix their format with
+ * the string "*ERROR* ", to make it easier to scan kernel logs. For
+ * instance,
+ *   pr_err("*ERROR* <the rest of your format string here>", args).
+ */
+#ifndef pr_fmt
+#define pr_fmt(fmt) "[drm] " fmt
+#endif
+
 #include <linux/compiler.h>
 #include <linux/printk.h>
 #include <linux/seq_file.h>

base-commit: f3123c2590005c5ff631653d31428e40cd10c618
-- 
2.42.1

