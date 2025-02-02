Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ED319A24D15
	for <lists+dri-devel@lfdr.de>; Sun,  2 Feb 2025 09:42:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 94DFE10E0FA;
	Sun,  2 Feb 2025 08:42:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-il1-f200.google.com (mail-il1-f200.google.com
 [209.85.166.200])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3B22510E08E
 for <dri-devel@lists.freedesktop.org>; Sun,  2 Feb 2025 08:42:03 +0000 (UTC)
Received: by mail-il1-f200.google.com with SMTP id
 e9e14a558f8ab-3a9d57cff85so66607455ab.2
 for <dri-devel@lists.freedesktop.org>; Sun, 02 Feb 2025 00:42:03 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1738485722; x=1739090522;
 h=content-transfer-encoding:to:from:subject:message-id:in-reply-to
 :date:mime-version:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=5OBvswRcQMr1wrRdi/K1kiJNN2HITkGaqEolHt/IsZU=;
 b=XIXuMfQ0zIxkkassed3lVyX1HaB1PNKoBkBOeZ0pasV05eecd7/dDyRQerGIcJENCO
 JK7Ev3cgpM3P9yHXplE3qc5it5TQj8T1eX2HvHQJrEnINB49Q18JK3FivumtOhQZ5uS3
 1PYUJZNITBRiRSvxYqFQexckf8NckE01szt6CPLUPQrVwdVaSYwMBBzCH+3j/GMHmcC7
 DsqKZR6BP9O1Hlgi/kqhR02DPBQ0u8kzvjKC4Ueua/e2RgbV32zwGHYpVW4DrKEfSeMA
 SXOw28uw0d+O2a1VZLeud7s/GLNVGTta49Q1CweCFtsKvKVDtTc/C8AUyjHeyu2Qvp8u
 /D5g==
X-Forwarded-Encrypted: i=1;
 AJvYcCX0GCjZx44kPaRnMBGVfmgL0QYaOhPFD/7NkWJJrrW2GWahUJekiTzfyOWVbiuA6qhZ3me2D7pgn6M=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwAMv13YntPVZLmcPKC3eVhG1ZNwzUzpFhEfUITAr3RDrJShzMp
 R71/brB3qnWxswtE7gPgDmf28lP8G1YxZTU8iH/eQOO9LP+f9R+vNxKSU15vOyPMe2B/yv2Pzm+
 nSDDenj626rJOGj+wo5EZQgLGHXt+ON3lRJd8a+dOAIhZe+RO1gSH3RE=
X-Google-Smtp-Source: AGHT+IEvTWAWw3ZlB5myJri5aP+7bMqDqaeJvUtUOYAW3aN9rR8UlyJS8H1s6JAyRcrOJDn0XQO00FSGWXdamRiaIw9eQfyw2fZb
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:1906:b0:3cf:ce7c:b8b7 with SMTP id
 e9e14a558f8ab-3cffe3f6ed8mr160244565ab.10.1738485722439; Sun, 02 Feb 2025
 00:42:02 -0800 (PST)
Date: Sun, 02 Feb 2025 00:42:02 -0800
In-Reply-To: <IA0PR11MB718530978AB2AA3EF198E436F8EA2@IA0PR11MB7185.namprd11.prod.outlook.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <679f2fda.050a0220.163cdc.002d.GAE@google.com>
Subject: Re: [syzbot] [mm?] kernel BUG in alloc_hugetlb_folio_reserve
From: syzbot <syzbot+a504cb5bae4fe117ba94@syzkaller.appspotmail.com>
To: akpm@linux-foundation.org, david@redhat.com, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 linux-mm@kvack.org, muchun.song@linux.dev, steven.sistare@oracle.com, 
 syzkaller-bugs@googlegroups.com, vivek.kasireddy@intel.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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

Hello,

syzbot tried to test the proposed patch but the build/boot failed:

ion.
[    2.130514][    T0] rcu: 	RCU lockdep checking is enabled.
[    2.131658][    T0] rcu: 	RCU restricting CPUs from NR_CPUS=3D8 to nr_cp=
u_ids=3D2.
[    2.133496][    T0] rcu: 	RCU callback double-/use-after-free debug is e=
nabled.
[    2.135607][    T0] rcu: 	RCU debug extended QS entry/exit.
[    2.136968][    T0] 	All grace periods are expedited (rcu_expedited).
[    2.138639][    T0] 	Trampoline variant of Tasks RCU enabled.
[    2.140002][    T0] 	Tracing variant of Tasks RCU enabled.
[    2.141336][    T0] rcu: RCU calculated value of scheduler-enlistment de=
lay is 10 jiffies.
[    2.143973][    T0] rcu: Adjusting geometry for rcu_fanout_leaf=3D16, nr=
_cpu_ids=3D2
[    2.145728][    T0] Running RCU synchronous self tests
[    2.146981][    T0] RCU Tasks: Setting shift to 1 and lim to 1 rcu_task_=
cb_adjust=3D1 rcu_task_cpu_ids=3D2.
[    2.149915][    T0] RCU Tasks Trace: Setting shift to 1 and lim to 1 rcu=
_task_cb_adjust=3D1 rcu_task_cpu_ids=3D2.
[    2.258608][    T0] NR_IRQS: 4352, nr_irqs: 440, preallocated irqs: 16
[    2.261704][    T0] rcu: srcu_init: Setting srcu_struct sizes based on c=
ontention.
[    2.264082][    T0] kfence: initialized - using 2097152 bytes for 255 ob=
jects at 0xffff88823be00000-0xffff88823c000000
[    2.269374][    T0] Console: colour VGA+ 80x25
[    2.270603][    T0] printk: legacy console [ttyS0] enabled
[    2.270603][    T0] printk: legacy console [ttyS0] enabled
[    2.272761][    T0] printk: legacy bootconsole [earlyser0] disabled
[    2.272761][    T0] printk: legacy bootconsole [earlyser0] disabled
[    2.275644][    T0] Lock dependency validator: Copyright (c) 2006 Red Ha=
t, Inc., Ingo Molnar
[    2.277975][    T0] ... MAX_LOCKDEP_SUBCLASSES:  8
[    2.279183][    T0] ... MAX_LOCK_DEPTH:          48
[    2.280447][    T0] ... MAX_LOCKDEP_KEYS:        8192
[    2.281361][    T0] ... CLASSHASH_SIZE:          4096
[    2.282394][    T0] ... MAX_LOCKDEP_ENTRIES:     1048576
[    2.283558][    T0] ... MAX_LOCKDEP_CHAINS:      1048576
[    2.284862][    T0] ... CHAINHASH_SIZE:          524288
[    2.286806][    T0]  memory used by lock dependency info: 106625 kB
[    2.288529][    T0]  memory used for stack traces: 8320 kB
[    2.289602][    T0]  per task-struct memory footprint: 1920 bytes
[    2.291238][    T0] mempolicy: Enabling automatic NUMA balancing. Config=
ure with numa_balancing=3D or the kernel.numa_balancing sysctl
[    2.294409][    T0] ACPI: Core revision 20240827
[    2.296355][    T0] APIC: Switch to symmetric I/O mode setup
[    2.298209][    T0] x2apic enabled
[    2.303688][    T0] APIC: Switched APIC routing to: physical x2apic
[    2.311364][    T0] ..TIMER: vector=3D0x30 apic1=3D0 pin1=3D0 apic2=3D-1=
 pin2=3D-1
[    2.313609][    T0] clocksource: tsc-early: mask: 0xffffffffffffffff max=
_cycles: 0x1fb6feccdd0, max_idle_ns: 440795259471 ns
[    2.316871][    T0] Calibrating delay loop (skipped) preset value.. 4400=
.43 BogoMIPS (lpj=3D22002160)
[    2.319890][    T0] Last level iTLB entries: 4KB 64, 2MB 8, 4MB 8
[    2.321307][    T0] Last level dTLB entries: 4KB 64, 2MB 0, 4MB 0, 1GB 4
[    2.322770][    T0] Spectre V1 : Mitigation: usercopy/swapgs barriers an=
d __user pointer sanitization
[    2.324366][    T0] Spectre V2 : Spectre BHI mitigation: SW BHB clearing=
 on syscall and VM exit
