Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1ED3F6DDD43
	for <lists+dri-devel@lfdr.de>; Tue, 11 Apr 2023 16:07:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DE84E10E55B;
	Tue, 11 Apr 2023 14:07:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com
 [IPv6:2a00:1450:4864:20::434])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 87EA010E559
 for <dri-devel@lists.freedesktop.org>; Tue, 11 Apr 2023 14:07:27 +0000 (UTC)
Received: by mail-wr1-x434.google.com with SMTP id
 ffacd0b85a97d-2ef67bbb136so356988f8f.1
 for <dri-devel@lists.freedesktop.org>; Tue, 11 Apr 2023 07:07:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google; t=1681222046; x=1683814046;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=S1Yf3WxEaFPMKcpFiR6E8tEJoZd1manaqzwwKyuE1pc=;
 b=I3DiAcXXyrmzX5ef5grIIIp/NXsl4N9eo6SS7n23B9qVEgc1w/PBBMLwB5jZFF9kfA
 +Ndro2PKya+5JFzfWqZeucscUgyd+tn2baxygvkwz0xbBOEY0XDHaXVsdH91U2BRKXKi
 UhNsABBqmzXW/Xq7n4305y9mrvnztqG6Y8kAk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1681222046; x=1683814046;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=S1Yf3WxEaFPMKcpFiR6E8tEJoZd1manaqzwwKyuE1pc=;
 b=k8U8wLQ9FHe3QRea3m2Jsq7Y0qDG0/SNAXuLzKJ/43NfUYUuGzUNblo2RRtBFmR7UG
 FiEpOY5SsMmEJWF7IPAzaCrp9yhVyf2qus2EwHevzbpIgaLFzKyiGqm7sigQK5HMfb8a
 IWoRhIPXJv4p1/7/GPic3qqkhxn+3tzfLnE/gNUu7r1xqV/B9av+HuqFK17Qu0dYD8Df
 Ay7v4QFaKBQh8+Cr57GI0DGhwVk+EF9zTf7JjbT+UlcOXfO8kU+cAauuffm+j4zfN8Xm
 2JNQ9Gt3k9ATXW/WPTC2S/Ee878umvFHMB/dw/TdCpa0+EF4LTnkzDCx1e8hJ/y9glmV
 4jdQ==
X-Gm-Message-State: AAQBX9d2yui6rk6pipgZ/TO3ub+3gULWLeu7sLGGNDS40L+Q2z++R0QD
 mdwIpZ+zktwJ82/3JSBmTdd4aw==
X-Google-Smtp-Source: AKy350aUo/zZrPvvBbfyXuf0Tj9dpj3W23Vi54J+qCrP2VXD18i89TEfRCsrjXghtg8v9cz/CxbEDA==
X-Received: by 2002:a5d:6588:0:b0:2e4:aa61:a50 with SMTP id
 q8-20020a5d6588000000b002e4aa610a50mr7592775wru.1.1681222045825; 
 Tue, 11 Apr 2023 07:07:25 -0700 (PDT)
Received: from phenom.ffwll.local (212-51-149-33.fiber7.init7.net.
 [212.51.149.33]) by smtp.gmail.com with ESMTPSA id
 f4-20020adff8c4000000b002cff06039d7sm14685397wrq.39.2023.04.11.07.07.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 11 Apr 2023 07:07:25 -0700 (PDT)
Date: Tue, 11 Apr 2023 16:07:22 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Asahi Lina <lina@asahilina.net>
Subject: Re: [RFC PATCH 00/10] Xe DRM scheduler and long running workload plans
Message-ID: <ZDVpmpDHKx5KyD2M@phenom.ffwll.local>
References: <20230404002211.3611376-1-matthew.brost@intel.com>
 <50fff1d4-9982-d60d-23e0-66c2020af5bf@asahilina.net>
 <ZCuEP2NnOich9kuI@DUT025-TGLU.fm.intel.com>
 <b15831b9-7bca-7e78-7abc-bc06e99b7699@asahilina.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <b15831b9-7bca-7e78-7abc-bc06e99b7699@asahilina.net>
