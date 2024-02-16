Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C0D48582CC
	for <lists+dri-devel@lfdr.de>; Fri, 16 Feb 2024 17:41:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4F28010EC30;
	Fri, 16 Feb 2024 16:41:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; secure) header.d=ffwll.ch header.i=@ffwll.ch header.b="D/rLBYrg";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f182.google.com (mail-lj1-f182.google.com
 [209.85.208.182])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 732FB10E6E1
 for <dri-devel@lists.freedesktop.org>; Fri, 16 Feb 2024 16:41:35 +0000 (UTC)
Received: by mail-lj1-f182.google.com with SMTP id
 38308e7fff4ca-2cd3aea2621so6007291fa.1
 for <dri-devel@lists.freedesktop.org>; Fri, 16 Feb 2024 08:41:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google; t=1708101693; x=1708706493; darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=KVDi/d4ah8IbM1EwMcbmIT+mFBd7vvbM9q1eVOsBF08=;
 b=D/rLBYrgdWb4h5/vwrY0LDYsWvft7Lf5uEai0mAJeJdix5skttIBDqbGLcYH8Ik0au
 +p0EZbxeY8X4G+BWJtv5MZ3KuGxCZ4KJHpwe6muzFjiJdGEa4lofVS3Ur8NI5mIbMr7y
 /v1V5hpLG8OMJcb76eiOyFzIjV9ZHPPzvoLU8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1708101693; x=1708706493;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=KVDi/d4ah8IbM1EwMcbmIT+mFBd7vvbM9q1eVOsBF08=;
 b=hzvU/DJ4LSNB6iaFHmOlXolf6ew5GOMM2jQOEbPV6hbsK1h+af0PKJzDUsDTWBHdUw
 kzYCIsLSwJv4Bzqyfk24PsxCuJ93YCq3WP4gXpVWUffwzsom53wXNOJx1P9zH2/Jc+Cm
 0fTx/VL38/6q6XWQk+UK5xfY6VaTjd9T/CuEnHYOuRhxnke8PK3FPE1YNoSBi1AtN6H+
 XT1LHodbt7zX8JD7UaWLBq31cyrafItph4Z6GVIkeWp1I/vzGUeSMnkOEMr4FfTVrrsS
 BSOu+oxnaenf6JCMgjqS02C5kGxWV/YQRPuoZMfHBNwu/ueCCojrmUD3a3E1OzcSua90
 GFFQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWAkriiP4P02Fh+1ghYRJmd8lEdVwtoq/I8MF11UFzfIUrJKaadypwOJ0imoJgPbJNlqG4rpwGtkQ6vAlMLb0IbIO6kxp8jx6uNIwaIcb+F
X-Gm-Message-State: AOJu0YzmTbbdpNfORJbDa/OhjNbuSW8H7T4Uo7agW5JfaMa6apR1skzy
 qM9i8CSLGbtM574Kw0cPftOkd6NwAjmwsN2otFaNadm83/b92V01quN0yp9aENk=
X-Google-Smtp-Source: AGHT+IEtHb3gXEr4AgB/unD+Bk3+nXxQVMrChUVLiCKEWe73GhgcOMNyqfkbhPru6y+piC1oPHpweA==
X-Received: by 2002:a2e:9956:0:b0:2d0:eb9e:eee7 with SMTP id
 r22-20020a2e9956000000b002d0eb9eeee7mr1914872ljj.3.1708101693471; 
 Fri, 16 Feb 2024 08:41:33 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id
 f8-20020a05600c4e8800b0040f0219c371sm2883732wmq.19.2024.02.16.08.41.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 16 Feb 2024 08:41:33 -0800 (PST)
Date: Fri, 16 Feb 2024 17:41:31 +0100
From: Daniel Vetter <daniel@ffwll.ch>
To: Danilo Krummrich <dakr@redhat.com>
Cc: Daniel Vetter <daniel@ffwll.ch>, Dave Airlie <airlied@gmail.com>,
 nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Subject: Re: [PATCH] nouveau: offload fence uevents work to workqueue
