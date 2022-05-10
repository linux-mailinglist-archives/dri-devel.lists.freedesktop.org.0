Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C75F521372
	for <lists+dri-devel@lfdr.de>; Tue, 10 May 2022 13:18:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C117F10E7A2;
	Tue, 10 May 2022 11:18:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x62c.google.com (mail-pl1-x62c.google.com
 [IPv6:2607:f8b0:4864:20::62c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1EECB10E7A2
 for <dri-devel@lists.freedesktop.org>; Tue, 10 May 2022 11:18:29 +0000 (UTC)
Received: by mail-pl1-x62c.google.com with SMTP id q4so13564434plr.11
 for <dri-devel@lists.freedesktop.org>; Tue, 10 May 2022 04:18:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=NAG18UO/tcE+S05MnOeuxuMLEaWaJn7EzeFBAyc6xEI=;
 b=iKT7QYiaUQ8dZ1P3vmShQW0ThVsrrDG5/CHhH/XmT3yWc177RjBTpxPmI7ZnEwzEhE
 quwHAvT9et0uXnC+VeaF/RTEzIk3VWuucB3BscSJARj6R1SHVuDtx8nmpcBeubrE81yX
 7zSenZfp0IdwKCZMvLQgd/TsfOYG5EmlQHpZz/lHMA4prCoXa1Cj7XPxmOukbMNMYII6
 24jlbaFxEDzG2z4ln1f5RWkc2QRFMPTfIL92VcBsJS13KAS4Zl99c1tWdQJIncUqnMFS
 D6PGzf33NyyF8CklTafXFDAQEAloy0EPGB7csfjbZRvjrY+eNMV2ZsbFAD8+53kjZzWr
 Gpeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=NAG18UO/tcE+S05MnOeuxuMLEaWaJn7EzeFBAyc6xEI=;
 b=Nc9wBNUsGNqMAMISjZP2S6Nnc1TlQHDfDxMDV48hZe4qMlyyXsPeZgYBBNQmPZg8R6
 +axEI6B7NCUB+X0WOHc1wr6ZmMafKrnmxmnXpDl5ifKAc8nJAjHCObnaN7jwtY816K0t
 KJWLy7goMpzO7Ok5BQy4k2gVMV6JkeQdUNRZGHP1Etf1TgiFJfVsiPVHKdSoST19hSZO
 ubtMyMJodW7YucFHalPIkX7nnetG08k0+9jAYOCz4k8+jlXfsvcH9sEerm3Qms2k37H+
 Nz2IrJF3/rN2ptfRyOQM3R3ppQI6SzlrGBDfUvqWorv1Hb1E5DwHhywe+1CiyyTHkGtL
 H9dw==
X-Gm-Message-State: AOAM531yKB1QouXPB4FIZSvWdVl2ottJB8d4cN+OZl1ybeYbCavq1mo/
 8jVoaUN1OKNVcb50+sDtWEccpP7dHqjtHA==
X-Google-Smtp-Source: ABdhPJyar+0k/7nbZhwkZK7IxG/e7t/vnNzB2lZg7PhgLGknkbHzom5aqgDBwikrS+PFFHTrbWguMg==
X-Received: by 2002:a17:902:f68a:b0:15e:b12d:f4a1 with SMTP id
 l10-20020a170902f68a00b0015eb12df4a1mr20067951plg.166.1652181508606; 
 Tue, 10 May 2022 04:18:28 -0700 (PDT)
Received: from hyeyoo ([114.29.24.243]) by smtp.gmail.com with ESMTPSA id
 h70-20020a638349000000b003c68eddba62sm4542314pge.89.2022.05.10.04.18.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 10 May 2022 04:18:27 -0700 (PDT)
Date: Tue, 10 May 2022 20:18:12 +0900
From: Hyeonggon Yoo <42.hyeyoo@gmail.com>
To: Byungchul Park <byungchul.park@lge.com>
Subject: Re: [PATCH RFC v6 00/21] DEPT(Dependency Tracker)
Message-ID: <YnpJ9Mtf+pjx4JYm@hyeyoo>
References: <CAHk-=whnPePcffsNQM+YSHMGttLXvpf8LbBQ8P7HEdqFXaV7Lg@mail.gmail.com>
 <1651795895-8641-1-git-send-email-byungchul.park@lge.com>
 <YnYd0hd+yTvVQxm5@hyeyoo> <20220509001637.GA6047@X58A-UD3R>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220509001637.GA6047@X58A-UD3R>
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

On Mon, May 09, 2022 at 09:16:37AM +0900, Byungchul Park wrote:
> On Sat, May 07, 2022 at 04:20:50PM +0900, Hyeonggon Yoo wrote:
> > On Fri, May 06, 2022 at 09:11:35AM +0900, Byungchul Park wrote:
> > > Linus wrote:
> > > >
> > > > On Wed, May 4, 2022 at 1:19 AM Byungchul Park <byungchul.park@lge.com> wrote:
> > > > >
> > > > > Hi Linus and folks,
> > > > >
> > > > > I've been developing a tool for detecting deadlock possibilities by
> > > > > tracking wait/event rather than lock(?) acquisition order to try to
> > > > > cover all synchonization machanisms.
> > > > 
> > > > So what is the actual status of reports these days?
> > > > 
> > > > Last time I looked at some reports, it gave a lot of false positives
> > > > due to mis-understanding prepare_to_sleep().
> > > 
> > > Yes, it was. I handled the case in the following way:
> > > 
> > > 1. Stage the wait at prepare_to_sleep(), which might be used at commit.
> > >    Which has yet to be an actual wait that Dept considers.
> > > 2. If the condition for sleep is true, the wait will be committed at
> > >    __schedule(). The wait becomes an actual one that Dept considers.
> > > 3. If the condition is false and the task gets back to TASK_RUNNING,
> > >    clean(=reset) the staged wait.
> > > 
> > > That way, Dept only works with what actually hits to __schedule() for
> > > the waits through sleep.
> > > 
> > > > For this all to make sense, it would need to not have false positives
> > > > (or at least a very small number of them together with a way to sanely
> > > 
> > > Yes. I agree with you. I got rid of them that way I described above.
> > >
> > 
> > IMHO DEPT should not report what lockdep allows (Not talking about
> 
> No.
> 
> > wait events). I mean lockdep allows some kind of nested locks but
> > DEPT reports them.
> 
> You have already asked exactly same question in another thread of
> LKML. That time I answered to it but let me explain it again.
> 
> ---
> 
> CASE 1.
> 
>    lock L with depth n
>    lock_nested L' with depth n + 1
>    ...
>    unlock L'
>    unlock L
> 
> This case is allowed by Lockdep.
> This case is allowed by DEPT cuz it's not a deadlock.
> 
> CASE 2.
> 
>    lock L with depth n
>    lock A
>    lock_nested L' with depth n + 1
>    ...
>    unlock L'
>    unlock A
>    unlock L
> 
> This case is allowed by Lockdep.
> This case is *NOT* allowed by DEPT cuz it's a *DEADLOCK*.
>

Yeah, in previous threads we discussed this [1]

And the case was:
	scan_mutex -> object_lock -> kmemleak_lock -> object_lock
And dept reported:
	object_lock -> kmemleak_lock, kmemleak_lock -> object_lock as
	deadlock.

But IIUC - What DEPT reported happens only under scan_mutex and
It is not simple just not to take them because the object can be removed from the
list and freed while scanning via kmemleak_free() without kmemleak_lock and object_lock.

Just I'm still not sure that someone will fix the warning in the future - even if the
locking rule is not good - if it will not cause a real deadlock.

> ---
> 
> The following scenario would explain why CASE 2 is problematic.
> 
>    THREAD X			THREAD Y
> 
>    lock L with depth n
> 				lock L' with depth n
>    lock A
> 				lock A
>    lock_nested L' with depth n + 1
> 				lock_nested L'' with depth n + 1
>    ...				...
>    unlock L'			unlock L''
>    unlock A			unlock A
>    unlock L			unlock L'
> 
> Yes. I need to check if the report you shared with me is a true one, but
> it's not because DEPT doesn't work with *_nested() APIs.
>

Sorry, It was not right just to say DEPT doesn't work with _nested() APIs.

> 	Byungchul

[1] https://lore.kernel.org/lkml/20220304002809.GA6112@X58A-UD3R/

-- 
Thanks,
Hyeonggon
