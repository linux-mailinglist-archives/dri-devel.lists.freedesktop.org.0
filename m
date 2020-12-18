Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BAC42DDFE3
	for <lists+dri-devel@lfdr.de>; Fri, 18 Dec 2020 09:34:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3D06A89EF7;
	Fri, 18 Dec 2020 08:32:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-x730.google.com (mail-qk1-x730.google.com
 [IPv6:2607:f8b0:4864:20::730])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 918608932A
 for <dri-devel@lists.freedesktop.org>; Fri, 18 Dec 2020 01:30:09 +0000 (UTC)
Received: by mail-qk1-x730.google.com with SMTP id c7so734765qke.1
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Dec 2020 17:30:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=FlzZUJfPIo/OH1jFNsGG0mnzt+yumukPpDHoEtQ6tGM=;
 b=KLm+nt6M7hYaygrw/dmD51ttbZ0mv35U/7G82r1EoVQlOAGrt225MJJXQSuUOXtPm6
 FJp/4hiN1ydd2fh0UPTYNWB9sT0fAUSydxpsjPWBUZGsgllQE72OlfCvUefNQfECg/zF
 4trOTx7upSMbnYWLl0ZeflM2zhODnA+ZtqN3Gz07Y/Hbhzyw7OiaYqYBWQyGnH9h6piR
 iw55OraBHfDSCbeDvplpPAnuMro9/4MvnjdxtRLe2f5Ic+YT7xufUFbAvK1yfeibP3nM
 HY9sssFLJcbnwLed+d2xGexu77/tHAwGKXy5nbdxxJcCiMV0jqIpfqOPCzq9IGFeLneI
 uQnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=FlzZUJfPIo/OH1jFNsGG0mnzt+yumukPpDHoEtQ6tGM=;
 b=axwSKlZhUVnVGJfHS21VgzOZUM0mD4Fdf1VFcqtURdYJxvzXrlc3lmXsp/K+Hyb0Zk
 +n/CfCc6TNsFy83x6QRov6o4Bp5Esb5PFfi0H4qNacTwODakaF2m2n6hPb9EPoQQusjo
 3n13DP+U+Wuvz9D9bO3eW0EwHII04WiLGc2JcnJV00QQ+YnoOQxHLbKXfJ7dsSOYvSQ/
 u1mYhGU5ylGyM2g5i//G42Y8hQaxJJ/lpj6Y7ATl1pHdPzsODNfwG41bIBifiIp2K1wF
 EvGeA7glk8HgEbwt50xe6gVkeDO1iek23nNqwtFnVmlTchTDdB7SLfRyqP+hwUVUqQQC
 WxuQ==
X-Gm-Message-State: AOAM531jTw4B2BFvOr45ZrZ1WzYkT9b0BmMwiDcaQj8B2rCjkMKFGiKz
 L5edVenNBvDMMYLScM61Cxo=
X-Google-Smtp-Source: ABdhPJzU3gGLz9E7SsRAOeBN9zQFYwjsGwxOR0/mCud6GSErfYQ/sJ53R9zkiXAFGa210+Ztto3z7Q==
X-Received: by 2002:ae9:ef88:: with SMTP id d130mr2419488qkg.92.1608255007591; 
 Thu, 17 Dec 2020 17:30:07 -0800 (PST)
Received: from auth1-smtp.messagingengine.com (auth1-smtp.messagingengine.com.
 [66.111.4.227])
 by smtp.gmail.com with ESMTPSA id b3sm4884957qkf.74.2020.12.17.17.30.06
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 17 Dec 2020 17:30:06 -0800 (PST)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailauth.nyi.internal (Postfix) with ESMTP id 6AB2F27C0054;
 Thu, 17 Dec 2020 20:30:04 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute5.internal (MEProxy); Thu, 17 Dec 2020 20:30:04 -0500
