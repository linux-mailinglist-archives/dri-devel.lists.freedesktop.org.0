Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9937F15E2F1
	for <lists+dri-devel@lfdr.de>; Fri, 14 Feb 2020 17:26:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BAB406FB55;
	Fri, 14 Feb 2020 16:26:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com
 [IPv6:2a00:1450:4864:20::443])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ABD176FB55
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Feb 2020 16:25:58 +0000 (UTC)
Received: by mail-wr1-x443.google.com with SMTP id w15so11571524wru.4
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Feb 2020 08:25:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=wegwrrw07t1a7hEUYZBuMroevTYgeYXkcKsPKXsfzIQ=;
 b=KxjiSXptqtmHkxQs7W5WAI/+L8vSj2pT29Ke4jsJYuFR9OcT5KZJEJq6fZrgttPgpj
 hOW9Lb/MEwbmAafkG1CQONBPodYzOtPvuFlpo2VBxvg+5LyhcdwdJVrqvzIq+rx2j8H0
 vJBBR4Z0nZC+YTPK9QrHg90rqE64Uh2xdpjZM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=wegwrrw07t1a7hEUYZBuMroevTYgeYXkcKsPKXsfzIQ=;
 b=A2lbd/saF1HRf01vnENTRhEcKZ5SoUhO6P3cX8TGF3LUAMDaHzt0r/E0rRvk9RVmpP
 YWerR92SHHHEENPI+iOTNu8Ho5QcK/f1QavuLvxajKltAVz09XH7Vs7olxhZXgOe2Haq
 jK2//ScRS2J4wdF2AzWYMkHeHx4JHG5FHy0NBwygOBGKXh49Llo1AFektVfZ6/2f5X4Q
 BidFYiKbDiC2R5xhYk1UGnp9dymuNgqHLH9BlKdjrEodPt56CrRbVRey9W+z8xcccnwR
 Ez3B2cZmR+i5zoI3DL4fCznyp/RCDGbLOO1JFVGyps0TvP5d5aNAoH6guyRLShauROjn
 I+Rw==
X-Gm-Message-State: APjAAAVfimEdEJpHmAZGbq9f1OXE0QPT85uiPgUMGSL/EyZL7zmNlez2
 Hjh7VH9JnS74fmkUG7n7gQQPfA==
X-Google-Smtp-Source: APXvYqzxA2jp7DwpYzdBaYkBw3v75jY7E1GHYEnQWg+jN7wh/scB+xHLTvr4uN/Xlp7+Q8nvd5aQ5w==
X-Received: by 2002:adf:ecd0:: with SMTP id s16mr4684092wro.325.1581697557225; 
 Fri, 14 Feb 2020 08:25:57 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id z21sm8000736wml.5.2020.02.14.08.25.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 14 Feb 2020 08:25:56 -0800 (PST)
Date: Fri, 14 Feb 2020 17:25:54 +0100
From: Daniel Vetter <daniel@ffwll.ch>
To: Jani Nikula <jani.nikula@intel.com>
Subject: Re: [PATCH] drm/print: Delete a few unused shouting macros
Message-ID: <20200214162554.GW2363188@phenom.ffwll.local>
References: <20200214090428.2929833-1-daniel.vetter@ffwll.ch>
 <8736bdy1jg.fsf@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <8736bdy1jg.fsf@intel.com>
X-Operating-System: Linux phenom 5.3.0-3-amd64 
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Daniel Vetter <daniel.vetter@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Feb 14, 2020 at 11:13:23AM +0200, Jani Nikula wrote:
> On Fri, 14 Feb 2020, Daniel Vetter <daniel.vetter@ffwll.ch> wrote:
> > We want to go over to the new lowercase ones, encourage that a bit
> > more.
> >
> > Cc: Jani Nikula <jani.nikula@intel.com>
> > Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
> > ---
> >  drivers/gpu/drm/drm_managed.c | 21 +++++++++++++++++++++
> 
> Oops?

Indeed, tiny sneak peek at what I'm working on ... you mentioning devm_
yesterday was a very successful nerd snipe :-)

> 
> >  include/drm/drm_print.h       | 26 --------------------------
> 
> Acked-by: Jani Nikula <jani.nikula@intel.com>
> 
> for this file.

Wrong hunk dropped and applied, thanks for taking a look.
-Daniel

