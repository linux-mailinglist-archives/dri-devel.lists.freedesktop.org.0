Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 121971474E1
	for <lists+dri-devel@lfdr.de>; Fri, 24 Jan 2020 00:37:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C572C6FE9E;
	Thu, 23 Jan 2020 23:37:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-xd41.google.com (mail-io1-xd41.google.com
 [IPv6:2607:f8b0:4864:20::d41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6F8186FE9F
 for <dri-devel@lists.freedesktop.org>; Thu, 23 Jan 2020 23:37:32 +0000 (UTC)
Received: by mail-io1-xd41.google.com with SMTP id c16so128334ioh.6
 for <dri-devel@lists.freedesktop.org>; Thu, 23 Jan 2020 15:37:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=basnieuwenhuizen-nl.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to;
 bh=GLLYRZJYpGC1lhfgRj3AI0Nu6B5GjBlE4+0ck9ILsX4=;
 b=CixPn9EP4A0iflYZBTE3k8KKb5XiWS6JSTPZshBHA5vYzBcmhbRYeWhYmJ+OKjRtxX
 uNwSbaBPS+DfHqLNdtZMazA7BRLbWlNnvJPjuGGqZAZ8rFUqS1iReKsr2z4Lc5Q0HEcA
 zDVEOzEfp2r2n0gRF3ouMtIvAriWV1ttmEKucrU+8iYYV4wOJRTp+kBJ2f7rpRTmAg2K
 Qrb4c4KZxMIv1ycB6j3cwTtmrrrXxNoGSe2C4QUMtf4DYgV68LBV4LNmadilZI3ELw/q
 aVcV+8LgQ4wkKgxIE7T1FUnyf39lLtY2kFlxpyl1ovU2gMoOXJLgF3UQpbXddWnnQOJm
 uv0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to;
 bh=GLLYRZJYpGC1lhfgRj3AI0Nu6B5GjBlE4+0ck9ILsX4=;
 b=VJqHglxO+f0jCgz+yw+eG3wVhqRmWXpEScIW4qBupBMrEBXY4sXJ0WIk5PPbLGXqu7
 BrPvI7Q69qGFHgNRmrHHyXFQnu9Rqa3oPbYlkCkyrN6Mve6Zm0eQ68EiDgfHeh7MjmpI
 EFZ7PLk+5dCJeubKU8ZBgYar/ZY3+BYF90RE/9XPKzch8j8D/5mh8NUg6HDBxyg5Rz2P
 1B4AfPjLJirkMTBnZIhecpuOr0VLtLPjaWtFhVjOBljJZpS2WcEkw8aRmxCLhwvXhKnY
 hwGFRZZeJIfdRHJ3NkkDbBPd7RsRS9BJqKuIk6T36aVNrR2AL/lwTQbRL0SfEBChnVOY
 j/0w==
X-Gm-Message-State: APjAAAWpWkJL6t3BF/aeP5dq+bF9Cgic+NQproqMJGKGEXJh+q+zImPb
 WC4HzxhORgRmSqbPgS3NLxl3veGDqqGqJQpFTIxIof2J
X-Google-Smtp-Source: APXvYqzik7fI4k9mKX5LGXNVsglVf6e7T4BhgtT+HvWR0YrEKkhGQMJl4g24N4gaQQSjhoDQwlTsXeQRrliCmyQi2wI=
X-Received: by 2002:a5d:8cce:: with SMTP id k14mr186571iot.294.1579822651645; 
 Thu, 23 Jan 2020 15:37:31 -0800 (PST)
MIME-Version: 1.0
References: <20200116230417.12076-1-bas@basnieuwenhuizen.nl>
 <20200117181726.GA19854@jcrouse1-lnx.qualcomm.com>
 <CAP+8YyErHjk07CUGKuYsJyFNc8iL8uGTXSdAb1oMprH180XwyA@mail.gmail.com>
 <20200120160639.GA19353@jcrouse1-lnx.qualcomm.com>
In-Reply-To: <20200120160639.GA19353@jcrouse1-lnx.qualcomm.com>
From: Bas Nieuwenhuizen <bas@basnieuwenhuizen.nl>
Date: Fri, 24 Jan 2020 00:35:36 +0100
Message-ID: <CAP+8YyHRwRMVGt1Nr0GvQJG+9vemBQ7Qi02vtJ5rQm9BoJGXqg@mail.gmail.com>
Subject: Re: [Freedreno] [PATCH v2] drm/msm: Add syncobj support.
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

On Mon, Jan 20, 2020 at 5:06 PM Jordan Crouse <jcrouse@codeaurora.org> wrote:
>
> On Fri, Jan 17, 2020 at 07:32:27PM +0100, Bas Nieuwenhuizen wrote:
> > On Fri, Jan 17, 2020 at 7:17 PM Jordan Crouse <jcrouse@codeaurora.org> wrote:
> > >
> > > On Fri, Jan 17, 2020 at 12:04:17AM +0100, Bas Nieuwenhuizen wrote:
> > > > This
> > > >
> > > > 1) Enables core DRM syncobj support.
> > > > 2) Adds options to the submission ioctl to wait/signal syncobjs.
> > > >
> > > > Just like the wait fence fd, this does inline waits. Using the
> > > > scheduler would be nice but I believe it is out of scope for
> > > > this work.
> > > >
> > > > Support for timeline syncobjs is implemented and the interface
> > > > is ready for it, but I'm not enabling it yet until there is
> > > > some code for turnip to use it.
> > > >
> > > > The reset is mostly in there because in the presence of waiting
> > > > and signalling the same semaphores, resetting them after
> > > > signalling can become very annoying.
> > > >
> > > > v2:
> > > >   - Fixed style issues
> > > >   - Removed a cleanup issue in a failure case
> > > >   - Moved to a copy_from_user per syncobj
> > >
> > > A few nits, but nothing serious.  This is looking good, thanks for the quick
> > > turn around.
> > >
> > > > Signed-off-by: Bas Nieuwenhuizen <bas@basnieuwenhuizen.nl>
>
> <snip>
>
> > > > +out_syncobjs:
> > > > +     if (ret && *syncobjs) {
> > > > +             for (j = 0; j < i; ++j) {
> > >
> > > You could also walk backwards from i and save having another iterator:
> > >
> > > for( ; i >=0; i--)
> >
> > I thought about that but the slight annoyance is that from the API
> > perspective they're all unsigned so a >= 0 doesn't really work.
>
>
> > So we have 3 alternatives:
> >
> > 1) check for INT32_MAX and then use signed
> > 2) keep the iterator
> > 3) do { ... } while (i-- != 0);
> >
> > I think 1 adds extra complexity for no good reason. (unless we want to
> > implicitly rely on that failing the kmalloc?) Happy to do 3 if we're
> > happy with a do while construct.
>
> Ah, good point on the unsigned-ness. Keeping the iterator is fine.  No reason to
> try to be overly clever.
>
> >
> > >
> > > > +                     if ((*syncobjs)[j])
> > > > +                             drm_syncobj_put((*syncobjs)[j]);
> > > > +             }
> > > > +             kfree(*syncobjs);
> > > > +             *syncobjs = NULL;
> > > > +     }
> > > > +     return ret;
> > >
> > > if you wanted to you could return syncobjs or ERR_PTR instead of passing it by
> > > reference. I would probably chose that option personally but it is up to you.
> >
> > How does this work wrt returning different error codes?
>
> For each error code, you would use the ERR_PTR() macro, so for example,
>
> return ERR_PTR(-ENOMEM);
>
> and then for the success path you would return the actual pointer,
>
> return syncobjs;
>
> The caller would use the IS_ERR() macro to check the return value. It can also
> get the error code back with PTR_ERR() to send to the upper levels.
>
> It is up to you. I personally like using ERR_PTR() but as long as the code works
> whichever method you choose is fine by me.
> > >
> > > > +}
> > > > +
> > > > +static void msm_reset_syncobjs(struct drm_syncobj **syncobjs,
> > > > +                               uint32_t nr_syncobjs)
> > > > +{
> > > > +     uint32_t i;
> > > > +
> > > > +     for (i = 0; syncobjs && i < nr_syncobjs; ++i) {
> > > > +             if (syncobjs[i])
> > > > +                     drm_syncobj_replace_fence(syncobjs[i], NULL);
> > > > +     }
> > > > +}
> > > > +
> > > > +static int msm_parse_post_deps(struct drm_device *dev,
> > > > +                               struct drm_file *file,
> > > > +                               uint64_t out_syncobjs_addr,
> > > > +                               uint32_t nr_out_syncobjs,
> > > > +                            uint32_t syncobj_stride,
> > > > +                               struct msm_submit_post_dep **post_deps)
> > > > +{
> > > > +     int ret = 0;
> > > > +     uint32_t i, j;
> > > > +
> > > > +     *post_deps = kmalloc_array(nr_out_syncobjs, sizeof(**post_deps),
> > > > +                                GFP_KERNEL | __GFP_NOWARN | __GFP_NORETRY);
> > > > +     if (!*post_deps) {
> > > > +             ret = -ENOMEM;
> > > > +             goto out_syncobjs;
> > >
> > > return -ENOMEM works fine.
> > >
> > > > +     }
> > > > +
> > > > +     for (i = 0; i < nr_out_syncobjs; ++i) {
> > > > +             uint64_t address = out_syncobjs_addr + i * syncobj_stride;
> > > > +
> > > > +             if (copy_from_user(&syncobj_desc,
> > > > +                                u64_to_user_ptr(address),
> > > > +                                min(syncobj_stride, sizeof(syncobj_desc)))) {
> > > > +                     ret = -EFAULT;
> > > > +                     goto out_syncobjs;
> > >
> > > You can break here.
> > >
> > > > +             }
> > > > +
> > > > +             (*post_deps)[i].point = syncobj_desc.point;
> > > > +             (*post_deps)[i].chain = NULL;
> > > > +
> > > > +             if (syncobj_desc.flags) {
> > > > +                     ret = -EINVAL;
> > > > +                     break;
> > > > +             }
> > > > +
> > > > +             if (syncobj_desc.point) {
> > > > +                     if (!drm_core_check_feature(dev,
> > > > +                                                 DRIVER_SYNCOBJ_TIMELINE)) {
> > > > +                             ret = -EOPNOTSUPP;
> > > > +                             break;
> > > > +                     }
> > > > +
> > > > +                     (*post_deps)[i].chain =
> > > > +                             kmalloc(sizeof(*(*post_deps)[i].chain),
> > > > +                                     GFP_KERNEL);
> > > > +                     if (!(*post_deps)[i].chain) {
> > > > +                             ret = -ENOMEM;
> > > > +                             break;
> > > > +                     }
> > > > +             }
> > > > +
> > > > +             (*post_deps)[i].syncobj =
> > > > +                     drm_syncobj_find(file, syncobj_desc.handle);
> > > > +             if (!(*post_deps)[i].syncobj) {
> > > > +                     ret = -EINVAL;
> > > > +                     break;
> > > > +             }
> > > > +     }
> > > > +
> > > > +     if (ret) {
> > > > +             for (j = 0; j <= i; ++j) {
> > >
> > > Same suggest as above, if you would prefer.
> > >
> > > > +                     kfree((*post_deps)[j].chain);
> > > > +                     if ((*post_deps)[j].syncobj)
> > > > +                             drm_syncobj_put((*post_deps)[j].syncobj);
> > > > +             }
> > > > +
> > > > +             kfree(*post_deps);
> > > > +             *post_deps = NULL;
> > > > +     }
> > > > +
> > > > +out_syncobjs:
> > > > +     return ret;
> > >
> > > This might also be a good spot to return post_deps / ERR_PTR.
> > >
> > > > +}
> > > > +
> > > > +static void msm_process_post_deps(struct msm_submit_post_dep *post_deps,
> > > > +                                  uint32_t count, struct dma_fence *fence)
> > > > +{
> > > > +     uint32_t i;
> > > > +
> > > > +     for (i = 0; post_deps && i < count; ++i) {
> > > > +             if (post_deps[i].chain) {
> > > > +                     drm_syncobj_add_point(post_deps[i].syncobj,
> > > > +                                           post_deps[i].chain,
> > > > +                                           fence, post_deps[i].point);
> > > > +                     post_deps[i].chain = NULL;
> > > > +             } else {
> > > > +                     drm_syncobj_replace_fence(post_deps[i].syncobj,
> > > > +                                               fence);
> > > > +             }
> > > > +     }
> > > > +}
> > > > +
> > > >  int msm_ioctl_gem_submit(struct drm_device *dev, void *data,
> > > >               struct drm_file *file)
> > > >  {
> > > > @@ -406,6 +593,8 @@ int msm_ioctl_gem_submit(struct drm_device *dev, void *data,
> > > >       struct sync_file *sync_file = NULL;
> > > >       struct msm_gpu_submitqueue *queue;
> > > >       struct msm_ringbuffer *ring;
> > > > +     struct msm_submit_post_dep *post_deps = NULL;
> > > > +     struct drm_syncobj **syncobjs_to_reset = NULL;
> > > >       int out_fence_fd = -1;
> > > >       struct pid *pid = get_pid(task_pid(current));
> > > >       unsigned i;
> > > > @@ -413,6 +602,9 @@ int msm_ioctl_gem_submit(struct drm_device *dev, void *data,
> > > >       if (!gpu)
> > > >               return -ENXIO;
> > > >
> > > > +     if (args->pad)
> > > > +             return -EINVAL;
> > > > +
> > >
> > > >       /* for now, we just have 3d pipe.. eventually this would need to
> > > >        * be more clever to dispatch to appropriate gpu module:
> > > >        */
> > > > @@ -460,9 +652,28 @@ int msm_ioctl_gem_submit(struct drm_device *dev, void *data,
> > > >                       return ret;
> > > >       }
> > > >
> > > > +     if (args->flags & MSM_SUBMIT_SYNCOBJ_IN) {
> > > > +             ret = msm_wait_deps(dev, file,
> > > > +                                 args->in_syncobjs, args->nr_in_syncobjs,
> > > > +                                 args->syncobj_stride, ring,
> > >
> > > If you wanted to, you could just pass args directly to the function so you
> > > didn't have to take it apart.
> >
> > I think the advantage here is making it really explicit what part of
> > args is not used, and I don't feel the number of args has quite gone
> > out of control yet, but happy to change if insist.
> >
> > (sorry, not seeing if this is a "you could do that" vs. a "I would
> > prefer if you do that, politely")
>
> This was a "you could do that". I try to not be too angry about matters of
> personal coding preference.
>
> > >
> > > Also, Rob - do we want to do the trick where we return
> > > sizeof(drm_msm_gem_submit_syncobj) if the input stride is zero?
> >
> > Do you mean making this an in/out field and modifying it to return the
> > size if a stride of 0 has been given? If so, I don't see the point,
> > because userspace would not know what to fill any extra size with
> > (sure they can 0 initialize the extra part, but the kernel already
> > does that zero initializing the struct to be copied into).
> >
> > or do you mean interpreting stride as
> > sizeof(drm_msm_gem_submit_syncobj) if the input stride is 0? In that
> > case I think that is just an invitation for userspace to set itself up
> > for incompatibility issues when the size actually changes. Let's
> > enforce doing it right.
> >
> > (or did I misunderstand entirely?)
>
> The general idea is to build in a bit of compatibility for user space. Say for
> example that we add a new member to drm_mrm_gem_submit_syncobj and add support
> for it in the kernel and user space.  And then later the userspace library is
> used with an older kernel that (for the purposes of this experiment) supports
> the syncobj interface but not the expanded struct. If user space queried the
> size of the struct it could use the returned size from the kernel to determine
> if the expanded support was there or not. We do something similar to this for
> submitqueue queries [1].
>
> I couched it as a question because I'm not sure if that sort of query would
> be useful here and I'm not sure if somebody would go to the effort of setting
> up a (partial) submit just for the query, but we've been working on making
> ourselves more resilient so I figured I would raise the point.

So I think the driver version is enough here. For AMDGPU this has been
working quite nicely. Furthermore:

1) if the kernel returns a bigger size than last known app size, then
the app does not know what to fill it with, and can't do anything more
useful than just filling with zeros. Here the kernel does it anyway by
zero-initializing the entire struct before the copy_from_user.
2) if the kernel returns a smaller size than the last known app size
then some app-known feature is not supported. Now the app has to
figure out from the size what features are supported, which is kind of
ugly.
3) if the sizes are equal we still don't know what features are
supported as e.g. adding a flag does not change size.

I think the driver version adequately handles all 3 cases, and saves a
dummy call that makes for cheaper application startup.

(again, if there ideas about applying this widely in the driver, happy
to comply)
>
> [1] https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/drivers/gpu/drm/msm/msm_submitqueue.c#n122
>
> Jordan
>
> <snip>
>
> --
> The Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
> a Linux Foundation Collaborative Project
> _______________________________________________
> Freedreno mailing list
> Freedreno@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/freedreno
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
