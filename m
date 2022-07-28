Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D78C5847B1
	for <lists+dri-devel@lfdr.de>; Thu, 28 Jul 2022 23:25:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 41A5C11A7D7;
	Thu, 28 Jul 2022 21:25:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-vs1-xe2f.google.com (mail-vs1-xe2f.google.com
 [IPv6:2607:f8b0:4864:20::e2f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AAB3D11A7D7;
 Thu, 28 Jul 2022 21:25:41 +0000 (UTC)
Received: by mail-vs1-xe2f.google.com with SMTP id b67so2805127vsc.1;
 Thu, 28 Jul 2022 14:25:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=q1x1ZjgS7VlCPMIkNXtdFYljX1S1cLlBsH9qDNb9IeA=;
 b=AntHQtj37vjauhhoE+UtilNsPQlGYpwizVK2uPGDcmU/KoTjH/h70qT9dsUAjQh8Yn
 I5zFNkHpjoVuYN/QCV4q54CqQSfDuhTzU+zG/ARdEz84RCFc78GxEiVrPXkQdpzqquMh
 OT3pcMMrcIVqD4RR5TK5B1wfdpZxVy5ujqi2+no1VRBNDsZet8XOA9xLJONoTFnnSt1P
 eRgRwRljTptzDq2xNtfdQiGsDCpj6ixosOdpYYmgknCRIx21J+AoaTkIyBlpvVsuB0VA
 TKM2bhEe8dkuHdwblyJVxgbQLWBwGajFAvzrNWagsI710eDRWGPTa/bUwqzsGXcxQJ4I
 2LdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=q1x1ZjgS7VlCPMIkNXtdFYljX1S1cLlBsH9qDNb9IeA=;
 b=db9f7HXudrwkRLlVi1BHr7eLr+oyIqlmN3NL+HEGzos7HWU/eGIFNgy00mAD4SZJdp
 LIueng9E5Wn5rVY0kLMl84nOLa4sNSmu0yAz9qmgHCH/MJn/1TAwJs9v+faaWT8u/HqI
 E71NDb6PczyVmC5L+MznmQlGk/2/Kz5WTn6eaBN/6GTtlcM/obq66/KDrj4ANiuMuCeF
 8Uh7z2irXfJ24AI2gw14EwkFAJGmVfxOB1YvtYAmhYx5XxzeqlCnq+PQ84CyPxHCCwQs
 gufeZ4WI6OVyBYK93QuZFi1TEr5IitAORyKB9dtP5F39vFyMIFGqZ7qUk0GHu4vHcth3
 82DA==
X-Gm-Message-State: AJIora+p36goDwaU1M3iIVEAesw+Dokcjxmz5sDffsCs6PyRe9/ZQ3cV
 kuQmVIkrFOHNQYKcbhRGjdmt3vFVrNXKdxmW0t4=
X-Google-Smtp-Source: AGRyM1v1shvNHzO/g+2YGN9wO6mdmchskpLMKphMK6VfsUQYOfH19F+GmHEYBsRfgiS/rPDkCc8RED+TBPlK56almV8=
X-Received: by 2002:a05:6102:f99:b0:35a:da59:dbab with SMTP id
 e25-20020a0561020f9900b0035ada59dbabmr255025vsv.80.1659043540601; Thu, 28 Jul
 2022 14:25:40 -0700 (PDT)
MIME-Version: 1.0
References: <20220720153233.144129-1-jim.cromie@gmail.com>
 <20220720153233.144129-17-jim.cromie@gmail.com>
 <715fa561-703f-0ac7-8a88-859ee60bcb4c@akamai.com>
In-Reply-To: <715fa561-703f-0ac7-8a88-859ee60bcb4c@akamai.com>
From: jim.cromie@gmail.com
Date: Thu, 28 Jul 2022 15:25:14 -0600
Message-ID: <CAJfuBxyuLrgfk-D=VtaAB+d-5s9L7DR=mXeUoAVBMTKd1cBc5Q@mail.gmail.com>
Subject: Re: [PATCH v4 16/41] dyndbg: add drm.debug style bitmap support
To: Jason Baron <jbaron@akamai.com>
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
Cc: Greg KH <gregkh@linuxfoundation.org>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 amd-gfx mailing list <amd-gfx@lists.freedesktop.org>,
 Sean Paul <seanpaul@chromium.org>, dri-devel <dri-devel@lists.freedesktop.org>,
 Daniel Vetter <daniel.vetter@ffwll.ch>, intel-gvt-dev@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Jul 22, 2022 at 2:33 PM Jason Baron <jbaron@akamai.com> wrote:
>
>
>
> On 7/20/22 11:32, Jim Cromie wrote:
> > Add kernel_param_ops and callbacks to apply a class-map to a
> > sysfs-node, which then can control classes defined in that class-map.
> > This supports uses like:
> >
> >   echo 0x3 > /sys/module/drm/parameters/debug
> >
> > IE add these:
> >
> >  - int param_set_dyndbg_classes()
> >  - int param_get_dyndbg_classes()
> >  - struct kernel_param_ops param_ops_dyndbg_classes
> >
> > Following the model of kernel/params.c STANDARD_PARAM_DEFS, these are
> > non-static and exported.  This might be unnecessary here.
> >
> > get/set use an augmented kernel_param; the arg refs a new struct
> > ddebug_classes_bitmap_param, initialized by DYNAMIC_DEBUG_CLASSBITS
> > macro, which contains:
> >
> > BITS: a pointer to the user module's ulong holding the bits/state.  By
> > ref'g the client's bit-state _var, we coordinate with existing code
> > (such as drm_debug_enabled) which uses the _var, so it works
> > unchanged, even as the foundation is switched out underneath it..
> > Using a ulong allows use of BIT() etc.
> >
> > FLAGS: dyndbg.flags toggled by changes to bitmap. Usually just "p".
> >
> > MAP: a pointer to struct ddebug_classes_map, which maps those
> > class-names to .class_ids 0..N that the module is using.  This
> > class-map is declared & initialized by DEFINE_DYNDBG_CLASSMAP.
> >
> > map-type: add support here for DD_CLASS_DISJOINT, DD_CLASS_VERBOSE.
> >
> > These 2 class-types both expect an integer; _DISJOINT treats input
> > like a bit-vector (ala drm.debug), and sets each bit accordingly.
> >
> > _VERBOSE treats input like a bit-pos:N, then sets bits(0..N)=1, and
> > bits(N+1..max)=0.  This applies (bit<N) semantics on top of disjoint
> > bits.
> >
> > cases DD_CLASS_SYMBOLIC, DD_CLASS_LEVELS are included for the complete
> > picture, with commented out call to a following commit.
> >
> > NOTES:
> >
> > this now includes SYMBOLIC/LEVELS support, too tedious to keep
> > separate thru all the tweaking.
> >
> > get-param undoes the bit-pos -> bitmap transform that set-param does
> > on VERBOSE inputs, this gives the read-what-was-written property.
> >
> > _VERBOSE is overlay on _DISJOINT:
> >
> > verbose-maps still need class-names, even though theyre not usable at
> > the sysfs interface (unlike with _SYMBOLIC/_LEVELS).
> >
> >  - It must have a "V0" name,
> >    something below "V1" to turn "V1" off.
> >    __pr_debug_cls(V0,..) is printk, don't do that.
> >
> >  - "class names" is required at the >control interface.
> >  - relative levels are not enforced at >control
> >
> > IOW this is possible, and maybe confusing:
> >
> >   echo class V3 +p > control
> >   echo class V1 -p > control
> >
> > IMO thats ok, relative verbosity is an interface property.
> >
> > Signed-off-by: Jim Cromie <jim.cromie@gmail.com>
> > ---
> > . drop kp->mod->name as unneeded (build-dependent) <lkp>
> > ---
> >  include/linux/dynamic_debug.h |  18 ++++
> >  lib/dynamic_debug.c           | 193 ++++++++++++++++++++++++++++++++++
> >  2 files changed, 211 insertions(+)
> >
> > diff --git a/include/linux/dynamic_debug.h b/include/linux/dynamic_debug.h
> > index f57076e02767..b50bdd5c8184 100644
> > --- a/include/linux/dynamic_debug.h
> > +++ b/include/linux/dynamic_debug.h
> > @@ -113,6 +113,12 @@ struct ddebug_class_map {
> >  #define NUM_TYPE_ARGS(eltype, ...)                           \
> >       (sizeof((eltype[]) {__VA_ARGS__}) / sizeof(eltype))
> >
> > +struct ddebug_classes_bitmap_param {
> > +     unsigned long *bits;
> > +     char flags[8];
> > +     const struct ddebug_class_map *map;
> > +};
> > +
> >  #if defined(CONFIG_DYNAMIC_DEBUG_CORE)
> >
> >  int ddebug_add_module(struct _ddebug *tab, unsigned int num_debugs,
> > @@ -274,6 +280,10 @@ void __dynamic_ibdev_dbg(struct _ddebug *descriptor,
> >                                  KERN_DEBUG, prefix_str, prefix_type, \
> >                                  rowsize, groupsize, buf, len, ascii)
> >
> > +struct kernel_param;
> > +int param_set_dyndbg_classes(const char *instr, const struct kernel_param *kp);
> > +int param_get_dyndbg_classes(char *buffer, const struct kernel_param *kp);
> > +
> >  /* for test only, generally expect drm.debug style macro wrappers */
> >  #define __pr_debug_cls(cls, fmt, ...) do {                   \
> >       BUILD_BUG_ON_MSG(!__builtin_constant_p(cls),            \
> > @@ -322,6 +332,14 @@ static inline int ddebug_dyndbg_module_param_cb(char *param, char *val,
> >                               rowsize, groupsize, buf, len, ascii);   \
> >       } while (0)
> >
> > +struct kernel_param;
> > +static inline int param_set_dyndbg_classes(const char *instr, const struct kernel_param *kp)
> > +{ return 0; }
> > +static inline int param_get_dyndbg_classes(char *buffer, const struct kernel_param *kp)
> > +{ return 0; }
> > +
> >  #endif /* !CONFIG_DYNAMIC_DEBUG_CORE */
> >
> > +extern const struct kernel_param_ops param_ops_dyndbg_classes;
> > +
> >  #endif
> > diff --git a/lib/dynamic_debug.c b/lib/dynamic_debug.c
> > index 4c27bbe5187e..dd27dc514aa3 100644
> > --- a/lib/dynamic_debug.c
> > +++ b/lib/dynamic_debug.c
> > @@ -596,6 +596,199 @@ static int ddebug_exec_queries(char *query, const char *modname)
> >       return nfound;
> >  }
> >
> > +static int ddebug_apply_class_bitmap(const struct ddebug_classes_bitmap_param *dcp,
> > +                                  unsigned long inbits)
> > +{
> > +#define QUERY_SIZE 128
> > +     char query[QUERY_SIZE];
> > +     const struct ddebug_class_map *map = dcp->map;
> > +     int matches = 0;
> > +     int bi, ct;
> > +
> > +     v2pr_info("in: 0x%lx on: 0x%lx\n", inbits, *dcp->bits);
> > +
> > +     for (bi = 0; bi < map->length; bi++) {
> > +             if (test_bit(bi, &inbits) == test_bit(bi, dcp->bits))
> > +                     continue;
> > +
> > +             snprintf(query, QUERY_SIZE, "class %s %c%s", map->class_names[bi],
> > +                      test_bit(bi, &inbits) ? '+' : '-', dcp->flags);
> > +
> > +             ct = ddebug_exec_queries(query, NULL);
> > +             matches += ct;
> > +
> > +             v2pr_info("bit_%d: %d matches on class: %s -> 0x%lx\n", bi,
> > +                       ct, map->class_names[bi], inbits);
> > +     }
> > +     return matches;
> > +}
> > +
> > +/* support for [+-] symbolic-name boolean list */
> > +static int param_set_dyndbg_class_strings(const char *instr, const struct kernel_param *kp)
> > +{
> > +     const struct ddebug_classes_bitmap_param *dcp = kp->arg;
> > +     const struct ddebug_class_map *map = dcp->map;
> > +     unsigned long inbits;
> > +     int idx, totct = 0;
> > +     bool wanted;
> > +     char *cls, *p;
> > +
> > +     cls = kstrdup(instr, GFP_KERNEL);
> > +     p = strchr(cls, '\n');
> > +     if (p)
> > +             *p = '\0';
> > +
> > +     vpr_info("\"%s\" > %s\n", cls, kp->name);
> > +     inbits = *dcp->bits;
> > +
> > +     for (; cls; cls = p) {
> > +             p = strchr(cls, ',');
> > +             if (p)
> > +                     *p++ = '\0';
> > +
> > +             if (*cls == '-') {
> > +                     wanted = false;
> > +                     cls++;
> > +             } else {
> > +                     wanted = true;
> > +                     if (*cls == '+')
> > +                             cls++;
> > +             }
> > +             idx = match_string(map->class_names, map->length, cls);
> > +             if (idx < 0) {
> > +                     pr_err("%s unknown to %s\n", cls, kp->name);
> > +                     continue;
> > +             }
> > +
> > +             switch (map->map_type) {
> > +             case DD_CLASS_TYPE_SYMBOLIC:
> > +                     if (test_bit(idx, &inbits) == wanted) {
> > +                             v3pr_info("no change on %s\n", cls);
> > +                             continue;
> > +                     }
> > +                     inbits ^= BIT(idx);
>
> Didn't test this out but the code here confused me. In this case the bit at idx
> in inbits doesn't match. But you are doing an exclusive OR here. So doesn't that
> always set it? Shouldn't it be cleared if wanted is false?
>

I think the trouble is - in part - inbits varname;
it starts with the old bit vector value -

        inbits = *dcp->bits;  // i'll add comment here

2nd, this is while parsing the csv of classnames,
and evaluating 1 bit/class at a time here,
and only valid class-names

and wanted therefore only pertains to classes/bits that need toggled,
wanted = 1/0  based on +/- setting for that class.

>
> > +                     break;
> > +             case DD_CLASS_TYPE_LEVELS:
> > +                     /* bitmask must respect classmap ranges, this does not */
> > +                     inbits = (1 << (idx + wanted));
>
> This line also confused me - below in DD_CLASS_TYPE_VERBOSE: case you use the
> CLASSMAP_BITMASK() which will set all the 'levels' below. So I was expecting
> that here as well as this is the symbolic level case. I think I'm missing
> something...

So this is a bit inscrutable - and the comment needs refresh.

again, we are taking classnames here, so are working a single class-id,
this time the bits are not independent, as they were above.
idx is the valid class-id pertaining to the classname
- I'll pick a better varname here too
so
   inbits = (1<< ( cls_id + wanted ? 1 : 0 ))

forces all bits below cls_id on, and maybe cls_id too.

at bottom of the classnames loop, apply-bitmap applies the bits.
it applies only changes made to inbits, by re-fetching orig dcp->bits
and comparing.

Note also the usage diffs for the 2 _NAMED styles

   echo DRM_UT_CORE,-DRM_UT_KMS,+DRM_UT_DRIVER > debug_catnames

   echo +NV_TRACE  > nv_debug_level_names

while this would be weird / makework / stress-test

   echo +V7,-V1,+V7,-V1 > /sys/module/test_dynamic_debug/p_level_names



Ive been reworking the set - including your enum suggestions,
also adding
0010-dyndbg-cleanup-local-vars-in-ddebug_init.patch
0011-dyndbg-create-and-use-struct-_ddebug_info.patch
- this gathers __dyndbg and __dyndbg_classes sections
- maybe infos, or something more subsystem-state-ey
any suggestions ?

I'll change varnames I mentioned, and add comments.
I'll add comments derived from this explanation
(hope it clears things up)

and have a few things to sort and retest, I'll send a new rev shortly.
