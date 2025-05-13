Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C67AAB51F2
	for <lists+dri-devel@lfdr.de>; Tue, 13 May 2025 12:23:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E50FB10E55A;
	Tue, 13 May 2025 10:23:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from invmail4.hynix.com (exvmail4.skhynix.com [166.125.252.92])
 by gabe.freedesktop.org (Postfix) with ESMTP id 8054D10E556
 for <dri-devel@lists.freedesktop.org>; Tue, 13 May 2025 10:23:07 +0000 (UTC)
X-AuditID: a67dfc5b-669ff7000002311f-3a-682319ee2425
From: Byungchul Park <byungchul@sk.com>
To: linux-kernel@vger.kernel.org
Cc: kernel_team@skhynix.com, torvalds@linux-foundation.org,
 damien.lemoal@opensource.wdc.com, linux-ide@vger.kernel.org,
 adilger.kernel@dilger.ca, linux-ext4@vger.kernel.org, mingo@redhat.com,
 peterz@infradead.org, will@kernel.org, tglx@linutronix.de,
 rostedt@goodmis.org, joel@joelfernandes.org, sashal@kernel.org,
 daniel.vetter@ffwll.ch, duyuyang@gmail.com, johannes.berg@intel.com,
 tj@kernel.org, tytso@mit.edu, willy@infradead.org, david@fromorbit.com,
 amir73il@gmail.com, gregkh@linuxfoundation.org, kernel-team@lge.com,
 linux-mm@kvack.org, akpm@linux-foundation.org, mhocko@kernel.org,
 minchan@kernel.org, hannes@cmpxchg.org, vdavydov.dev@gmail.com,
 sj@kernel.org, jglisse@redhat.com, dennis@kernel.org, cl@linux.com,
 penberg@kernel.org, rientjes@google.com, vbabka@suse.cz, ngupta@vflare.org,
 linux-block@vger.kernel.org, josef@toxicpanda.com,
 linux-fsdevel@vger.kernel.org, jack@suse.cz, jlayton@kernel.org,
 dan.j.williams@intel.com, hch@infradead.org, djwong@kernel.org,
 dri-devel@lists.freedesktop.org, rodrigosiqueiramelo@gmail.com,
 melissa.srw@gmail.com, hamohammed.sa@gmail.com, harry.yoo@oracle.com,
 chris.p.wilson@intel.com, gwan-gyeong.mun@intel.com,
 max.byungchul.park@gmail.com, boqun.feng@gmail.com, longman@redhat.com,
 yskelg@gmail.com, yunseong.kim@ericsson.com, yeoreum.yun@arm.com,
 netdev@vger.kernel.org, matthew.brost@intel.com, her0gyugyu@gmail.com
Subject: [PATCH v15 08/43] x86_64,
 dept: add support CONFIG_ARCH_HAS_DEPT_SUPPORT to x86_64
