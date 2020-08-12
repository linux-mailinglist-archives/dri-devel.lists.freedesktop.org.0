Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B7CC7243491
	for <lists+dri-devel@lfdr.de>; Thu, 13 Aug 2020 09:13:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7356D6E554;
	Thu, 13 Aug 2020 07:12:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ua1-x942.google.com (mail-ua1-x942.google.com
 [IPv6:2607:f8b0:4864:20::942])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 824E489262
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Aug 2020 15:11:47 +0000 (UTC)
Received: by mail-ua1-x942.google.com with SMTP id e20so708679uav.3
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Aug 2020 08:11:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=87Qzao6Lbi8v1XuUSAX3Tg/795D/ih1dtdkKHUQH4EU=;
 b=o12pXmbSJgy6Kb8rM+Q1GLD30rQ0DfGlqy0FfWtEJYD+NkuWhIIZLvB3HxaQNOiJo5
 N0mLWdFGKXlXIIBK1w6Ir6DcRvOZ//mQ5PPZb138PQfUd8ugWylkU1g+M+TBaEtLamr9
 fac9KVUyeYnmMWodhf4ovl2Z2SxGYuiNVmampTcQWcRsKDgRT6OBB6LhL6hxXrmJ4i5I
 qH2+9PqNhUi7I/1vRPJjuwMv2LZ5xIt+NyFPD8zkdY0C+uGtuaiBGMvda0Pxo38+1k3z
 ond1Ye60wqtOkZheEdFwPDphlwAw24CBYxGjvOjeKNcd11od6PxqtQuEz+6Uk1zFUvPW
 c3Bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=87Qzao6Lbi8v1XuUSAX3Tg/795D/ih1dtdkKHUQH4EU=;
 b=JaJKvKtJ+8Y8vpj8zPe3dectMq+b8RM6FcT6SJifU0JPcaXfs8tFfVChupTRw/D4Hg
 oFnGGPtQ1NXrzwSdTrgj/bBxhN5m+P1hoQl2oj+gcEhr9oLQ6ofLRz/g6sEOgafE2gvB
 hXp9D1dO+d+a9TkcUTu3LbGZpOt5VWGggx3dTgGaDD9Cw05VKX7iYuPsiSVY63a/P1ew
 /XBx6gFPQkKt3T1RvOFHPQ4bCz3yqjvzzYU+MPV8i49CzLRYVzptIubsyRsokh53if1t
 BL2MAfKcFH37FazThzvoUAVLIe9vWTAsOWc9ZsO+y+6PnOI/h26WkGfuilzFe0kALxFR
 mqkw==
X-Gm-Message-State: AOAM531ILiRD5oJrMKO4yNMMZMj2LCyl+5Kj2kKFSy1A4jaqPi9u8wdd
 NiI5iXt2Z+kSDW20HXHxzdYJxZlKvjWYs+j5hD0=
X-Google-Smtp-Source: ABdhPJxqvBm82GiqDiF3SeDSnoY1CCXU9ByjEolMYJ9VBN/Ks2i+ZvwQZB98JvxYxhODvym11bq0XgZFpIvG241po/o=
X-Received: by 2002:ab0:14c8:: with SMTP id f8mr4437385uae.23.1597245106319;
 Wed, 12 Aug 2020 08:11:46 -0700 (PDT)
MIME-Version: 1.0
References: <20200807200957.1269454-9-jim.cromie@gmail.com>
 <20200809043537.GB30891@shao2-debian>
In-Reply-To: <20200809043537.GB30891@shao2-debian>
From: jim.cromie@gmail.com
Date: Wed, 12 Aug 2020 09:11:19 -0600
Message-ID: <CAJfuBxyKVXwL+UU12EhZ8V7Omf_gGjzyYo8MezRC+1LnqG6pGQ@mail.gmail.com>
Subject: Re: [dyndbg] 4397a3e7bf:
 BUG:sleeping_function_called_from_invalid_context_at_mm/slab.h
To: kernel test robot <lkp@intel.com>
X-Mailman-Approved-At: Thu, 13 Aug 2020 07:12:31 +0000
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
Cc: LKML <linux-kernel@vger.kernel.org>, dri-devel@lists.freedesktop.org,
 linaro-mm-sig@lists.linaro.org, lkp@lists.01.org,
 Jason Baron <jbaron@akamai.com>, linux-media@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sat, Aug 8, 2020 at 10:36 PM kernel test robot <lkp@intel.com> wrote:
