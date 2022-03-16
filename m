Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E2B54DAD89
	for <lists+dri-devel@lfdr.de>; Wed, 16 Mar 2022 10:30:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CFA8C10E327;
	Wed, 16 Mar 2022 09:30:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x633.google.com (mail-pl1-x633.google.com
 [IPv6:2607:f8b0:4864:20::633])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 75B1110E327
 for <dri-devel@lists.freedesktop.org>; Wed, 16 Mar 2022 09:30:15 +0000 (UTC)
Received: by mail-pl1-x633.google.com with SMTP id q11so1300961pln.11
 for <dri-devel@lists.freedesktop.org>; Wed, 16 Mar 2022 02:30:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=7YtA4PKUNK1dlzTx/+dzDDwxLZbii02Hkl6fdvscBxc=;
 b=KVlegeKfeY8W67qw6DCRgUShajC9v378ZrSbgZ8Y0HtviKaBmr2m5+8eyDmK6v8H7G
 0k4SKtLdQMzPWKYvWjIUw0JR80sIdV3nL/kZsp/8CMWPi0qzlJYHpdb6mTsxG5IplBDw
 Thjkg26PVRf89HpwWIaOAsMjwtBy88ghXsm3oCEO44EdAiRuJ+Hy1ivpDe/BbZ7lcgZd
 dHBTIFzQC/kC/yrS730ReRdUhoP2+Aaw4VueXzMK0UoB7ipdFT9/d6fVdvDr2cfqj6nn
 WNwm/S0LF7EvMRSd+YYrg4Smn09H44hOEzfTH45IP3+FlPTrlirMRsSVXsDe7ukKTlyO
 OEOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=7YtA4PKUNK1dlzTx/+dzDDwxLZbii02Hkl6fdvscBxc=;
 b=d8xN8dVg9zKyDcC3/qYH7yntdF/ups9fvATAHexDnuOVAAkGdzvMDbM+AhsCjskBH4
 tCHF1JaRSgmt2Z8y+bWcXOQyNnKc5bTJJJrDDvnKlB5LmnRYN5d43KNhsMu4ESKIy8pV
 aeuXwBrYJaly4XlNVWT7fkNUyyr60nmy1EAbuHIze5QiRluBlu+KRdUNsfUr5hkpCP7u
 s8IWBVUB5m50qWfIyv+9TulSA2upu5lpHmexoex6ZguydHqqEQdQZDBsLgl0+1KCwJAG
 RyD1HEqCo7hXytjjBjqO2/iJDLCmtAbfm7L04mqT31gBqOUOEDIz5ed7jlQ6AI60vApf
 ZaNw==
X-Gm-Message-State: AOAM530MnGNJcCOJDAOyNDGK0OW0/CtwPuNjxhQ0WE2d6ewUbyuge5D4
 Rnp+DzUttTXDiV5NWrnQ85rZQx4H0uMAWIXR
X-Google-Smtp-Source: ABdhPJzonkpDhlI2fR4HgAVkbUVABxaINz60vwbRBqde0ZZEBs11+G4Wm7i86hUtVDnumBtYwvPoTA==
X-Received: by 2002:a17:902:a502:b0:151:8289:b19 with SMTP id
 s2-20020a170902a50200b0015182890b19mr32422431plq.149.1647423014943; 
 Wed, 16 Mar 2022 02:30:14 -0700 (PDT)
Received: from ip-172-31-19-208.ap-northeast-1.compute.internal
 (ec2-18-181-137-102.ap-northeast-1.compute.amazonaws.com. [18.181.137.102])
 by smtp.gmail.com with ESMTPSA id
 x29-20020aa79a5d000000b004f0ef1822d3sm2081888pfj.128.2022.03.16.02.30.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 16 Mar 2022 02:30:14 -0700 (PDT)
