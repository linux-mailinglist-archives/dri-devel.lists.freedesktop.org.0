Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BFEA9849428
	for <lists+dri-devel@lfdr.de>; Mon,  5 Feb 2024 08:03:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BA4871123EC;
	Mon,  5 Feb 2024 07:03:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="Hx7/S8BN";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com
 [209.85.218.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7D9F91123ED
 for <dri-devel@lists.freedesktop.org>; Mon,  5 Feb 2024 07:03:14 +0000 (UTC)
Received: by mail-ej1-f50.google.com with SMTP id
 a640c23a62f3a-a2f22bfb4e6so544188166b.0
 for <dri-devel@lists.freedesktop.org>; Sun, 04 Feb 2024 23:03:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1707116590; x=1707721390; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=SmODjWl9XxT/MZiATDetkZp8pVHFQ7zqqtGcepJ25ro=;
 b=Hx7/S8BNes+LX7IMRVPAjJTnVtX2e4I9WT85g3R/NUNgsYSKyVUZuAm5CmmPIQP62K
 XJ8z4z+gHdJ3LVEa1X4Wlhj1x3npkQwHUafLULwfowbcjJB16/Axhq8LMUauNbYk68kc
 b4iGcdqryYumYHpG4lEABj7n3iA1ljKDjcUBTA5qGYZdsB8/uft9z46mj0ByqYEEAbiA
 TEGwJnJcC4vvjYxOnEJRHoqnahQIKdJvRr17zWX9Klhdm1zcrV37pLCOSs34+YEUSZHq
 VeGXMlw//5N6weBvNDZx6tpVSYsTGUdZ/9RGGJFayxlLQkUrZ0Gj1Z9xbphPYC+PLljp
 a/Zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1707116590; x=1707721390;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=SmODjWl9XxT/MZiATDetkZp8pVHFQ7zqqtGcepJ25ro=;
 b=rTkUgnwhCJ5tRmrjKM6ZwS6fLpv55aRCdPTHg9y0iVJIWrvQrlevwt4k6k4UqgBUic
 xEdU7ulB+qth/Bo4UJHhjBVanx7RqzAr8HZq2JmSQyTmoG9FNRNWwWEny9RuwaePUu9q
 tEwKMNsjQfradEeMFo+TDPSOqHj0N2dF2SRrkEgp+G8N8v2rPy5xPsOM25Oq+ggKcgf9
 AIdW9a6wJ1WTTXG7ePg8yKRetCtI1ZppedyPr+rWK+AvAheHqWCFTyu/Xaf/XsInEZRh
 er5upjGlX6HmRAekqr9ohGGe217os+ibKpHGmRvE1m1nAwnGPrVXuz3D7skiCEoUOPq/
 4wfg==
X-Gm-Message-State: AOJu0YyWkOVxfclyXU2PAo8Xj2foNZ+aEi7p3jOkkbVDH4SZ59hk33Vm
 FTWyQumjjHsdN+2g35klVib36iE0B9vqVedhcrGWqlgKdplHbKxGVi/XjgM7MLiupNYyGJhJtTA
 HsBLamPiTsze93NUFaSjTq1BDscCWPzfaZq4=
X-Google-Smtp-Source: AGHT+IE4uSKWUY1Kd2JanzsmRAU3KZvSr9WlJ+DN9wDhfPPzNWneoOpZnACdKmTI2b9b/FyGk/HNwrDj27xo/Odx+Ng=
X-Received: by 2002:a17:906:e2c7:b0:a37:b331:da3c with SMTP id
 gr7-20020a170906e2c700b00a37b331da3cmr1494299ejb.27.1707116589995; Sun, 04
 Feb 2024 23:03:09 -0800 (PST)
MIME-Version: 1.0
References: <20231019135655.313759-1-jfalempe@redhat.com>
 <660c0260-0e22-4e9c-ab13-157adaa0b14d@suse.de>
 <74b367bd-ac80-478b-8f82-e98cb6e40475@redhat.com>
 <f19a2cb4-57b6-427c-b69c-47a848420530@redhat.com>
In-Reply-To: <f19a2cb4-57b6-427c-b69c-47a848420530@redhat.com>
From: Dave Airlie <airlied@gmail.com>
Date: Mon, 5 Feb 2024 17:02:58 +1000
Message-ID: <CAPM=9twkLUFP+4aeKt+BRi4sO1c3hypq-dD33JKabHVQZ3oV9A@mail.gmail.com>
Subject: Re: [PATCH] drm/mgag200: Flush the cache to improve latency
To: Jocelyn Falempe <jfalempe@redhat.com>
Cc: Thomas Zimmermann <tzimmermann@suse.de>, dri-devel@lists.freedesktop.org, 
 airlied@redhat.com, daniel@ffwll.ch, 
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
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

On Mon, 6 Nov 2023 at 20:47, Jocelyn Falempe <jfalempe@redhat.com> wrote:
>
> On 23/10/2023 10:30, Jocelyn Falempe wrote:
> > On 20/10/2023 14:06, Thomas Zimmermann wrote:
> >> (cc'ing lkml for feedback)
> >>
> >> Hi Jocelyn
> >>
> >> Am 19.10.23 um 15:55 schrieb Jocelyn Falempe:
> >>> We found a regression in v5.10 on real-time server, using the
> >>> rt-kernel and the mgag200 driver. It's some really specialized
> >>> workload, with <10us latency expectation on isolated core.
> >>> After the v5.10, the real time tasks missed their <10us latency
> >>> when something prints on the screen (fbcon or printk)
> >>
> >> I'd like to hear the opinion of the RT-devs on this patch. Because
> >> AFAIK we never did such a workaround in other drivers. And AFAIK
> >> printk is a PITA anyway.
> >
> > Most other drivers uses DMA, which means this workaround can't apply to
> > them.
> >
> >>
> >> IMHO if that RT system cannot handle differences in framebuffer
> >> caching, it's under-powered. It's just a matter of time until
> >> something else changes and the problem returns. And (honest question)
> >> as it's an x86-64, how do they handle System Management Mode?
> >
> > I think it's not a big news, that the Matrox G200 from 1999 is
> > under-powered.
> > I was also a bit surprised that flushing the cache would have such
> > effect on latency. The tests we are doing can run 24h with the
> > workaround, without any interrupt taking more than 10us. Without the
> > workaround, every ~30s the interrupt failed its 10us target.
> >
> >>
> >>>
> >>> The regression has been bisected to 2 commits:
> >>> 0b34d58b6c32 ("drm/mgag200: Enable caching for SHMEM pages")
> >>> 4862ffaec523 ("drm/mgag200: Move vmap out of commit tail")
> >>>
> >>> The first one changed the system memory framebuffer from Write-Combine
> >>> to the default caching.
> >>> Before the second commit, the mgag200 driver used to unmap the
> >>> framebuffer after each frame, which implicitly does a cache flush.
> >>> Both regressions are fixed by the following patch, which forces a
> >>> cache flush after each frame, reverting to almost v5.9 behavior.
> >>
> >> With that second commit, we essentially never unmap an active
> >> framebuffer console. But with commit
> >>
> >> 359c6649cd9a ("drm/gem: Implement shadow-plane {begin, end}_fb_access
> >> with vmap")
> >>
> >> we now again unmap the console framebuffer after the pageflip happened.
> >>
> >> So how does the latest kernel behave wrt to the problem?
> >
> > The regression was found when upgrading the server from v5.4 to v5.14,
> > so we didn't test with later kernels.
> > We will test with v6.3 (which should have 359c6649cd9a ) and see what it
> > gives.
>
> I don't have a clear explanation, but testing with v6.3, and forcing the
> Write Combine, doesn't fix the latency issue. So forcing the cache flush
> is still needed.
>
> Also, on some systems, they use "isolated cpu" to handle RT task, but
> with a standard kernel (so without the CONFIG_PREEMPT_RT).
> So I'm wondering if we can use a kernel module parameter for this,
> so that users that wants to achieve low latency, can opt-in ?
>
> something like mgag200.force_cache_flush=1 or mgag200.low_latency=1 ?

I think we should either add a config option or command line parameter here.

I'd don't think adding nopat to the kernel command line is a good
suggestion in the long run, servers often have other cards plugged
into them like nvidia gpus or rdma etc, you don't want to cripple them
because you want reduced latency on the crappy on-board.

I'd rather we put the default back to what it used to be, which was
flush the cache though, I'm not sure why we have any objection to
doing that, it used to work, it was clearly fine in operation, why
undo it?

Dave.
