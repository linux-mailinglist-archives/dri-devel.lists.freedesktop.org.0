Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 292FEADEEC9
	for <lists+dri-devel@lfdr.de>; Wed, 18 Jun 2025 16:06:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8619010E84E;
	Wed, 18 Jun 2025 14:06:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; secure) header.d=ffwll.ch header.i=@ffwll.ch header.b="DSIgYziZ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com
 [209.85.221.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7CB9E10E1EB
 for <dri-devel@lists.freedesktop.org>; Wed, 18 Jun 2025 14:06:46 +0000 (UTC)
Received: by mail-wr1-f50.google.com with SMTP id
 ffacd0b85a97d-3a52874d593so6691563f8f.0
 for <dri-devel@lists.freedesktop.org>; Wed, 18 Jun 2025 07:06:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google; t=1750255605; x=1750860405; darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:mime-version:references
 :mail-followup-to:message-id:subject:cc:to:from:date:from:to:cc
 :subject:date:message-id:reply-to;
 bh=BCz4xhVEuMZq7I5JmKa8hUWG+eHQFPySS2ntysLkYhI=;
 b=DSIgYziZs9Zc2Lt2wDZUf5I/saYXtIasgTTP53h/H9VYhZ+6yW1Pa/7pklw+h/hqa4
 Ak6JVSmtdav/QzdJhc0AH1PL3inP3aEtFJZ7LTc50OW/gONthOgpgavsrgTM34opsLCj
 tuR4+vpKsIiJ4iEPoL5dcqZAOwV9BgJrgBw68=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1750255605; x=1750860405;
 h=in-reply-to:content-disposition:mime-version:references
 :mail-followup-to:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=BCz4xhVEuMZq7I5JmKa8hUWG+eHQFPySS2ntysLkYhI=;
 b=lG6CT6gQ15Edza4JTeodoK8Goxu9L1b2rR5FPFX53OXbUWbLCeMDgcajGKf3/B0eXA
 S7GTLiSURyjVGivoeEGU6hUxTTt9KQEftHU++vXSkKpAm2tJT/L2rVXefxEGI5vpom0x
 N1pB0XJTjJ7CbcbKOnMc4r1O3ql6ipeqNa+w6N/CBGFzVycYc3O7TAeZwHV1nnJzN+rL
 P7yjFV2JVYtn+RvMX9GgfTvWuxFtQmEZQt+i3J9PjoAuZVe4HqDRlRmBmj2CAMTPsC1b
 lJl1UUxl4FX3osSFa7kADi6HXZo42DQ97UAlYKt1gQkLd8XmuDLRZPk3a1Sej4Ifuj25
 SvyQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUx2CkAweLJDJZPJdKzYgpYJ9wrqT19tQDeQih8uVWNiXj4WgCdUnqhwweB3ATtG6kUAhq3xb3Z1wA=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxPxCyz72BS+l+CYJFQMMZ3rhIdSrhIft4A0RiQcnhNiYHlqAjy
 H44t/S3jjmCUUsGvdNGKPxPjj7tOlL3W27fccuSjsK3RelsbelSxAzMpIHo0zjbmHZw=
X-Gm-Gg: ASbGncuMWp9A9YgGlIZRfYRUb+t1Rl7EoWNMdhjLmOPbteW1naW4Hu9P3l5DjW0hdRN
 JLjI5QcaplMIxn7eM9EJSgx3G3GOuRsafuU+p1ISySSL8G3YtuyvITvMDaxscHkMr27yTc4fkbM
 CH03hMNquF2XsU5n2Wa3KHTkjYfZ7WrVpkvhtNx6QabAGug445kcHRTI1kqnzE8jiarcCADgUyd
 yO0unvIpgbA3jhWk1lgmUm5z9/fvFPgkDpqOxxNAQcDYw+K2/p2EWiWR0eYA7sNWt1hG/eK36ja
 C68eDYyQ5loLvDQ1PxkKBUrQFY6OYb8R00lBpnpylLfGvC9S/pCcTDImYTIZamk0Jp/GvCqrlg=
 =
X-Google-Smtp-Source: AGHT+IHBs3duxJoTqq/WKMIDJsARyVHA9luTU8eetiw/0sqRdC35N2eZTCPFDaMYdyL/wiDxrA95lA==
X-Received: by 2002:a05:6000:4282:b0:3a4:e60a:c409 with SMTP id
 ffacd0b85a97d-3a5723aecd1mr12354467f8f.41.1750255604366; 
 Wed, 18 Jun 2025 07:06:44 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:5485:d4b2:c087:b497])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4532e268de2sm209233415e9.40.2025.06.18.07.06.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 18 Jun 2025 07:06:43 -0700 (PDT)
Date: Wed, 18 Jun 2025 16:06:41 +0200
From: Simona Vetter <simona.vetter@ffwll.ch>
To: Danilo Krummrich <dakr@kernel.org>
Cc: Philipp Stanner <phasta@kernel.org>,
 Matthew Brost <matthew.brost@intel.com>,
 Christian =?iso-8859-1?Q?K=F6nig?= <ckoenig.leichtzumerken@gmail.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Sumit Semwal <sumit.semwal@linaro.org>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org