Date: Wed, 16 Mar 2022 09:30:02 +0000
From: Hyeonggon Yoo <42.hyeyoo@gmail.com>
To: Byungchul Park <byungchul.park@lge.com>
Subject: Re: [PATCH v4 00/24] DEPT(Dependency Tracker)
Message-ID: <YjGuGmdiZCpRt98n@ip-172-31-19-208.ap-northeast-1.compute.internal>
References: <1646377603-19730-1-git-send-email-byungchul.park@lge.com>
 <Yiv9Fn4kcRbXJLmu@ip-172-31-19-208.ap-northeast-1.compute.internal>
 <20220316043212.GA5715@X58A-UD3R>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220316043212.GA5715@X58A-UD3R>
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
Cc: hamohammed.sa@gmail.com, jack@suse.cz, peterz@infradead.org,
 daniel.vetter@ffwll.ch, amir73il@gmail.com, david@fromorbit.com,
 dri-devel@lists.freedesktop.org, chris@chris-wilson.co.uk,
 bfields@fieldses.org, linux-ide@vger.kernel.org, adilger.kernel@dilger.ca,
 joel@joelfernandes.org, cl@linux.com, will@kernel.org, duyuyang@gmail.com,
 sashal@kernel.org, paolo.valente@linaro.org, damien.lemoal@opensource.wdc.com,
 willy@infradead.org, hch@infradead.org, airlied@linux.ie, mingo@redhat.com,
 djwong@kernel.org, vdavydov.dev@gmail.com, rientjes@google.com,
 dennis@kernel.org, linux-ext4@vger.kernel.org, linux-mm@kvack.org,
 ngupta@vflare.org, johannes.berg@intel.com, jack@suse.com,
 dan.j.williams@intel.com, josef@toxicpanda.com, rostedt@goodmis.org,
 linux-block@vger.kernel.org, linux-fsdevel@vger.kernel.org, jglisse@redhat.com,
 viro@zeniv.linux.org.uk, tglx@linutronix.de, mhocko@kernel.org, vbabka@suse.cz,
 melissa.srw@gmail.com, sj@kernel.org, tytso@mit.edu,
 rodrigosiqueiramelo@gmail.com, kernel-team@lge.com, gregkh@linuxfoundation.org,
 jlayton@kernel.org, linux-kernel@vger.kernel.org, penberg@kernel.org,
 minchan@kernel.org, hannes@cmpxchg.org, tj@kernel.org,
 akpm@linux-foundation.org, torvalds@linux-foundation.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Mar 16, 2022 at 01:32:13PM +0900, Byungchul Park wrote:
> On Sat, Mar 12, 2022 at 01:53:26AM +0000, Hyeonggon Yoo wrote:
> > On Fri, Mar 04, 2022 at 04:06:19PM +0900, Byungchul Park wrote:
> > > Hi Linus and folks,
> > > 
> > > I've been developing a tool for detecting deadlock possibilities by
> > > tracking wait/event rather than lock(?) acquisition order to try to
> > > cover all synchonization machanisms. It's done on v5.17-rc1 tag.
> > > 
> > > https://github.com/lgebyungchulpark/linux-dept/commits/dept1.14_on_v5.17-rc1
> > >
> > 
> > Small feedback unrelated to thread:
> > I'm not sure "Need to expand the ring buffer" is something to call
> > WARN(). Is this stack trace useful for something?
> > ========
> > 
> > Hello Byungchul. These are two warnings of DEPT on system.
> 
> Hi Hyeonggon,
> 
> Could you run scripts/decode_stacktrace.sh and share the result instead
> of the raw format below if the reports still appear with PATCH v5? It'd
> be appreciated (:
>

Hi Byungchul.

on dept1.18_on_v5.17-rc7, the kernel_clone() warning has gone.
There is one warning remaining on my system:

It warns when running kunit-try-catch-test testcase.

===================================================
DEPT: Circular dependency has been detected.
5.17.0-rc7+ #4 Not tainted
---------------------------------------------------
summary
---------------------------------------------------
*** AA DEADLOCK ***

context A
[S] (unknown)(&try_completion:0)
[W] wait_for_completion_timeout(&try_completion:0)
[E] complete(&try_completion:0)

[S]: start of the event context
[W]: the wait blocked
[E]: the event not reachable
---------------------------------------------------
context A's detail
---------------------------------------------------
context A
[S] (unknown)(&try_completion:0)
[W] wait_for_completion_timeout(&try_completion:0)
[E] complete(&try_completion:0)

[S] (unknown)(&try_completion:0):
(N/A)

[W] wait_for_completion_timeout(&try_completion:0):
kunit_try_catch_run (lib/kunit/try-catch.c:78 (discriminator 1)) 
stacktrace:
dept_wait (kernel/dependency/dept.c:2149) 
wait_for_completion_timeout (kernel/sched/completion.c:119 (discriminator 4) kernel/sched/completion.c:165 (discriminator 4)) 
kunit_try_catch_run (lib/kunit/try-catch.c:78 (discriminator 1)) 
kunit_test_try_catch_successful_try_no_catch (lib/kunit/kunit-test.c:43) 
kunit_try_run_case (lib/kunit/test.c:333 lib/kunit/test.c:374) 
kunit_generic_run_threadfn_adapter (lib/kunit/try-catch.c:30) 
kthread (kernel/kthread.c:379) 
ret_from_fork (arch/arm64/kernel/entry.S:757)

[E] complete(&try_completion:0):
kthread_complete_and_exit (kernel/kthread.c:327) 
stacktrace:
dept_event (kernel/dependency/dept.c:2376 (discriminator 2)) 
complete (kernel/sched/completion.c:33 (discriminator 4)) 
kthread_complete_and_exit (kernel/kthread.c:327) 
kunit_try_catch_throw (lib/kunit/try-catch.c:18) 
kthread (kernel/kthread.c:379) 
ret_from_fork (arch/arm64/kernel/entry.S:757) 

---------------------------------------------------
information that might be helpful
---------------------------------------------------
Hardware name: linux,dummy-virt (DT)
Call trace:
dump_backtrace.part.0 (arch/arm64/kernel/stacktrace.c:186) 
show_stack (arch/arm64/kernel/stacktrace.c:193) 
dump_stack_lvl (lib/dump_stack.c:107 (discriminator 4)) 
dump_stack (lib/dump_stack.c:114) 
print_circle (./arch/arm64/include/asm/atomic_ll_sc.h:112 ./arch/arm64/include/asm/atomic.h:30 ./include/linux/atomic/atomic-arch-fallback.h:511 ./include/linux/atomic/atomic-instrumented.h:258 kernel/dependency/dept.c:140 kernel/dependency/dept.c:748) 
cb_check_dl (kernel/dependency/dept.c:1083 kernel/dependency/dept.c:1064) 
bfs (kernel/dependency/dept.c:833) 
add_dep (kernel/dependency/dept.c:1409) 
do_event (kernel/dependency/dept.c:175 kernel/dependency/dept.c:1644) 
dept_event (kernel/dependency/dept.c:2376 (discriminator 2)) 
complete (kernel/sched/completion.c:33 (discriminator 4)) 
kthread_complete_and_exit (kernel/kthread.c:327) 
kunit_try_catch_throw (lib/kunit/try-catch.c:18) 
kthread (kernel/kthread.c:379) 
ret_from_fork (arch/arm64/kernel/entry.S:757)

-- 
Thank you, You are awesome!
Hyeonggon :-)

