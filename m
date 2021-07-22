Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D9133D223D
	for <lists+dri-devel@lfdr.de>; Thu, 22 Jul 2021 12:47:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 45DE56EEA2;
	Thu, 22 Jul 2021 10:47:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x62e.google.com (mail-ej1-x62e.google.com
 [IPv6:2a00:1450:4864:20::62e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 478846EEA3
 for <dri-devel@lists.freedesktop.org>; Thu, 22 Jul 2021 10:47:06 +0000 (UTC)
Received: by mail-ej1-x62e.google.com with SMTP id hr1so7752188ejc.1
 for <dri-devel@lists.freedesktop.org>; Thu, 22 Jul 2021 03:47:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:mail-followup-to:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to; bh=UIjEw7LvBGrlUjquppZsCZAJs4MMNYvbssuJ9Tn9rvA=;
 b=BSbiykPnrXMqDFLWYOlZ+Xx9F86RQC4xFFGNJKrQva9H34djT58I60UA0c2ryP0wMY
 dQTMlwL7TZ+8OCgN8ZRAd5SpAQtoDzl5jb/O46f8bz9SLjuig5V0ZVlRUNdt8/szq8Jq
 4kgNG3kxl2U06Reo0PMNqg4flHxCgalyEb3wE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id
 :mail-followup-to:references:mime-version:content-disposition
 :content-transfer-encoding:in-reply-to;
 bh=UIjEw7LvBGrlUjquppZsCZAJs4MMNYvbssuJ9Tn9rvA=;
 b=s0PJo9gJyTIeTy1rC+5sEAuHH/4YeOa7Abyv2/VkDyTC0UUacZEm8JoLwx6eof/dj6
 iIpegMZBKTipENlmhCz19TSjtNx9pi4WHPJj9IT0Bdfo4ApKMN9yQAsnmkrgZl9br9ad
 K+I5VcZhnqPaApAnTosdvApvdjYXbNrctsu+3MN4OUiyfv0Hirofex6F+bEmBQZGjO2j
 hBFIZLf2PVQ9k/hkUPlct0UW6TlpkTNLxWOM9T7VmWUUfue2qQB9niUVVGFhbwdIdS8B
 ksYQcdykmd6oy41gdkRhlKVRBh47vAU1nO/87O0ySCjRtgSPRJ8TfwtyBBYjWTpN94Tu
 UpIA==
X-Gm-Message-State: AOAM532lAZIkMQjfkuG9xS4aDQsFwshkqOuTFiZFa2/HVNeZjdplBX9h
 tiJ4okDsmuJnZqyjNgMEAvIwAkJ8K/Y6kg==
X-Google-Smtp-Source: ABdhPJyWUvquD40hkzO6znrNFD5xu/fiLgEjV2e4u4CI8X3eyK2lLuG4uvvQqbM15R7qGLm57hx5bQ==
X-Received: by 2002:a17:906:538e:: with SMTP id
 g14mr23577022ejo.136.1626950824915; 
 Thu, 22 Jul 2021 03:47:04 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id gw8sm9336666ejb.44.2021.07.22.03.47.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 22 Jul 2021 03:47:04 -0700 (PDT)
Date: Thu, 22 Jul 2021 12:47:02 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Christian =?iso-8859-1?Q?K=F6nig?= <ckoenig.leichtzumerken@gmail.com>
Subject: Re: [Linaro-mm-sig] [PATCH] drm/msm: Add fence->wait() op
Message-ID: <YPlMpoGbXYKUFwCq@phenom.ffwll.local>
Mail-Followup-To: Christian =?iso-8859-1?Q?K=F6nig?=
 <ckoenig.leichtzumerken@gmail.com>, 
 Rob Clark <robdclark@gmail.com>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Rob Clark <robdclark@chromium.org>,
 "open list:DRM DRIVER FOR MSM ADRENO GPU" <freedreno@lists.freedesktop.org>,
 David Airlie <airlied@linux.ie>,
 "open list:DRM DRIVER FOR MSM ADRENO GPU" <linux-arm-msm@vger.kernel.org>,
 open list <linux-kernel@vger.kernel.org>,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
 "moderated list:DMA BUFFER SHARING FRAMEWORK" <linaro-mm-sig@lists.linaro.org>,
 Sean Paul <sean@poorly.run>,
 "open list:DMA BUFFER SHARING FRAMEWORK" <linux-media@vger.kernel.org>
References: <60ffb6f3-e932-d9af-3b90-81adf0c15250@gmail.com>
 <CAF6AEGtOW3EjZWo36ij8U1om=gAqvg8CSkJJq2GkyHFGWUH4kQ@mail.gmail.com>
 <CAKMK7uF1=Y6_9znGoWG8GrteXBBRmyW8C3bFE+eJQqOj0A1buA@mail.gmail.com>
 <CAF6AEGsOVPdMkXwU9C+nDfQpPThveJ2A0jbXi43RRkkJKtnz3w@mail.gmail.com>
 <CAKMK7uHMXFqic=9APJrSf6totB8nGZTDe4x8+sv-drmV4Q+4Bg@mail.gmail.com>
 <CAF6AEGsKoucxt4a2pcdQM9+L0+YU-6TcAt8eF=3ur169646Jhw@mail.gmail.com>
 <YPhvein5e8do2AR+@phenom.ffwll.local>
 <113b5858-9020-d1c1-292b-96b7f9cc717a@gmail.com>
 <YPk1izQFR+tRV8js@phenom.ffwll.local>
 <9c1e797b-8860-d1f5-e6f2-e06380ec9012@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <9c1e797b-8860-d1f5-e6f2-e06380ec9012@gmail.com>
X-Operating-System: Linux phenom 5.10.0-7-amd64 
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
Cc: Rob Clark <robdclark@chromium.org>, David Airlie <airlied@linux.ie>,
 "open list:DRM DRIVER FOR MSM ADRENO GPU" <linux-arm-msm@vger.kernel.org>,
 open list <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 "moderated list:DMA BUFFER SHARING FRAMEWORK" <linaro-mm-sig@lists.linaro.org>,
 Sean Paul <sean@poorly.run>,
 "open list:DRM DRIVER FOR MSM ADRENO GPU" <freedreno@lists.freedesktop.org>,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
 "open list:DMA BUFFER SHARING FRAMEWORK" <linux-media@vger.kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Jul 22, 2021 at 11:28:01AM +0200, Christian König wrote:
> Am 22.07.21 um 11:08 schrieb Daniel Vetter:
> > [SNIP]
> > > As far as I know wake_up_state() tries to run the thread on the CPU it was
> > > scheduled last, while wait_event_* makes the thread run on the CPU who
> > > issues the wake by default.
> > > 
> > > And yes I've also noticed this already and it was one of the reason why I
> > > suggested to use a wait_queue instead of the hand wired dma_fence_wait
> > > implementation.
> > The first versions had used wait_queue, but iirc we had some issues with
> > the callbacks and stuff and that was the reasons for hand-rolling. Or
> > maybe it was the integration of the lockless fastpath for
> > dma_fence_is_signalled().
> > 
> > > [SNIP]
> > > Well it would have been nicer if we used the existing infrastructure instead
> > > of re-inventing stuff for dma_fence, but that chance is long gone.
> > > 
> > > And you don't need a dma_fence_context base class, but rather just a flag in
> > > the dma_fence_ops if you want to change the behavior.
> > If there's something broken we should just fix it, not force everyone to
> > set a random flag. dma_fence work like special wait_queues, so if we
> > differ then we should go back to that.
> 
> Wait a second with that, this is not broken. It's just different behavior
> and there are good arguments for both sides.

Oh I know, but since dma_fence is meant to be a wait_queue with hw
support, they really should work the same and have the same tuning.

> If a wait is short you can have situations where you want to start the
> thread on the original CPU.
>     This is because you can assume that the caches on that CPU are still hot
> and heating up the caches on the local CPU would take longer than an inter
> CPU interrupt.
> 
> But if the wait is long it makes more sense to run the thread on the CPU
> where you noticed the wake up event.
>     This is because you can assume that the caches are cold anyway and
> starting the thread on the current CPU (most likely from an interrupt
> handler) gives you the absolutely best latency.
>     In other words you usually return from the interrupt handler and just
> directly switch to the now running thread.
> 
> I'm not sure if all drivers want the same behavior. Rob here seems to prefer
> number 2, but we have used 1 for dma_fence for a rather long time now and it
> could be that some people start to complain when we switch unconditionally.

I think the defaults are different because usually if you wake up a wait
queue, there's a 1:1 relationship between waker and waiter.

Otoh if you just wake a thread it's probably some kinda of service thread,
so N:1 relationship between waker and waiter. And in that case moving the
waiter is a really bad idea.

I think dma_fence is generally much closer to 1:1 (with the most common
one irq handler -> scheduler thread for that engine), so having the "same
cpu" wake behaviour really sounds like the right thing to do. And not
anything that is specifically an issue with how qualcom gpus work, and
hence should be msm specific.

If it turns out to be the wrong thing, well I guess we'll learn
something. And then maybe we have a different version of dma_fence_wait.
-Daniel
-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
