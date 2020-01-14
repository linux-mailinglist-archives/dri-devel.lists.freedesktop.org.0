Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 366A413BAE0
	for <lists+dri-devel@lfdr.de>; Wed, 15 Jan 2020 09:28:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B15BB6E889;
	Wed, 15 Jan 2020 08:27:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-xd41.google.com (mail-io1-xd41.google.com
 [IPv6:2607:f8b0:4864:20::d41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C72BD893D0
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Jan 2020 16:48:59 +0000 (UTC)
Received: by mail-io1-xd41.google.com with SMTP id x1so14533534iop.7
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Jan 2020 08:48:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=2I42vpGfXb9/ZHBDOiHtgHbR+MXS22hQ7Kw201plqiQ=;
 b=Cz6sxrqAb7LCUQiu1Gc9r2whIiuWlFwRAExhb1Xci/cHNNOYBUrN1GHNe57QvtnyXk
 DhogmGlU6CVzi8R3rYenmNJ2BT0HpoQO08aWl5PaftQuDkh+F8By1hzOJLuq7TI50qX3
 QyYudstWPwyEVnaZ9mKZWETrLifTcmaeE+WEM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=2I42vpGfXb9/ZHBDOiHtgHbR+MXS22hQ7Kw201plqiQ=;
 b=jg7yAa7QolWW8XAq54ry2h9+bdeVtw/P3gLoBZo32m1YU2veTLdRVX1DHyU4uBzA5u
 T58Os7ODPTNqnOErvaUTSklrYpvKMMaZq+S2v68hk63+zg1Upc4KeGxWo0z8X0EO27TU
 sSowjjoML9hn2zOWXzEiadxpapv+5lzx5gux8dMe1tXnKgJ8Ufb8wC5J5u/mdi3yF27L
 X0yKURbiU19PL7vvx0cT5I30kJj2JzrV1DQm4SC9iR+gXq5OJG5hEVZ30ZestWZbfmZx
 N2tlvak3Lv8FmImY7Sycww+kC+WyjtOFZnQ0pEVzuHOQBU36YP44QV+71ZZdtQzgb5nd
 lGpw==
X-Gm-Message-State: APjAAAVUVakPjzFqkJnpwlmY5QAeE4zgi7MRKI2U8nWADGD/UBf9KMyP
 0xgGSvJ2E7qK+cTeGCSSTcQXoTPxJ44p6Wg93iCreg==
X-Google-Smtp-Source: APXvYqzPrxTYgi4YxzIDNPkedNJ9IzJ6AhsUau+WOh0tlk00GB68WyJ5xg1kRtFUsOXx1ZUNkVmR3jzV0BH+OPDRK5s=
X-Received: by 2002:a02:3312:: with SMTP id c18mr19408348jae.24.1579020539044; 
 Tue, 14 Jan 2020 08:48:59 -0800 (PST)
MIME-Version: 1.0
References: <20200113153605.52350-1-brian@brkho.com>
 <20200113153605.52350-3-brian@brkho.com>
 <CAJs_Fx48B-C8GEeAmPaqGAqAOTR2dT0csg8W=TRyULOfy=1=VQ@mail.gmail.com>
 <CAOPc6Tn8CWVzcLoJOGmn3CW6B9FMKf_-NzE8TpwDHsPfoQDaQQ@mail.gmail.com>
 <20200113225516.GA157345@google.com>
 <CAJs_Fx5i-cZ0qXk_jNo=JGfZRc7uuvUcTZ2TE1ppuYUfNLymKQ@mail.gmail.com>
 <20200114164034.GA213224@google.com>
In-Reply-To: <20200114164034.GA213224@google.com>
From: Rob Clark <robdclark@chromium.org>
Date: Tue, 14 Jan 2020 08:48:48 -0800
Message-ID: <CAJs_Fx6YN_DFx8y_7PB4kJ7YzmGvgUPE9FaOqTY_kJW7y08LVw@mail.gmail.com>
Subject: Re: [PATCH 2/2] drm/msm: Add MSM_WAIT_IOVA ioctl
To: Brian Ho <brian@brkho.com>
X-Mailman-Approved-At: Wed, 15 Jan 2020 08:27:50 +0000
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
Cc: David Airlie <airlied@linux.ie>,
 freedreno <freedreno@lists.freedesktop.org>,
 open list <linux-kernel@vger.kernel.org>,
 "open list:DRM DRIVER FOR MSM ADRENO GPU" <dri-devel@lists.freedesktop.org>,
 Kristian Kristensen <hoegsberg@google.com>,
 "open list:DRM DRIVER FOR MSM ADRENO GPU" <linux-arm-msm@vger.kernel.org>,
 hoegsberg <hoegsberg@chromium.org>, Sean Paul <sean@poorly.run>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Jan 14, 2020 at 8:40 AM Brian Ho <brian@brkho.com> wrote:
>
> On Mon, Jan 13, 2020 at 03:17:38PM -0800, Rob Clark wrote:
> > On Mon, Jan 13, 2020 at 2:55 PM Brian Ho <brian@brkho.com> wrote:
> > >
> > > On Mon, Jan 13, 2020 at 09:57:43AM -0800, Kristian Kristensen wrote:
> > > > On Mon, Jan 13, 2020 at 8:25 AM Rob Clark <robdclark@chromium.org> wrote:
> > > >
> > > > > On Mon, Jan 13, 2020 at 7:37 AM Brian Ho <brian@brkho.com> wrote:
> > > > > >
> > > > > > Implements an ioctl to wait until a value at a given iova is greater
> > > > > > than or equal to a supplied value.
> > > > > >
> > > > > > This will initially be used by turnip (open-source Vulkan driver for
> > > > > > QC in mesa) for occlusion queries where the userspace driver can
> > > > > > block on a query becoming available before continuing via
> > > > > > vkGetQueryPoolResults.
> > > > > >
> > > > > > Signed-off-by: Brian Ho <brian@brkho.com>
> > > > > > ---
> > > > > >  drivers/gpu/drm/msm/msm_drv.c | 63 +++++++++++++++++++++++++++++++++--
> > > > > >  include/uapi/drm/msm_drm.h    | 13 ++++++++
> > > > > >  2 files changed, 74 insertions(+), 2 deletions(-)
> > > > > >
> > > > > > diff --git a/drivers/gpu/drm/msm/msm_drv.c
> > > > > b/drivers/gpu/drm/msm/msm_drv.c
> > > > > > index c84f0a8b3f2c..dcc46874a5a2 100644
> > > > > > --- a/drivers/gpu/drm/msm/msm_drv.c
> > > > > > +++ b/drivers/gpu/drm/msm/msm_drv.c
> > > > > > @@ -36,10 +36,11 @@
> > > > > >   *           MSM_GEM_INFO ioctl.
> > > > > >   * - 1.4.0 - softpin, MSM_RELOC_BO_DUMP, and GEM_INFO support to set/get
> > > > > >   *           GEM object's debug name
> > > > > > - * - 1.5.0 - Add SUBMITQUERY_QUERY ioctl
> > > > > > + * - 1.5.0 - Add SUBMITQUEUE_QUERY ioctl
> > > > > > + * - 1.6.0 - Add WAIT_IOVA ioctl
> > > > > >   */
> > > > > >  #define MSM_VERSION_MAJOR      1
> > > > > > -#define MSM_VERSION_MINOR      5
> > > > > > +#define MSM_VERSION_MINOR      6
> > > > > >  #define MSM_VERSION_PATCHLEVEL 0
> > > > > >
> > > > > >  static const struct drm_mode_config_funcs mode_config_funcs = {
> > > > > > @@ -952,6 +953,63 @@ static int msm_ioctl_submitqueue_close(struct
> > > > > drm_device *dev, void *data,
> > > > > >         return msm_submitqueue_remove(file->driver_priv, id);
> > > > > >  }
> > > > > >
> > > > > > +static int msm_ioctl_wait_iova(struct drm_device *dev, void *data,
> > > > > > +               struct drm_file *file)
> > > > > > +{
> > > > > > +       struct msm_drm_private *priv = dev->dev_private;
> > > > > > +       struct drm_gem_object *obj;
> > > > > > +       struct drm_msm_wait_iova *args = data;
> > > > > > +       ktime_t timeout = to_ktime(args->timeout);
> > > > > > +       unsigned long remaining_jiffies = timeout_to_jiffies(&timeout);
> > > > > > +       struct msm_gpu *gpu = priv->gpu;
> > > > > > +       void *base_vaddr;
> > > > > > +       uint64_t *vaddr;
> > > > > > +       int ret;
> > > > > > +
> > > > > > +       if (args->pad)
> > > > > > +               return -EINVAL;
> > > > > > +
> > > > > > +       if (!gpu)
> > > > > > +               return 0;
> > > > >
> > > > > hmm, I'm not sure we should return zero in this case.. maybe -ENODEV?
> > > > >
> > > > > > +
> > > > > > +       obj = drm_gem_object_lookup(file, args->handle);
> > > > > > +       if (!obj)
> > > > > > +               return -ENOENT;
> > > > > > +
> > > > > > +       base_vaddr = msm_gem_get_vaddr(obj);
> > > > > > +       if (IS_ERR(base_vaddr)) {
> > > > > > +               ret = PTR_ERR(base_vaddr);
> > > > > > +               goto err_put_gem_object;
> > > > > > +       }
> > > > > > +       if (args->offset + sizeof(*vaddr) > obj->size) {
> > > > > > +               ret = -EINVAL;
> > > > > > +               goto err_put_vaddr;
> > > > > > +       }
> > > > > > +
> > > > > > +       vaddr = base_vaddr + args->offset;
> > > > > > +
> > > > > > +       /* Assumes WC mapping */
> > > > > > +       ret = wait_event_interruptible_timeout(
> > > > > > +                       gpu->event, *vaddr >= args->value,
> > > > > remaining_jiffies);
> > > > >
> > > >
> > > > This needs to do the awkward looking
> > > >
> > > >   (int64_t)(*data - value) >= 0
> > > >
> > > > to properly handle the wraparound case.
> > > >
> > >
> > > I think this comparison will run into issues if we allow for 64-bit
> > > reference values. For example, if value is ULLONG_MAX, and *data
> > > starts at 0 on the first comparison, we'll immediately return.
> > >
> > > It's not too much of an issue in fence_completed (msm_fence.c), but
> > > in this ioctl, *data can grow at an arbitrary rate. Are we concerned
> > > about this?
> > >
> > > > > +
> > > > > > +       if (ret == 0) {
> > > > > > +               ret = -ETIMEDOUT;
> > > > > > +               goto err_put_vaddr;
> > > > > > +       } else if (ret == -ERESTARTSYS) {
> > > > > > +               goto err_put_vaddr;
> > > > > > +       }
> > > > >
> > > > > maybe:
> > > > >
> > > > >  } else {
> > > > >    ret = 0;
> > > > >  }
> > > > >
> > > > > and then drop the next three lines?
> > > > >
> > > > > > +
> > > > > > +       msm_gem_put_vaddr(obj);
> > > > > > +       drm_gem_object_put_unlocked(obj);
> > > > > > +       return 0;
> > > > > > +
> > > > > > +err_put_vaddr:
> > > > > > +       msm_gem_put_vaddr(obj);
> > > > > > +err_put_gem_object:
> > > > > > +       drm_gem_object_put_unlocked(obj);
> > > > > > +       return ret;
> > > > > > +}
> > > > > > +
> > > > > >  static const struct drm_ioctl_desc msm_ioctls[] = {
> > > > > >         DRM_IOCTL_DEF_DRV(MSM_GET_PARAM,    msm_ioctl_get_param,
> > > > > DRM_RENDER_ALLOW),
> > > > > >         DRM_IOCTL_DEF_DRV(MSM_GEM_NEW,      msm_ioctl_gem_new,
> > > > > DRM_RENDER_ALLOW),
> > > > > > @@ -964,6 +1022,7 @@ static const struct drm_ioctl_desc msm_ioctls[] = {
> > > > > >         DRM_IOCTL_DEF_DRV(MSM_SUBMITQUEUE_NEW,
> > > > >  msm_ioctl_submitqueue_new,   DRM_RENDER_ALLOW),
> > > > > >         DRM_IOCTL_DEF_DRV(MSM_SUBMITQUEUE_CLOSE,
> > > > > msm_ioctl_submitqueue_close, DRM_RENDER_ALLOW),
> > > > > >         DRM_IOCTL_DEF_DRV(MSM_SUBMITQUEUE_QUERY,
> > > > > msm_ioctl_submitqueue_query, DRM_RENDER_ALLOW),
> > > > > > +       DRM_IOCTL_DEF_DRV(MSM_WAIT_IOVA, msm_ioctl_wait_iova,
> > > > > DRM_RENDER_ALLOW),
> > > > > >  };
> > > > > >
> > > > > >  static const struct vm_operations_struct vm_ops = {
> > > > > > diff --git a/include/uapi/drm/msm_drm.h b/include/uapi/drm/msm_drm.h
> > > > > > index 0b85ed6a3710..8477f28a4ee1 100644
> > > > > > --- a/include/uapi/drm/msm_drm.h
> > > > > > +++ b/include/uapi/drm/msm_drm.h
> > > > > > @@ -298,6 +298,17 @@ struct drm_msm_submitqueue_query {
> > > > > >         __u32 pad;
> > > > > >  };
> > > > > >
> > > > > > +/* This ioctl blocks until the u64 value at bo + offset is greater than
> > > > > or
> > > > > > + * equal to the reference value.
> > > > > > + */
> > > > > > +struct drm_msm_wait_iova {
> > > > > > +       __u32 handle;          /* in, GEM handle */
> > > > > > +       __u32 pad;
> > > > > > +       struct drm_msm_timespec timeout;   /* in */
> > > > > > +       __u64 offset;          /* offset into bo */
> > > > > > +       __u64 value;           /* reference value */
> > > > >
> > > > > Maybe we should go ahead and add a __u64 mask;
> > > > >
> > > > > that would let us wait for 32b values as well, and wait for bits in a
> > > > > bitmask
> > > > >
> > > >
> > > > I think we'd be OK to just default to 32 bit values instead, since most of
> > > > the CP commands that this is intended to work with (CP_EVENT_WRITE,
> > > > CP_WAIT_MEM_GTE etc) operate on 32 bit values. We could move 'value' to the
> > > > slot right after 'handle' but then we'd not have any pad/reserved fields.
> > > > Maybe we keep 'value' 64 bit but restrict it to 32 bits, with an option to
> > > > add a 64 bit flag in 'pad' later on?
> > > >
> > >
> > > FWIW, the current usage of this in my mesa MR uses a 64 bit value.
> > > There's no super great reason that the available bit is 64 bits and
> > > not 32 bits (I think it made the addressing math a bit simpler), but
> > > I'm fine with whatever you all decide on here.
> > >
> >
> > I assume you are waiting for a fence value written w/ CP_EVENT_WRITE?
> > Or at least that is what I'd recommend.  That would be 32b
> >
> > BR,
> > -R
> >
>
> So it's actually a little bit different than that. I allocate a bo
> for the occlusion query which has an "availability" bit (0 for
> unavailable, 1 for available). When the occlusion query ends, we
> write the fragments passed value to the bo via CP_EVENT_WRITE and
> then wait for that write to complete before setting the available
> bit to 1 via a simple CP_MEM_WRITE [1].
>
> It's that CP_MEM_WRITE that I plan on waiting on with this new iova
> ioctl.
>
> [1] https://gitlab.freedesktop.org/mesa/mesa/blob/768106c50a5569796bb6d5e04b5e4d65c1d00ea0/src/freedreno/vulkan/tu_query.c#L529
>

hmm, interesting.. I had in mind something more like:

https://gitlab.freedesktop.org/drm/msm/blob/msm-next/drivers/gpu/drm/msm/adreno/a6xx_gpu.c#L137

The high bit in the first dword of the packet (which we probably
shouldn't open-code) is the "give me an irq after the value in last
dword is written to memory"..

(I haven't checked yet whether we can use the "gimme an irq" bit from userspace)

BR,
-R
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
