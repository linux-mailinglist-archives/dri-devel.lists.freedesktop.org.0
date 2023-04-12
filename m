Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E18A16DFD44
	for <lists+dri-devel@lfdr.de>; Wed, 12 Apr 2023 20:13:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 08A3410E902;
	Wed, 12 Apr 2023 18:13:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com
 [IPv6:2a00:1450:4864:20::42f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 59F8D10E8FC
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Apr 2023 18:13:38 +0000 (UTC)
Received: by mail-wr1-x42f.google.com with SMTP id
 ffacd0b85a97d-2f4b604e234so53746f8f.1
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Apr 2023 11:13:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google; t=1681323216; x=1683915216;
 h=in-reply-to:content-disposition:mime-version:references
 :mail-followup-to:message-id:subject:cc:to:from:date:from:to:cc
 :subject:date:message-id:reply-to;
 bh=lGJeVrG1N/1V3zTKivsInYjQUiueSRiWAcGL0n6eppw=;
 b=Er7LBqXAApNF6/x1dREFNL1RJxnwnrkTqAnBCxi/8JoCqI8kvWr1YmzrYT3o6J/ZSy
 /ZKXBjj3yK39wER3OZRj30BfKO9mcM0xb+3NRi8ZpM0RlQYwtzX1WWPN/MTiECRBDXsl
 Vl2w86a3zkIkV4+VA/GCQr6+7DI2UpZmLV+8s=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1681323216; x=1683915216;
 h=in-reply-to:content-disposition:mime-version:references
 :mail-followup-to:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=lGJeVrG1N/1V3zTKivsInYjQUiueSRiWAcGL0n6eppw=;
 b=F+RGURr0Dm3zvWQWSt9P7gVYyWqOs6fXbY7gBSJUe/sWMHVZCT6LtbqscaqkAEXTE0
 W0BL4SYYFxRiKZWgWuL4Rg1MhmWBpt0T8Ak5KFzdB19Qb+lAPxzhUE9Aj4ckZkLs62QL
 FVcxc+Uueb+kzhgS/vTzzEzEEHf3lIHDbhWTN1fc68akVEzpsPDuQ/5bkO1q8L+IYL0C
 ebKlW/lBtZZI7eMPCTwEy9RczkonsepHF3IFEsI3zqRBryZ/dL7nFsfTdRhL2B56pOe6
 UN06GJABo0+W5qvNm7Dk+voSme6GxHaVhxqoaBdukEM5V/5nqKHzqxf85p+FxagmPkfs
 EI0w==
X-Gm-Message-State: AAQBX9cNVR79Hq3++9hGKz4q+uuj3S9JuvtJllqT22WX4l2LXNstx+a1
 63iPPXVyUX6pH2Ior4O5cVM6/A==
X-Google-Smtp-Source: AKy350bfyUdmt1T/AkLZPoXuAqLPpZYKrlAk23acN2cT/mUWkIn/v/NLi8eVPs4Uv1IK6qWUQKVnGg==
X-Received: by 2002:a05:600c:35c2:b0:3ee:da0:cb85 with SMTP id
 r2-20020a05600c35c200b003ee0da0cb85mr13033379wmq.1.1681323216218; 
 Wed, 12 Apr 2023 11:13:36 -0700 (PDT)
Received: from phenom.ffwll.local (212-51-149-33.fiber7.init7.net.
 [212.51.149.33]) by smtp.gmail.com with ESMTPSA id
 20-20020a05600c025400b003ede3e54ed7sm3147905wmj.6.2023.04.12.11.13.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 12 Apr 2023 11:13:35 -0700 (PDT)
Date: Wed, 12 Apr 2023 20:13:33 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Subject: Re: [PATCH v3 4/7] drm/i915: Switch to fdinfo helper
Message-ID: <ZDb0zUrYqaikJjhg@phenom.ffwll.local>
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
 <ZDa3U/k9orudzwL2@phenom.ffwll.local>
 <625477ba-2f98-4137-7c96-dc54990c6963@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <625477ba-2f98-4137-7c96-dc54990c6963@linux.intel.com>
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

On Wed, Apr 12, 2023 at 04:12:41PM +0100, Tvrtko Ursulin wrote:
> 
> On 12/04/2023 14:51, Daniel Vetter wrote:
> > On Wed, Apr 12, 2023 at 01:32:43PM +0100, Tvrtko Ursulin wrote:
> > > 
> > > On 11/04/2023 23:56, Rob Clark wrote:
> > > > From: Rob Clark <robdclark@chromium.org>
> > > > 
> > > > Signed-off-by: Rob Clark <robdclark@chromium.org>
> > > > ---
> > > >    drivers/gpu/drm/i915/i915_driver.c     |  3 ++-
> > > >    drivers/gpu/drm/i915/i915_drm_client.c | 18 +++++-------------
> > > >    drivers/gpu/drm/i915/i915_drm_client.h |  2 +-
> > > >    3 files changed, 8 insertions(+), 15 deletions(-)
> > > > 
> > > > diff --git a/drivers/gpu/drm/i915/i915_driver.c b/drivers/gpu/drm/i915/i915_driver.c
> > > > index db7a86def7e2..37eacaa3064b 100644
> > > > --- a/drivers/gpu/drm/i915/i915_driver.c
> > > > +++ b/drivers/gpu/drm/i915/i915_driver.c
> > > > @@ -1696,7 +1696,7 @@ static const struct file_operations i915_driver_fops = {
> > > >    	.compat_ioctl = i915_ioc32_compat_ioctl,
> > > >    	.llseek = noop_llseek,
> > > >    #ifdef CONFIG_PROC_FS
> > > > -	.show_fdinfo = i915_drm_client_fdinfo,
> > > > +	.show_fdinfo = drm_fop_show_fdinfo,
> > > >    #endif
> > > >    };
> > > > @@ -1796,6 +1796,7 @@ static const struct drm_driver i915_drm_driver = {
> > > >    	.open = i915_driver_open,
> > > >    	.lastclose = i915_driver_lastclose,
> > > >    	.postclose = i915_driver_postclose,
> > > > +	.show_fdinfo = i915_drm_client_fdinfo,
> > > >    	.prime_handle_to_fd = drm_gem_prime_handle_to_fd,
> > > >    	.prime_fd_to_handle = drm_gem_prime_fd_to_handle,
> > > > diff --git a/drivers/gpu/drm/i915/i915_drm_client.c b/drivers/gpu/drm/i915/i915_drm_client.c
> > > > index b09d1d386574..4a77e5e47f79 100644
> > > > --- a/drivers/gpu/drm/i915/i915_drm_client.c
> > > > +++ b/drivers/gpu/drm/i915/i915_drm_client.c
> > > > @@ -101,7 +101,7 @@ static u64 busy_add(struct i915_gem_context *ctx, unsigned int class)
> > > >    }
> > > >    static void
> > > > -show_client_class(struct seq_file *m,
> > > > +show_client_class(struct drm_printer *p,
> > > >    		  struct i915_drm_client *client,
> > > >    		  unsigned int class)
> > > >    {
> > > > @@ -117,22 +117,20 @@ show_client_class(struct seq_file *m,
> > > >    	rcu_read_unlock();
> > > >    	if (capacity)
> > > > -		seq_printf(m, "drm-engine-%s:\t%llu ns\n",
> > > > +		drm_printf(p, "drm-engine-%s:\t%llu ns\n",
> > > >    			   uabi_class_names[class], total);
> > > >    	if (capacity > 1)
> > > > -		seq_printf(m, "drm-engine-capacity-%s:\t%u\n",
> > > > +		drm_printf(p, "drm-engine-capacity-%s:\t%u\n",
> > > >    			   uabi_class_names[class],
> > > >    			   capacity);
> > > >    }
> > > > -void i915_drm_client_fdinfo(struct seq_file *m, struct file *f)
> > > > +void i915_drm_client_fdinfo(struct drm_printer *p, struct drm_file *file)
> > > >    {
> > > > -	struct drm_file *file = f->private_data;
> > > >    	struct drm_i915_file_private *file_priv = file->driver_priv;
> > > >    	struct drm_i915_private *i915 = file_priv->dev_priv;
> > > >    	struct i915_drm_client *client = file_priv->client;
> > > > -	struct pci_dev *pdev = to_pci_dev(i915->drm.dev);
> > > >    	unsigned int i;
> > > >    	/*
> > > > @@ -141,12 +139,6 @@ void i915_drm_client_fdinfo(struct seq_file *m, struct file *f)
> > > >    	 * ******************************************************************
> > > >    	 */
> > > > -	seq_printf(m, "drm-driver:\t%s\n", i915->drm.driver->name);
> > > > -	seq_printf(m, "drm-pdev:\t%04x:%02x:%02x.%d\n",
> > > > -		   pci_domain_nr(pdev->bus), pdev->bus->number,
> > > > -		   PCI_SLOT(pdev->devfn), PCI_FUNC(pdev->devfn));
> > > > -	seq_printf(m, "drm-client-id:\t%u\n", client->id);
> > > 
> > > As mentioned in my reply to the cover letter, I think the i915
> > > implementation is the right one. At least the semantics of it.
> > > 
> > > Granted it is a super set of the minimum required as documented by
> > > drm-usage-stats.rst - not only 1:1 to current instances of struct file, but
> > > also avoids immediate id recycling.
> > > 
> > > Former could perhaps be achieved with a simple pointer hash, but latter
> > > helps userspace detect when a client has exited and id re-allocated to a new
> > > client within a single scanning period.
> > > 
> > > Without this I don't think userspace can implement a fail safe method of
> > > detecting which clients are new ones and so wouldn't be able to track
> > > history correctly.
> > > 
> > > I think we should rather extend the documented contract to include the
> > > cyclical property than settle for a weaker common implementation.
> > 
> > atomic64_t never wraps, so you don't have any recycling issues?
> 
> Okay yes, with 64 bits there aren't any practical recycling issues.
> 
> > The other piece and imo much more important is that I really don't want
> > the i915_drm_client design to spread, it conceptually makes no sense.
> > drm_file is the uapi object, once that's gone userspace will never be able
> > to look at anything, having a separate free-standing object that's
> > essentially always dead is backwards.
> > 
> > I went a bit more in-depth in a different thread on scheduler fd_info
> > stats, but essentially fd_info needs to pull stats, you should never push
> > stats towards the drm_file (or i915_drm_client). That avoids all the
> > refcounting issues and rcu needs and everything else like that.
> > 
> > Maybe you want to jump into that thread:
> > https://lore.kernel.org/dri-devel/CAKMK7uE=m3sSTQrLCeDg0vG8viODOecUsYDK1oC++f5pQi0e8Q@mail.gmail.com/
> > 
> > So retiring i915_drm_client infrastructure is the right direction I think.
> 
> Hmmm.. it is a _mostly_ pull model that we have in i915 ie. data is pulled
> on fdinfo queries.
> 
> _Mostly_ because it cannot be fully pull based when you look at some
> internal flows. We have to save some data at runtime at times not driven by
> the fdinfo queries.
> 
> For instance context close needs to record the GPU utilisation against the
> client so that it is not lost. Also in the execlists backend we must
> transfer the hardware tracked runtime into the software state when hw
> contexts are switched out.
> 
> The fact i915_drm_client is detached from file_priv is a consequence of the
> fact i915 GEM contexts can outlive drm_file, and that when such contexts are
> closed, we need a to record their runtimes.
> 
> So I think there are three options: how it is now, fully krefed drm_file, or
> prohibit persistent contexts. Last one don't think we can do due ABI and 2nd
> felt heavy handed so I choose a lightweight i915_drm_client option.
> 
> Maybe there is a fourth option of somehow detecting during context
> destruction that drm_file is gone and skip the runtime recording, but
> avoiding races and all did not make me want to entertain it much. Is this
> actually what you are proposing?

Hm right, persistent context, the annoying thing I missed again. From a
quick look amdgpu gets away with that by shooting all contexts
synchronously on drmfd close, which is the thing i915 can't because uapi.

The other part of the trick is to ... not care :-) See
amdgpu_ctx_fence_time(). I guess what would work a bit better is a
drm_file context list under a spinlock (which would need to be per
drm_device probably), which is cleaned up both when the final context ref
drops and when the drmfd closes, and you push back the final tally just
under that spinlock. But that's not how drm_sched_entity works right now,
that disappears before the final in-flight jobs have finished.

But yeah unless we just shrug and accept an accounting hole some minimal
push-back (at least while the drm_file is still alive) is needed to add
back the final tally when a context is destroyed.

Anyway I think it'd be good if you can follow that sched fd_info thread a
bit, to make sure it's not too silly :-) i915 won't use it, but xe will
eventually.
-Daniel
-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
