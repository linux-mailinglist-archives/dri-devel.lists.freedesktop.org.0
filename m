Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 28645828653
	for <lists+dri-devel@lfdr.de>; Tue,  9 Jan 2024 13:54:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CE4A010E41C;
	Tue,  9 Jan 2024 12:54:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x52e.google.com (mail-ed1-x52e.google.com
 [IPv6:2a00:1450:4864:20::52e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BC7D310E41A
 for <dri-devel@lists.freedesktop.org>; Tue,  9 Jan 2024 12:54:52 +0000 (UTC)
Received: by mail-ed1-x52e.google.com with SMTP id
 4fb4d7f45d1cf-5578cb9645bso782345a12.0
 for <dri-devel@lists.freedesktop.org>; Tue, 09 Jan 2024 04:54:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google; t=1704804891; x=1705409691; darn=lists.freedesktop.org; 
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:from:to
 :cc:subject:date:message-id:reply-to;
 bh=LtCWc1v1e89cQaPA42ppoXJERfwE0AHdys0NEkw4tQg=;
 b=SQ/Pyg5+Yc0uOlyHaQw4E1KRiDSe3vEqnCZhuZtzW3IP5OEq9yKvqo+67zz+OPpKuM
 erdD39hj1XZ8hjiQ8GQySrvMIgNplqnlJoBj4s5YUyQZNZ0eQD5ZMO7NR+cERbLGMX5y
 Hv70EnozGwP8m9NolfynVZX0ZSojz7iDP6ul0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1704804891; x=1705409691;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=LtCWc1v1e89cQaPA42ppoXJERfwE0AHdys0NEkw4tQg=;
 b=QqTY75M5zTdpyQU916e0VgCcIeMMCmjHUCtK8XafJYNcaNR3MDX5hPsUYQxZVAVdLZ
 /1yVw198W60+eNWhh4mpiAG4GmrDRsb54od66Qug7UHuiDs/BONOHp4Lz3/69YvYvVJk
 qoEez75tkEKFsn0D4Tv6eT3L47B6yFokXEfyOlJXryoS4HXYVlK9dyPnXYVlgALUJ99y
 X3FzII3bpKEb0KN70jtUGVqynKmJE8dDK0eXd8IOuxJnIGOAjyiyA/wnxw7s48Wvh8cb
 bxKalbw1iKSdnZk+8bfQJ4sZCDk/fKE2n+TZetzGoPAspsmuXYY69JlVVyGJqBHsRG0j
 qqog==
X-Gm-Message-State: AOJu0YxdR7PsN2Kt8uJTLXkqkB8XOtlzKCFfU2CPPEd/KkyLIzQc3ZjE
 ekb7sdBbFQKCQn8rRwR/U9Ug8jkTqon5eg==
X-Google-Smtp-Source: AGHT+IHbw+30qESC0Ipp5OfwzvLoYvZsCsyx6MnTRBabIwHoJi4j91J/pkRcUpOnxAJ57yXW2bwftw==
X-Received: by 2002:a50:cdc4:0:b0:557:3a92:bf4 with SMTP id
 h4-20020a50cdc4000000b005573a920bf4mr7405240edj.0.1704804891166; 
 Tue, 09 Jan 2024 04:54:51 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id
 f21-20020a056402195500b00558267aca09sm188551edz.57.2024.01.09.04.54.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 09 Jan 2024 04:54:50 -0800 (PST)
Date: Tue, 9 Jan 2024 13:54:49 +0100
From: Daniel Vetter <daniel@ffwll.ch>
To: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Subject: Re: [PATCH 2/2] drm/amdgpu: add shared fdinfo stats
Message-ID: <ZZ1CGUyMjoN9PkOI@phenom.ffwll.local>
References: <20231207180225.439482-1-alexander.deucher@amd.com>
 <20231207180225.439482-3-alexander.deucher@amd.com>
 <5b231151-45fe-4d65-a9c2-63973267bdba@gmail.com>
 <d2f7c614-228d-490c-9317-8eab0d87ee28@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <d2f7c614-228d-490c-9317-8eab0d87ee28@linux.intel.com>
X-Operating-System: Linux phenom 6.5.0-4-amd64 
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
Cc: Alex Deucher <alexander.deucher@amd.com>,
 Christian =?iso-8859-1?Q?K=F6nig?= <ckoenig.leichtzumerken@gmail.com>,
 dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Jan 09, 2024 at 09:30:15AM +0000, Tvrtko Ursulin wrote:
> 
> On 09/01/2024 07:56, Christian König wrote:
> > Am 07.12.23 um 19:02 schrieb Alex Deucher:
> > > Add shared stats.  Useful for seeing shared memory.
> > > 
> > > v2: take dma-buf into account as well
> > > 
> > > Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
> > > Cc: Rob Clark <robdclark@gmail.com>
> > > ---
> > >   drivers/gpu/drm/amd/amdgpu/amdgpu_fdinfo.c |  4 ++++
> > >   drivers/gpu/drm/amd/amdgpu/amdgpu_object.c | 11 +++++++++++
> > >   drivers/gpu/drm/amd/amdgpu/amdgpu_object.h |  6 ++++++
> > >   3 files changed, 21 insertions(+)
> > > 
> > > diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_fdinfo.c
> > > b/drivers/gpu/drm/amd/amdgpu/amdgpu_fdinfo.c
> > > index 5706b282a0c7..c7df7fa3459f 100644
> > > --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_fdinfo.c
> > > +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_fdinfo.c
> > > @@ -97,6 +97,10 @@ void amdgpu_show_fdinfo(struct drm_printer *p,
> > > struct drm_file *file)
> > >              stats.requested_visible_vram/1024UL);
> > >       drm_printf(p, "amd-requested-gtt:\t%llu KiB\n",
> > >              stats.requested_gtt/1024UL);
> > > +    drm_printf(p, "drm-shared-vram:\t%llu KiB\n",
> > > stats.vram_shared/1024UL);
> > > +    drm_printf(p, "drm-shared-gtt:\t%llu KiB\n",
> > > stats.gtt_shared/1024UL);
> > > +    drm_printf(p, "drm-shared-cpu:\t%llu KiB\n",
> > > stats.cpu_shared/1024UL);
> > > +
> > >       for (hw_ip = 0; hw_ip < AMDGPU_HW_IP_NUM; ++hw_ip) {
> > >           if (!usage[hw_ip])
> > >               continue;
> > > diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c
> > > b/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c
> > > index d79b4ca1ecfc..1b37d95475b8 100644
> > > --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c
> > > +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c
> > > @@ -1287,25 +1287,36 @@ void amdgpu_bo_get_memory(struct amdgpu_bo *bo,
> > >                 struct amdgpu_mem_stats *stats)
> > >   {
> > >       uint64_t size = amdgpu_bo_size(bo);
> > > +    struct drm_gem_object *obj;
> > >       unsigned int domain;
> > > +    bool shared;
> > >       /* Abort if the BO doesn't currently have a backing store */
> > >       if (!bo->tbo.resource)
> > >           return;
> > > +    obj = &bo->tbo.base;
> > > +    shared = (obj->handle_count > 1) || obj->dma_buf;
> > 
> > I still think that looking at handle_count is the completely wrong
> > approach, we should really only look at obj->dma_buf.
> 
> Yeah it is all a bit tricky with the handle table walk. I don't think it is
> even possible to claim it is shared with obj->dma_buf could be the same
> process creating say via udmabuf and importing into drm. It is a wild
> scenario yes, but it could be private memory in that case. Not sure where it
> would leave us if we said this is just a limitation of a BO based tracking.
> 
> Would adding a new category "imported" help?
> 
> Hmm or we simply change drm-usage-stats.rst:
> 
> """
> - drm-shared-<region>: <uint> [KiB|MiB]
> 
> The total size of buffers that are shared with another file (ie. have more
> than than a single handle).
> """
> 
> Changing ie into eg coule be get our of jail free card to allow the
> "(obj->handle_count > 1) || obj->dma_buf;" condition?
> 
> Because of the shared with another _file_ wording would cover my wild
> udmabuf self-import case. Unless there are more such creative private import
> options.

Yeah I think clarifying that we can only track sharing with other fd and
have no idea whether this means sharing with another process or not is
probably simplest. Maybe not exactly what users want, but still the
roughly best-case approximation we can deliver somewhat cheaply.

Also maybe time for a drm_gem_buffer_object_is_shared() helper so we don't
copypaste this all over and then end up in divergent conditions? I'm
guessing that there's going to be a bunch of drivers which needs this
little helper to add drm-shared-* stats to their fdinfo ...

Cheers, Sima
> 
> Regards,
> 
> Tvrtko
> 
> > 
> > Regards,
> > Christian.
> > 
> > > +
> > >       domain = amdgpu_mem_type_to_domain(bo->tbo.resource->mem_type);
> > >       switch (domain) {
> > >       case AMDGPU_GEM_DOMAIN_VRAM:
> > >           stats->vram += size;
> > >           if (amdgpu_bo_in_cpu_visible_vram(bo))
> > >               stats->visible_vram += size;
> > > +        if (shared)
> > > +            stats->vram_shared += size;
> > >           break;
> > >       case AMDGPU_GEM_DOMAIN_GTT:
> > >           stats->gtt += size;
> > > +        if (shared)
> > > +            stats->gtt_shared += size;
> > >           break;
> > >       case AMDGPU_GEM_DOMAIN_CPU:
> > >       default:
> > >           stats->cpu += size;
> > > +        if (shared)
> > > +            stats->cpu_shared += size;
> > >           break;
> > >       }
> > > diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_object.h
> > > b/drivers/gpu/drm/amd/amdgpu/amdgpu_object.h
> > > index d28e21baef16..0503af75dc26 100644
> > > --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_object.h
> > > +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_object.h
> > > @@ -138,12 +138,18 @@ struct amdgpu_bo_vm {
> > >   struct amdgpu_mem_stats {
> > >       /* current VRAM usage, includes visible VRAM */
> > >       uint64_t vram;
> > > +    /* current shared VRAM usage, includes visible VRAM */
> > > +    uint64_t vram_shared;
> > >       /* current visible VRAM usage */
> > >       uint64_t visible_vram;
> > >       /* current GTT usage */
> > >       uint64_t gtt;
> > > +    /* current shared GTT usage */
> > > +    uint64_t gtt_shared;
> > >       /* current system memory usage */
> > >       uint64_t cpu;
> > > +    /* current shared system memory usage */
> > > +    uint64_t cpu_shared;
> > >       /* sum of evicted buffers, includes visible VRAM */
> > >       uint64_t evicted_vram;
> > >       /* sum of evicted buffers due to CPU access */
> > 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
