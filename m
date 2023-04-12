Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 392B16DF7B3
	for <lists+dri-devel@lfdr.de>; Wed, 12 Apr 2023 15:51:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3826D10E803;
	Wed, 12 Apr 2023 13:51:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com
 [IPv6:2a00:1450:4864:20::334])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C99E610E800
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Apr 2023 13:51:19 +0000 (UTC)
Received: by mail-wm1-x334.google.com with SMTP id
 5b1f17b1804b1-3f080f53fc6so4542785e9.0
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Apr 2023 06:51:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google; t=1681307478; x=1683899478;
 h=in-reply-to:content-disposition:mime-version:references
 :mail-followup-to:message-id:subject:cc:to:from:date:from:to:cc
 :subject:date:message-id:reply-to;
 bh=LQ4NiZvznI6IBHIw53zN4PYbVETcRXS/mWjDM4fzXi4=;
 b=V6NvYG80P0AwbTYTb710JCsHBXPO8z1p+yX1qAkADij2GAGwKttISHoJ6IE2kXEWxZ
 18u2Qx/O1+aRenmH82kbc4PzY1kzeALFyCp5v6Q3B925Tj8Nhi1+nvPSbcisaWFwqa84
 jfxo4XldKXk0zeAJzEFwQC+jLzUQGi85QiZW8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1681307478; x=1683899478;
 h=in-reply-to:content-disposition:mime-version:references
 :mail-followup-to:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=LQ4NiZvznI6IBHIw53zN4PYbVETcRXS/mWjDM4fzXi4=;
 b=ay59bfBLmU6yrXgyjyakGfm4pJSRrqDHRE4/B7dVj0d0eRdySiF2Cx4CvCDdcvIpt7
 urYn0+8ERyDudPrHE3uD/cnI9c7JPWv+pZ86d+cYq/TSRENm8aQgbVhHfdb3/AT6bJQ6
 JqZXG4/Y6wT5C3L53dnz6ouhoI7KR1oWcUFRmmp6r6U+41wmQKqM4KxcBsptqxGjo1rD
 ikyDJmkuZHegibeoDsMLbX8mQ5CA+EJ28tDkdBxrwtoz/ND9YCq4+JlZeVaFnj+v+4GB
 6W2yLyDjbhp4cjhHDh2CqhN4JCzdoQHn35hQYbBtpxLPWWsb3kc+bygqU7/Cs/5ITzZS
 kZEw==
X-Gm-Message-State: AAQBX9dkyd3XFNEEqt83u62c8fiNSxXzohUkf5lmO2Sb4IoDikoaSZvC
 bsi0FHtlIsR3hy6JSOoSylrY8g==
X-Google-Smtp-Source: AKy350Yev9AoQttQJuI2EFo+iz78JVTq8wQnWUp147g1uDZB5AoV2Ib1Ak5O6swXsXNWA1+Evrw4WA==
X-Received: by 2002:a05:600c:1f0e:b0:3f0:80fe:212d with SMTP id
 bd14-20020a05600c1f0e00b003f080fe212dmr2293208wmb.3.1681307477662; 
 Wed, 12 Apr 2023 06:51:17 -0700 (PDT)
Received: from phenom.ffwll.local (212-51-149-33.fiber7.init7.net.
 [212.51.149.33]) by smtp.gmail.com with ESMTPSA id
 g15-20020a05600c4ecf00b003edc4788fa0sm2627683wmq.2.2023.04.12.06.51.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 12 Apr 2023 06:51:17 -0700 (PDT)
Date: Wed, 12 Apr 2023 15:51:15 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Subject: Re: [PATCH v3 4/7] drm/i915: Switch to fdinfo helper
Message-ID: <ZDa3U/k9orudzwL2@phenom.ffwll.local>
Mail-Followup-To: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 Rob Clark <robdclark@gmail.com>, dri-devel@lists.freedesktop.org,
 linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
 Boris Brezillon <boris.brezillon@collabora.com>,
 Christopher Healy <healych@amazon.com>,
 Emil Velikov <emil.l.velikov@gmail.com>,
 Rob Clark <robdclark@chromium.org>,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 David Airlie <airlied@gmail.com>, intel-gfx@lists.freedesktop.org,
 open list <linux-kernel@vger.kernel.org>
