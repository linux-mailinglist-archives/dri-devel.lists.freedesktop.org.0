Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B33C966E5D8
	for <lists+dri-devel@lfdr.de>; Tue, 17 Jan 2023 19:19:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E677210E5A7;
	Tue, 17 Jan 2023 18:18:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-x830.google.com (mail-qt1-x830.google.com
 [IPv6:2607:f8b0:4864:20::830])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DA6AD10E5A7
 for <dri-devel@lists.freedesktop.org>; Tue, 17 Jan 2023 18:18:56 +0000 (UTC)
Received: by mail-qt1-x830.google.com with SMTP id jr10so20609113qtb.7
 for <dri-devel@lists.freedesktop.org>; Tue, 17 Jan 2023 10:18:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:feedback-id:from:to:cc:subject:date
 :message-id:reply-to;
 bh=b2US1+cWQFyCqkm5gKb2Imr+dyizxQQ6oWxz42m5c2U=;
 b=QOQZ9L6N6v89yP61QhODEIyBSxsPTBrfKXtHZgwBntOCl5ljk7i4UY0j9I1YrcUxWc
 ub2W9V1gWuQMcIwfl0IJJbHn1UFH1WToeORRalBsyw1US3hfGRcdzofEgLfuW92aVI+5
 PwhM+jtdgnlG4zrB2uHd/qblDBP59zJAwi1i4Amb8XssPk7p0eUTutXWGl/G6u2TjIo6
 baTo1PEGYQNLRS/k3y5NFaea9lAc9EJOtVg22tc04ALD7s2fItXi5fUFMvdqQRPYj4gL
 jrseFJqAAtFnNlDPqUevWkUie1GRsm1SONzlKxD3LY+STVP5fKzHr11q1El/ogronKmz
 +G/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:feedback-id:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=b2US1+cWQFyCqkm5gKb2Imr+dyizxQQ6oWxz42m5c2U=;
 b=KPNCrvoTKrX0Q1dn16KMOKBT5V7LQS1KSh7dC4/nYKLRV9igFwZXgMkxHgpR/jCzz+
 02k4IMoo2YPaYSlzIm9QhIWsf8THTgOURarVSf4ckUtybM9E83LzBpstHMwEr74850+U
 gQ3c0hMIHbsDcV8mapeINI0w9sR7xgxjiamwOdeJAUVyJNnrZa7+iZdt//nNobe/PVuE
 N8G1V3OQRNozuTQihpxv3jORkHeaHefHAQO2fZenQrTVhmeseeWVdG9wd4HweVzB6ON5
 Y0ELn6/K4jUPG9GJos02AmZPc8dnxUYkOAY0vwebjGac14k8d33NfOfS6rfxCBPMC48r
 m2ug==
X-Gm-Message-State: AFqh2kqXTbwhzNU6va/UEBW6v+KHSK6qQ8vEsCh7XVAsuRFWtjtU4dQB
 Dos4T1+RNJzl8Ux4twM/HUY=
X-Google-Smtp-Source: AMrXdXsbsnjKF/gGVBYuTPp5lByzyJYc2fCAK1Am20LQmYXUk2wnvgak1qKs0D/zx4CEZtgFs/udAg==
X-Received: by 2002:a05:622a:6094:b0:3a5:fd39:ff90 with SMTP id
 hf20-20020a05622a609400b003a5fd39ff90mr40484278qtb.3.1673979535972; 
 Tue, 17 Jan 2023 10:18:55 -0800 (PST)
Received: from auth2-smtp.messagingengine.com (auth2-smtp.messagingengine.com.
 [66.111.4.228]) by smtp.gmail.com with ESMTPSA id
 bs25-20020ac86f19000000b0035d432f5ba3sm2425347qtb.17.2023.01.17.10.18.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 17 Jan 2023 10:18:55 -0800 (PST)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
 by mailauth.nyi.internal (Postfix) with ESMTP id 175C227C0054;
 Tue, 17 Jan 2023 13:18:53 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute2.internal (MEProxy); Tue, 17 Jan 2023 13:18:54 -0500
X-ME-Sender: <xms:i-bGY-9E-mdJVWX4CCVeei-14Vfb5RM2bcefYAEY9jwujyAQLuat9A>
 <xme:i-bGY-svyDVjSENnZ4SYmye9MHEwAc_xdmBCugrRgiIhupK8t0XJHANZqE2XS0HWX
 FpMruCHrdoK16v3nw>
X-ME-Received: <xmr:i-bGY0DhTa8VmWDhetI1q1U1WNpJSFZDda6XC60Ija7SMvOXij7igrtiPxQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedruddtiedgudduudcutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
 necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
 enucfjughrpeffhffvvefukfhfgggtuggjsehttdertddttddvnecuhfhrohhmpeeuohhq
 uhhnucfhvghnghcuoegsohhquhhnrdhfvghnghesghhmrghilhdrtghomheqnecuggftrf
 grthhtvghrnhephfetvdfgtdeukedvkeeiteeiteejieehvdetheduudejvdektdekfeeg
 vddvhedtnecuffhomhgrihhnpehkvghrnhgvlhdrohhrghenucevlhhushhtvghrufhiii
 gvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpegsohhquhhnodhmvghsmhhtphgruhht
 hhhpvghrshhonhgrlhhithihqdeiledvgeehtdeigedqudejjeekheehhedvqdgsohhquh
 hnrdhfvghngheppehgmhgrihhlrdgtohhmsehfihigmhgvrdhnrghmvg
