Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F85B961C7A
	for <lists+dri-devel@lfdr.de>; Wed, 28 Aug 2024 05:03:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C76F110E461;
	Wed, 28 Aug 2024 03:03:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="PoxgFd3i";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com
 [209.85.214.174])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5DD1310E461
 for <dri-devel@lists.freedesktop.org>; Wed, 28 Aug 2024 03:03:45 +0000 (UTC)
Received: by mail-pl1-f174.google.com with SMTP id
 d9443c01a7336-201fba05363so52067995ad.3
 for <dri-devel@lists.freedesktop.org>; Tue, 27 Aug 2024 20:03:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1724814225; x=1725419025; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=5dwC82d7KQL5pIEF6T6/bNHtBQAMogTq8DRZCJ210sw=;
 b=PoxgFd3iipq9e+nDYWJkg49/p7t+F1Bjb9PY77z5xJ2f+AqBv4Wz/fWGm10SRUgdcQ
 yWnPPmzW6zC8/s4k4HIsf70IC3Sl8/jXv2X8qgKBg8Ur9I0ogAGJ2Vv+ZxVQf59rCoIL
 pMNlJP7F/pdVPZ5f+zZMRHDxWdqr54wX7ZPDW+QM15nJyGSEpimhxOVAjf5tyO/nVyng
 Wl1KOzp4cBQRwTGddhy0Cpgc9B/h/YDyxyCFe66U06J5ooQOLCzbHWG9iOxo47pBemMy
 BaSUxur6q/pbBLRQ7ABMP9jbjN85MkLSBvibdk+lM9Y0NHHrja8AQ1sOsDuxUZ980uly
 hOAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1724814225; x=1725419025;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=5dwC82d7KQL5pIEF6T6/bNHtBQAMogTq8DRZCJ210sw=;
 b=MVXCan+uzyQhX4RxQq2ORFsVko9oDJEW4wKpncBF4+K8HobzuI6UTlKzseCsl3ZPOE
 sjOSzJiW+zFR8Chn5JUuWgHYnnspTE7HedQTYLvQLfM9aL+0KSrUlc2k5A3EtIbFUkIR
 cC1W7Tv0x3epWLMTDfc8LJtHha8dO8zw+IyRlugetPGICPfWfTi0BShyfycBnXP6tdzy
 Si4zDMvrc3CqAi0djguYbEW1UUQq9SxxyYbCE5Ztse2IF8Y/qZsxQBo/bRu8t90saVQj
 rNmI+vUcPXrytYzN4WSEyXOfy78BcP3M1JEIf3VC/69SpYgfpQR6etCc2j//dHkLFUyR
 BGBQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUOuDQGWV3WX+GZeEUbcORvqZXuaaEHyYIMcRHNmuLImsMtoqF+bFmBXu7PCrgAHILHiNjLaeiAxwg=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzSM1YunL8zcPfjO+KhyeaWGUh8jDf32tmtnUW7U/VACqh/nl8M
 4g5yPw8VmjrPRFGF/qA/8P3ch7o4e6meqj2F+CwIExjxYGfUhu0n
X-Google-Smtp-Source: AGHT+IEc8gy1oBP9Tt27kWFVV2/sdUfpEnu0CJVUYvciPK7kLGNgdrFqezJmS8xsximWyUWY+TcSOg==
X-Received: by 2002:a17:90a:d490:b0:2ca:7636:2217 with SMTP id
 98e67ed59e1d1-2d8440a87edmr695434a91.2.1724814224691; 
 Tue, 27 Aug 2024 20:03:44 -0700 (PDT)
Received: from localhost.localdomain ([39.144.104.43])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-2d8445db8f6sm317977a91.1.2024.08.27.20.03.36
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 27 Aug 2024 20:03:44 -0700 (PDT)
From: Yafang Shao <laoar.shao@gmail.com>
To: akpm@linux-foundation.org
Cc: torvalds@linux-foundation.org, alx@kernel.org, justinstitt@google.com,
 ebiederm@xmission.com, alexei.starovoitov@gmail.com, rostedt@goodmis.org,
 catalin.marinas@arm.com, penguin-kernel@i-love.sakura.ne.jp,
 linux-mm@kvack.org, linux-fsdevel@vger.kernel.org,
 linux-trace-kernel@vger.kernel.org, audit@vger.kernel.org,
 linux-security-module@vger.kernel.org, selinux@vger.kernel.org,
 bpf@vger.kernel.org, netdev@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Yafang Shao <laoar.shao@gmail.com>,
 Alexander Viro <viro@zeniv.linux.org.uk>,
 Christian Brauner <brauner@kernel.org>, Jan Kara <jack@suse.cz>,
 Kees Cook <keescook@chromium.org>, Matus Jokay <matus.jokay@stuba.sk>,
 "Serge E. Hallyn" <serge@hallyn.com>
