Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C5CE99554F4
	for <lists+dri-devel@lfdr.de>; Sat, 17 Aug 2024 04:56:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 92DC210E03D;
	Sat, 17 Aug 2024 02:56:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="aoy/deeV";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com
 [209.85.214.177])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EF61410E03D
 for <dri-devel@lists.freedesktop.org>; Sat, 17 Aug 2024 02:56:47 +0000 (UTC)
Received: by mail-pl1-f177.google.com with SMTP id
 d9443c01a7336-202146e9538so7971005ad.3
 for <dri-devel@lists.freedesktop.org>; Fri, 16 Aug 2024 19:56:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1723863407; x=1724468207; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=rKgZtG9uOqD3DFxRKcQkjZTQLILEzoQhivhfaU9Nqo4=;
 b=aoy/deeV/N9fKVr7zmbi2jPCnnXH2nQ+6SXyMenSX7qdjYITO2Tuy7pqyGnI8QWQ/S
 5hzGL09PcksFme/kkB+mnCixPyx/GqFTdYn7h5Bx5YZzAw9ZGvxKZ02CiSziaX66zNvW
 jitc1KPBqkULW0tOPxmUo7dJeeD6jziFdVqqp0d5OW1deRZi8g7kpzgZQM8boOCT+vAX
 EDEQURLL09LBOoFEnS8ecvWkVoEWuxuce+FSfakb4Fz5odDgNyE4H3VWC44zEMhkntLY
 3BTLkWbQdHYNl2Qo0rfpoCEGzKbM9vRgVlg7GJmc9pJeqD5yvuxW/zVVwgGglWM803PQ
 5ntA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1723863407; x=1724468207;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=rKgZtG9uOqD3DFxRKcQkjZTQLILEzoQhivhfaU9Nqo4=;
 b=uGH/Gw0pTTD/R6cf2Lx67We2P2DL4Q5rFvfO5Kj/E9lacvF3xm25c8mcH0dxjhoVUd
 pQmHT8Q2ZoxsETBMUMDs76Y5yMhO5G8i9YYNjYyYeYswR9/tD/a6+zDxlsOVw0CUtxOO
 hU27UOO+Rq4r/n6Owb2AFKHn04mVouWly6QT47Lk5Xr2dGMVYWAFB1WS+d2BXgTB4Sgg
 sXvjdxG1MIdSerlYgiOCeMfXYblvHIL4CY4ib+fuCv1Q+1pUpMDqTKb0by7ZqQzUQnEN
 JMv9h9o27klB+ALKEGEWOqfgM6FYisqhGKU7wVeTRW8/h/ZOdK++zPlX1x0npx1xSk31
 qWoA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWR91hrlYy1Uo5hUSp9mF2qf3q5F2x/ajDF6E/xNHECXegAgVJetMKjrf1C1XkSAUrJAfq7R2JSShjwwDNyWfpSLRpMXIlku0AWbrLUeAb7
X-Gm-Message-State: AOJu0YyKuC10OdVzwHwUhttY7xSRfG2HJlSaB0pffGyeavMYvKIwPaJS
 QWyhz0VdF/Ah7iiyuMuxSWOR+A+T/fNoIhu8+YTLWLwLDdp8cjQa
X-Google-Smtp-Source: AGHT+IEbPGpqoRSYF8jBgPK+pTBiTQRphrHbJ0rUSgdEvQgjtWO3Wff4DwqW4cJKQwtvK2mv0b1kNQ==
X-Received: by 2002:a17:903:124e:b0:1f7:1b08:dda9 with SMTP id
 d9443c01a7336-20203e50e27mr63144585ad.8.1723863407171; 
 Fri, 16 Aug 2024 19:56:47 -0700 (PDT)
Received: from localhost.localdomain ([183.193.177.10])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-201f031c5e1sm31801785ad.94.2024.08.16.19.56.39
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 16 Aug 2024 19:56:46 -0700 (PDT)
From: Yafang Shao <laoar.shao@gmail.com>
To: akpm@linux-foundation.org
Cc: torvalds@linux-foundation.org, alx@kernel.org, justinstitt@google.com,
 ebiederm@xmission.com, alexei.starovoitov@gmail.com, rostedt@goodmis.org,
 catalin.marinas@arm.com, penguin-kernel@i-love.sakura.ne.jp,
 linux-mm@kvack.org, linux-fsdevel@vger.kernel.org,
 linux-trace-kernel@vger.kernel.org, audit@vger.kernel.org,
 linux-security-module@vger.kernel.org, selinux@vger.kernel.org,
 bpf@vger.kernel.org, netdev@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Yafang Shao <laoar.shao@gmail.com>
