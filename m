Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D50E1D215E
	for <lists+dri-devel@lfdr.de>; Wed, 13 May 2020 23:46:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3FF406EA83;
	Wed, 13 May 2020 21:46:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com
 [IPv6:2a00:1450:4864:20::441])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2FFD96EA82
 for <dri-devel@lists.freedesktop.org>; Wed, 13 May 2020 21:46:41 +0000 (UTC)
Received: by mail-wr1-x441.google.com with SMTP id s8so1301893wrt.9
 for <dri-devel@lists.freedesktop.org>; Wed, 13 May 2020 14:46:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=TfKn8VDcbN12HHO4rXlAfam9urpoqlI4Ytdxq1C4er8=;
 b=YX+eZmJtV4n3vqvaSCnL7AuNTFlrtKlqRafgBuSigEZKXsW+NK+DNJbb7BbuIjS3pm
 UBvPnyl7T2oQAggoEMo9CYG4MdZdfzeHBml46xZ5RdbSnsA7Rl5FR7ZxWd0br9x6dmIp
 19WTGxm1exy9NejR5dDowkUcwRnH+4cRo8bxihjFrz+weg9zEmmXFUjBRZThDvNjuIuK
 +NsHnt9IlA7/0QRhor5ulzq6fs1NSwga1ULEcm3jzpVfwyBCBTSlxRSR+aLzXqiwKJzM
 skT8YLZnpCzNRUKza/ORfg60JOnxdJQL4vfhC0aEDZfGSfk9xqxK/eDhPdOjhyrALwmZ
 1aXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=TfKn8VDcbN12HHO4rXlAfam9urpoqlI4Ytdxq1C4er8=;
 b=p84UyfTkVRyNU8m+jZqeh9TItIIbiZUEub8pdmeNHqit/2aHeRm1/9mJ4sei+pGEw2
 Q1l43/6b86LHrFXXUCCP9uHAfn46PPG9LUnrClDROWYypizFbG3nWgp4+nHprPj+yl9X
 mi0JiuNMSPdwtKAdtfiZdV1cvAFUGpu29m9qyM+tZYNfuwoWKyEQTBqs5+xZ3ERJvkwQ
 rHB/Td/K9/8//iQf0/Q1TtrERZtU/I7z96xMm3VkJiswaLn4tRnn8+zbrkVf3YV1T0dh
 d5cUJbvsiM5YBkGl9oHC0CDMSJrNo+HmhzEoAXImhgorA1PGh6LwouJd4wkxwx43M9zn
 M23A==
X-Gm-Message-State: AOAM5328ZDjNeNj1EaWhZOBxDRjKAF5/k+j5nCscUN0HUSP0aNi3/TaB
 uESWczhmjK/9fymaeOqBGGsNeBtz
X-Google-Smtp-Source: ABdhPJz5QtC3MqV1tUOgmZ0m63gShlNKlmwamCmHNJa/WJ6WUNdM7QuFVw8HcPb9XwxDlNRS/VQUlQ==
X-Received: by 2002:a5d:4b04:: with SMTP id v4mr1633224wrq.182.1589406399558; 
 Wed, 13 May 2020 14:46:39 -0700 (PDT)
Received: from localhost.localdomain
 (cpc91192-cmbg18-2-0-cust374.5-4.cable.virginm.net. [80.6.113.119])
 by smtp.gmail.com with ESMTPSA id m23sm1699734wmg.45.2020.05.13.14.46.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 13 May 2020 14:46:39 -0700 (PDT)
From: Emil Velikov <emil.l.velikov@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 02/11] tty/sysrq: constify the sysrq API
Date: Wed, 13 May 2020 22:43:42 +0100
Message-Id: <20200513214351.2138580-2-emil.l.velikov@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200513214351.2138580-1-emil.l.velikov@gmail.com>
References: <20200513214351.2138580-1-emil.l.velikov@gmail.com>
MIME-Version: 1.0
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
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, emil.l.velikov@gmail.com,
 linux-kernel@vger.kernel.org, Jiri Slaby <jslaby@suse.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The user is not supposed to thinker with the underlying sysrq_key_op.
Make that explicit by adding a handful of const notations.

Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Jiri Slaby <jslaby@suse.com>
Cc: linux-kernel@vger.kernel.org
Signed-off-by: Emil Velikov <emil.l.velikov@gmail.com>
---
Please keep me in the CC list, as I'm not subscribed to the list.

IMHO it would be better if this gets merged this via the tty tree.
---
 Documentation/admin-guide/sysrq.rst | 10 +++++-----
 drivers/tty/sysrq.c                 | 16 ++++++++--------
 include/linux/sysrq.h               | 16 ++++++++--------
 3 files changed, 21 insertions(+), 21 deletions(-)

diff --git a/Documentation/admin-guide/sysrq.rst b/Documentation/admin-guide/sysrq.rst
index a46209f4636c..e6424d8c5846 100644
--- a/Documentation/admin-guide/sysrq.rst
+++ b/Documentation/admin-guide/sysrq.rst
@@ -231,13 +231,13 @@ prints help, and C) an action_msg string, that will print right before your
 handler is called. Your handler must conform to the prototype in 'sysrq.h'.
 
 After the ``sysrq_key_op`` is created, you can call the kernel function
