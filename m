Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 89C36992FCC
	for <lists+dri-devel@lfdr.de>; Mon,  7 Oct 2024 16:49:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 07B1D10E3BB;
	Mon,  7 Oct 2024 14:49:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="Np3mfFZa";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com
 [209.85.210.181])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5A80F10E3BB
 for <dri-devel@lists.freedesktop.org>; Mon,  7 Oct 2024 14:49:45 +0000 (UTC)
Received: by mail-pf1-f181.google.com with SMTP id
 d2e1a72fcca58-71df0dbee46so1465365b3a.0
 for <dri-devel@lists.freedesktop.org>; Mon, 07 Oct 2024 07:49:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1728312585; x=1728917385; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=oVEk6SmaURyo42RvRGYBr53delaAcBEjfSHuuD+Cst4=;
 b=Np3mfFZaQrHvVRwVY2DlyIl1ltCpMWKO9Htysag3KN+AbJWCLfFKZzJ+NNatlo1FWT
 bBhpiq5oU4sZy+xDCwk35QKRjb2xsrxlXFsYRmlXJR7EPWYklyw7BU0l5iT6+hAFjskN
 GrjogjBfECXLnlCOy5C6J2S5zTHPDzsGZQiUDDfR1PK/dsYbWijT42TIBKzjoWkGdpKa
 zlNvSV9963yDa1DFI+Q+1fLI9SYKvnf8gp8kfCpHr/wOd0LyY63L0zZinooKittih0u5
 t/ico8rPr0yxxxf2IB9549A4IkfUUjMkdi3vjdZpYQmP9bgbVzOYIKl1C4AYn5+UF2Rp
 +9og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1728312585; x=1728917385;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=oVEk6SmaURyo42RvRGYBr53delaAcBEjfSHuuD+Cst4=;
 b=NWDmImyj5jhUxAmjGxJRmC5GHIJGtjJdvH5MI0I3rrq1rP1lC6qEbg4mmUHboI/vfl
 XXAM/E9hKZwgxfakwPAmcqwvQZsG8Yg5RAExjy6r6GC4SVhRtNMsRfinoawzMHIpg46O
 zPszP0hBkSwtm7gegiuFDckjGVsK9ldpfkQsaxm7hg2D2LruWiL1UyvsUIND8dto0dIm
 0KwlQ48XuCRxI2s8NgX8c56eZy5vpxYMCCe4Eed0+mXbtFX3WrnGuHs0XhkkQMW9MjQ8
 mUu2eevzUh6xf3BtakfDOJt/5EXLmIycT4fb4XB/MH8QydTaKRzCACe/ydeI6ULcycXq
 2PrQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCU8/dkpgLw2k8mMMF26pF1itjtSsb5yXgTc8Nh7RY30UYMcG9VkbQSfvmtL7DceGW3o/rTD/p85kLI=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyfZ5oEcRmkEMlKrcjNsXbprrrqNooLKk3cBxAC7I0DBLJ5rsX5
 68H7OA4dUhrH7+A9JO9SNLperCt/+0gAiw1ke3CyO74+GIbf1R9A
X-Google-Smtp-Source: AGHT+IFysx44ym7xeNZ29ZQx56P8LK073YLR3FEq6ZYjPgOvQStiRImQUgMUmAdR1iJQTcm5/XW64g==
X-Received: by 2002:a05:6a00:2eaa:b0:718:e162:7374 with SMTP id
 d2e1a72fcca58-71de239f5e6mr18318586b3a.5.1728312584814; 
 Mon, 07 Oct 2024 07:49:44 -0700 (PDT)
Received: from localhost.localdomain ([223.104.210.43])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-71df0d7cf82sm4466432b3a.200.2024.10.07.07.49.32
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 07 Oct 2024 07:49:44 -0700 (PDT)
From: Yafang Shao <laoar.shao@gmail.com>
To: akpm@linux-foundation.org
Cc: torvalds@linux-foundation.org, keescook@chromium.org, alx@kernel.org,
 justinstitt@google.com, ebiederm@xmission.com,
 alexei.starovoitov@gmail.com, rostedt@goodmis.org, catalin.marinas@arm.com,
 penguin-kernel@i-love.sakura.ne.jp, linux-mm@kvack.org,
 linux-fsdevel@vger.kernel.org, linux-trace-kernel@vger.kernel.org,
 audit@vger.kernel.org, linux-security-module@vger.kernel.org,
 selinux@vger.kernel.org, bpf@vger.kernel.org, netdev@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Yafang Shao <laoar.shao@gmail.com>,
 Alexander Viro <viro@zeniv.linux.org.uk>,
 Christian Brauner <brauner@kernel.org>, Jan Kara <jack@suse.cz>,
 Matus Jokay <matus.jokay@stuba.sk>, "Serge E. Hallyn" <serge@hallyn.com>
Subject: [PATCH v9 1/7] Get rid of __get_task_comm()
Date: Mon,  7 Oct 2024 22:49:05 +0800
Message-Id: <20241007144911.27693-2-laoar.shao@gmail.com>
X-Mailer: git-send-email 2.30.1 (Apple Git-130)
In-Reply-To: <20241007144911.27693-1-laoar.shao@gmail.com>
References: <20241007144911.27693-1-laoar.shao@gmail.com>
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

We want to eliminate the use of __get_task_comm() for the following
reasons:

- The task_lock() is unnecessary
  Quoted from Linus [0]:
  : Since user space can randomly change their names anyway, using locking
  : was always wrong for readers (for writers it probably does make sense
  : to have some lock - although practically speaking nobody cares there
  : either, but at least for a writer some kind of race could have
  : long-term mixed results

Suggested-by: Linus Torvalds <torvalds@linux-foundation.org>
Link: https://lore.kernel.org/all/CAHk-=wivfrF0_zvf+oj6==Sh=-npJooP8chLPEfaFV0oNYTTBA@mail.gmail.com [0]
Link: https://lore.kernel.org/all/CAHk-=whWtUC-AjmGJveAETKOMeMFSTwKwu99v7+b6AyHMmaDFA@mail.gmail.com/
Signed-off-by: Yafang Shao <laoar.shao@gmail.com>
Cc: Alexander Viro <viro@zeniv.linux.org.uk>
Cc: Christian Brauner <brauner@kernel.org>
Cc: Jan Kara <jack@suse.cz>
Cc: Eric Biederman <ebiederm@xmission.com>
Cc: Kees Cook <keescook@chromium.org>
Cc: Alexei Starovoitov <alexei.starovoitov@gmail.com>
Cc: Matus Jokay <matus.jokay@stuba.sk>
Cc: Alejandro Colomar <alx@kernel.org>
Cc: "Serge E. Hallyn" <serge@hallyn.com>
---
 fs/exec.c             | 10 ----------
 fs/proc/array.c       |  2 +-
 include/linux/sched.h | 28 ++++++++++++++++++++++------
 kernel/kthread.c      |  2 +-
 4 files changed, 24 insertions(+), 18 deletions(-)

diff --git a/fs/exec.c b/fs/exec.c
index 6c53920795c2..77364806b48d 100644
--- a/fs/exec.c
+++ b/fs/exec.c
@@ -1189,16 +1189,6 @@ static int unshare_sighand(struct task_struct *me)
 	return 0;
 }
 
-char *__get_task_comm(char *buf, size_t buf_size, struct task_struct *tsk)
-{
-	task_lock(tsk);
-	/* Always NUL terminated and zero-padded */
-	strscpy_pad(buf, tsk->comm, buf_size);
-	task_unlock(tsk);
-	return buf;
-}
-EXPORT_SYMBOL_GPL(__get_task_comm);
-
 /*
  * These functions flushes out all traces of the currently running executable
  * so that a new one can be started
diff --git a/fs/proc/array.c b/fs/proc/array.c
index 34a47fb0c57f..55ed3510d2bb 100644
--- a/fs/proc/array.c
+++ b/fs/proc/array.c
@@ -109,7 +109,7 @@ void proc_task_name(struct seq_file *m, struct task_struct *p, bool escape)
 	else if (p->flags & PF_KTHREAD)
 		get_kthread_comm(tcomm, sizeof(tcomm), p);
 	else
-		__get_task_comm(tcomm, sizeof(tcomm), p);
+		get_task_comm(tcomm, p);
 
 	if (escape)
 		seq_escape_str(m, tcomm, ESCAPE_SPACE | ESCAPE_SPECIAL, "\n\\");
diff --git a/include/linux/sched.h b/include/linux/sched.h
index e6ee4258169a..28f92c637abf 100644
--- a/include/linux/sched.h
+++ b/include/linux/sched.h
@@ -1121,9 +1121,12 @@ struct task_struct {
 	/*
 	 * executable name, excluding path.
 	 *
-	 * - normally initialized setup_new_exec()
-	 * - access it with [gs]et_task_comm()
-	 * - lock it with task_lock()
+	 * - normally initialized begin_new_exec()
+	 * - set it with set_task_comm()
+	 *   - strscpy_pad() to ensure it is always NUL-terminated and
+	 *     zero-padded
+	 *   - task_lock() to ensure the operation is atomic and the name is
+	 *     fully updated.
 	 */
 	char				comm[TASK_COMM_LEN];
 
@@ -1938,10 +1941,23 @@ static inline void set_task_comm(struct task_struct *tsk, const char *from)
 	__set_task_comm(tsk, from, false);
 }
 
-extern char *__get_task_comm(char *to, size_t len, struct task_struct *tsk);
+/*
+ * - Why not use task_lock()?
+ *   User space can randomly change their names anyway, so locking for readers
+ *   doesn't make sense. For writers, locking is probably necessary, as a race
+ *   condition could lead to long-term mixed results.
+ *   The strscpy_pad() in __set_task_comm() can ensure that the task comm is
+ *   always NUL-terminated and zero-padded. Therefore the race condition between
+ *   reader and writer is not an issue.
+ *
+ * - BUILD_BUG_ON() can help prevent the buf from being truncated.
+ *   Since the callers don't perform any return value checks, this safeguard is
+ *   necessary.
+ */
 #define get_task_comm(buf, tsk) ({			\
-	BUILD_BUG_ON(sizeof(buf) != TASK_COMM_LEN);	\
-	__get_task_comm(buf, sizeof(buf), tsk);		\
+	BUILD_BUG_ON(sizeof(buf) < TASK_COMM_LEN);	\
+	strscpy_pad(buf, (tsk)->comm);			\
+	buf;						\
 })
 
 #ifdef CONFIG_SMP
diff --git a/kernel/kthread.c b/kernel/kthread.c
index db4ceb0f503c..74d20f46fa30 100644
--- a/kernel/kthread.c
+++ b/kernel/kthread.c
@@ -101,7 +101,7 @@ void get_kthread_comm(char *buf, size_t buf_size, struct task_struct *tsk)
 	struct kthread *kthread = to_kthread(tsk);
 
 	if (!kthread || !kthread->full_name) {
-		__get_task_comm(buf, buf_size, tsk);
+		strscpy(buf, tsk->comm, buf_size);
 		return;
 	}
 
-- 
2.43.5