Message-ID: <Zc-QO3vFRIUKSIhT@phenom.ffwll.local>
References: <20240129015053.1687418-1-airlied@gmail.com>
 <133266ac-7239-4233-a19d-cdc7563d401c@redhat.com>
 <CAPM=9tyc3zWRhm4xSnnHprU-v7prdZ2fkkLDEfjC_t_2wM-8Kg@mail.gmail.com>
 <3d967763-8f8f-4451-9927-33395e1b4d70@redhat.com>
 <ZcI8GScBEJ0SsuA5@phenom.ffwll.local>
 <a2174cc2-ea65-4bcf-a112-f60f26b7213c@redhat.com>
 <ZcZ0UXfbKYNhhBiC@phenom.ffwll.local>
 <c13596a5-f672-46e4-8ca6-4f1e449f3267@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <c13596a5-f672-46e4-8ca6-4f1e449f3267@redhat.com>
X-Operating-System: Linux phenom 6.6.11-amd64 
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

On Tue, Feb 13, 2024 at 06:39:20PM +0100, Danilo Krummrich wrote:
> On 2/9/24 19:52, Daniel Vetter wrote:
> > On Fri, Feb 09, 2024 at 06:41:32PM +0100, Danilo Krummrich wrote:
> > > On 2/6/24 15:03, Daniel Vetter wrote:
> > > > On Mon, Feb 05, 2024 at 11:00:04PM +0100, Danilo Krummrich wrote:
> > > > > On 2/5/24 22:08, Dave Airlie wrote:
> > > > > > On Tue, 6 Feb 2024 at 02:22, Danilo Krummrich <dakr@redhat.com> wrote:
> > > > > > > 
> > > > > > > On 1/29/24 02:50, Dave Airlie wrote:
> > > > > > > > From: Dave Airlie <airlied@redhat.com>
> > > > > > > > 
> > > > > > > > This should break the deadlock between the fctx lock and the irq lock.
> > > > > > > > 
> > > > > > > > This offloads the processing off the work from the irq into a workqueue.
> > > > > > > > 
> > > > > > > > Signed-off-by: Dave Airlie <airlied@redhat.com>
> > > > > > > 
> > > > > > > Nouveau's scheduler uses a dedicated wq, hence from this perspective it's
> > > > > > > safe deferring fence signalling to the kernel global wq. However, I wonder
> > > > > > > if we could create deadlocks by building dependency chains into other
> > > > > > > drivers / kernel code that, by chance, makes use of the kernel global wq as
> > > > > > > well.
> > > > > > > 
> > > > > > > Admittedly, even if, it's gonna be extremely unlikely given that
> > > > > > > WQ_MAX_ACTIVE == 512. But maybe it'd be safer to use a dedicated wq.
> > > > > > > 
> > > > > > > Also, do we need to CC stable?
> > > > > > 
> > > > > > I pushed this to Linus at the end of last week, since the hangs in 6.7
> > > > > > take out the complete system and I wanted it in stable.
> > > > > > 
> > > > > > It might be safer to use a dedicated wq, is the concern someone is
> > > > > > waiting on a fence in a workqueue somewhere else so we will never
> > > > > > signal it?
> > > > > 
> > > > > Yes, if some other work is waiting for this fence (or something else in the same
> > > > > dependency chain) to signal it can prevent executing the work signaling this fence,
> > > > > in case both are scheduled on the same wq. As mentioned, with the kernel global wq
> > > > > this would be rather unlikely to lead to an actual stall with WQ_MAX_ACTIVE == 512,
> > > > > but formally the race condition exists. I guess a malicious attacker could try to
> > > > > intentionally push jobs directly or indirectly depending on this fence to a driver
> > > > > which queues them up on a scheduler using the kernel global wq.
> > > > 
> > > > I think if you add dma_fence_signalling annotations (aside, there's some
> > > > patch from iirc Thomas Hellstrom to improve them and cut down on some
> > > > false positives, but I lost track) then I think you won't get any splats
> > > > because the wq subsystem assumes that WC_MAX_ACTIVE is close enough to
> > > > infinity to not matter.
> > > 
> > > As mentioned, for the kernel global wq it's 512. (Intentionally) feeding the kernel
> > > with enough jobs to to provoke a deadlock doesn't seem impossible to me.
> > > 
> > > I think it'd be safer to just establish not to use the kernel global wq for executing
> > > work in the fence signalling critical path.
> > > 
> > > We could also run into similar problems with a dedicated wq, e.g. when drivers share
> > > a wq between drm_gpu_scheduler instances (see [1]), however, I'm not sure we can catch
> > > that with lockdep.
> > 
> > I think if you want to fix it perfectly you'd need to set the max number
> > of wq to the number of engines (or for dynamic/fw scheduled engines to the
> > number of context) you have. Or whatever limit to the number of parallel
> > timelines there is.> I guess this would need a new wq function to
> > update? drm/sched code could
> > be able to set that for drivers, so drivers cannot get this wrong.
> 
> Not sure I can follow. The scheduler instance might be per context and bind
> queue. In this case it gets the shared wq passed, but doesn't know how many
> other scheduler instances share the same one.

