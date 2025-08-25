Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D60F1B336E9
	for <lists+dri-devel@lfdr.de>; Mon, 25 Aug 2025 08:55:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B532310E34A;
	Mon, 25 Aug 2025 06:55:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="fhktT3NM";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-f177.google.com (mail-pg1-f177.google.com
 [209.85.215.177])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C77B910E236
 for <dri-devel@lists.freedesktop.org>; Mon, 25 Aug 2025 02:30:20 +0000 (UTC)
Received: by mail-pg1-f177.google.com with SMTP id
 41be03b00d2f7-b49c1c130c9so1726121a12.0
 for <dri-devel@lists.freedesktop.org>; Sun, 24 Aug 2025 19:30:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1756089020; x=1756693820; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:to
 :from:from:to:cc:subject:date:message-id:reply-to;
 bh=nYO/YmS5jL3ZM2fX1JrJ0oWdxchh893vzLzAxL1PuNk=;
 b=fhktT3NMDSInP+ej5fJXchb3eXcLPlb2VXMPeZ6QOxkxcQ0umDLAGVs7/fpVbHyeXQ
 MxFI5JqnpT63Kcz5uMGnOWS06KY8g+PhDwyxmcyrtZzt51I9RIQz4QI5TW1jco/Ak17P
 Gtah9cbJrt3Dp15kl9RZmIRq1bLyJ50gMuzuWXICT6bUn4yENuw64yDUyI4bePSgnhxL
 4cZtlf47Y0RUNemaFLfpoYwnjCfBi1ZvTmiTt+WNuTAM5bQa9b/FDH0fNR6k5TBqmEl3
 iyUBxW/fzX1d8pVApR+FaJYH8E3giwK6sCMBLxwjj+m6LR3GV/VXfZPib+odqWt6YU+S
 f3dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1756089020; x=1756693820;
 h=content-transfer-encoding:mime-version:message-id:date:subject:to
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=nYO/YmS5jL3ZM2fX1JrJ0oWdxchh893vzLzAxL1PuNk=;
 b=niifRW5S6jfchOGwWEnvAqC+zcnzYYhYVyg6HX3XGy7ZNxiXxLmfzQm8OK3SC6n67+
 pHkLr+ZApeqpSDhXWCssWLkosk6e246tvzzWDea8Uwb6TI2s/UN8CCfbJh3yOPZmUvOm
 S5N2AlgN77+0YcE0Fqy4ZYaEaq8EP8yIZv63fQoFrRHkBdAzwHdhlUVlVHptr9A4KxQ7
 zKAJzMv+GX6APmZr3WxmMmguiF9ihwtveQqkWGZ62hwWxdfUlGkShq8LUMMy3j9mjoQp
 bJK+0KsTaKwZBQ7L/oEJOpmvfznK8vRltN9/gHFeG1vkoC+DQOOtsoVjd07SUOlYVZTf
 t4kQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVbkZ/CVdviRvk0cS3EQ9CtKwSVQDMtKEknqDt3tapqtyUhAyJaN3jpwSwaVkVhow/Dqve/wMVmi4o=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwbZV3LnHNBaaImRitJiq9IfJB3UY4Nba4PaHj6l/nFom1gb79k
 UQwqZbt0ZbhyMftRWG57bynA5YWXuoHd71XiJJJONqpm8eW92yK/+qH3
X-Gm-Gg: ASbGncsDwwKyeBad32FOkscDHHbV5BYISnHKQ7eYxF7K0Jfo0zAluS1rjFKT8VLgXOx
 iLleusKWzfV/ngc4lXD2WYjP19eaYNbLGTgU+wUs9yCADVOQCRYTdBTFOQu1VTCExtmZ3OygX1T
 lXWDrJzca4evcmbBK9u7JiW9gYnCzYJgd4NcigWtuiAy6xmk9P+xOghv7MLEGWcwBky8hvIs2z+
 Gsutb4lWbr796FO+10zMUxIggILUzV52GWmaz+5JtU1hBgC2WpCMPSDtyiDcchYw0gI4A+Y87wK
 7hSmACQg7QwJLIS4BWryaMces7LQItt96kY22CZDOLv7w5wtWWDMMAu7e7If5gH0EeUoSDaiqzG
 qYnV5LDTN2zCfqVedORB0Pxyd03z+mVFmctaxVV+3GBUU3HRgC8TjOE7c+dymoW9QbIO8FpW1KJ
 E=
X-Google-Smtp-Source: AGHT+IGcXL928gw4jZtFeS2GjzwHFx9joFXeGHPpEdrU46U9OgXBCfZHOfrutnNUpiMm/H6uh+w8Yw==
X-Received: by 2002:a17:902:cec2:b0:236:9726:7264 with SMTP id
 d9443c01a7336-2462edc37a2mr159709745ad.5.1756089020026; 
 Sun, 24 Aug 2025 19:30:20 -0700 (PDT)
