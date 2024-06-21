Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2AC0291187A
	for <lists+dri-devel@lfdr.de>; Fri, 21 Jun 2024 04:30:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 533C910E111;
	Fri, 21 Jun 2024 02:30:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="FJ2x4OXd";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com
 [209.85.210.182])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EFEA710E111
 for <dri-devel@lists.freedesktop.org>; Fri, 21 Jun 2024 02:30:34 +0000 (UTC)
Received: by mail-pf1-f182.google.com with SMTP id
 d2e1a72fcca58-70109d34a16so1404346b3a.2
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Jun 2024 19:30:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1718937034; x=1719541834; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=GwlwwP2ml9p21cPlAav/YvSh18oChNGHXpTCNRHeKlc=;
 b=FJ2x4OXdFwu2UtUqSsuwQ6apUHPAXSo25cJS/QQ/1M9Uk69deFGixw+8bJ/FyTMsQy
 ixDh3LSqtjIDFwRw/3E9g1WdbxkXqh/t1S0rEIRKLxR2wnj9OAyn7MDDE1jv4JuDWNEx
 hxVH8iFlksdC96P386bpXGp7Kzcyal/5Ss4MEctRQZM+DVh1TY6LfhQ51HRi8p8Dkk0C
 6oTYLikVF+ZPohD2FD6mn0U7LEvvfN+ZG7tnohdpmyqb/OvnbdabA1r/hd3yhP9Qd71w
 Y1IGzu3uoQdfTd6Gs+hthrlBdwzGM2ZYtgMMMvzaQNpKw7gXyG67FnbxwTPCDRuS0mn2
 9JuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1718937034; x=1719541834;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=GwlwwP2ml9p21cPlAav/YvSh18oChNGHXpTCNRHeKlc=;
 b=jYFWhH6P+uzFQ/ao1A1NrRjNPqkQizyB0flp7I0pbFj74nWx0Jj7XnK7q2cM7y+4XO
 Ifi67ZRuMDeE7s6tMtEHZtbG9h/k904bdrhNQX6B7oFocaOvi6+BV3AZzB607RnVd8gm
 ApVVV8RzZakiHayHp0lCJgGkJiDRw9PAJIIy7yCWYmzZ6I+dO64nIyVqq3MECu3fcad/
 EXPvTWCqns4ER3pShPRtCwRWEDqVvEA/4fQ4CXxof/Z1AGKX779mKIy9xWIWdYu/7VZD
 EC6R29AF65GnUvyWPpNzm5TyPQhXsxZnk6FhOY8nsNuVOBXw0zRCxI3i1nEYjh+Fvlx2
 jDug==
X-Forwarded-Encrypted: i=1;
 AJvYcCWndfUqBPOco9HG+7oeNj1qrH04MUxv7R72hEoKFLY/FOFDKRxfB7HTGEitdMkojRpjmGQusAfki+GV8F7X1H/FM13pZyUxvGSRTJd8Als5
X-Gm-Message-State: AOJu0YxK/QT7NVQy6o7jooVVCILqcPv1D4BAA9u9mS8Jkrqf+j89I6WI
 TmAu4QqhsZDChPsAhtgCZ/qZ0GQEfFNtrZgvGqxlSpvtQAibek06
X-Google-Smtp-Source: AGHT+IHCunKAxv47P844vphuNTxBO9sCB83yDLseIyT9/+IsrkCTE3Wi2jgqKchbD0S9to2P9PKntQ==
X-Received: by 2002:a05:6a20:9145:b0:1b7:edea:e32 with SMTP id
 adf61e73a8af0-1bcbb46b981mr9429646637.32.1718937033951; 
 Thu, 20 Jun 2024 19:30:33 -0700 (PDT)