[    2.326870][    T0] Spectre V2 : Mitigation: IBRS
[    2.327601][    T0] Spectre V2 : Spectre v2 / SpectreRSB mitigation: Fil=
ling RSB on context switch
[    2.330500][    T0] Spectre V2 : Spectre v2 / SpectreRSB : Filling RSB o=
n VMEXIT
[    2.332726][    T0] RETBleed: Mitigation: IBRS
[    2.333465][    T0] Spectre V2 : mitigation: Enabling conditional Indire=
ct Branch Prediction Barrier
[    2.334871][    T0] Spectre V2 : User space: Mitigation: STIBP via prctl
[    2.336078][    T0] Speculative Store Bypass: Mitigation: Speculative St=
ore Bypass disabled via prctl
[    2.336905][    T0] MDS: Mitigation: Clear CPU buffers
[    2.337878][    T0] TAA: Mitigation: Clear CPU buffers
[    2.338896][    T0] MMIO Stale Data: Vulnerable: Clear CPU buffers attem=
pted, no microcode
[    2.340555][    T0] x86/fpu: Supporting XSAVE feature 0x001: 'x87 floati=
ng point registers'
[    2.342580][    T0] x86/fpu: Supporting XSAVE feature 0x002: 'SSE regist=
ers'
[    2.344048][    T0] x86/fpu: Supporting XSAVE feature 0x004: 'AVX regist=
ers'
[    2.345382][    T0] x86/fpu: xstate_offset[2]:  576, xstate_sizes[2]:  2=
56
[    2.346865][    T0] x86/fpu: Enabled xstate features 0x7, context size i=
s 832 bytes, using 'standard' format.
[    2.588452][    T0] Freeing SMP alternatives memory: 128K
[    2.590535][    T0] pid_max: default: 32768 minimum: 301
[    2.592277][    T0] LSM: initializing lsm=3Dlockdown,capability,landlock=
,yama,safesetid,tomoyo,apparmor,bpf,ima,evm
[    2.595992][    T0] landlock: Up and running.
[    2.596871][    T0] Yama: becoming mindful.
[    2.598081][    T0] TOMOYO Linux initialized
[    2.599898][    T0] AppArmor: AppArmor initialized
[    2.602499][    T0] LSM support for eBPF active
[    2.608983][    T0] Dentry cache hash table entries: 1048576 (order: 11,=
 8388608 bytes, vmalloc hugepage)
