Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AFAB9676382
	for <lists+dri-devel@lfdr.de>; Sat, 21 Jan 2023 04:44:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D175810E0F2;
	Sat, 21 Jan 2023 03:44:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-x82a.google.com (mail-qt1-x82a.google.com
 [IPv6:2607:f8b0:4864:20::82a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 32ECA10E0F2
 for <dri-devel@lists.freedesktop.org>; Sat, 21 Jan 2023 03:44:08 +0000 (UTC)
Received: by mail-qt1-x82a.google.com with SMTP id z9so5783222qtv.5
 for <dri-devel@lists.freedesktop.org>; Fri, 20 Jan 2023 19:44:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:feedback-id:from:to:cc:subject:date
 :message-id:reply-to;
 bh=oQMqPUw9hwIL711N+3/JISEhbTkZf60Reascbm6VQQ4=;
 b=P5gDUR0TzntSFmhj0dmJ+CaeXwQJd30S3yEAe4HnfSMmiBvzi6l7uY+FP3JRNJ9K2H
 77XYekwOcuPbJzIlLI3UwvU/JCUdb1ivZr70QVzsRTRdR7ZzUQhBYFs7PHS6h+m1xIK9
 ffl7FTa9Mvlv93Yp+90v61XOn40XGl8xz2OoM7uuqXhgRXj7DwRWjuS/s7dCP4eIHW2I
 IWWpCYitqzGsOerU+oQPSDKkDuNwABQAoGLuwlPKRb3ZZ5udriGCXtmDupYRsLn4/s4z
 sulW8DoVUCbnR+WP9Ek7y/AVAgfqNnFY1U7vBD/gOiJYg6u0RnsXLH6djqobHls0e7aE
 8miQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:feedback-id:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=oQMqPUw9hwIL711N+3/JISEhbTkZf60Reascbm6VQQ4=;
 b=jsY1vNHSFMaLJ65dXX7i5198l/2VlpF1K0gvDIKuCOG6u83iz/RelZxmSAWkkqS6dW
 OyWvqqIwOK15dARuvPwpEvti+KjnF514lLLkpbHTwPBv+sgdxjxUjb0D9u2AkR1ryEXI
 NmPdmRGdvQZRWYHn6T7RR5GB1yXvdc+E33PJ6wjqmlxnMH4bshnLrOq44VstZ4wm3AUR
 3xpudCI63vYVsz0MedvO/32O7zwsTZC9WXCmCkilGEe6QDOo33c6KcPz7n6a4mQQZ8En
 t60YWfjdtFLF7bFenx8kTSOZoqSCN0qMSQy5GjdjoUogXIhGuGiTcS8wlXPsSIFpgCWh
 dVZw==
X-Gm-Message-State: AFqh2koujrs0e8UBPxD5zMF+jVapOp1RZVMPQsVa4Go8mnEEQa+WF+p9
 ex5o+C8ZeZTF1A+HK624z7E=
X-Google-Smtp-Source: AMrXdXv9kph91m5UoaQ7pvVbeKEctJ++BH1PfDXnnzU7/b4l1P7oNh8E0XfGubxli2XuOb02dI4IOg==
X-Received: by 2002:a05:622a:1f16:b0:3b6:369f:c219 with SMTP id
 ca22-20020a05622a1f1600b003b6369fc219mr26818720qtb.56.1674272647249; 
 Fri, 20 Jan 2023 19:44:07 -0800 (PST)
Received: from auth1-smtp.messagingengine.com (auth1-smtp.messagingengine.com.
 [66.111.4.227]) by smtp.gmail.com with ESMTPSA id
 w25-20020ac86b19000000b003b63c08a888sm6632497qts.4.2023.01.20.19.44.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 20 Jan 2023 19:44:07 -0800 (PST)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
 by mailauth.nyi.internal (Postfix) with ESMTP id 09C4627C005B;
 Fri, 20 Jan 2023 22:44:05 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute2.internal (MEProxy); Fri, 20 Jan 2023 22:44:06 -0500
X-ME-Sender: <xms:g1_LYxJBn6Xd7XL-U6p_DwUFEuGWut2yulsEcMlGld8gFgBwznt0cQ>
 <xme:g1_LY9L80nlpQ3vsCVBm8V8dcoCezBZBkS8gAwH66LXvRTUotwZQCbcXXgwZYnQ32
 HJK8r8o6NnKtCUY6A>
X-ME-Received: <xmr:g1_LY5up8pJaYFWNBQgck_HD55GkjtXhSVilhdZT8_--d05x5mebe2iTljvDz1DNCnj7tpT37Xv4b1GwNK3JM7Qp9xIrnnVIOF4>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedruddufedgieefucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhvfevuffkfhggtggujgesthdtredttddtvdenucfhrhhomhepuehoqhhu
 nhcuhfgvnhhguceosghoqhhunhdrfhgvnhhgsehgmhgrihhlrdgtohhmqeenucggtffrrg
 htthgvrhhnpefhtedvgfdtueekvdekieetieetjeeihedvteehuddujedvkedtkeefgedv
 vdehtdenucffohhmrghinhepkhgvrhhnvghlrdhorhhgnecuvehluhhsthgvrhfuihiivg
 eptdenucfrrghrrghmpehmrghilhhfrhhomhepsghoqhhunhdomhgvshhmthhprghuthhh
 phgvrhhsohhnrghlihhthidqieelvdeghedtieegqddujeejkeehheehvddqsghoqhhunh
 drfhgvnhhgpeepghhmrghilhdrtghomhesfhhigihmvgdrnhgrmhgv
X-ME-Proxy: <xmx:g1_LYyblep8vLXU8X_XZbBWVjM0ODY7nES_2KaakN2vJIBz3UpxkCA>
 <xmx:g1_LY4Z5f8D0Tv-ulO8ISYcLbGS5SrO9OqxHZDAY8FfqotjtP3Nb5g>
 <xmx:g1_LY2C-4zm5euFl4Fhj4dhLGWA8jWIzcCllSVEjl-iqw2tiAp-ohA>
 <xmx:hV_LY0wIIsj4kAnW951fzRTsebUsUwoVezIV4pOnr7TpfXMJo9pVjO55vh0>
Feedback-ID: iad51458e:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 20 Jan 2023 22:44:02 -0500 (EST)
Date: Fri, 20 Jan 2023 19:44:01 -0800
From: Boqun Feng <boqun.feng@gmail.com>
To: Byungchul Park <byungchul.park@lge.com>
Subject: Re: [PATCH RFC v7 00/23] DEPT(Dependency Tracker)
Message-ID: <Y8tfgYNZ//feEDvC@Boquns-Mac-mini.local>
References: <Y8oFj9A19cw3enHB@boqun-archlinux>
 <1674271694-18950-1-git-send-email-byungchul.park@lge.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1674271694-18950-1-git-send-email-byungchul.park@lge.com>
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

On Sat, Jan 21, 2023 at 12:28:14PM +0900, Byungchul Park wrote:
> On Thu, Jan 19, 2023 at 07:07:59PM -0800, Boqun Feng wrote:
> > On Thu, Jan 19, 2023 at 06:23:49PM -0800, Boqun Feng wrote:
> > > On Fri, Jan 20, 2023 at 10:51:45AM +0900, Byungchul Park wrote:
> 
> [...]
> 
> > > > T0		T1		T2
> > > > --		--		--
> > > > unfair_read_lock(A);
> > > >			write_lock(B);
> > > >					write_lock(A);
> > > > write_lock(B);
> > > >			fair_read_lock(A);
> > > > write_unlock(B);
> > > > read_unlock(A);
> > > >			read_unlock(A);
> > > >			write_unlock(B);
> > > >					write_unlock(A);
> > > > 
> > > > T0: read_unlock(A) cannot happen if write_lock(B) is stuck by a B owner
> > > >     not doing either write_unlock(B) or read_unlock(B). In other words:
> > > > 
> > > >       1. read_unlock(A) happening depends on write_unlock(B) happening.
> > > >       2. read_unlock(A) happening depends on read_unlock(B) happening.
> > > > 
> > > > T1: write_unlock(B) cannot happen if fair_read_lock(A) is stuck by a A
> > > >     owner not doing either write_unlock(A) or read_unlock(A). In other
> > > >     words:
> > > > 
> > > >       3. write_unlock(B) happening depends on write_unlock(A) happening.
> > > >       4. write_unlock(B) happening depends on read_unlock(A) happening.
> > > > 
> > > > 1, 2, 3 and 4 give the following dependencies:
> > > > 
> > > >     1. read_unlock(A) -> write_unlock(B)
> > > >     2. read_unlock(A) -> read_unlock(B)
> > > >     3. write_unlock(B) -> write_unlock(A)
> > > >     4. write_unlock(B) -> read_unlock(A)
> > > > 
> > > > With 1 and 4, there's a circular dependency so DEPT definitely report
> > > > this as a problem.
> > > > 
> > > > REMIND: DEPT focuses on waits and events.
> > > 
> > > Do you have the test cases showing DEPT can detect this?
> > > 
> > 
> > Just tried the following on your latest GitHub branch, I commented all
> > but one deadlock case. Lockdep CAN detect it but DEPT CANNOT detect it.
> > Feel free to double check.
> 
> I tried the 'queued read lock' test cases with DEPT on. I can see DEPT
> detect and report it. But yeah.. it's too verbose now. It's because DEPT
> is not aware of the test environment so it's just working hard to report
> every case.
> 
> To make DEPT work with the selftest better, some works are needed. I
> will work on it later or you please work on it.
> 
> The corresponding report is the following.
> 
[...]
> [    4.593037] context A's detail
> [    4.593351] ---------------------------------------------------
> [    4.593944] context A
> [    4.594182]     [S] lock(&rwlock_A:0)
> [    4.594577]     [W] lock(&rwlock_B:0)
> [    4.594952]     [E] unlock(&rwlock_A:0)
> [    4.595341] 
> [    4.595501] [S] lock(&rwlock_A:0):
> [    4.595848] [<ffffffff814eb244>] queued_read_lock_hardirq_ER_rE+0xf4/0x170
> [    4.596547] stacktrace:
> [    4.596797]       _raw_read_lock+0xcf/0x110
> [    4.597215]       queued_read_lock_hardirq_ER_rE+0xf4/0x170
> [    4.597766]       dotest+0x30/0x7bc
> [    4.598118]       locking_selftest+0x2c6f/0x2ead
> [    4.598602]       start_kernel+0x5aa/0x6d5
> [    4.599017]       secondary_startup_64_no_verify+0xe0/0xeb
> [    4.599562] 
[...]
> [    4.608427] [<ffffffff814eb3b4>] queued_read_lock_hardirq_RE_Er+0xf4/0x170
> [    4.609113] stacktrace:
> [    4.609366]       _raw_write_lock+0xc3/0xd0
> [    4.609788]       queued_read_lock_hardirq_RE_Er+0xf4/0x170
> [    4.610371]       dotest+0x30/0x7bc
> [    4.610730]       locking_selftest+0x2c41/0x2ead
> [    4.611195]       start_kernel+0x5aa/0x6d5
> [    4.611615]       secondary_startup_64_no_verify+0xe0/0xeb
> [    4.612164] 
> [    4.612325] [W] lock(&rwlock_A:0):
> [    4.612671] [<ffffffff814eb3c0>] queued_read_lock_hardirq_RE_Er+0x100/0x170
> [    4.613369] stacktrace:
> [    4.613622]       _raw_read_lock+0xac/0x110
> [    4.614047]       queued_read_lock_hardirq_RE_Er+0x100/0x170
> [    4.614652]       dotest+0x30/0x7bc
> [    4.615007]       locking_selftest+0x2c41/0x2ead
> [    4.615468]       start_kernel+0x5aa/0x6d5
> [    4.615879]       secondary_startup_64_no_verify+0xe0/0xeb
> [    4.616607] 
[...]

> As I told you, DEPT treats a queued lock as a normal type lock, no
> matter whether it's a read lock. That's why it prints just
> 'lock(&rwlock_A:0)' instead of 'read_lock(&rwlock_A:0)'. If needed, I'm
> gonna change the format.
> 
> I checked the selftest code and found, LOCK(B) is transformed like:
> 
> 	LOCK(B) -> WL(B) -> write_lock(&rwlock_B)
> 
> That's why '&rwlock_B' is printed instead of just 'B', JFYI.
> 

Nah, you output shows that you've run at least both function

	queued_read_lock_hardirq_RE_Er()
	queued_read_lock_hardirq_ER_rE()

but if you apply my diff

	https://lore.kernel.org/lkml/Y8oFj9A19cw3enHB@boqun-archlinux/

you should only run

	queued_read_lock_hardirq_RE_Er()

one test.

One of the reason that DEPT "detect" this is that DEPT doesn't reset
between tests, so old dependencies from previous run get carried over.


> Plus, for your information, you should turn on CONFIG_DEPT to use it.
> 

Yes I turn that config on.

Regards,
Boqun

> 	Byungchul
