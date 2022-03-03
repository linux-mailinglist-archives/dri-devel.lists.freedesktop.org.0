Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A31F4CB914
	for <lists+dri-devel@lfdr.de>; Thu,  3 Mar 2022 09:33:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C17FD10EF3E;
	Thu,  3 Mar 2022 08:33:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x102c.google.com (mail-pj1-x102c.google.com
 [IPv6:2607:f8b0:4864:20::102c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0C19210EDA9
 for <dri-devel@lists.freedesktop.org>; Thu,  3 Mar 2022 08:03:34 +0000 (UTC)
Received: by mail-pj1-x102c.google.com with SMTP id b8so3981236pjb.4
 for <dri-devel@lists.freedesktop.org>; Thu, 03 Mar 2022 00:03:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=fUkUxvkn93bgu+PKSnYG+q7lM7WQLXndxGjx5lZ4dBU=;
 b=lk+pGqkNy5ulOHooO1xdOsUIbcPFxh71/n7f6yoU9rEbLFBiew22l1yVQ/xFuhLZMq
 TCFHVy5dVSGi+qTzgJJv3Co/u0b3cQ0Xv6eaI4es3lb4UiFH01OO1gL9Mk10SYXpp/G9
 WY5IeKMjwpwZFU8EVyA9SHg0+fuM6md7AQtR2NTUCbS+5kWOrZXSaQkN+ShsP0sagN1b
 cXPwTvzhjRDB1e7UnAjTiyecsqm/ACZsA9EhBkbLWu+k0iwqTCNoKK2ir3YyDnq2cpUp
 X3+nTiOGcIPvHHArnBHbobBKI5+rpH6uMMyAzkhQrBcUdvv+cUf4L1LwoDz8aVGp+yW9
 y2iQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=fUkUxvkn93bgu+PKSnYG+q7lM7WQLXndxGjx5lZ4dBU=;
 b=aoU6PTgEovYiil3PZleIYnFgtzgOcXm4QSNAh+P6inyXi04SCckMoe4WdEyCdLiY62
 ocdi01UN6zFVVYfgss+wNzRzociseFJ6fjNTNwleXORKibpIe+IASuDktW3VrBCqh0MD
 oVXeW0otPmAKtCd8j/aGuXkGouYy//T7Chuv9Elqf/g0mJnBM0GVHlWBTLu3eDh/GF1f
 laVsrvS9V1331rsfIdpfdofmgAAlmEht62+YqEHpXgl90G9imKkEbIckVQ96WgnR68t8
 Z6yNmtBREewmsSHm6ipjRkMHY50IUeLbp2EWesVBp5Dn5xu6ew3YC+dVVCdemIoMTBjw
 yEvw==
X-Gm-Message-State: AOAM530RAAsiW9Ucvch1oqJiKFUSlvOr0+NdDF07Ue3gd8KHtnmtPrrh
 daR3jJw/0xIqVfUkk7rKI9Q=
X-Google-Smtp-Source: ABdhPJxZK8YWg/B8UVN9sIpJzKrzwM56bvyAj4DWSAO4JGSQ5m6JW9AJg7nXNLycvwdWBm1H2VF8og==
X-Received: by 2002:a17:90a:560a:b0:1bc:72e7:3c13 with SMTP id
 r10-20020a17090a560a00b001bc72e73c13mr3966855pjf.246.1646294613533; 
 Thu, 03 Mar 2022 00:03:33 -0800 (PST)
Received: from ip-172-31-19-208.ap-northeast-1.compute.internal
 (ec2-18-181-137-102.ap-northeast-1.compute.amazonaws.com. [18.181.137.102])
 by smtp.gmail.com with ESMTPSA id
 c15-20020a056a00248f00b004f10a245b83sm1603254pfv.73.2022.03.03.00.03.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 03 Mar 2022 00:03:33 -0800 (PST)
Date: Thu, 3 Mar 2022 08:03:21 +0000
From: Hyeonggon Yoo <42.hyeyoo@gmail.com>
To: Byungchul Park <byungchul.park@lge.com>
Subject: Re: [PATCH v3 00/21] DEPT(Dependency Tracker)
Message-ID: <YiB2SZFzgBEcywgg@ip-172-31-19-208.ap-northeast-1.compute.internal>
References: <1646042220-28952-1-git-send-email-byungchul.park@lge.com>
 <Yh70VkRkUfwIjPWv@ip-172-31-19-208.ap-northeast-1.compute.internal>
 <Yh74VbNZZt35wHZD@ip-172-31-19-208.ap-northeast-1.compute.internal>
 <20220303001812.GA20752@X58A-UD3R>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220303001812.GA20752@X58A-UD3R>
X-Mailman-Approved-At: Thu, 03 Mar 2022 08:33:09 +0000
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

On Thu, Mar 03, 2022 at 09:18:13AM +0900, Byungchul Park wrote:
> On Wed, Mar 02, 2022 at 04:53:41AM +0000, Hyeonggon Yoo wrote:
> > On Wed, Mar 02, 2022 at 04:36:38AM +0000, Hyeonggon Yoo wrote:
> > > On Mon, Feb 28, 2022 at 06:56:39PM +0900, Byungchul Park wrote:
> > > > I didn't want to bother you so I was planning to send the next spin
> > > > after making more progress. However, PATCH v2 reports too many false
> > > > positives because Dept tracked the bit_wait_table[] wrong way - I
> > > > apologize for that. So I decided to send PATCH v3 first before going
> > > > further for those who want to run Dept for now.
> > > > 
> > > > There might still be some false positives but not overwhelming.
> > > >
> > > 
> > > Hello Byungchul, I'm running DEPT v3 on my system
> > > and I see report below.
> > > 
> > > Looking at the kmemleak code and comment, I think
> > > kmemleak tried to avoid lockdep recursive warning
> > > but detected by DEPT?
> > >
> > 
> > Forgot to include another warning caused by DEPT.
> > 
> > And comment below might be useful for debugging:
> > 
> > in kmemleak.c:
> >   43  * Locks and mutexes are acquired/nested in the following order:
> >   44  *
> >   45  *   scan_mutex [-> object->lock] -> kmemleak_lock -> other_object->lock (SINGLE_DEPTH_NESTING)
> >   46  *
> >   47  * No kmemleak_lock and object->lock nesting is allowed outside scan_mutex
> >   48  * regions.
> > 
> > ===================================================
> > DEPT: Circular dependency has been detected.
> > 5.17.0-rc1+ #1 Tainted: G        W        
> > ---------------------------------------------------
> > summary
> > ---------------------------------------------------
> > *** DEADLOCK ***
> > 
> > context A
> >     [S] __raw_spin_lock_irqsave(&object->lock:0)
> >     [W] __raw_spin_lock_irqsave(kmemleak_lock:0)
> >     [E] spin_unlock(&object->lock:0)
> > 
> > context B
> >     [S] __raw_spin_lock_irqsave(kmemleak_lock:0)
> >     [W] _raw_spin_lock_nested(&object->lock:0)
> >     [E] spin_unlock(kmemleak_lock:0)
> > 
> > [S]: start of the event context
> > [W]: the wait blocked
> > [E]: the event not reachable
> 
> Hi Hyeonggon,
> 
> Dept also allows the following scenario when an user guarantees that
> each lock instance is different from another at a different depth:
>
>    lock A0 with depth
>    lock A1 with depth + 1
>    lock A2 with depth + 2
>    lock A3 with depth + 3
>    (and so on)
>    ..
>    unlock A3
>    unlock A2
>    unlock A1
>    unlock A0
> 
> However, Dept does not allow the following scenario where another lock
> class cuts in the dependency chain:
> 
>    lock A0 with depth
>    lock B
>    lock A1 with depth + 1
>    lock A2 with depth + 2
>    lock A3 with depth + 3
>    (and so on)
>    ..
>    unlock A3
>    unlock A2
>    unlock A1
>    unlock B
>    unlock A0
> 
> This scenario is clearly problematic. What do you think is going to
> happen with another context running the following?
>

First of all, I want to say I'm not expert at locking primitives.
I may be wrong.

> >   45  *   scan_mutex [-> object->lock] -> kmemleak_lock -> other_object->lock (SINGLE_DEPTH_NESTING)
> >   46  *
> >   47  * No kmemleak_lock and object->lock nesting is allowed outside scan_mutex
> >   48  * regions.

lock order in kmemleak is described above.

and DEPT detects two cases as deadlock:

1) object->lock -> other_object->lock
2) object->lock -> kmemleak_lock, kmemleak_lock -> other_object->lock

