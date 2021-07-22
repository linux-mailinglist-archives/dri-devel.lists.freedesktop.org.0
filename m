Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 62FD93D1D3F
	for <lists+dri-devel@lfdr.de>; Thu, 22 Jul 2021 07:12:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 09B0F6EB5A;
	Thu, 22 Jul 2021 05:12:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com
 [IPv6:2a00:1450:4864:20::133])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 94CAA6EB5A;
 Thu, 22 Jul 2021 05:12:04 +0000 (UTC)
Received: by mail-lf1-x133.google.com with SMTP id y42so6614828lfa.3;
 Wed, 21 Jul 2021 22:12:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=th2rpii7zbKsOwH2XR57ZNVACUb7BbvvV4wUpBnIDKA=;
 b=e6Q6NZ8lOUXDbUgkepP0eadFxYqlR0qkFOIQvc/DX+nHSdfyExQE7zeGcHo4wyjpgA
 geG3Ifwp5jU4i+Wo6RCGIbXMopZrgKODV+iQzrY/QyAjydVuOpolnqa3M7CguFMbYhbv
 P7233zpsCFwRnLOuEDJ3rT4z4lEfXvxE7F7Wldue99ZwUQuiMBlLZbznE1B94lig5wYC
 flc6w9rt0KL0ggONdM0yWW7Pjc1ij8o8qDCYio4nhaHCnaL+MnpISHzOIH8dOE450tG+
 l0cQVkE3ZK3lr9D0Lf3sZ94WS/oUeOvjigzz6dtXjaVRv+NacI/j7ElscCugMPFE2NMv
 NQEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=th2rpii7zbKsOwH2XR57ZNVACUb7BbvvV4wUpBnIDKA=;
 b=OvnbOWo3RpyTJI1V6/pv8vh5dzxuaDmVvtdC8DxdbVOFjydRdPu/4Q6C1xf02I8BeJ
 7qKCfLtwf2t+9L/KOAK/uV34DjsrshGHamRX2qkb6blokskSMuaMEHacZfJngAxqalML
 RtGnYA8D7ALOsoHAzjf/5yASSnjA0g/iNVpQHV3F7oHdp0wMdP8j03O63loQMHb02LpC
 Sd5QggoRRTKAz2fUWXOiDDHFvdPGHbD+VjAxEZuMOkcgXEBvyXfoe3calq+D27UPUPqw
 hfeF9NyemX7OLh36eT8mVWd5gJOIZmaadJj/jzwl+6iPpSpwUzAhF6xCmlKYZSicJ95E
 qlUg==
X-Gm-Message-State: AOAM5309NO7RD9ecR7opYDfVhUBAReDEDAdSukotk7aLhpS0F61JaLc0
 TMa/668l2yU8UuUy25GZq67VlmU4GEs1dbj6JB4=
X-Google-Smtp-Source: ABdhPJxt9SsaPa9EiqpxcWMeNT9qJ/+Hj/4raUN4JhTqzsEZIeOe50co+S/k+R74FwPuW7P1zoz0yNpHudautYGO5o8=
X-Received: by 2002:ac2:4206:: with SMTP id y6mr27416967lfh.206.1626930722800; 
 Wed, 21 Jul 2021 22:12:02 -0700 (PDT)
MIME-Version: 1.0
References: <20210720232014.3302645-1-lucas.demarchi@intel.com>
 <20210720232014.3302645-4-lucas.demarchi@intel.com>
 <20210721225100.GN4174536@mdroper-desk1.amr.corp.intel.com>
In-Reply-To: <20210721225100.GN4174536@mdroper-desk1.amr.corp.intel.com>
From: Lucas De Marchi <lucas.de.marchi@gmail.com>
Date: Wed, 21 Jul 2021 22:11:49 -0700
Message-ID: <CAKi4VAK5g+H8yd3ANo__RR_8PwDTA73LyYdarCyKFR=gzts6_A@mail.gmail.com>
Subject: Re: [Intel-gfx] [PATCH 3/4] drm/i915/gt: rename legacy engine->hw_id
 to engine->gen6_hw_id
To: Matt Roper <matthew.d.roper@intel.com>
Content-Type: text/plain; charset="UTF-8"
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
Cc: Intel Graphics <intel-gfx@lists.freedesktop.org>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 Tomas Winkler <tomas.winkler@intel.com>, DRI <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Jul 21, 2021 at 3:51 PM Matt Roper <matthew.d.roper@intel.com> wrote:
>
> On Tue, Jul 20, 2021 at 04:20:13PM -0700, Lucas De Marchi wrote:
> > We kept adding new engines and for that increasing hw_id unnecessarily:
> > it's not used since GRAPHICS_VER == 8. Prepend "gen6" to the field and
> > try to pack it in the structs to give a hint this field is actually not
> > used in recent platforms.
> >
> > Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
>
> Reviewed-by: Matt Roper <matthew.d.roper@intel.com>
>
> although if we apply patch #4 we could probably drop this intermediate

I was not so confident people would agree with that patch. Adding the macros to
the header as suggested helps it being more palatable though.

thanks
Lucas De Marchi

