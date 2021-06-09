Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 174B53A157D
	for <lists+dri-devel@lfdr.de>; Wed,  9 Jun 2021 15:24:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C44856E30F;
	Wed,  9 Jun 2021 13:24:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com
 [IPv6:2a00:1450:4864:20::433])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D3E396E334
 for <dri-devel@lists.freedesktop.org>; Wed,  9 Jun 2021 13:24:04 +0000 (UTC)
Received: by mail-wr1-x433.google.com with SMTP id m18so25499730wrv.2
 for <dri-devel@lists.freedesktop.org>; Wed, 09 Jun 2021 06:24:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=t3Or10sfr9dZmBseRAQSnnc/yUYQ2O/mJsEgLeSYKwM=;
 b=JuYQd3nbizfY0ZCj6hVbkzT3jlZJdcVChEj0aRrgNGtgTvb/t3+Mu5Fruwt8S3c1rR
 jGyRjbnaxcANI+TamCy2UwnZnPFfdOTs6zNTXXATY1GM0zQd+y9N6ydOI2JUlCyCPTyQ
 bgIMT+LXFPg21SdVC4AO2rd9KPK7ORphu5xNk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=t3Or10sfr9dZmBseRAQSnnc/yUYQ2O/mJsEgLeSYKwM=;
 b=lNxn6f5es3nAHd3peNxkwSVohf4mfBx3boxrXixe9SQkg2oKCUW1+jFcAhTjPzQu07
 +Umo3uXggrknJlXrP7hvJVrc13HP+Ba3g5gd0Wvala3GWHNwN2DtzqPdTCqY6k25+sea
 Mpz53sB/QI1pc+gCsyWTZzH4CbaJrXO2USTCgtuGvR2RYPZgPU/rBfKTmJIS5Tj3M+IP
 xGfv7sacaEkt/XFbSMD5CKtxl/cew8wMW4ATVN1AkTdSdSoTz+wGWazti/l1UQcvIzDQ
 z54waAAFd2SEQ15jM/dhxSMQBvWFTG3GlIdVZDUTBRzVQ5YAu0vTDp1WkMr5/E/TUUov
 LwVw==
X-Gm-Message-State: AOAM5324QqKPQRqKoy/1H/tcW0UcoIHfox83Nbf5BKgc08iyF/c9SLqD
 b+ZWa2ev4gIrwfprcFoLobikcQ==
X-Google-Smtp-Source: ABdhPJz9IU3Wj2CNkH7/kTpjZ/hDJkBTL/24zXgdwsn+jgwitDx4lydzLmF/coTC+2cdcILmnOAdfw==
X-Received: by 2002:adf:a401:: with SMTP id d1mr28026610wra.55.1623245043445; 
 Wed, 09 Jun 2021 06:24:03 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id x125sm19296439wmg.37.2021.06.09.06.24.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 09 Jun 2021 06:24:02 -0700 (PDT)
Date: Wed, 9 Jun 2021 15:24:00 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Matthew Brost <matthew.brost@intel.com>
Subject: Re: [Intel-gfx] [PATCH 13/20] drm/i915/guc: Relax CTB response timeout
Message-ID: <YMDA8IqqZ5IgvRf4@phenom.ffwll.local>
References: <20210603051630.2635-1-matthew.brost@intel.com>
 <20210603051630.2635-14-matthew.brost@intel.com>
 <YLnlQyPJZygHTHxk@phenom.ffwll.local>
 <20210604183539.GA26392@sdutt-i7>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210604183539.GA26392@sdutt-i7>
