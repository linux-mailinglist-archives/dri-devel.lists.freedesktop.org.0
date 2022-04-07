Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 408074F7B92
	for <lists+dri-devel@lfdr.de>; Thu,  7 Apr 2022 11:27:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3158A10E47C;
	Thu,  7 Apr 2022 09:27:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x543.google.com (mail-ed1-x543.google.com
 [IPv6:2a00:1450:4864:20::543])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2498110E47C
 for <dri-devel@lists.freedesktop.org>; Thu,  7 Apr 2022 09:27:01 +0000 (UTC)
Received: by mail-ed1-x543.google.com with SMTP id x20so5650658edi.12
 for <dri-devel@lists.freedesktop.org>; Thu, 07 Apr 2022 02:27:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=NKwFB/zlsvGYRImG4cLRY5yZTV/Q5TVTyl65gq+hkqo=;
 b=RgdSMzkTMM4hiF4zEKjreCFRSLEC8992YB6/AgNQsBsCyGdMEBBFUxt2/mvtM6L4tu
 3sUHk40dx72q9lz6lC4LrCEYC3d6/p9Y38otcUZgcNk153G9xbvPH8OgieOaEr5Lskjb
 oYMnUMSejXiOasTo9HovC95MaGxiufPiYpruY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=NKwFB/zlsvGYRImG4cLRY5yZTV/Q5TVTyl65gq+hkqo=;
 b=LC30IDMDy+pwd4R1OCaYpuDNoC/WRJpQ1iwOoYnoyRIGQWaUx9DJywE/KwOgv87Zpx
 paddBPcBQ4z5w0BbP7RLbkcL3CD/MglCAF4ryf6MLFU6aiwRMTIAUGs8Zai5FWSHuw8X
 EzNJ1GVoHnCRQ1c3dFl4rxOSGF7jZf2SS1MPZF/ywG750e9lErKDx8Eai5Kt0A//H/+H
 VD25Kp42W1xAu8bpiCc9LNE16eK7oAn+j9bhsYK7zyYKtJOW0YX27LD57BdXHBiYtbiE
 S+Oo2dG+GqpFDiQUPIGzQL5mkC/xrdD18Kg6BBU/2vd4J//ueFYAuoANcnavvB6LB9om
 Quyg==
X-Gm-Message-State: AOAM531WkIla6G0F717ciWAQmG+OtmcqYN25IVNeTRPd2wyLk4AmAPFL
 yiQzHnCuZuP1FhQJsw2dCL4NCQ==
X-Google-Smtp-Source: ABdhPJwkzhgCQ/edLqyydPyiVEglje/cbxL8SiNAOoNWmps+0EaHGX8lvVIhCjmusMY2cBciuxcafQ==
X-Received: by 2002:a50:ce03:0:b0:41c:c36b:c75 with SMTP id
 y3-20020a50ce03000000b0041cc36b0c75mr12928303edi.195.1649323619689; 
 Thu, 07 Apr 2022 02:26:59 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id
 t7-20020a50d907000000b0041cda2f0548sm4594579edj.10.2022.04.07.02.26.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 07 Apr 2022 02:26:59 -0700 (PDT)
Date: Thu, 7 Apr 2022 11:26:57 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>
Subject: Re: [PATCH 03/16] dma-buf: specify usage while adding fences to
 dma_resv obj v6