Yeah that's why maybe more of that logic should be in the drm/sched code
instead of drivers just cleverly using what's there ...

> Additionally, there might be drivers not using the DRM scheduler for for bind
> queues at all (I think Xe does not).

Uh ... maybe we should do this the same across all drivers? But I also
thought that Xe was flat-out synchronous and only had an out-fence since
you need a userspace thread in mesa for vk semantics anyway.

If xe hand-rolled a scheduler I'm not going to be very amused.

> > If we don't do something like that then I'm not sure there's really much
> > benefit - instead of carefully timing 512 dma_fence on the global wq you
> > just need to create a pile of context (at least on intel's guc that's
> > absolutely no issue) and then careful time them.
> 
> Well, that's true. I'd still argue that there is a slight difference. From a
> drivers isolated perspective using the global kernel wq might be entirely fine,
> as in this patch. However, in combination with another driver doing the same
> thing, things can blow up. For the case you illustrated it's at least possible
> to spot it from a driver's perspective.
> 
> > 
> > I still feel like we have bigger fish to fry ... But might be worth the
> > effort to at least make the parallel timeline limit a lot more explicit?
> 
> I agree, and it'd be great if we can find a solution such bugs can be detected
> systematically (e.g. through lockdep), but maybe we can start to at least
> document that we should never use the kernel global wq and where we need to be
> careful in sharing driver wqs.

Yeah I guess the above two are other reasons why maybe we need a bit more
structure in scheduler apis instead of just allowing drivers to hand in
shared wq pointers. Something like a struct drm_sched_domain, which
contains the wq + a list of drm_sched for it. Would also make stuff like
reliably stopping the right amount of schedulers in tdr much more robust.
-Sima

> 
> - Danilo
> 
> > 
> > Cheers, Sima
> > 
> > > 
> > > [1] https://elixir.bootlin.com/linux/v6.8-rc3/source/drivers/gpu/drm/nouveau/nouveau_drm.c#L313
> > > 
> > > > 
> > > > I'm not sure we should care differently, but I guess it'd be good to
> > > > annotate it all in case the wq subsystem's idea of how much such deadlocks
> > > > are real changes.
> > > > 
> > > > Also Teo is on a mission to get rid of all the global wq flushes, so there
> > > > should also be no source of deadlocks from that kind of cross-driver
> > > > dependency. Or at least shouldn't be in the future, I'm not sure it all
> > > > landed.
> > > > -Sima
> > > 
> > 
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