X-Operating-System: Linux phenom 6.1.0-7-amd64 
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
Cc: Matthew Brost <matthew.brost@intel.com>, thomas.hellstrom@linux.intel.com,
 airlied@linux.ie, dri-devel@lists.freedesktop.org, christian.koenig@amd.com,
 boris.brezillon@collabora.com, robdclark@chromium.org,
 intel-xe@lists.freedesktop.org, faith.ekstrand@collabora.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sat, Apr 08, 2023 at 04:05:20PM +0900, Asahi Lina wrote:
> On 04/04/2023 10.58, Matthew Brost wrote:
> > On Tue, Apr 04, 2023 at 10:07:48AM +0900, Asahi Lina wrote:
> > > Hi, thanks for the Cc!
> > > 
> > 
> > No problem.
> > 
> > > On 04/04/2023 09.22, Matthew Brost wrote:
> > > > Hello,
> > > > 
> > > > As a prerequisite to merging the new Intel Xe DRM driver [1] [2], we
> > > > have been asked to merge our common DRM scheduler patches first as well
> > > > as develop a common solution for long running workloads with the DRM
> > > > scheduler. This RFC series is our first attempt at doing this. We
> > > > welcome any and all feedback.
> > > > 
> > > > This can we thought of as 4 parts detailed below.
> > > > 
> > > > - DRM scheduler changes for 1 to 1 relationship between scheduler and
> > > > entity (patches 1-3)
> > > > 
> > > > In Xe all of the scheduling of jobs is done by a firmware scheduler (the
> > > > GuC) which is a new paradigm WRT to the DRM scheduler and presents
> > > > severals problems as the DRM was originally designed to schedule jobs on
> > > > hardware queues. The main problem being that DRM scheduler expects the
> > > > submission order of jobs to be the completion order of jobs even across
> > > > multiple entities. This assumption falls apart with a firmware scheduler
> > > > as a firmware scheduler has no concept of jobs and jobs can complete out
> > > > of order. A novel solution for was originally thought of by Faith during
> > > > the initial prototype of Xe, create a 1 to 1 relationship between scheduler
> > > > and entity. I believe the AGX driver [3] is using this approach and
> > > > Boris may use approach as well for the Mali driver [4].
> > > > 
> > > > To support a 1 to 1 relationship we move the main execution function
> > > > from a kthread to a work queue and add a new scheduling mode which
> > > > bypasses code in the DRM which isn't needed in a 1 to 1 relationship.
> > > > The new scheduling mode should unify all drivers usage with a 1 to 1
> > > > relationship and can be thought of as using scheduler as a dependency /
> > > > infligt job tracker rather than a true scheduler.
> > > 
> > > Yup, we're in the exact same situation with drm/asahi, so this is very
> > > welcome! We've been using the existing scheduler as-is, but this should help
> > > remove some unneeded complexity in this use case.
> > > 
> > 
> > That's the idea.
> > 
> > > Do you want me to pull in this series into our tree and make sure this all
> > > works out for us?
> > > 
> > 
> > We tested this in Xe and it definitely works for us but the more testing
> > the better.
> > 
> 
> I haven't gotten around to testing this series yet, but after more debugging
> of drm_sched issues I want to hear more about how Xe uses the scheduler.
> 
> From what I can tell, and from what Christian says, drm_sched has the hidden
> requirement that all job objects outlive the scheduler. I've run into
> several UAF bugs due to this. Not only that, it also currently has the
> requirement that all drm_sched fences outlive the scheduler object.
> 
> These requirements are subtle and only manifest as kernel oopses in rare
> corner cases, so it wasn't at all obvious to me that this was somehow a
> fundamental design assumption when I started using it.
> 
> As far as I can tell, this design is going to work in 99% of cases for
> global-schedulers-per-GPU models, where those corner cases would have to be
> hit on top of a GPU removal scenario (and GPU remove is... well, not the
> most tested/exercised use case). When the scheduler basically lives forever,
> none of this really matters.
> 
> But with a one-scheduler-per-queue model, how do you deal with this when the
> queue goes away? So far, without any of the partial bugfixes I have sent so
> far (which Christian objected to):
> 
> - If you try to tear down a scheduler with any jobs currently scheduled at
> the hardware, drm_sched will oops when those jobs complete and the hw fences
> signal.
> - If you try to tear down an entity (which should cancel all its pending
> jobs) and then the scheduler it was attached to without actually waiting for
> all the free_job() callbacks to be called on every job that ever existed for
> that entity, you can oops (entity cleanup is asynchronous in some cases like
> killed processes, so it will return before all jobs are freed and then that
> asynchronous process will crash and burn if the scheduler goes away out from
> under its feet). Waiting for job completion fences is not enough for this,
> you have to wait until free_job() has actually been called for all jobs.
> - Even if you actually wait for all jobs to be truly gone and then tear down
> the scheduler, if any scheduler job fences remain alive, that will then oops
> if you try to call the debug functions on them (like cat
> /sys/kernel/debug/dma_buf/bufinfo).
> 
> I tried to fix these things, but Christian objected implying it was the
> driver's job to keep a reference from jobs and hw fences to the scheduler.
> But I find that completely broken, because besides the extra memory/resource
> usage keeping the scheduler alive when you're trying to free resources as
> fast as possible when a process goes away, you can't even use normal
> reference counting for that: if you try to drop the last drm_sched reference
> from within a free_job() callback, the whole thing deadlocks since that will
> be running in the scheduler's thread/workqueue context, which can't free
> itself. So now you both reference count the scheduler from jobs and fences,
> and on top of that you need to outsource drm_sched freeing to a workqueue in
> the driver to make sure you don't deadlock.
> 
> For job fences this is particularly broken, because those fences can live
> forever signaled and attached to shared buffers and there is no guarantee
> that they will be freed in any kind of reasonable time frame. If they have
> to keep the scheduler that created them alive, that creates a lot of dead
> object junk we have to drag around just because a signaled fence exists
> somewhere.
> 
> For a Rust abstraction we have to do all that tracking and refcounting in
> the abstraction itself to make it safe, which is starting to sound like
> reimplementing half of the job tracking drm_sched itself does just to fix
> the lifetime issues, which really tells me the existing design is not sound
> nor easy to use correctly in general.
> 
> How does Xe deal with this (does it deal with it at all)? What happens when
> you kill -9 a process using the GPU? Does freeing all of this wait for all
> jobs to complete *and be freed* with free_job()? What about exported
> dma_bufs with fences attached from that scheduler? Do you keep the scheduler
> alive for those?
> 
> Personally, after running into all this, and after seeing Christian's
> reaction to me trying to improve the state of things, I'm starting to doubt
> that drm_sched is the right solution at all for firmware-scheduling drivers.

