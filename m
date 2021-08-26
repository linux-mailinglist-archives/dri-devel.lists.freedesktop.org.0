Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9056C3F84FE
	for <lists+dri-devel@lfdr.de>; Thu, 26 Aug 2021 12:03:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 52F426E5B4;
	Thu, 26 Aug 2021 10:03:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com
 [IPv6:2a00:1450:4864:20::432])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6B8536E5AE
 for <dri-devel@lists.freedesktop.org>; Thu, 26 Aug 2021 10:03:33 +0000 (UTC)
Received: by mail-wr1-x432.google.com with SMTP id n5so4061619wro.12
 for <dri-devel@lists.freedesktop.org>; Thu, 26 Aug 2021 03:03:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=bRMTRRe2MmMhR3nWU+qJg2RgbplY6jjx1WTXVPesMt8=;
 b=SDQUxKE+oGBtXP625yalNYEJhGNIg+liIOPfmNYRm0vLOl63rDBSjDcPqpb7aMzt+G
 1xd6isL5oBi3JE/Yq4bsitd3KbojLUj1vp23IuRglfGLv76fKLhaqHeziQTPLbFDytfJ
 1CKrAGWJHLjzSevX2pYZ7Rbalmd0xFzCyTnm8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=bRMTRRe2MmMhR3nWU+qJg2RgbplY6jjx1WTXVPesMt8=;
 b=ZgrmIYTeNE+b2U5EmByRVv5Om1dXg5prL0alpnA9oD9L6HJcGa1eWqRGoejVoiWkMM
 MJ9n1lXUuSNy/oAi7FVdvOKpoe6cAQKT+FxCuWqlZeYrmqT64gQ8xSmF54jzGhTs0vgu
 EyUAFXQeeJXO+38twaCUv29e0r3IqLrPnFVsuWlzcPmyEtsdJJePRmy4otDflZSpvQn1
 5YBs0ev88zc6LmSxGDmWyivaZ2H99ZaE2nbBKpIRZx76BStYDzOh+RxJxWaGdKM6MalZ
 SC4RnjeEqGdMe8wOzEf2YodVAO0BHw+q9mOiTeF13kPqs6MVLiPcbfjPA/XCthkvHpVt
 /omQ==
X-Gm-Message-State: AOAM530koTyYjZiQvnGPiskffpuKo/C5/nWUtDFEGI/du42wDBHWo7//
 roy6qsNzSR3PEfTNHD7nOo8/gw==
X-Google-Smtp-Source: ABdhPJwR2VyHPaI37Q8vjVNlQvddWuaRaj2Km1GhjHfLm2vSaFZC9OSNOFZaCbTzL+jSgZ57JErTRw==
X-Received: by 2002:adf:f90e:: with SMTP id b14mr3056213wrr.28.1629972212052; 
 Thu, 26 Aug 2021 03:03:32 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id w14sm2537559wrt.23.2021.08.26.03.03.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 26 Aug 2021 03:03:31 -0700 (PDT)
Date: Thu, 26 Aug 2021 12:03:29 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
Cc: Daniel Vetter <daniel@ffwll.ch>, Matthew Auld <matthew.auld@intel.com>,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Subject: Re: [PATCH 2/2] drm/i915/debugfs: hook up ttm_resource_manager_debug
Message-ID: <YSdm8UwhfthWziM9@phenom.ffwll.local>
References: <20210818145850.225387-1-matthew.auld@intel.com>
 <20210818145850.225387-2-matthew.auld@intel.com>
 <811cc4bfb6262d9050140ed9a9eac1dd7632d33a.camel@linux.intel.com>
 <YSdcAD7Pa+e93xqh@phenom.ffwll.local>
 <4d14b5f5f74d279d666077de28f5de7f6d721509.camel@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <4d14b5f5f74d279d666077de28f5de7f6d721509.camel@linux.intel.com>
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

On Thu, Aug 26, 2021 at 11:51:44AM +0200, Thomas Hellström wrote:
> On Thu, 2021-08-26 at 11:16 +0200, Daniel Vetter wrote:
> > On Thu, Aug 19, 2021 at 09:32:20AM +0200, Thomas Hellström wrote:
> > > On Wed, 2021-08-18 at 15:58 +0100, Matthew Auld wrote:
> > > > This should give a more complete view of the various bits of
> > > > internal
> > > > resource manager state, for device local-memory.
> > > > 
> > > > Signed-off-by: Matthew Auld <matthew.auld@intel.com>
> > > > Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
> > > > ---
> > > >  drivers/gpu/drm/i915/i915_debugfs.c | 12 +++++++++---
> > > >  1 file changed, 9 insertions(+), 3 deletions(-)
> > > > 
> > > > diff --git a/drivers/gpu/drm/i915/i915_debugfs.c
> > > > b/drivers/gpu/drm/i915/i915_debugfs.c
> > > > index eec0d349ea6a..109e6feed6be 100644
> > > > --- a/drivers/gpu/drm/i915/i915_debugfs.c
> > > > +++ b/drivers/gpu/drm/i915/i915_debugfs.c
> > > > @@ -238,6 +238,7 @@ i915_debugfs_describe_obj(struct seq_file *m,
> > > > struct drm_i915_gem_object *obj)
> > > >  static int i915_gem_object_info(struct seq_file *m, void *data)
> > > >  {
> > > >         struct drm_i915_private *i915 = node_to_i915(m->private);
> > > > +       struct drm_printer p = drm_seq_file_printer(m);
> > > >         struct intel_memory_region *mr;
> > > >         enum intel_region_id id;
> > > >  
> > > > @@ -245,9 +246,14 @@ static int i915_gem_object_info(struct
> > > > seq_file
> > > > *m, void *data)
> > > >                    i915->mm.shrink_count,
> > > >                    atomic_read(&i915->mm.free_count),
> > > >                    i915->mm.shrink_memory);
> > > > -       for_each_memory_region(mr, i915, id)
> > > > -               seq_printf(m, "%s: total:%pa, available:%pa
> > > > bytes\n",
> > > > -                          mr->name, &mr->total, &mr->avail);
> > > > +       for_each_memory_region(mr, i915, id) {
> > > > +               seq_printf(m, "%s: ", mr->name);
> > > > +               if (mr->region_private)
> > > > +                       ttm_resource_manager_debug(mr-
> > > > > region_private, &p);
> > > > +               else
> > > > +                       seq_printf(m, "total:%pa, available:%pa
> > > > bytes\n",
> > > > +                                  &mr->total, &mr->avail);
> > > 
> > > Hm. Shouldn't we make the above intel_memory_region_debug() or
> > > perhaps
> > > intel_memory_region_info() to avoid using memory region internals
> > > directly here?
> > 
> > Imo we should just emebed ttm_resource_mager into our own and not try
> > to
> > abstract this all away that much. At least in upstream there is just
> > not
> > going to be another memory region implementation, and for backporting
> > I'm
> > not sure these abstractions really help that much - we're touching
> > all the
> > same code still in the end.
> 
> Hmm, yes. Here I was seeing the separation between the debugfs code and
> the intel_memory_region code, rather between the latter and TTM.
> 
> The i915 driver is currently much "everything uses everything" which
> IMHO is not really good for code understanding and maintainance.

Ah yes I agree, we don't have clear seperation of concerns really, and
debugfs is all over. I got confused a bit with the ->region_private
pointer and thought you'd be talking about that.

My experience has been that going over the interface functions and trying
to kerneldoc helps a lot with this, because instead of documenting some
major confusion you can just clean it up first. We should definitely try
to componentize stuff more and not leak internal details all over the
place.
-Daniel
-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
