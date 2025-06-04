Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 67BF0ACE0EE
	for <lists+dri-devel@lfdr.de>; Wed,  4 Jun 2025 17:07:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A599510E73B;
	Wed,  4 Jun 2025 15:07:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; secure) header.d=ffwll.ch header.i=@ffwll.ch header.b="Kjg3iNri";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com
 [209.85.221.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DE5BD10E730
 for <dri-devel@lists.freedesktop.org>; Wed,  4 Jun 2025 15:07:21 +0000 (UTC)
Received: by mail-wr1-f42.google.com with SMTP id
 ffacd0b85a97d-3a3798794d3so5789618f8f.1
 for <dri-devel@lists.freedesktop.org>; Wed, 04 Jun 2025 08:07:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google; t=1749049640; x=1749654440; darn=lists.freedesktop.org; 
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:mail-followup-to:message-id:subject:cc:to
 :from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=nLNe9PZGn0K8HUE/OJhh4z5UPfVBQh5eKwFNHa6KR70=;
 b=Kjg3iNritEGXTB/ynAEFMQw90j6pga39pR7Q8Ls8nCAeW/oC8+o9GqaKY+fTSmLkux
 mYDNexebSU+mLJamyopasmn5k3h6y54r6Qa2FGNVyU78ginjGuxmBlZZzSzZNDfjdJut
 wl6IL0rFlIas3hzvAcuyLLfm0NFzexhvsC/X4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1749049640; x=1749654440;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:mail-followup-to:message-id:subject:cc:to
 :from:date:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=nLNe9PZGn0K8HUE/OJhh4z5UPfVBQh5eKwFNHa6KR70=;
 b=DdKAD6SFa8VfR/sV9ny0zJdIreSPDuyGs8OiqeWR8IWyTSyTUJ8IIPxSmbHG+h49M0
 VskT2BJdN52jpLDz3vr6rjJY+1eUYuJxqEqQdjATB2YIulrlMChN4GofjGfp6c66BVYY
 vUgq54t3SIf+6C8kYQ8rbmVy6Ff6iWYWGxb56D9tULvYfiaY1Mx7NXn9ifRAvA4I6kW2
 ZQ0dMGXKKfhFqOuvexyySBMzdRnL/N7Zrsl+F3k61ocVvkNOh9Jr+IhT9IjoRHFDxRBQ
 d0nnxvITeGYnIAiWrhJ38qvCgM3YubzGB46s+WzeOclXJXbyNLtf6Rkahmw2zh8g+WP2
 apbw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXCaDxt0ibmR+MWjyiwwEd23mSa/0lPSdNx2EtO86xXazyOMF+Gs+vtBeiQ0lj5xmD8QE8+LaT2s4Y=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yy2jf5nA/b1LIxPQrwpYlffiTzNK5DupkSpGPFjfQlkr0Fx0VFM
 w9twk4m+ZfbNDeoIeahkhKVghAlY2X+zorUDmvZr4PVlTCKwXVFglLR9whuFlegIiFk=
X-Gm-Gg: ASbGncvqLG2le/u+YIE5wIszBtALXj1V5CWDvXsRFMfOa8mvIZD2riCEuiqC2oPHjBw
 3ZTwuaXtDfhuYmEZOV+neOsQDGI/wAKaZMejL96IBCfAqUONYeonWt46piY64cExRr/5+RnhtW1
 nfgrhMNRnsnvsBVg3AT+5AlyuLXURERRKBNSTTsdPm0r2vUG2tpCTgvUpbhn4/LqXEBMBAZ4Wvd
 fucs7fG1c1VuVGPnhInDcxYUzfWVUFAgZmogpa6bbNokp5j/DaWaqvHzmmQQnzReHnQaqdLrXva
 7UHf7/J8xlifz8m1iIyLkw6jpunaTQClPt/eWhOdv8A7Br81/oV3G9UBds/72jw=
X-Google-Smtp-Source: AGHT+IH2Zjdx0sOvzJfPV5Mri2bdBbG1xpMSCNMUBcoLGEUL4Yhh8rTWxisXo6OxmWgNv3hsjQLN2w==
X-Received: by 2002:a05:6000:420f:b0:3a4:db49:94aa with SMTP id
 ffacd0b85a97d-3a51d904540mr2742307f8f.21.1749049639709; 
 Wed, 04 Jun 2025 08:07:19 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:5485:d4b2:c087:b497])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-450d8006952sm198017885e9.32.2025.06.04.08.07.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 04 Jun 2025 08:07:18 -0700 (PDT)
Date: Wed, 4 Jun 2025 17:07:15 +0200
From: Simona Vetter <simona.vetter@ffwll.ch>
To: Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>
Cc: Philipp Stanner <phasta@kernel.org>,
 Matthew Brost <matthew.brost@intel.com>,
 Danilo Krummrich <dakr@kernel.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] drm/sched: Discourage usage of separate workqueues
