Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D02CBADAD9E
	for <lists+dri-devel@lfdr.de>; Mon, 16 Jun 2025 12:43:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 997C210E279;
	Mon, 16 Jun 2025 10:42:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; secure) header.d=ffwll.ch header.i=@ffwll.ch header.b="aqAGRWh1";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com
 [209.85.221.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B1B4F10E279
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Jun 2025 10:42:57 +0000 (UTC)
Received: by mail-wr1-f44.google.com with SMTP id
 ffacd0b85a97d-3a365a6804eso3060807f8f.3
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Jun 2025 03:42:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google; t=1750070576; x=1750675376; darn=lists.freedesktop.org; 
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:from:to
 :cc:subject:date:message-id:reply-to;
 bh=0dmHiX7ThKhvjRrZoVWGMu+tBTpC78WnUTk67XRLtOE=;
 b=aqAGRWh1LFi+3Ukc8u7scABw0b01f8GlCnoQCoLIBAF2Qi7F6hOV0RGAuW1QafsQOC
 7jRpe1D4eddkrDNX/jL0+0ik9ppDBiQJX58XUbCJZxQY/0XQZMqwwMdToLBopct8wdEM
 +TQl8wA8KSLU/beIwXAO1oo/6RV3SqbXPmGbE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1750070576; x=1750675376;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=0dmHiX7ThKhvjRrZoVWGMu+tBTpC78WnUTk67XRLtOE=;
 b=hzqsUMG6Gzczj0OOfd34vOy2drZsZ0fRB8kPFna6WnPdr6blPqxhKZFsHKNwRmZMoL
 8mPw3H7ORdb9QGW+S9wzYsxCi2YWywF3fOCQTme8LYcS0AhMYJE051jeRcZOFszn/2pP
 sYsf0Ks8yYiTzgV0QA7N1QcKKoTLmO7w04t1UORmjJa+IOIIy7QyZNTREI+JLY6nD6M/
 7J40PPYWL3vh05GnrVfFwQbPVnQ8UlVgUBJtxDh7zX3VIcP18LUhmZo3wPa11epubimd
 u0v7yFA0d+gX1ZLrCRRK2AfyTKAtjTuGjjHZ8/1f8lzn7NaMlPh96TH9AMZX9GF+7AwL
 WpMA==
X-Forwarded-Encrypted: i=1;
 AJvYcCU5tUupahO30/MgU9om3qlSO8MhlfEwA8lFMG87Of7YdUN/YnrbStwYrsbfTn9UmAum36b8DS99P1k=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxcFVjr0jlbAGWRZJjLZj3xHxTJHRnu7WGZwOy11kL/gZkA9LjB
 RFqnrP3RH6Vp6uTlXjBUIQ5HnuPucBtwhBWjV+EfDyUwGoVrV8udFKilZvGADyLCV1AFQmxXQpw
 eWtyJ
X-Gm-Gg: ASbGncvhyb+cWKYBXycndI09VE5AYdIysrF/2rjzNI65RtBovkISFarjNMwWp5mBL/b
 HNgz3QlhZrjBSXSmqB3FUa6S9NDTpZHOSJWxriXcBoUTx6Km4AFwQ+w1y2wPHcrQ6azvvTLLd/T
 EHefuqeVtV1xbFm+yLX5wezIiGKmkMScKTlwjdkGsTLCx8JGCXvPzUPDIjA9x2ctO06dICZZmT4
 qA8TuZI2tWP+djttPvNz+OQuhKJmuXT93xHP1Qe0/yGquASdUEvrlp30jkWDEDrv85MfmZej8AT
 gNpIhQwpBV6/Ne53jWTs2ZwxR+YOXagUUrV1yCKV3deRABGSFXoVa+z+1tR6WUEQ4BolwYoNyA=
 =
X-Google-Smtp-Source: AGHT+IHJtNv0fBZGj9f47JNFKLS9ZbGL8K8h5+IcNT/hk9ymyMUa1spjhB7nOYUXmbf61C76WcbfCw==
X-Received: by 2002:a05:6000:2310:b0:3a5:52b2:fa65 with SMTP id
 ffacd0b85a97d-3a57236780emr7834822f8f.5.1750070576069; 
 Mon, 16 Jun 2025 03:42:56 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:5485:d4b2:c087:b497])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3a568a54423sm10473100f8f.20.2025.06.16.03.42.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 16 Jun 2025 03:42:55 -0700 (PDT)
