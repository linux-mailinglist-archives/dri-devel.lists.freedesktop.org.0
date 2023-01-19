Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 14A646742C1
	for <lists+dri-devel@lfdr.de>; Thu, 19 Jan 2023 20:25:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EE94710E253;
	Thu, 19 Jan 2023 19:25:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-x82b.google.com (mail-qt1-x82b.google.com
 [IPv6:2607:f8b0:4864:20::82b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4E90D10E9DA
 for <dri-devel@lists.freedesktop.org>; Thu, 19 Jan 2023 19:25:45 +0000 (UTC)
Received: by mail-qt1-x82b.google.com with SMTP id x5so2391074qti.3
 for <dri-devel@lists.freedesktop.org>; Thu, 19 Jan 2023 11:25:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:feedback-id:from:to:cc:subject:date
 :message-id:reply-to;
 bh=xamYJZSiEPy9Mjo2njH+JPn5/UHZCpsx0WYfjjoyGiY=;
 b=MrwOCC5ehcze1hpMjcT+s1KhKEgcE4YPuq3yqI1Cm5uRCIw1PUevaLEC6XkTcNhbT9
 Zw0OvgbmLEFdn1tUM2fjgufvEQCRxf9F5A/ADdKpwTfdOwWf/0FqKiy1RuuQeUDtT2r1
 WOQNX4WCd5xldt11cYOVTcAYa8grKYNOtlZuJLBY7Hqr8xr25RNCaSO7DWHMR1iJ2wZ4
 jILLDKWwZP8GiSLOga1KZkHZ1Quhj6gfAe4Q0cx1AezAz9Aw7s1aRjjoXenbgYqQO8nm
 QgeiFuARK8oNcrVywEUZQ78eB39jl9apcTRWslHRMXoRBD4K3HuCxamntvSxOTPxK4uE
 BODA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:feedback-id:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=xamYJZSiEPy9Mjo2njH+JPn5/UHZCpsx0WYfjjoyGiY=;
 b=f3i8HnWUOWzeyHUFa7Y3Vp7kjB+SdUN3H/KheOv5y01Vv8HHRZw6gfih5yTI9X84o1
 zqnHrJAqvVGvSjp13ukj1X7Htrj7tVKD+qIEk0tSjdjFRDMPM3imYnBqLcminzFpJFzw
 rvr+hrpgntShL4Ctxiru+BIAC4r8xp8IuYLAx4e/nOu6TsgmUEbLBGS+Jlkc6WxcTHr9
 AHS/ZZBL6stalv+h/a9iJU1P5cPFAXlRJSRbcrdWB4ItKiY1HYzzknRfeLScVE6geZPW
 a0eD6m6jO7Scl/UD93t14Nac8ra6Rx7WBRljfIn+mX+1YgsUoWJFe8OMAlmMGfXVMOk0
 HUjw==
X-Gm-Message-State: AFqh2kotTQJGXISZzu+rvVkzCuzcPj2HkKshFg5KSBcO4Z8YFLAjxdl3
 d69iG6+bmdMzft1CruyQsfE=
X-Google-Smtp-Source: AMrXdXsoLGLbfa/acc8BBfWydzzE0cdc7MVdwvIQKEjpx0fPhQGQygjmLuqjO93xlt2Ff3JyRVvFJw==
X-Received: by 2002:a05:622a:5c8c:b0:3ab:b632:fa95 with SMTP id
 ge12-20020a05622a5c8c00b003abb632fa95mr17852071qtb.44.1674156344443; 
 Thu, 19 Jan 2023 11:25:44 -0800 (PST)
Received: from auth2-smtp.messagingengine.com (auth2-smtp.messagingengine.com.
 [66.111.4.228]) by smtp.gmail.com with ESMTPSA id
 fu28-20020a05622a5d9c00b003a7f3c4dcdfsm19389879qtb.47.2023.01.19.11.25.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 19 Jan 2023 11:25:44 -0800 (PST)
Received: from compute6.internal (compute6.nyi.internal [10.202.2.47])
 by mailauth.nyi.internal (Postfix) with ESMTP id 20B2C27C0054;
 Thu, 19 Jan 2023 14:25:42 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute6.internal (MEProxy); Thu, 19 Jan 2023 14:25:43 -0500
X-ME-Sender: <xms:NZnJYwTxwYLfh8N7togMMPPYVeKdqLNSU6cBkqgYw1MVfb1Q7g283w>
 <xme:NZnJY9xSw9qvXrrAIJEbpvx12Y2TyP_RnRTmtBw-y1f1OYtEkrBMU_4YXAozbQqOh
 zbQZ0y4tj_ONrG2QQ>
X-ME-Received: <xmr:NZnJY91HzMP2Iy60XcV_ZcT4yKf2IQY3ocx0fpLzHGwRF2CeF0X43zzN0DQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedruddutddguddviecutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
 necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
 enucfjughrpeffhffvvefukfhfgggtuggjsehttdertddttddvnecuhfhrohhmpeeuohhq
 uhhnucfhvghnghcuoegsohhquhhnrdhfvghnghesghhmrghilhdrtghomheqnecuggftrf
 grthhtvghrnhephedugfduffffteeutddvheeuveelvdfhleelieevtdeguefhgeeuveei
 udffiedvnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomh
 epsghoqhhunhdomhgvshhmthhprghuthhhphgvrhhsohhnrghlihhthidqieelvdeghedt
 ieegqddujeejkeehheehvddqsghoqhhunhdrfhgvnhhgpeepghhmrghilhdrtghomhesfh
 higihmvgdrnhgrmhgv
X-ME-Proxy: <xmx:NZnJY0CTKhGEBWy1veKc6w2hVzbwm1Rf2uZ1Xsyyk9_pC7SbEHDNOw>
 <xmx:NZnJY5j2rwpIuu1Rn9fBKWIyoQvQrI42uB43xg7d0VHM2TJ04SwWGA>
 <xmx:NZnJYworf0mYeiLAkASjr3os2e8ECpvW0MlaGgzHEya6_0aWJpdS2A>
 <xmx:NpnJY464YDfl0tqd71pt0eI__JWNhiE-bQVw-oxLk6HFFui_uQOFPuiI1T8>
Feedback-ID: iad51458e:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 19 Jan 2023 14:25:40 -0500 (EST)
Date: Thu, 19 Jan 2023 11:25:16 -0800
From: Boqun Feng <boqun.feng@gmail.com>
To: Matthew Wilcox <willy@infradead.org>
Subject: Re: [PATCH RFC v7 00/23] DEPT(Dependency Tracker)
Message-ID: <Y8mZHKJV4FH17vGn@boqun-archlinux>
References: <Y8bmeffIQ3iXU3Ux@boqun-archlinux>
 <1674109388-6663-1-git-send-email-byungchul.park@lge.com>
 <Y8lGxkBrls6qQOdM@casper.infradead.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Y8lGxkBrls6qQOdM@casper.infradead.org>
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
 linux-ide@vger.kernel.org, adilger.kernel@dilger.ca, joel@joelfernandes.org,
 42.hyeyoo@gmail.com, cl@linux.com, will@kernel.org, duyuyang@gmail.com,
 sashal@kernel.org, paolo.valente@linaro.org, damien.lemoal@opensource.wdc.com,
 chris.p.wilson@intel.com, hch@infradead.org, mingo@redhat.com,
 djwong@kernel.org, vdavydov.dev@gmail.com, rientjes@google.com,
 dennis@kernel.org, linux-ext4@vger.kernel.org, ngupta@vflare.org,
 johannes.berg@intel.com, dan.j.williams@intel.com, josef@toxicpanda.com,
 rostedt@goodmis.org, gwan-gyeong.mun@intel.com,
 Byungchul Park <byungchul.park@lge.com>, linux-fsdevel@vger.kernel.org,
 jglisse@redhat.com, viro@zeniv.linux.org.uk, longman@redhat.com,
 tglx@linutronix.de, vbabka@suse.cz, melissa.srw@gmail.com,
 linux-block@vger.kernel.org, sj@kernel.org, tytso@mit.edu,
 rodrigosiqueiramelo@gmail.com, kernel-team@lge.com, gregkh@linuxfoundation.org,
 jlayton@kernel.org, linux-kernel@vger.kernel.org, penberg@kernel.org,
 minchan@kernel.org, max.byungchul.park@gmail.com, hannes@cmpxchg.org,
 tj@kernel.org, akpm@linux-foundation.org, torvalds@linux-foundation.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Jan 19, 2023 at 01:33:58PM +0000, Matthew Wilcox wrote:
> On Thu, Jan 19, 2023 at 03:23:08PM +0900, Byungchul Park wrote:
> > Boqun wrote:
> > > *	Looks like the DEPT dependency graph doesn't handle the
> > > 	fair/unfair readers as lockdep current does. Which bring the
> > > 	next question.
> > 
> > No. DEPT works better for unfair read. It works based on wait/event. So
> > read_lock() is considered a potential wait waiting on write_unlock()
> > while write_lock() is considered a potential wait waiting on either
> > write_unlock() or read_unlock(). DEPT is working perfect for it.
> > 
> > For fair read (maybe you meant queued read lock), I think the case
> > should be handled in the same way as normal lock. I might get it wrong.
> > Please let me know if I miss something.
> 
> From the lockdep/DEPT point of view, the question is whether:
> 
> 	read_lock(A)
> 	read_lock(A)
> 
> can deadlock if a writer comes in between the two acquisitions and
> sleeps waiting on A to be released.  A fair lock will block new
> readers when a writer is waiting, while an unfair lock will allow
> new readers even while a writer is waiting.
> 

To be more accurate, a fair reader will wait if there is a writer
waiting for other reader (fair or not) to unlock, and an unfair reader
won't.

In kernel there are read/write locks that can have both fair and unfair
readers (e.g. queued rwlock). Regarding deadlocks,

	T0		T1		T2
	--		--		--
	fair_read_lock(A);
			write_lock(B);
					write_lock(A);
	write_lock(B);
			unfair_read_lock(A);

the above is not a deadlock, since T1's unfair reader can "steal" the
lock. However the following is a deadlock:

	T0		T1		T2
	--		--		--
	unfair_read_lock(A);
			write_lock(B);
					write_lock(A);
	write_lock(B);
			fair_read_lock(A);

, since T'1 fair reader will wait.

FWIW, lockdep is able to catch this (figuring out which is deadlock and
which is not) since two years ago, plus other trivial deadlock detection
for read/write locks. Needless to say, if lib/lock-selftests.c was given
a try, one could find it out on one's own.

Regards,
Boqun
