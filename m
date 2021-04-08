Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 73D76358070
	for <lists+dri-devel@lfdr.de>; Thu,  8 Apr 2021 12:18:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7AD836EA65;
	Thu,  8 Apr 2021 10:18:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com
 [IPv6:2a00:1450:4864:20::32b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 353A96EA67
 for <dri-devel@lists.freedesktop.org>; Thu,  8 Apr 2021 10:18:57 +0000 (UTC)
Received: by mail-wm1-x32b.google.com with SMTP id
 t5-20020a1c77050000b029010e62cea9deso959134wmi.0
 for <dri-devel@lists.freedesktop.org>; Thu, 08 Apr 2021 03:18:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=FNHllNkRk/L46sKffP526g9CHXLWWnXq4f7s+lM9PCM=;
 b=Wgf1bTuQHGx65zBelgNZ4Ru8/ax7iD3VgZJQHCrOJqgT7dxU1vc3UfKcxfhinws4a1
 73b/3C0amkLX1AGjMH6vU8405I+KWLnqPYipRjDn7miC7GculMdZpeBdot7o0n755UEh
 NvPWVFEkdABv/SIvisX5E3RHiVAuUkO6/ubwA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=FNHllNkRk/L46sKffP526g9CHXLWWnXq4f7s+lM9PCM=;
 b=cSSQJ1zCP6PdG12Zi0UCFHuFBYuMe8Hs/Ig/6h08MeK87t8cmq/GKShYXc50n4PE8b
 mjpDJik3w+IqZp3HE0mrDV0c+Hsy9AC4fElqBP3tyulq4gnwJxecS/CIT8A7wjeYj02a
 CLvS1vwR8yKM9wSZXbf2Cg++AeHkhArcVfUReTV+2aqbNjACEWu+SSLzAP0LvtZolZxi
 SzKq28dhjkc1XHlSLlSadJHFfaC3UgDeYRXizthJDeFt9HIvkme3V/8qsuZojJBCIENA
 9X6O5SqTJXXcVx+AhXY/WevWRR98z9ReH6LynSRPmr9UWmbQ+CkAtcKD44jCLXKrbzYL
 kchw==
X-Gm-Message-State: AOAM531typUh2WyN+xY7HkPHPFvYFLzmbYGjUp+MAe23wVWWYVYx/Jq9
 W+tDO/d3xl3pDqhcI3C4a7iUxg==
X-Google-Smtp-Source: ABdhPJy1cZxz4F3OtNKRiufzkMS/GwrXBN+SiRATXPMVTYq87ytPB86ojPmY5gvRS5loiaX1q6ScZw==
X-Received: by 2002:a05:600c:19d1:: with SMTP id
 u17mr7592354wmq.141.1617877135861; 
 Thu, 08 Apr 2021 03:18:55 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id j1sm16567354wrq.90.2021.04.08.03.18.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 08 Apr 2021 03:18:55 -0700 (PDT)
Date: Thu, 8 Apr 2021 12:18:53 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Subject: Re: [Intel-gfx] [PATCH v4 0/7] Default request/fence expiry + watchdog
Message-ID: <YG7Yjb6LwhFUfWQw@phenom.ffwll.local>
References: <20210324121335.2307063-1-tvrtko.ursulin@linux.intel.com>
 <YF2k9TivGrDdenoE@phenom.ffwll.local>
 <a73d8204-c3e4-9dda-e587-28c7c134dd59@linux.intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <a73d8204-c3e4-9dda-e587-28c7c134dd59@linux.intel.com>
X-Operating-System: Linux phenom 5.7.0-1-amd64 
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
Cc: Intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Mar 26, 2021 at 10:31:10AM +0000, Tvrtko Ursulin wrote:
> 
> On 26/03/2021 09:10, Daniel Vetter wrote:
> > On Wed, Mar 24, 2021 at 12:13:28PM +0000, Tvrtko Ursulin wrote:
> > > From: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
> > > 
> > > "Watchdog" aka "restoring hangcheck" aka default request/fence expiry - second
> > > post of a somewhat controversial feature, now upgraded to patch status.
> > > 
> > > I quote the "watchdog" becuase in classical sense watchdog would allow userspace
> > > to ping it and so remain alive.
> > > 
> > > I quote "restoring hangcheck" because this series, contrary to the old
> > > hangcheck, is not looking at whether the workload is making any progress from
> > > the kernel side either. (Although disclaimer my memory may be leaky - Daniel
> > > suspects old hangcheck had some stricter, more indiscriminatory, angles to it.
> > > But apart from being prone to both false negatives and false positives I can't
> > > remember that myself.)
> > > 
> > > Short version - ask is to fail any user submissions after a set time period. In
> > > this RFC that time is twelve seconds.
> > > 
> > > Time counts from the moment user submission is "runnable" (implicit and explicit
> > > dependencies have been cleared) and keeps counting regardless of the GPU
> > > contetion caused by other users of the system.
> > > 
> > > So semantics are really a bit weak, but again, I understand this is really
> > > really wanted by the DRM core even if I am not convinced it is a good idea.
> > > 
> > > There are some dangers with doing this - text borrowed from a patch in the
> > > series:
> > > 
> > >    This can have an effect that workloads which used to work fine will
> > >    suddenly start failing. Even workloads comprised of short batches but in
> > >    long dependency chains can be terminated.
> > > 
> > >    And becuase of lack of agreement on usefulness and safety of fence error
> > >    propagation this partial execution can be invisible to userspace even if
> > >    it is "listening" to returned fence status.
> > > 
> > >    Another interaction is with hangcheck where care needs to be taken timeout
> > >    is not set lower or close to three times the heartbeat interval. Otherwise
> > >    a hang in any application can cause complete termination of all
> > >    submissions from unrelated clients. Any users modifying the per engine
> > >    heartbeat intervals therefore need to be aware of this potential denial of
> > >    service to avoid inadvertently enabling it.
> > > 
> > >    Given all this I am personally not convinced the scheme is a good idea.
> > >    Intuitively it feels object importers would be better positioned to
> > >    enforce the time they are willing to wait for something to complete.
> > > 
> > > v2:
> > >   * Dropped context param.
> > >   * Improved commit messages and Kconfig text.
> > > 
> > > v3:
> > >   * Log timeouts.
> > >   * Bump timeout to 20s to see if it helps Tigerlake.
> > 
> > I think 20s is a bit much, and seems like problem is still there in igt. I
> > think we need look at that and figure out what to do with it. And then go
> > back down with the timeout somewhat again since 20s is quite a long time.
> > Irrespective of all the additional gaps/opens around watchdog timeout.
> 
> 1)
> 
> The relationship with the hearbeat is the first issue. There we have 3x
> heartbeat period (each rounded to full second) before sending a high-prio
> pulse which can cause a preempt timeout and hence a reset/kicking out of a
> non-compliant request.
> 
> Defaults for those values mean default expiry shouldn't be lower than 3x
> rounded hearbeat interval + preempt timeout, currently ~9.75s. In practice
> even 12s which I tried initially was too aggressive due slacks on some
> platforms.

