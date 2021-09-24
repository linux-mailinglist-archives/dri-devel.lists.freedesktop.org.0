Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 626B8417AC8
	for <lists+dri-devel@lfdr.de>; Fri, 24 Sep 2021 20:16:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 136DA6E200;
	Fri, 24 Sep 2021 18:16:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BB7CF6E200
 for <dri-devel@lists.freedesktop.org>; Fri, 24 Sep 2021 18:16:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1632507408;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=/XZTO3hQwEUw1n5k6UDpdYw7oKmrhKHOCU0IGHqWWG0=;
 b=FKqhCH3gue0VhFIXW9QGqa+byS6/U0opKxh4onvShWBozt2KaKww7d6PurnoOJ+YvfMnMx
 g8ViiwrcO3kOnNvdCYoVu7EHmfdSzHpT0RT8JclrWNtxTlNktT/PgeLJJ3lT1d6+pRowGi
 cX5IyP6kcKX7kdxukKtY9OOG65edIl4=
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com
 [209.85.160.197]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-258-DLOem9pQOL2JRuOZy0rbIA-1; Fri, 24 Sep 2021 14:16:45 -0400
X-MC-Unique: DLOem9pQOL2JRuOZy0rbIA-1
Received: by mail-qt1-f197.google.com with SMTP id
 m26-20020ac87b5a000000b002a6b3744ae6so29379638qtu.22
 for <dri-devel@lists.freedesktop.org>; Fri, 24 Sep 2021 11:16:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
 :references:organization:user-agent:mime-version
 :content-transfer-encoding;
 bh=/XZTO3hQwEUw1n5k6UDpdYw7oKmrhKHOCU0IGHqWWG0=;
 b=Np1Q/z05d6f6zrayegu1SbpTPpddicjo3ePjAXAjQNkPYh6JsCSMHe80f1ZE39ukBV
 Kq0rFaAt1nt+D0wWaEsx8XWiWmhWs9mBcyuFExgdQhMLexRxKITnCJhaIe/L3axc5qDt
 g/KwuygiUFCBCcPYzsS1SRW/5X7IH+6UN2+bA8D19hmpXF4N+lEGIkYzo/Q/r0b4ObB5
 HBzSqcd4SPRD7mPPqy7X8Ejbo6kfUEblE93bzo9s6O4QPc2n1jZiYTMrWMYoDibHdWOZ
 mlhBVXv5Ez8O3ln1bD09xJmEJ2hARNF3wyvmgX96OYinGbj20EgDYouQLhPjysn/sRXu
 A8iw==
X-Gm-Message-State: AOAM532oPSGGrpEwyjUpzMmayqBUrvzeoTaKkf/gjA1u9ySIy0FKCy3j
 v5fSN3mTFi4dQkA/VjbsBosWhkJnhDn5rY3F0fX57zhPSdMEI1JWphIMPzGasxWNBQD5dxk6Pdm
 ZdxvRojE/OydCny/gc7QdYfAtsxX7
X-Received: by 2002:a05:622a:1a9f:: with SMTP id
 s31mr5659456qtc.381.1632507404656; 
 Fri, 24 Sep 2021 11:16:44 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzlyHyj1JScPlhqV3UkuuS2rTtoAfyZvwyso8AYDYCQEtFhSw4UVAZGBacOTk5lMLbtnXHfhA==
X-Received: by 2002:a05:622a:1a9f:: with SMTP id
 s31mr5659421qtc.381.1632507404374; 
 Fri, 24 Sep 2021 11:16:44 -0700 (PDT)
Received: from [192.168.8.206] (pool-108-49-102-102.bstnma.fios.verizon.net.
 [108.49.102.102])
 by smtp.gmail.com with ESMTPSA id l7sm6250919qtr.87.2021.09.24.11.16.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 24 Sep 2021 11:16:43 -0700 (PDT)
