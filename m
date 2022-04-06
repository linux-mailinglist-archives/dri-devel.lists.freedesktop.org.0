Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E3FA4F689F
	for <lists+dri-devel@lfdr.de>; Wed,  6 Apr 2022 20:15:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F236C10E1DF;
	Wed,  6 Apr 2022 18:14:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com
 [IPv6:2a00:1450:4864:20::32c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5211010E1A4;
 Wed,  6 Apr 2022 18:14:56 +0000 (UTC)
Received: by mail-wm1-x32c.google.com with SMTP id
 k124-20020a1ca182000000b0038c9cf6e2a6so2209971wme.0; 
 Wed, 06 Apr 2022 11:14:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=cmplrhXRmjn31lJeikHdlTYGJCKx+VQQyvGg1N8nN2s=;
 b=T9iK5EutDPG8RWMLc73KZOSrzKrsOx+SMEHM5d1SeUhyr9AJXMxbgn+l+ozN+dioQO
 XgrK3NZJVqRvPGa+12iepLtstbl70+RN3x+mpnK1GvyXAgg3+0hEr7eWbgUVZf3OAx1C
 KsxVmZacAz1ZEkszH2opyik7FJf8UjGmveXSPhfLF77PT6cTGz/i/YOJgGTg+jeNOIPu
 242l/NazqF8L67FkuMPYQwmpoIFfVO8Htvy7zdA9tCKm2TAMS71aOAeQQzduMsv7/kJI
 EEiOboJtjmSQrTmkpd663d74JZ3pFFSaa8swogjlvhgM8gDArQiUWsLq8QzoFClCL2aS
 IHXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=cmplrhXRmjn31lJeikHdlTYGJCKx+VQQyvGg1N8nN2s=;
 b=QQMrKYI0hVBOXKrTtIv0IoGX/MBKgwy+j5FIL4EKGoQhlCkzKzBZMBgNrQA9C77929
 9iVanJjx9/XUkOJA01JvNgtQtzEvSTLfPetAQeeWspDJQZ7jISFNfhEuAcqMZT35X6hc
 MVHxdxXIVhMMJDehRpdtBQKNoXGb5FoZdVatRZ8mqQEaMalCBMiMrjAfYY7Q6H43a+27
 4s5Bgsbqo7LPtqmUr2v/5m472AKTDQ1pNi5USBgeE2NDs+H4e05aRZ/ZJiuIt9/aObbl
 og/rMHyLNCXlYAMvk6tCgMVdNbSrPpy5loeCq/iEQE871WUutQW5mlJeSxVSNuwryUie
 vpAg==
X-Gm-Message-State: AOAM5304W9js3wbkphjbW5jldpneCFf+DusmMTMqBvYPQPz2SLfwrnZ5
 s3iFPG7/zDaav/axLWIj45+8/cURygaTj+wBkW8=
X-Google-Smtp-Source: ABdhPJw1M979wvgrfArE8b/Ja8AQFhvtKpAYBpSrTLdb6meMuOZKqWKv9IYVK1Tot2AEcxT5uCr9V+rgf+rMl7giBeM=
X-Received: by 2002:a05:600c:6020:b0:38e:7105:4ff6 with SMTP id
 az32-20020a05600c602000b0038e71054ff6mr8582658wmb.119.1649268894669; Wed, 06
 Apr 2022 11:14:54 -0700 (PDT)
MIME-Version: 1.0
References: <20220401142205.3123159-1-tvrtko.ursulin@linux.intel.com>
 <20220401142205.3123159-9-tvrtko.ursulin@linux.intel.com>
 <5a6d725f-02a3-bbdf-4585-5e0b491f2721@linux.intel.com>
 <b0e7449b-c4f9-e2fb-2866-08997f0195bf@linux.intel.com>
 <YksQhinav7N4/Qjk@phenom.ffwll.local>
 <70c2b24a-60b6-6222-ff73-d33abf073e4b@linux.intel.com>
In-Reply-To: <70c2b24a-60b6-6222-ff73-d33abf073e4b@linux.intel.com>
From: Rob Clark <robdclark@gmail.com>
Date: Wed, 6 Apr 2022 11:15:49 -0700
Message-ID: <CAF6AEGsu+oYm714-qoty3PnK1Ynt2+KcyF4mOcaJtXHi+gSOsA@mail.gmail.com>
Subject: Re: [Intel-gfx] [CI 8/8] drm/i915: Expose client engine utilisation
 via fdinfo
To: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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
Cc: Intel Graphics Development <Intel-gfx@lists.freedesktop.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Apr 5, 2022 at 1:09 AM Tvrtko Ursulin
<tvrtko.ursulin@linux.intel.com> wrote:
>
>
> On 04/04/2022 16:36, Daniel Vetter wrote:
> > On Mon, Apr 04, 2022 at 10:23:53AM +0100, Tvrtko Ursulin wrote:
> >>
> >> + Dave and Daniel
> >>
> >> Guys, are you okay with merging this via drm-intel-gt-next? It is one =
new
> >> file at Documentation/gpu/drm-usage-stats.rst only which is outside i9=
15. It
> >> has acks from Christian and Rob.
> >
> > Acked-by: Daniel Vetter <daniel.vetter@ffwll.ch>
>
> Thanks, pushed now.
>
> Rob - you can proceed with your driver at your leisure. I will re-send
> the rebased gputop to igt-dev shortly and copy you.

Thx, I was planning to respin, but trying to figure out where the
drm-usage-stats.rst patch ended up (since I can't add to a file that
isn't there

BR,
-R

> Regards,
>
> Tvrtko
>
> >>
> >> Daniel, series is also fully reviewed and IGT reviewed and ready. Rob =
also
> >> demonstrated the approach works for msm when using the vendor agnossti=
c
> >> gputop tool I sketched out (see
> >> 20220225202614.225197-3-robdclark@gmail.com).
> >>
> >> My plan is to merge the i915 support with the common spec and intel_gp=
u_top
> >> on the IGT side. Then follow-up with vendor agnostic gputop and later =
yet
> >> potentially re-visit the AMD side by re-sending the patch which tweaks=
 the
> >> fdinfo format there and adds support for relative engine utilisation a=
s
> >> provided by amdgpu.
> >>
> >> Regards,
> >>
> >> Tvrtko
> >>
> >> On 04/04/2022 10:12, Tvrtko Ursulin wrote:
> >>>
> >>> On 01/04/2022 15:22, Tvrtko Ursulin wrote:
> >>>> From: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
> >>>>
> >>>> Similar to AMD commit
> >>>> 874442541133 ("drm/amdgpu: Add show_fdinfo() interface"), using the
> >>>> infrastructure added in previous patches, we add basic client info
> >>>> and GPU engine utilisation for i915.
> >>>>
> >>>> Example of the output:
> >>>>
> >>>>     pos:    0
> >>>>     flags:  0100002
> >>>>     mnt_id: 21
> >>>>     drm-driver: i915
> >>>>     drm-pdev:   0000:00:02.0
> >>>>     drm-client-id:      7
> >>>>     drm-engine-render:  9288864723 ns
> >>>>     drm-engine-copy:    2035071108 ns
> >>>>     drm-engine-video:   0 ns
> >>>>     drm-engine-video-enhance:   0 ns
> >>>>
> >>>> v2:
> >>>>    * Update for removal of name and pid.
> >>>>
> >>>> v3:
> >>>>    * Use drm_driver.name.
> >>>>
> >>>> v4:
> >>>>    * Added drm-engine-capacity- tag.
> >>>>    * Fix typo. (Umesh)
> >>>>
> >>>> v5:
> >>>>    * Don't output engine data before Gen8.
> >>>>
> >>>> Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
> >>>> Cc: David M Nieto <David.Nieto@amd.com>
> >>>> Cc: Christian K=C3=B6nig <christian.koenig@amd.com>
> >>>> Cc: Daniel Vetter <daniel@ffwll.ch>
> >>>> Cc: Chris Healy <cphealy@gmail.com>
> >>>> Acked-by: Christian K=C3=B6nig <christian.koenig@amd.com>
> >>>> Reviewed-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
> >>>
> >>> Forgot to apply an earlier:
> >>>
> >>> Acked-by: Rob Clark <robdclark@gmail.com>
> >>>
> >>> Regards,
> >>>
> >>> Tvrtko
> >>>
> >>>> ---
> >>>>    Documentation/gpu/drm-usage-stats.rst  |  6 ++
> >>>>    Documentation/gpu/i915.rst             | 28 +++++++++
> >>>>    drivers/gpu/drm/i915/i915_driver.c     |  3 +
> >>>>    drivers/gpu/drm/i915/i915_drm_client.c | 84 +++++++++++++++++++++=
+++++
> >>>>    drivers/gpu/drm/i915/i915_drm_client.h |  4 ++
> >>>>    5 files changed, 125 insertions(+)
> >>>>
> >>>> diff --git a/Documentation/gpu/drm-usage-stats.rst
> >>>> b/Documentation/gpu/drm-usage-stats.rst
> >>>> index b8cc28f4da6f..6c9f166a8d6f 100644
> >>>> --- a/Documentation/gpu/drm-usage-stats.rst
> >>>> +++ b/Documentation/gpu/drm-usage-stats.rst
> >>>> @@ -104,3 +104,9 @@ object belong to this client, in the respective
> >>>> memory region.
> >>>>    Default unit shall be bytes with optional unit specifiers of 'KiB=
'
> >>>> or 'MiB'
> >>>>    indicating kibi- or mebi-bytes.
> >>>> +
> >>>> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D
> >>>> +Driver specific implementations
> >>>> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D
> >>>> +
> >>>> +:ref:`i915-usage-stats`
> >>>> diff --git a/Documentation/gpu/i915.rst b/Documentation/gpu/i915.rst
> >>>> index 0f08693d05cd..54060cd6c419 100644
> >>>> --- a/Documentation/gpu/i915.rst
> >>>> +++ b/Documentation/gpu/i915.rst
> >>>> @@ -697,3 +697,31 @@ The style guide for ``i915_reg.h``.
> >>>>    .. kernel-doc:: drivers/gpu/drm/i915/i915_reg.h
> >>>>       :doc: The i915 register macro definition style guide
> >>>> +
> >>>> +.. _i915-usage-stats:
> >>>> +
> >>>> +i915 DRM client usage stats implementation
> >>>> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> >>>> +
> >>>> +The drm/i915 driver implements the DRM client usage stats
> >>>> specification as
> >>>> +documented in :ref:`drm-client-usage-stats`.
> >>>> +
> >>>> +Example of the output showing the implemented key value pairs and
> >>>> entirety of
> >>>> +the currently possible format options:
> >>>> +
> >>>> +::
> >>>> +
> >>>> +      pos:    0
> >>>> +      flags:  0100002
> >>>> +      mnt_id: 21
> >>>> +      drm-driver: i915
> >>>> +      drm-pdev:   0000:00:02.0
> >>>> +      drm-client-id:      7
> >>>> +      drm-engine-render:  9288864723 ns
> >>>> +      drm-engine-copy:    2035071108 ns
> >>>> +      drm-engine-video:   0 ns
> >>>> +      drm-engine-capacity-video:   2
> >>>> +      drm-engine-video-enhance:   0 ns
> >>>> +
> >>>> +Possible `drm-engine-` key names are: `render`, `copy`, `video` and
> >>>> +`video-enhance`.
> >>>> diff --git a/drivers/gpu/drm/i915/i915_driver.c
> >>>> b/drivers/gpu/drm/i915/i915_driver.c
> >>>> index b2df273e6d7b..3ffb617d75c9 100644
> >>>> --- a/drivers/gpu/drm/i915/i915_driver.c
> >>>> +++ b/drivers/gpu/drm/i915/i915_driver.c
> >>>> @@ -1745,6 +1745,9 @@ static const struct file_operations
> >>>> i915_driver_fops =3D {
> >>>>        .read =3D drm_read,
> >>>>        .compat_ioctl =3D i915_ioc32_compat_ioctl,
> >>>>        .llseek =3D noop_llseek,
> >>>> +#ifdef CONFIG_PROC_FS
> >>>> +    .show_fdinfo =3D i915_drm_client_fdinfo,
> >>>> +#endif
> >>>>    };
> >>>>    static int
> >>>> diff --git a/drivers/gpu/drm/i915/i915_drm_client.c
> >>>> b/drivers/gpu/drm/i915/i915_drm_client.c
> >>>> index 91a8559bebf7..e539f6b23060 100644
> >>>> --- a/drivers/gpu/drm/i915/i915_drm_client.c
> >>>> +++ b/drivers/gpu/drm/i915/i915_drm_client.c
> >>>> @@ -7,7 +7,13 @@
> >>>>    #include <linux/slab.h>
> >>>>    #include <linux/types.h>
> >>>> +#include <uapi/drm/i915_drm.h>
> >>>> +
> >>>> +#include <drm/drm_print.h>
> >>>> +
> >>>> +#include "gem/i915_gem_context.h"
> >>>>    #include "i915_drm_client.h"
> >>>> +#include "i915_file_private.h"
> >>>>    #include "i915_gem.h"
> >>>>    #include "i915_utils.h"
> >>>> @@ -68,3 +74,81 @@ void i915_drm_clients_fini(struct
> >>>> i915_drm_clients *clients)
> >>>>        GEM_BUG_ON(!xa_empty(&clients->xarray));
> >>>>        xa_destroy(&clients->xarray);
> >>>>    }
> >>>> +
> >>>> +#ifdef CONFIG_PROC_FS
> >>>> +static const char * const uabi_class_names[] =3D {
> >>>> +    [I915_ENGINE_CLASS_RENDER] =3D "render",
> >>>> +    [I915_ENGINE_CLASS_COPY] =3D "copy",
> >>>> +    [I915_ENGINE_CLASS_VIDEO] =3D "video",
> >>>> +    [I915_ENGINE_CLASS_VIDEO_ENHANCE] =3D "video-enhance",
> >>>> +};
> >>>> +
> >>>> +static u64 busy_add(struct i915_gem_context *ctx, unsigned int clas=
s)
> >>>> +{
> >>>> +    struct i915_gem_engines_iter it;
> >>>> +    struct intel_context *ce;
> >>>> +    u64 total =3D 0;
> >>>> +
> >>>> +    for_each_gem_engine(ce, rcu_dereference(ctx->engines), it) {
> >>>> +        if (ce->engine->uabi_class !=3D class)
> >>>> +            continue;
> >>>> +
> >>>> +        total +=3D intel_context_get_total_runtime_ns(ce);
> >>>> +    }
> >>>> +
> >>>> +    return total;
> >>>> +}
> >>>> +
> >>>> +static void
> >>>> +show_client_class(struct seq_file *m,
> >>>> +          struct i915_drm_client *client,
> >>>> +          unsigned int class)
> >>>> +{
> >>>> +    const struct list_head *list =3D &client->ctx_list;
> >>>> +    u64 total =3D atomic64_read(&client->past_runtime[class]);
> >>>> +    const unsigned int capacity =3D
> >>>> +        client->clients->i915->engine_uabi_class_count[class];
> >>>> +    struct i915_gem_context *ctx;
> >>>> +
> >>>> +    rcu_read_lock();
> >>>> +    list_for_each_entry_rcu(ctx, list, client_link)
> >>>> +        total +=3D busy_add(ctx, class);
> >>>> +    rcu_read_unlock();
> >>>> +
> >>>> +    seq_printf(m, "drm-engine-%s:\t%llu ns\n",
> >>>> +           uabi_class_names[class], total);
> >>>> +
> >>>> +    if (capacity > 1)
> >>>> +        seq_printf(m, "drm-engine-capacity-%s:\t%u\n",
> >>>> +               uabi_class_names[class],
> >>>> +               capacity);
> >>>> +}
> >>>> +
> >>>> +void i915_drm_client_fdinfo(struct seq_file *m, struct file *f)
> >>>> +{
> >>>> +    struct drm_file *file =3D f->private_data;
> >>>> +    struct drm_i915_file_private *file_priv =3D file->driver_priv;
> >>>> +    struct drm_i915_private *i915 =3D file_priv->dev_priv;
> >>>> +    struct i915_drm_client *client =3D file_priv->client;
> >>>> +    struct pci_dev *pdev =3D to_pci_dev(i915->drm.dev);
> >>>> +    unsigned int i;
> >>>> +
> >>>> +    /*
> >>>> +     *
> >>>> ******************************************************************
> >>>> +     * For text output format description please see
> >>>> drm-usage-stats.rst!
> >>>> +     *
> >>>> ******************************************************************
> >>>> +     */
> >>>> +
> >>>> +    seq_printf(m, "drm-driver:\t%s\n", i915->drm.driver->name);
> >>>> +    seq_printf(m, "drm-pdev:\t%04x:%02x:%02x.%d\n",
> >>>> +           pci_domain_nr(pdev->bus), pdev->bus->number,
> >>>> +           PCI_SLOT(pdev->devfn), PCI_FUNC(pdev->devfn));
> >>>> +    seq_printf(m, "drm-client-id:\t%u\n", client->id);
> >>>> +
> >>>> +    if (GRAPHICS_VER(i915) < 8)
> >>>> +        return;
> >>>> +
> >>>> +    for (i =3D 0; i < ARRAY_SIZE(uabi_class_names); i++)
> >>>> +        show_client_class(m, client, i);
> >>>> +}
> >>>> +#endif
> >>>> diff --git a/drivers/gpu/drm/i915/i915_drm_client.h
> >>>> b/drivers/gpu/drm/i915/i915_drm_client.h
> >>>> index 191368386ace..5f5b02b01ba0 100644
> >>>> --- a/drivers/gpu/drm/i915/i915_drm_client.h
> >>>> +++ b/drivers/gpu/drm/i915/i915_drm_client.h
> >>>> @@ -59,6 +59,10 @@ static inline void i915_drm_client_put(struct
> >>>> i915_drm_client *client)
> >>>>    struct i915_drm_client *i915_drm_client_add(struct
> >>>> i915_drm_clients *clients);
> >>>> +#ifdef CONFIG_PROC_FS
> >>>> +void i915_drm_client_fdinfo(struct seq_file *m, struct file *f);
> >>>> +#endif
> >>>> +
> >>>>    void i915_drm_clients_fini(struct i915_drm_clients *clients);
> >>>>    #endif /* !__I915_DRM_CLIENT_H__ */
> >