Subject: Re: [PATCH v2] drm/sched: Clarify scenarios for separate workqueues
Message-ID: <aFLH8Us_e_U6gNHV@phenom.ffwll.local>
Mail-Followup-To: Danilo Krummrich <dakr@kernel.org>,
 Philipp Stanner <phasta@kernel.org>,
 Matthew Brost <matthew.brost@intel.com>,
 Christian =?iso-8859-1?Q?K=F6nig?= <ckoenig.leichtzumerken@gmail.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Sumit Semwal <sumit.semwal@linaro.org>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org
References: <20250612144953.111829-2-phasta@kernel.org>
 <aFFy5aG1eOeMU44S@phenom.ffwll.local> <aFF3YIAFkgsAKvQV@pollux>
 <aFF6xeu78cXTGFH0@phenom.ffwll.local> <aFGFCc7eiZJM8RKM@pollux>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aFGFCc7eiZJM8RKM@pollux>
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

On Tue, Jun 17, 2025 at 05:08:57PM +0200, Danilo Krummrich wrote:
> On Tue, Jun 17, 2025 at 04:25:09PM +0200, Simona Vetter wrote:
> > On Tue, Jun 17, 2025 at 04:10:40PM +0200, Danilo Krummrich wrote:
> > > On Tue, Jun 17, 2025 at 03:51:33PM +0200, Simona Vetter wrote:
> > > > On Thu, Jun 12, 2025 at 04:49:54PM +0200, Philipp Stanner wrote:
> > > > > + * NOTE that sharing &struct drm_sched_init_args.submit_wq with the driver
> > > > > + * theoretically can deadlock. It must be guaranteed that submit_wq never has
> > > > > + * more than max_active - 1 active tasks, or if max_active tasks are reached at
> > > > > + * least one of them does not execute operations that may block on dma_fences
> > > > > + * that potentially make progress through this scheduler instance. Otherwise,
> > > > > + * it is possible that all max_active tasks end up waiting on a dma_fence (that
> > > > > + * can only make progress through this schduler instance), while the
> > > > > + * scheduler's queued work waits for at least one of the max_active tasks to
> > > > > + * finish. Thus, this can result in a deadlock.
> > > > 
> > > > Uh if you have an ordered wq you deadlock with just one misuse. I'd just
> > > > explain that the wq must provide sufficient forward-progress guarantees
> > > > for the scheduler, specifically that it's on the dma_fence signalling
> > > > critical path and leave the concrete examples for people to figure out
> > > > when the design a specific locking scheme.
> > > 
> > > This isn't a concrete example, is it? It's exactly what you say in slightly
> > > different words, with the addition of highlighting the impact of the workqueue's
> > > max_active configuration.
> > > 
> > > I think that's relevant, because N - 1 active tasks can be on the dma_fence
> > > signalling critical path without issues.
> > > 
> > > We could change
> > > 
> > > 	"if max_active tasks are reached at least one of them must not execute
> > > 	 operations that may block on dma_fences that potentially make progress
> > > 	 through this scheduler instance"
> > > 
> > > to 
> > > 
> > > 	"if max_active tasks are reached at least one of them must not be on the
> > > 	 dma_fence signalling critical path"
> > > 
> > > which is a bit more to the point I think.
> > 
> > My point was to more state that the wq must be suitable for the scheduler
> > jobs as the general issue, and specifically then also highlight the
> > dma_fence concurrency issue.
> 
> Sure, there are more guarantees the driver has to uphold, but this is one of
> them, so I think we should explain it.
> 
> > But it's not the only one, you can have driver locks and other fun involved
> > here too.
> 
> Yeah, but it boils down to the same issue, e.g. if a driver takes a lock in
> active work, and this lock is taken elsewhere for activities that violate the
> dma_fence signalling critical path.
> 
> All the cases I have in mind boil down to that we potentially, either directly
> or indirectly (through some synchronization primitive), wait for things we are
> not allowed to wait for in the dma_fence signalling critical path.
> 
> Or do you mean something different?

You could also grab a mutex in those driver work items that is held while
waiting for a dma_fence somewhere. The dma_fence annotations should catch
that, but at least in my reading of the text here it's not covered.

But my main point is what I explain below, the text fails to clearly
address the issues that all current drivers (maybe all reasonable drivers,
but sometimes I lack imagination) can encounter, so to me it's too generic
and not that directly applicable in practice. And then on the other hand
dma_fence is definitely the big thing, but fundamtentally you tie anything
you schedule on those wq to the drm/scheduler design in it's entirety. So
for the general rule, it's not generic enough for my taste.

> > Also since all the paragraphs above talk about ordered wq as the example
> > where specifying your own wq makes sense, it's a bit confusing to now
> > suddenly only talk about the concurrent wq case without again mentioned
> > that the ordered wq case is really limited.
> 
> I mean, it talks about both cases in a generic way, i.e. if you set
> max_active == 1 in the text it covers the ordered case.
> 
> Or do you mean to say that we should *only* allow ordered workqueues to be
> shared with the driver?

Both examples talk about ordered wq, they don't make any sense with
max_active > 1, and I can't come up with any example that would. So yeah
I'm leaning in that direction, at least in the docs. Only discussing
max_active > 1 for this specific issue is imo very confusing and not
helping much. I guess we could even WARN_ON if a provided wq is not
ordered, because that does smell funky for sure.

Cheers, Sima
-- 
Simona Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
