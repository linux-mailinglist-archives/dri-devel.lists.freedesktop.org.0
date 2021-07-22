Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CF883D778F
	for <lists+dri-devel@lfdr.de>; Tue, 27 Jul 2021 15:55:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BA5B76EA3E;
	Tue, 27 Jul 2021 13:55:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qv1-xf2b.google.com (mail-qv1-xf2b.google.com
 [IPv6:2607:f8b0:4864:20::f2b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 532956EA33
 for <dri-devel@lists.freedesktop.org>; Tue, 27 Jul 2021 13:55:07 +0000 (UTC)
Received: by mail-qv1-xf2b.google.com with SMTP id s11so2429226qvz.7
 for <dri-devel@lists.freedesktop.org>; Tue, 27 Jul 2021 06:55:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=poorly.run; s=google;
 h=resent-from:resent-date:resent-message-id:resent-to:date:from:to
 :subject:message-id:references:mime-version:content-disposition
 :in-reply-to:user-agent;
 bh=j+ccLjOAeIEZxyVBWcrGNrQukKQ4n8ePVx/MnT6scgg=;
 b=f/xBpih2raViHe/H2m9pa807ljnaB16Br1L01UWVwYLzmiANwGpE5coTbY/VR+sByq
 ncOFOLvUa6Qe4Ji7qY7V12nB6WUDkcUPudkISfdJUi9NXDpWy068bhvz8nQ3XswNEnDH
 gNQBblu30tuVPRvPtJWzEoLBiqyxuimlvBvnBhmBeXAzR4xIyL0wGx5jouzUp3bfhqMH
 k1oA3wBvJhkPJeu25Wo3j4gbT4Q6ZClMgcDF89JKDggELI3elOu9GxteEGM+mvr1tzhB
 aSVFAu47xaoBc4v23GZKEjw+kgt2jwQSEziRlxAFbKF3kbIWTLzILiqQ89Qtw//ZyYcG
 BkCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:resent-from:resent-date:resent-message-id
 :resent-to:date:from:to:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=j+ccLjOAeIEZxyVBWcrGNrQukKQ4n8ePVx/MnT6scgg=;
 b=pcTJ1d+x2hK9zaOThIlYj/FjMOlRlSU95XVy3/MiFbQWaPTu3ypmC1VqA9c2v8pHVg
 UPCNQYnV2ihGi0LxtaAEbfZA0EWr69Qu6sfnOV0eK47JPp86j3vd+hG18DomT7dFOjc9
 K70il7Y2nzQwip4HyiCeAwA9JzZBl2TB8TXz0VLjzdIPJjhEiwZzxCeuh7FzAQ1Sd/aa
 lEJod4aMoHypZYSpbic9OeFYAn/bGrpnMqJvXXacR338VWDfQXN1dYVexjXTLDfKm7KY
 UTydao9f9I1N0OZBSMoPfiG7YvAx+uQNeicaYbosShEmNi9Cp54BxfTDUpkTT35gyoK0
 vciQ==
X-Gm-Message-State: AOAM5314CE9HtV3SyiXx/OhW3IbN0S0bmLGdT48JnU03O07z1uQlI6qL
 m2aHTABBEsd0DOAJSt3McAq6lw==
X-Google-Smtp-Source: ABdhPJz8TAQsGy287QA/GYwCGUngh2zA3AA9pFI7Wrbv244oxNBvN1cJctD94lZHQVkNZbHCkcjbbg==
X-Received: by 2002:a05:6214:d08:: with SMTP id
 8mr23087002qvh.32.1627394106381; 
 Tue, 27 Jul 2021 06:55:06 -0700 (PDT)
Received: from localhost ([167.100.64.199])
 by smtp.gmail.com with ESMTPSA id l4sm1409754qtr.62.2021.07.27.06.55.05
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Tue, 27 Jul 2021 06:55:05 -0700 (PDT)
Resent-From: Sean Paul <sean@poorly.run>
Resent-Date: Tue, 27 Jul 2021 09:55:04 -0400
Resent-Message-ID: <20210727135504.GA31127@art_vandelay>
Resent-To: Jim Cromie <jim.cromie@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@linux.ie>,
 Zhenyu Wang <zhenyuw@linux.intel.com>,
 Zhi Wang <zhi.a.wang@intel.com>,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 intel-gvt-dev@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, jbaron@akamai.com
Date: Thu, 22 Jul 2021 11:20:09 -0400
From: Sean Paul <sean@poorly.run>
To: Daniel Vetter <daniel@ffwll.ch>
Subject: Re: [Intel-gfx] [PATCH v3 3/5] drm/print: RFC add choice to use
 dynamic debug in drm-debug
Message-ID: <20210722152009.GZ22946@art_vandelay>
References: <20210714175138.319514-1-jim.cromie@gmail.com>
 <20210714175138.319514-4-jim.cromie@gmail.com>
 <YPbPvm/xcBlTK1wq@phenom.ffwll.local>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YPbPvm/xcBlTK1wq@phenom.ffwll.local>
User-Agent: Mutt/1.9.4 (2018-02-28)
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

On Tue, Jul 20, 2021 at 03:29:34PM +0200, Daniel Vetter wrote:
> On Wed, Jul 14, 2021 at 11:51:36AM -0600, Jim Cromie wrote:
> > drm's debug system uses distinct categories of debug messages, encoded
> > in an enum (DRM_UT_<CATEGORY>), which are mapped to bits in drm.debug.
> > drm_debug_enabled() does a lot of unlikely bit-mask checks on
> > drm.debug; we can use dynamic debug instead, and get all that
> > static_key/jump_label goodness.

Hi Jim,
Thanks for your patches! Daniel pointed me at them in response to my drm_trace
patchset (https://patchwork.freedesktop.org/series/78133/). I'd love to get your
input on it. I think the 2 sets are mostly compatible, we'd just need to keep
drm_dev_dbg and do the CONFIG check in the function beside the trace_enabled
checks.

> > 
> > Dynamic debug has no concept of category, but we can map the DRM_UT_*
> > to a set of distinct prefixes; "drm:core:", "drm:kms:" etc, and
> > prepend them to the given formats.
> > 
> > Then we can use:
> >   `echo module drm format ^drm:core: +p > control`
> > 
> > to enable every such "prefixed" pr_debug with one query.  This new
> > prefix changes pr_debug's output, so is user visible, but it seems
> > unlikely to cause trouble for log watchers; they're not relying on the
> > absence of class prefix strings.
> > 
> > This conversion yields ~2100 new callsites on my i7/i915 laptop:
> > 
> >   dyndbg: 195 debug prints in module drm_kms_helper
> >   dyndbg: 298 debug prints in module drm
> >   dyndbg: 1630 debug prints in module i915
> > 
> > CONFIG_DRM_USE_DYNAMIC_DEBUG enables this, and is available if
> > CONFIG_DYNAMIC_DEBUG or CONFIG_DYNAMIC_DEBUG_CORE is chosen, and if
> > CONFIG_JUMP_LABEL is enabled; this because its required to get the
> > promised optimizations.
> > 
> > The indirection/switchover is layered into the macro scheme:
> > 
> > 0. A new callback on drm.debug which calls dynamic_debug_exec_queries
> >    to map those bits to specific query/commands
> >    dynamic_debug_exec_queries("format ^drm:kms: +p", "drm*");
> >    here for POC, this should be in dynamic_debug.c
> >    with a MODULE_PARAM_DEBUG_BITMAP(__drm_debug, { "prefix-1", "desc-1" }+)
> 
> This is really awesome. 


Agreed, this is a very clever way of merging the 2 worlds!


> For merging I think we need to discuss with dyn
> debug folks whether they're all ok with this, but it's exported already
> should should be fine.

I wonder if this is a good time to reconsider our drm categories. IMO they're
overly broad and it's hard to get the right information without subscribing to
the firehose. It seems like dyndbg might be a good opportunity to unlock
subcategories of log messages.

More concretely, on CrOS we can't subscribe to atomic or state categories since
they're too noisy. However if there was a "fail" subcategory which dumped
state/atomic logs on check failures, that would be really compelling. Something
like:

        drm:atomic:fail vs. drm:atomic

Both would be picked up if (drm.debug & DRM_DBG_ATOMIC), however it would allow
dyndbg-aware clients to get better logs without having a huge table of
individual log signatures.

I'm not sure how tightly we'd want to control the subcategories. It could be
strict like the categories spelled out in drm_print.h, or an open prefix arg to
drm_dev_dbg. I suspect we'd want the former, but would want to be careful to
provide enough flexibility to properly 

Of course, none of this needs to be decided to land this initial support, it can
be bolted on later easily enough (I think).


> 
> > 
> > 1. A "converted" or "classy" DRM_UT_* map
> > 
> >    based on:   DRM_UT_* ( symbol => bit-mask )
> >    named it:  cDRM_UT_* ( symbol => format-class-prefix-string )
> > 
> >    So cDRM_UT_* is either:
> >    legacy: cDRM_UT_* <-- DRM_UT_*   ( !CONFIG_DRM_USE_DYNAMIC_DEBUG )
> >    enabled:
> >     #define cDRM_UT_KMS    "drm:kms: "
> >     #define cDRM_UT_PRIME  "drm:prime: "
> >     #define cDRM_UT_ATOMIC "drm:atomic: "
> 
> the cDRM looks a bit funny, plus I don't eve have an idea what _UT_ means
> (and git history isn't helpful either). What about just using
> DRM_DBG_CLASS_ as the prefix here for these indirection macros, i.e.
> DRM_DBG_CLASS_KMS.
> 
> Also would be really nice if we could make these a table or something, but
> I guess with the macro magic that's not possible.
> 
> > 
> >    DRM_UT_* are unchanged, since theyre used in drm_debug_enabled()
> >    and elsewhere.
> 
> I think for the production version of these we need to retire/deprecate
> them, at least for drm core. Otherwise you have an annoying mismatch
> between drm.debug module option and dyn debug.
> 
> > 
> > 2. drm_dev_dbg & drm_debug are renamed (prefixed with '_')
> > 
> >    old names are now macros, calling either:
> >      legacy:  -> to renamed fn
> >      enabled: -> dev_dbg & pr_debug, with cDRM-prefix # format.
> > 
> >    these names are used in a fat layer of macros (3) which supply the
> >    category; those macros are used throughout drm code, yielding the
> >    ~2100 new prdbgs reported above.
> > 
> > 3. names in (2) are invoked by DRM_DEBUG_<Category>, drm_dbg_<Category>.
> > 
> >    all these macros get "converted" to use cDRM_UT_*
> >    to get right token type for both !/!! DRM_USE_DYNAMIC_DEBUG
> > 
> > 4. simplification of __DRM_DEFINE_DBG_RATELIMITED macro
> > 
> >    remove DRM_UT_ ## KMS as extra indirection
> >    pass both DRM_UT & cDRM_UT, for drm_debug_enabled & drm_dev_dbg
> 
> For merging, can we pull out the renames and reorgs from this patch, and
> then maybe also the reorder the next patch in your series here to be
> before the dyn debug stuff?
> 
> > Signed-off-by: Jim Cromie <jim.cromie@gmail.com>
> > ---
> >  drivers/gpu/drm/Kconfig     |  13 +++++
> >  drivers/gpu/drm/drm_print.c |  75 ++++++++++++++++++++++++--
> >  include/drm/drm_print.h     | 102 ++++++++++++++++++++++++++----------
> >  3 files changed, 158 insertions(+), 32 deletions(-)
> 
> I really like this, I think you can drop the RFC. A few more things that I
> think we need:
> 
> - An overview kerneldoc section which explains the interfaces and how it
>   all works together. Essentially your commit message with some light
>   markup to make it look good.
> 
> - I think it would be really good to review the driver docs for all this
>   and make sure it's complete. Some of the interface functions aren't
>   documented yet (or maybe the ones that drivers shouldn't used need more
>   __ prefixes to denote them as internal, dunno).
> 
> - I guess deprecation notice for drm_debug_enabled() and all that, so that
>   we have a consistent interface. Doing the conversion will probably
>   highlight the need for a bit more infrastructure and tooling, e.g. the
>   bigger dump functions (like edid hex dump, or also the various decode
>   helpers we have for dp, hdmi infoframes and all that) ideally have a
>   single dyn_debug label to enable all of them instead of line-by-line.
>   Tbh no idea how this should work, might need dyndbg work too.

Yeah, this is going to be tricky.

We'll probably need to enumerate these fully and if the process of gathering
the data is simple or already done in the course of the function, just avoid the
drm_debug_enabled() call with a CONFIG_DRM_DYNDBG check.

If the debug_enabled call gates a HW access, we probably need to query dyndbg
for the prefix the logs are associated with before gathering the log contents.

Sean
> 
> - For the driver side of this we probably want a
>   Documentation/gpu/TODO.rst entry if it's not all easy to convert
>   directly.
> 
> > 
> > diff --git a/drivers/gpu/drm/Kconfig b/drivers/gpu/drm/Kconfig
> > index 7ff89690a976..e4524ccba040 100644
> > --- a/drivers/gpu/drm/Kconfig
> > +++ b/drivers/gpu/drm/Kconfig
> > @@ -57,6 +57,19 @@ config DRM_DEBUG_MM
> >  
> >  	  If in doubt, say "N".
> >  
> > +config DRM_USE_DYNAMIC_DEBUG
> > +	bool "use dynamic debug to implement drm.debug"
> > +	default n
> > +	depends on DRM
> > +	depends on DYNAMIC_DEBUG || DYNAMIC_DEBUG_CORE
> > +	depends on JUMP_LABEL
> > +	help
> > +	  The drm debug category facility does a lot of unlikely bit-field
> > +	  tests at runtime; while cheap individually, the cost accumulates.
> > +	  This option uses dynamic debug facility (if configured and
> > +	  using jump_label) to avoid those runtime checks, patching
> > +	  the kernel when those debugs are desired.
> 
> Can't we just make this an internal option that's enabled automatically
> when dyndbg is around? Plus a comment somewhere that we really recommend
> enabling dyndbg for drm. Or would this mean that in certain dyndbg
> configurations we'd loose all the debug lines, which would suck?
> 
> Anyway there's a pile of details, but the big picture I really like.
> Especially that we can make dyndbg seamlessly support drm.debug is really
> nice.
> 
> Cheers, Daniel
> 
> > +
> >  config DRM_DEBUG_SELFTEST
> >  	tristate "kselftests for DRM"
> >  	depends on DRM
> > diff --git a/drivers/gpu/drm/drm_print.c b/drivers/gpu/drm/drm_print.c
> > index 111b932cf2a9..e2acdfc7088b 100644
> > --- a/drivers/gpu/drm/drm_print.c
> > +++ b/drivers/gpu/drm/drm_print.c
> > @@ -52,8 +52,75 @@ MODULE_PARM_DESC(debug, "Enable debug output, where each bit enables a debug cat
> >  "\t\tBit 5 (0x20)  will enable VBL messages (vblank code)\n"
> >  "\t\tBit 7 (0x80)  will enable LEASE messages (leasing code)\n"
> >  "\t\tBit 8 (0x100) will enable DP messages (displayport code)");
> > +
> > +#ifndef CONFIG_DRM_USE_DYNAMIC_DEBUG
> >  module_param_named(debug, __drm_debug, int, 0600);
> >  
> > +#else
> > +static char *format_class_prefixes[] = {
> > +	cDRM_UT_CORE,
> > +	cDRM_UT_DRIVER,
> > +	cDRM_UT_KMS,
> > +	cDRM_UT_PRIME,
> > +	cDRM_UT_ATOMIC,
> > +	cDRM_UT_VBL,
> > +	cDRM_UT_STATE,
> > +	cDRM_UT_LEASE,
> > +	cDRM_UT_DP,
> > +	cDRM_UT_DRMRES
> > +};
> > +
> > +#define OUR_QUERY_SIZE 64 /* > strlen "format '^%s' %cp" + longest prefix */
> > +
> > +static int param_set_dyndbg(const char *instr, const struct kernel_param *kp)
> > +{
> > +	unsigned int val;
> > +	unsigned long changes, result;
> > +	int rc, chgct = 0, totct = 0, bitpos;
> > +	char query[OUR_QUERY_SIZE];
> > +
> > +	rc = kstrtouint(instr, 0, &val);
> > +	if (rc) {
> > +		pr_err("%s: failed\n", __func__);
> > +		return -EINVAL;
> > +	}
> > +	result = val;
> > +	changes = result ^ __drm_debug;
> > +
> > +	pr_debug("changes:0x%lx from result:0x%lx\n", changes, result);
> > +
> > +	for_each_set_bit(bitpos, &changes, ARRAY_SIZE(format_class_prefixes)) {
> > +
> > +		sprintf(query, "format '^%s' %cp", format_class_prefixes[bitpos],
> > +			test_bit(bitpos, &result) ? '+' : '-');
> > +
> > +		chgct = dynamic_debug_exec_queries(query, "drm*");
> > +		if (chgct < 0) {
> > +			pr_err("%s: exec err:%d on: %s\n", __func__, chgct, query);
> > +			continue;
> > +		}
> > +		pr_debug("change ct:%d on %s\n", chgct, query);
> > +		totct += chgct;
> > +	}
> > +	pr_debug("total changes: %d\n", totct);
> > +	__drm_debug = result;
> > +	return 0;
> > +}
> > +
> > +static int param_get_dyndbg(char *buffer, const struct kernel_param *kp)
> > +{
> > +	pr_debug("debug-val:0x%x %u\n", __drm_debug, *((unsigned int *)kp->arg));
> > +	return scnprintf(buffer, PAGE_SIZE, "%u\n",
> > +			 *((unsigned int *)kp->arg));
> > +}
> > +static const struct kernel_param_ops param_ops_debug = {
> > +	.set = param_set_dyndbg,
> > +	.get = param_get_dyndbg,
> > +};
> > +module_param_cb(debug, &param_ops_debug, &__drm_debug, 0644);
> > +
> > +#endif /* CONFIG_DRM_USE_DYNAMIC_DEBUG */
> > +
> >  void __drm_puts_coredump(struct drm_printer *p, const char *str)
> >  {
> >  	struct drm_print_iterator *iterator = p->arg;
> > @@ -256,7 +323,7 @@ void drm_dev_printk(const struct device *dev, const char *level,
> >  }
> >  EXPORT_SYMBOL(drm_dev_printk);
> >  
> > -void drm_dev_dbg(const struct device *dev, enum drm_debug_category category,
> > +void _drm_dev_dbg(const struct device *dev, enum drm_debug_category category,
> >  		 const char *format, ...)
> >  {
> >  	struct va_format vaf;
> > @@ -278,9 +345,9 @@ void drm_dev_dbg(const struct device *dev, enum drm_debug_category category,
> >  
> >  	va_end(args);
> >  }
> > -EXPORT_SYMBOL(drm_dev_dbg);
> > +EXPORT_SYMBOL(_drm_dev_dbg);
> >  
> > -void __drm_dbg(enum drm_debug_category category, const char *format, ...)
> > +void ___drm_dbg(enum drm_debug_category category, const char *format, ...)
> >  {
> >  	struct va_format vaf;
> >  	va_list args;
> > @@ -297,7 +364,7 @@ void __drm_dbg(enum drm_debug_category category, const char *format, ...)
> >  
> >  	va_end(args);
> >  }
> > -EXPORT_SYMBOL(__drm_dbg);
> > +EXPORT_SYMBOL(___drm_dbg);
> >  
> >  void __drm_err(const char *format, ...)
> >  {
> > diff --git a/include/drm/drm_print.h b/include/drm/drm_print.h
> > index ff5ac0e88321..499fa0b35200 100644
> > --- a/include/drm/drm_print.h
> > +++ b/include/drm/drm_print.h
> > @@ -319,6 +319,51 @@ enum drm_debug_category {
> >  	DRM_UT_DRMRES		= 0x200,
> >  };
> >  
> > +#if !defined(CONFIG_DRM_USE_DYNAMIC_DEBUG)
> > +
> > +/* Use legacy drm-debug functions, and drm_debug_enabled().
> > + * For cDRM_UT_* (converted category), identity map to DRM_UT_*
> > + */
> > +#define __drm_dbg(cls, fmt, ...)			\
> > +	___drm_dbg(cls, fmt, ##__VA_ARGS__)
> > +#define drm_dev_dbg(dev, cls, fmt, ...)			\
> > +	_drm_dev_dbg(dev, cls, fmt, ##__VA_ARGS__)
> > +
> > +#define cDRM_UT_CORE	DRM_UT_CORE
> > +#define cDRM_UT_DRIVER	DRM_UT_DRIVER
> > +#define cDRM_UT_KMS	DRM_UT_KMS
> > +#define cDRM_UT_PRIME	DRM_UT_PRIME
> > +#define cDRM_UT_ATOMIC	DRM_UT_ATOMIC
> > +#define cDRM_UT_VBL	DRM_UT_VBL
> > +#define cDRM_UT_STATE	DRM_UT_STATE
> > +#define cDRM_UT_LEASE	DRM_UT_LEASE
> > +#define cDRM_UT_DP	DRM_UT_DP
> > +#define cDRM_UT_DRMRES	DRM_UT_DRMRES
> > +
> > +#else /* !CONFIG_DRM_USE_DYNAMIC_DEBUG */
> > +
> > +/* use dynamic_debug to avoid drm_debug_enabled().
> > + * dyndbg has no category, so we prefix the format with a "class"
> > + * string; cDRM_UT_* maps to those class strings
> > + */
> > +#define __drm_dbg(cls, fmt, ...)		\
> > +	pr_debug(cls # fmt, ##__VA_ARGS__)
> > +#define drm_dev_dbg(dev, cls, fmt, ...)		\
> > +	dev_dbg(dev, cls # fmt, ##__VA_ARGS__)
> > +
> > +#define cDRM_UT_CORE	"drm:core: "
> > +#define cDRM_UT_DRIVER	"drm:drvr: "
> > +#define cDRM_UT_KMS	"drm:kms: "
> > +#define cDRM_UT_PRIME	"drm:prime: "
> > +#define cDRM_UT_ATOMIC	"drm:atomic: "
> > +#define cDRM_UT_VBL	"drm:vbl: "
> > +#define cDRM_UT_STATE	"drm:state: "
> > +#define cDRM_UT_LEASE	"drm:lease: "
> > +#define cDRM_UT_DP	"drm:dp: "
> > +#define cDRM_UT_DRMRES	"drm:res "
> > +
> > +#endif /* !CONFIG_DRM_USE_DYNAMIC_DEBUG */
> > +
> >  static inline bool drm_debug_enabled(enum drm_debug_category category)
> >  {
> >  	return unlikely(__drm_debug & category);
> > @@ -334,7 +379,7 @@ __printf(3, 4)
> >  void drm_dev_printk(const struct device *dev, const char *level,
> >  		    const char *format, ...);
> >  __printf(3, 4)
> > -void drm_dev_dbg(const struct device *dev, enum drm_debug_category category,
> > +void _drm_dev_dbg(const struct device *dev, enum drm_debug_category category,
> >  		 const char *format, ...);
> >  
> >  /**
> > @@ -383,7 +428,7 @@ void drm_dev_dbg(const struct device *dev, enum drm_debug_category category,
> >   * @fmt: printf() like format string.
> >   */
> >  #define DRM_DEV_DEBUG(dev, fmt, ...)					\
> > -	drm_dev_dbg(dev, DRM_UT_CORE, fmt, ##__VA_ARGS__)
> > +	drm_dev_dbg(dev, cDRM_UT_CORE, fmt, ##__VA_ARGS__)
> >  /**
> >   * DRM_DEV_DEBUG_DRIVER() - Debug output for vendor specific part of the driver
> >   *
> > @@ -391,7 +436,7 @@ void drm_dev_dbg(const struct device *dev, enum drm_debug_category category,
> >   * @fmt: printf() like format string.
> >   */
> >  #define DRM_DEV_DEBUG_DRIVER(dev, fmt, ...)				\
> > -	drm_dev_dbg(dev, DRM_UT_DRIVER,	fmt, ##__VA_ARGS__)
> > +	drm_dev_dbg(dev, cDRM_UT_DRIVER, fmt, ##__VA_ARGS__)
> >  /**
> >   * DRM_DEV_DEBUG_KMS() - Debug output for modesetting code
> >   *
> > @@ -399,7 +444,7 @@ void drm_dev_dbg(const struct device *dev, enum drm_debug_category category,
> >   * @fmt: printf() like format string.
> >   */
> >  #define DRM_DEV_DEBUG_KMS(dev, fmt, ...)				\
> > -	drm_dev_dbg(dev, DRM_UT_KMS, fmt, ##__VA_ARGS__)
> > +	drm_dev_dbg(dev, cDRM_UT_KMS, fmt, ##__VA_ARGS__)
> >  
> >  /*
> >   * struct drm_device based logging
> > @@ -443,25 +488,25 @@ void drm_dev_dbg(const struct device *dev, enum drm_debug_category category,
> >  
> >  
> >  #define drm_dbg_core(drm, fmt, ...)					\
> > -	drm_dev_dbg((drm) ? (drm)->dev : NULL, DRM_UT_CORE, fmt, ##__VA_ARGS__)
> > +	drm_dev_dbg((drm) ? (drm)->dev : NULL, cDRM_UT_CORE, fmt, ##__VA_ARGS__)
> >  #define drm_dbg(drm, fmt, ...)						\
> > -	drm_dev_dbg((drm) ? (drm)->dev : NULL, DRM_UT_DRIVER, fmt, ##__VA_ARGS__)
> > +	drm_dev_dbg((drm) ? (drm)->dev : NULL, cDRM_UT_DRIVER, fmt, ##__VA_ARGS__)
> >  #define drm_dbg_kms(drm, fmt, ...)					\
> > -	drm_dev_dbg((drm) ? (drm)->dev : NULL, DRM_UT_KMS, fmt, ##__VA_ARGS__)
> > +	drm_dev_dbg((drm) ? (drm)->dev : NULL, cDRM_UT_KMS, fmt, ##__VA_ARGS__)
> >  #define drm_dbg_prime(drm, fmt, ...)					\
> > -	drm_dev_dbg((drm) ? (drm)->dev : NULL, DRM_UT_PRIME, fmt, ##__VA_ARGS__)
> > +	drm_dev_dbg((drm) ? (drm)->dev : NULL, cDRM_UT_PRIME, fmt, ##__VA_ARGS__)
> >  #define drm_dbg_atomic(drm, fmt, ...)					\
> > -	drm_dev_dbg((drm) ? (drm)->dev : NULL, DRM_UT_ATOMIC, fmt, ##__VA_ARGS__)
> > +	drm_dev_dbg((drm) ? (drm)->dev : NULL, cDRM_UT_ATOMIC, fmt, ##__VA_ARGS__)
> >  #define drm_dbg_vbl(drm, fmt, ...)					\
> > -	drm_dev_dbg((drm) ? (drm)->dev : NULL, DRM_UT_VBL, fmt, ##__VA_ARGS__)
> > +	drm_dev_dbg((drm) ? (drm)->dev : NULL, cDRM_UT_VBL, fmt, ##__VA_ARGS__)
> >  #define drm_dbg_state(drm, fmt, ...)					\
> > -	drm_dev_dbg((drm) ? (drm)->dev : NULL, DRM_UT_STATE, fmt, ##__VA_ARGS__)
> > +	drm_dev_dbg((drm) ? (drm)->dev : NULL, cDRM_UT_STATE, fmt, ##__VA_ARGS__)
> >  #define drm_dbg_lease(drm, fmt, ...)					\
> > -	drm_dev_dbg((drm) ? (drm)->dev : NULL, DRM_UT_LEASE, fmt, ##__VA_ARGS__)
> > +	drm_dev_dbg((drm) ? (drm)->dev : NULL, cDRM_UT_LEASE, fmt, ##__VA_ARGS__)
> >  #define drm_dbg_dp(drm, fmt, ...)					\
> > -	drm_dev_dbg((drm) ? (drm)->dev : NULL, DRM_UT_DP, fmt, ##__VA_ARGS__)
> > +	drm_dev_dbg((drm) ? (drm)->dev : NULL, cDRM_UT_DP, fmt, ##__VA_ARGS__)
> >  #define drm_dbg_drmres(drm, fmt, ...)					\
> > -	drm_dev_dbg((drm) ? (drm)->dev : NULL, DRM_UT_DRMRES, fmt, ##__VA_ARGS__)
> > +	drm_dev_dbg((drm) ? (drm)->dev : NULL, cDRM_UT_DRMRES, fmt, ##__VA_ARGS__)
> >  
> >  
> >  /*
> > @@ -471,7 +516,7 @@ void drm_dev_dbg(const struct device *dev, enum drm_debug_category category,
> >   */
> >  
> >  __printf(2, 3)
> > -void __drm_dbg(enum drm_debug_category category, const char *format, ...);
> > +void ___drm_dbg(enum drm_debug_category category, const char *format, ...);
> >  __printf(1, 2)
> >  void __drm_err(const char *format, ...);
> >  
> > @@ -500,44 +545,45 @@ void __drm_err(const char *format, ...);
> >  #define DRM_ERROR_RATELIMITED(fmt, ...)					\
> >  	DRM_DEV_ERROR_RATELIMITED(NULL, fmt, ##__VA_ARGS__)
> >  
> > +
> >  #define DRM_DEBUG(fmt, ...)						\
> > -	__drm_dbg(DRM_UT_CORE, fmt, ##__VA_ARGS__)
> > +	__drm_dbg(cDRM_UT_CORE, fmt, ##__VA_ARGS__)
> >  
> >  #define DRM_DEBUG_DRIVER(fmt, ...)					\
> > -	__drm_dbg(DRM_UT_DRIVER, fmt, ##__VA_ARGS__)
> > +	__drm_dbg(cDRM_UT_DRIVER, fmt, ##__VA_ARGS__)
> >  
> >  #define DRM_DEBUG_KMS(fmt, ...)						\
> > -	__drm_dbg(DRM_UT_KMS, fmt, ##__VA_ARGS__)
> > +	__drm_dbg(cDRM_UT_KMS, fmt, ##__VA_ARGS__)
> >  
> >  #define DRM_DEBUG_PRIME(fmt, ...)					\
> > -	__drm_dbg(DRM_UT_PRIME, fmt, ##__VA_ARGS__)
> > +	__drm_dbg(cDRM_UT_PRIME, fmt, ##__VA_ARGS__)
> >  
> >  #define DRM_DEBUG_ATOMIC(fmt, ...)					\
> > -	__drm_dbg(DRM_UT_ATOMIC, fmt, ##__VA_ARGS__)
> > +	__drm_dbg(cDRM_UT_ATOMIC, fmt, ##__VA_ARGS__)
> >  
> >  #define DRM_DEBUG_VBL(fmt, ...)						\
> > -	__drm_dbg(DRM_UT_VBL, fmt, ##__VA_ARGS__)
> > +	__drm_dbg(cDRM_UT_VBL, fmt, ##__VA_ARGS__)
> >  
> >  #define DRM_DEBUG_LEASE(fmt, ...)					\
> > -	__drm_dbg(DRM_UT_LEASE, fmt, ##__VA_ARGS__)
> > +	__drm_dbg(cDRM_UT_LEASE, fmt, ##__VA_ARGS__)
> >  
> >  #define DRM_DEBUG_DP(fmt, ...)						\
> > -	__drm_dbg(DRM_UT_DP, fmt, ## __VA_ARGS__)
> > +	__drm_dbg(cDRM_UT_DP, fmt, ## __VA_ARGS__)
> >  
> > -#define __DRM_DEFINE_DBG_RATELIMITED(category, drm, fmt, ...)		\
> > +#define __DRM_DEFINE_DBG_RATELIMITED(DRM_UT, cDRM_UT, drm, fmt, ...)	\
> >  ({									\
> >  	static DEFINE_RATELIMIT_STATE(rs_,				\
> >  				      DEFAULT_RATELIMIT_INTERVAL,	\
> >  				      DEFAULT_RATELIMIT_BURST);		\
> >  	const struct drm_device *drm_ = (drm);				\
> >  									\
> > -	if (drm_debug_enabled(DRM_UT_ ## category) && __ratelimit(&rs_))\
> > -		drm_dev_printk(drm_ ? drm_->dev : NULL,			\
> > -			       KERN_DEBUG, fmt, ## __VA_ARGS__);	\
> > +	if (drm_debug_enabled(DRM_UT) && __ratelimit(&rs_))		\
> > +		drm_dev_dbg((drm_) ? (drm_)->dev : NULL,		\
> > +			    cDRM_UT, fmt, ##__VA_ARGS__);		\
> >  })
> >  
> >  #define drm_dbg_kms_ratelimited(drm, fmt, ...) \
> > -	__DRM_DEFINE_DBG_RATELIMITED(KMS, drm, fmt, ## __VA_ARGS__)
> > +	__DRM_DEFINE_DBG_RATELIMITED(DRM_UT_KMS, cDRM_UT_KMS, drm, fmt, ## __VA_ARGS__)
> >  
> >  #define DRM_DEBUG_KMS_RATELIMITED(fmt, ...) \
> >  	drm_dbg_kms_ratelimited(NULL, fmt, ## __VA_ARGS__)
> > -- 
> > 2.31.1
> > 
> 
> -- 
> Daniel Vetter
> Software Engineer, Intel Corporation
> http://blog.ffwll.ch
> _______________________________________________
> Intel-gfx mailing list
> Intel-gfx@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/intel-gfx

-- 
Sean Paul, Software Engineer, Google / Chromium OS