X-Operating-System: Linux phenom 5.10.32scarlett+ 
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
Cc: daniel.vetter@intel.com, intel-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Jun 04, 2021 at 11:35:39AM -0700, Matthew Brost wrote:
> On Fri, Jun 04, 2021 at 10:33:07AM +0200, Daniel Vetter wrote:
> > On Wed, Jun 02, 2021 at 10:16:23PM -0700, Matthew Brost wrote:
> > > From: Michal Wajdeczko <michal.wajdeczko@intel.com>
> > > 
> > > In upcoming patch we will allow more CTB requests to be sent in
> > > parallel to the GuC for processing, so we shouldn't assume any more
> > > that GuC will always reply without 10ms.
> > > 
> > > Use bigger value from CONFIG_DRM_I915_GUC_CTB_TIMEOUT instead.
> > > 
> > > v2: Add CONFIG_DRM_I915_GUC_CTB_TIMEOUT config option
> > > 
> > > Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
> > > Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> > > Reviewed-by: Matthew Brost <matthew.brost@intel.com>
> > 
> > So this is a rant, but for upstream we really need to do better than
> > internal:
> > 
> > - The driver must work by default in the optimal configuration.
> > 
> > - Any config change that we haven't validated _must_ taint the kernel
> >   (this is especially for module options, but also for config settings)
> > 
> > - Config need a real reason beyond "was useful for bring-up".
> > 
> > Our internal tree is an absolute disaster right now, with multi-line
> > kernel configs (different on each platform) and bespoke kernel config or
> > the driver just fails. We're the expert on our own hw, we should know how
> > it works, not offload that to users essentially asking them "how shitty do
> > you think Intel hw is in responding timely".
> > 
> > Yes I know there's a lot of these there already, they don't make a lot of
> > sense either.
> > 
> > Except if there's a real reason for this (aside from us just offloading
> > testing to our users instead of doing it ourselves properly) I think we
> > should hardcode this, with a comment explaining why. Maybe with a switch
> > between the PF/VF case once that's landed.
> > 
> > > ---
> > >  drivers/gpu/drm/i915/Kconfig.profile      | 10 ++++++++++
> > >  drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c |  5 ++++-
> > >  2 files changed, 14 insertions(+), 1 deletion(-)
> > > 
> > > diff --git a/drivers/gpu/drm/i915/Kconfig.profile b/drivers/gpu/drm/i915/Kconfig.profile
> > > index 39328567c200..0d5475b5f28a 100644
> > > --- a/drivers/gpu/drm/i915/Kconfig.profile
> > > +++ b/drivers/gpu/drm/i915/Kconfig.profile
> > > @@ -38,6 +38,16 @@ config DRM_I915_USERFAULT_AUTOSUSPEND
> > >  	  May be 0 to disable the extra delay and solely use the device level
> > >  	  runtime pm autosuspend delay tunable.
> > >  
> > > +config DRM_I915_GUC_CTB_TIMEOUT
> > > +	int "How long to wait for the GuC to make forward progress on CTBs (ms)"
> > > +	default 1500 # milliseconds
> > > +	range 10 60000
> > 
> > Also range is definitely off, drm/scheduler will probably nuke you
> > beforehand :-)
> > 
> > That's kinda another issue I have with all these kconfig knobs: Maybe we
> > need a knob for "relax with reset attempts, my workloads overload my gpus
> > routinely", which then scales _all_ timeouts proportionally. But letting
> > the user set them all, with silly combiniations like resetting the
> > workload before heartbeat or stuff like that doesn't make much sense.
> >
> 
> Yes, the code as is the user could do some wacky stuff that doesn't make
> sense at all.
>  
> > Anyway, tiny patch so hopefully I can leave this one out for now until
> > we've closed this.
> 
> No issue leaving this out as blocking CTBs are never really used anyways
> until SRIOV aside from setup / debugging. That being said, we might
> still want a higher hardcoded value in the meantime, perhaps around a
> second. I can follow up on that if needed.

Yeah just patch with updated hardcoded value sounds good to me.
-Daniel

> 
> Matt
> 
> > -Daniel
> > 
> > > +	help
> > > +	  Configures the default timeout waiting for GuC the to make forward
> > > +	  progress on CTBs. e.g. Waiting for a response to a requeset.
> > > +
> > > +	  A range of 10 ms to 60000 ms is allowed.
> > > +
> > >  config DRM_I915_HEARTBEAT_INTERVAL
> > >  	int "Interval between heartbeat pulses (ms)"
> > >  	default 2500 # milliseconds
> > > diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c
> > > index 916c2b80c841..cf1fb09ef766 100644
> > > --- a/drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c
> > > +++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c
> > > @@ -436,6 +436,7 @@ static int ct_write(struct intel_guc_ct *ct,
> > >   */
> > >  static int wait_for_ct_request_update(struct ct_request *req, u32 *status)
> > >  {
> > > +	long timeout;
> > >  	int err;
> > >  
> > >  	/*
> > > @@ -443,10 +444,12 @@ static int wait_for_ct_request_update(struct ct_request *req, u32 *status)
> > >  	 * up to that length of time, then switch to a slower sleep-wait loop.
> > >  	 * No GuC command should ever take longer than 10ms.
> > >  	 */
> > > +	timeout = CONFIG_DRM_I915_GUC_CTB_TIMEOUT;
> > > +
> > >  #define done INTEL_GUC_MSG_IS_RESPONSE(READ_ONCE(req->status))
> > >  	err = wait_for_us(done, 10);
> > >  	if (err)
> > > -		err = wait_for(done, 10);
> > > +		err = wait_for(done, timeout);
> > >  #undef done
> > >  
> > >  	if (unlikely(err))
> > > -- 
> > > 2.28.0
> > > 
> > > _______________________________________________
> > > Intel-gfx mailing list
> > > Intel-gfx@lists.freedesktop.org
> > > https://lists.freedesktop.org/mailman/listinfo/intel-gfx
> > 
> > -- 
> > Daniel Vetter
> > Software Engineer, Intel Corporation
> > http://blog.ffwll.ch

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
