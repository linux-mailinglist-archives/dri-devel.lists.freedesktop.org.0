Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BB3E64F188A
	for <lists+dri-devel@lfdr.de>; Mon,  4 Apr 2022 17:36:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B709E10E4E3;
	Mon,  4 Apr 2022 15:36:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x344.google.com (mail-wm1-x344.google.com
 [IPv6:2a00:1450:4864:20::344])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2BB9C10E4E3
 for <dri-devel@lists.freedesktop.org>; Mon,  4 Apr 2022 15:36:42 +0000 (UTC)
Received: by mail-wm1-x344.google.com with SMTP id
 l7-20020a05600c1d0700b0038c99618859so7978803wms.2
 for <dri-devel@lists.freedesktop.org>; Mon, 04 Apr 2022 08:36:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=WqQFj1JtsCrLC9+wcvEz2jqj8nhRvOivJ56ZyXmaRu0=;
 b=iquxK/OlWPv6oWuQ/xZ/UvUTvEJHZ96YRAziiqMj7uK0OlHRY/W0ULHUitIhmKKdUt
 zU+MeRyiTVhZbV+5o7ToD55eMJYwaP6G7K2oKmYkYVUiglWxQwvrkGkjHVYMvTcgifnw
 bRZ4cPT472C7kCoD0omVY9VNSzDYsgP/WKB60=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=WqQFj1JtsCrLC9+wcvEz2jqj8nhRvOivJ56ZyXmaRu0=;
 b=EESPKp9DrM3mfvvg6NcnplwVwtehPJ9Ax2yhz0WmcwCPzH8UWHbTClnIFzyE/b+WSN
 5LeOB/yNMcBaMGvCepqw8EueB9RnFk03ngQWheK26Dt+TAhcsjcakIISxFma83Ih1TQm
 e2OPM3LzGHC1Is2L60aP5z/VvQhBnoI/s+QYsM9+I43KxLNSZPtnq5I8+IvkM/9+yBcx
 gZisCKaCcUfyzviP6FdyIpghjASNnWT9e5CnQenu6+3Y4opjd1MyvCIYh2+sq6/P/Z1z
 oVts/VqGjA9CDlzXu7tlijLCwB59UNzTzZp82CzBDRd9/huSLRysYR18I9IHUYA79/1f
 KA4A==
X-Gm-Message-State: AOAM532j0AyhPdr40F541Z+kZI4XTyQxpQ9zMwwg70X1quZA5FY3F6pS
 VhaKxAHw0x93xKC8HYP0GkDjlw==
X-Google-Smtp-Source: ABdhPJzKwJoYanUD7oXJs569f3hTI7Bi9L7S4C+u5+FGDOTQH7MqUBZ3jwV3iaWtGGERGCi1xZH1Kg==
X-Received: by 2002:a1c:f70a:0:b0:37c:533d:d296 with SMTP id
 v10-20020a1cf70a000000b0037c533dd296mr48636wmh.147.1649086600592; 
 Mon, 04 Apr 2022 08:36:40 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id
 i14-20020a0560001ace00b00203da1fa749sm13853152wry.72.2022.04.04.08.36.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 04 Apr 2022 08:36:40 -0700 (PDT)
Date: Mon, 4 Apr 2022 17:36:38 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Subject: Re: [Intel-gfx] [CI 8/8] drm/i915: Expose client engine utilisation
 via fdinfo
Message-ID: <YksQhinav7N4/Qjk@phenom.ffwll.local>
References: <20220401142205.3123159-1-tvrtko.ursulin@linux.intel.com>
 <20220401142205.3123159-9-tvrtko.ursulin@linux.intel.com>
 <5a6d725f-02a3-bbdf-4585-5e0b491f2721@linux.intel.com>
 <b0e7449b-c4f9-e2fb-2866-08997f0195bf@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <b0e7449b-c4f9-e2fb-2866-08997f0195bf@linux.intel.com>
