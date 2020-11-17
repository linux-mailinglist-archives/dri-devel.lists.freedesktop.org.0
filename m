Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CC8942B6E20
	for <lists+dri-devel@lfdr.de>; Tue, 17 Nov 2020 20:11:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F194E6E059;
	Tue, 17 Nov 2020 19:11:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x342.google.com (mail-wm1-x342.google.com
 [IPv6:2a00:1450:4864:20::342])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A94B96E059
 for <dri-devel@lists.freedesktop.org>; Tue, 17 Nov 2020 19:11:38 +0000 (UTC)
Received: by mail-wm1-x342.google.com with SMTP id 23so2657922wmg.1
 for <dri-devel@lists.freedesktop.org>; Tue, 17 Nov 2020 11:11:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:mail-followup-to:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to; bh=hu7bOYUgtnFLMBiA1U9xKBu85h7yzSk1KLbNCN463rI=;
 b=X5xkpElnuKlOphb7oubo5uykS6+OI+php6jhCFtFcZhmtzzwWArV8Df6/gG5zzJ117
 AYrkJBx9rLECsYAk6+Z/lS3xFE5GUhpCTUDLmj4v406RilyJDbUB9Uyu+0VSDGYgvm2l
 jukkd1AGe1UjqosgfxOcW7pjmYpNky0Zfc6wQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id
 :mail-followup-to:references:mime-version:content-disposition
 :content-transfer-encoding:in-reply-to;
 bh=hu7bOYUgtnFLMBiA1U9xKBu85h7yzSk1KLbNCN463rI=;
 b=CYt4CxJ7P61xwMjIENO9c9N5RI63A06gGVn0/KwCgA7T+X4wJ2j1U0eUPPX/vB101o
 3sqT/0I4WciJfaDQm0kK6qvlSDyhNlBq8Ooo1PYyxTijt/SxO9kxzDYuvtTNgEY1xbkt
 RmNx9qNOcoYzQdSp5SxnU4HBOSRCAMNSO5Ud+1IyPmZM4gInjCB0uiYFp0sou3HYyI5C
 D4lj+QJQgHxsFpNn+NliTNdeFhs3aeWRQ3IaKVKZDDrVQytA0ZOtGGvFiytFqDXa9BMN
 EI15aZFZvyws30n/Z7K5i2ZIjBLlU9Kpgx+yDlwfg3k8fXnNZKP/vubQeMut6MUrqsCZ
 XW3g==
X-Gm-Message-State: AOAM532RmVFM9Y0bvxR3ySVCMDsqQCGTzQ9qx8QolAcKVojPX0IPgkPS
 UoLuwhMqlXTfc+8qzb/WNLsrSw==
X-Google-Smtp-Source: ABdhPJwbYqX7pbIz2K9J0KeaqAR4C73oOOuRTBZ3QqO4swjxEvr2VoxyUPHO42dNRwlmR9/xM6NPWg==
X-Received: by 2002:a7b:c1d2:: with SMTP id a18mr604240wmj.41.1605640297385;
 Tue, 17 Nov 2020 11:11:37 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id a14sm4774135wmj.40.2020.11.17.11.11.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 17 Nov 2020 11:11:36 -0800 (PST)
Date: Tue, 17 Nov 2020 20:11:34 +0100
From: Daniel Vetter <daniel@ffwll.ch>
To: Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>
Subject: Re: [PATCH 31/42] drm/ttm/ttm_bo: Fix one function header - demote
 lots of kernel-doc abuses
Message-ID: <20201117191134.GR401619@phenom.ffwll.local>
Mail-Followup-To: Christian =?iso-8859-1?Q?K=F6nig?=
 <christian.koenig@amd.com>, 
 Lee Jones <lee.jones@linaro.org>, linux-kernel@vger.kernel.org,
 Huang Rui <ray.huang@amd.com>, David Airlie <airlied@linux.ie>,
 Sumit Semwal <sumit.semwal@linaro.org>,
 dri-devel@lists.freedesktop.org, linux-media@vger.kernel.org,
 linaro-mm-sig@lists.linaro.org
References: <20201116174112.1833368-1-lee.jones@linaro.org>
 <20201116174112.1833368-32-lee.jones@linaro.org>
 <7745c8a0-12ad-8dcd-3740-51c640ea4ef2@amd.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <7745c8a0-12ad-8dcd-3740-51c640ea4ef2@amd.com>
X-Operating-System: Linux phenom 5.7.0-1-amd64 
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
Cc: David Airlie <airlied@linux.ie>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org,
 Huang Rui <ray.huang@amd.com>, Lee Jones <lee.jones@linaro.org>,
 linux-media@vger.kernel.org
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Nov 16, 2020 at 09:33:48PM +0100, Christian K=F6nig wrote:
> Am 16.11.20 um 18:41 schrieb Lee Jones:
> > Fixes the following W=3D1 kernel build warning(s):
> > =