>
>
> If you fix the issue, kindly add following tag
> Reported-by: kernel test robot <lkp@intel.com>
>
>
> [   29.668135] BUG: sleeping function called from invalid context at mm/slab.h:567
> [   29.668942] in_atomic(): 1, irqs_disabled(): 0, non_block: 0, pid: 1, name: swapper/0
> [   29.669798] 4 locks held by swapper/0/1:
> [   29.670263]  #0: ffff8fe0d5065040 (&zspage->lock){.+.+}-{2:2}, at: zs_map_object+0x82/0x330
> [   29.671178]  #1: ffff8fe0d5065040 (&zspage->lock){.+.+}-{2:2}, at: zs_map_object+0x82/0x330
> [   29.672091]  #2: ffff8fe0d5065040 (&zspage->lock){.+.+}-{2:2}, at: zs_map_object+0x82/0x330
> [   29.672988]  #3: ffff8fe0d5065040 (&zspage->lock){.+.+}-{2:2}, at: zs_map_object+0x82/0x330
> [   29.673892] Preemption disabled at:
> [   29.673894] [<ffffffff97bcb678>] zs_map_object+0x38/0x330

So, this looks worrying.
I mean, 4 locks taken by same code.
Its feeling like an api misunderstanding.

so 1st question:  is zpool / zmalloc not intended for use / setup
during __init ?
I seem to be breaking basic rules.
my zpool is filled with a late_initcall, I also tried
late_initcall_sync to try to
wait out all the other init stuff, that didnt work.

the point of this patch was to not retire every mapping right after it is used,
but to keep those for enabled callsites.
all these are mapped RO
It appears those locks are held across the map-unmap interval ??
I wouldnt expect that much pr-debug traffic, nor any parellelism at
all (no -smp qemu args)

Id also add that Ive seen a bunch of different lockdep reports
from different configurations, all more complicated than this one.



