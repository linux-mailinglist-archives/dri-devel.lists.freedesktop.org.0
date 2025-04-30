Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 26BF0AA4664
	for <lists+dri-devel@lfdr.de>; Wed, 30 Apr 2025 11:07:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A241710E70D;
	Wed, 30 Apr 2025 09:07:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; secure) header.d=ffwll.ch header.i=@ffwll.ch header.b="hEIzoGwS";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com
 [209.85.218.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 33A6710E715
 for <dri-devel@lists.freedesktop.org>; Wed, 30 Apr 2025 09:07:22 +0000 (UTC)
Received: by mail-ej1-f53.google.com with SMTP id
 a640c23a62f3a-ac2a81e41e3so1257066466b.1
 for <dri-devel@lists.freedesktop.org>; Wed, 30 Apr 2025 02:07:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google; t=1746004041; x=1746608841; darn=lists.freedesktop.org; 
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:from:to
 :cc:subject:date:message-id:reply-to;
 bh=QWzeqHvzoIOvidos86deilx7bNZ58NmjU0Ulih/C+JI=;
 b=hEIzoGwSR+bshW0/UiqfR5ihBCHDlJqNhJGGPRttr69pRtpf9ven3OuDcBfarzpGOh
 ycjk4j5VqsKPb6z/VKQ1DkNfOL5r4LNz0feVsKoTmcFlawqeYmQaX3z1tWmdc+bFmxx6
 +O1zmeAj+LfCtEOnD4G9pebNJV9UAA5Y8dw5k=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1746004041; x=1746608841;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=QWzeqHvzoIOvidos86deilx7bNZ58NmjU0Ulih/C+JI=;
 b=WNHc94sN4ep5GtqRH7Hgb05/JOK2kP6jObkE6Rucr7eRbP3dbe9qITrDQLCpUKBxQ0
 0FUTj7lpJKiVgawPvU6dDNA96KnlinSNttevPTRQBPMRAYxiIUGwTVeshahoUFm/ssjZ
 yQRQIu5lNCz7YKheJWr1Sdz4nPLLZ8QR7lX+FcmDvygT3r9a8rCs000dWcYlgjcH61hw
 HeHt3i1+YsVMj7swUQSJVL2VCeh5KaXUmUh/Q5W7XzWEkS4IEVxj8dtgnus9mIXvdnyA
 QCg4d1P7CILXajEaJmg7fMpalPeu55uC4wKuxJwKS2eEBfc2sX0K22yCYwUKQxKiNGXr
 Ig3g==
X-Forwarded-Encrypted: i=1;
 AJvYcCXoaeVjSR7kqw9eJtQMdw6ZQ9lu3QfHHQ/GmGXDxTPUlX8XiF47pC5RqpOtyvTAFulPyMwKl53841Q=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yx1XUD/on8WdN5Lnvzgw9FS0tfYQF2/IxxymspGfWs8Aluw+SlO
 WsT28Nx9h20Qw5P7KFxRKLXxlFi16p8EWcrgVnE2rV56RspfXH4iNcZpym+XvTI=
X-Gm-Gg: ASbGncuwCBSjvz6xxvo5ebuaMGzK/iNvAyh30yfYlt81eK8xOguFuGbiyxiVrN4+EmH
 kk9TOHGkMN+dn2Sd/lPYmPC2pilZ84BGAm9Hudtf6SlutcsYNa4pJxAKov2MTwdh5Po2XtGFgGM
 EZW7h2F7wGpexaj0EZNYfDDxARpEouES9LzMqv2zaP/p7rbZgz+OLBTAlmmjYgIP/sf72v/9Qgi
 MOGSE3mUwlX5jdi5i3zErLEI085ptPP5cFPjk/Km0Vcx7ZOGHGJFwLTJb/29kGw50U4H3DTPXq2
 FApkCTnEpljyvNbQn6M58uJvUX30a4yn/xaxaTGdas/mw1lwvO29eN0IZApmHDc=
X-Google-Smtp-Source: AGHT+IGVf8MxbpkAU9HqqZmA/jVqKf1xEVujvougTjPKVL/Z0oIU+ggvLP+fYJeMXLuFrQNOnmqtyw==
X-Received: by 2002:a17:907:1b0d:b0:aca:c532:cf07 with SMTP id
 a640c23a62f3a-acedc65d3famr272653566b.35.1746004040489; 
 Wed, 30 Apr 2025 02:07:20 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:5485:d4b2:c087:b497])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-acebe7a4ee8sm313017166b.74.2025.04.30.02.07.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 30 Apr 2025 02:07:19 -0700 (PDT)
