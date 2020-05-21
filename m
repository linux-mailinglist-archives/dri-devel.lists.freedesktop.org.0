Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 34AFD1DC48B
	for <lists+dri-devel@lfdr.de>; Thu, 21 May 2020 03:22:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8B2106E8EB;
	Thu, 21 May 2020 01:22:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-vs1-xe41.google.com (mail-vs1-xe41.google.com
 [IPv6:2607:f8b0:4864:20::e41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 13FCA6E8EB
 for <dri-devel@lists.freedesktop.org>; Thu, 21 May 2020 01:22:33 +0000 (UTC)
Received: by mail-vs1-xe41.google.com with SMTP id e7so3062828vsm.6
 for <dri-devel@lists.freedesktop.org>; Wed, 20 May 2020 18:22:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=RLjkbZhkdv9OtVqYLbNARIBz7F5GAk3mMrTWOesXLrw=;
 b=Fiiq4pEJRtmA6I1UoBGS6BnfGReX+m4+LJ1pdCXKFXoe1PjOExV1FMolfQbKyr1rhP
 nrHSbbfsK2K9/vgOXal/aK4mdZnqev2YvwKE6RrtG+pvFEVEgJyEAle4Ro34uIgZTyY7
 d+1p9o0i+PWxSyHSHtTn8hnTJo51dmw5V8LnmuLleQeuRCpO876jUZyViHlHE6grZu/E
 cJ+CmUKSem+6q1ySp4fmeP8akBn36tZ0l4n+lAZYzjFVpYL/nbARLDJodLIpdCSOArMP
 qmgxy5EAT0askr5lilAGvdMbmySPTCnUbo0zMnaFmwKcEqM8Lj//fZ5GMrqGfSOxCvpf
 8Luw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=RLjkbZhkdv9OtVqYLbNARIBz7F5GAk3mMrTWOesXLrw=;
 b=LkgOIkd7q/5nhng0tyk3bCVi2ND+H9XSluMhTxzQySiUozIjkmhgax/1UAcPFx4yyz
 QjsWwSvl7OnOKF1mxYPJpDtNw5vxzxwrRQwTTW842il6HV1t9+Tog9NvLeE2o2JQaBLC
 lEe/D9i0DKF/B1j2Ox4jKhu7jkBqlSQK/Qz3JnaH7dadpaoa2krMf/etKJhAie/yFam3
 oD1OooYPMK1cuA7pHFpUN4QIi6BZJg7cc3vbAg8qWOPAiLS8LCyIKwX7T0Sb4cbiIZaT
 12M8EUh0R2otrmkj7KBXW5nrQvUYOowGzH1MqGxJO9R8uyD2qRsIlchszhWD5vBbA2SD
 X+Jg==
X-Gm-Message-State: AOAM533IISBntU5TAek+gFa9t6rGwKRUNxiMiO3arK88klCFOMfJtVup
 TsiipRiFMnKbVgxdo3Yj6W3P3XPb5+vQ8IiBbYI=
X-Google-Smtp-Source: ABdhPJyBzSya03mTMj5+S6kHzxXy7FL+QTULDIjhAN/KKnekQCAKmYByyB8h5x4w7jsMCtwb9wBny9+bWhbj8+3I+Qk=
X-Received: by 2002:a67:ff14:: with SMTP id v20mr5540175vsp.118.1590024152028; 
 Wed, 20 May 2020 18:22:32 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1589468282.git.rohan.garg@collabora.com>
 <a0806974b5c0203ed824500dc2e780eb7af02837.1589468282.git.rohan.garg@collabora.com>
 <CACvgo52mso5kEWtjBQKM9RF51P=KnERRoWGai-emo2ofzJWLXA@mail.gmail.com>
 <7761830.T7Z3S40VBb@solembum>
In-Reply-To: <7761830.T7Z3S40VBb@solembum>
From: Emil Velikov <emil.l.velikov@gmail.com>
Date: Thu, 21 May 2020 02:19:34 +0100
Message-ID: <CACvgo51HrtaMG7ZCWXTNog_tJw+0pUTuVy9tEo9FpDiX5g7q0A@mail.gmail.com>
Subject: Re: [PATCH v5 1/2] drm/ioctl: Add a ioctl to set and get a label on
 GEM objects
To: Rohan Garg <rohan.garg@collabora.com>
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
Cc: kernel@collabora.com, ML dri-devel <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, 21 May 2020 at 01:07, Rohan Garg <rohan.garg@collabora.com> wrote:
>
> Hey Emil
> I've applied all the suggestions except the ones I discuss below.
>
> >
> > As a high-level question: how does this compare to VC4_LABEL_BO?
> > Is it possible to implement to replace or partially implement the vc4
> > one with this infra?
> >
> > IMHO this is something to aim for.
> >
>
> Yep, the intention is to replace the VC4 specific labeling with a more generic
> framework that all drivers can use.
>
From a quick look the VC4 labeling combines user-space labels + in-kernel ones.
Seems like msm also has labeling - although in-kernel only.

So this series will help quite a bit, but in-kernel bits will remain.
Pretty sure we can live with that.

> > A handful of ideas and suggestions below:
> >
> > On Thu, 14 May 2020 at 16:05, Rohan Garg <rohan.garg@collabora.com> wrote:
> > > Signed-off-by: Rohan Garg <rohan.garg@collabora.com>
> > > Reported-by: kbuild test robot <lkp@intel.com>
> > > Reported-by: Dan Carpenter <dan.carpenter@oracle.com>
> >
> > New functionality usually has suggested-by tags. Reported-by tags are
> > used when the feature isn't behaving as expected.
> >
>
> This was suggested as part of the previous review process [1].
>
The tag is used for bugfixes, not new features.
See the relevant section in Documentation/process/5.Posting.rst


> > > +
> > > +       kfree(gem_obj->label);
> > > +
> > > +       gem_obj->label = adopted_label;
> >
> > Do we have any protection of ->label wrt concurrent access? Say two
> > writers, attempting to both set the label.
> >
>
> Great catch. I'll protect this from concurrent access.
>
> >
> > > +
> > > +       if (!dev->driver->set_label || args->len > PAGE_SIZE)
> >
> > AFAICT the PAGE_SIZE check should be a EINVAL.
> >
> > Additionally, It would be better, to use the default implementation
> > when the function pointer is not explicitly set.
> > That should allow for more consistent and easier use.
> >
> > Think about the time gap (esp. for some distributions) between the
> > kernel feature landing and being generally accessible to userspace.
> >
>
> This is intentional since vmgfx uses TTM and the DRM helpers would not work.
> Sure, we could simply add a patch to the series that hooks up the relevant
> code to vmgfx and then calls the DRM label helper for all other drivers, but
> I'd rather have driver developers explicitly opt into this functionality.
>
How about we add a simple drm_core_check_feature(dev, DRIVER_GEM)
check + return appropriate errno.
Grep ^^ for examples.

The check will trigger on vmwgfx and some UMS drivers.

> > > +               return -EOPNOTSUPP;
> > > +
> > > +       if (!args->len)
> > > +               label = NULL;
> > > +       else if (args->len && args->label)
> > > +               label = strndup_user(u64_to_user_ptr(args->label),
> > > args->len); +       else
> >
> > Might be worth throwing EINVAL for !len && label... or perhaps not. In
> > either case please document it.
> >
>
> Hm, I'm not entirely sure what documentation I should add here since we
> already document the drm_handle_label struct in the relevant header.
>
Hmm brain fart - the comment should be for the getter. Will elaborate below.

> >
> > > +
> > > +       if (args->label)
> > > +               ret = copy_to_user(u64_to_user_ptr(args->label),
> > > +                                  label,
> > > +                                  args->len);
> > > +
> >
> > Consider the following - userspace allocates less memory than needed
> > for the whole string.
> > Be that size concerns or simply because it's interested only in the
> > first X bytes.
> >
> > If we're interested in supporting that, a simple min(args->len, len)
> > could be used.
> >
>
> I wouldn't be opposed to this if such a need arises in the future.
>
This cannot be changed in the future I'm afraid. The change is pretty
trivial although I haven't seen many ioctls do this.
Perhaps it's not worth it. Here's a quick example, esp for the
DRIVER_GEM thingy.

{
  ...

  if (dev->driver->get_label)
    label = dev->driver->get_label(...);
  else if (drm_core_check_feature(dev, DRIVER_GEM)
    label = generic_gem_impl(...);
  else
    return -EOPNOTSUPP;

  if (!label)
    return -EFAULT;

  args->len = strlen(label) + 1;

  if (args->label)
    return copy_to_user(u64_to_user_ptr(args->label), label, args->len);

  return 0;
}

> > s/int/__u32/ + comment, currently no flags are defined.
> > > +#define DRM_IOCTL_HANDLE_SET_LABEL      DRM_IOWR(0xCF, struct
> > > drm_handle_label)
> > Pretty sure that WR is wrong here, although I don't recall we should
> > be using read or write only.
> > Unfortunately many drivers/ioctls get this wrong :-\
> >
>
> From a quick read of the IO{W,R} documentation, I suppose we should be marking
> SET_LABEL as DRM_IOW and GET_LABEL as DRM_IOR.
>
Are you sure GET_LABEL is unidirectional? The ioctl reads data from
userspace _and_ writes the string length back to userspace.

-Emil
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