Subject: [PATCH v7 0/8] Improve the copy of task comm
Date: Sat, 17 Aug 2024 10:56:16 +0800
Message-Id: <20240817025624.13157-1-laoar.shao@gmail.com>
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
string that is overflow. Therefore, we should explicitly ensure the
destination string is always NUL-terminated, regardless of the task comm.
This approach will facilitate future extensions to the task comm.

As suggested by Linus [0], we can identify all relevant code with the
following git grep command:

  git grep 'memcpy.*->comm\>'
  git grep 'kstrdup.*->comm\>'
  git grep 'strncpy.*->comm\>'
  git grep 'strcpy.*->comm\>'

PATCH #2~#4:   memcpy
PATCH #5~#6:   kstrdup
PATCH #7~#8:   strcpy

Please note that strncpy() is not included in this series as it is being
tracked by another effort. [1]

In this series, we have removed __get_task_comm() because the task_lock()
and BUILD_BUG_ON() within it are unnecessary.

Suggested-by: Linus Torvalds <torvalds@linux-foundation.org>
Link: https://lore.kernel.org/all/CAHk-=wjAmmHUg6vho1KjzQi2=psR30+CogFd4aXrThr2gsiS4g@mail.gmail.com/ [0]

Changes:
v6->v7:
- Improve the comment (Alejandro)
- Drop strncpy as it is being tracked by another effort (Justin)
  https://github.com/KSPP/linux/issues/90 [1]

v5->v6: https://lore.kernel.org/linux-mm/20240812022933.69850-1-laoar.shao@gmail.com/
- Get rid of __get_task_comm() (Linus)
- Use ARRAY_SIZE() in get_task_comm() (Alejandro)

v4->v5: https://lore.kernel.org/all/20240804075619.20804-1-laoar.shao@gmail.com/
- Drop changes in the mm/kmemleak.c as it was fixed by
  commit 0b84780134fb ("mm/kmemleak: replace strncpy() with strscpy()")
- Drop changes in kernel/tsacct.c as it was fixed by
  commmit 0fe2356434e ("tsacct: replace strncpy() with strscpy()")

v3->v4: https://lore.kernel.org/linux-mm/20240729023719.1933-1-laoar.shao@gmail.com/
- Rename __kstrndup() to __kmemdup_nul() and define it inside mm/util.c
  (Matthew)
- Remove unused local varaible (Simon)

v2->v3: https://lore.kernel.org/all/20240621022959.9124-1-laoar.shao@gmail.com/
- Deduplicate code around kstrdup (Andrew)
- Add commit log for dropping task_lock (Catalin)

v1->v2: https://lore.kernel.org/bpf/20240613023044.45873-1-laoar.shao@gmail.com/
- Add comment for dropping task_lock() in __get_task_comm() (Alexei)
- Drop changes in trace event (Steven)
- Fix comment on task comm (Matus)

v1: https://lore.kernel.org/all/20240602023754.25443-1-laoar.shao@gmail.com/

Yafang Shao (8):
  Get rid of __get_task_comm()
  auditsc: Replace memcpy() with strscpy()
  security: Replace memcpy() with get_task_comm()
  bpftool: Ensure task comm is always NUL-terminated
  mm/util: Fix possible race condition in kstrdup()
  mm/util: Deduplicate code in {kstrdup,kstrndup,kmemdup_nul}
  net: Replace strcpy() with strscpy()
  drm: Replace strcpy() with strscpy()

 drivers/gpu/drm/drm_framebuffer.c     |  2 +-
 drivers/gpu/drm/i915/i915_gpu_error.c |  2 +-
 fs/exec.c                             | 10 -----
 fs/proc/array.c                       |  2 +-
 include/linux/sched.h                 | 32 +++++++++++---
 kernel/auditsc.c                      |  6 +--
 kernel/kthread.c                      |  2 +-
 mm/util.c                             | 61 ++++++++++++---------------
 net/ipv6/ndisc.c                      |  2 +-
 security/lsm_audit.c                  |  4 +-
 security/selinux/selinuxfs.c          |  2 +-
 tools/bpf/bpftool/pids.c              |  2 +
 12 files changed, 65 insertions(+), 62 deletions(-)

-- 
2.43.5

