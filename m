Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 97618CDDF1D
	for <lists+dri-devel@lfdr.de>; Thu, 25 Dec 2025 18:09:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7C81110EF9C;
	Thu, 25 Dec 2025 17:09:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="MhC8YWaA";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-f175.google.com (mail-yw1-f175.google.com
 [209.85.128.175])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 361CE10EF9C
 for <dri-devel@lists.freedesktop.org>; Thu, 25 Dec 2025 17:09:34 +0000 (UTC)
Received: by mail-yw1-f175.google.com with SMTP id
 00721157ae682-78fcb465733so40943607b3.3
 for <dri-devel@lists.freedesktop.org>; Thu, 25 Dec 2025 09:09:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1766682573; x=1767287373; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=k7qlVsNxJs5wHpy4xTAplw9Daf3JL+d5uEkSeiMaPJw=;
 b=MhC8YWaAtcE/OZDJPqPiUstoKx3R+Zt3oZwCrpoq/gOtNhFWhYph0gylPbTEv4hhA8
 /CK1huwa3psqNTl1uBClaluIbUppTmh04zvfMdgDuQL64vB3X3r4B+yzIUc6fSJH2Cdw
 BvoADp17+raUlNq13mO0pVsvtb73JfqaYv8lZT43dCHwQxVa3QX4ps4IaExd/73UN6kx
 2X/c6Kpg/1ANo0Q3JfyUuMDfOjBYm/LXQHepoqzvKtA8gIsJ3Z5XFu1CmnXfAt3+h+Eh
 PbujdQyjAX+dyazkeJzjFaaea2nI2gxWXSW8UQbxUwRhQfRVhncoCir6e9GHfgMvdkhN
 FktQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1766682573; x=1767287373;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=k7qlVsNxJs5wHpy4xTAplw9Daf3JL+d5uEkSeiMaPJw=;
 b=fQ84IItTSH2sHY9FVeP2sDksZ1pC6LSxKwELpRKe3+GdLfqgmABy8KRcdNO8zARlRK
 c5wOoShFYlSU4QWFs/bQ5fmsU9edYdWQ1brUCynuZAHasvTS35L2/h9Ve6bVLWSL6iKn
 jk3jZPDIVfwb1sS7bFfBuBp7bQNI5RLLyqOYYLbQoCYQmRwH3VS7JTr3Udec1fxOs1Db
 Res5T1aUcn7OmkZaip9bWNb5Qz9UxttPXk/e7DqcSUqE45pj09+bAS+XkAxNnkCplV9z
 FXko2dxZ3Myq6PCIai9GXh5QcCBieioxj9JrLuc2w8OtgS00TLR6XnR0UbmIPLclPjub
 uFUw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXkkASz0qUx7knWFUVZKUuh2MPcYAwNjL9KmMOh1e+jCQ3nmdm7GHkmGepoZrEsbRY8Kc/ARf1eIX8=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzFDvRNEJGh6AUAbl2k3jFhtfxFEC2aYN/pR6EivGzBfNPGE4r+
 yETVgyU2T9bdWBkdR83x4+YM6t+d8OtDB3kvsHheravguDS0sd1SNXbb
X-Gm-Gg: AY/fxX6LngEGLCjLCq3Eokd/Ry2KJCjIshxHhBmO67x62Qw3DLF4LtAhlE/CUCtPHS1
 Mv8NglTVAHiX4gmOWRO4jsmT0bLJdh3/7RoqnO5qw+ggDXBJN58bpOfcRPcUeeNFGAuYq8ZhuSP
 mtlabqpm4YAQcZwezxVSGgTNSPTRUcQXzfdnccHg/9UpafQNuxDppBhixCLHizSiRi/KMUcEkXT
 6LdKmiL/oBZBaabzyFY+9m5SNK00wwUKVDsWiTmM848hqpWgttMwspymqZlyZDkSnBDRhT9aJ93
 BEdetSmHDcBW1qmSWHQdhP7gelzsyrCQLowI6MhUQEdpYlxRrLZtUba1HOMToQHbcO4mWZjAhrd
 ESmlQrBh7CAOpK1LX9VEopVwqoD6gv8AT4vGwc6Aalm8zeC7hZMilg73wbHKn0iVGuaZZKp/jOy
 6pim2KC+0=
