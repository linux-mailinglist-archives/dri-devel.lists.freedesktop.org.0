Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0674F94E4D0
	for <lists+dri-devel@lfdr.de>; Mon, 12 Aug 2024 04:30:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 72B9C10E032;
	Mon, 12 Aug 2024 02:30:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="cehAI+Ca";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com
 [209.85.214.173])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5437D10E032
 for <dri-devel@lists.freedesktop.org>; Mon, 12 Aug 2024 02:30:04 +0000 (UTC)
Received: by mail-pl1-f173.google.com with SMTP id
 d9443c01a7336-1fc569440e1so35471975ad.3
 for <dri-devel@lists.freedesktop.org>; Sun, 11 Aug 2024 19:30:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1723429804; x=1724034604; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=CPcfP+fHyMLz6sCkXjXj/fN1cAsrryKdxQYaf/+RRmQ=;
 b=cehAI+CaHWMTXWKeG5TqGktDesyVDieZWUOAp+2bPVw4WrRlIdcJ30wsYj532NY3gm
 ckKgSEAJL2A/jVqaVPesmO/GH2+hawZDaq6ZPE9QxFSFe8QA2je4sk/VLmop7XWmKacS
 n8oKSwjTqM9QdvEx6amzzOcBFs66sx5uUEDP2EnrIJ2nm5Ul2eVwHrxK2CKu0gpBawTb
 SRnuu8wKkKAx0QxrNffu5YuKyL8QsdY57IUy/jBfP3iCuzXSO2ppbMu/8EUs7Mu9AGEI
 GxOQNbOmjPQ/HBV+DOTZ/UffqO469rCDOCmPzGu72+EpDRAApGPGt1YHuFACNWAWPJ5h
 e4Tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1723429804; x=1724034604;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=CPcfP+fHyMLz6sCkXjXj/fN1cAsrryKdxQYaf/+RRmQ=;
 b=eD2UmzgR54l45k+baarT3C5gNtf9e4V3Ngt+gycEYC+lRUG/PspCaCevB4HNPaqHAn
 DDAOi61BXGliJLB2jDb6CP8vaUBeN2NfuGZ/Ikv8E3vWewg4IRvp0uYhQzn4CyyW8t+G
 uttnZFigm8YaLWazev0CklzUhwbTjU8/e1hTXBo1Qt02EbNjLhJaW2dbxwYwXXvlmdZG
 MNR7xQ1Se6dHSLAY/VkmFCsnvHtDrGx/qsvknpfEo8IpqttzTR1n54avRqcYZqdk9268
 Bkk/hnX0vRpDYkdnZdtPLUEtBZ5FXchChLWASPFuguLYr/tuqViBQ0Gzbq8OUas5SUbj
 a3ZQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWOVsN53xGuf/MqHBOEpzfsVJt5rmk6CdN52g8fSmnwwFI4W2teyCU5+UB5U2SW3UXq6lnDzMGepmTcVf/gf1pi/OsrGq2MZ7kjtfpB7RPB
X-Gm-Message-State: AOJu0Yx4WGL1YZXdw2kyhu3oJyuDVrwLemGr/4qyhsSO+Eg7CvqeSXai
 rSpJEJVBvlNWtSzV3BJrkVEbO82PUG0zR+63v4FUhy0zDbvqAvbF
X-Google-Smtp-Source: AGHT+IHWjfWk9Yvp8Xz47EmfqTOyYIqZTpLYHww0hZawPQZt6bgoSLmdtP7yW5PiZUmHJmuoGirzew==
X-Received: by 2002:a17:902:ce03:b0:1fb:7b01:7980 with SMTP id
 d9443c01a7336-200ae250234mr122466755ad.0.1723429803589; 
 Sun, 11 Aug 2024 19:30:03 -0700 (PDT)
Received: from localhost.localdomain ([39.144.39.162])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-200bb9fed69sm27884765ad.188.2024.08.11.19.29.54
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Sun, 11 Aug 2024 19:30:02 -0700 (PDT)
From: Yafang Shao <laoar.shao@gmail.com>
To: akpm@linux-foundation.org
Cc: torvalds@linux-foundation.org, ebiederm@xmission.com,
 alexei.starovoitov@gmail.com, rostedt@goodmis.org, catalin.marinas@arm.com,
 penguin-kernel@i-love.sakura.ne.jp, linux-mm@kvack.org,
 linux-fsdevel@vger.kernel.org, linux-trace-kernel@vger.kernel.org,
 audit@vger.kernel.org, linux-security-module@vger.kernel.org,
 selinux@vger.kernel.org, bpf@vger.kernel.org, netdev@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Yafang Shao <laoar.shao@gmail.com>
Subject: [PATCH v6 0/9] Improve the copy of task comm
Date: Mon, 12 Aug 2024 10:29:24 +0800
Message-Id: <20240812022933.69850-1-laoar.shao@gmail.com>
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
PATCH #7:      strncpy
PATCH #8~#9:   strcpy

In this series, we have removed __get_task_comm() because the task_lock()
and BUILD_BUG_ON() within it are unnecessary.

Suggested-by: Linus Torvalds <torvalds@linux-foundation.org>
Link: https://lore.kernel.org/all/CAHk-=wjAmmHUg6vho1KjzQi2=psR30+CogFd4aXrThr2gsiS4g@mail.gmail.com/ [0]

Changes:
v5->v6:
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

Yafang Shao (9):
  Get rid of __get_task_comm()
  auditsc: Replace memcpy() with strscpy()
  security: Replace memcpy() with get_task_comm()
  bpftool: Ensure task comm is always NUL-terminated
  mm/util: Fix possible race condition in kstrdup()
  mm/util: Deduplicate code in {kstrdup,kstrndup,kmemdup_nul}
  tracing: Replace strncpy() with strscpy()
  net: Replace strcpy() with strscpy()
  drm: Replace strcpy() with strscpy()

 drivers/gpu/drm/drm_framebuffer.c     |  2 +-
 drivers/gpu/drm/i915/i915_gpu_error.c |  2 +-
 fs/exec.c                             | 10 -----
 fs/proc/array.c                       |  2 +-
 include/linux/sched.h                 | 31 +++++++++++---
 kernel/auditsc.c                      |  6 +--
 kernel/kthread.c                      |  2 +-
 kernel/trace/trace.c                  |  2 +-
 kernel/trace/trace_events_hist.c      |  2 +-
 mm/util.c                             | 61 ++++++++++++---------------
 net/ipv6/ndisc.c                      |  2 +-
 security/lsm_audit.c                  |  4 +-
 security/selinux/selinuxfs.c          |  2 +-
 tools/bpf/bpftool/pids.c              |  2 +
 14 files changed, 66 insertions(+), 64 deletions(-)

-- 
2.43.5