Bit a wash-up reply on the more fundamental thing here:
 
For the current scheduler the issues you've found are indeed all driver
bugs (or most I think at least).

Which is why I think we shouldn't just try to shoehorn fundamentally new
semantics without updating the driver interfaces (the drm_sched split into
the driver interface part and the internal scheduler part). Once we have
that, including kerneldoc update and what the rules are, then all the
various uaf you've discovered become real bugs and I don't see any issue
merging all the fixes.

Without that we do have a chicken/egg problem between:

"here's a bunch of hacks to make the problems disappear I've hit in my
reuse of drm/sched for fw schedulers"

vs.

"this makes no sense for the current drm/sched interfaces and how current
upstream drivers use it"

I don't think there's a lot needed in terms of drm/sched driver api
rework, but I think it's also pretty clearly not ever going to get
anywhere with just nothing at all. Writing an entire new scheduler lib
instead of at least trying what minimal semantic changes (instead of just
a pile of hacks without even doc changes for the new rules) does not sound
like a good idea to me :-)

> If you want a workload to try to see if you run into any of these things,
> running and killing lots of things in parallel is a good thing to try (mess
> with the numbers and let it run for a while to see if you can hit any corner
> cases):
> 
> while true; do for i in $(seq 1 10); do timeout -k 0.01 0.05 glxgears &
> done; sleep 0.1; done

Maybe xe gets away with this due to synchronously killing everything
related to a ctx, but yeah I'd expect this to go boom in fun ways.
-Daniel
-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