Subject: [PATCH v8 1/8] Get rid of __get_task_comm()
Date: Wed, 28 Aug 2024 11:03:14 +0800
Message-Id: <20240828030321.20688-2-laoar.shao@gmail.com>
X-Mailer: git-send-email 2.30.1 (Apple Git-130)
In-Reply-To: <20240828030321.20688-1-laoar.shao@gmail.com>
References: <20240828030321.20688-1-laoar.shao@gmail.com>
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

We want to eliminate the use of __get_task_comm() for the following
reasons:

- The task_lock() is unnecessary
  Quoted from Linus [0]:
  : Since user space can randomly change their names anyway, using locking
  : was always wrong for readers (for writers it probably does make sense
  : to have some lock - although practically speaking nobody cares there
  : either, but at least for a writer some kind of race could have
  : long-term mixed results

- The BUILD_BUG_ON() doesn't add any value
  The only requirement is to ensure that the destination buffer is a valid
  array.

- Zeroing is not necessary in current use cases
  To avoid confusion, we should remove it. Moreover, not zeroing could
  potentially make it easier to uncover bugs. If the caller needs a
  zero-padded task name, it should be explicitly handled at the call site.

Suggested-by: Linus Torvalds <torvalds@linux-foundation.org>
Link: https://lore.kernel.org/all/CAHk-=wivfrF0_zvf+oj6==Sh=-npJooP8chLPEfaFV0oNYTTBA@mail.gmail.com [0]
Link: https://lore.kernel.org/all/CAHk-=whWtUC-AjmGJveAETKOMeMFSTwKwu99v7+b6AyHMmaDFA@mail.gmail.com/
Suggested-by: Alejandro Colomar <alx@kernel.org>
Link: https://lore.kernel.org/all/2jxak5v6dfxlpbxhpm3ey7oup4g2lnr3ueurfbosf5wdo65dk4@srb3hsk72zwq
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
 include/linux/sched.h | 32 ++++++++++++++++++++++++++------
 kernel/kthread.c      |  2 +-
 4 files changed, 28 insertions(+), 18 deletions(-)

diff --git a/fs/exec.c b/fs/exec.c
index 50e76cc633c4..8a23171bc3c3 100644
--- a/fs/exec.c
+++ b/fs/exec.c
@@ -1264,16 +1264,6 @@ static int unshare_sighand(struct task_struct *me)
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
index f8d150343d42..c40b95a79d80 100644
--- a/include/linux/sched.h
+++ b/include/linux/sched.h
@@ -1096,9 +1096,12 @@ struct task_struct {
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
 
@@ -1914,10 +1917,27 @@ static inline void set_task_comm(struct task_struct *tsk, const char *from)
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
+ * - Why not use strscpy_pad()?
+ *   While strscpy_pad() prevents writing garbage past the NUL terminator, which
+ *   is useful when using the task name as a key in a hash map, most use cases
+ *   don't require this. Zero-padding might confuse users if it’s unnecessary,
+ *   and not zeroing might even make it easier to expose bugs. If you need a
+ *   zero-padded task name, please handle that explicitly at the call site.
+ *
+ * - ARRAY_SIZE() can help ensure that @buf is indeed an array.
+ */
 #define get_task_comm(buf, tsk) ({			\
-	BUILD_BUG_ON(sizeof(buf) != TASK_COMM_LEN);	\
-	__get_task_comm(buf, sizeof(buf), tsk);		\
+	strscpy(buf, (tsk)->comm, ARRAY_SIZE(buf));	\
+	buf;						\
 })
 
 #ifdef CONFIG_SMP
diff --git a/kernel/kthread.c b/kernel/kthread.c
index f7be976ff88a..7d001d033cf9 100644
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