X-Google-Smtp-Source: AGHT+IFIuLpHsarRNwSoLm3t6E+K96wDE4rDGU/n9UNmyTCmfV0vn20FDQMesQWZb9h9vnQFHjeUuw==
X-Received: by 2002:a05:690c:488a:b0:78c:f9e:1f57 with SMTP id
 00721157ae682-78fb4084085mr193557537b3.28.1766682572925; 
 Thu, 25 Dec 2025 09:09:32 -0800 (PST)
Received: from localhost ([2601:346:0:79bd:5a70:118b:3656:4527])
 by smtp.gmail.com with ESMTPSA id
 00721157ae682-78fb44f0d4csm76080557b3.37.2025.12.25.09.09.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 25 Dec 2025 09:09:32 -0800 (PST)
From: "Yury Norov (NVIDIA)" <yury.norov@gmail.com>
To: Steven Rostedt <rostedt@goodmis.org>,
 Andrew Morton <akpm@linux-foundation.org>,
 Masami Hiramatsu <mhiramat@kernel.org>,
 Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Christophe Leroy <chleroy@kernel.org>,
 Randy Dunlap <rdunlap@infradead.org>, Ingo Molnar <mingo@kernel.org>,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 David Laight <david.laight@runbox.com>, Petr Pavlu <petr.pavlu@suse.com>,
 Andi Shyti <andi.shyti@kernel.org>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Tvrtko Ursulin <tursulin@ursulin.net>, Daniel Gomez <da.gomez@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 "Rafael J. Wysocki" <rafael@kernel.org>,
 Danilo Krummrich <dakr@kernel.org>, linux-kernel@vger.kernel.org,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-modules@vger.kernel.org, linux-trace-kernel@vger.kernel.org
Cc: "Yury Norov (NVIDIA)" <yury.norov@gmail.com>
Subject: [PATCH v4 0/7] Unload linux/kernel.h
Date: Thu, 25 Dec 2025 12:09:22 -0500
Message-ID: <20251225170930.1151781-1-yury.norov@gmail.com>
X-Mailer: git-send-email 2.43.0
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

kernel.h hosts declarations that can be placed better. This series
decouples kernel.h with some explicit and implicit dependencies; also,
moves tracing functionality to a new independent header.

My local build testing shows ~2% performance improvement for GCC + 
Ubuntu x86_64/localyesconfig.

