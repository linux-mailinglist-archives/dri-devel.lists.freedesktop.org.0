Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DB339523037
	for <lists+dri-devel@lfdr.de>; Wed, 11 May 2022 12:05:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 085B510E1B6;
	Wed, 11 May 2022 10:05:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x1034.google.com (mail-pj1-x1034.google.com
 [IPv6:2607:f8b0:4864:20::1034])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0855310E1B6
 for <dri-devel@lists.freedesktop.org>; Wed, 11 May 2022 10:05:11 +0000 (UTC)
Received: by mail-pj1-x1034.google.com with SMTP id
 t11-20020a17090ad50b00b001d95bf21996so4486548pju.2
 for <dri-devel@lists.freedesktop.org>; Wed, 11 May 2022 03:05:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=dl2s8Tv2/kKkPRE8ZoHeNUZB1flbWNAHTlntidklYaY=;
 b=KlIsnrMl6LzKnPwuuLyOxZLp19pZPqeI5Z4V8cuAYHI+9RVTGzbduTyCxz28BfMcY5
 CwyO3hIQASgaBQ4kvhQxLyYSbckbWRlCLb1dD/BMJSrScuRjQHw7frIEqtCsYUwV0aJo
 alk0g68BL70ZuQYOvBt58YRDPJ1xZn3xnx/SNkP8njfG7szgY0Hu9RRaME/VZH7+xzfW
 9YmVvFN9yJDIXLpbXehLIFtj0nsBlM+xlrmaYop1xZL6z0w8gbSOGA+RryCui01GAuoH
 cnWXREB1+3Q/d1q3pf62BP3GXl9AVtphO3G/fEuwafxxWxfxd2TZKvoEk0cxfjqDDCHb
 RZlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=dl2s8Tv2/kKkPRE8ZoHeNUZB1flbWNAHTlntidklYaY=;
 b=S/25hlwgPhd1y01Y2Cy5r5hnzF+7pXbMKQUFzo0J6EhTYV6h0BpHeQULWoOtocilBS
 qvqhYliDMLnLPEIhOzUIcS/W4VPJtXMk7PJdmSm+FgIT0hFr08LxyDpBfM2/C8hWGH2q
 wR8f8OrxvMbwa1MbO1wVmCwZC0ZZubsGbcxQepfyQpqEuJVmqFF/suulG16dTZMt7hyx
 LwJ/R5L36b1UDmopSUdRELodI82Ifo2jL6LO/tHT7lCpzt3lefTxUIlhs60Nb6I71XFQ
 z4c9Sc0LLXN6WcmetHgy4XQIpqdQZ7mzWKxwUti47XGGtVbxO3ujHwKay8IeloCuvwL/
 3QnQ==
X-Gm-Message-State: AOAM531BC1wV0EhiDTQxZgcNrbGYyVwEIEU9I2P/vDpRVMIJDlslatwW
 IJ7f75ll4Sauv91pfCjzrGY=
X-Google-Smtp-Source: ABdhPJxrR1W/gIbDjmZ7/+hWQ3pnc2AjtEKGxX+igDjmtKyPWlr1/5lfQ6qKTWVrO1rYmy4ogJ7Jlw==
X-Received: by 2002:a17:90b:d91:b0:1da:35d7:a0c with SMTP id
 bg17-20020a17090b0d9100b001da35d70a0cmr4565541pjb.92.1652263510558; 
 Wed, 11 May 2022 03:05:10 -0700 (PDT)
Received: from hyeyoo ([114.29.24.243]) by smtp.gmail.com with ESMTPSA id
 i20-20020a63cd14000000b003c291b46f7esm1330537pgg.18.2022.05.11.03.04.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 11 May 2022 03:05:09 -0700 (PDT)