> step.
>
>
> Matt
>
> > ---
> >  drivers/gpu/drm/i915/gt/intel_engine_cs.c    | 12 ++++++------
> >  drivers/gpu/drm/i915/gt/intel_engine_types.h |  2 +-
> >  drivers/gpu/drm/i915/i915_reg.h              |  2 +-
> >  3 files changed, 8 insertions(+), 8 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/i915/gt/intel_engine_cs.c b/drivers/gpu/drm/i915/gt/intel_engine_cs.c
> > index a11f69f2e46e..508221de411c 100644
> > --- a/drivers/gpu/drm/i915/gt/intel_engine_cs.c
> > +++ b/drivers/gpu/drm/i915/gt/intel_engine_cs.c
> > @@ -42,7 +42,7 @@
> >
> >  #define MAX_MMIO_BASES 3
> >  struct engine_info {
> > -     unsigned int hw_id;
> > +     u8 gen6_hw_id;
> >       u8 class;
> >       u8 instance;
> >       /* mmio bases table *must* be sorted in reverse graphics_ver order */
> > @@ -54,7 +54,7 @@ struct engine_info {
> >
> >  static const struct engine_info intel_engines[] = {
> >       [RCS0] = {
> > -             .hw_id = RCS0_HW,
> > +             .gen6_hw_id = RCS0_HW,
> >               .class = RENDER_CLASS,
> >               .instance = 0,
> >               .mmio_bases = {
> > @@ -62,7 +62,7 @@ static const struct engine_info intel_engines[] = {
> >               },
> >       },
> >       [BCS0] = {
> > -             .hw_id = BCS0_HW,
> > +             .gen6_hw_id = BCS0_HW,
> >               .class = COPY_ENGINE_CLASS,
> >               .instance = 0,
> >               .mmio_bases = {
> > @@ -70,7 +70,7 @@ static const struct engine_info intel_engines[] = {
> >               },
> >       },
> >       [VCS0] = {
> > -             .hw_id = VCS0_HW,
> > +             .gen6_hw_id = VCS0_HW,
> >               .class = VIDEO_DECODE_CLASS,
> >               .instance = 0,
> >               .mmio_bases = {
> > @@ -102,7 +102,7 @@ static const struct engine_info intel_engines[] = {
> >               },
> >       },
> >       [VECS0] = {
> > -             .hw_id = VECS0_HW,
> > +             .gen6_hw_id = VECS0_HW,
> >               .class = VIDEO_ENHANCEMENT_CLASS,
> >               .instance = 0,
> >               .mmio_bases = {
> > @@ -290,7 +290,7 @@ static int intel_engine_setup(struct intel_gt *gt, enum intel_engine_id id)
> >       engine->i915 = i915;
> >       engine->gt = gt;
> >       engine->uncore = gt->uncore;
> > -     engine->hw_id = info->hw_id;
> > +     engine->gen6_hw_id = info->gen6_hw_id;
> >       guc_class = engine_class_to_guc_class(info->class);
> >       engine->guc_id = MAKE_GUC_ID(guc_class, info->instance);
> >       engine->mmio_base = __engine_mmio_base(i915, info->mmio_bases);
> > diff --git a/drivers/gpu/drm/i915/gt/intel_engine_types.h b/drivers/gpu/drm/i915/gt/intel_engine_types.h
> > index a107eb58ffa2..266422d8d1b1 100644
> > --- a/drivers/gpu/drm/i915/gt/intel_engine_types.h
> > +++ b/drivers/gpu/drm/i915/gt/intel_engine_types.h
> > @@ -264,11 +264,11 @@ struct intel_engine_cs {
> >       enum intel_engine_id id;
> >       enum intel_engine_id legacy_idx;
> >
> > -     unsigned int hw_id;
> >       unsigned int guc_id;
> >
> >       intel_engine_mask_t mask;
> >
> > +     u8 gen6_hw_id;
> >       u8 class;
> >       u8 instance;
> >
> > diff --git a/drivers/gpu/drm/i915/i915_reg.h b/drivers/gpu/drm/i915/i915_reg.h
> > index 943fe485c662..8750ffce9d61 100644
> > --- a/drivers/gpu/drm/i915/i915_reg.h
> > +++ b/drivers/gpu/drm/i915/i915_reg.h
> > @@ -2572,7 +2572,7 @@ static inline bool i915_mmio_reg_valid(i915_reg_t reg)
> >  #define   ARB_MODE_BWGTLB_DISABLE (1 << 9)
> >  #define   ARB_MODE_SWIZZLE_BDW       (1 << 1)
> >  #define RENDER_HWS_PGA_GEN7  _MMIO(0x04080)
> > -#define RING_FAULT_REG(engine)       _MMIO(0x4094 + 0x100 * (engine)->hw_id)
> > +#define RING_FAULT_REG(engine)       _MMIO(0x4094 + 0x100 * (engine)->gen6_hw_id)
> >  #define GEN8_RING_FAULT_REG  _MMIO(0x4094)
> >  #define GEN12_RING_FAULT_REG _MMIO(0xcec4)
> >  #define   GEN8_RING_FAULT_ENGINE_ID(x)       (((x) >> 12) & 0x7)
> > --
> > 2.31.1
> >
>
> --
> Matt Roper
> Graphics Software Engineer
> VTT-OSGC Platform Enablement
> Intel Corporation
> (916) 356-2795
> _______________________________________________
> Intel-gfx mailing list
> Intel-gfx@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/intel-gfx