X-ME-Sender: <xms:GAbcX-tGsqabKdZNhluvXM8jPOE5WVDL2pRS77eTf4yjxDb7HFjA4Q>
 <xme:GAbcXzdwOZjz4Wdy-w5SQa6AtKUFUCbxQEZAkCkT3k8HYa29_-AUopeVKfFF2cCQC
 zpBbiu_GMmBsRkB6g>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedujedrudelhedgfeegucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 goufhushhpvggtthffohhmrghinhculdegledmnecujfgurhepfffhvffukfhfgggtuggj
 sehttdertddttddvnecuhfhrohhmpeeuohhquhhnucfhvghnghcuoegsohhquhhnrdhfvg
 hnghesghhmrghilhdrtghomheqnecuggftrfgrthhtvghrnhepheevgfdtheehheeggfeg
 teefgfekgfetveehfedvfeelfefftdfffedttdeitedunecuffhomhgrihhnpehshiiikh
 grlhhlvghrrdgrphhpshhpohhtrdgtohhmpdhqvghmuhdrohhrghdpghhoohdrghhlpdhf
 fhiflhhlrdgthhenucfkphepudeijedrvddvtddrvddruddvieenucevlhhushhtvghruf
 hiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpegsohhquhhnodhmvghsmhhtphgr
 uhhthhhpvghrshhonhgrlhhithihqdeiledvgeehtdeigedqudejjeekheehhedvqdgsoh
 hquhhnrdhfvghngheppehgmhgrihhlrdgtohhmsehfihigmhgvrdhnrghmvg
X-ME-Proxy: <xmx:GAbcX5yJWoc0VJXJf9FjGeWaMCjNd7VU3Sc0cr-1Yo96cFgBCB8Ypg>
 <xmx:GAbcX5Mr4mEcHla12-_jKQ7kkG-LKDUZsyaripIcYyYDdbbxE-MNEA>
 <xmx:GAbcX-9jOsLjCGxqRzFSlqASMMDqD9tsdymzPmHlB7NQUQZFV09pog>
 <xmx:HAbcXyVWCDi1ukH34t3O3A7YSpnFP0wERDVE5O5WDIg_KaOP4QgBkCZoAEI>
Received: from localhost (unknown [167.220.2.126])
 by mail.messagingengine.com (Postfix) with ESMTPA id A681824005C;
 Thu, 17 Dec 2020 20:30:00 -0500 (EST)
Date: Fri, 18 Dec 2020 09:29:41 +0800
From: Boqun Feng <boqun.feng@gmail.com>
To: "Paul E. McKenney" <paulmck@kernel.org>
Subject: Re: WARNING: suspicious RCU usage in modeset_lock
Message-ID: <X9wGBcCnhxr36WF4@boqun-archlinux>
References: <000000000000cb6db205b68a971c@google.com>
 <CAKMK7uEiS5SrBYv-2w2wWL=9G4ByoHvtiWVsPqekswZzOGmzjg@mail.gmail.com>
 <20201216161621.GH2657@paulmck-ThinkPad-P72>
 <CAKMK7uH1agVS=e245b=25Lv9Q+u5c7=KL-_NF8Hte10nKTqAXw@mail.gmail.com>
 <20201217152118.GR2657@paulmck-ThinkPad-P72>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201217152118.GR2657@paulmck-ThinkPad-P72>
X-Mailman-Approved-At: Fri, 18 Dec 2020 08:31:48 +0000
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
Cc: Linux Fbdev development list <linux-fbdev@vger.kernel.org>,
 syzbot <syzbot+972b924c988834e868b2@syzkaller.appspotmail.com>,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 Tetsuo Handa <penguin-kernel@i-love.sakura.ne.jp>,
 Daniel Vetter <daniel.vetter@ffwll.ch>,
 syzkaller-bugs <syzkaller-bugs@googlegroups.com>,
 Josh Triplett <josh@joshtriplett.org>, Steven Rostedt <rostedt@goodmis.org>,
 "Gustavo A. R. Silva" <gustavoars@kernel.org>, rcu@vger.kernel.org,
 Geert Uytterhoeven <geert@linux-m68k.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Nathan Chancellor <natechancellor@gmail.com>, Peter Rosin <peda@axentia.se>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Dec 17, 2020 at 07:21:18AM -0800, Paul E. McKenney wrote:
> On Thu, Dec 17, 2020 at 11:03:20AM +0100, Daniel Vetter wrote:
> > On Wed, Dec 16, 2020 at 5:16 PM Paul E. McKenney <paulmck@kernel.org> wrote:
> > >
> > > On Wed, Dec 16, 2020 at 10:52:06AM +0100, Daniel Vetter wrote:
> > > > On Wed, Dec 16, 2020 at 2:14 AM syzbot
> > > > <syzbot+972b924c988834e868b2@syzkaller.appspotmail.com> wrote:
> > > > >
> > > > > Hello,
> > > > >
> > > > > syzbot found the following issue on:
> > > > >
> > > > > HEAD commit:    94801e5c Merge tag 'pinctrl-v5.10-3' of git://git.kernel.o..
> > > > > git tree:       upstream
> > > > > console output: https://syzkaller.appspot.com/x/log.txt?x=130558c5500000
> > > > > kernel config:  https://syzkaller.appspot.com/x/.config?x=ee8a1012a5314210
> > > > > dashboard link: https://syzkaller.appspot.com/bug?extid=972b924c988834e868b2
> > > > > compiler:       gcc (GCC) 10.1.0-syz 20200507
> > > > > userspace arch: i386
> > > > >
> > > > > Unfortunately, I don't have any reproducer for this issue yet.
> > > > >
> > > > > IMPORTANT: if you fix the issue, please add the following tag to the commit:
> > > > > Reported-by: syzbot+972b924c988834e868b2@syzkaller.appspotmail.com
> > > > >
> > > > > =============================
> > > > > WARNING: suspicious RCU usage
> > > > > 5.10.0-rc7-syzkaller #0 Not tainted
> > > > > -----------------------------
> > > > > kernel/sched/core.c:7270 Illegal context switch in RCU-sched read-side critical section!
> > > > >
> > > > > other info that might help us debug this:
> > > > >
> > > > >
> > > > > rcu_scheduler_active = 2, debug_locks = 0
> > > > > 7 locks held by syz-executor.1/9232:
> > > > >  #0: ffffffff8b328c60 (console_lock){+.+.}-{0:0}, at: do_fb_ioctl+0x2e4/0x690 drivers/video/fbdev/core/fbmem.c:1106
> > > > >  #1: ffff888041bd4078 (&fb_info->lock){+.+.}-{3:3}, at: lock_fb_info include/linux/fb.h:636 [inline]
> > > > >  #1: ffff888041bd4078 (&fb_info->lock){+.+.}-{3:3}, at: do_fb_ioctl+0x2ee/0x690 drivers/video/fbdev/core/fbmem.c:1107
> > > > >  #2: ffff888041adca78 (&helper->lock){+.+.}-{3:3}, at: drm_fb_helper_pan_display+0xce/0x970 drivers/gpu/drm/drm_fb_helper.c:1448
> > > > >  #3: ffff8880159f01b8 (&dev->master_mutex){+.+.}-{3:3}, at: drm_master_internal_acquire+0x1d/0x70 drivers/gpu/drm/drm_auth.c:407
> > > > >  #4: ffff888041adc898 (&client->modeset_mutex){+.+.}-{3:3}, at: drm_client_modeset_commit_locked+0x44/0x580 drivers/gpu/drm/drm_client_modeset.c:1143
> > > > >  #5: ffffc90001c07730 (crtc_ww_class_acquire){+.+.}-{0:0}, at: drm_client_modeset_commit_atomic+0xb7/0x7c0 drivers/gpu/drm/drm_client_modeset.c:981
> > > > >  #6: ffff888015986108 (crtc_ww_class_mutex){+.+.}-{3:3}, at: ww_mutex_lock_slow include/linux/ww_mutex.h:287 [inline]
> > > > >  #6: ffff888015986108 (crtc_ww_class_mutex){+.+.}-{3:3}, at: modeset_lock+0x31c/0x650 drivers/gpu/drm/drm_modeset_lock.c:260
> > > >
> > > > Given that we managed to take all these locks without upsetting anyone
> > > > the rcu section is very deep down. And looking at the backtrace below
> > > > I just couldn't find anything.
> > > >
> > > > Best I can think of is that an interrupt of some sort leaked an rcu
> > > > section, and we got shot here. But I'd assume the rcu debugging would
> > > > catch this? Backtrace of the start of that rcu read side section would
> > > > be really useful here, but I'm not seeing that in the logs. There's
> > > > more stuff there, but it's just the usual "everything falls apart"
> > > > stuff of little value to understanding how we got there.
> > >
> > > In my experience, lockdep will indeed complain if an interrupt handler
> > > returns while in an RCU read-side critical section.
> > >
> > > > Adding some rcu people for more insights on what could have gone wrong here.
> > > > -Daniel
> > > >
> > > > > stack backtrace:
> > > > > CPU: 1 PID: 9232 Comm: syz-executor.1 Not tainted 5.10.0-rc7-syzkaller #0
> > > > > Hardware name: QEMU Standard PC (Q35 + ICH9, 2009), BIOS rel-1.12.0-59-gc9ba5276e321-prebuilt.qemu.org 04/01/2014
> > > > > Call Trace:
> > > > >  __dump_stack lib/dump_stack.c:77 [inline]
> > > > >  dump_stack+0x107/0x163 lib/dump_stack.c:118
> > > > >  ___might_sleep+0x25d/0x2b0 kernel/sched/core.c:7270
> > > > >  __mutex_lock_common kernel/locking/mutex.c:935 [inline]
> > > > >  __ww_mutex_lock.constprop.0+0xa9/0x2cc0 kernel/locking/mutex.c:1111
> > > > >  ww_mutex_lock+0x3d/0x170 kernel/locking/mutex.c:1190
> > >
> > > Acquiring a mutex while under the influence of rcu_read_lock() will
> > > definitely get you this lockdep complaint, and rightfully so.
> > >
> > > If you need to acquire a mutex with RCU-like protection, one approach
> > > is to use SRCU.  But usually this indicates (as you suspected) that
> > > someone forgot to invoke rcu_read_unlock().
> > >
> > > One way to locate this is to enlist the aid of lockdep.  You can do this
> > > by putting something like this in the callers:
> > >
> > >         RCU_LOCKDEP_WARN(lock_is_held(&rcu_bh_lock_map) ||
> > >                          lock_is_held(&rcu_lock_map) ||
> > >                          lock_is_held(&rcu_sched_lock_map),
> > >                          "We are in an RCU read-side critical section");
> > >
> > > This will get you a lockdep complaint much like the one above if the
> > > caller is in any sort of RCU read-side critical section.  You can push
> > > this up the call stack one level at a time or just sprinkle it up the
> > > stack in one go.
> > >
> > > The complaint is specifically about RCU-sched, so you could focus on
> > > that using this instead:
> > >
> > >         RCU_LOCKDEP_WARN(lock_is_held(&rcu_sched_lock_map),
> > >                          "We are in an RCU-sched read-side critical section");
> > >
> > > This of course assumes that this is reproducible.  :-/
> > >
> > > But even if it isn't reproducible, for example, if the mutex is only
> > > acquired occasionally, these RCU_LOCKDEP_WARN() calls can be used to
> > > check assumptions about state.
> > 
> > I think we're tripping over the might_sleep() all the mutexes have,
> > and that's not as good as yours, but good enough to catch a missing
> > rcu_read_unlock(). That's kinda why I'm baffled, since like almost
> > every 2nd function in the backtrace grabbed a mutex and it was all
> > fine until the very last.
> > 
> > I think it would be really nice if the rcu checks could retain (in
> > debugging only) the backtrace of the outermost rcu_read_lock, so we
> > could print that when something goes wrong in cases where it's leaked.
> > For normal locks lockdep does that already (well not full backtrace I
> > think, just the function that acquired the lock, but that's often
> > enough). I guess that doesn't exist yet?
> 
> I thought that lockdep kept those traces in order to print them in
> deadlock reports.  Adding Boqun for his perspective.
> 

