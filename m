Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 76588946D1E
	for <lists+dri-devel@lfdr.de>; Sun,  4 Aug 2024 09:56:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 138C510E085;
	Sun,  4 Aug 2024 07:56:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="EEkuIw/z";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com
 [209.85.210.179])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9210410E085
 for <dri-devel@lists.freedesktop.org>; Sun,  4 Aug 2024 07:56:47 +0000 (UTC)
Received: by mail-pf1-f179.google.com with SMTP id
 d2e1a72fcca58-70d2b921c48so7412828b3a.1
 for <dri-devel@lists.freedesktop.org>; Sun, 04 Aug 2024 00:56:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1722758207; x=1723363007; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=jAUiIbA9M914l7SbVcGMcRn0qL18BQ5kTGC/RMGMPl4=;
 b=EEkuIw/zNOZC10DJUlHGXH61TJCbhugjgQAXxeh8XGZHJ0NaRGi73yvBAM/iXDhoHL
 w5b2nFLJcEWPGAplM8TuoK6nIyTTDq1342rJZTcBEIj//gNJjeHXi1BY7jSaM1LKOprh
 GFVQnCREMJQXQrhr30JK/1EoSQsigJSII0sTdD7z8o4+T8WmxzmVZumSN1po7wsCcERo
 UqHZrMlXHyeTDqEkDdAgCIKSBbJwDxOhdQp55K398woi7jkgW1NferxukTDhU2jHIYM/
 MRCXNQ8jns4FQo2DRNtvOSYg0I89LW033oWH1roPextqp0fAmpIu6afqOxViODB9Uz8i
 8iIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1722758207; x=1723363007;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=jAUiIbA9M914l7SbVcGMcRn0qL18BQ5kTGC/RMGMPl4=;
 b=HEciPB7FR7jo18PUpfmgTfhU4vmOJz+xCG1BrawfVRzEtwNtJ6RRi9/EHf1TsXVJ+z
 zN3bGCm2DVaAL0jWP/1rUJnkIrnotxB3IvkD5QJeDpjsTu8Qs/mPUIUa2sxSqhilY4YH
 7U69UCoMs+ZD+7/msC5+HPcFeDF0IwnIJFARf1FaCv6fCLsmyECiF1UOr1QPJk4V2Wo4
 ZJu7bEJ1AfwgTfhSmn3tMtsHrkMHZLKRIyoxt+lixUFu0KbqfCw6cp3zaLDK93DjOpN3
 fiWvOGPLSnjMrSGumyGd47wJhiY6FLUyyKNOAnl90AK9zZDWsQMzjusXO++KGQkr2cFc
 +O+w==
X-Forwarded-Encrypted: i=1;
 AJvYcCVXdL9fgWEQEtq8onQ8T2LbfP3vXyM0lo6ycpdGC5jhR8E9IEC09WvSW8D4Zr+Jsc1KhBplDJKod9YNowrJ03tKIByDRF6W7+VgznWic4zK
X-Gm-Message-State: AOJu0YwOMPsnI/Z/9yVh8/ZnKYEcS4OOZ0LPzsbTL6czX1FxE7U8755z
 xCu1Kl+1yDaWVEfpY9CCW0nIrbhGUpEymGpbjDclSCgDpW5P7Ovo
X-Google-Smtp-Source: AGHT+IGr87hL+CR9BQ4tkSVsGq67qKnz8TEMjj1/AcYNViYHS42eo8GA1J34i40o5jKuxGL8nismgw==
X-Received: by 2002:a17:902:d08a:b0:1fd:9e6e:7c10 with SMTP id
 d9443c01a7336-1ff5748d30cmr59016425ad.41.1722758206776; 
 Sun, 04 Aug 2024 00:56:46 -0700 (PDT)
Received: from localhost.localdomain ([39.144.105.172])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-1ff59178248sm46387605ad.202.2024.08.04.00.56.31
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Sun, 04 Aug 2024 00:56:45 -0700 (PDT)
From: Yafang Shao <laoar.shao@gmail.com>
To: akpm@linux-foundation.org
Cc: torvalds@linux-foundation.org, ebiederm@xmission.com,
 alexei.starovoitov@gmail.com, rostedt@goodmis.org, catalin.marinas@arm.com,
 penguin-kernel@i-love.sakura.ne.jp, linux-mm@kvack.org,
 linux-fsdevel@vger.kernel.org, linux-trace-kernel@vger.kernel.org,
 audit@vger.kernel.org, linux-security-module@vger.kernel.org,
 selinux@vger.kernel.org, bpf@vger.kernel.org, netdev@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Yafang Shao <laoar.shao@gmail.com>
Subject: [PATCH v5 0/9] Improve the copy of task comm
Date: Sun,  4 Aug 2024 15:56:10 +0800
Message-Id: <20240804075619.20804-1-laoar.shao@gmail.com>
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
PATCH #7:      strncpy
PATCH #8~#9:   strcpy

There is a BUILD_BUG_ON() inside get_task_comm(), so when you use
get_task_comm(), it implies that the BUILD_BUG_ON() is necessary. However,
we don't want to impose this restriction on code where the length can be
changed, so we use __get_task_comm(), rather than the get_task_comm().

One use case of get_task_comm() is in code that has already exposed the
length to userspace. In such cases, we specifically add the BUILD_BUG_ON()
to prevent developers from changing it. For more information, see
commit 95af469c4f60 ("fs/binfmt_elf: replace open-coded string copy with
get_task_comm").

Suggested-by: Linus Torvalds <torvalds@linux-foundation.org>
Link: https://lore.kernel.org/all/CAHk-=wjAmmHUg6vho1KjzQi2=psR30+CogFd4aXrThr2gsiS4g@mail.gmail.com/ [0]

Changes:
v4->v5:
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

Yafang Shao (9):
  fs/exec: Drop task_lock() inside __get_task_comm()
  auditsc: Replace memcpy() with __get_task_comm()
  security: Replace memcpy() with __get_task_comm()
  bpftool: Ensure task comm is always NUL-terminated
  mm/util: Fix possible race condition in kstrdup()
  mm/util: Deduplicate code in {kstrdup,kstrndup,kmemdup_nul}
  tracing: Replace strncpy() with __get_task_comm()
  net: Replace strcpy() with __get_task_comm()
  drm: Replace strcpy() with __get_task_comm()

 drivers/gpu/drm/drm_framebuffer.c     |  2 +-
 drivers/gpu/drm/i915/i915_gpu_error.c |  2 +-
 fs/exec.c                             | 10 ++++-
 include/linux/sched.h                 |  4 +-
 kernel/auditsc.c                      |  6 +--
 kernel/trace/trace.c                  |  2 +-
 kernel/trace/trace_events_hist.c      |  2 +-
 mm/util.c                             | 61 ++++++++++++---------------
 net/ipv6/ndisc.c                      |  2 +-
 security/lsm_audit.c                  |  4 +-
 security/selinux/selinuxfs.c          |  2 +-
 tools/bpf/bpftool/pids.c              |  2 +
 12 files changed, 49 insertions(+), 50 deletions(-)

-- 
2.34.1
