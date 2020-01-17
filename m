Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 445C01410DC
	for <lists+dri-devel@lfdr.de>; Fri, 17 Jan 2020 19:34:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4560E6F8A6;
	Fri, 17 Jan 2020 18:34:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-xd43.google.com (mail-io1-xd43.google.com
 [IPv6:2607:f8b0:4864:20::d43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EC0856F8A4
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Jan 2020 18:34:21 +0000 (UTC)
Received: by mail-io1-xd43.google.com with SMTP id k24so27033390ioc.4
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Jan 2020 10:34:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=basnieuwenhuizen-nl.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to;
 bh=zx509wKxDJB1M2yz9qv1dYGF0ruQQd7DrBGaM7TgGqI=;
 b=eUfnWqS1actbtlcsQYR+E94If9Zo4E1Lzw6C7i4Lk3Yx+0iappmtf+R3lohbJoo2ss
 zyEBwpEwajW1hFYXF5VUr5QoKx2X1tkj1ggFRyMtsU/197mTO7xw6Ast6eDqeQPuz3TP
 vKn0u/ARNSOy+7PWlEP2UG3KneKjJZuFTvgtMKXpH+hMvgjrLav/OXflZJr+t+0oJQTn
 A8WoKL7cWEYCu3trE+U7bLf+Bb94UOVKqRVEbB45Ygm264e5HJsFc7oOJ1AMA3E6PaTA
 1NBF5ifuOoLLhzJ9zx6GOB6zSVKldLyA7V1Cv4BK4MypRx8f0xJYS68hb5tT1vVdpfWn
 JCFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to;
 bh=zx509wKxDJB1M2yz9qv1dYGF0ruQQd7DrBGaM7TgGqI=;
 b=X3muIy5P7FAz70ekO7ynb0bXDvG6fYBJLbNXGpeIl3pwTkVF8BeEtW4xElOTrNqMHg
 1j8/zn4HnVHjlU1TluDagMAFq4bSF92UPiV2NcEv5hs1EDLQ9BOGc7CPCwXQlCsPjpn2
 7G8Fzw2qPdDtBOaSO4+zQWl4BtLMtTYsOu3A7/lFq86covEqrDVBzoz0rq0ysMywY39x
 mKLEBzhqicCRqYXI6yoAU2n0UiYWoWJ7dOlh2Gwt+zqNYPBlJpTX+CMePgg2KxEgC70C
 B2RahROzEPhF1unD3l9EBkXICO45COWyjRNyF5qQR2c5iMowAehE0fKrT9/itRwvuAGH
 aW8Q==
X-Gm-Message-State: APjAAAWrDJec+lVUkqfQo2CArEF9ECxaseg3g8nuGvnfpW5y//wxxKTi
 JOVEJB+SvWX/ph0gKva93uXsyuJR2Q3IcSdUQ76NLA==
X-Google-Smtp-Source: APXvYqzRxJhDnMURHRIUFZNc3RtA6HhRz2pQWgt9Omjhtb1Vr5GycHTbSyCYwYTunCR4doXeGHwcFDbJJEEspZ2+3f4=
X-Received: by 2002:a02:c90a:: with SMTP id t10mr33740293jao.25.1579286061068; 
 Fri, 17 Jan 2020 10:34:21 -0800 (PST)
MIME-Version: 1.0
References: <20200116230417.12076-1-bas@basnieuwenhuizen.nl>
 <20200117181726.GA19854@jcrouse1-lnx.qualcomm.com>
In-Reply-To: <20200117181726.GA19854@jcrouse1-lnx.qualcomm.com>
From: Bas Nieuwenhuizen <bas@basnieuwenhuizen.nl>
Date: Fri, 17 Jan 2020 19:32:27 +0100
Message-ID: <CAP+8YyErHjk07CUGKuYsJyFNc8iL8uGTXSdAb1oMprH180XwyA@mail.gmail.com>
Subject: Re: [PATCH v2] drm/msm: Add syncobj support.
To: Bas Nieuwenhuizen <bas@basnieuwenhuizen.nl>,
 freedreno@lists.freedesktop.org, 
 ML dri-devel <dri-devel@lists.freedesktop.org>
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Jan 17, 2020 at 7:17 PM Jordan Crouse <jcrouse@codeaurora.org> wrote:
>
> On Fri, Jan 17, 2020 at 12:04:17AM +0100, Bas Nieuwenhuizen wrote:
> > This
> >
> > 1) Enables core DRM syncobj support.
> > 2) Adds options to the submission ioctl to wait/signal syncobjs.
> >
> > Just like the wait fence fd, this does inline waits. Using the
> > scheduler would be nice but I believe it is out of scope for
> > this work.
> >
> > Support for timeline syncobjs is implemented and the interface
> > is ready for it, but I'm not enabling it yet until there is
> > some code for turnip to use it.
> >
> > The reset is mostly in there because in the presence of waiting
> > and signalling the same semaphores, resetting them after
> > signalling can become very annoying.
> >
> > v2:
> >   - Fixed style issues
> >   - Removed a cleanup issue in a failure case
> >   - Moved to a copy_from_user per syncobj
>
> A few nits, but nothing serious.  This is looking good, thanks for the quick
> turn around.
>
> > Signed-off-by: Bas Nieuwenhuizen <bas@basnieuwenhuizen.nl>
> > ---
> >  drivers/gpu/drm/msm/msm_drv.c        |   6 +-
> >  drivers/gpu/drm/msm/msm_gem_submit.c | 236 ++++++++++++++++++++++++++-
> >  include/uapi/drm/msm_drm.h           |  24 ++-
> >  3 files changed, 262 insertions(+), 4 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/msm/msm_drv.c b/drivers/gpu/drm/msm/msm_drv.c
> > index c84f0a8b3f2c..5246b41798df 100644
> > --- a/drivers/gpu/drm/msm/msm_drv.c
> > +++ b/drivers/gpu/drm/msm/msm_drv.c
> > @@ -37,9 +37,10 @@
> >   * - 1.4.0 - softpin, MSM_RELOC_BO_DUMP, and GEM_INFO support to set/get
> >   *           GEM object's debug name
> >   * - 1.5.0 - Add SUBMITQUERY_QUERY ioctl
> > + * - 1.6.0 - Syncobj support
> >   */
> >  #define MSM_VERSION_MAJOR    1
> > -#define MSM_VERSION_MINOR    5
> > +#define MSM_VERSION_MINOR    6
> >  #define MSM_VERSION_PATCHLEVEL       0
> >
> >  static const struct drm_mode_config_funcs mode_config_funcs = {
> > @@ -988,7 +989,8 @@ static struct drm_driver msm_driver = {
> >       .driver_features    = DRIVER_GEM |
> >                               DRIVER_RENDER |
> >                               DRIVER_ATOMIC |
> > -                             DRIVER_MODESET,
> > +                             DRIVER_MODESET |
> > +                             DRIVER_SYNCOBJ,
> >       .open               = msm_open,
> >       .postclose           = msm_postclose,
> >       .lastclose          = drm_fb_helper_lastclose,
> > diff --git a/drivers/gpu/drm/msm/msm_gem_submit.c b/drivers/gpu/drm/msm/msm_gem_submit.c
> > index be5327af16fa..6c7f95fc5cfd 100644
> > --- a/drivers/gpu/drm/msm/msm_gem_submit.c
> > +++ b/drivers/gpu/drm/msm/msm_gem_submit.c
> > @@ -8,7 +8,9 @@
> >  #include <linux/sync_file.h>
> >  #include <linux/uaccess.h>
> >
> > +#include <drm/drm_drv.h>
> >  #include <drm/drm_file.h>
> > +#include <drm/drm_syncobj.h>
> >
> >  #include "msm_drv.h"
> >  #include "msm_gpu.h"
> > @@ -394,6 +396,191 @@ static void submit_cleanup(struct msm_gem_submit *submit)
> >       ww_acquire_fini(&submit->ticket);
> >  }
> >
> > +
> > +struct msm_submit_post_dep {
> > +     struct drm_syncobj *syncobj;
> > +     uint64_t point;
> > +     struct dma_fence_chain *chain;
> > +};
> > +
> > +static int msm_wait_deps(struct drm_device *dev,
> > +                         struct drm_file *file,
> > +                         uint64_t in_syncobjs_addr,
> > +                         uint32_t nr_in_syncobjs,
> > +                         uint32_t syncobj_stride,
> > +                         struct msm_ringbuffer *ring,
> > +                         struct drm_syncobj ***syncobjs)
> > +{
> > +     struct drm_msm_gem_submit_syncobj syncobj_desc = {0};
> > +     int ret = 0;
> > +     uint32_t i, j;
> > +
> > +     *syncobjs = kcalloc(nr_in_syncobjs, sizeof(**syncobjs),
> > +                         GFP_KERNEL | __GFP_NOWARN | __GFP_NORETRY);
>
> Perfect - I think this will do everything we want - protect us against OOM death
> but also not introduce artificial constraints on object counts.
>
> > +     if (!syncobjs) {
>
> You should be able to just return -ENOMEM here.
>
> > +             ret = -ENOMEM;
> > +             goto out_syncobjs;
> > +     }
>
> > +
> > +     for (i = 0; i < nr_in_syncobjs; ++i) {
> > +             uint64_t address = in_syncobjs_addr + i * syncobj_stride;
> > +             struct dma_fence *fence;
> > +
> > +             if (copy_from_user(&syncobj_desc,
> > +                                u64_to_user_ptr(address),
> > +                                min(syncobj_stride, sizeof(syncobj_desc)))) {
> > +                     ret = -EFAULT;
> > +                     goto out_syncobjs;
>
> You can just use break here.
>
> > +             }
> > +
> > +             if (syncobj_desc.point &&
> > +                 !drm_core_check_feature(dev, DRIVER_SYNCOBJ_TIMELINE)) {
> > +                     ret = -EOPNOTSUPP;
> > +                     break;
> > +             }
> > +
> > +             if (syncobj_desc.flags & ~MSM_SUBMIT_SYNCOBJ_FLAGS) {
> > +                     ret = -EINVAL;
> > +                     break;
> > +             }
> > +
> > +             ret = drm_syncobj_find_fence(file, syncobj_desc.handle,
> > +                                          syncobj_desc.point, 0, &fence);
> > +             if (ret)
> > +                     break;
> > +
> > +             if (!dma_fence_match_context(fence, ring->fctx->context))
> > +                     ret = dma_fence_wait(fence, true);
> > +
> > +             dma_fence_put(fence);
> > +             if (ret)
> > +                     break;
> > +
> > +             if (syncobj_desc.flags & MSM_SUBMIT_SYNCOBJ_RESET) {
> > +                     (*syncobjs)[i] =
> > +                             drm_syncobj_find(file, syncobj_desc.handle);
> > +                     if (!(*syncobjs)[i]) {
> > +                             ret = -EINVAL;
> > +                             break;
> > +                     }
> > +             }
> > +     }
> > +
> > +out_syncobjs:
> > +     if (ret && *syncobjs) {
> > +             for (j = 0; j < i; ++j) {
>
> You could also walk backwards from i and save having another iterator:
>
> for( ; i >=0; i--)

I thought about that but the slight annoyance is that from the API
perspective they're all unsigned so a >= 0 doesn't really work.

So we have 3 alternatives:

1) check for INT32_MAX and then use signed
2) keep the iterator
3) do { ... } while (i-- != 0);

I think 1 adds extra complexity for no good reason. (unless we want to
implicitly rely on that failing the kmalloc?) Happy to do 3 if we're
happy with a do while construct.

>
> > +                     if ((*syncobjs)[j])
> > +                             drm_syncobj_put((*syncobjs)[j]);
> > +             }
> > +             kfree(*syncobjs);
> > +             *syncobjs = NULL;
> > +     }
> > +     return ret;
>
> if you wanted to you could return syncobjs or ERR_PTR instead of passing it by
> reference. I would probably chose that option personally but it is up to you.

