Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 497D83F845B
	for <lists+dri-devel@lfdr.de>; Thu, 26 Aug 2021 11:16:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 459426E58E;
	Thu, 26 Aug 2021 09:16:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com
 [IPv6:2a00:1450:4864:20::32b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1B0036E588
 for <dri-devel@lists.freedesktop.org>; Thu, 26 Aug 2021 09:16:52 +0000 (UTC)
Received: by mail-wm1-x32b.google.com with SMTP id
 j17-20020a05600c1c1100b002e754875260so1738174wms.4
 for <dri-devel@lists.freedesktop.org>; Thu, 26 Aug 2021 02:16:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=skG8yCwiOWugx8gx7YJ5upxzFW9tj0IcoOiuDGazDBo=;
 b=B362FGxpEULq/l7XWSQ8usN9qzsJXNK7VlslW6wZ4hKG6WW1spyFcA5zhuuT4UYaqq
 hgJ2OuA0StZz7DNmoh/HIajG27Or4WqDuJnfBE8Rz607IH8HR2Rqf8p+dFKGLEA01QDQ
 w1gHkX0HhemgzPDtJ4qupLmaK6/pSSFXSRRmQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=skG8yCwiOWugx8gx7YJ5upxzFW9tj0IcoOiuDGazDBo=;
 b=N01/a5JU81gO/kXFQaJxnMBm5rFH54obJn+0VKh6/yLrAJBZ+VTlXRFTsAKpM9NydK
 wdM6LWo5wtuhyLGehOWQH4xaH4ZHJz/FzfZN1ZI6mANFctUFuvYe+tzersDMJOZszRJm
 PIPrP2dwhwIuS/oIRgvUweQuE7b/bh9WRtlC2a6Dy4jnjaF/IX2FdnL6tndq2sqn/AWb
 BvdT/tb/d6Y/Zlv0OBOgK6gK1LCRknsMJB53xJXlD69eWQv1Lv1lJs5QDSP25XBGAL1Z
 TCZmTz99Iynb1/0/E7hJkE0IiTM0pjwESKom/vDWVVuJDnl7qOiVddYbGwQ5TXaKZvTc
 7xaQ==
X-Gm-Message-State: AOAM530U9DRh8iU/j9H/k9xAksJ7Fz6jZ7Zzh6KG8qrD68M+3rX6Vrsa
 r6RjV0rk31/LD0saQjCQ3Q0qJQ==
X-Google-Smtp-Source: ABdhPJy3PUMtjLiv9heFe2oQb7yGeQjzYJyCSffpxz8qfeEfD4DS7nv2CvLO3m4hOrwflOsPVi4VGw==
X-Received: by 2002:a1c:f706:: with SMTP id v6mr13329253wmh.167.1629969410655; 
 Thu, 26 Aug 2021 02:16:50 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id c190sm2072356wma.21.2021.08.26.02.16.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 26 Aug 2021 02:16:50 -0700 (PDT)
Date: Thu, 26 Aug 2021 11:16:48 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
Cc: Matthew Auld <matthew.auld@intel.com>, intel-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Subject: Re: [PATCH 2/2] drm/i915/debugfs: hook up ttm_resource_manager_debug
Message-ID: <YSdcAD7Pa+e93xqh@phenom.ffwll.local>
References: <20210818145850.225387-1-matthew.auld@intel.com>
 <20210818145850.225387-2-matthew.auld@intel.com>
 <811cc4bfb6262d9050140ed9a9eac1dd7632d33a.camel@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <811cc4bfb6262d9050140ed9a9eac1dd7632d33a.camel@linux.intel.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Aug 19, 2021 at 09:32:20AM +0200, Thomas Hellström wrote:
> On Wed, 2021-08-18 at 15:58 +0100, Matthew Auld wrote:
> > This should give a more complete view of the various bits of internal
> > resource manager state, for device local-memory.
> > 
> > Signed-off-by: Matthew Auld <matthew.auld@intel.com>
> > Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
> > ---
> >  drivers/gpu/drm/i915/i915_debugfs.c | 12 +++++++++---
> >  1 file changed, 9 insertions(+), 3 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/i915/i915_debugfs.c
> > b/drivers/gpu/drm/i915/i915_debugfs.c
> > index eec0d349ea6a..109e6feed6be 100644
> > --- a/drivers/gpu/drm/i915/i915_debugfs.c
> > +++ b/drivers/gpu/drm/i915/i915_debugfs.c
> > @@ -238,6 +238,7 @@ i915_debugfs_describe_obj(struct seq_file *m,
> > struct drm_i915_gem_object *obj)
> >  static int i915_gem_object_info(struct seq_file *m, void *data)
> >  {
> >         struct drm_i915_private *i915 = node_to_i915(m->private);
> > +       struct drm_printer p = drm_seq_file_printer(m);
> >         struct intel_memory_region *mr;
> >         enum intel_region_id id;
> >  
> > @@ -245,9 +246,14 @@ static int i915_gem_object_info(struct seq_file
> > *m, void *data)
> >                    i915->mm.shrink_count,
> >                    atomic_read(&i915->mm.free_count),
> >                    i915->mm.shrink_memory);
> > -       for_each_memory_region(mr, i915, id)
> > -               seq_printf(m, "%s: total:%pa, available:%pa bytes\n",
> > -                          mr->name, &mr->total, &mr->avail);
> > +       for_each_memory_region(mr, i915, id) {
> > +               seq_printf(m, "%s: ", mr->name);
> > +               if (mr->region_private)
> > +                       ttm_resource_manager_debug(mr-
> > >region_private, &p);
> > +               else
> > +                       seq_printf(m, "total:%pa, available:%pa
> > bytes\n",
> > +                                  &mr->total, &mr->avail);
> 
> Hm. Shouldn't we make the above intel_memory_region_debug() or perhaps
> intel_memory_region_info() to avoid using memory region internals
> directly here?

Imo we should just emebed ttm_resource_mager into our own and not try to
abstract this all away that much. At least in upstream there is just not
going to be another memory region implementation, and for backporting I'm
not sure these abstractions really help that much - we're touching all the
same code still in the end.
-Daniel
-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
