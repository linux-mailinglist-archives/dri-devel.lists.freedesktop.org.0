Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DA856906891
	for <lists+dri-devel@lfdr.de>; Thu, 13 Jun 2024 11:26:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A93DF10E9BE;
	Thu, 13 Jun 2024 09:26:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="K78GDH6v";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com
 [209.85.216.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6334210E960
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Jun 2024 02:31:03 +0000 (UTC)
Received: by mail-pj1-f44.google.com with SMTP id
 98e67ed59e1d1-2c2fe7f07c4so407020a91.2
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Jun 2024 19:31:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1718245863; x=1718850663; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=3w4iDYMbDQ8VqQWdAkr+pXXK7YGM0mHCHQpTjjn+CA4=;
 b=K78GDH6vdKvs2syOvXHgRAKS6t/qYLJlnDGBmm4ISznlqrx59uJ3eS2CUGCEZFBZgQ
 2kF0+2p6rcBwdiFyzQH95xJ0Ji9DtajnTHo/ZJhvMbCwOODsC3lx8zAZl4E/FX8OwJfE
 JSnKS5o+kYFZSAvLy0FwDmwboxwmiSSr+9RZzinEazBEKMkv7FyMpEfqKySaH0XrEQma
 32S7b+7RHmEsUHa25P96P6IQdIz3V9VHGenoeslwzrRyh+uH4RjsHC9ESJpfZTfoSPrK
 t8azxGi3Q5uEG70V4AToWWZ9lBGbF926GZTt667ETqVusFQirNLdWVsdBxxucxM6kZmp
 C9Kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1718245863; x=1718850663;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=3w4iDYMbDQ8VqQWdAkr+pXXK7YGM0mHCHQpTjjn+CA4=;
 b=FqSWtL0Q53ettGdPI5tr+0XTj33aLXvpscUy7E2Na+dhHV3C4hLZwpemgOookcu/h9
 Oe8U97FY4cMJuB9bR9qWqFVcBdqpAPULVmkL9KZPGR0jm0CKfoZUh1FuE4zNcx+3Pmpt
 wDn2SrFXy9PWu/MNZJ9i61Uqt4heBrTnQhp2B9Ss0YOoOR4s2E51vMMr8r66JRUNMrAc
 sYbqeYdvBIl6bxSiVYOKpvsNl3NIb86qGBw6YfO2JHQeIINrRyfXHl3dyBnBlCF0X69c
 k1POPWIXgKPe0m2RNv/GhrZX6W51w5d5pObTKzcPmk/8VByMbSmdpyZAjjwwBFR8YMvl
 XOrQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVS42qlBfzkAGu2OydMcD67z2FERP6ah2CcTxuUF0JlXYiQ4zjv/DRqvF33ctYxY3bipo86hroan+a9pUtq2hI0y9VeZF1ZBOK6ZEatt3HE
X-Gm-Message-State: AOJu0YxU4Cf4d8qr+mDGNPI5mOh8/9gligbN4iNSoCDRk1kwK0cMvjMX
 +NaoePc5Ziu9Khf1R8z5xz9k9m3RBuQFlnV4xdcO3TwyF7Gjm3J+
X-Google-Smtp-Source: AGHT+IFHNRfsiu51tV3Is/1VFg4pMq/OwH4IEvQ35DxqQ9O+7zGa5prTyMS/UUJ19qnEah41eexFNg==
X-Received: by 2002:a17:902:c944:b0:1f6:ecf8:65e4 with SMTP id
 d9443c01a7336-1f83b5cf98fmr45292425ad.15.1718245862670; 
 Wed, 12 Jun 2024 19:31:02 -0700 (PDT)
Received: from localhost.localdomain ([39.144.105.92])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-1f855f4d159sm1755695ad.289.2024.06.12.19.30.56
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 12 Jun 2024 19:31:02 -0700 (PDT)
From: Yafang Shao <laoar.shao@gmail.com>
To: torvalds@linux-foundation.org
Cc: ebiederm@xmission.com, alexei.starovoitov@gmail.com, rostedt@goodmis.org,
 linux-mm@kvack.org, linux-fsdevel@vger.kernel.org,
 linux-trace-kernel@vger.kernel.org, audit@vger.kernel.org,
 linux-security-module@vger.kernel.org, selinux@vger.kernel.org,
 bpf@vger.kernel.org, netdev@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Yafang Shao <laoar.shao@gmail.com>
Subject: [PATCH v2 00/10] Improve the copy of task comm 
Date: Thu, 13 Jun 2024 10:30:34 +0800
Message-Id: <20240613023044.45873-1-laoar.shao@gmail.com>
X-Mailer: git-send-email 2.30.1 (Apple Git-130)
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Thu, 13 Jun 2024 09:26:31 +0000
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

PATCH #2~#4:  memcpy
PATCH #5:     kstrdup
PATCH #6~#8:  strncpy
PATCH #9~#10: strcpy

Suggested-by: Linus Torvalds <torvalds@linux-foundation.org>
Link: https://lore.kernel.org/all/CAHk-=wjAmmHUg6vho1KjzQi2=psR30+CogFd4aXrThr2gsiS4g@mail.gmail.com/ [0]

Changes:
v1->v2:
- Add comment for dropping task_lock() in __get_task_comm() (Alexei)
- Drop changes in trace event (Steven)
- Fix comment on task comm (Matus)
  
v1: https://lore.kernel.org/all/20240602023754.25443-1-laoar.shao@gmail.com/

Yafang Shao (10):
  fs/exec: Drop task_lock() inside __get_task_comm()
  auditsc: Replace memcpy() with __get_task_comm()
  security: Replace memcpy() with __get_task_comm()
  bpftool: Ensure task comm is always NUL-terminated
  mm/util: Fix possible race condition in kstrdup()
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
 mm/kmemleak.c                         |  8 +-------
 mm/util.c                             |  4 +++-
 net/ipv6/ndisc.c                      |  2 +-
 security/lsm_audit.c                  |  4 ++--
 security/selinux/selinuxfs.c          |  2 +-
 tools/bpf/bpftool/pids.c              |  2 ++
 14 files changed, 28 insertions(+), 24 deletions(-)

-- 
2.39.1

