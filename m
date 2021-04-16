Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 60F7A361BC3
	for <lists+dri-devel@lfdr.de>; Fri, 16 Apr 2021 10:59:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BA3F76E077;
	Fri, 16 Apr 2021 08:59:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x22b.google.com (mail-oi1-x22b.google.com
 [IPv6:2607:f8b0:4864:20::22b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BBCB86E077
 for <dri-devel@lists.freedesktop.org>; Fri, 16 Apr 2021 08:59:47 +0000 (UTC)
Received: by mail-oi1-x22b.google.com with SMTP id n140so27148351oig.9
 for <dri-devel@lists.freedesktop.org>; Fri, 16 Apr 2021 01:59:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=WZ+bnGnpsoi7GJdxGnwS9La8Mmph6x8eFVAkv3tkCJ0=;
 b=XOd5tcInrT+wFJzWLDmtiBgzwTuYVut3SeJ8AiKM7B0XMfoq5FuO/zi+ZiG5rw0Z6e
 aWOqqC1TC2WZHHUoEuFvQtYu4FR3rWWFa6dezaZDXfFqldpdwhG7aP01CokcL7XI7O/x
 BAqxlo88/ff01rf+jikJFVsE7TTxNXZ8mxO6k=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=WZ+bnGnpsoi7GJdxGnwS9La8Mmph6x8eFVAkv3tkCJ0=;
 b=DBVUYq9iDKmVq3YYSJq3LCF4ZQ2zsTaioKdf0zQleRwSQonrYgkxKG/pPWRg9UVIuz
 BxlS0cEiN7+KXgyYJlODGADIpcHOoWEgZnb8Ul47yRhnLhCo8MgFTVatMFWkDzBWs6hJ
 QxMcaDtfgDtumOsQC0/HzcYfnvnuuuRJSjDoQd6a210+ELFVOIisXhRsbsw8vP33ZcHu
 2hG5vlNE3MafYBdw5UjdMAWjTIfH4ruU4klePF6LaCJn0rSgNjAC1fr12lOBQGsjDRGQ
 SfDzAsS42NtvoGRxLFIsVw/bczQb0n3QOFH6JsW+DS+y6ZZeuZMEtMisgWY41vyeKGi8
 8xFQ==
X-Gm-Message-State: AOAM533NgagToglLq+OREuj9iBT0J74ons+Jop0kcfyTa5rWkZNlC07f
 mjJPkP3vDPGLy7n2ZjK417Vl6KA/vVI4Guf5OusRxw==
X-Google-Smtp-Source: ABdhPJwTiMpnCJKVspYncfifApG4qMTjYSt1UMjmECwcmarPoovDI00TAeuDF3wERgTSrgDJhkWbKdAJmOpboz0gKx0=
X-Received: by 2002:a05:6808:699:: with SMTP id
 k25mr1078691oig.101.1618563587137; 
 Fri, 16 Apr 2021 01:59:47 -0700 (PDT)
MIME-Version: 1.0
References: <20210415155958.391624-1-matthew.auld@intel.com>
 <20210415155958.391624-3-matthew.auld@intel.com>
 <5de63e24-51f0-71eb-b992-484da998e65f@freedesktop.org>
In-Reply-To: <5de63e24-51f0-71eb-b992-484da998e65f@freedesktop.org>
From: Daniel Vetter <daniel@ffwll.ch>
Date: Fri, 16 Apr 2021 10:59:36 +0200
Message-ID: <CAKMK7uH-K=CmMtwi3FcVsGdTGRwYtxDXhAgohz1_WWQL-RQzEw@mail.gmail.com>
Subject: Re: [Mesa-dev] [PATCH v3 3/4] drm/i915/uapi: convert i915_query and
 friend to kernel doc
To: Ian Romanick <idr@freedesktop.org>,
 Linux Doc Mailing List <linux-doc@vger.kernel.org>, 
 Jonathan Corbet <corbet@lwn.net>
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
Cc: intel-gfx <intel-gfx@lists.freedesktop.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Kenneth Graunke <kenneth@whitecape.org>, Matthew Auld <matthew.auld@intel.com>,
 Daniel Vetter <daniel.vetter@intel.com>,
 Mesa Dev <mesa-dev@lists.freedesktop.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Apr 16, 2021 at 12:25 AM Ian Romanick <idr@freedesktop.org> wrote:
> On 4/15/21 8:59 AM, Matthew Auld wrote:
> > Add a note about the two-step process.
> >
> > Suggested-by: Daniel Vetter <daniel@ffwll.ch>
> > Signed-off-by: Matthew Auld <matthew.auld@intel.com>
> > Cc: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
> > Cc: Jordan Justen <jordan.l.justen@intel.com>
> > Cc: Daniel Vetter <daniel.vetter@intel.com>
> > Cc: Kenneth Graunke <kenneth@whitecape.org>
> > Cc: Jason Ekstrand <jason@jlekstrand.net>
> > Cc: Dave Airlie <airlied@gmail.com>
> > Cc: dri-devel@lists.freedesktop.org
> > Cc: mesa-dev@lists.freedesktop.org
> > ---
> >  include/uapi/drm/i915_drm.h | 57 ++++++++++++++++++++++++++++++-------
> >  1 file changed, 46 insertions(+), 11 deletions(-)
> >
> > diff --git a/include/uapi/drm/i915_drm.h b/include/uapi/drm/i915_drm.h
> > index d9c954a5a456..ef36f1a0adde 100644
> > --- a/include/uapi/drm/i915_drm.h
> > +++ b/include/uapi/drm/i915_drm.h
> > @@ -2210,14 +2210,23 @@ struct drm_i915_perf_oa_config {
> >       __u64 flex_regs_ptr;
> >  };
> >
> > +/**
> > + * struct drm_i915_query_item - An individual query for the kernel to process.
> > + *
> > + * The behaviour is determined by the @query_id. Note that exactly what
>
> Since we just had a big discussion about this on mesa-dev w.r.t. Mesa
> code and documentation... does the kernel have a policy about which
> flavor (pun intended) of English should be used?

I'm not finding it documented in
https://dri.freedesktop.org/docs/drm/doc-guide/sphinx.html but I
thought we've discussed it. Adding linux-doc and Jon Corbet.
-Daniel

>
> > + * @data_ptr is also depends on the specific @query_id.
> > + */
> >  struct drm_i915_query_item {
> > +     /** @query_id: The id for this query */
> >       __u64 query_id;
> >  #define DRM_I915_QUERY_TOPOLOGY_INFO    1
> >  #define DRM_I915_QUERY_ENGINE_INFO   2
> >  #define DRM_I915_QUERY_PERF_CONFIG      3
> >  /* Must be kept compact -- no holes and well documented */
> >
> > -     /*
> > +     /**
> > +      * @length:
> > +      *
> >        * When set to zero by userspace, this is filled with the size of the
> >        * data to be written at the data_ptr pointer. The kernel sets this
> >        * value to a negative value to signal an error on a particular query
> > @@ -2225,21 +2234,26 @@ struct drm_i915_query_item {
> >        */
> >       __s32 length;
> >
> > -     /*
> > +     /**
> > +      * @flags:
> > +      *
> >        * When query_id == DRM_I915_QUERY_TOPOLOGY_INFO, must be 0.
> >        *
> >        * When query_id == DRM_I915_QUERY_PERF_CONFIG, must be one of the
> > -      * following :
> > -      *         - DRM_I915_QUERY_PERF_CONFIG_LIST
> > -      *         - DRM_I915_QUERY_PERF_CONFIG_DATA_FOR_UUID
> > -      *         - DRM_I915_QUERY_PERF_CONFIG_FOR_UUID
> > +      * following:
> > +      *
> > +      *      - DRM_I915_QUERY_PERF_CONFIG_LIST
> > +      *      - DRM_I915_QUERY_PERF_CONFIG_DATA_FOR_UUID
> > +      *      - DRM_I915_QUERY_PERF_CONFIG_FOR_UUID
> >        */
> >       __u32 flags;
> >  #define DRM_I915_QUERY_PERF_CONFIG_LIST          1
> >  #define DRM_I915_QUERY_PERF_CONFIG_DATA_FOR_UUID 2
> >  #define DRM_I915_QUERY_PERF_CONFIG_DATA_FOR_ID   3
> >
> > -     /*
> > +     /**
> > +      * @data_ptr:
> > +      *
> >        * Data will be written at the location pointed by data_ptr when the
> >        * value of length matches the length of the data to be written by the
> >        * kernel.
> > @@ -2247,16 +2261,37 @@ struct drm_i915_query_item {
> >       __u64 data_ptr;
> >  };
> >
> > +/**
> > + * struct drm_i915_query - Supply an array of drm_i915_query_item for the kernel
> > + * to fill out.
> > + *
> > + * Note that this is generally a two step process for each drm_i915_query_item
> > + * in the array:
> > + *
> > + *   1.) Call the DRM_IOCTL_I915_QUERY, giving it our array of
> > + *   drm_i915_query_item, with drm_i915_query_item.size set to zero. The
> > + *   kernel will then fill in the size, in bytes, which tells userspace how
> > + *   memory it needs to allocate for the blob(say for an array of
> > + *   properties).
> > + *
> > + *   2.) Next we call DRM_IOCTL_I915_QUERY again, this time with the
> > + *   drm_i915_query_item.data_ptr equal to our newly allocated blob. Note
> > + *   that the i915_query_item.size should still be the same as what the
> > + *   kernel previously set. At this point the kernel can fill in the blob.
> > + *
> > + */
> >  struct drm_i915_query {
> > +     /** @num_items: The number of elements in the @items_ptr array */
> >       __u32 num_items;
> >
> > -     /*
> > -      * Unused for now. Must be cleared to zero.
> > +     /**
> > +      * @flags: Unused for now. Must be cleared to zero.
> >        */
> >       __u32 flags;
> >
> > -     /*
> > -      * This points to an array of num_items drm_i915_query_item structures.
> > +     /**
> > +      * @items_ptr: This points to an array of num_items drm_i915_query_item
> > +      * structures.
> >        */
> >       __u64 items_ptr;
> >  };
> >
>
> _______________________________________________
> mesa-dev mailing list
> mesa-dev@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/mesa-dev



-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
