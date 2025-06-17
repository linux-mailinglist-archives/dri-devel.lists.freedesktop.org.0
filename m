Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D3549ADCF98
	for <lists+dri-devel@lfdr.de>; Tue, 17 Jun 2025 16:25:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3B44710E494;
	Tue, 17 Jun 2025 14:25:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; secure) header.d=ffwll.ch header.i=@ffwll.ch header.b="GzSIeVU2";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com
 [209.85.221.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EBA3510E494
 for <dri-devel@lists.freedesktop.org>; Tue, 17 Jun 2025 14:25:12 +0000 (UTC)
Received: by mail-wr1-f52.google.com with SMTP id
 ffacd0b85a97d-3a36748920cso6819431f8f.2
 for <dri-devel@lists.freedesktop.org>; Tue, 17 Jun 2025 07:25:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google; t=1750170311; x=1750775111; darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:mime-version:references
 :mail-followup-to:message-id:subject:cc:to:from:date:from:to:cc
 :subject:date:message-id:reply-to;
 bh=XXt3dy96emDfUbi5YZOyss2yuwnnqq07rcmYyztRQSY=;
 b=GzSIeVU2X2tqrfIgVOMqcsyJJto4n6VLyU2gdPNMIkbHxJONNqjKlKYqdU3q2Yd6ZP
 poe7yhuuGHTivg7pYnXZhTt+3jr4qVWp/umureerL/ifqZrYRtdx40bERITmKUQucadJ
 DxzHLSajHvdXM64lw+Kn+ZAG/gA+on1Glz17o=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1750170311; x=1750775111;
 h=in-reply-to:content-disposition:mime-version:references
 :mail-followup-to:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=XXt3dy96emDfUbi5YZOyss2yuwnnqq07rcmYyztRQSY=;
 b=lZ/4DCMOjBufwSnx9Jh31Gi/6Pcm8aOgpU9pz+wNCXbOkgkN9jVaKwn/X51JQPjsWD
 WwaYjlPdlI+h2PLhS1Ezq3Nnr0ro/McD0tdq4SegaVuqaup12bwopYoKjYlLFiKRHPbv
 CEHBWJxDrnvvUjH6BhaFNVatySCID6wxeEHr8rShQP9GksvlCMVN9M54RtCGTHTSi4ok
 bOwJji8+lvr5E0Xam+s62lzFEaEooFobjKPmXQnt/+VNcqjT2v1iehxyNaQtcG4lt4Hy
 m7UdtATzJVjDxk0eNHz+NhsAhh+VpT7UlT+AvC9h4X5xrOpGeirVdHp6txkXG9F+4nc0
 e7xw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVXqjJlyBIE/IhoOePf8+CMmdE4+QUOh5KrUCRdZBBeWttxAzKUezar3tZh1nNvlcROdBxPWHEE2pE=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyifOKG5KDUsn+u4iWpwfFYhb9C7K9mt5hbuU6yZgVV9hwLMrxU
 4Jq5bXAXCqCXmQs1MhqW18TTsBE1bsxUYvf8znFUgr7yNWWQvdANRskZkPowGr0QnOo=
X-Gm-Gg: ASbGnctP1vBsragzsnU0umJc9O+3RfM6dYFgb0mQue+FIQZPxKXJZwJfhRRJ30OpTX1
 7ocXwhPk6eUIgfckJGFdtLgE1HqIbiDJau55YU81CUD5LTxyIIX1DxsCNDugsHzBOyizaIUYqcr
 VNxhvhPkBNSLzmFd1TgF6QecvSNZ9iF+PrerTG1X/5s0u2Fuj2pLZChqssjB4j1aetOehtr5ThY
 hlTUe7oD6xG9VS8V+FvW+ojYFktgsr1/0a2EP9HxDRwz/JFad1xzf+6rxFGZDo1sjB9+rnFbRS3
 W/KlCo7iwRbrsnpCGxiVsboPSRvIcHcvIsahYKve42kvzj+LXXYJcuGia+pfk7rgSuXHeesq+w=
 =
X-Google-Smtp-Source: AGHT+IEbdYZbQa6vrYSOaM4WdmPVqMOqkP9lVIxOcii3jXSSMba4JKehblrgcpHlbRQBeXzMM6KpFQ==
X-Received: by 2002:a5d:64ee:0:b0:3a4:e1e1:7779 with SMTP id
 ffacd0b85a97d-3a5723a2be9mr10791911f8f.32.1750170311421; 
 Tue, 17 Jun 2025 07:25:11 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:5485:d4b2:c087:b497])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3a568b1bc97sm14245947f8f.68.2025.06.17.07.25.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 17 Jun 2025 07:25:10 -0700 (PDT)
Date: Tue, 17 Jun 2025 16:25:09 +0200
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
Message-ID: <aFF6xeu78cXTGFH0@phenom.ffwll.local>
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
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aFF3YIAFkgsAKvQV@pollux>
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

On Tue, Jun 17, 2025 at 04:10:40PM +0200, Danilo Krummrich wrote:
> On Tue, Jun 17, 2025 at 03:51:33PM +0200, Simona Vetter wrote:
> > On Thu, Jun 12, 2025 at 04:49:54PM +0200, Philipp Stanner wrote:
> > > + * NOTE that sharing &struct drm_sched_init_args.submit_wq with the driver
> > > + * theoretically can deadlock. It must be guaranteed that submit_wq never has
> > > + * more than max_active - 1 active tasks, or if max_active tasks are reached at
> > > + * least one of them does not execute operations that may block on dma_fences
> > > + * that potentially make progress through this scheduler instance. Otherwise,
> > > + * it is possible that all max_active tasks end up waiting on a dma_fence (that
> > > + * can only make progress through this schduler instance), while the
> > > + * scheduler's queued work waits for at least one of the max_active tasks to
> > > + * finish. Thus, this can result in a deadlock.
> > 
> > Uh if you have an ordered wq you deadlock with just one misuse. I'd just
> > explain that the wq must provide sufficient forward-progress guarantees
> > for the scheduler, specifically that it's on the dma_fence signalling
> > critical path and leave the concrete examples for people to figure out
> > when the design a specific locking scheme.
> 
> This isn't a concrete example, is it? It's exactly what you say in slightly
> different words, with the addition of highlighting the impact of the workqueue's
> max_active configuration.
> 
> I think that's relevant, because N - 1 active tasks can be on the dma_fence
> signalling critical path without issues.
> 
> We could change
> 
> 	"if max_active tasks are reached at least one of them must not execute
> 	 operations that may block on dma_fences that potentially make progress
> 	 through this scheduler instance"
> 
> to 
> 
> 	"if max_active tasks are reached at least one of them must not be on the
> 	 dma_fence signalling critical path"
> 
> which is a bit more to the point I think.

My point was to more state that the wq must be suitable for the scheduler
jobs as the general issue, and specifically then also highlight the
dma_fence concurrency issue. But it's not the only one, you can have
driver locks and other fun involved here too.

Also since all the paragraphs above talk about ordered wq as the example
where specifying your own wq makes sense, it's a bit confusing to now
suddenly only talk about the concurrent wq case without again mentioned
that the ordered wq case is really limited.
-Sima
-- 
Simona Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
