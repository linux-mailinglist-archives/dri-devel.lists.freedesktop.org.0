Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A97374CF37C
	for <lists+dri-devel@lfdr.de>; Mon,  7 Mar 2022 09:25:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 43DEB10E1A3;
	Mon,  7 Mar 2022 08:24:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-x834.google.com (mail-qt1-x834.google.com
 [IPv6:2607:f8b0:4864:20::834])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C81F310E3D6
 for <dri-devel@lists.freedesktop.org>; Sat,  5 Mar 2022 15:05:25 +0000 (UTC)
Received: by mail-qt1-x834.google.com with SMTP id e2so9790086qte.12
 for <dri-devel@lists.freedesktop.org>; Sat, 05 Mar 2022 07:05:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=joelfernandes.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=geC5xDAay5dBwn3cRxysbEgCyiuAzwcwhdO/zo7/1yQ=;
 b=tixvP1FGnq2wfskq9ETIT5h8JQ7JPBjYQlaZiVU5QEF2ebRlSOd9Hj4GHFYYxuldWh
 AEzNtAg/yji+2YKFPr0a17Al0EC/FApvTFNyo+sILOPE6zyZMSw0ZdguDzVRFqh+N+G9
 axgAo/svRSLgSVS0G7iScy/imA1XKMIHb1NgI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=geC5xDAay5dBwn3cRxysbEgCyiuAzwcwhdO/zo7/1yQ=;
 b=1mt+BNw3go0LEqhWYyMd7tAdxa8HxEYap1wXq5ZbAS1mjzMBAQTG0ZY6ecW4POBiFG
 W0alCaoGa4nugUw7QfKvkJxSH3SQFVolDKh5MUgy3q5z2muxsqZIgjW86FbfB3c5306I
 bXfWu84JEh2Hwgg7AwlrQJq9122fnRrxwoIR5NXXBvS5n/0dXE0yy6XtWyf0v5AjAixe
 +w6nqSH2w8ylHsy0SCpFremrYU7GxD8sgZ681sUg+aqNud66X/zeO1c0xl9uiGd6tA7T
 Q06iz6TjPlrQGfUdg9ZhwgYBQCmO1/UjLSvKO/Rt2iE9JgP+lur0QZC9qKXKILvPgPgo
 rhsw==
X-Gm-Message-State: AOAM531AWKUXyllI0Bl0dIBhmTusnIeb+OJdx5zbJupiMQw3Mdq2ChoO
 fMuF3d7rtkKei1W/jldIqalpMg==
X-Google-Smtp-Source: ABdhPJzC6+sWbvHtOZiDBxeMwB424Rg3yPbjjQ/pVZIkOOUQmsA5JEXntpUeTe+z/0BHUPh5FnkxHA==
X-Received: by 2002:a05:622a:3ca:b0:2df:1cae:397b with SMTP id
 k10-20020a05622a03ca00b002df1cae397bmr3200121qtx.556.1646492724622; 
 Sat, 05 Mar 2022 07:05:24 -0800 (PST)
Received: from localhost (228.221.150.34.bc.googleusercontent.com.
 [34.150.221.228]) by smtp.gmail.com with ESMTPSA id
 t128-20020a37aa86000000b0060ddf2dc3ecsm3859545qke.104.2022.03.05.07.05.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 05 Mar 2022 07:05:24 -0800 (PST)
Date: Sat, 5 Mar 2022 15:05:23 +0000
From: Joel Fernandes <joel@joelfernandes.org>
To: Byungchul Park <byungchul.park@lge.com>
Subject: Re: Report 2 in ext4 and journal based on v5.17-rc1
Message-ID: <YiN8M4FwAeW/UAoN@google.com>
References: <YiAow5gi21zwUT54@mit.edu>
 <1646285013-3934-1-git-send-email-byungchul.park@lge.com>
 <YiDSabde88HJ/aTt@mit.edu> <20220304004237.GB6112@X58A-UD3R>
 <YiLYX0sqmtkTEM5U@mit.edu> <20220305141538.GA31268@X58A-UD3R>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220305141538.GA31268@X58A-UD3R>