X-ME-Proxy: <xmx:i-bGY2fUawivGHAWm6LLeaxzKnn5qemkPlKYx612rxwWBBv2e4x76w>
 <xmx:i-bGYzO-9dNabAYWURztzdQoTUyDu19pqteWeMRsf0ysGOocee_9Lw>
 <xmx:i-bGYwlqbhoDstgPUi4Gv8RjGKqizzlTMulosaLuOcD6kHFgVW66eA>
 <xmx:jebGY20d10aTWJlV5fAGRmnugZO0WqcRtaEBaGcyqdUXbdjlcOmh6i2i0g8>
Feedback-ID: iad51458e:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 17 Jan 2023 13:18:51 -0500 (EST)
Date: Tue, 17 Jan 2023 10:18:33 -0800
From: Boqun Feng <boqun.feng@gmail.com>
To: Linus Torvalds <torvalds@linux-foundation.org>
Subject: Re: [PATCH RFC v7 00/23] DEPT(Dependency Tracker)
Message-ID: <Y8bmeffIQ3iXU3Ux@boqun-archlinux>
References: <1673235231-30302-1-git-send-email-byungchul.park@lge.com>
 <CAHk-=whpkWbdeZE1zask8YPzVYevJU2xOXqOposBujxZsa2-tQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAHk-=whpkWbdeZE1zask8YPzVYevJU2xOXqOposBujxZsa2-tQ@mail.gmail.com>
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
 Byungchul Park <byungchul.park@lge.com>, linux-fsdevel@vger.kernel.org,
 jglisse@redhat.com, viro@zeniv.linux.org.uk, Waiman Long <longman@redhat.com>,
 tglx@linutronix.de, vbabka@suse.cz, melissa.srw@gmail.com,
 linux-block@vger.kernel.org, sj@kernel.org, tytso@mit.edu,
 rodrigosiqueiramelo@gmail.com, kernel-team@lge.com, gregkh@linuxfoundation.org,
 jlayton@kernel.org, linux-kernel@vger.kernel.org, penberg@kernel.org,
 minchan@kernel.org, hannes@cmpxchg.org, tj@kernel.org,
 akpm@linux-foundation.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

[Cc Waiman]

On Mon, Jan 16, 2023 at 10:00:52AM -0800, Linus Torvalds wrote:
> [ Back from travel, so trying to make sense of this series.. ]
> 
> On Sun, Jan 8, 2023 at 7:33 PM Byungchul Park <byungchul.park@lge.com> wrote:
> >
> > I've been developing a tool for detecting deadlock possibilities by
> > tracking wait/event rather than lock(?) acquisition order to try to
> > cover all synchonization machanisms. It's done on v6.2-rc2.
> 
> Ugh. I hate how this adds random patterns like
> 
>         if (timeout == MAX_SCHEDULE_TIMEOUT)
>                 sdt_might_sleep_strong(NULL);
>         else
>                 sdt_might_sleep_strong_timeout(NULL);
>    ...
>         sdt_might_sleep_finish();
> 
> to various places, it seems so very odd and unmaintainable.
> 
> I also recall this giving a fair amount of false positives, are they all fixed?
> 

From the following part in the cover letter, I guess the answer is no?

	...
        6. Multiple reports are allowed.
        7. Deduplication control on multiple reports.
        8. Withstand false positives thanks to 6.
	...

seems to me that the logic is since DEPT allows multiple reports so that
false positives are fitlerable by users?

> Anyway, I'd really like the lockdep people to comment and be involved.

I never get Cced, so I'm unware of this for a long time...

A few comments after a quick look:

*	Looks like the DEPT dependency graph doesn't handle the
	fair/unfair readers as lockdep current does. Which bring the
	next question.

*	Can DEPT pass all the selftests of lockdep in
	lib/locking-selftests.c?

*	Instead of introducing a brand new detector/dependency tracker,
	could we first improve the lockdep's dependency tracker? I think
	Byungchul also agrees that DEPT and lockdep should share the
	same dependency tracker and the benefit of improving the
	existing one is that we can always use the self test to catch
	any regression. Thoughts?

Actually the above sugguest is just to revert revert cross-release
without exposing any annotation, which I think is more practical to
review and test.

I'd sugguest we 1) first improve the lockdep dependency tracker with
wait/event in mind and then 2) introduce wait related annotation so that
users can use, and then 3) look for practical ways to resolve false
positives/multi reports with the help of users, if all goes well,
4) make it all operation annotated.

Thoughts?

Regards,
Boqun

> We did have a fairly recent case of "lockdep doesn't track page lock
> dependencies because it fundamentally cannot" issue, so DEPT might fix
> those kinds of missing dependency analysis. See
> 
>     https://lore.kernel.org/lkml/00000000000060d41f05f139aa44@google.com/
> 
> for some context to that one, but at teh same time I would *really*
> want the lockdep people more involved and acking this work.
> 
> Maybe I missed the email where you reported on things DEPT has found
> (and on the lack of false positives)?
> 
>                Linus
> 
