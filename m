Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 914A37E89DF
	for <lists+dri-devel@lfdr.de>; Sat, 11 Nov 2023 09:33:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 06A5F10E259;
	Sat, 11 Nov 2023 08:33:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-x830.google.com (mail-qt1-x830.google.com
 [IPv6:2607:f8b0:4864:20::830])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5E4A310E259
 for <dri-devel@lists.freedesktop.org>; Sat, 11 Nov 2023 08:33:46 +0000 (UTC)
Received: by mail-qt1-x830.google.com with SMTP id
 d75a77b69052e-41cc75c55f0so32543311cf.1
 for <dri-devel@lists.freedesktop.org>; Sat, 11 Nov 2023 00:33:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1699691625; x=1700296425; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Tduwgwv0y4OQ/7MZGtzARJqzqu828fYBun4lpQ9eTRY=;
 b=B/RRcHQMTM/OiMGQISzDsyLjUnZ+fckz2ydPnX3hnF6jESmdONZoRXoYKU0OV5rE0A
 m53wYr8XFdEoKVcqMRf7Ya0NZsBGmXLh722HMNIsHe8Lh3Ql2svhcXR24q2ZboTjfdE4
 3XFNESIoxfKxwnWzRuLG3+UHpEZx9me3a2ECGDHCe01eO0EgNKZgBFsKYv0j0vAHitB2
 6YB0lnICMFzII/aBeEvE7Yxh2tjp+LKf2aQttxgeQSYa65mhoX6CP4aY4J6I8q1O5CfC
 VHHIhdlSO6cElJDqgqmML65aJX+aXLOLoqX4xdb17vAT+UATOC8xng9FwQA2CMtsPh1p
 L4Fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1699691625; x=1700296425;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Tduwgwv0y4OQ/7MZGtzARJqzqu828fYBun4lpQ9eTRY=;
 b=w9ImSu3sYnnf4G55Lq5Azc95R2X+VDo4qGlB5fU+D9qUZaCG2Az76iIrxyD7I1kjxb
 Oswe2CIpUYP+7Cg276R9lt7egw/lELwDx25lGg9DTLV8Xbyk4WmvRx/j4ruy6Uk/RQh6
 9EkJNbKo4Rr/850sqDqytkAYGHyGgg99OctXo38Du5kvjl8NyLO5ezK1+92GdosLKFVU
 0mfhVErzMWiAdTU8ZeMndbCgaBjB8h6W9HFdai3jKr5WyrcEEgw7WK4rygR6BCQGXJXs
 jHeYBHTyoGj3uZwyBYa0Hsa5NaY33y5RGkrMLFwe3t14yiR7FQu+FXJcgfLYvmeaFqza
 2MPg==
X-Gm-Message-State: AOJu0YypX716xzAPOnN+riQFcakLvkXEaNUSLgOMlqiquhFlfNBDNpah
 gcKxnjv/0Mu5iXRq3TCRdV8=
X-Google-Smtp-Source: AGHT+IFP8jVsyh3pzqhpFC+WkP1kdgT/s3dBF46AAF/9+3dSkc1kSm25/bx4x8e5dp3zUfrrCt+vGA==
X-Received: by 2002:ad4:5502:0:b0:66d:953e:226d with SMTP id
 pz2-20020ad45502000000b0066d953e226dmr6259395qvb.26.1699691625330; 
 Sat, 11 Nov 2023 00:33:45 -0800 (PST)
Received: from localhost.localdomain ([76.65.20.140])
 by smtp.gmail.com with ESMTPSA id
 lg10-20020a056214548a00b0066d1b4ce863sm457406qvb.31.2023.11.11.00.33.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 11 Nov 2023 00:33:45 -0800 (PST)
From: Luben Tuikov <ltuikov89@gmail.com>
To: javierm@redhat.com
Subject: [PATCH] Revert "drm/sched: Define pr_fmt() for DRM using pr_*()"
Date: Sat, 11 Nov 2023 03:33:28 -0500
Message-ID: <20231111083327.18607-2-ltuikov89@gmail.com>
X-Mailer: git-send-email 2.42.1
In-Reply-To: <87leb4ae6z.fsf@minerva.mail-host-address-is-not-set>
References: <87leb4ae6z.fsf@minerva.mail-host-address-is-not-set>
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
Cc: dri-devel@lists.freedesktop.org, ltuikov89@gmail.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From Jani:
The drm_print.[ch] facilities use very few pr_*() calls directly. The
users of pr_*() calls do not necessarily include <drm/drm_print.h> at
all, and really don't have to.

Even the ones that do include it, usually have <linux/...> includes
first, and <drm/...> includes next. Notably, <linux/kernel.h> includes
<linux/printk.h>.

And, of course, <linux/printk.h> defines pr_fmt() itself if not already
defined.

No, it's encouraged not to use pr_*() at all, and prefer drm device
based logging, or device based logging.

This reverts commit 36245bd02e88e68ac5955c2958c968879d7b75a9.

Signed-off-by: Luben Tuikov <ltuikov89@gmail.com>
Link: https://patchwork.freedesktop.org/patch/msgid/878r75wzm9.fsf@intel.com
---
 include/drm/drm_print.h | 14 --------------
 1 file changed, 14 deletions(-)

diff --git a/include/drm/drm_print.h b/include/drm/drm_print.h
index e8fe60d0eb8783..a93a387f8a1a15 100644
--- a/include/drm/drm_print.h
+++ b/include/drm/drm_print.h
@@ -26,20 +26,6 @@
 #ifndef DRM_PRINT_H_
 #define DRM_PRINT_H_
 
-/* Define this before including linux/printk.h, so that the format
- * string in pr_*() macros is correctly set for DRM. If a file wants
- * to define this to something else, it should do so before including
- * this header file.
- *
- * It is encouraged code using pr_err() to prefix their format with
- * the string "*ERROR* ", to make it easier to scan kernel logs. For
- * instance,
- *   pr_err("*ERROR* <the rest of your format string here>", args).
- */
-#ifndef pr_fmt
-#define pr_fmt(fmt) "[drm] " fmt
-#endif
-
 #include <linux/compiler.h>
 #include <linux/printk.h>
 #include <linux/seq_file.h>

base-commit: 540527b1385fb203cc4513ca838b4de60bbbc49a
-- 
2.42.1

