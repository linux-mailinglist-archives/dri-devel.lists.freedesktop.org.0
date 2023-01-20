Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 41B63674950
	for <lists+dri-devel@lfdr.de>; Fri, 20 Jan 2023 03:24:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D54BA10EA0D;
	Fri, 20 Jan 2023 02:24:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-x82b.google.com (mail-qt1-x82b.google.com
 [IPv6:2607:f8b0:4864:20::82b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 152DB10EA0D
 for <dri-devel@lists.freedesktop.org>; Fri, 20 Jan 2023 02:24:19 +0000 (UTC)
Received: by mail-qt1-x82b.google.com with SMTP id q15so3236407qtn.0
 for <dri-devel@lists.freedesktop.org>; Thu, 19 Jan 2023 18:24:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:feedback-id:from:to:cc:subject:date
 :message-id:reply-to;
 bh=nXmrGuDkn2/Eo83iFxWHgNA7AWXWKN7q1/fDzp0dVyE=;
 b=kDK20ncsOnJblkAwd0Y2Y59cRIL8dXnF51upa4ooOnHX1wQqX5ftBtnDYkiI/Ae06M
 O9EC9eif/MuMYtFZV1lv6hxt1qW/daZXI84Cfd3fVgwCF5++3HWYeNc8a4AQ1Msd2HgR
 0rUk339PKVfWEvaGynHDn/OXou0xTF8O6qWOli6Prs6phF8O6aI9W6ur6Q6wyAXPKq+K
 xksp6hoTxHm8qWWXSfxa68JNytzXV+AXbFHCcrxnkwiKgbOiNlO63r0xUhy3ZES1LXXy
 T2k9wPS8tOQGlrAQ9zTZXi98iBbGK+SxyQx/qM2oV0MH8GgY8jwHy7XC5e+3u9TwTHVK
 vKJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:feedback-id:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=nXmrGuDkn2/Eo83iFxWHgNA7AWXWKN7q1/fDzp0dVyE=;
 b=D0t8bML2z5Pc27Wgwdl0A9hROzBeNQE5S2n84vxOdMMRdIwH2aAszx0aRbtoMcCNOd
 o3d5BX9+AcMURYfqdwzoMQA8rdTqgioGHa0X/DlUoE3gT2e2hxiTJ2FFy8DkMfOLov1B
 eBTjEipKB7Ew2iCdkzZcSnaKo9UGroCJaGn6CRgm8Jf31RabW/MiDiGmMprLquR5Q49f
 DzgEh6Nr5NufDVsuLL4+u0RDC8le0YoeGKyUc7LQ39IFHoSShXQ2HrZB+8HX5hvB8OXP
 rxqaCJiOnB4Yr8plHcMffCxetCJovRk6+cbg5vhoT3iLlFYFnKGACyg6yYnkBc2nxlIH
 6KrQ==
X-Gm-Message-State: AFqh2kpsU4f3NppV42/VcDmrbmCU4IMCDPH2UuFSGRmOzo1JJ3v3ag19
 L6UvGsnr8DgDr4qmfWU38fI=
X-Google-Smtp-Source: AMrXdXsiMeOE3GgPAmeagT095UwyXmaB30P7mx2mcshrzV0OcQWmOmSytjDTrXm0e3reQk4vMsGu7A==
X-Received: by 2002:ac8:58c3:0:b0:3b6:2e8b:3364 with SMTP id
 u3-20020ac858c3000000b003b62e8b3364mr22935218qta.38.1674181458748; 
 Thu, 19 Jan 2023 18:24:18 -0800 (PST)
Received: from auth1-smtp.messagingengine.com (auth1-smtp.messagingengine.com.
 [66.111.4.227]) by smtp.gmail.com with ESMTPSA id
 t20-20020ac865d4000000b003ab7aee56a0sm3430879qto.39.2023.01.19.18.24.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 19 Jan 2023 18:24:18 -0800 (PST)
Received: from compute6.internal (compute6.nyi.internal [10.202.2.47])
 by mailauth.nyi.internal (Postfix) with ESMTP id 7026227C0054;
 Thu, 19 Jan 2023 21:24:17 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute6.internal (MEProxy); Thu, 19 Jan 2023 21:24:17 -0500
X-ME-Sender: <xms:T_vJYzHnHDTMCt8jto_nWcNHcvjGpgV4RvXPMPNFrTftwxZEnGSO0g>
 <xme:T_vJYwWSJg8VNuVpXyE8E2reWX4XQdWPyjlmAe0rSjk1q18okkcj0DuHJBzrJMq-h
 2BHgZrbF3-2z5tXPw>
X-ME-Received: <xmr:T_vJY1ICmQQtrLyW94m-OCcuioCpWG_JQYMNIQrE8vXtpfI-eCbh1FtbvSc>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrudduuddggeejucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhvfevuffkfhggtggujgesthdtredttddtvdenucfhrhhomhepuehoqhhu
 nhcuhfgvnhhguceosghoqhhunhdrfhgvnhhgsehgmhgrihhlrdgtohhmqeenucggtffrrg
 htthgvrhhnpeehudfgudffffetuedtvdehueevledvhfelleeivedtgeeuhfegueeviedu
 ffeivdenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
 gsohhquhhnodhmvghsmhhtphgruhhthhhpvghrshhonhgrlhhithihqdeiledvgeehtdei
 gedqudejjeekheehhedvqdgsohhquhhnrdhfvghngheppehgmhgrihhlrdgtohhmsehfih
 igmhgvrdhnrghmvg
X-ME-Proxy: <xmx:T_vJYxEVt_E7yCBMkNlpdHT5QTmouUaZCHkbiwwgo9SMC9f1ypeHcg>
 <xmx:T_vJY5UC0c1dPYjN1YJ_6DhJnOJXFkqidaO7l8UjxcPRdnOLR2EW0w>
 <xmx:T_vJY8OTkoLcYoXpmUowRiLOhXTP7VGD0CwmQXGUfkwXJRtYYKhXQw>
 <xmx:UfvJYwNwPTJ1_44JcBxyGjDYBTUUeNqEoQQDIfCiiaDhhOipxIQ6KAhvHfQ>
Feedback-ID: iad51458e:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 19 Jan 2023 21:24:14 -0500 (EST)
Date: Thu, 19 Jan 2023 18:23:49 -0800
From: Boqun Feng <boqun.feng@gmail.com>
To: Byungchul Park <byungchul.park@lge.com>
Subject: Re: [PATCH RFC v7 00/23] DEPT(Dependency Tracker)
Message-ID: <Y8n7NdFl9WEbGXH1@boqun-archlinux>
References: <Y8mZHKJV4FH17vGn@boqun-archlinux>
 <1674179505-26987-1-git-send-email-byungchul.park@lge.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1674179505-26987-1-git-send-email-byungchul.park@lge.com>
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

On Fri, Jan 20, 2023 at 10:51:45AM +0900, Byungchul Park wrote:
> Boqun wrote:
> > On Thu, Jan 19, 2023 at 01:33:58PM +0000, Matthew Wilcox wrote:
> > > On Thu, Jan 19, 2023 at 03:23:08PM +0900, Byungchul Park wrote:
> > > > Boqun wrote:
> > > > > *Looks like the DEPT dependency graph doesn't handle the
> > > > > fair/unfair readers as lockdep current does. Which bring the
> > > > > next question.
> > > > 
> > > > No. DEPT works better for unfair read. It works based on wait/event. So
> > > > read_lock() is considered a potential wait waiting on write_unlock()
> > > > while write_lock() is considered a potential wait waiting on either
> > > > write_unlock() or read_unlock(). DEPT is working perfect for it.
> > > > 
> > > > For fair read (maybe you meant queued read lock), I think the case
> > > > should be handled in the same way as normal lock. I might get it wrong.
> > > > Please let me know if I miss something.
> > > 
> > > From the lockdep/DEPT point of view, the question is whether:
> > > 
> > >	read_lock(A)
> > >	read_lock(A)
> > > 
> > > can deadlock if a writer comes in between the two acquisitions and
> > > sleeps waiting on A to be released.  A fair lock will block new
> > > readers when a writer is waiting, while an unfair lock will allow
> > > new readers even while a writer is waiting.
> > > 
> > 
> > To be more accurate, a fair reader will wait if there is a writer
> > waiting for other reader (fair or not) to unlock, and an unfair reader
> > won't.
> 
> What a kind guys, both of you! Thanks.
> 
> I asked to check if there are other subtle things than this. Fortunately,
> I already understand what you guys shared.
> 
> > In kernel there are read/write locks that can have both fair and unfair
> > readers (e.g. queued rwlock). Regarding deadlocks,
> > 
> > 	T0		T1		T2
> > 	--		--		--
> > 	fair_read_lock(A);
> > 			write_lock(B);
> > 					write_lock(A);
> > 	write_lock(B);
> > 			unfair_read_lock(A);
> 
> With the DEPT's point of view (let me re-write the scenario):
> 
> 	T0		T1		T2
> 	--		--		--
> 	fair_read_lock(A);
> 			write_lock(B);
> 					write_lock(A);
> 	write_lock(B);
> 			unfair_read_lock(A);
> 	write_unlock(B);
> 	read_unlock(A);
> 			read_unlock(A);
> 			write_unlock(B);
> 					write_unlock(A);
> 
> T0: read_unlock(A) cannot happen if write_lock(B) is stuck by a B owner
>     not doing either write_unlock(B) or read_unlock(B). In other words:
> 
>       1. read_unlock(A) happening depends on write_unlock(B) happening.
>       2. read_unlock(A) happening depends on read_unlock(B) happening.
> 
> T1: write_unlock(B) cannot happen if unfair_read_lock(A) is stuck by a A
>     owner not doing write_unlock(A). In other words:
> 
>       3. write_unlock(B) happening depends on write_unlock(A) happening.
> 
> 1, 2 and 3 give the following dependencies:
> 
>     1. read_unlock(A) -> write_unlock(B)
>     2. read_unlock(A) -> read_unlock(B)
>     3. write_unlock(B) -> write_unlock(A)
> 
> There's no circular dependency so it's safe. DEPT doesn't report this.
> 
> > the above is not a deadlock, since T1's unfair reader can "steal" the
> > lock. However the following is a deadlock:
> > 
> > 	T0		T1		T2
> > 	--		--		--
> > 	unfair_read_lock(A);
> > 			write_lock(B);
> > 					write_lock(A);
> > 	write_lock(B);
> > 			fair_read_lock(A);
> > 
> > , since T'1 fair reader will wait.
> 
> With the DEPT's point of view (let me re-write the scenario):
> 
> 	T0		T1		T2
> 	--		--		--
> 	unfair_read_lock(A);
> 			write_lock(B);
> 					write_lock(A);
> 	write_lock(B);
> 			fair_read_lock(A);
> 	write_unlock(B);
> 	read_unlock(A);
> 			read_unlock(A);
> 			write_unlock(B);
> 					write_unlock(A);
> 
> T0: read_unlock(A) cannot happen if write_lock(B) is stuck by a B owner
>     not doing either write_unlock(B) or read_unlock(B). In other words:
> 
>       1. read_unlock(A) happening depends on write_unlock(B) happening.
>       2. read_unlock(A) happening depends on read_unlock(B) happening.
> 
> T1: write_unlock(B) cannot happen if fair_read_lock(A) is stuck by a A
>     owner not doing either write_unlock(A) or read_unlock(A). In other
>     words:
> 
>       3. write_unlock(B) happening depends on write_unlock(A) happening.
>       4. write_unlock(B) happening depends on read_unlock(A) happening.
> 
> 1, 2, 3 and 4 give the following dependencies:
> 
>     1. read_unlock(A) -> write_unlock(B)
>     2. read_unlock(A) -> read_unlock(B)
>     3. write_unlock(B) -> write_unlock(A)
>     4. write_unlock(B) -> read_unlock(A)
> 
> With 1 and 4, there's a circular dependency so DEPT definitely report
> this as a problem.
> 
> REMIND: DEPT focuses on waits and events.

Do you have the test cases showing DEPT can detect this?

Regards,
Boqun

> 
> > FWIW, lockdep is able to catch this (figuring out which is deadlock and
> > which is not) since two years ago, plus other trivial deadlock detection
> > for read/write locks. Needless to say, if lib/lock-selftests.c was given
> > a try, one could find it out on one's own.
> > 
> > Regards,
> > Boqun
> > 
