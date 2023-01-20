Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A312674A22
	for <lists+dri-devel@lfdr.de>; Fri, 20 Jan 2023 04:27:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EC06F10EA11;
	Fri, 20 Jan 2023 03:27:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-x833.google.com (mail-qt1-x833.google.com
 [IPv6:2607:f8b0:4864:20::833])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5577D10EA11
 for <dri-devel@lists.freedesktop.org>; Fri, 20 Jan 2023 03:27:10 +0000 (UTC)
Received: by mail-qt1-x833.google.com with SMTP id a25so3252368qto.10
 for <dri-devel@lists.freedesktop.org>; Thu, 19 Jan 2023 19:27:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:feedback-id:from:to:cc:subject:date
 :message-id:reply-to;
 bh=JeWp3AI1idtCEb/tlL53bEeivC6lDxwyV5blCIKy/sI=;
 b=D95ICNhlrG/KdBynQggCzgLLAuHuGk8Mbpn0AL6BtzmVJuwt9WLmxuMoNSN3Y+XCMO
 A0aGLaI2i9Pb7TYV++tON7pfjMGVz6QtncDV6ZIxUJ7qAbl6riZ/0bLOUAHlynHjFGsz
 jgZVEcHtW3eKzavFDaTW+lcKQBpQIJV9juezWz9TH3ad/TrZxMpCU34vumJYYHMfRc1Y
 501UIWK6arIlIiH+yxvspE8eXr88BU8njgy1Qj1Xu6KYAiaysbSWJuyXE94KWodqZ+z9
 ClwOUM+ZlBc5IEY4fdogkJMblmn1q3LV1t8V45ul6R/ubPabPfsWrmHeu2wAKLk6BH4g
 OYMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:feedback-id:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=JeWp3AI1idtCEb/tlL53bEeivC6lDxwyV5blCIKy/sI=;
 b=1fU2F3CyuKPBLDZ9jxqlklodvgqwEBvEJzh0yqHmErb58ldkEqcMWYJcH5NZBPR3WW
 oJBOgTmCGc3ydw+DEqcVATwDfuVlehiyGkSGsfSAAJRgjJdDd/Z+VaVUoCjD8nhisqkg
 EcQWsYx6ygQR/nivs4Ue64lrxH0BT+sXEaTHXkL8fc20pEftccBej1nboo47E/FRehfZ
 k7VN8dwP6NQWd8+Uza1H7H0JVTB6kjjAfbFJ8g/axL5to9GkFc9BkWiSMFpm6v8sWNuT
 YmXDNkWy5X/dcgNpRMfsS4Orq8yhz0woocXoQU3KDVeNosyvm8DA5WVK0gXtdnrKzgov
 HS2g==
X-Gm-Message-State: AFqh2kp15ZftzBGfhY4GGzsZ1eDxx+iY3lpsDcN1wALOtKlMCWUxWuPm
 +Pv7LqaRH7DY2JOKxk8Gjzw=
X-Google-Smtp-Source: AMrXdXvr2I0BIFLf/wAAWymayxoH8tuEvbOB9HV0zJpUkY8T4F9DRa6OwPdvwCrdiU/smlo0a+xZvA==
X-Received: by 2002:ac8:1411:0:b0:3b6:3a8f:ecbc with SMTP id
 k17-20020ac81411000000b003b63a8fecbcmr18062765qtj.66.1674185229402; 
 Thu, 19 Jan 2023 19:27:09 -0800 (PST)
Received: from auth1-smtp.messagingengine.com (auth1-smtp.messagingengine.com.
 [66.111.4.227]) by smtp.gmail.com with ESMTPSA id
 cb15-20020a05622a1f8f00b003ab43dabfb1sm7071900qtb.55.2023.01.19.19.27.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 19 Jan 2023 19:27:09 -0800 (PST)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailauth.nyi.internal (Postfix) with ESMTP id 2B70F27C0054;
 Thu, 19 Jan 2023 22:27:07 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute3.internal (MEProxy); Thu, 19 Jan 2023 22:27:08 -0500