> 
> >  2 files changed, 21 insertions(+), 26 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/drm_managed.c b/drivers/gpu/drm/drm_managed.c
> > index ea49071b16ee..7d4827b79806 100644
> > --- a/drivers/gpu/drm/drm_managed.c
> > +++ b/drivers/gpu/drm/drm_managed.c
> > @@ -38,4 +38,25 @@ struct drmres {
> >  	u8 __aligned(ARCH_KMALLOC_MINALIGN) data[];
> >  };
> >  
> > +static __always_inline struct drmres * alloc_dr(drmres_release_t release,
> > +						size_t size, gfp_t gfp, int nid)
> > +{
> > +	size_t tot_size;
> > +	struct drmres *dr;
> > +
> > +	/* We must catch any near-SIZE_MAX cases that could overflow. */
> > +	if (unlikely(check_add_overflow(sizeof(*dr), size, &tot_size)))
> > +		return NULL;
> > +
> > +	dr = kmalloc_node_track_caller(tot_size, gfp, nid);
> > +	if (unlikely(!dr))
> > +		return NULL;
> > +
> > +	memset(dr, 0, offsetof(struct drmres, data));
> > +
> > +	INIT_LIST_HEAD(&dr->node.entry);
> > +	dr->node.release = release;
> > +	return dr;
> > +}
> > +
> >  
> > diff --git a/include/drm/drm_print.h b/include/drm/drm_print.h
> > index 894a0b9437e2..fd6ba2532f50 100644
> > --- a/include/drm/drm_print.h
> > +++ b/include/drm/drm_print.h
> > @@ -382,14 +382,6 @@ void drm_dev_dbg(const struct device *dev, enum drm_debug_category category,
> >  	drm_dev_dbg(dev, DRM_UT_DRIVER,	fmt, ##__VA_ARGS__)
> >  #define DRM_DEV_DEBUG_KMS(dev, fmt, ...)				\
> >  	drm_dev_dbg(dev, DRM_UT_KMS, fmt, ##__VA_ARGS__)
> > -#define DRM_DEV_DEBUG_PRIME(dev, fmt, ...)				\
> > -	drm_dev_dbg(dev, DRM_UT_PRIME, fmt, ##__VA_ARGS__)
> > -#define DRM_DEV_DEBUG_ATOMIC(dev, fmt, ...)				\
> > -	drm_dev_dbg(dev, DRM_UT_ATOMIC,	fmt, ##__VA_ARGS__)
> > -#define DRM_DEV_DEBUG_VBL(dev, fmt, ...)				\
> > -	drm_dev_dbg(dev, DRM_UT_VBL, fmt, ##__VA_ARGS__)
> > -#define	DRM_DEV_DEBUG_DP(dev, fmt, ...)					\
> > -	drm_dev_dbg(dev, DRM_UT_DP, fmt, ## __VA_ARGS__)
> >  
> >  #define _DRM_DEV_DEFINE_DEBUG_RATELIMITED(dev, category, fmt, ...)	\
> >  ({									\
> > @@ -406,18 +398,9 @@ void drm_dev_dbg(const struct device *dev, enum drm_debug_category category,
> >   * @dev: device pointer
> >   * @fmt: printf() like format string.
> >   */
> > -#define DRM_DEV_DEBUG_RATELIMITED(dev, fmt, ...)			\
> > -	_DEV_DRM_DEFINE_DEBUG_RATELIMITED(dev, DRM_UT_CORE,		\
> > -					  fmt, ##__VA_ARGS__)
> > -#define DRM_DEV_DEBUG_DRIVER_RATELIMITED(dev, fmt, ...)			\
> > -	_DRM_DEV_DEFINE_DEBUG_RATELIMITED(dev, DRM_UT_DRIVER,		\
> > -					  fmt, ##__VA_ARGS__)
> >  #define DRM_DEV_DEBUG_KMS_RATELIMITED(dev, fmt, ...)			\
> >  	_DRM_DEV_DEFINE_DEBUG_RATELIMITED(dev, DRM_UT_KMS,		\
> >  					  fmt, ##__VA_ARGS__)
> > -#define DRM_DEV_DEBUG_PRIME_RATELIMITED(dev, fmt, ...)			\
> > -	_DRM_DEV_DEFINE_DEBUG_RATELIMITED(dev, DRM_UT_PRIME,		\
> > -					  fmt, ##__VA_ARGS__)
> >  
> >  /*
> >   * struct drm_device based logging
> > @@ -541,18 +524,9 @@ void __drm_err(const char *format, ...);
> >  	__drm_dbg(DRM_UT_DP, fmt, ## __VA_ARGS__)
> >  
> >  
> > -#define DRM_DEBUG_RATELIMITED(fmt, ...)					\
> > -	DRM_DEV_DEBUG_RATELIMITED(NULL, fmt, ##__VA_ARGS__)
> > -
> > -#define DRM_DEBUG_DRIVER_RATELIMITED(fmt, ...)				\
> > -	DRM_DEV_DEBUG_DRIVER_RATELIMITED(NULL, fmt, ##__VA_ARGS__)
> > -
> >  #define DRM_DEBUG_KMS_RATELIMITED(fmt, ...)				\
> >  	DRM_DEV_DEBUG_KMS_RATELIMITED(NULL, fmt, ##__VA_ARGS__)
> >  
> > -#define DRM_DEBUG_PRIME_RATELIMITED(fmt, ...)				\
> > -	DRM_DEV_DEBUG_PRIME_RATELIMITED(NULL, fmt, ##__VA_ARGS__)
> > -
> >  /*
> >   * struct drm_device based WARNs
> >   *
> 
> -- 
> Jani Nikula, Intel Open Source Graphics Center

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