Hm, would be good to put that as a comment next to the module param, or
something like that. Maybe even a sanity check to make sure these two
values are consistent (i.e. if watchdog is less than 3.5x the heartbeat,
we complain in dmesg).

> 2)
> 
> 20s seems to work apart that it shows the general regression unconditional
> default expiry adds. Either some existing IGTs which create long runnable
> chains, or the far-fence test which explicitly demonstrates this. AFAIK, and
> apart from the can_merge_rq yet unexplained oops, this is the only class of
> IGT failures which can appear.
> 
> So you could tweak it lower, if you also decide to make real hang detection
> stricter. But doing that also worsens the regression with loaded systems.
> 
> I only can have a large shrug/dontknow here since I wish we went more
> towards my suggestion of emulating setrlimit(RLIMIT_CPU). Meaning at least
> going with GPU time instead of elapsed time and possibly even leaving the
> policy of setting it to sysadmins. That would fit much better with our
> hangcheck, but, doesn't fit the drm core mandate.. hence I really don't
> know.

The bikeshed will come back when we wire up drm/scheduler as the frontend
for guc scheduler backend. I guess we can tackle it then.
-Daniel

> 
> Regards,
> 
> Tvrtko
> 
> > -Daniel
> > 
> > >   * Fix sentinel assert.
> > > 
> > > v4:
> > >   * A round of review feedback applied.
> > > 
> > > Chris Wilson (1):
> > >    drm/i915: Individual request cancellation
> > > 
> > > Tvrtko Ursulin (6):
> > >    drm/i915: Extract active lookup engine to a helper
> > >    drm/i915: Restrict sentinel requests further
> > >    drm/i915: Handle async cancellation in sentinel assert
> > >    drm/i915: Request watchdog infrastructure
> > >    drm/i915: Fail too long user submissions by default
> > >    drm/i915: Allow configuring default request expiry via modparam
> > > 
> > >   drivers/gpu/drm/i915/Kconfig.profile          |  14 ++
> > >   drivers/gpu/drm/i915/gem/i915_gem_context.c   |  73 ++++---
> > >   .../gpu/drm/i915/gem/i915_gem_context_types.h |   4 +
> > >   drivers/gpu/drm/i915/gt/intel_context_param.h |  11 +-
> > >   drivers/gpu/drm/i915/gt/intel_context_types.h |   4 +
> > >   .../gpu/drm/i915/gt/intel_engine_heartbeat.c  |   1 +
> > >   .../drm/i915/gt/intel_execlists_submission.c  |  23 +-
> > >   .../drm/i915/gt/intel_execlists_submission.h  |   2 +
> > >   drivers/gpu/drm/i915/gt/intel_gt.c            |   3 +
> > >   drivers/gpu/drm/i915/gt/intel_gt.h            |   2 +
> > >   drivers/gpu/drm/i915/gt/intel_gt_requests.c   |  28 +++
> > >   drivers/gpu/drm/i915/gt/intel_gt_types.h      |   7 +
> > >   drivers/gpu/drm/i915/i915_params.c            |   5 +
> > >   drivers/gpu/drm/i915/i915_params.h            |   1 +
> > >   drivers/gpu/drm/i915/i915_request.c           | 129 ++++++++++-
> > >   drivers/gpu/drm/i915/i915_request.h           |  16 +-
> > >   drivers/gpu/drm/i915/selftests/i915_request.c | 201 ++++++++++++++++++
> > >   17 files changed, 479 insertions(+), 45 deletions(-)
> > > 
> > > -- 
> > > 2.27.0
> > > 
> > > _______________________________________________
> > > Intel-gfx mailing list
> > > Intel-gfx@lists.freedesktop.org
> > > https://lists.freedesktop.org/mailman/listinfo/intel-gfx
> > 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