And in kmemleak case, 1) and 2) is not possible because it must hold
scan_mutex first.

I think the author of kmemleak intended lockdep to treat object->lock
and other_object->lock as different class, using raw_spin_lock_nested().

Am I missing something?

Thanks.

>    lock A1 with depth
>    lock B
>    lock A2 with depth + 1
>    lock A3 with depth + 2
>    (and so on)
>    ..
>    unlock A3
>    unlock A2
>    unlock B
>    unlock A1
> 
> It's a deadlock. That's why Dept reports this case as a problem. Or am I
> missing something?
> 
> Thanks,
> Byungchul
> 
> > ---------------------------------------------------
> > context A's detail
> > ---------------------------------------------------
> > context A
> >     [S] __raw_spin_lock_irqsave(&object->lock:0)
> >     [W] __raw_spin_lock_irqsave(kmemleak_lock:0)
> >     [E] spin_unlock(&object->lock:0)
> > 
> > [S] __raw_spin_lock_irqsave(&object->lock:0):
> > [<ffffffc00810302c>] scan_gray_list+0x84/0x13c
> > stacktrace:
> >       dept_ecxt_enter+0x88/0xf4
> >       _raw_spin_lock_irqsave+0xf0/0x1c4
> >       scan_gray_list+0x84/0x13c
> >       kmemleak_scan+0x2d8/0x54c
> >       kmemleak_scan_thread+0xac/0xd4
> >       kthread+0xd4/0xe4
> >       ret_from_fork+0x10/0x20
> > 
> > [W] __raw_spin_lock_irqsave(kmemleak_lock:0):
> > [<ffffffc008102ebc>] scan_block+0x3c/0x128
> > stacktrace:
> >       __dept_wait+0x8c/0xa4
> >       dept_wait+0x6c/0x88
> >       _raw_spin_lock_irqsave+0xb8/0x1c4
> >       scan_block+0x3c/0x128
> >       scan_gray_list+0xc4/0x13c
> >       kmemleak_scan+0x2d8/0x54c
> >       kmemleak_scan_thread+0xac/0xd4
> >       kthread+0xd4/0xe4
> >       ret_from_fork+0x10/0x20
> > 
> > [E] spin_unlock(&object->lock:0):
> > [<ffffffc008102ee0>] scan_block+0x60/0x128
> > 
> > ---------------------------------------------------
> > context B's detail
> > ---------------------------------------------------
> > context B
> >     [S] __raw_spin_lock_irqsave(kmemleak_lock:0)
> >     [W] _raw_spin_lock_nested(&object->lock:0)
> >     [E] spin_unlock(kmemleak_lock:0)
> > 
> > [S] __raw_spin_lock_irqsave(kmemleak_lock:0):
> > [<ffffffc008102ebc>] scan_block+0x3c/0x128
> > stacktrace:
> >       dept_ecxt_enter+0x88/0xf4
> >       _raw_spin_lock_irqsave+0xf0/0x1c4
> >       scan_block+0x3c/0x128
> >       kmemleak_scan+0x19c/0x54c
> >       kmemleak_scan_thread+0xac/0xd4
> >       kthread+0xd4/0xe4
> >       ret_from_fork+0x10/0x20
> > 
> > [W] _raw_spin_lock_nested(&object->lock:0):
> > [<ffffffc008102f34>] scan_block+0xb4/0x128
> > stacktrace:
> >       dept_wait+0x74/0x88
> >       _raw_spin_lock_nested+0xa8/0x1b0
> >       scan_block+0xb4/0x128
> >       kmemleak_scan+0x19c/0x54c
> >       kmemleak_scan_thread+0xac/0xd4
> >       kthread+0xd4/0xe4
> >       ret_from_fork+0x10/0x20
> > [E] spin_unlock(kmemleak_lock:0):
> > [<ffffffc008102ee0>] scan_block+0x60/0x128
> > stacktrace:
> >       dept_event+0x7c/0xfc
> >       _raw_spin_unlock_irqrestore+0x8c/0x120
> >       scan_block+0x60/0x128
> >       kmemleak_scan+0x19c/0x54c
> >       kmemleak_scan_thread+0xac/0xd4
> >       kthread+0xd4/0xe4
> >       ret_from_fork+0x10/0x20
> > ---------------------------------------------------
> > information that might be helpful
> > ---------------------------------------------------
> > CPU: 1 PID: 38 Comm: kmemleak Tainted: G        W         5.17.0-rc1+ #1
> > Hardware name: linux,dummy-virt (DT)
> > Call trace:
> >  dump_backtrace.part.0+0x9c/0xc4
> >  show_stack+0x14/0x28
> >  dump_stack_lvl+0x9c/0xcc
> >  dump_stack+0x14/0x2c
> >  print_circle+0x2d4/0x438
> >  cb_check_dl+0x6c/0x70
> >  bfs+0xc0/0x168
> >  add_dep+0x88/0x11c
> >  add_wait+0x2d0/0x2dc
> >  __dept_wait+0x8c/0xa4
> >  dept_wait+0x6c/0x88
> >  _raw_spin_lock_irqsave+0xb8/0x1c4
> >  scan_block+0x3c/0x128
> >  scan_gray_list+0xc4/0x13c
> >  kmemleak_scan+0x2d8/0x54c
> >  kmemleak_scan_thread+0xac/0xd4
> >  kthread+0xd4/0xe4
> >  ret_from_fork+0x10/0x20
> > 
> > > ===================================================
> > > DEPT: Circular dependency has been detected.
> > > 5.17.0-rc1+ #1 Tainted: G        W
> > > ---------------------------------------------------
> > > summary
> > > ---------------------------------------------------
> > > *** AA DEADLOCK ***
> > > 
> > > context A
> > >     [S] __raw_spin_lock_irqsave(&object->lock:0)
> > >     [W] _raw_spin_lock_nested(&object->lock:0)
> > >     [E] spin_unlock(&object->lock:0)
> > > 
> > > [S]: start of the event context
> > > [W]: the wait blocked
> > > [E]: the event not reachable
> > > ---------------------------------------------------
> > > context A's detail
> > > ---------------------------------------------------
> > > context A
> > >     [S] __raw_spin_lock_irqsave(&object->lock:0)
> > >     [W] _raw_spin_lock_nested(&object->lock:0)
> > >     [E] spin_unlock(&object->lock:0)
> > > 
> > > [S] __raw_spin_lock_irqsave(&object->lock:0):
> > > [<ffffffc00810302c>] scan_gray_list+0x84/0x13c
> > > stacktrace:
> > >       dept_ecxt_enter+0x88/0xf4
> > >       _raw_spin_lock_irqsave+0xf0/0x1c4
> > >       scan_gray_list+0x84/0x13c
> > >       kmemleak_scan+0x2d8/0x54c
> > >       kmemleak_scan_thread+0xac/0xd4
> > >       kthread+0xd4/0xe4
> > >       ret_from_fork+0x10/0x20
> > > 
> > > [E] spin_unlock(&object->lock:0):
> > > [<ffffffc008102ee0>] scan_block+0x60/0x128
> > > ---------------------------------------------------
> > > information that might be helpful
> > > ---------------------------------------------------
> > > CPU: 1 PID: 38 Comm: kmemleak Tainted: G        W         5.17.0-rc1+ #1
> > > Hardware name: linux,dummy-virt (DT)
> > > Call trace:
> > >  dump_backtrace.part.0+0x9c/0xc4
> > >  show_stack+0x14/0x28
> > >  dump_stack_lvl+0x9c/0xcc
> > >  dump_stack+0x14/0x2c
> > >  print_circle+0x2d4/0x438
> > >  cb_check_dl+0x44/0x70
> > >  bfs+0x60/0x168
> > >  add_dep+0x88/0x11c
> > >  add_wait+0x2d0/0x2dc
> > >  __dept_wait+0x8c/0xa4
> > >  dept_wait+0x6c/0x88
> > >  _raw_spin_lock_nested+0xa8/0x1b0
> > >  scan_block+0xb4/0x128
> > >  scan_gray_list+0xc4/0x13c
> > >  kmemleak_scan+0x2d8/0x54c
> > >  kmemleak_scan_thread+0xac/0xd4
> > >  kthread+0xd4/0xe4
> > >  ret_from_fork+0x10/0x20
> > >
> > [...]
> > 
> > --
> > Thank you, You are awesome!
> > Hyeonggon :-)

-- 
Thank you, You are awesome!
Hyeonggon :-)
