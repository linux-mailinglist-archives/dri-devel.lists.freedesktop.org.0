Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 260B213B0D1
	for <lists+dri-devel@lfdr.de>; Tue, 14 Jan 2020 18:27:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 05D3D89722;
	Tue, 14 Jan 2020 17:27:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-vs1-xe41.google.com (mail-vs1-xe41.google.com
 [IPv6:2607:f8b0:4864:20::e41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E721E89722;
 Tue, 14 Jan 2020 17:27:08 +0000 (UTC)
Received: by mail-vs1-xe41.google.com with SMTP id y125so8717842vsb.6;
 Tue, 14 Jan 2020 09:27:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=fXe7VXyk7Bp4OR35uM+nTT22f4rQvVhtqrkA05h8pbU=;
 b=F208V+PT29gGuf2bAXd2JGZNueW+iRBmj9nSDJqtXkXjMSptyiemO+oEibuSlBe9sd
 ACZu88VCpEXLqAbuKC58yX2QT+wfv+wFxvyiMQAldNCKJeQQ1Qp2SX6lvurNcCT/0a/K
 zRuEi6M9YYzbWlCXcuhVw7ro1CUJRhRX/0BZvsoPptCdIe6K9ABZ8Ep2dvcmy2IDKftp
 VOUzYASC8DOa8kN0KoDkg5nSs8RfxYqcQVu36zFiU7wjaxpt0HvwO8oSOsmdMjTGSdxh
 Jb9uaI4YBnCOHs91FY37fEJ9PUKuDnvqVjSW9d5E2rHlGTJ0XInBnkDa5hJplEjXpEma
 rXVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=fXe7VXyk7Bp4OR35uM+nTT22f4rQvVhtqrkA05h8pbU=;
 b=Njghg+ciOUtu5Bt6dmX+5NwjO56GWGdhi8eqbnaQn4pK7YSnTAcoIj8E28UByoi2gN
 HbAgpnher7lAVGA0tBwA6F/XbNxsyANc2QrlkLlAtJMvK2gsCYnMzGqdt9+WN3pU2Vrx
 xQVQ6vU5pW39iaV3rnX+X1KoUJevCQMt401sRQWz0aLopgiKK1fWwL5GgWw9VXX7LwS9
 /K6Sfv9K+1ji/Ttf6WDY1QMd3hp3IXjG/wGAh60kGTen8aVdZ7lmK0HU7QvatJDQhqKq
 SzyphWCJE4oMgdUSOG5MRxVm4T7CHPJ38J3z0QctG22aHJINV+zVUJfETdcKQAZrVoqK
 +9Uw==
X-Gm-Message-State: APjAAAVqwAA/lwAGWG9UHkdm2nqSqn8M9rfN28HNB1VEeaYPIoNvH9I3
 LWgC4I1Ec/5bT8EvXRLDP47zfOEDWvEohJCxpjc=
X-Google-Smtp-Source: APXvYqyFYt+I3Tr3kys2YnC8Nqt4invVC2UA2WJRGEM4znZA3TI0S8m4lrCiEAUbMRBJlDftrhvyv6ZGIGuZBLWf8pE=
X-Received: by 2002:a67:7a03:: with SMTP id v3mr2070205vsc.66.1579022827743;
 Tue, 14 Jan 2020 09:27:07 -0800 (PST)
MIME-Version: 1.0
References: <20200113202557.110095-1-bas@basnieuwenhuizen.nl>
 <20200113234113.GE26711@jcrouse1-lnx.qualcomm.com>
 <CAP+8YyFV4DU-FJEy9oRHnkhPhRaXNb_F+3R9J1RO+bORpqxdcg@mail.gmail.com>
 <20200114155817.GA22648@jcrouse1-lnx.qualcomm.com>
 <CAJs_Fx5eds-f7VzO7oxn810AQ-OngKP0ivVXs9Dnpy=990CJ5g@mail.gmail.com>
In-Reply-To: <CAJs_Fx5eds-f7VzO7oxn810AQ-OngKP0ivVXs9Dnpy=990CJ5g@mail.gmail.com>
From: =?UTF-8?Q?Kristian_H=C3=B8gsberg?= <hoegsberg@gmail.com>
Date: Tue, 14 Jan 2020 09:26:56 -0800
Message-ID: <CAOeoa-f+5_OusueGLLd00oPSoL+gRyv_GxNJs_TPnrrnSzek_A@mail.gmail.com>
Subject: Re: [Freedreno] [PATCH] drm/msm: Add syncobj support.
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
Cc: freedreno <freedreno@lists.freedesktop.org>,
 ML dri-devel <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Jan 14, 2020 at 8:41 AM Rob Clark <robdclark@chromium.org> wrote:
>
> On Tue, Jan 14, 2020 at 7:58 AM Jordan Crouse <jcrouse@codeaurora.org> wrote:
> >
> > On Tue, Jan 14, 2020 at 01:40:11AM +0100, Bas Nieuwenhuizen wrote:
> > > On Tue, Jan 14, 2020 at 12:41 AM Jordan Crouse <jcrouse@codeaurora.org> wrote:
> > > >
> > > > On Mon, Jan 13, 2020 at 09:25:57PM +0100, Bas Nieuwenhuizen wrote:
> > > > > This
> > > > >
> > > > > 1) Enables core DRM syncobj support.
> > > > > 2) Adds options to the submission ioctl to wait/signal syncobjs.
> > > > >
> > > > > Just like the wait fence fd, this does inline waits. Using the
> > > > > scheduler would be nice but I believe it is out of scope for
> > > > > this work.
> > > > >
> > > > > Support for timeline syncobjs is implemented and the interface
> > > > > is ready for it, but I'm not enabling it yet until there is
> > > > > some code for turnip to use it.
> > > > >
> > > > > The reset is mostly in there because in the presence of waiting
> > > > > and signalling the same semaphores, resetting them after
> > > > > signalling can become very annoying.
> > > > >
> > > > > Signed-off-by: Bas Nieuwenhuizen <bas@basnieuwenhuizen.nl>
> > > > > ---
> > > > >
> > > > > Userspace code in
> > > > >
> > > > > https://gitlab.freedesktop.org/mesa/mesa/merge_requests/2769
> > > > >
> > > > >  drivers/gpu/drm/msm/msm_drv.c        |   6 +-
> > > > >  drivers/gpu/drm/msm/msm_gem_submit.c | 241 ++++++++++++++++++++++++++-
> > > > >  include/uapi/drm/msm_drm.h           |  22 ++-
> > > > >  3 files changed, 265 insertions(+), 4 deletions(-)
> > > > >
> > > > > diff --git a/drivers/gpu/drm/msm/msm_drv.c b/drivers/gpu/drm/msm/msm_drv.c
> > > > > index c84f0a8b3f2c..ca36d6b21d8f 100644
> > > > > --- a/drivers/gpu/drm/msm/msm_drv.c
> > > > > +++ b/drivers/gpu/drm/msm/msm_drv.c
> > > > > @@ -37,9 +37,10 @@
> > > > >   * - 1.4.0 - softpin, MSM_RELOC_BO_DUMP, and GEM_INFO support to set/get
> > > > >   *           GEM object's debug name
> > > > >   * - 1.5.0 - Add SUBMITQUERY_QUERY ioctl
> > > > > + * - 1.6.0 - Syncobj support
> > > > >   */
> > > > >  #define MSM_VERSION_MAJOR    1
> > > > > -#define MSM_VERSION_MINOR    5
> > > > > +#define MSM_VERSION_MINOR    6
> > > > >  #define MSM_VERSION_PATCHLEVEL       0
> > > > >
> > > > >  static const struct drm_mode_config_funcs mode_config_funcs = {
> > > > > @@ -988,7 +989,8 @@ static struct drm_driver msm_driver = {
> > > > >       .driver_features    = DRIVER_GEM |
> > > > >                               DRIVER_RENDER |
> > > > >                               DRIVER_ATOMIC |
> > > > > -                             DRIVER_MODESET,
> > > > > +                             DRIVER_MODESET|
> > > >
> > > > A space before the | would be preferred.
> > >
> > > Done.
> > > >
> > > > > +                             DRIVER_SYNCOBJ,
> > > > >       .open               = msm_open,
> > > > >       .postclose           = msm_postclose,
> > > > >       .lastclose          = drm_fb_helper_lastclose,
> > > > > diff --git a/drivers/gpu/drm/msm/msm_gem_submit.c b/drivers/gpu/drm/msm/msm_gem_submit.c
> > > > > index be5327af16fa..9085229f88e0 100644
> > > > > --- a/drivers/gpu/drm/msm/msm_gem_submit.c
> > > > > +++ b/drivers/gpu/drm/msm/msm_gem_submit.c
> > > > > @@ -8,7 +8,9 @@
> > > > >  #include <linux/sync_file.h>
> > > > >  #include <linux/uaccess.h>
> > > > >
> > > > > +#include <drm/drm_drv.h>
> > > > >  #include <drm/drm_file.h>
> > > > > +#include <drm/drm_syncobj.h>
> > > > >
> > > > >  #include "msm_drv.h"
> > > > >  #include "msm_gpu.h"
> > > > > @@ -394,6 +396,196 @@ static void submit_cleanup(struct msm_gem_submit *submit)
> > > > >       ww_acquire_fini(&submit->ticket);
> > > > >  }
> > > > >
> > > > > +
> > > > > +struct msm_submit_post_dep {
> > > > > +     struct drm_syncobj *syncobj;
> > > > > +     uint64_t point;
> > > > > +     struct dma_fence_chain *chain;
> > > > > +};
> > > > > +
> > > > > +static int msm_wait_deps(struct drm_device *dev,
> > > > > +                         struct drm_file *file,
> > > > > +                         uint64_t in_syncobjs_addr,
> > > > > +                         uint32_t nr_in_syncobjs,
> > > > > +                         struct msm_ringbuffer *ring,
> > > > > +                         struct drm_syncobj ***syncobjs)
> > > > > +{
> > > > > +     struct drm_msm_gem_submit_syncobj *syncobj_descs;
> > > > > +     int ret = 0;
> > > > > +     uint32_t i, j;
> > > > > +
> > > > > +     syncobj_descs = kmalloc_array(nr_in_syncobjs, sizeof(*syncobj_descs),
> > > > > +                                   GFP_KERNEL);
> > > > > +     if (!syncobj_descs)
> > > > > +             return -ENOMEM;
> > > > > +
> > > > We would want to watch out here for fuzzers and malicious actors that try to
> > > > force an enormous memory allocation. It seems like we should be able to
> > > > iteratively read each fences in the loop and skip this memory allocation.
> > > >
> > > > > +     *syncobjs = kcalloc(nr_in_syncobjs, sizeof(**syncobjs), GFP_KERNEL);
> > > > > +     if (!syncobjs) {
> > > > > +             ret = -ENOMEM;
> > > > > +             goto out_syncobjs;
> > > > > +     }
> > > >
> > > > Alas no good way to skip this one. But it seems that syncobjs should only
> > > > contain descriptors with MSM_SUBMIT_SYNCOBJ_RESET set. I'm not very familiar
> > > > with how fences work so I'm not sure how common this path is. Would the same
> > > > fuzzer or malicious actor be able to double the destruction by forcing a large
> > > > allocation that doesn't even end up getting used?
> > >
> > > In real usecases I expect MSM_SUBMIT_SYNCOBJ_RESET to be set for 50%+
> > > of the entries and the number of entries to be < 10.
> > >
> > > I can certainly start doing a copy_from_user per entry and save one of
> > > the array. (I was under the impression that copy_from_user was
> > > expensive but if it is not, okay)
> >
> > I guess with recent exploit mitigations it is more expensive, but it shouldn't
> > be too bad if your nominal use cases are somewhere in the area of 10. That
> > said...
> >
> > > Overall though, there is a real issue of wanting to delay all write
> > > actions until we are sure the ioctl will succeed. That will mean we
> > > need to have arrays that are on the order of a UINT32_MAX elements if
> > > we assume full range on the inputs. How much is it worth trying to
> > > squeeze the syncobjs_to_reset, given that a malicious caller could
> > > just set all the reset flags? Especially since a malicious actor would
> > > instead just cause large allocations in the post_deps instead which we
> > > always need to allocate.
> > >
> > > What is the thread model here and what significant improvements can be
> > > made to avoid issues?
> >
> > I'm mostly worried about dealing with fuzzers who will throw you the full u32
> > range and I'm always worried about providing easy ways for non-trusted users to
> > exert memory pressure.
> >
> > > The only thing I could think of is that by doing krealloc we require
> > > the user to commit to using similar amount of memory in userspace.
> > > However, that comes at the significant complexity cost of handling
> > > reallocing and handling the failures of that.
> >
> > If there needs to be a 1:1 relationship between the user and the kernel then
> > I agree krealloc isn't a great idea.
> >
> > > Thoughts?
> >
> > Should we just stick with the classics and restrict the maximum number of fences
> > to a fixed number? 50?  128? You would want the synobjs allocation to fit within
> > a page anyway so 4096 / sizeof(struct drm_syncobj) might be a good start.
> > Assuming we don't run up against any angry tests that try to allocate hundreds
> > of fences this should do and you don't have to worry about the copy_to_user cost
> > you mention above.
> >
>
> I suppose in the end it isn't *too* much different from the existing
> bos/cmds tables on the submit ioctl, is it?  Maybe we should be caring
> about those too, but we don't currently.
>
> Is there a way to allocate memory on the kernel side which abides by
> userspace process limits?  That kinda sounds like what we need here.

Alternatively we can use the fixed-size-bulk copy pattern where we
allocate a page, copy as many fences as will fit, process them,
iterate. We still get a bulk copy from userspace, we have a fixed size
kernel allocation but we don't restrict the number of fences.

> BR,
> -R
> _______________________________________________
> Freedreno mailing list
> Freedreno@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/freedreno
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
