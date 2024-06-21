Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 805B1911885
	for <lists+dri-devel@lfdr.de>; Fri, 21 Jun 2024 04:31:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C08DA10E24B;
	Fri, 21 Jun 2024 02:31:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="h7rrMcU4";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-f48.google.com (mail-ot1-f48.google.com
 [209.85.210.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 75E0D10E24B
 for <dri-devel@lists.freedesktop.org>; Fri, 21 Jun 2024 02:31:10 +0000 (UTC)
Received: by mail-ot1-f48.google.com with SMTP id
 46e09a7af769-6f980c89db8so801094a34.1
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Jun 2024 19:31:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1718937069; x=1719541869; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=nQwUpm7TadSQyuNlGOfh8JWtJNghSVDBcHtu3NLgdvg=;
 b=h7rrMcU4o7sknXi8YLyhgUijmMMX3ZsjLp8kUP0wZDn1f7D2aFvKP7QhkXOhxHZIGJ
 KHszLo6RC4m+FT/zuR2M4FZMUIKdaDSsy0Q8cYp+UOa3nn42/uhnjRq3semUZG+cZQMX
 QSaYUVMo2wcdXVaQCXzyOq9jpCutcWw5T6S1wDjZwfuENmyMztS46TDJIEuL1QJxdUBI
 Qj6SM2rnRxAwNgtgBrCf/fF51piXwjf9MjC6lv3Wi3plwDelWcAk2DWtQIUnyWpI+H4j
 y6qFmL24CGwAXMY4kYKMKus5U46gKBwvf1MELn6ZdzUTQKFke81wdttCo6bgXQW9BrUb
 w6cA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1718937069; x=1719541869;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=nQwUpm7TadSQyuNlGOfh8JWtJNghSVDBcHtu3NLgdvg=;
 b=mDKTewv0cLDftJ7BWhUUgRWhfjbzI2jBPWTCItto/+uIHzXuoyP03kfUgzuJILhfYX
 1hxTvjmdVUpdCq/j0Yq93p11wEneIBIviY9dc9EkSdfZR1aPzMHU9iJExdzdxOeOAoBv
 RY4PPLldJ8B1zyrohPUp34Mg6RsXV0KTNnbIrj8VyM9Cbs/LqXw1mCUEHKVWSUzSWjo5
 dRw1dUS6UaTXrWpUBycmAP3dKPkwsNTxub0d+NTE16HPNPfBW4CNDAisTEv2TlIrYfLz
 Kd0GfPDGCpqUtheqS76gjqFujnbvWBDid0oSMOHheKbyKcYQaerNhwcxHOPzST68s6Ny
 UtvQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCV7oT4E47r+pzxGysKqxxD/kOI+sKPiKSmvegRNFgVIMHdSsOE4nevPgzL+26da184whIuC1vzKwVxGHASowxSPQbF1oMMflTdXTzDWgFJq
X-Gm-Message-State: AOJu0YzSOisXrmBsVY+SBsDRzNpxKDG++1R0CJM53MKx0C1SUxKmDZS0
 3f078HMNQ9l2O3pcvMRfXlih+CSP7Y3IMVlColbILqZq1lzW8tM8
X-Google-Smtp-Source: AGHT+IF9RQI6I8fwWnu/VEcjE+HIUegV9PWFNk6TPRJqj9VSP13v0pKuFsE10NjsKk43i459GXxRWg==
X-Received: by 2002:a05:6870:b52c:b0:254:7a82:cb3f with SMTP id
 586e51a60fabf-25c94a2368bmr7837289fac.25.1718937069341; 
 Thu, 20 Jun 2024 19:31:09 -0700 (PDT)
Received: from localhost.localdomain ([39.144.105.24])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-706511944d2sm332488b3a.70.2024.06.20.19.30.57
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 20 Jun 2024 19:31:08 -0700 (PDT)
From: Yafang Shao <laoar.shao@gmail.com>
To: torvalds@linux-foundation.org
Cc: ebiederm@xmission.com, alexei.starovoitov@gmail.com, rostedt@goodmis.org,
 catalin.marinas@arm.com, akpm@linux-foundation.org,
 penguin-kernel@i-love.sakura.ne.jp, linux-mm@kvack.org,
 linux-fsdevel@vger.kernel.org, linux-trace-kernel@vger.kernel.org,
 audit@vger.kernel.org, linux-security-module@vger.kernel.org,
 selinux@vger.kernel.org, bpf@vger.kernel.org, netdev@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Yafang Shao <laoar.shao@gmail.com>,
 Paul Moore <paul@paul-moore.com>, James Morris <jmorris@namei.org>,
 "Serge E. Hallyn" <serge@hallyn.com>,
 Stephen Smalley <stephen.smalley.work@gmail.com>,
 Ondrej Mosnacek <omosnace@redhat.com>
Subject: [PATCH v3 03/11] security: Replace memcpy() with __get_task_comm()
Date: Fri, 21 Jun 2024 10:29:51 +0800
Message-Id: <20240621022959.9124-4-laoar.shao@gmail.com>
X-Mailer: git-send-email 2.30.1 (Apple Git-130)
In-Reply-To: <20240621022959.9124-1-laoar.shao@gmail.com>
References: <20240621022959.9124-1-laoar.shao@gmail.com>
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

Quoted from Linus [0]:

  selinux never wanted a lock, and never wanted any kind of *consistent*
  result, it just wanted a *stable* result.

Using __get_task_comm() to read the task comm ensures that the name is
always NUL-terminated, regardless of the source string. This approach also
facilitates future extensions to the task comm.

Signed-off-by: Yafang Shao <laoar.shao@gmail.com>
LINK: https://lore.kernel.org/all/CAHk-=wivfrF0_zvf+oj6==Sh=-npJooP8chLPEfaFV0oNYTTBA@mail.gmail.com/ [0]
Acked-by: Paul Moore <paul@paul-moore.com>
Cc: James Morris <jmorris@namei.org>
Cc: "Serge E. Hallyn" <serge@hallyn.com>
Cc: Stephen Smalley <stephen.smalley.work@gmail.com>
Cc: Ondrej Mosnacek <omosnace@redhat.com>
---
 security/lsm_audit.c         | 4 ++--
 security/selinux/selinuxfs.c | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/security/lsm_audit.c b/security/lsm_audit.c
index 849e832719e2..a922e4339dd5 100644
--- a/security/lsm_audit.c
+++ b/security/lsm_audit.c
@@ -207,7 +207,7 @@ static void dump_common_audit_data(struct audit_buffer *ab,
 	BUILD_BUG_ON(sizeof(a->u) > sizeof(void *)*2);
 
 	audit_log_format(ab, " pid=%d comm=", task_tgid_nr(current));
-	audit_log_untrustedstring(ab, memcpy(comm, current->comm, sizeof(comm)));
+	audit_log_untrustedstring(ab, __get_task_comm(comm, sizeof(comm), current));
 
 	switch (a->type) {
 	case LSM_AUDIT_DATA_NONE:
@@ -302,7 +302,7 @@ static void dump_common_audit_data(struct audit_buffer *ab,
 				char comm[sizeof(tsk->comm)];
 				audit_log_format(ab, " opid=%d ocomm=", pid);
 				audit_log_untrustedstring(ab,
-				    memcpy(comm, tsk->comm, sizeof(comm)));
+				    __get_task_comm(comm, sizeof(comm), tsk));
 			}
 		}
 		break;
diff --git a/security/selinux/selinuxfs.c b/security/selinux/selinuxfs.c
index e172f182b65c..a8a2ec742576 100644
--- a/security/selinux/selinuxfs.c
+++ b/security/selinux/selinuxfs.c
@@ -708,7 +708,7 @@ static ssize_t sel_write_checkreqprot(struct file *file, const char __user *buf,
 	if (new_value) {
 		char comm[sizeof(current->comm)];
 
-		memcpy(comm, current->comm, sizeof(comm));
+		__get_task_comm(comm, sizeof(comm), current);
 		pr_err("SELinux: %s (%d) set checkreqprot to 1. This is no longer supported.\n",
 		       comm, current->pid);
 	}
-- 
2.39.1