[    2.615415][    T0] Inode-cache hash table entries: 524288 (order: 10, 4=
194304 bytes, vmalloc hugepage)
[    2.617267][    T0] Mount-cache hash table entries: 16384 (order: 5, 131=
072 bytes, vmalloc)
[    2.619434][    T0] Mountpoint-cache hash table entries: 16384 (order: 5=
, 131072 bytes, vmalloc)
[    2.627035][    T0] Running RCU synchronous self tests
[    2.628129][    T0] Running RCU synchronous self tests
[    2.750438][    T1] smpboot: CPU0: Intel(R) Xeon(R) CPU @ 2.20GHz (famil=
y: 0x6, model: 0x4f, stepping: 0x0)
[    2.756853][    T1] Running RCU Tasks wait API self tests
[    2.857346][    T1] Running RCU Tasks Trace wait API self tests
[    2.859468][    T1] Performance Events: unsupported p6 CPU model 79 no P=
MU driver, software events only.
[    2.861809][    T1] signal: max sigframe size: 1776
[    2.863570][    T1] rcu: Hierarchical SRCU implementation.
[    2.865262][    T1] rcu: 	Max phase no-delay instances is 1000.
[    2.867896][    T1] Timer migration: 1 hierarchy levels; 8 children per =
group; 0 crossnode level
[    2.874826][    T1] NMI watchdog: Perf NMI watchdog permanently disabled
[    2.877129][   T15] Callback from call_rcu_tasks_trace() invoked.
[    2.879103][    T1] smp: Bringing up secondary CPUs ...
[    2.882760][    T1] smpboot: x86: Booting SMP configuration:
[    2.884255][    T1] .... node  #0, CPUs:      #1
[    2.886979][   T22] ------------[ cut here ]------------
[    2.886979][   T22] workqueue: work disable count underflowed
[    2.886979][   T22] WARNING: CPU: 1 PID: 22 at kernel/workqueue.c:4317 e=
nable_work+0x34d/0x360
[    2.886979][   T22] Modules linked in:
[    2.886979][   T22] CPU: 1 UID: 0 PID: 22 Comm: cpuhp/1 Not tainted 6.13=
.0-rc6-syzkaller-00914-g69b73d2c8219 #0
[    2.886979][   T22] Hardware name: Google Google Compute Engine/Google C=
ompute Engine, BIOS Google 12/27/2024
[    2.886979][   T22] RIP: 0010:enable_work+0x34d/0x360
[    2.886979][   T22] Code: d8 5b 41 5c 41 5d 41 5e 41 5f 5d c3 cc cc cc c=
c e8 a8 83 37 00 c6 05 89 be 9b 0e 01 90 48 c7 c7 a0 d0 09 8c e8 d4 25 f8 f=
f 90 <0f> 0b 90 90 e9 56 ff ff ff e8 45 a7 60 0a 0f 1f 44 00 00 90 90 90
[    2.886979][   T22] RSP: 0000:ffffc900001c7bc0 EFLAGS: 00010046
[    2.886979][   T22] RAX: 2f26641b0aa6cb00 RBX: 0000000000000000 RCX: fff=
f88801cee3c00
[    2.886979][   T22] RDX: 0000000000000000 RSI: 0000000000000000 RDI: 000=
0000000000000
[    2.886979][   T22] RBP: ffffc900001c7c88 R08: ffffffff81600af2 R09: 1ff=
ffffff1cfa0f4
[    2.886979][   T22] R10: dffffc0000000000 R11: fffffbfff1cfa0f5 R12: 1ff=
ff92000038f7c
[    2.886979][   T22] R13: 1ffff92000038f84 R14: 001fffffffc00001 R15: fff=
f8880b8738770
[    2.886979][   T22] FS:  0000000000000000(0000) GS:ffff8880b8700000(0000=
) knlGS:0000000000000000
[    2.886979][   T22] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[    2.886979][   T22] CR2: 0000000000000000 CR3: 000000000e736000 CR4: 000=
00000003506f0
[    2.886979][   T22] DR0: 0000000000000000 DR1: 0000000000000000 DR2: 000=
0000000000000
[    2.886979][   T22] DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 000=
0000000000400
[    2.886979][   T22] Call Trace:
[    2.886979][   T22]  <TASK>
[    2.886979][   T22]  ? __warn+0x165/0x4d0
[    2.886979][   T22]  ? enable_work+0x34d/0x360
[    2.886979][   T22]  ? report_bug+0x2b3/0x500
[    2.886979][   T22]  ? enable_work+0x34d/0x360
[    2.886979][   T22]  ? handle_bug+0x60/0x90
[    2.886979][   T22]  ? exc_invalid_op+0x1a/0x50
[    2.886979][   T22]  ? asm_exc_invalid_op+0x1a/0x20
[    2.886979][   T22]  ? __warn_printk+0x292/0x360
[    2.886979][   T22]  ? enable_work+0x34d/0x360
[    2.886979][   T22]  ? __pfx_enable_work+0x10/0x10
[    2.886979][   T22]  ? __pfx_vmstat_cpu_online+0x10/0x10
[    2.886979][   T22]  ? rcu_is_watching+0x15/0xb0
[    2.886979][   T22]  vmstat_cpu_online+0xbb/0xe0
[    2.886979][   T22]  ? __pfx_vmstat_cpu_online+0x10/0x10
[    2.886979][   T22]  cpuhp_invoke_callback+0x48d/0x830
[    2.886979][   T22]  ? __pfx_vmstat_cpu_online+0x10/0x10
[    2.886979][   T22]  cpuhp_thread_fun+0x41c/0x810
[    2.886979][   T22]  ? cpuhp_thread_fun+0x130/0x810
[    2.886979][   T22]  ? __pfx_cpuhp_thread_fun+0x10/0x10
[    2.886979][   T22]  ? _raw_spin_unlock_irqrestore+0xdd/0x140
[    2.886979][   T22]  ? __pfx_cpuhp_thread_fun+0x10/0x10
[    2.886979][   T22]  smpboot_thread_fn+0x544/0xa30
[    2.886979][   T22]  ? smpboot_thread_fn+0x4e/0xa30
[    2.886979][   T22]  ? __pfx_smpboot_thread_fn+0x10/0x10
[    2.886979][   T22]  kthread+0x2f0/0x390
[    2.886979][   T22]  ? __pfx_smpboot_thread_fn+0x10/0x10
[    2.886979][   T22]  ? __pfx_kthread+0x10/0x10
[    2.886979][   T22]  ret_from_fork+0x4b/0x80
[    2.886979][   T22]  ? __pfx_kthread+0x10/0x10
[    2.886979][   T22]  ret_from_fork_asm+0x1a/0x30
[    2.886979][   T22]  </TASK>
[    2.886979][   T22] Kernel panic - not syncing: kernel: panic_on_warn se=
t ...
[    2.886979][   T22] CPU: 1 UID: 0 PID: 22 Comm: cpuhp/1 Not tainted 6.13=
.0-rc6-syzkaller-00914-g69b73d2c8219 #0
[    2.886979][   T22] Hardware name: Google Google Compute Engine/Google C=
ompute Engine, BIOS Google 12/27/2024
[    2.886979][   T22] Call Trace:
[    2.886979][   T22]  <TASK>
[    2.886979][   T22]  dump_stack_lvl+0x241/0x360
[    2.886979][   T22]  ? __pfx_dump_stack_lvl+0x10/0x10
[    2.886979][   T22]  ? rcu_is_watching+0x15/0xb0
[    2.886979][   T22]  ? notifier_call_chain+0x3cc/0x3f0
[    2.886979][   T22]  ? atomic_notifier_call_chain+0x26/0x180
[    2.886979][   T22]  panic+0x438/0x950
[    2.886979][   T22]  ? is_bpf_text_address+0x26/0x2a0
[    2.886979][   T22]  ? __pfx_panic+0x10/0x10
[    2.886979][   T22]  ? __warn+0x174/0x4d0
[    2.886979][   T22]  ? ret_from_fork_asm+0x1a/0x30
[    2.886979][   T22]  __warn+0x344/0x4d0
[    2.886979][   T22]  ? enable_work+0x34d/0x360
[    2.886979][   T22]  report_bug+0x2b3/0x500
[    2.886979][   T22]  ? enable_work+0x34d/0x360
[    2.886979][   T22]  handle_bug+0x60/0x90
[    2.886979][   T22]  exc_invalid_op+0x1a/0x50
[    2.886979][   T22]  asm_exc_invalid_op+0x1a/0x20
[    2.886979][   T22] RIP: 0010:enable_work+0x34d/0x360
[    2.886979][   T22] Code: d8 5b 41 5c 41 5d 41 5e 41 5f 5d c3 cc cc cc c=
c e8 a8 83 37 00 c6 05 89 be 9b 0e 01 90 48 c7 c7 a0 d0 09 8c e8 d4 25 f8 f=
f 90 <0f> 0b 90 90 e9 56 ff ff ff e8 45 a7 60 0a 0f 1f 44 00 00 90 90 90
[    2.886979][   T22] RSP: 0000:ffffc900001c7bc0 EFLAGS: 00010046
[    2.886979][   T22] RAX: 2f26641b0aa6cb00 RBX: 0000000000000000 RCX: fff=
f88801cee3c00
[    2.886979][   T22] RDX: 0000000000000000 RSI: 0000000000000000 RDI: 000=
0000000000000
[    2.886979][   T22] RBP: ffffc900001c7c88 R08: ffffffff81600af2 R09: 1ff=
ffffff1cfa0f4
[    2.886979][   T22] R10: dffffc0000000000 R11: fffffbfff1cfa0f5 R12: 1ff=
ff92000038f7c
[    2.886979][   T22] R13: 1ffff92000038f84 R14: 001fffffffc00001 R15: fff=
f8880b8738770
[    2.886979][   T22]  ? __warn_printk+0x292/0x360
[    2.886979][   T22]  ? __pfx_enable_work+0x10/0x10
[    2.886979][   T22]  ? __pfx_vmstat_cpu_online+0x10/0x10
[    2.886979][   T22]  ? rcu_is_watching+0x15/0xb0
[    2.886979][   T22]  vmstat_cpu_online+0xbb/0xe0
[    2.886979][   T22]  ? __pfx_vmstat_cpu_online+0x10/0x10
[    2.886979][   T22]  cpuhp_invoke_callback+0x48d/0x830
[    2.886979][   T22]  ? __pfx_vmstat_cpu_online+0x10/0x10
[    2.886979][   T22]  cpuhp_thread_fun+0x41c/0x810
[    2.886979][   T22]  ? cpuhp_thread_fun+0x130/0x810
[    2.886979][   T22]  ? __pfx_cpuhp_thread_fun+0x10/0x10
[    2.886979][   T22]  ? _raw_spin_unlock_irqrestore+0xdd/0x140
[    2.886979][   T22]  ? __pfx_cpuhp_thread_fun+0x10/0x10
[    2.886979][   T22]  smpboot_thread_fn+0x544/0xa30
[    2.886979][   T22]  ? smpboot_thread_fn+0x4e/0xa30
[    2.886979][   T22]  ? __pfx_smpboot_thread_fn+0x10/0x10
[    2.886979][   T22]  kthread+0x2f0/0x390
[    2.886979][   T22]  ? __pfx_smpboot_thread_fn+0x10/0x10
[    2.886979][   T22]  ? __pfx_kthread+0x10/0x10
[    2.886979][   T22]  ret_from_fork+0x4b/0x80
[    2.886979][   T22]  ? __pfx_kthread+0x10/0x10
[    2.886979][   T22]  ret_from_fork_asm+0x1a/0x30
[    2.886979][   T22]  </TASK>
[    2.886979][   T22] Rebooting in 86400 seconds..


