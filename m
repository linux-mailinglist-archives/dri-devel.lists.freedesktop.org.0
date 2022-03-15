Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B4D84D9AD6
	for <lists+dri-devel@lfdr.de>; Tue, 15 Mar 2022 13:04:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F190610E466;
	Tue, 15 Mar 2022 12:04:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x431.google.com (mail-pf1-x431.google.com
 [IPv6:2607:f8b0:4864:20::431])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3963310E466
 for <dri-devel@lists.freedesktop.org>; Tue, 15 Mar 2022 12:04:23 +0000 (UTC)
Received: by mail-pf1-x431.google.com with SMTP id g19so19292174pfc.9
 for <dri-devel@lists.freedesktop.org>; Tue, 15 Mar 2022 05:04:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=Uk+trKTmv4OHZazX5n2Z6Y+7WCkuvCW9bJ/ylyLCIlU=;
 b=bVptJXmwmq6k6OUSAUF/Yd1FQ97UY+8l6gG1Iu8Q3dPLGZCllHLa0o+bs5xgaEKJng
 eEubmm6FZCCeC/xB5/6J999xTjq9nXfcWjh8XJnp3jTsxPiDHccMt/GwHtCynaPRCsdd
 OpSfUrOrgKuZffNOHq+DW2hGttb9Vpfb2YsOsxnvFhZm123lCvJYCUAk3/5eICa5d7t+
 V9xgDRhMfGXU/pRIcicwDfu26iUIqHtLG6z36YR+6q4aCPpTEm5d5nCzjqDTxLFCskXH
 LJn1f88cgrUqihu2eY/8IrKZwnn9wq/mU/qTrjBuy+EW9LgTmRv/WekgNIkbYwPgGGG2
 qQVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=Uk+trKTmv4OHZazX5n2Z6Y+7WCkuvCW9bJ/ylyLCIlU=;
 b=QyPSj7uoVXn/idjRCN6yOqiGmm3er0OjB/36mJNs0rtD24L0rT+aQFtLaz0taAB2n7
 qRfmAYE7FRtRdyEDqsCJfAesrPXx7WR6yqPQVxECdc0r6gq0092zaVPfg6Etrp0u4Od+
 VLmvM7Hsld0+QrWA8Uw/Irbu4V218cJpcqsT3ox35FY1In18FjBdT3+GGY2TImqvNwC8
 6USJEYkFlIFj0DzPe16fNU0bR28Rf59DmYZzYcUyX3gL67gFxQ5jwaiJ13OopKDVJ7PJ
 6lhXYPDyqs0pg8h+h9t5R3lrLFnOZzgYhzVAi1/AAQrzdbHHwUnSOAZx70PWQvy7aOJk
 BF9A==
X-Gm-Message-State: AOAM533VH8VgFK+L0To9KziorTWgpVu+hHL5lcO+p/kh9NC/G0ACf6lY
 eeU1U9wHdP8oUHeOZdrXc7c=
X-Google-Smtp-Source: ABdhPJzDMpKhPVS3UR+SPpnJBt/JV72yW+bNTlusJ5lGLtPSPFG4eaHSQgeZyvz3EZ59vk34Jl6rLg==
X-Received: by 2002:aa7:9156:0:b0:4f6:dbc5:d0be with SMTP id
 22-20020aa79156000000b004f6dbc5d0bemr28531425pfi.13.1647345862671; 
 Tue, 15 Mar 2022 05:04:22 -0700 (PDT)
Received: from odroid ([114.29.23.97]) by smtp.gmail.com with ESMTPSA id
 h2-20020a056a00218200b004f66d50f054sm24227869pfi.158.2022.03.15.05.04.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 15 Mar 2022 05:04:22 -0700 (PDT)
Date: Tue, 15 Mar 2022 12:04:07 +0000
From: Hyeonggon Yoo <42.hyeyoo@gmail.com>
To: Byungchul Park <byungchul.park@lge.com>
Subject: Re: [PATCH v4 00/24] DEPT(Dependency Tracker)
Message-ID: <20220315120407.GA1471334@odroid>
References: <1646377603-19730-1-git-send-email-byungchul.park@lge.com>
 <Yiv9Fn4kcRbXJLmu@ip-172-31-19-208.ap-northeast-1.compute.internal>
 <20220314065906.GA6255@X58A-UD3R>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220314065906.GA6255@X58A-UD3R>
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

On Mon, Mar 14, 2022 at 03:59:06PM +0900, Byungchul Park wrote:
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
> 
> Yeah. It seems to happen too often. I won't warn it. Thanks.

Thanks!

> > ========
> > 
> > Hello Byungchul. These are two warnings of DEPT on system.
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
> 
> All the reports look like having to do with kernel_clone(). I need to
> check it more. Thank you very much.
> 
> You are awesome, Hyeonggon.
>

Thank you. Let me know if there is something I can help!

> Thank you,
> Byungchul
> 
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
> 
> 
> > -- 
> > Thank you, You are awesome!
> > Hyeonggon :-)
