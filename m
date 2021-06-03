Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D55139AA89
	for <lists+dri-devel@lfdr.de>; Thu,  3 Jun 2021 20:54:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 113786E7E6;
	Thu,  3 Jun 2021 18:54:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com
 [IPv6:2a00:1450:4864:20::435])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9F3D36F4E7
 for <dri-devel@lists.freedesktop.org>; Thu,  3 Jun 2021 18:54:52 +0000 (UTC)
Received: by mail-wr1-x435.google.com with SMTP id l2so6888024wrw.6
 for <dri-devel@lists.freedesktop.org>; Thu, 03 Jun 2021 11:54:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=CO3ETpEHYd4w+2hgDav4tTvKCQRKE5zL1+PtSeefNgs=;
 b=TK1eABGIeC2/pzA214WhfnCGMBYoUOIP3zKtzA1HMCyLo1OAbAfVmB8xldgKZNf6is
 IeXTVzPDmu999SAU/iQnP+XoXCfPWoKDPsQtIfo2Td8/p0h8XwgxYIB2aDSh4CGYQOHH
 Qf0TTQYozFnk46z27eQJiodzW4RnSwHTQcm5w=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=CO3ETpEHYd4w+2hgDav4tTvKCQRKE5zL1+PtSeefNgs=;
 b=FOnugDTnxsP6mNLOVfp212VXI7s9dkw1H0qNOnvh1XYOzOSvZZxZM4TGlmTmdKEJY3
 YsMoBuKiKjb8revlDSW+PfjE8e2kQCtEq0BcO1s2YVSy/vn4PMcwmuVvwv9YSdSCksqb
 iZjcVFezn23KvLeFcLq5GSfJVOXcc//dRBGWcl7X3VIfJn0FoUcWy2/rVlhaNTs98YGJ
 PpIgpmqqENiI10xVBx2mEiehvDs0C3alUpEoxVbiI0WTfH8Bt0eCKiXrkLuuihvp7Y4R
 Q8g98hLGmepyZy5gfyepCO7Y7m0+GDrmFkeqp/pejNurBM1LsxqJeYprfkGBE/4ZHNXN
 meOA==
X-Gm-Message-State: AOAM531CMvjUbXpG96pRdnfjg71x/59iraIQ2hugFG/5g53vc1N35WlL
 Ter1zVJKf7V63EpdTnvSTaxtLQ==
X-Google-Smtp-Source: ABdhPJyLu2cECG1IBQe8k1JlS4f/T5QUU1oCs7BYak1SsQOhzg5N3a/KD4VnVhlWss3Oe2BjAyoxXw==
X-Received: by 2002:a05:6000:2ca:: with SMTP id
 o10mr422650wry.234.1622746491310; 
 Thu, 03 Jun 2021 11:54:51 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id d131sm6692460wmd.4.2021.06.03.11.54.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 03 Jun 2021 11:54:50 -0700 (PDT)
Date: Thu, 3 Jun 2021 20:54:48 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Andi Shyti <andi.shyti@intel.com>
Subject: Re: [Intel-gfx] [PATCH v2 4/4] drm/vgem: use shmem helpers
Message-ID: <YLkleG2uo5bGYpdV@phenom.ffwll.local>
References: <20210603150326.1326658-1-daniel.vetter@ffwll.ch>
 <20210603150326.1326658-5-daniel.vetter@ffwll.ch>
 <YLkieISPHgzmUnD4@intel.intel>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YLkieISPHgzmUnD4@intel.intel>
X-Operating-System: Linux phenom 5.10.32scarlett+ 
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
Cc: Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
 Daniel Vetter <daniel.vetter@ffwll.ch>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Chris Wilson <chris@chris-wilson.co.uk>, Melissa Wen <melissa.srw@gmail.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Daniel Vetter <daniel.vetter@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Jun 03, 2021 at 09:42:00PM +0300, Andi Shyti wrote:
> Hi Daniel,
> 
> > +/*
> > + * This just sets wc mode for shmem helpers. vgem doesn't have any begin/end cpu
> > + * access ioctls, there must use coherent memory or dma-buf sharing just wont
> > + * work.
> > + */
> > +static struct drm_gem_object *vgem_gem_create_object(struct drm_device *dev, size_t size)
> >  {
> > -	struct drm_vgem_gem_object *obj;
> > -	int npages;
> > +	struct drm_gem_shmem_object *obj;
> >  
> > -	obj = __vgem_gem_create(dev, attach->dmabuf->size);
> > -	if (IS_ERR(obj))
> > -		return ERR_CAST(obj);
> > -
> > -	npages = PAGE_ALIGN(attach->dmabuf->size) / PAGE_SIZE;
> > +	obj = kzalloc(sizeof(*obj), GFP_KERNEL);
> > +	if (!obj)
> > +		return NULL;
> >  
> > -	obj->table = sg;
> > -	obj->pages = kvmalloc_array(npages, sizeof(struct page *), GFP_KERNEL);
> > -	if (!obj->pages) {
> > -		__vgem_gem_destroy(obj);
> > -		return ERR_PTR(-ENOMEM);
> > -	}
> > +	obj->base.funcs = &drm_gem_shmem_funcs;
> > +	obj->map_wc = true;
> >  
> > -	obj->pages_pin_count++; /* perma-pinned */
> > -	drm_prime_sg_to_page_array(obj->table, obj->pages, npages);
> >  	return &obj->base;
> 
> here you are allocating a bigger object than what you are
> returning, in size. How does it get freed?

We're using the drm_gem_shmem_helper.c helpers, which set up all the shmem
functions for us, including an appropriate free callback.
-Daniel
-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
