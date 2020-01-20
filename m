Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 764C5142F3F
	for <lists+dri-devel@lfdr.de>; Mon, 20 Jan 2020 17:06:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D92216E9ED;
	Mon, 20 Jan 2020 16:06:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail25.static.mailgun.info (mail25.static.mailgun.info
 [104.130.122.25])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 88CD46E9EC
 for <dri-devel@lists.freedesktop.org>; Mon, 20 Jan 2020 16:06:48 +0000 (UTC)
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1579536408; h=In-Reply-To: Content-Type: MIME-Version:
 References: Message-ID: Subject: Cc: To: From: Date: Sender;
 bh=nlffCl3STfYmqgTS7203lXg1fzzQEMDeDDCr4puFepE=;
 b=pYMT7fXCmG4/6Fs3ZE1pAVJv4NaGBCKpY+7uXT00P4/k3fRuExy3cxNnBMe69SpQwWDRtVvm
 XNkL+kpmauP3aZ8FkBFaa5X/7j1QEagiMICHNis7SIbD6Sne+ykd3N7AzV6EtJet6fjVvDFA
 ls99ohz7oI11k/r0ddgVbPXXRYk=
X-Mailgun-Sending-Ip: 104.130.122.25
X-Mailgun-Sid: WyJkOTU5ZSIsICJkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnIiwgImJlOWU0YSJd
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171])
 by mxa.mailgun.org with ESMTP id 5e25d017.7fd56066f490-smtp-out-n01;
 Mon, 20 Jan 2020 16:06:47 -0000 (UTC)
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id E9B11C43383; Mon, 20 Jan 2020 16:06:46 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
 aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE
 autolearn=ham autolearn_force=no version=3.4.0
Received: from jcrouse1-lnx.qualcomm.com (i-global254.qualcomm.com
 [199.106.103.254])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: jcrouse)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id BEC28C433CB;
 Mon, 20 Jan 2020 16:06:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org BEC28C433CB
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 spf=none smtp.mailfrom=jcrouse@codeaurora.org
Date: Mon, 20 Jan 2020 09:06:40 -0700
From: Jordan Crouse <jcrouse@codeaurora.org>
To: Bas Nieuwenhuizen <bas@basnieuwenhuizen.nl>
Subject: Re: [Freedreno] [PATCH v2] drm/msm: Add syncobj support.
Message-ID: <20200120160639.GA19353@jcrouse1-lnx.qualcomm.com>
Mail-Followup-To: Bas Nieuwenhuizen <bas@basnieuwenhuizen.nl>,
 freedreno@lists.freedesktop.org,
 ML dri-devel <dri-devel@lists.freedesktop.org>
References: <20200116230417.12076-1-bas@basnieuwenhuizen.nl>
 <20200117181726.GA19854@jcrouse1-lnx.qualcomm.com>
 <CAP+8YyErHjk07CUGKuYsJyFNc8iL8uGTXSdAb1oMprH180XwyA@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAP+8YyErHjk07CUGKuYsJyFNc8iL8uGTXSdAb1oMprH180XwyA@mail.gmail.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
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
Cc: freedreno@lists.freedesktop.org,
 ML dri-devel <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Jan 17, 2020 at 07:32:27PM +0100, Bas Nieuwenhuizen wrote:
> On Fri, Jan 17, 2020 at 7:17 PM Jordan Crouse <jcrouse@codeaurora.org> wrote:
> >
> > On Fri, Jan 17, 2020 at 12:04:17AM +0100, Bas Nieuwenhuizen wrote:
> > > This
> > >
> > > 1) Enables core DRM syncobj support.
> > > 2) Adds options to the submission ioctl to wait/signal syncobjs.
> > >
> > > Just like the wait fence fd, this does inline waits. Using the
> > > scheduler would be nice but I believe it is out of scope for
> > > this work.
> > >
> > > Support for timeline syncobjs is implemented and the interface
> > > is ready for it, but I'm not enabling it yet until there is
> > > some code for turnip to use it.
> > >
> > > The reset is mostly in there because in the presence of waiting
> > > and signalling the same semaphores, resetting them after
> > > signalling can become very annoying.
> > >
> > > v2:
> > >   - Fixed style issues
> > >   - Removed a cleanup issue in a failure case
> > >   - Moved to a copy_from_user per syncobj
> >
> > A few nits, but nothing serious.  This is looking good, thanks for the quick
> > turn around.
> >
> > > Signed-off-by: Bas Nieuwenhuizen <bas@basnieuwenhuizen.nl>

<snip>