Date: Wed, 11 May 2022 19:04:51 +0900
From: Hyeonggon Yoo <42.hyeyoo@gmail.com>
To: Byungchul Park <byungchul.park@lge.com>
Subject: Re: [PATCH RFC v6 00/21] DEPT(Dependency Tracker)
Message-ID: <YnuKQ9UIhk9WYoz7@hyeyoo>
References: <CAHk-=whnPePcffsNQM+YSHMGttLXvpf8LbBQ8P7HEdqFXaV7Lg@mail.gmail.com>
 <1651795895-8641-1-git-send-email-byungchul.park@lge.com>
 <YnYd0hd+yTvVQxm5@hyeyoo> <20220509001637.GA6047@X58A-UD3R>
 <YnpJ9Mtf+pjx4JYm@hyeyoo> <20220510233929.GB18445@X58A-UD3R>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220510233929.GB18445@X58A-UD3R>
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
 dri-devel@lists.freedesktop.org, chris@chris-wilson.co.uk, linux-mm@kvack.org,
 linux-ide@vger.kernel.org, adilger.kernel@dilger.ca, joel@joelfernandes.org,
 cl@linux.com, will@kernel.org, duyuyang@gmail.com, sashal@kernel.org,
 paolo.valente@linaro.org, damien.lemoal@opensource.wdc.com,
 willy@infradead.org, hch@infradead.org, airlied@linux.ie, mingo@redhat.com,
 djwong@kernel.org, vdavydov.dev@gmail.com, rientjes@google.com,
 dennis@kernel.org, linux-ext4@vger.kernel.org, ngupta@vflare.org,
 johannes.berg@intel.com, jack@suse.com, dan.j.williams@intel.com,
 josef@toxicpanda.com, rostedt@goodmis.org, linux-block@vger.kernel.org,
 linux-fsdevel@vger.kernel.org, jglisse@redhat.com, viro@zeniv.linux.org.uk,
 tglx@linutronix.de, mhocko@kernel.org, vbabka@suse.cz, melissa.srw@gmail.com,
 sj@kernel.org, tytso@mit.edu, catalin.marinas@arm.com,
 rodrigosiqueiramelo@gmail.com, kernel-team@lge.com, gregkh@linuxfoundation.org,
 jlayton@kernel.org, linux-kernel@vger.kernel.org, penberg@kernel.org,
 minchan@kernel.org, hannes@cmpxchg.org, tj@kernel.org,
 akpm@linux-foundation.org, torvalds@linux-foundation.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, May 11, 2022 at 08:39:29AM +0900, Byungchul Park wrote:
> On Tue, May 10, 2022 at 08:18:12PM +0900, Hyeonggon Yoo wrote:
> > On Mon, May 09, 2022 at 09:16:37AM +0900, Byungchul Park wrote:
> > > On Sat, May 07, 2022 at 04:20:50PM +0900, Hyeonggon Yoo wrote:
> > > > On Fri, May 06, 2022 at 09:11:35AM +0900, Byungchul Park wrote:
> > > > > Linus wrote:
> > > > > >
> > > > > > On Wed, May 4, 2022 at 1:19 AM Byungchul Park <byungchul.park@lge.com> wrote:
> > > > > > >
> > > > > > > Hi Linus and folks,
> > > > > > >
> > > > > > > I've been developing a tool for detecting deadlock possibilities by
> > > > > > > tracking wait/event rather than lock(?) acquisition order to try to
> > > > > > > cover all synchonization machanisms.
> > > > > > 
> > > > > > So what is the actual status of reports these days?
> > > > > > 
> > > > > > Last time I looked at some reports, it gave a lot of false positives
> > > > > > due to mis-understanding prepare_to_sleep().
> > > > > 
> > > > > Yes, it was. I handled the case in the following way:
> > > > > 
> > > > > 1. Stage the wait at prepare_to_sleep(), which might be used at commit.
> > > > >    Which has yet to be an actual wait that Dept considers.
> > > > > 2. If the condition for sleep is true, the wait will be committed at
> > > > >    __schedule(). The wait becomes an actual one that Dept considers.
> > > > > 3. If the condition is false and the task gets back to TASK_RUNNING,
> > > > >    clean(=reset) the staged wait.
> > > > > 
> > > > > That way, Dept only works with what actually hits to __schedule() for
> > > > > the waits through sleep.
> > > > > 
> > > > > > For this all to make sense, it would need to not have false positives
> > > > > > (or at least a very small number of them together with a way to sanely
> > > > > 
> > > > > Yes. I agree with you. I got rid of them that way I described above.
> > > > >
> > > > 
> > > > IMHO DEPT should not report what lockdep allows (Not talking about
> > > 
> > > No.
> > > 
> > > > wait events). I mean lockdep allows some kind of nested locks but
> > > > DEPT reports them.
> > > 
> > > You have already asked exactly same question in another thread of
> > > LKML. That time I answered to it but let me explain it again.
> > > 
> > > ---
> > > 
> > > CASE 1.
> > > 
> > >    lock L with depth n
> > >    lock_nested L' with depth n + 1
> > >    ...
> > >    unlock L'
> > >    unlock L
> > > 
> > > This case is allowed by Lockdep.
> > > This case is allowed by DEPT cuz it's not a deadlock.
> > > 
> > > CASE 2.
> > > 
> > >    lock L with depth n
> > >    lock A
> > >    lock_nested L' with depth n + 1
> > >    ...
> > >    unlock L'
> > >    unlock A
> > >    unlock L
> > > 
> > > This case is allowed by Lockdep.
> > > This case is *NOT* allowed by DEPT cuz it's a *DEADLOCK*.
> > >
> > 
> > Yeah, in previous threads we discussed this [1]
> > 
> > And the case was:
> > 	scan_mutex -> object_lock -> kmemleak_lock -> object_lock
> > And dept reported:
> > 	object_lock -> kmemleak_lock, kmemleak_lock -> object_lock as
> > 	deadlock.
> > 
> > But IIUC - What DEPT reported happens only under scan_mutex and
> > It is not simple just not to take them because the object can be removed from the
> > list and freed while scanning via kmemleak_free() without kmemleak_lock and object_lock.
>
>
> That should be one of the following order:
> 
> 1. kmemleak_lock -> object_lock -> object_lock(nested)
> 2. object_lock -> object_lock(nested) -> kmemleak_lock
> 
> > Just I'm still not sure that someone will fix the warning in the future - even if the
> > locking rule is not good - if it will not cause a real deadlock.
> 
> There's more important thing than making code just work for now. For
> example, maintainance, communcation via code between current developers
> and potential new commers in the future and so on.

Then we will get same reports from DEPT until already existing bad code (even if it does not
cause deadlock) is reworked. If you think that is right thing to do, okay.

> At least, a comment describing why the wrong order in the code is safe
> should be added.

AFAIK The comment is already there in mm/kmemleak.c.

> I wouldn't allow the current order in the code if I
> were the maintainer.

[+Cc Catalin]
He may have opinion.

Thanks,
Hyeonggon

> 	Byungchul
> 
> > > ---
> > > 
> > > The following scenario would explain why CASE 2 is problematic.
> > > 
> > >    THREAD X			THREAD Y
> > > 
> > >    lock L with depth n
> > > 				lock L' with depth n
> > >    lock A
> > > 				lock A
> > >    lock_nested L' with depth n + 1
> > > 				lock_nested L'' with depth n + 1
> > >    ...				...
> > >    unlock L'			unlock L''
> > >    unlock A			unlock A
> > >    unlock L			unlock L'
> > > 
> > > Yes. I need to check if the report you shared with me is a true one, but
> > > it's not because DEPT doesn't work with *_nested() APIs.
> > >
> > 
> > Sorry, It was not right just to say DEPT doesn't work with _nested() APIs.
> > 
> > > 	Byungchul
> > 
> > [1] https://lore.kernel.org/lkml/20220304002809.GA6112@X58A-UD3R/
> > 
> > -- 
> > Thanks,
> > Hyeonggon

-- 
Thanks,
Hyeonggon
