Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E6668961C7F
	for <lists+dri-devel@lfdr.de>; Wed, 28 Aug 2024 05:03:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 17B5F10E483;
	Wed, 28 Aug 2024 03:03:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="JtmC6sVn";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-f176.google.com (mail-pg1-f176.google.com
 [209.85.215.176])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 23F2910E483
 for <dri-devel@lists.freedesktop.org>; Wed, 28 Aug 2024 03:03:53 +0000 (UTC)
Received: by mail-pg1-f176.google.com with SMTP id
 41be03b00d2f7-7cd830e0711so132432a12.0
 for <dri-devel@lists.freedesktop.org>; Tue, 27 Aug 2024 20:03:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1724814233; x=1725419033; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=+RcIZVYUDMrvydSLTObUn9UWjAdkDM4CrmA64YTz3G4=;
 b=JtmC6sVnLeisAoyF1pElJc9+h0zKHZ6C7LvUyv8cMQvTMXgOSf0buzbxe3WJeKi8OK
 rnVUid8smeEViKstRxecDSNClSbSH7H8Ecv695FhwrO0ZPE6eFLUgiJLFjTdsMW7Ismr
 b9LGXEtUV/WGBQBa2XXdvadgx3dyxQ5n4vACOvLGjGRohlZzQOdMC4JcO9yo+vXo+Cdq
 wP1y8gJs+lsc+c0rtJa8wDxQdFbDCALR4Rqiya5ZHVW6hTuRmE+WF8KwLFtWqZ60v8aS
 TMWTpdZKdsQcvxraxikmC4ULIR//cRyHavWvaawORKetKq21KKSCLbf7LCrbznCN1S7e
 e5PQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1724814233; x=1725419033;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=+RcIZVYUDMrvydSLTObUn9UWjAdkDM4CrmA64YTz3G4=;
 b=d5XjT+6FyR8CyVckrOpwhnxJQZw47xBkzGH+O1aTFykxBeo+Wk3A0vEn8Z8b1WqG/p
 PSBQrjNS9Ol22DAgDmPuw2qEmNWv4ctgyxw6z/17+tJi0UgoBSz74fDj3hZrlyeezqia
 TqCCA+crRPHHGCHqvF+NOsPDwDSHG9Exig5/K6qya6Ohace94m7flYJB7sJPb3KtIYmx
 8o8GJxHY4racR7Cyu6/m7epSyKnAYuA8k14iDqfdspX2dvgaOV1Q/zUaj+s5KaZ1WXG3
 qU887pn6pXbUuudsVov6ebXWsxJlV8pKCAl/0GrsLRxJDl0rwISt7yoXzslkc35mXHE5
 /RQw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXt9sXFUUgU/5IPS3dUZEyZznz8xbrxe/ykPGCXNs6441MzpU0der7CIfFH9BU1dKHEaQ4m5Jbh4iE=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwXKcDZ6dKPixgg08/e0WNslnFYZF4kDgaGkRkcR6e7VO5G0tI2
 +4KKkrjIgvQZVu8atRqBejzWrt7la5g/OYhXcpTdaFAjPhQq+FBF
X-Google-Smtp-Source: AGHT+IGFzzoi8lpwMf6Iv4C1DEmxZSABK+5V2UtAilXgBtIiNQOvP4ALnfkUbY0O1vyUXWVYARLCDw==
X-Received: by 2002:a17:90b:d83:b0:2d4:91c:8882 with SMTP id
 98e67ed59e1d1-2d843c839efmr1207327a91.11.1724814232595; 
 Tue, 27 Aug 2024 20:03:52 -0700 (PDT)
Received: from localhost.localdomain ([39.144.104.43])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-2d8445db8f6sm317977a91.1.2024.08.27.20.03.45
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 27 Aug 2024 20:03:51 -0700 (PDT)
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
 Paul Moore <paul@paul-moore.com>, Eric Paris <eparis@redhat.com>
Subject: [PATCH v8 2/8] auditsc: Replace memcpy() with strscpy()
Date: Wed, 28 Aug 2024 11:03:15 +0800
Message-Id: <20240828030321.20688-3-laoar.shao@gmail.com>
X-Mailer: git-send-email 2.30.1 (Apple Git-130)
In-Reply-To: <20240828030321.20688-1-laoar.shao@gmail.com>
References: <20240828030321.20688-1-laoar.shao@gmail.com>
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

Using strscpy() to read the task comm ensures that the name is
always NUL-terminated, regardless of the source string. This approach also
facilitates future extensions to the task comm.

Signed-off-by: Yafang Shao <laoar.shao@gmail.com>
Acked-by: Paul Moore <paul@paul-moore.com>
Cc: Eric Paris <eparis@redhat.com>
---
 kernel/auditsc.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/kernel/auditsc.c b/kernel/auditsc.c
index 6f0d6fb6523f..e4ef5e57dde9 100644
--- a/kernel/auditsc.c
+++ b/kernel/auditsc.c
@@ -2730,7 +2730,7 @@ void __audit_ptrace(struct task_struct *t)
 	context->target_uid = task_uid(t);
 	context->target_sessionid = audit_get_sessionid(t);
 	security_task_getsecid_obj(t, &context->target_sid);
-	memcpy(context->target_comm, t->comm, TASK_COMM_LEN);
+	strscpy(context->target_comm, t->comm);
 }
 
 /**
@@ -2757,7 +2757,7 @@ int audit_signal_info_syscall(struct task_struct *t)
 		ctx->target_uid = t_uid;
 		ctx->target_sessionid = audit_get_sessionid(t);
 		security_task_getsecid_obj(t, &ctx->target_sid);
-		memcpy(ctx->target_comm, t->comm, TASK_COMM_LEN);
+		strscpy(ctx->target_comm, t->comm);
 		return 0;
 	}
 
@@ -2778,7 +2778,7 @@ int audit_signal_info_syscall(struct task_struct *t)
 	axp->target_uid[axp->pid_count] = t_uid;
 	axp->target_sessionid[axp->pid_count] = audit_get_sessionid(t);
 	security_task_getsecid_obj(t, &axp->target_sid[axp->pid_count]);
-	memcpy(axp->target_comm[axp->pid_count], t->comm, TASK_COMM_LEN);
+	strscpy(axp->target_comm[axp->pid_count], t->comm);
 	axp->pid_count++;
 
 	return 0;
-- 
2.43.5