> > > +out_syncobjs:
> > > +     if (ret && *syncobjs) {
> > > +             for (j = 0; j < i; ++j) {
> >
> > You could also walk backwards from i and save having another iterator:
> >
> > for( ; i >=0; i--)
> 
> I thought about that but the slight annoyance is that from the API
> perspective they're all unsigned so a >= 0 doesn't really work.


> So we have 3 alternatives:
> 
> 1) check for INT32_MAX and then use signed
> 2) keep the iterator
> 3) do { ... } while (i-- != 0);
> 
> I think 1 adds extra complexity for no good reason. (unless we want to
> implicitly rely on that failing the kmalloc?) Happy to do 3 if we're
> happy with a do while construct.

Ah, good point on the unsigned-ness. Keeping the iterator is fine.  No reason to
try to be overly clever.

> 
> >
> > > +                     if ((*syncobjs)[j])
> > > +                             drm_syncobj_put((*syncobjs)[j]);
> > > +             }
> > > +             kfree(*syncobjs);
> > > +             *syncobjs = NULL;
> > > +     }
> > > +     return ret;
> >
> > if you wanted to you could return syncobjs or ERR_PTR instead of passing it by
> > reference. I would probably chose that option personally but it is up to you.
> 
> How does this work wrt returning different error codes?

For each error code, you would use the ERR_PTR() macro, so for example,

return ERR_PTR(-ENOMEM);

and then for the success path you would return the actual pointer,

return syncobjs;

The caller would use the IS_ERR() macro to check the return value. It can also
get the error code back with PTR_ERR() to send to the upper levels.