How does this work wrt returning different error codes?

>
> > +}
> > +
> > +static void msm_reset_syncobjs(struct drm_syncobj **syncobjs,
> > +                               uint32_t nr_syncobjs)
> > +{
> > +     uint32_t i;
> > +
> > +     for (i = 0; syncobjs && i < nr_syncobjs; ++i) {
> > +             if (syncobjs[i])
> > +                     drm_syncobj_replace_fence(syncobjs[i], NULL);
> > +     }
> > +}
> > +
> > +static int msm_parse_post_deps(struct drm_device *dev,
> > +                               struct drm_file *file,
> > +                               uint64_t out_syncobjs_addr,
> > +                               uint32_t nr_out_syncobjs,
> > +                            uint32_t syncobj_stride,
> > +                               struct msm_submit_post_dep **post_deps)
> > +{
> > +     int ret = 0;
> > +     uint32_t i, j;
> > +
> > +     *post_deps = kmalloc_array(nr_out_syncobjs, sizeof(**post_deps),
> > +                                GFP_KERNEL | __GFP_NOWARN | __GFP_NORETRY);
> > +     if (!*post_deps) {
> > +             ret = -ENOMEM;
> > +             goto out_syncobjs;
>
> return -ENOMEM works fine.
>
> > +     }
> > +
> > +     for (i = 0; i < nr_out_syncobjs; ++i) {
> > +             uint64_t address = out_syncobjs_addr + i * syncobj_stride;
> > +
> > +             if (copy_from_user(&syncobj_desc,
> > +                                u64_to_user_ptr(address),
> > +                                min(syncobj_stride, sizeof(syncobj_desc)))) {
> > +                     ret = -EFAULT;
> > +                     goto out_syncobjs;
>
> You can break here.
>
> > +             }
> > +
> > +             (*post_deps)[i].point = syncobj_desc.point;
> > +             (*post_deps)[i].chain = NULL;
> > +
> > +             if (syncobj_desc.flags) {
> > +                     ret = -EINVAL;
> > +                     break;
> > +             }
> > +
> > +             if (syncobj_desc.point) {
> > +                     if (!drm_core_check_feature(dev,
> > +                                                 DRIVER_SYNCOBJ_TIMELINE)) {
> > +                             ret = -EOPNOTSUPP;
> > +                             break;
> > +                     }
> > +
> > +                     (*post_deps)[i].chain =
> > +                             kmalloc(sizeof(*(*post_deps)[i].chain),
> > +                                     GFP_KERNEL);
> > +                     if (!(*post_deps)[i].chain) {
> > +                             ret = -ENOMEM;
> > +                             break;
> > +                     }
> > +             }
> > +
> > +             (*post_deps)[i].syncobj =
> > +                     drm_syncobj_find(file, syncobj_desc.handle);
> > +             if (!(*post_deps)[i].syncobj) {
> > +                     ret = -EINVAL;
> > +                     break;
> > +             }
> > +     }
> > +
> > +     if (ret) {
> > +             for (j = 0; j <= i; ++j) {
>
> Same suggest as above, if you would prefer.
>
> > +                     kfree((*post_deps)[j].chain);
> > +                     if ((*post_deps)[j].syncobj)
> > +                             drm_syncobj_put((*post_deps)[j].syncobj);
> > +             }
> > +
> > +             kfree(*post_deps);
> > +             *post_deps = NULL;
> > +     }
> > +
> > +out_syncobjs:
> > +     return ret;
>
> This might also be a good spot to return post_deps / ERR_PTR.
>
> > +}
> > +
> > +static void msm_process_post_deps(struct msm_submit_post_dep *post_deps,
> > +                                  uint32_t count, struct dma_fence *fence)
> > +{
> > +     uint32_t i;
> > +
> > +     for (i = 0; post_deps && i < count; ++i) {
> > +             if (post_deps[i].chain) {
> > +                     drm_syncobj_add_point(post_deps[i].syncobj,
> > +                                           post_deps[i].chain,
> > +                                           fence, post_deps[i].point);
> > +                     post_deps[i].chain = NULL;
> > +             } else {
> > +                     drm_syncobj_replace_fence(post_deps[i].syncobj,
> > +                                               fence);
> > +             }
> > +     }
> > +}
> > +
> >  int msm_ioctl_gem_submit(struct drm_device *dev, void *data,
> >               struct drm_file *file)
> >  {
> > @@ -406,6 +593,8 @@ int msm_ioctl_gem_submit(struct drm_device *dev, void *data,
> >       struct sync_file *sync_file = NULL;
> >       struct msm_gpu_submitqueue *queue;
> >       struct msm_ringbuffer *ring;
> > +     struct msm_submit_post_dep *post_deps = NULL;
> > +     struct drm_syncobj **syncobjs_to_reset = NULL;
> >       int out_fence_fd = -1;
> >       struct pid *pid = get_pid(task_pid(current));
> >       unsigned i;
> > @@ -413,6 +602,9 @@ int msm_ioctl_gem_submit(struct drm_device *dev, void *data,
> >       if (!gpu)
> >               return -ENXIO;
> >
> > +     if (args->pad)
> > +             return -EINVAL;
> > +
>
> >       /* for now, we just have 3d pipe.. eventually this would need to
> >        * be more clever to dispatch to appropriate gpu module:
> >        */
> > @@ -460,9 +652,28 @@ int msm_ioctl_gem_submit(struct drm_device *dev, void *data,
> >                       return ret;
> >       }
> >
> > +     if (args->flags & MSM_SUBMIT_SYNCOBJ_IN) {
> > +             ret = msm_wait_deps(dev, file,
> > +                                 args->in_syncobjs, args->nr_in_syncobjs,
> > +                                 args->syncobj_stride, ring,
>
> If you wanted to, you could just pass args directly to the function so you
> didn't have to take it apart.

I think the advantage here is making it really explicit what part of
args is not used, and I don't feel the number of args has quite gone
out of control yet, but happy to change if insist.

(sorry, not seeing if this is a "you could do that" vs. a "I would
prefer if you do that, politely")

>
> Also, Rob - do we want to do the trick where we return
> sizeof(drm_msm_gem_submit_syncobj) if the input stride is zero?

Do you mean making this an in/out field and modifying it to return the
size if a stride of 0 has been given? If so, I don't see the point,
because userspace would not know what to fill any extra size with
(sure they can 0 initialize the extra part, but the kernel already
does that zero initializing the struct to be copied into).

or do you mean interpreting stride as
sizeof(drm_msm_gem_submit_syncobj) if the input stride is 0? In that
case I think that is just an invitation for userspace to set itself up
for incompatibility issues when the size actually changes. Let's
enforce doing it right.

(or did I misunderstand entirely?)

>
> > +                                 &syncobjs_to_reset);
> > +             if (ret)
> > +                     goto out_post_unlock;
> > +     }
> > +
> > +     if (args->flags & MSM_SUBMIT_SYNCOBJ_OUT) {
> > +             ret = msm_parse_post_deps(dev, file,
> > +                                       args->out_syncobjs,
> > +                                       args->nr_out_syncobjs,
> > +                                       args->syncobj_stride,
>
> And same.
>
> > +                                       &post_deps);
> > +             if (ret)
> > +                     goto out_post_unlock;
> > +     }
> > +
> >       ret = mutex_lock_interruptible(&dev->struct_mutex);
> >       if (ret)
> > -             return ret;
> > +             goto out_post_unlock;
> >
> >       if (args->flags & MSM_SUBMIT_FENCE_FD_OUT) {
> >               out_fence_fd = get_unused_fd_flags(O_CLOEXEC);
> > @@ -586,6 +797,11 @@ int msm_ioctl_gem_submit(struct drm_device *dev, void *data,
> >               args->fence_fd = out_fence_fd;
> >       }
> >
> > +     msm_reset_syncobjs(syncobjs_to_reset, args->nr_in_syncobjs);
> > +     msm_process_post_deps(post_deps, args->nr_out_syncobjs,
> > +                           submit->fence);
> > +
> > +
> >  out:
> >       submit_cleanup(submit);
> >       if (ret)
> > @@ -594,5 +810,23 @@ int msm_ioctl_gem_submit(struct drm_device *dev, void *data,
> >       if (ret && (out_fence_fd >= 0))
> >               put_unused_fd(out_fence_fd);
> >       mutex_unlock(&dev->struct_mutex);
> > +
> > +out_post_unlock:
> > +     if (post_deps) {
> > +             for (i = 0; i < args->nr_out_syncobjs; ++i) {
> > +                     kfree(post_deps[i].chain);
> > +                     drm_syncobj_put(post_deps[i].syncobj);
> > +             }
> > +             kfree(post_deps);
> > +     }
> > +
> > +     if (syncobjs_to_reset) {
> > +             for (i = 0; i < args->nr_in_syncobjs; ++i) {
> > +                     if (syncobjs_to_reset[i])
> > +                             drm_syncobj_put(syncobjs_to_reset[i]);
> > +             }
> > +             kfree(syncobjs_to_reset);
> > +     }
> > +
> >       return ret;
> >  }
> > diff --git a/include/uapi/drm/msm_drm.h b/include/uapi/drm/msm_drm.h
> > index 0b85ed6a3710..19806eb3a8e8 100644
> > --- a/include/uapi/drm/msm_drm.h
> > +++ b/include/uapi/drm/msm_drm.h
> > @@ -217,13 +217,28 @@ struct drm_msm_gem_submit_bo {
> >  #define MSM_SUBMIT_FENCE_FD_IN   0x40000000 /* enable input fence_fd */
> >  #define MSM_SUBMIT_FENCE_FD_OUT  0x20000000 /* enable output fence_fd */
> >  #define MSM_SUBMIT_SUDO          0x10000000 /* run submitted cmds from RB */
> > +#define MSM_SUBMIT_SYNCOBJ_IN    0x08000000 /* enable input syncobj */
> > +#define MSM_SUBMIT_SYNCOBJ_OUT   0x04000000 /* enable output syncobj */
> >  #define MSM_SUBMIT_FLAGS                ( \
> >               MSM_SUBMIT_NO_IMPLICIT   | \
> >               MSM_SUBMIT_FENCE_FD_IN   | \
> >               MSM_SUBMIT_FENCE_FD_OUT  | \
> >               MSM_SUBMIT_SUDO          | \
> > +             MSM_SUBMIT_SYNCOBJ_IN    | \
> > +             MSM_SUBMIT_SYNCOBJ_OUT   | \
> >               0)
> >
> > +#define MSM_SUBMIT_SYNCOBJ_RESET 0x00000001 /* Reset syncobj after wait. */
> > +#define MSM_SUBMIT_SYNCOBJ_FLAGS        ( \
> > +             MSM_SUBMIT_SYNCOBJ_RESET | \
> > +             0)
> > +
> > +struct drm_msm_gem_submit_syncobj {
> > +     __u32 handle;     /* in, syncobj handle. */
> > +     __u32 flags;      /* in, from MSM_SUBMIT_SYNCOBJ_FLAGS */
> > +     __u64 point;      /* in, timepoint for timeline syncobjs. */
> > +};
> > +
> >  /* Each cmdstream submit consists of a table of buffers involved, and
> >   * one or more cmdstream buffers.  This allows for conditional execution
> >   * (context-restore), and IB buffers needed for per tile/bin draw cmds.
> > @@ -236,7 +251,14 @@ struct drm_msm_gem_submit {
> >       __u64 bos;            /* in, ptr to array of submit_bo's */
> >       __u64 cmds;           /* in, ptr to array of submit_cmd's */
> >       __s32 fence_fd;       /* in/out fence fd (see MSM_SUBMIT_FENCE_FD_IN/OUT) */
> > -     __u32 queueid;         /* in, submitqueue id */
> > +     __u32 queueid;        /* in, submitqueue id */
> > +     __u64 in_syncobjs;    /* in, ptr to to array of drm_msm_gem_submit_syncobj */
> > +     __u64 out_syncobjs;   /* in, ptr to to array of drm_msm_gem_submit_syncobj */
> > +     __u32 nr_in_syncobjs; /* in, number of entries in in_syncobj */
> > +     __u32 nr_out_syncobjs; /* in, number of entries in out_syncobj. */
> > +     __u32 syncobj_stride; /* in, stride of syncobj arrays. */
> > +     __u32 pad;            /*in, reserved for future use, always 0. */
> > +
> >  };
> >
> >  /* The normal way to synchronize with the GPU is just to CPU_PREP on
> > --
> > 2.24.1
> >
>
> --
> The Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
> a Linux Foundation Collaborative Project
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