Date: Tue, 13 May 2025 19:06:55 +0900
Message-Id: <20250513100730.12664-9-byungchul@sk.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20250513100730.12664-1-byungchul@sk.com>
References: <20250513100730.12664-1-byungchul@sk.com>
X-Brightmail-Tracker: H4sIAAAAAAAAAzWSf0yMcRzHfZ/nued5Op09O60eMj/O7yjOwmeG+TlPYtPMJmXc9NTdVHKX
 fthYp6McJaaiX65wpS7qyuRHLZnTj8nRqSShEamrKXeTfnDV/PPZa+/3e+/PP28aF5sEM2lF
 eCSvDJeFSkghIbQ653r2zZgvX/k1eznYfiUSkHXPQIL5bhECQ7kag+7nO6DF3otg+OUrHNJT
 zQhyP3/AodzUgaCy4AwJTV+mgcXWT0Jd6gUS4m/eI+F1zwgG7WlXMCgy7oaP+i4CGlLyMEjv
 JiEzPR5znO8YDOkLKdDHLYTOggwKRj5Loa6jWQCVbcvgek47CU8q6wgwVXRi0PQoi4QOw18B
 NJhqCbAnu4P5cpIAivvySOix63HQ2/opeFOtw8Ckc4USjaPw3OCYAF4kVWNw7lYpBpZ3jxFU
 JX7CwGhoJuGZrReDMmMqDn/ynyPoTLZScPbiEAWZ6mQEF86mEaBpXw3Dvx2fs39JQX2jhIDi
 0Wa0aQNnyDEg7llvP85pyqK5P7a3JFdp1xFcfR7LPcz4QHGaqjaK0xlPcGUFHtzNJ90Ylztg
 E3DGwvMkZxy4QnFaqwXj+hobqT2zDgjXB/GhiiheuWLjYaH8fbaViKh3iRmOv03EoR+MFjnR
 LOPNjlVU4FpET/DVDNW4TDKL2dbWIXycXZi5bFlSl0CLhDTONE9lW7LfoXFjOhPAtr+6PMEE
 s5AdffuGGGcRs5rV3C8kJ/vnsEUl1RNFTswadjS/cSIjdmRSdEXEZCbdidVqAid5Bvu0oJVI
 QSIdmlKIxIrwqDCZItTbSx4brojxOnIszIgc69KfGgmoQAPmvTWIoZHEWVTbPU8uFsiiVLFh
 NYilcYmLSP3AIYmCZLEneeWxQ8oTobyqBrnThMRNtMoeHSRmQmSR/FGej+CV/12MdpoZhzbn
 otYd0cHO/KVFWRFyc+m6+VcX+H3p2pU2drg3sC/zdv3swaUtu65vOe0rjftWXrI1MWrfwYQx
 ssU9xI+S7p7+LdBS5W89Xmq9FlwTktCY8D0ksmrY37s4z37np327xc0n2H9n24G1SzLNXU3B
 i7b2bHztk+/rrMY9Xfm95/3o/dskhEouk3rgSpXsH/5nLBBZAwAA
X-Brightmail-Tracker: H4sIAAAAAAAAAzWSfUzMcRzH+/6eO85+O+GHeegsNs1DKJ8ta4bNz0NiszE2+uE3d1yX3Sll
 Q7nTuJSKUyKucKUOuSvloZxaqVDRM+eomUlPG91NKrna/PPea+/3e+/PPx8Gl90jZzFK9XFR
 oxZUckpCSLYF65b0z1ygWP7y41RwDZ4n4MZDCwWNDwoQWIriMeiu2ght7l4Ew28bcEg3NiLI
 7vyEQ1G1E0FZ3lkKmr5OgWbXAAW1xkQKdLcfUvCuZwQDx9U0DAqsofDZ/I2A1yk5GKR3U3A9
 XYd55DsGQ+Z8GsxxftCVl0nDSGcA1DpbSajMqiWh7IM/XLvpoOB5WS0B1aVdGDQ9vUGB0zJG
 wuvqGgLcybOhMTWJhPv9ORT0uM04mF0DNLy3mzCoNk2HQr1nNeHXXxJeJdkxSLjzCIPmjmcI
 ys9/wcBqaaWg0tWLgc1qxOFPbhWCruQ+Gs5dHKLhenwygsRzVwnQOwJh+LfnctZgAMTfKiTg
 /mgrWhvCW25aEF/ZO4DzetsJ/o+rheLL3CaCr8vh+CeZn2heX/6B5k3WKN6Wt5i//bwb47N/
 ukjemn+B4q0/02je0NeM8f319fT2OXskaw6JKmW0qFkWEi5RfMzqI47V+cQM6+4ScegHa0AM
 w7GruCuZWgPyZih2EdfePoSPsw87n7MlfSMNSMLgbOskri2rA40HU9m9nKMhdYIJ1o8bbXlP
 jLOUDeT0xfnUOHPsPK6g0D4x5M0GcaO59RMdmaeTYiogUpDEhLzykY9SHR0hKFWBS7VHFbFq
 ZczSg5ERVuR5IPOpkdRSNNi0sQKxDJJPltZ0+ypkpBCtjY2oQByDy32k8SUeS3pIiD0paiL3
 a6JUorYCzWYI+Qzp5l1iuIw9LBwXj4riMVHzP8UY71lx6G34iqQx4U1iKCl2SMYafgcFdBaf
 znGE+Knc61cnvBLCDGe3rseJfQvb645sSF/rP6YxFmUoHkdNNr/w3Tv3R+i9B7kzttXonU5Z
 VUOYXT3lUm4LOcfrb3ByYqqC3Gn0kqbp/M94hx6YtmTHyjbXulLp1y12v9X2gchN5ZdtGSW7
 5YRWIQQsxjVa4R+GEGaMPAMAAA==