X-ME-Sender: <xms:CArKY4-bWIS_PR3UkTdlBgbzrFKh-a3BgQXVxR-4DGNCnuvEhHPMsg>
 <xme:CArKYwvSRqclehgEJgn8cidZMbyNOtU0Tn6YfPcEuO-Src_b4RJpDVV-qS1m8ApV2
 JrIiHGouEI6Sig1EQ>
X-ME-Received: <xmr:CArKY-CoYf3q3kJtJ4B0WRwzPXpRcbiVfQn4OdWkmW4PaTbYODDaCJor5J8>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrudduuddgiedtucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhvfevuffkfhggtggujgesthdtredttddtvdenucfhrhhomhepuehoqhhu
 nhcuhfgvnhhguceosghoqhhunhdrfhgvnhhgsehgmhgrihhlrdgtohhmqeenucggtffrrg
 htthgvrhhnpeehudfgudffffetuedtvdehueevledvhfelleeivedtgeeuhfegueeviedu
 ffeivdenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
 gsohhquhhnodhmvghsmhhtphgruhhthhhpvghrshhonhgrlhhithihqdeiledvgeehtdei
 gedqudejjeekheehhedvqdgsohhquhhnrdhfvghngheppehgmhgrihhlrdgtohhmsehfih
 igmhgvrdhnrghmvg
X-ME-Proxy: <xmx:CArKY4eTsdPYtx5S1ulFKrSQeaZdUQa1lO9U0e9yyG9_84xEKglp0Q>
 <xmx:CArKY9Pe3vvEVsg-PyNqO1XydZ01qWcu3caKgaj5G9AchN-yBioRgA>
 <xmx:CArKYykOgV911d_EQKVFaz3nwEKdfUUzBnnqcAjytECsWnYWgE1GNg>
 <xmx:CwrKY5FUOhn0H6pQqE_DyQIe_hj2HlsjhMPJ4Ejkwf9YMmYSziyWkd6xWxE>
Feedback-ID: iad51458e:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 19 Jan 2023 22:27:04 -0500 (EST)
Date: Thu, 19 Jan 2023 19:26:39 -0800
From: Boqun Feng <boqun.feng@gmail.com>
To: Byungchul Park <byungchul.park@lge.com>
Subject: Re: [PATCH RFC v7 00/23] DEPT(Dependency Tracker)
Message-ID: <Y8oJ70iWpBmRuaGN@boqun-archlinux>
References: <Y8mZHKJV4FH17vGn@boqun-archlinux>
 <1674179505-26987-1-git-send-email-byungchul.park@lge.com>
 <Y8n7NdFl9WEbGXH1@boqun-archlinux>
 <Y8oFj9A19cw3enHB@boqun-archlinux>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Y8oFj9A19cw3enHB@boqun-archlinux>
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
 dri-devel@lists.freedesktop.org, mhocko@kernel.org, linux-mm@kvack.org,
 linux-ide@vger.kernel.org, adilger.kernel@dilger.ca, chris.p.wilson@intel.com,
 joel@joelfernandes.org, 42.hyeyoo@gmail.com, cl@linux.com, will@kernel.org,
 duyuyang@gmail.com, sashal@kernel.org, paolo.valente@linaro.org,
 damien.lemoal@opensource.wdc.com, willy@infradead.org, hch@infradead.org,
 mingo@redhat.com, djwong@kernel.org, vdavydov.dev@gmail.com,
 rientjes@google.com, dennis@kernel.org, linux-ext4@vger.kernel.org,
 ngupta@vflare.org, johannes.berg@intel.com, dan.j.williams@intel.com,
 josef@toxicpanda.com, rostedt@goodmis.org, gwan-gyeong.mun@intel.com,
 linux-block@vger.kernel.org, linux-fsdevel@vger.kernel.org, jglisse@redhat.com,
 viro@zeniv.linux.org.uk, longman@redhat.com, tglx@linutronix.de,
 vbabka@suse.cz, melissa.srw@gmail.com, sj@kernel.org, tytso@mit.edu,
 rodrigosiqueiramelo@gmail.com, kernel-team@lge.com, gregkh@linuxfoundation.org,
 jlayton@kernel.org, linux-kernel@vger.kernel.org, penberg@kernel.org,
 minchan@kernel.org, max.byungchul.park@gmail.com, hannes@cmpxchg.org,
 tj@kernel.org, akpm@linux-foundation.org, torvalds@linux-foundation.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Jan 19, 2023 at 07:07:59PM -0800, Boqun Feng wrote:
> On Thu, Jan 19, 2023 at 06:23:49PM -0800, Boqun Feng wrote:
> > On Fri, Jan 20, 2023 at 10:51:45AM +0900, Byungchul Park wrote:
> > > Boqun wrote:
> > > > On Thu, Jan 19, 2023 at 01:33:58PM +0000, Matthew Wilcox wrote:
> > > > > On Thu, Jan 19, 2023 at 03:23:08PM +0900, Byungchul Park wrote:
> > > > > > Boqun wrote:
> > > > > > > *Looks like the DEPT dependency graph doesn't handle the
> > > > > > > fair/unfair readers as lockdep current does. Which bring the
> > > > > > > next question.
> > > > > > 
> > > > > > No. DEPT works better for unfair read. It works based on wait/event. So
> > > > > > read_lock() is considered a potential wait waiting on write_unlock()
> > > > > > while write_lock() is considered a potential wait waiting on either
> > > > > > write_unlock() or read_unlock(). DEPT is working perfect for it.
> > > > > > 
> > > > > > For fair read (maybe you meant queued read lock), I think the case
> > > > > > should be handled in the same way as normal lock. I might get it wrong.
> > > > > > Please let me know if I miss something.
> > > > > 
> > > > > From the lockdep/DEPT point of view, the question is whether:
> > > > > 
> > > > >	read_lock(A)
> > > > >	read_lock(A)
> > > > > 
> > > > > can deadlock if a writer comes in between the two acquisitions and
> > > > > sleeps waiting on A to be released.  A fair lock will block new
> > > > > readers when a writer is waiting, while an unfair lock will allow
> > > > > new readers even while a writer is waiting.
> > > > > 
> > > > 
> > > > To be more accurate, a fair reader will wait if there is a writer
> > > > waiting for other reader (fair or not) to unlock, and an unfair reader
> > > > won't.
> > > 
> > > What a kind guys, both of you! Thanks.
> > > 
> > > I asked to check if there are other subtle things than this. Fortunately,
> > > I already understand what you guys shared.
> > > 
> > > > In kernel there are read/write locks that can have both fair and unfair
> > > > readers (e.g. queued rwlock). Regarding deadlocks,
> > > > 
> > > > 	T0		T1		T2
> > > > 	--		--		--
> > > > 	fair_read_lock(A);
> > > > 			write_lock(B);
> > > > 					write_lock(A);
> > > > 	write_lock(B);
> > > > 			unfair_read_lock(A);
> > > 
> > > With the DEPT's point of view (let me re-write the scenario):
> > > 
> > > 	T0		T1		T2
> > > 	--		--		--
> > > 	fair_read_lock(A);
> > > 			write_lock(B);
> > > 					write_lock(A);
> > > 	write_lock(B);
> > > 			unfair_read_lock(A);
> > > 	write_unlock(B);
> > > 	read_unlock(A);
> > > 			read_unlock(A);
> > > 			write_unlock(B);
> > > 					write_unlock(A);
> > > 
> > > T0: read_unlock(A) cannot happen if write_lock(B) is stuck by a B owner
> > >     not doing either write_unlock(B) or read_unlock(B). In other words:
> > > 
> > >       1. read_unlock(A) happening depends on write_unlock(B) happening.
> > >       2. read_unlock(A) happening depends on read_unlock(B) happening.
> > > 
> > > T1: write_unlock(B) cannot happen if unfair_read_lock(A) is stuck by a A
> > >     owner not doing write_unlock(A). In other words:
> > > 
> > >       3. write_unlock(B) happening depends on write_unlock(A) happening.
> > > 
> > > 1, 2 and 3 give the following dependencies:
> > > 
> > >     1. read_unlock(A) -> write_unlock(B)
> > >     2. read_unlock(A) -> read_unlock(B)
> > >     3. write_unlock(B) -> write_unlock(A)
> > > 
> > > There's no circular dependency so it's safe. DEPT doesn't report this.
> > > 
> > > > the above is not a deadlock, since T1's unfair reader can "steal" the
> > > > lock. However the following is a deadlock:
> > > > 
> > > > 	T0		T1		T2
> > > > 	--		--		--
> > > > 	unfair_read_lock(A);
> > > > 			write_lock(B);
> > > > 					write_lock(A);
> > > > 	write_lock(B);
> > > > 			fair_read_lock(A);
> > > > 
> > > > , since T'1 fair reader will wait.
> > > 
> > > With the DEPT's point of view (let me re-write the scenario):
> > > 
> > > 	T0		T1		T2
> > > 	--		--		--
> > > 	unfair_read_lock(A);
> > > 			write_lock(B);
> > > 					write_lock(A);
> > > 	write_lock(B);
> > > 			fair_read_lock(A);
> > > 	write_unlock(B);
> > > 	read_unlock(A);
> > > 			read_unlock(A);
> > > 			write_unlock(B);
> > > 					write_unlock(A);
> > > 
> > > T0: read_unlock(A) cannot happen if write_lock(B) is stuck by a B owner
> > >     not doing either write_unlock(B) or read_unlock(B). In other words:
> > > 
> > >       1. read_unlock(A) happening depends on write_unlock(B) happening.
> > >       2. read_unlock(A) happening depends on read_unlock(B) happening.
> > > 
> > > T1: write_unlock(B) cannot happen if fair_read_lock(A) is stuck by a A
> > >     owner not doing either write_unlock(A) or read_unlock(A). In other
> > >     words:
> > > 
> > >       3. write_unlock(B) happening depends on write_unlock(A) happening.
> > >       4. write_unlock(B) happening depends on read_unlock(A) happening.
> > > 
> > > 1, 2, 3 and 4 give the following dependencies:
> > > 
> > >     1. read_unlock(A) -> write_unlock(B)
> > >     2. read_unlock(A) -> read_unlock(B)
> > >     3. write_unlock(B) -> write_unlock(A)
> > >     4. write_unlock(B) -> read_unlock(A)
> > > 
> > > With 1 and 4, there's a circular dependency so DEPT definitely report
> > > this as a problem.
> > > 
> > > REMIND: DEPT focuses on waits and events.
> > 
> > Do you have the test cases showing DEPT can detect this?
> > 
> 
> Just tried the following on your latest GitHub branch, I commented all
> but one deadlock case. Lockdep CAN detect it but DEPT CANNOT detect it.
> Feel free to double check.
> 

In case anyone else want to try, let me explain a little bit how to
verify the behavior of the detectors. With the change, the only test
that runs is 

	dotest(queued_read_lock_hardirq_RE_Er, FAILURE, LOCKTYPE_RWLOCK);

"FAILURE" indicates selftests think lockdep should report a deadlock,
therefore for lockdep if all goes well, you will see:

	[...]       hardirq read-lock/lock-read:  ok  |

If you expect lockdep to print a full splat in the test (lockdep is
silent by default), you can add "debug_locks_verbose=2" in the kernel
command line, "2" mean RWLOCK testsuite.

Regards,
Boqun

> Regards,
> Boqun
