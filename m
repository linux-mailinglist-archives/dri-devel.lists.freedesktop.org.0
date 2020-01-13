Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D72913A2DB
	for <lists+dri-devel@lfdr.de>; Tue, 14 Jan 2020 09:20:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C9A056E31A;
	Tue, 14 Jan 2020 08:19:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ua1-x964.google.com (mail-ua1-x964.google.com
 [IPv6:2607:f8b0:4864:20::964])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 397F489F33
 for <dri-devel@lists.freedesktop.org>; Mon, 13 Jan 2020 22:55:35 +0000 (UTC)
Received: by mail-ua1-x964.google.com with SMTP id f7so4039604uaa.8
 for <dri-devel@lists.freedesktop.org>; Mon, 13 Jan 2020 14:55:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=brkho-com.20150623.gappssmtp.com; s=20150623;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=g7dOkwXJYiQUdnpC2HuSkz7V4G5v0hEXZF+cQ5fngFo=;
 b=uZoTcXNATiNl3vC+Ll2Vg9zacWgDe7+i84o033DFeQ0gaJnuhXnPSGWn8XdLY2tzDS
 A2p7Bd5mU69VKtY8fNjg6jT0Y6CPv690Gx4tNSXDj/fjXhwNpobsUVk3Vye43dJeFjNo
 WaD7G3Q+DDXykKtDebqRwttGnLBxI4q5MrNWAhcrRLpax2VR07NeXuzspP44P/+Dpr85
 mTYIFmsHrXIGRijsNWzxG4IN0LSXCG9v2hyqxanNkF8wt/wz7uezwLVcGrv3MdCqmDDT
 G8P+GqTRMEVg48OoAJ8qDHrUqvI44Ff8+8kTlLqSYxY3TTg8SFSX6tVS5DYbb6Q8z7zE
 VFGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=g7dOkwXJYiQUdnpC2HuSkz7V4G5v0hEXZF+cQ5fngFo=;
 b=eGxVVRR3wt3sBVFtHm7PJ1Pl5oGuAfIvkD0uBGizt48FgaW2RoiwXVuaO5+LCUCWut
 ECuPKPelP5ZYXzJV2H4KljwXaMIljklll0A4L/AM3W8E1nageRGJj+br+pLQEHvmKSFD
 SAWpHNDPjflmrhR+sFc03fyR2b8uznlUYt8I8TDHa7SIafP3QrkFcoTGbZPxl2v/NUeJ
 Lj1mh4sgJ5kCG3Wg/hvdnaiciRFxF39yRDOfH1bnvJVyKmH3jd3LPh42aSDxiicZGd6S
 +lShLfv/5H04Vqc+wFQV9iKsPetUdGV9F/42Q6UhZMFxmDYGP1CgNXq/kpSq35uWQWlQ
 wZzw==
X-Gm-Message-State: APjAAAUjkKtOovL/51GqPouXnTXj1t0uvTlRdYWCSpYZ710YY9FXNbG3
 tK117oUr0nlEllAycZVdfMZv9HRfquKOjvu4HDG/HrLwcjZC+w==
X-Google-Smtp-Source: APXvYqyRUPdh2abELUHZ9er58ZCf8PytVC2W6+5/xgEXfLBLijGcMQ/n2XemQ5khHOL7V3Q5okGb0ZYb3sH+
X-Received: by 2002:ab0:7719:: with SMTP id z25mr8873495uaq.115.1578956134219; 
 Mon, 13 Jan 2020 14:55:34 -0800 (PST)
Received: from google.com ([100.118.32.120])
 by smtp-relay.gmail.com with ESMTPS id q184sm1338129vkh.9.2020.01.13.14.55.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 13 Jan 2020 14:55:34 -0800 (PST)
