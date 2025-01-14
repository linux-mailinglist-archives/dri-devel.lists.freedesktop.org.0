Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D3F68A10BB9
	for <lists+dri-devel@lfdr.de>; Tue, 14 Jan 2025 17:04:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7D90A10E3CC;
	Tue, 14 Jan 2025 16:04:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="Phj5zwDY";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [217.70.183.199])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CD6ED10E3CC
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Jan 2025 16:04:53 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 92185FF805;
 Tue, 14 Jan 2025 16:04:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1736870672;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=IVZ8R+dm2xry0V0ZXA6iIU+BsIOOLytrdyYusIJV5HI=;
 b=Phj5zwDY9AhJCEmr00ydP6xoQqVYnsxhTQ+XQ0TxmPoiVuFOEn8h0wshcTC/T/v9HXLb+J
 g4T8V0qwI4HBVPIeN12d6SLtglflYXiEwYdivChKiETa0SVXykKX3yFfohWw/U/0LEiUjT
 ij4vzLRQenygem08Lea63IdEeVt+L6ExfVqv2yrs12aM5n8wMTE9ecwhQ6JQgusGVkMAHN
 bDb29PEXNhF/GQ1HKrvKg9g7TNvLG08DIZ7ijM5Ao8g/DI7X2/VbZEG+M/PpNCtJ4w1Bdv
 RJ7RY9xHpZW2AURSX39s6eo46jUxfDJCL2k7s4e82asNXCAPTX1EEFedWX5RoQ==
Date: Tue, 14 Jan 2025 17:04:29 +0100
From: Louis Chauvet <louis.chauvet@bootlin.com>
To: Maxime Ripard <mripard@kernel.org>
Cc: Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>,
 Melissa Wen <melissa.srw@gmail.com>,
 =?iso-8859-1?Q?Ma=EDra?= Canal <mairacanal@riseup.net>,
 Haneen Mohammed <hamohammed.sa@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Simona Vetter <simona.vetter@ffwll.ch>,
 dri-devel@lists.freedesktop.org, arthurgrillo@riseup.net,
 linux-kernel@vger.kernel.org, jeremie.dautheribes@bootlin.com,
 miquel.raynal@bootlin.com, thomas.petazzoni@bootlin.com,
 seanpaul@google.com, nicolejadeyee@google.com
Subject: Re: [PATCH v8 3/8] drm/managed: Add DRM-managed
 alloc_ordered_workqueue
Message-ID: <Z4aLDbReWY7dso7R@louis-chauvet-laptop>
Mail-Followup-To: Maxime Ripard <mripard@kernel.org>,
 Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>,
 Melissa Wen <melissa.srw@gmail.com>,
 =?iso-8859-1?Q?Ma=EDra?= Canal <mairacanal@riseup.net>,
 Haneen Mohammed <hamohammed.sa@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Simona Vetter <simona.vetter@ffwll.ch>,
 dri-devel@lists.freedesktop.org, arthurgrillo@riseup.net,
 linux-kernel@vger.kernel.org, jeremie.dautheribes@bootlin.com,
 miquel.raynal@bootlin.com, thomas.petazzoni@bootlin.com,
 seanpaul@google.com, nicolejadeyee@google.com
References: <20250114-google-vkms-managed-v8-0-da4254aa3dd5@bootlin.com>
 <20250114-google-vkms-managed-v8-3-da4254aa3dd5@bootlin.com>
 <20250114-spectral-beetle-of-dignity-986943@houat>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250114-spectral-beetle-of-dignity-986943@houat>
X-GND-Sasl: louis.chauvet@bootlin.com
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

On 14/01/25 - 16:29, Maxime Ripard wrote:
> On Tue, Jan 14, 2025 at 03:05:45PM +0100, Louis Chauvet wrote:
> > Add drmm_alloc_ordered_workqueue(), a helper that provides managed ordered
> > workqueue cleanup. The workqueue will be destroyed with the final
> > reference of the DRM device.
> > 
> > Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>
> > 
> > ---
> > 
> > Hi Thomas,
> > 
> > I noted that you wanted to mark this as Reviewed, but as this was not
> > the complete patch, I prefered to have a confirmation before merging the
> > patch.
> > 
> > Thanks for your time,
> > Louis Chauvet
> > ---
> >  drivers/gpu/drm/drm_managed.c |  8 ++++++++
> >  include/drm/drm_managed.h     | 12 ++++++++++++
> >  2 files changed, 20 insertions(+)
> > 
> > diff --git a/drivers/gpu/drm/drm_managed.c b/drivers/gpu/drm/drm_managed.c
> > index 79ce86a5bd67a7201f5d60550a12364f2628e0ec..1589c28410f23b5a1e93dd1638420b3ae5c4b854 100644
> > --- a/drivers/gpu/drm/drm_managed.c
> > +++ b/drivers/gpu/drm/drm_managed.c
> > @@ -310,3 +310,11 @@ void __drmm_mutex_release(struct drm_device *dev, void *res)
> >  	mutex_destroy(lock);
> >  }
> >  EXPORT_SYMBOL(__drmm_mutex_release);
> > +
> > +void __drmm_destroy_workqueue(struct drm_device *device, void *res)
> > +{
> > +	struct workqueue_struct *wq = res;
> > +
> > +	destroy_workqueue(wq);
> > +}
> > +EXPORT_SYMBOL(__drmm_destroy_workqueue);
> > diff --git a/include/drm/drm_managed.h b/include/drm/drm_managed.h
> > index f547b09ca0239dd7c4fb734038bae4438321395c..96d9b0e811675fe66d5d48f02b17bc7de2ac437e 100644
> > --- a/include/drm/drm_managed.h
> > +++ b/include/drm/drm_managed.h
> > @@ -127,4 +127,16 @@ void __drmm_mutex_release(struct drm_device *dev, void *res);
> >  	drmm_add_action_or_reset(dev, __drmm_mutex_release, lock);	     \
> >  })									     \
> >  
> > +void __drmm_destroy_workqueue(struct drm_device *device, void *wq);
> > +
> > +#define drmm_alloc_ordered_workqueue(dev, fmt, flags, args...)					\
> > +	({											\
> > +		struct workqueue_struct *wq = alloc_ordered_workqueue(fmt, flags, ##args);	\
> > +		wq ? ({										\
> > +			int ret = drmm_add_action_or_reset(dev, __drmm_destroy_workqueue, wq);	\
> > +			ret ? ERR_PTR(ret) : wq;						\
> > +		}) :										\
> > +			wq;									\
> > +	})
> > +
> >  #endif
> 
> Is there a reason to do a macro and not a proper function?

I wrote a macro because creating a proper function is more complex. The 
function would require a va_list variant for alloc_ordered_workqueue, 
which does not currently exist.

Louis Chauvet

---

Sorry if you received this message twice. The first attempt was rejected 
by most of the recipients, including mailing lists.

> Maxime