Received: from localhost.localdomain ([114.242.33.243])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-246687af234sm53905175ad.48.2025.08.24.19.30.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 24 Aug 2025 19:30:19 -0700 (PDT)
From: Jinchao Wang <wangjinchao600@gmail.com>
To: Andrew Morton <akpm@linux-foundation.org>, Baoquan He <bhe@redhat.com>,
 Yury Norov <yury.norov@gmail.com>, Qianqiang Liu <qianqiang.liu@163.com>,
 Simona Vetter <simona@ffwll.ch>, Helge Deller <deller@gmx.de>,
 Petr Mladek <pmladek@suse.com>, Steven Rostedt <rostedt@goodmis.org>,
 John Ogness <john.ogness@linutronix.de>,
 Sergey Senozhatsky <senozhatsky@chromium.org>,
 Vivek Goyal <vgoyal@redhat.com>, Dave Young <dyoung@redhat.com>,
 Kees Cook <kees@kernel.org>, Tony Luck <tony.luck@intel.com>,
 "Guilherme G. Piccoli" <gpiccoli@igalia.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 =?UTF-8?q?Ville=20Syrj=C3=A4l=C3=A4?= <ville.syrjala@linux.intel.com>,
 Shixiong Ou <oushixiong@kylinos.cn>,
 Jinchao Wang <wangjinchao600@gmail.com>, Zsolt Kajtar <soci@c64.rulez.org>,
 Ingo Molnar <mingo@kernel.org>, Nam Cao <namcao@linutronix.de>,
 Jonathan Cameron <Jonathan.Cameron@huawei.com>,
 Joel Fernandes <joelagnelf@nvidia.com>,
 Joel Granados <joel.granados@kernel.org>, Jason Gunthorpe <jgg@ziepe.ca>,
 Sohil Mehta <sohil.mehta@intel.com>,
 Feng Tang <feng.tang@linux.alibaba.com>,
 Sravan Kumar Gundu <sravankumarlpu@gmail.com>,
 Douglas Anderson <dianders@chromium.org>,
 Thomas Gleixner <tglx@linutronix.de>,
 Anna Schumaker <anna.schumaker@oracle.com>,
 "Darrick J. Wong" <djwong@kernel.org>,
 Max Kellermann <max.kellermann@ionos.com>,
 Yunhui Cui <cuiyunhui@bytedance.com>, Tejun Heo <tj@kernel.org>,
 Luo Gengkun <luogengkun@huaweicloud.com>, Li Huafei <lihuafei1@huawei.com>,
 Thorsten Blum <thorsten.blum@linux.dev>,
 Yicong Yang <yangyicong@hisilicon.com>, linux-fbdev@vger.kernel.org,
 dri-devel@lists.freedesktop.org, kexec@lists.infradead.org,
 linux-hardening@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v2 0/9] panic: introduce panic status function family
Date: Mon, 25 Aug 2025 10:29:28 +0800
Message-ID: <20250825022947.1596226-1-wangjinchao600@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Mon, 25 Aug 2025 06:55:43 +0000
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

This series introduces a family of helper functions to manage panic state and
updates existing code to use them.

Before this series, panic state helpers were scattered and inconsistent. For
example, panic_in_progress() was defined in printk/printk.c, not in panic.c or
panic.h. As a result, developers had to look in unexpected places to understand
or re-use panic state logic. Other checks were open- coded, duplicating logic
across panic, crash, and watchdog paths.

The new helpers centralize the functionality in panic.c/panic.h:
  - panic_try_start()
  - panic_reset()
  - panic_in_progress()
  - panic_on_this_cpu()
  - panic_on_other_cpu()

Patches 1–8 add the helpers and convert panic/crash and printk/nbcon code to
use them.

Patch 9 fixes a bug in the watchdog subsystem by skipping checks when a panic
is in progress, avoiding interference with the panic CPU.

Together, this makes panic state handling simpler, more discoverable, and more
robust.

-- 

Changes from v1:

  - The commit messages have been re-formatted based on Baoquan He's suggestions.
  - The panic_in_progress() check has been moved to be the first check in
    watchdog_overflow_callback(), as suggested by Yury Norov.

Link to v1:
https://lore.kernel.org/all/20250820091702.512524-1-wangjinchao600@gmail.com/

Jinchao Wang (9):
  panic: Introduce helper functions for panic state
  fbdev: Use panic_in_progress() helper
  crash_core: use panic_try_start() in crash_kexec()
  panic: use panic_try_start() in nmi_panic()
  panic: use panic_try_start() in vpanic()
  printk/nbcon: use panic_on_this_cpu() helper
  panic/printk: replace this_cpu_in_panic() with panic_on_this_cpu()
  panic/printk: replace other_cpu_in_panic() with panic_on_other_cpu()
  watchdog: skip checks when panic is in progress

 drivers/video/fbdev/core/fbcon.c  |  9 +---
 include/linux/panic.h             |  6 +++
 include/linux/printk.h            |  2 -
 kernel/crash_core.c               | 15 ++-----
 kernel/panic.c                    | 71 +++++++++++++++++++++++++------
 kernel/printk/internal.h          |  1 -
 kernel/printk/nbcon.c             | 14 +++---
 kernel/printk/printk.c            | 37 +++-------------
 kernel/printk/printk_ringbuffer.c |  2 +-
 kernel/watchdog.c                 |  6 +++
 kernel/watchdog_perf.c            |  4 ++
 lib/dump_stack.c                  |  2 +-
 12 files changed, 91 insertions(+), 78 deletions(-)

-- 
2.43.0