Date: Wed, 30 Apr 2025 11:07:17 +0200
From: Simona Vetter <simona.vetter@ffwll.ch>
To: Thomas Zimmermann <tzimmermann@suse.de>
Cc: simona@ffwll.ch, airlied@gmail.com, asrivats@redhat.com,
 andyshrk@163.com, christian.koenig@amd.com,
 boris.brezillon@collabora.com, mripard@kernel.org,
 maarten.lankhorst@linux.intel.com, dri-devel@lists.freedesktop.org,
 Sumit Semwal <sumit.semwal@linaro.org>, linux-media@vger.kernel.org,
 linaro-mm-sig@lists.linaro.org
Subject: Re: [PATCH v3] drm/gem: Internally test import_attach for imported
 objects
Message-ID: <aBHoRTdsdOLFhzfg@phenom.ffwll.local>
References: <20250416065820.26076-1-tzimmermann@suse.de>
 <Z_96e7Lv-sEDUS6U@phenom.ffwll.local>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <Z_96e7Lv-sEDUS6U@phenom.ffwll.local>
X-Operating-System: Linux phenom 6.12.22-amd64 
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

On Wed, Apr 16, 2025 at 11:38:03AM +0200, Simona Vetter wrote:
> On Wed, Apr 16, 2025 at 08:57:45AM +0200, Thomas Zimmermann wrote:
> > Test struct drm_gem_object.import_attach to detect imported objects.
> > 
> > During object clenanup, the dma_buf field might be NULL. Testing it in
> > an object's free callback then incorrectly does a cleanup as for native
> > objects. Happens for calls to drm_mode_destroy_dumb_ioctl() that
> > clears the dma_buf field in drm_gem_object_exported_dma_buf_free().
> > 
> > v3:
> > - only test for import_attach (Boris)
> > v2:
> > - use import_attach.dmabuf instead of dma_buf (Christian)
> > 
> > Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> > Fixes: b57aa47d39e9 ("drm/gem: Test for imported GEM buffers with helper")
> > Reported-by: Andy Yan <andyshrk@163.com>
> > Closes: https://lore.kernel.org/dri-devel/38d09d34.4354.196379aa560.Coremail.andyshrk@163.com/
> > Tested-by: Andy Yan <andyshrk@163.com>
> > Cc: Thomas Zimmermann <tzimmermann@suse.de>
> > Cc: Anusha Srivatsa <asrivats@redhat.com>
> > Cc: Christian König <christian.koenig@amd.com>
> > Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> > Cc: Maxime Ripard <mripard@kernel.org>
> > Cc: David Airlie <airlied@gmail.com>
> > Cc: Simona Vetter <simona@ffwll.ch>
> > Cc: Sumit Semwal <sumit.semwal@linaro.org>
> > Cc: "Christian König" <christian.koenig@amd.com>
> > Cc: dri-devel@lists.freedesktop.org
> > Cc: linux-media@vger.kernel.org
> > Cc: linaro-mm-sig@lists.linaro.org
> 
> Reviewed-by: Simona Vetter <simona.vetter@ffwll.ch>

Also quick doc request: We do have a bit of overview documentation for
prime here about specifically this lifetime fun, and why there's a chain
of references and hence a distinction between imported foreign dma-buf and
re-imported native dma-buf:

https://dri.freedesktop.org/docs/drm/gpu/drm-mm.html#reference-counting-for-gem-drivers

I think it would be good to augment this with more links to functions
(like this one recently added and fixed in this patch here) and struct
members to that overview. And maybe also link from key function and struct
functions back to that overview doc. Otherwise I think the next person
will get confused by this rather tricky code again and break a corner
cases.

Thanks, Sima

> 
> > ---
> >  include/drm/drm_gem.h | 3 +--
> >  1 file changed, 1 insertion(+), 2 deletions(-)
> > 
> > diff --git a/include/drm/drm_gem.h b/include/drm/drm_gem.h
> > index 9b71f7a9f3f8..a3133a08267c 100644
> > --- a/include/drm/drm_gem.h
> > +++ b/include/drm/drm_gem.h
> > @@ -588,8 +588,7 @@ static inline bool drm_gem_object_is_shared_for_memory_stats(struct drm_gem_obje
> >   */
> >  static inline bool drm_gem_is_imported(const struct drm_gem_object *obj)
> >  {
> > -	/* The dma-buf's priv field points to the original GEM object. */
> > -	return obj->dma_buf && (obj->dma_buf->priv != obj);
> > +	return !!obj->import_attach;
> >  }
> >  
> >  #ifdef CONFIG_LOCKDEP
> > -- 
> > 2.49.0
> > 
> 
> -- 
> Simona Vetter
> Software Engineer, Intel Corporation
> http://blog.ffwll.ch

-- 
Simona Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