-``register_sysrq_key(int key, struct sysrq_key_op *op_p);`` this will
+``register_sysrq_key(int key, const struct sysrq_key_op *op_p);`` this will
 register the operation pointed to by ``op_p`` at table key 'key',
 if that slot in the table is blank. At module unload time, you must call
-the function ``unregister_sysrq_key(int key, struct sysrq_key_op *op_p)``, which
-will remove the key op pointed to by 'op_p' from the key 'key', if and only if
-it is currently registered in that slot. This is in case the slot has been
-overwritten since you registered it.
+the function ``unregister_sysrq_key(int key, const struct sysrq_key_op *op_p)``,
+which will remove the key op pointed to by 'op_p' from the key 'key', if and
+only if it is currently registered in that slot. This is in case the slot has
+been overwritten since you registered it.
 
 The Magic SysRQ system works by registering key operations against a key op
 lookup table, which is defined in 'drivers/tty/sysrq.c'. This key table has
diff --git a/drivers/tty/sysrq.c b/drivers/tty/sysrq.c
index 1741134cabca..091c64a3cef0 100644
--- a/drivers/tty/sysrq.c
+++ b/drivers/tty/sysrq.c
@@ -518,9 +518,9 @@ static int sysrq_key_table_key2index(int key)
 /*
  * get and put functions for the table, exposed to modules.
  */
-static struct sysrq_key_op *__sysrq_get_key_op(int key)
+static const struct sysrq_key_op *__sysrq_get_key_op(int key)
 {
-        struct sysrq_key_op *op_p = NULL;
+        const struct sysrq_key_op *op_p = NULL;
         int i;
 
 	i = sysrq_key_table_key2index(key);
@@ -530,7 +530,7 @@ static struct sysrq_key_op *__sysrq_get_key_op(int key)
         return op_p;
 }
 
-static void __sysrq_put_key_op(int key, struct sysrq_key_op *op_p)
+static void __sysrq_put_key_op(int key, const struct sysrq_key_op *op_p)
 {
         int i = sysrq_key_table_key2index(key);
 
@@ -540,7 +540,7 @@ static void __sysrq_put_key_op(int key, struct sysrq_key_op *op_p)
 
 void __handle_sysrq(int key, bool check_mask)
 {
-	struct sysrq_key_op *op_p;
+	const struct sysrq_key_op *op_p;
 	int orig_log_level;
 	int orig_suppress_printk;
 	int i;
@@ -1063,8 +1063,8 @@ int sysrq_toggle_support(int enable_mask)
 }
 EXPORT_SYMBOL_GPL(sysrq_toggle_support);
 
-static int __sysrq_swap_key_ops(int key, struct sysrq_key_op *insert_op_p,
-                                struct sysrq_key_op *remove_op_p)
+static int __sysrq_swap_key_ops(int key, const struct sysrq_key_op *insert_op_p,
+                                const struct sysrq_key_op *remove_op_p)
 {
 	int retval;
 
@@ -1087,13 +1087,13 @@ static int __sysrq_swap_key_ops(int key, struct sysrq_key_op *insert_op_p,
 	return retval;
 }
 
-int register_sysrq_key(int key, struct sysrq_key_op *op_p)
+int register_sysrq_key(int key, const struct sysrq_key_op *op_p)
 {
 	return __sysrq_swap_key_ops(key, op_p, NULL);
 }
 EXPORT_SYMBOL(register_sysrq_key);
 
-int unregister_sysrq_key(int key, struct sysrq_key_op *op_p)
+int unregister_sysrq_key(int key, const struct sysrq_key_op *op_p)
 {
 	return __sysrq_swap_key_ops(key, NULL, op_p);
 }
diff --git a/include/linux/sysrq.h b/include/linux/sysrq.h
index 9b51f98e5f60..479028391c08 100644
--- a/include/linux/sysrq.h
+++ b/include/linux/sysrq.h
@@ -30,10 +30,10 @@
 #define SYSRQ_ENABLE_RTNICE	0x0100
 
 struct sysrq_key_op {
-	void (*handler)(int);
-	char *help_msg;
-	char *action_msg;
-	int enable_mask;
+	void (* const handler)(int);
+	const char * const help_msg;
+	const char * const action_msg;
+	const int enable_mask;
 };
 
 #ifdef CONFIG_MAGIC_SYSRQ
@@ -45,8 +45,8 @@ struct sysrq_key_op {
 
 void handle_sysrq(int key);
 void __handle_sysrq(int key, bool check_mask);
-int register_sysrq_key(int key, struct sysrq_key_op *op);
-int unregister_sysrq_key(int key, struct sysrq_key_op *op);
+int register_sysrq_key(int key, const struct sysrq_key_op *op);
+int unregister_sysrq_key(int key, const struct sysrq_key_op *op);
 extern struct sysrq_key_op *__sysrq_reboot_op;
 
 int sysrq_toggle_support(int enable_mask);
@@ -62,12 +62,12 @@ static inline void __handle_sysrq(int key, bool check_mask)
 {
 }
 
-static inline int register_sysrq_key(int key, struct sysrq_key_op *op)
+static inline int register_sysrq_key(int key, const struct sysrq_key_op *op)
 {
 	return -EINVAL;
 }
 
-static inline int unregister_sysrq_key(int key, struct sysrq_key_op *op)
+static inline int unregister_sysrq_key(int key, const struct sysrq_key_op *op)
 {
 	return -EINVAL;
 }
-- 
2.25.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