References: <20230411225725.2032862-1-robdclark@gmail.com>
 <20230411225725.2032862-5-robdclark@gmail.com>
 <292d10fe-3163-d282-6497-18c1d8621d72@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <292d10fe-3163-d282-6497-18c1d8621d72@linux.intel.com>
X-Operating-System: Linux phenom 6.1.0-7-amd64 
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
Cc: Rob Clark <robdclark@chromium.org>, linux-arm-msm@vger.kernel.org,
 intel-gfx@lists.freedesktop.org, Emil Velikov <emil.l.velikov@gmail.com>,
 Christopher Healy <healych@amazon.com>, dri-devel@lists.freedesktop.org,
 open list <linux-kernel@vger.kernel.org>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Apr 12, 2023 at 01:32:43PM +0100, Tvrtko Ursulin wrote:
> 
> On 11/04/2023 23:56, Rob Clark wrote:
> > From: Rob Clark <robdclark@chromium.org>
> > 
> > Signed-off-by: Rob Clark <robdclark@chromium.org>
> > ---
> >   drivers/gpu/drm/i915/i915_driver.c     |  3 ++-
> >   drivers/gpu/drm/i915/i915_drm_client.c | 18 +++++-------------
> >   drivers/gpu/drm/i915/i915_drm_client.h |  2 +-
> >   3 files changed, 8 insertions(+), 15 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/i915/i915_driver.c b/drivers/gpu/drm/i915/i915_driver.c
> > index db7a86def7e2..37eacaa3064b 100644
> > --- a/drivers/gpu/drm/i915/i915_driver.c
> > +++ b/drivers/gpu/drm/i915/i915_driver.c
> > @@ -1696,7 +1696,7 @@ static const struct file_operations i915_driver_fops = {
> >   	.compat_ioctl = i915_ioc32_compat_ioctl,
> >   	.llseek = noop_llseek,
> >   #ifdef CONFIG_PROC_FS
> > -	.show_fdinfo = i915_drm_client_fdinfo,
> > +	.show_fdinfo = drm_fop_show_fdinfo,
> >   #endif
> >   };
> > @@ -1796,6 +1796,7 @@ static const struct drm_driver i915_drm_driver = {
> >   	.open = i915_driver_open,
> >   	.lastclose = i915_driver_lastclose,
> >   	.postclose = i915_driver_postclose,
> > +	.show_fdinfo = i915_drm_client_fdinfo,
> >   	.prime_handle_to_fd = drm_gem_prime_handle_to_fd,
> >   	.prime_fd_to_handle = drm_gem_prime_fd_to_handle,
> > diff --git a/drivers/gpu/drm/i915/i915_drm_client.c b/drivers/gpu/drm/i915/i915_drm_client.c
> > index b09d1d386574..4a77e5e47f79 100644
> > --- a/drivers/gpu/drm/i915/i915_drm_client.c
> > +++ b/drivers/gpu/drm/i915/i915_drm_client.c
> > @@ -101,7 +101,7 @@ static u64 busy_add(struct i915_gem_context *ctx, unsigned int class)
> >   }
> >   static void
> > -show_client_class(struct seq_file *m,
> > +show_client_class(struct drm_printer *p,
> >   		  struct i915_drm_client *client,
> >   		  unsigned int class)
> >   {
> > @@ -117,22 +117,20 @@ show_client_class(struct seq_file *m,
> >   	rcu_read_unlock();
> >   	if (capacity)
> > -		seq_printf(m, "drm-engine-%s:\t%llu ns\n",
> > +		drm_printf(p, "drm-engine-%s:\t%llu ns\n",
> >   			   uabi_class_names[class], total);
> >   	if (capacity > 1)
> > -		seq_printf(m, "drm-engine-capacity-%s:\t%u\n",
> > +		drm_printf(p, "drm-engine-capacity-%s:\t%u\n",
> >   			   uabi_class_names[class],
> >   			   capacity);
> >   }
> > -void i915_drm_client_fdinfo(struct seq_file *m, struct file *f)
> > +void i915_drm_client_fdinfo(struct drm_printer *p, struct drm_file *file)
> >   {
> > -	struct drm_file *file = f->private_data;
> >   	struct drm_i915_file_private *file_priv = file->driver_priv;
> >   	struct drm_i915_private *i915 = file_priv->dev_priv;
> >   	struct i915_drm_client *client = file_priv->client;
> > -	struct pci_dev *pdev = to_pci_dev(i915->drm.dev);
> >   	unsigned int i;
> >   	/*
> > @@ -141,12 +139,6 @@ void i915_drm_client_fdinfo(struct seq_file *m, struct file *f)
> >   	 * ******************************************************************
> >   	 */
> > -	seq_printf(m, "drm-driver:\t%s\n", i915->drm.driver->name);
> > -	seq_printf(m, "drm-pdev:\t%04x:%02x:%02x.%d\n",
> > -		   pci_domain_nr(pdev->bus), pdev->bus->number,
> > -		   PCI_SLOT(pdev->devfn), PCI_FUNC(pdev->devfn));
> > -	seq_printf(m, "drm-client-id:\t%u\n", client->id);
> 
> As mentioned in my reply to the cover letter, I think the i915
> implementation is the right one. At least the semantics of it.
> 
> Granted it is a super set of the minimum required as documented by
> drm-usage-stats.rst - not only 1:1 to current instances of struct file, but
> also avoids immediate id recycling.
> 
> Former could perhaps be achieved with a simple pointer hash, but latter
> helps userspace detect when a client has exited and id re-allocated to a new
> client within a single scanning period.
> 
> Without this I don't think userspace can implement a fail safe method of
> detecting which clients are new ones and so wouldn't be able to track
> history correctly.
> 
> I think we should rather extend the documented contract to include the
> cyclical property than settle for a weaker common implementation.

atomic64_t never wraps, so you don't have any recycling issues?

The other piece and imo much more important is that I really don't want
the i915_drm_client design to spread, it conceptually makes no sense.
drm_file is the uapi object, once that's gone userspace will never be able
to look at anything, having a separate free-standing object that's
essentially always dead is backwards.

I went a bit more in-depth in a different thread on scheduler fd_info
stats, but essentially fd_info needs to pull stats, you should never push
stats towards the drm_file (or i915_drm_client). That avoids all the
refcounting issues and rcu needs and everything else like that.

Maybe you want to jump into that thread:
https://lore.kernel.org/dri-devel/CAKMK7uE=m3sSTQrLCeDg0vG8viODOecUsYDK1oC++f5pQi0e8Q@mail.gmail.com/

So retiring i915_drm_client infrastructure is the right direction I think.
-Daniel

> Regards,
> 
> Tvrtko
> 
> > -
> >   	/*
> >   	 * Temporarily skip showing client engine information with GuC submission till
> >   	 * fetching engine busyness is implemented in the GuC submission backend
> > @@ -155,6 +147,6 @@ void i915_drm_client_fdinfo(struct seq_file *m, struct file *f)
> >   		return;
> >   	for (i = 0; i < ARRAY_SIZE(uabi_class_names); i++)
> > -		show_client_class(m, client, i);
> > +		show_client_class(p, client, i);
> >   }
> >   #endif
> > diff --git a/drivers/gpu/drm/i915/i915_drm_client.h b/drivers/gpu/drm/i915/i915_drm_client.h
> > index 69496af996d9..ef85fef45de5 100644
> > --- a/drivers/gpu/drm/i915/i915_drm_client.h
> > +++ b/drivers/gpu/drm/i915/i915_drm_client.h
> > @@ -60,7 +60,7 @@ static inline void i915_drm_client_put(struct i915_drm_client *client)
> >   struct i915_drm_client *i915_drm_client_add(struct i915_drm_clients *clients);
> >   #ifdef CONFIG_PROC_FS
> > -void i915_drm_client_fdinfo(struct seq_file *m, struct file *f);
> > +void i915_drm_client_fdinfo(struct drm_printer *p, struct drm_file *file);
> >   #endif
> >   void i915_drm_clients_fini(struct i915_drm_clients *clients);

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