X-Mailman-Approved-At: Mon, 07 Mar 2022 08:24:51 +0000
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
 cl@linux.com, will@kernel.org, duyuyang@gmail.com, sashal@kernel.org,
 paolo.valente@linaro.org, paulmck@kernel.org, damien.lemoal@opensource.wdc.com,
 willy@infradead.org, hch@infradead.org, airlied@linux.ie, mingo@redhat.com,
 djwong@kernel.org, vdavydov.dev@gmail.com, rientjes@google.com,
 dennis@kernel.org, linux-ext4@vger.kernel.org, linux-mm@kvack.org,
 ngupta@vflare.org, johannes.berg@intel.com, jack@suse.com,
 dan.j.williams@intel.com, josef@toxicpanda.com, rostedt@goodmis.org,
 linux-block@vger.kernel.org, linux-fsdevel@vger.kernel.org, jglisse@redhat.com,
 viro@zeniv.linux.org.uk, tglx@linutronix.de, mhocko@kernel.org, vbabka@suse.cz,
 melissa.srw@gmail.com, sj@kernel.org, Theodore Ts'o <tytso@mit.edu>,
 rodrigosiqueiramelo@gmail.com, kernel-team@lge.com, gregkh@linuxfoundation.org,
 jlayton@kernel.org, linux-kernel@vger.kernel.org, penberg@kernel.org,
 minchan@kernel.org, hannes@cmpxchg.org, tj@kernel.org,
 akpm@linux-foundation.org, torvalds@linux-foundation.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sat, Mar 05, 2022 at 11:15:38PM +0900, Byungchul Park wrote:
> On Fri, Mar 04, 2022 at 10:26:23PM -0500, Theodore Ts'o wrote:
> > On Fri, Mar 04, 2022 at 09:42:37AM +0900, Byungchul Park wrote:
> > > 
> > > All contexts waiting for any of the events in the circular dependency
> > > chain will be definitely stuck if there is a circular dependency as I
> > > explained. So we need another wakeup source to break the circle. In
> > > ext4 code, you might have the wakeup source for breaking the circle.
> > > 
> > > What I agreed with is:
> > > 
> > >    The case that 1) the circular dependency is unevitable 2) there are
> > >    another wakeup source for breadking the circle and 3) the duration
> > >    in sleep is short enough, should be acceptable.
> > > 
> > > Sounds good?
> > 
> > These dependencies are part of every single ext4 metadata update,
> > and if there were any unnecessary sleeps, this would be a major
> > performance gap, and this is a very well studied part of ext4.
> > 
> > There are some places where we sleep, sure.  In some case
> > start_this_handle() needs to wait for a commit to complete, and the
> > commit thread might need to sleep for I/O to complete.  But the moment
> > the thing that we're waiting for is complete, we wake up all of the
> > processes on the wait queue.  But in the case where we wait for I/O
> > complete, that wakeupis coming from the device driver, when it
> > receives the the I/O completion interrupt from the hard drive.  Is
> > that considered an "external source"?  Maybe DEPT doesn't recognize
> > that this is certain to happen just as day follows the night?  (Well,
> > maybe the I/O completion interrupt might not happen if the disk drive
> > bursts into flames --- but then, you've got bigger problems. :-)
> 
> Almost all you've been blaming at Dept are totally non-sense. Based on
> what you're saying, I'm conviced that you don't understand how Dept
> works even 1%. You don't even try to understand it before blame.
> 
> You don't have to understand and support it. But I can't response to you
> if you keep saying silly things that way.

Byungchul, other than ext4 have there been any DEPT reports that other
subsystem maintainers' agree were valid usecases?

Regarding false-positives, just to note lockdep is not without its share of
false-positives. Just that (as you know), the signal-to-noise ratio should be
high for it to be useful. I've put up with lockdep's false positives just
because it occasionally saves me from catastrophe.

> > In any case, if DEPT is going to report these "circular dependencies
> > as bugs that MUST be fixed", it's going to be pure noise and I will
> > ignore all DEPT reports, and will push back on having Lockdep replaced
> 
> Dept is going to be improved so that what you are concerning about won't
> be reported.

Yeah I am looking forward to learning more about it however I was wondering
about the following: lockdep can already be used for modeling "resource
acquire/release" and "resource wait" semantics that are unrelated to locks,
like we do in mm reclaim. I am wondering why we cannot just use those existing
lockdep mechanisms for the wait/wake usecases (Assuming that we can agree
that circular dependencies on related to wait/wake is a bad thing. Or perhaps
there's a reason why Peter Zijlstra did not use lockdep for wait/wake
dependencies (such as multiple wake sources) considering he wrote a lot of
that code.

Keep kicking ass brother, you're doing great.

Thanks,

     Joel