Message-ID: <7d19a626299fcc23e10678faea95b76d71c26b23.camel@redhat.com>
Subject: Re: [RFC PATCH] drm/print: Add deprecation notes to DRM_...()
 functions
From: Lyude Paul <lyude@redhat.com>
To: Thomas Zimmermann <tzimmermann@suse.de>, Douglas Anderson
 <dianders@chromium.org>, dri-devel@lists.freedesktop.org
Cc: sam@ravnborg.org, daniel.vetter@ffwll.ch, jani.nikula@intel.com, 
 swboyd@chromium.org, airlied@redhat.com, Daniel Vetter <daniel@ffwll.ch>,
 David Airlie <airlied@linux.ie>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 linux-kernel@vger.kernel.org
Date: Fri, 24 Sep 2021 14:16:42 -0400
In-Reply-To: <2b957783-aa5c-33a5-7fe3-475d5a80bacc@suse.de>
References: <20210921082757.RFC.1.Ibd82d98145615fa55f604947dc6a696cc82e8e43@changeid>
 <2b957783-aa5c-33a5-7fe3-475d5a80bacc@suse.de>
Organization: Red Hat
User-Agent: Evolution 3.40.4 (3.40.4-1.fc34)
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=lyude@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
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

Acked-by: Lyude Paul <lyude@redhat.com>