Received: from localhost.localdomain ([39.144.105.24])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-706511944d2sm332488b3a.70.2024.06.20.19.30.23
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 20 Jun 2024 19:30:32 -0700 (PDT)
From: Yafang Shao <laoar.shao@gmail.com>
To: torvalds@linux-foundation.org
Cc: ebiederm@xmission.com, alexei.starovoitov@gmail.com, rostedt@goodmis.org,
 catalin.marinas@arm.com, akpm@linux-foundation.org,
 penguin-kernel@i-love.sakura.ne.jp, linux-mm@kvack.org,
 linux-fsdevel@vger.kernel.org, linux-trace-kernel@vger.kernel.org,
 audit@vger.kernel.org, linux-security-module@vger.kernel.org,
 selinux@vger.kernel.org, bpf@vger.kernel.org, netdev@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Yafang Shao <laoar.shao@gmail.com>
Subject: [PATCH v3 00/11] Improve the copy of task comm 
Date: Fri, 21 Jun 2024 10:29:48 +0800
Message-Id: <20240621022959.9124-1-laoar.shao@gmail.com>
X-Mailer: git-send-email 2.30.1 (Apple Git-130)
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

Using {memcpy,strncpy,strcpy,kstrdup} to copy the task comm relies on the
length of task comm. Changes in the task comm could result in a destination
string that is overflow. Therefore, we should explicitly ensure the destination
string is always NUL-terminated, regardless of the task comm. This approach
will facilitate future extensions to the task comm.

As suggested by Linus [0], we can identify all relevant code with the
following git grep command:

  git grep 'memcpy.*->comm\>'
  git grep 'kstrdup.*->comm\>'
  git grep 'strncpy.*->comm\>'
  git grep 'strcpy.*->comm\>'

PATCH #2~#4:   memcpy
PATCH #5~#6:   kstrdup
PATCH #7~#9:   strncpy
PATCH #10~#11: strcpy

Suggested-by: Linus Torvalds <torvalds@linux-foundation.org>
Link: https://lore.kernel.org/all/CAHk-=wjAmmHUg6vho1KjzQi2=psR30+CogFd4aXrThr2gsiS4g@mail.gmail.com/ [0]

Changes:
v2->v3:
- Deduplicate code around kstrdup (Andrew)
- Add commit log for dropping task_lock (Catalin)

v1->v2: https://lore.kernel.org/bpf/20240613023044.45873-1-laoar.shao@gmail.com/
- Add comment for dropping task_lock() in __get_task_comm() (Alexei)
- Drop changes in trace event (Steven)
- Fix comment on task comm (Matus)
  
v1: https://lore.kernel.org/all/20240602023754.25443-1-laoar.shao@gmail.com/

Yafang Shao (11):
  fs/exec: Drop task_lock() inside __get_task_comm()
  auditsc: Replace memcpy() with __get_task_comm()
  security: Replace memcpy() with __get_task_comm()
  bpftool: Ensure task comm is always NUL-terminated
  mm/util: Fix possible race condition in kstrdup()
  mm/util: Deduplicate code in {kstrdup,kstrndup,kmemdup_nul}
  mm/kmemleak: Replace strncpy() with __get_task_comm()
  tsacct: Replace strncpy() with __get_task_comm()
  tracing: Replace strncpy() with __get_task_comm()
  net: Replace strcpy() with __get_task_comm()
  drm: Replace strcpy() with __get_task_comm()

 drivers/gpu/drm/drm_framebuffer.c     |  2 +-
 drivers/gpu/drm/i915/i915_gpu_error.c |  2 +-
 fs/exec.c                             | 10 ++++++++--
 include/linux/sched.h                 |  4 ++--
 kernel/auditsc.c                      |  6 +++---
 kernel/trace/trace.c                  |  2 +-
 kernel/trace/trace_events_hist.c      |  2 +-
 kernel/tsacct.c                       |  2 +-
 mm/internal.h                         | 24 ++++++++++++++++++++++++
 mm/kmemleak.c                         |  8 +-------
 mm/util.c                             | 21 ++++-----------------
 net/ipv6/ndisc.c                      |  2 +-
 security/lsm_audit.c                  |  4 ++--
 security/selinux/selinuxfs.c          |  2 +-
 tools/bpf/bpftool/pids.c              |  2 ++
 15 files changed, 53 insertions(+), 40 deletions(-)

-- 
2.39.1