Date: Mon, 16 Jun 2025 12:42:53 +0200
From: Simona Vetter <simona.vetter@ffwll.ch>
To: Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>
Cc: Matthew Brost <matthew.brost@intel.com>, dakr@kernel.org,
 pstanner@redhat.com, simona.vetter@ffwll.ch,
 dri-devel@lists.freedesktop.org
Subject: Re: DRM scheduler issue with spsc_queue
Message-ID: <aE_1LTJoszaYK49i@phenom.ffwll.local>
References: <aExZdkcnBVvX1DCa@lstrano-desk.jf.intel.com>
 <0b0b8367-abd4-4982-aeec-08f8b95a286a@amd.com>
 <aEx3zmQ4T1n5wdKO@lstrano-desk.jf.intel.com>
 <7636678c-d5fe-439f-a86a-4f038e7cf692@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <7636678c-d5fe-439f-a86a-4f038e7cf692@amd.com>
X-Operating-System: Linux phenom 6.12.30-amd64 
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Jun 16, 2025 at 09:24:38AM +0200, Christian König wrote:
> On 6/13/25 21:11, Matthew Brost wrote:
> > On Fri, Jun 13, 2025 at 07:26:22PM +0200, Christian König wrote:
> >> On 6/13/25 19:01, Matthew Brost wrote:
> >>> All,
> >>>
> >>> After about six hours of debugging, I found an issue in a fairly
> >>> aggressive test case involving the DRM scheduler function
> >>> drm_sched_entity_push_job. The problem is that spsc_queue_push does not
> >>> correctly return first on a job push, causing the queue to fail to run
> >>> even though it is ready.
> >>>
> >>> I know this sounds a bit insane, but I assure you it’s happening and is
> >>> quite reproducible. I'm working off a pull of drm-tip from a few days
> >>> ago + some local change to Xe's memory management, with a Kconfig that
> >>> has no debug options enabled. I’m not sure if there’s a bug somewhere in
> >>> the kernel related to barriers or atomics in the recent drm-tip. That
> >>> seems unlikely—but just as unlikely is that this bug has existed for a
> >>> while without being triggered until now.
> >>>
> >>> I've verified the hang in several ways: using printks, adding a debugfs
> >>> entry to manually kick the DRM scheduler queue when it's stuck (which
> >>> gets it unstuck), and replacing the SPSC queue with one guarded by a
> >>> spinlock (which completely fixes the issue).
> >>>
> >>> That last point raises a big question: why are we using a convoluted
> >>> lockless algorithm here instead of a simple spinlock? This isn't a
> >>> critical path—and even if it were, how much performance benefit are we
> >>> actually getting from the lockless design? Probably very little.
> >>>
> >>> Any objections to me rewriting this around a spinlock-based design? My
> >>> head hurts from chasing this bug, and I feel like this is the best way
> >>> forward rather than wasting more time here.
> >>
> >> Well the spsc queue is some standard code I used in previous projects and we have never experienced any issue with that.
> >>
> > 
> > I can quite clearly see this not working on my test setup. I can (kinda)
> > explain it a bit more.
> > 
> > Look at this code:
> > 
> >  65 static inline bool spsc_queue_push(struct spsc_queue *queue, struct spsc_node *node)
> >  66 {
> >  67         struct spsc_node **tail;
> >  68
> >  69         node->next = NULL;
> >  70
> >  71         preempt_disable();
> >  72
> >  73         tail = (struct spsc_node **)atomic_long_xchg(&queue->tail, (long)&node->next);
> >  74         WRITE_ONCE(*tail, node);
> >  75         atomic_inc(&queue->job_count);
> >  76
> >  77         /*
> >  78          * In case of first element verify new node will be visible to the consumer
> >  79          * thread when we ping the kernel thread that there is new work to do.
> >  80          */
> >  81         smp_wmb();
> >  82
> >  83         preempt_enable();
> >  84
> >  85         return tail == &queue->head;
> >  86 }
> > 
> > Between the execution of atomic_long_xchg and atomic_inc, the submission
> > worker could dequeue the previous last job, reducing job_count to zero,
> > run the job, observe that job_count == 0 (drm_sched_entity_is_ready),
> > and then go to sleep. This function has swapped for the previous tail,
> > so it returns false (i.e., not the first, and does not requeue the
> > submit worker at caller).
> > 
> > The race window here is tiny, and I would think preempt_disable would
> > make it impossible (or preempt_disable is broken drm-tip a few days
> > ago), so I’m still a bit perplexed by it. But again, I assure you this
> > is, in fact, happening on my test setup. My test case is an SVM one,
> > which involves all sorts of CPU/GPU faults, migrations, etc. Not sure if
> > that contributes. I can show this race occurring in dmesg if you need
> > proof.
> > 
> > The change below fixes the problem. I'm going to post it to unblock
> > myself.
> > 
> > diff --git a/include/drm/spsc_queue.h b/include/drm/spsc_queue.h
> > index 125f096c88cb..ee9df8cc67b7 100644
> > --- a/include/drm/spsc_queue.h
> > +++ b/include/drm/spsc_queue.h
> > @@ -70,9 +70,11 @@ static inline bool spsc_queue_push(struct spsc_queue
> > *queue, struct spsc_node *n
> > 
> >         preempt_disable();
> > 
> > +       atomic_inc(&queue->job_count);
> > +       smp_mb__after_atomic();
> > +
> >         tail = (struct spsc_node **)atomic_long_xchg(&queue->tail,
> > (long)&node->next);
> >         WRITE_ONCE(*tail, node);
> > -       atomic_inc(&queue->job_count);
> > 
> >         /*
> >          * In case of first element verify new node will be visible to
> >          * the consumer
> 
> I need to double check the code path once more, but that we got this wrong while could certainly be.
> 
> The code originated in userspace and atomics are also memory barriers
> there. Sima had to point out that we have to manually add smp_mb()s here
> to make it work. 

Yeah last time I looked (which I think was years ago) spsc lacked the
needed barriers, and lacked even more the comments to explain how the
barriers match up (since some are there as implied ones). I kinda decided
that it's above my skill level to really dig into the entire thing and do
a formal proof and all that, which is imo what we need for lockless code
in the kernel or it's just going to be busted in strange ways.

Note that thanks to compilers becoming real good you need barriers even on
x86.
-Sima

> 
> >> This is a massively performance critical code path and we need to make sure that we move as few cache lines as possible between the producer and consumer side.
> >>
> > 
> > Well, I can't say I buy this argument. If you can show me any real
> > workload where using a spinlock here vs. going lockless makes a
> > measurable impact, I'd eat my hat. Also, FWIW, this code seemingly
> > violates the DRM locking guidelines we're all supposed to follow… But
> > anyway, I'll go ahead with the fix above.
> 
> I probably have to take that back, see another comment below.
> 
> > 
> > Matt
> > 
> >> That was the reason why we replaced the spinlock with the spsc queue before.
> 
> Well we replaced spinlock+kfifo with spsc the for round robing peeking implementation.
> 
> Background is that because of the spinlock even a "peek" transfers the cache line as write to the sheduler thread, and when you do the "peek" even on the idle entities then that starts to not scale at all.
> 
> Since we now have the FIFO implementation and avoiding peeking all the time into the job queue of idle entities that might as well not suck that badly any more.
> 
> Regards,
> Christian. 
> 
> >>
> >> Regards,
> >> Christian.
> >>
> >>>
> >>> Matt
> >>
> 

-- 
Simona Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