> >   drivers/gpu/drm/ttm/ttm_bo.c:51: warning: Function parameter or membe=
r 'ttm_global_mutex' not described in 'DEFINE_MUTEX'
> >   drivers/gpu/drm/ttm/ttm_bo.c:286: warning: Function parameter or memb=
er 'bo' not described in 'ttm_bo_cleanup_memtype_use'
> >   drivers/gpu/drm/ttm/ttm_bo.c:359: warning: Function parameter or memb=
er 'bo' not described in 'ttm_bo_cleanup_refs'
> >   drivers/gpu/drm/ttm/ttm_bo.c:359: warning: Function parameter or memb=
er 'interruptible' not described in 'ttm_bo_cleanup_refs'
> >   drivers/gpu/drm/ttm/ttm_bo.c:359: warning: Function parameter or memb=
er 'no_wait_gpu' not described in 'ttm_bo_cleanup_refs'
> >   drivers/gpu/drm/ttm/ttm_bo.c:359: warning: Function parameter or memb=
er 'unlock_resv' not described in 'ttm_bo_cleanup_refs'
> >   drivers/gpu/drm/ttm/ttm_bo.c:424: warning: Function parameter or memb=
er 'bdev' not described in 'ttm_bo_delayed_delete'
> >   drivers/gpu/drm/ttm/ttm_bo.c:424: warning: Function parameter or memb=
er 'remove_all' not described in 'ttm_bo_delayed_delete'
> >   drivers/gpu/drm/ttm/ttm_bo.c:635: warning: Function parameter or memb=
er 'bo' not described in 'ttm_bo_evict_swapout_allowable'
> >   drivers/gpu/drm/ttm/ttm_bo.c:635: warning: Function parameter or memb=
er 'ctx' not described in 'ttm_bo_evict_swapout_allowable'
> >   drivers/gpu/drm/ttm/ttm_bo.c:635: warning: Function parameter or memb=
er 'locked' not described in 'ttm_bo_evict_swapout_allowable'
> >   drivers/gpu/drm/ttm/ttm_bo.c:635: warning: Function parameter or memb=
er 'busy' not described in 'ttm_bo_evict_swapout_allowable'
> >   drivers/gpu/drm/ttm/ttm_bo.c:769: warning: Function parameter or memb=
er 'bo' not described in 'ttm_bo_add_move_fence'
> >   drivers/gpu/drm/ttm/ttm_bo.c:769: warning: Function parameter or memb=
er 'man' not described in 'ttm_bo_add_move_fence'
> >   drivers/gpu/drm/ttm/ttm_bo.c:769: warning: Function parameter or memb=
er 'mem' not described in 'ttm_bo_add_move_fence'
> >   drivers/gpu/drm/ttm/ttm_bo.c:769: warning: Function parameter or memb=
er 'no_wait_gpu' not described in 'ttm_bo_add_move_fence'
> >   drivers/gpu/drm/ttm/ttm_bo.c:806: warning: Function parameter or memb=
er 'bo' not described in 'ttm_bo_mem_force_space'
> >   drivers/gpu/drm/ttm/ttm_bo.c:806: warning: Function parameter or memb=
er 'place' not described in 'ttm_bo_mem_force_space'
> >   drivers/gpu/drm/ttm/ttm_bo.c:806: warning: Function parameter or memb=
er 'mem' not described in 'ttm_bo_mem_force_space'
> >   drivers/gpu/drm/ttm/ttm_bo.c:806: warning: Function parameter or memb=
er 'ctx' not described in 'ttm_bo_mem_force_space'
> >   drivers/gpu/drm/ttm/ttm_bo.c:872: warning: Function parameter or memb=
er 'bo' not described in 'ttm_bo_mem_space'
> >   drivers/gpu/drm/ttm/ttm_bo.c:872: warning: Function parameter or memb=
er 'placement' not described in 'ttm_bo_mem_space'
> >   drivers/gpu/drm/ttm/ttm_bo.c:872: warning: Function parameter or memb=
er 'mem' not described in 'ttm_bo_mem_space'
> >   drivers/gpu/drm/ttm/ttm_bo.c:872: warning: Function parameter or memb=
er 'ctx' not described in 'ttm_bo_mem_space'
> >   drivers/gpu/drm/ttm/ttm_bo.c:1387: warning: Function parameter or mem=
ber 'ctx' not described in 'ttm_bo_swapout'
> > =

> > Cc: Christian Koenig <christian.koenig@amd.com>
> > Cc: Huang Rui <ray.huang@amd.com>
> > Cc: David Airlie <airlied@linux.ie>
> > Cc: Daniel Vetter <daniel@ffwll.ch>
> > Cc: Sumit Semwal <sumit.semwal@linaro.org>
> > Cc: dri-devel@lists.freedesktop.org
> > Cc: linux-media@vger.kernel.org
> > Cc: linaro-mm-sig@lists.linaro.org
> > Signed-off-by: Lee Jones <lee.jones@linaro.org>
> =