X-Relaying-Domain: brkho.com
Date: Mon, 13 Jan 2020 17:55:17 -0500
From: Brian Ho <brian@brkho.com>
To: Kristian Kristensen <hoegsberg@google.com>
Subject: Re: [PATCH 2/2] drm/msm: Add MSM_WAIT_IOVA ioctl
Message-ID: <20200113225516.GA157345@google.com>
References: <20200113153605.52350-1-brian@brkho.com>
 <20200113153605.52350-3-brian@brkho.com>
 <CAJs_Fx48B-C8GEeAmPaqGAqAOTR2dT0csg8W=TRyULOfy=1=VQ@mail.gmail.com>
 <CAOPc6Tn8CWVzcLoJOGmn3CW6B9FMKf_-NzE8TpwDHsPfoQDaQQ@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAOPc6Tn8CWVzcLoJOGmn3CW6B9FMKf_-NzE8TpwDHsPfoQDaQQ@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Mailman-Approved-At: Tue, 14 Jan 2020 08:19:25 +0000
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
Cc: Rob Clark <robdclark@chromium.org>, David Airlie <airlied@linux.ie>,
 freedreno <freedreno@lists.freedesktop.org>,
 open list <linux-kernel@vger.kernel.org>,
 "open list:DRM DRIVER FOR MSM ADRENO GPU" <dri-devel@lists.freedesktop.org>,
 "open list:DRM DRIVER FOR MSM ADRENO GPU" <linux-arm-msm@vger.kernel.org>,
 hoegsberg <hoegsberg@chromium.org>, Sean Paul <sean@poorly.run>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Jan 13, 2020 at 09:57:43AM -0800, Kristian Kristensen wrote:
> On Mon, Jan 13, 2020 at 8:25 AM Rob Clark <robdclark@chromium.org> wrote:
> 
> > On Mon, Jan 13, 2020 at 7:37 AM Brian Ho <brian@brkho.com> wrote:
> > >
> > > Implements an ioctl to wait until a value at a given iova is greater
> > > than or equal to a supplied value.
> > >
> > > This will initially be used by turnip (open-source Vulkan driver for
> > > QC in mesa) for occlusion queries where the userspace driver can
> > > block on a query becoming available before continuing via
> > > vkGetQueryPoolResults.
> > >
> > > Signed-off-by: Brian Ho <brian@brkho.com>
> > > ---
> > >  drivers/gpu/drm/msm/msm_drv.c | 63 +++++++++++++++++++++++++++++++++--
> > >  include/uapi/drm/msm_drm.h    | 13 ++++++++
> > >  2 files changed, 74 insertions(+), 2 deletions(-)
> > >
> > > diff --git a/drivers/gpu/drm/msm/msm_drv.c
> > b/drivers/gpu/drm/msm/msm_drv.c
> > > index c84f0a8b3f2c..dcc46874a5a2 100644
> > > --- a/drivers/gpu/drm/msm/msm_drv.c
> > > +++ b/drivers/gpu/drm/msm/msm_drv.c
> > > @@ -36,10 +36,11 @@
> > >   *           MSM_GEM_INFO ioctl.
> > >   * - 1.4.0 - softpin, MSM_RELOC_BO_DUMP, and GEM_INFO support to set/get
> > >   *           GEM object's debug name
> > > - * - 1.5.0 - Add SUBMITQUERY_QUERY ioctl
> > > + * - 1.5.0 - Add SUBMITQUEUE_QUERY ioctl
> > > + * - 1.6.0 - Add WAIT_IOVA ioctl
> > >   */
> > >  #define MSM_VERSION_MAJOR      1
> > > -#define MSM_VERSION_MINOR      5
> > > +#define MSM_VERSION_MINOR      6
> > >  #define MSM_VERSION_PATCHLEVEL 0
> > >
> > >  static const struct drm_mode_config_funcs mode_config_funcs = {
> > > @@ -952,6 +953,63 @@ static int msm_ioctl_submitqueue_close(struct
> > drm_device *dev, void *data,
> > >         return msm_submitqueue_remove(file->driver_priv, id);
> > >  }
> > >
> > > +static int msm_ioctl_wait_iova(struct drm_device *dev, void *data,
> > > +               struct drm_file *file)
> > > +{
> > > +       struct msm_drm_private *priv = dev->dev_private;
> > > +       struct drm_gem_object *obj;
> > > +       struct drm_msm_wait_iova *args = data;
> > > +       ktime_t timeout = to_ktime(args->timeout);
> > > +       unsigned long remaining_jiffies = timeout_to_jiffies(&timeout);
> > > +       struct msm_gpu *gpu = priv->gpu;
> > > +       void *base_vaddr;
> > > +       uint64_t *vaddr;
> > > +       int ret;
> > > +
> > > +       if (args->pad)
> > > +               return -EINVAL;
> > > +
> > > +       if (!gpu)
> > > +               return 0;
> >
> > hmm, I'm not sure we should return zero in this case.. maybe -ENODEV?
> >
> > > +
> > > +       obj = drm_gem_object_lookup(file, args->handle);
> > > +       if (!obj)
> > > +               return -ENOENT;
> > > +
> > > +       base_vaddr = msm_gem_get_vaddr(obj);
> > > +       if (IS_ERR(base_vaddr)) {
> > > +               ret = PTR_ERR(base_vaddr);
> > > +               goto err_put_gem_object;
> > > +       }
> > > +       if (args->offset + sizeof(*vaddr) > obj->size) {
> > > +               ret = -EINVAL;
> > > +               goto err_put_vaddr;
> > > +       }
> > > +
> > > +       vaddr = base_vaddr + args->offset;
> > > +
> > > +       /* Assumes WC mapping */
> > > +       ret = wait_event_interruptible_timeout(
> > > +                       gpu->event, *vaddr >= args->value,
> > remaining_jiffies);
> >
> 
> This needs to do the awkward looking
> 
>   (int64_t)(*data - value) >= 0
> 
> to properly handle the wraparound case.
>

I think this comparison will run into issues if we allow for 64-bit
reference values. For example, if value is ULLONG_MAX, and *data
starts at 0 on the first comparison, we'll immediately return.

It's not too much of an issue in fence_completed (msm_fence.c), but
in this ioctl, *data can grow at an arbitrary rate. Are we concerned
about this?

> > +
> > > +       if (ret == 0) {
> > > +               ret = -ETIMEDOUT;
> > > +               goto err_put_vaddr;
> > > +       } else if (ret == -ERESTARTSYS) {
> > > +               goto err_put_vaddr;
> > > +       }
> >
> > maybe:
> >
> >  } else {
> >    ret = 0;
> >  }
> >
> > and then drop the next three lines?
> >
> > > +
> > > +       msm_gem_put_vaddr(obj);
> > > +       drm_gem_object_put_unlocked(obj);
> > > +       return 0;
> > > +
> > > +err_put_vaddr:
> > > +       msm_gem_put_vaddr(obj);
> > > +err_put_gem_object:
> > > +       drm_gem_object_put_unlocked(obj);
> > > +       return ret;
> > > +}
> > > +
> > >  static const struct drm_ioctl_desc msm_ioctls[] = {
> > >         DRM_IOCTL_DEF_DRV(MSM_GET_PARAM,    msm_ioctl_get_param,
> > DRM_RENDER_ALLOW),
> > >         DRM_IOCTL_DEF_DRV(MSM_GEM_NEW,      msm_ioctl_gem_new,
> > DRM_RENDER_ALLOW),
> > > @@ -964,6 +1022,7 @@ static const struct drm_ioctl_desc msm_ioctls[] = {
> > >         DRM_IOCTL_DEF_DRV(MSM_SUBMITQUEUE_NEW,
> >  msm_ioctl_submitqueue_new,   DRM_RENDER_ALLOW),
> > >         DRM_IOCTL_DEF_DRV(MSM_SUBMITQUEUE_CLOSE,
> > msm_ioctl_submitqueue_close, DRM_RENDER_ALLOW),
> > >         DRM_IOCTL_DEF_DRV(MSM_SUBMITQUEUE_QUERY,
> > msm_ioctl_submitqueue_query, DRM_RENDER_ALLOW),
> > > +       DRM_IOCTL_DEF_DRV(MSM_WAIT_IOVA, msm_ioctl_wait_iova,
> > DRM_RENDER_ALLOW),
> > >  };
> > >
> > >  static const struct vm_operations_struct vm_ops = {
> > > diff --git a/include/uapi/drm/msm_drm.h b/include/uapi/drm/msm_drm.h
> > > index 0b85ed6a3710..8477f28a4ee1 100644
> > > --- a/include/uapi/drm/msm_drm.h
> > > +++ b/include/uapi/drm/msm_drm.h
> > > @@ -298,6 +298,17 @@ struct drm_msm_submitqueue_query {
> > >         __u32 pad;
> > >  };
> > >
> > > +/* This ioctl blocks until the u64 value at bo + offset is greater than
> > or
> > > + * equal to the reference value.
> > > + */
> > > +struct drm_msm_wait_iova {
> > > +       __u32 handle;          /* in, GEM handle */
> > > +       __u32 pad;
> > > +       struct drm_msm_timespec timeout;   /* in */
> > > +       __u64 offset;          /* offset into bo */
> > > +       __u64 value;           /* reference value */
> >
> > Maybe we should go ahead and add a __u64 mask;
> >
> > that would let us wait for 32b values as well, and wait for bits in a
> > bitmask
> >
> 
> I think we'd be OK to just default to 32 bit values instead, since most of
> the CP commands that this is intended to work with (CP_EVENT_WRITE,
> CP_WAIT_MEM_GTE etc) operate on 32 bit values. We could move 'value' to the
> slot right after 'handle' but then we'd not have any pad/reserved fields.
> Maybe we keep 'value' 64 bit but restrict it to 32 bits, with an option to
> add a 64 bit flag in 'pad' later on?
> 

FWIW, the current usage of this in my mesa MR uses a 64 bit value.
There's no super great reason that the available bit is 64 bits and
not 32 bits (I think it made the addressing math a bit simpler), but
I'm fine with whatever you all decide on here.

> >
> > Other than those minor comments, it looks pretty good to me
> >
> > BR,
> > -R
> >
> > > +};
> > > +
> > >  #define DRM_MSM_GET_PARAM              0x00
> > >  /* placeholder:
> > >  #define DRM_MSM_SET_PARAM              0x01
> > > @@ -315,6 +326,7 @@ struct drm_msm_submitqueue_query {
> > >  #define DRM_MSM_SUBMITQUEUE_NEW        0x0A
> > >  #define DRM_MSM_SUBMITQUEUE_CLOSE      0x0B
> > >  #define DRM_MSM_SUBMITQUEUE_QUERY      0x0C
> > > +#define DRM_MSM_WAIT_IOVA      0x0D
> > >
> > >  #define DRM_IOCTL_MSM_GET_PARAM        DRM_IOWR(DRM_COMMAND_BASE +
> > DRM_MSM_GET_PARAM, struct drm_msm_param)
> > >  #define DRM_IOCTL_MSM_GEM_NEW          DRM_IOWR(DRM_COMMAND_BASE +
> > DRM_MSM_GEM_NEW, struct drm_msm_gem_new)
> > > @@ -327,6 +339,7 @@ struct drm_msm_submitqueue_query {
> > >  #define DRM_IOCTL_MSM_SUBMITQUEUE_NEW    DRM_IOWR(DRM_COMMAND_BASE +
> > DRM_MSM_SUBMITQUEUE_NEW, struct drm_msm_submitqueue)
> > >  #define DRM_IOCTL_MSM_SUBMITQUEUE_CLOSE  DRM_IOW (DRM_COMMAND_BASE +
> > DRM_MSM_SUBMITQUEUE_CLOSE, __u32)
> > >  #define DRM_IOCTL_MSM_SUBMITQUEUE_QUERY  DRM_IOW (DRM_COMMAND_BASE +
> > DRM_MSM_SUBMITQUEUE_QUERY, struct drm_msm_submitqueue_query)
> > > +#define DRM_IOCTL_MSM_WAIT_IOVA        DRM_IOW (DRM_COMMAND_BASE +
> > DRM_MSM_WAIT_IOVA, struct drm_msm_wait_iova)
> > >
> > >  #if defined(__cplusplus)
> > >  }
> > > --
> > > 2.25.0.rc1.283.g88dfdc4193-goog
> > >
> >
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