X-CFilter-Loop: Reflected
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

dept needs to notice every entrance from user to kernel mode to treat
every kernel context independently when tracking wait-event dependencies.
Roughly, system call and user oriented fault are the cases.

Make dept aware of the entrances of x86_64 and add support
CONFIG_ARCH_HAS_DEPT_SUPPORT to x86_64.

Signed-off-by: Byungchul Park <byungchul@sk.com>
---
 arch/x86/Kconfig            | 1 +
 arch/x86/entry/syscall_64.c | 7 +++++++
 arch/x86/mm/fault.c         | 7 +++++++
 3 files changed, 15 insertions(+)

diff --git a/arch/x86/Kconfig b/arch/x86/Kconfig
index 5873c9e39919..4b6d9e59d96c 100644
--- a/arch/x86/Kconfig
+++ b/arch/x86/Kconfig
@@ -38,6 +38,7 @@ config X86_64
 	select ARCH_HAS_ELFCORE_COMPAT
 	select ZONE_DMA32
 	select EXECMEM if DYNAMIC_FTRACE
+	select ARCH_HAS_DEPT_SUPPORT
 
 config FORCE_DYNAMIC_FTRACE
 	def_bool y
diff --git a/arch/x86/entry/syscall_64.c b/arch/x86/entry/syscall_64.c
index b6e68ea98b83..66bd5af5aff1 100644
--- a/arch/x86/entry/syscall_64.c
+++ b/arch/x86/entry/syscall_64.c
@@ -8,6 +8,7 @@
 #include <linux/entry-common.h>
 #include <linux/nospec.h>
 #include <asm/syscall.h>
+#include <linux/dept.h>
 
 #define __SYSCALL(nr, sym) extern long __x64_##sym(const struct pt_regs *);
 #define __SYSCALL_NORETURN(nr, sym) extern long __noreturn __x64_##sym(const struct pt_regs *);
@@ -86,6 +87,12 @@ static __always_inline bool do_syscall_x32(struct pt_regs *regs, int nr)
 /* Returns true to return using SYSRET, or false to use IRET */
 __visible noinstr bool do_syscall_64(struct pt_regs *regs, int nr)
 {
+	/*
+	 * This is a system call from user mode.  Make dept work with a
+	 * new kernel mode context.
+	 */
+	dept_update_cxt();
+
 	add_random_kstack_offset();
 	nr = syscall_enter_from_user_mode(regs, nr);
 
diff --git a/arch/x86/mm/fault.c b/arch/x86/mm/fault.c
index 296d294142c8..241537ce47fe 100644
--- a/arch/x86/mm/fault.c
+++ b/arch/x86/mm/fault.c
@@ -20,6 +20,7 @@
 #include <linux/mm_types.h>
 #include <linux/mm.h>			/* find_and_lock_vma() */
 #include <linux/vmalloc.h>
+#include <linux/dept.h>
 
 #include <asm/cpufeature.h>		/* boot_cpu_has, ...		*/
 #include <asm/traps.h>			/* dotraplinkage, ...		*/
@@ -1220,6 +1221,12 @@ void do_user_addr_fault(struct pt_regs *regs,
 	tsk = current;
 	mm = tsk->mm;
 
+	/*
+	 * This fault comes from user mode.  Make dept work with a new
+	 * kernel mode context.
+	 */
+	dept_update_cxt();
+
 	if (unlikely((error_code & (X86_PF_USER | X86_PF_INSTR)) == X86_PF_INSTR)) {
 		/*
 		 * Whoops, this is kernel mode code trying to execute from
-- 
2.17.1