It is up to you. I personally like using ERR_PTR() but as long as the code works
whichever method you choose is fine by me.
> >
> > > +}
> > > +
> > > +static void msm_reset_syncobjs(struct drm_syncobj **syncobjs,
> > > +                               uint32_t nr_syncobjs)
> > > +{
> > > +     uint32_t i;
> > > +
> > > +     for (i = 0; syncobjs && i < nr_syncobjs; ++i) {
> > > +             if (syncobjs[i])
> > > +                     drm_syncobj_replace_fence(syncobjs[i], NULL);
> > > +     }
> > > +}
> > > +
> > > +static int msm_parse_post_deps(struct drm_device *dev,
> > > +                               struct drm_file *file,
> > > +                               uint64_t out_syncobjs_addr,
> > > +                               uint32_t nr_out_syncobjs,
> > > +                            uint32_t syncobj_stride,
> > > +                               struct msm_submit_post_dep **post_deps)
> > > +{
> > > +     int ret = 0;
> > > +     uint32_t i, j;
> > > +
> > > +     *post_deps = kmalloc_array(nr_out_syncobjs, sizeof(**post_deps),
> > > +                                GFP_KERNEL | __GFP_NOWARN | __GFP_NORETRY);
> > > +     if (!*post_deps) {
> > > +             ret = -ENOMEM;
> > > +             goto out_syncobjs;
> >
> > return -ENOMEM works fine.
> >
> > > +     }
> > > +
> > > +     for (i = 0; i < nr_out_syncobjs; ++i) {
> > > +             uint64_t address = out_syncobjs_addr + i * syncobj_stride;
> > > +
> > > +             if (copy_from_user(&syncobj_desc,
> > > +                                u64_to_user_ptr(address),
> > > +                                min(syncobj_stride, sizeof(syncobj_desc)))) {
> > > +                     ret = -EFAULT;
> > > +                     goto out_syncobjs;
> >
> > You can break here.
> >
> > > +             }
> > > +
> > > +             (*post_deps)[i].point = syncobj_desc.point;
> > > +             (*post_deps)[i].chain = NULL;
> > > +
> > > +             if (syncobj_desc.flags) {
> > > +                     ret = -EINVAL;
> > > +                     break;
> > > +             }
> > > +
> > > +             if (syncobj_desc.point) {
> > > +                     if (!drm_core_check_feature(dev,
> > > +                                                 DRIVER_SYNCOBJ_TIMELINE)) {
> > > +                             ret = -EOPNOTSUPP;
> > > +                             break;
> > > +                     }
> > > +
> > > +                     (*post_deps)[i].chain =
> > > +                             kmalloc(sizeof(*(*post_deps)[i].chain),
> > > +                                     GFP_KERNEL);
> > > +                     if (!(*post_deps)[i].chain) {
> > > +                             ret = -ENOMEM;
> > > +                             break;
> > > +                     }
> > > +             }
> > > +
> > > +             (*post_deps)[i].syncobj =
> > > +                     drm_syncobj_find(file, syncobj_desc.handle);
> > > +             if (!(*post_deps)[i].syncobj) {
> > > +                     ret = -EINVAL;
> > > +                     break;
> > > +             }
> > > +     }
> > > +
> > > +     if (ret) {
> > > +             for (j = 0; j <= i; ++j) {
> >
> > Same suggest as above, if you would prefer.
> >
> > > +                     kfree((*post_deps)[j].chain);
> > > +                     if ((*post_deps)[j].syncobj)
> > > +                             drm_syncobj_put((*post_deps)[j].syncobj);
> > > +             }
> > > +
> > > +             kfree(*post_deps);
> > > +             *post_deps = NULL;
> > > +     }
> > > +
> > > +out_syncobjs:
> > > +     return ret;
> >
> > This might also be a good spot to return post_deps / ERR_PTR.
> >
> > > +}
> > > +
> > > +static void msm_process_post_deps(struct msm_submit_post_dep *post_deps,
> > > +                                  uint32_t count, struct dma_fence *fence)
> > > +{
> > > +     uint32_t i;
> > > +
> > > +     for (i = 0; post_deps && i < count; ++i) {
> > > +             if (post_deps[i].chain) {
> > > +                     drm_syncobj_add_point(post_deps[i].syncobj,
> > > +                                           post_deps[i].chain,
> > > +                                           fence, post_deps[i].point);
> > > +                     post_deps[i].chain = NULL;
> > > +             } else {
> > > +                     drm_syncobj_replace_fence(post_deps[i].syncobj,
> > > +                                               fence);
> > > +             }
> > > +     }
> > > +}
> > > +
> > >  int msm_ioctl_gem_submit(struct drm_device *dev, void *data,
> > >               struct drm_file *file)
> > >  {
> > > @@ -406,6 +593,8 @@ int msm_ioctl_gem_submit(struct drm_device *dev, void *data,
> > >       struct sync_file *sync_file = NULL;
> > >       struct msm_gpu_submitqueue *queue;
> > >       struct msm_ringbuffer *ring;
> > > +     struct msm_submit_post_dep *post_deps = NULL;
> > > +     struct drm_syncobj **syncobjs_to_reset = NULL;
> > >       int out_fence_fd = -1;
> > >       struct pid *pid = get_pid(task_pid(current));
> > >       unsigned i;
> > > @@ -413,6 +602,9 @@ int msm_ioctl_gem_submit(struct drm_device *dev, void *data,
> > >       if (!gpu)
> > >               return -ENXIO;
> > >
> > > +     if (args->pad)
> > > +             return -EINVAL;
> > > +
> >
> > >       /* for now, we just have 3d pipe.. eventually this would need to
> > >        * be more clever to dispatch to appropriate gpu module:
> > >        */
> > > @@ -460,9 +652,28 @@ int msm_ioctl_gem_submit(struct drm_device *dev, void *data,
> > >                       return ret;
> > >       }
> > >
> > > +     if (args->flags & MSM_SUBMIT_SYNCOBJ_IN) {
> > > +             ret = msm_wait_deps(dev, file,
> > > +                                 args->in_syncobjs, args->nr_in_syncobjs,
> > > +                                 args->syncobj_stride, ring,
> >
> > If you wanted to, you could just pass args directly to the function so you
> > didn't have to take it apart.
> 
> I think the advantage here is making it really explicit what part of
> args is not used, and I don't feel the number of args has quite gone
> out of control yet, but happy to change if insist.
> 
> (sorry, not seeing if this is a "you could do that" vs. a "I would
> prefer if you do that, politely")

This was a "you could do that". I try to not be too angry about matters of
personal coding preference.

> >
> > Also, Rob - do we want to do the trick where we return
> > sizeof(drm_msm_gem_submit_syncobj) if the input stride is zero?
> 
> Do you mean making this an in/out field and modifying it to return the
> size if a stride of 0 has been given? If so, I don't see the point,
> because userspace would not know what to fill any extra size with
> (sure they can 0 initialize the extra part, but the kernel already
> does that zero initializing the struct to be copied into).
> 
> or do you mean interpreting stride as
> sizeof(drm_msm_gem_submit_syncobj) if the input stride is 0? In that
> case I think that is just an invitation for userspace to set itself up
> for incompatibility issues when the size actually changes. Let's
> enforce doing it right.
> 
> (or did I misunderstand entirely?)

The general idea is to build in a bit of compatibility for user space. Say for
example that we add a new member to drm_mrm_gem_submit_syncobj and add support
for it in the kernel and user space.  And then later the userspace library is
used with an older kernel that (for the purposes of this experiment) supports
the syncobj interface but not the expanded struct. If user space queried the
size of the struct it could use the returned size from the kernel to determine
if the expanded support was there or not. We do something similar to this for
submitqueue queries [1].

I couched it as a question because I'm not sure if that sort of query would
be useful here and I'm not sure if somebody would go to the effort of setting
up a (partial) submit just for the query, but we've been working on making
ourselves more resilient so I figured I would raise the point.

[1] https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/drivers/gpu/drm/msm/msm_submitqueue.c#n122

Jordan

<snip>

-- 
The Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
