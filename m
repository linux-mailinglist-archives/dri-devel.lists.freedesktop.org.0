Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 495AB39BEE1
	for <lists+dri-devel@lfdr.de>; Fri,  4 Jun 2021 19:33:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 207256F874;
	Fri,  4 Jun 2021 17:33:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 10B7C6F874;
 Fri,  4 Jun 2021 17:33:07 +0000 (UTC)
IronPort-SDR: 9jVB1YwPSRF+emXss7uO3c6DqjF6XUyTa/TDhpxurOKzozZztiXqf50svHQCTIiFFgruUH2oSE
 rwQ7mTmKKqSg==
X-IronPort-AV: E=McAfee;i="6200,9189,10005"; a="202477271"
X-IronPort-AV: E=Sophos;i="5.83,248,1616482800"; d="scan'208";a="202477271"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Jun 2021 10:33:04 -0700
IronPort-SDR: RQD1iMe456wpZ821pPL/T8/wGbe1o6IE/aBfXc5cBTblQPyDnoF2cdp/McJ8zaOtLC/Bl382r0
 pjVo+FbUe4jw==
X-IronPort-AV: E=Sophos;i="5.83,248,1616482800"; d="scan'208";a="401028069"
Received: from unknown (HELO sdutt-i7) ([10.165.21.147])
 by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Jun 2021 10:33:03 -0700
Date: Fri, 4 Jun 2021 10:26:04 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: Jason Ekstrand <jason@jlekstrand.net>
Subject: Re: [Intel-gfx] [PATCH 9/9] drm/i915/doc: Add kernel doc for
 i915_sched_engine
Message-ID: <20210604172604.GA19273@sdutt-i7>
References: <20210603212722.59719-1-matthew.brost@intel.com>
 <20210603212722.59719-10-matthew.brost@intel.com>
 <CAOFGe97toNPXOhSP=PQrb4PNzYVLXOP7+tNY6B9qBMLSKrC0xw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAOFGe97toNPXOhSP=PQrb4PNzYVLXOP7+tNY6B9qBMLSKrC0xw@mail.gmail.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
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
Cc: Daniel Vetter <daniel.vetter@intel.com>,
 Intel GFX <intel-gfx@lists.freedesktop.org>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Jun 04, 2021 at 12:20:36PM -0500, Jason Ekstrand wrote:
> On Thu, Jun 3, 2021 at 4:09 PM Matthew Brost <matthew.brost@intel.com> wrote:
> >
> > Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> > ---
> >  Documentation/gpu/i915.rst                  |  6 ++++
> >  drivers/gpu/drm/i915/i915_scheduler_types.h | 37 ++++++++++++++++++---
> >  2 files changed, 38 insertions(+), 5 deletions(-)
> >
> > diff --git a/Documentation/gpu/i915.rst b/Documentation/gpu/i915.rst
> > index 42ce0196930a..8f4f5471a05b 100644
> > --- a/Documentation/gpu/i915.rst
> > +++ b/Documentation/gpu/i915.rst
> > @@ -425,6 +425,12 @@ User Batchbuffer Execution
> >  .. kernel-doc:: drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c
> >     :doc: User command execution
> >
> > +Scheduling
> > +----------
> > +.. kernel-doc:: drivers/gpu/drm/i915/i915_scheduler_types.h
> > +   :functions: i915_sched_engine
> > +
> > +
> >  Logical Rings, Logical Ring Contexts and Execlists
> >  --------------------------------------------------
> >
> > diff --git a/drivers/gpu/drm/i915/i915_scheduler_types.h b/drivers/gpu/drm/i915/i915_scheduler_types.h
> > index 9d79514450de..e3da7517853f 100644
> > --- a/drivers/gpu/drm/i915/i915_scheduler_types.h
> > +++ b/drivers/gpu/drm/i915/i915_scheduler_types.h
> > @@ -91,7 +91,21 @@ struct i915_dependency {
> >                                 &(rq__)->sched.signalers_list, \
> >                                 signal_link)
> >
> > +/**
> > + * sturct i915_sched_engine - scheduler engine
> > + *
> > + * A schedule engine represents a submission queue with different priority
> > + * bands. It contains all the common state (relative to the backend) to queue,
> > + * track, and submit a request.
> > + *
> > + * This object at the moment is quite i915 specific but will transition into a
> > + * container for the drm_gpu_scheduler plus a few other variables once the i915
> > + * is integrated with the DRM scheduler.
> > + */
> 
> Why is this its own patch?  The above comment would be nice to have in
> patch 1/9 and the kref could be documented there too.
> 

I thought it make the review easier? Either way, can squash this patch into the
previous 8 as needed in next rev.

Matt

> >  struct i915_sched_engine {
> > +       /**
> > +        * @ref: reference count of schedule engine object
> > +        */
> >         struct kref ref;
> >
> >         /**
> > @@ -100,11 +114,18 @@ struct i915_sched_engine {
> >          */
> >         spinlock_t lock;
> >
> > +       /**
> > +        * @requests: list of requests inflight on this schedule engine
> > +        */
> >         struct list_head requests;
> > -       struct list_head hold; /* ready requests, but on hold */
> >
> >         /**
> > -        * @tasklet: softirq tasklet for bottom handler
> > +        * @hold: list of requests on hold.
> > +        */
> > +       struct list_head hold;
> > +
> > +       /**
> > +        * @tasklet: softirq tasklet for submission
> >          */
> >         struct tasklet_struct tasklet;
> >
> > @@ -137,14 +158,20 @@ struct i915_sched_engine {
> >          */
> >         bool no_priolist;
> >
> > -       /* Back pointer to engine */
> > +       /**
> > +        * @engine: back pointer to engine
> > +        */
> >         struct intel_engine_cs *engine;
> >
> > -       /* Kick backend */
> > +       /**
> > +        * @kick_backed: kick back after a request's priority has changed
> > +        */
> >         void    (*kick_backend)(const struct i915_request *rq,
> >                                 int prio);
> >
> > -       /*
> > +       /**
> > +        * @schedule: schedule function to adjust priority of request
> > +        *
> >          * Call when the priority on a request has changed and it and its
> >          * dependencies may need rescheduling. Note the request itself may
> >          * not be ready to run!
> > --
> > 2.28.0
> >
> > _______________________________________________
> > Intel-gfx mailing list
> > Intel-gfx@lists.freedesktop.org
> > https://lists.freedesktop.org/mailman/listinfo/intel-gfx