v1: https://lore.kernel.org/all/20251129195304.204082-1-yury.norov@gmail.com/
v2: https://lore.kernel.org/all/20251203162329.280182-1-yury.norov@gmail.com/
v3: https://lore.kernel.org/all/20251205175237.242022-1-yury.norov@gmail.com/
v4: 
 - drop kernel.h dependency on linux/instruction_pointer.h (new patch #4);
 - drop trace_printk.h dependency on string.h (new patch #5 - Steven);
 - drop kernel.h dependency on trace_printk.h (new patch #7); 
 - explicitly tested CONFIG_FORTIFY x86_64 build with no issues.

0-DAY CI Kernel Test Service:
alpha                             allnoconfig    gcc-15.1.0
alpha                            allyesconfig    gcc-15.1.0
alpha                               defconfig    gcc-15.1.0
arc                              allmodconfig    clang-16
arc                              allmodconfig    gcc-15.1.0
arc                               allnoconfig    gcc-15.1.0
arc                              allyesconfig    clang-22
arc                              allyesconfig    gcc-15.1.0
arc                                 defconfig    gcc-15.1.0
arc                   randconfig-001-20251225    gcc-11.5.0
arc                   randconfig-002-20251225    gcc-11.5.0
arm                               allnoconfig    clang-22
arm                               allnoconfig    gcc-15.1.0
arm                              allyesconfig    clang-16
arm                              allyesconfig    gcc-15.1.0
arm                                 defconfig    gcc-15.1.0
arm                          exynos_defconfig    gcc-15.1.0
arm                   randconfig-001-20251225    gcc-11.5.0
arm                   randconfig-002-20251225    gcc-11.5.0
arm                   randconfig-003-20251225    gcc-11.5.0
arm                   randconfig-004-20251225    gcc-11.5.0
arm                           spitz_defconfig    gcc-15.1.0
arm64                            allmodconfig    clang-19
arm64                            allmodconfig    clang-22
arm64                             allnoconfig    gcc-15.1.0
arm64                               defconfig    gcc-15.1.0
arm64                 randconfig-001-20251225    clang-18
arm64                 randconfig-001-20251225    gcc-11.5.0
arm64                 randconfig-002-20251225    gcc-11.5.0
arm64                 randconfig-002-20251225    gcc-12.5.0
arm64                 randconfig-003-20251225    clang-22
arm64                 randconfig-003-20251225    gcc-11.5.0
arm64                 randconfig-004-20251225    clang-22
arm64                 randconfig-004-20251225    gcc-11.5.0
csky                             allmodconfig    gcc-15.1.0
csky                              allnoconfig    gcc-15.1.0
csky                                defconfig    gcc-15.1.0
csky                  randconfig-001-20251225    gcc-11.5.0
csky                  randconfig-001-20251225    gcc-15.1.0
csky                  randconfig-002-20251225    gcc-11.5.0
hexagon                          allmodconfig    clang-17
hexagon                          allmodconfig    gcc-15.1.0
hexagon                           allnoconfig    clang-22
hexagon                           allnoconfig    gcc-15.1.0
hexagon                             defconfig    gcc-15.1.0
hexagon               randconfig-001-20251225    clang-22
hexagon               randconfig-002-20251225    clang-22
i386                             allmodconfig    clang-20
i386                             allmodconfig    gcc-14
i386                              allnoconfig    gcc-14
i386                              allnoconfig    gcc-15.1.0
i386                             allyesconfig    clang-20
i386                             allyesconfig    gcc-14
i386        buildonly-randconfig-001-20251225    clang-20
i386        buildonly-randconfig-002-20251225    clang-20
i386        buildonly-randconfig-003-20251225    clang-20
i386        buildonly-randconfig-003-20251225    gcc-14
i386        buildonly-randconfig-004-20251225    clang-20
i386        buildonly-randconfig-005-20251225    clang-20
i386        buildonly-randconfig-006-20251225    clang-20
i386                  randconfig-007-20251225    clang-20
i386                  randconfig-011-20251225    clang-20
i386                  randconfig-011-20251225    gcc-14
i386                  randconfig-012-20251225    gcc-14
i386                  randconfig-013-20251225    gcc-14
i386                  randconfig-014-20251225    clang-20
i386                  randconfig-014-20251225    gcc-14
i386                  randconfig-015-20251225    gcc-14
i386                  randconfig-016-20251225    clang-20
i386                  randconfig-016-20251225    gcc-14
i386                  randconfig-017-20251225    clang-20
i386                  randconfig-017-20251225    gcc-14
loongarch                        allmodconfig    clang-19
loongarch                        allmodconfig    clang-22
loongarch                         allnoconfig    clang-22
loongarch                         allnoconfig    gcc-15.1.0
loongarch                           defconfig    clang-19
loongarch             randconfig-001-20251225    clang-22
loongarch             randconfig-002-20251225    clang-22
loongarch             randconfig-002-20251225    gcc-15.1.0
m68k                             allmodconfig    gcc-15.1.0
m68k                              allnoconfig    gcc-15.1.0
m68k                             allyesconfig    clang-16
m68k                             allyesconfig    gcc-15.1.0
m68k                                defconfig    clang-19
microblaze                        allnoconfig    gcc-15.1.0
microblaze                       allyesconfig    gcc-15.1.0
microblaze                          defconfig    clang-19
mips                             allmodconfig    gcc-15.1.0
mips                              allnoconfig    gcc-15.1.0
mips                             allyesconfig    gcc-15.1.0
mips                           gcw0_defconfig    gcc-15.1.0
nios2                            allmodconfig    clang-22
nios2                            allmodconfig    gcc-11.5.0
nios2                             allnoconfig    clang-22
nios2                             allnoconfig    gcc-11.5.0
nios2                               defconfig    clang-19
nios2                 randconfig-001-20251225    clang-22
nios2                 randconfig-001-20251225    gcc-9.5.0
nios2                 randconfig-002-20251225    clang-22
nios2                 randconfig-002-20251225    gcc-11.5.0
openrisc                         allmodconfig    clang-22
openrisc                         allmodconfig    gcc-15.1.0
openrisc                          allnoconfig    clang-22
openrisc                          allnoconfig    gcc-15.1.0
openrisc                            defconfig    gcc-15.1.0
parisc                           allmodconfig    gcc-15.1.0
parisc                            allnoconfig    clang-22
parisc                            allnoconfig    gcc-15.1.0
parisc                           allyesconfig    clang-19
parisc                           allyesconfig    gcc-15.1.0
parisc                              defconfig    gcc-15.1.0
parisc                randconfig-001-20251225    clang-22
parisc                randconfig-002-20251225    clang-22
parisc64                            defconfig    clang-19
powerpc                          allmodconfig    gcc-15.1.0
powerpc                           allnoconfig    clang-22
powerpc                           allnoconfig    gcc-15.1.0
powerpc                        cell_defconfig    gcc-15.1.0
powerpc                      pmac32_defconfig    gcc-15.1.0
powerpc               randconfig-001-20251225    clang-22
powerpc               randconfig-002-20251225    clang-22
powerpc64             randconfig-001-20251225    clang-22
powerpc64             randconfig-002-20251225    clang-22
riscv                            allmodconfig    clang-22
riscv                             allnoconfig    clang-22
riscv                             allnoconfig    gcc-15.1.0
riscv                            allyesconfig    clang-16
riscv                               defconfig    clang-22
riscv                               defconfig    gcc-15.1.0
riscv                 randconfig-001-20251225    clang-19
riscv                 randconfig-001-20251225    clang-22
riscv                 randconfig-002-20251225    clang-19
riscv                 randconfig-002-20251225    gcc-11.5.0
s390                             allmodconfig    clang-18
s390                             allmodconfig    clang-19
s390                              allnoconfig    clang-22
s390                             allyesconfig    gcc-15.1.0
s390                                defconfig    clang-22
s390                                defconfig    gcc-15.1.0
s390                  randconfig-001-20251225    clang-19
s390                  randconfig-001-20251225    gcc-14.3.0
s390                  randconfig-002-20251225    clang-19
sh                               allmodconfig    gcc-15.1.0
sh                                allnoconfig    clang-22
sh                                allnoconfig    gcc-15.1.0
sh                               allyesconfig    clang-19
sh                               allyesconfig    gcc-15.1.0
sh                                  defconfig    gcc-14
sh                    randconfig-001-20251225    clang-19
sh                    randconfig-001-20251225    gcc-15.1.0
sh                    randconfig-002-20251225    clang-19
sh                    randconfig-002-20251225    gcc-9.5.0
sh                           se7724_defconfig    gcc-15.1.0
sparc                             allnoconfig    clang-22
sparc                             allnoconfig    gcc-15.1.0
sparc                               defconfig    gcc-15.1.0
sparc                 randconfig-001-20251225    gcc-13
sparc                 randconfig-002-20251225    gcc-13
sparc64                          allmodconfig    clang-22
sparc64                             defconfig    gcc-14
sparc64               randconfig-001-20251225    gcc-13
sparc64               randconfig-002-20251225    gcc-13
um                               allmodconfig    clang-19
um                                allnoconfig    clang-22
um                               allyesconfig    gcc-14
um                               allyesconfig    gcc-15.1.0
um                                  defconfig    gcc-14
um                             i386_defconfig    gcc-14
um                    randconfig-001-20251225    gcc-13
um                    randconfig-002-20251225    gcc-13
um                           x86_64_defconfig    gcc-14
x86_64                           allmodconfig    clang-20
x86_64                            allnoconfig    clang-20
x86_64                            allnoconfig    clang-22
x86_64                           allyesconfig    clang-20
x86_64      buildonly-randconfig-001-20251225    clang-20
x86_64      buildonly-randconfig-001-20251225    gcc-14
x86_64      buildonly-randconfig-002-20251225    clang-20
x86_64      buildonly-randconfig-002-20251225    gcc-14
x86_64      buildonly-randconfig-003-20251225    gcc-14
x86_64      buildonly-randconfig-004-20251225    clang-20
x86_64      buildonly-randconfig-004-20251225    gcc-14
x86_64      buildonly-randconfig-005-20251225    gcc-14
x86_64      buildonly-randconfig-006-20251225    clang-20
x86_64      buildonly-randconfig-006-20251225    gcc-14
x86_64                              defconfig    gcc-14
x86_64                                  kexec    clang-20
x86_64                randconfig-001-20251225    clang-20
x86_64                randconfig-002-20251225    clang-20
x86_64                randconfig-003-20251225    clang-20
x86_64                randconfig-004-20251225    clang-20
x86_64                randconfig-005-20251225    clang-20
x86_64                randconfig-006-20251225    clang-20
x86_64                randconfig-011-20251225    gcc-13
x86_64                randconfig-012-20251225    gcc-13
x86_64                randconfig-012-20251225    gcc-14
x86_64                randconfig-013-20251225    clang-20
x86_64                randconfig-013-20251225    gcc-13
x86_64                randconfig-014-20251225    clang-20
x86_64                randconfig-014-20251225    gcc-13
x86_64                randconfig-015-20251225    gcc-13
x86_64                randconfig-015-20251225    gcc-14
x86_64                randconfig-016-20251225    clang-20
x86_64                randconfig-016-20251225    gcc-13
x86_64                randconfig-071-20251225    clang-20
x86_64                randconfig-072-20251225    clang-20
x86_64                randconfig-073-20251225    clang-20
x86_64                randconfig-073-20251225    gcc-14
x86_64                randconfig-074-20251225    clang-20
x86_64                randconfig-075-20251225    clang-20
x86_64                randconfig-075-20251225    gcc-14
x86_64                randconfig-076-20251225    clang-20
x86_64                randconfig-076-20251225    gcc-14
x86_64                               rhel-9.4    clang-20
x86_64                           rhel-9.4-bpf    gcc-14
x86_64                          rhel-9.4-func    clang-20
x86_64                    rhel-9.4-kselftests    clang-20
x86_64                         rhel-9.4-kunit    gcc-14
x86_64                           rhel-9.4-ltp    gcc-14
x86_64                          rhel-9.4-rust    clang-20
xtensa                            allnoconfig    clang-22
xtensa                            allnoconfig    gcc-15.1.0
xtensa                           allyesconfig    clang-22
xtensa                randconfig-001-20251225    gcc-13
xtensa                randconfig-002-20251225    gcc-13

Merry Christmas everybody!

Steven Rostedt (1):
  tracing: Remove size parameter in __trace_puts()

Yury Norov (NVIDIA) (6):
  kernel.h: drop STACK_MAGIC macro
  moduleparam: include required headers explicitly
  kernel.h: move VERIFY_OCTAL_PERMISSIONS() to sysfs.h
  kernel.h: include linux/instruction_pointer.h explicitly
  tracing: move tracing declarations from kernel.h to a dedicated header
  kernel.h: drop trace_printk.h

 Documentation/filesystems/sysfs.rst           |   2 +-
 arch/powerpc/kvm/book3s_xics.c                |   1 +
 arch/powerpc/xmon/xmon.c                      |   1 +
 arch/s390/include/asm/processor.h             |   1 +
 arch/s390/kernel/ipl.c                        |   1 +
 arch/s390/kernel/machine_kexec.c              |   1 +
 drivers/gpu/drm/i915/gt/intel_gtt.h           |   1 +
 .../drm/i915/gt/selftest_ring_submission.c    |   1 +
 drivers/gpu/drm/i915/i915_gem.h               |   1 +
 drivers/gpu/drm/i915/i915_selftest.h          |   2 +
 drivers/hwtracing/stm/dummy_stm.c             |   1 +
 drivers/infiniband/hw/hfi1/trace_dbg.h        |   1 +
 drivers/tty/sysrq.c                           |   1 +
 drivers/usb/early/xhci-dbc.c                  |   1 +
 fs/ext4/inline.c                              |   1 +
 include/linux/kernel.h                        | 209 ------------------
 include/linux/moduleparam.h                   |   7 +-
 include/linux/sunrpc/debug.h                  |   1 +
 include/linux/sysfs.h                         |  13 ++
 include/linux/trace_printk.h                  | 204 +++++++++++++++++
 include/linux/ww_mutex.h                      |   1 +
 kernel/debug/debug_core.c                     |   1 +
 kernel/panic.c                                |   1 +
 kernel/rcu/rcu.h                              |   1 +
 kernel/rcu/rcutorture.c                       |   1 +
 kernel/trace/error_report-traces.c            |   1 +
 kernel/trace/ring_buffer_benchmark.c          |   1 +
 kernel/trace/trace.c                          |   8 +-
 kernel/trace/trace.h                          |   2 +-
 kernel/trace/trace_benchmark.c                |   1 +
 kernel/trace/trace_events_trigger.c           |   1 +
 kernel/trace/trace_functions.c                |   1 +
 kernel/trace/trace_printk.c                   |   1 +
 kernel/trace/trace_selftest.c                 |   1 +
 lib/sys_info.c                                |   1 +
 samples/fprobe/fprobe_example.c               |   1 +
 samples/ftrace/ftrace-direct-modify.c         |   1 +
 samples/ftrace/ftrace-direct-multi-modify.c   |   1 +
 samples/ftrace/ftrace-direct-multi.c          |   1 +
 samples/ftrace/ftrace-direct-too.c            |   1 +
 samples/ftrace/ftrace-direct.c                |   1 +
 samples/trace_printk/trace-printk.c           |   1 +
 sound/hda/common/sysfs.c                      |   1 +
 43 files changed, 266 insertions(+), 216 deletions(-)
 create mode 100644 include/linux/trace_printk.h

-- 
2.43.0

