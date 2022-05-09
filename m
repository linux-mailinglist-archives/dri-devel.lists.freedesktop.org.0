Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A12A651FF2B
	for <lists+dri-devel@lfdr.de>; Mon,  9 May 2022 16:11:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8A0BE10F1E3;
	Mon,  9 May 2022 14:11:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x62f.google.com (mail-ej1-x62f.google.com
 [IPv6:2a00:1450:4864:20::62f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6ADAC10F1E3
 for <dri-devel@lists.freedesktop.org>; Mon,  9 May 2022 14:11:03 +0000 (UTC)
Received: by mail-ej1-x62f.google.com with SMTP id ks9so20655260ejb.2
 for <dri-devel@lists.freedesktop.org>; Mon, 09 May 2022 07:11:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=YAoxFHFRM8IxH//rl2E1kRzGQfqjVgqislcI54PaMRE=;
 b=NVM+IF4sAq0pa7DJ5guFchnH9ankeuEs4ibAokSj9n9jCVYFWiu9Z3P05XucwG8WuJ
 G12ZT6+TeBycSRZCcRHqsGSg21awPboH317dXXstBoUiBg1u4nuJxc82I/2IzGe+PDIc
 Zn2/vMc6O2/jz4dZ0hPSIrauotcRRaOqFeb8o=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=YAoxFHFRM8IxH//rl2E1kRzGQfqjVgqislcI54PaMRE=;
 b=IXdr45K72KAjxYXkj3FhbChO7EFJTBlqHo5XflsCWYFSIBviwOYS8X78XMDQ6A5ubd
 CyJ/EkX+Ge58/vreJCSXdLd4ghWhR/wewEJ+6treMHbCtBsQ1lz5wSabNLewzObS/bhP
 tvglM0kylZB9GKHkxWO1UgaWXydvSNKnFpMO+tTcFcXTPo4/6tQ53izzIoDKfkk8/pgH
 cwU7GHxRKmZvwU2S5LeCn2xWz/3QypEA5HeUhGIaGASuS8GI/YinTfZshLw2yxSDo5x9
 K8x0/RW9TRo3EjVZlWZFjesSgK08mgx+7f9IZvAK4MGzz0LrCAa8221u6qpNxW0pFyg3
 GNQw==
X-Gm-Message-State: AOAM533ILAsLgxtYvfQd31P8JF6ufb27MbM/2Kch1wc6BcvyfaRe7YRa
 bzWMIQF5cMA6AsMIQTbt2GAKaw==
X-Google-Smtp-Source: ABdhPJy3c8FTR+UJLWgJvIV2jp0CoaWmRyQ/dDVLC9/TpZNgwGriaa43NPahAaje5AnLQbly7HOA0w==
X-Received: by 2002:a17:907:6e2a:b0:6f4:69bb:7ef6 with SMTP id
 sd42-20020a1709076e2a00b006f469bb7ef6mr14346018ejc.0.1652105461812; 
 Mon, 09 May 2022 07:11:01 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id
 e1-20020a1709062c0100b006f3ef214dafsm5081920ejh.21.2022.05.09.07.11.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 09 May 2022 07:11:01 -0700 (PDT)
Date: Mon, 9 May 2022 16:10:59 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Christian =?iso-8859-1?Q?K=F6nig?= <ckoenig.leichtzumerken@gmail.com>
Subject: Re: Tackling the indefinite/user DMA fence problem
Message-ID: <Ynkg81p6ADyZBa/L@phenom.ffwll.local>
References: <20220502163722.3957-1-christian.koenig@amd.com>
 <YnJQs1iusrBvpuMs@phenom.ffwll.local>
 <a01c7703-f7f7-f8ce-f80e-632a6fdcbbbe@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <a01c7703-f7f7-f8ce-f80e-632a6fdcbbbe@gmail.com>
X-Operating-System: Linux phenom 5.10.0-8-amd64 
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
Cc: tvrtko.ursulin@linux.intel.com, sergemetral@google.com, tzimmermann@suse.de,
 gustavo@padovan.org, Felix.Kuehling@amd.com, linux-media@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org,
 jason@jlekstrand.net, alexander.deucher@amd.com, daniels@collabora.com,
 skhawaja@google.com, sumit.semwal@linaro.org, maad.aldabagh@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, May 09, 2022 at 08:56:41AM +0200, Christian König wrote:
> Am 04.05.22 um 12:08 schrieb Daniel Vetter:
> > On Mon, May 02, 2022 at 06:37:07PM +0200, Christian König wrote:
> > > Hello everyone,
> > > 
> > > it's a well known problem that the DMA-buf subsystem mixed
> > > synchronization and memory management requirements into the same
> > > dma_fence and dma_resv objects. Because of this dma_fence objects need
> > > to guarantee that they complete within a finite amount of time or
> > > otherwise the system can easily deadlock.
> > > 
> > > One of the few good things about this problem is that it is really good
> > > understood by now.
> > > 
> > > Daniel and others came up with some documentation:
> > > https://dri.freedesktop.org/docs/drm/driver-api/dma-buf.html?highlight=dma_buf#indefinite-dma-fences
> > > 
> > > And Jason did an excellent presentation about that problem on last years
> > > LPC: https://lpc.events/event/11/contributions/1115/
> > > 
> > > Based on that we had been able to reject new implementations of
> > > infinite/user DMA fences and mitigate the effect of the few existing
> > > ones.
> > > 
> > > The still remaining down side is that we don't have a way of using user
> > > fences as dependency in both the explicit (sync_file, drm_syncobj) as
> > > well as the implicit (dma_resv) synchronization objects, resulting in
> > > numerous problems and limitations for things like HMM, user queues
> > > etc....
> > > 
> > > This patch set here now tries to tackle this problem by untangling the
> > > synchronization from the memory management. What it does *not* try to do
> > > is to fix the existing kernel fences, because I think we now can all
> > > agree on that this isn't really possible.
> > > 
> > > To archive this goal what I do in this patch set is to add some parallel
> > > infrastructure to cleanly separate normal kernel dma_fence objects from
> > > indefinite/user fences:
> > > 
> > > 1. It introduce a DMA_FENCE_FLAG_USER define (after renaming some
> > > existing driver defines). To note that a certain dma_fence is an user
> > > fence and *must* be ignore by memory management and never used as
> > > dependency for normal none user dma_fence objects.
> > > 
> > > 2. The dma_fence_array and dma_fence_chain containers are modified so
> > > that they are marked as user fences whenever any of their contained
> > > fences are an user fence.
> > > 
> > > 3. The dma_resv object gets a new DMA_RESV_USAGE_USER flag which must be
> > > used with indefinite/user fences and separates those into it's own
> > > synchronization domain.
> > > 
> > > 4. The existing dma_buf_poll_add_cb() function is modified so that
> > > indefinite/user fences are included in the polling.
> > > 
> > > 5. The sync_file synchronization object is modified so that we
> > > essentially have two fence streams instead of just one.
> > > 
> > > 6. The drm_syncobj is modified in a similar way. User fences are just
> > > ignored unless the driver explicitly states support to wait for them.
> > > 
> > > 7. The DRM subsystem gains a new DRIVER_USER_FENCE flag which drivers
> > > can use to indicate the need for user fences. If user fences are used
> > > the atomic mode setting starts to support user fences as IN/OUT fences.
> > > 
> > > 8. Lockdep is used at various critical locations to ensure that nobody
> > > ever tries to mix user fences with non user fences.
> > > 
> > > The general approach is to just ignore user fences unless a driver
> > > stated explicitely support for them.
> > > 
> > > On top of all of this I've hacked amdgpu so that we add the resulting CS
> > > fence only as kernel dependency to the dma_resv object and an additional
> > > wrapped up with a dma_fence_array and a stub user fence.
> > > 
> > > The result is that the newly added atomic modeset functions now
> > > correctly wait for the user fence to complete before doing the flip. And
> > > dependent CS don't pipeline any more, but rather block on the CPU before
> > > submitting work.
> > > 
> > > After tons of debugging and testing everything now seems to not go up in
> > > flames immediately and even lockdep is happy with the annotations.
> > > 
> > > I'm perfectly aware that this is probably by far the most controversial
> > > patch set I've ever created and I really wish we wouldn't need it. But
> > > we certainly have the requirement for this and I don't see much other
> > > chance to get that working in an UAPI compatible way.
> > > 
> > > Thoughts/comments?
> > I think you need to type up the goal or exact problem statement you're
> > trying to solve first. What you typed up is a solution along the lines of
> > "try to stuff userspace memory fences into dma_fence and see how horrible
> > it all is", and that's certainly an interesting experiment, but what are
> > you trying to solve with it?
> 
> Well, good point. I explained to much how it works, but now why.
> 
> In general I would describe the goal as: Providing a standard kernel
> infrastructure for user fences.

So on that goal the part I fully agree on is that drm_syncobj can (and
should imo) be able to contain userspace memory fences. The uapi semantics
and everything is already fully set up to support that, but maybe with
reduced performance: Non-aware userspace (or when you don't trust the
supplier of the umf) needs to block when looking up the fence, and the
dma_fence returned will always be signalled already. But that's just a
mild performance issue (and vk drivers paper over that already with
threading) and not a correctness issue.

> > Like if the issue is to enable opencl or whatever, then that's no problem
> > (rocm on amdkfd is a thing, same maybe without the kfd part can be done
> > anywhere else). If the goal is to enable userspace memory fences for vk,
> > then we really don't need these everywhere, but really only in drm_syncobj
> > (and maybe sync_file).
> 
> Yes, having an in kernel representation for vk user space fences is one of
> the goals.
> 
> And I was going back and forth if I should rather come up with a new
> structure for this or use the existing dma_fence with a flag as well.
> 
> I've decided to go down the later router because we have quite a lot of
> existing functionality which can be re-used. But if you have a good argument
> that it would be more defensive to come up with something completely new,
> I'm perfectly fine with that as well.

Yeah so stuffing that into dma_fence already freaks me out a bit. It is
quite fundamentally a different thing, and it would be really nice to make
that very apparent at the type level too.

E.g. to make sure you never ever end up with an umf fence in mmu notifier
invalidate callback. You can enforce that with runtime checks too, but imo
compile time fail is better than runtime fail.

> > If the goal is specifically atomic kms, then there's an entire can of
> > worms there that I really don't want to think about, but it exists: We
> > have dma_fence as out-fences from atomic commit, and that's already
> > massively broken since most drivers allocate some memory or at least take
> > locks which can allocate memory in their commit path. Like i2c. Putting a
> > userspace memory fence as in-fence in there makes that problem
> > substantially worse, since at least in theory you're just not allowed to
> > might_faul in atomic_commit_tail.
> 
> Yes, that's unfortunately one of the goals as well and yes I completely
> agree on the can of worms. But I think I've solved that.
> 
> What I do in the patch set is to enforce that the out fence is an user fence
> when the driver supports user in fences as well.
> 
> Since user fences doesn't have the memory management dependency drivers can
> actually allocate memory or call I2C functions which takes locks which have
> memory allocation dependencies.
> 
> Or do I miss some other reason why you can't fault or allocate memory in
> atomic_commit_tail? At least lockdep seems to be happy about that now.

The problem is a bit that this breaks the uapi already. At least if the
goal is to have this all be perfectly transparent for userspace - as you
as you have multi-gpu setups going on at least.

> > If the goal is to keep the uapi perfectly compatible then your patch set
> > doesn't look like a solution, since as soon as another driver is involved
> > which doesn't understand userspace memory fences it all falls apart. So
> > works great for a quick demo with amd+amd sharing, but not much further.
> > And I don't think it's feasible to just rev the entire ecosystem, since
> > that kinda defeats the point of keeping uapi stable - if we rev everything
> > we might as well also rev the uapi and make this a bit more incremental
> > again :-)
> 
> Yes, unfortunately the uapi needs to stay compatible as well and yes that
> means we need to deploy this to all drivers involved.
> 
> We at least need to be able to provide a stack on new hardware with (for
> example) Ubuntu 18.04 without replacing all the userspace components.
> 
> What we can replace is the OpenGL stack and if necessary libdrm, but not
> (for example) the X server and most likely not the DDX in some cases.
> 
> The same applies with surfaceflinger and to some extend Wayland as well.

So for perfect uapi compat for existing compositor I really don't think
stuffing umf into the kernel is the right approach. Too many little
corners that break:

- the in/out fence mismatch every
- cross gpu with different userspace that doesn't understand umf and then
  just ignores them
- compositors which currently assume implicit sync finishes eventually,
  and with umf that gets complicated at best
- same with sync_file, the uapi atm does not have a concept of future
  fence

So you can kinda make this work, but it falls apart all over the place.
And I also don't think smashing umf into all these old concepts helps us
in any way to get towards a desktop which is umf-native.

My take is still that for backwards compat the simplest way is if a
umf-native driver simply provides dma-fence backwards compat as an opt-in,
which userspace chooses when it's necessary. There's really only two
things you need for that to work:

- a timeout of some sort on the dma_fence, which might or might not kill
  the entire context. This is entirey up to how your userspace does or
  does not implement stuff like arb robustness or vk_error_device_lost

- pre-pinned memory management to block out the all the inversions. This
  is a bit more nasty, but since we do have all the code for this already
  it really shouldn't be too tricky to make that happen for the fancy new
  umf world.

You do not need a kernel scheduler or anything like that at all, you can
do full userspace direct submit to hw and all that fun. Maybe do a
drm/sched frontend (and then your submit code does exactly what userspace
would do too).

Importantly the things you really don't need:

- special hw support, even if the only mode your hw supports is with page
  faults and all that: You can make sure all the pages are present
  upfront, and then simply kill the entire context is a page fault
  happens.

- special fw scheduler support: Once the memory management inversions are
  taken care of with pre-pinning under dma_fences, then the only other
  thing you need is a timeout for the dma_fence to signal. And maybe some
  kind of guaranteed ordering if you want to use a dma_fence timeline
  since that one can't go backwards.

Trying to shoehorn umf into all the old concepts like implicit sync or
sync_file which really don't support umf works for a demo, but imo just
isn't solid enough for shipping everywhere.

And long term I really don't think we ever want umf anywhere else than
drm_syncobj, at least for a 100% umf-native stack.

So maybe this all goes back to the old discussion with had, where you
argued for the need for special fw and hw and all that to make the old
dma_fence stuff work. Why is that needed? I still don't get that part ...
-Daniel
-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
