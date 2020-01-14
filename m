Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DEB9F139E85
	for <lists+dri-devel@lfdr.de>; Tue, 14 Jan 2020 01:46:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6A7186E1C0;
	Tue, 14 Jan 2020 00:46:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-vk1-xa44.google.com (mail-vk1-xa44.google.com
 [IPv6:2607:f8b0:4864:20::a44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B581E6E1BE;
 Tue, 14 Jan 2020 00:46:03 +0000 (UTC)
Received: by mail-vk1-xa44.google.com with SMTP id t129so3134901vkg.6;
 Mon, 13 Jan 2020 16:46:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=5gV2R3Ixh954iDDkX0/3sL6lriDWXRsCN/lGpeZTPDc=;
 b=Ae2/ZpxL7fCLzR07ewdAZzfF6zv0hgrMulsQk6hBjzkRY2R3ni9cLvphMhfN0zFm9U
 bXVgXzMZf8dakJlgfvmfl1kMEuPUGiiTVRQkDA7orrFVyOefuo4+g8r3pI2k3xxkesof
 lVR00q56O/gui25Ejs3Rs7IIid5tJye7uL/BJipl6utSvBupumWfLRSCaW4tmBZzBlTL
 /o/qKNvR83SgSNqKYDIo8U6AHdWpnk19/htXse5/eHl/pF+/eenbsSicE3YCZNtiRf66
 ucjiWMV2gekghCUZe5YlAEY3zyj47kQ98HYW9A0LRpzVrcubsDHV2LzE00mH8tVl/132
 pEhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=5gV2R3Ixh954iDDkX0/3sL6lriDWXRsCN/lGpeZTPDc=;
 b=lVROR5u9Yh0EQhk0ZOZVwwRa6fBqAjzWZnR0SobJ6G0Qdt3aNwBxsy/D+oE0xpabVL
 eEgXPsNXObJNChqNVI6vDgXOuPTabjCYU/jmWrLHMxLBDiSyB9ZhF9jcJflMk3DrrRpF
 +Abv6ELacTobzxGk7xojT0i7bZ72j27kApvYXKLHaJ0RofXoHGDix9fMvb0j8nsKGpsT
 BKpOyMR8j1cXX2HC2qCN0eAycNmXrOFQT3utfw/0w0NvgfWB08c1J5uTGdT3iYh31UJf
 6mdsrSys/eTe+UjCLTBVXgekG5zlAFN1kmkf0dRGitoPmKNH9ju6h1Dx+aDscg8HaoQ7
 dbxg==
X-Gm-Message-State: APjAAAWtFlGVsid0AVPc7oZ62u4LNrui3qALWpe0QxP5imO2OekxPx7w
 vTIXf3zjF3lAtl1lONTLSbj9GQwKmOXhWR9vAQo=
X-Google-Smtp-Source: APXvYqytrAmAqZ1DZJZHtOKbPoD4M2PzlcYb4C2dq0T5kKCR4DnU0ejkGLTzL3HmE6wVsnhESA6wMV+h8oh/AkIFo6Y=
X-Received: by 2002:a1f:2910:: with SMTP id p16mr9214513vkp.71.1578962762480; 
 Mon, 13 Jan 2020 16:46:02 -0800 (PST)
MIME-Version: 1.0
References: <20200113153605.52350-1-brian@brkho.com>
 <20200113153605.52350-3-brian@brkho.com>
 <CAJs_Fx48B-C8GEeAmPaqGAqAOTR2dT0csg8W=TRyULOfy=1=VQ@mail.gmail.com>
 <CAOPc6Tn8CWVzcLoJOGmn3CW6B9FMKf_-NzE8TpwDHsPfoQDaQQ@mail.gmail.com>
 <20200113225516.GA157345@google.com>
 <CAJs_Fx5i-cZ0qXk_jNo=JGfZRc7uuvUcTZ2TE1ppuYUfNLymKQ@mail.gmail.com>
In-Reply-To: <CAJs_Fx5i-cZ0qXk_jNo=JGfZRc7uuvUcTZ2TE1ppuYUfNLymKQ@mail.gmail.com>
From: =?UTF-8?Q?Kristian_H=C3=B8gsberg?= <hoegsberg@gmail.com>
Date: Mon, 13 Jan 2020 16:45:51 -0800
Message-ID: <CAOeoa-eLpuJ7Bf8FiZS+YyxUK5c8h7oA9qVMnqr1TDRXh2TpNA@mail.gmail.com>
Subject: Re: [Freedreno] [PATCH 2/2] drm/msm: Add MSM_WAIT_IOVA ioctl
To: Rob Clark <robdclark@chromium.org>
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
Cc: Sean Paul <sean@poorly.run>, Brian Ho <brian@brkho.com>,
 David Airlie <airlied@linux.ie>,
 "open list:DRM DRIVER FOR MSM ADRENO GPU" <linux-arm-msm@vger.kernel.org>,
 open list <linux-kernel@vger.kernel.org>,
 "open list:DRM DRIVER FOR MSM ADRENO GPU" <dri-devel@lists.freedesktop.org>,
 Kristian Kristensen <hoegsberg@google.com>, hoegsberg <hoegsberg@chromium.org>,
 freedreno <freedreno@lists.freedesktop.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Jan 13, 2020 at 3:17 PM Rob Clark <robdclark@chromium.org> wrote:
>
> On Mon, Jan 13, 2020 at 2:55 PM Brian Ho <brian@brkho.com> wrote:
> >
> > On Mon, Jan 13, 2020 at 09:57:43AM -0800, Kristian Kristensen wrote:
> > > On Mon, Jan 13, 2020 at 8:25 AM Rob Clark <robdclark@chromium.org> wrote:
> > >
> > > > On Mon, Jan 13, 2020 at 7:37 AM Brian Ho <brian@brkho.com> wrote:
> > > > >
> > > > > Implements an ioctl to wait until a value at a given iova is greater
> > > > > than or equal to a supplied value.
> > > > >
> > > > > This will initially be used by turnip (open-source Vulkan driver for
> > > > > QC in mesa) for occlusion queries where the userspace driver can
> > > > > block on a query becoming available before continuing via
> > > > > vkGetQueryPoolResults.
> > > > >
> > > > > Signed-off-by: Brian Ho <brian@brkho.com>
> > > > > ---
> > > > >  drivers/gpu/drm/msm/msm_drv.c | 63 +++++++++++++++++++++++++++++++++--
> > > > >  include/uapi/drm/msm_drm.h    | 13 ++++++++
> > > > >  2 files changed, 74 insertions(+), 2 deletions(-)
> > > > >
> > > > > diff --git a/drivers/gpu/drm/msm/msm_drv.c
> > > > b/drivers/gpu/drm/msm/msm_drv.c
> > > > > index c84f0a8b3f2c..dcc46874a5a2 100644
> > > > > --- a/drivers/gpu/drm/msm/msm_drv.c
> > > > > +++ b/drivers/gpu/drm/msm/msm_drv.c
> > > > > @@ -36,10 +36,11 @@
> > > > >   *           MSM_GEM_INFO ioctl.
> > > > >   * - 1.4.0 - softpin, MSM_RELOC_BO_DUMP, and GEM_INFO support to set/get
> > > > >   *           GEM object's debug name
> > > > > - * - 1.5.0 - Add SUBMITQUERY_QUERY ioctl
> > > > > + * - 1.5.0 - Add SUBMITQUEUE_QUERY ioctl
> > > > > + * - 1.6.0 - Add WAIT_IOVA ioctl
> > > > >   */
> > > > >  #define MSM_VERSION_MAJOR      1
> > > > > -#define MSM_VERSION_MINOR      5
> > > > > +#define MSM_VERSION_MINOR      6
> > > > >  #define MSM_VERSION_PATCHLEVEL 0
> > > > >
> > > > >  static const struct drm_mode_config_funcs mode_config_funcs = {
> > > > > @@ -952,6 +953,63 @@ static int msm_ioctl_submitqueue_close(struct
> > > > drm_device *dev, void *data,
> > > > >         return msm_submitqueue_remove(file->driver_priv, id);
> > > > >  }
> > > > >
> > > > > +static int msm_ioctl_wait_iova(struct drm_device *dev, void *data,
> > > > > +               struct drm_file *file)
> > > > > +{
> > > > > +       struct msm_drm_private *priv = dev->dev_private;
> > > > > +       struct drm_gem_object *obj;
> > > > > +       struct drm_msm_wait_iova *args = data;
> > > > > +       ktime_t timeout = to_ktime(args->timeout);
> > > > > +       unsigned long remaining_jiffies = timeout_to_jiffies(&timeout);
> > > > > +       struct msm_gpu *gpu = priv->gpu;
> > > > > +       void *base_vaddr;
> > > > > +       uint64_t *vaddr;
> > > > > +       int ret;
> > > > > +
> > > > > +       if (args->pad)
> > > > > +               return -EINVAL;
> > > > > +
> > > > > +       if (!gpu)
> > > > > +               return 0;
> > > >
> > > > hmm, I'm not sure we should return zero in this case.. maybe -ENODEV?
> > > >
> > > > > +
> > > > > +       obj = drm_gem_object_lookup(file, args->handle);
> > > > > +       if (!obj)
> > > > > +               return -ENOENT;
> > > > > +
> > > > > +       base_vaddr = msm_gem_get_vaddr(obj);
> > > > > +       if (IS_ERR(base_vaddr)) {
> > > > > +               ret = PTR_ERR(base_vaddr);
> > > > > +               goto err_put_gem_object;
> > > > > +       }
> > > > > +       if (args->offset + sizeof(*vaddr) > obj->size) {
> > > > > +               ret = -EINVAL;
> > > > > +               goto err_put_vaddr;
> > > > > +       }
> > > > > +
> > > > > +       vaddr = base_vaddr + args->offset;
> > > > > +
> > > > > +       /* Assumes WC mapping */
> > > > > +       ret = wait_event_interruptible_timeout(
> > > > > +                       gpu->event, *vaddr >= args->value,
> > > > remaining_jiffies);
> > > >
> > >
> > > This needs to do the awkward looking
> > >
> > >   (int64_t)(*data - value) >= 0
> > >
> > > to properly handle the wraparound case.
> > >
> >
> > I think this comparison will run into issues if we allow for 64-bit
> > reference values. For example, if value is ULLONG_MAX, and *data
> > starts at 0 on the first comparison, we'll immediately return.

The comparison will have to account of the number of bits in the
serial number. The (int64_t) (*data - value) works for 64 bit unsigned
serial numbers, but for 32 bit serials as suggested below, we need to
cast to int32_t. It does work though, in the case where value is
ULLONG_MAX and and *data is 0, 0 - ULLONG_MAX is one, which is
correct. The serial numbers wrap around and the distance is computed
modulo 2^64. See
https://en.wikipedia.org/wiki/Serial_number_arithmetic.

> >
> > It's not too much of an issue in fence_completed (msm_fence.c), but
> > in this ioctl, *data can grow at an arbitrary rate. Are we concerned
> > about this?
> >
> > > > +
> > > > > +       if (ret == 0) {
> > > > > +               ret = -ETIMEDOUT;
> > > > > +               goto err_put_vaddr;
> > > > > +       } else if (ret == -ERESTARTSYS) {
> > > > > +               goto err_put_vaddr;
> > > > > +       }
> > > >
> > > > maybe:
> > > >
> > > >  } else {
> > > >    ret = 0;
> > > >  }
> > > >
> > > > and then drop the next three lines?
> > > >
> > > > > +
> > > > > +       msm_gem_put_vaddr(obj);
> > > > > +       drm_gem_object_put_unlocked(obj);
> > > > > +       return 0;
> > > > > +
> > > > > +err_put_vaddr:
> > > > > +       msm_gem_put_vaddr(obj);
> > > > > +err_put_gem_object:
> > > > > +       drm_gem_object_put_unlocked(obj);
> > > > > +       return ret;
> > > > > +}
> > > > > +
> > > > >  static const struct drm_ioctl_desc msm_ioctls[] = {
> > > > >         DRM_IOCTL_DEF_DRV(MSM_GET_PARAM,    msm_ioctl_get_param,
> > > > DRM_RENDER_ALLOW),
> > > > >         DRM_IOCTL_DEF_DRV(MSM_GEM_NEW,      msm_ioctl_gem_new,
> > > > DRM_RENDER_ALLOW),
> > > > > @@ -964,6 +1022,7 @@ static const struct drm_ioctl_desc msm_ioctls[] = {
> > > > >         DRM_IOCTL_DEF_DRV(MSM_SUBMITQUEUE_NEW,
> > > >  msm_ioctl_submitqueue_new,   DRM_RENDER_ALLOW),
> > > > >         DRM_IOCTL_DEF_DRV(MSM_SUBMITQUEUE_CLOSE,
> > > > msm_ioctl_submitqueue_close, DRM_RENDER_ALLOW),
> > > > >         DRM_IOCTL_DEF_DRV(MSM_SUBMITQUEUE_QUERY,
> > > > msm_ioctl_submitqueue_query, DRM_RENDER_ALLOW),
> > > > > +       DRM_IOCTL_DEF_DRV(MSM_WAIT_IOVA, msm_ioctl_wait_iova,
> > > > DRM_RENDER_ALLOW),
> > > > >  };
> > > > >
> > > > >  static const struct vm_operations_struct vm_ops = {
> > > > > diff --git a/include/uapi/drm/msm_drm.h b/include/uapi/drm/msm_drm.h
> > > > > index 0b85ed6a3710..8477f28a4ee1 100644
> > > > > --- a/include/uapi/drm/msm_drm.h
> > > > > +++ b/include/uapi/drm/msm_drm.h
> > > > > @@ -298,6 +298,17 @@ struct drm_msm_submitqueue_query {
> > > > >         __u32 pad;
> > > > >  };
> > > > >
> > > > > +/* This ioctl blocks until the u64 value at bo + offset is greater than
> > > > or
> > > > > + * equal to the reference value.
> > > > > + */
> > > > > +struct drm_msm_wait_iova {
> > > > > +       __u32 handle;          /* in, GEM handle */
> > > > > +       __u32 pad;
> > > > > +       struct drm_msm_timespec timeout;   /* in */
> > > > > +       __u64 offset;          /* offset into bo */
> > > > > +       __u64 value;           /* reference value */
> > > >
> > > > Maybe we should go ahead and add a __u64 mask;
> > > >
> > > > that would let us wait for 32b values as well, and wait for bits in a
> > > > bitmask
> > > >
> > >
> > > I think we'd be OK to just default to 32 bit values instead, since most of
> > > the CP commands that this is intended to work with (CP_EVENT_WRITE,
> > > CP_WAIT_MEM_GTE etc) operate on 32 bit values. We could move 'value' to the
> > > slot right after 'handle' but then we'd not have any pad/reserved fields.
> > > Maybe we keep 'value' 64 bit but restrict it to 32 bits, with an option to
> > > add a 64 bit flag in 'pad' later on?
> > >
> >
> > FWIW, the current usage of this in my mesa MR uses a 64 bit value.
> > There's no super great reason that the available bit is 64 bits and
> > not 32 bits (I think it made the addressing math a bit simpler), but
> > I'm fine with whatever you all decide on here.
> >
>
> I assume you are waiting for a fence value written w/ CP_EVENT_WRITE?
> Or at least that is what I'd recommend.  That would be 32b
>
> BR,
> -R
>
> > > >
> > > > Other than those minor comments, it looks pretty good to me
> > > >
> > > > BR,
> > > > -R
> > > >
> > > > > +};
> > > > > +
> > > > >  #define DRM_MSM_GET_PARAM              0x00
> > > > >  /* placeholder:
> > > > >  #define DRM_MSM_SET_PARAM              0x01
> > > > > @@ -315,6 +326,7 @@ struct drm_msm_submitqueue_query {
> > > > >  #define DRM_MSM_SUBMITQUEUE_NEW        0x0A
> > > > >  #define DRM_MSM_SUBMITQUEUE_CLOSE      0x0B
> > > > >  #define DRM_MSM_SUBMITQUEUE_QUERY      0x0C
> > > > > +#define DRM_MSM_WAIT_IOVA      0x0D
> > > > >
> > > > >  #define DRM_IOCTL_MSM_GET_PARAM        DRM_IOWR(DRM_COMMAND_BASE +
> > > > DRM_MSM_GET_PARAM, struct drm_msm_param)
> > > > >  #define DRM_IOCTL_MSM_GEM_NEW          DRM_IOWR(DRM_COMMAND_BASE +
> > > > DRM_MSM_GEM_NEW, struct drm_msm_gem_new)
> > > > > @@ -327,6 +339,7 @@ struct drm_msm_submitqueue_query {
> > > > >  #define DRM_IOCTL_MSM_SUBMITQUEUE_NEW    DRM_IOWR(DRM_COMMAND_BASE +
> > > > DRM_MSM_SUBMITQUEUE_NEW, struct drm_msm_submitqueue)
> > > > >  #define DRM_IOCTL_MSM_SUBMITQUEUE_CLOSE  DRM_IOW (DRM_COMMAND_BASE +
> > > > DRM_MSM_SUBMITQUEUE_CLOSE, __u32)
> > > > >  #define DRM_IOCTL_MSM_SUBMITQUEUE_QUERY  DRM_IOW (DRM_COMMAND_BASE +
> > > > DRM_MSM_SUBMITQUEUE_QUERY, struct drm_msm_submitqueue_query)
> > > > > +#define DRM_IOCTL_MSM_WAIT_IOVA        DRM_IOW (DRM_COMMAND_BASE +
> > > > DRM_MSM_WAIT_IOVA, struct drm_msm_wait_iova)
> > > > >
> > > > >  #if defined(__cplusplus)
> > > > >  }
> > > > > --
> > > > > 2.25.0.rc1.283.g88dfdc4193-goog
> > > > >
> > > >
> _______________________________________________
> Freedreno mailing list
> Freedreno@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/freedreno
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