syzkaller build log:
go env (err=3D<nil>)
GO111MODULE=3D'auto'
GOARCH=3D'amd64'
GOBIN=3D''
GOCACHE=3D'/syzkaller/.cache/go-build'
GOENV=3D'/syzkaller/.config/go/env'
GOEXE=3D''
GOEXPERIMENT=3D''
GOFLAGS=3D''
GOHOSTARCH=3D'amd64'
GOHOSTOS=3D'linux'
GOINSECURE=3D''
GOMODCACHE=3D'/syzkaller/jobs-2/linux/gopath/pkg/mod'
GONOPROXY=3D''
GONOSUMDB=3D''
GOOS=3D'linux'
GOPATH=3D'/syzkaller/jobs-2/linux/gopath'
GOPRIVATE=3D''
GOPROXY=3D'https://proxy.golang.org,direct'
GOROOT=3D'/usr/local/go'
GOSUMDB=3D'sum.golang.org'
GOTMPDIR=3D''
GOTOOLCHAIN=3D'auto'
GOTOOLDIR=3D'/usr/local/go/pkg/tool/linux_amd64'
GOVCS=3D''
GOVERSION=3D'go1.22.7'
GCCGO=3D'gccgo'
GOAMD64=3D'v1'
AR=3D'ar'
CC=3D'gcc'
CXX=3D'g++'
CGO_ENABLED=3D'1'
GOMOD=3D'/syzkaller/jobs-2/linux/gopath/src/github.com/google/syzkaller/go.=
mod'
GOWORK=3D''
CGO_CFLAGS=3D'-O2 -g'
CGO_CPPFLAGS=3D''
CGO_CXXFLAGS=3D'-O2 -g'
CGO_FFLAGS=3D'-O2 -g'
CGO_LDFLAGS=3D'-O2 -g'
PKG_CONFIG=3D'pkg-config'
GOGCCFLAGS=3D'-fPIC -m64 -pthread -Wl,--no-gc-sections -fmessage-length=3D0=
 -ffile-prefix-map=3D/tmp/go-build3618939523=3D/tmp/go-build -gno-record-gc=