> Reviewed-by: Christian K=F6nig <christian.koenig@amd.com>
> =

> Going to pick that one up for upstreaming.

I mass applied this pile, so also this one. Thanks for patch&review.
-Daniel

> =

> Thanks,
> Christian.
> =

> > ---
> >   drivers/gpu/drm/ttm/ttm_bo.c | 23 ++++++++++++-----------
> >   1 file changed, 12 insertions(+), 11 deletions(-)
> > =

> > diff --git a/drivers/gpu/drm/ttm/ttm_bo.c b/drivers/gpu/drm/ttm/ttm_bo.c
> > index e6bcbfe530ecc..9a03c7834b1ed 100644
> > --- a/drivers/gpu/drm/ttm/ttm_bo.c
> > +++ b/drivers/gpu/drm/ttm/ttm_bo.c
> > @@ -45,7 +45,7 @@
> >   static void ttm_bo_global_kobj_release(struct kobject *kobj);
> > -/**
> > +/*
> >    * ttm_global_mutex - protecting the global BO state
> >    */
> >   DEFINE_MUTEX(ttm_global_mutex);
> > @@ -278,7 +278,7 @@ static int ttm_bo_handle_move_mem(struct ttm_buffer=
_object *bo,
> >   	return ret;
> >   }
> > -/**
> > +/*
> >    * Call bo::reserved.
> >    * Will release GPU memory type usage on destruction.
> >    * This is the place to put in driver specific hooks to release
> > @@ -352,9 +352,10 @@ static void ttm_bo_flush_all_fences(struct ttm_buf=
fer_object *bo)
> >    * Must be called with lru_lock and reservation held, this function
> >    * will drop the lru lock and optionally the reservation lock before =
returning.
> >    *
> > - * @interruptible         Any sleeps should occur interruptibly.
> > - * @no_wait_gpu           Never wait for gpu. Return -EBUSY instead.
> > - * @unlock_resv           Unlock the reservation lock as well.
> > + * @bo:                    The buffer object to clean-up
> > + * @interruptible:         Any sleeps should occur interruptibly.
> > + * @no_wait_gpu:           Never wait for gpu. Return -EBUSY instead.
> > + * @unlock_resv:           Unlock the reservation lock as well.
> >    */
> >   static int ttm_bo_cleanup_refs(struct ttm_buffer_object *bo,
> > @@ -420,7 +421,7 @@ static int ttm_bo_cleanup_refs(struct ttm_buffer_ob=
ject *bo,
> >   	return 0;
> >   }
> > -/**
> > +/*
> >    * Traverse the delayed list, and call ttm_bo_cleanup_refs on all
> >    * encountered buffers.
> >    */
> > @@ -628,7 +629,7 @@ bool ttm_bo_eviction_valuable(struct ttm_buffer_obj=
ect *bo,
> >   }
> >   EXPORT_SYMBOL(ttm_bo_eviction_valuable);
> > -/**
> > +/*
> >    * Check the target bo is allowable to be evicted or swapout, includi=
ng cases:
> >    *
> >    * a. if share same reservation object with ctx->resv, have assumption
> > @@ -767,7 +768,7 @@ int ttm_mem_evict_first(struct ttm_bo_device *bdev,
> >   	return ret;
> >   }
> > -/**
> > +/*
> >    * Add the last move fence to the BO and reserve a new shared slot.
> >    */
> >   static int ttm_bo_add_move_fence(struct ttm_buffer_object *bo,
> > @@ -803,7 +804,7 @@ static int ttm_bo_add_move_fence(struct ttm_buffer_=
object *bo,
> >   	return 0;
> >   }
> > -/**
> > +/*
> >    * Repeatedly evict memory from the LRU for @mem_type until we create=
 enough
> >    * space, or we've evicted everything and there isn't enough space.
> >    */
> > @@ -865,7 +866,7 @@ static int ttm_bo_mem_placement(struct ttm_buffer_o=
bject *bo,
> >   	return 0;
> >   }
> > -/**
> > +/*
> >    * Creates space for memory region @mem according to its type.
> >    *
> >    * This function first searches for free space in compatible memory t=
ypes in
> > @@ -1430,7 +1431,7 @@ int ttm_bo_wait(struct ttm_buffer_object *bo,
> >   }
> >   EXPORT_SYMBOL(ttm_bo_wait);
> > -/**
> > +/*
> >    * A buffer object shrink method that tries to swap out the first
> >    * buffer object on the bo_global::swap_lru list.
> >    */
> =


-- =

Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
