Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0487211E8A8
	for <lists+dri-devel@lfdr.de>; Fri, 13 Dec 2019 17:47:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3D4AB6EB1D;
	Fri, 13 Dec 2019 16:47:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-xb43.google.com (mail-yb1-xb43.google.com
 [IPv6:2607:f8b0:4864:20::b43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 350056E093
 for <dri-devel@lists.freedesktop.org>; Fri, 13 Dec 2019 16:47:06 +0000 (UTC)
Received: by mail-yb1-xb43.google.com with SMTP id z10so21143ybr.9
 for <dri-devel@lists.freedesktop.org>; Fri, 13 Dec 2019 08:47:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=poorly.run; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to
 :user-agent; bh=ofOidyKUICs23v5gb6DTYzEfgLByKV44IbpFy6YgRx0=;
 b=dBVrRLyuTGmckMCXXUJH3muSjLB9Gg7RolIKDnyTSJWld4pMV3eir1Z/urDDGNVBVe
 cUYivoYVia6SYC3ThtXty1CCxvlaKII3G3fRa92kBayWEBN6aKp8eHtqjlQhXJE7Drqr
 wbdPx7t9ZAK11mbcwdHaii/9mEQKKBj7FZvqRhsGuqvimyYboIAnYGvQ1VQ/Uol3zi3/
 DOEFYTlG2I7OR4e/7qfkYcAI+MdQuxWYlfo8fE/m/+uq1pXILoKchtcdUkwn08thZzaX
 bL808HgyxdsQ6FOafzdPUTP7Phj/kwNBXqQ0qibGk/OX+CGAj8wmrmHxbopbguSztrNt
 BBIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to:user-agent;
 bh=ofOidyKUICs23v5gb6DTYzEfgLByKV44IbpFy6YgRx0=;
 b=YodG3Oznns7FS7jY4qZSLJkRT1FE6p0AHKi51qJdVR7G3OygBfHXv733uFhp0BZclJ
 AX+MIqCrfSyWQvxEC7U5zQ/6+HBqkfLPdHsRD/swO/4NjM0IUxi3CI/AIcMzZ2xYKwJg
 Ll1PgbjGvYX1SLwxkimZFlNuotsa6uASorlY2SbGb5MWtb9A8H6e+Hn2zBSAaWIznruf
 n76pbO8pMrMCKTnIu30tZPMCS67FpG790Xu5HLYDhG7t1UZqDdY0Hf20hysgMRo9LzKk
 tc6R/T6S8GW0xPY+9x/NeLjkCXnjeFfFt+pbghNrQZ3eGwf9bbIGQVpGF7zrAp/8M2Lk
 yoEw==
X-Gm-Message-State: APjAAAXChQyGtJdh2csS4JH8aIR22U97rW4K2juqh757DnBNrR7BzGQC
 ehQOfJMKRpQ03hwM96PLzgp61j1UFGM+cQ==
X-Google-Smtp-Source: APXvYqyc7bmflu3uAeLDZZ0Yks+jWgwbssd8Z3vQcifGd7w8l/ytjbWuRM+0tdS0wh2ONq7Hxa9SAg==
X-Received: by 2002:a25:2805:: with SMTP id o5mr9614833ybo.204.1576255625153; 
 Fri, 13 Dec 2019 08:47:05 -0800 (PST)
Received: from localhost ([2620:0:1013:11:1e1:4760:6ce4:fc64])
 by smtp.gmail.com with ESMTPSA id l184sm4441357ywf.86.2019.12.13.08.47.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 13 Dec 2019 08:47:04 -0800 (PST)
Date: Fri, 13 Dec 2019 11:47:03 -0500
From: Sean Paul <sean@poorly.run>
To: Steven Rostedt <rostedt@goodmis.org>
Subject: Re: [PATCH v3] drm: Funnel drm logs to tracepoints
Message-ID: <20191213164652.GB41609@art_vandelay>
References: <20191212203301.142437-1-sean@poorly.run>
 <20191212222050.0bdddc13@rorschach.local.home>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191212222050.0bdddc13@rorschach.local.home>
User-Agent: Mutt/1.10.1 (2018-07-13)
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
Cc: David Airlie <airlied@linux.ie>, Sean Paul <sean@poorly.run>,
 dri-devel@lists.freedesktop.org, Ingo Molnar <mingo@redhat.com>,
 Sean Paul <seanpaul@chromium.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Daniel Vetter <daniel.vetter@ffwll.ch>
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


Hi Steven,
Thanks for the feedback!

On Thu, Dec 12, 2019 at 10:20:50PM -0500, Steven Rostedt wrote:
> On Thu, 12 Dec 2019 15:32:35 -0500
> Sean Paul <sean@poorly.run> wrote:
> =

> > =

> > What about trace_printk()? It doesn't give us the control we get from u=
sing
> > tracepoints and it's not meant to be left sprinkled around in code.
> =

> Not to mention that trace_printk() is not for production use (only for
> developers debugging purposes).
> =


Yep, I'll clarify this in the next version.

> > =

> > Cc: David Airlie <airlied@gmail.com>
> > Cc: Daniel Vetter <daniel.vetter@ffwll.ch>
> > Cc: Pekka Paalanen <ppaalanen@gmail.com>
> > Cc: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
> > Cc: Thomas Zimmermann <tzimmermann@suse.de>
> > Cc: Rob Clark <robdclark@gmail.com>
> > Cc: Ville Syrj=E4l=E4 <ville.syrjala@linux.intel.com>
> > Acked-by: Daniel Vetter <daniel.vetter@ffwll.ch>
> > Signed-off-by: Sean Paul <seanpaul@chromium.org>
> > Link: https://patchwork.freedesktop.org/patch/msgid/20191010204823.1955=
40-1-sean@poorly.run #v1
> > =

> > Changes in v2:
> > - Went with a completely different approach: https://lists.freedesktop.=
org/archives/dri-devel/2019-November/243230.html
> > =

> > Changes in v3:
> > - Changed commit message to be a bit less RFC-y
> > - Make class_drm_category_log an actual trace class
> > ---
> > =

> > Even though we don't want it to be, this is UAPI. So here's some usersp=
ace
> > code which uses it:
> > https://chromium-review.googlesource.com/c/chromiumos/platform2/+/19655=
62
> > =

> > =

> >  drivers/gpu/drm/drm_print.c      | 143 ++++++++++++++++++++++++++-----
> >  include/trace/events/drm_print.h | 116 +++++++++++++++++++++++++
> >  2 files changed, 239 insertions(+), 20 deletions(-)
> >  create mode 100644 include/trace/events/drm_print.h
> > =

> > diff --git a/drivers/gpu/drm/drm_print.c b/drivers/gpu/drm/drm_print.c
> > index 9a25d73c155c..f591292811aa 100644
> > --- a/drivers/gpu/drm/drm_print.c
> > +++ b/drivers/gpu/drm/drm_print.c
> > @@ -27,11 +27,15 @@
> >  =

> >  #include <stdarg.h>
> >  =

> > +#include <linux/bitops.h>
> >  #include <linux/io.h>
> >  #include <linux/moduleparam.h>
> >  #include <linux/seq_file.h>
> >  #include <linux/slab.h>
> >  =

> > +#define CREATE_TRACE_POINTS
> > +#include <trace/events/drm_print.h>
> > +
> >  #include <drm/drm.h>
> >  #include <drm/drm_drv.h>
> >  #include <drm/drm_print.h>
> > @@ -241,10 +245,10 @@ void drm_dev_printk(const struct device *dev, con=
st char *level,
> >  	struct va_format vaf;
> >  	va_list args;
> >  =

> > -	va_start(args, format);
> >  	vaf.fmt =3D format;
> >  	vaf.va =3D &args;
> >  =

> > +	va_start(args, format);
> >  	if (dev)
> >  		dev_printk(level, dev, "[" DRM_NAME ":%ps] %pV",
> >  			   __builtin_return_address(0), &vaf);
> > @@ -253,49 +257,145 @@ void drm_dev_printk(const struct device *dev, co=
nst char *level,
> >  		       level, __builtin_return_address(0), &vaf);
> >  =

> >  	va_end(args);
> > +
> > +	va_start(args, format);
> > +	trace_drm_log(level, dev, &vaf);
> > +	va_end(args);
> >  }
> >  EXPORT_SYMBOL(drm_dev_printk);
> >  =

> > +static unsigned int drm_trace_enabled(unsigned int category)
> > +{
> > +	unsigned int bit;
> > +
> > +	for_each_set_bit(bit, (unsigned long*)&category, sizeof(category) * 8=
) {
> > +		switch (BIT(bit)) {
> > +		case DRM_UT_NONE:
> > +			return trace_drm_dbg_none_enabled();
> > +		case DRM_UT_CORE:
> > +			return trace_drm_dbg_core_enabled();
> > +		case DRM_UT_DRIVER:
> > +			return trace_drm_dbg_driver_enabled();
> > +		case DRM_UT_KMS:
> > +			return trace_drm_dbg_kms_enabled();
> > +		case DRM_UT_PRIME:
> > +			return trace_drm_dbg_prime_enabled();
> > +		case DRM_UT_ATOMIC:
> > +			return trace_drm_dbg_atomic_enabled();
> > +		case DRM_UT_VBL:
> > +			return trace_drm_dbg_vbl_enabled();
> > +		case DRM_UT_STATE:
> > +			return trace_drm_dbg_state_enabled();
> > +		case DRM_UT_LEASE:
> > +			return trace_drm_dbg_lease_enabled();
> > +		case DRM_UT_DP:
> > +			return trace_drm_dbg_dp_enabled();
> > +		default:
> > +			return trace_drm_dbg_unknown_enabled();
> > +		}
> =

> Why this double loop?
> =


category is technically a bitfield, but only 1 bit is ever set (grander pla=
ns
when it was created, I suppose). As Jani mentions, it's being changed to an
enum, so we won't need this loop.

> > +	}
> > +	return false;
> > +}
> > +
> > +static void drm_do_trace(const struct device *dev, unsigned int catego=
ry,
> > +			 struct va_format *vaf)
> > +{
> > +	WARN_ON(hweight32(category) > 1);
> > +
> > +	switch (category) {
> > +	case DRM_UT_NONE:
> > +		trace_drm_dbg_none(dev, vaf);
> > +		break;
> > +	case DRM_UT_CORE:
> > +		trace_drm_dbg_core(dev, vaf);
> > +		break;
> > +	case DRM_UT_DRIVER:
> > +		trace_drm_dbg_driver(dev, vaf);
> > +		break;
> > +	case DRM_UT_KMS:
> > +		trace_drm_dbg_kms(dev, vaf);
> > +		break;
> > +	case DRM_UT_PRIME:
> > +		trace_drm_dbg_prime(dev, vaf);
> > +		break;
> > +	case DRM_UT_ATOMIC:
> > +		trace_drm_dbg_atomic(dev, vaf);
> > +		break;
> > +	case DRM_UT_VBL:
> > +		trace_drm_dbg_vbl(dev, vaf);
> > +		break;
> > +	case DRM_UT_STATE:
> > +		trace_drm_dbg_state(dev, vaf);
> > +		break;
> > +	case DRM_UT_LEASE:
> > +		trace_drm_dbg_lease(dev, vaf);
> > +		break;
> > +	case DRM_UT_DP:
> > +		trace_drm_dbg_dp(dev, vaf);
> > +		break;
> > +	default:
> > +		trace_drm_dbg_unknown(dev, vaf);
> > +		break;
> =

> Why is there a separate trace event for each of these?
> =


To make it easier on userspace to enable just a single drm category.

> > +	}
> > +}
> > +
> >  void drm_dev_dbg(const struct device *dev, unsigned int category,
> >  		 const char *format, ...)
> >  {
> >  	struct va_format vaf;
> > +	unsigned int bit;
> >  	va_list args;
> >  =

> > -	if (!drm_debug_enabled(category))
> > -		return;
> > -
> > -	va_start(args, format);
> >  	vaf.fmt =3D format;
> >  	vaf.va =3D &args;
> >  =

> > -	if (dev)
> > -		dev_printk(KERN_DEBUG, dev, "[" DRM_NAME ":%ps] %pV",
> > -			   __builtin_return_address(0), &vaf);
> > -	else
> > -		printk(KERN_DEBUG "[" DRM_NAME ":%ps] %pV",
> > -		       __builtin_return_address(0), &vaf);
> > +	if (drm_debug_enabled(category)) {
> > +		va_start(args, format);
> > +		if (dev)
> > +			dev_printk(KERN_DEBUG, dev, "[" DRM_NAME ":%ps] %pV",
> > +				   __builtin_return_address(0), &vaf);
> > +		else
> > +			printk(KERN_DEBUG "[" DRM_NAME ":%ps] %pV",
> > +			       __builtin_return_address(0), &vaf);
> > +		va_end(args);
> > +	}
> > +
> > +	if (!drm_trace_enabled(category))
> > +		return;
> > +
> > +	for_each_set_bit(bit, (unsigned long*)&category, sizeof(category) * 8=
) {
> > +		va_start(args, format);
> > +		drm_do_trace(dev, BIT(bit), &vaf);
> > +		va_end(args);
> =

> I'm thinking we could find a way to move the logic here to have a
> single loop.

Should be done with the enum conversion mentioned above.

> =

> Note, the current approach is racy. The state can change between the
> "drm_trace_enabled()" and this for loop.

Yep, good catch. I think the race is ok since in that case the message will=
 get
dropped when we call drm_do_trace. The trace_enabled() call is just a fastp=
ath
for the majority case.

Sean

> =

> -- Steve
> =

> =

> > +	}
> >  =

> > -	va_end(args);
> >  }
> >  EXPORT_SYMBOL(drm_dev_dbg);
> >  =

> >  void drm_dbg(unsigned int category, const char *format, ...)
> >  {
> >  	struct va_format vaf;
> > +	unsigned int bit;
> >  	va_list args;
> >  =

> > -	if (!drm_debug_enabled(category))
> > -		return;
> > -
> > -	va_start(args, format);
> >  	vaf.fmt =3D format;
> >  	vaf.va =3D &args;
> >  =

> > -	printk(KERN_DEBUG "[" DRM_NAME ":%ps] %pV",
> > -	       __builtin_return_address(0), &vaf);
> > +	if (drm_debug_enabled(category)) {
> > +		va_start(args, format);
> > +		printk(KERN_DEBUG "[" DRM_NAME ":%ps] %pV",
> > +		       __builtin_return_address(0), &vaf);
> > +		va_end(args);
> > +	}
> >  =

> > -	va_end(args);
> > +	if (!drm_trace_enabled(category))
> > +		return;
> > +
> > +	for_each_set_bit(bit, (unsigned long*)&category, sizeof(category) * 8=
) {
> > +		va_start(args, format);
> > +		drm_do_trace(NULL, BIT(bit), &vaf);
> > +		va_end(args);
> > +	}
> >  }
> >  EXPORT_SYMBOL(drm_dbg);
> >  =

> > @@ -304,13 +404,16 @@ void drm_err(const char *format, ...)
> >  	struct va_format vaf;
> >  	va_list args;
> >  =

> > -	va_start(args, format);
> >  	vaf.fmt =3D format;
> >  	vaf.va =3D &args;
> >  =

> > +	va_start(args, format);
> >  	printk(KERN_ERR "[" DRM_NAME ":%ps] *ERROR* %pV",
> >  	       __builtin_return_address(0), &vaf);
> > +	va_end(args);
> >  =

> > +	va_start(args, format);
> > +	trace_drm_err(NULL, &vaf);
> >  	va_end(args);
> >  }
> >  EXPORT_SYMBOL(drm_err);
> > diff --git a/include/trace/events/drm_print.h b/include/trace/events/dr=
m_print.h
> > new file mode 100644
> > index 000000000000..862728fe0f89
> > --- /dev/null
> > +++ b/include/trace/events/drm_print.h
> > @@ -0,0 +1,116 @@
> > +// SPDX-License-Identifier: MIT
> > +/*
> > + * Copyright (C) 2019 Google, Inc.
> > + *
> > + * Authors:
> > + * Sean Paul <seanpaul@chromium.org>
> > + */
> > +#undef TRACE_SYSTEM
> > +#define TRACE_SYSTEM drm_print
> > +
> > +#if !defined(_TRACE_DRM_PRINT_H) || defined(TRACE_HEADER_MULTI_READ)
> > +
> > +#include <linux/device.h>
> > +#include <linux/tracepoint.h>
> > +
> > +#define DRM_PRINT_MAX 256
> > +
> > +#define _TRACE_DRM_PRINT_H
> > +
> > +TRACE_EVENT(drm_log,
> > +	TP_PROTO(const char * level, const struct device *dev,
> > +		 struct va_format *vaf),
> > +	TP_ARGS(level, dev, vaf),
> > +	TP_STRUCT__entry(
> > +		__field(const char *,		level			)
> > +		__field(const struct device *,	dev			)
> > +		__dynamic_array(char,		msg,	DRM_PRINT_MAX	)
> > +		__field(int,			len			)
> > +	),
> > +	TP_fast_assign(
> > +		__entry->level =3D level;
> > +		__entry->dev =3D dev;
> > +		__entry->len =3D vsnprintf(__get_str(msg), DRM_PRINT_MAX,
> > +					 vaf->fmt, *vaf->va);
> > +		if (__entry->len > 0 &&
> > +		    __get_str(msg)[__entry->len - 1] =3D=3D '\n')
> > +			__get_str(msg)[--__entry->len] =3D '\0';
> > +	),
> > +	TP_printk("%s %s %s: %s", __entry->level,
> > +		  __entry->dev ? dev_driver_string(__entry->dev) : "(NULL):",
> > +		  __entry->dev ? dev_name(__entry->dev) : "", __get_str(msg))
> > +);
> > +
> > +DECLARE_EVENT_CLASS(class_drm_category_log,
> > +	TP_PROTO(const struct device *dev, struct va_format *vaf),
> > +	TP_ARGS(dev, vaf),
> > +	TP_STRUCT__entry(
> > +		__field(const struct device *,	dev			)
> > +		__dynamic_array(char,		msg,	DRM_PRINT_MAX	)
> > +		__field(int,			len			)
> > +	),
> > +	TP_fast_assign(
> > +		__entry->dev =3D dev;
> > +		__entry->len =3D vsnprintf(__get_str(msg), DRM_PRINT_MAX,
> > +					 vaf->fmt, *vaf->va);
> > +		if (__entry->len > 0 &&
> > +		    __get_str(msg)[__entry->len - 1] =3D=3D '\n')
> > +			__get_str(msg)[--__entry->len] =3D '\0';
> > +	),
> > +	TP_printk("%s %s%s%s",
> > +		  __entry->dev ? dev_driver_string(__entry->dev) : "",
> > +		  __entry->dev ? dev_name(__entry->dev) : "",
> > +		  __entry->dev ? ": " : "", __get_str(msg))
> > +);
> > +DEFINE_EVENT(class_drm_category_log, drm_err,
> > +	TP_PROTO(const struct device *dev, struct va_format *vaf),
> > +	TP_ARGS(dev, vaf)
> > +);
> > +DEFINE_EVENT(class_drm_category_log, drm_dbg_none,
> > +	TP_PROTO(const struct device *dev, struct va_format *vaf),
> > +	TP_ARGS(dev, vaf)
> > +);
> > +DEFINE_EVENT(class_drm_category_log, drm_dbg_core,
> > +	TP_PROTO(const struct device *dev, struct va_format *vaf),
> > +	TP_ARGS(dev, vaf)
> > +);
> > +DEFINE_EVENT(class_drm_category_log, drm_dbg_driver,
> > +	TP_PROTO(const struct device *dev, struct va_format *vaf),
> > +	TP_ARGS(dev, vaf)
> > +);
> > +DEFINE_EVENT(class_drm_category_log, drm_dbg_kms,
> > +	TP_PROTO(const struct device *dev, struct va_format *vaf),
> > +	TP_ARGS(dev, vaf)
> > +);
> > +DEFINE_EVENT(class_drm_category_log, drm_dbg_prime,
> > +	TP_PROTO(const struct device *dev, struct va_format *vaf),
> > +	TP_ARGS(dev, vaf)
> > +);
> > +DEFINE_EVENT(class_drm_category_log, drm_dbg_atomic,
> > +	TP_PROTO(const struct device *dev, struct va_format *vaf),
> > +	TP_ARGS(dev, vaf)
> > +);
> > +DEFINE_EVENT(class_drm_category_log, drm_dbg_vbl,
> > +	TP_PROTO(const struct device *dev, struct va_format *vaf),
> > +	TP_ARGS(dev, vaf)
> > +);
> > +DEFINE_EVENT(class_drm_category_log, drm_dbg_state,
> > +	TP_PROTO(const struct device *dev, struct va_format *vaf),
> > +	TP_ARGS(dev, vaf)
> > +);
> > +DEFINE_EVENT(class_drm_category_log, drm_dbg_lease,
> > +	TP_PROTO(const struct device *dev, struct va_format *vaf),
> > +	TP_ARGS(dev, vaf)
> > +);
> > +DEFINE_EVENT(class_drm_category_log, drm_dbg_dp,
> > +	TP_PROTO(const struct device *dev, struct va_format *vaf),
> > +	TP_ARGS(dev, vaf)
> > +);
> > +DEFINE_EVENT(class_drm_category_log, drm_dbg_unknown,
> > +	TP_PROTO(const struct device *dev, struct va_format *vaf),
> > +	TP_ARGS(dev, vaf)
> > +);
> > +#endif
> > +
> > +/* This part must be outside protection */
> > +#include <trace/define_trace.h>
> =


-- =

Sean Paul, Software Engineer, Google / Chromium OS
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