> [   29.674897] CPU: 1 PID: 1 Comm: swapper/0 Not tainted 5.8.0-10185-g4397a3e7bf020 #1
> [   29.675728] Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BIOS 1.12.0-1 04/01/2014
> [   29.676622] Call Trace:
> [   29.676956]  dump_stack+0x96/0xd0
> [   29.677358]  ___might_sleep.cold+0xff/0x115
> [   29.677831]  ? getname_kernel+0x25/0x110
> [   29.678281]  kmem_cache_alloc+0x212/0x2d0
> [   29.678739]  getname_kernel+0x25/0x110
> [   29.679175]  ? rest_init+0x23e/0x23e
> [   29.679598]  kernel_execve+0x19/0x1c0
> [   29.680034]  kernel_init+0x6e/0x112
> [   29.680450]  ret_from_fork+0x22/0x30
> [   29.680905]
> [   29.681171] =============================
> [   29.681629] [ BUG: Invalid wait context ]
> [   29.682087] 5.8.0-10185-g4397a3e7bf020 #1 Tainted: G        W
> [   29.682741] -----------------------------
> [   29.683200] swapper/0/1 is trying to lock:
> [   29.683663] ffff8fe003808128 (&mm->mmap_lock#2){++++}-{3:3}, at: alloc_bprm+0x126/0x2b0
> [   29.684537] other info that might help us debug this:
> [   29.685079] context-{4:4}
> [   29.685426] 4 locks held by swapper/0/1:
> [   29.685876]  #0: ffff8fe0d5065040 (&zspage->lock){.+.+}-{2:2}, at: zs_map_object+0x82/0x330
> [   29.686767]  #1: ffff8fe0d5065040 (&zspage->lock){.+.+}-{2:2}, at: zs_map_object+0x82/0x330
> [   29.687659]  #2: ffff8fe0d5065040 (&zspage->lock){.+.+}-{2:2}, at: zs_map_object+0x82/0x330
> [   29.688557]  #3: ffff8fe0d5065040 (&zspage->lock){.+.+}-{2:2}, at: zs_map_object+0x82/0x330
> [   29.689449] stack backtrace:
> [   29.689817] CPU: 1 PID: 1 Comm: swapper/0 Tainted: G        W         5.8.0-10185-g4397a3e7bf020 #1
> [   29.690762] Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BIOS 1.12.0-1 04/01/2014
> [   29.691651] Call Trace:
> [   29.691990]  dump_stack+0x96/0xd0
> [   29.692396]  __lock_acquire.cold+0xc4/0x1a5
> [   29.692870]  lock_acquire+0xab/0x390
> [   29.693295]  ? alloc_bprm+0x126/0x2b0
> [   29.693728]  down_write_killable+0x3d/0xa0
> [   29.695267]  ? alloc_bprm+0x126/0x2b0
> [   29.695701]  alloc_bprm+0x126/0x2b0
> [   29.696125]  ? rest_init+0x23e/0x23e
> [   29.696551]  kernel_execve+0x38/0x1c0
> [   29.696983]  kernel_init+0x6e/0x112
> [   29.697401]  ret_from_fork+0x22/0x30
> [   29.697888] BUG: scheduling while atomic: swapper/0/1/0x00000011
> [   29.698541] INFO: lockdep is turned off.
> [   29.699000] Modules linked in:
> [   29.699396] Preemption disabled at:
> [   29.699398] [<ffffffff97bcb678>] zs_map_object+0x38/0x330
> [   29.700414] CPU: 1 PID: 1 Comm: swapper/0 Tainted: G        W         5.8.0-10185-g4397a3e7bf020 #1
> [   29.701373] Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BIOS 1.12.0-1 04/01/2014
> [   29.702268] Call Trace:
> [   29.702604]  dump_stack+0x96/0xd0
> [   29.703012]  __schedule_bug.cold+0xa1/0xb2
> [   29.703482]  __schedule+0x8e3/0xa90
> [   29.703906]  ? try_to_wake_up+0x1d0/0x860
> [   29.704371]  ? wait_for_completion+0x81/0x110
> [   29.704861]  schedule+0x53/0x100
> [   29.705259]  schedule_timeout+0x205/0x2b0
> [   29.705722]  ? try_to_wake_up+0x7d/0x860
> [   29.706176]  ? _raw_spin_unlock_irq+0x24/0x50
> [   29.706666]  ? wait_for_completion+0x81/0x110
> [   29.707155]  ? wait_for_completion+0x81/0x110
> [   29.707646]  wait_for_completion+0xab/0x110
> [   29.708130]  stop_one_cpu+0x87/0xb0
> [   29.708551]  ? set_cpus_allowed_ptr+0x20/0x20
> [   29.709044]  ? _raw_spin_unlock_irqrestore+0x41/0x70
> [   29.709581]  sched_exec+0x98/0xd0
> [   29.709989]  bprm_execve+0x1d7/0x3a0
> [   29.710416]  ? rest_init+0x23e/0x23e
> [   29.710844]  kernel_execve+0x135/0x1c0
> [   29.711284]  kernel_init+0x6e/0x112
> [   29.711703]  ret_from_fork+0x22/0x30
> [   29.712298] Failed to execute /init (error -14)
> [   29.713523] Run /sbin/init as init process
> [   29.714612]   with arguments:
> [   29.715484]     /sbin/init
> [   29.716328]   with environment:
> [   29.717235]     HOME=/
> [   29.717983]     TERM=linux
> [   29.718801]     user=lkp
> [   29.719587]     job=/lkp/jobs/scheduled/vm-snb-151/boot-1-aliyun-x86_64-20190626.cgz-4397a3e7bf020ef040be371dcc178db258b928b4-20200808-11882-w8z2ep-10.yaml
> [   29.721551]     ARCH=x86_64
> [   29.721986]     kconfig=x86_64-rhel-7.6-kselftests
> [   29.722623]     branch=linux-review/Jim-Cromie/dyndbg-WIP-diet-plan/20200808-041343
> [   29.723634]     commit=4397a3e7bf020ef040be371dcc178db258b928b4
> [   29.724395]     BOOT_IMAGE=/pkg/linux/x86_64-rhel-7.6-kselftests/gcc-9/4397a3e7bf020ef040be371dcc178db258b928b4/vmlinuz-5.8.0-10185-g4397a3e7bf020
> [   29.725943]     max_uptime=600
> [   29.726406]     RESULT_ROOT=/result/boot/1/vm-snb/aliyun-x86_64-20190626.cgz/x86_64-rhel-7.6-kselftests/gcc-9/4397a3e7bf020ef040be371dcc178db258b928b4/8
> [   29.728009]     LKP_SERVER=inn
> [   29.728475]     softlockup_panic=1
> [   29.728969]     prompt_ramdisk=0
> [   29.729449]     vga=normal
> [   29.729967] Starting init: /sbin/init exists but couldn't execute it (error -14)
> [   29.730967] Run /etc/init as init process
> [   29.731526]   with arguments:
> [   29.731986]     /etc/init
> [   29.732410]   with environment:
> [   29.732880]     HOME=/
> [   29.733277]     TERM=linux
> [   29.733711]     user=lkp
> [   29.734125]     job=/lkp/jobs/scheduled/vm-snb-151/boot-1-aliyun-x86_64-20190626.cgz-4397a3e7bf020ef040be371dcc178db258b928b4-20200808-11882-w8z2ep-10.yaml
> [   29.735762]     ARCH=x86_64
> [   29.736211]     kconfig=x86_64-rhel-7.6-kselftests
> [   29.736844]     branch=linux-review/Jim-Cromie/dyndbg-WIP-diet-plan/20200808-041343
> [   29.737860]     commit=4397a3e7bf020ef040be371dcc178db258b928b4
> [   29.738609]     BOOT_IMAGE=/pkg/linux/x86_64-rhel-7.6-kselftests/gcc-9/4397a3e7bf020ef040be371dcc178db258b928b4/vmlinuz-5.8.0-10185-g4397a3e7bf020
> [   29.740172]     max_uptime=600
> [   29.740634]     RESULT_ROOT=/result/boot/1/vm-snb/aliyun-x86_64-20190626.cgz/x86_64-rhel-7.6-kselftests/gcc-9/4397a3e7bf020ef040be371dcc178db258b928b4/8
> [   29.742238]     LKP_SERVER=inn
> [   29.742699]     softlockup_panic=1
> [   29.743202]     prompt_ramdisk=0
> [   29.743680]     vga=normal
> [   29.744156] Run /bin/init as init process
> [   29.744719]   with arguments:
> [   29.745179]     /bin/init
> [   29.745599]   with environment:
> [   29.746074]     HOME=/
> [   29.746468]     TERM=linux
> [   29.746894]     user=lkp
> [   29.747309]     job=/lkp/jobs/scheduled/vm-snb-151/boot-1-aliyun-x86_64-20190626.cgz-4397a3e7bf020ef040be371dcc178db258b928b4-20200808-11882-w8z2ep-10.yaml
> [   29.748964]     ARCH=x86_64
> [   29.749406]     kconfig=x86_64-rhel-7.6-kselftests
> [   29.750047]     branch=linux-review/Jim-Cromie/dyndbg-WIP-diet-plan/20200808-041343
> [   29.751067]     commit=4397a3e7bf020ef040be371dcc178db258b928b4
> [   29.751818]     BOOT_IMAGE=/pkg/linux/x86_64-rhel-7.6-kselftests/gcc-9/4397a3e7bf020ef040be371dcc178db258b928b4/vmlinuz-5.8.0-10185-g4397a3e7bf020
> [   29.753381]     max_uptime=600
> [   29.753845]     RESULT_ROOT=/result/boot/1/vm-snb/aliyun-x86_64-20190626.cgz/x86_64-rhel-7.6-kselftests/gcc-9/4397a3e7bf020ef040be371dcc178db258b928b4/8
> [   29.755455]     LKP_SERVER=inn
> [   29.755923]     softlockup_panic=1
> [   29.756425]     prompt_ramdisk=0
> [   29.756905]     vga=normal
> [   29.757375] Run /bin/sh as init process
> [   29.757921]   with arguments:
> [   29.758380]     /bin/sh
> [   29.758782]   with environment:
> [   29.759256]     HOME=/
> [   29.759650]     TERM=linux
> [   29.760089]     user=lkp
> [   29.760501]     job=/lkp/jobs/scheduled/vm-snb-151/boot-1-aliyun-x86_64-20190626.cgz-4397a3e7bf020ef040be371dcc178db258b928b4-20200808-11882-w8z2ep-10.yaml
> [   29.762137]     ARCH=x86_64
> [   29.762574]     kconfig=x86_64-rhel-7.6-kselftests
> [   29.763213]     branch=linux-review/Jim-Cromie/dyndbg-WIP-diet-plan/20200808-041343
> [   29.764255]     commit=4397a3e7bf020ef040be371dcc178db258b928b4
> [   29.765006]     BOOT_IMAGE=/pkg/linux/x86_64-rhel-7.6-kselftests/gcc-9/4397a3e7bf020ef040be371dcc178db258b928b4/vmlinuz-5.8.0-10185-g4397a3e7bf020
> [   29.766567]     max_uptime=600
>
>
> To reproduce:
>
>         # build kernel
>         cd linux
>         cp config-5.8.0-10185-g4397a3e7bf020 .config
>         make HOSTCC=gcc-9 CC=gcc-9 ARCH=x86_64 olddefconfig prepare modules_prepare bzImage
>
>         git clone https://github.com/intel/lkp-tests.git
>         cd lkp-tests
>         bin/lkp qemu -k <bzImage> job-script # job-script is attached in this email
>
>
>
> Thanks,
> lkp
>
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
