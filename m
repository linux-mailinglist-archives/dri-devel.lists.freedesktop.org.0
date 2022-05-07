Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 41EE851E526
	for <lists+dri-devel@lfdr.de>; Sat,  7 May 2022 09:21:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F1FD01128B5;
	Sat,  7 May 2022 07:21:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x533.google.com (mail-pg1-x533.google.com
 [IPv6:2607:f8b0:4864:20::533])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 86FBB1128B3
 for <dri-devel@lists.freedesktop.org>; Sat,  7 May 2022 07:21:11 +0000 (UTC)
Received: by mail-pg1-x533.google.com with SMTP id g184so5369194pgc.1
 for <dri-devel@lists.freedesktop.org>; Sat, 07 May 2022 00:21:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=rNQz935Rwo42XgI1l8Va40p/MEeV4p6HEVCQ52VDnf4=;
 b=P42+8ex/HBpVSeUhi79CcZsiB1rEwx7SjPsWOzHKtYtuDRjT+7g81hnQb9Bg+3nrwT
 De8dQlU9BcgwoEV9wdnbeE3D82XEoM9rdMizKhVMhmThyQPs7pG6yQdXOZHUILyVEB8B
 MZOMaM5Nag+I9ca+mSFwEkbaCfc+mVQpZN8W0UFxaI3P1zlBAo3OLxIQcU7yZiXAhU1h
 Jiaawf+dpE+KAoqOYTid6KwfvlqOs8L3T25b9+uILvT8+qC03iIX5R5P7pBVqRxRlV1/
 2L77a/eKzFW5m+4Q8qaNXGrcogU5pQhNHMvwFRhhaVI7cMNifBapsGydQXtopBhbDEvv
 tGKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=rNQz935Rwo42XgI1l8Va40p/MEeV4p6HEVCQ52VDnf4=;
 b=opdz+JtLwrHUL47cLdYSqu60GNfzOoLnXeDPIDF66emFqfEBPK09FKWY5eMAWRpdbD
 zfSDkvF2Sz1FmppHkR7KIAOIZ2cM4/DZ7x2HikMFEdpx72o4ZsEtWwmBJaI9urOoZD2N
 Ar7d+Ey+JB4KskMsUnlTECwaF5zkjxhADcrXYtKRYp8rXi4ygPTVglpqoj0OOK5qNJjW
 S3RUpwKRiFF5r8hhEZAyQqFQvSNMopAB1A03VdWDJwSqsia/OodcRocQXzF6L+MDoZk2
 GYrbuW+OQ8v8F7DOaLVvbMzDYn9XfPqBazC7PryhT5D/a007p2VxlIde95kc4HUqMjlj
 kr6w==
X-Gm-Message-State: AOAM532vgubz+Ypf/8v0+/0ggEFjH1gRquzetSjO526KGHgpTc6zDJkk
 FFqwPjZihQ62LSwfPxjheqU=
X-Google-Smtp-Source: ABdhPJy8wngBA9nCSkNphuykt/x5APcFu3ZWQNW14hKz2s7Rb0bLuKnbzsVQiG9xcQts5UZOdrCb6w==
X-Received: by 2002:a65:6093:0:b0:373:9c75:19ec with SMTP id
 t19-20020a656093000000b003739c7519ecmr5972095pgu.539.1651908071104; 
 Sat, 07 May 2022 00:21:11 -0700 (PDT)
Received: from hyeyoo ([114.29.24.243]) by smtp.gmail.com with ESMTPSA id
 1-20020a170902c20100b0015ec44d25dasm2956759pll.235.2022.05.07.00.20.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 07 May 2022 00:21:10 -0700 (PDT)
Date: Sat, 7 May 2022 16:20:50 +0900
From: Hyeonggon Yoo <42.hyeyoo@gmail.com>
To: Byungchul Park <byungchul.park@lge.com>
Subject: Re: [PATCH RFC v6 00/21] DEPT(Dependency Tracker)
Message-ID: <YnYd0hd+yTvVQxm5@hyeyoo>
References: <CAHk-=whnPePcffsNQM+YSHMGttLXvpf8LbBQ8P7HEdqFXaV7Lg@mail.gmail.com>
 <1651795895-8641-1-git-send-email-byungchul.park@lge.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1651795895-8641-1-git-send-email-byungchul.park@lge.com>
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
 sj@kernel.org, tytso@mit.edu, rodrigosiqueiramelo@gmail.com,
 kernel-team@lge.com, gregkh@linuxfoundation.org, jlayton@kernel.org,
 linux-kernel@vger.kernel.org, penberg@kernel.org, minchan@kernel.org,
 hannes@cmpxchg.org, tj@kernel.org, akpm@linux-foundation.org,
 torvalds@linux-foundation.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, May 06, 2022 at 09:11:35AM +0900, Byungchul Park wrote:
> Linus wrote:
> >
> > On Wed, May 4, 2022 at 1:19 AM Byungchul Park <byungchul.park@lge.com> wrote:
> > >
> > > Hi Linus and folks,
> > >
> > > I've been developing a tool for detecting deadlock possibilities by
> > > tracking wait/event rather than lock(?) acquisition order to try to
> > > cover all synchonization machanisms.
> > 
> > So what is the actual status of reports these days?
> > 
> > Last time I looked at some reports, it gave a lot of false positives
> > due to mis-understanding prepare_to_sleep().
> 
> Yes, it was. I handled the case in the following way:
> 
> 1. Stage the wait at prepare_to_sleep(), which might be used at commit.
>    Which has yet to be an actual wait that Dept considers.
> 2. If the condition for sleep is true, the wait will be committed at
>    __schedule(). The wait becomes an actual one that Dept considers.
> 3. If the condition is false and the task gets back to TASK_RUNNING,
>    clean(=reset) the staged wait.
> 
> That way, Dept only works with what actually hits to __schedule() for
> the waits through sleep.
> 
> > For this all to make sense, it would need to not have false positives
> > (or at least a very small number of them together with a way to sanely
> 
> Yes. I agree with you. I got rid of them that way I described above.
>

IMHO DEPT should not report what lockdep allows (Not talking about
wait events). I mean lockdep allows some kind of nested locks but
DEPT reports them.

When I was collecting reports from DEPT on varous configurations,
Most of them was report of down_write_nested(), which is allowed in
lockdep.

DEPT should not report at least what we know it's not a real deadlock.
Otherwise there will be reports that is never fixed, which is quite
unpleasant and reporters cannot examine all of them if it's real deadlock
or not.

> > get rid of them), and also have a track record of finding things that
> > lockdep doesn't.
> 
> I have some reports that wait_for_completion or waitqueue is involved.
> It's worth noting those are not tracked by Lockdep. I'm checking if
> those are true positive or not. I will share those reports once I get
> more convinced for that.
> 
> > Maybe such reports have been sent out with the current situation, and
> > I haven't seen them.
> 
> Dept reports usually have been sent to me privately, not in LKML. As I
> told you, I'm planning to share them.
> 
> 	Byungchul
> 
> > 
> >                  Linus
> > 

-- 
Thanks,
Hyeonggon