X-Operating-System: Linux phenom 5.10.0-8-amd64 
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
Cc: Intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Apr 04, 2022 at 10:23:53AM +0100, Tvrtko Ursulin wrote:
> 
> + Dave and Daniel
> 
> Guys, are you okay with merging this via drm-intel-gt-next? It is one new
> file at Documentation/gpu/drm-usage-stats.rst only which is outside i915. It
> has acks from Christian and Rob.

Acked-by: Daniel Vetter <daniel.vetter@ffwll.ch>

> 
> Daniel, series is also fully reviewed and IGT reviewed and ready. Rob also
> demonstrated the approach works for msm when using the vendor agnosstic
> gputop tool I sketched out (see
> 20220225202614.225197-3-robdclark@gmail.com).
> 
> My plan is to merge the i915 support with the common spec and intel_gpu_top
> on the IGT side. Then follow-up with vendor agnostic gputop and later yet
> potentially re-visit the AMD side by re-sending the patch which tweaks the
> fdinfo format there and adds support for relative engine utilisation as
> provided by amdgpu.
> 
> Regards,
> 
> Tvrtko
> 
> On 04/04/2022 10:12, Tvrtko Ursulin wrote:
> > 
> > On 01/04/2022 15:22, Tvrtko Ursulin wrote:
> > > From: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
> > > 
> > > Similar to AMD commit
> > > 874442541133 ("drm/amdgpu: Add show_fdinfo() interface"), using the
> > > infrastructure added in previous patches, we add basic client info
> > > and GPU engine utilisation for i915.
> > > 
> > > Example of the output:
> > > 
> > >    pos:    0
> > >    flags:  0100002
> > >    mnt_id: 21
> > >    drm-driver: i915
> > >    drm-pdev:   0000:00:02.0
> > >    drm-client-id:      7
> > >    drm-engine-render:  9288864723 ns
> > >    drm-engine-copy:    2035071108 ns
> > >    drm-engine-video:   0 ns
> > >    drm-engine-video-enhance:   0 ns
> > > 
> > > v2:
> > >   * Update for removal of name and pid.
> > > 
> > > v3:
> > >   * Use drm_driver.name.
> > > 
> > > v4:
> > >   * Added drm-engine-capacity- tag.
> > >   * Fix typo. (Umesh)
> > > 
> > > v5:
> > >   * Don't output engine data before Gen8.
> > > 
> > > Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
> > > Cc: David M Nieto <David.Nieto@amd.com>
> > > Cc: Christian König <christian.koenig@amd.com>
> > > Cc: Daniel Vetter <daniel@ffwll.ch>
> > > Cc: Chris Healy <cphealy@gmail.com>
> > > Acked-by: Christian König <christian.koenig@amd.com>
> > > Reviewed-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
> > 
> > Forgot to apply an earlier:
> > 
> > Acked-by: Rob Clark <robdclark@gmail.com>
> > 
> > Regards,
> > 
> > Tvrtko
> > 
> > > ---
> > >   Documentation/gpu/drm-usage-stats.rst  |  6 ++
> > >   Documentation/gpu/i915.rst             | 28 +++++++++
> > >   drivers/gpu/drm/i915/i915_driver.c     |  3 +
> > >   drivers/gpu/drm/i915/i915_drm_client.c | 84 ++++++++++++++++++++++++++
> > >   drivers/gpu/drm/i915/i915_drm_client.h |  4 ++
> > >   5 files changed, 125 insertions(+)
> > > 
> > > diff --git a/Documentation/gpu/drm-usage-stats.rst
> > > b/Documentation/gpu/drm-usage-stats.rst
> > > index b8cc28f4da6f..6c9f166a8d6f 100644
> > > --- a/Documentation/gpu/drm-usage-stats.rst
> > > +++ b/Documentation/gpu/drm-usage-stats.rst
> > > @@ -104,3 +104,9 @@ object belong to this client, in the respective
> > > memory region.
> > >   Default unit shall be bytes with optional unit specifiers of 'KiB'
> > > or 'MiB'
> > >   indicating kibi- or mebi-bytes.
> > > +
> > > +===============================
> > > +Driver specific implementations
> > > +===============================
> > > +
> > > +:ref:`i915-usage-stats`
> > > diff --git a/Documentation/gpu/i915.rst b/Documentation/gpu/i915.rst
> > > index 0f08693d05cd..54060cd6c419 100644
> > > --- a/Documentation/gpu/i915.rst
> > > +++ b/Documentation/gpu/i915.rst
> > > @@ -697,3 +697,31 @@ The style guide for ``i915_reg.h``.
> > >   .. kernel-doc:: drivers/gpu/drm/i915/i915_reg.h
> > >      :doc: The i915 register macro definition style guide
> > > +
> > > +.. _i915-usage-stats:
> > > +
> > > +i915 DRM client usage stats implementation
> > > +==========================================
> > > +
> > > +The drm/i915 driver implements the DRM client usage stats
> > > specification as
> > > +documented in :ref:`drm-client-usage-stats`.
> > > +
> > > +Example of the output showing the implemented key value pairs and
> > > entirety of
> > > +the currently possible format options:
> > > +
> > > +::
> > > +
> > > +      pos:    0
> > > +      flags:  0100002
> > > +      mnt_id: 21
> > > +      drm-driver: i915
> > > +      drm-pdev:   0000:00:02.0
> > > +      drm-client-id:      7
> > > +      drm-engine-render:  9288864723 ns
> > > +      drm-engine-copy:    2035071108 ns
> > > +      drm-engine-video:   0 ns
> > > +      drm-engine-capacity-video:   2
> > > +      drm-engine-video-enhance:   0 ns
> > > +
> > > +Possible `drm-engine-` key names are: `render`, `copy`, `video` and
> > > +`video-enhance`.
> > > diff --git a/drivers/gpu/drm/i915/i915_driver.c
> > > b/drivers/gpu/drm/i915/i915_driver.c
> > > index b2df273e6d7b..3ffb617d75c9 100644
> > > --- a/drivers/gpu/drm/i915/i915_driver.c
> > > +++ b/drivers/gpu/drm/i915/i915_driver.c
> > > @@ -1745,6 +1745,9 @@ static const struct file_operations
> > > i915_driver_fops = {
> > >       .read = drm_read,
> > >       .compat_ioctl = i915_ioc32_compat_ioctl,
> > >       .llseek = noop_llseek,
> > > +#ifdef CONFIG_PROC_FS
> > > +    .show_fdinfo = i915_drm_client_fdinfo,
> > > +#endif
> > >   };
> > >   static int
> > > diff --git a/drivers/gpu/drm/i915/i915_drm_client.c
> > > b/drivers/gpu/drm/i915/i915_drm_client.c
> > > index 91a8559bebf7..e539f6b23060 100644
> > > --- a/drivers/gpu/drm/i915/i915_drm_client.c
> > > +++ b/drivers/gpu/drm/i915/i915_drm_client.c
> > > @@ -7,7 +7,13 @@
> > >   #include <linux/slab.h>
> > >   #include <linux/types.h>
> > > +#include <uapi/drm/i915_drm.h>
> > > +
> > > +#include <drm/drm_print.h>
> > > +
> > > +#include "gem/i915_gem_context.h"
> > >   #include "i915_drm_client.h"
> > > +#include "i915_file_private.h"
> > >   #include "i915_gem.h"
> > >   #include "i915_utils.h"
> > > @@ -68,3 +74,81 @@ void i915_drm_clients_fini(struct
> > > i915_drm_clients *clients)
> > >       GEM_BUG_ON(!xa_empty(&clients->xarray));
> > >       xa_destroy(&clients->xarray);
> > >   }
> > > +
> > > +#ifdef CONFIG_PROC_FS
> > > +static const char * const uabi_class_names[] = {
> > > +    [I915_ENGINE_CLASS_RENDER] = "render",
> > > +    [I915_ENGINE_CLASS_COPY] = "copy",
> > > +    [I915_ENGINE_CLASS_VIDEO] = "video",
> > > +    [I915_ENGINE_CLASS_VIDEO_ENHANCE] = "video-enhance",
> > > +};
> > > +
> > > +static u64 busy_add(struct i915_gem_context *ctx, unsigned int class)
> > > +{
> > > +    struct i915_gem_engines_iter it;
> > > +    struct intel_context *ce;
> > > +    u64 total = 0;
> > > +
> > > +    for_each_gem_engine(ce, rcu_dereference(ctx->engines), it) {
> > > +        if (ce->engine->uabi_class != class)
> > > +            continue;
> > > +
> > > +        total += intel_context_get_total_runtime_ns(ce);
> > > +    }
> > > +
> > > +    return total;
> > > +}
> > > +
> > > +static void
> > > +show_client_class(struct seq_file *m,
> > > +          struct i915_drm_client *client,
> > > +          unsigned int class)
> > > +{
> > > +    const struct list_head *list = &client->ctx_list;
> > > +    u64 total = atomic64_read(&client->past_runtime[class]);
> > > +    const unsigned int capacity =
> > > +        client->clients->i915->engine_uabi_class_count[class];
> > > +    struct i915_gem_context *ctx;
> > > +
> > > +    rcu_read_lock();
> > > +    list_for_each_entry_rcu(ctx, list, client_link)
> > > +        total += busy_add(ctx, class);
> > > +    rcu_read_unlock();
> > > +
> > > +    seq_printf(m, "drm-engine-%s:\t%llu ns\n",
> > > +           uabi_class_names[class], total);
> > > +
> > > +    if (capacity > 1)
> > > +        seq_printf(m, "drm-engine-capacity-%s:\t%u\n",
> > > +               uabi_class_names[class],
> > > +               capacity);
> > > +}
> > > +
> > > +void i915_drm_client_fdinfo(struct seq_file *m, struct file *f)
> > > +{
> > > +    struct drm_file *file = f->private_data;
> > > +    struct drm_i915_file_private *file_priv = file->driver_priv;
> > > +    struct drm_i915_private *i915 = file_priv->dev_priv;
> > > +    struct i915_drm_client *client = file_priv->client;
> > > +    struct pci_dev *pdev = to_pci_dev(i915->drm.dev);
> > > +    unsigned int i;
> > > +
> > > +    /*
> > > +     *
> > > ******************************************************************
> > > +     * For text output format description please see
> > > drm-usage-stats.rst!
> > > +     *
> > > ******************************************************************
> > > +     */
> > > +
> > > +    seq_printf(m, "drm-driver:\t%s\n", i915->drm.driver->name);
> > > +    seq_printf(m, "drm-pdev:\t%04x:%02x:%02x.%d\n",
> > > +           pci_domain_nr(pdev->bus), pdev->bus->number,
> > > +           PCI_SLOT(pdev->devfn), PCI_FUNC(pdev->devfn));
> > > +    seq_printf(m, "drm-client-id:\t%u\n", client->id);
> > > +
> > > +    if (GRAPHICS_VER(i915) < 8)
> > > +        return;
> > > +
> > > +    for (i = 0; i < ARRAY_SIZE(uabi_class_names); i++)
> > > +        show_client_class(m, client, i);
> > > +}
> > > +#endif
> > > diff --git a/drivers/gpu/drm/i915/i915_drm_client.h
> > > b/drivers/gpu/drm/i915/i915_drm_client.h
> > > index 191368386ace..5f5b02b01ba0 100644
> > > --- a/drivers/gpu/drm/i915/i915_drm_client.h
> > > +++ b/drivers/gpu/drm/i915/i915_drm_client.h
> > > @@ -59,6 +59,10 @@ static inline void i915_drm_client_put(struct
> > > i915_drm_client *client)
> > >   struct i915_drm_client *i915_drm_client_add(struct
> > > i915_drm_clients *clients);
> > > +#ifdef CONFIG_PROC_FS
> > > +void i915_drm_client_fdinfo(struct seq_file *m, struct file *f);
> > > +#endif
> > > +
> > >   void i915_drm_clients_fini(struct i915_drm_clients *clients);
> > >   #endif /* !__I915_DRM_CLIENT_H__ */

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
