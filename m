Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0526037AD47
	for <lists+dri-devel@lfdr.de>; Tue, 11 May 2021 19:43:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 98E6E893BC;
	Tue, 11 May 2021 17:43:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x630.google.com (mail-ej1-x630.google.com
 [IPv6:2a00:1450:4864:20::630])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EECC86EA9F
 for <dri-devel@lists.freedesktop.org>; Tue, 11 May 2021 17:43:33 +0000 (UTC)
Received: by mail-ej1-x630.google.com with SMTP id f24so31008026ejc.6
 for <dri-devel@lists.freedesktop.org>; Tue, 11 May 2021 10:43:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=AZhNnFcPQrQjgVydw2wz733q1rpLMdLlGxTfcTd0pQA=;
 b=lKkdv4mbno3DMZja8jgSnfcESoU079DYs4l0E5YRfFuhqZ1TIZSvbogSVG9xMrSpFm
 9/bjH5PoLMqka5QRerR5peqwF9r/lW9vtrMkrm8g2plH0h/vkf+NwSDqQaSgywCv4vPn
 DHMQsfWVFw7wQix6ztYxD/5q3BzEIPG4I/aC4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=AZhNnFcPQrQjgVydw2wz733q1rpLMdLlGxTfcTd0pQA=;
 b=Ta9fLJnwqDla7X0crUQ7KSd2RRU2k1vZHYNmjFwwAW5e1HUQfsuSUZOKxbdRKqbwW9
 r69iz4e2RhPQjUF5Kumx4oCTaVzrb+FGChotfAQxfwPvp+P4bJ2fBsrlZGPaCbRpTnKE
 1Hc4+aZ6JusRZP86id/m9qDDczrLm5BATz03iE0qQ3JsM7D3vfSTdKpjfpTFGaboWXOv
 BiAPl96bbDwuV3VrVwC52JMGC55iUk+TxUDYSWJJyQifr3vVvonbFbqelJnL39prAO+Y
 R2YuCOXlnkDSBV+nlHKaEzf5/+yfATeEPk3PunPDOwlylJIncAyY/KRbxUz8LOZrW/PF
 ZeDw==
X-Gm-Message-State: AOAM530cd50/c78kSS5b68pTU77upQfbBOEdXLhlM2uWv7slLPrYcICc
 92ZviQap+rBOGXs9TKTbcSbKvA==
X-Google-Smtp-Source: ABdhPJzoye8TjGAaAwWXQWOlQ/domjjH3e9Rw/KpZmuhqBHp7e6+Qnz/0i5wWhit1yYtIZ/Rxb5o3w==
X-Received: by 2002:a17:906:b5b:: with SMTP id
 v27mr32970674ejg.40.1620755012463; 
 Tue, 11 May 2021 10:43:32 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id ks10sm12215000ejb.41.2021.05.11.10.43.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 11 May 2021 10:43:32 -0700 (PDT)
Date: Tue, 11 May 2021 19:43:30 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Matthew Brost <matthew.brost@intel.com>
Subject: Re: [RFC PATCH 43/97] drm/i915/guc: Add lrc descriptor context
 lookup array
Message-ID: <YJrCQr+UYjQoONIW@phenom.ffwll.local>
References: <20210506191451.77768-1-matthew.brost@intel.com>
 <20210506191451.77768-44-matthew.brost@intel.com>
 <YJqiKksSqBpUDvPJ@phenom.ffwll.local>
 <20210511170124.GA30040@sdutt-i7>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210511170124.GA30040@sdutt-i7>
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
Cc: tvrtko.ursulin@intel.com, intel-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, jason.ekstrand@intel.com,
 daniele.ceraolospurio@intel.com, jon.bloomfield@intel.com,
 daniel.vetter@intel.com, john.c.harrison@intel.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, May 11, 2021 at 10:01:28AM -0700, Matthew Brost wrote:
> On Tue, May 11, 2021 at 05:26:34PM +0200, Daniel Vetter wrote:
> > On Thu, May 06, 2021 at 12:13:57PM -0700, Matthew Brost wrote:
> > > Add lrc descriptor context lookup array which can resolve the
> > > intel_context from the lrc descriptor index. In addition to lookup, it
> > > can determine in the lrc descriptor context is currently registered with
> > > the GuC by checking if an entry for a descriptor index is present.
> > > Future patches in the series will make use of this array.
> > > 
> > > Cc: John Harrison <john.c.harrison@intel.com>
> > > Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> > > ---
> > >  drivers/gpu/drm/i915/gt/uc/intel_guc.h        |  5 +++
> > >  .../gpu/drm/i915/gt/uc/intel_guc_submission.c | 32 +++++++++++++++++--
> > >  2 files changed, 35 insertions(+), 2 deletions(-)
> > > 
> > > diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc.h b/drivers/gpu/drm/i915/gt/uc/intel_guc.h
> > > index d84f37afb9d8..2eb6c497e43c 100644
> > > --- a/drivers/gpu/drm/i915/gt/uc/intel_guc.h
> > > +++ b/drivers/gpu/drm/i915/gt/uc/intel_guc.h
> > > @@ -6,6 +6,8 @@
> > >  #ifndef _INTEL_GUC_H_
> > >  #define _INTEL_GUC_H_
> > >  
> > > +#include "linux/xarray.h"
> > > +
> > >  #include "intel_uncore.h"
> > >  #include "intel_guc_fw.h"
> > >  #include "intel_guc_fwif.h"
> > > @@ -47,6 +49,9 @@ struct intel_guc {
> > >  	struct i915_vma *lrc_desc_pool;
> > >  	void *lrc_desc_pool_vaddr;
> > >  
> > > +	/* guc_id to intel_context lookup */
> > > +	struct xarray context_lookup;
> > 
> > The current code sets a disastrous example, but for stuff like this it's
> > always good to explain the locking, and who's holding references and how
> > you're handling cycles. Since I guess the intel_context also holds the
> > guc_id alive somehow.
> > 
> 
> I think (?) I know what you mean by this comment. How about adding:
> 
> 'If an entry in the the context_lookup is present, that means a context
> associated with the guc_id is registered with the GuC. We use this xarray as a
> lookup mechanism when the GuC communicate with the i915 about the context.'

So no idea how this works, but generally we put a "Protecte by
&struct.lock" or similar in here (so you get a nice link plus something
you can use as jump label in your ide too). Plus since intel_context has
some lifetime rules, explaining whether you're allowed to use the pointer
after you unlock, or whether you need to grab a reference or what exactly
is going on. Usually there's three options:

- No refcounting, you cannot access a pointer obtained through this after
  you unluck.
- Weak reference, you upgrade to a full reference with
  kref_get_unless_zero. If that fails it indicates a lookup failure, since
  you raced with destruction. If it succeeds you can use the pointer after
  unlock.
- Strong reference, you get your own reference that stays valid with
  kref_get().

I'm just bringing this up because the current i915-gem code is full of
very tricky locking and lifetime rules, and explains roughly nothing of it
in the data structures. Minimally some hints about the locking/lifetime
rules of important structs should be there.

For locking rules it's good to double-down on them by adding
lockdep_assert_held to all relevant functions (where appropriate only
ofc).

What I generally don't think makes sense is to then also document the
locking in the kerneldoc for the functions. That tends to be one place too
many and ime just gets out of date and not useful at all.

> > Again holds for the entire series, where it makes sense (as in we don't
> > expect to rewrite the entire code anyway).
> 
> Slightly out of order but one of the last patches in the series, 'Update GuC
> documentation' adds a big section of comments that attempts to clarify how all
> of this code works. I likely should add a section explaining the data structures
> as well.

Yeah that would be nice.
-Daniel


> 
> Matt
> 
> > -Daniel
> > 
> > > +
> > >  	/* Control params for fw initialization */
> > >  	u32 params[GUC_CTL_MAX_DWORDS];
> > >  
> > > diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
> > > index 6acc1ef34f92..c2b6d27404b7 100644
> > > --- a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
> > > +++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
> > > @@ -65,8 +65,6 @@ static inline struct i915_priolist *to_priolist(struct rb_node *rb)
> > >  	return rb_entry(rb, struct i915_priolist, node);
> > >  }
> > >  
> > > -/* Future patches will use this function */
> > > -__attribute__ ((unused))
> > >  static struct guc_lrc_desc *__get_lrc_desc(struct intel_guc *guc, u32 index)
> > >  {
> > >  	struct guc_lrc_desc *base = guc->lrc_desc_pool_vaddr;
> > > @@ -76,6 +74,15 @@ static struct guc_lrc_desc *__get_lrc_desc(struct intel_guc *guc, u32 index)
> > >  	return &base[index];
> > >  }
> > >  
> > > +static inline struct intel_context *__get_context(struct intel_guc *guc, u32 id)
> > > +{
> > > +	struct intel_context *ce = xa_load(&guc->context_lookup, id);
> > > +
> > > +	GEM_BUG_ON(id >= GUC_MAX_LRC_DESCRIPTORS);
> > > +
> > > +	return ce;
> > > +}
> > > +
> > >  static int guc_lrc_desc_pool_create(struct intel_guc *guc)
> > >  {
> > >  	u32 size;
> > > @@ -96,6 +103,25 @@ static void guc_lrc_desc_pool_destroy(struct intel_guc *guc)
> > >  	i915_vma_unpin_and_release(&guc->lrc_desc_pool, I915_VMA_RELEASE_MAP);
> > >  }
> > >  
> > > +static inline void reset_lrc_desc(struct intel_guc *guc, u32 id)
> > > +{
> > > +	struct guc_lrc_desc *desc = __get_lrc_desc(guc, id);
> > > +
> > > +	memset(desc, 0, sizeof(*desc));
> > > +	xa_erase_irq(&guc->context_lookup, id);
> > > +}
> > > +
> > > +static inline bool lrc_desc_registered(struct intel_guc *guc, u32 id)
> > > +{
> > > +	return __get_context(guc, id);
> > > +}
> > > +
> > > +static inline void set_lrc_desc_registered(struct intel_guc *guc, u32 id,
> > > +					   struct intel_context *ce)
> > > +{
> > > +	xa_store_irq(&guc->context_lookup, id, ce, GFP_ATOMIC);
> > > +}
> > > +
> > >  static void guc_add_request(struct intel_guc *guc, struct i915_request *rq)
> > >  {
> > >  	/* Leaving stub as this function will be used in future patches */
> > > @@ -404,6 +430,8 @@ int intel_guc_submission_init(struct intel_guc *guc)
> > >  	 */
> > >  	GEM_BUG_ON(!guc->lrc_desc_pool);
> > >  
> > > +	xa_init_flags(&guc->context_lookup, XA_FLAGS_LOCK_IRQ);
> > > +
> > >  	return 0;
> > >  }
> > >  
> > > -- 
> > > 2.28.0
> > > 
> > 
> > -- 
> > Daniel Vetter
> > Software Engineer, Intel Corporation
> > http://blog.ffwll.ch

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
