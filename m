Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3411493EB98
	for <lists+dri-devel@lfdr.de>; Mon, 29 Jul 2024 04:47:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A450110E2B7;
	Mon, 29 Jul 2024 02:47:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="czY8711t";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com
 [209.85.216.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 52A4810E2C7
 for <dri-devel@lists.freedesktop.org>; Mon, 29 Jul 2024 02:47:19 +0000 (UTC)
Received: by mail-pj1-f41.google.com with SMTP id
 98e67ed59e1d1-2cb5243766dso2083990a91.0
 for <dri-devel@lists.freedesktop.org>; Sun, 28 Jul 2024 19:47:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1722221239; x=1722826039; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=/Cv3tjdGG97YCwgOlXgEBsrvlHrrgiTFYRDjMKYVYxc=;
 b=czY8711tLze7bidMeH7D3Aae8ApbKvyMhKZHHvdGigZmIKs+mWYRmXWHFYikhKsaV+
 49W90mEn5KJZzTNC6wvY8Zc2T1dNUzq+dUXq7kSB1lLTZR6x1JHJec+2QmJTip3PGCFt
 F7qVaKvRf/uVMd+TMdvZdjq16qFVNuSwN1M+qLDcNV8oCILYdICfxl0wEIm7tsiNoR74
 jheIJWBThmSbMXMxj3Tpw7OgFA9yZ0mC27vvDFGlfUAIM+Ko6emuSBFHX4OTR3W+OfXq
 4fYIguevp3uReieub9W8GuCTvhOlYZE/84chmScBQtuuEepJT4S6qhOHa78K9FR0gOiA
 6C1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1722221239; x=1722826039;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=/Cv3tjdGG97YCwgOlXgEBsrvlHrrgiTFYRDjMKYVYxc=;
 b=gW+q80/sVjuMy6ZKW0Lfx4EQHGXYp8qeiL07OGniTEOttFdVSXEdWryIV9oyB5SZuL
 +QOkjYQuH5tX4eFeOqjBC7nNk3O4gHtCLqCJCpNrbdXcKqKWue0aepC+7/f/ABLtbywb
 OMDD4Lxj+QxbE6wfBRuD/oIyH12Of9YoDgYjcSk6We3Ut7Sg1frQq3xhr4ltKPq7GrtD
 ZLniMtlKddubNUEv5hp6vmVzngmwZixYHU2TepMtZzS4rpnJLSyIFubtPqUeG6nXFbkf
 wymW4GP9yXGQBtyrsMRKaij+12IgCGKxq4t8RBcZV7UjORAvJa5ojuY9Z6tNaEyc65Eh
 F8Qw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXi3vZfb3aANVRuf8vaFQOrM0FTuk+wmYGfoXP0VAVsTlVIAJ4t3g/HiPraycohojfnzNtNVNaDeUWh9bijBYN+5c4Mk4c91VcFbOjV8dg/
X-Gm-Message-State: AOJu0YwL1XzmuezAFCE+yR9xme4RA5ROok2Qyh0gFWwtMpLbp53K/Ln7
 X2/+qkjKcH0YHZQijLyRAFe6TF9BDkkP3qxFinCLpO0xsmVCbH+0
X-Google-Smtp-Source: AGHT+IFj28K/vh2Wo2JpPTzYf/GZmJskWb9fJ0b0sRrDd73+gDsWQ9AUVDG1zRV3AS7zIGO4lNszYQ==
X-Received: by 2002:a17:90b:4ecc:b0:2c9:6d07:18f4 with SMTP id
 98e67ed59e1d1-2cf7e71b7b6mr7068182a91.35.1722221238743; 
 Sun, 28 Jul 2024 19:47:18 -0700 (PDT)
Received: from localhost.localdomain ([223.104.210.31])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-2cf28c55a38sm7332247a91.10.2024.07.28.19.46.30
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Sun, 28 Jul 2024 19:47:18 -0700 (PDT)
From: Yafang Shao <laoar.shao@gmail.com>
To: akpm@linux-foundation.org
Cc: torvalds@linux-foundation.org, ebiederm@xmission.com,
 alexei.starovoitov@gmail.com, rostedt@goodmis.org, catalin.marinas@arm.com,
 penguin-kernel@i-love.sakura.ne.jp, linux-mm@kvack.org,
 linux-fsdevel@vger.kernel.org, linux-trace-kernel@vger.kernel.org,
 audit@vger.kernel.org, linux-security-module@vger.kernel.org,
 selinux@vger.kernel.org, bpf@vger.kernel.org, netdev@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Yafang Shao <laoar.shao@gmail.com>,
 Masami Hiramatsu <mhiramat@kernel.org>,
 Mathieu Desnoyers <mathieu.desnoyers@efficios.com>
Subject: [PATCH v4 09/11] tracing: Replace strncpy() with __get_task_comm()
Date: Mon, 29 Jul 2024 10:37:17 +0800
Message-Id: <20240729023719.1933-10-laoar.shao@gmail.com>
X-Mailer: git-send-email 2.30.1 (Apple Git-130)
In-Reply-To: <20240729023719.1933-1-laoar.shao@gmail.com>
References: <20240729023719.1933-1-laoar.shao@gmail.com>
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

Using __get_task_comm() to read the task comm ensures that the name is
always NUL-terminated, regardless of the source string. This approach also
facilitates future extensions to the task comm.

Signed-off-by: Yafang Shao <laoar.shao@gmail.com>
Acked-by: Masami Hiramatsu (Google) <mhiramat@kernel.org>
Cc: Steven Rostedt <rostedt@goodmis.org>
Cc: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>
---
 kernel/trace/trace.c             | 2 +-
 kernel/trace/trace_events_hist.c | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/kernel/trace/trace.c b/kernel/trace/trace.c
index 578a49ff5c32..ce94a86154a2 100644
--- a/kernel/trace/trace.c
+++ b/kernel/trace/trace.c
@@ -1907,7 +1907,7 @@ __update_max_tr(struct trace_array *tr, struct task_struct *tsk, int cpu)
 	max_data->critical_start = data->critical_start;
 	max_data->critical_end = data->critical_end;
 
-	strncpy(max_data->comm, tsk->comm, TASK_COMM_LEN);
+	__get_task_comm(max_data->comm, TASK_COMM_LEN, tsk);
 	max_data->pid = tsk->pid;
 	/*
 	 * If tsk == current, then use current_uid(), as that does not use
diff --git a/kernel/trace/trace_events_hist.c b/kernel/trace/trace_events_hist.c
index 6ece1308d36a..721d4758a79f 100644
--- a/kernel/trace/trace_events_hist.c
+++ b/kernel/trace/trace_events_hist.c
@@ -1599,7 +1599,7 @@ static inline void save_comm(char *comm, struct task_struct *task)
 		return;
 	}
 
-	strncpy(comm, task->comm, TASK_COMM_LEN);
+	__get_task_comm(comm, TASK_COMM_LEN, task);
 }
 
 static void hist_elt_data_free(struct hist_elt_data *elt_data)
-- 
2.43.5