I'm afraid it's not the same as you expect. So yes, lockdep will keep
traces, however, lockdep only keep one trace entry for one usage
*class*, for example, if you have two function foo() and bar():

	void foo(void)
	{
		rcu_read_lock();
		...
	}

	void bar(void)
	{
		rcu_read_lock();
		...
	}

, and during runtime, both are called in thread contexts with irq
enabled. There will be only one trace (the first one that lockdep see)
getting recorded ;-(

That said, from the held lock status for this splat, I don't see a
rcu_read_lock_sched() is held, so I guess that the RCU read-side
critical section is introduced by a preempt_disable() rather than a
explicit rcu_read_lock_sched(), if that's the case, lockdep cannot help
either, because after all preempt_disable() is not a lock, lockdep won't
keep a trace for it.

Maybe preemption tracing can help here?

Regards,
Boqun

> 							Thanx, Paul
> 
> > Also yes without reproducer this is kinda tough nut to crack.
> > -Daniel
> > 
> > >
> > >                                                         Thanx, Paul
> > >
> > > > >  modeset_lock+0x392/0x650 drivers/gpu/drm/drm_modeset_lock.c:263
> > > > >  drm_modeset_lock drivers/gpu/drm/drm_modeset_lock.c:342 [inline]
> > > > >  drm_modeset_lock+0x50/0x90 drivers/gpu/drm/drm_modeset_lock.c:338
> > > > >  drm_atomic_get_plane_state+0x19d/0x510 drivers/gpu/drm/drm_atomic.c:481
> > > > >  drm_client_modeset_commit_atomic+0x225/0x7c0 drivers/gpu/drm/drm_client_modeset.c:994
> > > > >  drm_client_modeset_commit_locked+0x145/0x580 drivers/gpu/drm/drm_client_modeset.c:1145
> > > > >  pan_display_atomic drivers/gpu/drm/drm_fb_helper.c:1395 [inline]
> > > > >  drm_fb_helper_pan_display+0x28b/0x970 drivers/gpu/drm/drm_fb_helper.c:1455
> > > > >  fb_pan_display+0x2f7/0x6c0 drivers/video/fbdev/core/fbmem.c:925
> > > > >  fb_set_var+0x57f/0xda0 drivers/video/fbdev/core/fbmem.c:1043
> > > > >  do_fb_ioctl+0x2f9/0x690 drivers/video/fbdev/core/fbmem.c:1108
> > > > >  fb_compat_ioctl+0x17c/0xaf0 drivers/video/fbdev/core/fbmem.c:1315
> > > > >  __do_compat_sys_ioctl+0x1d3/0x230 fs/ioctl.c:842
> > > > >  do_syscall_32_irqs_on arch/x86/entry/common.c:78 [inline]
> > > > >  __do_fast_syscall_32+0x56/0x80 arch/x86/entry/common.c:137
> > > > >  do_fast_syscall_32+0x2f/0x70 arch/x86/entry/common.c:160
> > > > >  entry_SYSENTER_compat_after_hwframe+0x4d/0x5c
> > > > > RIP: 0023:0xf7fd8549
> > > > > Code: 03 74 c0 01 10 05 03 74 b8 01 10 06 03 74 b4 01 10 07 03 74 b0 01 10 08 03 74 d8 01 00 00 00 00 00 51 52 55 89 e5 0f 34 cd 80 <5d> 5a 59 c3 90 90 90 90 eb 0d 90 90 90 90 90 90 90 90 90 90 90 90
> > > > > RSP: 002b:00000000f55d20bc EFLAGS: 00000296 ORIG_RAX: 0000000000000036
> > > > > RAX: ffffffffffffffda RBX: 0000000000000003 RCX: 0000000000004601
> > > > > RDX: 0000000020000240 RSI: 0000000000000000 RDI: 0000000000000000
> > > > > RBP: 0000000000000000 R08: 0000000000000000 R09: 0000000000000000
> > > > > R10: 0000000000000000 R11: 0000000000000000 R12: 0000000000000000
> > > > > R13: 0000000000000000 R14: 0000000000000000 R15: 0000000000000000
> > > > > detected fb_set_par error, error code: -16
> > > > >
> > > > >
> > > > > ---
> > > > > This report is generated by a bot. It may contain errors.
> > > > > See https://goo.gl/tpsmEJ for more information about syzbot.
> > > > > syzbot engineers can be reached at syzkaller@googlegroups.com.
> > > > >
> > > > > syzbot will keep track of this issue. See:
> > > > > https://goo.gl/tpsmEJ#status for how to communicate with syzbot.
> > > >
> > > >
> > > >
> > > > --
> > > > Daniel Vetter
> > > > Software Engineer, Intel Corporation
> > > > http://blog.ffwll.ch
> > 
> > 
> > 
> > -- 
> > Daniel Vetter
> > Software Engineer, Intel Corporation
> > http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