c-switches'

git status (err=3D<nil>)
HEAD detached at 0dff8567c6
nothing to commit, working tree clean


tput: No value for $TERM and no -T specified
tput: No value for $TERM and no -T specified
Makefile:31: run command via tools/syz-env for best compatibility, see:
Makefile:32: https://github.com/google/syzkaller/blob/master/docs/contribut=
ing.md#using-syz-env
go list -f '{{.Stale}}' ./sys/syz-sysgen | grep -q false || go install ./sy=
s/syz-sysgen
make .descriptions
tput: No value for $TERM and no -T specified
tput: No value for $TERM and no -T specified
Makefile:31: run command via tools/syz-env for best compatibility, see:
Makefile:32: https://github.com/google/syzkaller/blob/master/docs/contribut=
ing.md#using-syz-env
bin/syz-sysgen
touch .descriptions
GOOS=3Dlinux GOARCH=3Damd64 go build "-ldflags=3D-s -w -X github.com/google=
/syzkaller/prog.GitRevision=3D0dff8567c67759be4a708acb57229945322c6c88 -X '=
github.com/google/syzkaller/prog.gitRevisionDate=3D20250201-114913'" -o ./b=
in/linux_amd64/syz-execprog github.com/google/syzkaller/tools/syz-execprog
mkdir -p ./bin/linux_amd64
g++ -o ./bin/linux_amd64/syz-executor executor/executor.cc \
	-m64 -O2 -pthread -Wall -Werror -Wparentheses -Wunused-const-variable -Wfr=