> https://lkml.org/lkml/2022/3/15/1277
> (or https://github.com/lgebyungchulpark/linux-dept/commits/dept1.18_on_v5.17-rc7)
> 
> Thank you very much!
> 
> --
> Byungchul
> 
> > Both cases look similar.
> > 
> > In what case DEPT says (unknown)?
> > I'm not sure we can properly debug this.
> > 
> > ===================================================
> > DEPT: Circular dependency has been detected.
> > 5.17.0-rc1+ #3 Tainted: G        W        
> > ---------------------------------------------------
> > summary
> > ---------------------------------------------------
> > *** AA DEADLOCK ***
> > 
> > context A
> >     [S] (unknown)(&vfork:0)
> >     [W] wait_for_completion_killable(&vfork:0)
> >     [E] complete(&vfork:0)
> > 
> > [S]: start of the event context
> > [W]: the wait blocked
> > [E]: the event not reachable
> > ---------------------------------------------------
> > context A's detail
> > ---------------------------------------------------
> > context A
> >     [S] (unknown)(&vfork:0)
> >     [W] wait_for_completion_killable(&vfork:0)
> >     [E] complete(&vfork:0)
> > 
> > [S] (unknown)(&vfork:0):
> > (N/A)
> > 
> > [W] wait_for_completion_killable(&vfork:0):
> > [<ffffffc00802204c>] kernel_clone+0x25c/0x2b8
> > stacktrace:
> >       dept_wait+0x74/0x88
> >       wait_for_completion_killable+0x60/0xa0
> >       kernel_clone+0x25c/0x2b8
> >       __do_sys_clone+0x5c/0x74
> >       __arm64_sys_clone+0x18/0x20
> >       invoke_syscall.constprop.0+0x78/0xc4
> >       do_el0_svc+0x98/0xd0
> >       el0_svc+0x44/0xe4
> >       el0t_64_sync_handler+0xb0/0x12c
> >       el0t_64_sync+0x158/0x15c
> > 
> > [E] complete(&vfork:0):
> > [<ffffffc00801f49c>] mm_release+0x7c/0x90
> > stacktrace:
> >       dept_event+0xe0/0x100
> >       complete+0x48/0x98
> >       mm_release+0x7c/0x90
> >       exit_mm_release+0xc/0x14
> >       do_exit+0x1b4/0x81c
> >       do_group_exit+0x30/0x9c
> >       __wake_up_parent+0x0/0x24
> >       invoke_syscall.constprop.0+0x78/0xc4
> >       do_el0_svc+0x98/0xd0
> >       el0_svc+0x44/0xe4
> >       el0t_64_sync_handler+0xb0/0x12c
> >       el0t_64_sync+0x158/0x15c
> > ---------------------------------------------------
> > information that might be helpful
> > ---------------------------------------------------
> > CPU: 6 PID: 229 Comm: start-stop-daem Tainted: G        W         5.17.0-rc1+ #3
> > Hardware name: linux,dummy-virt (DT)
> > Call trace:
> >  dump_backtrace.part.0+0x9c/0xc4
> >  show_stack+0x14/0x28
> >  dump_stack_lvl+0x9c/0xcc
> >  dump_stack+0x14/0x2c
> >  print_circle+0x2d4/0x438
> >  cb_check_dl+0x44/0x70
> >  bfs+0x60/0x168
> >  add_dep+0x88/0x11c
> >  do_event.constprop.0+0x19c/0x2c0
> >  dept_event+0xe0/0x100
> >  complete+0x48/0x98
> >  mm_release+0x7c/0x90
> >  exit_mm_release+0xc/0x14
> >  do_exit+0x1b4/0x81c
> >  do_group_exit+0x30/0x9c
> >  __wake_up_parent+0x0/0x24
> >  invoke_syscall.constprop.0+0x78/0xc4
> >  do_el0_svc+0x98/0xd0
> >  el0_svc+0x44/0xe4
> >  el0t_64_sync_handler+0xb0/0x12c
> >  el0t_64_sync+0x158/0x15c
> > 
> > 
> > 
> > 
> > ===================================================
> > DEPT: Circular dependency has been detected.
> > 5.17.0-rc1+ #3 Tainted: G        W        
> > ---------------------------------------------------
> > summary
> > ---------------------------------------------------
> > *** AA DEADLOCK ***
> > 
> > context A
> >     [S] (unknown)(&try_completion:0)
> >     [W] wait_for_completion_timeout(&try_completion:0)
> >     [E] complete(&try_completion:0)
> > 
> > [S]: start of the event context
> > [W]: the wait blocked
> > [E]: the event not reachable
> > ---------------------------------------------------
> > context A's detail
> > ---------------------------------------------------
> > context A
> >     [S] (unknown)(&try_completion:0)
> >     [W] wait_for_completion_timeout(&try_completion:0)
> >     [E] complete(&try_completion:0)
> > 
> > [S] (unknown)(&try_completion:0):
> > (N/A)
> > 
> > [W] wait_for_completion_timeout(&try_completion:0):
> > [<ffffffc008166bf4>] kunit_try_catch_run+0xb4/0x160
> > stacktrace:
> >       dept_wait+0x74/0x88
> >       wait_for_completion_timeout+0x64/0xa0
> >       kunit_try_catch_run+0xb4/0x160
> >       kunit_test_try_catch_successful_try_no_catch+0x3c/0x98
> >       kunit_try_run_case+0x9c/0xa0
> >       kunit_generic_run_threadfn_adapter+0x1c/0x28
> >       kthread+0xd4/0xe4
> >       ret_from_fork+0x10/0x20
> > 
> > [E] complete(&try_completion:0):
> > [<ffffffc00803dce4>] kthread_complete_and_exit+0x18/0x20
> > stacktrace:
> >       dept_event+0xe0/0x100
> >       complete+0x48/0x98
> >       kthread_complete_and_exit+0x18/0x20
> >       kunit_try_catch_throw+0x0/0x1c
> >       kthread+0xd4/0xe4
> >       ret_from_fork+0x10/0x20
> > 
> > ---------------------------------------------------
> > information that might be helpful
> > ---------------------------------------------------
> > CPU: 15 PID: 132 Comm: kunit_try_catch Tainted: G        W         5.17.0-rc1+ #3
> > Hardware name: linux,dummy-virt (DT)
> > Call trace:
> >  dump_backtrace.part.0+0x9c/0xc4
> >  show_stack+0x14/0x28
> >  dump_stack_lvl+0x9c/0xcc
> >  dump_stack+0x14/0x2c
> >  print_circle+0x2d4/0x438
> >  cb_check_dl+0x44/0x70
> >  bfs+0x60/0x168
> >  add_dep+0x88/0x11c
> >  do_event.constprop.0+0x19c/0x2c0
> >  dept_event+0xe0/0x100
> >  complete+0x48/0x98
> >  kthread_complete_and_exit+0x18/0x20
> >  kunit_try_catch_throw+0x0/0x1c
> >  kthread+0xd4/0xe4
> >  ret_from_fork+0x10/0x20
> > 
> > 
> > > Benifit:
> > > 
> > > 	0. Works with all lock primitives.
> > > 	1. Works with wait_for_completion()/complete().
> > > 	2. Works with 'wait' on PG_locked.
> > > 	3. Works with 'wait' on PG_writeback.
> > > 	4. Works with swait/wakeup.
> > > 	5. Works with waitqueue.
> > > 	6. Multiple reports are allowed.
> > > 	7. Deduplication control on multiple reports.
> > > 	8. Withstand false positives thanks to 6.
> > > 	9. Easy to tag any wait/event.
> > > 
> > > Future work:
> > 
> > [...]
> > 
> > > -- 
> > > 1.9.1
> > > 
> > 
> > -- 
> > Thank you, You are awesome!
> > Hyeonggon :-)
