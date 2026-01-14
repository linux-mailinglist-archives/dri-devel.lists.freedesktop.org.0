Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 54532D1C072
	for <lists+dri-devel@lfdr.de>; Wed, 14 Jan 2026 03:00:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A10CA10E5BB;
	Wed, 14 Jan 2026 02:00:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="GAYic5nF";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-f41.google.com (mail-ot1-f41.google.com
 [209.85.210.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EE8DE10E5B4
 for <dri-devel@lists.freedesktop.org>; Wed, 14 Jan 2026 02:00:19 +0000 (UTC)
Received: by mail-ot1-f41.google.com with SMTP id
 46e09a7af769-7c701097a75so5022337a34.3
 for <dri-devel@lists.freedesktop.org>; Tue, 13 Jan 2026 18:00:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1768356019; x=1768960819; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=FrG1isq17Lyb0bJFCu5jKcbVF320nGGDAVNnMWnzxZY=;
 b=GAYic5nFgGM0EutazyOKRzumrq3holl+ofwXHg2hTrcq8zzmL3O/MZWRCAAGAjSTsN
 9gUEj/UjxC4ab2Vi2wsppLCWHcN9bcZ7eSEk2z+nFZ/6rU4xQS3P+0crBcE0gFZMujMr
 TEstGb8tLS5NPbtdoIO32+cKXoU1fEWmbM9XMA9YtDo9U/3H1yqt86IhiYyMctg1BwSd
 924rdnn5R7Ua1W0EqhCJkrSDf2o/nhL0zKOZXkU18HAryy6pbOtNxoEKEe4b5LtxkHl4
 iTMZARpFNmZCkMDcVMynolAjx0LsJAvuYGelc4LXcv7KwUUoC2j0PkXOoOi1T1dTKyU+
 /uBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1768356019; x=1768960819;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=FrG1isq17Lyb0bJFCu5jKcbVF320nGGDAVNnMWnzxZY=;
 b=uviRueb+g/R1AFex6QaOsnH7iPfDuW3kJEtqskFcX9bP3b1TMQ290PTiXFzc0e8aeh
 WYvlGfFw73XQ2aOB3r8ABkJVUyHBlHhfAnzrU5oTYdUEnjej8fmKX3RQF4kv3TnpRJ7X
 OO7mq86tW+eL0X8HdJVNQQ0CIvwRLSdKxBSRrfYfV+dVdo3lECNV6ty9C2RqZhuOh+po
 56VD8QZQT8117bFG8lQc2ZSNHqHpt0Z7exdvTikshtvthxd2sK0JUo9OS89rtUTs78kg
 AqGiQRM9moLbrQRelKPrEBsX/SSH1oMFV26IRj09KDPG9kwqbbzbc2yAUc0EaZgMUmXu
 nhYw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWM1aGmUPmcvfv2pdFTLpgWwzG1FM56vE9GCaDWDnHMmGRMEaI0PteLL4IU8Hz5eC2rwCbhQHvf1zY=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yx3EXQ5muQwPGcIOPxO6Kw1tvlmBrHaRd0+coI3gNuirWFVtKVg
 PWDfWL1MEKZl2Cny3BTOf6oRzPWteguj2sVliXmSdTVVOSP+Aqm1WTpG
X-Gm-Gg: AY/fxX7U7D0ngFN4pi0s/AFBDL7L6uCqg4DdZGlquZ7u0I4mPdrkTQrD7vRRv3pT+e1
 /y32Mu2CsRFQ+rlNqcwGqMXFb81ohMOkNj6WxgyHqyYKLNtRw/Z1NRyueIDE+jx2HCLEqdQfr0+
 RORygsQKy6uCN3mF2k/8bsbXlTt60N9SAJD8ChVPBT3oTcfUJCX90ng5WgJICp3d2Mq3LiBqd8l
 3G9SaoUOQ6gzTRN3Rax1j+E8+/LinsiecIbl2RhuvycMbjTi/KeDwM7YMSvWtreMV9pQCwhKNYB
 fW8gC8b/YkjYdYouddrBdk3Zz7Dl6lxH21TjrSttX/r3Fum/G7PpB3LZ7keE9+r3zXyfH4hbUZH
 Hbok/TOaILuvCz+z50RkCGXbbuyGKopP+zNDaJhTVc+cUI1OzlJKXYf2lmBZf0+m0C6BfoHnhQC
 SrzyxkkEy8ewrPQYLtGCgdLZSikj+PXBzu0osn
X-Received: by 2002:a05:6830:449f:b0:7c7:2cd3:5baa with SMTP id
 46e09a7af769-7cfc8bab822mr907389a34.34.1768356019220; 
 Tue, 13 Jan 2026 18:00:19 -0800 (PST)
Received: from frodo (c-98-38-17-99.hsd1.co.comcast.net. [98.38.17.99])
 by smtp.googlemail.com with ESMTPSA id
 46e09a7af769-7cfc9894ae0sm731526a34.25.2026.01.13.18.00.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 13 Jan 2026 18:00:18 -0800 (PST)
From: Jim Cromie <jim.cromie@gmail.com>
To: gregkh@linuxfoundation.org,
	linux-kernel@vger.kernel.org
Cc: Jim Cromie <jim.cromie@gmail.com>, Jason Baron <jbaron@akamai.com>,
 =?UTF-8?q?=C5=81ukasz=20Bartosik?= <ukaszb@chromium.org>,
 Louis Chauvet <louis.chauvet@bootlin.com>,
 Bagas Sanjaya <bagasdotme@gmail.com>, Dave Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, dri-devel@lists.freedesktop.org,
 Petr Mladek <pmladek@suse.com>, Shuah Khan <skhan@linuxfoundation.org>,
 linux-doc@vger.kernel.org, Steven Rostedt <rostedt@goodmis.org>,
 "Liam R. Howlett" <Liam.Howlett@oracle.com>
Subject: [PATCH v8 24/31] dyndbg-test: change do_prints testpoint to accept a
 loopct
Date: Tue, 13 Jan 2026 18:57:40 -0700
Message-ID: <20260114015815.1565725-25-jim.cromie@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260114015815.1565725-1-jim.cromie@gmail.com>
References: <20260114015815.1565725-1-jim.cromie@gmail.com>
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

echo 1000 > /sys/module/test_dynamic_debug/parameters/do_prints

This allows its use as a scriptable load generator, to generate
dynamic-prefix-emits for flag combinations vs undecorated messages.
This will make it easy to assess the cost of the prefixing.

Reading the ./do_prints node also prints messages (once) to the-log.

Signed-off-by: Jim Cromie <jim.cromie@gmail.com>
---
 lib/test_dynamic_debug.c | 32 +++++++++++++++++++++-----------
 1 file changed, 21 insertions(+), 11 deletions(-)

diff --git a/lib/test_dynamic_debug.c b/lib/test_dynamic_debug.c
index b2bdfdfb6ba1..fa81177e8089 100644
--- a/lib/test_dynamic_debug.c
+++ b/lib/test_dynamic_debug.c
@@ -29,18 +29,25 @@
 
 #include <linux/module.h>
 
-/* re-gen output by reading or writing sysfs node: do_prints */
-
-static void do_prints(void); /* device under test */
+/* re-trigger debug output by reading or writing sysfs node: do_prints */
+static void do_prints(unsigned int); /* device under test */
 static int param_set_do_prints(const char *instr, const struct kernel_param *kp)
 {
-	do_prints();
+	int rc;
+	unsigned int ct;
+
+	rc = kstrtouint(instr, 0, &ct);
+	if (rc) {
+		pr_err("expecting numeric input, using 1 instead\n");
+		ct = 1;
+	}
+	do_prints(ct);
 	return 0;
 }
 static int param_get_do_prints(char *buffer, const struct kernel_param *kp)
 {
-	do_prints();
-	return scnprintf(buffer, PAGE_SIZE, "did do_prints\n");
+	do_prints(1);
+	return scnprintf(buffer, PAGE_SIZE, "did 1 do_prints\n");
 }
 static const struct kernel_param_ops param_ops_do_prints = {
 	.set = param_set_do_prints,
@@ -191,17 +198,20 @@ static void do_levels(void)
 	prdbg(V7);
 }
 
-static void do_prints(void)
+static void do_prints(unsigned int ct)
 {
-	pr_debug("do_prints:\n");
-	do_cats();
-	do_levels();
+	/* maybe clamp this */
+	pr_debug("do-prints %d times:\n", ct);
+	for (; ct; ct--) {
+		do_cats();
+		do_levels();
+	}
 }
 
 static int __init test_dynamic_debug_init(void)
 {
 	pr_debug("init start\n");
-	do_prints();
+	do_prints(1);
 	pr_debug("init done\n");
 	return 0;
 }
-- 
2.52.0