ame-larger-than=3D16384 -Wno-stringop-overflow -Wno-array-bounds -Wno-forma=
t-overflow -Wno-unused-but-set-variable -Wno-unused-command-line-argument -=
static-pie -std=3Dc++17 -I. -Iexecutor/_include   -DGOOS_linux=3D1 -DGOARCH=
_amd64=3D1 \
	-DHOSTGOOS_linux=3D1 -DGIT_REVISION=3D\"0dff8567c67759be4a708acb5722994532=
2c6c88\"
go: downloading github.com/google/flatbuffers v25.1.24+incompatible
go: downloading golang.org/x/oauth2 v0.25.0
/usr/bin/ld: /tmp/ccBqfu1T.o: in function `Connection::Connect(char const*,=
 char const*)':
executor.cc:(.text._ZN10Connection7ConnectEPKcS1_[_ZN10Connection7ConnectEP=
KcS1_]+0x104): warning: Using 'gethostbyname' in statically linked applicat=
ions requires at runtime the shared libraries from the glibc version used f=
or linking


Error text is too large and was truncated, full error text is at:
https://syzkaller.appspot.com/x/error.txt?x=3D15941724580000


Tested on:

commit:         69b73d2c mm/memfd: reserve hugetlb folios before alloc..
git tree:       https://gitlab.freedesktop.org/Vivek/drm-tip.git syzbot_fix=
_htlb_reserve
kernel config:  https://syzkaller.appspot.com/x/.config?x=3De794247163dd8c0=
0
dashboard link: https://syzkaller.appspot.com/bug?extid=3Da504cb5bae4fe117b=
a94
compiler:       Debian clang version 15.0.6, GNU ld (GNU Binutils for Debia=
n) 2.40

Note: no patches were applied.