Message-ID: <Yk6uYXZq8BDalPXA@phenom.ffwll.local>
References: <20220406075132.3263-1-christian.koenig@amd.com>
 <20220406075132.3263-4-christian.koenig@amd.com>
 <Yk2IVgQMbb24cKdv@phenom.ffwll.local>
 <Yk2JBZ7z/uZop5xx@phenom.ffwll.local>
 <0e34ce06-c962-b1f1-d2a9-5dedbd19ff32@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <0e34ce06-c962-b1f1-d2a9-5dedbd19ff32@amd.com>
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
Cc: daniel.vetter@ffwll.ch, dri-devel@lists.freedesktop.org,
 DMA-resvusage@phenom.ffwll.local
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Apr 07, 2022 at 10:01:52AM +0200, Christian König wrote:
> Am 06.04.22 um 14:35 schrieb Daniel Vetter:
> > On Wed, Apr 06, 2022 at 02:32:22PM +0200, Daniel Vetter wrote:
> > > On Wed, Apr 06, 2022 at 09:51:19AM +0200, Christian König wrote:
> > > > [SNIP]
> > > > diff --git a/drivers/gpu/drm/etnaviv/etnaviv_gem_submit.c b/drivers/gpu/drm/etnaviv/etnaviv_gem_submit.c
> > > > index 53f7c78628a4..98bb5c9239de 100644
> > > > --- a/drivers/gpu/drm/etnaviv/etnaviv_gem_submit.c
> > > > +++ b/drivers/gpu/drm/etnaviv/etnaviv_gem_submit.c
> > > > @@ -202,14 +202,10 @@ static void submit_attach_object_fences(struct etnaviv_gem_submit *submit)
> > > >   	for (i = 0; i < submit->nr_bos; i++) {
> > > >   		struct drm_gem_object *obj = &submit->bos[i].obj->base;
> > > > +		bool write = submit->bos[i].flags & ETNA_SUBMIT_BO_WRITE;
> > > > -		if (submit->bos[i].flags & ETNA_SUBMIT_BO_WRITE)
> > > > -			dma_resv_add_excl_fence(obj->resv,
> > > > -							  submit->out_fence);
> > > > -		else
> > > > -			dma_resv_add_shared_fence(obj->resv,
> > > > -							    submit->out_fence);
> > > > -
> > > > +		dma_resv_add_fence(obj->resv, submit->out_fence, write ?
> > > > +				   DMA_RESV_USAGE_WRITE : DMA_RESV_USAGE_READ);
> > > Iirc I had some suggestions to use dma_resv_usage_rw here and above. Do
> > > these happen in later patches? There's also a few more of these later on.
> 
> That won't work. dma_resv_usage_rw() returns the usage as necessary for
> dependencies. In other words write return DMA_RESV_USAGE_READ and read
> return DMA_RESV_USAGE_WRITE.

Hm right, that's a bit annoying due to the asymetry in dependencies and
adding fences.
> 
> What we could do is to add a dma_resv_add_fence_rw() wrapper which does the
> necessary ?: in a central place.

I'm not sure it's overkill, but what about something like this:

enum drm_sync_mode {
	DRM_SYNC_NO_IMPLICIT,
	DRM_SYNC_WRITE,
	DRM_SYNC_READ,
}

And then two functions, on in the drm/sched which replaces the current
add_implicit_dependencies, and the other which would be in the glorious
future eu utils shared between ttm and gem drivers, which adds the fence
with the right usage. And they would take care of the right mapping in
each case.

And then all we'd still have in driver code is mapping from random
bonghits driver flags to drm_sync_mode, and all the confusion would be in
shared code. And see above, at least for me it's confusing as heck :-)

> 
> > > > diff --git a/drivers/gpu/drm/lima/lima_gem.c b/drivers/gpu/drm/lima/lima_gem.c
> > > > index e0a11ee0e86d..cb3bfccc930f 100644
> > > > --- a/drivers/gpu/drm/lima/lima_gem.c
> > > > +++ b/drivers/gpu/drm/lima/lima_gem.c
> > > > @@ -367,7 +367,7 @@ int lima_gem_submit(struct drm_file *file, struct lima_submit *submit)
> > > >   		if (submit->bos[i].flags & LIMA_SUBMIT_BO_WRITE)
> > > >   			dma_resv_add_excl_fence(lima_bo_resv(bos[i]), fence);
> > > >   		else
> > > > -			dma_resv_add_shared_fence(lima_bo_resv(bos[i]), fence);
> > > > +			dma_resv_add_fence(lima_bo_resv(bos[i]), fence);
> > Correction on the r-b, I'm still pretty sure that this won't compile at
> > all.
> 
> Grrr, I've forgot to add CONFIG_OF to my compile build config.
> 
> BTW: Do we have a tool for compile test coverage of patches? E.g. something
> which figures out if a build created an o file for each c file a patch
> touched?

Just regrets when I screw up :-/
-Daniel
-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