Message-ID: <aEBhIzccXBPyt_58@phenom.ffwll.local>
Mail-Followup-To: Christian =?iso-8859-1?Q?K=F6nig?=
 <christian.koenig@amd.com>, 
 Philipp Stanner <phasta@kernel.org>,
 Matthew Brost <matthew.brost@intel.com>,
 Danilo Krummrich <dakr@kernel.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20250604081657.124453-2-phasta@kernel.org>
 <7a09c357-2d28-4dd6-b637-4387cc430938@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <7a09c357-2d28-4dd6-b637-4387cc430938@amd.com>
X-Operating-System: Linux phenom 6.12.25-amd64 
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

On Wed, Jun 04, 2025 at 11:41:25AM +0200, Christian König wrote:
> On 6/4/25 10:16, Philipp Stanner wrote:
> > struct drm_sched_init_args provides the possibility of letting the
> > scheduler use user-controlled workqueues, instead of the scheduler
> > creating its own workqueues. It's currently not documented who would
> > want to use that.
> > 
> > Not sharing the submit_wq between driver and scheduler has the advantage
> > of no negative intereference between them being able to occur (e.g.,
> > MMU notifier callbacks waiting for fences to get signaled). A separate
> > timeout_wq should rarely be necessary, since using the system_wq could,
> > in the worst case, delay a timeout.
> > 
> > Discourage the usage of own workqueues in the documentation.
> > 
> > Suggested-by: Danilo Krummrich <dakr@kernel.org>
> > Signed-off-by: Philipp Stanner <phasta@kernel.org>
> > ---
> >  include/drm/gpu_scheduler.h | 7 +++++--
> >  1 file changed, 5 insertions(+), 2 deletions(-)
> > 
> > diff --git a/include/drm/gpu_scheduler.h b/include/drm/gpu_scheduler.h
> > index 81dcbfc8c223..11740d745223 100644
> > --- a/include/drm/gpu_scheduler.h
> > +++ b/include/drm/gpu_scheduler.h
> > @@ -590,14 +590,17 @@ struct drm_gpu_scheduler {
> >   *
> >   * @ops: backend operations provided by the driver
> >   * @submit_wq: workqueue to use for submission. If NULL, an ordered wq is
> > - *	       allocated and used.
> > + *	       allocated and used. It is recommended to pass NULL unless there
> > + *	       is a good reason not to.
> 
> Yeah, that's probably a good idea. I'm not sure why xe and nouveau actually wanted that.

The idea of this trick is that you have a fw scheduler which only has one
queue, and a bunch of other things in your driver that also need to be
stuffed into this fw queue (or handled by talking with the fw through
these ringbuffers).

If you use one single-threaded wq for everything then you don't need
additional locking anymore, and a lot of things become easier.

We should definitely document this trick better though, I didn't find any
place where that was documented.

Maybe a new overview section about "how to concurrency with drm/sched"?
That's also a good place to better highlight the existing documentation
for the 2nd part here.

> >   * @num_rqs: Number of run-queues. This may be at most DRM_SCHED_PRIORITY_COUNT,
> >   *	     as there's usually one run-queue per priority, but may be less.
> >   * @credit_limit: the number of credits this scheduler can hold from all jobs
> >   * @hang_limit: number of times to allow a job to hang before dropping it.
> >   *		This mechanism is DEPRECATED. Set it to 0.
> >   * @timeout: timeout value in jiffies for submitted jobs.
> > - * @timeout_wq: workqueue to use for timeout work. If NULL, the system_wq is used.
> > + * @timeout_wq: workqueue to use for timeout work. If NULL, the system_wq is
> > + *		used. It is recommended to pass NULL unless there is a good
> > + *		reason not to.
> 
> Well, that's a rather bad idea.
> 
> Using a the same single threaded work queue for the timeout of multiple
> schedulers instances has the major advantage of being able to handle
> their occurrence sequentially.
> 
> In other words multiple schedulers post their timeout work items on the
> same queue, the first one to run resets the specific HW block in
> question and cancels all timeouts and work items from other schedulers
> which use the same HW block.
> 
> It was Sima, I and a few other people who came up with this approach
> because both amdgpu and IIRC panthor implemented that in their own
> specific way, and as usual got it wrong.
> 
> If I'm not completely mistaken this approach is now used by amdgpu,
> panthor, xe and imagination and has proven to be rather flexible and
> reliable. It just looks like we never documented that you should do it
> this way.

It is documented, just not here. See the note in
drm_sched_backend_ops.timedout_job at the very bottom.

We should definitely have a lot more cross-links between the various
pieces of this puzzle though, that's for sure :-)

Cheers, Sima

> 
> Regards,
> Christian.
> 
> >   * @score: score atomic shared with other schedulers. May be NULL.
> >   * @name: name (typically the driver's name). Used for debugging
> >   * @dev: associated device. Used for debugging
> 

-- 
Simona Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