On Wed, 2021-09-22 at 09:12 +0200, Thomas Zimmermann wrote:
> Hi
> 
> Am 21.09.21 um 17:28 schrieb Douglas Anderson:
> > It's hard for someone (like me) who's not following closely to know
> > what the suggested best practices are for error printing in DRM
> > drivers. Add some hints to the header file.
> > 
> > In general, my understanding is that:
> > * When possible we should be using a `struct drm_device` for logging
> >    and recent patches have tried to make it more possible to access a
> >    relevant `struct drm_device` in more places.
> > * For most cases when we don't have a `struct drm_device`, we no
> >    longer bother with DRM-specific wrappers on the dev_...() functions
> >    or pr_...() functions and just encourage drivers to use the normal
> >    functions.
> > * For debug-level functions where we might want filtering based on a
> >    category we'll still have DRM-specific wrappers, but we'll only
> >    support passing a `struct drm_device`, not a `struct
> >    device`. Presumably most of the cases where we want the filtering
> >    are messages that happen while the system is in a normal running
> >    state (AKA not during probe time) and we should have a `struct
> >    drm_device` then. If we absolutely can't get a `struct drm_device`
> >    then these functions begrudgingly accept NULL for the `struct
> >    drm_device` and hopefully the awkwardness of having to manually pass
> >    NULL will keep people from doing this unless absolutely necessary.
> > 
> > Signed-off-by: Douglas Anderson <dianders@chromium.org>
> 
> Acked-by: Thomas Zimmermann <tzimmermann@suse.de>
> 
> Thanks a lot.
> 
> > ---
> > 
> >   include/drm/drm_print.h | 30 ++++++++++++++++++++++++++++++
> >   1 file changed, 30 insertions(+)
> > 
> > diff --git a/include/drm/drm_print.h b/include/drm/drm_print.h
> > index 15a089a87c22..22fabdeed297 100644
> > --- a/include/drm/drm_print.h
> > +++ b/include/drm/drm_print.h
> > @@ -340,6 +340,8 @@ void drm_dev_dbg(const struct device *dev, enum
> > drm_debug_category category,
> >   /**
> >    * DRM_DEV_ERROR() - Error output.
> >    *
> > + * NOTE: this is deprecated in favor of drm_err() or dev_err().
> > + *
> >    * @dev: device pointer
> >    * @fmt: printf() like format string.
> >    */
> > @@ -349,6 +351,9 @@ void drm_dev_dbg(const struct device *dev, enum
> > drm_debug_category category,
> >   /**
> >    * DRM_DEV_ERROR_RATELIMITED() - Rate limited error output.
> >    *
> > + * NOTE: this is deprecated in favor of drm_err_ratelimited() or
> > + * dev_err_ratelimited().
> > + *
> >    * @dev: device pointer
> >    * @fmt: printf() like format string.
> >    *
> > @@ -364,9 +369,11 @@ void drm_dev_dbg(const struct device *dev, enum
> > drm_debug_category category,
> >                 DRM_DEV_ERROR(dev, fmt, ##__VA_ARGS__);                 \
> >   })
> >   
> > +/* NOTE: this is deprecated in favor of drm_info() or dev_info(). */
> >   #define DRM_DEV_INFO(dev, fmt, ...)                           \
> >         drm_dev_printk(dev, KERN_INFO, fmt, ##__VA_ARGS__)
> >   
> > +/* NOTE: this is deprecated in favor of drm_info_once() or
> > dev_info_once(). */
> >   #define DRM_DEV_INFO_ONCE(dev, fmt, ...)                              \
> >   ({                                                                    \
> >         static bool __print_once __read_mostly;                         \
> > @@ -379,6 +386,8 @@ void drm_dev_dbg(const struct device *dev, enum
> > drm_debug_category category,
> >   /**
> >    * DRM_DEV_DEBUG() - Debug output for generic drm code
> >    *
> > + * NOTE: this is deprecated in favor of drm_dbg_core().
> > + *
> >    * @dev: device pointer
> >    * @fmt: printf() like format string.
> >    */
> > @@ -387,6 +396,8 @@ void drm_dev_dbg(const struct device *dev, enum
> > drm_debug_category category,
> >   /**
> >    * DRM_DEV_DEBUG_DRIVER() - Debug output for vendor specific part of the
> > driver
> >    *
> > + * NOTE: this is deprecated in favor of drm_dbg() or dev_dbg().
> > + *
> >    * @dev: device pointer
> >    * @fmt: printf() like format string.
> >    */
> > @@ -395,6 +406,8 @@ void drm_dev_dbg(const struct device *dev, enum
> > drm_debug_category category,
> >   /**
> >    * DRM_DEV_DEBUG_KMS() - Debug output for modesetting code
> >    *
> > + * NOTE: this is deprecated in favor of drm_dbg_kms().
> > + *
> >    * @dev: device pointer
> >    * @fmt: printf() like format string.
> >    */
> > @@ -480,47 +493,63 @@ void __drm_err(const char *format, ...);
> >   #define _DRM_PRINTK(once, level, fmt, ...)                            \
> >         printk##once(KERN_##level "[" DRM_NAME "] " fmt, ##__VA_ARGS__)
> >   
> > +/* NOTE: this is deprecated in favor of pr_info(). */
> >   #define DRM_INFO(fmt, ...)                                            \
> >         _DRM_PRINTK(, INFO, fmt, ##__VA_ARGS__)
> > +/* NOTE: this is deprecated in favor of pr_notice(). */
> >   #define DRM_NOTE(fmt, ...)                                            \
> >         _DRM_PRINTK(, NOTICE, fmt, ##__VA_ARGS__)
> > +/* NOTE: this is deprecated in favor of pr_warn(). */
> >   #define DRM_WARN(fmt, ...)                                            \
> >         _DRM_PRINTK(, WARNING, fmt, ##__VA_ARGS__)
> >   
> > +/* NOTE: this is deprecated in favor of pr_info_once(). */
> >   #define DRM_INFO_ONCE(fmt,
> > ...)                                               \
> >         _DRM_PRINTK(_once, INFO, fmt, ##__VA_ARGS__)
> > +/* NOTE: this is deprecated in favor of pr_notice_once(). */
> >   #define DRM_NOTE_ONCE(fmt,
> > ...)                                               \
> >         _DRM_PRINTK(_once, NOTICE, fmt, ##__VA_ARGS__)
> > +/* NOTE: this is deprecated in favor of pr_warn_once(). */
> >   #define DRM_WARN_ONCE(fmt,
> > ...)                                               \
> >         _DRM_PRINTK(_once, WARNING, fmt, ##__VA_ARGS__)
> >   
> > +/* NOTE: this is deprecated in favor of pr_err(). */
> >   #define DRM_ERROR(fmt, ...)                                           \
> >         __drm_err(fmt, ##__VA_ARGS__)
> >   
> > +/* NOTE: this is deprecated in favor of pr_err_ratelimited(). */
> >   #define DRM_ERROR_RATELIMITED(fmt,
> > ...)                                       \
> >         DRM_DEV_ERROR_RATELIMITED(NULL, fmt, ##__VA_ARGS__)
> >   
> > +/* NOTE: this is deprecated in favor of drm_dbg_core(NULL, ...). */
> >   #define DRM_DEBUG(fmt, ...)                                           \
> >         __drm_dbg(DRM_UT_CORE, fmt, ##__VA_ARGS__)
> >   
> > +/* NOTE: this is deprecated in favor of drm_dbg(NULL, ...). */
> >   #define DRM_DEBUG_DRIVER(fmt, ...)                                    \
> >         __drm_dbg(DRM_UT_DRIVER, fmt, ##__VA_ARGS__)
> >   
> > +/* NOTE: this is deprecated in favor of drm_dbg_kms(NULL, ...). */
> >   #define DRM_DEBUG_KMS(fmt,
> > ...)                                               \
> >         __drm_dbg(DRM_UT_KMS, fmt, ##__VA_ARGS__)
> >   
> > +/* NOTE: this is deprecated in favor of drm_dbg_prime(NULL, ...). */
> >   #define DRM_DEBUG_PRIME(fmt, ...)                                     \
> >         __drm_dbg(DRM_UT_PRIME, fmt, ##__VA_ARGS__)
> >   
> > +/* NOTE: this is deprecated in favor of drm_dbg_atomic(NULL, ...). */
> >   #define DRM_DEBUG_ATOMIC(fmt, ...)                                    \
> >         __drm_dbg(DRM_UT_ATOMIC, fmt, ##__VA_ARGS__)
> >   
> > +/* NOTE: this is deprecated in favor of drm_dbg_vbl(NULL, ...). */
> >   #define DRM_DEBUG_VBL(fmt,
> > ...)                                               \
> >         __drm_dbg(DRM_UT_VBL, fmt, ##__VA_ARGS__)
> >   
> > +/* NOTE: this is deprecated in favor of drm_dbg_lease(NULL, ...). */
> >   #define DRM_DEBUG_LEASE(fmt, ...)                                     \
> >         __drm_dbg(DRM_UT_LEASE, fmt, ##__VA_ARGS__)
> >   
> > +/* NOTE: this is deprecated in favor of drm_dbg_dp(NULL, ...). */
> >   #define DRM_DEBUG_DP(fmt,
> > ...)                                                \
> >         __drm_dbg(DRM_UT_DP, fmt, ## __VA_ARGS__)
> >   
> > @@ -536,6 +565,7 @@ void __drm_err(const char *format, ...);
> >   #define drm_dbg_kms_ratelimited(drm, fmt, ...) \
> >         __DRM_DEFINE_DBG_RATELIMITED(KMS, drm, fmt, ## __VA_ARGS__)
> >   
> > +/* NOTE: this is deprecated in favor of drm_dbg_kms_ratelimited(NULL,
> > ...). */
> >   #define DRM_DEBUG_KMS_RATELIMITED(fmt, ...)
> > drm_dbg_kms_ratelimited(NULL, fmt, ## __VA_ARGS__)
> >   
> >   /*
> > 
> 
> -- 
> Thomas Zimmermann
> Graphics Driver Developer
> SUSE Software Solutions Germany GmbH
> Maxfeldstr. 5, 90409 Nürnberg, Germany
> (HRB 36809, AG Nürnberg)
> Geschäftsführer: Felix Imendörffer

-- 
Cheers,
 Lyude Paul (she/her)
 Software Engineer at Red Hat

